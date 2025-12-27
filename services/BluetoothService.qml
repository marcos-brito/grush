pragma Singleton

import Quickshell
import Quickshell.Bluetooth
import Quickshell.Bluetooth


Singleton {
    property list<BluetoothDevice> devices: Bluetooth.devices.values
    property list<BluetoothAdapter> defaultAdapter: Bluetooth.defaultAdapter
    property list<BluetoothAdapter> adapter: Bluetooth.adapters.values
}
