import QtQuick
import Quickshell.Widgets

Item {
    id: root
    default property alias data: content.data
    property int origin: SuperPanel.Origin.Top
    property int edgeSize: 8

    state: origin
    width: content.width
    height: content.height

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
            name: SuperPanel.Origin.Top
            PropertyChanges {
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
            name: SuperPanel.Origin.TopRight
            PropertyChanges {
                edge1.anchors.top: content.top
                edge1.anchors.left: content.left
                edge1.anchors.leftMargin: -root.edgeSize
                edge2.anchors.bottom: content.bottom
                edge2.anchors.right: content.right
                edge2.anchors.bottomMargin: -root.edgeSize
            }
        },
        State {
            name: SuperPanel.Origin.TopLeft
            PropertyChanges {
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
            name: SuperPanel.Origin.Bottom
            PropertyChanges {
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
            name: SuperPanel.Origin.BottomRight
            PropertyChanges {
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
            name: SuperPanel.Origin.BottomLeft
            PropertyChanges {
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
            name: SuperPanel.Origin.Right
            PropertyChanges {
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
            name: SuperPanel.Origin.Left
            PropertyChanges {
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
