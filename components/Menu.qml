import Quickshell
import Quickshell.Widgets
import QtQuick.Layouts
import QtQuick.Effects
import qs.config
import qs.components

PopupWindow {
    id: root
    default property alias data: items.data
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
            color: Theme.base
            radius: 8
            margin: 4

            layer.enabled: true
            layer.effect: MultiEffect {
                shadowEnabled: true
                blurMax: 15
                shadowColor: Qt.alpha("#000", 0.7)
            }

            ColumnLayout {
                id: items
            }
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
        if (visible)
            return close();
        open();
    }
}
