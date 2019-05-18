import QtQuick 2.0
import "controls"
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4

Item {
    Rectangle
    {
        id: mainRect
        anchors.fill: parent
        color: "white"

        ColumnLayout
        {
            anchors.fill: parent
            spacing: 6
            Text{
                Layout.alignment: Qt.AlignCenter
                id: titleText
                text: "Registration"
                fontSizeMode: Text.HorizontalFit
                Layout.preferredWidth: 40
                Layout.preferredHeight: 70
            }

            InputPair{
                id: loginPair
                Layout.alignment: Qt.AlignCenter
                Layout.preferredWidth: 100
                Layout.preferredHeight: 40

                labelText: "Enter Login"
                innerText: "login"
            }

            InputPair{
                id: passwordPair
                Layout.alignment: Qt.AlignCenter
                Layout.preferredWidth: 100
                Layout.preferredHeight: 40

                labelText: "Enter password"
                innerText: "password"
            }

            InputPair{
                id: passwordPairRepeat
                Layout.alignment: Qt.AlignCenter
                Layout.preferredWidth: 100
                Layout.preferredHeight: 40

                labelText: "Enter password"
                innerText: "password"
            }

            Button{
                id: btn
                Layout.alignment: Qt.AlignCenter

                Layout.preferredWidth: 100
                Layout.preferredHeight: 40

                text: "Register"
                onClicked: {
//                    if( passwordPairRepeat.formData === passwordPair )
                    core.on_network_BtnClicked( "/api/register/", "{ \"login\": \"" + loginPair.formData + "\", \"password\": \"" + passwordPair.formData + "\"}") }
            }
            MouseArea
            {
                id: text_area
                Text{
                    anchors.fill: parent

                    text: "registered yet?"
                    id: registerText
                }
                Layout.alignment: Qt.AlignCenter

                Layout.preferredWidth: 100
                Layout.preferredHeight: 40

                onEntered: { registerText.color = "blue" }
                onExited: {registerText.color = "black"}
                onClicked: { mainStack.pop() }
            }

            Item {
                // spacer item
                Layout.fillWidth: true
                Layout.fillHeight: true
                Rectangle { anchors.fill: parent }
            }
        }
    }
}
