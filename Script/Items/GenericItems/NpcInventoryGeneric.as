UCLASS()
class UEquipData_Orebag_Human : UEquipData
{
    default m_SocketName = n"weapon_l";

    default m_EquipMontages.Add(FEquipMontage(n"AnimMontage'/Game/AnimLibrary/Humanoid/ALS/Animations/Bow/Montages/EquipBow.EquipBow'"));
    default m_UnequipMontages.Add(FEquipMontage(n"AnimMontage'/Game/AnimLibrary/Humanoid/ALS/Animations/Bow/Montages/UnequipBow.UnequipBow'"));
}

UCLASS()
class UItemAnimConfig_Orebag_Human : UItemAnimConfig
{
    default m_EquipData = UEquipData_Orebag_Human::StaticClass();
}

UCLASS()
class UItIg_Worldsplitter: UItemDefinition
{
    default m_Name = "Orebag";
    default m_Description = "ItIg_Worldsplitter_Description";
    default m_ItemVisual = n"Blueprint'/Game/Items/Misc/BP_ItMs_Worldsplitter_Visual.BP_ItMs_Worldsplitter_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Misc/BP_ItMs_Worldsplitter_World.BP_ItMs_Worldsplitter_World_C'";
    default m_Value = 0;
    default m_MaxStack = 1;
}
