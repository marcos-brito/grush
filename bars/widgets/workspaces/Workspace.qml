import QtQuick
import qs.config
import qs.services

Rectangle {
    required property var workspace

    color: Theme.highlight
    width: 10
    implicitHeight: Niri.isActive(workspace) ? 50 : 10
    radius: Niri.isActive(workspace) ? 8 : 50

    Behavior on implicitHeight {
        NumberAnimation {
            duration: 200
            easing.type: Easing.InOutQuad
        }
    }

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onClicked: Niri.focusWorkspace(Niri.index(parent.workspace))
        onEntered: if (!Niri.isActive(parent.workspace))
            parent.implicitHeight = 30
        onExited: if (!Niri.isActive(parent.workspace))
            parent.implicitHeight = 10
    }
}
