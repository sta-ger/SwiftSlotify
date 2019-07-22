public protocol ReelGameSessionScatterData {

    var itemId: String { get }

    func getMinimumItemsNumForScatterWin() -> UInt

}
