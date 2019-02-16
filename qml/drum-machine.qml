import QtQuick 2.0
import Sailfish.Silica 1.0

import org.nemomobile.keepalive 1.1

import "pages"
import "components"

ApplicationWindow
{
    id: main
    initialPage: FirstPage {id: drum}
    cover: Qt.resolvedUrl("cover/CoverPage.qml")

    onApplicationActiveChanged: {
        if(!applicationActive){
            drum._running = false
            DisplayBlanking.preventBlanking = false;
        }
    }

    LocalStorage { id: storage }
}
