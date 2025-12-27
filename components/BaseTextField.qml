import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell.Widgets
import qs.config
import qs.components

TextField {
    id: root
    property int radius: 8
    property string iconColor
    property string icon
    property string backgroundColor: Theme.overlay

    leftPadding: icon ? font.pixelSize + 15 : 10
    color: Theme.text
    implicitHeight: 50

    background: Rectangle {
        anchors.fill: parent
        color: root.backgroundColor
        radius: root.radius

        RowLayout {
            anchors.fill: parent
            anchors.leftMargin: 8
            anchors.rightMargin: 8

            IconifyIcon {
                set: Icons.set
                icon: root.icon
                implicitSize: root.font.pixelSize
                color: root.iconColor
            }
        }
    }
}
