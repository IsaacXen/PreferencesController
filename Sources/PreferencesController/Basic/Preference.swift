import Foundation

public struct Preference<Value> {
    
    let key: String
    
    let defaultValue: Value
    
    internal let _readOnly: Bool
    
    private init(_ key: String, _ defaultValue: Value, readOnly: Bool = false) {
        self.key = key
        self.defaultValue = defaultValue
        self._readOnly = readOnly
    }
    
    static func readOnly<Value>(_ key: String, defaultValue: Value) -> Preference<Value> where Value: PropertyListRepresentable {
        Preference<Value>(key, defaultValue, readOnly: true)
    }
    
    static func readWrite<Value>(_ key: String, defaultValue: Value) -> Preference<Value> where Value: PropertyListRepresentable {
        Preference<Value>(key, defaultValue, readOnly: false)
    }
    
}
