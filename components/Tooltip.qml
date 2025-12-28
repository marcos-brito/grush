import qs.components
import qs.config

Popup {
    id: root

    property string text

    BaseText {
        text: root.text
    }
}
