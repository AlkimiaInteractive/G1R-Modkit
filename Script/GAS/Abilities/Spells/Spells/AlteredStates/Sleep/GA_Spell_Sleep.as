UCLASS()
class UGA_Spell_Sleep : UGA_SpellBasicWithTarget
{
    default m_DebuffGE = UGE_Sleep::StaticClass();
    default m_SpellConfigClass = USleepSpellConfig::StaticClass();

    bool IsValidTarget(AActor NewTarget) override
    {
        if(!Super::IsValidTarget(NewTarget))
            return false;

        auto character = Cast<AGothicCharacter>(NewTarget);
        if(character != nullptr)
            return character.IsHuman();
        return false;
    }

    float GetDuration() override
    {
        auto config = Cast<USleepSpellConfig>(m_SpellConfigClass.Get().GetDefaultObject());
        if(config != nullptr)
            return config.m_Duration;
        return Super::GetDuration();
    }
}