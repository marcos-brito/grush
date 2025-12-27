import QtQuick
import QtQuick.Layouts
import Quickshell.Io
import Quickshell.Wayland
import Quickshell.Services.Pipewire
import qs.components
import qs.config

SuperPanel {
    id: root
    property PwNode node: Pipewire.defaultAudioSource

    WlrLayershell.layer: WlrLayer.Overlay
    name: "osd"
    panelWidth: screen.width * 0.05
    panelHeight: screen.height * 0.2
    panelColor: Theme.base
    origin: SuperPanel.Origin.Right
    topLeftRadius: 8
    bottomLeftRadius: 8
    closeOnEsc: false
    focusable: false

    anchors {
        right: true
    }

    margins {
        right: 8
    }

    PwObjectTracker {
        objects: [root.node]
    }

    Timer {
        id: timer
        interval: 2000
        onTriggered: root.close()
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.bottomMargin: Props.barMargin
        anchors.topMargin: Props.barMargin

        BaseSlider {
            flip: true
            color: root.node.audio.muted ? Theme.critical : Theme.highlight
            value: root.node.audio.volume
            stepSize: 0.1
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

    IpcHandler {
        target: "osd"

        function show(): void {
            root.open()
            timer.restart();
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
