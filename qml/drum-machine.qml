import QtQuick 2.0
import Sailfish.Silica 1.0

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
        }
    }

    LocalStorage { id: storage }
}
