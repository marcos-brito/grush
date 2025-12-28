import QtQuick
import Quickshell.Widgets
import qs.config

WrapperMouseArea {
    id: root
    default property alias data: trigger.data
    property int margin: 8
    property int radius: 8
    property string color: Theme.base
    property string hoverColor: Theme.accent
    property string tooltip: ""

    hoverEnabled: true

    onEntered: {
        trigger.color = hoverColor;

        if (tooltip)
            tip.show();
    }
    onExited: {
        trigger.color = color;

        if (tooltip)
            tip.hide();
    }

    Tooltip {
        id: tip
        origin: SuperPanel.Origin.BottomLeft
        anchor.item: root
        anchor.margins.left: 20
        anchor.margins.top: -20

        text: root.tooltip
    }

    WrapperRectangle {
        id: trigger
        color: root.color
        margin: root.margin
        radius: root.radius

        Behavior on color {
            ColorAnimation {
                duration: 200
            }
        }
    }
}
