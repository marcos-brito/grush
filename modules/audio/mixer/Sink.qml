import Quickshell.Services.Pipewire
import QtQuick
import QtQuick.Layouts
import qs.config
import qs.components

ColumnLayout {
    id: root
    required property PwNode node

    PwObjectTracker {
        objects: [root.node]
    }

    RowLayout {
        Layout.fillWidth: true

        BaseText {
            Layout.fillWidth: true
            elide: Text.ElideRight
            text: {
                const app = root.node.properties["application.name"] ?? (root.node.description != "" ? root.node.description : root.node.name);
                const media = root.node.properties["media.name"];

                return media != undefined ? `${app} - ${media}` : app;
            }
        }

        BaseText {
            text: `${Math.round(root.node.audio.volume * 100)}%`
        }
    }

    RowLayout {
        BaseButton {
            onPressed: root.node.audio.muted = !root.node.audio.muted
            IconifyIcon {
                implicitSize: 18
                set: Icons.set
                icon: root.node.audio.muted ? Icons.audioMuted : Icons.audio
                color: root.node.audio.muted ? Theme.critical : Theme.highlight
            }
        }

        BaseSlider {
            Layout.fillWidth: true
            color: root.node.audio.muted ? Theme.critical : Theme.highlight
            value: root.node.audio.volume
            stepSize: 0.02
            onValueChanged: root.node.audio.volume = value
        }
    }
}
