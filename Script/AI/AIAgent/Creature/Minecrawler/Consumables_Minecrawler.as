UCLASS()
class UConsumablesData_Minecrawler : UConsumablesData
{
    FStanceMapMontage Item_Food;
    default Item_Food.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler/GeneralIdles/Eat/Minecrawler_Montage_Scavenging.Minecrawler_Montage_Scavenging'";
    default m_Consumables.FindOrAdd(GameplayTag::Item_Food) = Item_Food;
}

UCLASS()
class UConsumablesData_Minecrawler_Combat : UConsumablesData
{
    FStanceMapMontage Item_Food;
    default Item_Food.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler/GeneralIdles/Eat/Minecrawler_Scavenging_Combat_Montage.Minecrawler_Scavenging_Combat_Montage'";
    default m_Consumables.FindOrAdd(GameplayTag::Item_Food) = Item_Food;
}