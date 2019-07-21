@testable import SwiftSlotify
import XCTest

class DefaultGameSessionTest: XCTestCase  {

    public static func testDefaultSessionHasProperInitialValues(_ session: GameSession, _ config: GameSessionConfig) {
        XCTAssertEqual(session.availableBets, config.availableBets)
        XCTAssertEqual(session.bet, config.availableBets[0])
        XCTAssertEqual(session.creditsAmount, DefaultGameSessionConfig.defaultCreditsAmount)
        XCTAssertEqual(session.winningAmount, 0)
    }

    public static func createCustomConfigForTestProperInitialValues() -> GameSessionConfig {
        var conf: GameSessionConfig = DefaultGameSessionConfig()
        conf.availableBets = [10, 20, 30]
        conf.creditsAmount = 5000
        return conf
    }

    public static func testDefaultSessionHasProperInitialValuesWithCustomConfig(
            _ session: GameSession,
            _ config: GameSessionConfig
    ) {
        XCTAssertFalse(session.isBetAvailable(1))
        XCTAssertTrue(session.isBetAvailable(10))
        XCTAssertEqual(session.availableBets, config.availableBets)
        XCTAssertEqual(session.bet, config.availableBets[0])
        XCTAssertEqual(session.creditsAmount, config.creditsAmount)
    }

    public static func createCustomConfigForWrongBetTest() -> GameSessionConfig {
        var config = DefaultGameSessionConfig()
        config.availableBets = [10, 20, 30]
        return config
    }

    public static func testDefaultSessionWithWrongInitialBet(
            _ session: inout GameSession,
            _ config: GameSessionConfig
    ) {
        var bet: UInt = config.availableBets[0]
        while (session.isBetAvailable(bet)) {
            bet = UInt.random(in: 0..<100)
        }
        session.bet = bet
        XCTAssertEqual(session.bet, config.availableBets[0])
    }

    public static func testDefaultSessionPlaysWhileEnoughCredits(_ session: inout GameSession) {
        session.bet = 10
        session.play()
        XCTAssertEqual(session.creditsAmount, 990)
        XCTAssertTrue(session.canPlayNextGame)

        // Play with different bet
        session.bet = 100
        session.play()
        XCTAssertEqual(session.creditsAmount, 890)
        XCTAssertTrue(session.canPlayNextGame)

        var playedGamesNum: UInt = 0
        var expectedGamesToPlay: UInt = session.creditsAmount / session.bet
        while (session.canPlayNextGame) {
            session.play()
            playedGamesNum += 1
        }

        XCTAssertEqual(playedGamesNum, expectedGamesToPlay)

        // Decrease bet to 10 and play remaining 9 games
        session.bet = 10

        playedGamesNum = 0
        expectedGamesToPlay = session.creditsAmount / session.bet
        while (session.canPlayNextGame) {
            session.play()
            playedGamesNum += 1
        }

        XCTAssertEqual(playedGamesNum, expectedGamesToPlay)
    }

    public func testCreateNewSession() {
        let conf: GameSessionConfig = DefaultGameSessionConfig()
        DefaultGameSessionTest.testDefaultSessionHasProperInitialValues(DefaultGameSession(conf), conf)
    }

    public func testCreateNewSessionWithCustomConfig() {
        let conf: GameSessionConfig = DefaultGameSessionTest.createCustomConfigForTestProperInitialValues()
        DefaultGameSessionTest.testDefaultSessionHasProperInitialValuesWithCustomConfig(DefaultGameSession(conf), conf)
    }

    public func testCreateNewSessionWithWrongBet() {
        let conf: GameSessionConfig = DefaultGameSessionTest.createCustomConfigForWrongBetTest()
        DefaultGameSessionTest.testDefaultSessionWithWrongInitialBet(
                DefaultGameSession(conf),
                DefaultGameSessionTest.createCustomConfigForTestProperInitialValues()
        )
    }

    public func testPlayWhileEnoughCredits() {
        let conf: GameSessionConfig = DefaultGameSessionConfig()
        DefaultGameSessionTest.testDefaultSessionPlaysWhileEnoughCredits(DefaultGameSession(conf))
    }

}
