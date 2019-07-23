public class DefaultReelGameSessionConfig: ReelGameSessionConfig {
    public var availableBets: [UInt] = []

    public var creditsAmount: UInt = 0
    public var bet: UInt = 0
    public var paytable: ReelGameSessionPaytableData
    public var wildItemId: String = ""
    public var scattersData: [ReelGameSessionScatterData] = []
    public var reelsNumber: UInt = 0
    public var reelsItemsNumber: UInt = 0
    public var linesDirections: ReelGameSessionLinesDirectionData
    public var wildsMultipliers: ReelGameSessionWildsMultipliersData

    public init() {
        paytable = DefaultReelGameSessionPaytableData(Dictionary<UInt, Dictionary<String, Dictionary<UInt, UInt>>>())
        linesDirections = DefaultReelGameSessionLinesDirectionData(Dictionary<UInt, [UInt]>())
        wildsMultipliers = ReelGameSessionWildsMultipliersDataPowerOfTwo()
    }

    public func isItemWild(itemId: String) -> Bool {
        fatalError("isItemWild(itemId:) has not been implemented")
    }

    public func isItemScatter(itemId: String) -> Bool {
        fatalError("isItemScatter(itemId:) has not been implemented")
    }
}
