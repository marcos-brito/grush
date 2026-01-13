import QtQuick
import QtQuick.Effects
import qs.config
import qs.services

BasePanel {
    id: root

    default property alias data: content.data
    property string panelColor: Theme.base
    property int panelWidth: screen.width * 0.25
    property int panelHeight: screen.height * 0.75
    property int origin: SuperPanel.Origin.Top

    MouseArea {
        anchors.fill: parent
        onClicked: Panels.close(root.name)
    }

    margins {
        left: 40
        right: 8
        top: 8
        bottom: 8
    }

    anchors {
        left: true
        right: true
        top: true
        bottom: true
    }

    enum Origin {
        Top,
        TopLeft,
        TopRight,
        Bottom,
        BottomLeft,
        BottomRight,
        Right,
        Left,
        Center
    }

    function open(): void {
        visible = true;
        slider.slideIn();
    }

    function close(): void {
        slider.slideOut();
    }

    SlidingItem {
        id: slider
        origin: root.origin
        onSlideOutFinished: root.visible = false

        layer.enabled: true
        layer.effect: MultiEffect {
            shadowEnabled: true
            blurMax: 15
            shadowColor: Qt.alpha("#000", 0.7)
        }

        anchors {
            left:   origin === SuperPanel.Origin.Left ||
                    origin === SuperPanel.Origin.TopLeft ||
                    origin === SuperPanel.Origin.BottomLeft
                    ? parent.left : undefined

            right:  origin === SuperPanel.Origin.Right ||
                    origin === SuperPanel.Origin.TopRight ||
                    origin === SuperPanel.Origin.BottomRight
                    ? parent.right : undefined

            top:    origin === SuperPanel.Origin.Top ||
                    origin === SuperPanel.Origin.TopLeft ||
                    origin === SuperPanel.Origin.TopRight
                    ? parent.top : undefined

            bottom: origin === SuperPanel.Origin.Bottom ||
                    origin === SuperPanel.Origin.BottomLeft ||
                    origin === SuperPanel.Origin.BottomRight
                    ? parent.bottom : undefined

            horizontalCenter:
                    origin === SuperPanel.Origin.Top ||
                    origin === SuperPanel.Origin.Bottom ||
                    origin === SuperPanel.Origin.Center
                    ? parent.horizontalCenter : undefined

            verticalCenter:
                    origin === SuperPanel.Origin.Left ||
                    origin === SuperPanel.Origin.Right ||
                    origin === SuperPanel.Origin.Center
                    ? parent.verticalCenter : undefined
        }

        EdgedItem {
            id: edges
            origin: root.origin

            Rectangle {
                id: content

                implicitWidth: root.panelWidth
                implicitHeight: root.panelHeight
                color: root.panelColor

                property real r: 8

                readonly property bool roundLeft:
                    origin === SuperPanel.Origin.Right ||
                    origin === SuperPanel.Origin.TopRight ||
                    origin === SuperPanel.Origin.BottomRight ||
                    origin === SuperPanel.Origin.Center

                readonly property bool roundRight:
                    origin === SuperPanel.Origin.Left ||
                    origin === SuperPanel.Origin.TopLeft ||
                    origin === SuperPanel.Origin.BottomLeft ||
                    origin === SuperPanel.Origin.Center

                readonly property bool roundTop:
                    origin === SuperPanel.Origin.Bottom ||
                    origin === SuperPanel.Origin.BottomLeft ||
                    origin === SuperPanel.Origin.BottomRight ||
                    origin === SuperPanel.Origin.Center

                readonly property bool roundBottom:
                    origin === SuperPanel.Origin.Top ||
                    origin === SuperPanel.Origin.TopLeft ||
                    origin === SuperPanel.Origin.TopRight ||
                    origin === SuperPanel.Origin.Center

                topLeftRadius:     (roundTop && roundLeft)   ? r : 0
                topRightRadius:    (roundTop && roundRight)  ? r : 0
                bottomLeftRadius:  (roundBottom && roundLeft)? r : 0
                bottomRightRadius: (roundBottom && roundRight)? r : 0
            }
        }
    }
}
