public struct ReelGameSessionTools {

    public static func transposeItemsMatrix(_ source: [[String]]) -> [[String]] {
        var r: [[String]] = [[String]]()
        for i in 0..<source.count {
            for j in 0..<source[0].count {
                r[j][i] = source[i][j]
            }
        }
        return r
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
