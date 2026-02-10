import QtQuick
import QtQuick.Layouts
import Quickshell.Widgets
import qs.config
import qs.components
import qs.components.overlay

Panel {
    name: "date-dashboard"
    origin: Positioning.Origin.Left

    ColumnLayout {
        anchors.margins: 16
        anchors.fill: parent
        spacing: 16

        RowLayout {
            Summary {}

            Time {
                format: "hh:mm:ss"
                font.pixelSize: 16
                Layout.fillWidth: true
                horizontalAlignment: Text.AlignRight
            }
        }

        Separator {
            Layout.fillWidth: true
        }

        Calendar {}

        Separator {
            Layout.fillWidth: true
        }
    }
}
