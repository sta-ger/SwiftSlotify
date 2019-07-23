public protocol ReelGameSessionConfig: GameSessionConfig, ReelGameSessionWinCalculatorConfig {

    func isItemWild(itemId: String) -> Bool;

    func isItemScatter(itemId: String) -> Bool;

}
