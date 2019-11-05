import Foundation

public extension PreferencesController {
    
    func save<Value>(_ newValue: Value, to preference: Preference<Value>) where Value: PropertyListRepresentable {
        print(#function, preference.key, newValue)
        
        guard !preference._readOnly else {
            return
        }
        
        let oldValue = retrive(preference)
        
        let encoded = newValue.propertyListEncoded
        
        print("Encoded value: \(encoded)")
        
        _userDefault.set(encoded, forKey: preference.key)
        
        _notifySubscriber {
//            $0.preferencesController(self, didChangePreference: preference, newValue: newValue, oldValue: oldValue)
            $0.preferencesController(self, didChangePreferenceWithKey: preference.key, newValue: newValue, oldValue: oldValue)
        }
    }
    
    func retrive<Value>(_ preference: Preference<Value>) -> Value where Value: PropertyListRepresentable {
        print(#function, preference.key)
        
        guard
            !preference._readOnly,
            let object = _userDefault.object(forKey: preference.key)
        else {
            return preference.defaultValue
        }
        
        if let decoded = Value.decode(fromPropertyList: object) {
            print("decode success, value: \(decoded)")
            return decoded
        } else {
            print("decode failed")
            return preference.defaultValue
        }
    }
    
    func reset<Value>(_ preference: Preference<Value>) {
        _userDefault.set(nil, forKey: preference.key)
    }
    
}
