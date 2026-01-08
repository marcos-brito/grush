import qs.components
import qs.config
import qs.modules.bluetooth

Widget {
    id: root
    panel: "bluetooth-dashboard"
    tooltip: "Bluetooth"

    Dashboard {}
    IconifyIcon {
        set: Icons.set
        icon: Icons.bluetooth
        color: root.textColor
        implicitSize: 15
    }
}
