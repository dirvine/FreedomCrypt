
import QtQuick 2.0

Item {
    width: appRoot.width
    height: appRoot.height

    Header {
        id: header
        anchors.top: parent.top
        width: parent.width

        onSearchRequested: center.showSearchResults(header.search)
    }

    Center {
        id: center
        width: parent.width
        anchors.top: header.bottom
        anchors.bottom: footer.top
    }

    Footer {
        id: footer
        anchors.bottom: parent.bottom
        width: parent.width
    }
}
