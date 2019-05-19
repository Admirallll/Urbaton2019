import QtQuick 2.11
import QtQuick.Controls 2.4
import QtGraphicalEffects 1.0
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3

Item {
    Image {
        x:0
        y:0
        id: background
        source: "qrc:/images/wave.jpg"
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
        text: "Просканировать код"
        font.family: robotoLight.name
        font.pointSize: 30
        color: "white"
    }

    Text{
        id: texttext
        x:parent.width/2 - width/2
        y:parent.height/2
        text: "Введите этот код: \n"
        font.family: robotoLight.name
        font.pointSize: 30
        color: "white"
    }

    TextField{
        id: textEdit;
        x:parent.width/2 - width/2
        y:parent.height/2 + texttext.height
        height: parent.height/20
        width: parent.height/2

        placeholderText: "Код сюда"
    }

    Button{
        x: textEdit.x;
        y: textEdit.y + textEdit.height+ 15

        width: textEdit.width
        height: textEdit.height

        text: "Отправить код"
        onClicked: {core.on_network_BtnClicked("/api/codes/send_code/" + textEdit.text, "")}
    }
}
