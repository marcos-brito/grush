import QtQuick
import qs.components
import qs.config
import qs.modules.notification
import qs.services

Widget {
    id: root
    panel: "notification-dashboard"
    tooltip: "Notifications"

    Dashboard {}

    IconifyIcon {
        icon: NotificationService.notifications.length > 0 ? Icons.notificationsNew : Icons.notifications
        implicitSize: 15
        color: root.textColor
    }
}
