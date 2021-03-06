import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.3

ColumnLayout {
    id: mainLayout
    anchors.fill: parent
    anchors.margins: margin
    GroupBox {
        id: rowBox
        title: "Row layout"
        Layout.fillWidth: true

        RowLayout {
            id: rowLayout
            anchors.fill: parent
            TextField {
                placeholderText: "This wants to grow horizontally"
                Layout.fillWidth: true
            }
            Button {
                text: "Button"
            }
        }
    }

    GroupBox {
        id: gridBox
        title: "Grid layout"
        Layout.fillWidth: true

        GridLayout {
            id: gridLayout
            rows: 3
            flow: GridLayout.TopToBottom
            anchors.fill: parent

            Label { text: "Line 1" }
            Label { text: "Line 2" }
            Label { text: "Line 3" }

            TextField { }
            TextField { }
            TextField { }

            TextArea {
                text: "This widget spans over three rows in the GridLayout.\n"
                    + "All items in the GridLayout are implicitly positioned from top to bottom."
                Layout.rowSpan: 3
                Layout.fillHeight: true
                Layout.fillWidth: true
            }
        }
    }
    TextArea {
        id: t3
        text: "This fills the whole cell"
        Layout.minimumHeight: 30
        Layout.fillHeight: true
        Layout.fillWidth: true
    }

    Rectangle {
        Layout.minimumHeight: 30
        Layout.fillHeight: true
        Layout.fillWidth: true
        color: "red"

        Text {
            anchors.centerIn: parent
            text: "Hello, World!"
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                appLoader.source = "MainHelloWorld.qml"
            }
        }
    }


    Loader {
        id: appLoader
        onLoaded: {
//            mainLayout.visible = false
            root.visible = false
            item.visible = true
//            item.showFullScreen()
        }
    }


    GroupBox {
        id: stackBox
        title: "Stack layout"
        implicitWidth: 200
        implicitHeight: 60
        Layout.fillWidth: true
        Layout.fillHeight: true
        StackLayout {
            id: stackLayout
            anchors.fill: parent

            function advance() { currentIndex = (currentIndex + 1) % count }

            Repeater {
                id: stackRepeater
                model: 5
                Rectangle {
                    color: Qt.hsla((0.5 + index)/stackRepeater.count, 0.3, 0.7, 1)
                    Button { anchors.centerIn: parent; text: "Page " + (index + 1); onClicked: { stackLayout.advance() } }
                }
            }
        }
    }
}
