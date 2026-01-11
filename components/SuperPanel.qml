import QtQuick
import QtQuick.Effects
import Quickshell.Io
import qs.config
import qs.services

BasePanel {
    id: root
    default property alias content: edged.data
    property string panelColor: Theme.base
    property int panelWidth: screen.width * 0.25
    property int panelHeight: screen.height * 0.75
    property int origin: SuperPanel.Origin.Top
    property bool closeOnEsc: true
    property int radius
    property int topRightRadius
    property int topLeftRadius
    property int bottomRightRadius
    property int bottomLeftRadius

    MouseArea {
        anchors.fill: parent
        onClicked: Panels.close(root.name)
    }

    anchors {
        left: true
        right: true
        top: true
        bottom: true
    }

    Shortcut {
        sequences: ["Escape"]
        enabled: root.closeOnEsc
        onActivated: Panels.close(root.name)
        context: Qt.WindowShortcut
    }

    enum Origin {
        Top,
        TopLeft,
        TopRight,
        Bottom,
        BottomLeft,
        BottomRight,
        Right,
        Left,
        Center
    }

    function open(): void {
        visible = true;
        panel.slideIn();
    }

    function close(): void {
        panel.slideOut();
    }

    SlidingItem {
        id: panel
        origin: root.origin
        width: edged.width
        height: edged.height
        onSlideOutFinished: root.visible = false

        layer.enabled: true
        layer.effect: MultiEffect {
            shadowEnabled: true
            blurMax: 15
            shadowColor: Qt.alpha("#000", 0.7)
        }

        EdgedItem {
            id: edged
            contentWidth: root.panelWidth
            contentHeight: root.panelHeight
            origin: root.origin
            anchorLeft: root.anchors.left
            anchorRight: root.anchors.right
            anchorTop: root.anchors.top
            anchorBottom: root.anchors.bottom

            Rectangle {
                anchors.fill: parent
                color: root.panelColor
                radius: root.radius
                topRightRadius: root.topRightRadius
                topLeftRadius: root.topLeftRadius
                bottomLeftRadius: root.bottomLeftRadius
                bottomRightRadius: root.bottomRightRadius
            }
        }
    }
}
