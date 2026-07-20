class UCS_MiniIceGolem_CurrentTargetIsIceGolem : UFightAI_CombatSituation
{
    default bRequireCharacterOfInterest = true;
    
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;

        if (Combat.CharacterOfInterest.IsSpecies(GameplayTag::Species_Creature_Golem_Ice))
            return true;

        return false;
    }
}