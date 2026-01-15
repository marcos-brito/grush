import QtQuick
import Quickshell.Bluetooth
import QtQuick.Layouts
import qs.components
import qs.services
import qs.config

SuperPanel {
    id: root

    name: "bluetooth-dashboard"
    panelWidth: screen.width * 0.25
    panelHeight: screen.height * 0.7
    origin: SuperPanel.Origin.Left
    topRightRadius: 8
    bottomRightRadius: 8

    anchors {
        left: true
    }

    margins {
        top: Props.topBarHeight
        left: Props.leftBarWidth
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 10
        visible: BluetoothService.defaultAdapter.enabled
        spacing: 16

        DashboardHeader {
            Layout.alignment: Qt.AlignTop
            Layout.fillWidth: true
        }

            BaseText {
                text: "Devices"
                color: Theme.text
            }
        Separator {
            Layout.fillWidth: true
        }

            Repeater {
                model: BluetoothService.devices
                delegate: Device {
                    required property BluetoothDevice modelData
                    device: modelData
                }
            }
        }
    }
}
