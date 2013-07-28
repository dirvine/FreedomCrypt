
import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0

TableViewStyle {
    minimumHandleLength: 20
    handleOverlap: 4
    scrollToClickedPosition: true

    padding.top: 0
    padding.bottom: 0
    padding.left: 0
    padding.right: 0

    backgroundColor: "transparent"

    corner: BorderImage {
        source: "images/scrollbar-corner.png"
        border.left: 1
        border.top: 1
        anchors.bottom: parent.bottom
        anchors.right: parent.right
    }

    scrollBarBackground: BorderImage {
        source: styleData.horizontal ? "images/scrollbar-horizontal-bg.png" : "images/scrollbar-vertical-bg.png"
        border.left: 1
    }

    incrementControl: Image {
        source: "images/scrollbar" + (styleData.horizontal ? "-horizontal" : "-vertical") + "-down" + (styleData.pressed ? "-pressed" : "") + ".png"
    }

    decrementControl: Image {
        source: "images/scrollbar" + (styleData.horizontal ? "-horizontal" : "-vertical") + "-up" + (styleData.pressed ? "-pressed" : "") + ".png"
    }

    handle: BorderImage {
        source: styleData.horizontal ? "images/scrollbar-horizontal-handle.png" : "images/scrollbar-vertical-handle.png"
        border.left: 7; border.top: 7
        border.right: 7; border.bottom: 7
    }
}
