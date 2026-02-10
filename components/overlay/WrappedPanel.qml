import QtQuick
import QtQuick.Effects
import qs.config
import qs.components.window

BaseWindow{
    id: root

    default property alias data: content.data
    property alias origin: content.origin
    property alias panelColor: content.panelColor
    property alias panelWidth: content.panelWidth
    property alias panelHeight: content.panelHeight

    width: content.implicitWidth
    height: content.implicitHeight

    function open(): void {
        root.visible = true;
        content.slideIn();
    }

    function close(): void {
        content.slideOut();
    }

    margins {
        left: Positioning.anchorLeft(root.origin) ? 8 : 0
        right: Positioning.anchorRight(root.origin) ? 8 : 0
        top: Positioning.anchorTop(root.origin) ? 8 : 0
        bottom: Positioning.anchorBottom(root.origin) ? 8 : 0
    }

    anchors {
        left: Positioning.anchorLeft(root.origin)
        right: Positioning.anchorRight(root.origin)
        top: Positioning.anchorTop(root.origin)
        bottom: Positioning.anchorBottom(root.origin)
    }

    PanelContent {
        id: content
        onSlideOutFinished: root.visible = false
    }
}

