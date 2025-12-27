import Quickshell.Services.Pipewire
import QtQuick
import QtQuick.Layouts

ColumnLayout {
    spacing: 16

    PwNodeLinkTracker {
        id: linkTracker
        node: Pipewire.defaultAudioSink
    }

    Sink {
        node: Pipewire.defaultAudioSink
    }

    Repeater {
        model: linkTracker.linkGroups

        Sink {
            required property PwLinkGroup modelData
            node: modelData.source
        }
    }
}
