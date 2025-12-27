import QtQuick
import QtQuick.Layouts
import Quickshell.Widgets
import qs.config
import qs.components
import qs.services

WrapperMouseArea {
    id: root
    onClicked: Panels.open("player")
    hoverEnabled: true

    RowLayout {
        spacing: 8

        IconifyIcon {
            set: "lucide"
            icon: Icons.music
            color: Theme.highlight
            implicitSize: 18
        }

        BaseText {
            Layout.fillWidth: true
            text: `${MediaService.first.trackTitle} - ${MediaService.first.trackArtist}`
            color: Theme.highlight
            elide: Text.ElideRight
        }
    }
}
