@testable import SwiftSlotify
import XCTest

public class DefaultReelGameSessionConfigTest: XCTestCase {

    private func testPaytableItem(_ paytable: ReelGameSessionPaytableData, _ itemId: String, _ num: UInt, _ bet: UInt, _ expected: UInt) {
        XCTAssertEqual(paytable.getWinningAmountForItem(itemId, num, bet), expected)
    }

    public func testCreateDefaultConfig() {
        let conf: ReelGameSessionConfig = DefaultReelGameSessionConfig()
        XCTAssertEqual(conf.wildItemId, DefaultReelGameSessionConfig.defaultWildItemId)

        XCTAssertEqual(conf.wildsMultipliers.getMultiplierValueForWildsNum(0), 1)
        XCTAssertEqual(conf.wildsMultipliers.getMultiplierValueForWildsNum(1), 2)
        XCTAssertEqual(conf.wildsMultipliers.getMultiplierValueForWildsNum(2), 4)
        XCTAssertEqual(conf.wildsMultipliers.getMultiplierValueForWildsNum(3), 8)
        XCTAssertEqual(conf.wildsMultipliers.getMultiplierValueForWildsNum(4), 16)
        XCTAssertEqual(conf.wildsMultipliers.getMultiplierValueForWildsNum(5), 32)

        XCTAssertEqual(conf.scattersData.count, 1)
        XCTAssertEqual(conf.scattersData[0].itemId, DefaultReelGameSessionConfig.defaultScatterItemId)
        XCTAssertEqual(conf.scattersData[0].getMinimumItemsNumForScatterWin(), 3)

        XCTAssertEqual(conf.reelsNumber, 5)
        XCTAssertEqual(conf.reelsItemsNumber, 3)

        XCTAssertEqual(conf.linesDirections.getVerticalItemsPositionsForLineId(0), [
            0, 0, 0, 0, 0
        ])
        XCTAssertEqual(conf.linesDirections.getVerticalItemsPositionsForLineId(1), [
            1, 1, 1, 1, 1
        ])
        XCTAssertEqual(conf.linesDirections.getVerticalItemsPositionsForLineId(2), [
            2, 2, 2, 2, 2
        ])
        XCTAssertEqual(conf.linesDirections.getLinesIds(), [
            0, 1, 2
        ])

        XCTAssertEqual(conf.reelsItemsSequences.count, Int(conf.reelsNumber))

        conf.availableItems.forEach {

            XCTAssertTrue(Array(conf.reelsItemsSequences.joined()).contains($0))

        }

        XCTAssertTrue(conf.availableItems.contains("A"))
        XCTAssertTrue(conf.availableItems.contains("K"))
        XCTAssertTrue(conf.availableItems.contains("Q"))
        XCTAssertTrue(conf.availableItems.contains("J"))
        XCTAssertTrue(conf.availableItems.contains("10"))
        XCTAssertTrue(conf.availableItems.contains("9"))
        XCTAssertTrue(conf.availableItems.contains("W"))
        XCTAssertTrue(conf.availableItems.contains("S"))

        conf.availableBets.forEach { bet in
            conf.availableItems.forEach { item in
                (1...3).forEach { num in
                    if (item != conf.wildItemId) {
                        testPaytableItem(
                                conf.paytable,
                                item,
                                UInt(num + 2),
                                bet,
                                bet * UInt(num)
                        )
                    }

                }
            }
        }
    }

    public func testIsItemWild() {
        let conf: ReelGameSessionConfig = DefaultReelGameSessionConfig()
        XCTAssertTrue(conf.isItemWild(DefaultReelGameSessionConfig.defaultWildItemId))
        XCTAssertFalse(conf.isItemWild("A"))
    }

    public func testIsItemScatter() {
        let conf: ReelGameSessionConfig = DefaultReelGameSessionConfig()
        XCTAssertTrue(conf.isItemScatter(DefaultReelGameSessionConfig.defaultScatterItemId))
        XCTAssertFalse(conf.isItemScatter("A"))
    }

}
