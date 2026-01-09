import QtQuick
import qs.components
import qs.config

Popup {
    id: root
    name: `tooltip-${root.text}`

    property string text

    function show() {
        timer.restart();
    }

    function hide() {
        root.close();
        timer.stop();
    }

    Timer {
        id: timer
        interval: 400
        running: false
        repeat: true
        onTriggered: {
            root.open();
        }
    }

    BaseText {
        text: root.text
    }
}
