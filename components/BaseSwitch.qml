import QtQuick
import QtQuick.Controls
import qs.config

Switch {
    id: control

    property real size: 26 

    readonly property real trackHeight: size
    readonly property real trackWidth: size * 1.85
    readonly property real thumbSize: size * 0.77
    readonly property real margin: size * 0.115
    readonly property real trackRadius: size * 0.3
    readonly property real thumbRadius: size * 0.23
    readonly property int animationDuration: 150

    text: ""

    indicator: Rectangle {
        implicitWidth: control.trackWidth
        implicitHeight: control.trackHeight

        x: control.leftPadding
        y: parent.height / 2 - height / 2

        radius: control.trackRadius
        color: Theme.overlay
        border.color: Theme.transparent

        Rectangle {
            id: thumb

            width: control.thumbSize
            height: control.thumbSize
            radius: control.thumbRadius

            x: control.checked
                ? parent.width - width - control.margin
                : control.margin

            y: (parent.height - height) / 2

            color: control.checked ? Theme.highlight : Theme.base
            border.color: Theme.transparent

            Behavior on x {
                NumberAnimation {
                    duration: control.animationDuration
                }
            }

            Behavior on color {
                ColorAnimation {
                    duration: control.animationDuration
                }
            }
        }
    }

    contentItem: BaseText {
        text: control.text
        font: control.font
        verticalAlignment: Text.AlignVCenter
        leftPadding: control.indicator.width + control.spacing
    }
}

