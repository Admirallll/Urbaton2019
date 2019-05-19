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

    Q_PROPERTY(int mId READ id  WRITE setMId  NOTIFY mIdChanged)
    int id();
    void setMId(const int &id);
signals:
    void mIdChanged();

private:
    QList<RecyclePoint> recyclePoints;
    HttpWrapper* wrapper =  nullptr;

    int m_id = 1;
    bool is_input = false;
public:
    explicit Core(QObject *parent = nullptr);

public:
    void parseFromJSON(QString json);
    void emitNeededSignal(QString responce, QString reply);

signals:
    void makeRequest();

    void sgEnterToMain();
    void sgEnterComix();
    void sgSetPointList();
    void sgSetStaticList();
    void sgCodeGenerated();
    void sgCodeSended();

public slots:
    void replyReceived(QString reply );
    Q_INVOKABLE void on_network_BtnClicked( QString requestType, QString data );
};

#endif // CORE_H
