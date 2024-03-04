import UIKit
import AVFoundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidLoad()
        
        // Retrieve Device Information
        let device = UIDevice.current
        let modelName = device.model
        let modelNumber = device.localizedModel
        let iOSVersion = device.systemVersion
        let serialNumber = UIDevice.current.identifierForVendor?.uuidString
        
        let fileManager = FileManager.default
        do {
            let documentDirectory = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            let storageSize = try fileManager.attributesOfFileSystem(forPath: documentDirectory.path)[.systemSize] as? NSNumber
            print("Storage Size: \(storageSize)")
        } catch {
            print("Error: \(error)")
        }
        
        device.isBatteryMonitoringEnabled = true
        let batteryLevel = device.batteryLevel
        let maximumBatteryCapacity = UIDevice.current.batteryCapacity
        
        var cameraMegapixel: String?
        var cameraAperture: String?
        
        let devices = AVCaptureDevice.devices(for: AVMediaType.video)
        for device in devices {
            if let device = device as? AVCaptureDevice {
                print("Camera Megapixel: \(device.activeFormat.maxExposureDuration)")
                print("Camera Aperture: \(device.activeFormat.maxISO)")
            }
        }
        
        let cpu = ProcessInfo.processInfo
        let processorCount = cpu.processorCount
        let activeProcessorCount = cpu.activeProcessorCount
        
        // GPU Information - not possible to access directly through Swift
        
        // IMEI - not possible to access due to privacy restrictions
        
        // Display Retrieved Information
        print("Model Name: \(modelName)")
        print("Model Number: \(modelNumber)")
        print("iOS Version: \(iOSVersion)")
        print("Serial Number: \(serialNumber ?? "N/A")")
        print("Battery Level: \(batteryLevel)")
        print("Maximum Battery Capacity: \(maximumBatteryCapacity)")
        print("Processor Count: \(processorCount)")
        print("Active Processor Count: \(activeProcessorCount)")
    }
}
