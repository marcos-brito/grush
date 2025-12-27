import QtQuick
import QtQuick.Layouts
import Quickshell.Widgets
import qs.config
import qs.components

SuperPanel {
    name: "date-dashboard"
    panelWidth: screen.width * 0.30
    panelHeight: screen.height * 0.70
    panelColor: Theme.base
    origin: SuperPanel.Origin.Left
    bottomRightRadius: 8
    topRightRadius: 8

    anchors {
        left: true
    }

    margins {
        left: 40
    }

    ColumnLayout {
        anchors.margins: 16
        anchors.fill: parent
        spacing: 16

        Time {
            Layout.fillWidth: true
            format: "hh:mm:ss"
            color: Theme.highlight
            font.pixelSize: 28
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
        }

        Calendar {
        }
    }
}
