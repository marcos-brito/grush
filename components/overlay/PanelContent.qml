import QtQuick
import Quickshell.Widgets
import qs.config
import qs.components

SlidingItem {
    id: root

    default property alias data: content.data
    property string panelColor: Theme.base
    property int panelWidth: screen.width * 0.25
    property int panelHeight: screen.height * 0.75

    anchors {
        left: Positioning.anchorLeft(root.origin) ? parent.left : null
        right: Positioning.anchorRight(root.origin) ? parent.right : null
        top: Positioning.anchorTop(root.origin) ? parent.top : null
        bottom: Positioning.anchorBottom(root.origin) ? parent.bottom : null
        horizontalCenter: Positioning.anchorHCenter(root.origin) ? parent.horizontalCenter : null
        verticalCenter: Positioning.anchorVCenter(root.origin) ? parent.verticalCenter : null
    }

    EdgedItem {
        origin: root.origin

        WrapperRectangle {
            id: content
            implicitWidth: root.panelWidth
            implicitHeight: root.panelHeight
            color: root.panelColor
            topLeftRadius: Positioning.topLeftRadius(root.origin)
            topRightRadius: Positioning.topRightRadius(root.origin)
            bottomLeftRadius: Positioning.bottomLeftRadius(root.origin)
            bottomRightRadius: Positioning.bottomRightRadius(root.origin)
        }
    }
}
