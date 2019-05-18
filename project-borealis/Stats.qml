import QtQuick 2.11
import QtQuick.Controls 2.4
import QtGraphicalEffects 1.0

Item{
    Image {
        //anchors.fill: parent
        x:0
        y:0
        id: background
        source: "qrc:/images/grass.jpg"
        smooth: true
    }
    FastBlur {
            anchors.fill: background
            source: background
            radius: 32
        }

    Text{
        x:parent.width/2 - width/2
        y:parent.height/23
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
