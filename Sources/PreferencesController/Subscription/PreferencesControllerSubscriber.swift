import Foundation

public protocol PreferencesControllerSubscriber: AnyObject {
    func preferencesController(_ controller: PreferencesController, didChangePreferenceWithKey key: String, newValue: PropertyListRepresentable, oldValue: PropertyListRepresentable)
}
