import QtQuick
import QtQuick.Layouts
import qs.components
import qs.services
import qs.config

SuperPanel {
    id: root

    name: "pomodoro-dashboard"
    panelWidth: screen.width * 0.25
    panelHeight: screen.height * 0.4
    panelColor: Theme.base
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
        spacing: 32
        anchors.centerIn: parent

        Modes {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
        }

        BaseText {
            id: timer
            Layout.alignment: Qt.AlignHCenter
            text: PomodoroService.formated
            font.pixelSize: 48

        }

        BaseSlider {
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredHeight: 20
            Layout.fillWidth: true
            color: Theme.highlight
            from: 0
            value: PomodoroService.remainingTime
            to: {
                if (PomodoroService.currentPhase == PomodoroService.Phase.ShortBreak) {
                    return PomodoroService.shortBreakDuration;
                }

                if (PomodoroService.currentPhase == PomodoroService.Phase.LongBreak) {
                    return PomodoroService.longBreakDuration;
                }

                return PomodoroService.workDuration;
            }
        }

        Controls {
            Layout.alignment: Qt.AlignHCenter
        }
    }
}
