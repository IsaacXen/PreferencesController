import Foundation

extension Float: PropertyListRepresentable {
    public var propertyListEncoded: Any {
        self
    }
    
    public static func decode(fromPropertyList encoded: Any) -> Float? {
        encoded as? Float
    }
}

extension Double: PropertyListRepresentable {
    public var propertyListEncoded: Any {
        self
    }
    
    public static func decode(fromPropertyList encoded: Any) -> Double? {
        encoded as? Double
    }
}

#if arch(i386) || arch(arm)
extension CGFloat: PropertyListRepresentable {
    public var propertyListEncoded: Any {
        return Float(self).propertyListEncoded
    }
    
    public static func decode(fromPropertyList encoded: Any) -> CGFloat? {
        if let value = Float.decode(fromPropertyList: encoded) {
            return  CGFloat(value)
        } else {
            return nil
        }
    }
}
#endif
#if arch(x86_64) || arch(arm64)
extension CGFloat: PropertyListRepresentable {
    public var propertyListEncoded: Any {
        return Double(self).propertyListEncoded
    }
    
    public static func decode(fromPropertyList encoded: Any) -> CGFloat? {
        if let value = Double.decode(fromPropertyList: encoded) {
            return  CGFloat(value)
        } else {
            return nil
        }
    }
}
#endif

