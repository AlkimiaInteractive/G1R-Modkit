class UG1RPerceptionAgentSettings : UPerceptionAgentSettings
{
    ////////////////////////////////////////////////
    //  SIGHT GEOMETRY
    ////////////////////////////////////////////////
    /// Inner coffin dimensions
    default Normal.Sight.InnerCoffin.Length = 1000.0f;
    default Normal.Sight.InnerCoffin.GoodVisionLength = 400.0f;
    default Normal.Sight.InnerCoffin.CloseHalfWidth = 150;
    default Normal.Sight.InnerCoffin.MiddleHalfWidth = 250;
    default Normal.Sight.InnerCoffin.FarHalfWidth = 150;

    /// Outer coffin dimensions
    default Normal.Sight.OuterCoffin.Length = 1200.0f;
    default Normal.Sight.OuterCoffin.GoodVisionLength = 700.0f;
    default Normal.Sight.OuterCoffin.CloseHalfWidth = 300;
    default Normal.Sight.OuterCoffin.MiddleHalfWidth = 450;
    default Normal.Sight.OuterCoffin.FarHalfWidth = 300;

    /// Back boxes dimensions
    default Normal.Sight.SixthSense.VerticalOffset = 50;
    default Normal.Sight.SixthSense.BlindSpotHalfAngle = 45;
    default Normal.Sight.SixthSense.HalfLength = 50;
    default Normal.Sight.SixthSense.HalfWidth = 250;

    /// Sight Shape modifiers
    default Normal.Sight.InnerCoffin.SenseShapeModifier = 2.0f;
    default Normal.Sight.OuterCoffin.SenseShapeModifier = 0.8f;
    default Normal.Sight.SixthSense.SenseShapeModifier = 0.3f;

    /// Line of sight usage
    default Normal.Sight.SetCloseRangeFractionDistance(.3f);
    default Normal.Sight.SetCloseRangeFractionModifier(100.0f);

    default Normal.Sight.SetMidRangeFractionDistance(.6f);
    default Normal.Sight.SetMidRangeFractionModifier(65.0f);
    
    default Normal.Sight.SetFarRangeFractionDistance(1.0f);
    default Normal.Sight.SetFarRangeFractionModifier(30.0f);

    /// Vision range definitions (as a fraction of outer coffin length)
    default Normal.Sight.bRequiresFreeLineOfSight = true;

    /// Vision vertical dimensions - use imgui to display the parabola    
    default Normal.Sight.HeightParabolAlpha = -0.0005f;
    default Normal.Sight.HeightParabolOffsetY = 0.55f;
    default Normal.Sight.HeightParabolOffsetZ = 0.35f;

    ////////////////////////////////////////////////
    //  SIGHT MODIFIERS
    ////////////////////////////////////////////////
    /// Movement speeed
    default Normal.Sight.MovementModifier.Add(GameplayTag::State_Movement_Walking, 5.0f);
    default Normal.Sight.MovementModifier.Add(GameplayTag::State_Movement_Running, 10.0f);
    default Normal.Sight.MovementModifier.Add(GameplayTag::State_Movement_Sprinting, 15.0f);

    /// Movement Stance
    default Normal.Sight.MovementModeDefaultModifier = 10.0f;
    default Normal.Sight.MovementModeModifier.Add(GameplayTag::State_Movement_Crouching, -10.0f);
    default Normal.Sight.MovementModeModifier.Add(GameplayTag::State_Swimming, -30.0f);
    default Normal.Sight.MovementModeModifier.Add(GameplayTag::State_Movement_Diving, -40.0f);

    // Lighting Conditions
    default Normal.Sight.MinLightModifier = 40.0f; // -30.0f;
    default Normal.Sight.MaxLightModifier = 40.0f;
    default Normal.Sight.MinLightIntensity = 0.0f;
    default Normal.Sight.MaxLightIntensity = 1.0f;

    /// Weather
    default Normal.Sight.SetWeatherModifier(0.0f, -1.0f, -2.0f);

    /// Impairing effects (make the character unable to see)
    default Normal.Sight.ExcludingTags.AddTag(GameplayTag::Debuff_Blind);
    default Normal.Sight.ExcludingTags.AddTag(GameplayTag::State_Dead);
    default Normal.Sight.LoseAwarenessWithExcludingTags = true;

    default Normal.Sight.SensingOwnedTagModifiers.Add(GameplayTag::Debuff_ReducedSense_Sight, -15.0f);

    /// When already sensed through other sense channel
    default Normal.Sight.SenseModifier = 20.0;

    /// minimum awareness in other senses to apply SenseModifier
    default Normal.Sight.SenseModifierThreshold = 50.0f;

    /// Wearoff per second
    default Normal.Sight.AwarenessWearoffFactorNoLineOfSight = 40.0f;
    default Normal.Sight.AwarenessWearoffFactorOutOfShape = 15.0f;

    default Normal.Sight.BlockAwarenessWearOffWithSensorTags.AddTag(GameplayTag::Perception_KeepAwareness_Sight);
    default Normal.Sight.BlockAwarenessWearOffWithSensedTags.AddTag(GameplayTag::Perception_KeepAttention_Sight);

    ////////////////////////////////////////////////
    //  HEARING GEOMETRY
    ////////////////////////////////////////////////
    /// Distances
    default Normal.Hearing.SetCloseRangeDistance(250.0f);
    default Normal.Hearing.SetCloseRangeModifier(15.0f);

    default Normal.Hearing.SetMidRangeDistance(1200.0f);
    default Normal.Hearing.SetMidRangeModifier(10.0f);

    default Normal.Hearing.SetFarRangeDistance(2000.0f);
    default Normal.Hearing.SetFarRangeModifier(5.0f);
    
    ////////////////////////////////////////////////
    //  HEARING MODIFIERS
    ////////////////////////////////////////////////
    /// Loudness
    default Normal.Hearing.SetLoudnessModifierClose(Whisper = 1.0f, Quiet = 5.0f, Moderate = 20.0f, Loud = 50.0f, VeryLoud = 50.0f);
    default Normal.Hearing.SetLoudnessModifierMid(Whisper = 0.0f, Quiet = 1.0f, Moderate = 5.0f, Loud = 20.0f, VeryLoud = 50.0f);
    default Normal.Hearing.SetLoudnessModifierFar(Whisper = 0.0f, Quiet = 0.0f, Moderate = 1.0f, Loud = 5.0f, VeryLoud = 20.0f);

    /// Weather
    default Normal.Hearing.SetWeatherModifier(0.0f, -1.0f, -2.0f);

    /// Impairing effects (make the character unable to hear)
    default Normal.Hearing.ExcludingTags.AddTag(GameplayTag::Debuff_Deaf);
    default Normal.Hearing.ExcludingTags.AddTag(GameplayTag::State_Dead);
    default Normal.Hearing.LoseAwarenessWithExcludingTags = true;

    default Normal.Hearing.SensingOwnedTagModifiers.Add(GameplayTag::Debuff_ReducedSense_Hearing, -5.0f);

    /// Wearoff per second
    default Normal.Hearing.AwarenessWearoffFactor = 80.0f;

    
    default Normal.Hearing.BlockAwarenessWearOffWithSensorTags.AddTag(GameplayTag::Perception_KeepAwareness_Hearing);
    default Normal.Hearing.BlockAwarenessWearOffWithSensedTags.AddTag(GameplayTag::Perception_KeepAttention_Hearing);

    ////////////////////////////////////////////////
    //  SMELL GEOMETRY
    ////////////////////////////////////////////////
    /// Distances
    default Normal.Smell.SetCloseRangeDistance(350.0f);
    default Normal.Smell.SetMidRangeDistance(700.0f);
    default Normal.Smell.SetFarRangeDistance(1500.0f);    

    default Normal.Smell.SetCloseRangeModifier(50.0f);
    default Normal.Smell.SetMidRangeModifier(10.0f);
    default Normal.Smell.SetFarRangeModifier( 5.0f);

    ////////////////////////////////////////////////
    //  SMELL MODIFIERS
    ////////////////////////////////////////////////
    /// Weather
    default Normal.Smell.SetWeatherModifier(0.0f, -1.0f, -2.0f);
    
    /// Impairing effects (make the character unable to smell)
    default Normal.Smell.ExcludingTags.AddTag(GameplayTag::Debuff_Anosmic);
    default Normal.Smell.ExcludingTags.AddTag(GameplayTag::State_Dead);
    default Normal.Smell.LoseAwarenessWithExcludingTags = true;

    default Normal.Smell.SensingOwnedTagModifiers.Add(GameplayTag::Debuff_ReducedSense_Smell, -15.0f);

    /// Wearoff per second
    default Normal.Smell.AwarenessWearoffFactor = 40.0f;

    default Normal.Smell.BlockAwarenessWearOffWithSensorTags.AddTag(GameplayTag::Perception_KeepAwareness_Smell);
    default Normal.Smell.BlockAwarenessWearOffWithSensedTags.AddTag(GameplayTag::Perception_KeepAttention_Smell);

    //////////////////////////////////////////////////////////////////////////////////////////////////////
    // HIGH ALERT SETTINGS
    //////////////////////////////////////////////////////////////////////////////////////////////////////
    default HighAlert = Normal;
    //default HighAlert.Sight.GoodVisionRange = 4000.0f;
    //default HighAlert.Sight.VisionRange = 4000.0f;
    default HighAlert.Sight.bRequiresFreeLineOfSight = true;
    //default HighAlert.Sight.VisionConeAngleDegrees = 360;

    default HighAlert.Sight.InnerCoffin.Length = 1200.0f;
    default HighAlert.Sight.InnerCoffin.GoodVisionLength = 400.0f;
    default HighAlert.Sight.InnerCoffin.CloseHalfWidth = 150;
    default HighAlert.Sight.InnerCoffin.MiddleHalfWidth = 250;
    default HighAlert.Sight.InnerCoffin.FarHalfWidth = 150;

    default HighAlert.Sight.OuterCoffin.Length = 1500.0f;
    default HighAlert.Sight.OuterCoffin.GoodVisionLength = 700.0f;
    default HighAlert.Sight.OuterCoffin.CloseHalfWidth = 300;
    default HighAlert.Sight.OuterCoffin.MiddleHalfWidth = 450;
    default HighAlert.Sight.OuterCoffin.FarHalfWidth = 300;

    default HighAlert.Sight.SixthSense.VerticalOffset = 50;
    default HighAlert.Sight.SixthSense.BlindSpotHalfAngle = 45;
    default HighAlert.Sight.SixthSense.HalfLength = 50;
    default HighAlert.Sight.SixthSense.HalfWidth = 250;
    default HighAlert.Sight.SixthSense.BlindSpotHalfAngle = 45;

    default HighAlert.Sight.HeightParabolAlpha = 0.0f;
    default HighAlert.Sight.HeightParabolOffsetY = 0.55f;
    default HighAlert.Sight.HeightParabolOffsetZ = 0.35f;

    default HighAlert.Sight.SetCloseRangeFractionDistance(0.3f);
    default HighAlert.Sight.SetCloseRangeFractionModifier(150.0f);

    default HighAlert.Sight.SetMidRangeFractionDistance(.6f);
    default HighAlert.Sight.SetMidRangeFractionModifier(80.0f);

    default HighAlert.Sight.SetFarRangeFractionDistance(1.0f);
    default HighAlert.Sight.SetFarRangeFractionModifier(50.0f);

    /// Movement speeed
    default HighAlert.Sight.MovementModifier.Add(GameplayTag::State_Movement_Sneaking, 5.0f);
    default HighAlert.Sight.MovementModifier.Add(GameplayTag::State_Movement_Walking, 10.0f);
    default HighAlert.Sight.MovementModifier.Add(GameplayTag::State_Movement_Running, 15.0f);
    default HighAlert.Sight.MovementModifier.Add(GameplayTag::State_Movement_Sprinting, 20.0f);

    /// Movement Stance
    default HighAlert.Sight.MovementModeDefaultModifier = 20.0f;
    default HighAlert.Sight.MovementModeModifier.Add(GameplayTag::State_Movement_Crouching, -10.0f);
    default HighAlert.Sight.MovementModeModifier.Add(GameplayTag::State_Swimming, -15.0f);
    default HighAlert.Sight.MovementModeModifier.Add(GameplayTag::State_Movement_Diving, -20.0f);


    default Normal.Sight.SetWeatherModifier(0.0f, -1.0f, -2.0f);

    default HighAlertWhen.AddTag(GameplayTag::State_HighAlert);
}

class UG1RPerceptionAgentSettings_Human : UG1RPerceptionAgentSettings
{
    default Normal.Hearing.OnScreenSkillModifier = 1.0f;
    default Normal.Hearing.OffScreenSkillModifier = 0.5f;
    default Normal.Hearing.bUseLowerOffscreenSkill = true;

    default Normal.Smell.OnScreenSkillModifier = 0.5f;
    default Normal.Smell.OffScreenSkillModifier = 0.3f;
    default Normal.Smell.bUseLowerOffscreenSkill = true;

    default Normal.Smell.SetCloseRangeDistance(100.0f);
    default Normal.Smell.SetMidRangeDistance(150.0f);
    default Normal.Smell.SetFarRangeDistance(200.0f);    

    default Normal.Smell.SetCloseRangeModifier(50.0f);
    default Normal.Smell.SetMidRangeModifier(10.0f);
    default Normal.Smell.SetFarRangeModifier( 5.0f);

    default Normal.Sight.InnerCoffin.Length = 1500.0f;
    default Normal.Sight.InnerCoffin.GoodVisionLength = 400.0f;
    default Normal.Sight.InnerCoffin.CloseHalfWidth = 150;
    default Normal.Sight.InnerCoffin.MiddleHalfWidth = 250;
    default Normal.Sight.InnerCoffin.FarHalfWidth = 150;

    default Normal.Sight.OuterCoffin.Length = 2500.0f;
    default Normal.Sight.OuterCoffin.GoodVisionLength = 700.0f;
    default Normal.Sight.OuterCoffin.CloseHalfWidth = 300;
    default Normal.Sight.OuterCoffin.MiddleHalfWidth = 450;
    default Normal.Sight.OuterCoffin.FarHalfWidth = 300;

    default Normal.Sight.SixthSense.VerticalOffset = 50;
    default Normal.Sight.SixthSense.BlindSpotHalfAngle = 45;
    default Normal.Sight.SixthSense.HalfLength = 50;
    default Normal.Sight.SixthSense.HalfWidth = 250;
    default Normal.Sight.SixthSense.BlindSpotHalfAngle = 45;

    default Normal.Sight.HeightParabolAlpha = 0.0f;
    default Normal.Sight.HeightParabolOffsetY = 0.55f;
    default Normal.Sight.HeightParabolOffsetZ = 0.35f;
}

class UG1RPerceptionAgentSettings_OrcShaman : UG1RPerceptionAgentSettings
{
    default Normal.Hearing.OnScreenSkillModifier = 1.0f;
    default Normal.Hearing.OffScreenSkillModifier = 0.5f;
    default Normal.Hearing.bUseLowerOffscreenSkill = true;

    default Normal.Smell.OnScreenSkillModifier = 0.5f;
    default Normal.Smell.OffScreenSkillModifier = 0.3f;
    default Normal.Smell.bUseLowerOffscreenSkill = true;

    default Normal.Smell.SetCloseRangeDistance(100.0f);
    default Normal.Smell.SetMidRangeDistance(150.0f);
    default Normal.Smell.SetFarRangeDistance(200.0f);    

    default Normal.Smell.SetCloseRangeModifier(50.0f);
    default Normal.Smell.SetMidRangeModifier(10.0f);
    default Normal.Smell.SetFarRangeModifier( 5.0f);

    //default Normal.Sight.InnerCoffin.Length = 4000.0f;
    default Normal.Sight.InnerCoffin.GoodVisionLength = 400.0f;
    default Normal.Sight.InnerCoffin.CloseHalfWidth = 150;
    default Normal.Sight.InnerCoffin.MiddleHalfWidth = 250;
    default Normal.Sight.InnerCoffin.FarHalfWidth = 150;

    //default Normal.Sight.OuterCoffin.Length = 2500.0f;
    default Normal.Sight.OuterCoffin.GoodVisionLength = 700.0f;
    default Normal.Sight.OuterCoffin.CloseHalfWidth = 300;
    default Normal.Sight.OuterCoffin.MiddleHalfWidth = 450;
    default Normal.Sight.OuterCoffin.FarHalfWidth = 300;

    default Normal.Sight.SixthSense.VerticalOffset = 50;
    default Normal.Sight.SixthSense.BlindSpotHalfAngle = 45;
    default Normal.Sight.SixthSense.HalfLength = 50;
    default Normal.Sight.SixthSense.HalfWidth = 250;
    default Normal.Sight.SixthSense.BlindSpotHalfAngle = 45;

    default Normal.Sight.HeightParabolAlpha = 0.0f;
    // default Normal.Sight.HeightParabolOffsetY = 0.55f;
    // default Normal.Sight.HeightParabolOffsetZ = 0.35f;

    default Normal.Sight.OuterCoffin.Length = 3000.0f;
    default Normal.Sight.InnerCoffin.Length = 1500.0f;

    default Normal.Sight.HeightParabolAlpha = 0.00001f;
    default Normal.Sight.HeightParabolOffsetY = 0.95f;
    default Normal.Sight.HeightParabolOffsetZ = 0.95f;
}

class UG1RPerceptionAgentSettings_OrcUndead : UG1RPerceptionAgentSettings
{
    default Normal.Hearing.OnScreenSkillModifier = 2.0f;
    default Normal.Hearing.OffScreenSkillModifier = 0.75f;
    default Normal.Hearing.bUseLowerOffscreenSkill = true;

    default Normal.Smell.OnScreenSkillModifier = 2.0f;
    default Normal.Smell.OffScreenSkillModifier = 0.5f;
    default Normal.Smell.bUseLowerOffscreenSkill = true;

    default Normal.Sight.InnerCoffin.Length = 2000.0f;
    default Normal.Sight.InnerCoffin.GoodVisionLength = 400.0f;
    default Normal.Sight.InnerCoffin.CloseHalfWidth = 150;
    default Normal.Sight.InnerCoffin.MiddleHalfWidth = 250;
    default Normal.Sight.InnerCoffin.FarHalfWidth = 150;

    default Normal.Sight.OuterCoffin.Length = 4000.0f;
    default Normal.Sight.OuterCoffin.GoodVisionLength = 700.0f;
    default Normal.Sight.OuterCoffin.CloseHalfWidth = 300;
    default Normal.Sight.OuterCoffin.MiddleHalfWidth = 450;
    default Normal.Sight.OuterCoffin.FarHalfWidth = 300;

    default Normal.Sight.SixthSense.VerticalOffset = 50;
    default Normal.Sight.SixthSense.BlindSpotHalfAngle = 45;
    default Normal.Sight.SixthSense.HalfLength = 50;
    default Normal.Sight.SixthSense.HalfWidth = 250;
    default Normal.Sight.SixthSense.BlindSpotHalfAngle = 45;

    default Normal.Sight.HeightParabolAlpha = 0.0f;
    default Normal.Sight.HeightParabolOffsetY = 0.55f;
    default Normal.Sight.HeightParabolOffsetZ = 0.35f;

    default Normal.Sight.HeightParabolAlpha = 0.00001f;
    default Normal.Sight.HeightParabolOffsetY = 0.95f;
    default Normal.Sight.HeightParabolOffsetZ = 0.95f;
}

class UG1RPerceptionAgentSettings_Human_HighPriority : UG1RPerceptionAgentSettings_Human
{
    default CustomUpdateRate = 0.5f;
}

class UG1RPerceptionAgentSettings_Humanoid : UG1RPerceptionAgentSettings
{
    default Normal.Hearing.OnScreenSkillModifier = 2.0f;
    default Normal.Hearing.OffScreenSkillModifier = 0.5f;
    default Normal.Hearing.bUseLowerOffscreenSkill = true;

    default Normal.Smell.OnScreenSkillModifier = 2.0f; //2.0f;
    default Normal.Smell.OffScreenSkillModifier = 0.5f; //0.5f;
    default Normal.Smell.bUseLowerOffscreenSkill = true;

    default Normal.Sight.InnerCoffin.Length = 2000.0f;
    default Normal.Sight.InnerCoffin.GoodVisionLength = 400.0f;
    default Normal.Sight.InnerCoffin.CloseHalfWidth = 150;
    default Normal.Sight.InnerCoffin.MiddleHalfWidth = 250;
    default Normal.Sight.InnerCoffin.FarHalfWidth = 150;

    default Normal.Sight.OuterCoffin.Length = 4000.0f;
    default Normal.Sight.OuterCoffin.GoodVisionLength = 700.0f;
    default Normal.Sight.OuterCoffin.CloseHalfWidth = 300;
    default Normal.Sight.OuterCoffin.MiddleHalfWidth = 450;
    default Normal.Sight.OuterCoffin.FarHalfWidth = 300;

    default Normal.Sight.SixthSense.VerticalOffset = 50;
    default Normal.Sight.SixthSense.BlindSpotHalfAngle = 45;
    default Normal.Sight.SixthSense.HalfLength = 50;
    default Normal.Sight.SixthSense.HalfWidth = 250;
    default Normal.Sight.SixthSense.BlindSpotHalfAngle = 45;

    default Normal.Sight.HeightParabolAlpha = 0.0f;
    default Normal.Sight.HeightParabolOffsetY = 0.55f;
    default Normal.Sight.HeightParabolOffsetZ = 0.35f;
}

class UG1RPerceptionAgentSettings_Creature : UG1RPerceptionAgentSettings
{
    default Normal.Hearing.OnScreenSkillModifier = 2.0f;
    default Normal.Hearing.OffScreenSkillModifier = 0.75f;
    default Normal.Hearing.bUseLowerOffscreenSkill = true;

    default Normal.Smell.OnScreenSkillModifier = 3.0f;
    default Normal.Smell.OffScreenSkillModifier = 0.5f;
    default Normal.Smell.bUseLowerOffscreenSkill = true;

    default Normal.Sight.InnerCoffin.Length = 2000.0f;
    default Normal.Sight.InnerCoffin.GoodVisionLength = 400.0f;
    default Normal.Sight.InnerCoffin.CloseHalfWidth = 150;
    default Normal.Sight.InnerCoffin.MiddleHalfWidth = 250;
    default Normal.Sight.InnerCoffin.FarHalfWidth = 150;

    default Normal.Sight.OuterCoffin.Length = 4000.0f;
    default Normal.Sight.OuterCoffin.GoodVisionLength = 700.0f;
    default Normal.Sight.OuterCoffin.CloseHalfWidth = 300;
    default Normal.Sight.OuterCoffin.MiddleHalfWidth = 450;
    default Normal.Sight.OuterCoffin.FarHalfWidth = 300;

    default Normal.Sight.SixthSense.VerticalOffset = 50;
    default Normal.Sight.SixthSense.BlindSpotHalfAngle = 45;
    default Normal.Sight.SixthSense.HalfLength = 50;
    default Normal.Sight.SixthSense.HalfWidth = 250;
    default Normal.Sight.SixthSense.BlindSpotHalfAngle = 45;

    default Normal.Sight.HeightParabolAlpha = 0.0f;
    default Normal.Sight.HeightParabolOffsetY = 0.55f;
    default Normal.Sight.HeightParabolOffsetZ = 0.35f;
}

/** Character will be able to see at great ranges, through walls*/
UCLASS()
class UG1RPerceptionAgentSettings_Omniperception : UPerceptionAgentSettings
{
    ////////////////////////////////////////////////
    //  SIGHT GEOMETRY
    ////////////////////////////////////////////////
    /// Inner coffin dimensions
    default Normal.Sight.InnerCoffin.Length = 10000.0f; //1000.0f;
    default Normal.Sight.InnerCoffin.GoodVisionLength = 10000.0f; //400.0f;
    default Normal.Sight.InnerCoffin.CloseHalfWidth = 150; //150
    default Normal.Sight.InnerCoffin.MiddleHalfWidth = 250; //250
    default Normal.Sight.InnerCoffin.FarHalfWidth = 150; //150

    /// Outer coffin dimensions
    default Normal.Sight.OuterCoffin.Length = 10000.0f; //1200.0f;
    default Normal.Sight.OuterCoffin.GoodVisionLength = 10000.0f; //700.0f;
    default Normal.Sight.OuterCoffin.CloseHalfWidth = 300; //300
    default Normal.Sight.OuterCoffin.MiddleHalfWidth = 450; //450
    default Normal.Sight.OuterCoffin.FarHalfWidth = 300; //300

    /// Back boxes dimensions
    default Normal.Sight.SixthSense.VerticalOffset = 500; //50
    default Normal.Sight.SixthSense.BlindSpotHalfAngle = 45; //45
    default Normal.Sight.SixthSense.HalfLength = 500; //50
    default Normal.Sight.SixthSense.HalfWidth = 2500; //250

    /// Line of sight usage
    default Normal.Sight.bRequiresFreeLineOfSight = false;

    /// Vision range definitions (as a fraction of outer coffin length)
    default Normal.Sight.SetCloseRangeFractionDistance(0.3f);
    default Normal.Sight.SetCloseRangeFractionModifier(50.0f);

    default Normal.Sight.SetMidRangeFractionDistance(0.6f);
    default Normal.Sight.SetMidRangeFractionModifier(30.0f);

    default Normal.Sight.SetFarRangeFractionDistance(1.0f);
    default Normal.Sight.SetFarRangeFractionModifier(15.0f);


    /// Vision vertical dimensions - use imgui to display the parabola
    default Normal.Sight.HeightParabolAlpha = -0.0003f;
    default Normal.Sight.HeightParabolOffsetY = 2.0f;
    default Normal.Sight.HeightParabolOffsetZ = 2.0f;

    ////////////////////////////////////////////////
    //  SIGHT MODIFIERS
    ////////////////////////////////////////////////
    /// Movement speeed
    default Normal.Sight.MovementModifier.Add(GameplayTag::State_Movement_Walking, 10.0f);
    default Normal.Sight.MovementModifier.Add(GameplayTag::State_Movement_Running, 10.0f);
    default Normal.Sight.MovementModifier.Add(GameplayTag::State_Movement_Sprinting, 15.0f);

    /// Movement Stance
    default Normal.Sight.MovementModeDefaultModifier = 10.0f;
    default Normal.Sight.MovementModeModifier.Add(GameplayTag::State_Movement_Crouching, 0.0f);
    default Normal.Sight.MovementModeModifier.Add(GameplayTag::State_Swimming, -5.0f);
    default Normal.Sight.MovementModeModifier.Add(GameplayTag::State_Movement_Diving, -10.0f);

    /// Weather
    default Normal.Sight.SetWeatherModifier(0.0f, -1.0f, -2.0f);

    /// Impairing effects (make the character unable to see)
    default Normal.Sight.ExcludingTags.AddTag(GameplayTag::Debuff_Blind);
    default Normal.Sight.ExcludingTags.AddTag(GameplayTag::State_Dead);
    default Normal.Sight.LoseAwarenessWithExcludingTags = true;

    /// When already sensed through other sense channel
    default Normal.Sight.SenseModifier = 20.0;

    /// minimum awareness in other senses to apply SenseModifier
    default Normal.Sight.SenseModifierThreshold = 50.0f;

    /// Wearoff per second
    default Normal.Sight.AwarenessWearoffFactorNoLineOfSight = 40.0f;
    default Normal.Sight.AwarenessWearoffFactorOutOfShape = 15.0f;

    ////////////////////////////////////////////////
    //  HEARING GEOMETRY
    ////////////////////////////////////////////////
    /// Distances
    default Normal.Hearing.SetCloseRangeDistance(10000.0f);
    default Normal.Hearing.SetMidRangeDistance(5000.0f);
    default Normal.Hearing.SetFarRangeDistance(10000.0f);

    ////////////////////////////////////////////////
    //  HEARING MODIFIERS
    ////////////////////////////////////////////////
    /// Loudness
    default Normal.Hearing.SetLoudnessModifierMid(0.0f, 0.2f, 0.7f, 1.5f, 50.0f);

    /// Weather
    default Normal.Hearing.SetWeatherModifier(-0.0f, -1.0f, -2.0f);

    /// Impairing effects (make the character unable to hear)
    default Normal.Hearing.ExcludingTags.AddTag(GameplayTag::Debuff_Deaf);
    default Normal.Hearing.ExcludingTags.AddTag(GameplayTag::State_Dead);
    default Normal.Hearing.LoseAwarenessWithExcludingTags = true;

    /// Wearoff per second
    default Normal.Hearing.AwarenessWearoffFactor = 40.0f;

    ////////////////////////////////////////////////
    //  SMELL GEOMETRY
    ////////////////////////////////////////////////
    /// Distances
    default Normal.Smell.SetCloseRangeDistance(250.0f);
    default Normal.Smell.SetMidRangeDistance(5000.0f);
    default Normal.Smell.SetFarRangeDistance(10000.0f);
    
    ////////////////////////////////////////////////
    //  SMELL MODIFIERS
    ////////////////////////////////////////////////
    /// Weather
    default Normal.Smell.SetWeatherModifier(-0.0f, -1.0f, -2.0f);

    /// Impairing effects (make the character unable to smell)
    default Normal.Smell.ExcludingTags.AddTag(GameplayTag::Debuff_Anosmic);
    default Normal.Smell.ExcludingTags.AddTag(GameplayTag::State_Dead);
    default Normal.Smell.LoseAwarenessWithExcludingTags = true;

    /// Wearoff per second
    default Normal.Smell.AwarenessWearoffFactor = 40.0f;

    //////////////////////////////////////////////////////////////////////////////////////////////////////
    // HIGH ALERT SETTINGS
    //////////////////////////////////////////////////////////////////////////////////////////////////////

    default HighAlert = Normal; // Use normal as a baseline
    default HighAlertWhen.AddTag(GameplayTag::State_HighAlert);
}

/** Character will be able to see at great ranges, through walls and with no awareness wearoff */
UCLASS()
class UG1RPerceptionAgentSettings_Omniperception_NoWearoff : UG1RPerceptionAgentSettings_Omniperception
{
    default Normal.Sight.AwarenessWearoffFactorNoLineOfSight = 0.0f;
    default Normal.Sight.AwarenessWearoffFactorOutOfShape = 0.0f;
    default Normal.Hearing.AwarenessWearoffFactor = 0.0f;
    default Normal.Smell.AwarenessWearoffFactor = 0.0f;

    default Normal.Sight.AwarenessWearoffFactorNoLineOfSight = 0.0f;
    default Normal.Sight.AwarenessWearoffFactorOutOfShape = 0.0f;
    default HighAlert.Hearing.AwarenessWearoffFactor = 0.0f;
    default HighAlert.Smell.AwarenessWearoffFactor = 0.0f;
}