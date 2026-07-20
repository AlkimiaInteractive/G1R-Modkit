UCLASS()
class UEquipData_Human_Rod : UEquipData
{
    default m_SocketName = n"weapon_l";

    default m_EquipMontages.Add(FEquipMontage(n"AnimMontage'/Game/AnimLibrary/Humanoid/ALS/Animations/Bow/Montages/EquipBow.EquipBow'"));
    default m_UnequipMontages.Add(FEquipMontage(n"AnimMontage'/Game/AnimLibrary/Humanoid/ALS/Animations/Bow/Montages/UnequipBow.UnequipBow'"));
}