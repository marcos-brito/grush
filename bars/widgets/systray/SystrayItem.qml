import QtQuick
import Quickshell
import Quickshell.Widgets
import Quickshell.Services.SystemTray
import qs.components
import qs.config

IconImage {
    id: root
    required property SystemTrayItem item

    source: Quickshell.iconPath(item.icon, true) || fallback.source
    implicitSize: 15

    IconifyIcon {
        id: fallback
        visible: false
        set: Icons.set
        icon: Icons.systrayFallback
        color: Theme.text
        implicitSize: 15
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        acceptedButtons: Qt.AllButtons
        hoverEnabled: true

        onWheel: wheel => {}

        onClicked: mouse => {
            if (mouse.button === Qt.LeftButton)
                root.item.activate();

            if (mouse.button === Qt.MiddleButton)
                root.item.secondaryActivate();

            if (mouse.button === Qt.RightButton)
                root.item.display();
        }
    }
}
