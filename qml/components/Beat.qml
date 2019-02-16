import QtQuick 2.0
import Sailfish.Silica 1.0


Row{
    anchors.horizontalCenter: parent.horizontalCenter
    spacing: Theme.paddingSmall

    property int beat

    Rectangle{
        id: bassbeat
        width: ((drum.height - play.height) / beats) - Theme.paddingSmall
        height: ((drum.height - play.height) / beats) - Theme.paddingSmall
        property bool isBright: false
        color:  isBright ? "crimson" : "darkred"

        MouseArea{
            anchors.fill: parent
            onClicked: {
                bass[beat-1] = !bass[beat-1]
                bassbeat.isBright = !bassbeat.isBright
            }
        }
    }

    Rectangle{
        id: tombeat
        width: ((drum.height - play.height) / beats) - Theme.paddingSmall
        height: ((drum.height - play.height) / beats) - Theme.paddingSmall
        property bool isBright: false
        color:  isBright ? "gold" : "darkgoldenrod"

        MouseArea{
            anchors.fill: parent
            onClicked: {
                tom[beat-1] = !tom[beat-1]
                tombeat.isBright = !tombeat.isBright
            }
        }
    }

    Rectangle{
        id: snarebeat
        width: ((drum.height - play.height) / beats) - Theme.paddingSmall
        height: ((drum.height - play.height) / beats) - Theme.paddingSmall
        property bool isBright: false
        color:  isBright ? "royalblue" : "navy"

        MouseArea{
            anchors.fill: parent
            onClicked: {
                snare[beat-1] = !snare[beat-1]
                snarebeat.isBright = !snarebeat.isBright
            }
        }
    }


    Rectangle{
        id: hihatbeat
        width: ((drum.height - play.height) / beats) - Theme.paddingSmall
        height: ((drum.height - play.height) / beats) - Theme.paddingSmall
        property bool isBright: false
        color:  isBright ? "fuchsia" : "purple"

        MouseArea{
            anchors.fill: parent
            onClicked: {
                hihat[beat-1] = !hihat[beat-1]
                hihatbeat.isBright = !hihatbeat.isBright
            }
        }
    }
}
