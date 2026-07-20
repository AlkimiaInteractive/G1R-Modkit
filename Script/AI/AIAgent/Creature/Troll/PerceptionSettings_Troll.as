class UG1RPerceptionAgentSettings_Troll : UG1RPerceptionAgentSettings_Creature
{
    default Normal.Sight.OuterCoffin.Length = 2500.0f;
    default Normal.Sight.InnerCoffin.Length = 1500.0f;

    default Normal.Hearing.SetCloseRangeDistance(1800.0f);
    default Normal.Hearing.SetMidRangeDistance(2000.0f);
    default Normal.Hearing.SetFarRangeDistance(2500.0f);

    default Normal.Smell.SetCloseRangeDistance(350.0f);
    default Normal.Smell.SetMidRangeDistance(1200.0f);
    default Normal.Smell.SetFarRangeDistance(1500.0f);   
}

class UG1RPerceptionAgentSettings_Troll_Focus : UG1RPerceptionAgentSettings_Creature
{
    default Normal.Sight.OuterCoffin.Length = 2000.0f;
    default Normal.Sight.InnerCoffin.Length = 1000.0f;

    default Normal.Hearing.SetCloseRangeDistance(350.0f);
    default Normal.Hearing.SetMidRangeDistance(1000.0f);
    default Normal.Hearing.SetFarRangeDistance(2000.0f);

    default Normal.Smell.SetCloseRangeDistance(250.0f);
    default Normal.Smell.SetMidRangeDistance(500.0f);
    default Normal.Smell.SetFarRangeDistance(1000.0f);   

    default Normal.Hearing.OnScreenSkillModifier = 0.5f;
    default Normal.Hearing.OffScreenSkillModifier = 0.25f;
    default Normal.Hearing.bUseLowerOffscreenSkill = true;

    default Normal.Smell.OnScreenSkillModifier = 0.5f;
    default Normal.Smell.OffScreenSkillModifier = 0.2f;
    default Normal.Smell.bUseLowerOffscreenSkill = true;
}