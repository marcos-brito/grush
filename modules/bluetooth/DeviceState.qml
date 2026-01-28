import Quickshell.Bluetooth
import QtQuick.Layouts
import qs.components
import qs.config

RowLayout {
    id: root
    required property BluetoothDevice device
    visible: device.paired || device.state

    property string battery: device.battery ? `- ${device.battery * 100}%` : ""

    BaseText {
        visible: root.device.state == BluetoothDeviceState.Connected && !root.device.pairing
        text: `Connected ${battery}`
        color: Theme.subtext
    }

    BaseText {
        visible: root.device.paired && !root.device.state
        text: "Paired"
        color: Theme.subtext
    }

    Spinner {
        text: "Connecting"
        spacing: 8
        size: 12
        running: root.device.state == BluetoothDeviceState.Connecting
    }

    Spinner {
        text: "Disconnecting"
        size: 12
        running: root.device.state == BluetoothDeviceState.Disconnecting
    }

    Spinner {
        text: "Pairing"
        running: root.device.pairing
        size: 12

        BaseButton {
            onClicked: root.device.cancelPair()
            margin: 4

            IconifyIcon {
                set: Icons.set
                icon: "x"
                color: Theme.subtext
                implicitSize: 12
            }
        }
    }
}
