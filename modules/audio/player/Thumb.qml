import QtQuick
import QtQuick.Effects
import qs.config

Rectangle {
    id: root
    required property string source

    color: source ? Theme.transparent : Theme.base
    radius: 8
    width: 120
    height: 120
    clip: true

    Image {
        anchors.fill: parent
        source: root.source
        fillMode: Image.PreserveAspectFit
    }
}
