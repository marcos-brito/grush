import QtQuick.Layouts
import qs.components
import qs.config

Widget {
    id: root
    panel: "date-dashboard"

    ColumnLayout {
        anchors.centerIn: parent
        spacing: 8

        IconifyIcon {
            icon: Icons.datePanel
            implicitSize: 15
            color: root.textColor
        }

        ColumnLayout {

            Time {
                format: "hh"
                color: root.textColor
            }

            Time {
                format: "mm"
                color: root.textColor
            }
        }
    }
}
