import QtQuick.Layouts
import Quickshell.Io
import Quickshell.Widgets
import Quickshell.Wayland
import Quickshell.Services.Pipewire
import qs.components
import qs.components.overlay
import qs.config

TimedPanel {
    id: root

    property PwNode node: Pipewire.defaultAudioSource

    WlrLayershell.layer: WlrLayer.Overlay
    name: "osd"
    panelWidth: screen.width * 0.05
    panelHeight: screen.height * 0.2
    origin: Positioning.Origin.Right

    PwObjectTracker {
        objects: [root.node]
    }

    WrapperMouseArea {
        onClicked: root.node.audio.muted = !root.node.audio.muted
        onWheel: {
            if (wheel.angleDelta.y > 0 || wheel.angleDelta.x > 0)
                slider.value += slider.stepSize;
            else
                slider.value -= slider.stepSize;
        }

        ColumnLayout {
            anchors.fill: parent
            anchors.bottomMargin: Props.barMargin
            anchors.topMargin: Props.barMargin

            BaseSlider {
                id: slider
                flip: true
                color: root.node.audio.muted ? Theme.critical : Theme.highlight
                value: root.node.audio.volume
                stepSize: 0.05
                onValueChanged: root.node.audio.volume = value
                orientation: Qt.Vertical
                Layout.alignment: Qt.AlignHCenter
                Layout.fillHeight: true
            }

            IconifyIcon {
                set: "lucide"
                icon: root.node.audio.muted ? Icons.audioMuted : Icons.audio
                color: root.node.audio.muted ? Theme.critical : Theme.highlight
                implicitSize: 20
                Layout.alignment: Qt.AlignHCenter
            }
        }
    }

    IpcHandler {
        target: "osd"

        function show(): void {
            root.open();
        }

        function toogle(): void {
            root.node.audio.muted = !root.node.audio.muted;
            show();
        }

        function increase(): void {
            if (root.node.audio.volume < 1)
                root.node.audio.volume += 0.05;
            show();
        }

        function decrease(): void {
            if (root.node.audio.volume > 0)
                root.node.audio.volume -= 0.05;
            show();
        }
    }
}
