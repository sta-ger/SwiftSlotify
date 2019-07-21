@testable import SwiftSlotify
import XCTest

class DefaultGameSessionConfigTest: XCTestCase {
    public static let customAvailableBets: [UInt] = [10, 20, 30]
    public static let customBet: UInt = 10
    public static let customCredits: UInt = 99

    public static func testDefaultConfig(_ conf: GameSessionConfig) {
        XCTAssertEqual(conf.availableBets, DefaultGameSessionConfig.defaultAvailableBets)
        XCTAssertEqual(conf.creditsAmount, DefaultGameSessionConfig.defaultCreditsAmount)
        XCTAssertEqual(conf.bet, conf.availableBets[0])
    }

    public static func testCustomConfig(_ conf: GameSessionConfig) {
        XCTAssertEqual(conf.availableBets, customAvailableBets)
        XCTAssertEqual(conf.bet, customBet)
        XCTAssertEqual(conf.creditsAmount, customCredits)
    }

    func testDefaultConfig() {
        DefaultGameSessionConfigTest.testDefaultConfig(DefaultGameSessionConfig())
    }

    func testCustomConfig() {
        var conf = DefaultGameSessionConfig()
        conf.availableBets = DefaultGameSessionConfigTest.customAvailableBets
        conf.creditsAmount = DefaultGameSessionConfigTest.customCredits
        DefaultGameSessionConfigTest.testCustomConfig(conf)
    }

}
