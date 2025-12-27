import Quickshell.Services.Pipewire
import qs.config
import qs.components

OverlayWidget {
    id: root
    property PwNode node: Pipewire.defaultAudioSource

    onEntered: level.visible = true
    onExited: level.visible = false
    onClicked: node.audio.muted = !node.audio.muted
    onWheel: {
        if (wheel.angleDelta.y > 0 || wheel.angleDelta.x > 0) {
            if (node.audio.volume < 1)
                node.audio.volume += 0.1;
            return;
        }

        if (node.audio.volume > 0)
            node.audio.volume -= 0.1;
    }

    PwObjectTracker {
        objects: [root.node]
    }

    IconifyIcon {
        set: "lucide"
        icon: root.node.audio.muted ? Icons.audioMuted : Icons.audio
        color: root.node.audio.muted ? Theme.critical : Theme.highlight
        implicitSize: 16
    }

    BaseText {
        id: level
        text: `${Math.round(root.node.audio.volume * 100)}`
        color: root.node.audio.muted ? Theme.critical : Theme.highlight
    }
}
