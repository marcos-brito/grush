import QtQuick
import QtQuick.Layouts
import Quickshell.Widgets
import Quickshell.Services.Notifications
import qs.components
import qs.services
import qs.config

BaseButton {
    id: root
    required property Notification value
    property date time: Date.now()
    property bool folded: true

    radius: 8
    height: folded ? 50 : 100
    width: ListView.view.width
    hoverEnabled: true

    onDoubleClicked: console.log("dismiis")

    onEntered: {
        root.folded = false;
    }

    onExited: {
        root.folded = true;
    }

    Behavior on height {
        NumberAnimation {
            duration: 100
            easing.type: Easing.InOutQuad
        }
    }

    RowLayout {
        anchors.fill: parent
        anchors.margins: 10
        spacing: 10

        IconifyIcon {
            id: fallback
            visible: false
            set: Icons.set
            icon: Icons.notifications
            color: Theme.text
            implicitSize: 24
        }

        IconImage {
            Layout.alignment: Qt.AlignTop
            source: root.value.appIcon || fallback.source
            implicitSize: 24
        }

        ColumnLayout {
            Layout.alignment: Qt.AlignTop
            Layout.fillWidth: true

            BaseText {
                text: `${root.value.summary} - ${Qt.formatTime(root.time, "hh:mm")}`
                opacity: .7
            }

            BaseText {
                Layout.fillWidth: true
                text: root.value.body
                elide: root.folded ?  Text.ElideRight : Text.ElideNone
                wrapMode: !root.folded ? Text.Wrap : Text.NoWrap
            }

            RowLayout {
                visible: !root.folded

                Repeater {
                    model: root.value.actions
                    BaseButton {
                        required property NotificationAction modelData

                        BaseText {
                            text: action.text
                        }
                        onClicked: action.invoke()
                    }
                }
            }
        }

        IconifyIcon {
            Layout.alignment: Qt.AlignTop
            set: Icons.set
            icon: Icons.down
            color: Theme.text
            implicitSize: 16
            rotation: root.folded ? 0 : 180

            Behavior on rotation {
                RotationAnimation {
                    duration: 200
                    easing.type: Easing.InOutQuad
                }
            }
        }
    }
}
