import QtQuick
import qs.services
import qs.bars.widgets

OverlayWidget {
    Repeater {
        model: Niri.workspaces

        Workspace {
            required property var modelData
            workspace: modelData
        }
    }
}
