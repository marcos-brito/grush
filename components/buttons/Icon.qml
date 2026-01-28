import qs.components
import qs.config

BaseButton {
    id: root

    required property string icon
    property int size: 16

    margin: 4

    IconifyIcon {
        color: Theme.subtext
        implicitSize: root.size
        icon: root.icon
    }
}
