public protocol ReelGameSessionConfig: GameSessionConfig, ReelGameSessionReelsControllerConfig, ReelGameSessionWinCalculatorConfig {

    func isItemWild(_ itemId: String) -> Bool;

    func isItemScatter(_ itemId: String) -> Bool;

}
