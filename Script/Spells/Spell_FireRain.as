
UCLASS()
class UFireRainSpellConfig : USpellConfig
{
    default m_SpellTargetType = ESpellTargetType::Area;
    default m_SpellManaUsage = ESpellManaUsage::Normal;
    default AddSpellLevel(20.f, 0.1f, .0f, UGA_Spell_FireRain::StaticClass());
    default m_TimePercentageFromWhichCantCancelSpell = 0.9f;  

    default m_CameraBehaviour = GetCameraBehaviourSpellFireRain();

    default m_SpellCategoryTag = GameplayTag::Event_Spell_Fire;

//    FCameraBehaviour SpellFireRain;
//    default SpellFireRain.m_IsAim = true;
//    default SpellFireRain.m_ArmLength = 190.0f;
//    default SpellFireRain.m_SocketOffset = FVector(-100.0f, 0.0f, 45.0f);
//    default m_CameraBehaviour = SpellFireRain;

    UFUNCTION(BlueprintOverride)
    void ChangeCameraBehaviour_Scriptable(bool moving) 
    {
        m_CameraBehaviour = GetCameraBehaviourSpellFireRain();
    }

    UFUNCTION(BlueprintOverride)
    bool IsTargetReachable_Scriptable(const AGothicCharacter instigator, const AGothicCharacter target) const
    {
        return instigator.ActorLocation.Distance(target.ActorLocation) < m_AreaRange;
    }
}