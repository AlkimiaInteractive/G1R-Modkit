UCLASS()
class ULootsData_Human_Bow : UPicksData
{
    FStanceMapMontage LootUp;
    default LootUp.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Loot/A_Man_Bow_Loot_Montage.A_Man_Bow_Loot_Montage'";
    default LootUp.m_StanceMap.FindOrAdd(EStance::Crouching) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Loot/A_Man_Bow_STL_Loot_Montage.A_Man_Bow_STL_Loot_Montage'";
    
	FStanceMapMontage LootFront;
    default LootFront.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Loot/A_Man_Bow_Loot_Montage.A_Man_Bow_Loot_Montage'";
    default LootFront.m_StanceMap.FindOrAdd(EStance::Crouching) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Loot/A_Man_Bow_STL_Loot_Montage.A_Man_Bow_STL_Loot_Montage'";
   
    FStanceMapMontage LootDown;
    default LootDown.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Loot/A_Man_Bow_Loot_Montage.A_Man_Bow_Loot_Montage'";
    default LootDown.m_StanceMap.FindOrAdd(EStance::Crouching) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Loot/A_Man_Bow_STL_Loot_Montage.A_Man_Bow_STL_Loot_Montage'";

	default m_MontagesMap.FindOrAdd(n"LootUp", LootUp);
    default m_MontagesMap.FindOrAdd(n"LootFront", LootFront);
    default m_MontagesMap.FindOrAdd(n"LootDown", LootDown);
}

UCLASS()
class ULootsData_Human_Crossbow : UPicksData
{
    FStanceMapMontage LootUp;
    default LootUp.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Loot/A_Man_Crossbow_Loot_Montage.A_Man_Crossbow_Loot_Montage'";
    default LootUp.m_StanceMap.FindOrAdd(EStance::Crouching) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Loot/A_Man_Crossbow_STL_Loot_Montage.A_Man_Crossbow_STL_Loot_Montage'";
    
	FStanceMapMontage LootFront;
    default LootFront.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Loot/A_Man_Crossbow_Loot_Montage.A_Man_Crossbow_Loot_Montage'";
    default LootFront.m_StanceMap.FindOrAdd(EStance::Crouching) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Loot/A_Man_Crossbow_STL_Loot_Montage.A_Man_Crossbow_STL_Loot_Montage'";
   
    FStanceMapMontage LootDown;
    default LootDown.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Loot/A_Man_Crossbow_Loot_Montage.A_Man_Crossbow_Loot_Montage'";
    default LootDown.m_StanceMap.FindOrAdd(EStance::Crouching) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Loot/A_Man_Crossbow_STL_Loot_Montage.A_Man_Crossbow_STL_Loot_Montage'";

	default m_MontagesMap.FindOrAdd(n"LootUp", LootUp);
    default m_MontagesMap.FindOrAdd(n"LootFront", LootFront);
    default m_MontagesMap.FindOrAdd(n"LootDown", LootDown);
}