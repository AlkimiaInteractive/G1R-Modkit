UCLASS()
class UConsumablesData_Scavenger : UConsumablesData
{
    FStanceMapMontage Item_Food;
    default Item_Food.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Med/GeneralIdle/Eat/Scavenger_Med_Montage_Scavenging.Scavenger_Med_Montage_Scavenging'";
    default m_Consumables.FindOrAdd(GameplayTag::Item_Food) = Item_Food;
}

UCLASS()
class UConsumablesData_Scavenger_Combat : UConsumablesData
{
    FStanceMapMontage Item_Food;
    default Item_Food.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Med/GeneralIdle/Eat/Scavenger_Med_Scavenging_Combat_Montage.Scavenger_Med_Scavenging_Combat_Montage'";
    default m_Consumables.FindOrAdd(GameplayTag::Item_Food) = Item_Food;
}