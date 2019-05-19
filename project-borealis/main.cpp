#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "core.h"
#include <QQmlContext>
#include <QQmlComponent>
#include <QStringListModel>
#include "dataobject.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;


    Core* mineCore = new Core();
    engine.rootContext()->setContextProperty("core", mineCore);
    QStringListModel list_model;
    QStringList list;
    list << "lol" << "kek" << "cheb";
    list_model.setStringList(list);

    QList<QObject*> dataList;
    dataList.append(new DataObject("Item 1", "red"));
    dataList.append(new DataObject("Item 2", "green"));
    dataList.append(new DataObject("Item 3", "blue"));
    dataList.append(new DataObject("Item 4", "yellow"));

    QList<QObject*> listData;
    listData.append(new DataObject("Item 1", "red"));
    listData.append(new DataObject("Item 2", "green"));
    listData.append(new DataObject("Item 3", "blue"));
    listData.append(new DataObject("Item 4", "yellow"));

    engine.rootContext()->setContextProperty("myModel", QVariant::fromValue( listData ) );
    engine.rootContext()->setContextProperty("modelMy", QVariant::fromValue( dataList ) );

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
