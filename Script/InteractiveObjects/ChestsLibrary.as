
UCLASS()
class UIO_AM_CHEST_01: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Health_01::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Oak::StaticClass(), 1);
    default AddToInventory(UItMi_Joint_03::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Leatherstraps::StaticClass(), 1);
    default AddToInventory(UItAm_Arrow::StaticClass(), 5);
    default m_UniqueName = n"IO_AM_CHEST_01";
}

UCLASS()
class UIO_AM_CHEST_02: UIoChestDefault
{
    default AddToInventory(UItMw_1H_Mace_01::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Iron::StaticClass(), 2);
    default AddToInventory(UItFo_Potion_Beer::StaticClass(), 2);
    default AddToInventory(UItMi_Oldcoin_01::StaticClass(), 15);
    default m_UniqueName = n"IO_AM_CHEST_02";
}

UCLASS()
class UIO_AM_CHEST_03: UIoChestDefault
{
    default AddToInventory(UItMi_Smith_Steel::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Leatherstraps::StaticClass(), 2);
    default AddToInventory(UItMi_Smith_Iron::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 10);
    default m_UniqueName = n"IO_AM_CHEST_03";
}

UCLASS()
class UIO_AM_CHEST_06: UIoChestDefault
{
    default AddToInventory(UItAt_Ring_Magic_03::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Mana_01::StaticClass(), 2);
    default AddToInventory(UItAr_Scroll_Heal::StaticClass(), 3);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 12);
    default m_UniqueName = n"IO_AM_CHEST_06";
}

UCLASS()
class UIO_AM_CORPSE_CAINE: UIoLootDefault
{
    default AddToInventory(UItMw_1H_Axe_Old_01::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Booze::StaticClass(), 6);
    default AddToInventory(UItFo_Rice::StaticClass(), 2);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 5);
    default m_UniqueName = n"IO_AM_CORPSE_CAINE";
}

UCLASS()
class UIO_AMR_CHEST_01: UIoChestDefault
{
    default AddToInventory(UItKe_Focus_04::StaticClass(), 1);
    default AddToInventory(UItAr_Scroll_TransformMeatbug::StaticClass(), 1);
    default AddToInventory(UItMi_Inscription_Parchment::StaticClass(), 4);
    default AddToInventory(UItKe_Lockpick::StaticClass(), 2);
    default AddToInventory(UItAm_Arrow::StaticClass(), 7);
    default AddToInventory(UItMi_Oldcoin_01::StaticClass(), 16);
    default m_UniqueName = n"IO_AMR_CHEST_01";
}

UCLASS()
class UIO_AMR_CHEST_05: UIoChestDefault
{
    default AddToInventory(UItMi_Orenugget::StaticClass(), 26);
    default m_UniqueName = n"IO_AMR_CHEST_05";
}

UCLASS()
class UIO_AMR_CHEST_07: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Health_01::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Mana_01::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 18);
    default m_UniqueName = n"IO_AMR_CHEST_07";
}

UCLASS()
class UIO_AMR_CHEST_08: UIoChestDefault
{
    default AddToInventory(UItRw_Bow_Long_04::StaticClass(), 1);
    default AddToInventory(UItAm_Arrow::StaticClass(), 5);
    default AddToInventory(UItFo_Potion_Wine::StaticClass(), 2);
    default m_UniqueName = n"IO_AMR_CHEST_08";
}

UCLASS()
class UIO_BC_CHEST_06: UIoChestDefault
{
    default m_UniqueName = n"IO_BC_CHEST_06";
}

UCLASS()
class UIO_BT_CHEST_03: UIoChestDefault
{
    default AddToInventory(UItKe_Tower_01::StaticClass(), 1);
    default AddToInventory(UItKe_Lockpick::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Beer::StaticClass(), 4);
    default AddToInventory(UItFo_Mutton_02::StaticClass(), 4);
    default AddToInventory(UItMw_1H_Torch::StaticClass(), 1);
    default m_UniqueName = n"IO_BT_CHEST_03";
}

UCLASS()
class UIO_CR_CHEST_03: UIoChestDefault
{
    default AddToInventory(UItAr_Scroll_TransformMeatbug::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Strength_01::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Mana_02::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 8);
    default AddToInventory(UItMi_Oldcoin_01::StaticClass(), 20);
    default m_UniqueName = n"IO_CR_CHEST_03";
}

UCLASS()
class UIO_CV_CHEST_03: UIoChestDefault
{
    default AddToInventory(UItAt_Shadow_01::StaticClass(), 1);
    default AddToInventory(UItKe_Lockpick::StaticClass(), 2);
    default AddToInventory(UItFo_Potion_Beer::StaticClass(), 2);
    default AddToInventory(UItMw_1H_Torch::StaticClass(), 1);
    default m_UniqueName = n"IO_CV_CHEST_03";
}

UCLASS()
class UIO_CV_CHEST_05: UIoChestDefault
{
    default AddToInventory(UItKe_Cavalorn_01::StaticClass(), 1);
    default AddToInventory(UItKe_Lockpick::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Beer::StaticClass(), 2);
    default AddToInventory(UItAt_Wolf_01::StaticClass(), 1);
    default AddToInventory(UItAt_Teeth_01::StaticClass(), 4);
    default AddToInventory(UItMw_1H_Torch::StaticClass(), 1);
    default m_UniqueName = n"IO_CV_CHEST_05";
}

UCLASS()
class UIO_CV_CHEST_06: UIoChestDefault
{
    default AddToInventory(UItKe_Lockpick::StaticClass(), 1);
    default AddToInventory(UItAr_Scroll_Heal::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Beer::StaticClass(), 2);
    default AddToInventory(UItAm_Arrow::StaticClass(), 5);
    default m_UniqueName = n"IO_CV_CHEST_06";
}

UCLASS()
class UIO_CV_CHEST_08: UIoChestDefault
{
    default AddToInventory(UItMw_1H_Sword_Short_02::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Leatherstraps::StaticClass(), 2);
    default AddToInventory(UItMi_Smith_Iron::StaticClass(), 1);
    default AddToInventory(UItMi_Oldcoin_01::StaticClass(), 15);
    default m_UniqueName = n"IO_CV_CHEST_08";
}

UCLASS()
class UIO_CV_CHEST_11: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Health_02::StaticClass(), 2);
    default AddToInventory(UItKe_Lockpick::StaticClass(), 2);
    default AddToInventory(UItAr_Scroll_Heal::StaticClass(), 1);
    default AddToInventory(UItAr_Scroll_Light::StaticClass(), 2);
    default m_UniqueName = n"IO_CV_CHEST_11";
}

UCLASS()
class UIO_CV_CORPSE_01: UIoLootDefault
{
    default AddToInventory(UItFo_Potion_Health_Quick::StaticClass(), 1);
    default AddToInventory(UItKe_Lockpick::StaticClass(), 4);
    default AddToInventory(UItMi_Alchemy_Flask::StaticClass(), 2);
    default m_UniqueName = n"IO_CV_CORPSE_01";
}

UCLASS()
class UIO_CV_CORPSE_02: UIoLootDefault
{
    default AddToInventory(UItAr_Scroll_TransformWolf::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Ruby::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 6);
    default m_UniqueName = n"IO_CV_CORPSE_02";
}

UCLASS()
class UIO_EF_CHEST_01: UIoChestDefault
{
    default AddToInventory(UItAr_Scroll_Light::StaticClass(), 2);
    default AddToInventory(UItMi_Smith_Oak::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Willow::StaticClass(), 1);
    default AddToInventory(UItKe_Lockpick::StaticClass(), 3);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 8);
    default m_UniqueName = n"IO_EF_CHEST_01";
}

UCLASS()
class UIO_EF_CHEST_02: UIoChestDefault
{
    default AddToInventory(UItWr_Scroll_1H_Axe_02::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Ruby::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Mana_01::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Leatherstraps::StaticClass(), 1);
    default AddToInventory(UItMi_Alchemy_Flask::StaticClass(), 3);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 8);
    default m_UniqueName = n"IO_EF_CHEST_02";
}

UCLASS()
class UIO_EF_CHEST_04: UIoChestDefault
{
    default AddToInventory(UItAr_Scroll_StormOfFire::StaticClass(), 1);
    default AddToInventory(UItAr_Scroll_Light::StaticClass(), 3);
    default AddToInventory(UItMi_Inscription_Parchment::StaticClass(), 4);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 17);
    default m_UniqueName = n"IO_EF_CHEST_04";
}

UCLASS()
class UIO_EF_CHEST_06: UIoChestDefault
{
    default AddToInventory(UItKe_Lockpick::StaticClass(), 3);
    default AddToInventory(UItMi_Joint_01::StaticClass(), 1);
    default AddToInventory(UItAr_Scroll_Light::StaticClass(), 1);
    default AddToInventory(UItMi_Oldcoin_01::StaticClass(), 4);
    default m_UniqueName = n"IO_EF_CHEST_06";
}

UCLASS()
class UIO_EF_CORPSE_01: UIoLootDefault
{
    default AddToInventory(UItAt_Amulet_Life::StaticClass(), 1);
    default AddToInventory(UItAr_Scroll_StormFist::StaticClass(), 1);
    default AddToInventory(UItMi_Joint_03::StaticClass(), 1);
    default AddToInventory(UItKe_Lockpick::StaticClass(), 3);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 8);
    default m_UniqueName = n"IO_EF_CORPSE_01";
}

UCLASS()
class UIO_EZ_CHEST_01: UIoChestDefault
{
    default AddToInventory(UItKe_LootCage_01::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Strongbeer::StaticClass(), 1);
    default AddToInventory(UItMw_1H_Torch::StaticClass(), 1);
    default AddToInventory(UItMi_Oldcoin_01::StaticClass(), 5);
    default m_UniqueName = n"IO_EZ_CHEST_01";
}

UCLASS()
class UIO_EZ_CHEST_02: UIoChestDefault
{
    default AddToInventory(UItKe_Lockpick::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Beer::StaticClass(), 2);
    default AddToInventory(UItMw_1H_Torch::StaticClass(), 1);
    default AddToInventory(UItAm_Arrow::StaticClass(), 4);
    default AddToInventory(UItMi_Oldcoin_01::StaticClass(), 11);
    default m_UniqueName = n"IO_EZ_CHEST_02";
}

UCLASS()
class UIO_EZ_CHEST_03: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Beer::StaticClass(), 1);
    default AddToInventory(UItAm_Arrow::StaticClass(), 4);
    default AddToInventory(UItMi_Oldcoin_01::StaticClass(), 7);
    default m_UniqueName = n"IO_EZ_CHEST_03";
}

UCLASS()
class UIO_EZF_CORPSE_01: UIoLootDefault
{
    default AddToInventory(UItFo_Potion_Health_Quick::StaticClass(), 3);
    default AddToInventory(UItMi_Smith_Ironwood::StaticClass(), 2);
    default AddToInventory(UItKe_Lockpick::StaticClass(), 4);
    default AddToInventory(UItMi_Smith_Iron::StaticClass(), 2);
    default m_UniqueName = n"IO_EZF_CORPSE_01";
}

UCLASS()
class UIO_FM_CHEST_ENTRANCE: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Mana_03::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Health_02::StaticClass(), 2);
    default m_UniqueName = n"IO_FM_CHEST_ENTRANCE";
}

UCLASS()
class UIO_FM_CHEST_SECRET_PASSAGE_01: UIoChestDefault
{
    default AddToInventory(UItMi_Smith_Petrifiedwood::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Health_Quick::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 7);
    default m_UniqueName = n"IO_FM_CHEST_SECRET_PASSAGE_01";
}

UCLASS()
class UIO_FM_CORPSE_01: UIoLootDefault
{
    default AddToInventory(UItKe_AbandonedGallery_01::StaticClass(), 1);
    default AddToInventory(UItWr_Scroll_1H_Sword_Bastard_02::StaticClass(), 1);
    default AddToInventory(UItMi_Oldcoin_01::StaticClass(), 5);
    default m_UniqueName = n"IO_FM_CORPSE_01";
}

UCLASS()
class UIO_FM_CORPSE_02: UIoLootDefault
{
    default AddToInventory(UItAr_Scroll_TransformMinecrawler::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Health_02::StaticClass(), 1);
    default AddToInventory(UItKe_Lockpick::StaticClass(), 4);
    default m_UniqueName = n"IO_FM_CORPSE_02";
}

UCLASS()
class UIO_FM_CORPSE_03: UIoLootDefault
{
    default AddToInventory(UItAt_Ring_Ranged_02::StaticClass(), 1);
    default m_UniqueName = n"IO_FM_CORPSE_03";
}

UCLASS()
class UIO_FME_CHEST_DIGGINGGALLERY_01: UIoChestDefault
{
    default AddToInventory(UItFo_Rice::StaticClass(), 2);
    default AddToInventory(UItFo_Potion_Water_01::StaticClass(), 4);
    default AddToInventory(UItMi_Stuff_Cup_01::StaticClass(), 2);
    default AddToInventory(UItMw_1H_Torch::StaticClass(), 3);
    default m_UniqueName = n"IO_FME_CHEST_DIGGINGGALLERY_01";
}

UCLASS()
class UIO_FME_CHEST_DIGGINGGALLERY_02: UIoChestDefault
{
    default AddToInventory(UItAt_Ring_Life_01::StaticClass(), 1);
    default AddToInventory(UItKe_Lockpick::StaticClass(), 2);
    default AddToInventory(UItMi_Smith_Leatherstraps::StaticClass(), 2);
    default AddToInventory(UItMw_1H_Torch::StaticClass(), 4);
    default m_UniqueName = n"IO_FME_CHEST_DIGGINGGALLERY_02";
    default m_Lock = n"FM_Chest_Digginggallery_02_Lock";
    default m_LockDifficulty = 4;
}

UCLASS()
class UIO_FME_CHEST_EMPTYHUT_01: UIoChestDefault
{
    default AddToInventory(UItKe_Lockpick::StaticClass(), 2);
    default AddToInventory(UItFo_Potion_Water_01::StaticClass(), 3);
    default AddToInventory(UItMi_Stuff_Cup_01::StaticClass(), 2);
    default AddToInventory(UItFo_Lemon::StaticClass(), 3);
    default m_UniqueName = n"IO_FME_CHEST_EMPTYHUT_01";
}

UCLASS()
class UIO_FME_CHEST_EMPTYHUT_03: UIoChestDefault
{
    default m_UniqueName = n"IO_FME_CHEST_EMPTYHUT_03";
}

UCLASS()
class UIO_FME_CHEST_EMPTYHUT_06: UIoChestDefault
{
    default AddToInventory(UItFo_Crawlersoup::StaticClass(), 1);
    default AddToInventory(UItKe_Lockpick::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Booze::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Willow::StaticClass(), 1);
    default m_UniqueName = n"IO_FME_CHEST_EMPTYHUT_06";
}

UCLASS()
class UIO_FME_CHEST_ROGUE02_891: UIoChestDefault
{
    default m_UniqueName = n"IO_FME_CHEST_ROGUE02_891";
}

UCLASS()
class UIO_FME_CHEST_SCRAPPER12_1042: UIoChestDefault
{
    default m_UniqueName = n"IO_FME_CHEST_SCRAPPER12_1042";
}

UCLASS()
class UIO_FME_CORPSE_01: UIoLootDefault
{
    default AddToInventory(UItFo_Potion_Mana_01::StaticClass(), 1);
    default AddToInventory(UItAr_Scroll_Light::StaticClass(), 3);
    default AddToInventory(UItFo_Potion_Water_01::StaticClass(), 2);
    default m_UniqueName = n"IO_FME_CORPSE_01";
}

UCLASS()
class UIO_FME_CORPSE_BALORO: UIoLootDefault
{
    default AddToInventory(UItMw_1H_Mace_War_03::StaticClass(), 1);
    default m_UniqueName = n"IO_FME_CORPSE_BALORO";
}

UCLASS()
class UIO_FME_CORPSE_MERCENARY_01: UIoLootDefault
{
    default AddToInventory(UItMi_Stuff_Amphore_01::StaticClass(), 1);
    default AddToInventory(UItMw_1H_Torch::StaticClass(), 2);
    default m_UniqueName = n"IO_FME_CORPSE_MERCENARY_01";
}

UCLASS()
class UIO_FME_CORPSE_MERCENARY_02: UIoLootDefault
{
    default AddToInventory(UItFo_Potion_Booze::StaticClass(), 3);
    default m_UniqueName = n"IO_FME_CORPSE_MERCENARY_02";
}

UCLASS()
class UIO_FME_CORPSE_MERCENARY_03: UIoLootDefault
{
    default AddToInventory(UItMw_1H_Torch::StaticClass(), 2);
    default m_UniqueName = n"IO_FME_CORPSE_MERCENARY_03";
}

UCLASS()
class UIO_FME_CORPSE_MERCENARY_04: UIoLootDefault
{
    default AddToInventory(UItFo_Potion_Booze::StaticClass(), 1);
    default m_UniqueName = n"IO_FME_CORPSE_MERCENARY_04";
}

UCLASS()
class UIO_FME_CORPSE_MERCENARY_05: UIoLootDefault
{
    default AddToInventory(UItFo_Loaf::StaticClass(), 1);
    default AddToInventory(UItFo_Rice::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Water_01::StaticClass(), 2);
    default m_UniqueName = n"IO_FME_CORPSE_MERCENARY_05";
}

UCLASS()
class UIO_FME_CORPSE_MERCENARY_06: UIoLootDefault
{
    default AddToInventory(UItRw_Bow_Long_01::StaticClass(), 1);
    default AddToInventory(UItAm_Arrow::StaticClass(), 5);
    default m_UniqueName = n"IO_FME_CORPSE_MERCENARY_06";
}

UCLASS()
class UIO_FME_CORPSE_MERCENARY_07: UIoLootDefault
{
    default AddToInventory(UItMi_Orenugget::StaticClass(), 5);
    default m_UniqueName = n"IO_FME_CORPSE_MERCENARY_07";
}

UCLASS()
class UIO_FME_CORPSE_MERCENARY_08: UIoLootDefault
{
    default AddToInventory(UItFo_Mutton_01::StaticClass(), 3);
    default m_UniqueName = n"IO_FME_CORPSE_MERCENARY_08";
}

UCLASS()
class UIO_FME_CORPSE_MERCENARY_09: UIoLootDefault
{
    default AddToInventory(UItMi_Orenugget::StaticClass(), 5);
    default AddToInventory(UItAm_Bolt::StaticClass(), 8);
    default m_UniqueName = n"IO_FME_CORPSE_MERCENARY_09";
}

UCLASS()
class UIO_FME_CORPSE_MERCENARY_10: UIoLootDefault
{
    default AddToInventory(UItFo_Apple::StaticClass(), 3);
    default AddToInventory(UItFo_Pear::StaticClass(), 1);
    default AddToInventory(UItFo_Lemon::StaticClass(), 2);
    default m_UniqueName = n"IO_FME_CORPSE_MERCENARY_10";
}

UCLASS()
class UIO_FME_CORPSE_MERCENARY_11: UIoLootDefault
{
    default AddToInventory(UItFo_Apple::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Water_01::StaticClass(), 3);
    default AddToInventory(UItMi_Stuff_Cup_01::StaticClass(), 1);
    default m_UniqueName = n"IO_FME_CORPSE_MERCENARY_11";
}

UCLASS()
class UIO_FME_CORPSE_MERCENARY_12: UIoLootDefault
{
    default AddToInventory(UItAm_Arrow::StaticClass(), 7);
    default AddToInventory(UItMi_Oldcoin_01::StaticClass(), 10);
    default m_UniqueName = n"IO_FME_CORPSE_MERCENARY_12";
}

UCLASS()
class UIO_FME_CORPSE_MERCENARY_13: UIoLootDefault
{
    default AddToInventory(UItFo_Potion_Booze::StaticClass(), 2);
    default AddToInventory(UItFo_Rice::StaticClass(), 2);
    default m_UniqueName = n"IO_FME_CORPSE_MERCENARY_13";
}

UCLASS()
class UIO_FME_CORPSE_OKYL: UIoLootDefault
{
    default AddToInventory(UItRw_Bow_Long_01::StaticClass(), 1);
    default AddToInventory(UItMi_Oldcoin_01::StaticClass(), 2);
    default m_UniqueName = n"IO_FME_CORPSE_OKYL";
}

UCLASS()
class UIO_FME_CORPSE_ROGUE_01: UIoLootDefault
{
    default AddToInventory(UItAt_Wolf_03::StaticClass(), 1);
    default AddToInventory(UItAm_Bolt::StaticClass(), 3);
    default AddToInventory(UItAm_Arrow::StaticClass(), 15);
    default m_UniqueName = n"IO_FME_CORPSE_ROGUE_01";
}

UCLASS()
class UIO_FME_CORPSE_ROGUE_02: UIoLootDefault
{
    default AddToInventory(UItRw_Bow_Long_01::StaticClass(), 1);
    default AddToInventory(UItAm_Bolt::StaticClass(), 10);
    default m_UniqueName = n"IO_FME_CORPSE_ROGUE_02";
}

UCLASS()
class UIO_FME_CORPSE_ROGUE_03: UIoLootDefault
{
    default AddToInventory(UItFo_Potion_Health_02::StaticClass(), 2);
    default AddToInventory(UItMw_1H_Torch::StaticClass(), 3);
    default AddToInventory(UItAm_Bolt::StaticClass(), 4);
    default AddToInventory(UItAm_Arrow::StaticClass(), 5);
    default m_UniqueName = n"IO_FME_CORPSE_ROGUE_03";
}

UCLASS()
class UIO_FME_CORPSE_SCRAPPER_01: UIoLootDefault
{
    default AddToInventory(UItMi_Orenugget::StaticClass(), 5);
    default AddToInventory(UItMi_Oldcoin_01::StaticClass(), 8);
    default m_UniqueName = n"IO_FME_CORPSE_SCRAPPER_01";
}

UCLASS()
class UIO_FME_CORPSE_SCRAPPER_02: UIoLootDefault
{
    default m_UniqueName = n"IO_FME_CORPSE_SCRAPPER_02";
}

UCLASS()
class UIO_FME_CORPSE_SCRAPPER_03: UIoLootDefault
{
    default AddToInventory(UItMw_2H_Axe_Pickaxe::StaticClass(), 1);
    default AddToInventory(UItFo_Loaf::StaticClass(), 1);
    default AddToInventory(UItFo_Rice::StaticClass(), 1);
    default m_UniqueName = n"IO_FME_CORPSE_SCRAPPER_03";
}

UCLASS()
class UIO_FME_CORPSE_SCRAPPER_04: UIoLootDefault
{
    default AddToInventory(UItKe_Lockpick::StaticClass(), 3);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 8);
    default m_UniqueName = n"IO_FME_CORPSE_SCRAPPER_04";
}

UCLASS()
class UIO_FME_CORPSE_SCRAPPER_05: UIoLootDefault
{
    default AddToInventory(UItFo_Mutton_01::StaticClass(), 2);
    default m_UniqueName = n"IO_FME_CORPSE_SCRAPPER_05";
}

UCLASS()
class UIO_FME_CORPSE_SCRAPPER_06: UIoLootDefault
{
    default m_UniqueName = n"IO_FME_CORPSE_SCRAPPER_06";
}

UCLASS()
class UIO_FME_CORPSE_SCRAPPER_07: UIoLootDefault
{
    default m_UniqueName = n"IO_FME_CORPSE_SCRAPPER_07";
}

UCLASS()
class UIO_FME_CORPSE_SCRAPPER_08: UIoLootDefault
{
    default AddToInventory(UItMi_Stuff_Silverware_01::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Plate_01::StaticClass(), 1);
    default m_UniqueName = n"IO_FME_CORPSE_SCRAPPER_08";
}

UCLASS()
class UIO_FME_CORPSE_SCRAPPER_09: UIoLootDefault
{
    default AddToInventory(UItFo_Potion_Health_02::StaticClass(), 2);
    default AddToInventory(UItMi_Oldcoin_01::StaticClass(), 9);
    default m_UniqueName = n"IO_FME_CORPSE_SCRAPPER_09";
}

UCLASS()
class UIO_FME_CORPSE_SCRAPPER_10: UIoLootDefault
{
    default AddToInventory(UItFo_Rice::StaticClass(), 2);
    default AddToInventory(UItMi_Stuff_Barbknife_01::StaticClass(), 1);
    default m_UniqueName = n"IO_FME_CORPSE_SCRAPPER_10";
}

UCLASS()
class UIO_FME_CORPSE_SCRAPPER_11: UIoLootDefault
{
    default AddToInventory(UItFo_Loaf::StaticClass(), 3);
    default AddToInventory(UItMw_1H_Torch::StaticClass(), 1);
    default AddToInventory(UItAm_Arrow::StaticClass(), 4);
    default m_UniqueName = n"IO_FME_CORPSE_SCRAPPER_11";
}

UCLASS()
class UIO_FME_CORPSE_SCRAPPER_12: UIoLootDefault
{
    default AddToInventory(UItAm_Bolt::StaticClass(), 6);
    default m_UniqueName = n"IO_FME_CORPSE_SCRAPPER_12";
}

UCLASS()
class UIO_FME_CORPSE_SCRAPPER_13: UIoLootDefault
{
    default m_UniqueName = n"IO_FME_CORPSE_SCRAPPER_13";
}

UCLASS()
class UIO_FME_CORPSE_SCRAPPER_14: UIoLootDefault
{
    default AddToInventory(UItFo_Potion_Water_01::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Cup_01::StaticClass(), 1);
    default m_UniqueName = n"IO_FME_CORPSE_SCRAPPER_14";
}

UCLASS()
class UIO_FME_CORPSE_SWINEY: UIoLootDefault
{
    default AddToInventory(UItMi_Joint_02::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 12);
    default m_UniqueName = n"IO_FME_CORPSE_SWINEY";
}

UCLASS()
class UIO_FT_CHEST_01: UIoChestDefault
{
    default AddToInventory(UItAr_Scroll_IceWave::StaticClass(), 1);
    default AddToInventory(UItAr_Scroll_BallLightning::StaticClass(), 1);
    default AddToInventory(UItAr_Scroll_Light::StaticClass(), 1);
    default AddToInventory(UItMi_Alchemy_Alcohol_01::StaticClass(), 1);
    default AddToInventory(UItMi_Oldcoin_01::StaticClass(), 10);
    default m_UniqueName = n"IO_FT_CHEST_01";
}

UCLASS()
class UIO_FT_CHEST_03: UIoChestDefault
{
    default AddToInventory(UItAr_Scroll_TransformShadowbeast::StaticClass(), 1);
    default AddToInventory(UItAr_Scroll_SummonSkeletons::StaticClass(), 1);
    default AddToInventory(UItAr_Scroll_Heal::StaticClass(), 2);
    default AddToInventory(UItMi_Inscription_Parchment::StaticClass(), 4);
    default AddToInventory(UItFo_Potion_Mana_02::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 16);
    default m_UniqueName = n"IO_FT_CHEST_03";
}

UCLASS()
class UIO_FT_CHEST_04: UIoChestDefault
{
    default AddToInventory(UItMi_Alchemy_Flask::StaticClass(), 7);
    default AddToInventory(UItKe_Lockpick::StaticClass(), 3);
    default AddToInventory(UItAm_Bolt::StaticClass(), 5);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 11);
    default m_UniqueName = n"IO_FT_CHEST_04";
}

UCLASS()
class UIO_FT_CHEST_05: UIoChestDefault
{
    default AddToInventory(UItMw_1H_Mace_War_03::StaticClass(), 1);
    default AddToInventory(UItAr_Scroll_Light::StaticClass(), 2);
    default AddToInventory(UItFo_Potion_Health_01::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Mana_01::StaticClass(), 1);
    default AddToInventory(UItMi_Oldcoin_01::StaticClass(), 7);
    default m_UniqueName = n"IO_FT_CHEST_05";
}

UCLASS()
class UIO_FT_CHEST_06: UIoChestDefault
{
    default AddToInventory(UItMi_Smith_Ironwood::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Steel::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Ruby::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Gold::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Willow::StaticClass(), 3);
    default m_UniqueName = n"IO_FT_CHEST_06";
}

UCLASS()
class UIO_GC_CHEST_01: UIoChestDefault
{
    default AddToInventory(UItMw_1H_Sword_04::StaticClass(), 1);
    default AddToInventory(UItKe_Lockpick::StaticClass(), 5);
    default AddToInventory(UItFo_Potion_Water_01::StaticClass(), 2);
    default AddToInventory(UItMi_Alchemy_Flask::StaticClass(), 3);
    default AddToInventory(UItMi_Smith_Leatherstraps::StaticClass(), 4);
    default m_UniqueName = n"IO_GC_CHEST_01";
}

UCLASS()
class UIO_GC_CHEST_02: UIoChestDefault
{
    default AddToInventory(UItWr_Book_Focus::StaticClass(), 1);
    default AddToInventory(UItAt_Ring_Life_02::StaticClass(), 1);
    default AddToInventory(UItKe_Lockpick::StaticClass(), 5);
    default AddToInventory(UItFo_Potion_Beer::StaticClass(), 2);
    default AddToInventory(UItMw_1H_Torch::StaticClass(), 3);
    default m_UniqueName = n"IO_GC_CHEST_02";
}

UCLASS()
class UIO_IWML_CORPSE_01: UIoLootDefault
{
    default AddToInventory(UItFo_Potion_Dex_01::StaticClass(), 1);
    default AddToInventory(UItAt_Wolf_03::StaticClass(), 1);
    default AddToInventory(UItAm_Bolt::StaticClass(), 6);
    default AddToInventory(UItAm_Arrow::StaticClass(), 8);
    default m_UniqueName = n"IO_IWML_CORPSE_01";
}

UCLASS()
class UIO_IWML_CORPSE_02: UIoLootDefault
{
    default AddToInventory(UItFo_Potion_Health_01::StaticClass(), 1);
    default AddToInventory(UItKe_Lockpick::StaticClass(), 4);
    default AddToInventory(UItFo_Potion_Water_01::StaticClass(), 2);
    default m_UniqueName = n"IO_IWML_CORPSE_02";
}

UCLASS()
class UIO_MF_CHEST_03: UIoChestDefault
{
    default AddToInventory(UItAt_Amulet_Magic_01::StaticClass(), 1);
    default AddToInventory(UItAr_Scroll_Light::StaticClass(), 2);
    default AddToInventory(UItFo_Potion_Health_01::StaticClass(), 2);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 14);
    default m_UniqueName = n"IO_MF_CHEST_03";
}

UCLASS()
class UIO_MF_CHEST_06: UIoChestDefault
{
    default AddToInventory(UItKe_Lockpick::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Beer::StaticClass(), 2);
    default AddToInventory(UItMw_1H_Torch::StaticClass(), 1);
    default m_UniqueName = n"IO_MF_CHEST_06";
}

UCLASS()
class UIO_MF_CHEST_09: UIoChestDefault
{
    default AddToInventory(UItKe_Lockpick::StaticClass(), 3);
    default AddToInventory(UItMw_1H_Torch::StaticClass(), 3);
    default AddToInventory(UItAm_Arrow::StaticClass(), 4);
    default AddToInventory(UItAm_Bolt::StaticClass(), 9);
    default AddToInventory(UItMi_Oldcoin_01::StaticClass(), 15);
    default m_UniqueName = n"IO_MF_CHEST_09";
}

UCLASS()
class UIO_MF_CHEST_10: UIoChestDefault
{
    default AddToInventory(UItMi_Orenugget::StaticClass(), 11);
    default m_UniqueName = n"IO_MF_CHEST_10";
}

UCLASS()
class UIO_MF_CORPSE_01: UIoLootDefault
{
    default AddToInventory(UItKe_CellarCages_01::StaticClass(), 1);
    default AddToInventory(UItKe_Lockpick::StaticClass(), 4);
    default AddToInventory(UItMw_1H_Torch::StaticClass(), 1);
    default m_UniqueName = n"IO_MF_CORPSE_01";
}

UCLASS()
class UIO_NC_CHEST_BARN: UIoChestDefault
{
    default AddToInventory(UItMw_1H_Sword_Scythe_01::StaticClass(), 1);
    default AddToInventory(UItKe_Lockpick::StaticClass(), 3);
    default AddToInventory(UItMi_Smith_Leatherstraps::StaticClass(), 1);
    default AddToInventory(UItMw_1H_Torch::StaticClass(), 3);
    default AddToInventory(UItMi_Coop::StaticClass(), 1);
    default m_UniqueName = n"IO_NC_CHEST_BARN";
}

UCLASS()
class UIO_NC_CHEST_FIELDGATE: UIoChestDefault
{
    default AddToInventory(UItKe_Lockpick::StaticClass(), 2);
    default AddToInventory(UItMi_Oldcoin_01::StaticClass(), 5);
    default m_UniqueName = n"IO_NC_CHEST_FIELDGATE";
}

UCLASS()
class UIO_NC_CHEST_FISHINGSPOT: UIoChestDefault
{
    default AddToInventory(UItMw_1H_Mace_Poker_01::StaticClass(), 1);
    default AddToInventory(UItKe_Lockpick::StaticClass(), 3);
    default AddToInventory(UItMi_Smith_Willow::StaticClass(), 1);
    default AddToInventory(UItAt_Harpy_01::StaticClass(), 1);
    default m_UniqueName = n"IO_NC_CHEST_FISHINGSPOT";
}

UCLASS()
class UIO_NC_CHEST_HIDDENCAVE: UIoChestDefault
{
    default AddToInventory(UItMw_1H_Sword_Short_03::StaticClass(), 1);
    default AddToInventory(UItAt_Harpy_01::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 10);
    default m_UniqueName = n"IO_NC_CHEST_HIDDENCAVE";
}

UCLASS()
class UIO_NC_CHEST_HUT13: UIoChestDefault
{
    default m_UniqueName = n"IO_NC_CHEST_HUT13";
}

UCLASS()
class UIO_NC_CHEST_LARESGUARDS: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Booze::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Willow::StaticClass(), 1);
    default AddToInventory(UItFo_Rice::StaticClass(), 3);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 8);
    default m_UniqueName = n"IO_NC_CHEST_LARESGUARDS";
}

UCLASS()
class UIO_NC_CHEST_PEASANTS_01: UIoChestDefault
{
    default m_UniqueName = n"IO_NC_CHEST_PEASANTS_01";
}

UCLASS()
class UIO_NC_CHEST_PEASANTS_02: UIoChestDefault
{
    default m_UniqueName = n"IO_NC_CHEST_PEASANTS_02";
}

UCLASS()
class UIO_NC_CHEST_PEASANTS_03: UIoChestDefault
{
    default m_UniqueName = n"IO_NC_CHEST_PEASANTS_03";
}

UCLASS()
class UIO_NC_CHEST_PEASANTS_04: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Booze::StaticClass(), 1);
    default AddToInventory(UItFo_Loaf::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Barbknife_01::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Cup_01::StaticClass(), 1);
    default m_UniqueName = n"IO_NC_CHEST_PEASANTS_04";
}

UCLASS()
class UIO_NC_CHEST_PEASANTS_05: UIoChestDefault
{
    default AddToInventory(UItFo_Rice::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Mug_01::StaticClass(), 1);
    default m_UniqueName = n"IO_NC_CHEST_PEASANTS_05";
}

UCLASS()
class UIO_NC_CHEST_PEASANTS_06: UIoChestDefault
{
    default m_UniqueName = n"IO_NC_CHEST_PEASANTS_06";
}

UCLASS()
class UIO_NC_CHEST_PEASANTS_07: UIoChestDefault
{
    default AddToInventory(UItFo_Muttonraw::StaticClass(), 2);
    default AddToInventory(UItFo_Potion_Water_01::StaticClass(), 3);
    default m_UniqueName = n"IO_NC_CHEST_PEASANTS_07";
}

UCLASS()
class UIO_NC_CHEST_PEASANTS_08: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Booze::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Brush::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Plate_01::StaticClass(), 1);
    default m_UniqueName = n"IO_NC_CHEST_PEASANTS_08";
}

UCLASS()
class UIO_NC_CHEST_PEASANTS_09: UIoChestDefault
{
    default m_UniqueName = n"IO_NC_CHEST_PEASANTS_09";
}

UCLASS()
class UIO_NC_CORPSE_01: UIoLootDefault
{
    default AddToInventory(UItAt_Ring_Weapon_01::StaticClass(), 1);
    default AddToInventory(UItMw_2H_Axe_Pickaxe::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 10);
    default m_UniqueName = n"IO_NC_CORPSE_01";
}

UCLASS()
class UIO_NC_CORPSE_02: UIoLootDefault
{
    default AddToInventory(UItAr_Scroll_BallLightning::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Mana_01::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 10);
    default m_UniqueName = n"IO_NC_CORPSE_02";
}

UCLASS()
class UIO_NC_CORPSE_BRAN: UIoLootDefault
{
    default AddToInventory(UItKe_Lockpick::StaticClass(), 3);
    default AddToInventory(UItFo_Potion_Beer::StaticClass(), 2);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 7);
    default AddToInventory(UItWr_Scroll_Bran_01::StaticClass(), 1);
    default m_UniqueName = n"IO_NC_CORPSE_BRAN";
}

UCLASS()
class UIO_NEF_CORPSE_01: UIoLootDefault
{
    default AddToInventory(UItAr_Scroll_TransformLizard::StaticClass(), 1);
    default AddToInventory(UItKe_Lockpick::StaticClass(), 2);
    default AddToInventory(UItMi_Smith_Leatherstraps::StaticClass(), 2);
    default AddToInventory(UItMw_1H_Torch::StaticClass(), 1);
    default m_UniqueName = n"IO_NEF_CORPSE_01";
}

UCLASS()
class UIO_OC_Chest_Canteen_17: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Beer::StaticClass(), 1);
    default AddToInventory(UItFo_Mutton_01::StaticClass(), 3);
    default AddToInventory(UItMi_Stuff_Barbknife_01::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 16);
    default m_UniqueName = n"IO_OC_Chest_Canteen_17";
}

UCLASS()
class UIO_OC_Chest_Canteen_18: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Beer::StaticClass(), 1);
    default AddToInventory(UItFo_Mutton_01::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Barbknife_01::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Cup_01::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 21);
    default m_UniqueName = n"IO_OC_Chest_Canteen_18";
}

UCLASS()
class UIO_OC_Chest_Canteen_19: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Beer::StaticClass(), 1);
    default AddToInventory(UItFo_Mutton_01::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Cup_01::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 12);
    default m_UniqueName = n"IO_OC_Chest_Canteen_19";
}

UCLASS()
class UIO_OCS_CHEST_01: UIoChestDefault
{
    default AddToInventory(UItKe_Lockpick::StaticClass(), 3);
    default AddToInventory(UItFo_Potion_Beer::StaticClass(), 2);
    default AddToInventory(UItMw_1H_Torch::StaticClass(), 2);
    default AddToInventory(UItAm_Arrow::StaticClass(), 10);
    default m_UniqueName = n"IO_OCS_CHEST_01";
}

UCLASS()
class UIO_OCS_CHEST_02: UIoChestDefault
{
    default AddToInventory(UItRw_Bow_Small_02::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Health_Quick::StaticClass(), 2);
    default AddToInventory(UItKe_Lockpick::StaticClass(), 4);
    default AddToInventory(UItMi_Smith_Willow::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 13);
    default m_UniqueName = n"IO_OCS_CHEST_02";
}

UCLASS()
class UIO_OCS_CORPSE_NEK: UIoLootDefault
{
    default AddToInventory(UItAt_Amulet_Neks::StaticClass(), 1);
    default AddToInventory(UItFo_Plants_Mushroom_01::StaticClass(), 2);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 10);
    default m_UniqueName = n"IO_OCS_CORPSE_NEK";
}

UCLASS()
class UIO_OG_CHEST_02: UIoChestDefault
{
    default AddToInventory(UItMi_Smith_Ironwood::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Leatherstraps::StaticClass(), 2);
    default AddToInventory(UItMi_Smith_Iron::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Alarmhorn::StaticClass(), 1);
    default m_UniqueName = n"IO_OG_CHEST_02";
}

UCLASS()
class UIO_OG_CHEST_03: UIoChestDefault
{
    default AddToInventory(UItAt_Ring_Power::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Health_02::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Mana_02::StaticClass(), 1);
    default AddToInventory(UItAm_Bolt::StaticClass(), 4);
    default AddToInventory(UItAm_Arrow::StaticClass(), 7);
    default m_UniqueName = n"IO_OG_CHEST_03";
}

UCLASS()
class UIO_OG_CORPSE_01: UIoLootDefault
{
    default AddToInventory(UItKe_OrcGraveyardPiece_01::StaticClass(), 1);
    default m_UniqueName = n"IO_OG_CORPSE_01";
}

UCLASS()
class UIO_OG_CORPSE_02: UIoLootDefault
{
    default AddToInventory(UItKe_OrcGraveyardPiece_02::StaticClass(), 1);
    default m_UniqueName = n"IO_OG_CORPSE_02";
}

UCLASS()
class UIO_OG_MUMMY_01: UIoLootDefault
{
    default AddToInventory(UItAt_Amulet_OrcMummy::StaticClass(), 1);
    default m_UniqueName = n"IO_OG_MUMMY_01";
}

UCLASS()
class UIO_OG_MUMMY_02: UIoLootDefault
{
    default AddToInventory(UItFo_Potion_Health_02::StaticClass(), 1);
    default AddToInventory(UItAt_Amulet_OrcMummy::StaticClass(), 1);
    default m_UniqueName = n"IO_OG_MUMMY_02";
}

UCLASS()
class UIO_OG_MUMMY_03: UIoLootDefault
{
    default AddToInventory(UItAt_Amulet_OrcMummy::StaticClass(), 1);
    default m_UniqueName = n"IO_OG_MUMMY_03";
}

UCLASS()
class UIO_OG_MUMMY_04: UIoLootDefault
{
    default AddToInventory(UItAr_Scroll_Heal::StaticClass(), 1);
    default AddToInventory(UItAt_Amulet_OrcMummy::StaticClass(), 1);
    default m_UniqueName = n"IO_OG_MUMMY_04";
}

UCLASS()
class UIO_OG_MUMMY_05: UIoLootDefault
{
    default AddToInventory(UItAt_Amulet_OrcMummy::StaticClass(), 1);
    default m_UniqueName = n"IO_OG_MUMMY_05";
}

UCLASS()
class UIO_OG_MUMMY_06: UIoLootDefault
{
    default AddToInventory(UItFo_Potion_Mana_01::StaticClass(), 1);
    default AddToInventory(UItAt_Amulet_OrcMummy::StaticClass(), 1);
    default m_UniqueName = n"IO_OG_MUMMY_06";
}

UCLASS()
class UIO_OG_MUMMY_07: UIoLootDefault
{
    default AddToInventory(UItAt_Amulet_OrcMummy::StaticClass(), 1);
    default m_UniqueName = n"IO_OG_MUMMY_07";
}

UCLASS()
class UIO_OG_MUMMY_08: UIoLootDefault
{
    default AddToInventory(UItAt_Amulet_OrcMummy::StaticClass(), 1);
    default m_UniqueName = n"IO_OG_MUMMY_08";
}

UCLASS()
class UIO_OG_MUMMY_09: UIoLootDefault
{
    default AddToInventory(UItAt_Amulet_OrcMummy::StaticClass(), 1);
    default m_UniqueName = n"IO_OG_MUMMY_09";
}

UCLASS()
class UIO_OG_MUMMY_10: UIoLootDefault
{
    default AddToInventory(UItFo_Potion_Mana_02::StaticClass(), 1);
    default AddToInventory(UItAt_Amulet_OrcMummy::StaticClass(), 1);
    default m_UniqueName = n"IO_OG_MUMMY_10";
}

UCLASS()
class UIO_OG_MUMMY_11: UIoLootDefault
{
    default AddToInventory(UItAr_Scroll_FireBolt::StaticClass(), 1);
    default AddToInventory(UItAt_Amulet_OrcMummy::StaticClass(), 1);
    default m_UniqueName = n"IO_OG_MUMMY_11";
}

UCLASS()
class UIO_OG_MUMMY_12: UIoLootDefault
{
    default AddToInventory(UItAm_Arrow::StaticClass(), 4);
    default AddToInventory(UItAm_Bolt::StaticClass(), 3);
    default AddToInventory(UItAt_Amulet_OrcMummy::StaticClass(), 1);
    default m_UniqueName = n"IO_OG_MUMMY_12";
}

UCLASS()
class UIO_OG_MUMMY_13: UIoLootDefault
{
    default AddToInventory(UItAt_Amulet_OrcMummy::StaticClass(), 1);
    default m_UniqueName = n"IO_OG_MUMMY_13";
}

UCLASS()
class UIO_OG_MUMMY_14: UIoLootDefault
{
    default AddToInventory(UItAt_Ring_Weapon_02::StaticClass(), 1);
    default AddToInventory(UItAt_Amulet_OrcMummy::StaticClass(), 1);
    default m_UniqueName = n"IO_OG_MUMMY_14";
}

UCLASS()
class UIO_OG_MUMMY_15: UIoLootDefault
{
    default AddToInventory(UItMi_Smith_Gold::StaticClass(), 1);
    default AddToInventory(UItMi_Inscription_Parchment::StaticClass(), 3);
    default AddToInventory(UItAt_Amulet_OrcMummy::StaticClass(), 1);
    default m_UniqueName = n"IO_OG_MUMMY_15";
}

UCLASS()
class UIO_OG_MUMMY_16: UIoLootDefault
{
    default AddToInventory(UItAt_Amulet_OrcMummy::StaticClass(), 1);
    default m_UniqueName = n"IO_OG_MUMMY_16";
}

UCLASS()
class UIO_OG_MUMMY_17: UIoLootDefault
{
    default AddToInventory(UItAt_Amulet_OrcMummy::StaticClass(), 1);
    default m_UniqueName = n"IO_OG_MUMMY_17";
}

UCLASS()
class UIO_OG_MUMMY_18: UIoLootDefault
{
    default AddToInventory(UItAt_Amulet_OrcMummy::StaticClass(), 1);
    default AddToInventory(UItAm_Bolt::StaticClass(), 5);
    default m_UniqueName = n"IO_OG_MUMMY_18";
}

UCLASS()
class UIO_OG_MUMMY_19: UIoLootDefault
{
    default AddToInventory(UItAt_Amulet_OrcMummy::StaticClass(), 1);
    default m_UniqueName = n"IO_OG_MUMMY_19";
}

UCLASS()
class UIO_OG_MUMMY_20: UIoLootDefault
{
    default AddToInventory(UItAr_Scroll_Heal::StaticClass(), 1);
    default AddToInventory(UItAt_Amulet_OrcMummy::StaticClass(), 1);
    default m_UniqueName = n"IO_OG_MUMMY_20";
}

UCLASS()
class UIO_OG_MUMMY_21: UIoLootDefault
{
    default AddToInventory(UItAt_Amulet_OrcMummy::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 4);
    default m_UniqueName = n"IO_OG_MUMMY_21";
}

UCLASS()
class UIO_OG_MUMMY_22: UIoLootDefault
{
    default AddToInventory(UItAt_Amulet_OrcMummy::StaticClass(), 1);
    default m_UniqueName = n"IO_OG_MUMMY_22";
}

UCLASS()
class UIO_OG_MUMMY_23: UIoLootDefault
{
    default AddToInventory(UItAt_Amulet_OrcMummy::StaticClass(), 1);
    default AddToInventory(UItMw_1H_Torch::StaticClass(), 1);
    default m_UniqueName = n"IO_OG_MUMMY_23";
}

UCLASS()
class UIO_OG_MUMMY_24: UIoLootDefault
{
    default AddToInventory(UItAt_Amulet_OrcMummy::StaticClass(), 1);
    default m_UniqueName = n"IO_OG_MUMMY_24";
}

UCLASS()
class UIO_OG_MUMMY_25: UIoLootDefault
{
    default AddToInventory(UItAt_Amulet_OrcMummy::StaticClass(), 1);
    default m_UniqueName = n"IO_OG_MUMMY_25";
}

UCLASS()
class UIO_OG_MUMMY_26: UIoLootDefault
{
    default AddToInventory(UItFo_Potion_Mana_01::StaticClass(), 1);
    default AddToInventory(UItAt_Amulet_OrcMummy::StaticClass(), 1);
    default m_UniqueName = n"IO_OG_MUMMY_26";
}

UCLASS()
class UIO_OG_MUMMY_27: UIoLootDefault
{
    default AddToInventory(UItAt_Amulet_OrcMummy::StaticClass(), 1);
    default m_UniqueName = n"IO_OG_MUMMY_27";
}

UCLASS()
class UIO_OG_MUMMY_28: UIoLootDefault
{
    default AddToInventory(UItAt_Amulet_OrcMummy::StaticClass(), 1);
    default AddToInventory(UItAr_Scroll_Light::StaticClass(), 1);
    default AddToInventory(UItMi_Oldcoin_01::StaticClass(), 10);
    default m_UniqueName = n"IO_OG_MUMMY_28";
}

UCLASS()
class UIO_OG_MUMMY_29: UIoLootDefault
{
    default AddToInventory(UItAt_Amulet_OrcMummy::StaticClass(), 1);
    default AddToInventory(UItAm_Arrow::StaticClass(), 3);
    default m_UniqueName = n"IO_OG_MUMMY_29";
}

UCLASS()
class UIO_OG_MUMMY_30: UIoLootDefault
{
    default AddToInventory(UItAt_Amulet_OrcMummy::StaticClass(), 1);
    default m_UniqueName = n"IO_OG_MUMMY_30";
}

UCLASS()
class UIO_OG_MUMMY_31: UIoLootDefault
{
    default AddToInventory(UItAt_Harpy_01::StaticClass(), 4);
    default AddToInventory(UItAt_Amulet_OrcMummy::StaticClass(), 1);
    default m_UniqueName = n"IO_OG_MUMMY_31";
}

UCLASS()
class UIO_OG_MUMMY_32: UIoLootDefault
{
    default AddToInventory(UItAt_Amulet_OrcMummy::StaticClass(), 1);
    default AddToInventory(UItMi_Oldcoin_01::StaticClass(), 6);
    default m_UniqueName = n"IO_OG_MUMMY_32";
}

UCLASS()
class UIO_OG_MUMMY_33: UIoLootDefault
{
    default AddToInventory(UItAt_Amulet_OrcMummy::StaticClass(), 1);
    default m_UniqueName = n"IO_OG_MUMMY_33";
}

UCLASS()
class UIO_OG_MUMMY_34: UIoLootDefault
{
    default AddToInventory(UItAt_Amulet_OrcMummy::StaticClass(), 1);
    default m_UniqueName = n"IO_OG_MUMMY_34";
}

UCLASS()
class UIO_OG_MUMMY_35: UIoLootDefault
{
    default AddToInventory(UItAt_Amulet_OrcMummy::StaticClass(), 1);
    default AddToInventory(UItMw_1H_Torch::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 5);
    default m_UniqueName = n"IO_OG_MUMMY_35";
}

UCLASS()
class UIO_OG_MUMMY_36: UIoLootDefault
{
    default AddToInventory(UItAt_Amulet_OrcMummy::StaticClass(), 1);
    default m_UniqueName = n"IO_OG_MUMMY_36";
}

UCLASS()
class UIO_OG_MUMMY_37: UIoLootDefault
{
    default AddToInventory(UItFo_Potion_Strength_01::StaticClass(), 1);
    default AddToInventory(UItAt_Amulet_OrcMummy::StaticClass(), 1);
    default m_UniqueName = n"IO_OG_MUMMY_37";
}

UCLASS()
class UIO_OG_MUMMY_38: UIoLootDefault
{
    default AddToInventory(UItAt_Amulet_OrcMummy::StaticClass(), 1);
    default m_UniqueName = n"IO_OG_MUMMY_38";
}

UCLASS()
class UIO_OG_MUMMY_40: UIoLootDefault
{
    default AddToInventory(UItMi_Smith_Obsidian::StaticClass(), 1);
    default AddToInventory(UItAt_Amulet_OrcMummy::StaticClass(), 1);
    default m_UniqueName = n"IO_OG_MUMMY_40";
}

UCLASS()
class UIO_OM_CHEST_01: UIoChestDefault
{
    default AddToInventory(UItWr_Book_Bestiary_02::StaticClass(), 1);
    default AddToInventory(UItMw_1H_Mace_Sledgehammer_01::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Willow::StaticClass(), 1);
    default AddToInventory(UItAt_Harpy_01::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 12);
    default m_UniqueName = n"IO_OM_CHEST_01";
}

UCLASS()
class UIO_OM_CHEST_ALBERTO_02: UIoChestDefault
{
    default AddToInventory(UItFo_Apple::StaticClass(), 1);
    default m_UniqueName = n"IO_OM_CHEST_ALBERTO_02";
}

UCLASS()
class UIO_OM_CORPSE_01: UIoLootDefault
{
    default AddToInventory(UItAt_Ring_Fire_01::StaticClass(), 1);
    default AddToInventory(UItKe_Lockpick::StaticClass(), 2);
    default AddToInventory(UItMi_Smith_Leatherstraps::StaticClass(), 3);
    default m_UniqueName = n"IO_OM_CORPSE_01";
}

UCLASS()
class UIO_OM_CORPSE_02: UIoLootDefault
{
    default AddToInventory(UItAt_Ring_Skill_01::StaticClass(), 1);
    default AddToInventory(UItKe_Lockpick::StaticClass(), 2);
    default AddToInventory(UItMi_Smith_Iron::StaticClass(), 1);
    default AddToInventory(UItMi_Oldcoin_01::StaticClass(), 9);
    default m_UniqueName = n"IO_OM_CORPSE_02";
}

UCLASS()
class UIO_OTT_Chest_01: UIoChestDefault
{
    default AddToInventory(UItKe_Lockpick::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Beer::StaticClass(), 2);
    default AddToInventory(UItMw_1H_Torch::StaticClass(), 1);
    default m_UniqueName = n"IO_OTT_Chest_01";
}

UCLASS()
class UIO_OTT_Chest_02: UIoChestDefault
{
    default AddToInventory(UItAr_Scroll_Sleep::StaticClass(), 3);
    default AddToInventory(UItFo_Potion_Health_01::StaticClass(), 1);
    default m_UniqueName = n"IO_OTT_Chest_02";
}

UCLASS()
class UIO_OTT_Chest_04: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Health_02::StaticClass(), 2);
    default AddToInventory(UItMi_Stuff_Alarmhorn::StaticClass(), 1);
    default AddToInventory(UItAm_Arrow::StaticClass(), 8);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 13);
    default m_UniqueName = n"IO_OTT_Chest_04";
}

UCLASS()
class UIO_OTT_Chest_07: UIoChestDefault
{
    default AddToInventory(UItAr_Scroll_StormOfFire::StaticClass(), 2);
    default AddToInventory(UItMi_Smith_Ironwood::StaticClass(), 1);
    default AddToInventory(UItAt_Harpy_01::StaticClass(), 10);
    default m_UniqueName = n"IO_OTT_Chest_07";
}

UCLASS()
class UIO_OTT_Chest_08: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Water_01::StaticClass(), 2);
    default AddToInventory(UItFo_Onion::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Brush::StaticClass(), 1);
    default m_UniqueName = n"IO_OTT_Chest_08";
}

UCLASS()
class UIO_OTT_CHEST_10: UIoChestDefault
{
    default AddToInventory(UItKe_Lockpick::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Beer::StaticClass(), 2);
    default AddToInventory(UItMw_1H_Torch::StaticClass(), 1);
    default m_UniqueName = n"IO_OTT_CHEST_10";
}

UCLASS()
class UIO_SA_MUMMY_01: UIoLootDefault
{
    default AddToInventory(UItAt_Ring_Magicfire_02::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 23);
    default m_UniqueName = n"IO_SA_MUMMY_01";
}

UCLASS()
class UIO_SA_MUMMY_03: UIoLootDefault
{
    default AddToInventory(UItMw_1H_Mace_War_02::StaticClass(), 1);
    default AddToInventory(UItAm_Arrow::StaticClass(), 15);
    default m_UniqueName = n"IO_SA_MUMMY_03";
}

UCLASS()
class UIO_SA_MUMMY_04: UIoLootDefault
{
    default AddToInventory(UItAr_Scroll_Telekinesis::StaticClass(), 3);
    default AddToInventory(UItMi_Oldcoin_01::StaticClass(), 2);
    default m_UniqueName = n"IO_SA_MUMMY_04";
}

UCLASS()
class UIO_SC_CHEST_CAINE: UIoChestDefault
{
    default m_UniqueName = n"IO_SC_CHEST_CAINE";
}

UCLASS()
class UIO_SC_CHEST_DEADNOVICE: UIoChestDefault
{
    default AddToInventory(UItAr_Scroll_FistOfWind::StaticClass(), 1);
    default AddToInventory(UItMi_Joint_02::StaticClass(), 1);
    default AddToInventory(UItAr_Scroll_Heal::StaticClass(), 1);
    default AddToInventory(UItMi_Oldcoin_01::StaticClass(), 10);
    default m_UniqueName = n"IO_SC_CHEST_DEADNOVICE";
}

UCLASS()
class UIO_SC_CHEST_NOVICES: UIoChestDefault
{
    default AddToInventory(UItMi_Smith_Leatherstraps::StaticClass(), 3);
    default AddToInventory(UItMi_Joint_01::StaticClass(), 3);
    default AddToInventory(UItFo_Potion_Water_01::StaticClass(), 3);
    default AddToInventory(UItFo_Carrot::StaticClass(), 2);
    default AddToInventory(UItFo_Cabbage::StaticClass(), 4);
    default AddToInventory(UItFo_Onion::StaticClass(), 4);
    default m_UniqueName = n"IO_SC_CHEST_NOVICES";
}

UCLASS()
class UIO_SNT_CORPSE_WATERFALL_01: UIoLootDefault
{
    default AddToInventory(UItKe_Lockpick::StaticClass(), 3);
    default AddToInventory(UItMi_Smith_Oak::StaticClass(), 2);
    default AddToInventory(UItMi_Smith_Willow::StaticClass(), 4);
    default AddToInventory(UItAt_Harpy_01::StaticClass(), 5);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 14);
    default m_UniqueName = n"IO_SNT_CORPSE_WATERFALL_01";
}

UCLASS()
class UIO_SNT_Chest_01: UIoChestDefault
{
    default AddToInventory(UItMS_SunkenTowerStone_01::StaticClass(), 1);
    default AddToInventory(UItAr_Scroll_FireBall::StaticClass(), 1);
    default AddToInventory(UItAr_Scroll_StormFist::StaticClass(), 1);
    default AddToInventory(UItAr_Scroll_IceBlock::StaticClass(), 1);
    default m_UniqueName = n"IO_SNT_Chest_01";
}

UCLASS()
class UIO_SNT_Chest_02: UIoChestDefault
{
    default AddToInventory(UItMw_1H_Axe_03::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Mana_03::StaticClass(), 1);
    default AddToInventory(UItAt_Harpy_01::StaticClass(), 7);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 32);
    default m_UniqueName = n"IO_SNT_Chest_02";
}

UCLASS()
class UIO_SNT_Chest_03: UIoChestDefault
{
    default AddToInventory(UItAr_Scroll_FireRain::StaticClass(), 1);
    default AddToInventory(UItAm_Arrow::StaticClass(), 9);
    default m_UniqueName = n"IO_SNT_Chest_03";
}

UCLASS()
class UIO_SNT_Chest_07: UIoChestDefault
{
    default AddToInventory(UItAr_Scroll_TransformRazor::StaticClass(), 1);
    default AddToInventory(UItMi_Inscription_Parchment::StaticClass(), 3);
    default AddToInventory(UItMi_Smith_Ironwood::StaticClass(), 2);
    default AddToInventory(UItMi_Smith_Iron::StaticClass(), 3);
    default AddToInventory(UItMi_Smith_Leatherstraps::StaticClass(), 5);
    default m_UniqueName = n"IO_SNT_Chest_07";
}

UCLASS()
class UIO_SNT_Chest_08: UIoChestDefault
{
    default AddToInventory(UItAt_Shadow_01::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Cup_02::StaticClass(), 1);
    default AddToInventory(UItAm_Arrow::StaticClass(), 10);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 21);
    default m_UniqueName = n"IO_SNT_Chest_08";
}

UCLASS()
class UIO_SW_CHEST_04: UIoChestDefault
{
    default AddToInventory(UItAr_Scroll_Telekinesis::StaticClass(), 2);
    default AddToInventory(UItMi_Inscription_Parchment::StaticClass(), 2);
    default AddToInventory(UItFo_Potion_Mana_01::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 7);
    default m_UniqueName = n"IO_SW_CHEST_04";
}

UCLASS()
class UIO_SW_CHEST_05: UIoChestDefault
{
    default AddToInventory(UItAr_Scroll_IceBlock::StaticClass(), 1);
    default AddToInventory(UItKe_Lockpick::StaticClass(), 6);
    default AddToInventory(UItMi_Alchemy_Flask::StaticClass(), 2);
    default AddToInventory(UItAm_Arrow::StaticClass(), 5);
    default AddToInventory(UItMi_Oldcoin_01::StaticClass(), 10);
    default m_UniqueName = n"IO_SW_CHEST_05";
}

UCLASS()
class UIO_SW_CHEST_06: UIoChestDefault
{
    default AddToInventory(UItAr_Scroll_BallLightning::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Mana_01::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Leatherstraps::StaticClass(), 4);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 11);
    default m_UniqueName = n"IO_SW_CHEST_06";
}

UCLASS()
class UIO_SW_CHEST_08: UIoChestDefault
{
    default AddToInventory(UItMi_Smith_Obsidian::StaticClass(), 1);
    default AddToInventory(UItAr_Scroll_IceBolt::StaticClass(), 2);
    default AddToInventory(UItMi_Smith_Leatherstraps::StaticClass(), 3);
    default AddToInventory(UItMi_Oldcoin_01::StaticClass(), 8);
    default m_UniqueName = n"IO_SW_CHEST_08";
}

UCLASS()
class UIO_SW_CHEST_09: UIoChestDefault
{
    default AddToInventory(UItMi_Smith_Gold::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Oak::StaticClass(), 3);
    default AddToInventory(UItKe_Lockpick::StaticClass(), 4);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 9);
    default m_UniqueName = n"IO_SW_CHEST_09";
}

UCLASS()
class UIO_SW_CHEST_10: UIoChestDefault
{
    default AddToInventory(UItKe_Lockpick::StaticClass(), 6);
    default AddToInventory(UItMw_1H_Torch::StaticClass(), 6);
    default AddToInventory(UItAm_Bolt::StaticClass(), 5);
    default AddToInventory(UItAm_Arrow::StaticClass(), 8);
    default m_UniqueName = n"IO_SW_CHEST_10";
}

UCLASS()
class UIO_SW_CHEST_11: UIoChestDefault
{
    default AddToInventory(UItAr_Scroll_Telekinesis::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Ruby::StaticClass(), 1);
    default AddToInventory(UItKe_Lockpick::StaticClass(), 3);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 12);
    default AddToInventory(UItMi_Oldcoin_01::StaticClass(), 8);
    default m_UniqueName = n"IO_SW_CHEST_11";
}

UCLASS()
class UIO_TA_Chest_01: UIoChestDefault
{
    default AddToInventory(UItAt_Ring_Strong_01::StaticClass(), 1);
    default AddToInventory(UItAr_Scroll_TransformMolerat::StaticClass(), 1);
    default AddToInventory(UItMi_Inscription_Parchment::StaticClass(), 2);
    default m_UniqueName = n"IO_TA_Chest_01";
}

UCLASS()
class UIO_TA_Chest_02: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Strongbeer::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Leatherstraps::StaticClass(), 4);
    default AddToInventory(UItMi_Smith_Willow::StaticClass(), 3);
    default AddToInventory(UItMw_1H_Torch::StaticClass(), 1);
    default m_UniqueName = n"IO_TA_Chest_02";
}

UCLASS()
class UIO_TA_Chest_03: UIoChestDefault
{
    default m_UniqueName = n"IO_TA_Chest_03";
}

UCLASS()
class UIO_TA_Chest_04: UIoChestDefault
{
    default AddToInventory(UItMi_Stuff_Pan_01::StaticClass(), 1);
    default AddToInventory(UItMi_Wedel::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Brush::StaticClass(), 2);
    default m_UniqueName = n"IO_TA_Chest_04";
}

UCLASS()
class UIO_TA_Chest_05: UIoChestDefault
{
    default AddToInventory(UItMi_Joint_02::StaticClass(), 1);
    default AddToInventory(UItMi_Alchemy_Moleratlubric_01::StaticClass(), 1);
    default AddToInventory(UItMi_Alchemy_Flask::StaticClass(), 3);
    default m_UniqueName = n"IO_TA_Chest_05";
}

UCLASS()
class UIO_TA_Chest_06: UIoChestDefault
{
    default AddToInventory(UItRw_Bow_Small_04::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Willow::StaticClass(), 4);
    default AddToInventory(UItAt_Harpy_01::StaticClass(), 6);
    default m_UniqueName = n"IO_TA_Chest_06";
}

UCLASS()
class UIO_TA_Chest_07: UIoChestDefault
{
    default AddToInventory(UItAr_Scroll_SummonSkeletons::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Mana_03::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Health_03::StaticClass(), 1);
    default AddToInventory(UItMi_Alchemy_Sulphur_01::StaticClass(), 2);
    default AddToInventory(UItMi_Alchemy_Salt_01::StaticClass(), 2);
    default AddToInventory(UItMi_Alchemy_Flask::StaticClass(), 3);
    default m_UniqueName = n"IO_TA_Chest_07";
}

class UIO_TA_Chest_08: UIoChestDefault
{
    default AddToInventory(UItAr_Rune_FireRain::StaticClass(), 1);
    default AddToInventory(UItAr_Scroll_Light::StaticClass(), 2);
    default AddToInventory(UItAr_Scroll_Heal::StaticClass(), 2);
    default AddToInventory(UItMi_Inscription_Parchment::StaticClass(), 4);
    default m_UniqueName = n"IO_TA_Chest_08";
}

UCLASS()
class UIO_TC_CHEST_01: UIoChestDefault
{
    default AddToInventory(UItAr_Rune_Telekinesis::StaticClass(), 1);
    default AddToInventory(UItAr_Scroll_Telekinesis::StaticClass(), 1);
    default AddToInventory(UItAt_Amulet_Magic_02::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Mana_01::StaticClass(), 2);
    default AddToInventory(UItMi_Inscription_Parchment::StaticClass(), 3);
    default AddToInventory(UItAr_Scroll_Heal::StaticClass(), 2);
    default m_UniqueName = n"IO_TC_CHEST_01";
}

UCLASS()
class UIO_TST_Chest_Forge_01: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Mana_03::StaticClass(), 2);
    default AddToInventory(UItFo_Potion_Health_03::StaticClass(), 2);
    default AddToInventory(UItMi_Smith_Petrifiedwood::StaticClass(), 2);
    default AddToInventory(UItMi_Smith_Ironwood::StaticClass(), 3);
    default AddToInventory(UItMi_Smith_Steel::StaticClass(), 4);
    default AddToInventory(UItMi_Smith_Gold::StaticClass(), 4);
    default AddToInventory(UItMi_Smith_Oak::StaticClass(), 7);
    default AddToInventory(UItMi_Smith_Willow::StaticClass(), 11);
    default AddToInventory(UItMi_Smith_Iron::StaticClass(), 10);
    default AddToInventory(UItMi_Smith_Leatherstraps::StaticClass(), 13);
    default AddToInventory(UItAt_Harpy_01::StaticClass(), 16);
    default AddToInventory(UItAm_Bolt::StaticClass(), 10);
    default AddToInventory(UItAm_Arrow::StaticClass(), 17);
    default m_UniqueName = n"IO_TST_Chest_Forge_01";
}

UCLASS()
class UIO_TST_Chest_Lava_Stronghold_01: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Dex_03::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Health_01::StaticClass(), 1);
    default m_UniqueName = n"IO_TST_Chest_Lava_Stronghold_01";
}

UCLASS()
class UIO_TST_Chest_Lava_Stronghold_02: UIoChestDefault
{
    default AddToInventory(UItAt_Amulet_Magicfire::StaticClass(), 1);
    default AddToInventory(UItAr_Scroll_FireRain::StaticClass(), 1);
    default AddToInventory(UItAr_Scroll_StormOfFire::StaticClass(), 2);
    default AddToInventory(UItMi_Smith_Obsidian::StaticClass(), 1);
    default AddToInventory(UItMi_Inscription_Parchment::StaticClass(), 5);
    default m_UniqueName = n"IO_TST_Chest_Lava_Stronghold_02";
}

UCLASS()
class UIO_TST_Chest_Lava_Stronghold_Demon: UIoChestDefault
{
    default AddToInventory(UItAt_Amulet_Protection::StaticClass(), 1);
    default AddToInventory(UItAr_Scroll_SummonArmyOfDarkness::StaticClass(), 1);
    default m_UniqueName = n"IO_TST_Chest_Lava_Stronghold_Demon";
}

UCLASS()
class UIO_TST_Chest_Slave_01: UIoChestDefault
{
    default AddToInventory(UItAr_Scroll_Control::StaticClass(), 1);
    default AddToInventory(UItAr_Scroll_Heal::StaticClass(), 4);
    default AddToInventory(UItFo_Plants_Darkshade::StaticClass(), 3);
    default AddToInventory(UItMw_1H_Torch::StaticClass(), 4);
    default AddToInventory(UItAm_Bolt::StaticClass(), 6);
    default AddToInventory(UItAm_Arrow::StaticClass(), 8);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 30);
    default m_UniqueName = n"IO_TST_Chest_Slave_01";
}

UCLASS()
class UIO_TST_Chest_Sleeper_01: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Mana_03::StaticClass(), 3);
    default AddToInventory(UItFo_Potion_Health_03::StaticClass(), 4);
    default m_UniqueName = n"IO_TST_Chest_Sleeper_01";
}

UCLASS()
class UIO_TST_Chest_Sleeper_02: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Mana_03::StaticClass(), 3);
    default AddToInventory(UItFo_Potion_Health_03::StaticClass(), 5);
    default m_UniqueName = n"IO_TST_Chest_Sleeper_02";
}

UCLASS()
class UIO_WH_CHEST_BALNETBEK: UIoChestDefault
{
    default AddToInventory(UItAt_Swampshark_03::StaticClass(), 1);
    default AddToInventory(UItFo_Plants_Ravenherb_02::StaticClass(), 2);
    default AddToInventory(UItMi_Plants_Swampherb_01::StaticClass(), 1);
    default m_UniqueName = n"IO_WH_CHEST_BALNETBEK";
}

UCLASS()
class UIO_WH_CHEST_BALOR: UIoChestDefault
{
    default AddToInventory(UItMi_Joint_02::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Leatherstraps::StaticClass(), 2);
    default AddToInventory(UItAt_Bloodfly_01::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 7);
    default m_UniqueName = n"IO_WH_CHEST_BALOR";
}

UCLASS()
class UIO_WH_CHEST_SHRAT: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Beer::StaticClass(), 1);
    default AddToInventory(UItMw_1H_Torch::StaticClass(), 1);
    default m_UniqueName = n"IO_WH_CHEST_SHRAT";
}

UCLASS()
class UIO_MF_CHEST_11: UIoChestDefault
{
    default AddToInventory(URyl_Armor::StaticClass(), 1);
    default AddToInventory(UItMi_Inscription_Parchment::StaticClass(), 3);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 12);
    default m_UniqueName = n"IO_MF_CHEST_11";
    default m_Keys.Add(n"ItKe_Berg_01");
}

UCLASS()
class UIO_OC_CHEST_ARMORY_01: UIoChestDefault
{
    default AddToInventory(UItRw_Bow_Long_05::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Oak::StaticClass(), 4);
    default AddToInventory(UItAt_Harpy_01::StaticClass(), 6);
    default m_UniqueName = n"IO_OC_CHEST_ARMORY_01";
    default m_Keys.Add(n"ItKe_Gomez_01");
    default m_Lock = n"OC_Chest_Armory_01_Lock";
    default m_LockDifficulty = 7;
}

UCLASS()
class UIO_OC_CHEST_ARMORY_02: UIoChestDefault
{
    default AddToInventory(UItMw_1H_Sword_Bastard_01::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Steel::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Ironwood::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Leatherstraps::StaticClass(), 7);
    default AddToInventory(UItMi_Smith_Willow::StaticClass(), 5);
    default m_UniqueName = n"IO_OC_CHEST_ARMORY_02";
    default m_Keys.Add(n"ItKe_Gomez_01");
    default m_Lock = n"OC_Chest_Armory_02_Lock";
    default m_LockDifficulty = 7;
}

UCLASS()
class UIO_OC_CHEST_ARMORY_03: UIoChestDefault
{
    default AddToInventory(UItRw_Crossbow_01::StaticClass(), 1);
    default AddToInventory(UItAm_Bolt::StaticClass(), 6);
    default AddToInventory(UItAt_Harpy_01::StaticClass(), 8);
    default m_UniqueName = n"IO_OC_CHEST_ARMORY_03";
    default m_Keys.Add(n"ItKe_Gomez_01");
    default m_Lock = n"OC_Chest_Armory_03_Lock";
    default m_LockDifficulty = 7;
}

UCLASS()
class UIO_OC_CHEST_ARMORY_04: UIoChestDefault
{
    default AddToInventory(UItMw_2H_Axe_Old_01::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Iron::StaticClass(), 3);
    default m_UniqueName = n"IO_OC_CHEST_ARMORY_04";
    default m_Keys.Add(n"ItKe_Gomez_01");
    default m_Lock = n"OC_Chest_Armory_04_Lock";
    default m_LockDifficulty = 7;
}

UCLASS()
class UIO_OC_CHEST_GOMEZ_01: UIoChestDefault
{
    default AddToInventory(UItAt_Amulet_Fire::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Strength_02::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Health_03::StaticClass(), 1);
    default AddToInventory(UItMi_Joint_02::StaticClass(), 2);
    default m_UniqueName = n"IO_OC_CHEST_GOMEZ_01";
    default m_Keys.Add(n"ItKe_Gomez_01");
    default m_Lock = n"OC_Chest_Gomez_01_Lock";
    default m_LockDifficulty = 7;
}

UCLASS()
class UIO_OC_CHEST_GOMEZ_02: UIoChestDefault
{
    default AddToInventory(UOre_Armor_M::StaticClass(), 1);
    default m_UniqueName = n"IO_OC_CHEST_GOMEZ_02";
    default m_Keys.Add(n"ItKe_Gomez_01");
}

UCLASS()
class UIO_OM_CHEST_AARON: UIoChestDefault
{
    default AddToInventory(UItKe_Lockpick::StaticClass(), 7);
    default AddToInventory(UItAr_Scroll_Heal::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Beer::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 9);
    default m_UniqueName = n"IO_OM_CHEST_AARON";
    default m_Keys.Add(n"ItKe_Om_02");
    default m_Lock = n"OM_Chest_Aaron_Lock";
    default m_LockDifficulty = 7;
}

UCLASS()
class UIO_OM_CHEST_ULBERT_01: UIoChestDefault
{
    default AddToInventory(UItMi_Smith_Gold::StaticClass(), 1);
    default AddToInventory(UItFo_Mutton_02::StaticClass(), 3);
    default AddToInventory(UItFo_Loaf::StaticClass(), 3);
    default AddToInventory(UItFo_Potion_Beer::StaticClass(), 4);
    default AddToInventory(UItFo_Apple::StaticClass(), 7);
    default m_UniqueName = n"IO_OM_CHEST_ULBERT_01";
    default m_Keys.Add(n"ItKe_Om_03");
    default m_Lock = n"OM_Chest_Ulbert_01_Lock";
    default m_LockDifficulty = 7;
}

UCLASS()
class UIO_OM_CHEST_ULBERT_02: UIoChestDefault
{
    default AddToInventory(UItMw_1H_Torch::StaticClass(), 5);
    default AddToInventory(UItMi_Smith_Iron::StaticClass(), 2);
    default AddToInventory(UItAr_Scroll_Light::StaticClass(), 2);
    default m_UniqueName = n"IO_OM_CHEST_ULBERT_02";
    default m_Keys.Add(n"ItKe_Om_03");
    default m_Lock = n"OM_Chest_Ulbert_02_Lock";
    default m_LockDifficulty = 6;
}

UCLASS()
class UIO_AM_CHEST_04: UIoChestDefault
{
    default AddToInventory(UItMw_1H_Sword_Short_04::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Gold::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Iron::StaticClass(), 1);
    default AddToInventory(UItAm_Arrow::StaticClass(), 3);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 10);
    default m_UniqueName = n"IO_AM_CHEST_04";
    default m_Lock = n"AM_Chest_04_Lock";
    default m_LockDifficulty = 4;
}

UCLASS()
class UIO_AM_CHEST_05: UIoChestDefault
{
    default AddToInventory(UItMw_2H_Staff_02::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Steel::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Gold::StaticClass(), 1);
    default AddToInventory(UItMi_Oldcoin_01::StaticClass(), 13);
    default m_UniqueName = n"IO_AM_CHEST_05";
}

UCLASS()
class UIO_AMR_CHEST_02: UIoChestDefault
{
    default AddToInventory(UItAr_Scroll_TransformSnapper::StaticClass(), 1);
    default AddToInventory(UItKe_Lockpick::StaticClass(), 1);
    default AddToInventory(UItAm_Arrow::StaticClass(), 9);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 11);
    default m_UniqueName = n"IO_AMR_CHEST_02";
}

UCLASS()
class UIO_AMR_CHEST_03: UIoChestDefault
{
    default AddToInventory(UItAr_Rune_IceBlock::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Mana_01::StaticClass(), 1);
    default AddToInventory(UItMi_Inscription_Parchment::StaticClass(), 3);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 21);
    default m_UniqueName = n"IO_AMR_CHEST_03";
}

UCLASS()
class UIO_AMR_CHEST_04: UIoChestDefault
{
    default AddToInventory(UItWr_Scroll_2H_Axe_Old_02::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Health_01::StaticClass(), 2);
    default AddToInventory(UItKe_Lockpick::StaticClass(), 1);
    default AddToInventory(UItAm_Arrow::StaticClass(), 9);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 16);
    default m_UniqueName = n"IO_AMR_CHEST_04";
    default m_Lock = n"AMR_Chest_04_Lock";
    default m_LockDifficulty = 4;
}

UCLASS()
class UIO_AMR_CHEST_06: UIoChestDefault
{
    default AddToInventory(UItAt_Amulet_Strong_01::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Strength_01::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Strongbeer::StaticClass(), 2);
    default AddToInventory(UItAm_Bolt::StaticClass(), 7);
    default AddToInventory(UItAm_Arrow::StaticClass(), 12);
    default m_UniqueName = n"IO_AMR_CHEST_06";
}

UCLASS()
class UIO_BC_CHEST_01: UIoChestDefault
{
    default AddToInventory(UItAt_Wolf_01::StaticClass(), 2);
    default AddToInventory(UItMi_Stuff_Mug_01::StaticClass(), 1);
    default AddToInventory(UItFo_Onion::StaticClass(), 1);
    default m_UniqueName = n"IO_BC_CHEST_01";
    default m_Lock = n"BC_Chest_01_Lock";
    default m_LockDifficulty = 1;
}

UCLASS()
class UIO_BC_CHEST_02: UIoChestDefault
{
    default AddToInventory(UItKe_Lockpick::StaticClass(), 1);
    default AddToInventory(UItMi_Coop::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 8);
    default m_UniqueName = n"IO_BC_CHEST_02";
    default m_Lock = n"BC_Chest_02_Lock";
    default m_LockDifficulty = 2;
}

UCLASS()
class UIO_BC_CHEST_03: UIoChestDefault
{
    default AddToInventory(UItMi_Stuff_Barbknife_01::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Cup_01::StaticClass(), 1);
    default AddToInventory(UItMw_1H_Torch::StaticClass(), 1);
    default AddToInventory(UItAm_Bolt::StaticClass(), 5);
    default m_UniqueName = n"IO_BC_CHEST_03";
    default m_Lock = n"BC_Chest_03_Lock";
    default m_LockDifficulty = 2;
}

UCLASS()
class UIO_BC_CHEST_04: UIoChestDefault
{
    default AddToInventory(UItMi_Joint_02::StaticClass(), 2);
    default AddToInventory(UItAm_Arrow::StaticClass(), 6);
    default m_UniqueName = n"IO_BC_CHEST_04";
    default m_Lock = n"BC_Chest_04_Lock";
    default m_LockDifficulty = 2;
}

UCLASS()
class UIO_BC_CHEST_05: UIoChestDefault
{
    default AddToInventory(UItKe_Lockpick::StaticClass(), 2);
    default AddToInventory(UItFo_Onion::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Plate_01::StaticClass(), 1);
    default m_UniqueName = n"IO_BC_CHEST_05";
    default m_Lock = n"BC_Chest_05_Lock";
    default m_LockDifficulty = 2;
}

UCLASS()
class UIO_BC_CHEST_07: UIoChestDefault
{
    default AddToInventory(UItAt_Scavenger_01::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Cup_01::StaticClass(), 1);
    default AddToInventory(UItAm_Arrow::StaticClass(), 3);
    default m_UniqueName = n"IO_BC_CHEST_07";
    default m_Lock = n"BC_Chest_07_Lock";
    default m_LockDifficulty = 1;
}

UCLASS()
class UIO_BC_CHEST_08: UIoChestDefault
{
    default AddToInventory(UItFo_Plants_Herb_02::StaticClass(), 2);
    default AddToInventory(UItFo_Potion_Beer::StaticClass(), 1);
    default AddToInventory(UItAt_Harpy_01::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 7);
    default m_UniqueName = n"IO_BC_CHEST_08";
    default m_Lock = n"BC_Chest_08_Lock";
    default m_LockDifficulty = 3;
}

UCLASS()
class UIO_BC_CHEST_09: UIoChestDefault
{
    default AddToInventory(UItMi_Stuff_Pan_01::StaticClass(), 1);
    default AddToInventory(UItAt_Harpy_01::StaticClass(), 1);
    default AddToInventory(UItFo_Carrot::StaticClass(), 4);
    default AddToInventory(UItMi_Stuff_Brush::StaticClass(), 1);
    default m_UniqueName = n"IO_BC_CHEST_09";
    default m_Lock = n"BC_Chest_09_Lock";
    default m_LockDifficulty = 2;
}

UCLASS()
class UIO_BC_CHEST_10: UIoChestDefault
{
    default AddToInventory(UItKe_Lockpick::StaticClass(), 1);
    default AddToInventory(UItAm_Bolt::StaticClass(), 3);
    default m_UniqueName = n"IO_BC_CHEST_10";
    default m_Lock = n"BC_Chest_10_Lock";
    default m_LockDifficulty = 1;
}

UCLASS()
class UIO_BC_CHEST_11: UIoChestDefault
{
    default AddToInventory(UItFo_Plants_Seraphis_01::StaticClass(), 3);
    default AddToInventory(UItFo_Wineberrys_01::StaticClass(), 1);
    default AddToInventory(UItFo_Onion::StaticClass(), 1);
    default m_UniqueName = n"IO_BC_CHEST_11";
    default m_Lock = n"BC_Chest_11_Lock";
    default m_LockDifficulty = 1;
}

UCLASS()
class UIO_BC_CHEST_12: UIoChestDefault
{
    default AddToInventory(UItMw_1H_Mace_Nailmace_01::StaticClass(), 1);
    default AddToInventory(UItKe_Lockpick::StaticClass(), 1);
    default AddToInventory(UItFo_Rice::StaticClass(), 2);
    default AddToInventory(UItAt_Harpy_01::StaticClass(), 2);
    default m_UniqueName = n"IO_BC_CHEST_12";
    default m_Lock = n"BC_Chest_12_Lock";
    default m_LockDifficulty = 2;
}

UCLASS()
class UIO_BC_CHEST_13: UIoChestDefault
{
    default AddToInventory(UItMi_Stuff_Pipe_01::StaticClass(), 1);
    default AddToInventory(UItMi_Plants_Swampherb_01::StaticClass(), 3);
    default AddToInventory(UItMi_Stuff_Cup_01::StaticClass(), 1);
    default m_UniqueName = n"IO_BC_CHEST_13";
    default m_Lock = n"BC_Chest_13_Lock";
    default m_LockDifficulty = 2;
}

UCLASS()
class UIO_BC_CHEST_14: UIoChestDefault
{
    default AddToInventory(UItKe_Lockpick::StaticClass(), 1);
    default AddToInventory(UItMi_Joint_01::StaticClass(), 2);
    default AddToInventory(UItFo_Potion_Water_01::StaticClass(), 1);
    default m_UniqueName = n"IO_BC_CHEST_14";
    default m_Lock = n"BC_Chest_14_Lock";
    default m_LockDifficulty = 2;
}

UCLASS()
class UIO_BC_CHEST_15: UIoChestDefault
{
    default m_UniqueName = n"IO_BC_CHEST_15";
    default m_Lock = n"BC_Chest_15_Lock";
    default m_LockDifficulty = 3;
}

UCLASS()
class UIO_BC_CHEST_16: UIoChestDefault
{
    default AddToInventory(UItKe_Quentin_01::StaticClass(), 1);
    default AddToInventory(UItAt_Ring_Ranged_01::StaticClass(), 1);
    default AddToInventory(UItWr_Map_OldCamp::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Health_02::StaticClass(), 2);
    default AddToInventory(UItFo_Potion_Strongbeer::StaticClass(), 1);
    default AddToInventory(UItMi_Joint_03::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 22);
    default AddToInventory(UItAt_Harpy_01::StaticClass(), 2);
    default m_UniqueName = n"IO_BC_CHEST_16";
    default m_Lock = n"BC_Chest_16_Lock";
    default m_LockDifficulty = 6;
}

UCLASS()
class UIO_BC_CHEST_17: UIoChestDefault
{
    default AddToInventory(UItMi_Smith_Obsidian::StaticClass(), 1);
    default AddToInventory(UItKe_Lockpick::StaticClass(), 2);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 13);
    default AddToInventory(UItAt_Harpy_01::StaticClass(), 1);
    default m_UniqueName = n"IO_BC_CHEST_17";
    default m_Lock = n"BC_Chest_17_Lock";
    default m_LockDifficulty = 5;
}

UCLASS()
class UIO_BC_CHEST_18: UIoChestDefault
{
    default AddToInventory(UItMi_Smith_Petrifiedwood::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Steel::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Gold::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 10);
    default m_UniqueName = n"IO_BC_CHEST_18";
    default m_Lock = n"BC_Chest_18_Lock";
    default m_LockDifficulty = 5;
}

UCLASS()
class UIO_BC_CHEST_19: UIoChestDefault
{
    default AddToInventory(UItAt_Ring_Projectile_02::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Dex_02::StaticClass(), 1);
    default AddToInventory(UItAm_Arrow::StaticClass(), 20);
    default m_UniqueName = n"IO_BC_CHEST_19";
    default m_Lock = n"BC_Chest_19_Lock";
    default m_LockDifficulty = 7;
}

UCLASS()
class UIO_BC_CHEST_20: UIoChestDefault
{
    default AddToInventory(UItMi_Alchemy_Sulphur_01::StaticClass(), 3);
    default AddToInventory(UItMi_Alchemy_Alcohol_01::StaticClass(), 3);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 28);
    default m_UniqueName = n"IO_BC_CHEST_20";
    default m_Lock = n"BC_Chest_20_Lock";
    default m_LockDifficulty = 4;
}

UCLASS()
class UIO_BC_CHEST_21: UIoChestDefault
{
    default AddToInventory(UItMi_Stuff_Cup_02::StaticClass(), 2);
    default AddToInventory(UItKe_Lockpick::StaticClass(), 6);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 12);
    default m_UniqueName = n"IO_BC_CHEST_21";
}

UCLASS()
class UIO_BC_CHEST_22: UIoChestDefault
{
    default AddToInventory(UItMi_Orenugget::StaticClass(), 36);
    default m_UniqueName = n"IO_BC_CHEST_22";
    default m_Lock = n"BC_Chest_22_Lock";
    default m_LockDifficulty = 4;
}

UCLASS()
class UIO_BC_CHEST_23: UIoChestDefault
{
    default AddToInventory(UItMi_Smith_Ironwood::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Iron::StaticClass(), 5);
    default AddToInventory(UItAt_Harpy_01::StaticClass(), 2);
    default m_UniqueName = n"IO_BC_CHEST_23";
    default m_Lock = n"BC_Chest_23_Lock";
    default m_LockDifficulty = 2;
}

UCLASS()
class UIO_BC_CHEST_24: UIoChestDefault
{
    default AddToInventory(UItMi_Smith_Steel::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Ruby::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Wine::StaticClass(), 2);
    default AddToInventory(UItMi_Smith_Leatherstraps::StaticClass(), 2);
    default m_UniqueName = n"IO_BC_CHEST_24";
}

UCLASS()
class UIO_BT_CHEST_01: UIoChestDefault
{
    default AddToInventory(UItMw_1H_Sword_01::StaticClass(), 1);
    default AddToInventory(UItAr_Scroll_FireBolt::StaticClass(), 1);
    default AddToInventory(UItMi_Inscription_Parchment::StaticClass(), 3);
    default AddToInventory(UItKe_Lockpick::StaticClass(), 1);
    default AddToInventory(UItAm_Arrow::StaticClass(), 7);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 16);
    default m_UniqueName = n"IO_BT_CHEST_01";
    default m_Lock = n"BT_Chest_01_Lock";
    default m_LockDifficulty = 4;
}

UCLASS()
class UIO_BT_CHEST_02: UIoChestDefault
{
    default AddToInventory(UItAt_Ring_Weapon_01::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Strength_01::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Iron::StaticClass(), 4);
    default AddToInventory(UItMi_Alchemy_Flask::StaticClass(), 2);
    default AddToInventory(UItMi_Alchemy_Salt_01::StaticClass(), 2);
    default AddToInventory(UItMi_Oldcoin_01::StaticClass(), 9);
    default m_UniqueName = n"IO_BT_CHEST_02";
    default m_Lock = n"BT_Chest_02_Lock";
    default m_LockDifficulty = 7;
}

UCLASS()
class UIO_CR_CHEST_01: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Strength_03::StaticClass(), 1);
    default AddToInventory(UItAm_Bolt::StaticClass(), 8);
    default AddToInventory(UItAt_Harpy_01::StaticClass(), 5);
    default m_UniqueName = n"IO_CR_CHEST_01";
    default m_Lock = n"CR_Chest_01_Lock";
    default m_LockDifficulty = 6;
}

UCLASS()
class UIO_CR_CHEST_02: UIoChestDefault
{
    default AddToInventory(UItAt_Amulet_Dexterity_01::StaticClass(), 1);
    default AddToInventory(UItRw_Crossbow_02::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Ironwood::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Oak::StaticClass(), 3);
    default AddToInventory(UItKe_Lockpick::StaticClass(), 5);
    default m_UniqueName = n"IO_CR_CHEST_02";
    default m_Lock = n"CR_Chest_02_Lock";
    default m_LockDifficulty = 6;
}

UCLASS()
class UIO_CV_CHEST_01: UIoChestDefault
{
    default AddToInventory(UItKe_Lockpick::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Beer::StaticClass(), 2);
    default AddToInventory(UItFo_Mutton_01::StaticClass(), 6);
    default AddToInventory(UItMw_1H_Torch::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 13);
    default m_UniqueName = n"IO_CV_CHEST_01";
    default m_Lock = n"CV_Chest_01_Lock";
    default m_LockDifficulty = 4;
}

UCLASS()
class UIO_CV_CHEST_02: UIoChestDefault
{
    default AddToInventory(UItKe_Lockpick::StaticClass(), 3);
    default AddToInventory(UItFo_Potion_Beer::StaticClass(), 2);
    default AddToInventory(UItMw_1H_Torch::StaticClass(), 2);
    default AddToInventory(UItAm_Arrow::StaticClass(), 10);
    default m_UniqueName = n"IO_CV_CHEST_02";
    default m_Lock = n"CV_Chest_02_Lock";
    default m_LockDifficulty = 4;
}

UCLASS()
class UIO_CV_CHEST_04: UIoChestDefault
{
    default AddToInventory(UItAt_Ring_Projectile_01::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Oak::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Leatherstraps::StaticClass(), 3);
    default AddToInventory(UItMi_Smith_Willow::StaticClass(), 2);
    default AddToInventory(UItAt_Harpy_01::StaticClass(), 2);
    default m_UniqueName = n"IO_CV_CHEST_04";
}

UCLASS()
class UIO_CV_CHEST_07: UIoChestDefault
{
    default AddToInventory(UItKe_Lockpick::StaticClass(), 2);
    default AddToInventory(UItFo_Potion_Beer::StaticClass(), 2);
    default AddToInventory(UItAm_Arrow::StaticClass(), 5);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 23);
    default m_UniqueName = n"IO_CV_CHEST_07";
    default m_Lock = n"CV_Chest_07_Lock";
    default m_LockDifficulty = 3;
}

UCLASS()
class UIO_CV_CHEST_09: UIoChestDefault
{
    default AddToInventory(UItAt_Ring_Magic_01::StaticClass(), 1);
    default AddToInventory(UItMi_Inscription_Parchment::StaticClass(), 3);
    default AddToInventory(UItFo_Potion_Mana_02::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Health_02::StaticClass(), 1);
    default AddToInventory(UItMi_Alchemy_Flask::StaticClass(), 2);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 8);
    default m_UniqueName = n"IO_CV_CHEST_09";
    default m_Lock = n"CV_Chest_09_Lock";
    default m_LockDifficulty = 5;
}

UCLASS()
class UIO_CV_CHEST_10: UIoChestDefault
{
    default AddToInventory(UItMw_1H_Mace_01::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Willow::StaticClass(), 1);
    default AddToInventory(UItAt_Harpy_01::StaticClass(), 1);
    default m_UniqueName = n"IO_CV_CHEST_10";
    default m_Lock = n"CV_Chest_10_Lock";
    default m_LockDifficulty = 4;
}

UCLASS()
class UIO_EF_CHEST_03: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Health_Perma_01::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Mana_02::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Gold::StaticClass(), 1);
    default AddToInventory(UItKe_Lockpick::StaticClass(), 3);
    default AddToInventory(UItMi_Smith_Willow::StaticClass(), 2);
    default AddToInventory(UItAt_Harpy_01::StaticClass(), 1);
    default m_UniqueName = n"IO_EF_CHEST_03";
    default m_Lock = n"EF_Chest_03_Lock";
    default m_LockDifficulty = 6;
}

UCLASS()
class UIO_EF_CHEST_05: UIoChestDefault
{
    default AddToInventory(UItAr_Rune_BallLightning::StaticClass(), 1);
    default AddToInventory(UItAt_Ring_Fire_02::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Master_01::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Ruby::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Iron::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 14);
    default m_UniqueName = n"IO_EF_CHEST_05";
    default m_Lock = n"EF_Chest_05_Lock";
    default m_LockDifficulty = 7;
}

UCLASS()
class UIO_FM_CHEST_FURNACE_01: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Mana_03::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Health_02::StaticClass(), 1);
    default m_UniqueName = n"IO_FM_CHEST_FURNACE_01";
    default m_Lock = n"FM_Chest_Furnace_01_Lock";
    default m_LockDifficulty = 4;
}

UCLASS()
class UIO_FM_CHEST_FURNACE_02: UIoChestDefault
{
    default AddToInventory(UItFo_Plants_Herb_01::StaticClass(), 2);
    default AddToInventory(UItKe_Lockpick::StaticClass(), 5);
    default AddToInventory(UItAr_Scroll_Light::StaticClass(), 2);
    default AddToInventory(UItMw_2H_Axe_Pickaxe::StaticClass(), 1);
    default m_UniqueName = n"IO_FM_CHEST_FURNACE_02";
    default m_Lock = n"FM_Chest_Furnace_02_Lock";
    default m_LockDifficulty = 4;
}

UCLASS()
class UIO_FM_CHEST_GALLERY: UIoChestDefault
{
    default AddToInventory(UItWr_Scroll_2H_Axe_Light_02::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Health_Quick::StaticClass(), 1);
    default AddToInventory(UItKe_Lockpick::StaticClass(), 4);
    default m_UniqueName = n"IO_FM_CHEST_GALLERY";
    default m_Lock = n"FM_Chest_Gallery_01_Lock";
    default m_LockDifficulty = 7;
}

UCLASS()
class UIO_FM_CORPSE_04: UIoLootDefault
{
    default AddToInventory(UItWr_Book_Godsgift::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Health_01::StaticClass(), 1);
    default m_UniqueName = n"IO_FM_CORPSE_04";
}

UCLASS()
class UIO_FME_CHEST_CONTROLACCESS: UIoChestDefault
{
    default AddToInventory(UItMw_1H_Mace_Sledgehammer_01::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Wine::StaticClass(), 1);
    default m_UniqueName = n"IO_FME_CHEST_CONTROLACCESS";
    default m_Lock = n"FME_Chest_ControlAccess_Lock";
    default m_LockDifficulty = 2;
}

UCLASS()
class UIO_FME_CHEST_EMPTYHUT_02: UIoChestDefault
{
    default AddToInventory(UItFo_Cheese::StaticClass(), 1);
    default AddToInventory(UItFo_Apple::StaticClass(), 3);
    default m_UniqueName = n"IO_FME_CHEST_EMPTYHUT_02";
    default m_Lock = n"FME_Chest_EmptyHut_02_Lock";
    default m_LockDifficulty = 2;
}

UCLASS()
class UIO_FME_CHEST_EMPTYHUT_04: UIoChestDefault
{
    default AddToInventory(UItMi_Smith_Iron::StaticClass(), 2);
    default AddToInventory(UItFo_Mutton_01::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Water_01::StaticClass(), 1);
    default m_UniqueName = n"IO_FME_CHEST_EMPTYHUT_04";
    default m_Lock = n"FME_Chest_EmptyHut_04_Lock";
    default m_LockDifficulty = 2;
}

UCLASS()
class UIO_FME_CHEST_EMPTYHUT_05: UIoChestDefault
{
    default AddToInventory(UItFo_Mutton_02::StaticClass(), 1);
    default m_UniqueName = n"IO_FME_CHEST_EMPTYHUT_05";
    default m_Lock = n"FME_Chest_EmptyHut_05_Lock";
    default m_LockDifficulty = 1;
}

UCLASS()
class UIO_FME_CHEST_GATE: UIoChestDefault
{
    default AddToInventory(UItRw_Bow_Long_06::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Oak::StaticClass(), 1);
    default AddToInventory(UItAm_Arrow::StaticClass(), 10);
    default m_UniqueName = n"IO_FME_CHEST_GATE";
    default m_Lock = n"FME_Chest_Gate_Lock";
    default m_LockDifficulty = 5;
}

UCLASS()
class UIO_FME_CHEST_MERCENARY13_765_01: UIoChestDefault
{
    default AddToInventory(UItWr_Book_Recipes_01::StaticClass(), 1);
    default m_UniqueName = n"IO_FME_CHEST_MERCENARY13_765_01";
    default m_Lock = n"FME_Chest_Mercenary13_765_01_Lock";
    default m_LockDifficulty = 1;
}

UCLASS()
class UIO_FME_CHEST_MERCENARY13_765_02: UIoChestDefault
{
    default AddToInventory(UItFo_Mutton_02::StaticClass(), 1);
    default m_UniqueName = n"IO_FME_CHEST_MERCENARY13_765_02";
    default m_Lock = n"FME_Chest_Mercenary13_765_02_Lock";
    default m_LockDifficulty = 1;
}

UCLASS()
class UIO_FME_CHEST_SWINEY: UIoChestDefault
{
    default AddToInventory(UItMi_Smith_Leatherstraps::StaticClass(), 2);
    default AddToInventory(UItMi_Joint_01::StaticClass(), 4);
    default AddToInventory(UItFo_Rice::StaticClass(), 3);
    default AddToInventory(UItFo_Wineberrys_01::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 15);
    default m_UniqueName = n"IO_FME_CHEST_SWINEY";
    default m_Lock = n"FME_Chest_Swiney_Lock";
    default m_LockDifficulty = 3;
}

UCLASS()
class UIO_FT_CHEST_02: UIoChestDefault
{
    default AddToInventory(UItAr_Rune_StormOfFire::StaticClass(), 1);
    default AddToInventory(UItAt_Ring_Total_02::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Master_01::StaticClass(), 1);
    default AddToInventory(UItWr_Scroll_TransformShadowbeast::StaticClass(), 1);
    default AddToInventory(UItAr_Scroll_SummonSkeletons::StaticClass(), 1);
    default AddToInventory(UItMi_Inscription_Parchment::StaticClass(), 5);
    default AddToInventory(UItFo_Potion_Mana_03::StaticClass(), 1);
    default m_UniqueName = n"IO_FT_CHEST_02";
}

UCLASS()
class UIO_IWML_CHEST_01: UIoChestDefault
{
    default AddToInventory(UItMi_Smith_Oak::StaticClass(), 1);
    default AddToInventory(UItKe_Lockpick::StaticClass(), 3);
    default AddToInventory(UItMi_Smith_Iron::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Barbknife_01::StaticClass(), 1);
    default m_UniqueName = n"IO_IWML_CHEST_01";
    default m_Lock = n"IWML_Chest_01_Lock";
    default m_LockDifficulty = 3;
}

UCLASS()
class UIO_IWML_CHEST_02: UIoChestDefault
{
    default AddToInventory(UItWr_Scroll_1H_Mace_War_03::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Wine::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Silverware_01::StaticClass(), 2);
    default AddToInventory(UItMi_Hammer::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 16);
    default m_UniqueName = n"IO_IWML_CHEST_02";
    default m_Lock = n"IWML_Chest_02_Lock";
    default m_LockDifficulty = 4;
}

UCLASS()
class UIO_IWML_CHEST_03: UIoChestDefault
{
    default AddToInventory(UItMi_Joint_03::StaticClass(), 1);
    default AddToInventory(UItMi_Joint_02::StaticClass(), 4);
    default AddToInventory(UItMi_Plants_Swampherb_01::StaticClass(), 8);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 16);
    default m_UniqueName = n"IO_IWML_CHEST_03";
    default m_Lock = n"IWML_Chest_03_Lock";
    default m_LockDifficulty = 4;
}

UCLASS()
class UIO_IWML_CHEST_04: UIoChestDefault
{
    default AddToInventory(UItKe_Lockpick::StaticClass(), 3);
    default AddToInventory(UItMi_Joint_01::StaticClass(), 5);
    default AddToInventory(UItAm_Arrow::StaticClass(), 8);
    default m_UniqueName = n"IO_IWML_CHEST_04";
    default m_Lock = n"IWML_Chest_04_Lock";
    default m_LockDifficulty = 3;
}

UCLASS()
class UIO_IWML_CHEST_05: UIoChestDefault
{
    default AddToInventory(UItMw_1H_Sword_Short_05::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Health_Quick::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Beer::StaticClass(), 2);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 12);
    default m_UniqueName = n"IO_IWML_CHEST_05";
    default m_Lock = n"IWML_Chest_05_Lock";
    default m_LockDifficulty = 4;
}

UCLASS()
class UIO_MF_CHEST_01: UIoChestDefault
{
    default AddToInventory(UItMw_1H_Mace_Warhammer_01::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Mana_03::StaticClass(), 1);
    default AddToInventory(UItAr_Scroll_FireBall::StaticClass(), 1);
    default m_UniqueName = n"IO_MF_CHEST_01";
    default m_Lock = n"MF_Chest_01_Lock";
    default m_LockDifficulty = 6;
}

UCLASS()
class UIO_MF_CHEST_02: UIoChestDefault
{
    default AddToInventory(UItRw_Bow_Long_02::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Ironwood::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Leatherstraps::StaticClass(), 4);
    default AddToInventory(UItAm_Arrow::StaticClass(), 11);
    default m_UniqueName = n"IO_MF_CHEST_02";
}

UCLASS()
class UIO_MF_CHEST_04: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Master_02::StaticClass(), 1);
    default AddToInventory(UItRw_Crossbow_04::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Ironwood::StaticClass(), 1);
    default AddToInventory(UItAm_Bolt::StaticClass(), 10);
    default m_UniqueName = n"IO_MF_CHEST_04";
    default m_Lock = n"MF_Chest_04_Lock";
    default m_LockDifficulty = 7;
}

UCLASS()
class UIO_MF_CHEST_05: UIoChestDefault
{
    default AddToInventory(UItMi_Inscription_Parchment::StaticClass(), 5);
    default AddToInventory(UItFo_Potion_Mana_03::StaticClass(), 1);
    default m_UniqueName = n"IO_MF_CHEST_05";
}

UCLASS()
class UIO_MF_CHEST_07: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Health_03::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Health_02::StaticClass(), 2);
    default AddToInventory(UItFo_Potion_Health_01::StaticClass(), 4);
    default m_UniqueName = n"IO_MF_CHEST_07";
    default m_Lock = n"MF_Chest_07_Lock";
    default m_LockDifficulty = 5;
}

UCLASS()
class UIO_MF_CHEST_08: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Mana_03::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Mana_02::StaticClass(), 2);
    default AddToInventory(UItFo_Potion_Mana_01::StaticClass(), 3);
    default m_UniqueName = n"IO_MF_CHEST_08";
    default m_Lock = n"MF_Chest_08_Lock";
    default m_LockDifficulty = 4;
}

UCLASS()
class UIO_MF_CHEST_12: UIoChestDefault
{
    default AddToInventory(UItKe_Berg_01::StaticClass(), 1);
    default AddToInventory(UItAr_Rune_StormFist::StaticClass(), 1);
    default AddToInventory(UItAt_Ring_Enlight::StaticClass(), 1);
    default AddToInventory(UItMw_1H_Sword_Long_04::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Health_02::StaticClass(), 3);
    default AddToInventory(UItMi_Oldcoin_01::StaticClass(), 25);
    default m_UniqueName = n"IO_MF_CHEST_12";
    default m_Lock = n"MF_Chest_12_Lock";
    default m_LockDifficulty = 6;
}

UCLASS()
class UIO_MP_CHEST_01: UIoChestDefault
{
    default AddToInventory(UItKe_Lockpick::StaticClass(), 2);
    default AddToInventory(UItFo_Potion_Beer::StaticClass(), 1);
    default AddToInventory(UItFo_Cheese::StaticClass(), 1);
    default m_UniqueName = n"IO_MP_CHEST_01";
}

UCLASS()
class UIO_NC_CHEST_BLADE: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Booze::StaticClass(), 4);
    default AddToInventory(UItMi_Stuff_Amphore_01::StaticClass(), 1);
    default AddToInventory(UItAt_Harpy_01::StaticClass(), 2);
    default AddToInventory(UItFo_Potion_Water_01::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Barbknife_01::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Plate_01::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 12);
    default m_UniqueName = n"IO_NC_CHEST_BLADE";
    default m_Lock = n"NC_Chest_Blade_Lock";
    default m_LockDifficulty = 3;
}

UCLASS()
class UIO_NC_CHEST_BRUCE: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Booze::StaticClass(), 1);
    default AddToInventory(UItFo_Rice::StaticClass(), 4);
    default AddToInventory(UItMi_Stuff_Plate_01::StaticClass(), 1);
    default AddToInventory(UItMw_1H_Torch::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 14);
    default m_UniqueName = n"IO_NC_CHEST_BRUCE";
    default m_Lock = n"NC_Chest_Bruce_Lock";
    default m_LockDifficulty = 3;
}

UCLASS()
class UIO_NC_CHEST_BUSTER: UIoChestDefault
{
    default AddToInventory(UItKe_Lockpick::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Booze::StaticClass(), 4);
    default AddToInventory(UItFo_Rice::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Water_01::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Plate_01::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 11);
    default m_UniqueName = n"IO_NC_CHEST_BUSTER";
    default m_Lock = n"NC_Chest_Buster_Lock";
    default m_LockDifficulty = 3;
}

UCLASS()
class UIO_NC_CHEST_BUTCH: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Booze::StaticClass(), 5);
    default AddToInventory(UItMi_Stuff_Cup_01::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Plate_01::StaticClass(), 3);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 17);
    default m_UniqueName = n"IO_NC_CHEST_BUTCH";
    default m_Lock = n"NC_Chest_Butch_Lock";
    default m_LockDifficulty = 3;
}

UCLASS()
class UIO_NC_CHEST_CELLAR: UIoChestDefault
{
    default AddToInventory(UItMw_1H_Sword_Short_04::StaticClass(), 1);
    default AddToInventory(UItMi_Alchemy_Sulphur_01::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Booze::StaticClass(), 3);
    default AddToInventory(UItMi_Smith_Iron::StaticClass(), 1);
    default AddToInventory(UItMi_Oldcoin_01::StaticClass(), 25);
    default m_UniqueName = n"IO_NC_CHEST_CELLAR";
    default m_Lock = n"NC_Chest_Cellar_Lock";
    default m_LockDifficulty = 3;
    default m_PlayerInteractZDistance = 70.0f;
}

UCLASS()
class UIO_NC_CHEST_CIPHER: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Booze::StaticClass(), 4);
    default AddToInventory(UItMi_Joint_01::StaticClass(), 2);
    default AddToInventory(UItMi_Plants_Swampherb_01::StaticClass(), 3);
    default AddToInventory(UItFo_Rice::StaticClass(), 3);
    default AddToInventory(UItMw_1H_Torch::StaticClass(), 2);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 11);
    default m_UniqueName = n"IO_NC_CHEST_CIPHER";
    default m_Lock = n"NC_Chest_Cipher_Lock";
    default m_LockDifficulty = 4;
}

UCLASS()
class UIO_NC_CHEST_CORD: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Booze::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Amphore_01::StaticClass(), 1);
    default AddToInventory(UItFo_Rice::StaticClass(), 4);
    default AddToInventory(UItMi_Stuff_Cup_01::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Plate_01::StaticClass(), 1);
    default AddToInventory(UItAm_Arrow::StaticClass(), 8);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 8);
    default m_UniqueName = n"IO_NC_CHEST_CORD";
    default m_Lock = n"NC_Chest_Cord_Lock";
    default m_LockDifficulty = 5;
}

UCLASS()
class UIO_NC_CHEST_CRONOS: UIoChestDefault
{
    default AddToInventory(UItAr_Scroll_BallLightning::StaticClass(), 1);
    default AddToInventory(UItAr_Scroll_IceBolt::StaticClass(), 2);
    default AddToInventory(UItFo_Potion_Mana_02::StaticClass(), 1);
    default AddToInventory(UItMi_Alchemy_Alcohol_01::StaticClass(), 3);
    default AddToInventory(UItMi_Alchemy_Syranoil_01::StaticClass(), 2);
    default AddToInventory(UItFo_Plants_Nightshadow_02::StaticClass(), 2);
    default AddToInventory(UItFo_Rice::StaticClass(), 2);
    default m_UniqueName = n"IO_NC_CHEST_CRONOS";
    default m_Lock = n"NC_Chest_Cronos_Lock";
    default m_LockDifficulty = 5;
}

UCLASS()
class UIO_NC_CHEST_DISTILLERY: UIoChestDefault
{
    default AddToInventory(UItMs_Axe_Bran::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Booze::StaticClass(), 4);
    default AddToInventory(UItMi_Alchemy_Alcohol_01::StaticClass(), 2);
    default AddToInventory(UItFo_Rice::StaticClass(), 3);
    default m_UniqueName = n"IO_NC_CHEST_DISTILLERY";
    default m_Lock = n"NC_Chest_Distillery_Lock";
    default m_LockDifficulty = 4;
}

UCLASS()
class UIO_NC_CHEST_GATEINTERIOR_01: UIoChestDefault
{
    default AddToInventory(UItFo_Plants_Herb_01::StaticClass(), 2);
    default AddToInventory(UItFo_Potion_Booze::StaticClass(), 4);
    default AddToInventory(UItFo_Loaf::StaticClass(), 3);
    default AddToInventory(UItFo_Rice::StaticClass(), 6);
    default m_UniqueName = n"IO_NC_CHEST_GATEINTERIOR_01";
    default m_Lock = n"NC_Chest_GateInterior_01_Lock";
    default m_LockDifficulty = 4;
}

UCLASS()
class UIO_NC_CHEST_GATEINTERIOR_02: UIoChestDefault
{
    default AddToInventory(UItRw_Bow_Small_01::StaticClass(), 1);
    default AddToInventory(UItAm_Arrow::StaticClass(), 7);
    default m_UniqueName = n"IO_NC_CHEST_GATEINTERIOR_02";
    default m_Lock = n"NC_Chest_GateInterior_02_Lock";
    default m_LockDifficulty = 2;
}

UCLASS()
class UIO_NC_CHEST_GORN: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Booze::StaticClass(), 2);
    default AddToInventory(UItMi_Stuff_Amphore_01::StaticClass(), 1);
    default AddToInventory(UItFo_Rice::StaticClass(), 2);
    default AddToInventory(UItFo_Potion_Water_01::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Barbknife_01::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Cup_01::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Plate_01::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 14);
    default AddToInventory(UItAm_Arrow::StaticClass(), 17);
    default m_UniqueName = n"IO_NC_CHEST_GORN";
    default m_Lock = n"NC_Chest_Gorn_Lock";
    default m_LockDifficulty = 3;
}

UCLASS()
class UIO_NC_CHEST_HIDDEN: UIoChestDefault
{
    default AddToInventory(UItAr_Scroll_IceBolt::StaticClass(), 1);
    default AddToInventory(UItMi_Alchemy_Syranoil_01::StaticClass(), 1);
    default AddToInventory(UItMi_Alchemy_Sulphur_01::StaticClass(), 1);
    default AddToInventory(UItFo_Plants_Duskbell::StaticClass(), 2);
    default m_UniqueName = n"IO_NC_CHEST_HIDDEN";
}

UCLASS()
class UIO_NC_CHEST_HOMER: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Booze::StaticClass(), 2);
    default AddToInventory(UItMi_Smith_Iron::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Willow::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Water_01::StaticClass(), 2);
    default AddToInventory(UItMi_Stuff_Plate_01::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 12);
    default m_UniqueName = n"IO_NC_CHEST_HOMER";
    default m_Lock = n"NC_Chest_Homer_Lock";
    default m_LockDifficulty = 3;
}

UCLASS()
class UIO_NC_CHEST_JEREMIAH: UIoChestDefault
{
    default AddToInventory(UItFo_Plants_Herb_01::StaticClass(), 1);
    default AddToInventory(UItFo_Rice::StaticClass(), 3);
    default AddToInventory(UItFo_Apple::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 12);
    default m_UniqueName = n"IO_NC_CHEST_JEREMIAH";
    default m_Lock = n"NC_Chest_Jeremiah_Lock";
    default m_LockDifficulty = 2;
}

UCLASS()
class UIO_NC_CHEST_LARES: UIoChestDefault
{
    default AddToInventory(UItAt_Ring_Strong_01::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Booze::StaticClass(), 1);
    default AddToInventory(UItFo_Rice::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Plate_01::StaticClass(), 1);
    default AddToInventory(UItMw_1H_Torch::StaticClass(), 2);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 25);
    default m_UniqueName = n"IO_NC_CHEST_LARES";
    default m_Lock = n"NC_Chest_Lares_Lock";
    default m_LockDifficulty = 5;
}

UCLASS()
class UIO_NC_CHEST_LEE: UIoChestDefault
{
    default AddToInventory(UItAt_Ring_Strong_01::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Booze::StaticClass(), 3);
    default AddToInventory(UItMi_Stuff_Pan_01::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Amphore_01::StaticClass(), 2);
    default AddToInventory(UItFo_Rice::StaticClass(), 4);
    default AddToInventory(UItMi_Stuff_Mug_01::StaticClass(), 1);
    default AddToInventory(UItAm_Arrow::StaticClass(), 27);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 26);
    default m_UniqueName = n"IO_NC_CHEST_LEE";
    default m_Lock = n"NC_Chest_Lee_Lock";
    default m_LockDifficulty = 5;
}

UCLASS()
class UIO_NC_CHEST_LEFTY_01: UIoChestDefault
{
    default AddToInventory(UItMw_1H_Axe_Sickle_01::StaticClass(), 1);
    default AddToInventory(UItFo_Rice::StaticClass(), 1);
    default AddToInventory(UItMi_Hammer::StaticClass(), 2);
    default AddToInventory(UItMi_Stuff_Brush::StaticClass(), 2);
    default m_UniqueName = n"IO_NC_CHEST_LEFTY_01";
    default m_Lock = n"NC_Chest_Lefty_01_Lock";
    default m_LockDifficulty = 2;
}

UCLASS()
class UIO_NC_CHEST_LEFTY_02: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Booze::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Cup_01::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 13);
    default AddToInventory(UItAm_Arrow::StaticClass(), 15);
    default m_UniqueName = n"IO_NC_CHEST_LEFTY_02";
    default m_Lock = n"NC_Chest_Lefty_02_Lock";
    default m_LockDifficulty = 2;
}

UCLASS()
class UIO_NC_CHEST_MERCENARY02_703: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Booze::StaticClass(), 4);
    default AddToInventory(UItFo_Rice::StaticClass(), 2);
    default AddToInventory(UItFo_Potion_Water_01::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Barbknife_01::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Plate_01::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 8);
    default AddToInventory(UItAm_Arrow::StaticClass(), 20);
    default m_UniqueName = n"IO_NC_CHEST_MERCENARY02_703";
    default m_Lock = n"NC_Chest_Mercenary02_703_Lock";
    default m_LockDifficulty = 3;
}

UCLASS()
class UIO_NC_CHEST_MERCENARY03_705: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Booze::StaticClass(), 3);
    default AddToInventory(UItMi_Stuff_Amphore_01::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Barbknife_01::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Cup_01::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Plate_01::StaticClass(), 1);
    default AddToInventory(UItAm_Arrow::StaticClass(), 6);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 14);
    default m_UniqueName = n"IO_NC_CHEST_MERCENARY03_705";
    default m_Lock = n"NC_Chest_Mercenary03_705_Lock";
    default m_LockDifficulty = 1;
}

UCLASS()
class UIO_NC_CHEST_MERCENARY04_706: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Booze::StaticClass(), 1);
    default AddToInventory(UItAt_Harpy_01::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Barbknife_01::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Water_01::StaticClass(), 3);
    default AddToInventory(UItMi_Stuff_Cup_01::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 22);
    default m_UniqueName = n"IO_NC_CHEST_MERCENARY04_706";
    default m_Lock = n"NC_Chest_Mercenary04_706_Lock";
    default m_LockDifficulty = 3;
}

UCLASS()
class UIO_NC_CHEST_MERCENARY06_708: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Booze::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Willow::StaticClass(), 1);
    default AddToInventory(UItAt_Harpy_01::StaticClass(), 1);
    default AddToInventory(UItFo_Rice::StaticClass(), 2);
    default AddToInventory(UItMi_Stuff_Barbknife_01::StaticClass(), 1);
    default AddToInventory(UItAm_Arrow::StaticClass(), 6);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 12);
    default m_UniqueName = n"IO_NC_CHEST_MERCENARY06_708";
    default m_Lock = n"NC_Chest_Mercenary06_708_Lock";
    default m_LockDifficulty = 3;
}

UCLASS()
class UIO_NC_CHEST_MERCENARY07_710: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Booze::StaticClass(), 4);
    default AddToInventory(UItFo_Rice::StaticClass(), 2);
    default AddToInventory(UItFo_Potion_Water_01::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Barbknife_01::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Plate_01::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 11);
    default AddToInventory(UItAm_Arrow::StaticClass(), 20);
    default m_UniqueName = n"IO_NC_CHEST_MERCENARY07_710";
    default m_Lock = n"NC_Chest_Mercenary07_710_Lock";
    default m_LockDifficulty = 4;
}

UCLASS()
class UIO_NC_CHEST_MERCENARY17_735: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Booze::StaticClass(), 2);
    default AddToInventory(UItFo_Rice::StaticClass(), 3);
    default AddToInventory(UItFo_Potion_Water_01::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Plate_01::StaticClass(), 1);
    default AddToInventory(UItAm_Arrow::StaticClass(), 15);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 16);
    default m_UniqueName = n"IO_NC_CHEST_MERCENARY17_735";
    default m_Lock = n"NC_Chest_Mercenary17_735_Lock";
    default m_LockDifficulty = 3;
}

UCLASS()
class UIO_NC_CHEST_MERDARION: UIoChestDefault
{
    default AddToInventory(UItAr_Scroll_ChainLightning::StaticClass(), 1);
    default AddToInventory(UItAr_Scroll_IceBlock::StaticClass(), 1);
    default AddToInventory(UItAr_Scroll_IceBolt::StaticClass(), 2);
    default AddToInventory(UItMi_Inscription_Parchment::StaticClass(), 4);
    default AddToInventory(UItFo_Plants_Seraphis_01::StaticClass(), 4);
    default AddToInventory(UItFo_Rice::StaticClass(), 3);
    default m_UniqueName = n"IO_NC_CHEST_MERDARION";
    default m_Lock = n"NC_Chest_Merdarion_Lock";
    default m_LockDifficulty = 5;
}

UCLASS()
class UIO_NC_CHEST_MYXIR: UIoChestDefault
{
    default AddToInventory(UItAr_Scroll_ChainLightning::StaticClass(), 1);
    default AddToInventory(UItAr_Scroll_IceBolt::StaticClass(), 2);
    default AddToInventory(UItMi_Inscription_Parchment::StaticClass(), 3);
    default AddToInventory(UItFo_Potion_Mana_02::StaticClass(), 1);
    default AddToInventory(UItFo_Plants_Ravenherb_01::StaticClass(), 1);
    default AddToInventory(UItFo_Plants_Orcherb_02::StaticClass(), 2);
    default AddToInventory(UItFo_Plants_Seraphis_01::StaticClass(), 3);
    default AddToInventory(UItFo_Rice::StaticClass(), 2);
    default m_UniqueName = n"IO_NC_CHEST_MYXIR";
    default m_Lock = n"NC_Chest_Myxir_Lock";
    default m_LockDifficulty = 5;
}

UCLASS()
class UIO_NC_CHEST_NEFARIUS: UIoChestDefault
{
    default AddToInventory(UItAr_Scroll_BallLightning::StaticClass(), 2);
    default AddToInventory(UItFo_Potion_Mana_02::StaticClass(), 4);
    default AddToInventory(UItAr_Scroll_IceBolt::StaticClass(), 1);
    default AddToInventory(UItFo_Plants_Herb_02::StaticClass(), 1);
    default AddToInventory(UItFo_Plants_Ravenherb_01::StaticClass(), 1);
    default AddToInventory(UItFo_Plants_Bloodwood_01::StaticClass(), 2);
    default AddToInventory(UItFo_Rice::StaticClass(), 3);
    default m_UniqueName = n"IO_NC_CHEST_NEFARIUS";
    default m_Lock = n"NC_Chest_Nefarius_Lock";
    default m_LockDifficulty = 5;
}

UCLASS()
class UIO_NC_CHEST_ORIK: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Booze::StaticClass(), 4);
    default AddToInventory(UItMi_Stuff_Amphore_01::StaticClass(), 1);
    default AddToInventory(UItFo_Rice::StaticClass(), 1);
    default AddToInventory(UItAt_Harpy_01::StaticClass(), 2);
    default AddToInventory(UItFo_Potion_Water_01::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Plate_01::StaticClass(), 1);
    default AddToInventory(UItAm_Arrow::StaticClass(), 9);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 12);
    default m_UniqueName = n"IO_NC_CHEST_ORIK";
    default m_Lock = n"NC_Chest_Orik_Lock";
    default m_LockDifficulty = 3;
}

UCLASS()
class UIO_NC_CHEST_RICELORD: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Booze::StaticClass(), 5);
    default AddToInventory(UItFo_Mutton_01::StaticClass(), 2);
    default AddToInventory(UItFo_Rice::StaticClass(), 6);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 25);
    default AddToInventory(UItMi_Oldcoin_01::StaticClass(), 10);
    default m_UniqueName = n"IO_NC_CHEST_RICELORD";
    default m_Lock = n"NC_Chest_Ricelord_Lock";
    default m_LockDifficulty = 4;
}

UCLASS()
class UIO_NC_CHEST_RIORDIAN: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Mana_03::StaticClass(), 2);
    default AddToInventory(UItFo_Potion_Health_03::StaticClass(), 1);
    default AddToInventory(UItMi_Alchemy_Quicksilver_01::StaticClass(), 4);
    default AddToInventory(UItMi_Alchemy_Sulphur_01::StaticClass(), 2);
    default AddToInventory(UItMi_Alchemy_Syranoil_01::StaticClass(), 2);
    default AddToInventory(UItFo_Plants_Seraphis_01::StaticClass(), 1);
    default AddToInventory(UItMi_Alchemy_Flask::StaticClass(), 5);
    default m_UniqueName = n"IO_NC_CHEST_RIORDIAN";
    default m_Lock = n"NC_Chest_Riordian_Lock";
    default m_LockDifficulty = 5;
}

UCLASS()
class UIO_NC_CHEST_ROGUE01_800: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Booze::StaticClass(), 1);
    default AddToInventory(UItFo_Rice::StaticClass(), 3);
    default AddToInventory(UItMi_Stuff_Cup_01::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 17);
    default m_UniqueName = n"IO_NC_CHEST_ROGUE01_800";
    default m_Lock = n"NC_Chest_Rogue01_800_Lock";
    default m_LockDifficulty = 2;
}

UCLASS()
class UIO_NC_CHEST_ROGUE03_806: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Booze::StaticClass(), 4);
    default AddToInventory(UItAt_Harpy_01::StaticClass(), 1);
    default AddToInventory(UItFo_Rice::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Water_01::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Cup_01::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 6);
    default m_UniqueName = n"IO_NC_CHEST_ROGUE03_806";
    default m_Lock = n"NC_Chest_Rogue03_806_Lock";
    default m_LockDifficulty = 4;
}

UCLASS()
class UIO_NC_CHEST_ROGUE05_810: UIoChestDefault
{
    default AddToInventory(UItKe_Lockpick::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Booze::StaticClass(), 2);
    default AddToInventory(UItMi_Smith_Willow::StaticClass(), 1);
    default AddToInventory(UItFo_Potato::StaticClass(), 3);
    default AddToInventory(UItFo_Onion::StaticClass(), 4);
    default m_UniqueName = n"IO_NC_CHEST_ROGUE05_810";
    default m_Lock = n"NC_Chest_Rogue05_810_Lock";
    default m_LockDifficulty = 3;
}

UCLASS()
class UIO_NC_CHEST_ROGUE06_811: UIoChestDefault
{
    default AddToInventory(UItFo_Cabbage::StaticClass(), 7);
    default AddToInventory(UItMi_Stuff_Plate_01::StaticClass(), 1);
    default AddToInventory(UItFo_Lemon::StaticClass(), 5);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 8);
    default m_UniqueName = n"IO_NC_CHEST_ROGUE06_811";
    default m_Lock = n"NC_Chest_Rogue06_811_Lock";
    default m_LockDifficulty = 3;
}

UCLASS()
class UIO_NC_CHEST_ROGUE07_815: UIoChestDefault
{
    default AddToInventory(UItMi_Smith_Leatherstraps::StaticClass(), 2);
    default AddToInventory(UItFo_Potion_Booze::StaticClass(), 1);
    default AddToInventory(UItFo_Rice::StaticClass(), 2);
    default AddToInventory(UItFo_Potion_Water_01::StaticClass(), 3);
    default AddToInventory(UItMw_1H_Torch::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 8);
    default m_UniqueName = n"IO_NC_CHEST_ROGUE07_815";
    default m_Lock = n"NC_Chest_Rogue07_815_Lock";
    default m_LockDifficulty = 2;
}

UCLASS()
class UIO_NC_CHEST_ROGUE08_816: UIoChestDefault
{
    default AddToInventory(UItMi_Smith_Leatherstraps::StaticClass(), 2);
    default AddToInventory(UItFo_Potion_Booze::StaticClass(), 2);
    default AddToInventory(UItMi_Stuff_Cup_01::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Plate_01::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 14);
    default m_UniqueName = n"IO_NC_CHEST_ROGUE08_816";
    default m_Lock = n"NC_Chest_Rogue08_816_Lock";
    default m_LockDifficulty = 3;
}

UCLASS()
class UIO_NC_CHEST_ROGUE09_817: UIoChestDefault
{
    default AddToInventory(UItRw_Bow_Small_01::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Willow::StaticClass(), 2);
    default AddToInventory(UItAt_Harpy_01::StaticClass(), 1);
    default AddToInventory(UItFo_Carrot::StaticClass(), 4);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 3);
    default m_UniqueName = n"IO_NC_CHEST_ROGUE09_817";
    default m_Lock = n"NC_Chest_Rogue09_817_Lock";
    default m_LockDifficulty = 3;
}

UCLASS()
class UIO_NC_CHEST_ROGUE10_820: UIoChestDefault
{
    default AddToInventory(UItMi_Smith_Leatherstraps::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Booze::StaticClass(), 2);
    default AddToInventory(UItFo_Rice::StaticClass(), 2);
    default AddToInventory(UItFo_Potion_Water_01::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Plate_01::StaticClass(), 1);
    default m_UniqueName = n"IO_NC_CHEST_ROGUE10_820";
    default m_Lock = n"NC_Chest_Rogue10_820_Lock";
    default m_LockDifficulty = 3;
}

UCLASS()
class UIO_NC_CHEST_ROGUE11_821: UIoChestDefault
{
    default AddToInventory(UItFo_Rice::StaticClass(), 2);
    default AddToInventory(UItFo_Potion_Water_01::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Plate_01::StaticClass(), 1);
    default AddToInventory(UItMw_1H_Torch::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 6);
    default m_UniqueName = n"IO_NC_CHEST_ROGUE11_821";
    default m_Lock = n"NC_Chest_Rogue11_821_Lock";
    default m_LockDifficulty = 1;
}

UCLASS()
class UIO_NC_CHEST_ROGUE13_823: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Booze::StaticClass(), 2);
    default AddToInventory(UItFo_Rice::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Plate_01::StaticClass(), 1);
    default AddToInventory(UItMw_1H_Torch::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 7);
    default m_UniqueName = n"IO_NC_CHEST_ROGUE13_823";
    default m_Lock = n"NC_Chest_Rogue13_823_Lock";
    default m_LockDifficulty = 2;
}

UCLASS()
class UIO_NC_CHEST_ROGUE22_837: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Booze::StaticClass(), 3);
    default AddToInventory(UItFo_Rice::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Cup_01::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Plate_01::StaticClass(), 1);
    default AddToInventory(UItMw_1H_Torch::StaticClass(), 3);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 10);
    default m_UniqueName = n"IO_NC_CHEST_ROGUE22_837";
    default m_Lock = n"NC_Chest_Rogue22_837_Lock";
    default m_LockDifficulty = 3;
}

UCLASS()
class UIO_NC_CHEST_ROGUE23_838: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Booze::StaticClass(), 5);
    default AddToInventory(UItAt_Harpy_01::StaticClass(), 2);
    default AddToInventory(UItMw_1H_Torch::StaticClass(), 3);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 12);
    default m_UniqueName = n"IO_NC_CHEST_ROGUE23_838";
    default m_Lock = n"NC_Chest_Rogue23_838_Lock";
    default m_LockDifficulty = 4;
}

UCLASS()
class UIO_NC_CHEST_SATURAS: UIoChestDefault
{
    default AddToInventory(UItAt_Ring_Fire_02::StaticClass(), 1);
    default AddToInventory(UItAr_Scroll_IceBlock::StaticClass(), 1);
    default AddToInventory(UItAr_Scroll_BallLightning::StaticClass(), 2);
    default AddToInventory(UItAr_Scroll_IceBolt::StaticClass(), 3);
    default AddToInventory(UItFo_Potion_Mana_02::StaticClass(), 1);
    default AddToInventory(UItMi_Alchemy_Sulphur_01::StaticClass(), 2);
    default AddToInventory(UItFo_Rice::StaticClass(), 3);
    default AddToInventory(UItMi_Alchemy_Salt_01::StaticClass(), 2);
    default m_UniqueName = n"IO_NC_CHEST_SATURAS";
    default m_Lock = n"NC_Chest_Saturas_Lock";
    default m_LockDifficulty = 5;
}

UCLASS()
class UIO_NC_CHEST_SHARKY: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Booze::StaticClass(), 4);
    default AddToInventory(UItFo_Potion_Water_01::StaticClass(), 3);
    default AddToInventory(UItMi_Stuff_Cup_01::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Plate_01::StaticClass(), 1);
    default AddToInventory(UItMw_1H_Torch::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 13);
    default m_UniqueName = n"IO_NC_CHEST_SHARKY";
    default m_Lock = n"NC_Chest_Sharky_Lock";
    default m_LockDifficulty = 4;
}

UCLASS()
class UIO_NC_CHEST_SHRIKE: UIoChestDefault
{
    default m_UniqueName = n"IO_NC_CHEST_SHRIKE";
}

UCLASS()
class UIO_NC_CHEST_SILAS: UIoChestDefault
{
    default AddToInventory(UItFo_Loaf::StaticClass(), 1);
    default AddToInventory(UItFo_Rice::StaticClass(), 3);
    default AddToInventory(UItMi_Stuff_Plate_01::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 28);
    default m_UniqueName = n"IO_NC_CHEST_SILAS";
    default m_Lock = n"NC_Chest_Silas_Lock";
    default m_LockDifficulty = 3;
}

UCLASS()
class UIO_NC_CHEST_SUNKEN_01: UIoChestDefault
{
    default AddToInventory(UItAr_Scroll_TransformLurker::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Booze::StaticClass(), 3);
    default AddToInventory(UItFo_Potion_Water_01::StaticClass(), 4);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 14);
    default m_UniqueName = n"IO_NC_CHEST_SUNKEN_01";
    default m_Lock = n"NC_Chest_Sunken_01_Lock";
    default m_LockDifficulty = 4;
}

UCLASS()
class UIO_NC_CHEST_SUNKEN_02: UIoChestDefault
{
    default AddToInventory(UItMi_Smith_Ruby::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Steel::StaticClass(), 1);
    default AddToInventory(UItKe_Lockpick::StaticClass(), 3);
    default AddToInventory(UItMw_1H_Torch::StaticClass(), 2);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 13);
    default m_UniqueName = n"IO_NC_CHEST_SUNKEN_02";
    default m_Lock = n"NC_Chest_Sunken_02_Lock";
    default m_LockDifficulty = 4;
}

UCLASS()
class UIO_NC_CHEST_TORLOF: UIoChestDefault
{
    default AddToInventory(UItFo_Plants_Coral::StaticClass(), 3);
    default AddToInventory(UItAt_Harpy_01::StaticClass(), 1);
    default AddToInventory(UItFo_Carrot::StaticClass(), 4);
    default AddToInventory(UItMw_1H_Torch::StaticClass(), 2);
    default AddToInventory(UItAm_Arrow::StaticClass(), 7);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 10);
    default m_UniqueName = n"IO_NC_CHEST_TORLOF";
    default m_Lock = n"NC_Chest_Torlof_Lock";
    default m_LockDifficulty = 3;
}

UCLASS()
class UIO_NC_CHEST_WEDGE: UIoChestDefault
{
    default AddToInventory(UItKe_Lockpick::StaticClass(), 15);
    default AddToInventory(UItFo_Rice::StaticClass(), 3);
    default AddToInventory(UItMi_Stuff_Plate_01::StaticClass(), 1);
    default AddToInventory(UItMw_1H_Torch::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 6);
    default m_UniqueName = n"IO_NC_CHEST_WEDGE";
    default m_Lock = n"NC_Chest_Wedge_Lock";
    default m_LockDifficulty = 5;
}

UCLASS()
class UIO_NC_CHEST_WOLF: UIoChestDefault
{
    default AddToInventory(UItAt_Bloodfly_02::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Willow::StaticClass(), 2);
    default AddToInventory(UItFo_Rice::StaticClass(), 1);
    default AddToInventory(UItAt_Harpy_01::StaticClass(), 3);
    default AddToInventory(UItFo_Wineberrys_01::StaticClass(), 3);
    default AddToInventory(UItMw_1H_Torch::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 6);
    default m_UniqueName = n"IO_NC_CHEST_WOLF";
    default m_Lock = n"NC_Chest_Wolf_Lock";
    default m_LockDifficulty = 3;
}

UCLASS()
class UIO_NC_CORPSE_SILAS: UIoLootDefault
{
    default AddToInventory(UItKe_TavernDoor::StaticClass(), 1);
    default AddToInventory(UItKe_Lockpick::StaticClass(), 3);
    default m_UniqueName = n"IO_NC_CORPSE_SILAS";
}

UCLASS()
class UIO_OA_CHEST_01: UIoChestDefault
{
    default AddToInventory(UItMi_Smith_Ruby::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Willow::StaticClass(), 3);
    default AddToInventory(UItMw_1H_Torch::StaticClass(), 2);
    default AddToInventory(UItAm_Arrow::StaticClass(), 7);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 9);
    default m_UniqueName = n"IO_OA_CHEST_01";
    default m_Lock = n"OA_Chest_01_Lock";
    default m_LockDifficulty = 3;
}

UCLASS()
class UIO_OA_CHEST_02: UIoChestDefault
{
    default AddToInventory(UItAt_Amulet_Strong_02::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Mana_02::StaticClass(), 2);
    default AddToInventory(UItAm_Arrow::StaticClass(), 5);
    default AddToInventory(UItAm_Bolt::StaticClass(), 7);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 13);
    default m_UniqueName = n"IO_OA_CHEST_02";
    default m_Lock = n"OA_Chest_02_Lock";
    default m_LockDifficulty = 6;
}

UCLASS()
class UIO_OA_CHEST_03: UIoChestDefault
{
    default AddToInventory(UItMw_2H_Axe_Orc_03::StaticClass(), 1);
    default AddToInventory(UItAt_Firelizard_02::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Steel::StaticClass(), 1);
    default AddToInventory(UItAm_Bolt::StaticClass(), 14);
    default m_UniqueName = n"IO_OA_CHEST_03";
    default m_Lock = n"OA_Chest_03_Lock";
    default m_LockDifficulty = 4;
}

UCLASS()
class UIO_OA_CHEST_04: UIoChestDefault
{
    default AddToInventory(UItMw_2H_Axe_Orc_02::StaticClass(), 1);
    default AddToInventory(UItAt_Biter_01::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Ironwood::StaticClass(), 1);
    default AddToInventory(UItAm_Arrow::StaticClass(), 20);
    default m_UniqueName = n"IO_OA_CHEST_04";
    default m_Lock = n"OA_Chest_04_Lock";
    default m_LockDifficulty = 5;
}

UCLASS()
class UIO_OC_CHEST_ARTO: UIoChestDefault
{
    default AddToInventory(UItAt_Ring_Strong_02::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Health_Perma_02::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Silverware_01::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 22);
    default m_UniqueName = n"IO_OC_CHEST_ARTO";
    default m_Lock = n"OC_Chest_Arto_Lock";
    default m_LockDifficulty = 7;
}

UCLASS()
class UIO_OC_CHEST_BAALPARVEZ: UIoChestDefault
{
    default AddToInventory(UItMi_Stuff_Pan_01::StaticClass(), 1);
    default AddToInventory(UItMi_Joint_01::StaticClass(), 2);
    default AddToInventory(UItFo_Loaf::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 12);
    default m_UniqueName = n"IO_OC_CHEST_BAALPARVEZ";
    default m_Lock = n"OC_Chest_BaalParvez_Lock";
    default m_LockDifficulty = 3;
}

UCLASS()
class UIO_OC_CHEST_BALAM: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Beer::StaticClass(), 2);
    default AddToInventory(UItFo_Mutton_01::StaticClass(), 3);
    default AddToInventory(UItMi_Stuff_Barbknife_01::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Cup_01::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 12);
    default m_UniqueName = n"IO_OC_CHEST_BALAM";
    default m_Lock = n"OC_Chest_Balam_Lock";
    default m_LockDifficulty = 4;
}

UCLASS()
class UIO_OC_CHEST_BARTHOLO: UIoChestDefault
{
    default AddToInventory(UItAt_Ring_Weapon_02::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Health_02::StaticClass(), 3);
    default AddToInventory(UItFo_Potion_Wine::StaticClass(), 3);
    default AddToInventory(UItFo_Potion_Beer::StaticClass(), 5);
    default m_UniqueName = n"IO_OC_CHEST_BARTHOLO";
    default m_Lock = n"OC_Chest_Bartholo_Lock";
    default m_LockDifficulty = 4;
}

UCLASS()
class UIO_OC_CHEST_BETTINGOWNER: UIoChestDefault
{
    default AddToInventory(UItMi_Smith_Steel::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Ruby::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Gold::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 21);
    default m_UniqueName = n"IO_OC_CHEST_BETTINGOWNER";
    default m_Lock = n"OC_Chest_Bettingowner_Lock";
    default m_LockDifficulty = 4;
}

UCLASS()
class UIO_OC_CHEST_BLOODWYN: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Beer::StaticClass(), 2);
    default AddToInventory(UItFo_Mutton_01::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Barbknife_01::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 19);
    default m_UniqueName = n"IO_OC_CHEST_BLOODWYN";
    default m_Lock = n"OC_Chest_Bloodwyn_Lock";
    default m_LockDifficulty = 4;
}

UCLASS()
class UIO_OC_CHEST_BULLIT: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Beer::StaticClass(), 1);
    default AddToInventory(UItFo_Mutton_01::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Barbknife_01::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Cup_01::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 13);
    default m_UniqueName = n"IO_OC_CHEST_BULLIT";
    default m_Lock = n"OC_Chest_Bullit_Lock";
    default m_LockDifficulty = 2;
}

UCLASS()
class UIO_OC_CHEST_CORRISTO: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Mana_02::StaticClass(), 3);
    default AddToInventory(UItFo_Potion_Wine::StaticClass(), 3);
    default AddToInventory(UItFo_Plants_Seraphis_01::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 26);
    default AddToInventory(UItWr_Book_True_Power::StaticClass(), 1);
    default m_UniqueName = n"IO_OC_CHEST_CORRISTO";
    default m_Lock = n"OC_Chest_Corristo_Lock";
    default m_LockDifficulty = 4;
}

UCLASS()
class UIO_OC_CHEST_DAMAROK: UIoChestDefault
{
    default AddToInventory(UItWr_Book_Godsgift::StaticClass(), 1);
    default AddToInventory(UItWr_Book_Secrets::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Mana_02::StaticClass(), 2);
    default AddToInventory(UItFo_Potion_Mana_01::StaticClass(), 4);
    default AddToInventory(UItFo_Potion_Wine::StaticClass(), 1);
    default m_UniqueName = n"IO_OC_CHEST_DAMAROK";
    default m_Lock = n"OC_Chest_Damarok_Lock";
    default m_LockDifficulty = 5;
}

UCLASS()
class UIO_OC_CHEST_DEXTER: UIoChestDefault
{
    default AddToInventory(UItFo_Mutton_02::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Mug_01::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Wine::StaticClass(), 2);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 11);
    default m_UniqueName = n"IO_OC_CHEST_DEXTER";
    default m_Lock = n"OC_Chest_Dexter_Lock";
    default m_LockDifficulty = 1;
}

UCLASS()
class UIO_OC_CHEST_DIEGO: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Health_01::StaticClass(), 5);
    default AddToInventory(UItKe_Lockpick::StaticClass(), 3);
    default AddToInventory(UItMi_Stuff_Pan_01::StaticClass(), 1);
    default AddToInventory(UItFo_Cheese::StaticClass(), 1);
    default AddToInventory(UItFo_Mutton_01::StaticClass(), 3);
    default AddToInventory(UItFo_Potion_Water_01::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Mug_01::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 22);
    default m_UniqueName = n"IO_OC_CHEST_DIEGO";
    default m_Lock = n"OC_Chest_Diego_Lock";
    default m_LockDifficulty = 5;
}

UCLASS()
class UIO_OC_CHEST_DIGGER501: UIoChestDefault
{
    default AddToInventory(UItMs_Scroll_LoveInterest_2::StaticClass(), 1);
    default AddToInventory(UItFo_Mutton_01::StaticClass(), 2);
    default AddToInventory(UItFo_Loaf::StaticClass(), 3);
    default AddToInventory(UItMi_Stuff_Barbknife_01::StaticClass(), 1);
    default AddToInventory(UItMw_2H_Axe_Pickaxe::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Water_01::StaticClass(), 2);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 6);
    default m_UniqueName = n"IO_OC_CHEST_DIGGER501";
    default m_Lock = n"OC_Chest_Digger501_Lock";
    default m_LockDifficulty = 3;
}

UCLASS()
class UIO_OC_CHEST_DIGGER502: UIoChestDefault
{
    default AddToInventory(UItFo_Mutton_01::StaticClass(), 1);
    default AddToInventory(UItFo_Loaf::StaticClass(), 2);
    default AddToInventory(UItFo_Potion_Water_01::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 3);
    default m_UniqueName = n"IO_OC_CHEST_DIGGER502";
    default m_Lock = n"OC_Chest_Digger502_Lock";
    default m_LockDifficulty = 1;
}

UCLASS()
class UIO_OC_CHEST_DIGGER503: UIoChestDefault
{
    default AddToInventory(UItMi_Smith_Leatherstraps::StaticClass(), 2);
    default AddToInventory(UItFo_Cheese::StaticClass(), 1);
    default AddToInventory(UItMw_2H_Axe_Pickaxe::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 8);
    default m_UniqueName = n"IO_OC_CHEST_DIGGER503";
    default m_Lock = n"OC_Chest_Digger503_Lock";
    default m_LockDifficulty = 3;
}

UCLASS()
class UIO_OC_CHEST_DIGGER504: UIoChestDefault
{
    default AddToInventory(UItMi_Smith_Leatherstraps::StaticClass(), 1);
    default AddToInventory(UItFo_Loaf::StaticClass(), 2);
    default AddToInventory(UItMi_Stuff_Cup_01::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Plate_01::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 2);
    default m_UniqueName = n"IO_OC_CHEST_DIGGER504";
    default m_Lock = n"OC_Chest_Digger504_Lock";
    default m_LockDifficulty = 2;
}

UCLASS()
class UIO_OC_CHEST_DIGGER505: UIoChestDefault
{
    default AddToInventory(UItWr_Book_Lyric::StaticClass(), 1);
    default AddToInventory(UItFo_Mutton_01::StaticClass(), 5);
    default AddToInventory(UItFo_Apple::StaticClass(), 5);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 16);
    default m_UniqueName = n"IO_OC_CHEST_DIGGER505";
    default m_Lock = n"OC_Chest_Digger505_Lock";
    default m_LockDifficulty = 3;
}

UCLASS()
class UIO_OC_CHEST_DIGGER506: UIoChestDefault
{
    default AddToInventory(UItFo_Cheese::StaticClass(), 1);
    default AddToInventory(UItMw_2H_Axe_Pickaxe::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 8);
    default m_UniqueName = n"IO_OC_CHEST_DIGGER506";
    default m_Lock = n"OC_Chest_Digger506_Lock";
    default m_LockDifficulty = 2;
}

UCLASS()
class UIO_OC_CHEST_DIGGER507: UIoChestDefault
{
    default AddToInventory(UItMi_Stuff_Pan_01::StaticClass(), 1);
    default AddToInventory(UItFo_Cheese::StaticClass(), 4);
    default AddToInventory(UItFo_Mutton_01::StaticClass(), 1);
    default AddToInventory(UItFo_Loaf::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Barbknife_01::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Plate_01::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 12);
    default m_UniqueName = n"IO_OC_CHEST_DIGGER507";
    default m_Lock = n"OC_Chest_Digger507_Lock";
    default m_LockDifficulty = 4;
}

UCLASS()
class UIO_OC_CHEST_DIGGER508: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Health_Quick::StaticClass(), 3);
    default AddToInventory(UItFo_Mutton_01::StaticClass(), 5);
    default AddToInventory(UItFo_Potion_Water_01::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Mug_01::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 15);
    default m_UniqueName = n"IO_OC_CHEST_DIGGER508";
    default m_Lock = n"OC_Chest_Digger508_Lock";
    default m_LockDifficulty = 3;
}

UCLASS()
class UIO_OC_CHEST_DIGGER509: UIoChestDefault
{
    default AddToInventory(UItMi_Smith_Leatherstraps::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Pan_01::StaticClass(), 1);
    default AddToInventory(UItFo_Mutton_01::StaticClass(), 1);
    default AddToInventory(UItFo_Loaf::StaticClass(), 3);
    default AddToInventory(UItFo_Potion_Water_01::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Barbknife_01::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 3);
    default m_UniqueName = n"IO_OC_CHEST_DIGGER509";
    default m_Lock = n"OC_Chest_Digger509_Lock";
    default m_LockDifficulty = 3;
}

UCLASS()
class UIO_OC_CHEST_DIGGER510: UIoChestDefault
{
    default AddToInventory(UItMi_Stuff_Pan_01::StaticClass(), 1);
    default AddToInventory(UItFo_Cheese::StaticClass(), 1);
    default AddToInventory(UItFo_Mutton_01::StaticClass(), 1);
    default AddToInventory(UItFo_Loaf::StaticClass(), 3);
    default AddToInventory(UItFo_Potion_Water_01::StaticClass(), 2);
    default AddToInventory(UItMi_Stuff_Plate_01::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 9);
    default m_UniqueName = n"IO_OC_CHEST_DIGGER510";
    default m_Lock = n"OC_Chest_Digger510_Lock";
    default m_LockDifficulty = 3;
}

UCLASS()
class UIO_OC_CHEST_DIGGER512: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Health_Quick::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Beer::StaticClass(), 3);
    default AddToInventory(UItFo_Potion_Water_01::StaticClass(), 2);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 6);
    default m_UniqueName = n"IO_OC_CHEST_DIGGER512";
    default m_Lock = n"OC_Chest_Digger512_Lock";
    default m_LockDifficulty = 3;
}

UCLASS()
class UIO_OC_CHEST_DIGGER513: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Health_Quick::StaticClass(), 2);
    default AddToInventory(UItFo_Cheese::StaticClass(), 2);
    default AddToInventory(UItMi_Stuff_Barbknife_01::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 14);
    default m_UniqueName = n"IO_OC_CHEST_DIGGER513";
    default m_Lock = n"OC_Chest_Digger513_Lock";
    default m_LockDifficulty = 4;
}

UCLASS()
class UIO_OC_CHEST_DIGGER514: UIoChestDefault
{
    default AddToInventory(UItMi_Stuff_Plate_01::StaticClass(), 1);
    default m_UniqueName = n"IO_OC_CHEST_DIGGER514";
    default m_Lock = n"OC_Chest_Digger514_Lock";
    default m_LockDifficulty = 1;
}

UCLASS()
class UIO_OC_CHEST_DIGGER515: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Health_Quick::StaticClass(), 3);
    default AddToInventory(UItFo_Mutton_01::StaticClass(), 6);
    default AddToInventory(UItFo_Loaf::StaticClass(), 2);
    default AddToInventory(UItMi_Stuff_Barbknife_01::StaticClass(), 2);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 8);
    default m_UniqueName = n"IO_OC_CHEST_DIGGER515";
    default m_Lock = n"OC_Chest_Digger515_Lock";
    default m_LockDifficulty = 4;
}

UCLASS()
class UIO_OC_CHEST_DIGGER515_HIDDEN: UIoChestDefault
{
    default AddToInventory(UItMi_Smith_Gold::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Health_Quick::StaticClass(), 3);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 15);
    default m_UniqueName = n"IO_OC_CHEST_DIGGER515_HIDDEN";
}

UCLASS()
class UIO_OC_CHEST_DIGGER516: UIoChestDefault
{
    default AddToInventory(UItMi_Smith_Leatherstraps::StaticClass(), 1);
    default AddToInventory(UItFo_Cheese::StaticClass(), 1);
    default AddToInventory(UItMw_2H_Axe_Pickaxe::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Plate_01::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 5);
    default m_UniqueName = n"IO_OC_CHEST_DIGGER516";
    default m_Lock = n"OC_Chest_Digger516_Lock";
    default m_LockDifficulty = 2;
}

UCLASS()
class UIO_OC_CHEST_DIGGER517: UIoChestDefault
{
    default AddToInventory(UItMi_Stuff_Pan_01::StaticClass(), 1);
    default AddToInventory(UItFo_Cheese::StaticClass(), 2);
    default AddToInventory(UItFo_Mutton_01::StaticClass(), 1);
    default AddToInventory(UItFo_Loaf::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Barbknife_01::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Plate_01::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 8);
    default m_UniqueName = n"IO_OC_CHEST_DIGGER517";
    default m_Lock = n"OC_Chest_Digger517_Lock";
    default m_LockDifficulty = 3;
}

UCLASS()
class UIO_OC_CHEST_DIGGER519: UIoChestDefault
{
    default AddToInventory(UItMi_Stuff_Pan_01::StaticClass(), 1);
    default AddToInventory(UItFo_Mutton_01::StaticClass(), 2);
    default AddToInventory(UItFo_Potion_Water_01::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Barbknife_01::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Plate_01::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 19);
    default m_UniqueName = n"IO_OC_CHEST_DIGGER519";
    default m_Lock = n"OC_Chest_Digger519_Lock";
    default m_LockDifficulty = 3;
}

UCLASS()
class UIO_OC_CHEST_DIGGER521: UIoChestDefault
{
    default AddToInventory(UItMi_Smith_Leatherstraps::StaticClass(), 2);
    default AddToInventory(UItFo_Potion_Beer::StaticClass(), 1);
    default AddToInventory(UItFo_Mutton_02::StaticClass(), 1);
    default AddToInventory(UItFo_Mutton_01::StaticClass(), 2);
    default AddToInventory(UItMi_Stuff_Plate_01::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 9);
    default m_UniqueName = n"IO_OC_CHEST_DIGGER521";
    default m_Lock = n"OC_Chest_Digger521_Lock";
    default m_LockDifficulty = 3;
}

UCLASS()
class UIO_OC_CHEST_DIGGER522: UIoChestDefault
{
    default AddToInventory(UItMi_Stuff_Pan_01::StaticClass(), 1);
    default AddToInventory(UItFo_Cheese::StaticClass(), 1);
    default AddToInventory(UItFo_Mutton_01::StaticClass(), 1);
    default AddToInventory(UItFo_Loaf::StaticClass(), 3);
    default AddToInventory(UItMi_Stuff_Mug_01::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Water_01::StaticClass(), 2);
    default AddToInventory(UItMi_Stuff_Plate_01::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 12);
    default m_UniqueName = n"IO_OC_CHEST_DIGGER522";
    default m_Lock = n"OC_Chest_Digger522_Lock";
    default m_LockDifficulty = 3;
}

UCLASS()
class UIO_OC_CHEST_DIGGER523: UIoChestDefault
{
    default AddToInventory(UItMw_2H_Axe_Pickaxe::StaticClass(), 1);
    default AddToInventory(UItFo_Cheese::StaticClass(), 3);
    default AddToInventory(UItMi_Stuff_Barbknife_01::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Mug_01::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Plate_01::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 3);
    default m_UniqueName = n"IO_OC_CHEST_DIGGER523";
    default m_Lock = n"OC_Chest_Digger523_Lock";
    default m_LockDifficulty = 2;
}

UCLASS()
class UIO_OC_CHEST_DIGGER526: UIoChestDefault
{
    default AddToInventory(UItMi_Smith_Willow::StaticClass(), 2);
    default AddToInventory(UItFo_Potion_Water_01::StaticClass(), 3);
    default AddToInventory(UItMi_Stuff_Plate_01::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 7);
    default m_UniqueName = n"IO_OC_CHEST_DIGGER526";
    default m_Lock = n"OC_Chest_Digger526_Lock";
    default m_LockDifficulty = 2;
}

UCLASS()
class UIO_OC_CHEST_DIGGER527: UIoChestDefault
{
    default AddToInventory(UItMi_Stuff_Pan_01::StaticClass(), 1);
    default AddToInventory(UItFo_Mutton_01::StaticClass(), 1);
    default AddToInventory(UItFo_Loaf::StaticClass(), 3);
    default AddToInventory(UItMi_Stuff_Barbknife_01::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Plate_01::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 14);
    default m_UniqueName = n"IO_OC_CHEST_DIGGER527";
    default m_Lock = n"OC_Chest_Digger527_Lock";
    default m_LockDifficulty = 2;
}

UCLASS()
class UIO_OC_CHEST_DIGGER528: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Wine::StaticClass(), 1);
    default AddToInventory(UItFo_Mutton_01::StaticClass(), 3);
    default AddToInventory(UItFo_Loaf::StaticClass(), 2);
    default AddToInventory(UItMi_Stuff_Mug_01::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Plate_01::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 9);
    default m_UniqueName = n"IO_OC_CHEST_DIGGER528";
    default m_Lock = n"OC_Chest_Digger528_Lock";
    default m_LockDifficulty = 2;
}

UCLASS()
class UIO_OC_CHEST_DIGGER529: UIoChestDefault
{
    default AddToInventory(UItFo_Loaf::StaticClass(), 2);
    default AddToInventory(UItMw_2H_Axe_Pickaxe::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Plate_01::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 10);
    default m_UniqueName = n"IO_OC_CHEST_DIGGER529";
    default m_Lock = n"OC_Chest_Digger529_Lock";
    default m_LockDifficulty = 1;
}

UCLASS()
class UIO_OC_CHEST_DIGGER531: UIoChestDefault
{
    default AddToInventory(UItMi_Stuff_Pan_01::StaticClass(), 1);
    default AddToInventory(UItFo_Cheese::StaticClass(), 5);
    default AddToInventory(UItFo_Mutton_01::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Willow::StaticClass(), 2);
    default AddToInventory(UItMi_Stuff_Plate_01::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 5);
    default AddToInventory(UItMi_Oldcoin_01::StaticClass(), 1);
    default m_UniqueName = n"IO_OC_CHEST_DIGGER531";
    default m_Lock = n"OC_Chest_Digger531_Lock";
    default m_LockDifficulty = 3;
}

UCLASS()
class UIO_OC_CHEST_DIGGER532: UIoChestDefault
{
    default AddToInventory(UItFo_Cheese::StaticClass(), 2);
    default AddToInventory(UItFo_Loaf::StaticClass(), 3);
    default AddToInventory(UItMi_Stuff_Mug_01::StaticClass(), 1);
    default AddToInventory(UItMw_2H_Axe_Pickaxe::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Plate_01::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 11);
    default m_UniqueName = n"IO_OC_CHEST_DIGGER532";
    default m_Lock = n"OC_Chest_Digger532_Lock";
    default m_LockDifficulty = 3;
}

UCLASS()
class UIO_OC_CHEST_DIGGER533: UIoChestDefault
{
    default AddToInventory(UItMw_2H_Axe_Pickaxe::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Willow::StaticClass(), 1);
    default AddToInventory(UItFo_Mutton_01::StaticClass(), 3);
    default AddToInventory(UItMi_Stuff_Barbknife_01::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Water_01::StaticClass(), 3);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 13);
    default m_UniqueName = n"IO_OC_CHEST_DIGGER533";
    default m_Lock = n"OC_Chest_Digger533_Lock";
    default m_LockDifficulty = 2;
}

UCLASS()
class UIO_OC_CHEST_DIGGER535: UIoChestDefault
{
    default AddToInventory(UItFo_Cheese::StaticClass(), 3);
    default AddToInventory(UItFo_Potion_Water_01::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 4);
    default m_UniqueName = n"IO_OC_CHEST_DIGGER535";
    default m_Lock = n"OC_Chest_Digger535_Lock";
    default m_LockDifficulty = 2;
}

UCLASS()
class UIO_OC_CHEST_DIGGER553: UIoChestDefault
{
    default AddToInventory(UItFo_Mutton_01::StaticClass(), 2);
    default AddToInventory(UItMi_Stuff_Barbknife_01::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Mug_01::StaticClass(), 1);
    default AddToInventory(UItMw_2H_Axe_Pickaxe::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Water_01::StaticClass(), 2);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 5);
    default m_UniqueName = n"IO_OC_CHEST_DIGGER553";
    default m_Lock = n"OC_Chest_Digger553_Lock";
    default m_LockDifficulty = 2;
}

UCLASS()
class UIO_OC_CHEST_DIGGER554: UIoChestDefault
{
    default AddToInventory(UItMs_Scroll_LoveInterest::StaticClass(), 1);
    default AddToInventory(UItFo_Cheese::StaticClass(), 1);
    default AddToInventory(UItFo_Loaf::StaticClass(), 2);
    default AddToInventory(UItMi_Stuff_Mug_01::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 5);
    default m_UniqueName = n"IO_OC_CHEST_DIGGER554";
    default m_Lock = n"OC_Chest_Digger554_Lock";
    default m_LockDifficulty = 2;
}

UCLASS()
class UIO_OC_CHEST_DIGGER555: UIoChestDefault
{
    default AddToInventory(UItMi_Stuff_Pan_01::StaticClass(), 1);
    default AddToInventory(UItFo_Cheese::StaticClass(), 1);
    default AddToInventory(UItFo_Loaf::StaticClass(), 2);
    default AddToInventory(UItMi_Stuff_Barbknife_01::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Plate_01::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 8);
    default m_UniqueName = n"IO_OC_CHEST_DIGGER555";
    default m_Lock = n"OC_Chest_Digger555_Lock";
    default m_LockDifficulty = 3;
}

UCLASS()
class UIO_OC_CHEST_DIGGER556: UIoChestDefault
{
    default AddToInventory(UItMi_Stuff_Pan_01::StaticClass(), 1);
    default AddToInventory(UItFo_Mutton_01::StaticClass(), 2);
    default AddToInventory(UItFo_Potion_Water_01::StaticClass(), 3);
    default AddToInventory(UItMi_Stuff_Plate_01::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 13);
    default m_UniqueName = n"IO_OC_CHEST_DIGGER556";
    default m_Lock = n"OC_Chest_Digger556_Lock";
    default m_LockDifficulty = 2;
}

UCLASS()
class UIO_OC_CHEST_DIGGER557: UIoChestDefault
{
    default AddToInventory(UItMw_2H_Axe_Pickaxe::StaticClass(), 1);
    default AddToInventory(UItFo_Mutton_01::StaticClass(), 2);
    default AddToInventory(UItFo_Loaf::StaticClass(), 2);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 5);
    default m_UniqueName = n"IO_OC_CHEST_DIGGER557";
    default m_Lock = n"OC_Chest_Digger557_Lock";
    default m_LockDifficulty = 1;
}

UCLASS()
class UIO_OC_CHEST_DIGGER560: UIoChestDefault
{
    default AddToInventory(UItFo_Loaf::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Water_01::StaticClass(), 2);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 14);
    default m_UniqueName = n"IO_OC_CHEST_DIGGER560";
    default m_Lock = n"OC_Chest_Digger560_Lock";
    default m_LockDifficulty = 2;
}

UCLASS()
class UIO_OC_CHEST_DIGGER561: UIoChestDefault
{
    default AddToInventory(UItMw_2H_Axe_Pickaxe::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Leatherstraps::StaticClass(), 2);
    default AddToInventory(UItFo_Cheese::StaticClass(), 2);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 8);
    default m_UniqueName = n"IO_OC_CHEST_DIGGER561";
    default m_Lock = n"OC_Chest_Digger561_Lock";
    default m_LockDifficulty = 3;
}

UCLASS()
class UIO_OC_CHEST_DIGGER565: UIoChestDefault
{
    default AddToInventory(UItFo_Mutton_01::StaticClass(), 3);
    default AddToInventory(UItFo_Loaf::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Mug_01::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Water_01::StaticClass(), 3);
    default AddToInventory(UItMi_Stuff_Plate_01::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 8);
    default m_UniqueName = n"IO_OC_CHEST_DIGGER565";
    default m_Lock = n"OC_Chest_Digger565_Lock";
    default m_LockDifficulty = 2;
}

UCLASS()
class UIO_OC_CHEST_DIGGER575: UIoChestDefault
{
    default AddToInventory(UItMi_Stuff_Pan_01::StaticClass(), 1);
    default AddToInventory(UItFo_Mutton_01::StaticClass(), 1);
    default AddToInventory(UItFo_Loaf::StaticClass(), 3);
    default AddToInventory(UItMw_2H_Axe_Pickaxe::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Plate_01::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 8);
    default m_UniqueName = n"IO_OC_CHEST_DIGGER575";
    default m_Lock = n"OC_Chest_Digger575_Lock";
    default m_LockDifficulty = 2;
}

UCLASS()
class UIO_OC_CHEST_DIGGER576: UIoChestDefault
{
    default AddToInventory(UItMi_Stuff_Pan_01::StaticClass(), 1);
    default AddToInventory(UItFo_Cheese::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Barbknife_01::StaticClass(), 1);
    default AddToInventory(UItMw_2H_Axe_Pickaxe::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Water_01::StaticClass(), 3);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 7);
    default m_UniqueName = n"IO_OC_CHEST_DIGGER576";
    default m_Lock = n"OC_Chest_Digger576_Lock";
    default m_LockDifficulty = 3;
}

UCLASS()
class UIO_OC_CHEST_DIGGER577: UIoChestDefault
{
    default AddToInventory(UItFo_Cheese::StaticClass(), 1);
    default AddToInventory(UItFo_Mutton_01::StaticClass(), 2);
    default AddToInventory(UItFo_Loaf::StaticClass(), 3);
    default AddToInventory(UItFo_Potion_Water_01::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Mug_01::StaticClass(), 1);
    default AddToInventory(UItMw_2H_Axe_Pickaxe::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 7);
    default m_UniqueName = n"IO_OC_CHEST_DIGGER577";
    default m_Lock = n"OC_Chest_Digger577_Lock";
    default m_LockDifficulty = 3;
}

UCLASS()
class UIO_OC_CHEST_DIGGER578: UIoChestDefault
{
    default AddToInventory(UItFo_Cheese::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Brush::StaticClass(), 1);
    default m_UniqueName = n"IO_OC_CHEST_DIGGER578";
    default m_Lock = n"OC_Chest_Digger578_Lock";
    default m_LockDifficulty = 1;
}

UCLASS()
class UIO_OC_CHEST_DRAGO: UIoChestDefault
{
    default AddToInventory(UItWr_Book_Arcanum::StaticClass(), 1);
    default AddToInventory(UItWr_Book_Powerfulart::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Mana_02::StaticClass(), 2);
    default AddToInventory(UItFo_Potion_Wine::StaticClass(), 4);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 22);
    default m_UniqueName = n"IO_OC_CHEST_DRAGO";
    default m_Lock = n"OC_Chest_Drago_Lock";
    default m_LockDifficulty = 4;
}

UCLASS()
class UIO_OC_CHEST_DUSTY: UIoChestDefault
{
    default AddToInventory(UItMi_Joint_01::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Barbknife_01::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 22);
    default AddToInventory(UItMi_Oldcoin_01::StaticClass(), 3);
    default m_UniqueName = n"IO_OC_CHEST_DUSTY";
    default m_Lock = n"OC_Chest_Dusty_Lock";
    default m_LockDifficulty = 2;
}

UCLASS()
class UIO_OC_CHEST_FINGERS: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Health_01::StaticClass(), 2);
    default AddToInventory(UItKe_Lockpick::StaticClass(), 6);
    default AddToInventory(UItFo_Potion_Wine::StaticClass(), 2);
    default AddToInventory(UItFo_Mutton_01::StaticClass(), 4);
    default AddToInventory(UItFo_Loaf::StaticClass(), 3);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 19);
    default m_UniqueName = n"IO_OC_CHEST_FINGERS";
    default m_Lock = n"OC_Chest_Fingers_Lock";
    default m_LockDifficulty = 5;
}

UCLASS()
class UIO_OC_CHEST_FISK_01: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Wine::StaticClass(), 4);
    default AddToInventory(UItFo_Potion_Beer::StaticClass(), 2);
    default AddToInventory(UItFo_Mutton_01::StaticClass(), 3);
    default AddToInventory(UItFo_Loaf::StaticClass(), 2);
    default AddToInventory(UItMi_Stuff_Barbknife_01::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Mug_01::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Silverware_01::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 18);
    default m_UniqueName = n"IO_OC_CHEST_FISK_01";
    default m_Lock = n"OC_Chest_Fisk_01_Lock";
    default m_LockDifficulty = 5;
}

UCLASS()
class UIO_OC_CHEST_FISK_02: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Health_01::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Mana_01::StaticClass(), 1);
    default AddToInventory(UItMi_Alchemy_Sulphur_01::StaticClass(), 2);
    default AddToInventory(UItMi_Alchemy_Alcohol_01::StaticClass(), 2);
    default AddToInventory(UItMi_Stuff_Pan_01::StaticClass(), 4);
    default AddToInventory(UItMi_Stuff_Cup_01::StaticClass(), 3);
    default AddToInventory(UItMw_1H_Torch::StaticClass(), 7);
    default m_UniqueName = n"IO_OC_CHEST_FISK_02";
    default m_Lock = n"OC_Chest_Fisk_02_Lock";
    default m_LockDifficulty = 4;
}

UCLASS()
class UIO_OC_CHEST_FISK_03: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Wine::StaticClass(), 2);
    default AddToInventory(UItFo_Potion_Beer::StaticClass(), 3);
    default AddToInventory(UItFo_Cheese::StaticClass(), 6);
    default AddToInventory(UItFo_Mutton_01::StaticClass(), 5);
    default AddToInventory(UItFo_Loaf::StaticClass(), 4);
    default AddToInventory(UItFo_Potion_Water_01::StaticClass(), 4);
    default m_UniqueName = n"IO_OC_CHEST_FISK_03";
    default m_Lock = n"OC_Chest_Fisk_03_Lock";
    default m_LockDifficulty = 5;
}

UCLASS()
class UIO_OC_CHEST_FISK_04: UIoChestDefault
{
    default AddToInventory(UItRw_Bow_Small_01::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Leatherstraps::StaticClass(), 5);
    default AddToInventory(UItAt_Harpy_01::StaticClass(), 4);
    default AddToInventory(UItAm_Arrow::StaticClass(), 20);
    default m_UniqueName = n"IO_OC_CHEST_FISK_04";
    default m_Lock = n"OC_Chest_Fisk_04_Lock";
    default m_LockDifficulty = 4;
}

UCLASS()
class UIO_OC_CHEST_FISK_05: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Mana_02::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Health_02::StaticClass(), 2);
    default AddToInventory(UItFo_Plants_Herb_03::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Health_01::StaticClass(), 2);
    default AddToInventory(UItFo_Potion_Mana_01::StaticClass(), 2);
    default AddToInventory(UItMi_Alchemy_Quicksilver_01::StaticClass(), 1);
    default AddToInventory(UItFo_Plants_Stoneroot_01::StaticClass(), 2);
    default AddToInventory(UItFo_Plants_Herb_01::StaticClass(), 3);
    default AddToInventory(UItFo_Plants_Seraphis_01::StaticClass(), 2);
    default AddToInventory(UItFo_Plants_Flameberry_01::StaticClass(), 3);
    default AddToInventory(UItFo_Plants_Berrys_01::StaticClass(), 4);
    default m_UniqueName = n"IO_OC_CHEST_FISK_05";
    default m_Lock = n"OC_Chest_Fisk_05_Lock";
    default m_LockDifficulty = 6;
}

UCLASS()
class UIO_OC_CHEST_FISK_06: UIoChestDefault
{
    default AddToInventory(UItAt_Shadow_01::StaticClass(), 1);
    default AddToInventory(UItAt_Crawler_02::StaticClass(), 2);
    default AddToInventory(UItAt_Wolf_01::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Gold::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Iron::StaticClass(), 3);
    default m_UniqueName = n"IO_OC_CHEST_FISK_06";
    default m_Lock = n"OC_Chest_Fisk_06_Lock";
    default m_LockDifficulty = 4;
}

UCLASS()
class UIO_OC_CHEST_FISK_07: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Wine::StaticClass(), 2);
    default AddToInventory(UItFo_Potion_Booze::StaticClass(), 2);
    default AddToInventory(UItFo_Potion_Beer::StaticClass(), 3);
    default AddToInventory(UItFo_Cheese::StaticClass(), 3);
    default AddToInventory(UItFo_Mutton_02::StaticClass(), 4);
    default AddToInventory(UItFo_Loaf::StaticClass(), 5);
    default AddToInventory(UItFo_Rice::StaticClass(), 4);
    default m_UniqueName = n"IO_OC_CHEST_FISK_07";
    default m_Lock = n"OC_Chest_Fisk_07_Lock";
    default m_LockDifficulty = 4;
}

UCLASS()
class UIO_OC_CHEST_FISK_08: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Health_Quick::StaticClass(), 3);
    default AddToInventory(UItFo_Potion_Mana_01::StaticClass(), 2);
    default AddToInventory(UItMi_Stuff_Pan_01::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Mug_01::StaticClass(), 4);
    default AddToInventory(UItMi_Stuff_Cup_01::StaticClass(), 3);
    default AddToInventory(UItMi_Stuff_Plate_01::StaticClass(), 4);
    default m_UniqueName = n"IO_OC_CHEST_FISK_08";
    default m_Lock = n"OC_Chest_Fisk_08_Lock";
    default m_LockDifficulty = 4;
}

UCLASS()
class UIO_OC_CHEST_FLETCHER: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Beer::StaticClass(), 3);
    default AddToInventory(UItFo_Mutton_01::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Barbknife_01::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Cup_01::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 11);
    default m_UniqueName = n"IO_OC_CHEST_FLETCHER";
    default m_Lock = n"OC_Chest_Fletcher_Lock";
    default m_LockDifficulty = 2;
}

UCLASS()
class UIO_OC_CHEST_FORGE_01: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Beer::StaticClass(), 5);
    default AddToInventory(UItFo_Mutton_01::StaticClass(), 3);
    default AddToInventory(UItMi_Stuff_Cup_01::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Plate_01::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 31);
    default m_UniqueName = n"IO_OC_CHEST_FORGE_01";
    default m_Lock = n"OC_Chest_Forge_01_Lock";
    default m_LockDifficulty = 4;
}

UCLASS()
class UIO_OC_CHEST_FORGE_02: UIoChestDefault
{
    default AddToInventory(UItMw_2H_Sword_Old_01::StaticClass(), 1);
    default AddToInventory(UItMw_1H_Sword_Short_01::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Oak::StaticClass(), 6);
    default AddToInventory(UItMi_Smith_Iron::StaticClass(), 3);
    default AddToInventory(UItMi_Smith_Willow::StaticClass(), 8);
    default m_UniqueName = n"IO_OC_CHEST_FORGE_02";
    default m_Lock = n"OC_Chest_Forge_02_Lock";
    default m_LockDifficulty = 7;
}

UCLASS()
class UIO_OC_CHEST_FORGE_03: UIoChestDefault
{
    default AddToInventory(UItMi_Smith_Ironwood::StaticClass(), 2);
    default AddToInventory(UItMi_Smith_Steel::StaticClass(), 2);
    default AddToInventory(UItMi_Smith_Iron::StaticClass(), 4);
    default AddToInventory(UItMi_Smith_Leatherstraps::StaticClass(), 6);
    default AddToInventory(UItMi_Stuff_Amphore_01::StaticClass(), 1);
    default m_UniqueName = n"IO_OC_CHEST_FORGE_03";
}

UCLASS()
class UIO_OC_CHEST_FORGE_04: UIoChestDefault
{
    default AddToInventory(UItMw_1H_Sword_03::StaticClass(), 1);
    default AddToInventory(UItMw_1H_Sword_Short_03::StaticClass(), 1);
    default AddToInventory(UItMw_1H_Sword_Short_05::StaticClass(), 1);
    default AddToInventory(UItMw_1H_Sword_Short_04::StaticClass(), 1);
    default AddToInventory(UItMw_1H_Sword_Short_02::StaticClass(), 1);
    default AddToInventory(UItMw_1H_Sword_Short_01::StaticClass(), 1);
    default m_UniqueName = n"IO_OC_CHEST_FORGE_04";
    default m_Lock = n"OC_Chest_Forge_04_Lock";
    default m_LockDifficulty = 6;
}

UCLASS()
class UIO_OC_CHEST_GORHANIS: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Health_01::StaticClass(), 1);
    default AddToInventory(UItFo_Cheese::StaticClass(), 2);
    default AddToInventory(UItMi_Stuff_Idologront_01::StaticClass(), 1);
    default AddToInventory(UItFo_Loaf::StaticClass(), 3);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 18);
    default m_UniqueName = n"IO_OC_CHEST_GORHANIS";
    default m_Lock = n"OC_Chest_GorHanis_Lock";
    default m_LockDifficulty = 4;
}

UCLASS()
class UIO_OC_CHEST_GRAHAM: UIoChestDefault
{
    default AddToInventory(UItMi_Inscription_Parchment::StaticClass(), 5);
    default AddToInventory(UItMi_Smith_Leatherstraps::StaticClass(), 2);
    default AddToInventory(UItFo_Mutton_01::StaticClass(), 2);
    default AddToInventory(UItMi_Stuff_Plate_01::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 12);
    default m_UniqueName = n"IO_OC_CHEST_GRAHAM";
    default m_Lock = n"OC_Chest_Graham_Lock";
    default m_LockDifficulty = 6;
}

UCLASS()
class UIO_OC_CHEST_GRAVO: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Health_Quick::StaticClass(), 1);
    default AddToInventory(UItFo_Cheese::StaticClass(), 1);
    default AddToInventory(UItFo_Mutton_01::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Plate_01::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 19);
    default m_UniqueName = n"IO_OC_CHEST_GRAVO";
    default m_Lock = n"OC_Chest_Gravo_Lock";
    default m_LockDifficulty = 3;
}

UCLASS()
class UIO_OC_CHEST_GRIM: UIoChestDefault
{
    default AddToInventory(UItMi_Smith_Leatherstraps::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Pan_01::StaticClass(), 1);
    default AddToInventory(UItFo_Cheese::StaticClass(), 3);
    default AddToInventory(UItFo_Loaf::StaticClass(), 2);
    default AddToInventory(UItMi_Stuff_Barbknife_01::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Plate_01::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 5);
    default m_UniqueName = n"IO_OC_CHEST_GRIM";
    default m_Lock = n"OC_Chest_Grim_Lock";
    default m_LockDifficulty = 3;
}

UCLASS()
class UIO_OC_CHEST_CUTTER: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Beer::StaticClass(), 3);
    default AddToInventory(UItFo_Mutton_01::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Cup_01::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 18);
    default m_UniqueName = n"IO_OC_CHEST_CUTTER";
    default m_Lock = n"OC_Chest_Cutter_Lock";
    default m_LockDifficulty = 3;
}

UCLASS()
class UIO_OC_CHEST_GUARD206: UIoChestDefault
{
    default AddToInventory(UItFo_Mutton_01::StaticClass(), 3);
    default AddToInventory(UItFo_Potion_Water_01::StaticClass(), 1);
    default AddToInventory(UItFo_Sausage::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Cup_01::StaticClass(), 1);
    default m_UniqueName = n"IO_OC_CHEST_GUARD206";
    default m_Lock = n"OC_Chest_Guard206_Lock";
    default m_LockDifficulty = 2;
}

UCLASS()
class UIO_OC_CHEST_GUARD209: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Beer::StaticClass(), 2);
    default AddToInventory(UItFo_Loaf::StaticClass(), 2);
    default AddToInventory(UItFo_Lemon::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 12);
    default m_UniqueName = n"IO_OC_CHEST_GUARD209";
    default m_Lock = n"OC_Chest_Guard209_Lock";
    default m_LockDifficulty = 2;
}

UCLASS()
class UIO_OC_CHEST_GUARD220: UIoChestDefault
{
    default AddToInventory(UItMi_Stuff_Pan_01::StaticClass(), 1);
    default AddToInventory(UItFo_Muttonraw::StaticClass(), 4);
    default AddToInventory(UItMi_Stuff_Brush::StaticClass(), 1);
    default m_UniqueName = n"IO_OC_CHEST_GUARD220";
    default m_Lock = n"OC_Chest_Guard220_Lock";
    default m_LockDifficulty = 2;
}

UCLASS()
class UIO_OC_CHEST_GUARD221: UIoChestDefault
{
    default AddToInventory(UItFo_Plants_Herb_01::StaticClass(), 2);
    default AddToInventory(UItMi_Joint_01::StaticClass(), 2);
    default AddToInventory(UItFo_Potion_Water_01::StaticClass(), 1);
    default AddToInventory(UItAm_Bolt::StaticClass(), 3);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 10);
    default m_UniqueName = n"IO_OC_CHEST_GUARD221";
    default m_Lock = n"OC_Chest_Guard221_Lock";
    default m_LockDifficulty = 3;
}

UCLASS()
class UIO_OC_CHEST_GUARD226: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Beer::StaticClass(), 1);
    default AddToInventory(UItFo_Mutton_01::StaticClass(), 2);
    default AddToInventory(UItMi_Stuff_Cup_01::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 16);
    default m_UniqueName = n"IO_OC_CHEST_GUARD226";
    default m_Lock = n"OC_Chest_Guard226_Lock";
    default m_LockDifficulty = 2;
}

UCLASS()
class UIO_OC_CHEST_GUARD228: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Beer::StaticClass(), 1);
    default AddToInventory(UItFo_Mutton_01::StaticClass(), 5);
    default AddToInventory(UItMi_Stuff_Cup_01::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 20);
    default m_UniqueName = n"IO_OC_CHEST_GUARD228";
    default m_Lock = n"OC_Chest_Guard228_Lock";
    default m_LockDifficulty = 3;
}

UCLASS()
class UIO_OC_CHEST_GUARD229: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Beer::StaticClass(), 1);
    default AddToInventory(UItFo_Mutton_01::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 8);
    default m_UniqueName = n"IO_OC_CHEST_GUARD229";
    default m_Lock = n"OC_Chest_Guard229_Lock";
    default m_LockDifficulty = 2;
}

UCLASS()
class UIO_OC_CHEST_GUARD230: UIoChestDefault
{
    default AddToInventory(UItRw_Bow_Small_03::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Wine::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Beer::StaticClass(), 3);
    default AddToInventory(UItAm_Arrow::StaticClass(), 7);
    default m_UniqueName = n"IO_OC_CHEST_GUARD230";
    default m_Lock = n"OC_Chest_Guard230_Lock";
    default m_LockDifficulty = 4;
}

UCLASS()
class UIO_OC_CHEST_GUARD232: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Beer::StaticClass(), 3);
    default AddToInventory(UItMi_Stuff_Barbknife_01::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Cup_01::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 11);
    default m_UniqueName = n"IO_OC_CHEST_GUARD232";
    default m_Lock = n"OC_Chest_Guard232_Lock";
    default m_LockDifficulty = 2;
}

UCLASS()
class UIO_OC_CHEST_GUARD239: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Beer::StaticClass(), 1);
    default AddToInventory(UItFo_Mutton_01::StaticClass(), 2);
    default AddToInventory(UItMi_Stuff_Pipe_01::StaticClass(), 1);
    default m_UniqueName = n"IO_OC_CHEST_GUARD239";
    default m_Lock = n"OC_Chest_Guard239_Lock";
    default m_LockDifficulty = 3;
}

UCLASS()
class UIO_OC_CHEST_GUARD240: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Beer::StaticClass(), 1);
    default AddToInventory(UItFo_Mutton_01::StaticClass(), 3);
    default AddToInventory(UItMi_Stuff_Cup_01::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 16);
    default m_UniqueName = n"IO_OC_CHEST_GUARD240";
    default m_Lock = n"OC_Chest_Guard240_Lock";
    default m_LockDifficulty = 3;
}

UCLASS()
class UIO_OC_CHEST_GUARD241: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Strongbeer::StaticClass(), 1);
    default AddToInventory(UItFo_Cheese::StaticClass(), 1);
    default AddToInventory(UItFo_Carrot::StaticClass(), 3);
    default AddToInventory(UItFo_Cabbage::StaticClass(), 4);
    default AddToInventory(UItMi_Stuff_Plate_01::StaticClass(), 1);
    default AddToInventory(UItFo_Lemon::StaticClass(), 5);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 16);
    default m_UniqueName = n"IO_OC_CHEST_GUARD241";
    default m_Lock = n"OC_Chest_Guard241_Lock";
    default m_LockDifficulty = 4;
}

UCLASS()
class UIO_OC_CHEST_GUARD242: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Beer::StaticClass(), 5);
    default AddToInventory(UItMi_Stuff_Barbknife_01::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Cup_01::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 11);
    default m_UniqueName = n"IO_OC_CHEST_GUARD242";
    default m_Lock = n"OC_Chest_Guard242_Lock";
    default m_LockDifficulty = 3;
}

UCLASS()
class UIO_OC_CHEST_GUARD252: UIoChestDefault
{
    default AddToInventory(UItFo_Plants_Herb_02::StaticClass(), 2);
    default AddToInventory(UItMi_Joint_02::StaticClass(), 3);
    default AddToInventory(UItAm_Arrow::StaticClass(), 10);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 14);
    default m_UniqueName = n"IO_OC_CHEST_GUARD252";
    default m_Lock = n"OC_Chest_Guard252_Lock";
    default m_LockDifficulty = 4;
}

UCLASS()
class UIO_OC_CHEST_GUARD253: UIoChestDefault
{
    default AddToInventory(UItMi_Stuff_Pan_01::StaticClass(), 1);
    default AddToInventory(UItFo_Mutton_01::StaticClass(), 3);
    default AddToInventory(UItFo_Potion_Water_01::StaticClass(), 2);
    default m_UniqueName = n"IO_OC_CHEST_GUARD253";
    default m_Lock = n"OC_Chest_Guard253_Lock";
    default m_LockDifficulty = 2;
}

UCLASS()
class UIO_OC_CHEST_GUY: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Health_Quick::StaticClass(), 2);
    default AddToInventory(UItFo_Potion_Beer::StaticClass(), 1);
    default AddToInventory(UItFo_Cheese::StaticClass(), 3);
    default AddToInventory(UItFo_Mutton_01::StaticClass(), 6);
    default AddToInventory(UItMi_Stuff_Mug_01::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 6);
    default m_UniqueName = n"IO_OC_CHEST_GUY";
    default m_Lock = n"OC_Chest_Guy_Lock";
    default m_LockDifficulty = 5;
}

UCLASS()
class UIO_OC_CHEST_HEREK: UIoChestDefault
{
    default AddToInventory(UItMi_Stuff_Barbknife_01::StaticClass(), 2);
    default AddToInventory(UItFo_Potion_Water_01::StaticClass(), 1);
    default AddToInventory(UItFo_Mutton_02::StaticClass(), 1);
    default m_UniqueName = n"IO_OC_CHEST_HEREK";
}

UCLASS()
class UIO_OC_CHEST_HUNO: UIoChestDefault
{
    default AddToInventory(UItMi_Stuff_Cup_02::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Wine::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Iron::StaticClass(), 1);
    default AddToInventory(UItFo_Mutton_01::StaticClass(), 3);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 18);
    default m_UniqueName = n"IO_OC_CHEST_HUNO";
    default m_Lock = n"OC_Chest_Huno_Lock";
    default m_LockDifficulty = 4;
}

UCLASS()
class UIO_OC_CHEST_JACKAL: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Beer::StaticClass(), 1);
    default AddToInventory(UItFo_Mutton_01::StaticClass(), 3);
    default AddToInventory(UItMi_Stuff_Barbknife_01::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 10);
    default m_UniqueName = n"IO_OC_CHEST_JACKAL";
    default m_Lock = n"OC_Chest_Jackal_Lock";
    default m_LockDifficulty = 3;
}

UCLASS()
class UIO_OC_CHEST_JESSE: UIoChestDefault
{
    default AddToInventory(UItMi_Stuff_Pan_01::StaticClass(), 1);
    default AddToInventory(UItFo_Cheese::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Mug_01::StaticClass(), 2);
    default AddToInventory(UItMi_Stuff_Cup_01::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Plate_01::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 6);
    default AddToInventory(UItMi_Oldcoin_01::StaticClass(), 20);
    default m_UniqueName = n"IO_OC_CHEST_JESSE";
    default m_Lock = n"OC_Chest_Jesse_Lock";
    default m_LockDifficulty = 2;
}

UCLASS()
class UIO_OC_CHEST_KHARIM: UIoChestDefault
{
    default AddToInventory(UItMi_Stuff_Pan_01::StaticClass(), 1);
    default AddToInventory(UItFo_Cheese::StaticClass(), 1);
    default AddToInventory(UItFo_Loaf::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 4);
    default m_UniqueName = n"IO_OC_CHEST_KHARIM";
    default m_Lock = n"OC_Chest_Kharim_Lock";
    default m_LockDifficulty = 2;
}

UCLASS()
class UIO_OC_CHEST_KIRGO: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Health_01::StaticClass(), 2);
    default AddToInventory(UItMi_Smith_Iron::StaticClass(), 2);
    default AddToInventory(UItFo_Mutton_01::StaticClass(), 3);
    default AddToInventory(UItMi_Stuff_Mug_01::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Water_01::StaticClass(), 2);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 18);
    default m_UniqueName = n"IO_OC_CHEST_KIRGO";
    default m_Lock = n"OC_Chest_Kirgo_Lock";
    default m_LockDifficulty = 4;
}

UCLASS()
class UIO_OC_CHEST_KITCHEN: UIoChestDefault
{
    default AddToInventory(UItFo_Plants_Mistcap::StaticClass(), 4);
    default AddToInventory(UItFo_Cheese::StaticClass(), 3);
    default AddToInventory(UItFo_Plants_Mushroom_02::StaticClass(), 5);
    default AddToInventory(UItFo_Cabbage::StaticClass(), 2);
    default AddToInventory(UItFo_Pear::StaticClass(), 2);
    default AddToInventory(UItFo_Sausage::StaticClass(), 2);
    default AddToInventory(UItFo_Carrot::StaticClass(), 3);
    default AddToInventory(UItFo_Onion::StaticClass(), 2);
    default AddToInventory(UItFo_Potato::StaticClass(), 3);
    default m_UniqueName = n"IO_OC_CHEST_KITCHEN";
    default m_Lock = n"OC_Chest_Kitchen_Lock";
    default m_LockDifficulty = 4;
}

UCLASS()
class UIO_OC_CHEST_KYLE: UIoChestDefault
{
    default AddToInventory(UItFo_Cheese::StaticClass(), 3);
    default AddToInventory(UItFo_Potion_Water_01::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Mug_01::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 16);
    default m_UniqueName = n"IO_OC_CHEST_KYLE";
    default m_Lock = n"OC_Chest_Kyle_Lock";
    default m_LockDifficulty = 3;
}

UCLASS()
class UIO_OC_CHEST_MILTEN: UIoChestDefault
{
    default AddToInventory(UItAr_Scroll_TransformMeatbug::StaticClass(), 1);
    default AddToInventory(UItAr_Scroll_FireBall::StaticClass(), 2);
    default AddToInventory(UItAr_Scroll_FireBolt::StaticClass(), 3);
    default AddToInventory(UItFo_Potion_Mana_01::StaticClass(), 2);
    default AddToInventory(UItFo_Potion_Health_02::StaticClass(), 1);
    default m_UniqueName = n"IO_OC_CHEST_MILTEN";
    default m_Lock = n"OC_Chest_Milten_Lock";
    default m_LockDifficulty = 5;
}

UCLASS()
class UIO_OC_CHEST_MORDRAG: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Booze::StaticClass(), 3);
    default AddToInventory(UItFo_Mutton_01::StaticClass(), 4);
    default AddToInventory(UItFo_Rice::StaticClass(), 2);
    default AddToInventory(UItMi_Stuff_Barbknife_01::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Plate_01::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 24);
    default m_UniqueName = n"IO_OC_CHEST_MORDRAG";
    default m_Lock = n"OC_Chest_Mordrag_Lock";
    default m_LockDifficulty = 4;
}

UCLASS()
class UIO_OC_CHEST_MUD: UIoChestDefault
{
    default AddToInventory(UItFo_Loaf::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Mug_01::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Plate_01::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 3);
    default m_UniqueName = n"IO_OC_CHEST_MUD";
    default m_Lock = n"OC_Chest_Mud_Lock";
    default m_LockDifficulty = 1;
}

UCLASS()
class UIO_OC_CHEST_NAMELESS: UIoChestDefault
{
    default AddToInventory(UItMs_Scroll_OldRecipe::StaticClass(), 1);
    default m_UniqueName = n"IO_OC_CHEST_NAMELESS";
}

UCLASS()
class UIO_OC_CHEST_OMID: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Beer::StaticClass(), 1);
    default AddToInventory(UItFo_Mutton_01::StaticClass(), 5);
    default AddToInventory(UItMi_Stuff_Cup_01::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 8);
    default m_UniqueName = n"IO_OC_CHEST_OMID";
    default m_Lock = n"OC_Chest_Omid_Lock";
    default m_LockDifficulty = 2;
}

UCLASS()
class UIO_OC_CHEST_RAVEN: UIoChestDefault
{
    default AddToInventory(UItKe_RavenTower::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Health_02::StaticClass(), 2);
    default AddToInventory(UItMi_Joint_03::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Candlestick_01::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Silverware_01::StaticClass(), 2);
    default AddToInventory(UItMi_Oldcoin_01::StaticClass(), 40);
    default m_UniqueName = n"IO_OC_CHEST_RAVEN";
    default m_Lock = n"OC_Chest_Raven_Lock";
    default m_LockDifficulty = 6;
}

UCLASS()
class UIO_OC_CHEST_RODRIGUEZ: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Health_Perma_02::StaticClass(), 1);
    default AddToInventory(UItAr_Scroll_Light::StaticClass(), 2);
    default AddToInventory(UItFo_Potion_Mana_02::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Wine::StaticClass(), 2);
    default m_UniqueName = n"IO_OC_CHEST_RODRIGUEZ";
    default m_Lock = n"OC_Chest_Rodriguez_Lock";
    default m_LockDifficulty = 4;
}

UCLASS()
class UIO_OC_CHEST_RUINS_01: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Health_01::StaticClass(), 2);
    default AddToInventory(UItFo_Potion_Beer::StaticClass(), 3);
    default AddToInventory(UItFo_Mutton_01::StaticClass(), 5);
    default AddToInventory(UItMi_Stuff_Cup_01::StaticClass(), 1);
    default AddToInventory(UItAm_Bolt::StaticClass(), 20);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 21);
    default m_UniqueName = n"IO_OC_CHEST_RUINS_01";
    default m_Lock = n"OC_Chest_Ruins_01_Lock";
    default m_LockDifficulty = 4;
}

UCLASS()
class UIO_OC_CHEST_RUINS_02: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Beer::StaticClass(), 4);
    default AddToInventory(UItFo_Mutton_01::StaticClass(), 2);
    default AddToInventory(UItMi_Stuff_Barbknife_01::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Cup_01::StaticClass(), 1);
    default AddToInventory(UItMw_1H_Torch::StaticClass(), 3);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 12);
    default m_UniqueName = n"IO_OC_CHEST_RUINS_02";
    default m_Lock = n"OC_Chest_Ruins_02_Lock";
    default m_LockDifficulty = 3;
}

UCLASS()
class UIO_OC_CHEST_SCAR: UIoChestDefault
{
    default AddToInventory(UItAt_Ring_Life_02::StaticClass(), 1);
    default AddToInventory(UItAt_Shadow_01::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Health_01::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Silverware_01::StaticClass(), 1);
    default m_UniqueName = n"IO_OC_CHEST_SCAR";
    default m_Lock = n"OC_Chest_Scar_Lock";
    default m_LockDifficulty = 7;
}

UCLASS()
class UIO_OC_CHEST_SCATTY: UIoChestDefault
{
    default AddToInventory(UItAt_Ring_Scatty::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Pan_01::StaticClass(), 1);
    default AddToInventory(UItFo_Cheese::StaticClass(), 4);
    default AddToInventory(UItFo_Loaf::StaticClass(), 2);
    default AddToInventory(UItMi_Stuff_Barbknife_01::StaticClass(), 1);
    default AddToInventory(UItMw_2H_Axe_Pickaxe::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 16);
    default m_UniqueName = n"IO_OC_CHEST_SCATTY";
    default m_Lock = n"OC_Chest_Scatty_Lock";
    default m_LockDifficulty = 3;
}

UCLASS()
class UIO_OC_CHEST_SCORPIO: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Beer::StaticClass(), 2);
    default AddToInventory(UItFo_Mutton_01::StaticClass(), 3);
    default AddToInventory(UItMi_Stuff_Cup_01::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 18);
    default m_UniqueName = n"IO_OC_CHEST_SCORPIO";
    default m_Lock = n"OC_Chest_Scorpio_Lock";
    default m_LockDifficulty = 3;
}

UCLASS()
class UIO_OC_CHEST_SHADOW304: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Health_01::StaticClass(), 3);
    default AddToInventory(UItMi_Smith_Leatherstraps::StaticClass(), 2);
    default AddToInventory(UItFo_Cheese::StaticClass(), 2);
    default AddToInventory(UItMi_Stuff_Cup_01::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 11);
    default m_UniqueName = n"IO_OC_CHEST_SHADOW304";
    default m_Lock = n"OC_Chest_Shadow304_Lock";
    default m_LockDifficulty = 4;
}

UCLASS()
class UIO_OC_CHEST_SHADOW306: UIoChestDefault
{
    default AddToInventory(UItMi_Smith_Iron::StaticClass(), 1);
    default AddToInventory(UItFo_Mutton_01::StaticClass(), 4);
    default AddToInventory(UItFo_Loaf::StaticClass(), 3);
    default AddToInventory(UItMi_Stuff_Mug_01::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Water_01::StaticClass(), 2);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 10);
    default m_UniqueName = n"IO_OC_CHEST_SHADOW306";
    default m_Lock = n"OC_Chest_Shadow306_Lock";
    default m_LockDifficulty = 3;
}

UCLASS()
class UIO_OC_CHEST_SHADOW310: UIoChestDefault
{
    default AddToInventory(UItFo_Cheese::StaticClass(), 2);
    default AddToInventory(UItMi_Stuff_Cup_01::StaticClass(), 1);
    default AddToInventory(UItMi_Oldcoin_01::StaticClass(), 5);
    default m_UniqueName = n"IO_OC_CHEST_SHADOW310";
    default m_Lock = n"OC_Chest_Shadow310_Lock";
    default m_LockDifficulty = 1;
}

UCLASS()
class UIO_OC_CHEST_SHADOW313: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Wine::StaticClass(), 2);
    default AddToInventory(UItFo_Mutton_01::StaticClass(), 4);
    default AddToInventory(UItFo_Loaf::StaticClass(), 3);
    default AddToInventory(UItMi_Stuff_Mug_01::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Plate_01::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 16);
    default AddToInventory(UItMi_Oldcoin_01::StaticClass(), 4);
    default m_UniqueName = n"IO_OC_CHEST_SHADOW313";
    default m_Lock = n"OC_Chest_Shadow313_Lock";
    default m_LockDifficulty = 4;
}

UCLASS()
class UIO_OC_CHEST_SHADOW314: UIoChestDefault
{
    default AddToInventory(UItFo_Cheese::StaticClass(), 4);
    default AddToInventory(UItFo_Mutton_01::StaticClass(), 4);
    default AddToInventory(UItMi_Stuff_Plate_01::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 8);
    default AddToInventory(UItMi_Oldcoin_01::StaticClass(), 13);
    default m_UniqueName = n"IO_OC_CHEST_SHADOW314";
    default m_Lock = n"OC_Chest_Shadow314_Lock";
    default m_LockDifficulty = 3;
}

UCLASS()
class UIO_OC_CHEST_SHADOW316: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Health_01::StaticClass(), 3);
    default AddToInventory(UItFo_Potion_Beer::StaticClass(), 2);
    default AddToInventory(UItFo_Cheese::StaticClass(), 1);
    default AddToInventory(UItFo_Mutton_01::StaticClass(), 5);
    default AddToInventory(UItMw_2H_Axe_Pickaxe::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 16);
    default m_UniqueName = n"IO_OC_CHEST_SHADOW316";
    default m_Lock = n"OC_Chest_Shadow316_Lock";
    default m_LockDifficulty = 4;
}

UCLASS()
class UIO_OC_CHEST_SHADOW318: UIoChestDefault
{
    default AddToInventory(UItMi_Stuff_Pan_01::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Beer::StaticClass(), 2);
    default AddToInventory(UItFo_Cheese::StaticClass(), 2);
    default AddToInventory(UItFo_Mutton_01::StaticClass(), 3);
    default AddToInventory(UItMi_Stuff_Mug_01::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Plate_01::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 5);
    default m_UniqueName = n"IO_OC_CHEST_SHADOW318";
    default m_Lock = n"OC_Chest_Shadow318_Lock";
    default m_LockDifficulty = 4;
}

UCLASS()
class UIO_OC_CHEST_SHADOW319: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Health_01::StaticClass(), 2);
    default AddToInventory(UItFo_Cheese::StaticClass(), 3);
    default AddToInventory(UItFo_Mutton_01::StaticClass(), 4);
    default AddToInventory(UItMi_Stuff_Mug_01::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 14);
    default m_UniqueName = n"IO_OC_CHEST_SHADOW319";
    default m_Lock = n"OC_Chest_Shadow319_Lock";
    default m_LockDifficulty = 4;
}

UCLASS()
class UIO_OC_CHEST_SHADOW322: UIoChestDefault
{
    default AddToInventory(UItMi_Stuff_Pan_01::StaticClass(), 1);
    default AddToInventory(UItFo_Mutton_01::StaticClass(), 4);
    default AddToInventory(UItFo_Potion_Water_01::StaticClass(), 3);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 9);
    default m_UniqueName = n"IO_OC_CHEST_SHADOW322";
    default m_Lock = n"OC_Chest_Shadow322_Lock";
    default m_LockDifficulty = 3;
}

UCLASS()
class UIO_OC_CHEST_SHADOW328: UIoChestDefault
{
    default AddToInventory(UItFo_Cheese::StaticClass(), 2);
    default AddToInventory(UItFo_Loaf::StaticClass(), 4);
    default AddToInventory(UItMi_Stuff_Barbknife_01::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Water_01::StaticClass(), 2);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 8);
    default m_UniqueName = n"IO_OC_CHEST_SHADOW328";
    default m_Lock = n"OC_Chest_Shadow328_Lock";
    default m_LockDifficulty = 3;
}

UCLASS()
class UIO_OC_CHEST_SHADOW330: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Health_01::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Leatherstraps::StaticClass(), 4);
    default AddToInventory(UItFo_Mutton_01::StaticClass(), 1);
    default AddToInventory(UItMw_2H_Axe_Pickaxe::StaticClass(), 1);
    default m_UniqueName = n"IO_OC_CHEST_SHADOW330";
    default m_Lock = n"OC_Chest_Shadow330_Lock";
    default m_LockDifficulty = 3;
}

UCLASS()
class UIO_OC_CHEST_SKIP: UIoChestDefault
{
    default AddToInventory(UItMi_Joint_03::StaticClass(), 1);
    default AddToInventory(UItKe_Lockpick::StaticClass(), 4);
    default AddToInventory(UItFo_Potion_Beer::StaticClass(), 2);
    default AddToInventory(UItFo_Meatbugsauteed::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 22);
    default m_UniqueName = n"IO_OC_CHEST_SKIP";
    default m_Lock = n"OC_Chest_Skip_Lock";
    default m_LockDifficulty = 4;
}

UCLASS()
class UIO_OC_CHEST_SLY: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Health_Quick::StaticClass(), 2);
    default AddToInventory(UItMi_Smith_Leatherstraps::StaticClass(), 3);
    default AddToInventory(UItFo_Mutton_01::StaticClass(), 3);
    default AddToInventory(UItFo_Loaf::StaticClass(), 2);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 7);
    default m_UniqueName = n"IO_OC_CHEST_SLY";
    default m_Lock = n"OC_Chest_Sly_Lock";
    default m_LockDifficulty = 5;
}

UCLASS()
class UIO_OC_CHEST_SNAF_01: UIoChestDefault
{
    default AddToInventory(UItWr_Book_Recipes_01::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Water_01::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Plate_01::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 16);
    default m_UniqueName = n"IO_OC_CHEST_SNAF_01";
    default m_Lock = n"OC_Chest_Snaf_01_Lock";
    default m_LockDifficulty = 1;
}

UCLASS()
class UIO_OC_CHEST_SNAF_02: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Wine::StaticClass(), 2);
    default AddToInventory(UItFo_Cheese::StaticClass(), 1);
    default AddToInventory(UItFo_Mutton_02::StaticClass(), 3);
    default AddToInventory(UItFo_Mutton_01::StaticClass(), 6);
    default AddToInventory(UItFo_Loaf::StaticClass(), 5);
    default AddToInventory(UItAt_Meatbug_01::StaticClass(), 6);
    default m_UniqueName = n"IO_OC_CHEST_SNAF_02";
    default m_Lock = n"OC_Chest_Snaf_02_Lock";
    default m_LockDifficulty = 4;
}

UCLASS()
class UIO_OC_CHEST_STONE: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Beer::StaticClass(), 1);
    default AddToInventory(UItFo_Mutton_01::StaticClass(), 4);
    default AddToInventory(UItMi_Stuff_Cup_01::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 16);
    default m_UniqueName = n"IO_OC_CHEST_STONE";
    default m_Lock = n"OC_Chest_Stone_Lock";
    default m_LockDifficulty = 3;
}

UCLASS()
class UIO_OC_CHEST_THORUS: UIoChestDefault
{
    default AddToInventory(UItAt_Ring_Magic_03::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Health_02::StaticClass(), 2);
    default AddToInventory(UItMi_Stuff_Silverware_01::StaticClass(), 1);
    default m_UniqueName = n"IO_OC_CHEST_THORUS";
    default m_Lock = n"OC_Chest_Thorus_Lock";
    default m_LockDifficulty = 5;
}

UCLASS()
class UIO_OC_CHEST_THRONE_01: UIoChestDefault
{
    default AddToInventory(UItMs_Scroll_WeaponDesign::StaticClass(), 1);
    default AddToInventory(UItAt_Wolf_01::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Ruby::StaticClass(), 2);
    default AddToInventory(UItMi_Stuff_Cup_02::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 42);
    default m_UniqueName = n"IO_OC_CHEST_THRONE_01";
    default m_Keys.Add(n"ItKe_Gomez_01");
    default m_Lock = n"OC_Chest_Throne_01_Lock";
    default m_LockDifficulty = 1;
}

UCLASS()
class UIO_OC_CHEST_TORREZ: UIoChestDefault
{
    default AddToInventory(UItAr_Scroll_FireRain::StaticClass(), 1);
    default AddToInventory(UItAr_Scroll_FireBolt::StaticClass(), 2);
    default AddToInventory(UItMi_Inscription_Parchment::StaticClass(), 2);
    default AddToInventory(UItFo_Potion_Mana_02::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Wine::StaticClass(), 1);
    default m_UniqueName = n"IO_OC_CHEST_TORREZ";
    default m_Lock = n"OC_Chest_Torrez_Lock";
    default m_LockDifficulty = 5;
}

UCLASS()
class UIO_OC_CHEST_TOWER_01: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Wine::StaticClass(), 6);
    default AddToInventory(UItFo_Potion_Beer::StaticClass(), 11);
    default AddToInventory(UItFo_Mutton_02::StaticClass(), 6);
    default AddToInventory(UItFo_Mutton_01::StaticClass(), 9);
    default m_UniqueName = n"IO_OC_CHEST_TOWER_01";
    default m_Lock = n"OC_Chest_Tower_01_Lock";
    default m_LockDifficulty = 6;
}

UCLASS()
class UIO_OC_CHEST_TOWER_02: UIoChestDefault
{
    default AddToInventory(UItMi_Stuff_Cup_02::StaticClass(), 6);
    default AddToInventory(UItMi_Stuff_Silverware_01::StaticClass(), 10);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 29);
    default AddToInventory(UItMi_Oldcoin_01::StaticClass(), 2521);
    default m_UniqueName = n"IO_OC_CHEST_TOWER_02";
    default m_Lock = n"OC_Chest_Tower_02_Lock";
    default m_LockDifficulty = 5;
}

UCLASS()
class UIO_OC_CHEST_TOWER_03: UIoChestDefault
{
    default AddToInventory(UItMw_1H_Axe_Old_01::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Oak::StaticClass(), 2);
    default AddToInventory(UItMi_Smith_Leatherstraps::StaticClass(), 4);
    default m_UniqueName = n"IO_OC_CHEST_TOWER_03";
    default m_Lock = n"OC_Chest_Tower_03_Lock";
    default m_LockDifficulty = 3;
}

UCLASS()
class UIO_OC_CHEST_TOWER_04: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Wine::StaticClass(), 12);
    default AddToInventory(UItFo_Potion_Strongbeer::StaticClass(), 8);
    default AddToInventory(UItFo_Potion_Beer::StaticClass(), 26);
    default m_UniqueName = n"IO_OC_CHEST_TOWER_04";
    default m_Lock = n"OC_Chest_Tower_04_Lock";
    default m_LockDifficulty = 6;
}

UCLASS()
class UIO_OC_CHEST_TOWER_05: UIoChestDefault
{
    default AddToInventory(UItMi_Stuff_Silverware_01::StaticClass(), 12);
    default AddToInventory(UItMi_Oldcoin_01::StaticClass(), 8897);
    default m_UniqueName = n"IO_OC_CHEST_TOWER_05";
    default m_Lock = n"OC_Chest_Tower_05_Lock";
    default m_LockDifficulty = 3;
}

UCLASS()
class UIO_OC_CHEST_TOWER_06: UIoChestDefault
{
    default AddToInventory(UItAt_Shadow_02::StaticClass(), 1);
    default AddToInventory(UItAt_Wolf_03::StaticClass(), 11);
    default AddToInventory(UItAt_Teeth_01::StaticClass(), 8);
    default AddToInventory(UItMi_Stuff_Silverware_01::StaticClass(), 13);
    default m_UniqueName = n"IO_OC_CHEST_TOWER_06";
    default m_Lock = n"OC_Chest_Tower_06_Lock";
    default m_LockDifficulty = 5;
}

UCLASS()
class UIO_OC_CHEST_TOWER_07: UIoChestDefault
{
    default AddToInventory(UItAt_Shadow_01::StaticClass(), 2);
    default AddToInventory(UItAt_Wolf_01::StaticClass(), 8);
    default m_UniqueName = n"IO_OC_CHEST_TOWER_07";
    default m_Lock = n"OC_Chest_Tower_07_Lock";
    default m_LockDifficulty = 4;
}

UCLASS()
class UIO_OC_CHEST_TOWER_08: UIoChestDefault
{
    default AddToInventory(UItAt_Ring_Skill_02::StaticClass(), 1);
    default AddToInventory(UItMi_Joint_03::StaticClass(), 4);
    default AddToInventory(UItFo_Plants_Velayis_01::StaticClass(), 8);
    default m_UniqueName = n"IO_OC_CHEST_TOWER_08";
    default m_Lock = n"OC_Chest_Tower_08_Lock";
    default m_LockDifficulty = 6;
}

UCLASS()
class UIO_OC_CHEST_TOWER_09: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Mana_03::StaticClass(), 3);
    default AddToInventory(UItFo_Potion_Health_03::StaticClass(), 2);
    default AddToInventory(UItFo_Potion_Mana_02::StaticClass(), 2);
    default AddToInventory(UItFo_Potion_Health_02::StaticClass(), 1);
    default m_UniqueName = n"IO_OC_CHEST_TOWER_09";
    default m_Lock = n"OC_Chest_Tower_09_Lock";
    default m_LockDifficulty = 5;
}

UCLASS()
class UIO_OC_CHEST_WHISTLER: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Water_01::StaticClass(), 2);
    default AddToInventory(UItAm_Arrow::StaticClass(), 5);
    default AddToInventory(UItKe_Lockpick::StaticClass(), 3);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 23);
    default m_UniqueName = n"IO_OC_CHEST_WHISTLER";
    default m_Lock = n"OC_Chest_Whistler_Lock";
    default m_LockDifficulty = 1;
}

UCLASS()
class UIO_OC_CHEST_PRISON_DUNGEONS_01: UIoChestDefault
{
    default AddToInventory(UItMi_Joint_02::StaticClass(), 1);
    default AddToInventory(UItKe_Lockpick::StaticClass(), 2);
    default AddToInventory(UItFo_Potion_Beer::StaticClass(), 1);
    default m_UniqueName = n"IO_OC_CHEST_PRISON_DUNGEONS_01";
}

UCLASS()
class UIO_OC_CHEST_PRISON_DUNGEONS_02: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Wine::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Leatherstraps::StaticClass(), 2);
    default AddToInventory(UItMi_Smith_Iron::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Willow::StaticClass(), 1);
    default m_UniqueName = n"IO_OC_CHEST_PRISON_DUNGEONS_02";
}

UCLASS()
class UIO_OC_CHEST_PRISON_DUNGEONS_03: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Water_01::StaticClass(), 2);
    default AddToInventory(UItMi_Stuff_Barbknife_01::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Pipe_01::StaticClass(), 1);
    default m_UniqueName = n"IO_OC_CHEST_PRISON_DUNGEONS_03";
}

UCLASS()
class UIO_OC_CHEST_PRISON_DUNGEONS_04: UIoChestDefault
{
    default AddToInventory(UItAr_Scroll_TransformMeatbug::StaticClass(), 1);
    default AddToInventory(UItAr_Scroll_FireBall::StaticClass(), 1);
    default AddToInventory(UItAr_Scroll_Heal::StaticClass(), 1);
    default AddToInventory(UItMi_Inscription_Parchment::StaticClass(), 3);
    default AddToInventory(UItMi_Alchemy_Flask::StaticClass(), 2);
    default AddToInventory(UItMi_Alchemy_Moleratlubric_01::StaticClass(), 1);
    default m_UniqueName = n"IO_OC_CHEST_PRISON_DUNGEONS_04";
}

UCLASS()
class UIO_OC_CORPSE_CORRISTO: UIoLootDefault
{
    default AddToInventory(UItAr_Rune_FireBall::StaticClass(), 1);
    default AddToInventory(UItKe_FireMagesRoom::StaticClass(), 1);
    default AddToInventory(UItAt_Ring_Magicfire_02::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Mana_02::StaticClass(), 2);
    default AddToInventory(UItFo_Potion_Health_02::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Wine::StaticClass(), 1);
    default AddToInventory(UItMi_Oldcoin_01::StaticClass(), 1);
    default m_UniqueName = n"IO_OC_CORPSE_CORRISTO";
}

UCLASS()
class UIO_OC_CORPSE_DAMAROK: UIoLootDefault
{
    default AddToInventory(UItAr_Rune_FireBall::StaticClass(), 1);
    default AddToInventory(UItKe_FireMagesRoom::StaticClass(), 1);
    default AddToInventory(UItMi_Inscription_Parchment::StaticClass(), 4);
    default AddToInventory(UItFo_Potion_Health_02::StaticClass(), 2);
    default AddToInventory(UItFo_Potion_Health_01::StaticClass(), 1);
    default AddToInventory(UItMi_Oldcoin_01::StaticClass(), 1);
    default m_UniqueName = n"IO_OC_CORPSE_DAMAROK";
}

UCLASS()
class UIO_OC_CORPSE_DRAGO: UIoLootDefault
{
    default AddToInventory(UItAr_Rune_FireBall::StaticClass(), 1);
    default AddToInventory(UItKe_FireMagesRoom::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Health_02::StaticClass(), 2);
    default AddToInventory(UItFo_Potion_Health_01::StaticClass(), 1);
    default AddToInventory(UItMi_Oldcoin_01::StaticClass(), 1);
    default m_UniqueName = n"IO_OC_CORPSE_DRAGO";
}

UCLASS()
class UIO_OC_CORPSE_RODRIGUEZ: UIoLootDefault
{
    default AddToInventory(UItAr_Rune_FireBall::StaticClass(), 1);
    default AddToInventory(UItKe_FireMagesRoom::StaticClass(), 1);
    default AddToInventory(UItMi_Inscription_Parchment::StaticClass(), 6);
    default AddToInventory(UItMi_Oldcoin_01::StaticClass(), 1);
    default m_UniqueName = n"IO_OC_CORPSE_RODRIGUEZ";
}

UCLASS()
class UIO_OC_CORPSE_SYRA: UIoLootDefault
{
    default AddToInventory(UItWr_Scroll_SyraNote::StaticClass(), 1);
    default m_UniqueName = n"IO_OC_CORPSE_SYRA";
}

UCLASS()
class UIO_OC_CORPSE_TORREZ: UIoLootDefault
{
    default AddToInventory(UItAr_Rune_FireBall::StaticClass(), 1);
    default AddToInventory(UItKe_FireMagesRoom::StaticClass(), 1);
    default AddToInventory(UItMi_Inscription_Parchment::StaticClass(), 2);
    default AddToInventory(UItMi_Oldcoin_01::StaticClass(), 1);
    default m_UniqueName = n"IO_OC_CORPSE_TORREZ";
}

UCLASS()
class UIO_OCS_CHEST_03: UIoChestDefault
{
    default AddToInventory(UItKe_Lockpick::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Beer::StaticClass(), 2);
    default AddToInventory(UItMw_1H_Torch::StaticClass(), 1);
    default m_UniqueName = n"IO_OCS_CHEST_03";
}

UCLASS()
class UIO_OCS_CHEST_04: UIoChestDefault
{
    default AddToInventory(UItAt_Ring_Magicfire_01::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Mana_Perma_01::StaticClass(), 1);   
    default AddToInventory(UItMi_Inscription_Parchment::StaticClass(), 2);
    default AddToInventory(UItMi_Alchemy_Moleratlubric_01::StaticClass(), 3);
    default AddToInventory(UItMi_Oldcoin_01::StaticClass(), 15);
    default m_UniqueName = n"IO_OCS_CHEST_04";
    default m_Lock = n"OCS_Chest_04_Lock";
    default m_LockDifficulty = 7;
}

UCLASS()
class UIO_OG_CHEST_01: UIoChestDefault
{
    default AddToInventory(UItAr_Scroll_Fear::StaticClass(), 1);
    default AddToInventory(UItAr_Scroll_Pyrokinesis::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Mana_02::StaticClass(), 1);
    default AddToInventory(UItMi_Alchemy_Quicksilver_01::StaticClass(), 1);
    default AddToInventory(UItMi_Alchemy_Sulphur_01::StaticClass(), 1);
    default AddToInventory(UItMi_Alchemy_Syranoil_01::StaticClass(), 1);
    default m_UniqueName = n"IO_OG_CHEST_01";
    default m_Lock = n"OG_Chest_01_Lock";
    default m_LockDifficulty = 5;
}

UCLASS()
class UIO_OG_CORPSE_TEMPLAR_01: UIoLootDefault
{
    default AddToInventory(UItMi_Plants_Swampherb_01::StaticClass(), 2);
    default AddToInventory(UItMi_Oldcoin_01::StaticClass(), 5);
    default m_UniqueName = n"IO_OG_CORPSE_TEMPLAR_01";
}

UCLASS()
class UIO_OG_CORPSE_TEMPLAR_02: UIoLootDefault
{
    default AddToInventory(UItAr_Scroll_Light::StaticClass(), 2);
    default AddToInventory(UItMi_Joint_02::StaticClass(), 1);
    default m_UniqueName = n"IO_OG_CORPSE_TEMPLAR_02";
}

UCLASS()
class UIO_OG_CORPSE_TEMPLAR_03: UIoLootDefault
{
    default AddToInventory(UItMi_Joint_01::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 6);
    default m_UniqueName = n"IO_OG_CORPSE_TEMPLAR_03";
}

UCLASS()
class UIO_OG_CORPSE_TEMPLAR_04: UIoLootDefault
{
    default AddToInventory(UItMi_Stuff_Idologront_01::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Leatherstraps::StaticClass(), 3);
    default AddToInventory(UItMi_Oldcoin_01::StaticClass(), 3);
    default m_UniqueName = n"IO_OG_CORPSE_TEMPLAR_04";
}

UCLASS()
class UIO_OG_MUMMY_39: UIoLootDefault
{
    default AddToInventory(UItFo_Potion_Dex_01::StaticClass(), 1);
    default AddToInventory(UItAt_Harpy_01::StaticClass(), 5);
    default AddToInventory(UItAt_Amulet_OrcMummy::StaticClass(), 1);
    default m_UniqueName = n"IO_OG_MUMMY_39";
}

UCLASS()
class UIO_OM_CHEST_ALBERTO_01: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Health_01::StaticClass(), 2);
    default AddToInventory(UItMw_2H_Axe_Pickaxe::StaticClass(), 3);
    default AddToInventory(UItMw_1H_Torch::StaticClass(), 4);
    default m_UniqueName = n"IO_OM_CHEST_ALBERTO_01";
    default m_Lock = n"OM_Chest_Alberto_01_Lock";
    default m_LockDifficulty = 4;
}

UCLASS()
class UIO_OM_CHEST_ALBERTO_03: UIoChestDefault
{
    default AddToInventory(UItFo_Crawlersoup::StaticClass(), 2);
    default AddToInventory(UItFo_Potion_Beer::StaticClass(), 4);
    default AddToInventory(UItFo_Loaf::StaticClass(), 6);
    default AddToInventory(UItFo_Apple::StaticClass(), 3);
    default m_UniqueName = n"IO_OM_CHEST_ALBERTO_03";
    default m_Lock = n"OM_Chest_Alberto_03_Lock";
    default m_LockDifficulty = 4;
}

UCLASS()
class UIO_OM_CHEST_ALBERTO_04: UIoChestDefault
{
    default AddToInventory(UItMi_Orenugget::StaticClass(), 23);
    default m_UniqueName = n"IO_OM_CHEST_ALBERTO_04";
    default m_Lock = n"OM_Chest_Alberto_04_Lock";
    default m_LockDifficulty = 1;
}

UCLASS()
class UIO_OM_CHEST_ALBERTO_05: UIoChestDefault
{
    default AddToInventory(UItMi_Orenugget::StaticClass(), 32);
    default m_UniqueName = n"IO_OM_CHEST_ALBERTO_05";
    default m_Lock = n"OM_Chest_Alberto_05_Lock";
    default m_LockDifficulty = 1;
}

UCLASS()
class UIO_OM_CHEST_SANTINO_01: UIoChestDefault
{
    default AddToInventory(UItFo_Crawlersoup::StaticClass(), 2);
    default AddToInventory(UItFo_Potion_Beer::StaticClass(), 5);
    default AddToInventory(UItFo_Loaf::StaticClass(), 6);
    default AddToInventory(UItFo_Apple::StaticClass(), 8);
    default m_UniqueName = n"IO_OM_CHEST_SANTINO_01";
    default m_Lock = n"OM_Chest_Santino_01_Lock";
    default m_LockDifficulty = 4;
}

UCLASS()
class UIO_OM_CHEST_SANTINO_02: UIoChestDefault
{
    default AddToInventory(UItMi_Orenugget::StaticClass(), 23);
    default m_UniqueName = n"IO_OM_CHEST_SANTINO_02";
    default m_Lock = n"OM_Chest_Santino_02_Lock";
    default m_LockDifficulty = 2;
}

UCLASS()
class UIO_OM_CHEST_SANTINO_03: UIoChestDefault
{
    default AddToInventory(UItMw_1H_Torch::StaticClass(), 5);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 14);
    default m_UniqueName = n"IO_OM_CHEST_SANTINO_03";
    default m_Lock = n"OM_Chest_Santino_03_Lock";
    default m_LockDifficulty = 2;
}

UCLASS()
class UIO_Otown_CHEST_01: UIoChestDefault
{
    default AddToInventory(UItFo_Plants_Herb_03::StaticClass(), 4);
    default AddToInventory(UItFo_Plants_Stoneroot_02::StaticClass(), 4);
    default AddToInventory(UItFo_Plants_Orcherb_01::StaticClass(), 3);
    default AddToInventory(UItFo_Plants_Nightshadow_02::StaticClass(), 5);
    default m_UniqueName = n"IO_Otown_CHEST_01";
    default m_Lock = n"Otown_Chest_01_Lock";
    default m_LockDifficulty = 5;
}

UCLASS()
class UIO_Otown_CHEST_02: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Mana_03::StaticClass(), 2);
    default AddToInventory(UItFo_Potion_Health_03::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Mana_02::StaticClass(), 3);
    default AddToInventory(UItFo_Potion_Health_02::StaticClass(), 3);
    default AddToInventory(UItFo_Potion_Health_01::StaticClass(), 4);
    default AddToInventory(UItFo_Potion_Mana_01::StaticClass(), 2);
    default m_UniqueName = n"IO_Otown_CHEST_02";
    default m_Lock = n"Otown_Chest_02_Lock";
    default m_LockDifficulty = 6;
}

UCLASS()
class UIO_Otown_CHEST_03: UIoChestDefault
{
    default AddToInventory(UItWr_Scroll_TransformOrcDog::StaticClass(), 1);
    default AddToInventory(UItAr_Scroll_TransformBiter::StaticClass(), 1);
    default AddToInventory(UItAr_Scroll_StormOfFire::StaticClass(), 1);
    default AddToInventory(UItAr_Scroll_FireBall::StaticClass(), 2);
    default AddToInventory(UItAr_Scroll_Heal::StaticClass(), 3);
    default AddToInventory(UItAr_Scroll_Light::StaticClass(), 2);
    default m_UniqueName = n"IO_Otown_CHEST_03";
    default m_Lock = n"Otown_Chest_03_Lock";
    default m_LockDifficulty = 6;
}

UCLASS()
class UIO_Otown_CHEST_04: UIoChestDefault
{
    default AddToInventory(UItAt_Amulet_Dexterity_02::StaticClass(), 1);
    default AddToInventory(UItMw_2H_Mace_Orc_01::StaticClass(), 1);
    default AddToInventory(UItMw_2H_Axe_Orc_03::StaticClass(), 1);
    default AddToInventory(UItMw_2H_Axe_Orc_02::StaticClass(), 2);
    default AddToInventory(UItMw_2H_Axe_Orc_01::StaticClass(), 3);
    default AddToInventory(UItMw_2H_Sword_Orc_01::StaticClass(), 1);
    default m_UniqueName = n"IO_Otown_CHEST_04";
    default m_Lock = n"Otown_Chest_04_Lock";
    default m_LockDifficulty = 6;
}

UCLASS()
class UIO_OTT_Chest_03: UIoChestDefault
{
    default AddToInventory(UItWr_Book_Bestiary_03::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Water_01::StaticClass(), 2);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 7);
    default m_UniqueName = n"IO_OTT_Chest_03";
}

UCLASS()
class UIO_OTT_Chest_05: UIoChestDefault
{
    default AddToInventory(UItMw_2H_Axe_Orc_03::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Mana_02::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Health_02::StaticClass(), 2);
    default AddToInventory(UItMi_Stuff_Alarmhorn::StaticClass(), 1);
    default m_UniqueName = n"IO_OTT_Chest_05";
    default m_Lock = n"OTT_Chest_05_Lock";
    default m_LockDifficulty = 4;
}

UCLASS()
class UIO_OTT_Chest_06: UIoChestDefault
{
    default AddToInventory(UItWr_Scroll_TransformBiter::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Dex_02::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Alarmhorn::StaticClass(), 1);
    default m_UniqueName = n"IO_OTT_Chest_06";
    default m_Lock = n"OTT_Chest_06_Lock";
    default m_LockDifficulty = 5;
}

UCLASS()
class UIO_OTT_Chest_09: UIoChestDefault
{
    default AddToInventory(UItAr_Scroll_TransformBiter::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Mana_01::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Leatherstraps::StaticClass(), 7);
    default AddToInventory(UItMi_Smith_Iron::StaticClass(), 5);
    default m_UniqueName = n"IO_OTT_Chest_09";
    default m_Lock = n"OTT_Chest_09_Lock";
    default m_LockDifficulty = 5;
}

UCLASS()
class UIO_OTT_Mummy_01: UIoLootDefault
{
    default AddToInventory(UItMi_Smith_Petrifiedwood::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Health_01::StaticClass(), 1);
    default AddToInventory(UItAt_Harpy_01::StaticClass(), 3);
    default AddToInventory(UItAt_Amulet_OrcMummy::StaticClass(), 1);
    default m_UniqueName = n"IO_OTT_Mummy_01";
}

UCLASS()
class UIO_SA_CORPSE_01: UIoLootDefault
{
    default AddToInventory(UItAt_Amulet_Projectile::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Oak::StaticClass(), 4);
    default AddToInventory(UItAt_Harpy_01::StaticClass(), 7);
    default m_UniqueName = n"IO_SA_CORPSE_01";
}

UCLASS()
class UIO_SA_MUMMY_02: UIoLootDefault
{
    default AddToInventory(UItAr_Rune_Light::StaticClass(), 1);
    default AddToInventory(UItWr_Scroll_2H_Sword_Light_02::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Petrifiedwood::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Mana_03::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Health_03::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 17);
    default m_UniqueName = n"IO_SA_MUMMY_02";
}

UCLASS()
class UIO_SC_CHEST_BAALCADAR: UIoChestDefault
{
    default AddToInventory(UItAr_Scroll_Charm::StaticClass(), 1);
    default AddToInventory(UItMi_Inscription_Parchment::StaticClass(), 4);
    default AddToInventory(UItFo_Potion_Mana_02::StaticClass(), 2);
    default AddToInventory(UItFo_Potion_Health_01::StaticClass(), 2);
    default AddToInventory(UItMi_Joint_01::StaticClass(), 4);
    default m_UniqueName = n"IO_SC_CHEST_BAALCADAR";
    default m_Lock = n"SC_Chest_BaalCadar_Lock";
    default m_LockDifficulty = 5;
}

UCLASS()
class UIO_SC_CHEST_BAALNAMIB: UIoChestDefault
{
    default AddToInventory(UItMi_Smith_Ruby::StaticClass(), 1);
    default AddToInventory(UItMi_Joint_02::StaticClass(), 3);
    default AddToInventory(UItAr_Scroll_Heal::StaticClass(), 2);
    default AddToInventory(UItMi_Joint_01::StaticClass(), 3);
    default m_UniqueName = n"IO_SC_CHEST_BAALNAMIB";
    default m_Lock = n"SC_Chest_BaalNamib_Lock";
    default m_LockDifficulty = 4;
}

UCLASS()
class UIO_SC_CHEST_BAALORUN: UIoChestDefault
{
    default AddToInventory(UItAr_Scroll_Sleep::StaticClass(), 1);
    default AddToInventory(UItKe_Lockpick::StaticClass(), 4);
    default AddToInventory(UItMi_Joint_01::StaticClass(), 4);
    default AddToInventory(UItMi_Plants_Swampherb_01::StaticClass(), 5);
    default m_UniqueName = n"IO_SC_CHEST_BAALORUN";
    default m_Lock = n"SC_Chest_BaalOrun_Lock";
    default m_LockDifficulty = 4;
}

UCLASS()
class UIO_SC_CHEST_BAALTONDRAL: UIoChestDefault
{
    default AddToInventory(UItAr_Scroll_Telekinesis::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Mana_01::StaticClass(), 2);
    default AddToInventory(UItMi_Joint_02::StaticClass(), 2);
    default m_UniqueName = n"IO_SC_CHEST_BAALTONDRAL";
    default m_Lock = n"SC_Chest_BaalTondral_Lock";
    default m_LockDifficulty = 4;
}

UCLASS()
class UIO_SC_CHEST_BLACKSMITH: UIoChestDefault
{
    default AddToInventory(UItMw_1H_Axe_01::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Steel::StaticClass(), 2);
    default AddToInventory(UItMi_Smith_Oak::StaticClass(), 3);
    default AddToInventory(UItMi_Smith_Leatherstraps::StaticClass(), 3);
    default AddToInventory(UItMi_Smith_Iron::StaticClass(), 3);
    default AddToInventory(UItMi_Smith_Willow::StaticClass(), 4);
    default AddToInventory(UItAt_Crawler_01::StaticClass(), 3);
    default m_UniqueName = n"IO_SC_CHEST_BLACKSMITH";
    default m_Lock = n"SC_Chest_Blacksmith_Lock";
    default m_LockDifficulty = 6;
}

UCLASS()
class UIO_SC_CHEST_CHANI: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Mana_02::StaticClass(), 2);
    default AddToInventory(UItMi_Joint_03::StaticClass(), 1);
    default AddToInventory(UItFo_Plants_Velayis_01::StaticClass(), 3);
    default AddToInventory(UItFo_Mutton_01::StaticClass(), 4);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 10);
    default m_UniqueName = n"IO_SC_CHEST_CHANI";
    default m_Lock = n"SC_Chest_Chani_Lock";
    default m_LockDifficulty = 4;
}

UCLASS()
class UIO_SC_CHEST_CORANGAR: UIoChestDefault
{
    default AddToInventory(UItMw_1H_Mace_01::StaticClass(), 1);
    default AddToInventory(UItMi_Joint_02::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Iron::StaticClass(), 3);
    default AddToInventory(UItAt_Harpy_01::StaticClass(), 2);
    default AddToInventory(UItAm_Arrow::StaticClass(), 10);
    default m_UniqueName = n"IO_SC_CHEST_CORANGAR";
    default m_Lock = n"SC_Chest_CorAngar_Lock";
    default m_LockDifficulty = 4;
}

UCLASS()
class UIO_SC_CHEST_CORKALOM_01: UIoChestDefault
{
    default AddToInventory(UItWr_Scroll_Kalom::StaticClass(), 1);
    default m_UniqueName = n"IO_SC_CHEST_CORKALOM_01";
    default m_Lock = n"SC_Chest_CorKalom_01_Lock";
    default m_LockDifficulty = 1;
}

UCLASS()
class UIO_SC_CHEST_CORKALOM_03: UIoChestDefault
{
    default AddToInventory(UItAt_Ring_Magicfire_01::StaticClass(), 1);
    default AddToInventory(UItAr_Scroll_Pyrokinesis::StaticClass(), 1);
    default AddToInventory(UItMi_Joint_03::StaticClass(), 2);
    default AddToInventory(UItMi_Alchemy_Sulphur_01::StaticClass(), 3);
    default AddToInventory(UItFo_Plants_Ravenherb_02::StaticClass(), 3);
    default AddToInventory(UItMi_Stuff_Idologront_01::StaticClass(), 1);
    default AddToInventory(UItMi_Alchemy_Flask::StaticClass(), 2);
    default m_UniqueName = n"IO_SC_CHEST_CORKALOM_03";
    default m_Lock = n"SC_Chest_CorKalom_03_Lock";
    default m_LockDifficulty = 7;
}

UCLASS()
class UIO_SC_CHEST_FORTUNO: UIoChestDefault
{
    default AddToInventory(UItMi_Joint_03::StaticClass(), 2);
    default AddToInventory(UItMi_Joint_02::StaticClass(), 6);
    default AddToInventory(UItMi_Joint_01::StaticClass(), 9);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 8);
    default AddToInventory(UItMi_Oldcoin_01::StaticClass(), 11);
    default m_UniqueName = n"IO_SC_CHEST_FORTUNO";
    default m_Lock = n"SC_Chest_Fortuno_Lock";
    default m_LockDifficulty = 6;
}

UCLASS()
class UIO_SC_CHEST_NATALIA: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Health_01::StaticClass(), 2);
    default AddToInventory(UItFo_Potion_Mana_01::StaticClass(), 4);
    default AddToInventory(UItMi_Joint_03::StaticClass(), 2);
    default AddToInventory(UItMi_Joint_02::StaticClass(), 2);
    default AddToInventory(UItFo_Mutton_01::StaticClass(), 4);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 8);
    default m_UniqueName = n"IO_SC_CHEST_NATALIA";
    default m_Lock = n"SC_Chest_Natalia_Lock";
    default m_LockDifficulty = 5;
}

UCLASS()
class UIO_SC_CHEST_NYRAS: UIoChestDefault
{
    default AddToInventory(UItRw_Bow_Small_01::StaticClass(), 1);
    default AddToInventory(UItKe_Lockpick::StaticClass(), 3);
    default AddToInventory(UItMw_1H_Sword_Old_01::StaticClass(), 1);
    default AddToInventory(UItMw_1H_Torch::StaticClass(), 1);
    default AddToInventory(UItAm_Arrow::StaticClass(), 3);
    default AddToInventory(UItWr_Scroll_Mysteriousnote::StaticClass(), 1);
    default m_UniqueName = n"IO_SC_CHEST_NYRAS";
    default m_Lock = n"SC_Chest_Nyras_Lock";
    default m_LockDifficulty = 4;
}

UCLASS()
class UIO_SC_CHEST_VIRAN: UIoChestDefault
{
    default AddToInventory(UItAt_Bloodfly_02::StaticClass(), 1);
    default AddToInventory(UItMi_Joint_01::StaticClass(), 3);
    default AddToInventory(UItMi_Smith_Willow::StaticClass(), 3);
    default AddToInventory(UItMi_Plants_Swampherb_01::StaticClass(), 4);
    default m_UniqueName = n"IO_SC_CHEST_VIRAN";
    default m_Lock = n"SC_Chest_Viran_Lock";
    default m_LockDifficulty = 4;
}

UCLASS()
class UIO_SC_CHEST_YBERION: UIoChestDefault
{
    default AddToInventory(UItAt_Ring_Enlight::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Mana_03::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Health_02::StaticClass(), 2);
    default AddToInventory(UItMi_Joint_03::StaticClass(), 3);
    default AddToInventory(UItMi_Joint_02::StaticClass(), 2);
    default AddToInventory(UItFo_Mutton_01::StaticClass(), 2);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 18);
    default m_UniqueName = n"IO_SC_CHEST_YBERION";
    default m_Lock = n"SC_Chest_Yberion_Lock";
    default m_LockDifficulty = 6;
}

UCLASS()
class UIO_SC_CORPSE_01: UIoLootDefault
{
    default AddToInventory(UItAr_Scroll_TransformBloodfly::StaticClass(), 2);
    default AddToInventory(UItMi_Joint_03::StaticClass(), 3);
    default AddToInventory(UItMi_Smith_Oak::StaticClass(), 2);
    default AddToInventory(UItMi_Smith_Leatherstraps::StaticClass(), 4);
    default m_UniqueName = n"IO_SC_CORPSE_01";
}

UCLASS()
class UIO_SNT_Chest_04: UIoChestDefault
{
    default AddToInventory(UItAr_Rune_DeathToTheUndead::StaticClass(), 1);
    default AddToInventory(UItAt_Amulet_Ranged::StaticClass(), 1);
    
    default m_UniqueName = n"IO_SNT_Chest_04";
}

UCLASS()
class UIO_SNT_Chest_05: UIoChestDefault
{
    default AddToInventory(UItMS_SunkenTowerStone_02::StaticClass(), 1);
    default AddToInventory(UItAr_Rune_TeleportToSunkenTower::StaticClass(), 1);
    default AddToInventory(UItAr_Rune_TeleportToMagiciansOfFire::StaticClass(), 1);
    default AddToInventory(UItAr_Scroll_FireBolt::StaticClass(), 2);
    default AddToInventory(UItMi_Inscription_Parchment::StaticClass(), 4);
    default AddToInventory(UItFo_Potion_Health_03::StaticClass(), 2);
    default AddToInventory(UItAm_Arrow::StaticClass(), 9);
    default m_UniqueName = n"IO_SNT_Chest_05";
}

UCLASS()
class UIO_SNT_CHEST_09: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Mana_Perma_02::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 22);
    default m_UniqueName = n"IO_SNT_CHEST_09";
    default m_Lock = n"SNT_Chest_09_Lock";
    default m_LockDifficulty = 5;
}

UCLASS()
class UIO_SW_CORPSE_MERC_CLUE: UIoLootDefault
{
    default AddToInventory(UItWr_Scroll_RankWaterMages::StaticClass(), 1);
    default AddToInventory(UItAr_Scroll_IceBolt::StaticClass(), 1);
    default AddToInventory(UItAr_Scroll_Light::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 5);
    default m_UniqueName = n"IO_SW_CORPSE_MERC_CLUE";
}

UCLASS()
class UIO_SW_CHEST_01: UIoChestDefault
{
    default AddToInventory(UItAt_Amulet_Weapon::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Ironwood::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Ruby::StaticClass(), 1);
    default AddToInventory(UItAm_Bolt::StaticClass(), 9);
    default AddToInventory(UItAm_Arrow::StaticClass(), 14);
    default AddToInventory(UItMi_Oldcoin_01::StaticClass(), 10);
    default m_UniqueName = n"IO_SW_CHEST_01";
    default m_Lock = n"SW_Chest_01_Lock";
    default m_LockDifficulty = 7;
}

UCLASS()
class UIO_SW_CHEST_02: UIoChestDefault
{
    default AddToInventory(UItMi_Smith_Petrifiedwood::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Oak::StaticClass(), 3);
    default AddToInventory(UItKe_Lockpick::StaticClass(), 3);
    default AddToInventory(UItMi_Smith_Leatherstraps::StaticClass(), 4);
    default AddToInventory(UItMi_Alchemy_Flask::StaticClass(), 3);
    default AddToInventory(UItAt_Harpy_01::StaticClass(), 2);
    default m_UniqueName = n"IO_SW_CHEST_02";
    default m_Lock = n"SW_Chest_02_Lock";
    default m_LockDifficulty = 6;
}

UCLASS()
class UIO_SW_CHEST_03: UIoChestDefault
{
    default AddToInventory(UItKe_CaptainShip::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Mana_03::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Mana_02::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Health_02::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 15);
    default m_UniqueName = n"IO_SW_CHEST_03";
    default m_Lock = n"SW_Chest_03_Lock";
    default m_LockDifficulty = 5;
}

UCLASS()
class UIO_SW_CHEST_07: UIoChestDefault
{
    default AddToInventory(UItMs_Book_WaterMages::StaticClass(), 1);
    default AddToInventory(UItAr_Scroll_BallLightning::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Steel::StaticClass(), 2);
    default AddToInventory(UItKe_Lockpick::StaticClass(), 3);
    default AddToInventory(UItMi_Alchemy_Flask::StaticClass(), 2);
    default m_UniqueName = n"IO_SW_CHEST_07";
    default m_Lock = n"SW_Chest_07_Lock";
    default m_LockDifficulty = 1;
}

UCLASS()
class UIO_TA_CORPSE_01: UIoLootDefault
{
    default AddToInventory(UItAt_Amulet_Power::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Health_Quick::StaticClass(), 3);
    default m_UniqueName = n"IO_TA_CORPSE_01";
}

UCLASS()
class UIO_TA_CORPSE_02: UIoLootDefault
{
    default AddToInventory(UItAt_Amulet_Innos::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Orcmedicine::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Alarmhorn::StaticClass(), 1);
    default m_UniqueName = n"IO_TA_CORPSE_02";
}

UCLASS()
class UIO_TA_CORPSE_03: UIoLootDefault
{
    default AddToInventory(UItAr_Scroll_IceBlock::StaticClass(), 3);
    default m_UniqueName = n"IO_TA_CORPSE_03";
}

UCLASS()
class UIO_TST_CORPSE_First_Subzone_01: UIoLootDefault
{
    default AddToInventory(UItFo_Potion_Health_Quick::StaticClass(), 3);
    default AddToInventory(UItFo_Potion_Mana_02::StaticClass(), 1);
    default m_UniqueName = n"IO_TST_CORPSE_First_Subzone_01";
}

UCLASS()
class UIO_TST_CORPSE_Second_Subzone_01: UIoLootDefault
{
    default AddToInventory(UItFo_Potion_Mana_02::StaticClass(), 2);
    default AddToInventory(UItFo_Potion_Health_02::StaticClass(), 1);
    default m_UniqueName = n"IO_TST_CORPSE_Second_Subzone_01";
}

UCLASS()
class UIO_TST_CORPSE_Second_Subzone_02: UIoLootDefault
{
    default AddToInventory(UItFo_Potion_Mana_02::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Health_02::StaticClass(), 2);
    default m_UniqueName = n"IO_TST_CORPSE_Second_Subzone_02";
}

UCLASS()
class UIO_TST_Chest_Lava_Stronghold_01_B: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Health_Perma_03::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Mana_03::StaticClass(), 1);
    default m_UniqueName = n"IO_TST_Chest_Lava_Stronghold_01_B";
}

UCLASS()
class UIO_TST_Chest_Ruushk_Cave_01: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Mana_Perma_03::StaticClass(), 1);
    default AddToInventory(UItAr_Scroll_TransformMeatbug::StaticClass(),1);
    default AddToInventory(UItAr_Scroll_Light::StaticClass(),4);
    default AddToInventory(UItFo_Potion_Health_03::StaticClass(),2);
    default AddToInventory(UItFo_Plants_Mistcap::StaticClass(), 15);
    default m_UniqueName = n"IO_TST_Chest_Ruushk_Cave_01";
}

UCLASS()
class UIO_TST_Chest_Underground_01: UIoChestDefault
{
    default AddToInventory(UItAr_Scroll_SummonSkeletons::StaticClass(), 1);
    default AddToInventory(UItMi_Inscription_Parchment::StaticClass(), 4);
    default AddToInventory(UItFo_Plants_Widow::StaticClass(), 3);
    default AddToInventory(UItFo_Plants_Darkshade::StaticClass(), 3);
    default m_UniqueName = n"IO_TST_Chest_Underground_01";
}

UCLASS()
class UIO_TST_Chest_WinchRoom_01: UIoChestDefault
{
    default AddToInventory(UItKe_GraveyardLever::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Health_01::StaticClass(), 1);
    default AddToInventory(UItAm_Arrow::StaticClass(), 6);
    default m_UniqueName = n"IO_TST_Chest_WinchRoom_01";
}

UCLASS()
class UIO_TST_Chest_WinchRoom_02: UIoChestDefault
{
    default AddToInventory(UItAt_Amulet_Enlight::StaticClass(), 1);
    default AddToInventory(UItAr_Scroll_IceWave::StaticClass(), 2);
    default AddToInventory(UItAr_Scroll_IceBolt::StaticClass(), 3);
    default AddToInventory(UItFo_Plants_Trollbane::StaticClass(), 2);
    default m_UniqueName = n"IO_TST_Chest_WinchRoom_02";
}

UCLASS()
class UIO_TST_Chest_WinchRoom_03: UIoChestDefault
{
    default AddToInventory(UItRw_Bow_War_01::StaticClass(), 1);
    default AddToInventory(UItKe_Lockpick::StaticClass(), 3);
    default AddToInventory(UItAm_Bolt::StaticClass(), 4);
    default AddToInventory(UItAm_Arrow::StaticClass(), 9);
    default m_UniqueName = n"IO_TST_Chest_WinchRoom_03";
}

UCLASS()
class UIO_XT_CHEST_01: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Mana_03::StaticClass(), 2);
    default AddToInventory(UItFo_Potion_Health_03::StaticClass(), 2);
    default AddToInventory(UItMi_Alchemy_Quicksilver_01::StaticClass(), 2);
    default AddToInventory(UItMi_Alchemy_Syranoil_01::StaticClass(), 1);
    default AddToInventory(UItMi_Alchemy_Flask::StaticClass(), 4);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 23);
    default m_UniqueName = n"IO_XT_CHEST_01";
    default m_Lock = n"XT_Chest_01_Lock";
    default m_LockDifficulty = 6;
}

UCLASS()
class UIO_XT_CHEST_02: UIoChestDefault
{
    default AddToInventory(UItMi_Smith_Steel::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Ruby::StaticClass(), 2);
    default AddToInventory(UItMi_Smith_Gold::StaticClass(), 1);
    default m_UniqueName = n"IO_XT_CHEST_02";
    default m_Lock = n"XT_Chest_02_Lock";
    default m_LockDifficulty = 4;
}

UCLASS()
class UIO_XT_CHEST_03: UIoChestDefault
{
    default AddToInventory(UItMi_Smith_Petrifiedwood::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Obsidian::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Ruby::StaticClass(), 1);
    default AddToInventory(UItMi_Smith_Gold::StaticClass(), 1);
    default AddToInventory(UItMi_Alchemy_Sulphur_01::StaticClass(), 2);
    default AddToInventory(UItMi_Inscription_Parchment::StaticClass(), 4);
    default AddToInventory(UItAt_Harpy_01::StaticClass(), 1);
    default m_UniqueName = n"IO_XT_CHEST_03";
    default m_Lock = n"XT_Chest_03_Lock";
    default m_LockDifficulty = 6;
}

UCLASS()
class UIO_XT_CHEST_04: UIoChestDefault
{
    
    default AddToInventory(UItFo_Potion_Health_03::StaticClass(), 2);
    default AddToInventory(UItFo_Potion_Mana_03::StaticClass(), 2);
    default AddToInventory(UItFo_Potion_Health_02::StaticClass(), 3);
    default AddToInventory(UItFo_Potion_Mana_02::StaticClass(), 3);
    default m_UniqueName = n"IO_XT_CHEST_04";
    default m_Lock = n"XT_Chest_04_Lock";
    default m_LockDifficulty = 6;
}

UCLASS()
class UIO_XT_CHEST_05: UIoChestDefault
{
    default AddToInventory(UItAt_Ring_Total_01::StaticClass(), 1);
    default AddToInventory(UItWr_Scroll_Potion_Health_Perma_03::StaticClass(), 1);
    default AddToInventory(UItWr_Scroll_Potion_Mana_Perma_03::StaticClass(), 1);
    default AddToInventory(UItAr_Scroll_SummonGolem::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Mana_02::StaticClass(), 2);
    default AddToInventory(UItMi_Inscription_Parchment::StaticClass(), 4);
    default m_UniqueName = n"IO_XT_CHEST_05";
    default m_Lock = n"XT_Chest_05_Lock";
    default m_LockDifficulty = 7;
}

UCLASS()
class UIO_XT_CHEST_06: UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Master_02::StaticClass(), 1);
    default AddToInventory(UItAr_Scroll_TransformHarpy::StaticClass(), 1);
    default AddToInventory(UItAr_Scroll_SummonDemon::StaticClass(), 1);
    default AddToInventory(UItAr_Scroll_SummonArmyOfDarkness::StaticClass(), 1);
    default AddToInventory(UItAr_Scroll_SummonGolem::StaticClass(), 1);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 38);
    default m_UniqueName = n"IO_XT_CHEST_06";
    default m_Lock = n"XT_Chest_06_Lock";
    default m_LockDifficulty = 7;
}
