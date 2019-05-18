import QtQuick 2.0
import "controls"
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4
import QtQuick.Window 2.2


Item {
    Rectangle{
        id: rect
        anchors.fill: parent
        ColumnLayout
        {
            anchors.fill: parent
            spacing: 6
            Text{
                Layout.alignment: Qt.AlignCenter
                id: titleText
                text: "Authorization"
                fontSizeMode: Text.HorizontalFit
                Layout.preferredWidth: 40
                Layout.preferredHeight: 70
            }

            InputPair{
                id: loginPair
                Layout.alignment: Qt.AlignCenter
                Layout.preferredWidth: 100
                Layout.preferredHeight: 40

                labelText: "Enter login"
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

            Button{
                id: btn
                Layout.alignment: Qt.AlignCenter

                Layout.preferredWidth: 100
                Layout.preferredHeight: 40

                text: "Enter in shit!!!"

                onClicked: { core.on_network_BtnClicked( "/api/login/", "{ \"login\": \"" + loginPair.formData + "\", \"password\": \"" + passwordPair.formData + "\"}") }
            }
            MouseArea
            {
                id: text_area
                Text{
                    anchors.fill: parent

                    text: "not registered yet?"
                    id: registerText
                }
                Layout.alignment: Qt.AlignCenter


                Layout.preferredWidth: 100
                Layout.preferredHeight: 40

                onEntered: { registerText.color = "blue" }
                onExited: {registerText.color = "black"}

                onClicked:{ mainStack.push("RegisterWindow.qml") }

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
