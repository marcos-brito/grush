import QtQuick.Layouts
import qs.components
import qs.config
import qs.services
import qs.services

SuperPanel {
    id: root

    name: "powermenu"
    panelWidth: screen.width * 0.10
    panelHeight: screen.height * 0.25
    panelColor: Theme.base
    origin: SuperPanel.Origin.Left
    topRightRadius: 8
    focusable: false

    anchors {
        left: true
        bottom: true
    }

    margins {
        left: Props.leftBarWidth
        bottom: Props.frameWidth
    }

    ColumnLayout {
        anchors.fill: parent
        spacing: 2

        MenuItem {
            size: 12
            text: "Shutdown"
            icon: Icons.shutdown
            onClicked: SystemService.shutdown()
        }

        MenuItem {
            size: 12
            text: "Reboot"
            icon: Icons.reboot
            onClicked: SystemService.reboot()
        }

        MenuItem {
            size: 12
            text: "Suspend"
            icon: Icons.suspend
            onClicked: SystemService.suspend()
        }

        MenuItem {
            size: 12
            text: "Lock"
            icon: Icons.lock
            onClicked: LockService.lock()
        }

        MenuItem {
            size: 12
            text: "Logout"
            icon: Icons.logout
            onClicked: Niri.quit()
        }
    }
}
