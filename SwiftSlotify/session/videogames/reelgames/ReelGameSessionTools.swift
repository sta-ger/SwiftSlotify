public struct ReelGameSessionTools {

    public static func transposeItemsMatrix(source: [[String]]) -> [[String]] {
        var tmp: [[String]] = [[String]]()
        for i in 0..<source.count {
            for j in 0..<source[0].count {
                tmp[j][i] = source[i][j]
            }
        }
        return tmp
    }

    public static func createReelsItemsSequences(reelsNumber: UInt, availableItems: [String]) -> [[String]] {
        var r: [[String]] = [[String]]()
        for i in 0..<reelsNumber {
            let seq: [String] = availableItems
                    .reduce("", (a, b) -> a.concat(String.join(",", availableItems) + ","))
                    .split(",")
            Collections.shuffle(Arrays.asList(seq))
            r[i] = seq
        }
        return r
    }

}
