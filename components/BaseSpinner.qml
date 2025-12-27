import QtQuick
import qs.config

Item {
    id: root
    property color indicatorColor: Theme.text
    property bool running: true
    property int size: 48
    property int segments: 36          
    property real fadeFraction: 2    

    width: size
    height: size
    visible: running

    Canvas {
        id: spinner
        anchors.fill: parent
        onPaint: {
            var ctx = getContext("2d")
            ctx.reset()
            var r = width / 2
            var lineWidth = width / 8
            ctx.lineWidth = lineWidth
            ctx.lineCap = "round"

            let step = (2 * Math.PI) / root.segments
            let fadeSteps = Math.floor(root.segments * root.fadeFraction)

            for (let i = 0; i < root.segments; i++) {
                let opacity = 1.0
                if (i >= root.segments - fadeSteps) {
                    opacity = 1.0 - ((i - (root.segments - fadeSteps)) / fadeSteps)
                }

                ctx.strokeStyle = Qt.rgba(
                    root.indicatorColor.r,
                    root.indicatorColor.g,
                    root.indicatorColor.b,
                    opacity
                )

                ctx.beginPath()
                ctx.arc(r, r, r - lineWidth,
                        i * step, (i + 1) * step, false)
                ctx.stroke()
            }
        }

        RotationAnimator on rotation {
            running: root.running
            from: 0
            to: 360
            loops: Animation.Infinite
            duration: 900
        }
    }
}

