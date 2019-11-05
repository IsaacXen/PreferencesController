import XCTest
@testable import PreferencesController

final class SubscriptionTests: XCTestCase {
    
    let controller = PreferencesController.shared
    
    func testSubscription() {
        let exception = XCTestExpectation(description: "")
        
        let preference = Preference<Int>.readWrite("sub-example", defaultValue: 0)
        controller.reset(preference)

        let testValue = 42
        
        let object = TestObject()
        object.block = { (old, new) in
            XCTAssertEqual(old, 0)
            XCTAssertEqual(new, testValue)
            exception.fulfill()
        }
        
        controller.addSubscriber(object)
        
        controller.save(testValue, to: preference)
        
        wait(for: [exception], timeout: 1)
    }
    
    static var allTests = [
        ("testSubscription", testSubscription),
    ]
    
}

class TestObject: NSObject, PreferencesControllerSubscriber {
    
    var block: ((Int, Int) -> Void)?
    
    func preferencesController(_ controller: PreferencesController, didChangePreferenceWithKey key: String, newValue: PropertyListRepresentable, oldValue: PropertyListRepresentable) {
        switch key {
        case "sub-example":
                block?(oldValue as! Int, newValue as! Int)
            
            default: ()
        }
    }

}
