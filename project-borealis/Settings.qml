import QtQuick 2.11
import QtQuick.Controls 2.4
import QtGraphicalEffects 1.0


Item{
   // anchors.fill: parent
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
        x:parent.width/2 - width/2
        y:parent.height/20
        text: "Настройки"
        font.family: robotoLight.name
        font.pointSize: 30
        color: "white"
    }

    Switch {
        id: warnings
        x: parent.width*0.076
        y: parent.height*0.138
        //x:parent.width*0.076
        //y:parent.height/9
        text: "Уведомления"
        font.family: robotoLight.name
        font.pointSize: 15

        indicator: Rectangle {
            implicitWidth: 48
            implicitHeight: 26
            x: warnings.leftPadding
            y: parent.height / 2 - height / 2
            radius: 13
            color: warnings.checked ? "#17a81a" : "transparent"
            border.color: warnings.checked ? "#17a81a" : "#cccccc"

            Rectangle {
                x: warnings.checked ? parent.width - width : 0
                width: 26
                height: 26
                radius: 13
                color: warnings.down ? "#cccccc" : "#ffffff"
                border.color: warnings.checked ? (warnings.down ? "#17a81a" : "#21be2b") : "#999999"
            }
        }

        contentItem: Text {
            text: warnings.text
            font: warnings.font
            opacity: enabled ? 1.0 : 0.3
            color: warnings.down ? "#17a81a" : "#ffffff"
            verticalAlignment: Text.AlignVCenter
            leftPadding: warnings.indicator.width + warnings.spacing
        }
    }

    Rectangle{
        x:parent.width*0.05
        y: parent.height*0.208
        width:parent.width-parent.width*0.1
        height:parent.height*0.05
        color:"black"
        opacity:0.2
    }

    Text{
        x:parent.width*0.076
        y:parent.height*0.213
        text: "Учётная запись"
        font.family: robotoLight.name
        font.pointSize: 20
        color: "white"
    }

    Text{
        x:parent.width*0.076
        y:parent.height*0.259
        text: "ФИО"
        font.family: robotoLight.name
        font.pointSize: 15
        color: "white"
    }
    Text{
        x:parent.width*0.076
        y: parent.height*0.305
        text: "Номер телефона"
        font.family: robotoLight.name
        font.pointSize: 15
        color: "white"
    }
    Text{
        x:parent.width*0.076
        y: parent.height*0.351
        text: "e-mail"
        font.family: robotoLight.name
        font.pointSize: 15
        color: "white"
    }

    Rectangle{
        x:parent.width*0.05
        y:parent.height*0.397
        width:parent.width-parent.width*0.1
        height:parent.height*0.05
        color:"black"
        opacity:0.2
    }

    Text{
        x:parent.width*0.076
        y: parent.height*0.402
        text: "Основные"
        font.family: robotoLight.name
        font.pointSize: 20
        color: "white"
    }

    Switch {
        id: geolocation
        x: parent.width*0.076
        y: parent.height*0.453
        //x:parent.width*0.076
        //y:parent.height/9
        text: "Геоданные"
        font.family: robotoLight.name
        font.pointSize: 15

        indicator: Rectangle {
            implicitWidth: 48
            implicitHeight: 26
            x: geolocation.leftPadding
            y: parent.height / 2 - height / 2
            radius: 13
            color: geolocation.checked ? "#17a81a" : "transparent"
            border.color: geolocation.checked ? "#17a81a" : "#cccccc"

            Rectangle {
                x: geolocation.checked ? parent.width - width : 0
                width: 26
                height: 26
                radius: 13
                color: geolocation.down ? "#cccccc" : "#ffffff"
                border.color: geolocation.checked ? (geolocation.down ? "#17a81a" : "#21be2b") : "#999999"
            }
        }

        contentItem: Text {
            text: geolocation.text
            font: geolocation.font
            opacity: enabled ? 1.0 : 0.3
            color: geolocation.down ? "#17a81a" : "#ffffff"
            verticalAlignment: Text.AlignVCenter
            leftPadding: geolocation.indicator.width + geolocation.spacing
        }
    }

    Switch {
        id: camera
        x: parent.width*0.076
        y: parent.height*0.511
        //x:parent.width*0.076
        //y:parent.height/9
        text: "Доступ к камере"
        font.family: robotoLight.name
        font.pointSize: 15

        indicator: Rectangle {
            implicitWidth: 48
            implicitHeight: 26
            x: camera.leftPadding
            y: parent.height / 2 - height / 2
            radius: 13
            color: camera.checked ? "#17a81a" : "transparent"
            border.color: camera.checked ? "#17a81a" : "#cccccc"

            Rectangle {
                x: camera.checked ? parent.width - width : 0
                width: 26
                height: 26
                radius: 13
                color: camera.down ? "#cccccc" : "#ffffff"
                border.color: camera.checked ? (camera.down ? "#17a81a" : "#21be2b") : "#999999"
            }
        }

        contentItem: Text {
            text: camera.text
            font: camera.font
            opacity: enabled ? 1.0 : 0.3
            color: camera.down ? "#17a81a" : "#ffffff"
            verticalAlignment: Text.AlignVCenter
            leftPadding: camera.indicator.width + camera.spacing
        }
    }

    Rectangle{
        x:parent.width*0.05
        y:parent.height*0.564
        width:parent.width-parent.width*0.1
        height:parent.height*0.05
        color:"black"
        opacity:0.2
    }

    Text{
        x:parent.width*0.076
        y: parent.height*0.569
        text: "О приложении"
        font.family: robotoLight.name
        font.pointSize: 20
        color: "white"
    }
    Text{
        x:parent.width*0.076
        y: parent.height*0.620
        text: "Обратная связь"
        font.family: robotoLight.name
        font.pointSize: 15
        color: "white"
    }
    Text{
        x:parent.width*0.076
        y: parent.height*0.666
        text: "Оценить приложение"
        font.family: robotoLight.name
        font.pointSize: 15
        color: "white"
    }
    Text{
        x:parent.width*0.076
        y: parent.height*0.712
        text: "Пользовательское соглашение"
        font.family: robotoLight.name
        font.pointSize: 15
        color: "white"
    }
    Text{
        x:parent.width*0.076
        y: parent.height*0.758
        text: "Защита данных"
        font.family: robotoLight.name
        font.pointSize: 15
        color: "white"
    }
}




/*##^## Designer {
    D{i:0;autoSize:true;height:1000;width:563}
}
 ##^##*/
