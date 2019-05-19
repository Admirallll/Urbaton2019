import QtQuick 2.11
import QtQuick.Controls 2.4
import QtGraphicalEffects 1.0

Item{
    Connections{
        target: core
        onSgSetStaticList: { }
    }

    Image {
        //anchors.fill: parent
        id: background
        source: "qrc:/images/grass.jpg"
        smooth: true

        fillMode: Image.PreserveAspectCrop
        anchors.fill: parent
        clip: true
    }
    FastBlur {
            anchors.fill: background
            source: background
            radius: 32
        }

    Text{
        x:parent.width/2 - width/2
        y:parent.height/20
        text: "Статистика"
        font.family: robotoLight.name
        font.pointSize: 30
        color: "white"
    }

    Text{
        x:parent.width*0.076
        y:parent.height/6.5
        text: "Сдано"
        font.family: robotoLight.name
        font.pointSize: 15
        color: "white"
    }

    Rectangle{
        x:parent.width*0.05
        y: parent.height*0.195
        width:parent.width-parent.width*0.1
        height:parent.height*0.5
        color:"black"
        opacity:0.26

        ListView {
            width: parent.width/2
            height: parent.height
            anchors.left: parent.left

            model: myModel
            delegate: Rectangle {
                height: 25
                width: parent.width
                color: "transparent"

                Text {
                    text: name
                    color: "white"
                    font.pointSize: 14
                    opacity: 1
                }

            }

        }
        ListView {
            width: parent.width/2
            height: parent.height
            anchors.left: parent.horizontalCenter

            model: modelMy
            delegate: Rectangle {
                height: 25
                width: parent.width
                color: "transparent"
                Text {
                    text: name
                    anchors.right: parent.right
                    color: "white"
                    font.pointSize: 14
                    opacity: 1

                }

            }
        }
    }

    Rectangle{
        x: parent.width/2-width/2
        y: parent.height*0.23
        width:parent.width*0.005
        height:parent.height/2.3
        color:"white"
        opacity:0.3


    }
}

/*##^## Designer {
    D{i:0;autoSize:true;height:1000;width:563}
}
 ##^##*/
