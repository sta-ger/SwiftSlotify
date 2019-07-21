public struct DefaultGameSessionConfig: GameSessionConfig {
    public static let defaultAvailableBets: [UInt] = [1, 2, 3, 4, 5, 10, 20, 30, 40, 50, 100]
    public static let defaultCreditsAmount: UInt = 1000

    private var _availableBets: [UInt] = defaultAvailableBets
    private var _creditsAmount: UInt = defaultCreditsAmount
    private var _bet: UInt = 0

    public init() {
        setBetOfAvailableBets()
    }

    private mutating func setBetOfAvailableBets() {
        _bet = _availableBets[0]
    }

    public var availableBets: [UInt] {
        get {
            return _availableBets
        }
        set {
            _availableBets = newValue
            self.setBetOfAvailableBets()
        }
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
            if _availableBets.contains(newValue) {
                _bet = newValue
            }
        }
    }

}
