import Foundation

public extension PreferencesController {
    
    func addSubscriber(_ subscriber: PreferencesControllerSubscriber) {
        _subscribers.addPointer(Unmanaged.passUnretained(subscriber as AnyObject).toOpaque())
        _subscribers.compact()
    }
    
    func removeSubscriber(_ subscriber: PreferencesControllerSubscriber) {
        for index in 0..<_subscribers.count {
            if let pointer = _subscribers.pointer(at: index) {
                if subscriber as AnyObject === Unmanaged<AnyObject>.fromOpaque(pointer).takeUnretainedValue() {
                    _subscribers.removePointer(at: index)
                    break
                }
            }
        }
        _subscribers.compact()
    }
    
    internal func _notifySubscriber(_ block: (PreferencesControllerSubscriber) -> Void) {
        for index in 0..<_subscribers.count {
            if
                let pointer = _subscribers.pointer(at: index),
                let subscriber = Unmanaged<AnyObject>.fromOpaque(pointer).takeUnretainedValue() as? PreferencesControllerSubscriber
            {
                block(subscriber)
            }
        }
    }
    
}
