pragma Singleton
pragma ComponentBehavior: Bound

import Quickshell
import QtQuick

Singleton {
    id: root
    property int workDuration: 40 * 60
    property int shortBreakDuration: 7 * 60
    property int longBreakDuration: 20 * 60
    property int cyclesBeforeLongBreak: 4
    property int remainingTime: workDuration
    property int completedCycles: 0
    property int currentPhase: PomodoroService.Phase.Work
    property bool running: false
    property string formated: format()

    signal phaseChanged(int phase)
    signal tick(int remainingTime)
    signal pomodoroComplete(int cycles)

    enum Phase {
        Work,
        ShortBreak,
        LongBreak
    }

    function format() {
        const minutes = Math.floor(root.remainingTime / 60);
        const seconds = root.remainingTime % 60;

        return `${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')}`;
    }

    onRemainingTimeChanged: {
        root.formated = format();
    }

    Timer {
        id: timer
        interval: 1000
        repeat: true
        running: root.running
        onTriggered: {
            if (root.remainingTime > 0) {
                root.remainingTime -= 1;
                root.tick(root.remainingTime);
                return;
            }

            root.nextPhase();
        }
    }

    function startWork() {
        root.currentPhase = PomodoroService.Phase.Work;
        root.remainingTime = root.workDuration;
        root.running = true;
        root.phaseChanged(root.currentPhase);

        NotificationService.send("Starting some work!", `Focus for ${root.formated} minutes`);
    }

    function startShortBreak() {
        root.currentPhase = PomodoroService.Phase.ShortBreak;
        root.remainingTime = root.shortBreakDuration;
        root.running = true;
        root.phaseChanged(root.currentPhase);

        NotificationService.send("Break time!", `Back to it in ${root.formated} minutes`);
    }

    function startLongBreak() {
        root.currentPhase = PomodoroService.Phase.LongBreak;
        root.remainingTime = root.longBreakDuration;
        root.running = true;
        root.phaseChanged(root.currentPhase);

        NotificationService.send("Break time, but long!", `Rest for ${root.formated} minutes`);
    }

    function currentPhaseDuration() {
        switch (root.currentPhase) {
        case PomodoroService.Phase.Work:
            return root.workDuration;
        case PomodoroService.Phase.ShortBreak:
            return root.shortBreakDuration;
        case PomodoroService.Phase.LongBreak:
            return root.longBreakDuration;
        }
    }

    function resume() {
        timer.start();
        root.running = true;
    }

    function restart() {
        root.remainingTime = currentPhaseDuration();
        root.running = false;
    }

    function stop() {
        root.running = false;
        timer.stop();
    }

    function nextPhase() {
        if (root.currentPhase === PomodoroService.Phase.Work) {
            root.completedCycles++;
            root.pomodoroComplete(root.completedCycles);

            if (root.completedCycles % root.cyclesBeforeLongBreak === 0) {
                root.startLongBreak();
                return;
            }

            root.startShortBreak();
            return;
        }

        root.startWork();
    }
}
