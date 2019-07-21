public class DefaultGameSession: GameSession {
    private var _creditsAmount: UInt = 0
    private var _availableBets: [UInt] = []
    private var _bet: UInt = 0
    private var _config: GameSessionConfig

    public init(_ config: GameSessionConfig) {
        _config = config;
        _bet = getInitialBet();
        _creditsAmount = _config.creditsAmount;
    }

    private func getInitialBet() -> UInt {
        var initialBet: UInt;
        if (isBetAvailable(_config.bet)) {
            initialBet = _config.bet;
        } else {
            initialBet = _config.availableBets[0];
        }
        return initialBet;
    }

    public var creditsAmount: UInt {
        get {
            return _creditsAmount
        }
        set {
            _creditsAmount = newValue
        }
    }

    public var bet: UInt {
        get {
            return _bet
        }
        set {
            _bet = newValue
        }
    }

    public var winningAmount: UInt {
        get {
            return 0
        }
    }

    public var availableBets: [UInt] {
        get {
            return _config.availableBets
        }
    }

    public func isBetAvailable(_ bet: UInt) -> Bool {
        return _config.availableBets.contains(bet)
    }

    public var canPlayNextGame: Bool {
        get {
            return _creditsAmount >= bet;
        }
    }

    public func play() {

    }
}
