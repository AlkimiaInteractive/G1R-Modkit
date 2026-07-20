UCLASS()
class UConsumablesData_Orc_Sff1H : UConsumablesData
{
    FStanceMapMontage Item_Potion;
    default Item_Potion.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Consumables/A_OrcM_Sff1H_Consume_Potions_Montage.A_OrcM_Sff1H_Consume_Potions_Montage'";
	default m_Consumables.FindOrAdd(GameplayTag::Item_Potion) = Item_Potion;

    FStanceMapMontage Item_Drink;
    default Item_Drink.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Consumables/A_OrcM_Sff1H_Consume_Drink_Montage.A_OrcM_Sff1H_Consume_Drink_Montage'";
	default m_Consumables.FindOrAdd(GameplayTag::Item_Drink) = Item_Drink;

    FStanceMapMontage Item_Food;
    default Item_Food.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Consumables/A_OrcM_Sff1H_Consume_Food_Montage.A_OrcM_Sff1H_Consume_Food_Montage'";
    default m_Consumables.FindOrAdd(GameplayTag::Item_Food) = Item_Food;
    
    FStanceMapMontage Item_Herb;
    default Item_Herb.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Consumables/A_OrcM_Sff1H_Consume_Herbs_Montage.A_OrcM_Sff1H_Consume_Herbs_Montage'";
	default m_Consumables.FindOrAdd(GameplayTag::Item_Herb) = Item_Herb;
}