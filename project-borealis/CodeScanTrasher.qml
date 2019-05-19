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
        font.pointSize: 20
        text: "Бумага"
        color: "white"
        font.family: robotoLight.name
    }
    TextField{
        id: paper
        x: parent.width - width - 10
        y: hC*3
        width: parent.width/3
        height: hC
        placeholderText: "Бумага, кг"
        font.family: robotoLight.name
    }
    Text{
        x: 10
        y: hC*4
        width: parent.width/3
        height: hC
        font.pointSize: 20
        text: "Пластик"
        color: "white"
        font.family: robotoLight.name
    }
    TextField{
        id: plastic
        x: parent.width - width - 10
        y: hC*4
        width: parent.width/3
        height: hC
        placeholderText: "Пластик, кг"
        font.family: robotoLight.name
    }
    Text{
        x: 10
        y: hC*5
        width: parent.width/3
        height: hC
        font.pointSize: 20
        text: "Стекло"
        color: "white"
        font.family: robotoLight.name
    }
    TextField{
        id: glass
        x: parent.width - width - 10
        y: hC*5
        width: parent.width/3
        height: hC
        placeholderText: "Стекло, кг"
        font.family: robotoLight.name
    }
    Text{
        x: 10
        y: hC*6
        width: parent.width/3
        height: hC
        font.pointSize: 20
        text: "Батарейка"
        color: "white"
        font.family: robotoLight.name
    }
    TextField{
        id: battary
        x: parent.width - width - 10
        y: hC*6
        width: parent.width/3
        height: hC
        placeholderText: "Батарейка, шт"
        font.family: robotoLight.name
    }
    Text{
        x: 10
        y: hC*7
        width: parent.width/3
        height: hC
        font.pointSize: 20
        text: "Одежда"
        color: "white"
        font.family: robotoLight.name
    }
    TextField{
        id: cloth
        x: parent.width - width - 10
        y: hC*7
        width: parent.width/3
        height: hC
        placeholderText: "Одежда, кг"
        font.family: robotoLight.name
    }
    Text{
        x: 10
        y: hC*8
        width: parent.width/3
        height: hC
        font.pointSize: 20
        text: "Другое"
        color: "white"
        font.family: robotoLight.name
    }
    TextField{
        id: another
        x: parent.width - width - 10
        y: hC*8
        width: parent.width/3
        height: hC
        placeholderText: "Другое, кг"
        font.family: robotoLight.name
    }

    Button{
        id: btn
        y: hC*10
        x: parent.width/2 - width/2

        width: parent.width/2
        height: hC

        text: "Получить код"
        font.family: robotoLight.name

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
