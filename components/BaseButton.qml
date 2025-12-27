import QtQuick
import Quickshell.Widgets
import qs.config

WrapperMouseArea {
    id: root
    default property alias data: trigger.data
    property int margin: 8
    property int radius: 8
    property string color: Theme.base
    property string hoverColor: Theme.overlay

    hoverEnabled: true
    onEntered: trigger.color = hoverColor
    onExited: trigger.color = color

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
