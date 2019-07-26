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

    private let _baseConfig: DefaultGameSessionConfig = DefaultGameSessionConfig()

    private var _paytable: ReelGameSessionPaytableData
    private var _scattersData: [ReelGameSessionScatterData]
    private var _linesDirections: ReelGameSessionLinesDirectionData
    private var _wildsMultipliers: ReelGameSessionWildsMultipliersData
    private var _reelsItemsSequences: [[String]] = []

    public init() {

    }

    public func isItemWild(_ itemId: String) -> Bool {
        return itemId == _wildItemId
    }

    public func isItemScatter(_ itemId: String) -> Bool {
        return _scattersData.contains {
            $0.itemId == itemId
        }

    }

}
