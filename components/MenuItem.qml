import QtQuick
import QtQuick.Layouts
import qs.components
import qs.config

BaseButton {
    id: root
    property string text
    property string icon
    property string text: ""
    property string icon: Icons.menuFallbackIcon
    property string systemIcon
    property int size: 13
    color: Theme.base
    hoverColor: Theme.overlay
    margin: 2
    radius: 4

    Layout.fillWidth: true

    RowLayout {
        spacing: 8

        IconifyIcon {
            visible: icon
            icon: root.icon 
            systemIcon: root.systemIcon
            implicitSize: root.size
            color: Theme.text
        }

        BaseText {
            visible: root.text.length > 0
            Layout.fillWidth: true
            horizontalAlignment: Text.AlignLeft
            text: root.text
            font.pixelSize: root.size
        }
    }
}
