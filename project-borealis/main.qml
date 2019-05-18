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
        contentHeight: toolButton.implicitHeight

        ToolButton {
            id: toolButton
            text: stackView.depth > 1 ? "\u25C0" : "\u2630"
            font.pixelSize: Qt.application.font.pixelSize * 1.6
            onClicked: {
                if (stackView.depth > 1) {
                    stackView.pop()
                } else {
                    drawer.open()
                }
            }
        }

        Label {
            text: stackView.currentItem.title
            anchors.centerIn: parent
        }
    }

    Drawer {
        id: drawer
        width: window.width * 0.66
        height: window.height

        Column {
            anchors.fill: parent

            ItemDelegate {
                text: qsTr("Page 1")
                width: parent.width
                onClicked: {
                    stackView.push("Page1Form.ui.qml")
                    drawer.close()
                }
            }
            ItemDelegate {
                text: qsTr("Page 2")
                width: parent.width
                onClicked: {
                    stackView.push("Page2Form.ui.qml")
                    drawer.close()
                }
            }
        }
    }

    StackView {
        id: stackView
        initialItem: "HomeForm.ui.qml"
        anchors.fill: parent
    }*/

    /*SwipeView{
        anchors.fill: parent
    }*/

    /*Settings{
        anchors.fill: parent
    }*/

    Stats{
        anchors.fill: parent
    }
}
