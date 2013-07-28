
import QtQuick 2.0
import QtQuick.Controls 1.0
import QtSpotify 1.0

Rectangle {
    width: appRoot.width
    height: appRoot.height
    color: "#373737"

    BorderImage {
        anchors.fill: bg
        anchors.margins: -4
        border.bottom: 7
        border.top: 7
        border.left: 7
        border.right: 7
        source: "images/gridview-shadow-flex.png"
    }

    BorderImage {
        id: bg
        anchors.fill: content
        anchors.margins: -25
        border.top: 5
        border.bottom: 5
        border.left: 5
        border.right: 5
        source: "images/login-bg.png"
    }

    Column {
        id: content
        anchors.centerIn: parent
        width: 250
        spacing: 25

        Image {
            anchors.horizontalCenter: parent.horizontalCenter
            source: "images/appIcon.png"
        }

        Column {
            id: column
            spacing: 15
            width: parent.width
            visible: !spotify.pendingConnectionRequest && spotify.connectionStatus == SpotifySession.LoggedOut

            Connections {
                target: spotify
                onConnectionErrorChanged: {
                    if (spotify.connectionError != SpotifySession.Ok) {
                        errorText.text = spotify.connectionErrorMessage;
                    } else {
                        errorText.text = ""
                    }
                }
            }

            function login()
            {
                errorText.text = "";

                if (usernameField.text.length === 0 || passwordField.text.length === 0)
                    return;

                spotify.login(usernameField.text, passwordField.text, rememberMe.checked);
                passwordField.text = "";
            }

            TextField {
                id: usernameField
                width: parent.width
                placeholderText: "Username"
                focus: true

                Keys.onTabPressed: passwordField.forceActiveFocus()
                Keys.onReturnPressed: {
                    if (passwordField.text.length === 0)
                        passwordField.forceActiveFocus();
                    else
                        column.login();
                }
            }

            TextField {
                id: passwordField
                width: parent.width
                placeholderText: "Password"
                echoMode: TextInput.Password
                Keys.onTabPressed: usernameField.forceActiveFocus()
                Keys.onReturnPressed: {
                    if (usernameField.text.length === 0)
                        usernameField.forceActiveFocus();
                    else
                        column.login();
                }
            }

            Text {
                id: errorText
                width: parent.width
                wrapMode: Text.WordWrap
                color: "#e23a3a"
            }

            Item {
                height: loginButton.height
                width: parent.width

                CheckBox {
                    id: rememberMe
                    anchors.verticalCenter: parent.verticalCenter
                    text: "Remember me"
                    checked: true
                }

                CustomButton {
                    anchors.right: parent.right
                    width: 80
                    borderTop: 3
                    borderBottom: 3
                    borderLeft: 3
                    borderRight: 3
                    id: loginButton
                    iconName: "login-button"
                    text: "Log In"
                    enabled: usernameField.text.length > 0 && passwordField.text.length > 0
                    onClicked: column.login();
                }
            }
        }

        Item {
            height: column.height
            width: parent.width
            visible: !column.visible
            anchors.horizontalCenter: parent.horizontalCenter

            Text {
                id: waitingText
                anchors.centerIn: parent
                anchors.verticalCenterOffset: -40
                text: "Logging In..."
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 15

                Connections {
                    target: spotify
                    onLoggingIn: waitingText.text = "Logging In..."
                    onLoggingOut: waitingText.text = "Logging Out..."
                }
            }

            BusyIndicator {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: waitingText.bottom
                anchors.topMargin: 25
                running: !column.visible
                visible: running
                invertedStyle: true
            }
        }

    }
}
