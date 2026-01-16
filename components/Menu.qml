import QtQuick
import Quickshell.Widgets
import QtQuick.Layouts

WrapperItem {
    default property alias data: content.data

    ColumnLayout {
        id: content
        spacing: 4
        anchors.margins: 8
    }
}
