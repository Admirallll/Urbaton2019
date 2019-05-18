#ifndef HTTPWRAPPER_H
#define HTTPWRAPPER_H

#include <QObject>
#include <QNetworkReply>
#include <QNetworkRequest>
#include <QNetworkAccessManager>

class HttpWrapper : public QObject
{
    Q_OBJECT

private:
    const QString ENDPOINT_ADDRESS = "http://10.34.32.94";
    const int ENDPOINT_PORT = 51589;

    QNetworkAccessManager *httpRequester = nullptr ;
    QString lastRequest;
public:
    explicit HttpWrapper(QObject *parent = nullptr);

    void requestOnServer(QString uri, QString data = "" );
    QString getLastRequest() const;

signals:
    void SgReplyFinished( QString reply );

public slots:
    void replyFinished( QNetworkReply *reply );
};

#endif // HTTPWRAPPER_H
