import QtQuick
import Quickshell.Bluetooth
import Quickshell.Widgets
import QtQuick.Layouts
import qs.components
import qs.services
import qs.config

Item {
    ColumnLayout {
        anchors.fill: parent
        spacing: 8

        RowLayout {
            Layout.alignment: Qt.AlignTop

            BaseText {
                text: "Devices"
                color: Theme.text
            }

            Spinner {
                running: BluetoothService.defaultAdapter.discovering
                size: 10
                text: "Searching"
            }
        }

        Item {
            Layout.fillWidth: true
            Layout.fillHeight: true

            ColumnLayout {
                anchors.left: parent.left
                anchors.right: parent.right

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
