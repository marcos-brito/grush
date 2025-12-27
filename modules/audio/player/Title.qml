import QtQuick
import QtQuick.Layouts
import Quickshell.Services.Mpris
import qs.components
import qs.config

ColumnLayout {
    id: root
    required property MprisPlayer player

    spacing: 16

    BaseText {
        text: root.player.trackArtist
        font.pixelSize: 16
    }

    BaseText {
        text: root.player.trackTitle
        color: Theme.subtext
    }
}
