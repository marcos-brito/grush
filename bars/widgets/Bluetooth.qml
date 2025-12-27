import qs.components
import qs.config

Widget {
    id: root
    panel: "bluetooth-dashboard"

    IconifyIcon {
        set: Icons.set
        icon: Icons.bluetooth
        color: root.textColor
        implicitSize: 15
    }
}
