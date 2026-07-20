UCLASS()
class UTeleportSpellConfig_StoneGolem : USpellConfig
{
    default m_SpellLevels.Empty();
    default AddSpellLevel(-1.0f, 0.2f, -1.0f, UGA_Spell_Teleport_StoneGolem::StaticClass());

    default m_SpellTargetType = ESpellTargetType::None;
    default m_SpellManaUsage = ESpellManaUsage::Normal;

    default m_CameraBehaviour = GetCameraBehaviourSpellFrontArea_StoneGolem();
}
