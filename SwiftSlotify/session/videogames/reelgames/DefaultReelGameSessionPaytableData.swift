public class DefaultReelGameSessionPaytableData: ReelGameSessionPaytableData {
    private let _paytableDictionary: Dictionary<UInt, Dictionary<String, Dictionary<UInt, UInt>>>

    public init(_ paytableDictionary: Dictionary<UInt, Dictionary<String, Dictionary<UInt, UInt>>>) {
        _paytableDictionary = paytableDictionary
    }

    public func getWinningAmountForItem(itemId: String, numberOfItems: UInt, bet: UInt) -> UInt {
        var rv: UInt = 0
        if (
                   _paytableDictionary[bet] != nil &&
                           _paytableDictionary[bet]![itemId] != nil &&
                           _paytableDictionary[bet]![itemId]![numberOfItems] != nil
           ) {
            rv = _paytableDictionary[bet]![itemId]![numberOfItems]!
        }
        return rv
    }

}
