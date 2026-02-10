import QtQuick
import QtQuick.Effects
import Quickshell
import Quickshell.Widgets
import qs.components
import qs.config
import QtQuick
import qs.components
import qs.config

PopupWindow {
    id: root

    property string text
    property alias origin: slider.origin

    visible: false
    color: Theme.transparent
    width: slider.width
    height: slider.height

    function show() {
        if (!root.visible)
            timer.restart();
    }

    function hide() {
        timer.stop();
        if (root.visible)
            slider.slideOut();
    }

    Timer {
        id: timer
        interval: 400
        running: false
        repeat: false
        onTriggered: {
            root.visible = true;
            slider.slideIn();
        }
    }

    SlidingItem {
        id: slider
        onSlideOutFinished: root.visible = false
        origin: root.origin

        WrapperRectangle {
            id: wrapper
            color: Theme.overlay
            radius: 8
            margin: 6

            BaseText {
                text: root.text
            }
        }
    }
}
