import QtQuick
import Quickshell.Wayland
import qs.components
import qs.services

BaseWindow {
    id: root

    required property string panel

    WlrLayershell.layer: WlrLayer.Overlay
    visible: true

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true

        onEntered: Panels.toggle(root.panel)
    }
}
