import Quickshell
import qs.config
import qs.bars
import qs.modules.audio
import qs.modules.picker
import qs.modules.notification
import qs.modules.powermenu
import qs.modules.audio
import qs.modules.pomodoro
import qs.modules.bluetooth
import qs.modules.date
import qs.modules.audio.player
import qs.modules.background

ShellRoot {
    Wallpaper {}

    Frame {
        id: frame
        top: 8
        left: 40
        bottom: 8
        right: 8
    }

    Notification {}
    NotificationDashboard {}
    PomodoroDashboard {}
    Osd {}
    BluetoothDashboard {}
    SoundDashboard {}
    Bars {}
    PlayerPanel {}

    AppPicker {}
    CommandPicker {}

    DatePanel {}
    DateDashboard {}
    PowerMenu {}
    // PlayerPanel {}
}
