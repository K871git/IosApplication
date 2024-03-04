// practice code set -3
//getting storage info 
let fileManager = FileManager.default
do {
    let documentDirectory = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
    let storageSize = try fileManager.attributesOfFileSystem(forPath: documentDirectory.path)[.systemSize] as? NSNumber
    print("Storage Size: \(storageSize)")
} catch {
    print("Error: \(error)")
}
