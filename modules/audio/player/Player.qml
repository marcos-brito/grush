import Quickshell.Services.Mpris
import QtQuick.Layouts
import qs.components
import qs.services

ColumnLayout {
    id: root
    property MprisPlayer player: MediaService.first

    spacing: 16

    BaseSelect {
        values: MediaService.identities()
        onValueAccepted: value => root.player = MediaService.ofIdentity(value)
    }

    RowLayout {
        spacing: 16

        Thumb {
            source: root.player.trackArtUrl
        }

        ColumnLayout {
            spacing: 16
            Layout.fillWidth: true

            Title {
                player: root.player
                Layout.alignment: Qt.AlignTop
            }

            Controls {
                Layout.fillWidth: true
                player: root.player
            }

            // Progress {}
        }
    }
}
