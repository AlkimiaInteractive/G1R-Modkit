UCLASS()
class UConsumablesData_Biter : UConsumablesData
{
    FStanceMapMontage Item_Food;
    default Item_Food.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Creatures/Biter/GeneralIdles/Eat/Biter_Montage_Scavenging.Biter_Montage_Scavenging'";
    default m_Consumables.FindOrAdd(GameplayTag::Item_Food) = Item_Food;
}

UCLASS()
class UConsumablesData_Biter_Combat : UConsumablesData
{
    FStanceMapMontage Item_Food;
    default Item_Food.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Creatures/Biter/GeneralIdles/Eat/Biter_Scavenging_Combat_Montage.Biter_Scavenging_Combat_Montage'";
    default m_Consumables.FindOrAdd(GameplayTag::Item_Food) = Item_Food;
}