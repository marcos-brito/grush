pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Controls
import qs.config


ApplicationWindow {
    width: 600
    height: 300
    title: "Rectangular Corner Border Progress"

    Rectangle {
        id: container
        width: 400
        height: 200
        anchors.centerIn: parent
        color: "transparent"

        property string filledColor: Theme.base08
        property string unfilledColor: Theme.base02
        property real progress: 0.6
        property int segments: 60
        property real radius: 40
        property real borderWidth: 2
        property real segmentWidth: 12
        property real segmentHeight: 14

        Canvas {
            id: canvas
            anchors.fill: parent

            function getSegmentPosition(segmentIndex) {
                var w = width;
                var h = height;
                var r = container.radius;

                // Edge lengths
                var topLen = w - 2 * r;
                var rightLen = h - 2 * r;
                var bottomLen = w - 2 * r;
                var leftLen = h - 2 * r;

                // Corner arc lengths
                var arcLen = Math.PI / 2 * r;

                // Cumulative lengths along the perimeter
                var cumulative = [topLen                          // top edge
                    , topLen + arcLen                 // top-right corner
                    , topLen + arcLen + rightLen      // right edge
                    , topLen + 2 * arcLen + rightLen  // bottom-right corner
                    , topLen + 2 * arcLen + rightLen + bottomLen  // bottom edge
                    , topLen + 3 * arcLen + rightLen + bottomLen  // bottom-left corner
                    , topLen + 3 * arcLen + rightLen + bottomLen + leftLen // left edge
                    , topLen + 4 * arcLen + rightLen + bottomLen + leftLen // top-left corner
                ];

                var totalPerim = cumulative[7];
                var dist = segmentIndex * totalPerim / container.segments;
                var x, y, angle, inCorner = false;
                var centerX, centerY; // for corners

                if (dist <= cumulative[0]) {
                    // Top edge
                    x = r + dist;
                    y = 0;
                    angle = 0;
                } else if (dist <= cumulative[1]) {
                    // Top-right corner
                    inCorner = true;
                    centerX = w - r;
                    centerY = r;
                    var t = (dist - cumulative[0]) / r; // radians along quarter circle
                    x = centerX + r * Math.sin(t);
                    y = centerY - r * Math.cos(t);
                    angle = t; // tangent angle
                } else if (dist <= cumulative[2]) {
                    // Right edge
                    x = w;
                    y = r + (dist - cumulative[1]);
                    angle = Math.PI / 2;
                } else if (dist <= cumulative[3]) {
                    // Bottom-right corner
                    inCorner = true;
                    centerX = w - r;
                    centerY = h - r;
                    var t = (dist - cumulative[2]) / r;
                    x = centerX + r * Math.cos(t);
                    y = centerY + r * Math.sin(t);
                    angle = t + Math.PI / 2;
                } else if (dist <= cumulative[4]) {
                    // Bottom edge
                    x = w - r - (dist - cumulative[3]);
                    y = h;
                    angle = Math.PI;
                } else if (dist <= cumulative[5]) {
                    // Bottom-left corner
                    inCorner = true;
                    centerX = r;
                    centerY = h - r;
                    var t = (dist - cumulative[4]) / r;
                    x = centerX - r * Math.sin(t);
                    y = centerY + r * Math.cos(t);
                    angle = t + Math.PI;
                } else if (dist <= cumulative[6]) {
                    // Left edge
                    x = 0;
                    y = h - r - (dist - cumulative[5]);
                    angle = 3 * Math.PI / 2;
                } else {
                    // Top-left corner
                    inCorner = true;
                    centerX = r;
                    centerY = r;
                    var t = (dist - cumulative[6]) / r;
                    x = centerX - r * Math.cos(t);
                    y = centerY - r * Math.sin(t);
                    angle = t + 3 * Math.PI / 2;
                }

                return {
                    x: x,
                    y: y,
                    angle: angle,
                    inCorner: inCorner
                };
            }

            onPaint: {
                var ctx = getContext("2d");
                ctx.clearRect(0, 0, width, height);

                var w = width;
                var h = height;
                var r = container.radius;
                var bw = container.borderWidth;

                // Draw border
                ctx.strokeStyle = "transparent";
                ctx.lineWidth = bw;
                ctx.beginPath();
                ctx.moveTo(r, 0);
                ctx.lineTo(w - r, 0);
                ctx.quadraticCurveTo(w, 0, w, r);
                ctx.lineTo(w, h - r);
                ctx.quadraticCurveTo(w, h, w - r, h);
                ctx.lineTo(r, h);
                ctx.quadraticCurveTo(0, h, 0, h - r);
                ctx.lineTo(0, r);
                ctx.quadraticCurveTo(0, 0, r, 0);
                ctx.stroke();

                var activeSegments = Math.round(container.progress * container.segments);

                for (var i = 0; i < container.segments; i++) {
                    var pos = getSegmentPosition(i);

                    ctx.save();
                    ctx.translate(pos.x, pos.y);
                    ctx.rotate(pos.angle);
                    ctx.fillStyle = (i < activeSegments) ? container.filledColor : container.unfilledColor;
                    ctx.fillRect(-container.segmentWidth / 2, -container.segmentHeight / 2, container.segmentWidth, container.segmentHeight);
                    ctx.restore();
                }
            }

            onWidthChanged: requestPaint()
            onHeightChanged: requestPaint()
        }

        Slider {
            anchors.top: canvas.bottom
            anchors.topMargin: 20
            anchors.horizontalCenter: parent.horizontalCenter
            width: 400
            from: 0
            to: 1
            value: container.progress
            onValueChanged: container.progress = value
        }

        onProgressChanged: canvas.requestPaint()
    }
}
