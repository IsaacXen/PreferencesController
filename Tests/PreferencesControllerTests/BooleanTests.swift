import XCTest
@testable import PreferencesController

final class BooleanTests: XCTestCase {
    
    let controller = PreferencesController.shared
    
    func testBool() {
        let preference = Preference<Bool>.readWrite("bool-example", defaultValue: false)
        controller.reset(preference)
        
        var result = controller.retrive(preference)
        XCTAssertEqual(result, preference.defaultValue)
        
        controller.save(true, to: preference)
        
        result = controller.retrive(preference)
        XCTAssertEqual(result, true)
    }

    static var allTests = [
        ("testBool", testBool),
    ]
    
}
