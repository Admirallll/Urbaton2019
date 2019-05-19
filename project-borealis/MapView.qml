import QtPositioning 5.3
import QtLocation 5.0
import QtQuick 2.9
import QtQuick.Controls 2.2

Item
{
    Image {
        id: name
        source: "../images/mapa.png"
        anchors.fill: parent
        fillMode: Image.PreserveAspectCrop
        Image {
            id: legend
            x: 10
            width: parent.width/5
            y:parent.height/3
            height: parent.height/3
            source: "../images/legenda.png"
        }
    }
}


