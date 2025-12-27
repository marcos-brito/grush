import Quickshell.Widgets
import QtQuick
import qs.config
import qs.components

SuperPanel {
    name: "player"
    panelWidth: screen.width * 0.3
    panelHeight: screen.height * 0.4
    panelColor: Theme.base
    origin: SuperPanel.Origin.Top
    bottomRightRadius: 8

    anchors {
        top: true
    }

    margins {
        top: Props.topBarHeight
        left: screen.width * 0.1
    }

    Player {
        anchors.fill: parent
        anchors.margins: 16
    }
}
