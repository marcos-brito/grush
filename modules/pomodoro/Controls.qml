import Quickshell.Widgets
import QtQuick.Layouts
import qs.components
import qs.services
import qs.config

RowLayout {
    spacing: 32

    BaseButton {
        onClicked: PomodoroService.restart()
        IconifyIcon {
            set: Icons.set
            icon: Icons.pomodoroReset
            implicitSize: 24
        }
    }

    BaseButton {
        onClicked: PomodoroService.running ? PomodoroService.stop() : PomodoroService.resume()
        IconifyIcon {
            set: Icons.set
            icon: PomodoroService.running ? Icons.pause : Icons.play
            implicitSize: 24
        }
    }

    BaseButton {
            onClicked: PomodoroService.nextPhase()
        IconifyIcon {
            set: Icons.set
            icon: Icons.next
            implicitSize: 24
        }
    }
}
