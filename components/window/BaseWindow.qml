import QtQuick
import Quickshell
import Quickshell.Io
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

    IpcHandler {
        target: root.name

        function open(): void {
            Panels.open(root.name);
        }
    }

    function open(): void {
        root.visible = true;
    }

    function close(): void {
        root.visible = false;
    }
}
