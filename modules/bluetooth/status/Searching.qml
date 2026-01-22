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
            text: "Searching for devices"
            font.pixelSize: 14
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            color: Theme.subtext
            elide: Text.Wrap
        }

        Spinner {
            size: 24
            Layout.alignment: Qt.AlignHCenter
        }
    }
}
