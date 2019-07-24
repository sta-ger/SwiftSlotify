public protocol ReelGameSessionReelsControllerConfig {

    var reelsNumber: UInt { get set }

    var reelsItemsNumber: UInt { get set }

    var availableItems: [String] { get set }

    var reelsItemsSequences: [[String]] { get set }

}
