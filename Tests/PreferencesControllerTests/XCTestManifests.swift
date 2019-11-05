import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(BooleanTests.allTests),
        testCase(IntegerTests.allTests),
        testCase(StringTests.allTests),
        testCase(ArrayTests.allTests),
        testCase(SubscriptionTests.allTests)
    ]
}
#endif
