class UG1RPerceptionAgentSettings_Wolf : UG1RPerceptionAgentSettings_Creature
{
    default Normal.Sight.OuterCoffin.Length = 2000.0f;
    default Normal.Sight.InnerCoffin.Length = 1000.0f;

    default Normal.Sight.MinLightModifier = 0.0f; // -30.0f;

    default Normal.Hearing.SetCloseRangeDistance(700.0f);
    default Normal.Hearing.SetMidRangeDistance(1000.0f);
    default Normal.Hearing.SetFarRangeDistance(2000.0f);

    default Normal.Smell.SetCloseRangeDistance(350.0f);
    default Normal.Smell.SetMidRangeDistance(1500.0f);
    default Normal.Smell.SetFarRangeDistance(2000.0f);   
}

class UG1RPerceptionAgentSettings_Wolf_Alpha : UG1RPerceptionAgentSettings_Creature
{
    default Normal.Sight.OuterCoffin.Length = 2000.0f;
    default Normal.Sight.InnerCoffin.Length = 1000.0f;

    default Normal.Sight.MinLightModifier = 0.0f; // -30.0f;

    default Normal.Hearing.SetCloseRangeDistance(700.0f);
    default Normal.Hearing.SetMidRangeDistance(1000.0f);
    default Normal.Hearing.SetFarRangeDistance(2000.0f);

    default Normal.Smell.SetCloseRangeDistance(350.0f);
    default Normal.Smell.SetMidRangeDistance(1500.0f);
    default Normal.Smell.SetFarRangeDistance(2000.0f);   

    
    default Normal.Hearing.OnScreenSkillModifier = 3.5f;
    //efault Normal.Hearing.OffScreenSkillModifier = 0.25f;
    default Normal.Hearing.bUseLowerOffscreenSkill = true;

    default Normal.Smell.OnScreenSkillModifier = 3.0f;
    //default Normal.Smell.OffScreenSkillModifier = 0.2f;
    default Normal.Smell.bUseLowerOffscreenSkill = true;
}