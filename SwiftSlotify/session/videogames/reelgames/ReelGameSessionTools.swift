public struct ReelGameSessionTools {

    public static func transposeItemsMatrix(_ source: [[String]]) -> [[String]] {
        var r: [[String]] = [[String]]()
        for i in 0..<source.count {
            for j in 0..<source[0].count {
                if (!r.indices.contains(j)) {
                    r.append([])
                }
                r[j].append(source[i][j])
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

    public static func createItemsSequence(availableItems: [String]) -> [String] {
        return createItemsSequence(availableItems: availableItems, numberOfEachItem: nil)
    }

    public static func createItemsSequence(availableItems: [String], numberOfEachItem: [String : UInt]!) -> [String] {
        var rv: [String] = []
        availableItems.forEach {
            let itemId: String = $0
            var numberOfItem: UInt!
            if (numberOfEachItem != nil && numberOfEachItem.keys.contains(itemId)) {
                numberOfItem = numberOfEachItem[itemId]
            } else {
                numberOfItem = 1
            }
            let itemArr: [String] = Array(repeating: itemId, count: Int(numberOfItem!))
            rv = rv + itemArr
        }
        rv.shuffle()
        return rv
    }

    public static func createItemsSequence(availableItems: [String], numberOfItems: UInt) -> [String] {
        var rv: [String] = [String]()
        availableItems.forEach {
            let itemId: String = $0
            for _ in 0..<numberOfItems {
                rv.append(itemId)
            }
        }
        rv.shuffle()
        return rv
    }

}
