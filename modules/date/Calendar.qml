pragma ComponentBehavior: Bound

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

    ColumnLayout {
        MouseArea {
            anchors.fill: parent
            onWheel: {
                if (wheel.angleDelta.y > 0 || wheel.angleDelta.x > 0)
                    return month += 1;
                else
                    return month -= 1;
            }
        }

        DayOfWeekRow {
            id: row
            Layout.fillWidth: true

            delegate: Rectangle {
                required property string narrowName
                
                color: Theme.transparent
                width: 20
                height: 20

                BaseText {
                    anchors.centerIn: parent
                    text: narrowName
                }
            }
        }

        MonthGrid {
            id: grid
            Layout.fillWidth: true
            Layout.fillHeight: true
            year: root.year
            month: root.month
            width: 20
            height: 20

            delegate: Rectangle {
                required property var model

                color: model.today ? Theme.highlight : Theme.base
                radius: 4

                BaseText {
                    id: text
                    anchors.centerIn: parent

                    text: parent.model.day
                    font.pixelSize: 12
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
}
