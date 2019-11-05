import Foundation

public class PreferencesController: NSObject {
    
    static let shared = PreferencesController()
    
    internal let _userDefault: UserDefaults
    
    internal let _subscribers = NSPointerArray.weakObjects()
    
    private override init() {
        self._userDefault = .standard
        super.init()
    }

}
