import Foundation

extension Dictionary: PropertyListRepresentable where Key: PropertyListRepresentable & LosslessStringConvertible, Value: PropertyListRepresentable {
    public var propertyListEncoded: Any {
        var dict = [String: Any]()
        
        for (key, value) in self {
            let k = key.description
            let v = value.propertyListEncoded
            dict[k] = v
        }
        
        return dict
    }
    
    public static func decode(fromPropertyList encoded: Any) -> Dictionary<Key, Value>? {
        if let dict = encoded as? NSDictionary {
            var result = [Key: Value]()
            
            for (key, value) in dict {
                guard
                    let keyDescription = key as? String,
                    let k = Key.init(keyDescription),
                    let v = Value.decode(fromPropertyList: value)
                else { continue }
                
                result[k] = v
            }
            
            return result
        } else {
            return nil
        }
    }
}
