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
        /*Stream.of(conf.getReelsItemsSequences()).forEach(seq -> Stream.of(conf.getAvailableItems()).forEach(item ->
                //Check if every of available items exists on each sequence
                assertTrue(Arrays.asList(seq).contains(item))
        ));*/
    }

}
