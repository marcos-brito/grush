import Quickshell
import Quickshell.Bluetooth
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts
import qs.components
import qs.services
import qs.config

RowLayout {
    id: root
    required property BluetoothDevice device

    IconifyIcon {
        id: fallback
        Layout.alignment: Qt.AlignTop | Qt.AlignLeft
        visible: false
        set: Icons.set
        icon: Icons.bluetooth
        color: Theme.text
        implicitSize: 22
    }

    IconImage {
        Layout.alignment: Qt.AlignTop | Qt.AlignLeft
        source: Quickshell.iconPath(root.device.icon, true) || fallback
        implicitSize: 22
    }

    ColumnLayout {
        BaseText {
            text: root.device.name
            font.pixelSize: 14
            // text: "kd0-88"
        }
        DeviceState {
            device: root.device
        }
    }

    DeviceMenu {
        Layout.alignment: Qt.AlignTop | Qt.AlignRight
    }
}
