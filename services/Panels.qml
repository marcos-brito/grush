pragma Singleton

import Quickshell
import qs.components

Singleton {
    property var panels: ({})
    property var openPanels: []

    signal opened(name: string)
    signal closed(name: string)

    function register(panel: BasePanel) {
        panels[panel.name] = panel;
    }

    function isOpen(name: string): bool {
        return openPanels.indexOf(name) !== -1;
    }

    function open(name: string) {
        if (isOpen(name))
            return;

        for (const panel of openPanels)
            close(panel);

        panels[name].open();
        openPanels.push(name);
        opened(name);
    }

    function close(name: string) {
        if (!isOpen(name))
            return;

        panels[name].close();
        openPanels = openPanels.filter(p => p !== name);
        closed(name);
    }
}
