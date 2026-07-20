UCLASS()
class UEquipData_Human_Bow : UEquipData
{
    // Equip
    default m_EquipMontages.Add(FEquipMontage(EStance::Standing, EHoldsterLocation::Back, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Draw/N/Man_Bow_N_Equip.Man_Bow_N_Equip'"));
    default m_EquipMontages.Add(FEquipMontage(EStance::Crouching, EHoldsterLocation::Back, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Draw/STL/Man_Bow_STL_Equip.Man_Bow_STL_Equip'"));
    
    default m_UnequipMontages.Add(FEquipMontage(EStance::Standing, EHoldsterLocation::Back, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Draw/N/Man_Bow_N_Unequip.Man_Bow_N_Unequip'"));
    default m_UnequipMontages.Add(FEquipMontage(EStance::Crouching, EHoldsterLocation::Back, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Draw/STL/Man_Bow_STL_Unequip.Man_Bow_STL_Unequip'"));
    
    default m_DropAndEquipMontages.Add(FEquipMontage(EStance::Standing, EHoldsterLocation::Back, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Draw/Swap/Ranged/A_Man_T1H_N_Swap_Bow_Montage.A_Man_T1H_N_Swap_Bow_Montage'"));
    default m_DropAndEquipMontages.Add(FEquipMontage(EStance::Crouching, EHoldsterLocation::Back, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Draw/Swap/Ranged/A_Man_T1H_STL_Swap_Bow_Montage.A_Man_T1H_STL_Swap_Bow_Montage'"));
    
    default m_SocketName = n"weapon_l";
    default m_SocketDrawName.FindOrAdd(EHoldsterLocation::Back) = n"weapon_hold_back_down_Bow";
}

UCLASS()
class UEquipData_Human_Crossbow : UEquipData
{
    default m_SocketName = n"weapon_r";
    default m_SocketDrawName.FindOrAdd(EHoldsterLocation::Back) = n"weapon_hold_back_down_Crossbow";

    default m_EquipMontages.Add(FEquipMontage(EStance::Standing, EHoldsterLocation::Back, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Draw/N/Man_Crossbow_N_Equip.Man_Crossbow_N_Equip'"));
    default m_EquipMontages.Add(FEquipMontage(EStance::Crouching, EHoldsterLocation::Back, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Draw/STL/Man_Crossbow_STL_Equip.Man_Crossbow_STL_Equip'"));
    
    default m_UnequipMontages.Add(FEquipMontage(EStance::Standing, EHoldsterLocation::Back, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Draw/N/Man_Crossbow_N_Unequip.Man_Crossbow_N_Unequip'"));
    default m_UnequipMontages.Add(FEquipMontage(EStance::Crouching, EHoldsterLocation::Back, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Draw/STL/Man_Crossbow_STL_Unequip.Man_Crossbow_STL_Unequip'"));

    default m_DropAndEquipMontages.Add(FEquipMontage(EStance::Standing, EHoldsterLocation::Back, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Draw/Swap/Ranged/A_Man_T1H_N_Swap_Crossbow_Montage.A_Man_T1H_N_Swap_Crossbow_Montage'"));
    default m_DropAndEquipMontages.Add(FEquipMontage(EStance::Crouching, EHoldsterLocation::Back, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Draw/Swap/Ranged/A_Man_T1H_STL_Swap_Crossbow_Montage.A_Man_T1H_STL_Swap_Crossbow_Montage'"));
}


UCLASS()
class UEquipData_Human_Projectile : UEquipData
{
    default m_SocketName = n"weapon_r";
    default m_SocketDrawName.FindOrAdd(EHoldsterLocation::Back) = n"sword_holder_02Socket";
}