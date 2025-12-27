pragma Singleton

import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import qs.modules.lock

Singleton {
    id: root

    LockContext {
        id: lockContext
        onUnlocked: {
            Qt.quit();
        }
    }

    function lock() {
        lock.locked = true;
    }

    function unlock() {
        lock.locked = false;
    }

    IpcHandler {
        target: "lock"

        function lock(): void {
            root.lock()
        }
    }

    WlSessionLock {
        id: lock
        locked: false

        WlSessionLockSurface {

            LockSurface {
                anchors.fill: parent
                context: lockContext
            }
        }
    }
}
