UCLASS()
class UConsumablesData_Human_T1H : UConsumablesData
{
    FStanceMapMontage Item_Potion;
    default Item_Potion.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Consumables/A_Man_T1H_N_Consume_Potions_Montage.A_Man_T1H_N_Consume_Potions_Montage'";
    default Item_Potion.m_StanceMap.FindOrAdd(EStance::Crouching) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Consumables/A_Man_T1H_STL_Consume_Potions_Montage.A_Man_T1H_STL_Consume_Potions_Montage'";
	default m_Consumables.FindOrAdd(GameplayTag::Item_Potion) = Item_Potion;

    FStanceMapMontage Item_Drink;
    default Item_Drink.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Consumables/A_Man_T1H_N_Consume_Drink_Montage.A_Man_T1H_N_Consume_Drink_Montage'";
    default Item_Drink.m_StanceMap.FindOrAdd(EStance::Crouching) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Consumables/A_Man_T1H_STL_Consume_Drink_Montage.A_Man_T1H_STL_Consume_Drink_Montage'";
	default m_Consumables.FindOrAdd(GameplayTag::Item_Drink) = Item_Drink;

    FStanceMapMontage Item_Food;
    default Item_Food.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Consumables/A_Man_T1H_N_Consume_Food_Montage.A_Man_T1H_N_Consume_Food_Montage'";
    default Item_Food.m_StanceMap.FindOrAdd(EStance::Crouching) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Consumables/A_Man_T1H_STL_Consume_Food_Montage.A_Man_T1H_STL_Consume_Food_Montage'";
    default m_Consumables.FindOrAdd(GameplayTag::Item_Food) = Item_Food;
    
    FStanceMapMontage Item_Herb;
    default Item_Herb.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Consumables/A_Man_T1H_N_Consume_Herbs_Montage.A_Man_T1H_N_Consume_Herbs_Montage'";
    default Item_Herb.m_StanceMap.FindOrAdd(EStance::Crouching) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Consumables/A_Man_T1H_STL_Consume_Herbs_Montage.A_Man_T1H_STL_Consume_Herbs_Montage'";
	default m_Consumables.FindOrAdd(GameplayTag::Item_Herb) = Item_Herb;

    FStanceMapMontage Item_Drug;
    default Item_Drug.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Consumables/Man_T1H_N_Smoke_L_Montage.Man_T1H_N_Smoke_L_Montage'";
    default Item_Drug.m_StanceMap.FindOrAdd(EStance::Crouching) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Consumables/Man_T1H_N_Smoke_L_Montage.Man_T1H_N_Smoke_L_Montage'";
	default m_Consumables.FindOrAdd(GameplayTag::Item_Drug) = Item_Drug;

    FStanceMapMontage Item_Recipe;
    default Item_Recipe.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Read/LearnRecipe/Man_LearnRecipe_Montage.Man_LearnRecipe_Montage'";
	default m_Consumables.FindOrAdd(GameplayTag::Item_Recipe) = Item_Recipe;
    default m_Consumables.FindOrAdd(GameplayTag::Item_Recipe_Forge) = Item_Recipe;
    default m_Consumables.FindOrAdd(GameplayTag::Item_Recipe_Inscription) = Item_Recipe;
    default m_Consumables.FindOrAdd(GameplayTag::Item_Recipe_Alchemy) = Item_Recipe;
    default m_Consumables.FindOrAdd(GameplayTag::Item_Recipe_Cooking) = Item_Recipe;

    default m_Puke.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Consumables/Trained/Man_S1H_Tr_Vomit_Montage.Man_S1H_Tr_Vomit_Montage'";
}