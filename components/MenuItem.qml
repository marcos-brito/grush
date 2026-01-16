import QtQuick
import QtQuick.Layouts
import qs.components
import qs.config

BaseButton {
    id: root
    property string text
    property string icon
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
            set: Icons.set
            icon: root.icon
            implicitSize: root.size
            color: Theme.text
        }

        BaseText {
            Layout.fillWidth: true
            horizontalAlignment: Text.AlignLeft
            visible: text
            text: root.text
            font.pixelSize: root.size
        }
    }
}
