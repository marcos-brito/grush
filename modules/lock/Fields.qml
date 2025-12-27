import QtQuick
import QtQuick.Layouts
import qs.components
import qs.services
import qs.config

ColumnLayout {
    id: root
    required property LockContext context

    spacing: 32

    ColumnLayout {
        spacing: 12

        BaseText {
            text: SystemService.userName
            font.pixelSize: 20
            verticalAlignment: Text.AlignBottom
        }

        BaseTextField {
            id: passwordBox
            implicitWidth: 400
            font.pixelSize: 22
            focus: true
            enabled: !root.context.unlockInProgress
            echoMode: TextInput.Password
            inputMethodHints: Qt.ImhSensitiveData
            icon: Icons.passwordEmpty
            iconColor: Theme.highlight
            onTextChanged: root.context.currentText = this.text
            onAccepted: root.context.tryUnlock()

            Connections {
                target: root.context

                function onCurrentTextChanged() {
                    passwordBox.text = root.context.currentText;
                }
            }
        }

        BaseText {
            visible: root.context.showFailure
            color: Theme.critical
            text: "Incorrect password"
        }
    }

    BaseButton {
        Layout.fillWidth: true
        Layout.preferredHeight: passwordBox.height
        color: Theme.highlight

        BaseText {
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            text: "Entrar"
            font.pixelSize: 18
            color: Theme.base
        }
    }
}
