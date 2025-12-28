import Quickshell
import Quickshell.Widgets
import QtQuick.Layouts
import QtQuick.Effects
import qs.config
import qs.components

Popup {
    id: root

    default property alias data: items.data

    ColumnLayout {
        id: items
    }
}
