
UCLASS()
class UReMi_Ink: UAlchemyRecipe
{
    default m_Name = "ItMi_Alchemy_Ink";
    default m_RequiredIngredients.Add(UItFo_Plants_Darkshade::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItMi_Alchemy_Moleratlubric_01::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItAt_Bloodfly_02::StaticClass(), 1);
    default m_FinalItem.Add(UItMi_Alchemy_Ink::StaticClass(), 1);
}
UCLASS()
class UReFo_Potion_Haste_01: UAlchemyRecipe
{
    default m_Name = "ItFo_Potion_Haste_01";
    default m_Description = "ItFo_Potion_Haste_01_description";
    default m_RequiredIngredients.Add(UItMi_Alchemy_Alcohol_01::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItMi_Alchemy_Flask::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItMi_Alchemy_Quicksilver_01::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItMi_Alchemy_Sulphur_01::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItAt_Bloodfly_03::StaticClass(), 1);
    default m_FinalItem.Add(UItFo_Potion_Haste_01::StaticClass(), 1);
}

UCLASS()
class UReFo_Potion_Health_01: UAlchemyRecipe
{
    default m_Name = "ItFo_Potion_Health_01";
    default m_Description = "ItFo_Potion_Health_01_description";
    default m_RequiredIngredients.Add(UItFo_Potion_Water_01::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItMi_Alchemy_Flask::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItFo_Plants_Herb_01::StaticClass(), 1);
    default m_FinalItem.Add(UItFo_Potion_Health_01::StaticClass(), 1);
}

UCLASS()
class UReFo_Potion_Health_02: UAlchemyRecipe
{
    default m_Name = "ItFo_Potion_Health_02";
    default m_Description = "ItFo_Potion_Health_02_description";
    default m_RequiredIngredients.Add(UItFo_Potion_Water_01::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItMi_Alchemy_Flask::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItFo_Plants_Herb_02::StaticClass(), 1);
    default m_FinalItem.Add(UItFo_Potion_Health_02::StaticClass(), 1);
}

UCLASS()
class UReFo_Potion_Health_03: UAlchemyRecipe
{
    default m_Name = "ItFo_Potion_Health_03";
    default m_Description = "ItFo_Potion_Health_03_description";
    default m_RequiredIngredients.Add(UItMi_Alchemy_Alcohol_01::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItMi_Alchemy_Flask::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItMi_Alchemy_Salt_01::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItFo_Plants_Herb_03::StaticClass(), 1);
    default m_FinalItem.Add(UItFo_Potion_Health_03::StaticClass(), 1);
}

UCLASS()
class UReFo_Potion_Health_Perma_03: UAlchemyRecipe
{
    default m_Name = "ItFo_Potion_Health_Perma_03";
    default m_Description = "ItFo_Potion_Health_Perma_03_description";
    default m_RequiredIngredients.Add(UItMi_Alchemy_Alcohol_01::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItMi_Alchemy_Flask::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItMi_Alchemy_Quicksilver_01::StaticClass(), 2);
    default m_RequiredIngredients.Add(UItMi_Alchemy_Sulphur_01::StaticClass(), 2);
    default m_RequiredIngredients.Add(UItAt_Icegolem_02::StaticClass(), 1);
    default m_FinalItem.Add(UItFo_Potion_Health_Perma_03::StaticClass(), 1);
}

UCLASS()
class UReFo_Potion_Mana_01: UAlchemyRecipe
{
    default m_Name = "ItFo_Potion_Mana_01";
    default m_Description = "ItFo_Potion_Mana_01_description";
    default m_RequiredIngredients.Add(UItFo_Potion_Water_01::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItMi_Alchemy_Flask::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItFo_Plants_Ravenherb_01::StaticClass(), 1);
    default m_FinalItem.Add(UItFo_Potion_Mana_01::StaticClass(), 1);
}

UCLASS()
class UReFo_Potion_Mana_02: UAlchemyRecipe
{
    default m_Name = "ItFo_Potion_Mana_02";
    default m_Description = "ItFo_Potion_Mana_02_description";
    default m_RequiredIngredients.Add(UItFo_Potion_Water_01::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItMi_Alchemy_Flask::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItMi_Alchemy_Quicksilver_01::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItFo_Plants_Ravenherb_02::StaticClass(), 1);
    default m_FinalItem.Add(UItFo_Potion_Mana_02::StaticClass(), 1);
}

UCLASS()
class UReFo_Potion_Mana_03: UAlchemyRecipe
{
    default m_Name = "ItFo_Potion_Mana_03";
    default m_Description = "ItFo_Potion_Mana_03_description";
    default m_RequiredIngredients.Add(UItMi_Alchemy_Alcohol_01::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItMi_Alchemy_Flask::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItMi_Alchemy_Quicksilver_01::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItFo_Plants_Stoneroot_02::StaticClass(), 1);
    default m_FinalItem.Add(UItFo_Potion_Mana_03::StaticClass(), 1);
}

UCLASS()
class UReFo_Potion_Mana_Perma_03: UAlchemyRecipe
{
    default m_Name = "ItFo_Potion_Mana_Perma_03";
    default m_Description = "ItFo_Potion_Mana_Perma_03_description";
    default m_RequiredIngredients.Add(UItMi_Alchemy_Alcohol_01::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItMi_Alchemy_Flask::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItMi_Alchemy_Quicksilver_01::StaticClass(), 2);
    default m_RequiredIngredients.Add(UItMi_Alchemy_Sulphur_01::StaticClass(), 2);
    default m_RequiredIngredients.Add(UItAt_Stonegolem_02::StaticClass(), 1);
    default m_FinalItem.Add(UItFo_Potion_Mana_Perma_03::StaticClass(), 1);
}

UCLASS()
class UReFo_Potion_Master_02: UAlchemyRecipe
{
    default m_Name = "ItFo_Potion_Master_02";
    default m_Description = "ItFo_Potion_Master_02_description";
    default m_RequiredIngredients.Add(UItMi_Alchemy_Alcohol_01::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItMi_Alchemy_Flask::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItMi_Alchemy_Quicksilver_01::StaticClass(), 2);
    default m_RequiredIngredients.Add(UItMi_Alchemy_Sulphur_01::StaticClass(), 2);
    default m_RequiredIngredients.Add(UItAt_Firegolem_02::StaticClass(), 1);
    default m_FinalItem.Add(UItFo_Potion_Master_02::StaticClass(), 1);
}

