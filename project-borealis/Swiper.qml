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
            currentIndex: tabBar.currentIndex

            MapView{
                id: mapa
            }
            CodeScanTrasher{
                id: codeScan
            }
            Stats{
                id: stats
            }
            Settings{
                id: settings
            }
        }

        PageIndicator {
            id: indicator

            //            interactive: true
            count: view.count
            currentIndex: view.currentIndex

            anchors.bottom: view.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            onCurrentIndexChanged: {
                switch( currentIndex )
                {
                case 0: core.on_network_BtnClicked("/api/recycle-point/", ""); break;
//                case 1: core.on_network_BtnClicked("/api/codes//", ""); break;
                case 2: core.on_network_BtnClicked("/api/user/" + core.mId + " /stat",""); break;
                case 3: core.on_network_BtnClicked("/api/user/" + core.mId, ""); break;
                }
            }
        }
        TabBar {

            opacity: 0.5
                id: tabBar
                currentIndex: view.currentIndex

                width: parent.width
//                height: parent.height/10

                TabButton {
                    text: qsTr("map")
                }
                TabButton {
                    text: qsTr("scan")
                }
                TabButton {
                    text: qsTr("stats")
                }
                TabButton {
                    text: qsTr("settings")
                }
        }
    }
}

