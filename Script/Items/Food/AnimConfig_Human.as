UCLASS()
class UEquipData_Human_Food    :   UEquipData
{
    default m_EquipMontages.Add(FEquipMontage(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Equip/A_Man_Equip_ScrollRune_Montage.A_Man_Equip_ScrollRune_Montage'"));
    default m_UnequipMontages.Add(FEquipMontage(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Equip/A_Man_Unequip_ScrollRune_Montage.A_Man_Unequip_ScrollRune_Montage'"));
    default m_DropAndEquipMontages.Add(FEquipMontage(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Draw/Swap/RuneScrolls/A_Man_T1H_Swap_ScrollRune_Montage.A_Man_T1H_Swap_ScrollRune_Montage'"));

}

UCLASS()
class UItemAnimConfig_Human_Food : UDefault_Human
{
    default m_EquipData = UEquipData_Human_Food::StaticClass(); 
}
