import QtQuick
import Quickshell
import Quickshell.Widgets
import QtQuick.Effects
import qs.config

PopupWindow {
    id: root

    default property alias data: content.data
    property alias origin: slider.origin
    property bool hovering: false

    visible: false
    color: Theme.transparent
    width: slider.width
    height: slider.height

    function open() {
        root.visible = true;
        slider.slideIn();
    }

    function close() {
        timer.running = true;
    }

    Timer {
        id: timer
        repeat: false
        interval: 250
        onTriggered: {
            if (root.visible && !root.hovering)
                slider.slideOut();
        }
    }

    WrapperMouseArea {
        id: mouseArea
        hoverEnabled: true
        onEntered: root.hovering = true
        onExited: {
            root.hovering = false

            if (root.visible)
                slider.slideOut();
        }

        SlidingItem {
            id: slider
            anchors.centerIn: parent
            onSlideOutFinished: root.visible = false
            origin: SuperPanel.Origin.Left

            EdgedItem {
                origin: root.origin

                WrapperRectangle {
                    id: content
                    color: Theme.base
                    margin: 6
                    implicitWidth: screen.width * 0.1
                }
            }
        }
    }
}
