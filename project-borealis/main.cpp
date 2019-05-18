#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "core.h"
#include <QQmlContext>
#include <QQmlComponent>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    Core* mineCore = new Core();
    engine.rootContext()->setContextProperty(QLatin1String("core"), mineCore);

    return app.exec();
}
