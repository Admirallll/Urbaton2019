import QtQuick 2.11
import QtQuick.Controls 2.4
import QtGraphicalEffects 1.0
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3

Item {

    property string codeText: ""
    Image {
        x:0
        y:0
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
        id: textt
        x:parent.width/2 - width/2
        y:parent.height/20
        text: "Сформировать код"
        font.family: robotoLight.name
        font.pointSize: 30
        color: "white"
    }

    property int hC: parent.height/15

    Text{
        x: 10
        y: hC*3
        width: parent.width/3
        height: hC
        font.pointSize: 15
        text: "Бумага"
    }
    TextField{
        id: paper
        x: parent.width - width - 10
        y: hC*3
        width: parent.width/3
        height: hC
        placeholderText: "Бумага, кг"
    }
    Text{
        x: 10
        y: hC*4
        width: parent.width/3
        height: hC
        font.pointSize: 15
        text: "Пластик"
    }
    TextField{
        id: plastic
        x: parent.width - width - 10
        y: hC*4
        width: parent.width/3
        height: hC
        placeholderText: "Пластик, кг"
    }
    Text{
        x: 10
        y: hC*5
        width: parent.width/3
        height: hC
        font.pointSize: 15
        text: "Стекло"
    }
    TextField{
        id: glass
        x: parent.width - width - 10
        y: hC*5
        width: parent.width/3
        height: hC
        placeholderText: "Стекло, кг"
    }
    Text{
        x: 10
        y: hC*6
        width: parent.width/3
        height: hC
        font.pointSize: 15
        text: "Батарейка"
    }
    TextField{
        id: battary
        x: parent.width - width - 10
        y: hC*6
        width: parent.width/3
        height: hC
        placeholderText: "Батарейка, шт"
    }
    Text{
        x: 10
        y: hC*7
        width: parent.width/3
        height: hC
        font.pointSize: 15
        text: "Одежда"
    }
    TextField{
        id: cloth
        x: parent.width - width - 10
        y: hC*7
        width: parent.width/3
        height: hC
        placeholderText: "Одежда, кг"
    }
    Text{
        x: 10
        y: hC*8
        width: parent.width/3
        height: hC
        font.pointSize: 15
        text: "Другое"
    }
    TextField{
        id: another
        x: parent.width - width - 10
        y: hC*8
        width: parent.width/3
        height: hC
        placeholderText: "Другое, кг"
    }

    Button{
        id: btn
        y: hC*10
        x: parent.width/2 - width/2

        width: parent.width/2
        height: hC

        text: "Получить код"

        onClicked: { core.on_network_BtnClicked( "/api/codes/generate/", "{ \"RecyclePointId\": }" /*JSON Object*/ ) }
    }

    Text{
        id: textCode
        y: hC*12
        x: btn.x

        width: btn.width
        height: btn.height

        text: codeText
    }
}
