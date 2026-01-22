import QtQuick
import Quickshell.Widgets
import QtQuick.Layouts
import QtQuick.Effects
import qs.config

WrapperRectangle {
    default property alias data: content.data
    color: Theme.base
    margin: 8
    radius: 8

    ColumnLayout {
        id: content
        spacing: 4
    }
}
