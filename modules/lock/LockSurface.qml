import QtQuick
import QtQuick.Layouts
import qs.config

Rectangle {
    id: root
    required property LockContext context

    anchors.fill: parent
    color: Theme.base

    RowLayout {
        Wallpaper {}

        ColumnLayout {
            spacing: 64
            Layout.alignment: Qt.AlignRight

            Date {}

            Fields {
                context: root.context
            }
        }
    }
}
