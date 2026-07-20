
UCLASS()
class UMinecrawlerLeg : UMeleeWeaponBase_Creature
{
    default m_Name = "Minecrawler_Leg";
    default m_OnEquipEffect = UGE_Minecrawler_Equip::StaticClass();

    default SetItemType(GameplayTag::Item_Weapon_MinecrawlerLeg);
    default AddItemSpec(GameplayTag::Item_Property_NonLoot);

    default m_HitEffect = UGE_Damage::StaticClass();
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 10);
    default m_DamageReduction = 5.0;
	default m_SuperArmorDamageBase = 20.0f;

	// Super Armor
	default m_StartRegenerateSc = 5.0f;
	default m_HpRegenerateTick = 20.0f;
	default m_BlockSuperArmorMultiplier = 1.0f;
}

UCLASS()
class UMCQueen_Legs : UMeleeWeaponBase_Creature
{
    default m_Name = "MCQueen_Legs";
    default m_OnEquipEffect = UGE_Minecrawler_Equip::StaticClass();

    default SetItemType(GameplayTag::Item_Weapon_MinecrawlerLeg);
    default AddItemSpec(GameplayTag::Item_Property_NonLoot);

    default m_HitEffect = UGE_Damage::StaticClass();
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 10);
    default m_DamageReduction = 5.0;
	default m_SuperArmorDamageBase = 40.0f;

	// Super Armor
	default m_StartRegenerateSc = 5.0f;
	default m_HpRegenerateTick = 20.0f;
	default m_BlockSuperArmorMultiplier = 1.0f;
}

UCLASS()
class UMCQueen_Legs_Phase2 : UMeleeWeaponBase_Creature
{
    default m_Name = "MCQueen_Legs_Phase2";
    default m_OnEquipEffect = UGE_Minecrawler_Equip::StaticClass();

    default SetItemType(GameplayTag::Item_Weapon_MinecrawlerLeg);
    default AddItemSpec(GameplayTag::Item_Property_NonLoot);
    default AddItemSpec(GameplayTag::Item_Property_MCQueenPhase2);

    default m_HitEffect = UGE_Damage::StaticClass();
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 10);
    default m_DamageReduction = 5.0;
	default m_SuperArmorDamageBase = 40.0f;

	// Super Armor
	default m_StartRegenerateSc = 5.0f;
	default m_HpRegenerateTick = 20.0f;
	default m_BlockSuperArmorMultiplier = 1.0f;
}

UCLASS()
class UMCQueen_Spit : UProjectileDefinition
{
    default m_Name = "MCQueen_Spit";
    default m_OnEquipEffect = UGE_Minecrawler_Equip::StaticClass();

    default SetItemType(GameplayTag::Item_Projectile);
	default AddItemSpec(GameplayTag::Item_Property_NonLoot);
    default AddItemSpec(GameplayTag::Item_Range_Long);

    default m_HitEffect = UGE_Damage::StaticClass();
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, 9);
	default m_SuperArmorDamageBase = 30.0f;

    default m_ArcParam = 10;
    
	default m_ItemVisual = n"Blueprint'/Game/AnimLibrary/Creatures/MCrawler_Queen/BP_ItAm_MCQueen_Egg_Visual.BP_ItAm_MCQueen_Egg_Visual_C'";

}
