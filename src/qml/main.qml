import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0
import QtQuick.Dialogs 1.0
import FreedomCrypt 1.0


ApplicationWindow {
    id: root
    title: qsTr("FreedomCrypt 1.0")
//    color: "lightblue"
    minimumWidth: 600
    minimumHeight: 400

   menuBar:  MenuBar {
        Menu {
            title: "File"
            MenuItem { text: "Open..."
                       onTriggered: statusrow.text = "Select File" &&  fileDialog.open() }
            MenuItem { text: "Save..."}
            MenuItem { text: "Quit"
                       onTriggered: Qt.quit() }
        }

        Menu {
            title: "Group"
            MenuItem { text: "Login" }
            MenuItem { text: "Create Keys" }
            MenuItem { text: "Logout" }
        }
    }

FreedomCryptModel {
    id: freedom
}

    toolBar: ToolBar {
        id: toolbar
        opacity: 0.4
        width: root.width
        implicitWidth: 600
        height: 27
        RowLayout {
            ToolButton {
                text: freedom.RandomString(4)
                onClicked: text = freedom.RandomString(4)
            }
            ToolButton {
                text: "Decrypt"
            }
            ToolButton {
                text: "Group Login"
            }
            ToolButton {
                text: "Group create"
            }
            ToolButton {
                text: "Group Sign Data"
            }
            ToolButton {
                text: "Help"
            }
        }
        }
// ##############Pages ########################

    FileDialog {
        id: fileDialog
        title: "Please choose a file"
        nameFilters: [ "All files (*.*)", "All files (*)" ]

        onAccepted: {
            console.log("You chose: " + fileDialog.fileUrls)
           // Qt.quit()
        }
        onRejected: {
            console.log("Canceled")
            //Qt.quit()
        }
      //  Component.onCompleted: visible = true
    }

    Item {
        id: appRoot
       // Component.onCompleted: loader.source = LifeStuff.isLoggedIn ? "main_page.qml" : "Login.qml"
        //Component.onCompleted: loader.source = "qrc:/qml/login.qml"
        // content
        Loader {
            id: loader
            focus: true
        }
    }

//#########################################


    statusBar: StatusBar {
        id: statusbar
        height: 12
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.top: parent.top
            Label {
                id: statusrow
                anchors.centerIn: parent
                text: "Secure your Data"
                fontSizeMode: Text.Fit
            }
    }
}
