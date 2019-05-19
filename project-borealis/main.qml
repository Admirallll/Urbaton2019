import QtQuick 2.9
import QtQuick.Controls 2.2
import "qrc:/panels"

ApplicationWindow {

    id: window
    visible: true
    width: propWidth
    height: propHeight
    title: qsTr("Stack")
    property int propWidth: 480
    property int propHeight: 640

    Connections{
        target: core
        onSgEnterToMain: { mainStack.push( "panels/Swiper.qml" ) }
    }

    StackView {
        id: mainStack
        //initialItem: "AuthorizationWindow.qml"
        anchors.fill: parent

        /*AuthorizationWindow{
            id: autWindow
            anchors.fill: parent
        }*/
        Comix{
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
}
