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


    Core* mineCore = new Core(&engine);
    engine.rootContext()->setContextProperty("core", mineCore);
    QStringListModel list_model;
    QStringList list;
    list << "lol" << "kek" << "cheb";
    list_model.setStringList(list);



    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
