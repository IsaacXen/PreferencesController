import Foundation

extension Array: PropertyListRepresentable where Element: PropertyListRepresentable {
    public var propertyListEncoded: Any {
        map { $0.propertyListEncoded }
    }
    
    public static func decode(fromPropertyList encoded: Any) -> Array<Element>? {
        if let array = encoded as? NSArray {
            return array.compactMap { Element.decode(fromPropertyList: $0) }
        } else {
            return nil
        }
    }
}

