
import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0

BorderImage {
    id: headerRoot
    border.bottom: 1
    source: "images/header-bg.png"


    signal searchRequested()

    Row {
        id: buttonRow
        anchors.left: parent.left
        anchors.leftMargin: 7
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 6

        CustomButton {
            iconName: "back"
            enabled: false
        }

        CustomButton {
            iconName: "forward"
            enabled: false
        }
    }

    TextField {
        id: searchField
        anchors.bottom: buttonRow.bottom
        anchors.left: buttonRow.right
        anchors.leftMargin: 8
        placeholderText: "Search Here"
        font.family: "Arial"
        font.pixelSize: 12
        width: 225
        Keys.onReturnPressed: doSearch()
        Keys.onEnterPressed: doSearch()

        function doSearch() {
            if (text.length) {
                headerRoot.searchRequested()
                search.query = text;
                search.search();
            }
        }

        style: TextFieldStyle {

            padding.left: 30
            padding.right: 25

            background: BorderImage {
                border.left: 14
                border.right: 14
                border.top: 14
                border.bottom: 14
                source: searchField.activeFocus ? "images/toolbar-search-bg-focus.png" : "images/toolbar-search-bg.png"
            }
        }

        Image {
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 8
            source: "images/toolbar-search_glass.png"
        }

        CustomButton {
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            iconName: "toolbar-search-clear"
            anchors.rightMargin: 6
            visible: searchField.text.length
            onClicked: searchField.text = ""
        }
    }

    CustomButton {
        id: accountButton
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 4
        anchors.right: parent.right
        anchors.rightMargin: 5
        width: accountName.paintedWidth + 47
        iconName: "account-bg"
        hoverEnabled: true
        borderTop: 7
        borderBottom: 7
        borderLeft: 1
        borderRight: 1
        menu: accountMenu

        Text {
            id: accountName
            anchors.centerIn: parent
            anchors.horizontalCenterOffset: -13
            text: "Your name here"
            opacity: 0.79
            font.pixelSize: 12
            color: accountButton.pressed ? "lightgray" : "black"
            style: Text.Raised
            styleColor: accountButton.pressed ? "black" : "#DDDDDD"
        }

        Image {
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            source: "images/user.png"
        }
    }

    Menu {
        id: accountMenu
        MenuItem {
            text: "Log Out"
            onTriggered: Qt.quit()
        }
    }
}
