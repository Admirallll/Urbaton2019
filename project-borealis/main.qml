import QtQuick 2.9
import QtQuick.Controls 2.2
import "panels"

ApplicationWindow {
    id: window
    visible: true
    width: propWidth
    height: propHeight
    title: qsTr("Stack")
    property int propWidth: 563
    property int propHeight: 1000

    StackView {
        id: mainStack
        initialItem: "AuthorizationWindow.qml"
        anchors.fill: parent

        AuthorizationWindow{
            id: autWindow
            anchors.fill: parent
        }
    }
    FontLoader
    {
        id: robotoLight
        source: "qrc:/fonts/Roboto-Light.ttf"
    }
    FontLoader
    {
        id: robotoRegular
        source: "qrc:/fonts/Roboto-Regular.ttf"
    }
    FontLoader
    {
        id: engravers
        source: "qrc:/fonts/Engravers Gothic BT.ttf"
    }

    /*header: ToolBar {
        contentHeight: toolButton.implicitHeight*/

    StackView {
        id: stackView
        initialItem: "HomeForm.ui.qml"
        anchors.fill: parent
    }
    /*SwipeView{
        anchors.fill: parent
    }*/

    /*Settings{
        anchors.fill: parent
    }*/

    Stats{
        anchors.fill: parent
    }
>>>>>>> 48a61de930e8e09f92ecee6ff924daa7e030cb85
}
