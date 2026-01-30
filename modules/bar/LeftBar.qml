import Quickshell
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts
import qs.config
import qs.modules.bar.widgets as Widgets

PanelWindow {
    id: root
    width: 42
    color: Theme.transparent

    anchors {
        left: true
        top: true
        bottom: true
    }

    Rectangle {
        anchors.fill: parent

        color: Theme.base

        ColumnLayout {
            anchors.topMargin: 8
            anchors.bottomMargin: 8
            anchors.fill: parent

            Widgets.Workspaces {
                Layout.alignment: Qt.AlignTop | Qt.AlignHCenter
            }

            Widgets.Window {
                Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
            }

            ColumnLayout {
                Layout.alignment: Qt.AlignBottom | Qt.AlignHCenter
                spacing: 32

                Widgets.Clock {}

                ColumnLayout {
                    Widgets.Bluetooth {}
                    Widgets.Notifications {}
                    Widgets.Sound {}
                }
            }

            Widgets.Power {
                Layout.alignment: Qt.AlignBottom | Qt.AlignHCenter
            }
        }
    }
}
