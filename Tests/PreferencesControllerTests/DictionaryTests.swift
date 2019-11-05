import XCTest
@testable import PreferencesController

final class DictionaryTests: XCTestCase {
    
    let controller = PreferencesController.shared
    
    func testDict() {
        let preference = Preference<[String: String]>.readWrite("dict-example", defaultValue: [String: String]())
        controller.reset(preference)

        var result = controller.retrive(preference)
        XCTAssertEqual(result, preference.defaultValue)
        
        let testValue = ["a": "one", "b": "two"]
        
        controller.save(testValue, to: preference)
        
        result = controller.retrive(preference)
        XCTAssertEqual(result, testValue)
    }
    
    func testDictArray() {
        let preference = Preference<[String: [String]]>.readWrite("dict-example", defaultValue: [String: [String]]())
        controller.reset(preference)

        var result = controller.retrive(preference)
        XCTAssertEqual(result, preference.defaultValue)
        
        let testValue = ["a": ["one", "neo", "eon"], "b": ["two", "wot", "otw"]]
        
        controller.save(testValue, to: preference)
        
        result = controller.retrive(preference)
        XCTAssertEqual(result, testValue)
    }
    
    func testNastedDictArray() {
        let preference = Preference<[String: [String: [String]]]>.readWrite("dict-example", defaultValue: [String: [String: [String]]]())
        controller.reset(preference)

        var result = controller.retrive(preference)
        XCTAssertEqual(result, preference.defaultValue)
        
        let testValue = ["a": ["1": ["one", "neo", "eon"]], "b": ["2": ["two", "wot", "otw"]]]
        
        controller.save(testValue, to: preference)
        
        result = controller.retrive(preference)
        XCTAssertEqual(result, testValue)
    }
    
    func testCustomKey() {
        let preference = Preference<[Int: String]>.readWrite("dict-example", defaultValue: [Int: String]())
        controller.reset(preference)

        var result = controller.retrive(preference)
        XCTAssertEqual(result, preference.defaultValue)
        
        let testValue = [42: "universe"]
        
        controller.save(testValue, to: preference)
        
        result = controller.retrive(preference)
        XCTAssertEqual(result, testValue)
    }

    static var allTests = [
        ("testDict", testDict),
        ("testDictArray", testDictArray),
        ("testNastedDictArray", testNastedDictArray),
        ("testCustomKey", testCustomKey)
    ]
    
}
