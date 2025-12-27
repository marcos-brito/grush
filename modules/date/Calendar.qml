pragma ComponentBehavior:  Bound

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import qs.config
import qs.components

ColumnLayout {
    id: root

    property int year:  (new Date()).getFullYear()
    property int month: (new Date()).getMonth()

    RowLayout {
        Incrementable {
            Layout.alignment: Qt.AlignLeft
            color: Theme.text
            value: root.year
            text: root.year
            onValueChanged: root.year = value
        }

        Incrementable {
            Layout.alignment: Qt.AlignRight
            color: Theme.text
            value: root.month
            text: Qt.formatDate(new Date(root.year, root.month), "MMMM")
            min: 0
            max: 12
            onValueChanged: root.month = value
        }
    }

    DayOfWeekRow {
        id: row
        Layout.fillWidth: true

        delegate: BaseText {
            required property string shortName
            text: shortName
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
