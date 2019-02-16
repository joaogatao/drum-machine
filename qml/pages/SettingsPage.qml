import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: root

    SilicaFlickable {
        anchors.fill: parent
        
        PageHeader {
            id: header
            title: qsTr("Settings")
        }

        Column {
            width: parent.width - (Theme.paddingLarge * 2)
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: header.bottom
            spacing: Theme.paddingMedium

            // Tempo
            Label {
                height: font.pixelSize + Theme.paddingLarge
                font.pixelSize: Theme.fontSizeLarge
                color: Theme.secondaryHighlightColor
                text: qsTr("Tempo")
            }
            
            Slider {
                width: parent.width
                minimumValue: 40
                maximumValue: 240
                stepSize: 1
                valueText: qsTr("BPM: %1").arg(value)
                value: storage.getValue("tempo/value") == null ? 120 : storage.getValue("tempo/value")
                onValueChanged: storage.setValue("tempo/value", value)
            }
            
        }
    }
}
