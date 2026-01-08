import QtQuick
import QtQuick.Layouts
import qs.components
import qs.services
import qs.config

SuperPanel {
    id: root

    name: "notification-dashboard"
    panelWidth: screen.width * 0.25
    panelHeight: screen.height * 0.5
    panelColor: Theme.base
    origin: SuperPanel.Origin.Left
    topRightRadius: 8
    bottomRightRadius: 8

    anchors {
        left: true
    }

    margins {
        top: Props.topBarHeight
        left: Props.leftBarWidth
    }

    ColumnLayout {
        visible: NotificationService.notifications.length < 1
        anchors.centerIn: parent
        spacing: 16

        IconifyIcon {
            Layout.alignment: Qt.AlignHCenter
            set: Icons.set
            icon: Icons.notificationsEmpty
            color: Theme.subtext
            implicitSize: 72
        }

        BaseText {
            Layout.fillWidth: true
            text: "You don't have any notifications"
            font.pixelSize: 14
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            color: Theme.subtext
            elide: Text.Wrap
        }
    }

    NotificationList {
        id: list
        notifications: NotificationService.notifications
    }
}
