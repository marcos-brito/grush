import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell.Widgets

WrapperItem {
    id: root

    default property alias data: actions.data
    property string text

    ColumnLayout {
        spacing: 8

        RowLayout {
            id: actions

            BaseText {
                text: root.text
                font.pixelSize: 18
                Layout.fillWidth: true
            }
        }

        Separator {
            Layout.fillWidth: true
        }
    }
}
