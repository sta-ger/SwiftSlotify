public protocol ReelGameSessionConfig: GameSessionConfig, ReelGameSessionReelsControllerConfig, ReelGameSessionWinCalculatorConfig {

    func isItemWild(itemId: String) -> Bool;

    func isItemScatter(itemId: String) -> Bool;

}
