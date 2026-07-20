class UG1RPerceptionAgentSettings_Razor : UG1RPerceptionAgentSettings_Creature
{
    default Normal.Sight.OuterCoffin.Length = 2000.0f;
    default Normal.Sight.InnerCoffin.Length = 1000.0f;

    default Normal.Hearing.SetCloseRangeDistance(1000.0f);
    default Normal.Hearing.SetMidRangeDistance(1200.0f);
    default Normal.Hearing.SetFarRangeDistance(1500.0f);

    default Normal.Smell.SetCloseRangeDistance(350.0f);
    default Normal.Smell.SetMidRangeDistance(1200.0f);
    default Normal.Smell.SetFarRangeDistance(1500.0f);   
}