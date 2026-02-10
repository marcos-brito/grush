import QtQuick
import qs.config
import qs.services
import Quickshell.Widgets

WrappedPanel{
    id: root

    default property alias data: content.data
    property int time: 2000

    WrapperMouseArea {
        id: content
        anchors.fill: parent
        hoverEnabled: true
        onEntered: timer.stop()
        onExited: timer.restart()
    }

    Timer {
        id: timer
        interval: root.time
        onTriggered: Panels.close(name)
    }

    Connections {
        target: Panels

        function onOpened(name) {
            timer.restart()
        }
    }
}

