import QtQuick.Layouts
import qs.config
import qs.components
import qs.services

BaseItem {
    id: root
    required property var value

    onClicked: () => {
        value.action();
        Panels.close("command-picker");
    }

    RowLayout {
        anchors.fill: parent
        spacing: 16

        IconifyIcon {
            set: Icons.set
            icon: root.value.icon
            color: Theme.text
            implicitSize: 24
        }

        ColumnLayout {
            BaseText {
                text: root.value.name
                color: Theme.text
                font.pixelSize: 14
            }

            BaseText {
                Layout.fillWidth: true
                text: root.value.desc
                color: Theme.subtext
                opacity: 0.7
            }
        }
    }
}
