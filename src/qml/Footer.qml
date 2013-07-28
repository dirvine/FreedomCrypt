
import QtQuick 2.0
import QtQuick.Controls 1.0

BorderImage {
    source: "images/footer-bg.png"
    border.top: 2
    border.bottom: 2
    border.left: 0
    border.right: 0

    // Playback controls
    Row {
        id: playbackControls
        height: parent.height
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: 2
        anchors.left: parent.left
        anchors.leftMargin: 13
        spacing: 3



        CustomButton {
            anchors.verticalCenter: parent.verticalCenter
            iconName: "prev"
           // onClicked: spotify.playPrevious()
        }
        CustomButton {
            anchors.verticalCenter: parent.verticalCenter
            iconName: "pause"

        }
        CustomButton {
            anchors.verticalCenter: parent.verticalCenter
            iconName: "next"
           // onClicked: spotify.playNext()
        }
    }

    // Volume control
    Slider {
        id: volumeSlider
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: playbackControls.right
        anchors.leftMargin: 19
        width: 85
        height: parent.height
        minimumValue: 0
        maximumValue: 100
//        value: spotify.volume

//        onValueChanged: spotify.setVolume(value)

        style: CustomSliderStyle { }
    }
    Image {
        id: volumeIcon1
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: volumeSlider.right
        anchors.leftMargin: 3
        anchors.verticalCenterOffset: -1
        source: "images/volume-1.png"
        opacity: mix(0.3, 1.0, smoothstep(0.0, 0.5, 2))
    }
    Image {
        id: volumeIcon2
        anchors.verticalCenter: volumeIcon1.verticalCenter
        anchors.left: volumeIcon1.right
        anchors.leftMargin: -1
        source: "images/volume-2.png"
        opacity: mix(0.3, 1.0, smoothstep(0.5, 1.0, 2))
    }
    function smoothstep(x, y, a) {
        var p;
        if (a < x) return 0;
        if (a >= y) return 1;
        if (x === y) return -1;
        p = (a - x) / (y - x);
        return (p * p * (3 - 2 * p));
    }
    function mix(x, y, a) {
        return x * (1.0 - a) + y * a;
    }

}
