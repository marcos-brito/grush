import QtQuick
import QtQuick.Layouts
import qs.components
import qs.config

ColumnLayout {
    id: root
    Layout.fillWidth: true
    spacing: 16

    Time {
        Layout.fillWidth: true
        font.pixelSize: 78
        font.bold: true
        color: Theme.highlight
        horizontalAlignment: Text.AlignHCenter
    }

    Time {
        format: "dddd d"
        Layout.fillWidth: true
        font.pixelSize: 20
        color: Theme.highlight
        horizontalAlignment: Text.AlignHCenter
    }
}
