import Foundation

extension Date: PropertyListRepresentable {
    public var propertyListEncoded: Any {
        self
    }
    
    public static func decode(fromPropertyList encoded: Any) -> Date? {
        encoded as? Date
    }
}
