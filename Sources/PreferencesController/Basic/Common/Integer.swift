import Foundation

extension Int: PropertyListRepresentable {
    public var propertyListEncoded: Any {
        self
    }
    
    public static func decode(fromPropertyList encoded: Any) -> Int? {
        encoded as? Int
    }
}


