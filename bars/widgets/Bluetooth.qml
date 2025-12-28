import qs.components
import qs.config

Widget {
    id: root
    panel: "bluetooth-dashboard"
    tooltip: "Bluetooth"

    IconifyIcon {
        set: Icons.set
        icon: Icons.bluetooth
        color: root.textColor
        implicitSize: 15
    }
}
