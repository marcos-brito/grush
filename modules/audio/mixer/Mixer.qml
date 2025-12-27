import Quickshell
import Quickshell.Services.Pipewire
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import qs.config
import qs.components
import qs.services

SuperPanel {
    name: "mixer"
    panelWidth: screen.width * 0.
    panelHeight: screen.height * 0.2
    panelColor: Theme.base
    origin: SuperPanel.Origin.Right
    topLeftRadius: 8
    bottomLeftRadius: 8
    closeOnEsc: false
    focusable: false

    SinkList {}
}
