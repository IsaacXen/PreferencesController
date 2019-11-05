import XCTest
@testable import PreferencesController

final class ArrayTests: XCTestCase {
    
    let controller = PreferencesController.shared
    
    func testBoolArray() {
        let preference = Preference<[Bool]>.readWrite("bool-array-example", defaultValue: [Bool]())
        controller.reset(preference)

        var result = controller.retrive(preference)
        XCTAssertEqual(result, preference.defaultValue)
        
        controller.save([false, true, false], to: preference)
        
        result = controller.retrive(preference)
        XCTAssertEqual(result, [false, true, false])
    }
    
    func testNestedArray() {
        let preference = Preference<[[Bool]]>.readWrite("nested-bool-array-example", defaultValue: [[Bool]]())
        controller.reset(preference)

        var result = controller.retrive(preference)
        XCTAssertEqual(result, preference.defaultValue)
        
        controller.save([[false], [true, false]], to: preference)
        
        result = controller.retrive(preference)
        XCTAssertEqual(result, [[false], [true, false]])
    }

    static var allTests = [
        ("testBoolArray", testBoolArray),
        ("testNestedArray", testNestedArray)
    ]
    
}
