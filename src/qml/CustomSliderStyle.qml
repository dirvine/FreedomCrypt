
import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0

SliderStyle {
    groove: Item {
        BorderImage {
            width: parent.width
            anchors.verticalCenter: parent.verticalCenter

            source: "images/slider-bg.png"
            border.left: 4
            border.right: 4
            border.top:  2
            border.bottom: 2
        }

        BorderImage {
            anchors.verticalCenter: parent.verticalCenter
            width: control.value / control.maximumValue * (parent.width - 9) + 9
            source: "images/slider-fg.png"
            border.left: 4
            border.right: 4
            border.top:  2
            border.bottom: 2
            visible: control.enabled
        }
    }

    handle: Image {
        source: "images/slider-knob" + (control.pressed ? "-pressed" : "") + ".png"
        visible: control.enabled
    }
}
