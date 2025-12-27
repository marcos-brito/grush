import QtQuick
import QtQuick.Layouts
import qs.services
import qs.config
import qs.components

ColumnLayout {
    Text {
        color: Theme.text
        text: `${Qt.formatTime(Media.active.length, "m:s")} / ${Qt.formatTime(Media.active.position, "m:s")}`
    }

    BaseSlider {
        Layout.fillWidth: true
        Layout.preferredHeight: 20
        color: Theme.highlight
        value: Media.active.position % 100
        to: Media.active.length % 100
        onValueChanged: Media.active.position = value
    }
}
