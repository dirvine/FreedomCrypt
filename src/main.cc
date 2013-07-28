#include <QtWidgets/QApplication>
#include <QtQml>
#include <QtQuick/QQuickView>

#include "common_qml_plugin.h"

int main(int argc, char *argv[])
{

    QApplication::setOrganizationName("MaidSafe");
    QApplication::setOrganizationDomain("maidsafe.net");
    QApplication::setApplicationName("FreedomCrypt");
    QApplication::setApplicationVersion("0.1.0");
    QApplication::setStyle("fusion");

    QApplication app(argc, argv);
    QQuickView view;
    view.setMinimumSize(QSize(640, 480));
    view.setTitle("FreedomCrypt");

 //   registerQmlTypes();
    view.setResizeMode(QQuickView::SizeRootObjectToView);
//    view.rootContext()->setContextProperty(QLatin1String("spotify"), QSpotifySession::instance());
//    view.engine()->addImageProvider(QLatin1String("spotify"), new QSpotifyImageProvider);
    view.setSource(QUrl("qrc:/qml/main.qml"));
    view.setIcon(QPixmap("qrc:/qml/images/icon.png"));
    view.show();


    return app.exec();
}
