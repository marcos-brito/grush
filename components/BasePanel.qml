import QtQuick
import Quickshell
import Quickshell.Wayland
import qs.services
import qs.config

PanelWindow {
    id: root
    required property string name
    property bool register: true

    visible: false
    WlrLayershell.namespace: `qs-${name}`
    exclusionMode: ExclusionMode.Ignore
    color: Theme.transparent

    Component.onCompleted: {
        if (root.register)
            Panels.register(root);
    }

    function open(): void {
        root.visible = true;
    }

    function close(): void {
        root.visible = false;
    }
}
