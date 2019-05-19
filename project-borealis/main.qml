import QtQuick 2.9
import QtQuick.Controls 2.2
import "qrc:/panels"

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
        //initialItem: "AuthorizationWindow.qml"
        anchors.fill: parent

        /*AuthorizationWindow{
            id: autWindow
            anchors.fill: parent
        }*/
        RegisterWindow{
            anchors.fill:parent
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

    /*SwipeView{
        anchors.fill: parent
    }*/

}
