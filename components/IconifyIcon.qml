import QtQuick
import Quickshell
import Quickshell.Io
import Quickshell.Widgets
import qs.config

IconImage {
    id: root
    required property string icon
    property string set: Icons.set
    property string color: Theme.highlight
    property string iconPath: `${root.set}-${root.icon}.svg`

    implicitSize: 24
    asynchronous: true
    source: `https://api.iconify.design/${set}/${icon}.svg?height=${actualSize}&color=%23${color.replace("#", "")}`

    Process {
        id: cacheProc

        command: ["curl", "-o", `${Quickshell.cachePath(root.iconPath)}`, root.source]
        running: false
    }

    Component.onCompleted: cacheProc.running = true
}
