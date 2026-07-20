UCLASS()
class UConsumablesData_Human : UConsumablesData
{
    FStanceMapMontage Item_Potion;
    default Item_Potion.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/ConsumePotions/A_Man_N_Consume_Potions_Montage.A_Man_N_Consume_Potions_Montage'";
    default Item_Potion.m_StanceMap.FindOrAdd(EStance::Crouching) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/ConsumePotions/A_Man_STL_Consume_Potions_Montage.A_Man_STL_Consume_Potions_Montage'";
    default Item_Potion.m_StanceMap.FindOrAdd(EStance::Riding) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/ConsumePotions/A_Man_Sitting_Consume_Drink_Montage.A_Man_Sitting_Consume_Drink_Montage'";
    default Item_Potion.m_StanceMap.FindOrAdd(EStance::Sitting) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/ConsumePotions/A_Man_Sitting_Consume_Drink_Montage.A_Man_Sitting_Consume_Drink_Montage'";
	default m_Consumables.FindOrAdd(GameplayTag::Item_Potion) = Item_Potion;

    FStanceMapMontage Item_Drink;
    default Item_Drink.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/ConsumePotions/A_Man_N_Consume_Drink_Montage.A_Man_N_Consume_Drink_Montage'";
    default Item_Drink.m_StanceMap.FindOrAdd(EStance::Crouching) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/ConsumePotions/A_Man_STL_Consume_Drink_Montage.A_Man_STL_Consume_Drink_Montage'";
    default Item_Drink.m_StanceMap.FindOrAdd(EStance::Riding) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/ConsumePotions/A_Man_Sitting_Consume_Drink_Montage.A_Man_Sitting_Consume_Drink_Montage'";
    default Item_Drink.m_StanceMap.FindOrAdd(EStance::Sitting) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/ConsumePotions/A_Man_Sitting_Consume_Drink_Montage.A_Man_Sitting_Consume_Drink_Montage'";
	default m_Consumables.FindOrAdd(GameplayTag::Item_Drink) = Item_Drink;

    FStanceMapMontage Item_Food;
    default Item_Food.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Consumefood/A_Man_N_Consume_Food_Montage.A_Man_N_Consume_Food_Montage'";
    default Item_Food.m_StanceMap.FindOrAdd(EStance::Sitting) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Consumefood/A_Man_N_Consume_Food_Sitting_Montage.A_Man_N_Consume_Food_Sitting_Montage'";
    default Item_Food.m_StanceMap.FindOrAdd(EStance::Crouching) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Consumefood/A_Man_STL_Consume_Food_Montage.A_Man_STL_Consume_Food_Montage'";
    default m_Consumables.FindOrAdd(GameplayTag::Item_Food) = Item_Food;

    FStanceMapMontage Item_Food_Bowl;
    default Item_Food_Bowl.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Consumefood/A_Man_N_Consume_FoodBowl_Montage.A_Man_N_Consume_FoodBowl_Montage'";
    default Item_Food_Bowl.m_StanceMap.FindOrAdd(EStance::Sitting) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Consumefood/A_Man_N_Consume_FoodBowl_Sitting_Montage.A_Man_N_Consume_FoodBowl_Sitting_Montage'";
    default Item_Food_Bowl.m_StanceMap.FindOrAdd(EStance::Crouching) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Consumefood/Man_STL_ConsumeBowl_Montage.Man_STL_ConsumeBowl_Montage'";
    default m_Consumables.FindOrAdd(GameplayTag::Item_Food_Bowl) = Item_Food_Bowl;
    
    FStanceMapMontage Item_Herb;
    default Item_Herb.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Consumefood/A_Man_N_Consume_Herbs_Montage.A_Man_N_Consume_Herbs_Montage'";
    default Item_Herb.m_StanceMap.FindOrAdd(EStance::Sitting) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Consumefood/A_Man_N_Consume_Herbs_Sitting_Montage.A_Man_N_Consume_Herbs_Sitting_Montage'";
    default Item_Herb.m_StanceMap.FindOrAdd(EStance::Crouching) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Consumefood/A_Man_STL_Consume_Herbs_Montage.A_Man_STL_Consume_Herbs_Montage'";
	default m_Consumables.FindOrAdd(GameplayTag::Item_Herb) = Item_Herb;

    FStanceMapMontage Item_Drug;
    default Item_Drug.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/ConsumeWeed/Man_Smoke_L_Montage.Man_Smoke_L_Montage'";
    default Item_Drug.m_StanceMap.FindOrAdd(EStance::Sitting) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/ConsumeWeed/Man_Smoke_L_Sitting_Montage.Man_Smoke_L_Sitting_Montage'";
    default Item_Drug.m_StanceMap.FindOrAdd(EStance::Crouching) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/ConsumeWeed/Man_Smoke_L_STL_Montage.Man_Smoke_L_STL_Montage'";
	default m_Consumables.FindOrAdd(GameplayTag::Item_Drug) = Item_Drug;

    FStanceMapMontage Item_Recipe;
    default Item_Recipe.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/ConsumeLearn/A_Man_N_Consume_Learn_Montage.A_Man_N_Consume_Learn_Montage'";
    default Item_Recipe.m_StanceMap.FindOrAdd(EStance::Sitting) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/ConsumeLearn/A_Man_N_Consume_Learn_Sitting_Montage.A_Man_N_Consume_Learn_Sitting_Montage'";
    default Item_Recipe.m_StanceMap.FindOrAdd(EStance::Crouching) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/ConsumeLearn/A_Man_N_Consume_Learn_Sitting_Montage.A_Man_N_Consume_Learn_Sitting_Montage'";
	default m_Consumables.FindOrAdd(GameplayTag::Item_Recipe) = Item_Recipe;
    default m_Consumables.FindOrAdd(GameplayTag::Item_Recipe_Forge) = Item_Recipe;
    default m_Consumables.FindOrAdd(GameplayTag::Item_Recipe_Inscription) = Item_Recipe;
    default m_Consumables.FindOrAdd(GameplayTag::Item_Recipe_Alchemy) = Item_Recipe;
    default m_Consumables.FindOrAdd(GameplayTag::Item_Recipe_Cooking) = Item_Recipe;
}