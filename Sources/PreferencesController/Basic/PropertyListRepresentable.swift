import Foundation

public protocol PropertyListRepresentable {
    
    var propertyListEncoded: Any { get }
    
    static func decode(fromPropertyList encoded: Any) -> Self?
    
}
