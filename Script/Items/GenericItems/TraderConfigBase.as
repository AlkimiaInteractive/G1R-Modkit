UCLASS()
class UTraderConfigBase : UTraderConfig
{
    // Category: 0 = Ore, 1 = Arrows, 2 = Materials, 3 = Potions, 4 = Herbs, 5 = Food, 6 = Default
    int GetCategoryForItem(TSubclassOf<UItemDefinition> item)
    {
        // Ore
        if (item == UItMi_Orenugget::StaticClass())
            return 0;
        // Arrows
        if (item == UItAm_Arrow::StaticClass() || item == UItAm_Bolt::StaticClass())
            return 1;
        // Materials
        if (item == UItMi_Alchemy_Alcohol_01::StaticClass() || item == UItMi_Alchemy_Flask::StaticClass() ||
            item == UItMi_Alchemy_Quicksilver_01::StaticClass() || item == UItMi_Alchemy_Salt_01::StaticClass() ||
            item == UItMi_Alchemy_Sulphur_01::StaticClass() || item == UItMi_Inscription_Parchment::StaticClass() ||
            item == UItMi_Smith_Gold::StaticClass() || item == UItMi_Smith_Iron::StaticClass() ||
            item == UItMi_Smith_Ironwood::StaticClass() || item == UItMi_Smith_Leatherstraps::StaticClass() ||
            item == UItMi_Smith_Oak::StaticClass() || item == UItMi_Smith_Obsidian::StaticClass() ||
            item == UItMi_Smith_Petrifiedwood::StaticClass() || item == UItMi_Smith_Ruby::StaticClass() ||
            item == UItMi_Smith_Steel::StaticClass() || item == UItMi_Smith_Willow::StaticClass())
            return 2;
        // Potions
        if (item == UItFo_Potion_Health_01::StaticClass() || item == UItFo_Potion_Health_02::StaticClass() ||
            item == UItFo_Potion_Health_03::StaticClass() || item == UItFo_Potion_Mana_01::StaticClass() ||
            item == UItFo_Potion_Mana_02::StaticClass() || item == UItFo_Potion_Mana_03::StaticClass())
            return 3;
        // Herbs
        if (item == UItFo_Plants_Berrys_01::StaticClass() || item == UItFo_Plants_Bloodwood_01::StaticClass() ||
            item == UItFo_Plants_Coral::StaticClass() || item == UItFo_Plants_Darkshade::StaticClass() ||
            item == UItFo_Plants_Dewleaf::StaticClass() || item == UItFo_Plants_Duskbell::StaticClass() ||
            item == UItFo_Plants_Flameberry_01::StaticClass() || item == UItFo_Plants_Herb_01::StaticClass() ||
            item == UItFo_Plants_Herb_02::StaticClass() || item == UItFo_Plants_Herb_03::StaticClass() ||
            item == UItFo_Plants_Lobelia::StaticClass() || item == UItFo_Plants_Mistcap::StaticClass() ||
            item == UItFo_Plants_Mountainmoss_01::StaticClass() || item == UItFo_Plants_Mountainmoss_02::StaticClass() ||
            item == UItFo_Plants_Mushroom_01::StaticClass() || item == UItFo_Plants_Mushroom_02::StaticClass() ||
            item == UItFo_Plants_Nightshadow_01::StaticClass() || item == UItFo_Plants_Nightshadow_02::StaticClass() ||
            item == UItFo_Plants_Orcherb_01::StaticClass() || item == UItFo_Plants_Orcherb_02::StaticClass() ||
            item == UItFo_Plants_Ravenherb_01::StaticClass() || item == UItFo_Plants_Ravenherb_02::StaticClass() ||
            item == UItFo_Plants_Seraphis_01::StaticClass() || item == UItFo_Plants_Siren::StaticClass() ||
            item == UItFo_Plants_Stoneroot_01::StaticClass() || item == UItFo_Plants_Stoneroot_02::StaticClass() ||
            item == UItFo_Plants_Trollbane::StaticClass() || item == UItFo_Plants_Velayis_01::StaticClass() ||
            item == UItFo_Plants_Widow::StaticClass())
            return 4;
        // Food
        if (item == UItAt_Meatbug_01::StaticClass() || item == UItFo_Apple::StaticClass() ||
            item == UItFo_Cabbage::StaticClass() || item == UItFo_Carrot::StaticClass() ||
            item == UItFo_Cheese::StaticClass() || item == UItFo_Crawlersoup::StaticClass() ||
            item == UItFo_DragonsbreathStew::StaticClass() || item == UItFo_Grilledscavenger::StaticClass() ||
            item == UItFo_Lemon::StaticClass() || item == UItFo_Loaf::StaticClass() ||
            item == UItFo_Meatbugragout::StaticClass() || item == UItFo_Meatbugsauteed::StaticClass() ||
            item == UItFo_MushroomStew::StaticClass() || item == UItFo_Mutton_01::StaticClass() ||
            item == UItFo_Mutton_02::StaticClass() || item == UItFo_Muttonraw::StaticClass() ||
            item == UItFo_Onion::StaticClass() || item == UItFo_Pear::StaticClass() ||
            item == UItFo_Potato::StaticClass() || item == UItFo_Potion_Beer::StaticClass() ||
            item == UItFo_Potion_Booze::StaticClass() || item == UItFo_Potion_Strongbeer::StaticClass() ||
            item == UItFo_Potion_Water_01::StaticClass() || item == UItFo_Potion_Wine::StaticClass() ||
            item == UItFo_Rice::StaticClass() || item == UItFo_Sausage::StaticClass() ||
            item == UItFo_SeaforestBrew::StaticClass() || item == UItFo_Soup::StaticClass() ||
            item == UItFo_Whitemeat::StaticClass() || item == UItFo_Wineberrys_01::StaticClass())
            return 5;
        return 6;
    }

    float GetTraderCategoryMultiplier(TSubclassOf<UObject> difficultySettingsClass, int category)
    {
        if (difficultySettingsClass == UResourcesDifficultySettings_Easy::StaticClass())
        {
            if (category == 0) return m_EasyOreMult;
            if (category == 1) return m_EasyArrowsMult;
            if (category == 2) return m_EasyMaterialsMult;
            if (category == 3) return m_EasyPotionsMult;
            if (category == 4) return m_EasyHerbsMult;
            if (category == 5) return m_EasyFoodMult;
            return m_EasyDefaultMult;
        }
        if (difficultySettingsClass == UResourcesDifficultySettings_Standard::StaticClass())
        {
            if (category == 0) return m_StandardOreMult;
            if (category == 1) return m_StandardArrowsMult;
            if (category == 2) return m_StandardMaterialsMult;
            if (category == 3) return m_StandardPotionsMult;
            if (category == 4) return m_StandardHerbsMult;
            if (category == 5) return m_StandardFoodMult;
            return m_StandardDefaultMult;
        }
        if (difficultySettingsClass == UResourcesDifficultySettings_Hard::StaticClass())
        {
            if (category == 0) return m_HardOreMult;
            if (category == 1) return m_HardArrowsMult;
            if (category == 2) return m_HardMaterialsMult;
            if (category == 3) return m_HardPotionsMult;
            if (category == 4) return m_HardHerbsMult;
            if (category == 5) return m_HardFoodMult;
            return m_HardDefaultMult;
        }
        return 1.0f;
    }

    int RoundToInt(float value)
    {
        if (value >= 0.0f)
            return int(value + 0.5f);
        return int(value - 0.5f);
    }

    void AddTraderItemAllDifficulties(TSubclassOf<UItemDefinition> item, int count, FString event)
    {
        int category = GetCategoryForItem(item);
        int countEasy = RoundToInt(float(count) * GetTraderCategoryMultiplier(UResourcesDifficultySettings_Easy::StaticClass(), category));
        int countStandard = RoundToInt(float(count) * GetTraderCategoryMultiplier(UResourcesDifficultySettings_Standard::StaticClass(), category));
        int countHard = RoundToInt(float(count) * GetTraderCategoryMultiplier(UResourcesDifficultySettings_Hard::StaticClass(), category));
        if (countEasy < 0) countEasy = 0;
        if (countStandard < 0) countStandard = 0;
        if (countHard < 0) countHard = 0;
        AddTraderItem(item, countEasy, event, UResourcesDifficultySettings_Easy::StaticClass());
        AddTraderItem(item, countStandard, event, UResourcesDifficultySettings_Standard::StaticClass());
        AddTraderItem(item, countHard, event, UResourcesDifficultySettings_Hard::StaticClass());
    }

    // Multipliers per difficulty per category.
    // Easy
    float m_EasyOreMult = 1.5f;
    float m_EasyMaterialsMult = 1.2f;
    float m_EasyArrowsMult = 1.5f;
    float m_EasyPotionsMult = 1.5f;
    float m_EasyHerbsMult = 1.2f;
    float m_EasyFoodMult = 1.0f;
    float m_EasyDefaultMult = 1.0f;
    // Standard
    float m_StandardOreMult = 1.0f;
    float m_StandardMaterialsMult = 1.0f;
    float m_StandardArrowsMult = 1.0f;
    float m_StandardPotionsMult = 1.0f;
    float m_StandardHerbsMult = 1.0f;
    float m_StandardFoodMult = 1.0f;
    float m_StandardDefaultMult = 1.0f;
    // Hard
    float m_HardOreMult = 0.8f;
    float m_HardMaterialsMult = 0.9f;
    float m_HardArrowsMult = 1.0f;
    float m_HardPotionsMult = 1.0f;
    float m_HardHerbsMult = 1.0f;
    float m_HardFoodMult = 1.0f;
    float m_HardDefaultMult = 1.0f;
}
