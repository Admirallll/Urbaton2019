import QtQuick 2.0
import QtQuick.Controls 2.4

Item{
    Flickable{
        contentWidth: image.width*0.8; contentHeight: image.height
        contentX: image.width
        contentY: image.height

        Image { id: image
            source: "qrc:/images/comix/all.png"
        }
    }
}

