UCLASS()
class UConsumablesData_Molerat : UConsumablesData
{
    FStanceMapMontage Item_Food;
    default Item_Food.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Creatures/Molerat/GeneralIdles/Eat/Molerat_Montage_Scavenging.Molerat_Montage_Scavenging'";
    default m_Consumables.FindOrAdd(GameplayTag::Item_Food) = Item_Food;
}

UCLASS()
class UConsumablesData_Molerat_Combat : UConsumablesData
{
    FStanceMapMontage Item_Food;
    default Item_Food.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Creatures/Molerat/GeneralIdles/Eat/Molerat_Scavenging_Combat_Montage.Molerat_Scavenging_Combat_Montage'";
    default m_Consumables.FindOrAdd(GameplayTag::Item_Food) = Item_Food;
}