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

    public func testCreateReelsItemsSequences() {
        let availableItems = [
            "A",
            "K",
            "Q",
            "J",
            "10",
            "9",
        ]
        let sequences = ReelGameSessionTools.createReelsItemsSequences(reelsNumber: 5, availableItems: availableItems)
        XCTAssertEqual(sequences.count, 5)

        sequences.forEach {
            let seq = $0
            availableItems.forEach {
                let item = $0
                XCTAssertTrue(seq.contains(item))
            }
        }
    }

}
