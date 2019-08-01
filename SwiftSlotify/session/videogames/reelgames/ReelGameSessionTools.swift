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
        for _ in 0..<reelsNumber {
            let str: String = availableItems.reduce("", { a, b in
                a + availableItems.joined(separator: ",") + ","
            })
            var arr: [String] = str.components(separatedBy: ",")
            arr.shuffle()

            r.append(arr)
        }
        return r
    }

}
