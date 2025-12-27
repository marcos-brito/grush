import Quickshell.Widgets
import Quickshell.Io
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import qs.components
import qs.config
import qs.services

BaseTextField {
    id: root
    property string panel
    font.pixelSize: 16
    focus: true

    Shortcut {
        sequences: ["Escape"]
        onActivated: Panels.close(root.panel)
        context: Qt.WindowShortcut
    }

    Shortcut {
        sequences: ["Ctrl", "k"]
        enabled: true
        onActivated: root.previous()
        context: Qt.WindowShortcut
    }

    Shortcut {
        sequences: ["Ctrl", "j"]
        enabled: true
        onActivated: root.next()
        context: Qt.WindowShortcut
    }

    Shortcut {
        sequences: ["Tab"]
        enabled: true
        onActivated: root.complete()
        context: Qt.WindowShortcut
    }
}
