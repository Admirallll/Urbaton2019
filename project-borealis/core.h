#ifndef CORE_H
#define CORE_H

#include <QObject>
#include "httpwrapper.h"
#include <QJsonDocument>
#include <QJsonArray>
#include <QJsonObject>
#include <QJsonParseError>

struct RecyclePoint{
    QString id;
    QString address;
    QString name;
};

class Core : public QObject
{
    Q_OBJECT

private:
    QList<RecyclePoint> recyclePoints;
    HttpWrapper* wrapper =  nullptr;

    int mId;
public:
    explicit Core(QObject *parent = nullptr);

public:
    void parseFromJSON(QString json);
    void emitNeededSignal(QString responce);

signals:
    void makeRequest();

    void sgEnterToMain();
    void sgSetPointList();
    void sgSetStaticList();

public slots:
    void replyReceived(QString reply );
    Q_INVOKABLE void on_network_BtnClicked( QString requestType, QString data );
};

#endif // CORE_H
