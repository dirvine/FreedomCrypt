
import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0

SplitView {

    function showSearchResults(search) {
        //mainView.setSource("SearchResults.qml", { "search": search })
    }

    handleDelegate: Rectangle {
        width: 1
        color: "#292929"
    }

    Rectangle {
        border.color: "red"
        Layout.maximumWidth: 300
        Layout.minimumWidth: 120
        width: 220

    }

    Loader {
        id: mainView
        Layout.fillWidth: true
    }
}
