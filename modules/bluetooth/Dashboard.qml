import QtQuick
import Quickshell.Bluetooth
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

        ColumnLayout {
            Layout.alignment: Qt.AlignTop
            Layout.fillWidth: true

            spacing: 8

            DashboardHeader {
                Layout.fillWidth: true
            }
        }

        Status.NoDevices {
            anchors.centerIn: parent
            visible: !BluetoothService.defaultAdapter.discovering && BluetoothService.devices.length == 0
        }

        Status.Searching {
            anchors.centerIn: parent
            visible: BluetoothService.defaultAdapter.discovering && BluetoothService.devices.length == 0
        }

        Item {
            visible: BluetoothService.devices.length > 0
            Layout.fillHeight: true
            Layout.fillWidth: true

            ColumnLayout {
                spacing: 16

                RowLayout {
                    BaseText {
                        text: "Devices"
                        color: Theme.text
                    }

                    Spinner {
                        running: BluetoothService.defaultAdapter.discovering
                        size: 10
                        text: "Scanning"
                    }
                }

                Repeater {
                    model: Bluetooth.devices

                    Device {
                        required property BluetoothDevice modelData
                        Layout.fillWidth: true
                        device: modelData
                    }
                }
            }
        }
    }
}
