UCLASS()
class UEquipData_Human_Pickaxe : UEquipData
{
    default m_SocketName = n"weapon_r";
    default m_SocketDrawName.FindOrAdd(EHoldsterLocation::Back)= n"weapon_hold_back_up";

    default m_EquipMontages.Add(FEquipMontage(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Test_A2H/Pickaxe/Draw/Test_PickAxe_DEMO_S1H_Draw_Montage.Test_PickAxe_DEMO_S1H_Draw_Montage'"));
    default m_UnequipMontages.Add(FEquipMontage(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Test_A2H/Pickaxe/Draw/Test_PickAxe_DEMO_S1H_Shelve_Montage.Test_PickAxe_DEMO_S1H_Shelve_Montage'"));
    default m_DropAndEquipMontages.Add(FEquipMontage(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Draw/Swap/Untrained/A_Man_T1H_Swap_S1H_Un_Montage.A_Man_T1H_Swap_S1H_Un_Montage'"));

    default m_PickAndEquipMontages.Add(FPickAndEquipMontage(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Test_A2H/Pickaxe/Draw/Test_PickAxe_DEMO_S1H_PickAndDraw_Montage.Test_PickAxe_DEMO_S1H_PickAndDraw_Montage'"));
}