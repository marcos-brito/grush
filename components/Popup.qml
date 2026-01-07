import Quickshell
import QtQuick
import Quickshell.Widgets
import QtQuick.Layouts
import QtQuick.Effects
import qs.config
import qs.components

BasePanel {
    id: root
    name: "popup"

    default property alias data: wrapper.data
    property alias anchor: popup.anchor
    property int origin: SuperPanel.Origin.Left

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
        width: wrapper.width
        height: wrapper.height

        SlidingItem {
            id: slider
            onSlideOutFinished: popup.visible = false
            anchors.fill: parent
            origin: root.origin

            WrapperRectangle {
                id: wrapper
                color: Theme.overlay
                radius: 8
                margin: 6
            }
        }
    }

    function open() {
        root.visible = true
        popup.visible = true;
        slider.slideIn();
    }

    function close() {
        slider.slideOut();
        popup.visible = true;
        root.visible = false
    }

    function toggle() {
        if (popup.visible)
            return close();

        open();
    }
}
