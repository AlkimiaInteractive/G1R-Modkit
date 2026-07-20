
UCLASS()
class UGoblinThrowStone : UProjectileDefinition
{
    default m_Name = "Goblin_ThrowStone";
    default m_OnEquipEffect = UGE_Goblin_Equip::StaticClass();

    default SetItemType(GameplayTag::Item_Projectile);
	default AddItemSpec(GameplayTag::Item_Property_NonLoot);
    default AddItemSpec(GameplayTag::Item_Range_Long);

    default m_HitEffect = UGE_Damage::StaticClass();
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, -5);
	default m_SuperArmorDamageBase = 7.0f;

	default m_ItemVisual = n"Blueprint'/Game/Items/Misc/BP_ItAm_Goblin_Stone_Visual.BP_ItAm_Goblin_Stone_Visual_C'";
}

UCLASS()
class UGoblinThrowStoneBlack : UProjectileDefinition
{
    default m_Name = "Goblin_ThrowStoneBlack";
    default m_OnEquipEffect = UGE_Goblin_Equip::StaticClass();

    default SetItemType(GameplayTag::Item_Projectile);
	default AddItemSpec(GameplayTag::Item_Property_NonLoot);
    default AddItemSpec(GameplayTag::Item_Range_Long);

    default m_HitEffect = UGE_Damage::StaticClass();
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, -20);
	default m_SuperArmorDamageBase = 7.0f;

	default m_ItemVisual = n"Blueprint'/Game/Items/Misc/BP_ItAm_Goblin_Stone_Black_Visual.BP_ItAm_Goblin_Stone_Black_Visual_C'";
}

UCLASS()
class UGoblinThrowStoneWarrior : UProjectileDefinition
{
    default m_Name = "Goblin_ThrowStoneWarrior";
    default m_OnEquipEffect = UGE_Goblin_Equip::StaticClass();

    default SetItemType(GameplayTag::Item_Projectile);
	default AddItemSpec(GameplayTag::Item_Property_NonLoot);
    default AddItemSpec(GameplayTag::Item_Range_Long);

    default m_HitEffect = UGE_Damage::StaticClass();
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, -50);
	default m_SuperArmorDamageBase = 7.0f;

	default m_ItemVisual = n"Blueprint'/Game/Items/Misc/BP_ItAm_Goblin_Stone_Warrior_Visual.BP_ItAm_Goblin_Stone_Warrior_Visual_C'";
}