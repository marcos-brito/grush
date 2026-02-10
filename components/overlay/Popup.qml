import Quickshell
import QtQuick
import Quickshell.Widgets
import QtQuick.Layouts
import QtQuick.Effects
import qs.config
import qs.components
import qs.components.window

BaseWindow {
    id: root

    default property alias data: slider.data
    property alias origin: slider.origin
    property alias anchor: popup.anchor
    name: "aaaa"

    MouseArea {
        anchors.fill: parent
        onClicked: root.close()
    }

    anchors {
        left: true
        right: true
        bottom: true
        top: true
    }

    PopupWindow {
        id: popup

        color: Theme.transparent
        width: slider.width
        height: slider.height

        SlidingItem {
            id: slider
            onSlideOutFinished: popup.visible = false
            origin: root.origin
        }
    }

    function open() {
        root.visible = true;
        popup.visible = true;
        slider.slideIn();
    }

    function close() {
        slider.slideOut();
        popup.visible = false;
        root.visible = false;
    }

    function toggle() {
        if (popup.visible)
            return close();

        open();
    }
}
