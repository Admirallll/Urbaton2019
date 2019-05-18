#include "httpwrapper.h"
#include <QDebug>
#include <QHttpMultiPart>
#include <QHttpPart>
#include <QUrl>

QString HttpWrapper::getLastRequest() const
{
    return lastRequest;
}

HttpWrapper::HttpWrapper(QObject *parent) : QObject(parent)
{
    httpRequester = new QNetworkAccessManager();
    connect(httpRequester, &QNetworkAccessManager::finished, this, &HttpWrapper::replyFinished);
}

void HttpWrapper::requestOnServer( QString uri, QString data )
{
    QUrl url( ENDPOINT_ADDRESS + ":" + QString::number( ENDPOINT_PORT ) + uri );
    if(data.isEmpty())
    {
        qDebug() << "on url " + url.toString() + " sended request";
        httpRequester->get( QNetworkRequest( url ) );
    }
    else
    {
        qDebug() << "on url " + url.toString() + " sended request: " + data;
        QNetworkRequest req(url);
        req.setHeader( QNetworkRequest::ContentTypeHeader, QVariant("application/json") );

        httpRequester->post( req, data.toLocal8Bit() );
    }
    lastRequest = uri;
}

void HttpWrapper::replyFinished( QNetworkReply *reply)
{
    QString read = QString::fromLocal8Bit( reply->readAll() );
    emit SgReplyFinished( read );

    QString reason = reply->attribute( QNetworkRequest::HttpStatusCodeAttribute ).toString();
    qDebug() << reason;
    qDebug() << "reply gotten:"+ read;
}
