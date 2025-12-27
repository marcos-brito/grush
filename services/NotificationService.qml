pragma Singleton

import Quickshell
import Quickshell.Io
import Quickshell.Services.Notifications
import Quickshell.Services.Pipewire
import qs.config

Singleton {
    id: root
    property list<Notification> notifications: NotificationServer.trackedNotifications
    property int volume: 50

    signal received(Notification notification)

    property NotificationServer server: NotificationServer {
        id: notificationServer

        imageSupported: true
        actionsSupported: true
        actionIconsSupported: true
        inlineReplySupported: true
        bodySupported: true
        bodyMarkupSupported: true
        bodyImagesSupported: true
        bodyHyperlinksSupported: true
        keepOnReload: false

        onNotification: notification => {
            notification.tracked = true;
            root.received(notification);
            root.notifications.push(notification);
        }
    }

    Process {
        id: mpvProc
        running: false
        command: ["pw-play", Theme.notificationSound]
    }

    Process {
        id: notifySendProc
        property string summary
        property string body

        running: false
        command: ["notify-send", summary, body, "-a", "quickshell"]
    }

    function playSound() {
        mpvProc.running = true;
    }

    function send(summary: string, body: string): void {
        notifySendProc.summary = summary;
        notifySendProc.body = body;
        notifySendProc.running = true;
    }
}
