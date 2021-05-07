import QtQuick 2.3

Rectangle {
    anchors.fill: parent
    anchors.margins: margin
    color: "red"

    Text {
        anchors.centerIn: parent
        text: "Hello, World!"
    }

    focus: true
    Keys.onPressed: {
        if (event.key === Qt.Key_Return) {
            color = "blue";
            event.accepted = true;
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            parent.color = "yellow"
            console.log("Button clicked!")
        }
    }

    Rectangle {

        width: parent.width / 2
        height: parent.height
        radius: 56

        color: "#806660FF"
        SequentialAnimation on color {
            loops: Animation.Infinite
            PropertyAnimation { to: "#80FF0000"; duration: 2500 }
            PropertyAnimation { to: "#8000FFFF"; duration: 2500 }
        }

        property int animatedValue: 0
        SequentialAnimation on animatedValue {
            loops: Animation.Infinite
            PropertyAnimation { to: 150; duration: 5000 }
            PropertyAnimation { to: 0; duration: 5000 }
        }

        Text {
            anchors.centerIn: parent
            text: parent.animatedValue
        }
    }
}
