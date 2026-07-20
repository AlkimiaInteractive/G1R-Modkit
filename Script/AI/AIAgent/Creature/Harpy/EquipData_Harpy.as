UCLASS()
class UEquipData_Harpy : UEquipData
{
    default m_EquipMontages.Add(FEquipMontage(n"AnimMontage'/Game/AnimLibrary/Creatures/Harpy/Combat/Draw/A_Harpy_Fly_Draw_Montage.A_Harpy_Fly_Draw_Montage'"));
    default m_UnequipMontages.Add(FEquipMontage(n"AnimMontage'/Game/AnimLibrary/Creatures/Harpy/Combat/Draw/A_Harpy_Fly_Shelve_Montage.A_Harpy_Fly_Shelve_Montage'"));
}

UCLASS()
class UEquipData_Harpy_Grounded : UEquipData
{
    default m_EquipMontages.Add(FEquipMontage(n"AnimMontage'/Game/AnimLibrary/Creatures/Harpy/Combat/Draw/Harpy_N_Draw_Montage.Harpy_N_Draw_Montage'"));
    default m_UnequipMontages.Add(FEquipMontage(n"AnimMontage'/Game/AnimLibrary/Creatures/Harpy/Combat/Draw/Harpy_N_Shelve_Montage.Harpy_N_Shelve_Montage'"));
    }

UCLASS()
class UEquipData_Harpy_UProjectile : UEquipData
{
    default m_SocketName = n"ProjectileShootSocket";
}