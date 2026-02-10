import QtQuick
import Quickshell.Widgets
import qs.components.overlay

WrapperItem {
    id: root

    default property alias data: content.data
    property int origin: Positioning.Origin.Top

    signal slideInFinished
    signal slideOutFinished

    transformOrigin: Item.Center
    state: "closed"

    transform: Translate {
        id: slide
    }

    child: WrapperItem {
        id: content
        state: "closed"
    }

    function slideIn(): void {
        visible = true;
        root.state = "opened";
    }

    function slideOut(): void {
        root.state = "closed";
        timer.start();
    }

    Timer {
        id: timer
        interval: 200
        repeat: false
        onTriggered: {
            root.visible = false;
            root.slideOutFinished();
        }
    }


    states: [
        State {
            name: "opened"
            PropertyChanges {
                content.opacity: 1
                root.scale: 1
                slide.x: 0
                slide.y: 0
            }
        },
        State {
            name: "closed"
            PropertyChanges {
                content.opacity: .85
                root.scale: 0.85
                slide.x: {
                    switch (root.origin) {
                    case Positioning.Origin.TopLeft:
                    case Positioning.Origin.BottomLeft:
                    case Positioning.Origin.Left:
                        return -root.width;
                        break;
                    case Positioning.Origin.TopRight:
                    case Positioning.Origin.BottomRight:
                    case Positioning.Origin.Right:
                        return +root.width;
                        break;
                    default:
                        return 0;
                        break;
                    }
                }
                slide.y: {
                    switch (root.origin) {
                    case Positioning.Origin.TopLeft:
                    case Positioning.Origin.TopRight:
                    case Positioning.Origin.Top:
                        return -root.height;
                        break;
                    case Positioning.Origin.BottomRight:
                    case Positioning.Origin.BottomLeft:
                    case Positioning.Origin.Bottom:
                        return +root.height;
                        break;
                    default:
                        return 0;
                        break;
                    }
                }
            }
        }
    ]

    transitions: [
        Transition {
            from: "closed"
            to: "opened"
            NumberAnimation {
                properties: "opacity,scale,x,y"
                duration: 200
                easing.type: Easing.OutExpo
            }
        },
        Transition {
            from: "opened"
            to: "closed"
            NumberAnimation {
                properties: "opacity,scale,x,y"
                duration: 200
                easing.type: Easing.InQuad
            }
        }
    ]
}
