import Quickshell.Widgets
import qs.components
import qs.services
import qs.config

Widget {
    id: root
    panel: "pomodoro-dashboard"
    tooltip: "Timer"

    IconifyIcon {
        icon: Icons.pomodoroDashboard
        implicitSize: 15
        color: root.textColor
    }
}
