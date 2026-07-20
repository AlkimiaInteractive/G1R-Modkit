class UG1RPerceptionAgentSettings_Lurker : UG1RPerceptionAgentSettings_Creature
{
    default Normal.Sight.OuterCoffin.Length = 2000.0f;
    default Normal.Sight.InnerCoffin.Length = 1000.0f;

    default Normal.Hearing.SetCloseRangeDistance(700.0f);
    default Normal.Hearing.SetMidRangeDistance(1000.0f);
    default Normal.Hearing.SetFarRangeDistance(2000.0f);
}