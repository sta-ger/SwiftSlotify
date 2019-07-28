public struct ReelGameSessionTools {

    public static func transposeItemsMatrix(source: [[String]]) -> [[String]] {
        var tmp: [[String]] = [[String]]()
        for i in 0 ..< source.count {
            for j in 0 ..< source[0].count {
                tmp[j][i] = source[i][j]
            }
        }
        return tmp
    }

}
