
import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0

Button {
    id: button
    property string iconName: ""
    property bool hoverEnabled: false
    property int borderTop: 0
    property int borderBottom: 0
    property int borderLeft: 0
    property int borderRight: 0

    style: ButtonStyle {
        background: Item {
            implicitWidth: img.implicitWidth
            implicitHeight: img.implicitHeight
            BorderImage {
                id: img
                anchors.centerIn: parent
                source : iconName.length ? ("images/" + iconName + (hoverEnabled && control.hovered && !control.pressed ? "-hover" : "")
                                            + (button.pressed ? "-pressed" : "")
                                            + (button.enabled ? "" : "-disabled")
                                            + ".png")
                                         : ""
                border.top: button.borderTop
                border.bottom: button.borderBottom
                border.left: button.borderLeft
                border.right: button.borderRight
            }
        }
    }
}
