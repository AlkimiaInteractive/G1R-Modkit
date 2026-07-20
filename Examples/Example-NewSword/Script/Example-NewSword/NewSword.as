UCLASS()
class UItMw_1H_Sword_Example: USword1H
{
    default m_Name = "ItMw_1H_Sword_Example";
    default m_Description = "ItMw_1H_Sword_Example_description";
    default m_Value = 9999;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 999.0f);
    default m_SuperArmorDamageBase = 25;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_Lightguard_01_Visual.BP_ItMw_1H_Sword_Lightguard_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_Lightguard_01_World.BP_ItMw_1H_Sword_Lightguard_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_1H_Sword_Lightguard_01.T_ItemIcon_ItMw_1H_Sword_Lightguard_01";
    default SetItemType(GameplayTag::Item_Weapon_Sword_OneHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength, n"Strength"), 1.0f);
}

// Inject into the base game player so the new sword is in the start inventory.
UCLASS(meta=(ReplaceParentClass))
class UG1RPlayer_ExampleSword: UG1RPlayer
{
    default AddToInventory(UItMw_1H_Sword_Example);
}
