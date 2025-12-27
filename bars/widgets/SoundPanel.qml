import QtQuick.Layouts
import qs.components
import qs.config

Widget {
    id: root
    panel: "sound-dashboard"

    ColumnLayout {
        anchors.centerIn: parent
        spacing: 8

        IconifyIcon {
            icon: Icons.soundPanel
            implicitSize: 15
            color: root.textColor
        }

        ColumnLayout {

            BaseText {
                text: "00"
                color: root.textColor
            }

        }
    }
}
