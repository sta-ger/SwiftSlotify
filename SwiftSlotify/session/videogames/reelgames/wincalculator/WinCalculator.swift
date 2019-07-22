public protocol WinCalculator {

    var availableBets: [UInt] { get }

    var paytable: ReelGameSessionPaytableData { get set }

    var wildItemId: String { get set }

    var scattersData: [ReelGameSessionScatterData] { get set }

    var reelsNumber: UInt { get set }

    var reelsItemsNumber: UInt { get set }

    var linesDirections: ReelGameSessionLinesDirectionData { get set }

    var wildsMultipliers: ReelGameSessionWildsMultipliersData { get set }

}
