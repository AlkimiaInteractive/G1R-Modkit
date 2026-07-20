class UG1RPerceptionAgentSettings_Molerat : UG1RPerceptionAgentSettings_Creature
{
    default Normal.Sight.InnerCoffin.Length = 1000.0f;
    default Normal.Sight.InnerCoffin.GoodVisionLength = 400.0f;
    default Normal.Sight.InnerCoffin.CloseHalfWidth = 150;
    default Normal.Sight.InnerCoffin.MiddleHalfWidth = 250;
    default Normal.Sight.InnerCoffin.FarHalfWidth = 150;

    default Normal.Sight.OuterCoffin.Length = 1000.0f;
    default Normal.Sight.OuterCoffin.GoodVisionLength = 700.0f;
    default Normal.Sight.OuterCoffin.CloseHalfWidth = 300;
    default Normal.Sight.OuterCoffin.MiddleHalfWidth = 450;
    default Normal.Sight.OuterCoffin.FarHalfWidth = 300;

    default Normal.Hearing.SetCloseRangeDistance(800.0f);
    default Normal.Hearing.SetMidRangeDistance(900.0f);
    default Normal.Hearing.SetFarRangeDistance(1000.0f);
}