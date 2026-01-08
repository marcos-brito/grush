import QtQuick
import qs.components
import qs.services
import qs.config

BaseButton {
    id: root
    property string panel
    property string textColor: Theme.subtext

    margin: 4
    onClicked: Panels.isOpen(panel) ? Panels.close(panel) : Panels.open(panel)

    Connections {
        target: Panels

        function onOpened(name) {
            if (name == root.panel)
                root.textColor = Theme.highlight;
        }

        function onClosed(name) {
            if (name == root.panel)
                root.textColor = Theme.subtext;
        }
    }

}
