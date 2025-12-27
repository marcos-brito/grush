import Quickshell.Services.Mpris
import QtQuick.Layouts
import qs.components
import qs.config

RowLayout {
    id: root
    required property MprisPlayer player

    spacing: 16

    component Control: BaseButton {
        id: root
        property string icon
        property string color: Theme.text

        IconifyIcon {
            icon: root.icon
            color: root.color
            implicitSize: 18
        }
    }

    Control {
        onClicked: root.player.previous()
        icon: Icons.previous
    }

    Control {
        onClicked: root.player.next()
        icon: Icons.next
    }

    Control {
        onClicked: root.player.togglePlaying()
        icon: root.player.isPlaying ? Icons.pause : Icons.play
    }

    Control {
        icon: Icons.likeTrack
        color: Theme.critical
    }
}
