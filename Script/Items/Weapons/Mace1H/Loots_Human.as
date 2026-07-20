UCLASS()
class ULootsData_Human_M1H_Un : UPicksData
{
    FStanceMapMontage LootUp;
    default LootUp.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace1H/Loot/Untrained/A_Man_M1H_Un_Loot_Montage.A_Man_M1H_Un_Loot_Montage'";
    
	FStanceMapMontage LootFront;
    default LootFront.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace1H/Loot/Untrained/A_Man_M1H_Un_Loot_Montage.A_Man_M1H_Un_Loot_Montage'";
   
    FStanceMapMontage LootDown;
    default LootDown.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace1H/Loot/Untrained/A_Man_M1H_Un_Loot_Montage.A_Man_M1H_Un_Loot_Montage'";

	default m_MontagesMap.FindOrAdd(n"LootUp", LootUp);
    default m_MontagesMap.FindOrAdd(n"LootFront", LootFront);
    default m_MontagesMap.FindOrAdd(n"LootDown", LootDown);
}

UCLASS()
class ULootsData_Human_M1H_Tr : UPicksData
{
    FStanceMapMontage LootUp;
    default LootUp.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace1H/Loot/Trained/A_Man_M1H_Tr_Loot_Montage.A_Man_M1H_Tr_Loot_Montage'";
    
	FStanceMapMontage LootFront;
    default LootFront.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace1H/Loot/Trained/A_Man_M1H_Tr_Loot_Montage.A_Man_M1H_Tr_Loot_Montage'";
   
    FStanceMapMontage LootDown;
    default LootDown.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace1H/Loot/Trained/A_Man_M1H_Tr_Loot_Montage.A_Man_M1H_Tr_Loot_Montage'";

	default m_MontagesMap.FindOrAdd(n"LootUp", LootUp);
    default m_MontagesMap.FindOrAdd(n"LootFront", LootFront);
    default m_MontagesMap.FindOrAdd(n"LootDown", LootDown);
}

UCLASS()
class ULootsData_Human_M1H_Ma : UPicksData
{
    FStanceMapMontage LootUp;
    default LootUp.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace1H/Loot/Master/A_Man_M1H_Ma_Loot_Montage.A_Man_M1H_Ma_Loot_Montage'";
    
	FStanceMapMontage LootFront;
    default LootFront.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace1H/Loot/Master/A_Man_M1H_Ma_Loot_Montage.A_Man_M1H_Ma_Loot_Montage'";
   
    FStanceMapMontage LootDown;
    default LootDown.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace1H/Loot/Master/A_Man_M1H_Ma_Loot_Montage.A_Man_M1H_Ma_Loot_Montage'";

	default m_MontagesMap.FindOrAdd(n"LootUp", LootUp);
    default m_MontagesMap.FindOrAdd(n"LootFront", LootFront);
    default m_MontagesMap.FindOrAdd(n"LootDown", LootDown);
}