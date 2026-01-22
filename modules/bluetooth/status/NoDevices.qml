import Quickshell.Bluetooth
import Quickshell.Widgets
import QtQuick.Layouts
import qs.components
import qs.services
import qs.config

WrapperItem {
    property BluetoothAdapter adapter: BluetoothService.defaultAdapter

    ColumnLayout {
        spacing: 16

        IconifyIcon {
            Layout.alignment: Qt.AlignHCenter
            set: Icons.set
            icon: Icons.bluetoothSearching
            color: Theme.subtext
            implicitSize: 72
        }

        BaseText {
            Layout.alignment: Qt.AlignHCenter
            text: "No devices found"
            font.pixelSize: 14
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            color: Theme.subtext
            elide: Text.Wrap
        }

        BaseButton {
            Layout.alignment: Qt.AlignHCenter
            color: Theme.highlight
            onClicked: adapter.discovering = true

            BaseText {
                text: "Search"
                color: Theme.base
            }
        }
    }
}
