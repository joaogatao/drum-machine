import QtQuick 2.0
import Sailfish.Silica 1.0
//import drum.machine.components 1.0

CoverBackground {

    property int currentBeat: drum.currentBeat

    Column {

        spacing: Theme.paddingLarge
        anchors.centerIn: parent

        Image {
            id: image
            source: Qt.resolvedUrl("drum-machine.png")
            fillMode: Image.PreserveAspectFit
            anchors.horizontalCenter: parent.horizontalCenter
            asynchronous: true
            width: parent.width * 0.9
        }

        Label {
            id: label
            anchors.horizontalCenter: parent.horizontalCenter
            text: "%1 bpm".arg(drum.tempo)
        }
    }

    CoverActionList {
        id: coverAction

        CoverAction {
            iconSource: drum._running ? "image://theme/icon-cover-pause" : "image://theme/icon-cover-play"
            onTriggered: drum._running = !drum._running
        }

    }
}


