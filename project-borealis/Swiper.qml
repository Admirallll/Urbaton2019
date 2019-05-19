import QtQuick 2.0
import QtQuick 2.11
import QtQuick.Controls 2.4

Item {
    Rectangle{
        anchors.fill: parent
        id: rect
        color: "white"
        SwipeView {
            anchors.fill: parent

            id: view
            currentIndex: 0

            Stats{
                id: stats
            }
            Settings{
                id: settings
            }
            MapView{
                id: mapa
            }

        }

        PageIndicator {
            id: indicator

//            interactive: true
            count: view.count
            currentIndex: view.currentIndex

            anchors.bottom: view.bottom
            anchors.horizontalCenter: parent.horizontalCenter

//            delegate: Image{//first
//                width:15
//                height:15
//                source: "../images/icon.png"
//                opacity: index === indicator.currentIndex ? 0.95 : pressed ? 0.7 : 0.45

//                Behavior on opacity {
//                    OpacityAnimator {
//                        duration: 100
//                    }
//                }
//            }
//            property variant indicatorIcons: [
//                "images/icon.png",
//                "images/icon.png",
//                "images/icon.png"
//            ]

        }
    }
}

