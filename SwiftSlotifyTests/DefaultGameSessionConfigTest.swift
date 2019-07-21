@testable import SwiftSlotify
import XCTest

class DefaultGameSessionConfigTest: XCTestCase {
    public static let CUSTOM_AVAILABLE_BETS: [UInt] = [10, 20, 30]
    public static let CUSTOM_BET: UInt = 10
    public static let CUSTOM_CREDITS: UInt = 99

    public static func testDefaultConfig(_ conf: GameSessionConfig) {
        XCTAssertEqual(conf.availableBets, DefaultGameSessionConfig.defaultAvailableBets)
        XCTAssertEqual(conf.creditsAmount, DefaultGameSessionConfig.defaultCreditsAmount)
        XCTAssertEqual(conf.bet, conf.availableBets[0])
    }

    public static func testCustomConfig(_ conf: GameSessionConfig) {
        XCTAssertEqual(conf.availableBets, CUSTOM_AVAILABLE_BETS)
        XCTAssertEqual(conf.bet, CUSTOM_BET)
        XCTAssertEqual(conf.creditsAmount, CUSTOM_CREDITS)
    }

    func testDefaultConfig() {
        DefaultGameSessionConfigTest.testDefaultConfig(DefaultGameSessionConfig())
    }

    func testCustomConfig() {
        var conf = DefaultGameSessionConfig()
        conf.availableBets = DefaultGameSessionConfigTest.CUSTOM_AVAILABLE_BETS
        conf.creditsAmount = DefaultGameSessionConfigTest.CUSTOM_CREDITS
        DefaultGameSessionConfigTest.testCustomConfig(conf)
    }

}
