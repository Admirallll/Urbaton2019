import "controls"
import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4
import QtQuick.Window 2.2
import QtGraphicalEffects 1.0

Item {
    //anchors.fill: parent
    Image {
        x:0
        y:0
        id: background
        source: "qrc:/images/whaleshd.jpg"
        smooth: true

        fillMode: Image.PreserveAspectCrop
        anchors.fill: parent
        clip: true
    }

    Text{
        id: titleText
        text: "Авторизация"
        x:parent.width/2-width/2
        y:parent.height/25
        font.family: robotoLight.name
        font.pointSize: 30
        color:"white"
    }
    Text{
        text: "Введите логин"
        x:parent.width/2-login.width/2
        y:parent.height/2.15
        font.family: robotoLight.name
        color:"white"
    }
    TextField {//логин
        width: parent.width/2
        height: parent.height*0.03
        x:parent.width/2-width/2
        y:parent.height/2-height/2
        id: login
        placeholderText: "Логин"
        //        Rectangle {
        //            color: control.enabled ? "transparent" : "#353637"
        //            border.color: control.enabled ? "#21be2b" : "transparent"
        //        }
    }

    Text{
        text: "Введите пароль"
        x:parent.width/2-login.width/2
        y:parent.height/1.9
        font.family: robotoLight.name
        color:"white"
    }

    TextField {//Пароль
        width: parent.width/2
        height: parent.height*0.03
        x:parent.width/2-width/2
        y:parent.height/1.83
        id: password
        placeholderText: "Пароль"
        //        Rectangle {
        //            color: control.enabled ? "transparent" : "#353637"
        //            border.color: control.enabled ? "#21be2b" : "transparent"
        //        }
    }

    Rectangle{
        id: btn
        width: parent.width/2
        height: parent.height*0.05
        x:parent.width/2-width/2
        y:parent.height/1.65
        //font.family: robotoLight.name
        Text{
            x:parent.width/2-width/2
            y:parent.height/2-height/2
            text: "Войти"
        }
        MouseArea{
            anchors.fill:parent
            onClicked: { core.on_network_BtnClicked( "/api/login/", "{ \"login\": \"" + login.text + "\", \"password\": \"" + password.text + "\"}") }
            onPressed: parent.scale = 0.9
            onReleased: parent.scale = 1
        }
        Behavior on scale {
            PropertyAnimation{
                duration: 100
            }
        }
    }

    MouseArea
    {
        width: parent.width/2
        height: parent.height*0.05
        x:parent.width/2-width/2
        y:parent.height/1.5
        id: text_area
        Text{

            anchors.fill: parent

            text: "Нет аккаунта?"
            id: registerText
            color:"white"
        }
        onEntered: { registerText.color = "blue" }
        onExited: {registerText.color = "white"}
        onClicked: { mainStack.push( "RegisterWindow.qml" ) }
    }
}


