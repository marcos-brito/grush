import QtQuick
import Quickshell.Widgets
import qs.components
import qs.services
import qs.config

Widget {
    id: root
    panel: "notification-dashboard"
    tooltip: "Notifications"

    Menu {
        id: menu
        anchor.item: root
        anchor.margins.left: 20
        anchor.margins.top: 20

        MenuItem {
            text: "Clear"
            icon: "bluetooth-connected"
        }
    }

    IconifyIcon {
        icon: Icons.notifications
        implicitSize: 15
        color: root.textColor

        Rectangle {
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.topMargin: -5
            anchors.rightMargin: -3
            width: 8
            height: 8
            radius: 50
            color: root.textColor
        }
    }
}
