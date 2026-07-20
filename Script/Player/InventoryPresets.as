UCLASS()
class UExampleInventoryPreset : UInventoryPreset
{
    default CleanInventory = true;

    default AddToInventoryPreset(UItMw_2H_Sword_01::StaticClass(), 1, EInventoryTypes::MeleeSlot);
    default AddToInventoryPreset(UItRw_Bow_Small_01::StaticClass(), 1, EInventoryTypes::RangedSlot);
    default AddToInventoryPreset(UItMw_1H_Torch::StaticClass(), 99, EInventoryTypes::QuickItems); //3
    default AddToInventoryPreset(UItAr_Rune_Light::StaticClass(), 1, EInventoryTypes::QuickItems); //4


    default AddToInventoryPreset(UHumanFist_NoWeapon::StaticClass(), 1, EInventoryTypes::QuickItems); //5
    default AddToInventoryPreset(UHumanFist_NoWeapon_Climbing::StaticClass(), 1);
    default AddToInventoryPreset(UHumanFist_NoWeapon_Swimming::StaticClass(), 1);

    default AddToInventoryPreset(UItAm_Arrow::StaticClass(), 50);

    default AddToInventoryPreset(UKdw_Armor_L::StaticClass(), 1, EInventoryTypes::ArmorSlot);
    default ApplyArmor = true;
    default AddToInventoryPreset(UNH_Armor::StaticClass());
}

UCLASS()
class UEarlyInventory : UInventoryPreset
{
    default CleanInventory = true;

    default AddToInventoryPreset(UItMw_1H_Axe_Old_01::StaticClass(), 1, EInventoryTypes::MeleeSlot);
    default AddToInventoryPreset(UItRw_Bow_Small_01::StaticClass(), 1, EInventoryTypes::RangedSlot);
    default AddToInventoryPreset(UItMw_1H_Torch::StaticClass(), 99, EInventoryTypes::QuickItems);


    default AddToInventoryPreset(UHumanFist_NoWeapon::StaticClass(), 1, EInventoryTypes::QuickItems);
    default AddToInventoryPreset(UHumanFist_NoWeapon_Climbing::StaticClass(), 1);
    default AddToInventoryPreset(UHumanFist_NoWeapon_Swimming::StaticClass(), 1);

    default AddToInventoryPreset(UItAm_Arrow::StaticClass(), 40);

    default AddToInventoryPreset(UItFo_Potion_Health_01::StaticClass(), 4, EInventoryTypes::QuickItems);
    default AddToInventoryPreset(UItFo_Grilledscavenger::StaticClass(), 10, EInventoryTypes::QuickItems);

    default AddToInventoryPreset(UVlk_Armor_L::StaticClass(), 1, EInventoryTypes::ArmorSlot);
    default ApplyArmor = true;
    default AddToInventoryPreset(UNH_Armor::StaticClass());

    default AddToInventoryPreset(UItMi_Orenugget::StaticClass(),32);
    default AddToInventoryPreset(UItMs_Glossary::StaticClass(),1);
}

UCLASS()
class UWarriorInventory : UInventoryPreset
{
    default CleanInventory = true;

    default AddToInventoryPreset(UItMw_1H_Sword_Old_01::StaticClass(), 1);
    default AddToInventoryPreset(UItRw_Bow_Diego::StaticClass(), 1, EInventoryTypes::RangedSlot);
    default AddToInventoryPreset(UItMw_1H_Torch::StaticClass(), 99, EInventoryTypes::QuickItems); //3
    default AddToInventoryPreset(UItAr_Rune_Light::StaticClass(), 1, EInventoryTypes::QuickItems); //4

    default AddToInventoryPreset(UItMw_1H_Axe_Hatchet_01::StaticClass(), 1, EInventoryTypes::QuickItems); //5
    default AddToInventoryPreset(UItMw_1H_Mace_Club_01::StaticClass(), 1, EInventoryTypes::QuickItems); //6
    default AddToInventoryPreset(UItMw_2H_Sword_Old_01::StaticClass(), 1, EInventoryTypes::QuickItems); //7
    default AddToInventoryPreset(UItMw_2H_Axe_Old_01::StaticClass(), 1, EInventoryTypes::QuickItems); //8

    default AddToInventoryPreset(UItMw_2H_Sword_Orc_01::StaticClass(), 1,);
    default AddToInventoryPreset(UItMw_1H_Sword_01::StaticClass(), 1,);
    default AddToInventoryPreset(UItMw_1H_Axe_01::StaticClass(), 1,);
    default AddToInventoryPreset(UItMw_2H_Sword_Heavy_03::StaticClass(), 1,);
    default AddToInventoryPreset(UItMw_2H_Axe_Heavy_01::StaticClass(), 1,);
    default AddToInventoryPreset(UItMw_2H_Axe_Orc_03::StaticClass(), 1,);
    default AddToInventoryPreset(UItMw_2H_Staff_Scepter::StaticClass(), 1,);

    default AddToInventoryPreset(UItMw_1H_Sword_Arto::StaticClass(), 1,);
    default AddToInventoryPreset(UItMw_1H_Axe_Lares::StaticClass(), 1,);
    default AddToInventoryPreset(UItMw_1H_Mace_Orun::StaticClass(), 1,);
    default AddToInventoryPreset(UItMw_2H_Sword_Innos::StaticClass(), 1,);
    default AddToInventoryPreset(UItMw_2H_Axe_Lee::StaticClass(), 1,);
    default AddToInventoryPreset(UItMw_2H_Staff_Scepter::StaticClass(), 1,);

    default AddToInventoryPreset(UHumanFist_NoWeapon::StaticClass(), 1,);
    default AddToInventoryPreset(UHumanFist_NoWeapon_Climbing::StaticClass(), 1);
    default AddToInventoryPreset(UHumanFist_NoWeapon_Swimming::StaticClass(), 1);
    default AddToInventoryPreset(UItMw_2H_Sword_Uriziel_01::StaticClass(), 1, EInventoryTypes::MeleeSlot);


    default AddToInventoryPreset(UOre_Armor_M::StaticClass(), 1, EInventoryTypes::ArmorSlot);
    default AddToInventoryPreset(UNH_Armor::StaticClass());
    default AddToInventoryPreset(UItAm_Arrow::StaticClass(), 50);

    default ApplyArmor = true;
}

UCLASS()
class UWizardInventory : UInventoryPreset
{
    default CleanInventory = true;

    default AddToInventoryPreset(UItMw_1H_Mace_04::StaticClass(), 1, EInventoryTypes::MeleeSlot);
    //
    default AddToInventoryPreset(UItMw_1H_Torch::StaticClass(), 99, EInventoryTypes::QuickItems); //3
    default AddToInventoryPreset(UItAr_Rune_Light::StaticClass(), 1, EInventoryTypes::QuickItems); //4
    default AddToInventoryPreset(UItAr_Scroll_Light::StaticClass(), 1,);


    default AddToInventoryPreset(UItAr_Rune_FireBolt::StaticClass(), 1, EInventoryTypes::QuickItems); //5
    default AddToInventoryPreset(UItAr_Scroll_FireBolt::StaticClass(), 1,);
    default AddToInventoryPreset(UItAr_Rune_FireBall::StaticClass(), 1, EInventoryTypes::QuickItems); //6
    default AddToInventoryPreset(UItAr_Scroll_FireBall::StaticClass(), 1,);
    default AddToInventoryPreset(UItAr_Rune_FireRain::StaticClass(), 1, EInventoryTypes::QuickItems); //7
    default AddToInventoryPreset(UItAr_Scroll_FireRain::StaticClass(), 1,);
    default AddToInventoryPreset(UItAr_Rune_StormOfFire::StaticClass(), 1, EInventoryTypes::QuickItems); //8
    default AddToInventoryPreset(UItAr_Scroll_StormOfFire::StaticClass(), 1,);

    default AddToInventoryPreset(UItAr_Rune_IceBolt::StaticClass(), 1,);
    default AddToInventoryPreset(UItAr_Scroll_IceBolt::StaticClass(), 1,);
    default AddToInventoryPreset(UItAr_Rune_IceWave::StaticClass(), 1,);
    default AddToInventoryPreset(UItAr_Scroll_IceWave::StaticClass(), 1,);
    default AddToInventoryPreset(UItAr_Rune_IceBlock::StaticClass(), 1,);
    default AddToInventoryPreset(UItAr_Scroll_IceBlock::StaticClass(), 1,);

    default AddToInventoryPreset(UItAr_Rune_ChainLightning::StaticClass(), 1,);
    default AddToInventoryPreset(UItAr_Scroll_ChainLightning::StaticClass(), 1,);
    default AddToInventoryPreset(UItAr_Rune_BallLightning::StaticClass(), 1,);
    default AddToInventoryPreset(UItAr_Scroll_BallLightning::StaticClass(), 1,);

    default AddToInventoryPreset(UItAr_Rune_FistOfWind::StaticClass(), 1,);
    default AddToInventoryPreset(UItAr_Scroll_FistOfWind::StaticClass(), 1,);
    default AddToInventoryPreset(UItAr_Rune_StormFist::StaticClass(), 1,);
    default AddToInventoryPreset(UItAr_Scroll_StormFist::StaticClass(), 1,);
    default AddToInventoryPreset(UItAr_Rune_Telekinesis::StaticClass(), 1,);
    default AddToInventoryPreset(UItAr_Scroll_Telekinesis::StaticClass(), 1,);
    default AddToInventoryPreset(UItAr_Rune_Pyrokinesis::StaticClass(), 1,);
    default AddToInventoryPreset(UItAr_Scroll_Pyrokinesis::StaticClass(), 1,);
    default AddToInventoryPreset(UItAr_Rune_Control::StaticClass(), 1,);
    default AddToInventoryPreset(UItAr_Scroll_Control::StaticClass(), 1,);
    default AddToInventoryPreset(UItAr_Rune_Charm::StaticClass(), 1,);
    default AddToInventoryPreset(UItAr_Scroll_Charm::StaticClass(), 1,);
    default AddToInventoryPreset(UItAr_Rune_Sleep::StaticClass(), 1,);
    default AddToInventoryPreset(UItAr_Scroll_Sleep::StaticClass(), 1,);


    default AddToInventoryPreset(UItAr_Rune_BreathOfDeath::StaticClass(), 1,);
    default AddToInventoryPreset(UItAr_Rune_DeathToTheUndead::StaticClass(), 1,);
    default AddToInventoryPreset(UItAr_Scroll_DeathToTheUndead::StaticClass(), 1,);
    default AddToInventoryPreset(UItAr_Rune_UrizielWaveOfDeath::StaticClass(), 1,);

    default AddToInventoryPreset(UItAr_Rune_Heal ::StaticClass(), 1,);
    default AddToInventoryPreset(UItAr_Scroll_Heal ::StaticClass(), 1,);

    default AddToInventoryPreset(UItAr_Rune_TeleportToMagiciansOfFire::StaticClass(), 1,);
    default AddToInventoryPreset(UItAr_Rune_TeleportToSwampCamp::StaticClass(), 1,);
    default AddToInventoryPreset(UItAr_Rune_TeleportToMagiciansOfWater::StaticClass(), 1,);
    default AddToInventoryPreset(UItAr_Rune_TeleportToNecromancer::StaticClass(), 1,);
    
    default AddToInventoryPreset(UItAr_Scroll_Fear::StaticClass(), 1,);
    default AddToInventoryPreset(UItAr_Scroll_Shrink::StaticClass(), 1,);

    default AddToInventoryPreset(UItAr_Scroll_SummonArmyOfDarkness::StaticClass(), 1,);
    default AddToInventoryPreset(UItAr_Scroll_SummonDemon::StaticClass(), 1,);
    default AddToInventoryPreset(UItAr_Scroll_SummonGolem::StaticClass(), 1,);
    default AddToInventoryPreset(UItAr_Scroll_SummonSkeletons::StaticClass(), 1,);
    
    
    default AddToInventoryPreset(UItAr_Scroll_TransformBloodfly::StaticClass(), 1,);
    default AddToInventoryPreset(UItAr_Scroll_TransformLizard::StaticClass(), 1,);
    default AddToInventoryPreset(UItAr_Scroll_TransformLurker::StaticClass(), 1,);
    default AddToInventoryPreset(UItAr_Scroll_TransformMeatbug::StaticClass(), 1,);
    default AddToInventoryPreset(UItAr_Scroll_TransformMinecrawler::StaticClass(), 1,);
    default AddToInventoryPreset(UItAr_Scroll_TransformMolerat::StaticClass(), 1,);
    default AddToInventoryPreset(UItAr_Scroll_TransformOrcDog::StaticClass(), 1,);
    default AddToInventoryPreset(UItAr_Scroll_TransformScavenger::StaticClass(), 1,);
    default AddToInventoryPreset(UItAr_Scroll_TransformShadowbeast::StaticClass(), 1,);
    default AddToInventoryPreset(UItAr_Scroll_TransformSnapper::StaticClass(), 1,);
    default AddToInventoryPreset(UItAr_Scroll_TransformWolf::StaticClass(), 1,);

    default AddToInventoryPreset(UItAr_Scroll_TransformSwampshark::StaticClass(), 1,);
    default AddToInventoryPreset(UItAr_Scroll_TransformFireLizard::StaticClass(), 1,);
    default AddToInventoryPreset(UItAr_Scroll_TransformBloodhound::StaticClass(), 1,);
    default AddToInventoryPreset(UItAr_Scroll_TransformHarpy::StaticClass(), 1,);
    default AddToInventoryPreset(UItAr_Scroll_TransformBiter::StaticClass(), 1,);




    



    default AddToInventoryPreset(UKdw_Armor_L::StaticClass(), 1, EInventoryTypes::ArmorSlot);
    default AddToInventoryPreset(UNH_Armor::StaticClass());

    default AddToInventoryPreset(UHumanFist_NoWeapon::StaticClass(), 1,);
    default AddToInventoryPreset(UHumanFist_NoWeapon_Climbing::StaticClass(), 1);
    default AddToInventoryPreset(UHumanFist_NoWeapon_Swimming::StaticClass(), 1);

    default ApplyArmor = true;
}

UCLASS()
class UArcherInventory : UInventoryPreset
{
    default CleanInventory = true;

    default AddToInventoryPreset(UItMw_1H_Sword_01::StaticClass(), 1, EInventoryTypes::MeleeSlot);
    default AddToInventoryPreset(UItRw_Bow_Diego::StaticClass(), 1, EInventoryTypes::RangedSlot);
    default AddToInventoryPreset(UItMw_1H_Torch::StaticClass(), 99, EInventoryTypes::QuickItems); //3
    default AddToInventoryPreset(UItAr_Rune_Light::StaticClass(), 1, EInventoryTypes::QuickItems); //4

    default AddToInventoryPreset(UItRw_Bow_War_01::StaticClass(), 1, EInventoryTypes::QuickItems); //5
    default AddToInventoryPreset(UHumanFist_NoWeapon::StaticClass(), 1,); //6
    default AddToInventoryPreset(UItRw_Bow_Long_09::StaticClass(), 1, EInventoryTypes::QuickItems); //7
    default AddToInventoryPreset(UItRw_Bow_Small_05::StaticClass(), 1, EInventoryTypes::QuickItems); //8

    default AddToInventoryPreset(UHumanFist_NoWeapon_Climbing::StaticClass(), 1);
    default AddToInventoryPreset(UHumanFist_NoWeapon_Swimming::StaticClass(), 1); 

    default AddToInventoryPreset(UItAm_Arrow::StaticClass(), 50);
    default AddToInventoryPreset(UItAm_Bolt::StaticClass(), 50);

    default AddToInventoryPreset(UItRw_Bow_War_02::StaticClass(), 1,);
    default AddToInventoryPreset(UItRw_Bow_War_03::StaticClass(), 1,);
    default AddToInventoryPreset(UItRw_Bow_War_04::StaticClass(), 1,);
    default AddToInventoryPreset(UItRw_Bow_War_05::StaticClass(), 1,);

    default AddToInventoryPreset(UItRw_Bow_Long_01::StaticClass(), 1,);
    default AddToInventoryPreset(UItRw_Bow_Long_02::StaticClass(), 1,);
    default AddToInventoryPreset(UItRw_Bow_Long_03::StaticClass(), 1,);
    default AddToInventoryPreset(UItRw_Bow_Long_04::StaticClass(), 1,);
    default AddToInventoryPreset(UItRw_Bow_Long_05::StaticClass(), 1,);
    default AddToInventoryPreset(UItRw_Bow_Long_06::StaticClass(), 1,);
    default AddToInventoryPreset(UItRw_Bow_Long_07::StaticClass(), 1,);
    default AddToInventoryPreset(UItRw_Bow_Long_08::StaticClass(), 1,);

    default AddToInventoryPreset(UItRw_Bow_Small_01::StaticClass(), 1,);
    default AddToInventoryPreset(UItRw_Bow_Small_02::StaticClass(), 1,);
    default AddToInventoryPreset(UItRw_Bow_Small_03::StaticClass(), 1,);
    default AddToInventoryPreset(UItRw_Bow_Small_04::StaticClass(), 1,);

    default AddToInventoryPreset(UItRw_Crossbow_01::StaticClass(), 1,);
    default AddToInventoryPreset(UItRw_Crossbow_02::StaticClass(), 1,);
    default AddToInventoryPreset(UItRw_Crossbow_03::StaticClass(), 1,);
    default AddToInventoryPreset(UItRw_Crossbow_04::StaticClass(), 1,);
       
    default AddToInventoryPreset(USld_Armor::StaticClass(), 1, EInventoryTypes::ArmorSlot);
    default AddToInventoryPreset(UNH_Armor::StaticClass());
    default AddToInventoryPreset(UItAm_Arrow::StaticClass(), 50);

    default ApplyArmor = true;
}


UCLASS()
class UMeleeUntrainedInventory : UInventoryPreset
{
    default CleanInventory = true;

    default AddToInventoryPreset(UItMw_1H_Sword_Old_01::StaticClass(), 1, EInventoryTypes::MeleeSlot); //1
    default AddToInventoryPreset(UItRw_Bow_Small_01::StaticClass(), 1, EInventoryTypes::RangedSlot); //2
    default AddToInventoryPreset(UItMw_1H_Torch::StaticClass(), 99, EInventoryTypes::QuickItems); //3
    default AddToInventoryPreset(UHumanFist_NoWeapon::StaticClass(), 1, EInventoryTypes::QuickItems); //4
    default AddToInventoryPreset(UHumanFist_NoWeapon_Climbing::StaticClass(), 1);
    default AddToInventoryPreset(UHumanFist_NoWeapon_Swimming::StaticClass(), 1); 

    default AddToInventoryPreset(UItMw_1H_Axe_Hatchet_01::StaticClass(), 1, EInventoryTypes::QuickItems); //5
    default AddToInventoryPreset(UItMw_1H_Mace_Club_01::StaticClass(), 1, EInventoryTypes::QuickItems); //6
    default AddToInventoryPreset(USword2H_TestWeapon_Long::StaticClass(), 1, EInventoryTypes::QuickItems); //7
    default AddToInventoryPreset(UItMw_2H_Staff_Scepter::StaticClass(), 1, EInventoryTypes::QuickItems); //8

    default AddToInventoryPreset(UAxe2H_TestWeapon_Long::StaticClass(), 1);
    default AddToInventoryPreset(UMace2H_TestWeapon_Long::StaticClass(), 1);
    default AddToInventoryPreset(UItAm_Arrow::StaticClass(), 50);
    default AddToInventoryPreset(UItFo_Potion_Health_01::StaticClass(), 15);
    default AddToInventoryPreset(UItFo_Potion_Mana_01::StaticClass(), 15);

    default ApplyArmor = true;
}

UCLASS()
class UMeleeTrainedInventory : UInventoryPreset
{
    default CleanInventory = true;

    default AddToInventoryPreset(UItMw_1H_Sword_01::StaticClass(), 1, EInventoryTypes::MeleeSlot); //1
    default AddToInventoryPreset(UItRw_Bow_Long_03::StaticClass(), 1, EInventoryTypes::RangedSlot); //2
    default AddToInventoryPreset(UItMw_1H_Torch::StaticClass(), 99, EInventoryTypes::QuickItems); //3
    default AddToInventoryPreset(UHumanFist_NoWeapon::StaticClass(), 1, EInventoryTypes::QuickItems); //4
    default AddToInventoryPreset(UHumanFist_NoWeapon_Climbing::StaticClass(), 1);
    default AddToInventoryPreset(UHumanFist_NoWeapon_Swimming::StaticClass(), 1); 

    default AddToInventoryPreset(UItMw_1H_Axe_01::StaticClass(), 1, EInventoryTypes::QuickItems); //5
    default AddToInventoryPreset(UItMw_1H_Mace_04::StaticClass(), 1, EInventoryTypes::QuickItems); //6
    default AddToInventoryPreset(USword2H_TestWeapon_Long::StaticClass(), 1, EInventoryTypes::QuickItems); //7
    default AddToInventoryPreset(UItMw_2H_Staff_Scepter::StaticClass(), 1, EInventoryTypes::QuickItems); //8

    default AddToInventoryPreset(UAxe2H_TestWeapon_Long::StaticClass(), 1);
    default AddToInventoryPreset(UItMw_2H_Sword_Orc_01::StaticClass(), 1);
    default AddToInventoryPreset(UItAm_Arrow::StaticClass(), 50);
    default AddToInventoryPreset(UItFo_Potion_Health_02::StaticClass(), 15);
    default AddToInventoryPreset(UItFo_Potion_Mana_03::StaticClass(), 15);

    default ApplyArmor = true;
}

UCLASS()
class UMeleeMasterInventory : UInventoryPreset
{
    default CleanInventory = true;

    default AddToInventoryPreset(UItMw_1H_Sword_Arto::StaticClass(), 1, EInventoryTypes::MeleeSlot); //1
    default AddToInventoryPreset(UItRw_Bow_War_05::StaticClass(), 1, EInventoryTypes::RangedSlot); //2
    default AddToInventoryPreset(UItMw_1H_Torch::StaticClass(), 99, EInventoryTypes::QuickItems); //3
    default AddToInventoryPreset(UHumanFist_NoWeapon::StaticClass(), 1, EInventoryTypes::QuickItems); //4
    default AddToInventoryPreset(UHumanFist_NoWeapon_Climbing::StaticClass(), 1);
    default AddToInventoryPreset(UHumanFist_NoWeapon_Swimming::StaticClass(), 1); 

    default AddToInventoryPreset(UItMw_1H_Axe_Lares::StaticClass(), 1, EInventoryTypes::QuickItems); //5
    default AddToInventoryPreset(UItMw_1H_Mace_Orun::StaticClass(), 1, EInventoryTypes::QuickItems); //6
    default AddToInventoryPreset(UItMw_2H_Sword_Light_05::StaticClass(), 1, EInventoryTypes::QuickItems); //7
    default AddToInventoryPreset(UItMw_2H_Staff_Scepter::StaticClass(), 1, EInventoryTypes::QuickItems); //8

    default AddToInventoryPreset(UItMw_2H_Axe_Old_03::StaticClass(), 1);
    default AddToInventoryPreset(UItMw_2H_Mace_Orc_01::StaticClass(), 1);
    default AddToInventoryPreset(UItAm_Arrow::StaticClass(), 50);
    default AddToInventoryPreset(UItFo_Potion_Health_03::StaticClass(), 15);

    default ApplyArmor = true;
}

UCLASS()
class UAllArmorsInventory : UInventoryPreset
{
    default CleanInventory = false;
    default AddToInventoryPreset(UGrd_Armor::StaticClass(),1,EInventoryTypes::ArmorSlot);
    default AddToInventoryPreset(UCrw_Armor_H::StaticClass());
    default AddToInventoryPreset(UDmb_Armor_M::StaticClass());
    default AddToInventoryPreset(UEbr_Armor_H_01::StaticClass());
    default AddToInventoryPreset(UEbr_Armor_H_02::StaticClass());
    default AddToInventoryPreset(UEbr_Armor_M::StaticClass());
    default AddToInventoryPreset(UGrd_Armor::StaticClass());
    default AddToInventoryPreset(UGur_Armor_H::StaticClass());
    default AddToInventoryPreset(UGur_Armor_M::StaticClass());
    default AddToInventoryPreset(UKdf_Armor_H::StaticClass());
    default AddToInventoryPreset(UKdf_Armor_L::StaticClass());
    default AddToInventoryPreset(UKdw_Armor_H::StaticClass());
    default AddToInventoryPreset(UKdw_Armor_L::StaticClass());
    default AddToInventoryPreset(ULaw_Armor::StaticClass());
    default AddToInventoryPreset(UNov_Armor::StaticClass());
    default AddToInventoryPreset(UOre_Armor_H::StaticClass());
    default AddToInventoryPreset(UOre_Armor_M::StaticClass());
    default AddToInventoryPreset(UOrg_Armor::StaticClass());
    default AddToInventoryPreset(URyl_Armor::StaticClass());
    default AddToInventoryPreset(USfb_Armor_L::StaticClass());
    default AddToInventoryPreset(USld_Armor::StaticClass());
    default AddToInventoryPreset(UStt_Armor::StaticClass());
    default AddToInventoryPreset(UTpl_Armor::StaticClass());
    default AddToInventoryPreset(UVlk_Armor_L::StaticClass());
    default AddToInventoryPreset(UVlk_Armor_M::StaticClass());

    default ApplyArmor = true;
}

UCLASS()
class URustySwordPreset : UInventoryPreset
{
default CleanInventory = false;
default AddToInventoryPreset(UItMw_1H_Sword_Old_01::StaticClass(), 1, EInventoryTypes::MeleeSlot); //1

}

UCLASS()
class UAllRecipesInventory : UInventoryPreset
{
    default CleanInventory = false;
    default AddToTypeToPreset(GameplayTag::Item_Recipe);
}

UCLASS()
class UAllWritingsPreset : UInventoryPreset
{
    default CleanInventory = false;
    default AddToTypeToPreset(GameplayTag::Item_Writing);
}

UCLASS()
class UAllFoodHerbsPreset : UInventoryPreset
{
    default CleanInventory = false;
    default AddToTypeToPreset(GameplayTag::Item_Food);
    default AddToTypeToPreset(GameplayTag::Item_Herb);
}

UCLASS()
class UAllPotionsPreset : UInventoryPreset
{
    default CleanInventory = false;
    default AddToTypeToPreset(GameplayTag::Item_Potion);
}

UCLASS()
class UAllWearablesPreset : UInventoryPreset
{
    default CleanInventory = false;
    default AddToTypeToPreset(GameplayTag::Item_Amulet);
    default AddToTypeToPreset(GameplayTag::Item_Ring);
    default AddToTypeToPreset(GameplayTag::Item_Armor);
}

UCLASS()
class UAllKeysPreset : UInventoryPreset
{
    default CleanInventory = false;
    default AddToTypeToPreset(GameplayTag::Item_Key);
}

UCLASS()
class UAllQuestPreset : UInventoryPreset
{
    default CleanInventory = false;
    default AddToTypeToPreset(GameplayTag::Item_Quest);
 
}

UCLASS()
class UAllJunkPreset : UInventoryPreset
{
    default CleanInventory = false;
    default AddToTypeToPreset(GameplayTag::Item_Junk);
}

UCLASS()
class UAllRangePreset : UInventoryPreset
{
    default CleanInventory = false;
    default AddToTypeToPreset(GameplayTag::Item_Weapon_Bow);
    default AddToTypeToPreset(GameplayTag::Item_Weapon_Crossbow);
}

UCLASS()
class UBookTestPreset : UInventoryPreset
{
    default CleanInventory = false;
    default AddToInventoryPreset(UItWr_Book_Golem_01::StaticClass());
}

UCLASS()
class UAllMeleePreset : UInventoryPreset
{
    default CleanInventory = false;
    default AddToTypeToPreset(GameplayTag::Item_Weapon_Axe);
    default AddToTypeToPreset(GameplayTag::Item_Weapon_Sword);
    default AddToTypeToPreset(GameplayTag::Item_Weapon_Staff_TwoHand);
    default AddToTypeToPreset(GameplayTag::Item_Weapon_Mace);
}

UCLASS()
class UAllMaterialTrophyPreset : UInventoryPreset
{
    default CleanInventory = false;
    default AddToTypeToPreset(GameplayTag::Item_Trophy);
    default AddToTypeToPreset(GameplayTag::Item_Material);
}
