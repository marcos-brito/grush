import Quickshell
import qs.config

BaseText {
    property string format: "hh:mm"

    text: Qt.formatDateTime(clock.date, format)
    color: Theme.text

    SystemClock {
        id: clock
        precision: SystemClock.Seconds
    }
}
