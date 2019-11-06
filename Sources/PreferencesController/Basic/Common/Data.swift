import Foundation

extension Data: PropertyListRepresentable {
    public var propertyListEncoded: Any {
        self
    }
    
    public static func decode(fromPropertyList encoded: Any) -> Data? {
        encoded as? Data
    }
}
