/////////////////////////////////////////
// ORC WEAPON BASE
/////////////////////////////////////////

UCLASS()
class UAxe2H_Orc : UAxe2H
{
    default m_ActionsKeywords.Reset();
    default m_ActionsKeywords.Add(UActionKeywords_Melee_TwoHanded_Orc::StaticClass());

    default m_HoldsterLocation = EHoldsterLocation::Waist; 

    default AddItemSpec(GameplayTag::Item_Size_Orc);
}

UCLASS()
class UMace2H_Orc : UMace2H
{
    default m_ActionsKeywords.Reset();
    default m_ActionsKeywords.Add(UActionKeywords_Melee_TwoHanded_Orc::StaticClass());

    default m_HoldsterLocation = EHoldsterLocation::Waist; 

    default AddItemSpec(GameplayTag::Item_Size_Orc);
}

UCLASS()
class USword2H_Orc : USword2H
{
    default m_ActionsKeywords.Reset();
    default m_ActionsKeywords.Add(UActionKeywords_Melee_TwoHanded_Orc::StaticClass());

    default m_HoldsterLocation = EHoldsterLocation::Waist; 

    default AddItemSpec(GameplayTag::Item_Size_Orc);
}

UCLASS()
class UStaff2H_Orc : UStaff2H
{
    default m_ActionsKeywords.Reset();
    default m_ActionsKeywords.Add(UActionKeywords_Melee_TwoHanded_Orc::StaticClass());

    //default AddItemSpec(GameplayTag::Item_Range_Long);
    default AddItemSpec(GameplayTag::Item_Size_Orc);
}

/////////////////////////////////////////
// ORC WEAPON ITEMS
/////////////////////////////////////////

UCLASS()
class UItMw_2H_Axe_Orc_01_vOrc: UAxe2H_Orc
{
    default m_Name = "ItMw_2H_Axe_Orc_01_vOrc";
    default m_Value = 35;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 50.0f);
    default m_SuperArmorDamageBase = 30;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Axe_Orc_01_vOrc_Visual.BP_ItMw_2H_Axe_Orc_01_vOrc_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Axe_Orc_01_vOrc_World.BP_ItMw_2H_Axe_Orc_01_vOrc_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_2H_Axe_Orc_01.T_ItemIcon_ItMw_2H_Axe_Orc_01";
    default m_Description = "ItMw_2H_Axe_Orc_01_description";
    default SetItemType(GameplayTag::Item_Weapon_Axe_TwoHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 42.0f);
    default m_ReplaceBy = UItMw_2H_Axe_Orc_01::StaticClass();
}

UCLASS()
class UItMw_2H_Axe_Orc_02_vOrc: UAxe2H_Orc
{
    default m_Name = "ItMw_2H_Axe_Orc_02_vOrc";
    default m_Value = 38;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 55.0f);
    default m_SuperArmorDamageBase = 30;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Axe_Orc_02_vOrc_Visual.BP_ItMw_2H_Axe_Orc_02_vOrc_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Axe_Orc_02_vOrc_World.BP_ItMw_2H_Axe_Orc_02_vOrc_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_2H_Axe_Orc_02.T_ItemIcon_ItMw_2H_Axe_Orc_02";
    default m_Description = "ItMw_2H_Axe_Orc_02_description";
    default SetItemType(GameplayTag::Item_Weapon_Axe_TwoHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 47.0f);
    default m_ReplaceBy = UItMw_2H_Axe_Orc_02::StaticClass();
}

UCLASS()
class UItMw_2H_Axe_Orc_03_vOrc: UAxe2H_Orc
{
    default m_Name = "ItMw_2H_Axe_Orc_03_vOrc";
    default m_Value = 40;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 60.0f);
    default m_SuperArmorDamageBase = 30;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Axe_Orc_03_vOrc_Visual.BP_ItMw_2H_Axe_Orc_03_vOrc_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Axe_Orc_03_vOrc_World.BP_ItMw_2H_Axe_Orc_03_vOrc_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_2H_Axe_Orc_03.T_ItemIcon_ItMw_2H_Axe_Orc_03";
    default m_Description = "ItMw_2H_Axe_Orc_03_description";
    default SetItemType(GameplayTag::Item_Weapon_Axe_TwoHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 52.0f);
    default m_ReplaceBy = UItMw_2H_Axe_Orc_03::StaticClass();
}

UCLASS()
class UItMw_2H_Axe_Orc_04_vOrc: UAxe2H_Orc
{
    default m_Name = "ItMw_2H_Axe_Orc_04_vOrc";
    default m_Value = 43;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 65.0f);
    default m_SuperArmorDamageBase = 30;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Axe_Orc_04_vOrc_Visual.BP_ItMw_2H_Axe_Orc_04_vOrc_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Axe_Orc_04_vOrc_World.BP_ItMw_2H_Axe_Orc_04_vOrc_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_2H_Axe_Orc_04.T_ItemIcon_ItMw_2H_Axe_Orc_04";
    default m_Description = "ItMw_2H_Axe_Orc_04_description";
    default SetItemType(GameplayTag::Item_Weapon_Axe_TwoHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 54.0f);
    default m_ReplaceBy = UItMw_2H_Axe_Orc_04::StaticClass();
}

UCLASS()
class UItMw_2H_Mace_Orc_01_vOrc: UMace2H_Orc
{
    default m_Name = "ItMw_2H_Mace_Orc_01_vOrc";
    default m_Value = 50;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, 75.0f);
    default m_SuperArmorDamageBase = 30;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Mace_Orc_01_vOrc_Visual.BP_ItMw_2H_Mace_Orc_01_vOrc_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Mace_Orc_01_vOrc_World.BP_ItMw_2H_Mace_Orc_01_vOrc_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_2H_Mace_Orc_01.T_ItemIcon_ItMw_2H_Mace_Orc_01";
    default m_Description = "ItMw_2H_Mace_Orc_01_description";
    default SetItemType(GameplayTag::Item_Weapon_Mace_TwoHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 60.0f);
    default m_ReplaceBy = UItMw_2H_Mace_Orc_01::StaticClass();
}

UCLASS()
class UItMw_2H_Staff_Orc_vOrc: UStaff2H_Orc
{
    default m_Name = "ItMw_2H_Staff_Orc_vOrc";
    default m_Value = 0;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, 50.0f);
    default m_SuperArmorDamageBase = 30;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Staff_Orc_vOrc_Visual.BP_ItMw_2H_Staff_Orc_vOrc_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Staff_Orc_vOrc_World.BP_ItMw_2H_Staff_Orc_vOrc_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_2H_Staff_Orc.T_ItemIcon_ItMw_2H_Staff_Orc";
    default SetItemType(GameplayTag::Item_Weapon_Staff_TwoHand_Spell);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default AddItemSpec(GameplayTag::Item_Property_NonLoot);

    default m_ActionsKeywords.Add(USpellActionKeywords_FireBall_Orc::StaticClass());

    default m_ReplaceBy = UItAr_Rune_FireBall::StaticClass();
}

UCLASS()
class UItMw_2H_Staff_Unorc_vOrc: UStaff2H_Orc
{
    default m_Name = "ItMw_2H_Staff_Unorc";
    default m_Value = 0;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, 30.0f);
    default m_SuperArmorDamageBase = 30;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Staff_Unorc_vOrc_Visual.BP_ItMw_2H_Staff_Unorc_vOrc_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Staff_Unorc_vOrc_World.BP_ItMw_2H_Staff_Unorc_vOrc_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_2H_Staff_Unorc.T_ItemIcon_ItMw_2H_Staff_Unorc";
    default SetItemType(GameplayTag::Item_Weapon_Staff_TwoHand_Spell);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);

    default m_ReplaceBy = UItMw_2H_Staff_Unorc::StaticClass();
}

UCLASS()
class UItMw_2H_Staff_Unorc_VHashor_vOrc: UItMw_2H_Staff_Unorc_vOrc
{
    default m_Name = "ItAr_Rune_Pyrokinesis";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Elemental_Fire, 50.0f);
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Staff_Unorc_VHashor_vOrc_Visual.BP_ItMw_2H_Staff_Unorc_VHashor_vOrc_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Staff_Unorc_VHashor_vOrc_World.BP_ItMw_2H_Staff_Unorc_VHashor_vOrc_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItAr_Rune_Pyrokinesis.T_ItemIcon_ItAr_Rune_Pyrokinesis";
    default SetItemType(GameplayTag::Item_Weapon_Staff_TwoHand_Spell_Pyrokinesis);
    default AddItemSpec(GameplayTag::Item_Property_NonLoot);
    default m_ActionsKeywords.Add(USpellActionKeywords_Pyrokinesis_Orc::StaticClass());
    default m_ActionsKeywords.Add(USpellActionKeywords_Firewall_Orc::StaticClass());
    default m_Description = "ItAr_Rune_Pyrokinesis_description";
    default m_ReplaceBy = UItAr_Rune_Pyrokinesis::StaticClass();
}

UCLASS()
class UItMw_2H_Staff_Unorc_VKasorg_vOrc: UItMw_2H_Staff_Unorc_vOrc
{
    default m_Name = "ItAr_Rune_BallLightning";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Elemental_Energy, 50.0f);
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Staff_Unorc_VKasorg_vOrc_Visual.BP_ItMw_2H_Staff_Unorc_VKasorg_vOrc_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Staff_Unorc_VKasorg_vOrc_World.BP_ItMw_2H_Staff_Unorc_VKasorg_vOrc_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItAr_Rune_BallLightning.T_ItemIcon_ItAr_Rune_BallLightning";
    default SetItemType(GameplayTag::Item_Weapon_Staff_TwoHand_Spell_BallLightning);
    default AddItemSpec(GameplayTag::Item_Property_NonLoot);
    default m_ActionsKeywords.Add(USpellActionKeywords_BallLightning_Orc::StaticClass());
    default m_Description = "ItAr_Rune_BreathOfDeath_description";
    default m_ReplaceBy = UItAr_Rune_BallLightning::StaticClass();
}

UCLASS()
class UItMw_2H_Staff_Unorc_VUnhilqt_vOrc: UItMw_2H_Staff_Unorc_vOrc
{
    default m_Name = "ItAr_Rune_ChainLightning";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Elemental_Energy, 50.0f);
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Staff_Unorc_VUnhilqt_vOrc_Visual.BP_ItMw_2H_Staff_Unorc_VUnhilqt_vOrc_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Staff_Unorc_VUnhilqt_vOrc_World.BP_ItMw_2H_Staff_Unorc_VUnhilqt_vOrc_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItAr_Rune_ChainLightning.T_ItemIcon_ItAr_Rune_ChainLightning";
    default SetItemType(GameplayTag::Item_Weapon_Staff_TwoHand_Spell_ChainLightning);
    default AddItemSpec(GameplayTag::Item_Property_NonLoot);
    default m_ActionsKeywords.Add(USpellActionKeywords_ChainLightning_Orc::StaticClass());
    default m_Description = "ItAr_Rune_ChainLightning_description";
    default m_ReplaceBy = UItAr_Rune_ChainLightning::StaticClass();
}

UCLASS()
class UItMw_2H_Staff_Unorc_VRuuushk_vOrc: UItMw_2H_Staff_Unorc_vOrc
{
    default m_Name = "ItAr_Rune_StormOfFire";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Elemental_Fire, 50.0f);
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Staff_Unorc_VRuuushk_vOrc_Visual.BP_ItMw_2H_Staff_Unorc_VRuuushk_vOrc_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Staff_Unorc_VRuuushk_vOrc_World.BP_ItMw_2H_Staff_Unorc_VRuuushk_vOrc_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItAr_Rune_StormOfFire.T_ItemIcon_ItAr_Rune_StormOfFire";
    default SetItemType(GameplayTag::Item_Weapon_Staff_TwoHand_Spell_StormOfFire);
    default AddItemSpec(GameplayTag::Item_Property_NonLoot);
    default m_ActionsKeywords.Add(USpellActionKeywords_StormOfFire_Orc::StaticClass());
    default m_Description = "ItAr_Rune_StormOfFire_description";
    default m_ReplaceBy = UItAr_Rune_StormOfFire::StaticClass();
}

UCLASS()
class UItMw_2H_Staff_Unorc_GVArushat_vOrc: UItMw_2H_Staff_Unorc_vOrc
{
    default m_Name = "ItAr_Rune_BreathOfDeath";
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, 80.0f);
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Staff_Unorc_GVArushat_vOrc_Visual.BP_ItMw_2H_Staff_Unorc_GVArushat_vOrc_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Staff_Unorc_GVArushat_vOrc_World.BP_ItMw_2H_Staff_Unorc_GVArushat_vOrc_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItAr_Rune_BreathOfDeath.T_ItemIcon_ItAr_Rune_BreathOfDeath";
    default SetItemType(GameplayTag::Item_Weapon_Staff_TwoHand_Spell_BreathOfDeath);
    default AddItemSpec(GameplayTag::Item_Property_NonLoot);
    default m_ActionsKeywords.Add(USpellActionKeywords_BreathOfDeath_Orc::StaticClass());
    default m_Description = "ItAr_Rune_BreathOfDeath_description";
    default m_ReplaceBy = UItAr_Rune_BreathOfDeath::StaticClass();
}

UCLASS()
class UItMw_2H_Sword_Orc_01_vOrc: USword2H_Orc
{
    default m_Name = "ItMw_2H_Sword_Orc_01_vOrc";
    default m_Value = 30;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 45.0f);
    default m_SuperArmorDamageBase = 30;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Sword_Orc_01_vOrc_Visual.BP_ItMw_2H_Sword_Orc_01_vOrc_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Sword_Orc_01_vOrc_World.BP_ItMw_2H_Sword_Orc_01_vOrc_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_2H_Sword_Orc_01.T_ItemIcon_ItMw_2H_Sword_Orc_01";
    default SetItemType(GameplayTag::Item_Weapon_Sword_TwoHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_HoldsterLocation = EHoldsterLocation::Back; 
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 37.0f);
    default m_ReplaceBy = UItMw_2H_Sword_Orc_01::StaticClass();
}

//----- WEAPONS WITHOUT STRENGHT REQUIREMENT FOR SLEEPER BATTLE

UCLASS()
class UItMw_2H_Axe_Orc_01_vOrc_Sleeper : UItMw_2H_Axe_Orc_01_vOrc
{
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 0.0f);
    default AddItemSpec(GameplayTag::Item_Property_NonLoot);
}

UCLASS()
class UItMw_2H_Axe_Orc_02_vOrc_Sleeper : UItMw_2H_Axe_Orc_02_vOrc
{
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 0.0f);
    default AddItemSpec(GameplayTag::Item_Property_NonLoot);
}

UCLASS()
class UItMw_2H_Axe_Orc_03_vOrc_Sleeper : UItMw_2H_Axe_Orc_03_vOrc
{
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 0.0f);
    default AddItemSpec(GameplayTag::Item_Property_NonLoot);
}

UCLASS()
class UItMw_2H_Axe_Orc_04_vOrc_Sleeper : UItMw_2H_Axe_Orc_04_vOrc
{
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 0.0f);
    default AddItemSpec(GameplayTag::Item_Property_NonLoot);
}

UCLASS()
class UItMw_2H_Mace_Orc_01_vOrc_Sleeper : UItMw_2H_Mace_Orc_01_vOrc
{
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 0.0f);
    default AddItemSpec(GameplayTag::Item_Property_NonLoot);
}

UCLASS()
class UItMw_2H_Sword_Orc_01_vOrc_Sleeper : UItMw_2H_Sword_Orc_01_vOrc
{
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 0.0f);
    default AddItemSpec(GameplayTag::Item_Property_NonLoot);
}

//----- TEST ORC WEAPONS

UCLASS()
class UItMw_2H_Staff_Orc_vOrc_Fireball : UItMw_2H_Staff_Orc_vOrc
{
    default m_Name = "ItMw_2H_Staff_Orc_Fireball";
    default SetItemType(GameplayTag::Item_Weapon_PickaxeDemo);
}

UCLASS()
class UItMw_2H_Staff_Unorc_vOrc_Pyrokinesis : UItMw_2H_Staff_Unorc_VHashor_vOrc
{
    default m_Name = "ItMw_2H_Staff_Unorc_Pyrokinesis";
    default SetItemType(GameplayTag::Item_Weapon_Sword_OneHand);
}

UCLASS()
class UItMw_2H_Staff_Unorc_vOrc_BallLighting : UItMw_2H_Staff_Unorc_VKasorg_vOrc
{
    default m_Name = "ItMw_2H_Staff_Unorc_BallLighting";
    default SetItemType(GameplayTag::Item_Weapon_Axe_OneHand); 
}

UCLASS()
class UItMw_2H_Staff_Unorc_vOrc_ChainLighting : UItMw_2H_Staff_Unorc_VUnhilqt_vOrc
{
    default m_Name = "ItMw_2H_Staff_Unorc_ChainLighting";
    default SetItemType(GameplayTag::Item_Weapon_Mace_OneHand);
}

UCLASS()
class UItMw_2H_Staff_Unorc_vOrc_StormOfFire : UItMw_2H_Staff_Unorc_VRuuushk_vOrc
{
    default m_Name = "ItMw_2H_Staff_Unorc_StormOfFire";
    default SetItemType(GameplayTag::Item_Weapon_Tail);
}

UCLASS()
class UItMw_2H_Staff_Unorc_vOrc_BreathOfDeath : UItMw_2H_Staff_Unorc_GVArushat_vOrc
{
    default m_Name = "ItMw_2H_Staff_Unorc_BreathOfDeath";
    default SetItemType(GameplayTag::Item_Weapon_Claw);
}

