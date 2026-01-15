import QtQuick.Layouts
import Quickshell.Widgets
import Quickshell.Bluetooth
import qs.components
import qs.services
import qs.config

WrapperItem {
    id: root

    property BluetoothAdapter adapter: BluetoothService.defaultAdapter

    RowLayout {
        BaseText {
            text: "Bluetooth"
            font.pixelSize: 18
            Layout.fillWidth: true
        }

        RowLayout {
            BaseSwitch {
                Layout.alignment: Qt.AlignHCenter
                checked: root.adapter.enabled
                onClicked: root.adapter.enabled = !root.adapter.enabled
                size: 14
            }

            BaseButton {
                tooltip: root.adapter.discovering ? "Stop searching for devices" : "Search for devices"
                onClicked: root.adapter.discovering = !root.adapter.discovering
                margin: 4

                IconifyIcon {
                    icon: root.adapter.discovering ? Icons.bluetoothSearchStop : Icons.bluetoothSearch
                    color: Theme.subtext
                    implicitSize: 18
                }
            }

            BaseButton {
                tooltip: root.adapter.discoverable ? "Hide this device from other devices" : "Make this device visible to other devices"
                onClicked: root.adapter.discoverable = !root.adapter.discoverable
                margin: 4

                IconifyIcon {
                    icon: root.adapter.discoverable ? Icons.bluetoothInvisible : Icons.bluetoothVisible
                    color: Theme.subtext
                    implicitSize: 18
                }
            }
        }
    }
}
