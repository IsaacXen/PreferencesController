import Foundation

extension String: PropertyListRepresentable {
    public var propertyListEncoded: Any {
        self
    }
    
    public static func decode(fromPropertyList encoded: Any) -> String? {
        encoded as? String
    }
}
