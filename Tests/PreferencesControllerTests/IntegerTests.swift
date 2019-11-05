import XCTest
@testable import PreferencesController

final class IntegerTests: XCTestCase {
    
    let controller = PreferencesController.shared
    
    func testInt() {
        let preference = Preference<Int>.readWrite("int-example", defaultValue: 42)
        controller.reset(preference)
        
        var result = controller.retrive(preference)
        XCTAssertEqual(result, preference.defaultValue)
        
        controller.save(12, to: preference)
        
        result = controller.retrive(preference)
        XCTAssertEqual(result, 12)
    }

    static var allTests = [
        ("testInt", testInt),
    ]
    
}
