#include "core.h"

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

void Core::emitNeededSignal(QString responce)
{
    if( responce == "/api/recycle-point/" )
        emit sgSetPointList();
    else
        if( responce == "/api/login/" || responce == "/api/register/" )
            emit sgEnterToMain();
        else
            if( responce == "/api/stats/" )
                emit sgSetStaticList();

}

void Core::replyReceived(QString reply)
{
    QString last_req = wrapper->getLastRequest();
    if( !last_req.isEmpty() )
    {
        reply = "{ \"agentsArray\": " + reply + "}";
        QJsonDocument document = QJsonDocument::fromJson(reply.toLocal8Bit());
        QJsonObject object = document.object();
        QJsonValue value = object.value("agentsArray");
        QJsonArray array = value.toArray();
        foreach (const QJsonValue & v, array)
            qDebug() << v.toObject().toVariantMap();

        emitNeededSignal(last_req);
    }
//    parseFromJSON( reply );

    // TODO: process reply from json to ... needed format

}

void Core::on_network_BtnClicked(QString requestType, QString data)
{
    wrapper->requestOnServer( requestType, data );
}
