
UCLASS()
class UTeleportSpellConfig : USpellConfig
{
    float m_AppearingDuration = 3;
    float m_VanishingDuration = 1.5;
    default m_SpellTargetType = ESpellTargetType::Caster;
    default m_SpellManaUsage = ESpellManaUsage::Normal;
    default m_AreaRange = 300;
}

UCLASS()
class UTeleportSpellConfig_MagiciansOfFire : UTeleportSpellConfig
{
    default AddSpellLevel(5.f, 4.0f, .0f, UGA_Spell_Teleport_MagiciansOfFire::StaticClass());
    default m_Color = FColor(235, 122, 52, 255);
}

UCLASS()
class UTeleportSpellConfig_SwampCamp : UTeleportSpellConfig
{
    default AddSpellLevel(5.f,4.0f, .0f, UGA_Spell_Teleport_SwampCamp::StaticClass());
    default m_Color = FColor(169, 179, 62, 255);
}

UCLASS()
class UTeleportSpellConfig_MagiciansOfWater : UTeleportSpellConfig
{
    default AddSpellLevel(5.f,4.0f, .0f, UGA_Spell_Teleport_MagiciansOfWater::StaticClass());
    default m_Color = FColor(52, 205, 235, 255);
}

UCLASS()
class UTeleportSpellConfig_Necromancer : UTeleportSpellConfig
{
    default AddSpellLevel(5.f,4.0f, .0f, UGA_Spell_Teleport_Necromancer::StaticClass());
    default m_Color = FColor(93, 26, 186, 255);
}

UCLASS()
class UTeleportSpellConfig_OrcCementery : UTeleportSpellConfig
{
    default AddSpellLevel(5.f,4.0f, .0f, UGA_Spell_Teleport_OrcCementery::StaticClass());
    default m_Color = FColor(52, 205, 235, 255);
}

UCLASS()
class UTeleportSpellConfig_SleepersTemple : UTeleportSpellConfig
{
    default AddSpellLevel(5.f,4.0f, .0f, UGA_Spell_Teleport_SleepersTemple::StaticClass());
    default m_Color = FColor(52, 205, 235, 255);
}

UCLASS()
class UTeleportSpellConfig_SunkenTower : UTeleportSpellConfig
{
    default AddSpellLevel(5.f,4.0f, .0f, UGA_Spell_Teleport_SunkenTower::StaticClass());
    default m_Color = FColor(245, 167, 66, 255);
}