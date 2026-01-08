import qs.components
import qs.config
import qs.modules.pomodoro

Widget {
    id: root
    panel: "pomodoro-dashboard"
    tooltip: "Timer"

    Dashboard {}

    IconifyIcon {
        icon: Icons.pomodoroDashboard
        implicitSize: 15
        color: root.textColor
    }
}
