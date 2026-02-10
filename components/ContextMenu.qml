import QtQuick
import Quickshell.Widgets
import qs.components.overlay

MouseArea {
    default property alias data: content.data
    property alias anchor: content.anchor

    acceptedButtons: Qt.AllButtons
    onPressed: event => {
        if (event.button != Qt.RightButton)
            return;

        content.anchor.rect.x = event.x;
        content.anchor.rect.y = event.y;
        content.open();
    }

    Popup {
        id: content
    }
}
