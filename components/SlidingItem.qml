import QtQuick
import Quickshell.Widgets

WrapperItem {
    id: root

    default property alias data: content.data
    property int origin: SuperPanel.Origin.Top

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
                // content.opacity: 1
                // root.scale: 1
                slide.x: 0
                slide.y: 0
            }
        },
        State {
            name: "closed"
            PropertyChanges {
                // content.opacity: 0
                // root.scale: 0.4
                slide.x: {
                    switch (root.origin) {
                    case SuperPanel.Origin.TopLeft:
                    case SuperPanel.Origin.BottomLeft:
                    case SuperPanel.Origin.Left:
                        return -root.width;
                        break;
                    case SuperPanel.Origin.TopRight:
                    case SuperPanel.Origin.BottomRight:
                    case SuperPanel.Origin.Right:
                        return +root.width;
                        break;
                    default:
                        return 0;
                        break;
                    }
                }
                slide.y: {
                    switch (root.origin) {
                    case SuperPanel.Origin.TopLeft:
                    case SuperPanel.Origin.TopRight:
                    case SuperPanel.Origin.Top:
                        return -root.height;
                        break;
                    case SuperPanel.Origin.BottomRight:
                    case SuperPanel.Origin.BottomLeft:
                    case SuperPanel.Origin.Bottom:
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
