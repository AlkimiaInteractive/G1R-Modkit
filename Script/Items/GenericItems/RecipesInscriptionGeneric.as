
UCLASS()
class UReAr_Scroll_Charm: UInscriptionRecipe
{
    default m_Name = "ItAr_Scroll_Charm";
    default m_Description = "ItAr_Scroll_Charm_description";
    default m_RequiredIngredients.Add(UItMi_Inscription_Parchment::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItMi_Plants_Swampherb_01::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItFo_Plants_Siren::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItFo_Potion_Wine::StaticClass(), 1);
    default m_FinalItem.Add(UItAr_Scroll_Charm::StaticClass(), 1);
}

UCLASS()
class UReAr_Scroll_Telekinesis: UInscriptionRecipe
{
    default m_Name = "ItAr_Scroll_Telekinesis";
    default m_Description = "ItAr_Scroll_Telekinesis_description";
    default m_RequiredIngredients.Add(UItMi_Inscription_Parchment::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItMi_Plants_Swampherb_01::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItFo_Plants_Stoneroot_01::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItFo_Plants_Siren::StaticClass(), 1);
    default m_FinalItem.Add(UItAr_Scroll_Telekinesis::StaticClass(), 1);
}

UCLASS()
class UReAr_Scroll_Control: UInscriptionRecipe
{
    default m_Name = "ItAr_Scroll_Control";
    default m_Description = "ItAr_Scroll_Control_description";
    default m_RequiredIngredients.Add(UItMi_Inscription_Parchment::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItMi_Plants_Swampherb_01::StaticClass(), 2);
    default m_RequiredIngredients.Add(UItFo_Plants_Stoneroot_01::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItFo_Potion_Wine::StaticClass(), 1);
    default m_FinalItem.Add(UItAr_Scroll_Control::StaticClass(), 1);
}

UCLASS()
class UReAr_Scroll_Pyrokinesis: UInscriptionRecipe
{
    default m_Name = "ItAr_Scroll_Pyrokinesis";
    default m_Description = "ItAr_Scroll_Pyrokinesis_description";
    default m_RequiredIngredients.Add(UItMi_Inscription_Parchment::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItMi_Plants_Swampherb_01::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItFo_Plants_Flameberry_01::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItFo_Plants_Stoneroot_01::StaticClass(), 1);
    default m_FinalItem.Add(UItAr_Scroll_Pyrokinesis::StaticClass(), 1);
}

UCLASS()
class UReAr_Scroll_Sleep: UInscriptionRecipe
{
    default m_Name = "ItAr_Scroll_Sleep";
    default m_Description = "ItAr_Scroll_Sleep_description";
    default m_RequiredIngredients.Add(UItMi_Inscription_Parchment::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItFo_Plants_Nightshadow_02::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItFo_Potion_Wine::StaticClass(), 1);
    default m_FinalItem.Add(UItAr_Scroll_Sleep::StaticClass(), 1);
}

UCLASS()
class UReAr_Scroll_Fear: UInscriptionRecipe
{
    default m_Name = "ItAr_Scroll_Fear";
    default m_Description = "ItAr_Scroll_Fear_description";
    default m_RequiredIngredients.Add(UItMi_Inscription_Parchment::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItFo_Plants_Ravenherb_02::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItAt_Shadow_02::StaticClass(), 1);
    default m_FinalItem.Add(UItAr_Scroll_Fear::StaticClass(), 1);
}

UCLASS()
class UReAr_Scroll_Heal: UInscriptionRecipe
{
    default m_Name = "ItAr_Scroll_Heal";
    default m_Description = "ItAr_Scroll_Heal_description";
    default m_RequiredIngredients.Add(UItMi_Inscription_Parchment::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItFo_Plants_Herb_01::StaticClass(), 1);
    default m_FinalItem.Add(UItAr_Scroll_Heal::StaticClass(), 1);
}

UCLASS()
class UReAr_Scroll_FireBolt: UInscriptionRecipe
{
    default m_Name = "ItAr_Scroll_FireBolt";
    default m_Description = "ItAr_Scroll_FireBolt_description";
    default m_RequiredIngredients.Add(UItMi_Inscription_Parchment::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItFo_Plants_Flameberry_01::StaticClass(), 1);
    default m_FinalItem.Add(UItAr_Scroll_FireBolt::StaticClass(), 1);
}

UCLASS()
class UReAr_Scroll_IceBolt: UInscriptionRecipe
{
    default m_Name = "ItAr_Scroll_IceBolt";
    default m_Description = "ItAr_Scroll_IceBolt_description";
    default m_RequiredIngredients.Add(UItMi_Inscription_Parchment::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItFo_Plants_Dewleaf::StaticClass(), 1);
    default m_FinalItem.Add(UItAr_Scroll_IceBolt::StaticClass(), 1);
}

UCLASS()
class UReAr_Scroll_FistOfWind: UInscriptionRecipe
{
    default m_Name = "ItAr_Scroll_FistOfWind";
    default m_Description = "ItAr_Scroll_FistOfWind_description";
    default m_RequiredIngredients.Add(UItMi_Inscription_Parchment::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItAt_Harpy_01::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItAt_Bloodfly_01::StaticClass(), 1);
    default m_FinalItem.Add(UItAr_Scroll_FistOfWind::StaticClass(), 1);
}

UCLASS()
class UReAr_Scroll_ChainLightning: UInscriptionRecipe
{
    default m_Name = "ItAr_Scroll_ChainLightning";
    default m_Description = "ItAr_Scroll_ChainLightning_description";
    default m_RequiredIngredients.Add(UItMi_Inscription_Parchment::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItMi_Smith_Iron::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItAt_Bloodfly_02::StaticClass(), 1);
    default m_FinalItem.Add(UItAr_Scroll_ChainLightning::StaticClass(), 1);
}

UCLASS()
class UReAr_Scroll_IceBlock: UInscriptionRecipe
{
    default m_Name = "ItAr_Scroll_IceBlock";
    default m_Description = "ItAr_Scroll_IceBlock_description";
    default m_RequiredIngredients.Add(UItMi_Inscription_Parchment::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItFo_Plants_Dewleaf::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItAt_Wolf_03::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItAt_Lurker_03::StaticClass(), 1);
    default m_FinalItem.Add(UItAr_Scroll_IceBlock::StaticClass(), 1);
}

UCLASS()
class UReAr_Scroll_FireBall: UInscriptionRecipe
{
    default m_Name = "ItAr_Scroll_FireBall";
    default m_Description = "ItAr_Scroll_FireBall_description";
    default m_RequiredIngredients.Add(UItMi_Inscription_Parchment::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItFo_Plants_Flameberry_01::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItFo_Plants_Mushroom_01::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItMi_Smith_Oak::StaticClass(), 1);
    default m_FinalItem.Add(UItAr_Scroll_FireBall::StaticClass(), 1);
}

UCLASS()
class UReAr_Scroll_IceWave: UInscriptionRecipe
{
    default m_Name = "ItAr_Scroll_IceWave";
    default m_Description = "ItAr_Scroll_IceWave_description";
    default m_RequiredIngredients.Add(UItMi_Inscription_Parchment::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItFo_Plants_Dewleaf::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItAt_Bloodfly_01::StaticClass(), 2);
    default m_RequiredIngredients.Add(UItAt_Harpy_01::StaticClass(), 2);
    default m_FinalItem.Add(UItAr_Scroll_IceWave::StaticClass(), 1);
}

UCLASS()
class UReAr_Scroll_BallLightning: UInscriptionRecipe
{
    default m_Name = "ItAr_Scroll_BallLightning";
    default m_Description = "ItAr_Scroll_BallLightning_description";
    default m_RequiredIngredients.Add(UItMi_Inscription_Parchment::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItMi_Smith_Gold::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItAt_Harpy_02::StaticClass(), 1);
    default m_FinalItem.Add(UItAr_Scroll_BallLightning::StaticClass(), 1);
}

UCLASS()
class UReAr_Scroll_StormFist: UInscriptionRecipe
{
    default m_Name = "ItAr_Scroll_StormFist";
    default m_Description = "ItAr_Scroll_StormFist_description";
    default m_RequiredIngredients.Add(UItMi_Inscription_Parchment::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItAt_Harpy_01::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItAt_Bloodfly_02::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItAt_Harpy_02::StaticClass(), 1);
    default m_FinalItem.Add(UItAr_Scroll_StormFist::StaticClass(), 1);
}

UCLASS()
class UReAr_Scroll_StormOfFire: UInscriptionRecipe
{
    default m_Name = "ItAr_Scroll_StormOfFire";
    default m_Description = "ItAr_Scroll_StormOfFire_description";
    default m_RequiredIngredients.Add(UItMi_Inscription_Parchment::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItAt_Firelizard_03::StaticClass(), 1);
    default m_FinalItem.Add(UItAr_Scroll_StormOfFire::StaticClass(), 1);
}

UCLASS()
class UReAr_Scroll_DeathToTheUndead: UInscriptionRecipe
{
    default m_Name = "ItAr_Scroll_DeathToTheUndead";
    default m_Description = "ItAr_Scroll_DeathToTheUndead_description";
    default m_RequiredIngredients.Add(UItMi_Inscription_Parchment::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItFo_Plants_Ravenherb_02::StaticClass(), 2);
    default m_RequiredIngredients.Add(UItAt_Shadow_04::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItAt_Lizard_03::StaticClass(), 1);
    default m_FinalItem.Add(UItAr_Scroll_DeathToTheUndead::StaticClass(), 1);
}

UCLASS()
class UReAr_Scroll_FireRain: UInscriptionRecipe
{
    default m_Name = "ItAr_Scroll_FireRain";
    default m_Description = "ItAr_Scroll_FireRain_description";
    default m_RequiredIngredients.Add(UItMi_Inscription_Parchment::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItAt_Firelizard_02::StaticClass(), 1);
    default m_FinalItem.Add(UItAr_Scroll_FireRain::StaticClass(), 1);
}

UCLASS()
class UReAr_Scroll_TransformBiter: UInscriptionRecipe
{
    default m_Name = "ItAr_Scroll_TransformBiter";
    default m_Description = "ItAr_Scroll_TransformBiter_description";
    default m_RequiredIngredients.Add(UItMi_Inscription_Parchment::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItAt_Biter_01::StaticClass(), 2);
    default m_RequiredIngredients.Add(UItAt_Biter_02::StaticClass(), 4);
    default m_RequiredIngredients.Add(UItAt_Biter_03::StaticClass(), 1);
    default m_FinalItem.Add(UItAr_Scroll_TransformBiter::StaticClass(), 1);
}

UCLASS()
class UReAr_Scroll_TransformBloodfly: UInscriptionRecipe
{
    default m_Name = "ItAr_Scroll_TransformBloodfly";
    default m_Description = "ItAr_Scroll_TransformBloodfly_description";
    default m_RequiredIngredients.Add(UItMi_Inscription_Parchment::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItAt_Bloodfly_01::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItAt_Bloodfly_02::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItAt_Bloodfly_03::StaticClass(), 1);
    default m_FinalItem.Add(UItAr_Scroll_TransformBloodfly::StaticClass(), 1);
}

UCLASS()
class UReAr_Scroll_TransformBloodhound: UInscriptionRecipe
{
    default m_Name = "ItAr_Scroll_TransformBloodhound";
    default m_Description = "ItAr_Scroll_TransformBloodhound_description";
    default m_RequiredIngredients.Add(UItMi_Inscription_Parchment::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItAt_Bloodhound_01::StaticClass(), 5);
    default m_RequiredIngredients.Add(UItAt_Bloodhound_02::StaticClass(), 1);
    default m_FinalItem.Add(UItAr_Scroll_TransformBloodhound::StaticClass(), 1);
}

UCLASS()
class UReAr_Scroll_TransformFireLizard: UInscriptionRecipe
{
    default m_Name = "ItAr_Scroll_TransformFireLizard";
    default m_Description = "ItAr_Scroll_TransformFireLizard_description";
    default m_RequiredIngredients.Add(UItMi_Inscription_Parchment::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItAt_Firelizard_01::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItAt_Firelizard_02::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItAt_Firelizard_03::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItAt_Firelizard_04::StaticClass(), 1);
    default m_FinalItem.Add(UItAr_Scroll_TransformFireLizard::StaticClass(), 1);
}

UCLASS()
class UReAr_Scroll_TransformHarpy: UInscriptionRecipe
{
    default m_Name = "ItAr_Scroll_TransformHarpy";
    default m_Description = "ItAr_Scroll_TransformHarpy_description";
    default m_RequiredIngredients.Add(UItMi_Inscription_Parchment::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItAt_Harpy_01::StaticClass(), 6);
    default m_RequiredIngredients.Add(UItAt_Harpy_02::StaticClass(), 4);
    default m_FinalItem.Add(UItAr_Scroll_TransformHarpy::StaticClass(), 1);
}

UCLASS()
class UReAr_Scroll_TransformLizard: UInscriptionRecipe
{
    default m_Name = "ItAr_Scroll_TransformLizard";
    default m_Description = "ItAr_Scroll_TransformLizard_description";
    default m_RequiredIngredients.Add(UItMi_Inscription_Parchment::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItAt_Lizard_01::StaticClass(), 2);
    default m_RequiredIngredients.Add(UItAt_Lizard_02::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItAt_Lizard_03::StaticClass(), 1);
    default m_FinalItem.Add(UItAr_Scroll_TransformLizard::StaticClass(), 1);
}

UCLASS()
class UReAr_Scroll_TransformLurker: UInscriptionRecipe
{
    default m_Name = "ItAr_Scroll_TransformLurker";
    default m_Description = "ItAr_Scroll_TransformLurker_description";
    default m_RequiredIngredients.Add(UItMi_Inscription_Parchment::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItAt_Lurker_01::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItAt_Lurker_02::StaticClass(), 3);
    default m_RequiredIngredients.Add(UItAt_Lurker_03::StaticClass(), 1);
    default m_FinalItem.Add(UItAr_Scroll_TransformLurker::StaticClass(), 1);
}

UCLASS()
class UReAr_Scroll_TransformMeatbug: UInscriptionRecipe
{
    default m_Name = "ItAr_Scroll_TransformMeatbug";
    default m_Description = "ItAr_Scroll_TransformMeatbug_description";
    default m_RequiredIngredients.Add(UItMi_Inscription_Parchment::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItAt_Meatbug_01::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItMi_Alchemy_Sulphur_01::StaticClass(), 1);
    default m_FinalItem.Add(UItAr_Scroll_TransformMeatbug::StaticClass(), 1);
}

UCLASS()
class UReAr_Scroll_TransformMinecrawler: UInscriptionRecipe
{
    default m_Name = "ItAr_Scroll_TransformMinecrawler";
    default m_Description = "ItAr_Scroll_TransformMinecrawler_description";
    default m_RequiredIngredients.Add(UItMi_Inscription_Parchment::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItAt_Crawler_01::StaticClass(), 4);
    default m_RequiredIngredients.Add(UItAt_Crawler_02::StaticClass(), 1);
    default m_FinalItem.Add(UItAr_Scroll_TransformMinecrawler::StaticClass(), 1);
}

UCLASS()
class UReAr_Scroll_TransformMolerat: UInscriptionRecipe
{
    default m_Name = "ItAr_Scroll_TransformMolerat";
    default m_Description = "ItAr_Scroll_TransformMolerat_description";
    default m_RequiredIngredients.Add(UItMi_Inscription_Parchment::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItFo_Muttonraw::StaticClass(), 2);
    default m_RequiredIngredients.Add(UItMi_Alchemy_Sulphur_01::StaticClass(), 1);
    default m_FinalItem.Add(UItAr_Scroll_TransformMolerat::StaticClass(), 1);
}

UCLASS()
class UReAr_Scroll_TransformOrcDog: UInscriptionRecipe
{
    default m_Name = "ItAr_Scroll_TransformOrcDog";
    default m_Description = "ItAr_Scroll_TransformOrcDog_description";
    default m_RequiredIngredients.Add(UItMi_Inscription_Parchment::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItAt_Orcdog_01::StaticClass(), 4);
    default m_RequiredIngredients.Add(UItAt_Orcdog_02::StaticClass(), 1);
    default m_FinalItem.Add(UItAr_Scroll_TransformOrcDog::StaticClass(), 1);
}

UCLASS()
class UReAr_Scroll_TransformRazor: UInscriptionRecipe
{
    default m_Name = "ItAr_Scroll_TransformRazor";
    default m_Description = "ItAr_Scroll_TransformRazor_description";
    default m_RequiredIngredients.Add(UItMi_Inscription_Parchment::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItAt_Razor_01::StaticClass(), 4);
    default m_RequiredIngredients.Add(UItAt_Razor_02::StaticClass(), 4);
    default m_FinalItem.Add(UItAr_Scroll_TransformRazor::StaticClass(), 1);
}

UCLASS()
class UReAr_Scroll_TransformScavenger: UInscriptionRecipe
{
    default m_Name = "ItAr_Scroll_TransformScavenger";
    default m_Description = "ItAr_Scroll_TransformScavenger_description";
    default m_RequiredIngredients.Add(UItMi_Inscription_Parchment::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItAt_Scavenger_01::StaticClass(), 3);
    default m_RequiredIngredients.Add(UItAt_Scavenger_02::StaticClass(), 1);
    default m_FinalItem.Add(UItAr_Scroll_TransformScavenger::StaticClass(), 1);
}

UCLASS()
class UReAr_Scroll_TransformShadowbeast: UInscriptionRecipe
{
    default m_Name = "ItAr_Scroll_TransformShadowbeast";
    default m_Description = "ItAr_Scroll_TransformShadowbeast_description";
    default m_RequiredIngredients.Add(UItMi_Inscription_Parchment::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItAt_Shadow_01::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItAt_Shadow_02::StaticClass(), 1);
    default m_FinalItem.Add(UItAr_Scroll_TransformShadowbeast::StaticClass(), 1);
}

UCLASS()
class UReAr_Scroll_TransformSnapper: UInscriptionRecipe
{
    default m_Name = "ItAr_Scroll_TransformSnapper";
    default m_Description = "ItAr_Scroll_TransformSnapper_description";
    default m_RequiredIngredients.Add(UItMi_Inscription_Parchment::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItAt_Snapper_01::StaticClass(), 5);
    default m_RequiredIngredients.Add(UItAt_Snapper_02::StaticClass(), 5);
    default m_FinalItem.Add(UItAr_Scroll_TransformSnapper::StaticClass(), 1);
}

UCLASS()
class UReAr_Scroll_TransformSwampshark: UInscriptionRecipe
{
    default m_Name = "ItAr_Scroll_TransformSwampshark";
    default m_Description = "ItAr_Scroll_TransformSwampshark_description";
    default m_RequiredIngredients.Add(UItMi_Inscription_Parchment::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItAt_Swampshark_01::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItAt_Swampshark_02::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItAt_Swampshark_03::StaticClass(), 1);
    default m_FinalItem.Add(UItAr_Scroll_TransformSwampshark::StaticClass(), 1);
}

UCLASS()
class UReAr_Scroll_TransformWolf: UInscriptionRecipe
{
    default m_Name = "ItAr_Scroll_TransformWolf";
    default m_Description = "ItAr_Scroll_TransformWolf_description";
    default m_RequiredIngredients.Add(UItMi_Inscription_Parchment::StaticClass(), 1);
    default m_RequiredIngredients.Add(UItAt_Wolf_01::StaticClass(), 4);
    default m_RequiredIngredients.Add(UItAt_Wolf_02::StaticClass(), 1);
    default m_FinalItem.Add(UItAr_Scroll_TransformWolf::StaticClass(), 1);
}

