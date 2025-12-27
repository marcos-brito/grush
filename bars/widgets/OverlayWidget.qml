import QtQuick.Layouts
import qs.config
import qs.components
import qs.services

BaseButton {
    default property alias data: wrapper.data
    property string panel

    onClicked: Panels.isOpen(panel) ? Panels.close(panel) : Panels.open(panel)
    color: Theme.base
    hoverColor: Theme.base
    margin: 8

    ColumnLayout {
        id: wrapper
        spacing: 8
        anchors.centerIn: parent
    }
}
