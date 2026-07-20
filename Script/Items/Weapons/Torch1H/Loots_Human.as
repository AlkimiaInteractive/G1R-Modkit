UCLASS()
class ULootsData_Human_T1H : UPicksData
{
    FStanceMapMontage LootUp;
    default LootUp.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Loot/A_Man_T1H_Loot_Montage.A_Man_T1H_Loot_Montage'";
    default LootUp.m_StanceMap.FindOrAdd(EStance::Crouching) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Loot/A_Man_T1H_STL_Loot_Montage.A_Man_T1H_STL_Loot_Montage'";
    
	FStanceMapMontage LootFront;
    default LootFront.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Loot/A_Man_T1H_Loot_Montage.A_Man_T1H_Loot_Montage'";
    default LootFront.m_StanceMap.FindOrAdd(EStance::Crouching) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Loot/A_Man_T1H_STL_Loot_Montage.A_Man_T1H_STL_Loot_Montage'";
   
    FStanceMapMontage LootDown;
    default LootDown.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Loot/A_Man_T1H_Loot_Montage.A_Man_T1H_Loot_Montage'";
    default LootDown.m_StanceMap.FindOrAdd(EStance::Crouching) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Loot/A_Man_T1H_STL_Loot_Montage.A_Man_T1H_STL_Loot_Montage'";

	default m_MontagesMap.FindOrAdd(n"LootUp", LootUp);
    default m_MontagesMap.FindOrAdd(n"LootFront", LootFront);
    default m_MontagesMap.FindOrAdd(n"LootDown", LootDown);
}