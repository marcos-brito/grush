import QtQuick
import Quickshell.Widgets
import qs.components.overlay

// HACK: Can't use a WrapperItem because it makes the
// edges invisible.
Item {
    id: root

    default property alias data: content.data
    property int origin: Positioning.Origin.Top
    property int edgeSize: 8

    state: origin
    implicitWidth: content.width
    implicitHeight: content.height

    WrapperItem {
        id: content
    }

    Edge {
        id: edge1
        size: root.edgeSize
    }

    Edge {
        id: edge2
        size: root.edgeSize
    }

    states: [
        State {
            name: Positioning.Origin.Top
            PropertyChanges {
                root.implicitWidth: root.implicitWidth + (edgeSize * 2)
                content.anchors.centerIn: root

                edge1.anchors.top: content.top
                edge1.anchors.left: content.left
                edge1.anchors.leftMargin: -root.edgeSize
                edge2.anchors.top: content.top
                edge2.anchors.right: content.right
                edge2.anchors.rightMargin: -root.edgeSize
                edge2.rotation: 270
            }
        },
        State {
            name: Positioning.Origin.TopRight
            PropertyChanges {
                root.implicitHeight: root.implicitHeight + edgeSize
                root.implicitWidth: root.implicitWidth + edgeSize
                content.anchors.top: root.top
                content.anchors.right: root.right


                edge1.anchors.top: content.top
                edge1.anchors.left: content.left
                edge1.anchors.leftMargin: -root.edgeSize
                edge2.anchors.bottom: content.bottom
                edge2.anchors.right: content.right
                edge2.anchors.bottomMargin: -root.edgeSize
            }
        },
        State {
            name: Positioning.Origin.TopLeft
            PropertyChanges {
                root.implicitHeight: root.implicitHeight + edgeSize
                root.implicitWidth: root.implicitWidth + edgeSize
                content.anchors.top: root.top
                content.anchors.left: root.left

                edge1.anchors.bottom: content.bottom
                edge1.anchors.left: content.left
                edge1.anchors.bottomMargin: -root.edgeSize
                edge1.rotation: 270
                edge2.anchors.top: content.top
                edge2.anchors.right: content.right
                edge2.anchors.rightMargin: -root.edgeSize
                edge2.rotation: 270
            }
        },
        State {
            name: Positioning.Origin.Bottom
            PropertyChanges {
                root.implicitWidth: root.implicitWidth + (edgeSize * 2)
                content.anchors.centerIn: root

                edge1.anchors.bottom: content.bottom
                edge1.anchors.left: content.left
                edge1.anchors.leftMargin: -root.edgeSize
                edge1.rotation: 90
                edge2.anchors.bottom: content.bottom
                edge2.anchors.right: content.right
                edge2.anchors.rightMargin: -root.edgeSize
                edge2.rotation: 180
            }
        },
        State {
            name: Positioning.Origin.BottomRight
            PropertyChanges {
                root.implicitHeight: root.implicitHeight + edgeSize
                root.implicitWidth: root.implicitWidth + edgeSize
                content.anchors.bottom: root.bottom
                content.anchors.right: root.left

                edge1.anchors.bottom: content.bottom
                edge1.anchors.left: content.left
                edge1.anchors.leftMargin: -root.edgeSize
                edge1.rotation: 90
                edge2.anchors.top: content.top
                edge2.anchors.right: content.right
                edge2.anchors.topMargin: -root.edgeSize
                edge2.rotation: 90
            }
        },
        State {
            name: Positioning.Origin.BottomLeft
            PropertyChanges {
                root.implicitHeight: root.implicitHeight + edgeSize
                root.implicitWidth: root.implicitWidth + edgeSize
                content.anchors.bottom: root.bottom
                content.anchors.left: root.left

                edge1.anchors.top: content.top
                edge1.anchors.left: content.left
                edge1.anchors.topMargin: -root.edgeSize
                edge1.rotation: 180

                edge2.anchors.bottom: content.bottom
                edge2.anchors.right: content.right
                edge2.anchors.rightMargin: -root.edgeSize
                edge2.rotation: 180
            }
        },
        State {
            name: Positioning.Origin.Right
            PropertyChanges {
                root.implicitHeight: root.implicitHeight + (edgeSize * 2)
                content.anchors.centerIn: root

                edge1.anchors.bottom: content.bottom
                edge1.anchors.right: content.right
                edge1.anchors.bottomMargin: -root.edgeSize
                edge2.anchors.top: content.top
                edge2.anchors.right: content.right
                edge2.anchors.topMargin: -root.edgeSize
                edge2.rotation: 90
            }
        },
        State {
            name: Positioning.Origin.Left
            PropertyChanges {
                root.implicitHeight: root.implicitHeight + (edgeSize * 2)
                content.anchors.centerIn: root

                edge1.anchors.bottom: content.bottom
                edge1.anchors.left: content.left
                edge1.anchors.bottomMargin: -root.edgeSize
                edge1.rotation: 270

                edge2.anchors.top: content.top
                edge2.anchors.left: content.left
                edge2.anchors.topMargin: -root.edgeSize
                edge2.rotation: 180
            }
        }
    ]
}
