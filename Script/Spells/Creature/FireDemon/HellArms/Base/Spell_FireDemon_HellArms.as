UCLASS()
class UHellArmsSpellConfig : USpellConfig
{
   
    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    float m_Duration = 0.5f;
    
    default m_AreaRange = 1000.f;
    default m_AreaAngle = 360.f;
}

UCLASS()
class UHellArmWeaponDefinition : UMeleeWeaponBase_Creature
{
    default m_Name = "Hell_Arm";

	//Current setup
	//default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 100.0f);

	//Test V3 setup
	default m_DamageBase.Add(GameplayTag::Item_Damage_Elemental_Fire, 40.0f);


	default m_SuperArmorDamageBase = 0.0f;

    // default SetItemType(GameplayTag::Item_Weapon_Sword_OneHand);
	// default AddItemSpec(GameplayTag::Item_Grip_OneHand);

	default m_DamageReduction = MAX_flt;


	// Super Armor
	default m_StartRegenerateSc = 5.0f;
	default m_HpRegenerateTick = 20.0f;
	default m_BlockSuperArmorMultiplier = 1.0f;

	// Critical
	//default m_CriticalMultiplier = 2.0f;

	default m_FeedbackData = UHellArmsFeedback::StaticClass();
}


