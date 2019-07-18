public protocol GameSession {

    var creditsAmount: UInt { get set }

    var winningAmount: UInt { get }

    var availableBets: [UInt] { get }

    func isBetAvailable(_ bet: UInt) -> Bool

    var bet: UInt { get set }

    var canPlayNextGame: Bool { get }

}
