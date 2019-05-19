#ifndef CORE_H
#define CORE_H

#include <QObject>
#include "httpwrapper.h"
#include <QJsonDocument>
#include <QJsonArray>
#include <QJsonObject>
#include <QJsonParseError>
#include "dataobject.h"

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQmlComponent>

struct RecyclePoint{
    QString id;
    QString address;
    QString name;
};

struct Statistics{
    int paper = 0;
    int plastic = 0;
    int glass = 0;
    int cloth = 0;
    int battary = 0;
    int metal = 0;
    int degrees = 0;
    int tires = 0;
    int accums = 0;
    int another = 0;
};

struct AccountData{
    QString name;
    QString num;
    QString email;
};


class Core : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int mId READ id  WRITE setMId  NOTIFY mIdChanged)
    Q_PROPERTY(Statistics stats READ getStats WRITE setStats NOTIFY statsChanged)
    Q_PROPERTY(bool is_input READ getIs_input WRITE setIs_input NOTIFY is_inputChanged)
    int id();
    void setMId(const int &id);
signals:
    void mIdChanged();
    void statsChanged();
    void is_inputChanged();
private:
    Statistics stats;
    QList<RecyclePoint> recyclePoints;
    HttpWrapper* wrapper =  nullptr;

    QList<QObject*> dataList;
    QList<QObject*> listData;


    int m_id = 1;
    bool is_input = false;
public:
    explicit Core(QQmlApplicationEngine *appCore, QObject *parent = nullptr);

public:
    void emitNeededSignal(QString responce, QString reply);

    Statistics getStats() const;
    void setStats(const Statistics &value);

    bool getIs_input() const;
    void setIs_input(bool value);

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
