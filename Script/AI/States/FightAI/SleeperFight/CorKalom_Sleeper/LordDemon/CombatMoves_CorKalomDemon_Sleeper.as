//Lord Demon moves

UCLASS()
class UCM_Attack_CorKalomDemon_Sleeper_HellArms_Breach : UCM_Attack_Extra01
{
    default OwnedTagsToAddWhileActive.AddTag(GameplayTag::AICombatMove_CastSpell);
    bool IsMoveAllowed(FString&out Reason) const override
    {
        if (!Combat.Self.IsA(ALordDemon::StaticClass()))
        {
            Reason = "Agent is not a lord demon";
            return false;
        }

        auto LordDemon = Cast<ALordDemon>(Combat.Self);
        if (LordDemon == nullptr)
        {
            Reason = "LordDemon cast failed";
            return false;
        }
        auto DemonAreaRegisterComponent = UDemonAreaRegisterComponent::GetOrCreate(LordDemon);
        if (!DemonAreaRegisterComponent.CanSpawnArea(EDemonAreaTypes::BreachZigZag))
        {
            Reason = "Demon can't spawn area";
            return false;
        }
        
        return Super::IsMoveAllowed(Reason);
    }
}

UCLASS()
class UCM_Attack_CorKalomDemon_Sleeper_HellArms_Ring : UCM_Attack_Extra03
{
    default OwnedTagsToAddWhileActive.AddTag(GameplayTag::AICombatMove_CastSpell);

    bool IsMoveAllowed(FString&out Reason) const override
    {
        if (!Combat.Self.IsA(ALordDemon::StaticClass()))
        {
            Reason = "Agent is not a lord demon";
            return false;
        }

        auto LordDemon = Cast<ALordDemon>(Combat.Self);
        if (LordDemon == nullptr)
        {
            Reason = "LordDemon cast failed";
            return false;
        }
        auto DemonAreaRegisterComponent = UDemonAreaRegisterComponent::GetOrCreate(LordDemon);
        if (!DemonAreaRegisterComponent.CanSpawnArea(EDemonAreaTypes::BreachZigZag))
        {
            Reason = "Demon can't spawn area";
            return false;
        }
        
        return Super::IsMoveAllowed(Reason);
    }
}

/** Do a Extra 04 attack */
UCLASS()
class UCM_Attack_CorKalomDemon_Sleeper_Explosion : UCM_Attack_Extra02
{
    default OwnedTagsToAddWhileActive.AddTag(GameplayTag::AICombatMove_CastSpell);
}

/** Do a Extra 04 attack */
UCLASS()
class UCM_Attack_Demon_Fire_Laser : UCM_Attack_Extra03
{
    default OwnedTagsToAddWhileActive.AddTag(GameplayTag::AICombatMove_CastSpell);
}

/** Do a Extra 04 attack */
UCLASS()
class UCM_Attack_Demon_Fire_Fireball_R : UCM_Attack_Extra04
{
    default OwnedTagsToAddWhileActive.AddTag(GameplayTag::AICombatMove_CastSpell);
}

// UCLASS()
// class UCM_Attack_Demon_TauntTest : UCM_Attack_Extra05
// {
//      default OwnedTagsToAddWhileActive.AddTag(GameplayTag::Combat_Taunt_Aggressive_Taunt02);
// }