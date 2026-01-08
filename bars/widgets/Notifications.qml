import QtQuick
import qs.components
import qs.config
import qs.modules.notification

Widget {
    id: root
    panel: "notification-dashboard"
    tooltip: "Notifications"

    Dashboard {}

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
