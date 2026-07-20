UCLASS()
class UConsumablesData_Human_Fists_Untrained : UConsumablesData
{
    FStanceMapMontage Item_Potion;
    default Item_Potion.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Consumables/Untrained/A_Man_Fists_Un_Consume_Potions_Montage.A_Man_Fists_Un_Consume_Potions_Montage'";
	default m_Consumables.FindOrAdd(GameplayTag::Item_Potion) = Item_Potion;

    FStanceMapMontage Item_Food;
    default Item_Food.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Consumables/Untrained/A_Man_Fists_Un_Consume_Food_Montage.A_Man_Fists_Un_Consume_Food_Montage'";
    default m_Consumables.FindOrAdd(GameplayTag::Item_Food) = Item_Food;

    FStanceMapMontage Item_Drink;
    default Item_Drink.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Consumables/Untrained/A_Man_Fists_Un_Consume_Drink_Montage.A_Man_Fists_Un_Consume_Drink_Montage'";
	default m_Consumables.FindOrAdd(GameplayTag::Item_Drink) = Item_Drink;

    FStanceMapMontage Item_Herb;
    default Item_Herb.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Consumables/Untrained/A_Man_Fists_Un_Consume_Herbs_Montage.A_Man_Fists_Un_Consume_Herbs_Montage'";
	default m_Consumables.FindOrAdd(GameplayTag::Item_Herb) = Item_Herb;

    FStanceMapMontage Item_Drug;
    default Item_Drug.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Consumables/Master/Man_Fists_Smoke_Montage.Man_Fists_Smoke_Montage'";
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

UCLASS()
class UConsumablesData_Human_Fists_Trained : UConsumablesData
{
    FStanceMapMontage Item_Potion;
    default Item_Potion.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Consumables/Trained/A_Man_Fists_Tr_Consume_Potions_Montage.A_Man_Fists_Tr_Consume_Potions_Montage'";
	default m_Consumables.FindOrAdd(GameplayTag::Item_Potion) = Item_Potion;

    FStanceMapMontage Item_Food;
    default Item_Food.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Consumables/Trained/A_Man_Fists_Tr_Consume_Food_Montage.A_Man_Fists_Tr_Consume_Food_Montage'";
    default m_Consumables.FindOrAdd(GameplayTag::Item_Food) = Item_Food;

    FStanceMapMontage Item_Drink;
    default Item_Drink.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Consumables/Trained/A_Man_Fists_Tr_Consume_Drink_Montage.A_Man_Fists_Tr_Consume_Drink_Montage'";
	default m_Consumables.FindOrAdd(GameplayTag::Item_Drink) = Item_Drink;

    FStanceMapMontage Item_Herb;
    default Item_Herb.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Consumables/Trained/A_Man_Fists_Tr_Consume_Herbs_Montage.A_Man_Fists_Tr_Consume_Herbs_Montage'";
	default m_Consumables.FindOrAdd(GameplayTag::Item_Herb) = Item_Herb;

    FStanceMapMontage Item_Drug;
    default Item_Drug.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Consumables/Master/Man_Fists_Smoke_Montage.Man_Fists_Smoke_Montage'";
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

UCLASS()
class UConsumablesData_Human_Fists_Master : UConsumablesData
{
    FStanceMapMontage Item_Potion;
    default Item_Potion.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Consumables/Master/A_Man_Fists_Ma_Consume_Potions_Montage.A_Man_Fists_Ma_Consume_Potions_Montage'";
	default m_Consumables.FindOrAdd(GameplayTag::Item_Potion) = Item_Potion;

    FStanceMapMontage Item_Food;
    default Item_Food.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Consumables/Master/A_Man_Fists_Ma_Consume_Food_Montage.A_Man_Fists_Ma_Consume_Food_Montage'";
    default m_Consumables.FindOrAdd(GameplayTag::Item_Food) = Item_Food;

    FStanceMapMontage Item_Drink;
    default Item_Drink.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Consumables/Master/A_Man_Fists_Ma_Consume_Drink_Montage.A_Man_Fists_Ma_Consume_Drink_Montage'";
	default m_Consumables.FindOrAdd(GameplayTag::Item_Drink) = Item_Drink;

    FStanceMapMontage Item_Herb;
    default Item_Herb.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Consumables/Master/A_Man_Fists_Ma_Consume_Herbs_Montage.A_Man_Fists_Ma_Consume_Herbs_Montage'";
	default m_Consumables.FindOrAdd(GameplayTag::Item_Herb) = Item_Herb;

    FStanceMapMontage Item_Drug;
    default Item_Drug.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Consumables/Master/Man_Fists_Smoke_Montage.Man_Fists_Smoke_Montage'";
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