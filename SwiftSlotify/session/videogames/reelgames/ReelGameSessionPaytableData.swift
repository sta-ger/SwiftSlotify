public protocol ReelGameSessionPaytableData {

    func getWinningAmountForItem(_ itemId: String, _ numberOfItems: UInt, _ bet: UInt) -> UInt

}
