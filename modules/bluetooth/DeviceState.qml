import Quickshell.Bluetooth
import QtQuick.Layouts
import qs.components
import qs.config

RowLayout {
    id: root
    required property BluetoothDevice device

    BaseText {
        visible: root.device.state == BluetoothDeviceState.Connected
        text: "Connected"
        color: Theme.subtext
    }

    BaseText {
        visible: root.device.paired && !root.device.state
        text: "Paired"
        color: Theme.subtext
    }

    Spinner {
        display: "Connecting"
        spacing: 8
        visible: root.device.state == BluetoothDeviceState.Connecting
    }

    Spinner {
        display: "Disconnecting"
        visible: root.device.state == BluetoothDeviceState.Disconnecting
    }

    Spinner {
        display: "Pairing"
        visible: root.device.pairing

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

    component Spinner: RowLayout {
        id: root
        property string display
        spacing: 8

        BaseText {
            text: root.display
            color: Theme.subtext
        }

        BaseSpinner {
            size: 14
            running: true
        }
    }
}
