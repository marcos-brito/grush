import Quickshell
import Quickshell.Bluetooth
import QtQuick.Layouts
import qs.components
import qs.config

BaseButton {
    id: root
    required property BluetoothDevice device

    onClicked: menu.visible ? menu.close() : menu.open()
    margin: 4

    IconifyIcon {
        Layout.alignment: Qt.AlignTop | Qt.AlignRight
        set: Icons.set
        icon: Icons.menu
        color: Theme.text
        implicitSize: 18
    }

    Menu {
        id: menu
        anchor.item: root
        anchor.margins.left: 20
        anchor.margins.top: 20

        MenuItem {
            text: "Connect"
            icon: "bluetooth-connected"
            onClicked: root.device.connect()
        }

        MenuItem {
            text: "Disconnect"
            icon: "bluetooth-off"
            onClicked: root.device.disconnect()
        }

        MenuItem {
            text: "Pair"
            icon: "link"
            onClicked: root.device.pair()
        }

        MenuItem {
            text: "Forget"
            icon: "x"
            onClicked: root.device.forget()
        }

    }
}
