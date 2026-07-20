class UCS_IsBeingTargetedByTroll : UFightAI_CombatSituation
{
    bool IsInSituation() const override
    {
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_IsBeingTargetedByTroll::IsInSituation"));

        if (!Super::IsInSituation())
            return false;
        
        if (Combat.Self.GetCharactersWithTagTargetingThisCharacterInCombat(GameplayTag::Species_Creature_Troll).Num() > 0)
            return true;

        return false;
    }
}