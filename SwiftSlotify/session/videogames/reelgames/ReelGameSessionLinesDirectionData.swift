public protocol ReelGameSessionLinesDirectionData {

    func getVerticalItemsPositionsForLineId(lineId: UInt) -> [UInt]

    func getLinesIds() -> [UInt]

}
