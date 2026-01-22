import Quickshell.Bluetooth
import QtQuick.Layouts
import qs.components
import qs.services
import qs.config

ColumnLayout {
    id: root
    spacing: 16

    property BluetoothAdapter adapter: BluetoothService.defaultAdapter

    IconifyIcon {
        Layout.alignment: Qt.AlignHCenter
        set: Icons.set
        icon: Icons.bluetoothDisabled
        color: Theme.subtext
        implicitSize: 72
    }

    BaseText {
        Layout.alignment: Qt.AlignHCenter
        text: "Bluetooth is disabled"
        font.pixelSize: 14
        color: Theme.subtext
    }

    BaseButton {
        Layout.alignment: Qt.AlignHCenter
        color: Theme.highlight
        onClicked: root.adapter.enabled = true

        BaseText {
            text: "Enable"
            color: Theme.base
        }
    }
}
