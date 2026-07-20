UCLASS()
class UProjectileSpellConfig_Firebolt_MiltenSleeper : USpellProjectileConfig
{
    default AddSpellLevel(2.f, 0.1f, 2.0f, UGA_Spell_Firebolt_MiltenSleeper::StaticClass());
    default m_TimePercentageFromWhichCantCancelSpell = 0.8f;

    UFUNCTION(BlueprintOverride)     
    void ChangeCameraBehaviour_Scriptable(bool moving)
    {         
       Super::ChangeCameraBehaviour_Scriptable(true);
    }
}

UCLASS()
class UMiltenSleeperFireBoltProjectileDefinition : UFireBoltProjectileDefinition
{

	default m_DamageBase.Add(GameplayTag::Item_Damage_Elemental_Fire, 70.0f);
	default AddDamageForMagicCircle(GameplayTag::Item_Damage_Elemental_Fire, GameplayTag::Skill_Mage_Circle_Second, 75.0f);
	default AddDamageForMagicCircle(GameplayTag::Item_Damage_Elemental_Fire, GameplayTag::Skill_Mage_Circle_Fourth, 80.0f);
	default AddDamageForMagicCircle(GameplayTag::Item_Damage_Elemental_Fire, GameplayTag::Skill_Mage_Circle_Sixth, 90.0f);

    default m_AimingAssistance.m_enableAimingAssistance = true;
}
