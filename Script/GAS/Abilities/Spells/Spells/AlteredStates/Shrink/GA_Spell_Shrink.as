UCLASS()
class UGA_Spell_Shrink : UGA_SpellBasicWithTarget
{
    default m_DebuffGE = UGE_Shrink::StaticClass();
    default m_SpellConfigClass = UShrinkSpellConfig::StaticClass();

    bool IsValidTarget(AActor NewTarget) override
    {
        if(!Super::IsValidTarget(NewTarget))
            return false;

        auto character = Cast<AGothicCharacter>(NewTarget);
        if(character == nullptr)
            return false;

        if(!CheckValidTargetSpecies(character))
        {
            return false;
        }

        return true;
    }

    float GetDuration() override
    {
        auto config = Cast<UShrinkSpellConfig>(m_SpellConfigClass.Get().GetDefaultObject());
        if(config != nullptr)
            return config.m_Duration;
        return Super::GetDuration();
    }

    UFUNCTION(BlueprintOverride, meta=(NoSuperCall))
    void OnNewTarget_Scriptable(AActor NewTarget)
    {
        Super::OnNewTarget_Scriptable(NewTarget);
        auto abComp = GothicGAS::GetAbilitySystemComponent(NewTarget);
        if(abComp == nullptr)
            return;

        abComp.GiveAbility(UGA_Spell_Creature_Shrink::StaticClass(), 1, -1, GetAvatarActorFromActorInfo());
    }

    bool CheckValidTargetSpecies(const AGothicCharacter NewTarget) const
    {       
        if(NewTarget != nullptr)
        {
            if(NewTarget.IsSpecies(GameplayTag::Species_Creature_Troll))
                return true;
        }    
        return false;
    }
}