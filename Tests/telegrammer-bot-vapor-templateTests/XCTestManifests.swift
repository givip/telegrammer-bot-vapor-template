import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(telegrammer_bot_vapor_templateTests.allTests),
    ]
}
#endif
