UCLASS()
class UConsumablesData_Lurker : UConsumablesData
{
    FStanceMapMontage Item_Food;
    default Item_Food.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Creatures/Lurker/GeneralIdles/Eat/Lurker_Montage_Scavenging.Lurker_Montage_Scavenging'";
    default m_Consumables.FindOrAdd(GameplayTag::Item_Food) = Item_Food;
}

UCLASS()
class UConsumablesData_Lurker_Combat : UConsumablesData
{
    FStanceMapMontage Item_Food;
    default Item_Food.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Creatures/Lurker/GeneralIdles/Eat/Lurker_Scavenging_Combat_Montage.Lurker_Scavenging_Combat_Montage'";
    default m_Consumables.FindOrAdd(GameplayTag::Item_Food) = Item_Food;
}