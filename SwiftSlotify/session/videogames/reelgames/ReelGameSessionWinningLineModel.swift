public protocol ReelGameSessionWinningLineModel {

    var direction: ReelGameSessionLinesDirectionData { get }

    var itemId: String { get }

    var lineId: UInt { get }

    var itemsPositions: [UInt] { get }

    var wildItemsPositions: [UInt] { get }

    var winningAmount: UInt { get }

}
