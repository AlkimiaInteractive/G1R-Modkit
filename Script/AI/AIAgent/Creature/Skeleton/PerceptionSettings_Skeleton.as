// class UG1RPerceptionAgentSettings_Skeleton : UG1RPerceptionAgentSettings_Humanoid
// {
//     default Normal.Sight.GoodVisionRange = 1000.0f;
//     default Normal.Sight.VisionRange = 1000.0f;
// }

class UG1RPerceptionAgentSettings_Skeleton : UG1RPerceptionAgentSettings_Humanoid
{
    default Normal.Sight.OuterCoffin.Length = 1500.0f;
    default Normal.Sight.InnerCoffin.Length = 1000.0f;

    default Normal.Hearing.SetCloseRangeDistance(1000.0f);
    default Normal.Hearing.SetMidRangeDistance(1200.0f);
    default Normal.Hearing.SetFarRangeDistance(1500.0f);

    default Normal.Smell.SetCloseRangeDistance(350.0f);
    default Normal.Smell.SetMidRangeDistance(1200.0f);
    default Normal.Smell.SetFarRangeDistance(1500.0f);   
}

class UG1RPerceptionAgentSettings_SkeletonMage : UG1RPerceptionAgentSettings_Humanoid
{
    default Normal.Sight.OuterCoffin.Length = 3000.0f;
    default Normal.Sight.InnerCoffin.Length = 1500.0f;

    default Normal.Hearing.SetCloseRangeDistance(1000.0f);
    default Normal.Hearing.SetMidRangeDistance(1500.0f);
    default Normal.Hearing.SetFarRangeDistance(2000.0f);
}