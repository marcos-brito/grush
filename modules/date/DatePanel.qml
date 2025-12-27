import QtQuick
import QtQuick.Layouts
import Quickshell.Widgets
import qs.config
import qs.components

SuperPanel {
    name: "calendar"
    panelWidth: screen.width * 0.30
    panelHeight: screen.height * 0.50
    panelColor: Theme.base
    origin: SuperPanel.Origin.TopRight
    bottomLeftRadius: 8

    anchors {
        top: true
        right: true
    }

    margins {
        top: Props.topBarHeight
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
            Layout.fillWidth: true
        }
    }
}
