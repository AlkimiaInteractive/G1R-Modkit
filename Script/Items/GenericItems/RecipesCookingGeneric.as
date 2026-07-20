
UCLASS()
class UReFo_Crawlersoup: UCauldronRecipe
{
    default m_Name = "ItFo_Crawlersoup";
    default m_Description = "ItFo_Crawlersoup_description";
    default m_RequiredIngredients.Add(UItFo_Potion_Water_01::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItAt_Crawler_01::StaticClass(), 1);
    default m_FinalItem.Add(UItFo_Crawlersoup::StaticClass(), 1);
}

UCLASS()
class UReFo_Grilledscavenger: UCampfireRecipe
{
    default m_Name = "ItFo_Grilledscavenger";
    default m_Description = "ItFo_Grilledscavenger_description";
    default m_RequiredIngredients.Add(UItFo_Whitemeat::StaticClass(), 1);
    default m_FinalItem.Add(UItFo_Grilledscavenger::StaticClass(), 1);
}

UCLASS()
class UReFo_Meatbugragout: UCauldronRecipe
{
    default m_Name = "ItFo_Meatbugragout";
    default m_Description = "ItFo_Meatbugragout_description";
    default m_RequiredIngredients.Add(UItFo_Potion_Water_01::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItAt_Meatbug_01::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItFo_Plants_Mushroom_01::StaticClass(), 1);
    default m_FinalItem.Add(UItFo_Meatbugragout::StaticClass(), 1);
}

UCLASS()
class UReFo_Meatbugsauteed: UCauldronRecipe
{
    default m_Name = "ItFo_Meatbugsauteed";
    default m_Description = "ItFo_Meatbugsauteed_description";
    default m_RequiredIngredients.Add(UItAt_Meatbug_01::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItFo_Onion::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItFo_Plants_Mushroom_01::StaticClass(), 1);
    default m_FinalItem.Add(UItFo_Meatbugsauteed::StaticClass(), 1);
}

UCLASS()
class UReFo_Mutton_01: UCampfireRecipe
{
    default m_Name = "ItFo_Mutton_01";
    default m_Description = "ItFo_Mutton_01_description";
    default m_RequiredIngredients.Add(UItFo_Muttonraw::StaticClass(), 1);
    default m_FinalItem.Add(UItFo_Mutton_01::StaticClass(), 1);
}

UCLASS()
class UReFo_Ottostew: UCauldronRecipe
{
    default m_Name = "ItFo_Ottostew";
    default m_Description = "ItFo_Ottostew_description";
    default m_RequiredIngredients.Add(UItFo_Potion_Water_01::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItFo_Onion::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItFo_Carrot::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItFo_Potato::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItFo_Whitemeat::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItFo_Plants_Nightshadow_01::StaticClass(), 1);
    default m_FinalItem.Add(UItFo_Ottostew::StaticClass(), 1);
}

UCLASS()
class UReFo_Soup: UCauldronRecipe
{
    default m_Name = "ItFo_Soup";
    default m_Description = "ItFo_Soup_description";
    default m_RequiredIngredients.Add(UItFo_Potion_Water_01::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItFo_Onion::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItFo_Carrot::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItFo_Plants_Nightshadow_01::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItFo_Plants_Stoneroot_02::StaticClass(), 1);
    default m_FinalItem.Add(UItFo_Soup::StaticClass(), 1);
}

UCLASS()
class UReFo_SyraRecipe: UCauldronRecipe
{
    default m_Name = "ItFo_SyraRecipe";
    default m_Description = "ItFo_SyraRecipe_description";
    default m_RequiredIngredients.Add(UItFo_Potion_Strongbeer::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItFo_Carrot::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItFo_Muttonraw::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItFo_Plants_Mistcap::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItFo_Plants_Dewleaf::StaticClass(), 1);
    default m_FinalItem.Add(UItFo_SyraRecipe::StaticClass(), 1);
}

UCLASS()
class UReFo_DragonsbreathStew: UCauldronRecipe
{
    default m_Name = "ItFo_DragonsbreathStew";
    default m_Description = "ItFo_DragonsbreathStew_description";
    default m_RequiredIngredients.Add(UItFo_Potion_Water_01::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItFo_Onion::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItFo_Muttonraw::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItFo_Plants_Flameberry_01::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItFo_Plants_Mountainmoss_01::StaticClass(), 1);
    default m_FinalItem.Add(UItFo_DragonsbreathStew::StaticClass(), 1);
}

UCLASS()
class UReFo_MushroomStew: UCauldronRecipe
{
    default m_Name = "ItFo_MushroomStew";
    default m_Description = "ItFo_MushroomStew_description";
    default m_RequiredIngredients.Add(UItFo_Potion_Water_01::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItFo_Plants_Mistcap::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItFo_Onion::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItFo_Plants_Mushroom_01::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItFo_Plants_Nightshadow_02::StaticClass(), 1);
    default m_FinalItem.Add(UItFo_MushroomStew::StaticClass(), 1);
}

UCLASS()
class UReFo_SeaforestBrew: UAlchemyRecipe
{
    default m_Name = "ItFo_SeaforestBrew";
    default m_Description = "ItFo_SeaforestBrew_description";
    default m_RequiredIngredients.Add(UItFo_Potion_Beer::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItFo_Plants_Siren::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItFo_Plants_Dewleaf::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItFo_Plants_Berrys_01::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItFo_Plants_Orcherb_01::StaticClass(), 1);
    default m_FinalItem.Add(UItFo_SeaforestBrew::StaticClass(), 1);
}

