import QtQuick
import QtQuick.Layouts
import Quickshell.Widgets
import qs.components
import qs.services
import qs.config

SuperPanel {
    id: root

    name: "notification"
    panelColor: Theme.base
    panelWidth: screen.width * 0.25
    panelHeight: Math.min(list.contentHeight, screen.height * 0.4)
    origin: SuperPanel.Origin.TopRight
    bottomLeftRadius: 8
    closeOnEsc: false
    focusable: false

    Behavior on panelHeight {
        NumberAnimation {
            duration: 200
            easing.type: Easing.InOutQuad
        }
    }

    anchors {
        top: true
        right: true
    }

    margins {
        top: Props.topBarHeight
    }

    Connections {
        target: NotificationService
        onReceived: notification => {
            root.open();
            timer.restart();
        }
    }

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onEntered: timer.stop()
        onExited: timer.restart()
    }

    Timer {
        id: timer
        repeat: false
        interval: 5000
        onTriggered: {
            root.close();
            list.clear();
        }
    }

    NotificationList {
        id: list
    }
}
