import QtQuick
import qs.config

Rectangle {
    color: Theme.transparent
    border.color: Theme.base
    border.width: 2 

    Image {
        anchors.fill: parent
        source: Theme.wallpaper
    }
}
