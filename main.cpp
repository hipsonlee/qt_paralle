#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "controller.h"
#include<QDebug>
#include<QThread>
#include "tcpmodel.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    qmlRegisterType<TcpMoveToThread>("TcpMoveToThread",1,0,"TcpMoveToThread");  //注册QML类

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

//    qDebug()<<"I am main Thread, my ID:"<<QThread::currentThreadId()<<"\n";
//    QCoreApplication a(argc, argv);
//    Controller c;
    return app.exec();
}
