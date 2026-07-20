//Fire Demon moves

UCLASS()
class UCM_Attack_FireDemon_FireWall : UCM_Attack_Extra02
{
    default OwnedTagsToAddWhileActive.AddTag(GameplayTag::AICombatMove_CastSpell);

    bool IsMoveAllowed(FString&out Reason) const override
    {
        if (!Combat.Self.IsA(ADemonFire::StaticClass()))
        {
            Reason = "Agent is not a fire demon";
            return false;
        }

        auto DemonFire = Cast<ADemonFire>(Combat.Self);
        if (DemonFire == nullptr)
        {
            Reason = "DemonFire cast failed";
            return false;
        }
        auto DemonAreaRegisterComponent = UDemonAreaRegisterComponent::GetOrCreate(DemonFire);
        if (!DemonAreaRegisterComponent.CanSpawnArea(EDemonAreaTypes::Ring))
        {
            Reason = "Demon can't spawn area";
            return false;
        }

        return Super::IsMoveAllowed(Reason);
    }
}

UCLASS()
class UCM_Attack_FireDemon_Flamethrower : UCM_Attack_Extra01
{
    default OwnedTagsToAddWhileActive.AddTag(GameplayTag::AICombatMove_CastSpell);
}

UCLASS()
class UCM_Attack_FireDemon_Explosion : UCM_Attack_Extra03
{
    default OwnedTagsToAddWhileActive.AddTag(GameplayTag::AICombatMove_CastSpell);
}

UCLASS()
class UCM_Spell_Demon_FireBolt : UCM_CastSpellMultiple
{
    UCM_Spell_Demon_FireBolt(int InAmount)
    {
        MinAmount = Math::Clamp(InAmount, 0, MAX_int32);
        MaxAmount = MinAmount;
    }

    default _SpellTag = GameplayTag::Spell_Firebolt;
}