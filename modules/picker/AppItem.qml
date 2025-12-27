import QtQuick
import QtQuick.Layouts
import Quickshell.Widgets
import Quickshell
import qs.config
import qs.components
import qs.services

BaseItem {
    id: root
    required property DesktopEntry value

    onClicked: () => {
        value.execute();
        Panels.close("app-picker");
    }

    RowLayout {
        anchors.fill: parent
        spacing: 16

        IconImage {
            IconifyIcon {
                id: fallback
                visible: false
                icon: Icons.noIconApp
                implicitSize: 24
            }

            source: Quickshell.iconPath(root.value.icon, true) || fallback.source
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
                text: root.value.comment
                elide: Text.ElideRight
                color: Theme.subtext
                opacity: 0.7
            }
        }
    }
}
