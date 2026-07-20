class UG1RPerceptionAgentSettings_Minecrawler_Queen : UG1RPerceptionAgentSettings_Creature
{
    default Normal.Sight.InnerCoffin.Length = 5000.0f;
    default Normal.Sight.InnerCoffin.GoodVisionLength = 5000.0f;
    default Normal.Sight.InnerCoffin.CloseHalfWidth = 600;
    default Normal.Sight.InnerCoffin.MiddleHalfWidth = 1000;
    default Normal.Sight.InnerCoffin.FarHalfWidth = 600;

    default Normal.Sight.OuterCoffin.Length = 5000.0f;
    default Normal.Sight.OuterCoffin.GoodVisionLength = 5000.0f;
    default Normal.Sight.OuterCoffin.CloseHalfWidth = 1200;
    default Normal.Sight.OuterCoffin.MiddleHalfWidth = 1200;
    default Normal.Sight.OuterCoffin.FarHalfWidth = 1200;

    default Normal.Sight.SixthSense.VerticalOffset = 50;
    default Normal.Sight.SixthSense.BlindSpotHalfAngle = 45;
    default Normal.Sight.SixthSense.HalfLength = 50;
    default Normal.Sight.SixthSense.HalfWidth = 250;

    default Normal.Hearing.SetCloseRangeDistance(1200.0f);
    default Normal.Hearing.SetMidRangeDistance(2000.0f);
    default Normal.Hearing.SetFarRangeDistance(3000.0f);

    default Normal.Smell.SetCloseRangeDistance(350.0f);
    default Normal.Smell.SetMidRangeDistance(1500.0f);
    default Normal.Smell.SetFarRangeDistance(3000.0f);   

    // default Normal.Sight.bRequiresFreeLineOfSight = true; //true

    // default Normal.Sight.MovementModifier.Add(GameplayTag::State_Movement_Walking, 10.0f);
    // default Normal.Sight.MovementModifier.Add(GameplayTag::State_Movement_Running, 10.0f);
    // default Normal.Sight.MovementModifier.Add(GameplayTag::State_Movement_Sprinting, 15.0f);

    // default Normal.Sight.MovementModeDefaultModifier = 10.0f;
    // default Normal.Sight.MovementModeModifier.Add(GameplayTag::State_Movement_Crouching, 0.0f);
    // default Normal.Sight.MovementModeModifier.Add(GameplayTag::State_Swimming, -5.0f);
    // default Normal.Sight.MovementModeModifier.Add(GameplayTag::State_Movement_Diving, -10.0f);

    // default Normal.Sight.SetWeatherModifier(0.0f, -5.0f, -10.0f);

    // default Normal.Sight.ExcludingTags.AddTag(GameplayTag::Debuff_Blind);
    // default Normal.Sight.ExcludingTags.AddTag(GameplayTag::State_Defeated);
    // default Normal.Sight.ExcludingTags.AddTag(GameplayTag::State_Dead);
    // default Normal.Sight.LoseAwarenessWithExcludingTags = true;

    // default Normal.Sight.SenseModifier = 20.0;
    // default Normal.Sight.SenseModifierThreshold = 50.0f;
    // default Normal.Sight.AwarenessWearoffFactorNoLineOfSight = 40.0f;
    // default Normal.Sight.AwarenessWearoffFactorOutOfShape = 0.0f;

    // default Normal.Sight.HeightParabolAlpha = -0.0003f;
    // default Normal.Sight.HeightParabolOffsetY = 0.6f;
    // default Normal.Sight.HeightParabolOffsetZ = 0.4f;
    
    // default Normal.Hearing.SetCloseRangeDistance(400.0f);
    // default Normal.Hearing.SetMidRangeDistance(800.0f);
    // default Normal.Hearing.SetFarRangeDistance(1200.0f);

    // default Normal.Hearing.SetLoudnessModifierMid(0.0f, 0.5f, 1.0f, 1.5f, 4.0f);
    // default Normal.Hearing.SetWeatherModifier(-5.0f, -10.0f, -15.0f);

    // default Normal.Hearing.ExcludingTags.AddTag(GameplayTag::Debuff_Deaf);
    // default Normal.Hearing.ExcludingTags.AddTag(GameplayTag::State_Defeated);
    // default Normal.Hearing.ExcludingTags.AddTag(GameplayTag::State_Dead);
    // default Normal.Hearing.LoseAwarenessWithExcludingTags = true;

    // default Normal.Hearing.AwarenessWearoffFactor = 40.0f;    

    // default Normal.Smell.SetWeatherModifier(-5.0f, -10.0f, -15.0f);
    // default Normal.Smell.ExcludingTags.AddTag(GameplayTag::Debuff_Anosmic);
    // default Normal.Smell.ExcludingTags.AddTag(GameplayTag::State_Defeated);
    // default Normal.Smell.ExcludingTags.AddTag(GameplayTag::State_Dead);
    // default Normal.Smell.LoseAwarenessWithExcludingTags = true;

    // default Normal.Smell.AwarenessWearoffFactor = 40.0f;

    // default HighAlert = Normal;
    // //default HighAlert.Sight.GoodVisionRange = 4000.0f;
    // //default HighAlert.Sight.VisionRange = 4000.0f;
    // default HighAlert.Sight.bRequiresFreeLineOfSight = true;
    // //default HighAlert.Sight.VisionConeAngleDegrees = 360;

    // default HighAlert.Sight.InnerCoffin.Length = 1200.0f; //1200.0f
    // default HighAlert.Sight.InnerCoffin.GoodVisionLength = 400.0f; //400.0f
    // default HighAlert.Sight.InnerCoffin.CloseHalfWidth = 150;
    // default HighAlert.Sight.InnerCoffin.MiddleHalfWidth = 250;
    // default HighAlert.Sight.InnerCoffin.FarHalfWidth = 150;

    // default HighAlert.Sight.OuterCoffin.Length = 1200.0f; //1500.0f
    // default HighAlert.Sight.OuterCoffin.GoodVisionLength = 700.0f; //700.0f
    // default HighAlert.Sight.OuterCoffin.CloseHalfWidth = 300;
    // default HighAlert.Sight.OuterCoffin.MiddleHalfWidth = 450;
    // default HighAlert.Sight.OuterCoffin.FarHalfWidth = 300;

    // default HighAlert.Sight.SixthSense.VerticalOffset = 50;
    // default HighAlert.Sight.SixthSense.BlindSpotHalfAngle = 45;
    // default HighAlert.Sight.SixthSense.HalfLength = 50;
    // default HighAlert.Sight.SixthSense.HalfWidth = 250;
    // default HighAlert.Sight.SixthSense.BlindSpotHalfAngle = 45;

    // default HighAlert.Sight.HeightParabolAlpha = 0.0f;
    // default HighAlert.Sight.HeightParabolOffsetY = 0.6f;
    // default HighAlert.Sight.HeightParabolOffsetZ = 0.4f;

    // default HighAlert.Sight.MovementModifier.Add(GameplayTag::State_Movement_Sneaking, 5.0f);
    // default HighAlert.Sight.MovementModifier.Add(GameplayTag::State_Movement, 10.0f);
    // default HighAlert.Sight.MovementModifier.Add(GameplayTag::State_Swimming, -10.0f);
    // default HighAlert.Sight.MovementModifier.Add(GameplayTag::State_Movement_Diving, -15.0f);

    // default Normal.Sight.SetWeatherModifier(0.0f, -5.0f, -10.0f);

    // default HighAlertWhen.AddTag(GameplayTag::State_HighAlert);
}
class UG1RPerceptionAgentSettings_Minecrawler_Queen_Ph2 : UG1RPerceptionAgentSettings_Creature
{
    default Normal.Sight.OuterCoffin.Length = 3000.0f;
    default Normal.Sight.InnerCoffin.Length = 1500.0f;

    default Normal.Hearing.SetCloseRangeDistance(1000.0f);
    default Normal.Hearing.SetMidRangeDistance(1200.0f);
    default Normal.Hearing.SetFarRangeDistance(1500.0f);

    default Normal.Smell.SetCloseRangeDistance(350.0f);
    default Normal.Smell.SetMidRangeDistance(1200.0f);
    default Normal.Smell.SetFarRangeDistance(1500.0f);   
}