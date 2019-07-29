public class DefaultReelGameSessionConfig: ReelGameSessionConfig {
    public static let defaultWildItemId: String = "W"
    public static let defaultScatterItemId: String = "S"

    public static let defaultMinimumItemsNumForScatterWin: UInt = 3
    public static let defaultReelsNumber: UInt = 5
    public static let defaultReelsItemsNumber: UInt = 3

    public static let defaultAvailableItems: [String] = [
        "A",
        "K",
        "Q",
        "J",
        "10",
        "9",
        "W",
        "S"
    ]

    private var _wildItemId: String = DefaultReelGameSessionConfig.defaultWildItemId
    private var _reelsNumber: UInt = DefaultReelGameSessionConfig.defaultReelsNumber
    private var _reelsItemsNumber: UInt = DefaultReelGameSessionConfig.defaultReelsItemsNumber
    private var _availableItems: [String] = DefaultReelGameSessionConfig.defaultAvailableItems

    private var _baseConfig: DefaultGameSessionConfig = DefaultGameSessionConfig()

    private var _paytable: ReelGameSessionPaytableData
    private var _scattersData: [ReelGameSessionScatterData]
    private var _linesDirections: ReelGameSessionLinesDirectionData
    private var _wildsMultipliers: ReelGameSessionWildsMultipliersData
    private var _reelsItemsSequences: [[String]] = []

    public init() {
        // TMP
        _paytable = DefaultReelGameSessionPaytableData(Dictionary<UInt, Dictionary<String, Dictionary<UInt, UInt>>>())
        _scattersData = [DefaultReelGameSessionScatterData("S", 3)]
        _linesDirections = DefaultReelGameSessionLinesDirectionData(Dictionary<UInt, [UInt]>())
        _wildsMultipliers = ReelGameSessionWildsMultipliersDataNoMultipliers()
        _reelsItemsSequences = [[String]]()
    }

    public func isItemWild(_ itemId: String) -> Bool {
        return itemId == _wildItemId
    }

    public func isItemScatter(_ itemId: String) -> Bool {
        return _scattersData.contains {
            $0.itemId == itemId
        }
    }

    public var creditsAmount: UInt {
        get {
            return _baseConfig.creditsAmount
        }
        set {
            _baseConfig.creditsAmount = newValue
        }
    }

    public var bet: UInt {
        get {
            return _baseConfig.bet
        }
        set {
            _baseConfig.bet = newValue
        }
    }

    public var availableItems: [String] {
        get {
            return _availableItems
        }
        set {
            _availableItems = newValue
        }
    }

    public var reelsItemsSequences: [[String]] {
        get {
            return _reelsItemsSequences
        }
        set {
            _reelsItemsSequences = newValue
        }
    }

    public var availableBets: [UInt] {
        get {
            return _baseConfig.availableBets
        }
        set {
            _baseConfig.availableBets = newValue
        }
    }

    public var paytable: ReelGameSessionPaytableData {
        get {
            return _paytable
        }
        set {
            _paytable = paytable
        }
    }

    public var wildItemId: String {
        get {
            return _wildItemId
        }
        set {
            _wildItemId = newValue
        }
    }

    public var scattersData: [ReelGameSessionScatterData] {
        get {
            return _scattersData
        }
        set {
            _scattersData = newValue
        }
    }

    public var reelsNumber: UInt {
        get {
            return _reelsNumber
        }
        set {
            _reelsNumber = newValue
        }
    }

    public var reelsItemsNumber: UInt {
        get {
            return _reelsItemsNumber
        }
        set {
            _reelsItemsNumber = newValue
        }
    }

    public var linesDirections: ReelGameSessionLinesDirectionData {
        get {
            return _linesDirections
        }
        set {
            _linesDirections = newValue
        }
    }

    public var wildsMultipliers: ReelGameSessionWildsMultipliersData {
        get {
            return _wildsMultipliers
        }
        set {
            _wildsMultipliers = newValue
        }
    }
}
