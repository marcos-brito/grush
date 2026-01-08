import Quickshell
import qs.config
import qs.modules.bar
import qs.modules.audio
import qs.modules.picker
import qs.modules.notification
import qs.modules.powermenu
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
    Osd {}
    LeftBar {}
    AppPicker {}
    CommandPicker {}
}
