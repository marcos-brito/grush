pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import qs.components
import qs.config

BaseButton {
    id: root
    property list<string> values
    property string selected: values[0]
    signal valueAccepted(value: string)

    onClicked: menu.toggle()

    RowLayout {
        spacing: 16

        BaseText {
            text: root.selected
        }

        IconifyIcon {
            Layout.alignment: Qt.AlignTop
            set: Icons.set
            icon: Icons.down
            color: Theme.text
            implicitSize: 16
            rotation: menu.visible ? 0 : 180

            Behavior on rotation {
                RotationAnimation {
                    duration: 200
                    easing.type: Easing.InOutQuad
                }
            }
        }
    }

    Menu {
        id: menu
        anchor.item: root
        origin: SuperPanel.Origin.Top
        anchor.margins.top: root.height
        width: root.width

        Repeater {
            model: root.values
            delegate: MenuItem {
                required property string modelData
                text: modelData
                onClicked: {
                    root.selected = modelData;
                    root.valueAccepted(modelData);
                    menu.close()
                }
            }
        }
    }
}
