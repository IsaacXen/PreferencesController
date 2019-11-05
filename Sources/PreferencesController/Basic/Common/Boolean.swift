import Foundation

extension Bool: PropertyListRepresentable {
    public var propertyListEncoded: Any {
        self
    }
    
    public static func decode(fromPropertyList encoded: Any) -> Bool? {
        encoded as? Bool
    }
}

