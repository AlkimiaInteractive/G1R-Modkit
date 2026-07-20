UCLASS()
class UBaalKaganTraderConfig: UTraderConfigBase
{
    default m_UniqueName = n"NC_NOV_BaalKagan_1332";
    default m_Region = n"New Camp";
    default m_Type = n"General";

    ////-- CH1 --////
    // Ore
    default AddTraderItemAllDifficulties(UItMi_Orenugget::StaticClass(),  18, "OnWorldStart");
    // Misc
    default AddTraderItemAllDifficulties(UItMi_Joint_01::StaticClass(), 10, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMi_Joint_02::StaticClass(), 20, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMi_Joint_03::StaticClass(), 20, "OnWorldStart");
}

UCLASS()
class UBaalIsidroTraderConfig: UTraderConfigBase
{
    default m_UniqueName = n"NC_NOV_BaalIsidro_1333";
    default m_Region = n"New Camp";
    default m_Type = n"General";

    ////-- CH1 --////
    // Ore
    default AddTraderItemAllDifficulties(UItMi_Orenugget::StaticClass(),  21, "OnWorldStart");
    // Misc
    default AddTraderItemAllDifficulties(UItMi_Joint_01::StaticClass(), 10, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMi_Joint_02::StaticClass(), 20, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMi_Joint_03::StaticClass(), 20, "OnWorldStart");
}

UCLASS()
class UMalonTraderConfig: UTraderConfigBase
{
    default m_UniqueName = n"NC_BAU_Malon_930";
    default m_Region = n"New Camp";
    default m_Type = n"General";

    ////-- CH1 --////
    // Ore
    default AddTraderItemAllDifficulties(UItMi_Orenugget::StaticClass(), 15, "OnWorldStart");
    // Misc
    default AddTraderItemAllDifficulties(UItKe_Lockpick::StaticClass(), 8, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Rice::StaticClass(), 3, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Loaf::StaticClass(), 1, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Potion_Booze::StaticClass(), 2, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMi_Stuff_Mug_01::StaticClass(), 1, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMi_Candle_01::StaticClass(),  2, "OnWorldStart");
}

UCLASS()
class USharkyTraderConfig: UTraderConfigBase
{
    default m_UniqueName = n"NC_ORG_Sharky_843";
    default m_Region = n"New Camp";
    default m_Type = n"Blacksmith";

    ////-- CH1 --////
    // Ore
    default AddTraderItemAllDifficulties(UItMi_Orenugget::StaticClass(),  23, "OnWorldStart");
    // Misc
    default AddTraderItemAllDifficulties(UItAm_Arrow::StaticClass(),  10, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItKe_Lockpick::StaticClass(), 6, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMw_1H_Torch::StaticClass(),  3, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMi_Stuff_Barbknife_01::StaticClass(),  1, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMi_Stuff_Cup_01::StaticClass(),  1, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMi_Candle_01::StaticClass(),  2, "OnWorldStart");
    // Food
    default AddTraderItemAllDifficulties(UItFo_Rice::StaticClass(),  8, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Loaf::StaticClass(),  2, "OnWorldStart");
    // Potions
    default AddTraderItemAllDifficulties(UItFo_Potion_Booze::StaticClass(),  3, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Potion_Health_01::StaticClass(),  4, "OnWorldStart");
    // Materials
    default AddTraderItemAllDifficulties(UItMi_Smith_Leatherstraps::StaticClass(),  2, "OnWorldStart");
    // Weapons
    default AddTraderItemAllDifficulties(UItRw_Bow_Small_01::StaticClass(),  1, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMw_1H_Sword_Scythe_01::StaticClass(),  1, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMw_1H_Axe_Sickle_01::StaticClass(),  1, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMw_1H_Axe_Hatchet_01::StaticClass(),  1, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMw_1H_Axe_Old_01::StaticClass(),  1, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMw_1H_Mace_Club_01::StaticClass(),  1, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMw_1H_Mace_Poker_01::StaticClass(),  1, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMw_1H_Mace_Sledgehammer_01::StaticClass(),  1, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMw_1H_Mace_Nailmace_01::StaticClass(),  1, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMw_1H_Mace_01::StaticClass(),  1, "OnWorldStart");

    ////-- CH2 --////
    // Ore
    default AddTraderItemAllDifficulties(UItMi_Orenugget::StaticClass(),  13, "StoryG1R_EnteredChapter_2");
    // Misc
    default AddTraderItemAllDifficulties(UItKe_Lockpick::StaticClass(), 2, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItMw_1H_Torch::StaticClass(),  2, "StoryG1R_EnteredChapter_2");
    // Food
    default AddTraderItemAllDifficulties(UItFo_Rice::StaticClass(),  2, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItFo_Loaf::StaticClass(),  1, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItFo_Cheese::StaticClass(),  2, "StoryG1R_EnteredChapter_2");
    // Potions
    default AddTraderItemAllDifficulties(UItFo_Potion_Health_02::StaticClass(),  2, "StoryG1R_EnteredChapter_2");
    // Materials
    default AddTraderItemAllDifficulties(UItMi_Smith_Willow::StaticClass(),  4, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItMi_Smith_Iron::StaticClass(),  3, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItMi_Smith_Oak::StaticClass(), 2, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItMi_Smith_Ironwood::StaticClass(), 2, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItMi_Smith_Steel::StaticClass(),  1, "StoryG1R_EnteredChapter_2");
    // Weapons
    default AddTraderItemAllDifficulties(UItMw_1H_Sword_01::StaticClass(),  1, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItMw_1H_Axe_01::StaticClass(),  1, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItMw_1H_Mace_02::StaticClass(),  1, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItMw_1H_Mace_03::StaticClass(),  1, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItMw_1H_Mace_War_01::StaticClass(),  1, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItMw_1H_Mace_War_02::StaticClass(),  1, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItMw_1H_Mace_War_03::StaticClass(),  1, "StoryG1R_EnteredChapter_2");

    ////-- CH3 --////
    // Ore
    default AddTraderItemAllDifficulties(UItMi_Orenugget::StaticClass(),  18, "StoryG1R_EnteredChapter_3");
    // Potions
    default AddTraderItemAllDifficulties(UItFo_Potion_Health_01::StaticClass(),  2, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItFo_Potion_Health_02::StaticClass(),  2, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItFo_Potion_Health_03::StaticClass(),  2, "StoryG1R_EnteredChapter_3");
    // Materials
    default AddTraderItemAllDifficulties(UItMi_Smith_Oak::StaticClass(),  2, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItMi_Smith_Steel::StaticClass(),  2, "StoryG1R_EnteredChapter_3");
    // Weapons
    default AddTraderItemAllDifficulties(UItMw_1H_Axe_02::StaticClass(),  1, "StoryG1R_EnteredChapter_3");

    ////-- CH4 --////
    // Ore
    default AddTraderItemAllDifficulties(UItMi_Orenugget::StaticClass(),  21, "StoryG1R_EnteredChapter_4");
    // Potions
    default AddTraderItemAllDifficulties(UItFo_Potion_Health_01::StaticClass(),  4, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItFo_Potion_Health_02::StaticClass(),  3, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItFo_Potion_Health_03::StaticClass(),  2, "StoryG1R_EnteredChapter_4");
    // Materials
    default AddTraderItemAllDifficulties(UItMi_Smith_Willow::StaticClass(),  2, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItMi_Smith_Iron::StaticClass(),  2, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItMi_Smith_Oak::StaticClass(),  2, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItMi_Smith_Steel::StaticClass(),  2, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItMi_Smith_Ironwood::StaticClass(),  3, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItMi_Smith_Ruby::StaticClass(),  1, "StoryG1R_EnteredChapter_4");
    // Weapons
    default AddTraderItemAllDifficulties(UItMw_2H_Axe_Old_01::StaticClass(),  1, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItMw_2H_Axe_Old_02::StaticClass(),  1, "StoryG1R_EnteredChapter_4");

    ////-- CH5 --////
    // Ore
    default AddTraderItemAllDifficulties(UItMi_Orenugget::StaticClass(),  10, "StoryG1R_EnteredChapter_5");
    // Materials
    default AddTraderItemAllDifficulties(UItMi_Smith_Willow::StaticClass(),  1, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItMi_Smith_Iron::StaticClass(),  1, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItMi_Smith_Oak::StaticClass(),  1, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItMi_Smith_Steel::StaticClass(),  2, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItMi_Smith_Ironwood::StaticClass(),  3, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItMi_Smith_Petrifiedwood::StaticClass(),  2, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItMi_Smith_Ruby::StaticClass(),  1, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItMi_Smith_Obsidian::StaticClass(),  1, "StoryG1R_EnteredChapter_5");
    // Weapons
    default AddTraderItemAllDifficulties(UItMw_2H_Axe_Light_01::StaticClass(),  1, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItMw_2H_Axe_Light_02::StaticClass(),  1, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItMw_2H_Axe_Light_03::StaticClass(),  1, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItMw_2H_Axe_Heavy_01::StaticClass(),  1, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItMw_2H_Axe_Heavy_02::StaticClass(),  1, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItMw_2H_Axe_Heavy_03::StaticClass(),  1, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItMw_2H_Axe_Heavy_04::StaticClass(),  1, "StoryG1R_EnteredChapter_5");
}

UCLASS()
class UCipherTraderConfig: UTraderConfigBase
{
    default m_UniqueName = n"NC_ORG_Cipher_873";
    default m_Region = n"New Camp";
    default m_Type = n"General";

    ////-- CH1 --////
    // Ore
    default AddTraderItemAllDifficulties(UItMi_Orenugget::StaticClass(),  458, "OnWorldStart");
    // Misc
    default AddTraderItemAllDifficulties(UItAm_Arrow::StaticClass(),  12, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItKe_Lockpick::StaticClass(), 8, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMw_1H_Torch::StaticClass(),  5, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMi_Stuff_Plate_01::StaticClass(),  2, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMi_Stuff_Barbknife_01::StaticClass(),  3, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMi_Stuff_Cup_01::StaticClass(),  1, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMi_Alchemy_Moleratlubric_01::StaticClass(),  1, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMi_Candle_01::StaticClass(),  4, "OnWorldStart");
    // Food
    default AddTraderItemAllDifficulties(UItFo_Rice::StaticClass(),  12, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Loaf::StaticClass(),  8, "OnWorldStart");
    // Potions
    default AddTraderItemAllDifficulties(UItFo_Potion_Booze::StaticClass(),  5, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Potion_Health_01::StaticClass(),  6, "OnWorldStart");
    // Materials
    default AddTraderItemAllDifficulties(UItAt_Wolf_03::StaticClass(),  2, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMi_Smith_Leatherstraps::StaticClass(),  4, "OnWorldStart");
    // Weapons
    default AddTraderItemAllDifficulties(UItRw_Bow_Small_01::StaticClass(),  1, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMw_1H_Sword_Scythe_01::StaticClass(),  1, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMw_1H_Axe_Sickle_01::StaticClass(),  1, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMw_1H_Mace_Nailmace_01::StaticClass(),  1, "OnWorldStart");

    ////-- CH2 --////
    // Ore
    default AddTraderItemAllDifficulties(UItMi_Orenugget::StaticClass(),  13, "StoryG1R_EnteredChapter_2");
    // Misc
    default AddTraderItemAllDifficulties(UItKe_Lockpick::StaticClass(), 2, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItMw_1H_Torch::StaticClass(),  2, "StoryG1R_EnteredChapter_2");
    // Food
    default AddTraderItemAllDifficulties(UItFo_Rice::StaticClass(),  2, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItFo_Loaf::StaticClass(),  1, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItFo_Cheese::StaticClass(),  2, "StoryG1R_EnteredChapter_2");
    // Potions
    default AddTraderItemAllDifficulties(UItFo_Potion_Health_02::StaticClass(),  2, "StoryG1R_EnteredChapter_2");
    // Materials
    default AddTraderItemAllDifficulties(UItMi_Smith_Willow::StaticClass(),  2, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItMi_Smith_Iron::StaticClass(),  3, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItMi_Smith_Steel::StaticClass(),  1, "StoryG1R_EnteredChapter_2");
    // Weapons
    default AddTraderItemAllDifficulties(UItRw_Bow_Small_02::StaticClass(),  1, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItMw_1H_Sword_01::StaticClass(),  1, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItMw_1H_Sword_Short_02::StaticClass(),  1, "StoryG1R_EnteredChapter_2");

    ////-- CH3 --////
    // Ore
    default AddTraderItemAllDifficulties(UItMi_Orenugget::StaticClass(),  18, "StoryG1R_EnteredChapter_3");
    // Potions
    default AddTraderItemAllDifficulties(UItFo_Potion_Health_01::StaticClass(),  2, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItFo_Potion_Health_02::StaticClass(),  2, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItFo_Potion_Health_03::StaticClass(),  2, "StoryG1R_EnteredChapter_3");
    // Materials
    default AddTraderItemAllDifficulties(UItMi_Smith_Oak::StaticClass(),  2, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItMi_Smith_Steel::StaticClass(),  2, "StoryG1R_EnteredChapter_3");
}

UCLASS()
class UCronosTraderConfig: UTraderConfigBase
{
    default m_UniqueName = n"NC_KDW_Cronos_604";
    default m_Region = n"New Camp";
    default m_Type = n"Inscriber";

    ////-- CH1 --////
    // Quest
    default AddTraderItemAllDifficulties(UItMs_Remedy::StaticClass(), 1, "OnWorldStart");
    // Ore
    default AddTraderItemAllDifficulties(UItMi_Orenugget::StaticClass(), 34, "OnWorldStart");
    // Writings
    default AddTraderItemAllDifficulties(UItWr_Book_Gods_01::StaticClass(), 1, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItWr_Book_Gods_02::StaticClass(), 1, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItWr_Book_Gods_03::StaticClass(), 1, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItWr_Book_Circle_00::StaticClass(), 1, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItWr_Book_Circle_01::StaticClass(), 1, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItWr_Map_NewCamp::StaticClass(), 1, "OnWorldStart");
    // Artifacts
    default AddTraderItemAllDifficulties(UItAt_Ring_Strong_01::StaticClass(), 1, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItAt_Ring_Skill_01::StaticClass(), 1, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItAt_Ring_Life_01::StaticClass(), 1, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItAt_Ring_Magic_01::StaticClass(), 1, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItAt_Ring_Power::StaticClass(), 1, "OnWorldStart");
    // Scrolls
    default AddTraderItemAllDifficulties(UItAr_Scroll_Heal::StaticClass(), 2, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItAr_Scroll_Light::StaticClass(), 3, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItAr_Scroll_TransformWolf::StaticClass(), 1, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItAr_Scroll_TransformScavenger::StaticClass(), 1, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItAr_Scroll_TransformMolerat::StaticClass(), 2, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItAr_Scroll_TransformBloodfly::StaticClass(), 2, "OnWorldStart");
    // Materials
    default AddTraderItemAllDifficulties(UItMi_Inscription_Parchment::StaticClass(), 12, "OnWorldStart");
    // Recipes    
    default AddTraderItemAllDifficulties(UItWr_Scroll_Heal::StaticClass(), 1, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItWr_Scroll_TransformLurker::StaticClass(), 1, "OnWorldStart");

    ////-- CH2 --////
    // Ore
    default AddTraderItemAllDifficulties(UItMi_Orenugget::StaticClass(), 11, "StoryG1R_EnteredChapter_2");
    // Writings
    default AddTraderItemAllDifficulties(UItWr_Book_Circle_02::StaticClass(), 1, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItWr_Book_Circle_03::StaticClass(), 1, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItWr_Book_Circle_04::StaticClass(), 1, "StoryG1R_EnteredChapter_2");
    // Artifacts
    default AddTraderItemAllDifficulties(UItAt_Ring_Life_02::StaticClass(), 1, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItAt_Amulet_Dexterity_01::StaticClass(), 1, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItAt_Amulet_Strong_01::StaticClass(), 1, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItAt_Amulet_Magic_01::StaticClass(), 1, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItAt_Amulet_Magic_02::StaticClass(), 1, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItAt_Amulet_Fire::StaticClass(), 1, "StoryG1R_EnteredChapter_2");
    // Scrolls
    default AddTraderItemAllDifficulties(UItAr_Scroll_Heal::StaticClass(), 3, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItAr_Scroll_Light::StaticClass(), 3, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItAr_Scroll_FireBolt::StaticClass(), 6, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItAr_Scroll_IceBolt::StaticClass(), 2, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItAr_Scroll_BallLightning::StaticClass(), 2, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItAr_Scroll_TransformMeatbug::StaticClass(), 2, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItAr_Scroll_TransformWolf::StaticClass(), 2, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItAr_Scroll_TransformLurker::StaticClass(), 3, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItAr_Scroll_TransformScavenger::StaticClass(), 2, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItAr_Scroll_TransformMolerat::StaticClass(), 4, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItAr_Scroll_TransformMinecrawler::StaticClass(), 1, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItAr_Scroll_TransformBiter::StaticClass(), 1, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItAr_Scroll_TransformOrcDog::StaticClass(), 1, "StoryG1R_EnteredChapter_2");
    // Materials
    default AddTraderItemAllDifficulties(UItMi_Inscription_Parchment::StaticClass(), 8, "StoryG1R_EnteredChapter_2");
    // Recipes
    default AddTraderItemAllDifficulties(UItWr_Scroll_IceBolt::StaticClass(), 1, "StoryG1R_EnteredChapter_2");

    ////-- CH3 --////
    // Ore
    default AddTraderItemAllDifficulties(UItMi_Orenugget::StaticClass(), 9, "StoryG1R_EnteredChapter_3");
    // Writings
    default AddTraderItemAllDifficulties(UItWr_Book_Circle_05::StaticClass(), 1, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItWr_Book_Circle_06::StaticClass(), 1, "StoryG1R_EnteredChapter_3");
    // Artifacts
    default AddTraderItemAllDifficulties(UItAt_Ring_Skill_02::StaticClass(), 1, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItAt_Ring_Strong_02::StaticClass(), 1, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItAt_Amulet_Life::StaticClass(), 1, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItAt_Ring_Enlight::StaticClass(), 1, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItAt_Amulet_Projectile::StaticClass(), 1, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItAt_Amulet_Weapon::StaticClass(), 1, "StoryG1R_EnteredChapter_3");
    // Runes
    default AddTraderItemAllDifficulties(UItAr_Rune_Light::StaticClass(), 1, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItAr_Rune_Heal::StaticClass(), 1, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItAr_Rune_IceBolt::StaticClass(), 1, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItAr_Rune_IceBlock::StaticClass(), 1, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItAr_Rune_BallLightning::StaticClass(), 1, "StoryG1R_EnteredChapter_3");
    // Scrolls
    default AddTraderItemAllDifficulties(UItAr_Scroll_Heal::StaticClass(), 1, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItAr_Scroll_Light::StaticClass(), 4, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItAr_Scroll_IceBlock::StaticClass(), 3, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItAr_Scroll_IceBolt::StaticClass(), 1, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItAr_Scroll_ChainLightning::StaticClass(), 1, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItAr_Scroll_TransformMeatbug::StaticClass(), 2, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItAr_Scroll_TransformLizard::StaticClass(), 3, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItAr_Scroll_TransformBloodfly::StaticClass(), 2, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItAr_Scroll_TransformMinecrawler::StaticClass(), 3, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItAr_Scroll_TransformFireLizard::StaticClass(), 1, "StoryG1R_EnteredChapter_3");
    // Materials
    default AddTraderItemAllDifficulties(UItMi_Inscription_Parchment::StaticClass(),  8, "StoryG1R_EnteredChapter_3");
    // Recipes
    default AddTraderItemAllDifficulties(UItWr_Scroll_TransformSnapper::StaticClass(),  1, "StoryG1R_EnteredChapter_3");

    ////-- CH4 --////
    // Artifacts
    default AddTraderItemAllDifficulties(UItAt_Amulet_Protection::StaticClass(), 1, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItAt_Amulet_Magicfire::StaticClass(), 1, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItAt_Amulet_Ranged::StaticClass(), 1, "StoryG1R_EnteredChapter_4");
    // Runes
    default AddTraderItemAllDifficulties(UItAr_Rune_IceWave::StaticClass(), 1, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItAr_Rune_StormOfFire::StaticClass(), 1, "StoryG1R_EnteredChapter_4");
    // Scrolls
    default AddTraderItemAllDifficulties(UItAr_Scroll_Heal::StaticClass(), 2, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItAr_Scroll_Light::StaticClass(), 1, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItAr_Scroll_IceBolt::StaticClass(), 3, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItAr_Scroll_BallLightning::StaticClass(), 4, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItAr_Scroll_ChainLightning::StaticClass(), 3, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItAr_Scroll_IceBlock::StaticClass(), 2, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItAr_Scroll_IceWave::StaticClass(), 1, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItAr_Scroll_TransformRazor::StaticClass(), 2, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItAr_Scroll_TransformSnapper::StaticClass(), 3, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItAr_Scroll_TransformOrcDog::StaticClass(), 2, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItAr_Scroll_TransformBiter::StaticClass(), 3, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItAr_Scroll_TransformFireLizard::StaticClass(), 1, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItAr_Scroll_TransformShadowbeast::StaticClass(), 1, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItAr_Scroll_TransformSwampshark::StaticClass(), 1, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItAr_Scroll_FireBolt::StaticClass(), 2, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItAr_Scroll_FireBall::StaticClass(), 6, "StoryG1R_EnteredChapter_4");
    // Materials
    default AddTraderItemAllDifficulties(UItMi_Inscription_Parchment::StaticClass(),  8, "StoryG1R_EnteredChapter_4");
    // Recipes
    default AddTraderItemAllDifficulties(UItWr_Scroll_TransformSwampshark::StaticClass(),  1, "StoryG1R_EnteredChapter_5");

    ////-- CH5 --////
    // Artifacts
    // Runes
    default AddTraderItemAllDifficulties(UItAr_Rune_DeathToTheUndead::StaticClass(), 1, "StoryG1R_EnteredChapter_5");
    // Scrolls
    default AddTraderItemAllDifficulties(UItAr_Scroll_IceBolt::StaticClass(), 2, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItAr_Scroll_IceBlock::StaticClass(), 2, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItAr_Scroll_IceWave::StaticClass(), 3, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItAr_Scroll_DeathToTheUndead::StaticClass(), 12, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItAr_Scroll_TransformShadowbeast::StaticClass(), 2, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItAr_Scroll_TransformSwampshark::StaticClass(), 2, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItAr_Scroll_TransformFireLizard::StaticClass(), 2, "StoryG1R_EnteredChapter_5");
    // Materials
    default AddTraderItemAllDifficulties(UItMi_Inscription_Parchment::StaticClass(),  12, "StoryG1R_EnteredChapter_5");
    // Recipes
    default AddTraderItemAllDifficulties(UItWr_Scroll_IceWave::StaticClass(),  1, "StoryG1R_EnteredChapter_5");

    ////-- CH6 --////
    // Scrolls
    default AddTraderItemAllDifficulties(UItAr_Scroll_TransformHarpy::StaticClass(), 3, "OnOrcEnclaveFightStarted");
    // Recipes
    default AddTraderItemAllDifficulties(UItWr_Scroll_TransformHarpy::StaticClass(),  1, "OnOrcEnclaveFightStarted");
}

UCLASS()
class URiordianTraderConfig: UTraderConfigBase
{
    default m_UniqueName = n"NC_KDW_Riordian_605";
    default m_Region = n"New Camp";
    default m_Type = n"Alchemist";

    ////-- CH1 --////
    // Quest
    default AddTraderItemAllDifficulties(UItMs_Remedy::StaticClass(), 1, "OnWorldStart");
    // Potions
    default AddTraderItemAllDifficulties(UItFo_Potion_Mana_01::StaticClass(), 6, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Potion_Health_01::StaticClass(), 8, "OnWorldStart");
    // Materials
    default AddTraderItemAllDifficulties(UItMi_Alchemy_Moleratlubric_01::StaticClass(),  3, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMi_Alchemy_Flask::StaticClass(), 10, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Potion_Water_01::StaticClass(), 8, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Plants_Herb_01::StaticClass(), 12, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Plants_Ravenherb_01::StaticClass(), 10, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Plants_Mushroom_01::StaticClass(), 8, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Plants_Mountainmoss_02::StaticClass(), 4, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Plants_Flameberry_01::StaticClass(), 6, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Plants_Nightshadow_01::StaticClass(), 4, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Plants_Nightshadow_02::StaticClass(), 4, "OnWorldStart");

    ////-- CH2 --////
    // Potions
    default AddTraderItemAllDifficulties(UItFo_Potion_Mana_01::StaticClass(), 6, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItFo_Potion_Mana_02::StaticClass(), 6, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItFo_Potion_Health_01::StaticClass(), 6, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItFo_Potion_Health_02::StaticClass(), 8, "StoryG1R_EnteredChapter_2");
    // Materials
    default AddTraderItemAllDifficulties(UItMi_Alchemy_Flask::StaticClass(), 10, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItFo_Potion_Water_01::StaticClass(), 8, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItMi_Alchemy_Alcohol_01::StaticClass(), 4, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItMi_Alchemy_Salt_01::StaticClass(), 4, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItMi_Alchemy_Quicksilver_01::StaticClass(), 2, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItFo_Plants_Herb_01::StaticClass(), 10, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItFo_Plants_Ravenherb_01::StaticClass(), 8, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItFo_Plants_Herb_02::StaticClass(), 10, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItFo_Plants_Ravenherb_02::StaticClass(), 8, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItFo_Plants_Mountainmoss_02::StaticClass(), 4, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItFo_Plants_Flameberry_01::StaticClass(), 6, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItFo_Plants_Nightshadow_01::StaticClass(), 4, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItFo_Plants_Nightshadow_02::StaticClass(), 4, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItFo_Plants_Dewleaf::StaticClass(), 3, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItFo_Plants_Siren::StaticClass(), 3, "StoryG1R_EnteredChapter_2");
    // Recipes
    default AddTraderItemAllDifficulties(UItWr_Scroll_Potion_Health_02::StaticClass(), 1, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItWr_Scroll_Potion_Mana_02::StaticClass(), 1, "StoryG1R_EnteredChapter_2");

    ////-- CH3 --////
    // Potions
    default AddTraderItemAllDifficulties(UItFo_Potion_Mana_01::StaticClass(), 6, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItFo_Potion_Mana_02::StaticClass(), 4, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItFo_Potion_Mana_03::StaticClass(), 6, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItFo_Potion_Health_01::StaticClass(), 6, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItFo_Potion_Health_02::StaticClass(), 4, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItFo_Potion_Health_03::StaticClass(), 8, "StoryG1R_EnteredChapter_3");
    // Materials
    default AddTraderItemAllDifficulties(UItMi_Alchemy_Flask::StaticClass(), 10, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItFo_Potion_Water_01::StaticClass(), 8, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItMi_Alchemy_Alcohol_01::StaticClass(), 6, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItMi_Alchemy_Salt_01::StaticClass(), 4, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItMi_Alchemy_Quicksilver_01::StaticClass(), 6, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItFo_Plants_Herb_01::StaticClass(), 8, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItFo_Plants_Ravenherb_01::StaticClass(), 6, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItFo_Plants_Herb_02::StaticClass(), 8, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItFo_Plants_Ravenherb_02::StaticClass(), 6, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItFo_Plants_Herb_03::StaticClass(), 8, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItFo_Plants_Stoneroot_02::StaticClass(), 6, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItFo_Plants_Mountainmoss_02::StaticClass(), 4, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItFo_Plants_Flameberry_01::StaticClass(), 6, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItFo_Plants_Nightshadow_01::StaticClass(), 4, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItFo_Plants_Nightshadow_02::StaticClass(), 4, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItFo_Plants_Dewleaf::StaticClass(), 3, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItFo_Plants_Siren::StaticClass(), 3, "StoryG1R_EnteredChapter_3");

    ////-- CH4 --////
    // Potions
    default AddTraderItemAllDifficulties(UItFo_Potion_Mana_01::StaticClass(), 8, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItFo_Potion_Mana_02::StaticClass(), 6, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItFo_Potion_Mana_03::StaticClass(), 8, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItFo_Potion_Health_01::StaticClass(), 8, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItFo_Potion_Health_02::StaticClass(), 6, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItFo_Potion_Health_03::StaticClass(), 8, "StoryG1R_EnteredChapter_4");
    // Materials
    default AddTraderItemAllDifficulties(UItMi_Alchemy_Flask::StaticClass(), 10, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItFo_Potion_Water_01::StaticClass(), 8, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItMi_Alchemy_Alcohol_01::StaticClass(), 6, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItMi_Alchemy_Salt_01::StaticClass(), 4, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItMi_Alchemy_Quicksilver_01::StaticClass(), 6, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItFo_Plants_Herb_01::StaticClass(), 8, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItFo_Plants_Ravenherb_01::StaticClass(), 6, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItFo_Plants_Herb_02::StaticClass(), 8, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItFo_Plants_Ravenherb_02::StaticClass(), 6, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItFo_Plants_Herb_03::StaticClass(), 8, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItFo_Plants_Stoneroot_02::StaticClass(), 6, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItFo_Plants_Mountainmoss_02::StaticClass(), 4, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItFo_Plants_Flameberry_01::StaticClass(), 6, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItFo_Plants_Nightshadow_01::StaticClass(), 4, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItFo_Plants_Nightshadow_02::StaticClass(), 4, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItFo_Plants_Dewleaf::StaticClass(), 3, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItFo_Plants_Siren::StaticClass(), 3, "StoryG1R_EnteredChapter_4");

    ////-- CH5 --////
    // Potions
    default AddTraderItemAllDifficulties(UItFo_Potion_Mana_01::StaticClass(), 6, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItFo_Potion_Mana_02::StaticClass(), 8, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItFo_Potion_Mana_03::StaticClass(), 6, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItFo_Potion_Health_01::StaticClass(), 6, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItFo_Potion_Health_02::StaticClass(), 8, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItFo_Potion_Health_03::StaticClass(), 6, "StoryG1R_EnteredChapter_5");
    // Materials
    default AddTraderItemAllDifficulties(UItMi_Alchemy_Flask::StaticClass(), 10, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItFo_Potion_Water_01::StaticClass(), 8, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItMi_Alchemy_Alcohol_01::StaticClass(), 6, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItMi_Alchemy_Salt_01::StaticClass(), 4, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItMi_Alchemy_Quicksilver_01::StaticClass(), 6, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItMi_Alchemy_Sulphur_01::StaticClass(), 2, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItFo_Plants_Herb_01::StaticClass(), 8, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItFo_Plants_Ravenherb_01::StaticClass(), 6, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItFo_Plants_Herb_02::StaticClass(), 8, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItFo_Plants_Ravenherb_02::StaticClass(), 6, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItFo_Plants_Herb_03::StaticClass(), 8, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItFo_Plants_Stoneroot_02::StaticClass(), 6, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItFo_Plants_Mountainmoss_02::StaticClass(), 4, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItFo_Plants_Flameberry_01::StaticClass(), 6, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItFo_Plants_Nightshadow_01::StaticClass(), 4, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItFo_Plants_Nightshadow_02::StaticClass(), 4, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItFo_Plants_Dewleaf::StaticClass(), 3, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItFo_Plants_Siren::StaticClass(), 3, "StoryG1R_EnteredChapter_5");

    ////-- CH6 --////
    // Potions
    default AddTraderItemAllDifficulties(UItFo_Potion_Mana_01::StaticClass(), 8, "StoryG1R_EnteredChapter_6");
    default AddTraderItemAllDifficulties(UItFo_Potion_Mana_02::StaticClass(), 8, "StoryG1R_EnteredChapter_6");
    default AddTraderItemAllDifficulties(UItFo_Potion_Mana_03::StaticClass(), 6, "StoryG1R_EnteredChapter_6");
    default AddTraderItemAllDifficulties(UItFo_Potion_Health_01::StaticClass(), 6, "StoryG1R_EnteredChapter_6");
    default AddTraderItemAllDifficulties(UItFo_Potion_Health_02::StaticClass(), 8, "StoryG1R_EnteredChapter_6");
    default AddTraderItemAllDifficulties(UItFo_Potion_Health_03::StaticClass(), 10, "StoryG1R_EnteredChapter_6");
    // Materials
    default AddTraderItemAllDifficulties(UItMi_Alchemy_Flask::StaticClass(), 10, "StoryG1R_EnteredChapter_6");
    default AddTraderItemAllDifficulties(UItFo_Potion_Water_01::StaticClass(), 8, "StoryG1R_EnteredChapter_6");
    default AddTraderItemAllDifficulties(UItMi_Alchemy_Alcohol_01::StaticClass(), 6, "StoryG1R_EnteredChapter_6");
    default AddTraderItemAllDifficulties(UItMi_Alchemy_Salt_01::StaticClass(), 4, "StoryG1R_EnteredChapter_6");
    default AddTraderItemAllDifficulties(UItMi_Alchemy_Quicksilver_01::StaticClass(), 6, "StoryG1R_EnteredChapter_6");
    default AddTraderItemAllDifficulties(UItFo_Plants_Herb_01::StaticClass(), 8, "StoryG1R_EnteredChapter_6");
    default AddTraderItemAllDifficulties(UItFo_Plants_Ravenherb_01::StaticClass(), 6, "StoryG1R_EnteredChapter_6");
    default AddTraderItemAllDifficulties(UItFo_Plants_Herb_02::StaticClass(), 8, "StoryG1R_EnteredChapter_6");
    default AddTraderItemAllDifficulties(UItFo_Plants_Ravenherb_02::StaticClass(), 6, "StoryG1R_EnteredChapter_6");
    default AddTraderItemAllDifficulties(UItFo_Plants_Herb_03::StaticClass(), 8, "StoryG1R_EnteredChapter_6");
    default AddTraderItemAllDifficulties(UItFo_Plants_Stoneroot_02::StaticClass(), 6, "StoryG1R_EnteredChapter_6");
    default AddTraderItemAllDifficulties(UItFo_Plants_Mountainmoss_02::StaticClass(), 4, "StoryG1R_EnteredChapter_6");
    default AddTraderItemAllDifficulties(UItFo_Plants_Flameberry_01::StaticClass(), 6, "StoryG1R_EnteredChapter_6");
    default AddTraderItemAllDifficulties(UItFo_Plants_Nightshadow_01::StaticClass(), 4, "StoryG1R_EnteredChapter_6");
    default AddTraderItemAllDifficulties(UItFo_Plants_Nightshadow_02::StaticClass(), 4, "StoryG1R_EnteredChapter_6");
    default AddTraderItemAllDifficulties(UItFo_Plants_Dewleaf::StaticClass(), 3, "StoryG1R_EnteredChapter_6");
    default AddTraderItemAllDifficulties(UItFo_Plants_Siren::StaticClass(), 3, "StoryG1R_EnteredChapter_6");
}

UCLASS()
class USilasTraderConfig: UTraderConfigBase
{
    default m_UniqueName = n"NC_ORG_Silas_841";
    default m_Region = n"New Camp";
    default m_Type = n"Provisioner";

    ////-- CH1 --////
    // Ore
    default AddTraderItemAllDifficulties(UItMi_Orenugget::StaticClass(), 14, "OnWorldStart");
    // Misc
    default AddTraderItemAllDifficulties(UItAm_Arrow::StaticClass(), 12, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItKe_Lockpick::StaticClass(), 6, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMi_Stuff_Cup_01::StaticClass(), 4, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMi_Stuff_Plate_01::StaticClass(), 3, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMi_Stuff_Barbknife_01::StaticClass(), 2, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMw_1H_Torch::StaticClass(), 2, "OnWorldStart");    
    default AddTraderItemAllDifficulties(UItMi_Candle_01::StaticClass(),  2, "OnWorldStart");
    // Food
    default AddTraderItemAllDifficulties(UItFo_Loaf::StaticClass(), 8, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Rice::StaticClass(), 18, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Potato::StaticClass(),  2, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Carrot::StaticClass(),  2, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Onion::StaticClass(),  1, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Mutton_01::StaticClass(), 10, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Grilledscavenger::StaticClass(), 7, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_MushroomStew::StaticClass(), 6, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Soup::StaticClass(), 5, "OnWorldStart");
    // Potions
    default AddTraderItemAllDifficulties(UItFo_Potion_Health_01::StaticClass(), 4, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Potion_Booze::StaticClass(), 6, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Potion_Strongbeer::StaticClass(), 2, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Potion_Water_01::StaticClass(), 10, "OnWorldStart");
}

UCLASS()
class UJeremiahTraderConfig: UTraderConfigBase
{
    default m_UniqueName = n"NC_BAU_Jeremiah_912";
    default m_Region = n"New Camp";
    default m_Type = n"Provisioner";

    ////-- CH1 --////
    // Ore
    default AddTraderItemAllDifficulties(UItMi_Orenugget::StaticClass(), 14, "OnWorldStart");
    // Misc
    default AddTraderItemAllDifficulties(UItAm_Arrow::StaticClass(), 12, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItKe_Lockpick::StaticClass(), 6, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMi_Stuff_Cup_01::StaticClass(), 4, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMi_Stuff_Plate_01::StaticClass(), 3, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMi_Stuff_Barbknife_01::StaticClass(), 2, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMw_1H_Torch::StaticClass(), 2, "OnWorldStart");    
    default AddTraderItemAllDifficulties(UItMi_Candle_01::StaticClass(),  2, "OnWorldStart");
    // Food
    default AddTraderItemAllDifficulties(UItFo_Loaf::StaticClass(), 8, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Rice::StaticClass(), 18, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Potato::StaticClass(),  2, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Carrot::StaticClass(),  2, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Onion::StaticClass(),  1, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Mutton_01::StaticClass(), 10, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Grilledscavenger::StaticClass(), 7, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_MushroomStew::StaticClass(), 6, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Soup::StaticClass(), 5, "OnWorldStart");
    // Potions
    default AddTraderItemAllDifficulties(UItFo_Potion_Health_01::StaticClass(), 4, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Potion_Booze::StaticClass(), 6, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Potion_Strongbeer::StaticClass(), 2, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Potion_Water_01::StaticClass(), 10, "OnWorldStart");
}

UCLASS()
class UWolfTraderConfig: UTraderConfigBase
{
    default m_UniqueName = n"NC_ORG_Wolf_855";
    default m_Region = n"New Camp";
    default m_Type = n"Hunter";

    ////-- CH1 --////
    // Ore
    default AddTraderItemAllDifficulties(UItMi_Orenugget::StaticClass(),  68, "OnWorldStart");
    // Misc
    default AddTraderItemAllDifficulties(UItAm_Arrow::StaticClass(),  56, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItAm_Bolt::StaticClass(),  32, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMi_Alchemy_Moleratlubric_01::StaticClass(), 1, "OnWorldStart");
    // Writings
    default AddTraderItemAllDifficulties(UItWr_Book_Bloodfly_01::StaticClass(),  1, "OnWorldStart");
    // Weapons
    default AddTraderItemAllDifficulties(UItRw_Bow_Small_01::StaticClass(), 1, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItRw_Bow_Small_02::StaticClass(), 1, "OnWorldStart");
    // Armor
    default AddTraderItemAllDifficulties(USfb_Armor_L::StaticClass(), 1, "OnWorldStart");
    // Recipes
    default AddTraderItemAllDifficulties(UItWr_Scroll_1H_Mace_03::StaticClass(), 1, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItWr_Scroll_1H_Mace_War_01::StaticClass(), 1, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItWr_Scroll_1H_Mace_War_02::StaticClass(), 1, "OnWorldStart");


    ////-- CH2 --////
    // Ore
    default AddTraderItemAllDifficulties(UItMi_Orenugget::StaticClass(), 18, "StoryG1R_EnteredChapter_2");
    // Misc
    default AddTraderItemAllDifficulties(UItAm_Arrow::StaticClass(), 21, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItAm_Bolt::StaticClass(), 12, "StoryG1R_EnteredChapter_2");
    // Weapons
    default AddTraderItemAllDifficulties(UItRw_Bow_Small_03::StaticClass(), 1, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItRw_Bow_Small_04::StaticClass(), 1, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItRw_Bow_Small_05::StaticClass(), 1, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItRw_Bow_Long_01::StaticClass(), 1, "StoryG1R_EnteredChapter_2");
    // Recipes    
    default AddTraderItemAllDifficulties(UItWr_Scroll_1H_Mace_War_03::StaticClass(), 1, "OnWorldStart");

    ////-- CH3 --////
    // Ore
    default AddTraderItemAllDifficulties(UItMi_Orenugget::StaticClass(), 24, "StoryG1R_EnteredChapter_3");
    // Misc
    default AddTraderItemAllDifficulties(UItAm_Arrow::StaticClass(), 16, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItAm_Bolt::StaticClass(), 8, "StoryG1R_EnteredChapter_3");
    // Weapons
    default AddTraderItemAllDifficulties(UItRw_Bow_Long_02::StaticClass(), 1, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItRw_Bow_Long_04::StaticClass(), 1, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItRw_Bow_Long_03::StaticClass(), 1, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItRw_Bow_Long_05::StaticClass(), 1, "StoryG1R_EnteredChapter_3");

    ////-- CH4 --////
    // Ore
    default AddTraderItemAllDifficulties(UItMi_Orenugget::StaticClass(), 21, "StoryG1R_EnteredChapter_4");
    // Weapons
    default AddTraderItemAllDifficulties(UItRw_Bow_Long_06::StaticClass(), 1, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItRw_Bow_Long_07::StaticClass(), 1, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItRw_Bow_Long_08::StaticClass(), 1, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItRw_Crossbow_01::StaticClass(), 1, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItRw_Crossbow_02::StaticClass(), 1, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItRw_Crossbow_03::StaticClass(), 1, "StoryG1R_EnteredChapter_4");

    ////-- CH5 --////
    // Ore
    default AddTraderItemAllDifficulties(UItMi_Orenugget::StaticClass(), 10, "StoryG1R_EnteredChapter_5");
    // Weapons
    default AddTraderItemAllDifficulties(UItRw_Bow_Long_09::StaticClass(), 1, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItRw_Bow_War_01::StaticClass(), 1, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItRw_Bow_War_02::StaticClass(), 1, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItRw_Bow_War_03::StaticClass(), 1, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItRw_Crossbow_04::StaticClass(), 1, "StoryG1R_EnteredChapter_5");

    ////-- CH6 --////
    // Ore
    default AddTraderItemAllDifficulties(UItMi_Orenugget::StaticClass(), 16, "StoryG1R_EnteredChapter_6");
    // Weapons
    default AddTraderItemAllDifficulties(UItRw_Bow_War_05::StaticClass(), 1, "StoryG1R_EnteredChapter_6");
    default AddTraderItemAllDifficulties(UItRw_Bow_War_04::StaticClass(), 1, "StoryG1R_EnteredChapter_6");
}

UCLASS()
class UDexterTraderConfig: UTraderConfigBase
{
    default m_UniqueName = n"OC_STT_Dexter_329";
    default m_Region = n"Old Camp";
    default m_Type = n"General";

    ////-- CH1 --////
    // Ore
    default AddTraderItemAllDifficulties(UItMi_Orenugget::StaticClass(),  64, "OnWorldStart");
    // Misc
    default AddTraderItemAllDifficulties(UItKe_Lockpick::StaticClass(),  12, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItAm_Arrow::StaticClass(),  18, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMi_Joint_03::StaticClass(),  8, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMi_Joint_02::StaticClass(),  10, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMi_Joint_01::StaticClass(),  14, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMw_1H_Torch::StaticClass(),  6, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMi_Stuff_Cup_01::StaticClass(),  4, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMi_Stuff_Plate_01::StaticClass(),  3, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMi_Stuff_Barbknife_01::StaticClass(),  2, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMi_Alchemy_Moleratlubric_01::StaticClass(), 2, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMi_Candle_01::StaticClass(),  5, "OnWorldStart");
    // Food
    default AddTraderItemAllDifficulties(UItFo_Loaf::StaticClass(),  3, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Apple::StaticClass(),  7, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Cheese::StaticClass(),  2, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Potato::StaticClass(),  4, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Pear::StaticClass(),  3, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Carrot::StaticClass(),  3, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Cabbage::StaticClass(),  1, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Onion::StaticClass(),  3, "OnWorldStart");
    // Writings
    default AddTraderItemAllDifficulties(UItWr_Map_World::StaticClass(),  1, "OnWorldStart");
    // Potions
    default AddTraderItemAllDifficulties(UItFo_Potion_Health_01::StaticClass(),  10, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Potion_Mana_01::StaticClass(),  8, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Potion_Health_02::StaticClass(),  5, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Potion_Beer::StaticClass(),  3, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Potion_Strongbeer::StaticClass(),  1, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Potion_Water_01::StaticClass(),  7, "OnWorldStart");
    // Materials
    default AddTraderItemAllDifficulties(UItFo_Plants_Velayis_01::StaticClass(),  13, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Plants_Flameberry_01::StaticClass(),  12, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Plants_Stoneroot_01::StaticClass(),  8, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Plants_Stoneroot_02::StaticClass(),  6, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Plants_Herb_01::StaticClass(),  10, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMi_Smith_Leatherstraps::StaticClass(),  6, "OnWorldStart");

    ////-- CH2 --////
    // Ore
    default AddTraderItemAllDifficulties(UItMi_Orenugget::StaticClass(),  23, "OnWorldStart");
    // Food
    default AddTraderItemAllDifficulties(UItFo_Loaf::StaticClass(),  2, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Apple::StaticClass(),  3, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Cheese::StaticClass(),  2, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Potato::StaticClass(),  4, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Pear::StaticClass(),  3, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Carrot::StaticClass(),  3, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Cabbage::StaticClass(),  1, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Onion::StaticClass(),  3, "OnWorldStart");

    ////-- CH3 --////
    // Ore
    default AddTraderItemAllDifficulties(UItMi_Orenugget::StaticClass(),  26, "OnWorldStart");
    // Food
    default AddTraderItemAllDifficulties(UItFo_Potato::StaticClass(),  4, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Carrot::StaticClass(),  4, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Onion::StaticClass(),  4, "OnWorldStart");
}

UCLASS()
class UFiskTraderConfig: UTraderConfigBase 
{
    default m_UniqueName = n"OC_STT_Fisk_311";
    default m_Region = n"Old Camp";
    default m_Type = n"Blacksmith";

    ////-- CH1 --////
    // Ore
    default AddTraderItemAllDifficulties(UItMi_Orenugget::StaticClass(),  64, "OnWorldStart");
    // Misc
    default AddTraderItemAllDifficulties(UItAm_Arrow::StaticClass(),  16, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItKe_Lockpick::StaticClass(),  12, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMw_1H_Torch::StaticClass(),  6, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMi_Stuff_Cup_01::StaticClass(),  3, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMi_Stuff_Barbknife_01::StaticClass(),  1, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMi_Stuff_Pan_01::StaticClass(),  1, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMi_Candle_01::StaticClass(),  2, "OnWorldStart");
    // Weapons
    default AddTraderItemAllDifficulties(UItRw_Bow_Small_01::StaticClass(), 1, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItRw_Bow_Small_02::StaticClass(), 1, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMw_1H_Sword_Old_01::StaticClass(),  1, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMw_1H_Sword_Short_01::StaticClass(),  1, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMw_1H_Sword_Short_02::StaticClass(),  1, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMw_1H_Sword_Short_03::StaticClass(),  1, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMw_1H_Sword_Short_04::StaticClass(),  1, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMw_1H_Sword_Lightguard_01::StaticClass(),  1, "OnWorldStart");
    // Materials
    default AddTraderItemAllDifficulties(UItMi_Smith_Iron::StaticClass(),  4, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMi_Smith_Willow::StaticClass(),  6, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMi_Smith_Leatherstraps::StaticClass(),  8, "OnWorldStart");
    // Armors
    default AddTraderItemAllDifficulties(UVlk_Armor_L::StaticClass(),  1, "OnWorldStart");

    ////-- CH2 --////
    // Ore
    default AddTraderItemAllDifficulties(UItMi_Orenugget::StaticClass(),  19, "StoryG1R_EnteredChapter_2");
    // Misc
    default AddTraderItemAllDifficulties(UItKe_Lockpick::StaticClass(),  10, "StoryG1R_EnteredChapter_2");
    // Writings
    default AddTraderItemAllDifficulties(UItWr_Book_Bestiary_01::StaticClass(),  1, "StoryG1R_EnteredChapter_2");
    // Weapons
    default AddTraderItemAllDifficulties(UItMw_1H_Sword_01::StaticClass(),  1, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItMw_1H_Sword_02::StaticClass(),  1, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItMw_1H_Sword_03::StaticClass(),  1, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItMw_1H_Sword_04::StaticClass(),  1, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItMw_1H_Sword_Long_01::StaticClass(),  1, "StoryG1R_EnteredChapter_2");
    // Materials
    default AddTraderItemAllDifficulties(UItMi_Smith_Steel::StaticClass(),  2, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItMi_Smith_Oak::StaticClass(),  4, "StoryG1R_EnteredChapter_2");

    ////-- CH3 --////
    // Ore
    default AddTraderItemAllDifficulties(UItMi_Orenugget::StaticClass(),  12, "StoryG1R_EnteredChapter_3");
    // Misc
    default AddTraderItemAllDifficulties(UItKe_Lockpick::StaticClass(),  8, "StoryG1R_EnteredChapter_3");
    // Weapons
    default AddTraderItemAllDifficulties(UItMw_1H_Sword_Long_02::StaticClass(),  1, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItMw_1H_Sword_Long_03::StaticClass(),  1, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItMw_1H_Sword_Long_04::StaticClass(),  1, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItMw_1H_Sword_Long_05::StaticClass(),  1, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItMw_1H_Sword_Bastard_01::StaticClass(), 1, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItMw_1H_Sword_Broad_01::StaticClass(),  1, "StoryG1R_EnteredChapter_3");
}

UCLASS()
class UGrahamTraderConfig: UTraderConfigBase
{
    default m_UniqueName = n"OC_VLK_Graham_573";
    default m_Region = n"Old Camp";
    default m_Type = n"Cartographer";

    ////-- CH1 --////
    // Ore
    default AddTraderItemAllDifficulties(UItMi_Orenugget::StaticClass(),  9, "OnWorldStart");
    // Writings
    default AddTraderItemAllDifficulties(UItWr_Scroll_Sketch::StaticClass(), 1, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItWr_Map_OldCamp::StaticClass(), 1, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItWr_Map_World::StaticClass(), 1, "OnWorldStart");
    // Food
    default AddTraderItemAllDifficulties(UItFo_Potion_Water_01::StaticClass(), 4, "OnWorldStart");
    // Materials
    default AddTraderItemAllDifficulties(UItMi_Inscription_Parchment::StaticClass(), 12, "OnWorldStart");
}

UCLASS()
class UHunoTraderConfig: UTraderConfigBase
{
    default m_UniqueName = n"OC_VLK_Huno_538";
    default m_Region = n"Old Camp";
    default m_Type = n"Blacksmith";

    ////-- CH1 --////
    // Ore
    default AddTraderItemAllDifficulties(UItMi_Orenugget::StaticClass(),  19, "OnWorldStart");
    // Materials
    default AddTraderItemAllDifficulties(UItMi_Smith_Iron::StaticClass(), 5, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMi_Smith_Willow::StaticClass(), 10, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMi_Smith_Leatherstraps::StaticClass(), 8, "OnWorldStart");
    // Recipes
    default AddTraderItemAllDifficulties(UItWr_Scroll_1H_Sword_Short_02::StaticClass(), 1, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItWr_Scroll_1H_Sword_Short_04::StaticClass(), 1, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItWr_Scroll_1H_Sword_Short_05::StaticClass(), 1, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItWr_Scroll_1H_Mace_02::StaticClass(), 1, "OnWorldStart");

    ////-- CH2 --////
    // Ore
    default AddTraderItemAllDifficulties(UItMi_Orenugget::StaticClass(),  8, "StoryG1R_EnteredChapter_2");
    // Materials
    default AddTraderItemAllDifficulties(UItMi_Smith_Iron::StaticClass(), 8, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItMi_Smith_Steel::StaticClass(), 6, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItMi_Smith_Willow::StaticClass(), 4, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItMi_Smith_Oak::StaticClass(), 6, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItMi_Smith_Ironwood::StaticClass(), 2, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItMi_Smith_Leatherstraps::StaticClass(), 8, "StoryG1R_EnteredChapter_2");
}

UCLASS()
class UMordragTraderConfig: UTraderConfigBase
{
    default m_UniqueName = n"OC_ORG_Mordrag_826";
    default m_Region = n"Old Camp";
    default m_Type = n"General";

    ////-- CH1 --////
    // Ore
    default AddTraderItemAllDifficulties(UItMi_Orenugget::StaticClass(), 24, "OnWorldStart");
    // Misc
    default AddTraderItemAllDifficulties(UItKe_Lockpick::StaticClass(), 8, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItAm_Arrow::StaticClass(), 22, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMi_Stuff_Cup_01::StaticClass(), 1, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMi_Stuff_Plate_01::StaticClass(), 1, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMi_Stuff_Barbknife_01::StaticClass(), 1, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMw_1H_Torch::StaticClass(), 2, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMi_Alchemy_Moleratlubric_01::StaticClass(),  1, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMi_Candle_01::StaticClass(),  1, "OnWorldStart");
    // Food
    default AddTraderItemAllDifficulties(UItFo_Rice::StaticClass(), 8, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Loaf::StaticClass(), 2, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Apple::StaticClass(), 4, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Cheese::StaticClass(), 2, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Potato::StaticClass(),  3, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Carrot::StaticClass(),  3, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Onion::StaticClass(),  3, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Potion_Water_01::StaticClass(), 4, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Potion_Beer::StaticClass(), 3, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Potion_Booze::StaticClass(), 5, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Potion_Wine::StaticClass(), 2, "OnWorldStart");
    // Potions
    default AddTraderItemAllDifficulties(UItFo_Potion_Health_01::StaticClass(), 3, "OnWorldStart");
    // Materials
    default AddTraderItemAllDifficulties(UItAt_Wolf_01::StaticClass(), 1, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItAt_Wolf_02::StaticClass(), 2, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItAt_Wolf_03::StaticClass(), 2, "OnWorldStart");
}

UCLASS()
class USkipTraderConfig: UTraderConfigBase
{
    default m_UniqueName = n"OCR_GRD_Skip_211";
    default m_Region = n"Old Camp";
    default m_Type = n"Blacksmith";


    ////-- CH1 --////
    // Ore
    default AddTraderItemAllDifficulties(UItMi_Orenugget::StaticClass(), 78, "OnWorldStart");
    // Materials
    default AddTraderItemAllDifficulties(UItMi_Smith_Iron::StaticClass(), 12, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMi_Smith_Willow::StaticClass(), 18, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMi_Smith_Leatherstraps::StaticClass(), 16, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMi_Smith_Steel::StaticClass(), 6, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMi_Smith_Oak::StaticClass(), 10, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMi_Smith_Ruby::StaticClass(), 1, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMi_Smith_Gold::StaticClass(), 1, "OnWorldStart");
    //Recipes
    default AddTraderItemAllDifficulties(UItWr_Scroll_1H_Sword_02::StaticClass(), 1, "OnWorldStart");

    ////-- CH2 --////
    // Misc
    default AddTraderItemAllDifficulties(UItKe_Lockpick::StaticClass(), 12, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItAm_Arrow::StaticClass(), 62, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItAm_Bolt::StaticClass(), 45, "StoryG1R_EnteredChapter_2");
    // Weapons
    default AddTraderItemAllDifficulties(UItMw_1H_Sword_01::StaticClass(), 1, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItMw_1H_Sword_02::StaticClass(), 1, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItMw_1H_Sword_03::StaticClass(), 1, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItMw_1H_Sword_04::StaticClass(), 1, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItMw_1H_Sword_Long_01::StaticClass(), 1, "StoryG1R_EnteredChapter_2");
    //Recipes
    default AddTraderItemAllDifficulties(UItWr_Scroll_1H_Sword_Long_01::StaticClass(), 1, "OnWorldStart");

    ////-- CH3 --////
    // Ore
    default AddTraderItemAllDifficulties(UItMi_Orenugget::StaticClass(), 23, "StoryG1R_EnteredChapter_3");
    // Misc
    default AddTraderItemAllDifficulties(UItAm_Arrow::StaticClass(), 23, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItAm_Bolt::StaticClass(), 16, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItKe_Lockpick::StaticClass(), 11, "StoryG1R_EnteredChapter_3");
    // Weapons
    default AddTraderItemAllDifficulties(UItMw_1H_Sword_Long_02::StaticClass(), 1, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItMw_1H_Sword_Long_03::StaticClass(), 1, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItMw_1H_Sword_Long_04::StaticClass(), 1, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItMw_1H_Sword_Long_05::StaticClass(), 1, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItMw_1H_Sword_Bastard_01::StaticClass(), 1, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItMw_1H_Sword_Broad_01::StaticClass(), 1, "StoryG1R_EnteredChapter_3");
    // Materials
    default AddTraderItemAllDifficulties(UItMi_Smith_Iron::StaticClass(), 2, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItMi_Smith_Steel::StaticClass(), 4, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItMi_Smith_Willow::StaticClass(), 2, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItMi_Smith_Oak::StaticClass(), 6, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItMi_Smith_Ironwood::StaticClass(), 6, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItMi_Smith_Leatherstraps::StaticClass(), 4, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItMi_Smith_Ruby::StaticClass(), 1, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItMi_Smith_Gold::StaticClass(), 1, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItMi_Smith_Obsidian::StaticClass(), 1, "StoryG1R_EnteredChapter_3");
    //Recipes
    default AddTraderItemAllDifficulties(UItWr_Scroll_1H_Sword_Broad_01::StaticClass(), 1, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItWr_Scroll_2H_Sword_Light_03::StaticClass(), 1, "StoryG1R_EnteredChapter_3");

}

UCLASS()
class UTorrezTraderConfig: UTraderConfigBase
{
    default m_UniqueName = n"OC_KDF_Torrez_405";
    default m_Region = n"Old Camp";
    default m_Type = n"Inscriber";

    ////-- CH1 --////
    // Ore
    default AddTraderItemAllDifficulties(UItMi_Orenugget::StaticClass(), 32, "OnWorldStart");
    // Writings
    default AddTraderItemAllDifficulties(UItWr_Book_Gods_01::StaticClass(), 1, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItWr_Book_Gods_02::StaticClass(), 1, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItWr_Book_Gods_03::StaticClass(), 1, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItWr_Book_Circle_00::StaticClass(), 1, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItWr_Book_Circle_01::StaticClass(), 1, "OnWorldStart");
    // Runes
    default AddTraderItemAllDifficulties(UItAr_Rune_FireBolt::StaticClass(), 1, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItAr_Rune_Heal::StaticClass(), 1, "OnWorldStart");
    // Scrolls
    default AddTraderItemAllDifficulties(UItAr_Scroll_Heal::StaticClass(), 6, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItAr_Scroll_Light::StaticClass(), 12, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItAr_Scroll_FireBolt::StaticClass(), 14, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItAr_Scroll_TransformWolf::StaticClass(), 1, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItAr_Scroll_TransformScavenger::StaticClass(), 1, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItAr_Scroll_TransformMolerat::StaticClass(), 2, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItAr_Scroll_TransformBloodfly::StaticClass(), 2, "OnWorldStart");
    // Potions
    default AddTraderItemAllDifficulties(UItFo_Potion_Mana_01::StaticClass(), 6, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Potion_Health_01::StaticClass(), 8, "OnWorldStart");
    // Materials
    default AddTraderItemAllDifficulties(UItMi_Inscription_Parchment::StaticClass(),  12, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMi_Alchemy_Flask::StaticClass(), 10, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Potion_Water_01::StaticClass(), 8, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Plants_Herb_01::StaticClass(), 12, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Plants_Ravenherb_01::StaticClass(), 10, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Plants_Mushroom_01::StaticClass(), 8, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Plants_Mountainmoss_02::StaticClass(), 4, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Plants_Flameberry_01::StaticClass(), 6, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Plants_Nightshadow_01::StaticClass(), 4, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Plants_Nightshadow_02::StaticClass(), 4, "OnWorldStart");
    // Recipes
    default AddTraderItemAllDifficulties(UItWr_Scroll_FireBolt::StaticClass(),  1, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItWr_Scroll_TransformLizard::StaticClass(),  1, "OnWorldStart");


    ////-- CH2 --////
    // Ore
    default AddTraderItemAllDifficulties(UItMi_Orenugget::StaticClass(), 17, "StoryG1R_EnteredChapter_2");
    // Writings
    default AddTraderItemAllDifficulties(UItWr_Book_Circle_03::StaticClass(), 1, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItWr_Book_Circle_04::StaticClass(), 1, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItWr_Book_Circle_05::StaticClass(), 1, "StoryG1R_EnteredChapter_2");
    // Runes
    default AddTraderItemAllDifficulties(UItAr_Rune_Light::StaticClass(), 1, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItAr_Rune_FireBolt::StaticClass(), 1, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItAr_Rune_Heal::StaticClass(), 1, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItAr_Rune_FireBall::StaticClass(), 1, "StoryG1R_EnteredChapter_2");
    // Scrolls
    default AddTraderItemAllDifficulties(UItAr_Scroll_Heal::StaticClass(), 4, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItAr_Scroll_Light::StaticClass(), 6, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItAr_Scroll_FireBolt::StaticClass(), 8, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItAr_Scroll_FireBall::StaticClass(), 4, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItAr_Scroll_TransformMeatbug::StaticClass(), 2, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItAr_Scroll_TransformWolf::StaticClass(), 2, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItAr_Scroll_TransformLurker::StaticClass(), 3, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItAr_Scroll_TransformScavenger::StaticClass(), 2, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItAr_Scroll_TransformMolerat::StaticClass(), 4, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItAr_Scroll_TransformLizard::StaticClass(), 3, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItAr_Scroll_TransformMinecrawler::StaticClass(), 1, "StoryG1R_EnteredChapter_2");
    // Potions
    default AddTraderItemAllDifficulties(UItFo_Potion_Mana_01::StaticClass(), 6, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItFo_Potion_Mana_02::StaticClass(), 6, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItFo_Potion_Health_01::StaticClass(), 6, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItFo_Potion_Health_02::StaticClass(), 8, "StoryG1R_EnteredChapter_2");
    // Materials
    default AddTraderItemAllDifficulties(UItMi_Inscription_Parchment::StaticClass(),  8, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItMi_Alchemy_Flask::StaticClass(), 10, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItFo_Potion_Water_01::StaticClass(), 8, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItMi_Alchemy_Alcohol_01::StaticClass(), 4, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItMi_Alchemy_Salt_01::StaticClass(), 4, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItMi_Alchemy_Quicksilver_01::StaticClass(), 2, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItFo_Plants_Herb_01::StaticClass(), 10, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItFo_Plants_Ravenherb_01::StaticClass(), 8, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItFo_Plants_Herb_02::StaticClass(), 10, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItFo_Plants_Ravenherb_02::StaticClass(), 8, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItFo_Plants_Mountainmoss_02::StaticClass(), 4, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItFo_Plants_Flameberry_01::StaticClass(), 6, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItFo_Plants_Nightshadow_01::StaticClass(), 4, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItFo_Plants_Nightshadow_02::StaticClass(), 4, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItFo_Plants_Dewleaf::StaticClass(), 3, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItFo_Plants_Siren::StaticClass(), 3, "StoryG1R_EnteredChapter_2");
    // Recipes
    default AddTraderItemAllDifficulties(UItWr_Scroll_BallLightning::StaticClass(),  1, "StoryG1R_EnteredChapter_2");

    ////-- CH3 --////
    // Ore
    default AddTraderItemAllDifficulties(UItMi_Orenugget::StaticClass(), 8, "StoryG1R_EnteredChapter_3");
    //Scrolls
    default AddTraderItemAllDifficulties(UItAr_Scroll_Heal::StaticClass(), 2, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItAr_Scroll_Light::StaticClass(), 4, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItAr_Scroll_FireBolt::StaticClass(), 3, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItAr_Scroll_FireBall::StaticClass(), 2, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItAr_Scroll_FireRain::StaticClass(), 3, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItAr_Scroll_StormOfFire::StaticClass(), 1, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItAr_Scroll_TransformMeatbug::StaticClass(), 2, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItAr_Scroll_TransformRazor::StaticClass(), 1, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItAr_Scroll_TransformSnapper::StaticClass(), 2, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItAr_Scroll_TransformFireLizard::StaticClass(), 2, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItAr_Scroll_TransformMinecrawler::StaticClass(), 1, "StoryG1R_EnteredChapter_3");
    // Potions
    default AddTraderItemAllDifficulties(UItFo_Potion_Mana_01::StaticClass(), 6, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItFo_Potion_Mana_02::StaticClass(), 4, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItFo_Potion_Mana_03::StaticClass(), 6, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItFo_Potion_Health_01::StaticClass(), 6, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItFo_Potion_Health_02::StaticClass(), 4, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItFo_Potion_Health_03::StaticClass(), 8, "StoryG1R_EnteredChapter_3");
    // Materials 
    default AddTraderItemAllDifficulties(UItMi_Inscription_Parchment::StaticClass(),  8, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItMi_Alchemy_Flask::StaticClass(), 10, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItFo_Potion_Water_01::StaticClass(), 8, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItMi_Alchemy_Alcohol_01::StaticClass(), 6, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItMi_Alchemy_Salt_01::StaticClass(), 4, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItMi_Alchemy_Quicksilver_01::StaticClass(), 6, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItFo_Plants_Herb_01::StaticClass(), 8, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItFo_Plants_Ravenherb_01::StaticClass(), 6, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItFo_Plants_Herb_02::StaticClass(), 8, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItFo_Plants_Ravenherb_02::StaticClass(), 6, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItFo_Plants_Herb_03::StaticClass(), 8, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItFo_Plants_Stoneroot_02::StaticClass(), 6, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItFo_Plants_Mountainmoss_02::StaticClass(), 4, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItFo_Plants_Flameberry_01::StaticClass(), 6, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItFo_Plants_Nightshadow_01::StaticClass(), 4, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItFo_Plants_Nightshadow_02::StaticClass(), 4, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItFo_Plants_Dewleaf::StaticClass(), 3, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItFo_Plants_Siren::StaticClass(), 3, "StoryG1R_EnteredChapter_3");

}

UCLASS()
class UScorpioTraderConfig: UTraderConfigBase
{
    default m_UniqueName = n"OC_GRD_Scorpio_205";
    default m_Region = n"Old Camp";
    default m_Type = n"Blacksmith";

    ////-- CH4 --////
    // Ore
    default AddTraderItemAllDifficulties(UItMi_Orenugget::StaticClass(), 86, "StoryG1R_EnteredChapter_4");
    // Writings
    default AddTraderItemAllDifficulties(UItWr_Book_Bestiary_03::StaticClass(), 1, "StoryG1R_EnteredChapter_4");
    // Artifacts
    default AddTraderItemAllDifficulties(UItAt_Amulet_Strong_02::StaticClass(), 1, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItAt_Amulet_Dexterity_02::StaticClass(), 1, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItAt_Ring_Ranged_02::StaticClass(), 1, "StoryG1R_EnteredChapter_4");
    // Weapons
    default AddTraderItemAllDifficulties(UItMw_1H_Sword_Broad_01::StaticClass(), 1, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItMw_1H_Sword_Broad_02::StaticClass(), 1, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItMw_1H_Sword_Broad_03::StaticClass(), 1, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItMw_1H_Sword_Broad_04::StaticClass(), 1, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItMw_1H_Sword_Bastard_01::StaticClass(), 1, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItMw_1H_Sword_Bastard_02::StaticClass(), 1, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItMw_1H_Sword_Bastard_03::StaticClass(), 1, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItMw_2H_Sword_Old_01::StaticClass(), 1, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItMw_2H_Sword_Light_01::StaticClass(), 1, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItMw_2H_Sword_Light_02::StaticClass(), 1, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItMw_2H_Sword_Light_03::StaticClass(), 1, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItRw_Crossbow_01::StaticClass(), 1, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItRw_Crossbow_02::StaticClass(), 1, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItRw_Crossbow_03::StaticClass(), 1, "StoryG1R_EnteredChapter_4");

    ////-- CH5 --////
    // Ore
    default AddTraderItemAllDifficulties(UItMi_Orenugget::StaticClass(), 12, "StoryG1R_EnteredChapter_5");
    // Weapons
    default AddTraderItemAllDifficulties(UItMw_2H_Sword_Light_02::StaticClass(), 1, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItMw_2H_Sword_Light_03::StaticClass(), 1, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItMw_2H_Sword_Light_04::StaticClass(), 1, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItMw_2H_Sword_Light_05::StaticClass(), 1, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItMw_2H_Sword_01::StaticClass(), 1, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItMw_2H_Sword_02::StaticClass(), 1, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItMw_2H_Sword_03::StaticClass(), 1, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItMw_2H_Sword_Heavy_01::StaticClass(), 1, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItMw_2H_Sword_Heavy_02::StaticClass(), 1, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItMw_2H_Sword_Heavy_03::StaticClass(), 1, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItMw_2H_Sword_Heavy_04::StaticClass(), 1, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItRw_Crossbow_04::StaticClass(), 1, "StoryG1R_EnteredChapter_5");

    ////-- CH6 --////
    // Ore
    default AddTraderItemAllDifficulties(UItMi_Orenugget::StaticClass(), 24, "StoryG1R_EnteredChapter_6");
}

UCLASS()
class UAlbertoTraderConfig: UTraderConfigBase
{
    default m_UniqueName = n"OM_STT_Alberto_300";
    default m_Region = n"Old Mine";
    default m_Type = n"General";

    ////-- CH1 --////
    // Ore
    default AddTraderItemAllDifficulties(UItMi_Orenugget::StaticClass(), 32, "OnWorldStart");
    // Misc
    default AddTraderItemAllDifficulties(UItKe_Lockpick::StaticClass(), 4, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItAm_Bolt::StaticClass(), 12, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItAm_Arrow::StaticClass(), 26, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMw_1H_Torch::StaticClass(), 10, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMi_Stuff_Plate_01::StaticClass(), 5, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMi_Stuff_Cup_01::StaticClass(), 5, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMi_Coop::StaticClass(), 8, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMi_Candle_01::StaticClass(),  2, "OnWorldStart");
    // Food
    default AddTraderItemAllDifficulties(UItFo_Apple::StaticClass(), 12, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Potato::StaticClass(),  4, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Carrot::StaticClass(),  3, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Onion::StaticClass(),  2, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Loaf::StaticClass(), 10, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Mutton_01::StaticClass(), 8, "OnWorldStart");
    // Potions
    default AddTraderItemAllDifficulties(UItFo_Potion_Health_01::StaticClass(), 5, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Potion_Beer::StaticClass(), 5, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Potion_Water_01::StaticClass(), 10, "OnWorldStart");
    // Weapons
    default AddTraderItemAllDifficulties(UItMw_2H_Axe_Pickaxe::StaticClass(), 3, "OnWorldStart");
    // Armor
    default AddTraderItemAllDifficulties(UVlk_Armor_M::StaticClass(), 1, "OnWorldStart");
}

UCLASS()
class UGlenTraderConfig: UTraderConfigBase
{
    default m_UniqueName = n"OM_VLK_Glen_583";
    default m_Region = n"Old Mine";
    default m_Type = n"General";

    ////-- CH1 --////
    // Ore
    default AddTraderItemAllDifficulties(UItMi_Orenugget::StaticClass(), 12, "OnWorldStart");
    // Misc
    default AddTraderItemAllDifficulties(UItKe_Lockpick::StaticClass(), 22, "OnWorldStart");
}

UCLASS()
class USantinoTraderConfig: UTraderConfigBase
{
    default m_UniqueName = n"OM_STT_Santino_335";
    default m_Region = n"Old Mine";
    default m_Type = n"General";

    ////-- CH1 --////
    // Ore
    default AddTraderItemAllDifficulties(UItMi_Orenugget::StaticClass(), 42, "OnWorldStart");
    // Misc
    default AddTraderItemAllDifficulties(UItKe_Lockpick::StaticClass(), 8, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItAm_Bolt::StaticClass(), 24, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItAm_Arrow::StaticClass(), 32, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMw_1H_Torch::StaticClass(), 16, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMi_Stuff_Plate_01::StaticClass(), 4, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMi_Stuff_Cup_01::StaticClass(), 6, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMi_Coop::StaticClass(), 5, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMi_Candle_01::StaticClass(),  5, "OnWorldStart");
    // Food
    default AddTraderItemAllDifficulties(UItFo_Apple::StaticClass(), 7, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Loaf::StaticClass(), 10, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Mutton_01::StaticClass(), 6, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Potato::StaticClass(),  2, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Carrot::StaticClass(),  4, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Onion::StaticClass(),  4, "OnWorldStart");
    // Potions
    default AddTraderItemAllDifficulties(UItFo_Potion_Mana_01::StaticClass(), 5, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Potion_Health_01::StaticClass(), 5, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Potion_Beer::StaticClass(), 7, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Potion_Water_01::StaticClass(), 5, "OnWorldStart");
    // Weapons
    default AddTraderItemAllDifficulties(UItMw_2H_Axe_Pickaxe::StaticClass(), 4, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMw_1H_Mace_Sledgehammer_01::StaticClass(), 1, "OnWorldStart");
}

UCLASS()
class UViperTraderConfig: UTraderConfigBase
{
    default m_UniqueName = n"OM_STT_Viper_302";
    default m_Region = n"Old Mine";
    default m_Type = n"General";

    ////-- CH1 --////
    // Ore
    default AddTraderItemAllDifficulties(UItMi_Orenugget::StaticClass(), 204, "OnWorldStart");
}

UCLASS()
class UBaalCadarTraderConfig: UTraderConfigBase
{
    default m_UniqueName = n"SC_GUR_BaalCadar_1208";
    default m_Region = n"Swamp Camp";
    default m_Type = n"Inscriber";

    ////-- CH1 --////
    // Ore
    default AddTraderItemAllDifficulties(UItMi_Orenugget::StaticClass(), 16, "OnWorldStart");
    // Writings
    default AddTraderItemAllDifficulties(UItWr_Book_Bloodfly_01::StaticClass(), 1, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItWr_Map_SwampCamp::StaticClass(), 1, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItWr_Book_Circle_00::StaticClass(), 1, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItWr_Book_Circle_01::StaticClass(), 1, "OnWorldStart");
    // Artifacts
    default AddTraderItemAllDifficulties(UItAt_Ring_Magic_02::StaticClass(), 1, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItAt_Ring_Magic_03::StaticClass(), 1, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItAt_Ring_Fire_01::StaticClass(), 1, "OnWorldStart");
    // Scrolls
    default AddTraderItemAllDifficulties(UItAr_Scroll_Heal::StaticClass(), 8, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItAr_Scroll_Light::StaticClass(), 10, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItAr_Scroll_FistOfWind::StaticClass(), 4, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItAr_Scroll_TransformMolerat::StaticClass(), 2, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItAr_Scroll_TransformScavenger::StaticClass(), 1, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItAr_Scroll_TransformBloodfly::StaticClass(), 1, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItAr_Scroll_TransformWolf::StaticClass(), 1, "OnWorldStart");
    // Potions
    default AddTraderItemAllDifficulties(UItFo_Potion_Mana_01::StaticClass(), 6, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Potion_Health_01::StaticClass(), 8, "OnWorldStart");
    // Materials
    default AddTraderItemAllDifficulties(UItMi_Inscription_Parchment::StaticClass(), 8, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMi_Alchemy_Flask::StaticClass(), 10, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMi_Alchemy_Moleratlubric_01::StaticClass(), 3, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Potion_Water_01::StaticClass(), 8, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Plants_Herb_01::StaticClass(), 12, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Plants_Ravenherb_01::StaticClass(), 10, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Plants_Mushroom_01::StaticClass(), 8, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Plants_Mountainmoss_02::StaticClass(), 4, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Plants_Flameberry_01::StaticClass(), 6, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Plants_Nightshadow_01::StaticClass(), 4, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Plants_Nightshadow_02::StaticClass(), 4, "OnWorldStart");    
    // Recipes
    default AddTraderItemAllDifficulties(UItWr_Scroll_TransformBloodfly::StaticClass(),  1, "StoryG1R_EnteredChapter_2");

    ////-- CH2 --////
    // Ore
    default AddTraderItemAllDifficulties(UItMi_Orenugget::StaticClass(), 9, "StoryG1R_EnteredChapter_2");
    // Writings
    default AddTraderItemAllDifficulties(UItWr_Book_Circle_02::StaticClass(), 1, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItWr_Book_Circle_03::StaticClass(), 1, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItWr_Book_Circle_04::StaticClass(), 1, "StoryG1R_EnteredChapter_2");
    // Artifacts
    default AddTraderItemAllDifficulties(UItAt_Ring_Fire_02::StaticClass(), 1, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItAt_Ring_Projectile_01::StaticClass(), 1, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItAt_Ring_Weapon_01::StaticClass(), 1, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItAt_Ring_Magicfire_01::StaticClass(), 1, "StoryG1R_EnteredChapter_2");
    // Runes
    default AddTraderItemAllDifficulties(UItAr_Rune_Light::StaticClass(), 1, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItAr_Rune_Heal::StaticClass(), 1, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItAr_Rune_FistOfWind::StaticClass(), 1, "StoryG1R_EnteredChapter_2");
    // Scrolls
    default AddTraderItemAllDifficulties(UItAr_Scroll_Light::StaticClass(), 8, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItAr_Scroll_FistOfWind::StaticClass(), 3, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItAr_Scroll_Telekinesis::StaticClass(), 4, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItAr_Scroll_Charm::StaticClass(), 4, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItAr_Scroll_Heal::StaticClass(), 3, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItAr_Scroll_TransformMeatbug::StaticClass(), 1, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItAr_Scroll_TransformWolf::StaticClass(), 2, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItAr_Scroll_TransformScavenger::StaticClass(), 2, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItAr_Scroll_TransformMolerat::StaticClass(), 2, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItAr_Scroll_TransformBloodfly::StaticClass(), 2, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItAr_Scroll_TransformLurker::StaticClass(), 3, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItAr_Scroll_TransformOrcDog::StaticClass(), 1, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItAr_Scroll_TransformBiter::StaticClass(), 1, "StoryG1R_EnteredChapter_2");
    // Potions
    default AddTraderItemAllDifficulties(UItFo_Potion_Mana_01::StaticClass(), 6, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItFo_Potion_Mana_02::StaticClass(), 6, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItFo_Potion_Health_01::StaticClass(), 6, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItFo_Potion_Health_02::StaticClass(), 8, "StoryG1R_EnteredChapter_2");
    // Materials
    default AddTraderItemAllDifficulties(UItMi_Inscription_Parchment::StaticClass(), 8, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMi_Alchemy_Flask::StaticClass(), 10, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItFo_Potion_Water_01::StaticClass(), 8, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItMi_Alchemy_Alcohol_01::StaticClass(), 4, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItMi_Alchemy_Salt_01::StaticClass(), 4, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItMi_Alchemy_Quicksilver_01::StaticClass(), 2, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItFo_Plants_Herb_01::StaticClass(), 10, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItFo_Plants_Ravenherb_01::StaticClass(), 8, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItFo_Plants_Herb_02::StaticClass(), 10, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItFo_Plants_Ravenherb_02::StaticClass(), 8, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItFo_Plants_Mountainmoss_02::StaticClass(), 4, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItFo_Plants_Flameberry_01::StaticClass(), 6, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItFo_Plants_Nightshadow_01::StaticClass(), 4, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItFo_Plants_Nightshadow_02::StaticClass(), 4, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItFo_Plants_Dewleaf::StaticClass(), 3, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItFo_Plants_Siren::StaticClass(), 3, "StoryG1R_EnteredChapter_2");
    // Recipes
    default AddTraderItemAllDifficulties(UItWr_Scroll_TransformMinecrawler::StaticClass(),  1, "StoryG1R_EnteredChapter_2");

    ////-- CH3 --////
    // Ore
    default AddTraderItemAllDifficulties(UItMi_Orenugget::StaticClass(), 11, "StoryG1R_EnteredChapter_3");
    // Artifacs
    default AddTraderItemAllDifficulties(UItAt_Ring_Weapon_02::StaticClass(), 1, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItAt_Ring_Projectile_02::StaticClass(), 1, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItAt_Ring_Ranged_01::StaticClass(), 1, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItAt_Ring_Magicfire_02::StaticClass(), 1, "StoryG1R_EnteredChapter_3");
    // Runes
    default AddTraderItemAllDifficulties(UItAr_Rune_Charm::StaticClass(), 1, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItAr_Rune_Sleep::StaticClass(), 1, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItAr_Rune_Telekinesis::StaticClass(), 1, "StoryG1R_EnteredChapter_3");
    // Scrolls
    default AddTraderItemAllDifficulties(UItAr_Scroll_Pyrokinesis::StaticClass(), 3, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItAr_Scroll_Control::StaticClass(), 3, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItAr_Scroll_Charm::StaticClass(), 1, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItAr_Scroll_Heal::StaticClass(), 2, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItAr_Scroll_Light::StaticClass(), 4, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItAr_Scroll_FistOfWind::StaticClass(), 2, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItAr_Scroll_Fear::StaticClass(), 4, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItAr_Scroll_Sleep::StaticClass(), 5, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItAr_Scroll_StormFist::StaticClass(), 2, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItAr_Scroll_TransformMinecrawler::StaticClass(), 3, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItAr_Scroll_TransformMeatbug::StaticClass(), 2, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItAr_Scroll_TransformLizard::StaticClass(), 3, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItAr_Scroll_TransformOrcDog::StaticClass(), 1, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItAr_Scroll_TransformBiter::StaticClass(), 1, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItAr_Scroll_TransformRazor::StaticClass(), 1, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItAr_Scroll_TransformSnapper::StaticClass(), 1, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItAr_Scroll_TransformFireLizard::StaticClass(), 1, "StoryG1R_EnteredChapter_3");
    // Potions
    default AddTraderItemAllDifficulties(UItFo_Potion_Mana_01::StaticClass(), 6, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItFo_Potion_Mana_02::StaticClass(), 4, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItFo_Potion_Mana_03::StaticClass(), 6, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItFo_Potion_Health_01::StaticClass(), 6, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItFo_Potion_Health_02::StaticClass(), 4, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItFo_Potion_Health_03::StaticClass(), 8, "StoryG1R_EnteredChapter_3");
    // Materials
    default AddTraderItemAllDifficulties(UItMi_Inscription_Parchment::StaticClass(), 6, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMi_Alchemy_Flask::StaticClass(), 10, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItFo_Potion_Water_01::StaticClass(), 8, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItMi_Alchemy_Alcohol_01::StaticClass(), 6, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItMi_Alchemy_Salt_01::StaticClass(), 4, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItMi_Alchemy_Quicksilver_01::StaticClass(), 6, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItFo_Plants_Herb_01::StaticClass(), 8, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItFo_Plants_Ravenherb_01::StaticClass(), 6, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItFo_Plants_Herb_02::StaticClass(), 8, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItFo_Plants_Ravenherb_02::StaticClass(), 6, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItFo_Plants_Herb_03::StaticClass(), 8, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItFo_Plants_Stoneroot_02::StaticClass(), 6, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItFo_Plants_Mountainmoss_02::StaticClass(), 4, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItFo_Plants_Flameberry_01::StaticClass(), 6, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItFo_Plants_Nightshadow_01::StaticClass(), 4, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItFo_Plants_Nightshadow_02::StaticClass(), 4, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItFo_Plants_Dewleaf::StaticClass(), 3, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItFo_Plants_Siren::StaticClass(), 3, "StoryG1R_EnteredChapter_3");
    // Recipes
    default AddTraderItemAllDifficulties(UItWr_Scroll_TransformBloodhound::StaticClass(),  1, "StoryG1R_EnteredChapter_3");

    ////-- CH4 --////
    // Artifacts
    default AddTraderItemAllDifficulties(UItAt_Ring_Total_01::StaticClass(), 1, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItAt_Ring_Ranged_02::StaticClass(), 1, "StoryG1R_EnteredChapter_4");
    // Runes
    default AddTraderItemAllDifficulties(UItAr_Rune_Control::StaticClass(), 1, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItAr_Rune_Pyrokinesis::StaticClass(), 1, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItAr_Rune_StormFist::StaticClass(), 1, "StoryG1R_EnteredChapter_4");
    // Scrolls
    default AddTraderItemAllDifficulties(UItAr_Scroll_Heal::StaticClass(), 1, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItAr_Scroll_Light::StaticClass(), 1, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItAr_Scroll_FistOfWind::StaticClass(), 1, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItAr_Scroll_Telekinesis::StaticClass(), 1, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItAr_Scroll_Fear::StaticClass(), 2, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItAr_Scroll_Sleep::StaticClass(), 1, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItAr_Scroll_StormFist::StaticClass(), 2, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItAr_Scroll_Pyrokinesis::StaticClass(), 5, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItAr_Scroll_Control::StaticClass(), 2, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItAr_Scroll_Charm::StaticClass(), 2, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItAr_Scroll_TransformOrcDog::StaticClass(), 2, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItAr_Scroll_TransformBiter::StaticClass(), 2, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItAr_Scroll_TransformRazor::StaticClass(), 2, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItAr_Scroll_TransformSnapper::StaticClass(), 3, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItAr_Scroll_TransformBloodhound::StaticClass(), 3, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItAr_Scroll_TransformShadowbeast::StaticClass(), 1, "StoryG1R_EnteredChapter_4");
    // Potions
    default AddTraderItemAllDifficulties(UItFo_Potion_Mana_01::StaticClass(), 8, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItFo_Potion_Mana_02::StaticClass(), 6, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItFo_Potion_Mana_03::StaticClass(), 8, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItFo_Potion_Health_01::StaticClass(), 8, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItFo_Potion_Health_02::StaticClass(), 6, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItFo_Potion_Health_03::StaticClass(), 8, "StoryG1R_EnteredChapter_4");
    // Materials
    default AddTraderItemAllDifficulties(UItMi_Inscription_Parchment::StaticClass(), 12, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMi_Alchemy_Flask::StaticClass(), 10, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItFo_Potion_Water_01::StaticClass(), 8, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItMi_Alchemy_Alcohol_01::StaticClass(), 6, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItMi_Alchemy_Salt_01::StaticClass(), 4, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItMi_Alchemy_Quicksilver_01::StaticClass(), 6, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItFo_Plants_Herb_01::StaticClass(), 8, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItFo_Plants_Ravenherb_01::StaticClass(), 6, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItFo_Plants_Herb_02::StaticClass(), 8, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItFo_Plants_Ravenherb_02::StaticClass(), 6, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItFo_Plants_Herb_03::StaticClass(), 8, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItFo_Plants_Stoneroot_02::StaticClass(), 6, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItFo_Plants_Mountainmoss_02::StaticClass(), 4, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItFo_Plants_Flameberry_01::StaticClass(), 6, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItFo_Plants_Nightshadow_01::StaticClass(), 4, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItFo_Plants_Nightshadow_02::StaticClass(), 4, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItFo_Plants_Dewleaf::StaticClass(), 3, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItFo_Plants_Siren::StaticClass(), 3, "StoryG1R_EnteredChapter_4");

    ////-- CH5 --////
    // Scrolls
    default AddTraderItemAllDifficulties(UItAr_Scroll_Heal::StaticClass(), 2, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItAr_Scroll_Light::StaticClass(), 2, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItAr_Scroll_FistOfWind::StaticClass(), 1, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItAr_Scroll_Telekinesis::StaticClass(), 2, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItAr_Scroll_Fear::StaticClass(), 2, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItAr_Scroll_Sleep::StaticClass(), 2, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItAr_Scroll_StormFist::StaticClass(), 1, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItAr_Scroll_Pyrokinesis::StaticClass(), 2, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItAr_Scroll_Control::StaticClass(), 1, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItAr_Scroll_Charm::StaticClass(), 1, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItAr_Scroll_DeathToTheUndead::StaticClass(), 12, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItAr_Scroll_TransformShadowbeast::StaticClass(), 2, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItAr_Scroll_TransformSwampshark::StaticClass(), 2, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItAr_Scroll_TransformFireLizard::StaticClass(), 1, "StoryG1R_EnteredChapter_5");
    // Potions
    default AddTraderItemAllDifficulties(UItFo_Potion_Mana_01::StaticClass(), 6, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItFo_Potion_Mana_02::StaticClass(), 8, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItFo_Potion_Mana_03::StaticClass(), 6, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItFo_Potion_Health_01::StaticClass(), 6, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItFo_Potion_Health_02::StaticClass(), 8, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItFo_Potion_Health_03::StaticClass(), 6, "StoryG1R_EnteredChapter_5");
    // Materials
    default AddTraderItemAllDifficulties(UItMi_Alchemy_Flask::StaticClass(), 10, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItFo_Potion_Water_01::StaticClass(), 8, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItMi_Alchemy_Alcohol_01::StaticClass(), 6, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItMi_Alchemy_Salt_01::StaticClass(), 4, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItMi_Alchemy_Quicksilver_01::StaticClass(), 6, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItFo_Plants_Herb_01::StaticClass(), 8, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItFo_Plants_Ravenherb_01::StaticClass(), 6, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItFo_Plants_Herb_02::StaticClass(), 8, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItFo_Plants_Ravenherb_02::StaticClass(), 6, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItFo_Plants_Herb_03::StaticClass(), 8, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItFo_Plants_Stoneroot_02::StaticClass(), 6, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItFo_Plants_Mountainmoss_02::StaticClass(), 4, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItFo_Plants_Flameberry_01::StaticClass(), 6, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItFo_Plants_Nightshadow_01::StaticClass(), 4, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItFo_Plants_Nightshadow_02::StaticClass(), 4, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItFo_Plants_Dewleaf::StaticClass(), 3, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItFo_Plants_Siren::StaticClass(), 3, "StoryG1R_EnteredChapter_5");

    ////-- CH6 --////
    // Scrolls   
    default AddTraderItemAllDifficulties(UItAr_Scroll_TransformHarpy::StaticClass(), 3, "OnOrcEnclaveFightStarted");
}

UCLASS()
class UDarrionTraderConfig: UTraderConfigBase
{
    default m_UniqueName = n"SC_NOV_Darrion_1312";
    default m_Region = n"Swamp Camp";
    default m_Type = n"Blacksmith";

    ////-- CH1 --////
    // Ore
    default AddTraderItemAllDifficulties(UItMi_Orenugget::StaticClass(), 72, "OnWorldStart");
    // Misc
    default AddTraderItemAllDifficulties(UItAm_Arrow::StaticClass(), 45, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItAm_Bolt::StaticClass(), 36, "OnWorldStart");
    // Weapons
    default AddTraderItemAllDifficulties(UItMw_1H_Mace_Light_01::StaticClass(), 1, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMw_1H_Mace_Club_01::StaticClass(), 1, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMw_1H_Mace_Sledgehammer_01::StaticClass(), 1, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMw_1H_Axe_Hatchet_01::StaticClass(), 1, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMw_1H_Mace_Nailmace_01::StaticClass(), 1, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMw_1H_Mace_01::StaticClass(), 1, "OnWorldStart");
    // Materials
    default AddTraderItemAllDifficulties(UItMi_Smith_Iron::StaticClass(), 12, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMi_Smith_Willow::StaticClass(), 18, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMi_Smith_Leatherstraps::StaticClass(), 16, "OnWorldStart");
    //Recipes
    default AddTraderItemAllDifficulties(UItWr_Scroll_1H_Mace_04::StaticClass(), 1, "OnWorldStart");

    ////-- CH2 --////
    // Ore
    default AddTraderItemAllDifficulties(UItMi_Orenugget::StaticClass(), 21, "StoryG1R_EnteredChapter_2");
    // Misc
    default AddTraderItemAllDifficulties(UItAm_Arrow::StaticClass(), 18, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItAm_Bolt::StaticClass(), 16, "StoryG1R_EnteredChapter_2");
    // Weapons
    default AddTraderItemAllDifficulties(UItMw_1H_Mace_01::StaticClass(), 1, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItMw_1H_Mace_02::StaticClass(), 1, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItMw_1H_Mace_03::StaticClass(), 1, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItMw_1H_Mace_04::StaticClass(), 1, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItMw_1H_Mace_War_01::StaticClass(), 1, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItMw_1H_Mace_War_02::StaticClass(), 1, "StoryG1R_EnteredChapter_2");
    // Materials
    default AddTraderItemAllDifficulties(UItMi_Smith_Iron::StaticClass(), 8, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItMi_Smith_Steel::StaticClass(), 6, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItMi_Smith_Willow::StaticClass(), 4, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItMi_Smith_Oak::StaticClass(), 10, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItMi_Smith_Ironwood::StaticClass(), 2, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItMi_Smith_Leatherstraps::StaticClass(), 6, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItMi_Smith_Ruby::StaticClass(), 1, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItMi_Smith_Gold::StaticClass(), 1, "StoryG1R_EnteredChapter_2");
    //Recipes
    default AddTraderItemAllDifficulties(UItWr_Scroll_2H_Sword_Light_01::StaticClass(), 1, "StoryG1R_EnteredChapter_2");

    ////-- CH3 --////
    // Ore
    default AddTraderItemAllDifficulties(UItMi_Orenugget::StaticClass(), 19, "StoryG1R_EnteredChapter_3");
    // Misc
    default AddTraderItemAllDifficulties(UItAm_Arrow::StaticClass(), 17, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItAm_Bolt::StaticClass(), 15, "StoryG1R_EnteredChapter_3");
    // Weapons
    default AddTraderItemAllDifficulties(UItMw_1H_Mace_Warhammer_01::StaticClass(), 1, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItMw_1H_Mace_Warhammer_03::StaticClass(), 1, "StoryG1R_EnteredChapter_3");
    // Materials
    default AddTraderItemAllDifficulties(UItMi_Smith_Iron::StaticClass(), 2, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItMi_Smith_Steel::StaticClass(), 4, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItMi_Smith_Willow::StaticClass(), 2, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItMi_Smith_Oak::StaticClass(), 6, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItMi_Smith_Ironwood::StaticClass(), 6, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItMi_Smith_Leatherstraps::StaticClass(), 4, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItMi_Smith_Ruby::StaticClass(), 1, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItMi_Smith_Gold::StaticClass(), 1, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItMi_Smith_Obsidian::StaticClass(), 1, "StoryG1R_EnteredChapter_3");

    ////-- CH4 --////
    // Ore
    default AddTraderItemAllDifficulties(UItMi_Orenugget::StaticClass(), 23, "StoryG1R_EnteredChapter_4");
    // Misc
    default AddTraderItemAllDifficulties(UItAm_Arrow::StaticClass(), 20, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItAm_Bolt::StaticClass(), 20, "StoryG1R_EnteredChapter_4");
    // Weapons
    default AddTraderItemAllDifficulties(UItMw_2H_Sword_Old_01::StaticClass(), 1, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItMw_2H_Sword_Light_01::StaticClass(), 1, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItMw_2H_Sword_Light_02::StaticClass(), 1, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItMw_2H_Sword_Light_03::StaticClass(), 1, "StoryG1R_EnteredChapter_4");
    // Materials
    default AddTraderItemAllDifficulties(UItMi_Smith_Iron::StaticClass(), 2, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItMi_Smith_Steel::StaticClass(), 2, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItMi_Smith_Willow::StaticClass(), 2, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItMi_Smith_Oak::StaticClass(), 2, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItMi_Smith_Ironwood::StaticClass(), 4, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItMi_Smith_Petrifiedwood::StaticClass(), 4, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItMi_Smith_Leatherstraps::StaticClass(), 2, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItMi_Smith_Obsidian::StaticClass(), 1, "StoryG1R_EnteredChapter_4");
    //Recipes    
    default AddTraderItemAllDifficulties(UItWr_Scroll_2H_Sword_01::StaticClass(), 1, "StoryG1R_EnteredChapter_4");

    ////-- CH5 --////
    // Ore
    default AddTraderItemAllDifficulties(UItMi_Orenugget::StaticClass(), 34, "StoryG1R_EnteredChapter_5");
    // Weapons
    default AddTraderItemAllDifficulties(UItMw_2H_Sword_Light_04::StaticClass(), 1, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItMw_2H_Sword_Light_05::StaticClass(), 1, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItMw_2H_Sword_01::StaticClass(), 1, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItMw_2H_Sword_02::StaticClass(), 1, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItMw_2H_Sword_03::StaticClass(), 1, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItMw_2H_Sword_Heavy_01::StaticClass(), 1, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItMw_2H_Sword_Heavy_02::StaticClass(), 1, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItMw_2H_Sword_Heavy_03::StaticClass(), 1, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItMw_2H_Sword_Heavy_04::StaticClass(), 1, "StoryG1R_EnteredChapter_5");
    // Materials
    default AddTraderItemAllDifficulties(UItMi_Smith_Iron::StaticClass(), 2, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItMi_Smith_Steel::StaticClass(), 2, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItMi_Smith_Willow::StaticClass(), 2, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItMi_Smith_Oak::StaticClass(), 2, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItMi_Smith_Ironwood::StaticClass(), 2, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItMi_Smith_Petrifiedwood::StaticClass(), 4, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItMi_Smith_Leatherstraps::StaticClass(), 2, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItMi_Smith_Obsidian::StaticClass(), 1, "StoryG1R_EnteredChapter_5");
    // Recipes    
    default AddTraderItemAllDifficulties(UItWr_Scroll_2H_Axe_Heavy_02::StaticClass(), 1, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItWr_Scroll_2H_Sword_Heavy_01::StaticClass(), 1, "StoryG1R_EnteredChapter_5");

    ////-- CH6 --////
    // Ore
    default AddTraderItemAllDifficulties(UItMi_Orenugget::StaticClass(), 19, "StoryG1R_EnteredChapter_6");
}

UCLASS()
class UFortunoTraderConfig: UTraderConfigBase
{
    default m_UniqueName = n"SC_NOV_Fortuno_1357";
    default m_Region = n"Swamp Camp";
    default m_Type = n"General";

    ////-- CH1 --////
    // Ore
    default AddTraderItemAllDifficulties(UItMi_Orenugget::StaticClass(), 90, "OnWorldStart");
    // Misc
    default AddTraderItemAllDifficulties(UItMi_Joint_03::StaticClass(), 10, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMi_Joint_02::StaticClass(), 15, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMi_Joint_01::StaticClass(), 15, "OnWorldStart");
    // Materials
    default AddTraderItemAllDifficulties(UItFo_Plants_Herb_01::StaticClass(), 9, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Plants_Berrys_01::StaticClass(), 12, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Plants_Darkshade::StaticClass(), 10, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Plants_Mushroom_01::StaticClass(), 8, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMi_Plants_Swampherb_01::StaticClass(), 12, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Plants_Mushroom_02::StaticClass(), 6, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Plants_Mistcap::StaticClass(), 5, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Plants_Stoneroot_01::StaticClass(), 3, "OnWorldStart");

    ////-- CH3 --////
    default AddTraderItemAllDifficulties(UItWr_Map_OldMineSC::StaticClass(), 1, "StoryG1R_EnteredChapter_3");
}

UCLASS()
class UCavalornTraderConfig: UTraderConfigBase
{
    default m_UniqueName = n"UL_STT_Cavalorn_336";
    default m_Region = n"Wilderness";
    default m_Type = n"Hunter";

    ////-- CH1 --////
    // Ore
    default AddTraderItemAllDifficulties(UItMi_Orenugget::StaticClass(), 64, "OnWorldStart");
    // Misc
    default AddTraderItemAllDifficulties(UItAm_Arrow::StaticClass(), 42, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMi_Alchemy_Moleratlubric_01::StaticClass(), 2, "OnWorldStart");
    // Food
    default AddTraderItemAllDifficulties(UItFo_Muttonraw::StaticClass(), 12, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Whitemeat::StaticClass(), 8, "OnWorldStart");
    // Potions
    default AddTraderItemAllDifficulties(UItFo_Potion_Health_01::StaticClass(), 6, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Potion_Health_02::StaticClass(), 2, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Potion_Beer::StaticClass(), 2, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Potion_Water_01::StaticClass(), 6, "OnWorldStart");
    // Plants
    default AddTraderItemAllDifficulties(UItFo_Plants_Herb_01::StaticClass(), 8, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Plants_Berrys_01::StaticClass(), 6, "OnWorldStart");
    // Wepons
    default AddTraderItemAllDifficulties(UItRw_Bow_Small_01::StaticClass(), 1, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItRw_Bow_Small_02::StaticClass(), 1, "OnWorldStart");
    // Wepons
    default AddTraderItemAllDifficulties(UItAt_Wolf_01::StaticClass(), 2, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItAt_Wolf_02::StaticClass(), 4, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItAt_Wolf_03::StaticClass(), 4, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItAt_Scavenger_01::StaticClass(), 4, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItAt_Scavenger_02::StaticClass(), 2, "OnWorldStart");

    ////-- CH2 --////
    // Ore
    default AddTraderItemAllDifficulties(UItMi_Orenugget::StaticClass(), 18, "StoryG1R_EnteredChapter_2");
    // Misc
    default AddTraderItemAllDifficulties(UItAm_Arrow::StaticClass(), 8, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItAm_Bolt::StaticClass(), 6, "StoryG1R_EnteredChapter_2");
    // Weapons
    default AddTraderItemAllDifficulties(UItRw_Bow_Small_03::StaticClass(), 1, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItRw_Bow_Small_04::StaticClass(), 1, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItRw_Bow_Small_05::StaticClass(), 1, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItRw_Bow_Long_01::StaticClass(), 1, "StoryG1R_EnteredChapter_2");
    // Wepons
    default AddTraderItemAllDifficulties(UItAt_Lizard_01::StaticClass(), 2, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItAt_Lizard_02::StaticClass(), 1, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItAt_Lizard_03::StaticClass(), 4, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItAt_Lurker_01::StaticClass(), 2, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItAt_Lurker_02::StaticClass(), 1, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItAt_Lurker_03::StaticClass(), 2, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItAt_Bloodfly_01::StaticClass(), 4, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItAt_Bloodfly_02::StaticClass(), 2, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItAt_Bloodfly_03::StaticClass(), 2, "StoryG1R_EnteredChapter_2");

    ////-- CH3 --////
    // Ore
    default AddTraderItemAllDifficulties(UItMi_Orenugget::StaticClass(), 20, "StoryG1R_EnteredChapter_3");
    // Weapons
    default AddTraderItemAllDifficulties(UItRw_Bow_Long_02::StaticClass(), 1, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItRw_Bow_Long_03::StaticClass(), 1, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItRw_Bow_Long_04::StaticClass(), 1, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItRw_Bow_Long_05::StaticClass(), 1, "StoryG1R_EnteredChapter_3");
    // Wepons
    default AddTraderItemAllDifficulties(UItAt_Snapper_01::StaticClass(), 2, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItAt_Snapper_02::StaticClass(), 2, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItAt_Harpy_01::StaticClass(), 4, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItAt_Harpy_02::StaticClass(), 2, "StoryG1R_EnteredChapter_3");

    ////-- CH4 --////
    // Weapons
    default AddTraderItemAllDifficulties(UItRw_Bow_Long_06::StaticClass(), 1, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItRw_Bow_Long_07::StaticClass(), 1, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItRw_Bow_Long_08::StaticClass(), 1, "StoryG1R_EnteredChapter_4");
    // Wepons
    default AddTraderItemAllDifficulties(UItAt_Biter_01::StaticClass(), 2, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItAt_Biter_02::StaticClass(), 2, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItAt_Biter_03::StaticClass(), 1, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItAt_Razor_01::StaticClass(), 2, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItAt_Razor_02::StaticClass(), 1, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItAt_Orcdog_01::StaticClass(), 2, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItAt_Orcdog_02::StaticClass(), 1, "StoryG1R_EnteredChapter_4");

    ////-- CH5 --////
    // Ore
    default AddTraderItemAllDifficulties(UItMi_Orenugget::StaticClass(), 20, "StoryG1R_EnteredChapter_5");
    // Weapons
    default AddTraderItemAllDifficulties(UItRw_Bow_Long_09::StaticClass(), 1, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItRw_Bow_War_01::StaticClass(), 1, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItRw_Bow_War_02::StaticClass(), 1, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItRw_Bow_War_03::StaticClass(), 1, "StoryG1R_EnteredChapter_5");

    ////-- CH6 --////
    // Ore
    default AddTraderItemAllDifficulties(UItMi_Orenugget::StaticClass(), 25, "StoryG1R_EnteredChapter_6");
    // Misc
    default AddTraderItemAllDifficulties(UItAm_Arrow::StaticClass(), 76, "StoryG1R_EnteredChapter_6");
    default AddTraderItemAllDifficulties(UItAm_Bolt::StaticClass(), 68, "StoryG1R_EnteredChapter_6");
    // Weapons
    default AddTraderItemAllDifficulties(UItRw_Bow_War_04::StaticClass(), 1, "StoryG1R_EnteredChapter_6");
    default AddTraderItemAllDifficulties(UItRw_Bow_War_05::StaticClass(), 1, "StoryG1R_EnteredChapter_6");
}

UCLASS()
class UTorikTraderConfig: UTraderConfigBase
{
    default m_UniqueName = n"BC_BAN_Torik_864";
    default m_Region = n"Wilderness";
    default m_Type = n"General";

    ////-- CH1 --////
    // Ore
    default AddTraderItemAllDifficulties(UItMi_Orenugget::StaticClass(), 45, "OnWorldStart");
    // Misc
    default AddTraderItemAllDifficulties(UItKe_Lockpick::StaticClass(), 14, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItAm_Arrow::StaticClass(), 28, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItAm_Bolt::StaticClass(), 16, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMw_1H_Torch::StaticClass(), 6, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMi_Joint_01::StaticClass(), 8, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMi_Joint_02::StaticClass(), 5, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMi_Candle_01::StaticClass(),  3, "OnWorldStart");
    // Food
    default AddTraderItemAllDifficulties(UItFo_Rice::StaticClass(), 10, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Loaf::StaticClass(), 4, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Mutton_01::StaticClass(), 6, "OnWorldStart");
    // Potions
    default AddTraderItemAllDifficulties(UItFo_Potion_Health_01::StaticClass(), 6, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Potion_Booze::StaticClass(), 8, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Potion_Water_01::StaticClass(), 6, "OnWorldStart");
    // Materials
    default AddTraderItemAllDifficulties(UItMi_Smith_Leatherstraps::StaticClass(), 4, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMi_Smith_Iron::StaticClass(), 3, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMi_Smith_Willow::StaticClass(), 4, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMi_Alchemy_Flask::StaticClass(), 4, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Plants_Herb_01::StaticClass(), 6, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Plants_Ravenherb_01::StaticClass(), 4, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Plants_Mushroom_01::StaticClass(), 4, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Plants_Flameberry_01::StaticClass(), 3, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMi_Inscription_Parchment::StaticClass(), 4, "OnWorldStart");
    // Weapons
    default AddTraderItemAllDifficulties(UItMw_1H_Sword_Lightguard_01::StaticClass(), 1, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItMw_1H_Axe_Old_01::StaticClass(), 1, "OnWorldStart");

    ////-- CH2 --////
    // Ore
    default AddTraderItemAllDifficulties(UItMi_Orenugget::StaticClass(), 22, "StoryG1R_EnteredChapter_2");
    // Misc
    default AddTraderItemAllDifficulties(UItKe_Lockpick::StaticClass(), 8, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItAm_Arrow::StaticClass(), 16, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItAm_Bolt::StaticClass(), 10, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItMi_Joint_02::StaticClass(), 2, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItMi_Joint_03::StaticClass(), 4, "StoryG1R_EnteredChapter_2");
    // Food
    default AddTraderItemAllDifficulties(UItFo_Rice::StaticClass(), 6, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItFo_Cheese::StaticClass(), 3, "StoryG1R_EnteredChapter_2");
    // Potions
    default AddTraderItemAllDifficulties(UItFo_Potion_Health_01::StaticClass(), 4, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItFo_Potion_Health_02::StaticClass(), 3, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItFo_Potion_Mana_01::StaticClass(), 2, "StoryG1R_EnteredChapter_2");
    // Materials
    default AddTraderItemAllDifficulties(UItMi_Smith_Leatherstraps::StaticClass(), 4, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItMi_Smith_Iron::StaticClass(), 4, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItMi_Smith_Steel::StaticClass(), 2, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItMi_Smith_Willow::StaticClass(), 3, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItMi_Smith_Oak::StaticClass(), 2, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItMi_Smith_Ironwood::StaticClass(), 2, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItMi_Alchemy_Flask::StaticClass(), 4, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItMi_Alchemy_Alcohol_01::StaticClass(), 2, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItFo_Plants_Herb_01::StaticClass(), 5, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItFo_Plants_Herb_02::StaticClass(), 4, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItFo_Plants_Ravenherb_01::StaticClass(), 4, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItFo_Plants_Ravenherb_02::StaticClass(), 3, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItFo_Plants_Nightshadow_01::StaticClass(), 2, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItFo_Plants_Dewleaf::StaticClass(), 2, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItMi_Inscription_Parchment::StaticClass(), 4, "StoryG1R_EnteredChapter_2");
    // Scrolls
    default AddTraderItemAllDifficulties(UItAr_Scroll_FireBolt::StaticClass(), 3, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItAr_Scroll_Heal::StaticClass(), 2, "StoryG1R_EnteredChapter_2");
    // Weapons
    default AddTraderItemAllDifficulties(UItRw_Bow_Small_03::StaticClass(), 1, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItMw_1H_Sword_01::StaticClass(), 1, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItMw_1H_Axe_01::StaticClass(), 1, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItMw_1H_Sword_Short_05::StaticClass(), 1, "StoryG1R_EnteredChapter_2");
    default AddTraderItemAllDifficulties(UItMw_1H_Mace_War_03::StaticClass(), 1, "StoryG1R_EnteredChapter_2");

    ////-- CH3 --////
    // Ore
    default AddTraderItemAllDifficulties(UItMi_Orenugget::StaticClass(), 28, "StoryG1R_EnteredChapter_3");
    // Misc
    default AddTraderItemAllDifficulties(UItKe_Lockpick::StaticClass(), 10, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItAm_Arrow::StaticClass(), 20, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItAm_Bolt::StaticClass(), 14, "StoryG1R_EnteredChapter_3");
    // Potions
    default AddTraderItemAllDifficulties(UItFo_Potion_Health_01::StaticClass(), 4, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItFo_Potion_Health_02::StaticClass(), 4, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItFo_Potion_Health_03::StaticClass(), 2, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItFo_Potion_Mana_01::StaticClass(), 3, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItFo_Potion_Mana_02::StaticClass(), 2, "StoryG1R_EnteredChapter_3");
    // Materials
    default AddTraderItemAllDifficulties(UItMi_Smith_Leatherstraps::StaticClass(), 4, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItMi_Smith_Iron::StaticClass(), 3, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItMi_Smith_Steel::StaticClass(), 3, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItMi_Smith_Oak::StaticClass(), 3, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItMi_Smith_Ironwood::StaticClass(), 2, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItMi_Smith_Ruby::StaticClass(), 1, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItMi_Alchemy_Flask::StaticClass(), 5, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItMi_Alchemy_Alcohol_01::StaticClass(), 3, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItMi_Alchemy_Salt_01::StaticClass(), 2, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItMi_Alchemy_Quicksilver_01::StaticClass(), 2, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItFo_Plants_Herb_02::StaticClass(), 5, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItFo_Plants_Herb_03::StaticClass(), 3, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItFo_Plants_Ravenherb_02::StaticClass(), 4, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItFo_Plants_Stoneroot_02::StaticClass(), 3, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItFo_Plants_Nightshadow_02::StaticClass(), 2, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItFo_Plants_Siren::StaticClass(), 2, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItMi_Inscription_Parchment::StaticClass(), 5, "StoryG1R_EnteredChapter_3");
    // Scrolls
    default AddTraderItemAllDifficulties(UItAr_Scroll_FireBall::StaticClass(), 2, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItAr_Scroll_IceBolt::StaticClass(), 2, "StoryG1R_EnteredChapter_3");
    // Weapons
    default AddTraderItemAllDifficulties(UItRw_Bow_Long_02::StaticClass(), 1, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItMw_1H_Sword_Long_02::StaticClass(), 1, "StoryG1R_EnteredChapter_3");
    default AddTraderItemAllDifficulties(UItMw_1H_Mace_Warhammer_01::StaticClass(), 1, "StoryG1R_EnteredChapter_3");

    ////-- CH4 --////
    // Ore
    default AddTraderItemAllDifficulties(UItMi_Orenugget::StaticClass(), 35, "StoryG1R_EnteredChapter_4");
    // Misc
    default AddTraderItemAllDifficulties(UItKe_Lockpick::StaticClass(), 12, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItAm_Arrow::StaticClass(), 24, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItAm_Bolt::StaticClass(), 18, "StoryG1R_EnteredChapter_4");
    // Potions
    default AddTraderItemAllDifficulties(UItFo_Potion_Health_01::StaticClass(), 5, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItFo_Potion_Health_02::StaticClass(), 4, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItFo_Potion_Health_03::StaticClass(), 3, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItFo_Potion_Mana_02::StaticClass(), 3, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItFo_Potion_Mana_03::StaticClass(), 2, "StoryG1R_EnteredChapter_4");
    // Materials
    default AddTraderItemAllDifficulties(UItMi_Smith_Leatherstraps::StaticClass(), 4, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItMi_Smith_Steel::StaticClass(), 3, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItMi_Smith_Oak::StaticClass(), 3, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItMi_Smith_Ironwood::StaticClass(), 3, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItMi_Smith_Petrifiedwood::StaticClass(), 2, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItMi_Smith_Ruby::StaticClass(), 1, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItMi_Smith_Gold::StaticClass(), 1, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItMi_Alchemy_Flask::StaticClass(), 5, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItMi_Alchemy_Alcohol_01::StaticClass(), 4, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItMi_Alchemy_Salt_01::StaticClass(), 3, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItMi_Alchemy_Quicksilver_01::StaticClass(), 3, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItFo_Plants_Herb_02::StaticClass(), 5, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItFo_Plants_Herb_03::StaticClass(), 4, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItFo_Plants_Ravenherb_02::StaticClass(), 4, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItFo_Plants_Stoneroot_02::StaticClass(), 3, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItFo_Plants_Mountainmoss_02::StaticClass(), 2, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItFo_Plants_Siren::StaticClass(), 2, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItMi_Inscription_Parchment::StaticClass(), 5, "StoryG1R_EnteredChapter_4");
    // Scrolls
    default AddTraderItemAllDifficulties(UItAr_Scroll_FireBall::StaticClass(), 3, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItAr_Scroll_BallLightning::StaticClass(), 2, "StoryG1R_EnteredChapter_4");
    // Artifacts
    default AddTraderItemAllDifficulties(UItAt_Ring_Strong_01::StaticClass(), 1, "StoryG1R_EnteredChapter_4");
    // Weapons
    default AddTraderItemAllDifficulties(UItRw_Bow_Long_05::StaticClass(), 1, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItRw_Crossbow_01::StaticClass(), 1, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItMw_1H_Sword_Bastard_04::StaticClass(), 1, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItMw_2H_Axe_Old_03::StaticClass(), 1, "StoryG1R_EnteredChapter_4");

    ////-- CH5 --////
    // Ore
    default AddTraderItemAllDifficulties(UItMi_Orenugget::StaticClass(), 30, "StoryG1R_EnteredChapter_5");
    // Misc
    default AddTraderItemAllDifficulties(UItKe_Lockpick::StaticClass(), 10, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItAm_Arrow::StaticClass(), 30, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItAm_Bolt::StaticClass(), 24, "StoryG1R_EnteredChapter_5");
    // Potions
    default AddTraderItemAllDifficulties(UItFo_Potion_Health_02::StaticClass(), 5, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItFo_Potion_Health_03::StaticClass(), 4, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItFo_Potion_Mana_02::StaticClass(), 4, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItFo_Potion_Mana_03::StaticClass(), 3, "StoryG1R_EnteredChapter_5");
    // Materials
    default AddTraderItemAllDifficulties(UItMi_Smith_Leatherstraps::StaticClass(), 4, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItMi_Smith_Steel::StaticClass(), 3, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItMi_Smith_Ironwood::StaticClass(), 3, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItMi_Smith_Petrifiedwood::StaticClass(), 3, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItMi_Smith_Ruby::StaticClass(), 1, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItMi_Smith_Obsidian::StaticClass(), 1, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItMi_Alchemy_Flask::StaticClass(), 6, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItMi_Alchemy_Alcohol_01::StaticClass(), 4, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItMi_Alchemy_Salt_01::StaticClass(), 3, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItMi_Alchemy_Quicksilver_01::StaticClass(), 4, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItFo_Plants_Herb_03::StaticClass(), 5, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItFo_Plants_Stoneroot_02::StaticClass(), 4, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItFo_Plants_Mountainmoss_02::StaticClass(), 3, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItFo_Plants_Flameberry_01::StaticClass(), 4, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItFo_Plants_Nightshadow_02::StaticClass(), 3, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItMi_Inscription_Parchment::StaticClass(), 6, "StoryG1R_EnteredChapter_5");
    // Scrolls
    default AddTraderItemAllDifficulties(UItAr_Scroll_FireRain::StaticClass(), 2, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItAr_Scroll_ChainLightning::StaticClass(), 2, "StoryG1R_EnteredChapter_5");
    // Artifacts
    default AddTraderItemAllDifficulties(UItAt_Ring_Skill_02::StaticClass(), 1, "StoryG1R_EnteredChapter_5");
    // Weapons
    default AddTraderItemAllDifficulties(UItRw_Bow_Long_08::StaticClass(), 1, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItRw_Crossbow_03::StaticClass(), 1, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItMw_2H_Sword_03::StaticClass(), 1, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItMw_2H_Axe_Heavy_04::StaticClass(), 1, "StoryG1R_EnteredChapter_5");

    ////-- CH6 --////
    // Ore
    default AddTraderItemAllDifficulties(UItMi_Orenugget::StaticClass(), 25, "StoryG1R_EnteredChapter_6");
    // Misc
    default AddTraderItemAllDifficulties(UItAm_Arrow::StaticClass(), 40, "StoryG1R_EnteredChapter_6");
    default AddTraderItemAllDifficulties(UItAm_Bolt::StaticClass(), 30, "StoryG1R_EnteredChapter_6");
    // Potions
    default AddTraderItemAllDifficulties(UItFo_Potion_Health_03::StaticClass(), 6, "StoryG1R_EnteredChapter_6");
    default AddTraderItemAllDifficulties(UItFo_Potion_Mana_03::StaticClass(), 4, "StoryG1R_EnteredChapter_6");
    // Materials
    default AddTraderItemAllDifficulties(UItMi_Smith_Steel::StaticClass(), 4, "StoryG1R_EnteredChapter_6");
    default AddTraderItemAllDifficulties(UItMi_Smith_Ironwood::StaticClass(), 4, "StoryG1R_EnteredChapter_6");
    default AddTraderItemAllDifficulties(UItMi_Smith_Petrifiedwood::StaticClass(), 3, "StoryG1R_EnteredChapter_6");
    default AddTraderItemAllDifficulties(UItMi_Smith_Obsidian::StaticClass(), 2, "StoryG1R_EnteredChapter_6");
    default AddTraderItemAllDifficulties(UItMi_Alchemy_Flask::StaticClass(), 6, "StoryG1R_EnteredChapter_6");
    default AddTraderItemAllDifficulties(UItMi_Alchemy_Quicksilver_01::StaticClass(), 5, "StoryG1R_EnteredChapter_6");
    default AddTraderItemAllDifficulties(UItFo_Plants_Herb_03::StaticClass(), 6, "StoryG1R_EnteredChapter_6");
    default AddTraderItemAllDifficulties(UItFo_Plants_Stoneroot_02::StaticClass(), 5, "StoryG1R_EnteredChapter_6");
    default AddTraderItemAllDifficulties(UItMi_Inscription_Parchment::StaticClass(), 8, "StoryG1R_EnteredChapter_6");
    // Weapons
    default AddTraderItemAllDifficulties(UItRw_Bow_War_05::StaticClass(), 1, "StoryG1R_EnteredChapter_6");
    default AddTraderItemAllDifficulties(UItRw_Crossbow_04::StaticClass(), 1, "StoryG1R_EnteredChapter_6");
}

UCLASS()
class UDemoHunterTraderConfig: UTraderConfigBase
{
    default m_Region = n"Wilderness";

    ////-- CH1 --////
    // Ore
    default AddTraderItemAllDifficulties(UItMi_Orenugget::StaticClass(), 50, "OnWorldStart");
    // Misc
    default AddTraderItemAllDifficulties(UItAm_Arrow::StaticClass(), 25, "OnWorldStart");
    // Food
    default AddTraderItemAllDifficulties(UItFo_Loaf::StaticClass(), 1, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Cheese::StaticClass(), 1, "OnWorldStart");
}

UCLASS()
class UXardasTraderConfig: UTraderConfigBase
{
    default m_UniqueName = n"XT_DMB_Xardas_404";
    default m_Region = n"Xardas Tower";
    default m_Type = n"Inscriber";

    ////-- CH4 --////
    // Artifacts
    default AddTraderItemAllDifficulties(UItAt_Amulet_Power::StaticClass(), 1, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItAt_Amulet_Enlight::StaticClass(), 1, "StoryG1R_EnteredChapter_4");
    // Runes
    default AddTraderItemAllDifficulties(UItAr_Rune_DeathToTheUndead::StaticClass(), 1, "StoryG1R_EnteredChapter_4");
    // Scrolls
    default AddTraderItemAllDifficulties(UItAr_Scroll_SummonSkeletons::StaticClass(), 3, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItAr_Scroll_SummonGolem::StaticClass(), 2, "StoryG1R_EnteredChapter_4");
    default AddTraderItemAllDifficulties(UItAr_Scroll_Shrink::StaticClass(), 2, "StoryG1R_EnteredChapter_4");
    // Recipes
    default AddTraderItemAllDifficulties(UItWr_Scroll_FireRain::StaticClass(),  1, "StoryG1R_EnteredChapter_5");

    ////-- CH5 --////
    // Artifacts
    default AddTraderItemAllDifficulties(UItAt_Ring_Total_02::StaticClass(), 1, "StoryG1R_EnteredChapter_5");
    // Runes
    default AddTraderItemAllDifficulties(UItAr_Rune_FireRain::StaticClass(), 1, "StoryG1R_EnteredChapter_5");
    // Potions    
    default AddTraderItemAllDifficulties(UItFo_Potion_Strength_03::StaticClass(), 1, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItFo_Potion_Master_01::StaticClass(), 1, "StoryG1R_EnteredChapter_5");
    // Scrolls
    default AddTraderItemAllDifficulties(UItAr_Scroll_SummonSkeletons::StaticClass(), 3, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItAr_Scroll_SummonGolem::StaticClass(), 2, "StoryG1R_EnteredChapter_5");
    default AddTraderItemAllDifficulties(UItAr_Scroll_SummonDemon::StaticClass(), 1, "StoryG1R_EnteredChapter_5");
    // Recipes
    default AddTraderItemAllDifficulties(UItWr_Scroll_Potion_Master_02::StaticClass(), 1, "StoryG1R_EnteredChapter_5");

    ////-- CH6 --////
    // Scrolls
    default AddTraderItemAllDifficulties(UItAr_Scroll_SummonSkeletons::StaticClass(), 4, "StoryG1R_EnteredChapter_6");
    default AddTraderItemAllDifficulties(UItAr_Scroll_SummonGolem::StaticClass(), 4, "StoryG1R_EnteredChapter_6");
    default AddTraderItemAllDifficulties(UItAr_Scroll_SummonDemon::StaticClass(), 4, "StoryG1R_EnteredChapter_6");
    default AddTraderItemAllDifficulties(UItAr_Scroll_SummonArmyOfDarkness::StaticClass(), 8, "StoryG1R_EnteredChapter_6");
}

