class UGameTimeConfigG1R : UGameTimeSubsystemConfig
{
    /** Ingame seconds per realtime second */
    default GameTimeSpeed = 15.0f;

    /** What the ingame time should be when the game starts. */
    default StartTime = FInGameTime::Make(0, 12, 0, 0.0);
}