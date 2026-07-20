UCLASS()
class UEquipData_Skeleton   :   UEquipData
{
    default m_SocketName = n"weapon_r";
    default m_SocketDrawName.FindOrAdd(EHoldsterLocation::None)=n"weapon_r";

    default m_EquipMontages.Add(FEquipMontage(EStance::Standing, EHoldsterLocation::Waist,n"AnimMontage'/Game/AnimLibrary/Creatures/Skeleton/Combat/Draw/Skeleton_Draw_Montage.Skeleton_Draw_Montage'"));
    default m_UnequipMontages.Add(FEquipMontage(EStance::Standing, EHoldsterLocation::Waist,n"AnimMontage'/Game/AnimLibrary/Creatures/Skeleton/Combat/Draw/Skeleton_Shelve_Montage.Skeleton_Shelve_Montage'"));

}

UCLASS()
class UEquipData_Skeleton_Mage   :   UEquipData
{
    default m_SocketName = n"weapon_socket_r";
    default m_SocketDrawName.FindOrAdd(EHoldsterLocation::None) = n"weapon_socket_r";

    
    default m_EquipMontages.Add(FEquipMontage(EStance::Standing, EHoldsterLocation::Back,n"AnimMontage'/Game/AnimLibrary/Creatures/Skeleton_Mage/Combat/Draw/A_SkeletonMage_Draw_Montage.A_SkeletonMage_Draw_Montage'"));
    default m_UnequipMontages.Add(FEquipMontage(EStance::Standing, EHoldsterLocation::Back,n"AnimMontage'/Game/AnimLibrary/Creatures/Skeleton_Mage/Combat/Draw/A_SkeletonMage_Shelve_Montage.A_SkeletonMage_Shelve_Montage'"));
}