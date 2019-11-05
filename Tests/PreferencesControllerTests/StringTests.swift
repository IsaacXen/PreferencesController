import XCTest
@testable import PreferencesController

final class StringTests: XCTestCase {
    
    let controller = PreferencesController.shared
    
    func testString() {
        let preference = Preference<String>.readWrite("string-example", defaultValue: "Hello world!")
        controller.reset(preference)
        
        var result = controller.retrive(preference)
        XCTAssertEqual(result, preference.defaultValue)
        
        controller.save("randomString", to: preference)
        
        result = controller.retrive(preference)
        XCTAssertEqual(result, "randomString")
    }

    static var allTests = [
        ("testString", testString),
    ]
    
}
