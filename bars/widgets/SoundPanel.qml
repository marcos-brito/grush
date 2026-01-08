import QtQuick.Layouts
import qs.components
import qs.config
import qs.modules.audio

Widget {
    id: root
    panel: "sound-dashboard"
    tooltip: "Volume"

    Dashboard {}

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
