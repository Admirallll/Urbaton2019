#include "core.h"

int Core::id()
{
    return m_id;
}

void Core::setMId(const int &id)
{
    qDebug() << "checked" << id;
    if (id == m_id)
        return;

    m_id = id;
    emit mIdChanged();
}

bool Core::getIs_input() const
{
    return is_input;
}

void Core::setIs_input(bool value)
{
    is_input = value;
    emit is_inputChanged();
}

Statistics Core::getStats() const
{
    return stats;
}

void Core::setStats(const Statistics &value)
{
    stats = value;
    emit statsChanged();
}


Core::Core(QQmlApplicationEngine *appCore, QObject *parent) : QObject(parent)
{
    wrapper = new HttpWrapper();
    connect( wrapper, &HttpWrapper::SgReplyFinished, this, &Core::replyReceived );

    dataList.append(new DataObject("Бумага", "Бумага"));
    dataList.append(new DataObject("Стекло", "Стекло"));
    dataList.append(new DataObject("Пластик", "Пластик"));
    dataList.append(new DataObject("Одежда", "Одежда"));
    dataList.append(new DataObject("Батарейка", "Батарейка"));

    appCore->rootContext()->setContextProperty("modelMy", QVariant::fromValue( listData ) );
    appCore->rootContext()->setContextProperty("myModel", QVariant::fromValue( dataList ) );
}

void Core::emitNeededSignal(QString responce, QString reply)
{
    qDebug() << "request| responce: " + responce + ";" + reply;
    if( responce == "/api/recycle-point/" )
    {
        emit sgSetPointList();
        reply = "{ \"agentsArray\": " + reply + "}";
        QJsonDocument document = QJsonDocument::fromJson(reply.toLocal8Bit());
        QJsonObject object = document.object();
        QJsonValue value = object.value("agentsArray");
        QJsonArray array = value.toArray();
        foreach (const QJsonValue & v, array)
            qDebug() << v.toObject().toVariantMap();

    }
    else if( responce == "/api/login/" )
    {
        int potId = reply.toInt();
        if( potId )
            m_id = potId;
        emit sgEnterToMain();
        qDebug() << "m_id now: " + QString::number( m_id );
    }
    else if( responce == "/api/register/" )
    {
        int potId = reply.toInt();
        if( potId )
            m_id = potId;
        emit sgEnterComix();
        qDebug() << "m_id now: " + QString::number( m_id );

    }
    else if( responce == "/api/user/" + QString::number( m_id) + " /stat" )
    {
        emit sgSetStaticList();

        QJsonDocument document = QJsonDocument::fromJson(reply.toLocal8Bit());
        QJsonObject object = document.object();
        QJsonValue materials = object.value("materialsCount");

        qDebug() << materials["Paper"].toInt(0);
        qDebug() << materials["Glass"].toInt(0);
        qDebug() << materials["Plastic"].toInt(0);
        qDebug() << materials["Clothes"].toInt(0);
        qDebug() << materials["Battery"].toInt(0);

        listData.append(new DataObject( QString::number( materials["Paper"].toInt(0)),  QString::number(materials["Paper"].toInt(0)) ));
        listData.append(new DataObject( QString::number(  materials["Glass"].toInt(0)),  QString::number(  materials["Glass"].toInt(0)) ));
        listData.append(new DataObject( QString::number( materials["Plastic"].toInt(0)),  QString::number( materials["Plastic"].toInt(0)) ));
        listData.append(new DataObject( QString::number(materials["Clothes"].toInt(0)),  QString::number( materials["Clothes"].toInt(0)) ));
        listData.append(new DataObject( QString::number( materials["Battery"].toInt(0)),  QString::number( materials["Battery"].toInt(0)) ));

    }
    else if( responce == "/api/user/" + QString::number(m_id) )
    {
        QJsonDocument document = QJsonDocument::fromJson(reply.toLocal8Bit());
        QJsonObject object = document.object();
        QJsonValue materials = object.value("isKeeper");
        if( materials.toBool() )
        {
            is_input = true;
            qDebug() << is_input;
        }
        qDebug() << materials.toString();
    }
    else if( responce == "/api/codes/generate/" )
    {
        emit sgCodeGenerated();

        QJsonDocument document = QJsonDocument::fromJson(reply.toLocal8Bit());
        QJsonObject object = document.object();

        foreach (auto v, object)
            qDebug() << v.toVariant();
    }
    else if( responce == "/api/codes/send_code/" )
    {
        emit sgCodeSended();

        QJsonDocument document = QJsonDocument::fromJson(reply.toLocal8Bit());
        QJsonObject object = document.object();

        foreach (auto v, object)
            qDebug() << v.toVariant();
    }
}

void Core::replyReceived(QString reply)
{
    QString last_req = wrapper->getLastRequest();
    if( !last_req.isEmpty() )
    {
        emitNeededSignal(last_req, reply);
    }
}

void Core::on_network_BtnClicked(QString requestType, QString data)
{
    wrapper->requestOnServer( requestType, data );
}
