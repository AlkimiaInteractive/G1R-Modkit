class UG1RPerceptionAgentSettings_Harpy : UG1RPerceptionAgentSettings_Creature
{
    default Normal.Sight.OuterCoffin.Length = 2300.0f;
    default Normal.Sight.InnerCoffin.Length = 2000.0f;

    default Normal.Sight.HeightParabolAlpha = 0.0f;
    default Normal.Sight.HeightParabolOffsetY = 0.55f;
    default Normal.Sight.HeightParabolOffsetZ = 0.90f;

    default Normal.Hearing.SetCloseRangeDistance(1300.0f);
    default Normal.Hearing.SetMidRangeDistance(1600.0f);
    default Normal.Hearing.SetFarRangeDistance(2000.0f);

    default Normal.Smell.SetCloseRangeDistance(1300.0f);
    default Normal.Smell.SetMidRangeDistance(1600.0f);
    default Normal.Smell.SetFarRangeDistance(2000.0f);   

    default Normal.Hearing.OnScreenSkillModifier = 1.5f;
    //efault Normal.Hearing.OffScreenSkillModifier = 0.25f;
    default Normal.Hearing.bUseLowerOffscreenSkill = true;

    default Normal.Smell.OnScreenSkillModifier = 3.0f;
    //default Normal.Smell.OffScreenSkillModifier = 0.2f;
    default Normal.Smell.bUseLowerOffscreenSkill = true;
}

class UG1RPerceptionAgentSettings_Harpy_Sleeper : UG1RPerceptionAgentSettings_Creature
{
    default Normal.Sight.OuterCoffin.Length = 3000.0f;
    default Normal.Sight.InnerCoffin.Length = 1500.0f;

    default Normal.Sight.HeightParabolAlpha = 0.0f;
    default Normal.Sight.HeightParabolOffsetY = 0.55f;
    default Normal.Sight.HeightParabolOffsetZ = 0.90f;

    default Normal.Hearing.SetCloseRangeDistance(1000.0f);
    default Normal.Hearing.SetMidRangeDistance(1500.0f);
    default Normal.Hearing.SetFarRangeDistance(2000.0f);
    
    default Normal.Smell.SetCloseRangeDistance(1000.0f);
    default Normal.Smell.SetMidRangeDistance(1500.0f);
    default Normal.Smell.SetFarRangeDistance(2000.0f);   
}