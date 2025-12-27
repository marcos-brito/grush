import Quickshell.Widgets
import QtQuick.Layouts
import qs.components
import qs.services
import qs.config

RowLayout {
    spacing: 32

    Mode {
        mode: "Working"
        onClicked: PomodoroService.startWork()
        active: PomodoroService.currentPhase == PomodoroService.Phase.Work || PomodoroService.currentPhase == PomodoroService.Phase.Idle
    }

    Mode {
        mode: "Short break"
        onClicked: PomodoroService.startShortBreak()
        active: PomodoroService.currentPhase == PomodoroService.Phase.ShortBreak
    }

    Mode {
        mode: "Long break"
        onClicked: PomodoroService.startLongBreak()
        active: PomodoroService.currentPhase == PomodoroService.Phase.LongBreak
    }

    component Mode: WrapperMouseArea {
        id: root

        property string mode
        property bool active

        hoverEnabled: true
        onEntered: text.color = Theme.base0D
        onExited: text.color = root.active ? Theme.base0B : Theme.base05

        BaseText {
            id: text
            color: root.active ? Theme.base0B : Theme.base05
            font.pixelSize: 14
            text: root.mode
        }
    }
}
