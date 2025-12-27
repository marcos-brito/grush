import Quickshell
import QtQuick
import QtQuick.Effects
import QtQuick.Layouts
import qs.config
import qs.bars.widgets
import qs.bars.widgets.workspaces

PanelWindow {
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
            anchors.fill: parent
            anchors.topMargin: 16
            anchors.bottomMargin: 16

            Column {
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignTop
                spacing: Props.widgetSpacing

                ColumnLayout {
                    anchors.horizontalCenter: parent.horizontalCenter

                    Workspaces {}
                }
            }

            Column {
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.alignment: Qt.AlignVCenter

                ColumnLayout {
                    anchors.centerIn: parent

                    FocusedWindow {}
                }
            }

            Column {
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignBottom

                ColumnLayout {
                    anchors.horizontalCenter: parent.horizontalCenter
                    spacing: 16

                    Clock {}

                    ColumnLayout {
                        spacing: 4

                        Bluetooth {}
                        Notifications {}
                        SoundPanel {}
                        Pomodoro {}
                    }

                    PowerMenu {}
                }
            }
        }
    }
}
