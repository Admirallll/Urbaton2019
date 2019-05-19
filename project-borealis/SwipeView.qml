import QtQuick 2.0
import QtQuick 2.12
import QtQuick.Controls 2.5

Item {

    SwipeView {
        id: view

        currentIndex: 0
        anchors.fill: parent

        Settings{
            id:set
        }
        Stats{
            id:stats
        }
    }

    PageIndicator {
        id: indicator

        interactive: true
        count: view.count
        currentIndex: view.currentIndex

        anchors.top: view.top
        anchors.horizontalCenter: parent.horizontalCenter

        delegate:
            Image{//first
            width:15
            height:15
            source: "qrc:/images/icon.png"
            opacity: index === indicator.currentIndex ? 0.95 : pressed ? 0.7 : 0.45

            Behavior on opacity {
                OpacityAnimator {
                    duration: 100
                }
            }
        }
    }

    property variant indicatorIcons: [
        "images/icon.png",
        "images/icon.png",
        "images/icon.png"
    ]
}
