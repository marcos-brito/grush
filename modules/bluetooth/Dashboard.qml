import QtQuick
import Quickshell.Bluetooth
import Quickshell.Widgets
import QtQuick.Layouts
import qs.components
import qs.services
import qs.config
import qs.modules.bluetooth.status as Status

SuperPanel {
    id: root
    name: "bluetooth-dashboard"
    origin: SuperPanel.Origin.Left

    Status.Disabled {
        anchors.centerIn: parent
        visible: !BluetoothService.defaultAdapter.enabled
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 10
        visible: BluetoothService.defaultAdapter.enabled
        spacing: 16

        DashboardHeader {
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignTop
        }

        Status.NoDevices {
            anchors.centerIn: parent
            visible: !BluetoothService.defaultAdapter.discovering && BluetoothService.devices.length == 0
        }

        Status.Searching {
            anchors.centerIn: parent
            visible: BluetoothService.defaultAdapter.discovering && BluetoothService.devices.length == 0
        }

        DeviceList {
            Layout.fillHeight: true
            Layout.fillWidth: true
            visible: BluetoothService.devices.length > 0
        }
    }
}
