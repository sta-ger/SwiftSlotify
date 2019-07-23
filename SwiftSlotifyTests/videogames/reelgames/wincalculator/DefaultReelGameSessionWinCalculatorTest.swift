@testable import SwiftSlotify
import XCTest

class DefaultReelGameSessionWinCalculatorTest: XCTestCase {
    private let _config: ReelGameSessionConfig = DefaultReelGameSessionConfig()

    private func testWinning(bet: UInt, lines: Dictionary<UInt, ReelGameSessionWinningLineModel>) {
        lines.forEach({
            let line: ReelGameSessionWinningLineModel = $1
            let lineWin: UInt = _config.paytable.getWinningAmountForItem(
                    line.itemId,
                    UInt(line.itemsPositions.count),
                    bet
            )
            let wildMlt: UInt = _config.wildsMultipliers.getMultiplierValueForWildsNum(
                    UInt(line.wildItemsPositions.count)
            )
            XCTAssertEqual(line.winningAmount, lineWin * wildMlt)
        })
    }

}
