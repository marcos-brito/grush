pragma Singleton

import Quickshell
import Quickshell.Io
import qs.modules.lock

Singleton {
    id: root
    property string userName
    property string uptime


    function reboot() {
        rebootProc.running = true
    }

    function shutdown() {
        shutdownProc.running = true
    }

    function suspend() {
        suspendProc.running = true
    }

    Process {
        id: shutdownProc
        running: false
        command: ["shutdown", "now"]
    }

    Process {
        id: rebootProc
        running: false
        command: ["reboot"]
    }

    Process {
        id: suspendProc
        running: false
        command: ["systemctl suspend"]
    }

    Process {
        running: true
        command: ["whoami"]
        stdout: StdioCollector {
            onStreamFinished: root.userName = text
        }
    }

    Process {
        running: true
        command: ["awk", "\"{printf \"%dh %dm\n\", $1/3600, ($1%3600)/60}\"", "/proc/uptime" ]
        stdout: StdioCollector {
            onStreamFinished: root.uptime = text
        }
    }
}
