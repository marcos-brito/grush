import Quickshell.Widgets
import qs.components
import qs.services
import qs.config

Widget {
    panel: "powermenu"
    tooltip: "Power"

    IconifyIcon {
        icon: Icons.shutdown
        color: Theme.critical
        implicitSize: 15
    }
}
