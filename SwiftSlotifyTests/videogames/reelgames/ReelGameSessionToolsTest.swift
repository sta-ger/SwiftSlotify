@testable import SwiftSlotify
import XCTest

public class ReelGameSessionToolsTest: XCTestCase {

    public func testTransposeMatrix() {
        XCTAssertEqual(ReelGameSessionTools.transposeItemsMatrix([
            ["1", "2", "3", "4"],
            ["5", "6", "7", "8"],
        ]), [
            ["1", "5"],
            ["2", "6"],
            ["3", "7"],
            ["4", "8"],
        ])
    }

}