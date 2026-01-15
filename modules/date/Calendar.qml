pragma ComponentBehavior:  Bound

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import qs.config
import qs.components

ColumnLayout {
    id: root

    property int year: (new Date()).getFullYear()
    property int month: (new Date()).getMonth()

    onMonthChanged: {
        if (month < 0) {
            month = 11;
            year -= 1;
        }

        if (month > 11) {
            month = 0;
            year += 1;
        }
    }

    RowLayout {
        BaseText {
            Layout.fillWidth: true
            text: Qt.formatDate(new Date(root.year, root.month), "MMMM")
            font.pixelSize: 12
        }

        BaseButton {
            tooltip: "Current month"
            margin: 4
            onClicked: {
                root.year = (new Date()).getFullYear();
                root.month = (new Date()).getMonth();
            }

            IconifyIcon {
                icon: Icons.calendarReset
                implicitSize: 16
                color: Theme.subtext
            }
        }

        BaseButton {
            tooltip: "Previous month"
            margin: 4
            onClicked: root.month -= 1

            IconifyIcon {
                icon: Icons.calendarPrevious
                implicitSize: 16
                color: Theme.subtext
            }
        }

        BaseButton {
            tooltip: "Next month"
            margin: 4
            onClicked: root.month += 1

            IconifyIcon {
                icon: Icons.calendarNext
                implicitSize: 16
                color: Theme.subtext
            }
        }
    }

    MonthGrid {
        id: grid
        year: root.year
        month: root.month
        Layout.fillWidth: true
        Layout.fillHeight: true

        delegate: Rectangle {
            required property var model

            width: 25
            height: 25
            color: model.today ? Theme.highlight : Theme.base
            radius: 4

            Text {
                anchors.fill: parent
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                text: parent.model.day
                color: {
                    const isCurrentDay = parent.model.today;
                    const isCurrentMonth = parent.model.month === grid.month;

                    if (isCurrentDay)
                        return Theme.base;

                    if (isCurrentMonth)
                        return Theme.text;

                    return Theme.subtext;
                }
            }
        }
    }
}
