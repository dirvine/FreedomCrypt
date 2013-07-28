
import QtQuick 2.0
//import QtCommon 1.0

Item {
    id: appRoot
    width: 1024
    height: 720

    Component.onCompleted: loader.source = "MainUI.qml"

//    Connections {
//        target: spotify
//        onPendingConnectionRequestChanged: {
//            if (!spotify.pendingConnectionRequest && spotify.isLoggedIn) {
//                loader.source = "MainUI.qml"
//            } else if (spotify.pendingConnectionRequest && spotify.isLoggedIn) {
//                loader.source = "Login.qml"
//            }
//        }
//    }

    // content
    Loader {
        id: loader
        anchors.centerIn: parent
        focus: true
    }
}
