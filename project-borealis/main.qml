import QtQuick 2.9
import QtQuick.Controls 2.2

ApplicationWindow {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("Stack")



    StackView {
        id: mainStack
        initialItem: "AuthorizationWindow.qml"
        anchors.fill: parent

        AuthorizationWindow{
            id: autWindow
            anchors.fill: parent
        }
    }
}
