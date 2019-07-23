@testable import SwiftSlotify
import XCTest

class DefaultReelGameSessionWinCalculatorTest: XCTestCase {
    private let _config: ReelGameSessionConfig = DefaultReelGameSessionConfig()

    private func testWinning(bet: UInt, lines: Dictionary<UInt, ReelGameSessionWinningLineModel>) {
        lines.forEach({
            let lineId: UInt = $0
            let line: ReelGameSessionWinningLineModel = $1
            let lineWin: UInt = _config.getPaytable().getWinningAmountForItem(
                    line.getItemId(),
                    line.getItemsPositions().length,
                    bet
            )
            let wildMlt: UInt = _config.getWildsMultipliers().getMultiplierValueForWildsNum(
                    line.getWildItemsPositions().length
            )
            XCTAssertEqual(line.winningAmount, lineWin * wildMlt)
        })
    }

}
