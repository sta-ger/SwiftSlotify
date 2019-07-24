public class DefaultReelGameSessionLinesDirectionData: ReelGameSessionLinesDirectionData {
    private let _linesDirectionsMap: Dictionary<UInt, [UInt]>

    public init(_ linesDirectionsMap: Dictionary<UInt, [UInt]>) {
        _linesDirectionsMap = linesDirectionsMap
    }

    public func getVerticalItemsPositionsForLineId(_ lineId: UInt) -> [UInt] {
        return _linesDirectionsMap[lineId]!;
    }

    public func getLinesIds() -> [UInt] {
        return Array(_linesDirectionsMap.keys)
    }

}
