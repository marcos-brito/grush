import QtQuick
import QtQuick.Layouts
import qs.components
import qs.config

BaseButton {
    id: root
    property string text
    property string icon
    property int size: 14
    color: Theme.overlay
    hoverColor: Theme.base

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
