class UCS_Troll_IsGoblinSelected : UFightAI_CombatSituation
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        auto Troll = Cast<ATroll>(Combat.AI.Character);
        if (Troll == nullptr)
            return false;

        return Troll.m_SelectedProjectileCharacter != nullptr;
    }
}