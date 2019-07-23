public class ReelGameSessionWildsMultipliersDataPowerOfTwo: ReelGameSessionWildsMultipliersData {

    public func getMultiplierValueForWildsNum(_ wildNum: UInt) -> UInt {
        var rv: UInt = 1
        for _ in 0...wildNum {
            rv *= wildNum
        }
        return rv
    }

}
