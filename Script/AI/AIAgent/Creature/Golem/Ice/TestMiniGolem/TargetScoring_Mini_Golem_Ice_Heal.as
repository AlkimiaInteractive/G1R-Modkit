/*UCLASS()
class UAICombatTargetScoringEntry_TargetIceGolemForHealAttack : UAICombatTargetScoringEntry
{
    default Description = "Prioritize ice golem if not attacked in the last 10 seconds";

    float CalculateScore(const AGothicCharacter Character,
                         const UGameplayAbility_CharacterAI_Gothic AI) const override
    {
        auto MiniIceGolemHealCombat = Cast<UAIState_Combat_G1R>(AI.CurrentRootState);
        if (MiniIceGolemHealCombat == nullptr)
            return 0.0f;

        bool bDamageTaken = MiniIceGolemHealCombat.DamageReceivedInTheLastSeconds(10.0f) > 0.0f;
        bool bCharacterIsGolem = Character.IsSpecies(GameplayTag::Species_Creature_Golem_Ice) && !Character.IsSpecies(GameplayTag::Species_Creature_Golem_Mini_Ice);


        if (!bDamageTaken && bCharacterIsGolem)
            return 3.0f;

        if (bDamageTaken && !bCharacterIsGolem)
            return 0.0f;

        return -1.0f;
    }
}*/