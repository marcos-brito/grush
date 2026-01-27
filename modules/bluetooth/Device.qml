import Quickshell
import Quickshell.Bluetooth
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts
import qs.components
import qs.services
import qs.config

BaseButton {
    id: root
    required property BluetoothDevice device
    Layout.fillWidth: true

    RowLayout {
        spacing: 16

        ContextMenu {
            id: menu
            anchors.fill: parent
            anchor.item: root

            DeviceMenu {
                device: root.device
            }
        }

        IconifyIcon {
            id: fallback
            visible: false
            set: Icons.set
            icon: Icons.bluetooth
            color: Theme.text
            implicitSize: 28
        }

        IconImage {
            Layout.alignment: Qt.AlignVCenter
            source: Quickshell.iconPath(root.device.icon, true) || fallback.source
            implicitSize: 28
        }

        ColumnLayout {
            BaseText {
                text: root.device.name
                font.pixelSize: 14
            }
            DeviceState {
                device: root.device
            }
        }

        DeviceMenu {
            device: root.device
            Layout.alignment: Qt.AlignTop | Qt.AlignRight
        }
    }
}
