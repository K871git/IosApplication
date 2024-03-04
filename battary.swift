
// practice code set -1
import UIKit

let battery = UIDevice.current
battery.isBatteryMonitoringEnabled = true
let batteryLevel = battery.batteryLevel
let maximumBatteryCapacity = UIDevice.current.batteryCapacity
