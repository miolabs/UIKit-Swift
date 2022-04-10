import XCTest
@testable import UIKit

final class UIKitTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(UIKit().text, "Hello, World!")
    }
}
