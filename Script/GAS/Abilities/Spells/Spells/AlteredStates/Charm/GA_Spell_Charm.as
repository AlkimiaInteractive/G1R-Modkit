
// class UGA_Spell_Charm: UGameplayAbilitySpell_Debuff
// {
//     default m_DebuffEffect = UGE_Charm::StaticClass();

//     default m_Duration = 8.3f;
// }


UCLASS()
class UGA_Spell_Charm : UGA_SpellBasicWithTarget
{
    default m_DebuffGE = UGE_Charm::StaticClass();
    default m_SpellConfigClass = UCharmSpellConfig::StaticClass();
    

    bool IsValidTarget(AActor NewTarget) override
    {
        if(!Super::IsValidTarget(NewTarget))
            return false;

        auto character = Cast<AGothicCharacter>(NewTarget);
        if(character != nullptr)
            return character.IsHuman() || character.IsUndead();
        return false;
    }

    float GetDuration() override
    {
        auto config = Cast<UCharmSpellConfig>(m_SpellConfigClass.Get().GetDefaultObject());
        if(config != nullptr)
            return config.m_Duration;
        return Super::GetDuration();
    }
}
