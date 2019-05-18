import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3

Item {
    property string labelText: "default"
    property string innerText: "enter ..."

    property string formData: ""
    RowLayout{
        id: layout
        spacing: 6

        Text{
            id: label
            text: labelText
//            Layout.alignment: Qt.AlignVCenter
            Layout.preferredWidth: 100
            Layout.preferredHeight: 40
        }

//        Item{

//        }
        TextField{
            id: lineEdit
            placeholderText: innerText
//            horizontalAlignment: Qt.AlignRight
//            anchors.right: parent
//            width: parent.width/2
//            height: parent.height

            Layout.preferredWidth: 100
            Layout.preferredHeight: 40
            onTextChanged: { formData = text; }
//            x: label.width + parent.width/15
        }
    }
}
