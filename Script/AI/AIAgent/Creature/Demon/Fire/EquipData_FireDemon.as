UCLASS()
class UEquipData_FireDemon : UEquipData
{
    default m_EquipMontages.Add(FEquipMontage(n"AnimMontage'/Game/AnimLibrary/Creatures/FireDemon/Combat/Draw/FireDemon_Draw_Montage.FireDemon_Draw_Montage'"));
    default m_UnequipMontages.Add(FEquipMontage(n"AnimMontage'/Game/AnimLibrary/Creatures/FireDemon/Combat/Draw/FireDemon_Shelve_Montage.FireDemon_Shelve_Montage'"));
}

UCLASS()
class UEquipData_Demon_Fire_R : UEquipData
{
    default m_SocketName = n"hand_r";
}
UCLASS()
class UEquipData_Demon_Fire_L : UEquipData
{
    default m_SocketName = n"hand_l";
}
