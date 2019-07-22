public class DefaultReelGameSessionScatterData: ReelGameSessionScatterData {
    private let _itemId: String
    private let _minimumItemsNumForScatterWin: UInt

    public init(_ itemId: String, _ minimumItemsNumForScatterWin: UInt) {
        _itemId = itemId
        _minimumItemsNumForScatterWin = minimumItemsNumForScatterWin
    }

    public var itemId: String {
        get {
            return _itemId
        }
    }

    public func getMinimumItemsNumForScatterWin() -> UInt {
        return _minimumItemsNumForScatterWin
    }
}
