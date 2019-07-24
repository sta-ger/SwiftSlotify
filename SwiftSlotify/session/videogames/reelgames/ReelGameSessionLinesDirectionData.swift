public protocol ReelGameSessionLinesDirectionData {

    func getVerticalItemsPositionsForLineId(_ lineId: UInt) -> [UInt]

    func getLinesIds() -> [UInt]

}
