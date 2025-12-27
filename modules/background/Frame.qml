import Quickshell
import Quickshell.Wayland
import QtQuick
import QtQuick.Effects
import qs.config
import qs.components

BasePanel {
    id: root

    property string color: Theme.base
    property alias opacity: rect.opacity
    property int top: 5
    property int bottom: 5
    property int left: 5
    property int right: 5

    aboveWindows: false
    exclusionMode: ExclusionMode.Ignore
    visible: true
    name: "frame"
    WlrLayershell.layer: WlrLayer.Background

    anchors {
        top: true
        bottom: true
        left: true
        right: true
    }

    Item {
        anchors.fill: parent

        layer.enabled: true
        layer.effect: MultiEffect {
            shadowEnabled: true
            blurMax: 15
            shadowColor: Qt.alpha("#000", 1)
        }

        Rectangle {
            id: rect
            anchors.fill: parent
            color: root.color
            layer.enabled: true
            layer.effect: MultiEffect {
                maskSource: mask
                maskEnabled: true
                maskInverted: true
                maskThresholdMin: 0.5
                maskSpreadAtMin: 1
            }

            Item {
                id: mask

                anchors.fill: parent
                visible: false
                layer.enabled: true

                Rectangle {
                    id: maskInner

                    anchors.leftMargin: root.left
                    anchors.topMargin: root.top
                    anchors.bottomMargin: root.bottom
                    anchors.rightMargin: root.right
                    anchors.fill: parent
                    anchors.margins: 8
                    radius: 8
                }
            }
        }
    }
}
