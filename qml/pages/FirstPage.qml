import QtQuick 2.0
import Sailfish.Silica 1.0
import QtMultimedia 5.0

//import drum.machine.components 1.0
import Nemo.KeepAlive 1.2

import "../components"

Page {
    id: drum
    
    width: parent.width
    height: parent.height

    property int currentBeat: 0
    property int tempo: 120
    property alias _running: drumTimer.running
    property int instruments: 4
    property int beats: 8
    property var bass: [false,false,false,false,false,false,false,false]
    property var tom: [false,false,false,false,false,false,false,false]
    property var snare: [false,false,false,false,false,false,false,false]
    property var hihat: [false,false,false,false,false,false,false,false]
    
    
    onStatusChanged: {
        if (status === PageStatus.Activating) {
            tempo = storage.getValue("tempo/value") === null ? 120 : storage.getValue("tempo/value")
        }
        if (status === PageStatus.Active && pageContainer.depth === 1){
            pageContainer.pushAttached(Qt.resolvedUrl("SettingsPage.qml"))
        }
    }

    Audio{ id: audio } // Using system volume

    SoundEffect {
        id: bassaudio
        source: "qrc:/bassaudio.wav"
        volume: audio.volume
    }

    SoundEffect {
        id: tomaudio
        source: "qrc:/tomaudio.wav"
        volume: audio.volume
    }

    SoundEffect {
        id: snareaudio
        source: "qrc:/snareaudio.wav"
        volume: audio.volume
    }

    SoundEffect{
        id: hihataudio
        source: "qrc:/hihataudio.wav"
        volume: audio.volume
    }

    
    Timer {
        id: drumTimer
        interval: 60000 / tempo / 2
        repeat: true

        onRunningChanged: {
            if (running) {
                if (bass[0]){ bassaudio.play(); }
                if (tom[0]){tomaudio.play(); }
                if (snare[0]){snareaudio.play(); }
                if (hihat[0]){hihataudio.play(); }
            }
            else {
                currentBeat = 0;
            }
        }
        
        onTriggered: {
            currentBeat = (currentBeat + 1)%beats
            if (bass[currentBeat]){ bassaudio.play(); }
            if (tom[currentBeat]){ tomaudio.play(); }
            if (snare[currentBeat]){ snareaudio.play(); }
            if (hihat[currentBeat]){ hihataudio.play(); }
        }
    }

    SilicaFlickable {
        anchors.fill: parent

        PullDownMenu {
            MenuItem {
                text: qsTr("Save")
                onClicked: {
                    drum._running = false
                    pageStack.push(Qt.resolvedUrl("SavePage.qml"))
                }
            }
        }


        Column {
            id: column
            width: parent.width
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: Theme.paddingSmall

            Image {
                id: play
                anchors.horizontalCenter: parent.horizontalCenter
                source: drumTimer.running ? "image://theme/icon-l-pause" : "image://theme/icon-l-play"
                // transform: Rotation { origin.x: play.horizontalCenter; origin.y: play.verticalCenter; angle: 90}

                MouseArea{
                    anchors.fill: parent
                    onClicked:{
                        drumTimer.running = !drumTimer.running;
                    }
                }
            }

            Beat{ beat: 1 }
            Beat{ beat: 2 }

            Beat{ beat: 3 }
            Beat{ beat: 4 }

            Beat{ beat: 5 }
            Beat{ beat: 6 }

            Beat{ beat: 7 }
            Beat{ beat: 8 }

        }
    }

    DisplayBlanking {
        id: displayBlanking
        preventBlanking: drumTimer.running && Qt.application.state == Qt.ApplicationActive
    }
}
