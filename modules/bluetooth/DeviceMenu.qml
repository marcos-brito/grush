import Quickshell.Bluetooth
import qs.components
import qs.config
import Quickshell.Widgets

Menu {
    id: root
    required property BluetoothDevice device

    color: Theme.overlay

    MenuItem {
        text: "Connect"
        icon: "bluetooth-connected"
        onClicked: root.device.connect()
        hoverColor: Theme.base
        color: Theme.overlay
    }

    MenuItem {
        text: "Disconnect"
        icon: "bluetooth-off"
        onClicked: root.device.disconnect()
        hoverColor: Theme.base
        color: Theme.overlay
    }

    MenuItem {
        text: "Pair"
        icon: "link"
        onClicked: root.device.pair()
        hoverColor: Theme.base
        color: Theme.overlay
    }

    MenuItem {
        text: "Forget"
        icon: "x"
        onClicked: root.device.forget()
        hoverColor: Theme.base
        color: Theme.overlay
    }
}
