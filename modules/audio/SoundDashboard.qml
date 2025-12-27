import QtQuick
import QtQuick.Layouts
import qs.components
import qs.modules.audio.mixer
import qs.modules.audio.player
import qs.config

SuperPanel {
    id: root

    name: "sound-dashboard"
   panelWidth: screen.width * 0.4
    panelHeight: screen.height * 0.7
    panelColor: Theme.base
    origin: SuperPanel.Origin.Left
    topRightRadius: 8
    bottomRightRadius: 8

    anchors {
        left: true
    }

    margins {
        left: Props.leftBarWidth
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 16
        spacing: 32

        Player {}
        SinkList {}
    }
}
