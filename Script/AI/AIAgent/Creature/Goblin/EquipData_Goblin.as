UCLASS()
class UEquipData_Goblin_UProjectile : UEquipData
{
    default m_SocketName = n"weapon_l";
}

UCLASS()
class UEquipData_Goblin : UEquipData
{
    default m_SocketName = n"weapon_r";
    default m_SocketDrawName.FindOrAdd(EHoldsterLocation::None, n"weapon_r");

    default m_EquipMontages.Add(FEquipMontage(EStance::Standing, EHoldsterLocation::Waist,n"AnimMontage'/Game/AnimLibrary/Creatures/Green_Goblin/Combat/Draw/GreenGoblin_Draw_Montage.GreenGoblin_Draw_Montage'"));
    default m_UnequipMontages.Add(FEquipMontage(EStance::Standing, EHoldsterLocation::Waist,n"AnimMontage'/Game/AnimLibrary/Creatures/Green_Goblin/Combat/Draw/GreenGoblin_Shelve_Montage.GreenGoblin_Shelve_Montage'"));

}