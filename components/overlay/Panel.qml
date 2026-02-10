import QtQuick
import QtQuick.Effects
import qs.config
import qs.components.window
import qs.services

BaseWindow {
    id: root

    default property alias data: content.data
    property alias origin: content.origin
    property alias panelColor: content.panelColor
    property alias panelWidth: content.panelWidth
    property alias panelHeight: content.panelHeight

    MouseArea {
        acceptedButtons: Qt.AllButtons
        anchors.fill: parent
        onPressed: Panels.close(root.name)
    }

    margins {
        left: 40
        right: 8
        top: 8
        bottom: 8
    }

    anchors {
        left: true
        right: true
        top: true
        bottom: true
    }

    function open(): void {
        root.visible = true;
        content.slideIn()
    }

    function close(): void {
        content.slideOut()
    }

    PanelContent {
        id: content
        onSlideOutFinished: root.visible = false
    }
}

