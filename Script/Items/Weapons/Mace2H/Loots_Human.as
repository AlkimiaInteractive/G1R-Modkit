UCLASS()
class ULootsData_Human_M2H_Un : UPicksData
{
    FStanceMapMontage LootUp;
    default LootUp.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace2H/Loot/Untrained/A_Man_M2H_Un_Loot_Montage.A_Man_M2H_Un_Loot_Montage'";
    
	FStanceMapMontage LootFront;
    default LootFront.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace2H/Loot/Untrained/A_Man_M2H_Un_Loot_Montage.A_Man_M2H_Un_Loot_Montage'";
   
    FStanceMapMontage LootDown;
    default LootDown.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace2H/Loot/Untrained/A_Man_M2H_Un_Loot_Montage.A_Man_M2H_Un_Loot_Montage'";

	default m_MontagesMap.FindOrAdd(n"LootUp", LootUp);
    default m_MontagesMap.FindOrAdd(n"LootFront", LootFront);
    default m_MontagesMap.FindOrAdd(n"LootDown", LootDown);
}

UCLASS()
class ULootsData_Human_M2H_Tr : UPicksData
{
    FStanceMapMontage LootUp;
    default LootUp.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace2H/Loot/Trained/A_Man_M2H_Tr_Loot_Montage.A_Man_M2H_Tr_Loot_Montage'";
    
	FStanceMapMontage LootFront;
    default LootFront.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace2H/Loot/Trained/A_Man_M2H_Tr_Loot_Montage.A_Man_M2H_Tr_Loot_Montage'";
   
    FStanceMapMontage LootDown;
    default LootDown.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace2H/Loot/Trained/A_Man_M2H_Tr_Loot_Montage.A_Man_M2H_Tr_Loot_Montage'";

	default m_MontagesMap.FindOrAdd(n"LootUp", LootUp);
    default m_MontagesMap.FindOrAdd(n"LootFront", LootFront);
    default m_MontagesMap.FindOrAdd(n"LootDown", LootDown);
}

UCLASS()
class ULootsData_Human_M2H_Ma : UPicksData
{
    FStanceMapMontage LootUp;
    default LootUp.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace2H/Loot/Master/A_Man_M2H_Ma_Loot_Montage.A_Man_M2H_Ma_Loot_Montage'";
    
	FStanceMapMontage LootFront;
    default LootFront.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace2H/Loot/Master/A_Man_M2H_Ma_Loot_Montage.A_Man_M2H_Ma_Loot_Montage'";
   
    FStanceMapMontage LootDown;
    default LootDown.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace2H/Loot/Master/A_Man_M2H_Ma_Loot_Montage.A_Man_M2H_Ma_Loot_Montage'";

	default m_MontagesMap.FindOrAdd(n"LootUp", LootUp);
    default m_MontagesMap.FindOrAdd(n"LootFront", LootFront);
    default m_MontagesMap.FindOrAdd(n"LootDown", LootDown);
}