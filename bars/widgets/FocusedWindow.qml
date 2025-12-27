import QtQuick
import QtQuick.Layouts
import qs.config
import qs.components
import qs.services

RowLayout {
    spacing: 8
    rotation: 90

    IconifyIcon {
        set: "lucide"
        icon: Icons.window
        implicitSize: 15
        rotation: -90
    }

    BaseText {
        Layout.fillWidth: true
        text: Niri.focusedWindow ? `${Niri.windowName(Niri.focusedWindow)}` : "Desktop"
        color: Theme.highlight
        elide: Text.ElideRight
    }

}
