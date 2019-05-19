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


Core::Core(QObject *parent) : QObject(parent)
{
    wrapper = new HttpWrapper();
    connect( wrapper, &HttpWrapper::SgReplyFinished, this, &Core::replyReceived );
}

void Core::parseFromJSON( QString json )
{
    QStringList list = json.split(",");
    qDebug() << "parsing..";
    for( int i = 0; i<list.length(); i++)
    {
        qDebug() << list.at(i);
    }
}

void Core::emitNeededSignal(QString responce, QString reply)
{
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
        emit sgEnterToMain();
    }
    else if( responce == "/api/register/" )
    {
        emit sgEnterComix();
    }
    else if( responce == "/api/stats/" )
    {
        emit sgSetStaticList();
    }
    else if( responce == "/api/codes/generate/" )
    {
        emit sgCodeGenerated();
    }
    else if( responce == "/api/codes/send_code/" )
    {
        emit sgCodeSended();
    }
}

void Core::replyReceived(QString reply)
{
    QString last_req = wrapper->getLastRequest();
    if( !last_req.isEmpty() )
    {
        emitNeededSignal(last_req, reply);
    }
    //    parseFromJSON( reply );

    // TODO: process reply from json to ... needed format

}

void Core::on_network_BtnClicked(QString requestType, QString data)
{
    wrapper->requestOnServer( requestType, data );
}
