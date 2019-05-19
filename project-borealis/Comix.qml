import QtQuick 2.0
import QtQuick.Controls 2.5

Item{
    anchors.fill:parent
    Flickable{
        anchors.fill:parent
        contentWidth: image.width*0.8; contentHeight: image.height
        contentX: image.width
        contentY: image.height

        Image { id: image
            source: "qrc:/images/comix/all.png"

        }
    }
}

