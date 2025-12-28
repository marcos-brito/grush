import Quickshell
import Quickshell.Widgets
import QtQuick.Layouts
import QtQuick.Effects
import qs.config
import qs.components

PopupWindow {
    id: root
    default property alias data: wrapper.data
    property int origin: SuperPanel.Origin.TopLeft

    color: Theme.transparent
    width: wrapper.width
    height: wrapper.height

    SlidingItem {
        id: slider
        onSlideOutFinished: root.visible = false
        anchors.fill: parent
        origin: root.origin

        WrapperRectangle {
            id: wrapper
            color: Theme.overlay
            radius: 8
            margin: 6
        }
    }

    function open() {
        root.visible = true;
        slider.slideIn();
    }

    function close() {
        slider.slideOut();
    }

    function toggle() {
        if (root.visible)
            return close();

        open();
    }
}
