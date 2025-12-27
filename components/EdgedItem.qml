import QtQuick

Item {
    id: root
    property int origin: SuperPanel.Origin.Top
    property int contentHeight
    property int contentWidth
    property int edgeSize: 8
    default property alias data: content.data
    property bool anchorLeft: false
    property bool anchorRight: false
    property bool anchorTop: false
    property bool anchorBottom: false

    height: contentHeight + edgeSize * 2
    width: contentWidth + edgeSize * 2
    state: origin

    Item {
        id: content
        width: root.contentWidth
        height: root.contentHeight
        anchors.top: root.anchorTop ? parent.top : undefined
        anchors.bottom: root.anchorBottom ? parent.bottom : undefined
        anchors.verticalCenter: (!root.anchorTop && !root.anchorBottom) ? parent.verticalCenter : undefined
        anchors.left: root.anchorLeft ? parent.left : undefined
        anchors.right: root.anchorRight ? parent.right : undefined
        anchors.horizontalCenter: (!root.anchorLeft && !root.anchorRight) ? parent.horizontalCenter : undefined
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
