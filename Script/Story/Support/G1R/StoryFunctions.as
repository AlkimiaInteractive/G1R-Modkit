#ifdef WITH_STORY_G1R

UFUNCTION()
mixin void ExampleStoryCallWithArgs(UGameStory Story, AGothicCharacterState Character, int Number)
{
    Print("Hello from story call with args!");
}

UFUNCTION()
mixin void ExampleStoryCall(UGameStory Story)
{
    // FCharacterUniqueName(n"MY_CHARACTER_NAME").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_AITestDummy::StaticClass());
}

UFUNCTION()
mixin void InitialCharacterAssigment(UGameStory Story)
{
    if(IsValid(FCharacterUniqueName(n"FM_OSL_Tarrok_2001").NPCState))
        FCharacterUniqueName(n"FM_OSL_Tarrok_2001").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"NC_BAU_Ricelord_900").NPCState))
        FCharacterUniqueName(n"NC_BAU_Ricelord_900").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"NC_KDW_Cronos_604").NPCState))
        FCharacterUniqueName(n"NC_KDW_Cronos_604").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"NC_KDW_Merdarion_602").NPCState))
        FCharacterUniqueName(n"NC_KDW_Merdarion_602").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"NC_KDW_Myxir_601").NPCState))
        FCharacterUniqueName(n"NC_KDW_Myxir_601").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"NC_KDW_Nefarius_603").NPCState))
        FCharacterUniqueName(n"NC_KDW_Nefarius_603").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"NC_KDW_Riordian_605").NPCState))
        FCharacterUniqueName(n"NC_KDW_Riordian_605").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"NC_KDW_Saturas_600").NPCState))
        FCharacterUniqueName(n"NC_KDW_Saturas_600").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"NC_NOV_BaalIsidro_1333").NPCState))
        FCharacterUniqueName(n"NC_NOV_BaalIsidro_1333").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"NC_NOV_BaalKagan_1332").NPCState))
        FCharacterUniqueName(n"NC_NOV_BaalKagan_1332").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"NC_ORG_Buster_833").NPCState))
        FCharacterUniqueName(n"NC_ORG_Buster_833").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"NC_ORG_Butch_851").NPCState))
        FCharacterUniqueName(n"NC_ORG_Butch_851").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"NC_ORG_Cipher_873").NPCState))
        FCharacterUniqueName(n"NC_ORG_Cipher_873").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"NC_ORG_Lares_801").NPCState))
        FCharacterUniqueName(n"NC_ORG_Lares_801").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"NC_ORG_Roscoe_840").NPCState))
        FCharacterUniqueName(n"NC_ORG_Roscoe_840").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"NC_ORG_Silas_841").NPCState))
        FCharacterUniqueName(n"NC_ORG_Silas_841").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"NC_ORG_Wedge_850").NPCState))
        FCharacterUniqueName(n"NC_ORG_Wedge_850").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"NC_ORG_Wolf_855").NPCState))
        FCharacterUniqueName(n"NC_ORG_Wolf_855").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"NC_ORG_Rogue03_806").NPCState))
        FCharacterUniqueName(n"NC_ORG_Rogue03_806").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"NC_ORG_Rogue06_811").NPCState))
        FCharacterUniqueName(n"NC_ORG_Rogue06_811").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"NC_ORG_Rogue18_831").NPCState))
        FCharacterUniqueName(n"NC_ORG_Rogue18_831").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"NC_SLD_Cord_709").NPCState))
        FCharacterUniqueName(n"NC_SLD_Cord_709").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"NC_SLD_Gorn_699").NPCState))
        FCharacterUniqueName(n"NC_SLD_Gorn_699").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"NC_SLD_Jarvis_728").NPCState))
        FCharacterUniqueName(n"NC_SLD_Jarvis_728").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"NC_SLD_Lee_700").NPCState))
        FCharacterUniqueName(n"NC_SLD_Lee_700").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"NC_SLD_Orik_701").NPCState))
        FCharacterUniqueName(n"NC_SLD_Orik_701").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"NC_SLD_Torlof_737").NPCState))
        FCharacterUniqueName(n"NC_SLD_Torlof_737").NPCState.GiveImmortality();
    
    if(IsValid(FCharacterUniqueName(n"OC_EBR_Bartholo_106").NPCState))
        FCharacterUniqueName(n"OC_EBR_Bartholo_106").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"OC_EBR_Gomez_100").NPCState))
        FCharacterUniqueName(n"OC_EBR_Gomez_100").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"OC_EBR_Raven_105").NPCState))
        FCharacterUniqueName(n"OC_EBR_Raven_105").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"OC_GRD_Fletcher_255").NPCState))
        FCharacterUniqueName(n"OC_GRD_Fletcher_255").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"OC_GRD_Guard02_206").NPCState))
        FCharacterUniqueName(n"OC_GRD_Guard02_206").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"OC_GRD_Guard03_209").NPCState))
        FCharacterUniqueName(n"OC_GRD_Guard03_209").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"OC_GRD_Guard04_218").NPCState))
        FCharacterUniqueName(n"OC_GRD_Guard04_218").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"OC_GRD_Guard09_225").NPCState))
        FCharacterUniqueName(n"OC_GRD_Guard09_225").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"OC_GRD_Guard10_226").NPCState))
        FCharacterUniqueName(n"OC_GRD_Guard10_226").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"OC_GRD_Guard11_227").NPCState))
        FCharacterUniqueName(n"OC_GRD_Guard11_227").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"OC_GRD_Guard15_231").NPCState))
        FCharacterUniqueName(n"OC_GRD_Guard15_231").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"OC_GRD_Guard16_232").NPCState))
        FCharacterUniqueName(n"OC_GRD_Guard16_232").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"OC_GRD_Guard25_245").NPCState))
        FCharacterUniqueName(n"OC_GRD_Guard25_245").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"OC_GRD_Guard26_252").NPCState))
        FCharacterUniqueName(n"OC_GRD_Guard26_252").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"OC_GRD_Guard31_283N").NPCState))
        FCharacterUniqueName(n"OC_GRD_Guard31_283N").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"OC_GRD_Guard32_284N").NPCState))
        FCharacterUniqueName(n"OC_GRD_Guard32_284N").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"OC_GRD_Guard33_285N").NPCState))
        FCharacterUniqueName(n"OC_GRD_Guard33_285N").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"OC_GRD_Guard34_286N").NPCState))
        FCharacterUniqueName(n"OC_GRD_Guard34_286N").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"OC_GRD_Guard35_287N").NPCState))
        FCharacterUniqueName(n"OC_GRD_Guard35_287N").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"OC_GRD_Guard36_288N").NPCState))
        FCharacterUniqueName(n"OC_GRD_Guard36_288N").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"OC_GRD_Guard37_289N").NPCState))
        FCharacterUniqueName(n"OC_GRD_Guard37_289N").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"OC_GRD_Guard39_291N").NPCState))
        FCharacterUniqueName(n"OC_GRD_Guard39_291N").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"OC_GRD_Kirgo_251").NPCState))
        FCharacterUniqueName(n"OC_GRD_Kirgo_251").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"OC_GRD_Thorus_200").NPCState))
        FCharacterUniqueName(n"OC_GRD_Thorus_200").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"OC_KDF_Corristo_402").NPCState))
        FCharacterUniqueName(n"OC_KDF_Corristo_402").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"OC_KDF_Damarok_401").NPCState))
        FCharacterUniqueName(n"OC_KDF_Damarok_401").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"OC_KDF_Drago_403").NPCState))
        FCharacterUniqueName(n"OC_KDF_Drago_403").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"OC_KDF_Rodriguez_400").NPCState))
        FCharacterUniqueName(n"OC_KDF_Rodriguez_400").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"OC_KDF_Torrez_405").NPCState))
        FCharacterUniqueName(n"OC_KDF_Torrez_405").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"OC_KDF_Milten").NPCState))
        FCharacterUniqueName(n"OC_KDF_Milten").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"OC_STT_Diego").NPCState))
        FCharacterUniqueName(n"OC_STT_Diego").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Dusty_524").NPCState))
        FCharacterUniqueName(n"OC_VLK_Dusty_524").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"OC_STT_Dexter_329").NPCState))
        FCharacterUniqueName(n"OC_STT_Dexter_329").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"OC_STT_Fisk_311").NPCState))
        FCharacterUniqueName(n"OC_STT_Fisk_311").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"OC_STT_Fingers_331").NPCState))
        FCharacterUniqueName(n"OC_STT_Fingers_331").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"OC_STT_Sly_315").NPCState))
        FCharacterUniqueName(n"OC_STT_Sly_315").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"OC_STT_Whistler_309").NPCState))
        FCharacterUniqueName(n"OC_STT_Whistler_309").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"OG_GUR_BaalLukor_1211").NPCState))
        FCharacterUniqueName(n"OG_GUR_BaalLukor_1211").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"OW_OSM_UrNazkrog_2401").NPCState))
        FCharacterUniqueName(n"OW_OSM_UrNazkrog_2401").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"OW_OWR_ToChurnagg_2403").NPCState))
        FCharacterUniqueName(n"OW_OWR_ToChurnagg_2403").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"OW_OWR_Grazkrak_2400").NPCState))
        FCharacterUniqueName(n"OW_OWR_Grazkrak_2400").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"OWR_OrcWarriorM09_2022").NPCState))
        FCharacterUniqueName(n"OWR_OrcWarriorM09_2022").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"OWR_OrcWarriorM10_2023").NPCState))
        FCharacterUniqueName(n"OWR_OrcWarriorM10_2023").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"OM_GRD_Asghan_263").NPCState))
        FCharacterUniqueName(n"OM_GRD_Asghan_263").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"OM_STT_Ian_301").NPCState))
        FCharacterUniqueName(n"OM_STT_Ian_301").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"OM_TPL_GorNaBar_1400").NPCState))
        FCharacterUniqueName(n"OM_TPL_GorNaBar_1400").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"OM_TPL_GorNaKosh_1401").NPCState))
        FCharacterUniqueName(n"OM_TPL_GorNaKosh_1401").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"OM_TPL_GorNaVid_1433").NPCState))
        FCharacterUniqueName(n"OM_TPL_GorNaVid_1433").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"OM_VLK_Grimes_586").NPCState))
        FCharacterUniqueName(n"OM_VLK_Grimes_586").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"SC_NOV_Caine_1301").NPCState))
        FCharacterUniqueName(n"SC_NOV_Caine_1301").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"SC_GUR_BaalCadar_1208").NPCState))
        FCharacterUniqueName(n"SC_GUR_BaalCadar_1208").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"SC_GUR_BaalNamib_1204").NPCState))
        FCharacterUniqueName(n"SC_GUR_BaalNamib_1204").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"SC_GUR_BaalOrun_1209").NPCState))
        FCharacterUniqueName(n"SC_GUR_BaalOrun_1209").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"SC_GUR_BaalTondral_1203").NPCState))
        FCharacterUniqueName(n"SC_GUR_BaalTondral_1203").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"SC_GUR_BaalTyon_1210").NPCState))
        FCharacterUniqueName(n"SC_GUR_BaalTyon_1210").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"SC_GUR_CorAngar_1202").NPCState))
        FCharacterUniqueName(n"SC_GUR_CorAngar_1202").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"SC_GUR_CorKalom_1201").NPCState))
        FCharacterUniqueName(n"SC_GUR_CorKalom_1201").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"SC_TPL_KalomBodyguard_1406").NPCState))
        FCharacterUniqueName(n"SC_TPL_KalomBodyguard_1406").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"SC_GUR_YBerion_1200").NPCState))
        FCharacterUniqueName(n"SC_GUR_YBerion_1200").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"SC_NOV_Lester").NPCState))
        FCharacterUniqueName(n"SC_NOV_Lester").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice01_1306").NPCState))
        FCharacterUniqueName(n"SC_NOV_Novice01_1306").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice03_1308").NPCState))
        FCharacterUniqueName(n"SC_NOV_Novice03_1308").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice07_1314").NPCState))
        FCharacterUniqueName(n"SC_NOV_Novice07_1314").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice08_1315").NPCState))
        FCharacterUniqueName(n"SC_NOV_Novice08_1315").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice09_1316").NPCState))
        FCharacterUniqueName(n"SC_NOV_Novice09_1316").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice19_1326").NPCState))
        FCharacterUniqueName(n"SC_NOV_Novice19_1326").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice24_1335").NPCState))
        FCharacterUniqueName(n"SC_NOV_Novice24_1335").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice26_1337").NPCState))
        FCharacterUniqueName(n"SC_NOV_Novice26_1337").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice29_1340").NPCState))
        FCharacterUniqueName(n"SC_NOV_Novice29_1340").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice30_1341").NPCState))
        FCharacterUniqueName(n"SC_NOV_Novice30_1341").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice33_1344").NPCState))
        FCharacterUniqueName(n"SC_NOV_Novice33_1344").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice34_1345").NPCState))
        FCharacterUniqueName(n"SC_NOV_Novice34_1345").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice35_1346").NPCState))
        FCharacterUniqueName(n"SC_NOV_Novice35_1346").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice36_1347").NPCState))
        FCharacterUniqueName(n"SC_NOV_Novice36_1347").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice37_1348").NPCState))
        FCharacterUniqueName(n"SC_NOV_Novice37_1348").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice40_1351").NPCState))
        FCharacterUniqueName(n"SC_NOV_Novice40_1351").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice43_1355").NPCState))
        FCharacterUniqueName(n"SC_NOV_Novice43_1355").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"SC_NOV_Nyras_1303").NPCState))
        FCharacterUniqueName(n"SC_NOV_Nyras_1303").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"SC_NOV_Talas_1300").NPCState))
        FCharacterUniqueName(n"SC_NOV_Talas_1300").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"SC_TPL_GorNaRan_1405").NPCState))
        FCharacterUniqueName(n"SC_TPL_GorNaRan_1405").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"SC_TPL_GorNaDun_1411").NPCState))
        FCharacterUniqueName(n"SC_TPL_GorNaDun_1411").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"SC_VLK_Melvin_582").NPCState))
        FCharacterUniqueName(n"SC_VLK_Melvin_582").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"SC_TPL_Templar24_1441").NPCState))
        FCharacterUniqueName(n"SC_TPL_Templar24_1441").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"SC_TPL_Templar25_1442").NPCState))
        FCharacterUniqueName(n"SC_TPL_Templar25_1442").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"OC_GRD_Orry_254").NPCState))
        FCharacterUniqueName(n"OC_GRD_Orry_254").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"SC_NOV_Harlok_1358").NPCState))
        FCharacterUniqueName(n"SC_NOV_Harlok_1358").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"UL_OSL_UrShak_2200").NPCState))
        FCharacterUniqueName(n"UL_OSL_UrShak_2200").NPCState.GiveImmortality();
    if(IsValid(FCharacterUniqueName(n"XT_DMB_Xardas_404").NPCState))
        FCharacterUniqueName(n"XT_DMB_Xardas_404").NPCState.GiveImmortality();  
    if(IsValid(FCharacterUniqueName(n"XT_XardasDemon").NPCState))
        FCharacterUniqueName(n"XT_XardasDemon").NPCState.GiveImmortality(); 
    if(IsValid(FCharacterUniqueName(n"NC_BAU_Rayk_941").NPCState))
        FCharacterUniqueName(n"NC_BAU_Rayk_941").NPCState.GiveImmortality(); 

    //@DE - Allow initial movement for all heroes 
    FGameplayTagContainer tagsToRemove = FGameplayTagContainer();
    tagsToRemove.AddTag(GameplayTag::Block_Action_Jump);
    tagsToRemove.AddTag(GameplayTag::State_IgnoreMovementInput);
    tagsToRemove.AddTag(GameplayTag::State_NoInput_Controller);

    TArray<FName> heroNames;
    heroNames.Add(n"Hero"); 
    heroNames.Add(n"heroTwo"); 
    heroNames.Add(n"heroThree"); 
    heroNames.Add(n"heroFour"); 
    heroNames.Add(n"heroFive");
    for(auto heroName : heroNames) 
    {
        auto character = FCharacterUniqueName(heroName).SpawnedCharacter;
        if(character != nullptr)
        {
            character.GetGothicAbilitySystemComponent().RemoveLooseTags(tagsToRemove);
        }
    }

}

UFUNCTION()
mixin void FirstXardasCrow(UGameStory Story)
{
    UPuzzlesSubsystem::CallGameplayMessage(GameplayTag::Message_FirstXardasCrow, n"FirstXardasCrow");
}


UFUNCTION()
mixin void ClearPathForConvoy(UGameStory Story)
{
    if(IsValid(FCharacterUniqueName(n"OM_VLK_Digger35_1050N").NPCState))
        FCharacterUniqueName(n"OM_VLK_Digger35_1050N").NPCState.TeleportToWaypointAndExchangeDailyRoutineToClass(UDailyRoutine_OM_VLK_Digger35_1050N_Rest, n"FP_OM_REST_03");
    if(IsValid(FCharacterUniqueName(n"OM_VLK_Digger36_1051N").NPCState))
        FCharacterUniqueName(n"OM_VLK_Digger36_1051N").NPCState.TeleportToWaypointAndExchangeDailyRoutineToClass(UDailyRoutine_OM_VLK_Digger36_1051N_Rest, n"FP_OM_REST_01");
    if(IsValid(FCharacterUniqueName(n"OM_VLK_Digger37_1052N").NPCState))
        FCharacterUniqueName(n"OM_VLK_Digger37_1052N").NPCState.TeleportToWaypointAndExchangeDailyRoutineToClass(UDailyRoutine_OM_VLK_Digger36_1051N_Rest, n"FP_OM_REST_03");
    if(IsValid(FCharacterUniqueName(n"SC_TPL_GorNaDrak_1439").NPCState))
        FCharacterUniqueName(n"SC_TPL_GorNaDrak_1439").NPCState.TeleportToWaypointAndExchangeDailyRoutineToClass(UDailyRoutine_SC_TPL_GorNaDrak_1439_Rest, n"FP_OM_SMALLTALK_02");
    if(IsValid(FCharacterUniqueName(n"SC_TPL_Templar23_1440").NPCState))
        FCharacterUniqueName(n"SC_TPL_Templar23_1440").NPCState.TeleportToWaypointAndExchangeDailyRoutineToClass(UDailyRoutine_SC_TPL_Templar23_1440_Rest, n"FP_OM_SMALLTALK_01");
}

UFUNCTION()
mixin void RemoveSilas(UGameStory Story)
{
    if(G1R::UStoryG1R::Get().SilasRemoved == 0 && G1R::UStoryG1R::Get().SilasGuilty == 1)
    {
        if(IsValid(FCharacterUniqueName(n"NC_ORG_Silas_841").NPCState))
            FCharacterUniqueName(n"NC_ORG_Silas_841").NPCState.RemoveFromWorld();
        if(IsValid(FCharacterUniqueName(n"NC_BAU_Jeremiah_912").NPCState))
            FCharacterUniqueName(n"NC_BAU_Jeremiah_912").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_NC_BAU_Jeremiah_912_AfterSilasRemoved::StaticClass());
        G1R::UStoryG1R::Get().ActivateStoryDataLayer("SilasRemoved");
        G1R::UStoryG1R::Get().DeactivateStoryDataLayer("Rayk");
        G1R::UStoryG1R::Get().SilasRemoved = 1;
    }
}

UFUNCTION()
mixin void AlmanacQuest(UGameStory Story)
{
    G1R::UStoryG1R::Get().ActivateStoryDataLayer("AlmanacStory_Logic");
}

UFUNCTION()
mixin void InExtremoBegin(UGameStory Story)
{
    if(IsValid(FCharacterUniqueName(n"OC_EBR_Gomez_100").NPCState))
        FCharacterUniqueName(n"OC_EBR_Gomez_100").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_EBR_Gomez_100_InExtremoReady::StaticClass()); 
    if(IsValid(FCharacterUniqueName(n"OC_WOC_Seraphia_110").NPCState))
        FCharacterUniqueName(n"OC_WOC_Seraphia_110").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_WOC_Seraphia_110_InExtremo::StaticClass()); 

    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger02_502").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger02_502").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger02_502_InExtremoWait::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger04_504").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger04_504").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger04_504_InExtremoWait::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger06_506").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger06_506").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger06_506_InExtremoWait::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger08_508").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger08_508").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger08_508_InExtremoWait::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger10_510").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger10_510").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger10_510_InExtremoWait::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger12_513").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger12_513").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger12_513_InExtremoWait::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger14_515").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger14_515").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger14_515_InExtremoWait::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger16_517").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger16_517").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger16_517_InExtremoWait::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger18_520").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger18_520").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger18_520_InExtremoWait::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger20_522").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger20_522").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger20_522_InExtremoWait::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger22_526").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger22_526").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger22_526_InExtremoWait::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger23_527").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger23_527").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger23_527_InExtremoWait::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger24_528").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger24_528").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger24_528_InExtremoWait::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger27_532").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger27_532").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger27_532_InExtremoWait::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger30_535").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger30_535").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger30_535_InExtremoWait::StaticClass()); 
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger32_554").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger32_554").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger32_554_InExtremoWait::StaticClass()); 
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger35_557").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger35_557").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger35_557_InExtremoWait::StaticClass()); 
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger36_560").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger36_560").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger36_560_InExtremoWait::StaticClass()); 
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger38_565").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger38_565").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger38_565_InExtremoWait::StaticClass()); 
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger40_576").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger40_576").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger40_576_InExtremoWait::StaticClass()); 
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger41_577").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger41_577").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger41_577_InExtremoWait::StaticClass()); 
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger43_579N").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger43_579N").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger43_579N_InExtremoWait::StaticClass()); 
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger42_578").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger42_578").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger42_578_InExtremoWait::StaticClass()); 
    if(IsValid(FCharacterUniqueName(n"NC_SLD_Haenno_741").NPCState))
        FCharacterUniqueName(n"NC_SLD_Haenno_741").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_NC_SLD_Haenno_741_InExtremoWait::StaticClass()); 

    if(IsValid(FCharacterUniqueName(n"OC_VLK_Graham_573").NPCState))
        FCharacterUniqueName(n"OC_VLK_Graham_573").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Graham_573_InExtremoWait::StaticClass()); 
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Grim_580").NPCState))
        FCharacterUniqueName(n"OC_VLK_Grim_580").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Grim_580_InExtremoWait::StaticClass()); 
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Huno_538").NPCState))
        FCharacterUniqueName(n"OC_VLK_Huno_538").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Huno_538_InExtremoWait::StaticClass()); 
    if(IsValid(FCharacterUniqueName(n"OC_STT_Dexter_329").NPCState))
        FCharacterUniqueName(n"OC_STT_Dexter_329").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_STT_Dexter_329_InExtremoWait::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_STT_Sly_315").NPCState))
        FCharacterUniqueName(n"OC_STT_Sly_315").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_STT_Sly_315_InExtremoWait::StaticClass()); 
    if(IsValid(FCharacterUniqueName(n"OC_GRD_Scorpio_205").NPCState))
        FCharacterUniqueName(n"OC_GRD_Scorpio_205").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_GRD_Scorpio_205_InExtremoWait::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_GRD_Guard06_221").NPCState))
        FCharacterUniqueName(n"OC_GRD_Guard06_221").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_GRD_Guard06_221_InExtremoWait::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_GRD_Guard01_204").NPCState))
        FCharacterUniqueName(n"OC_GRD_Guard01_204").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_GRD_Guard01_204_InExtremoWait::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_GRD_Guard05_220").NPCState))
        FCharacterUniqueName(n"OC_GRD_Guard05_220").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_GRD_Guard05_220_InExtremoWait::StaticClass()); 


    G1R::UStoryG1R::Get().ActivateStoryDataLayer("Story_3_InExtremoConcert_Stage_Concert");
    G1R::UStoryG1R::Get().DeactivateStoryDataLayer("Story_3_InExtremoConcert_Stage_Default");
}

UFUNCTION()
mixin void InExtremoConcertBegin(UGameStory Story)
{
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger02_502").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger02_502").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger02_502_InExtremoConcert::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger04_504").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger04_504").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger04_504_InExtremoConcert::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger06_506").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger06_506").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger06_506_InExtremoConcert::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger08_508").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger08_508").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger08_508_InExtremoConcert::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger10_510").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger10_510").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger10_510_InExtremoConcert::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger12_513").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger12_513").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger12_513_InExtremoConcert::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger14_515").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger14_515").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger14_515_InExtremoConcert::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger16_517").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger16_517").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger16_517_InExtremoConcert::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger18_520").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger18_520").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger18_520_InExtremoConcert::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger20_522").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger20_522").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger20_522_InExtremoConcert::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger22_526").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger22_526").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger22_526_InExtremoConcert::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger23_527").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger23_527").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger23_527_InExtremoConcert::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger24_528").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger24_528").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger24_528_InExtremoConcert::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger27_532").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger27_532").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger27_532_InExtremoConcert::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger30_535").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger30_535").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger30_535_InExtremoConcert::StaticClass()); 
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger32_554").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger32_554").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger32_554_InExtremoConcert::StaticClass()); 
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger35_557").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger35_557").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger35_557_InExtremoConcert::StaticClass()); 
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger36_560").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger36_560").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger36_560_InExtremoConcert::StaticClass()); 
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger38_565").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger38_565").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger38_565_InExtremoConcert::StaticClass()); 
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger40_576").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger40_576").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger40_576_InExtremoConcert::StaticClass()); 
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger41_577").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger41_577").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger41_577_InExtremoConcert::StaticClass()); 
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger42_578").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger42_578").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger42_578_InExtremoConcert::StaticClass()); 
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger43_579N").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger43_579N").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger43_579N_InExtremoConcert::StaticClass()); 
    if(IsValid(FCharacterUniqueName(n"NC_SLD_Haenno_741").NPCState))
        FCharacterUniqueName(n"NC_SLD_Haenno_741").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_NC_SLD_Haenno_741_InExtremoConcert::StaticClass()); 
    
}

UFUNCTION()
mixin void InExtremoConcertEnd(UGameStory Story)
{
    
    if(IsValid(FCharacterUniqueName(n"OC_EBR_Gomez_100").NPCState))
    FCharacterUniqueName(n"OC_EBR_Gomez_100").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_EBR_Gomez_100_Start::StaticClass()); 
    if(IsValid(FCharacterUniqueName(n"OC_WOC_Seraphia_110").NPCState))
    FCharacterUniqueName(n"OC_WOC_Seraphia_110").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_WOC_Seraphia_110_Start::StaticClass()); 
    if(IsValid(FCharacterUniqueName(n"OC_IE_DrPymonte").NPCState))
    {FCharacterUniqueName(n"OC_IE_DrPymonte").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_IE_DrPymonte_Start::StaticClass()); 
    FCharacterUniqueName(n"OC_IE_DrPymonte").NPCState.SetTrueGuild(UGE_Guild_None);
    }
    
    if(IsValid(FCharacterUniqueName(n"OC_IE_Lutter").NPCState))
    {FCharacterUniqueName(n"OC_IE_Lutter").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_IE_Lutter_Start::StaticClass()); 
    FCharacterUniqueName(n"OC_IE_Lutter").NPCState.SetTrueGuild(UGE_Guild_None);
    }
    
    if(IsValid(FCharacterUniqueName(n"OC_IE_Specki_1401").NPCState))
    {FCharacterUniqueName(n"OC_IE_Specki_1401").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_IE_Specki_1401_Start::StaticClass()); 
    FCharacterUniqueName(n"OC_IE_Specki_1401").NPCState.SetTrueGuild(UGE_Guild_None);
    }
    
    if(IsValid(FCharacterUniqueName(n"OC_IE_Unicorn").NPCState))
    {FCharacterUniqueName(n"OC_IE_Unicorn").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_IE_Unicorn_Start::StaticClass()); 
    FCharacterUniqueName(n"OC_IE_Unicorn").NPCState.SetTrueGuild(UGE_Guild_None);
    }
    
    if(IsValid(FCharacterUniqueName(n"OC_IE_VanLange_1400").NPCState))
    {FCharacterUniqueName(n"OC_IE_VanLange_1400").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_IE_VanLange_1400_Start::StaticClass()); 
    FCharacterUniqueName(n"OC_IE_VanLange_1400").NPCState.SetTrueGuild(UGE_Guild_None);
    }
    
    if(IsValid(FCharacterUniqueName(n"OC_IE_Flex").NPCState))
    {FCharacterUniqueName(n"OC_IE_Flex").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_IE_Flex_Start::StaticClass()); 
    FCharacterUniqueName(n"OC_IE_Flex").NPCState.SetTrueGuild(UGE_Guild_None);
    }

    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger02_502").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger02_502").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger02_502_Start::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger04_504").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger04_504").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger04_504_Start::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger06_506").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger06_506").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger06_506_Start::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger08_508").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger08_508").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger08_508_Start::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger10_510").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger10_510").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger10_510_Start::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger12_513").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger12_513").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger12_513_Start::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger14_515").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger14_515").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger14_515_Start::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger16_517").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger16_517").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger16_517_Start::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger18_520").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger18_520").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger18_520_Start::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger20_522").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger20_522").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger20_522_Start::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger22_526").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger22_526").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger22_526_Start::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger23_527").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger23_527").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger23_527_Start::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger24_528").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger24_528").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger24_528_Start::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger27_532").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger27_532").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger27_532_Start::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger30_535").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger30_535").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger30_535_Start::StaticClass()); 
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger32_554").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger32_554").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger32_554_Start::StaticClass()); 
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger35_557").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger35_557").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger35_557_Start::StaticClass()); 
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger36_560").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger36_560").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger36_560_Start::StaticClass()); 
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger38_565").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger38_565").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger38_565_Start::StaticClass()); 
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger40_576").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger40_576").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger40_576_Start::StaticClass()); 
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger41_577").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger41_577").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger41_577_Start::StaticClass()); 
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger43_579N").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger43_579N").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger43_579N_AfterConcert::StaticClass()); 
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger42_578").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger42_578").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger42_578_AfterConcert::StaticClass()); 

    if(IsValid(FCharacterUniqueName(n"OC_VLK_Graham_573").NPCState))
        FCharacterUniqueName(n"OC_VLK_Graham_573").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Graham_573_Start::StaticClass()); 
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Grim_580").NPCState))
        FCharacterUniqueName(n"OC_VLK_Grim_580").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Grim_580_Start::StaticClass()); 
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Huno_538").NPCState))
        FCharacterUniqueName(n"OC_VLK_Huno_538").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Huno_538_Start::StaticClass()); 
    if(IsValid(FCharacterUniqueName(n"OC_STT_Dexter_329").NPCState))
        FCharacterUniqueName(n"OC_STT_Dexter_329").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_STT_Dexter_329_Start::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_STT_Sly_315").NPCState))
        FCharacterUniqueName(n"OC_STT_Sly_315").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_STT_Sly_315_Start::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_GRD_Scorpio_205").NPCState))
        FCharacterUniqueName(n"OC_GRD_Scorpio_205").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_GRD_Scorpio_205_Start::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_GRD_Guard06_221").NPCState))
        FCharacterUniqueName(n"OC_GRD_Guard06_221").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_GRD_Guard06_221_Start::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_GRD_Guard01_204").NPCState))
        FCharacterUniqueName(n"OC_GRD_Guard01_204").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_GRD_Guard01_204_Start::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_GRD_Guard05_220").NPCState))
        FCharacterUniqueName(n"OC_GRD_Guard05_220").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_GRD_Guard05_220_Start::StaticClass()); 
    if(IsValid(FCharacterUniqueName(n"NC_SLD_Haenno_741").NPCState))
        FCharacterUniqueName(n"NC_SLD_Haenno_741").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_NC_SLD_Haenno_741_Start::StaticClass()); 
    if(IsValid(FCharacterUniqueName(n"OC_GRD_Guard19_239").NPCState))
        FCharacterUniqueName(n"OC_GRD_Guard19_239").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_GRD_Guard19_239_AfterConcert::StaticClass()); 
}

UFUNCTION()
mixin void InExtremoChapterEnd(UGameStory Story)
{
    // @DE - Used to manage the concert end if the player skips the sequence.
    TArray<AActor> OutActors;
    GetAllActorsOfClass(AStageManager::StaticClass(), OutActors);
    if(!OutActors.IsEmpty())
        Cast<AStageManager>(OutActors[0]).InExtremoEnd();
    
    if(IsValid(FCharacterUniqueName(n"OC_EBR_Gomez_100").NPCState))
    FCharacterUniqueName(n"OC_EBR_Gomez_100").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_EBR_Gomez_100_Start::StaticClass()); 
    if(IsValid(FCharacterUniqueName(n"OC_WOC_Seraphia_110").NPCState))
    FCharacterUniqueName(n"OC_WOC_Seraphia_110").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_WOC_Seraphia_110_Start::StaticClass()); 
    if(IsValid(FCharacterUniqueName(n"OC_IE_DrPymonte").NPCState))
    {FCharacterUniqueName(n"OC_IE_DrPymonte").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_IE_DrPymonte_Start::StaticClass()); 
    FCharacterUniqueName(n"OC_IE_DrPymonte").NPCState.SetTrueGuild(UGE_Guild_None);
    }
    
    if(IsValid(FCharacterUniqueName(n"OC_IE_Lutter").NPCState))
    {FCharacterUniqueName(n"OC_IE_Lutter").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_IE_Lutter_Start::StaticClass()); 
    FCharacterUniqueName(n"OC_IE_Lutter").NPCState.SetTrueGuild(UGE_Guild_None);
    }
    
    if(IsValid(FCharacterUniqueName(n"OC_IE_Specki_1401").NPCState))
    {FCharacterUniqueName(n"OC_IE_Specki_1401").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_IE_Specki_1401_Start::StaticClass()); 
    FCharacterUniqueName(n"OC_IE_Specki_1401").NPCState.SetTrueGuild(UGE_Guild_None);
    }
    
    if(IsValid(FCharacterUniqueName(n"OC_IE_Unicorn").NPCState))
    {FCharacterUniqueName(n"OC_IE_Unicorn").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_IE_Unicorn_Start::StaticClass()); 
    FCharacterUniqueName(n"OC_IE_Unicorn").NPCState.SetTrueGuild(UGE_Guild_None);
    }
    
    if(IsValid(FCharacterUniqueName(n"OC_IE_VanLange_1400").NPCState))
    {FCharacterUniqueName(n"OC_IE_VanLange_1400").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_IE_VanLange_1400_Start::StaticClass()); 
    FCharacterUniqueName(n"OC_IE_VanLange_1400").NPCState.SetTrueGuild(UGE_Guild_None);
    }
    
    if(IsValid(FCharacterUniqueName(n"OC_IE_Flex").NPCState))
    {FCharacterUniqueName(n"OC_IE_Flex").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_IE_Flex_Start::StaticClass()); 
    FCharacterUniqueName(n"OC_IE_Flex").NPCState.SetTrueGuild(UGE_Guild_None);
    }

    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger02_502").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger02_502").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger02_502_Start::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger04_504").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger04_504").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger04_504_Start::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger06_506").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger06_506").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger06_506_Start::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger08_508").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger08_508").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger08_508_Start::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger10_510").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger10_510").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger10_510_Start::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger12_513").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger12_513").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger12_513_Start::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger14_515").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger14_515").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger14_515_Start::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger16_517").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger16_517").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger16_517_Start::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger18_520").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger18_520").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger18_520_Start::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger20_522").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger20_522").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger20_522_Start::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger22_526").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger22_526").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger22_526_Start::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger23_527").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger23_527").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger23_527_Start::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger24_528").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger24_528").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger24_528_Start::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger27_532").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger27_532").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger27_532_Start::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger30_535").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger30_535").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger30_535_Start::StaticClass()); 
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger32_554").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger32_554").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger32_554_Start::StaticClass()); 
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger35_557").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger35_557").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger35_557_Start::StaticClass()); 
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger36_560").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger36_560").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger36_560_Start::StaticClass()); 
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger38_565").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger38_565").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger38_565_Start::StaticClass()); 
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger40_576").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger40_576").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger40_576_Start::StaticClass()); 
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger41_577").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger41_577").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger41_577_Start::StaticClass()); 
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger43_579N").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger43_579N").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger43_579N_Start::StaticClass()); 
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Digger42_578").NPCState))
        FCharacterUniqueName(n"OC_VLK_Digger42_578").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Digger42_578_Start::StaticClass()); 

    if(IsValid(FCharacterUniqueName(n"OC_VLK_Graham_573").NPCState))
        FCharacterUniqueName(n"OC_VLK_Graham_573").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Graham_573_Start::StaticClass()); 
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Grim_580").NPCState))
        FCharacterUniqueName(n"OC_VLK_Grim_580").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Grim_580_Start::StaticClass()); 
    if(IsValid(FCharacterUniqueName(n"OC_VLK_Huno_538").NPCState))
        FCharacterUniqueName(n"OC_VLK_Huno_538").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Huno_538_Start::StaticClass()); 
    if(IsValid(FCharacterUniqueName(n"OC_STT_Dexter_329").NPCState))
        FCharacterUniqueName(n"OC_STT_Dexter_329").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_STT_Dexter_329_Start::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_STT_Sly_315").NPCState))
        FCharacterUniqueName(n"OC_STT_Sly_315").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_STT_Sly_315_Start::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_GRD_Scorpio_205").NPCState))
        FCharacterUniqueName(n"OC_GRD_Scorpio_205").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_GRD_Scorpio_205_Start::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_GRD_Guard06_221").NPCState))
        FCharacterUniqueName(n"OC_GRD_Guard06_221").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_GRD_Guard06_221_Start::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_GRD_Guard01_204").NPCState))
        FCharacterUniqueName(n"OC_GRD_Guard01_204").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_GRD_Guard01_204_Start::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_GRD_Guard05_220").NPCState))
        FCharacterUniqueName(n"OC_GRD_Guard05_220").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_GRD_Guard05_220_Start::StaticClass()); 
    if(IsValid(FCharacterUniqueName(n"NC_SLD_Haenno_741").NPCState))
        FCharacterUniqueName(n"NC_SLD_Haenno_741").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_NC_SLD_Haenno_741_Start::StaticClass()); 

    G1R::UStoryG1R::Get().ActivateStoryDataLayer("Story_3_InExtremoConcert_Stage_Default");
    G1R::UStoryG1R::Get().DeactivateStoryDataLayer("Story_3_InExtremoConcert_Stage_Concert");
}

UFUNCTION()
mixin void BannerInExtremo(UGameStory Story)
{
    TArray<AActor> OutActors;
    GetAllActorsOfClass(AStageManager::StaticClass(), OutActors);
    if(!OutActors.IsEmpty())
        Cast<AStageManager>(OutActors[0]).UnfoldBanner();
}

UFUNCTION()
mixin void WaterfallMeeting(UGameStory Story)
{
    G1R::UStoryG1R::Get().ActivateStoryDataLayer("4FriendsMeeting_Layer");
}

UFUNCTION()
mixin void LighthouseMeeting(UGameStory Story)
{
    G1R::UStoryG1R::Get().GuardPassageWaterMagesWarning_NC = 0;
    G1R::UStoryG1R::Get().ActivateStoryDataLayer("4FriendsMeeting_Lighthouse_Layer");
}

UFUNCTION()
mixin void BeforeYberionInvocation(UGameStory Story)
{
    if(IsValid(FCharacterUniqueName(n"SC_GUR_YBerion_1200").NPCState))
        FCharacterUniqueName(n"SC_GUR_YBerion_1200").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_GUR_YBerion_1200_Callsleeper::StaticClass());
    if(IsValid(FCharacterUniqueName(n"SC_GUR_CorAngar_1202").NPCState))
        FCharacterUniqueName(n"SC_GUR_CorAngar_1202").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_GUR_CorAngar_1202_Callsleeper::StaticClass());
    if(IsValid(FCharacterUniqueName(n"SC_WSC_Chani_1205").NPCState))
        FCharacterUniqueName(n"SC_WSC_Chani_1205").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_WSC_Chani_1205_Start::StaticClass());
    if(IsValid(FCharacterUniqueName(n"SC_WSC_Natalia_1207").NPCState))
        FCharacterUniqueName(n"SC_WSC_Natalia_1207").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_WSC_Natalia_1207_Start::StaticClass());
    if(IsValid(FCharacterUniqueName(n"SC_NOV_Talas_1300").NPCState))
        FCharacterUniqueName(n"SC_NOV_Talas_1300").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Talas_1300_Backincamp::StaticClass());
    if(IsValid(FCharacterUniqueName(n"SC_NOV_Lester").NPCState))
        FCharacterUniqueName(n"SC_NOV_Lester").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Lester_Ritual::StaticClass());

    if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice12_1319").NPCState))
        FCharacterUniqueName(n"SC_NOV_Novice12_1319").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Novice12_1319_Ritual::StaticClass());
    if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice32_1343").NPCState))
        FCharacterUniqueName(n"SC_NOV_Novice32_1343").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Novice32_1343_Ritual::StaticClass());
    if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice33_1344").NPCState))
        FCharacterUniqueName(n"SC_NOV_Novice33_1344").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Novice33_1344_Ritual::StaticClass());
    if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice36_1347").NPCState))
        FCharacterUniqueName(n"SC_NOV_Novice36_1347").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Novice36_1347_Ritual::StaticClass());
    if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice38_1349").NPCState))
        FCharacterUniqueName(n"SC_NOV_Novice38_1349").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Novice38_1349_Ritual::StaticClass());
    if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice37_1348").NPCState))
        FCharacterUniqueName(n"SC_NOV_Novice37_1348").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Novice37_1348_Ritual::StaticClass());
    if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice35_1346").NPCState))
        FCharacterUniqueName(n"SC_NOV_Novice35_1346").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Novice35_1346_Ritual::StaticClass());
    if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice23_1334").NPCState))
        FCharacterUniqueName(n"SC_NOV_Novice23_1334").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Novice23_1334_Ritual::StaticClass());
    if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice26_1337").NPCState))
        FCharacterUniqueName(n"SC_NOV_Novice26_1337").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Novice26_1337_Ritual::StaticClass());
    if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice31_1342").NPCState))
        FCharacterUniqueName(n"SC_NOV_Novice31_1342").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Novice31_1342_Ritual::StaticClass());
    if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice39_1350").NPCState))
        FCharacterUniqueName(n"SC_NOV_Novice39_1350").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Novice39_1350_Ritual::StaticClass());
    if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice15_1322").NPCState))
        FCharacterUniqueName(n"SC_NOV_Novice15_1322").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Novice15_1322_Ritual::StaticClass());
    if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice16_1323").NPCState))
        FCharacterUniqueName(n"SC_NOV_Novice16_1323").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Novice16_1323_Ritual::StaticClass());
    if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice24_1335").NPCState))
        FCharacterUniqueName(n"SC_NOV_Novice24_1335").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Novice24_1335_Ritual::StaticClass());
    if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice10_1317").NPCState))
        FCharacterUniqueName(n"SC_NOV_Novice10_1317").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Novice10_1317_Ritual::StaticClass());
    if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice42_1354").NPCState))
        FCharacterUniqueName(n"SC_NOV_Novice42_1354").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Novice42_1354_Ritual::StaticClass());
    if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice25_1336").NPCState))
        FCharacterUniqueName(n"SC_NOV_Novice25_1336").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Novice25_1336_Ritual::StaticClass());
    if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice43_1355").NPCState))
        FCharacterUniqueName(n"SC_NOV_Novice43_1355").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Novice43_1355_Ritual::StaticClass());
    if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice07_1314").NPCState))
        FCharacterUniqueName(n"SC_NOV_Novice07_1314").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Novice07_1314_Ritual::StaticClass());
    if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice09_1316").NPCState))
        FCharacterUniqueName(n"SC_NOV_Novice09_1316").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Novice09_1316_Ritual::StaticClass());
    if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice30_1341").NPCState))
        FCharacterUniqueName(n"SC_NOV_Novice30_1341").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Novice30_1341_Ritual::StaticClass());
    if(IsValid(FCharacterUniqueName(n"SC_GUR_BaalTyon_1210").NPCState))
        FCharacterUniqueName(n"SC_GUR_BaalTyon_1210").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_GUR_BaalTyon_1210_Ritual::StaticClass());
    if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice20_1327").NPCState))
        FCharacterUniqueName(n"SC_NOV_Novice20_1327").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Novice20_1327_Ritual::StaticClass());
    if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice28_1339").NPCState))
        FCharacterUniqueName(n"SC_NOV_Novice28_1339").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Novice28_1339_Ritual::StaticClass());
    if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice04_1309").NPCState))
        FCharacterUniqueName(n"SC_NOV_Novice04_1309").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Novice04_1309_Ritual::StaticClass());
}

UFUNCTION()
mixin void YberionInvocation(UGameStory Story)
{
    if(IsValid(FCharacterUniqueName(n"SC_GUR_YBerion_1200").NPCState))
    {
        FCharacterUniqueName(n"SC_GUR_YBerion_1200").NPCState.Inventory.RemoveItemOfClass(UItMs_Focus_01,1);
        FCharacterUniqueName(n"SC_GUR_YBerion_1200").NPCState.RemoveFromWorld();
    }
    
    if(IsValid(FCharacterUniqueName(n"SC_GUR_CorAngar_1202").NPCState))
        FCharacterUniqueName(n"SC_GUR_CorAngar_1202").NPCState.TeleportToWaypointAndExchangeDailyRoutineToClass(UDailyRoutine_SC_GUR_CorAngar_1202_AfterInvocation::StaticClass(),n"FP_SC_YEBERION_CHAMBER4");
    if(IsValid(FCharacterUniqueName(n"SC_GUR_CorKalom_1201").NPCState))
        FCharacterUniqueName(n"SC_GUR_CorKalom_1201").NPCState.TeleportToWaypointAndExchangeDailyRoutineToClass(UDailyRoutine_SC_GUR_CorKalom_1201_AfterInvocation::StaticClass(),n"FP_SC_YEBERION_CHAMBER3");

    if(IsValid(FCharacterUniqueName(n"OG_GUR_BaalLukor_1211").NPCState))
    {
        FCharacterUniqueName(n"OG_GUR_BaalLukor_1211").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OG_GUR_BaalLukor_1211_Wait::StaticClass());
        FCharacterUniqueName(n"OG_GUR_BaalLukor_1211").NPCState.Inventory.AddItemOfClass(UItMs_Focus_01,1);
    }
    if(IsValid(FCharacterUniqueName(n"OM_STT_Santino_335").NPCState))
        FCharacterUniqueName(n"OM_STT_Santino_335").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OM_STT_Santino_335_Chapter3::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_EBR_Bartholo_106").NPCState))
        FCharacterUniqueName(n"OC_EBR_Bartholo_106").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_EBR_Bartholo_106_OMFlood::StaticClass());
    if(IsValid(FCharacterUniqueName(n"SC_TPL_Templar09_1413").NPCState))
        FCharacterUniqueName(n"SC_TPL_Templar09_1413").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_TPL_Templar09_1413_AfterRitual::StaticClass());
    if(IsValid(FCharacterUniqueName(n"SC_TPL_Templar21_1431").NPCState))
        FCharacterUniqueName(n"SC_TPL_Templar21_1431").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_TPL_Templar21_1431_AfterRitual::StaticClass());
    if(IsValid(FCharacterUniqueName(n"SC_TPL_Templar22_1432").NPCState))
        FCharacterUniqueName(n"SC_TPL_Templar22_1432").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_TPL_Templar22_1432_AfterRitual::StaticClass());

    G1R::UStoryG1R::Get().ActivateStoryDataLayer("Old_Mine_Flooded");
    G1R::UStoryG1R::Get().DeactivateStoryDataLayer("YberionCorpse_Cushion");
    G1R::UStoryG1R::Get().ActivateStoryDataLayer("YberionCorpse");
    G1R::UStoryG1R::Get().DeactivateStoryDataLayer("Storytelling_Womans_Revenge_01");
    G1R::UStoryG1R::Get().ActivateStoryDataLayer("Storytelling_Womans_Revenge_03");
    if(IsValid(FCharacterUniqueName(n"OC_GRD_Guard40_292N").NPCState))
        FCharacterUniqueName(n"OC_GRD_Guard40_292N").NPCState.RemoveFromWorld();
    
    UWorldPointManager::Get().CallGlobalEvent(n"OnOldMineFlooded");

    if(IsValid(FCharacterUniqueName(n"OM_STT_Alberto_300").NPCState))
        FCharacterUniqueName(n"OM_STT_Alberto_300").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OM_STT_Alberto_300_Collapsed::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OM_STT_Ian_301").NPCState))
        FCharacterUniqueName(n"OM_STT_Ian_301").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OM_STT_Ian_301_Collapsed::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OM_SC_TPL_Templar05_1438").NPCState))
        FCharacterUniqueName(n"OM_SC_TPL_Templar05_1438").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OM_SC_TPL_Templar05_1438_AfterCollapsed::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OM_GRD_Aaron_262").NPCState))
        FCharacterUniqueName(n"OM_GRD_Aaron_262").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OM_GRD_Aaron_262_AfterCollapsed::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OM_GRD_Drake_260").NPCState))
        FCharacterUniqueName(n"OM_GRD_Drake_260").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OM_GRD_Drake_260_AfterCollapsed::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OM_GRD_Guard05_264").NPCState))
        FCharacterUniqueName(n"OM_GRD_Guard05_264").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OM_GRD_Guard05_264_Collapsed::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OM_GRD_Guard09_269").NPCState))
        FCharacterUniqueName(n"OM_GRD_Guard09_269").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OM_GRD_Guard09_269_Collapsed::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OM_GRD_Guard14_281N").NPCState))
        FCharacterUniqueName(n"OM_GRD_Guard14_281N").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OM_GRD_Guard14_281N_Collapsed::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OM_STT_Viper_302").NPCState))
        FCharacterUniqueName(n"OM_STT_Viper_302").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OM_STT_Viper_302_AfterCollapsed::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OM_TPL_GorNaKosh_1401").NPCState))
        FCharacterUniqueName(n"OM_TPL_GorNaKosh_1401").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OM_TPL_GorNaKosh_1401_Collapsed::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OM_VLK_Digger10_546").NPCState))
        FCharacterUniqueName(n"OM_VLK_Digger10_546").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OM_VLK_Digger10_546_Collapsed::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OM_VLK_Digger11_547").NPCState))
        FCharacterUniqueName(n"OM_VLK_Digger11_547").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OM_VLK_Digger11_547_Collapsed::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OM_VLK_Digger12_548").NPCState))
        FCharacterUniqueName(n"OM_VLK_Digger12_548").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OM_VLK_Digger12_548_Collapsed::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OM_VLK_Digger13_549").NPCState))
        FCharacterUniqueName(n"OM_VLK_Digger13_549").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OM_VLK_Digger13_549_Collapsed::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OM_VLK_Digger14_550").NPCState))
        FCharacterUniqueName(n"OM_VLK_Digger14_550").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OM_VLK_Digger14_550_Collapsed::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OM_VLK_Digger16_558").NPCState))
        FCharacterUniqueName(n"OM_VLK_Digger16_558").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OM_VLK_Digger16_558_Collapsed::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OM_VLK_Digger23_579").NPCState))
        FCharacterUniqueName(n"OM_VLK_Digger23_579").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OM_VLK_Digger23_579_Collapsed::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OM_VLK_Digger32_1047N").NPCState))
        FCharacterUniqueName(n"OM_VLK_Digger32_1047N").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OM_VLK_Digger32_1047N_Collapsed::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OM_VLK_Digger33_1048N").NPCState))
        FCharacterUniqueName(n"OM_VLK_Digger33_1048N").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OM_VLK_Digger33_1048N_Collapsed::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OM_VLK_Digger35_1050N").NPCState))
        FCharacterUniqueName(n"OM_VLK_Digger35_1050N").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OM_VLK_Digger35_1050N_Collapsed::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OM_VLK_Digger36_1051N").NPCState))
        FCharacterUniqueName(n"OM_VLK_Digger36_1051N").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OM_VLK_Digger36_1051N_Collapsed::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OM_VLK_Digger37_1052N").NPCState))
        FCharacterUniqueName(n"OM_VLK_Digger37_1052N").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OM_VLK_Digger37_1052N_Collapsed::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OM_VLK_Digger38_1053N").NPCState))
        FCharacterUniqueName(n"OM_VLK_Digger38_1053N").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OM_VLK_Digger38_1053N_Collapsed::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OM_VLK_Digger39_1054N").NPCState))
        FCharacterUniqueName(n"OM_VLK_Digger39_1054N").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OM_VLK_Digger39_1054N_Collapsed::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OM_VLK_Grimes_586").NPCState))
        FCharacterUniqueName(n"OM_VLK_Grimes_586").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OM_VLK_Grimes_586_Collapsed::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OM_VLK_Glen_583").NPCState))
        FCharacterUniqueName(n"OM_VLK_Glen_583").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OM_VLK_Glen_583_Collapsed::StaticClass());
    if(IsValid(FCharacterUniqueName(n"SC_TPL_GorNaDrak_1439").NPCState))
        FCharacterUniqueName(n"SC_TPL_GorNaDrak_1439").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_TPL_GorNaDrak_1439_Collapsed::StaticClass());
    if(IsValid(FCharacterUniqueName(n"SC_TPL_Templar23_1440").NPCState))
        FCharacterUniqueName(n"SC_TPL_Templar23_1440").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_TPL_Templar23_1440_Collapsed::StaticClass());

    if(IsValid(FCharacterUniqueName(n"OM_GRD_Asghan_263").NPCState))
        FCharacterUniqueName(n"OM_GRD_Asghan_263").NPCState.RemoveFromWorld();
    if(IsValid(FCharacterUniqueName(n"OM_GRD_Brandick_261").NPCState))
        FCharacterUniqueName(n"OM_GRD_Brandick_261").NPCState.RemoveFromWorld();
    if(IsValid(FCharacterUniqueName(n"OM_GRD_Guard01_234").NPCState))
        FCharacterUniqueName(n"OM_GRD_Guard01_234").NPCState.RemoveFromWorld();
    if(IsValid(FCharacterUniqueName(n"OM_GRD_Guard02_235").NPCState))
        FCharacterUniqueName(n"OM_GRD_Guard02_235").NPCState.RemoveFromWorld();
    if(IsValid(FCharacterUniqueName(n"OM_GRD_Guard03_236").NPCState))
        FCharacterUniqueName(n"OM_GRD_Guard03_236").NPCState.RemoveFromWorld();
    if(IsValid(FCharacterUniqueName(n"OM_GRD_Guard06_266").NPCState))
        FCharacterUniqueName(n"OM_GRD_Guard06_266").NPCState.RemoveFromWorld();
    if(IsValid(FCharacterUniqueName(n"OM_GRD_Guard07_267").NPCState))
        FCharacterUniqueName(n"OM_GRD_Guard07_267").NPCState.RemoveFromWorld();
    if(IsValid(FCharacterUniqueName(n"OM_GRD_Guard08_268").NPCState))
        FCharacterUniqueName(n"OM_GRD_Guard08_268").NPCState.RemoveFromWorld();
    if(IsValid(FCharacterUniqueName(n"OM_GRD_Guard10_272").NPCState))
        FCharacterUniqueName(n"OM_GRD_Guard10_272").NPCState.RemoveFromWorld();
    if(IsValid(FCharacterUniqueName(n"OM_GRD_Guard11_273").NPCState))
        FCharacterUniqueName(n"OM_GRD_Guard11_273").NPCState.RemoveFromWorld();
    if(IsValid(FCharacterUniqueName(n"OM_GRD_Guard12_277").NPCState))
        FCharacterUniqueName(n"OM_GRD_Guard12_277").NPCState.RemoveFromWorld();
    if(IsValid(FCharacterUniqueName(n"OM_GRD_Ulbert_271").NPCState))
        FCharacterUniqueName(n"OM_GRD_Ulbert_271").NPCState.RemoveFromWorld();
    if(IsValid(FCharacterUniqueName(n"OM_SC_TPL_Templar03_1436").NPCState))
        FCharacterUniqueName(n"OM_SC_TPL_Templar03_1436").NPCState.RemoveFromWorld();
    if(IsValid(FCharacterUniqueName(n"OM_SC_TPL_Templar04_1437").NPCState))
        FCharacterUniqueName(n"OM_SC_TPL_Templar04_1437").NPCState.RemoveFromWorld();
    if(IsValid(FCharacterUniqueName(n"OM_TPL_GorNaBar_1400").NPCState))
        FCharacterUniqueName(n"OM_TPL_GorNaBar_1400").NPCState.RemoveFromWorld();
    if(IsValid(FCharacterUniqueName(n"OM_TPL_GorNaVid_1433").NPCState))
        FCharacterUniqueName(n"OM_TPL_GorNaVid_1433").NPCState.RemoveFromWorld();
    if(IsValid(FCharacterUniqueName(n"OM_VLK_Aleph_585").NPCState))
        FCharacterUniqueName(n"OM_VLK_Aleph_585").NPCState.RemoveFromWorld();
    if(IsValid(FCharacterUniqueName(n"OM_VLK_Digger01_518").NPCState))
        FCharacterUniqueName(n"OM_VLK_Digger01_518").NPCState.RemoveFromWorld();
    if(IsValid(FCharacterUniqueName(n"OM_VLK_Digger02_525").NPCState))
        FCharacterUniqueName(n"OM_VLK_Digger02_525").NPCState.RemoveFromWorld();
    if(IsValid(FCharacterUniqueName(n"OM_VLK_Digger03_539").NPCState))
        FCharacterUniqueName(n"OM_VLK_Digger03_539").NPCState.RemoveFromWorld();
    if(IsValid(FCharacterUniqueName(n"OM_VLK_Digger04_540").NPCState))
        FCharacterUniqueName(n"OM_VLK_Digger04_540").NPCState.RemoveFromWorld();
    if(IsValid(FCharacterUniqueName(n"OM_VLK_Digger05_541").NPCState))
        FCharacterUniqueName(n"OM_VLK_Digger05_541").NPCState.RemoveFromWorld();
    if(IsValid(FCharacterUniqueName(n"OM_VLK_Digger06_542").NPCState))
        FCharacterUniqueName(n"OM_VLK_Digger06_542").NPCState.RemoveFromWorld();
    if(IsValid(FCharacterUniqueName(n"OM_VLK_Digger07_543").NPCState))
        FCharacterUniqueName(n"OM_VLK_Digger07_543").NPCState.RemoveFromWorld();
    if(IsValid(FCharacterUniqueName(n"OM_VLK_Digger08_544").NPCState))
        FCharacterUniqueName(n"OM_VLK_Digger08_544").NPCState.RemoveFromWorld();
    if(IsValid(FCharacterUniqueName(n"OM_VLK_Digger09_545").NPCState))
        FCharacterUniqueName(n"OM_VLK_Digger09_545").NPCState.RemoveFromWorld();
    if(IsValid(FCharacterUniqueName(n"OM_VLK_Digger15_551").NPCState))
        FCharacterUniqueName(n"OM_VLK_Digger15_551").NPCState.RemoveFromWorld();
    if(IsValid(FCharacterUniqueName(n"OM_VLK_Digger18_562").NPCState))
        FCharacterUniqueName(n"OM_VLK_Digger18_562").NPCState.RemoveFromWorld();
    if(IsValid(FCharacterUniqueName(n"OM_VLK_Digger19_563").NPCState))
        FCharacterUniqueName(n"OM_VLK_Digger19_563").NPCState.RemoveFromWorld();
    if(IsValid(FCharacterUniqueName(n"OM_VLK_Digger20_566").NPCState))
        FCharacterUniqueName(n"OM_VLK_Digger20_566").NPCState.RemoveFromWorld();
    if(IsValid(FCharacterUniqueName(n"OM_VLK_Digger21_567").NPCState))
        FCharacterUniqueName(n"OM_VLK_Digger21_567").NPCState.RemoveFromWorld();
    if(IsValid(FCharacterUniqueName(n"OM_VLK_Digger22_571").NPCState))
        FCharacterUniqueName(n"OM_VLK_Digger22_571").NPCState.RemoveFromWorld();
    if(IsValid(FCharacterUniqueName(n"OM_VLK_Digger24_588").NPCState))
        FCharacterUniqueName(n"OM_VLK_Digger24_588").NPCState.RemoveFromWorld();
    if(IsValid(FCharacterUniqueName(n"OM_VLK_Digger25_589").NPCState))
        FCharacterUniqueName(n"OM_VLK_Digger25_589").NPCState.RemoveFromWorld();
    if(IsValid(FCharacterUniqueName(n"OM_VLK_Digger26_590").NPCState))
        FCharacterUniqueName(n"OM_VLK_Digger26_590").NPCState.RemoveFromWorld();
    if(IsValid(FCharacterUniqueName(n"OM_VLK_Digger27_591").NPCState))
        FCharacterUniqueName(n"OM_VLK_Digger27_591").NPCState.RemoveFromWorld();
    if(IsValid(FCharacterUniqueName(n"OM_VLK_Digger28_592").NPCState))
        FCharacterUniqueName(n"OM_VLK_Digger28_592").NPCState.RemoveFromWorld();
    if(IsValid(FCharacterUniqueName(n"OM_VLK_Digger29_593").NPCState))
        FCharacterUniqueName(n"OM_VLK_Digger29_593").NPCState.RemoveFromWorld();
    if(IsValid(FCharacterUniqueName(n"OM_VLK_Digger30_1045N").NPCState))
        FCharacterUniqueName(n"OM_VLK_Digger30_1045N").NPCState.RemoveFromWorld();
    if(IsValid(FCharacterUniqueName(n"OM_VLK_Digger31_1046N").NPCState))
        FCharacterUniqueName(n"OM_VLK_Digger31_1046N").NPCState.RemoveFromWorld();
    if(IsValid(FCharacterUniqueName(n"OM_VLK_Digger34_1049N").NPCState))
        FCharacterUniqueName(n"OM_VLK_Digger34_1049N").NPCState.RemoveFromWorld();
    if(IsValid(FCharacterUniqueName(n"OM_VLK_Garp_587").NPCState))
        FCharacterUniqueName(n"OM_VLK_Garp_587").NPCState.RemoveFromWorld();
    if(IsValid(FCharacterUniqueName(n"OM_VLK_Snipes_584").NPCState))
        FCharacterUniqueName(n"OM_VLK_Snipes_584").NPCState.RemoveFromWorld();

    G1R::Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE.SucceedQuest();
    G1R::Quest::SwampCamp_SCCHAPTER1_DRUGMONOPOL.FailQuest();
    G1R::Quest::SwampCamp_SCCHAPTER2_KRAUTBOTE.FailQuest();

}

UFUNCTION()
mixin void AfterTalkingWithCorAngar(UGameStory Story)
{
    if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice12_1319").NPCState))
        FCharacterUniqueName(n"SC_NOV_Novice12_1319").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Novice12_1319_Start::StaticClass());
    if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice13_1320").NPCState))
        FCharacterUniqueName(n"SC_NOV_Novice13_1320").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Novice13_1320_Start::StaticClass());
    if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice26_1337").NPCState))
        FCharacterUniqueName(n"SC_NOV_Novice26_1337").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Novice26_1337_Start::StaticClass());
    if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice27_1338").NPCState))
        FCharacterUniqueName(n"SC_NOV_Novice27_1338").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Novice27_1338_Start::StaticClass());
    if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice28_1339").NPCState))
        FCharacterUniqueName(n"SC_NOV_Novice28_1339").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Novice28_1339_Start::StaticClass());
    if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice30_1341").NPCState))
        FCharacterUniqueName(n"SC_NOV_Novice30_1341").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Novice30_1341_Start::StaticClass());
    if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice32_1343").NPCState))
        FCharacterUniqueName(n"SC_NOV_Novice32_1343").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Novice32_1343_Start::StaticClass());
    if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice33_1344").NPCState))
        FCharacterUniqueName(n"SC_NOV_Novice33_1344").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Novice33_1344_Start::StaticClass());
    if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice35_1346").NPCState))
        FCharacterUniqueName(n"SC_NOV_Novice35_1346").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Novice35_1346_Start::StaticClass());
    if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice36_1347").NPCState))
        FCharacterUniqueName(n"SC_NOV_Novice36_1347").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Novice36_1347_Start::StaticClass());
    if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice37_1348").NPCState))
        FCharacterUniqueName(n"SC_NOV_Novice37_1348").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Novice37_1348_Start::StaticClass());
    if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice38_1349").NPCState))
        FCharacterUniqueName(n"SC_NOV_Novice38_1349").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Novice38_1349_Start::StaticClass());
    if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice24_1335").NPCState))
        FCharacterUniqueName(n"SC_NOV_Novice24_1335").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Novice24_1335_AfterTalkingToAngar::StaticClass());
    if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice16_1323").NPCState))
        FCharacterUniqueName(n"SC_NOV_Novice16_1323").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Novice16_1323_AfterTalkingToAngar::StaticClass());
    if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice43_1355").NPCState))
        FCharacterUniqueName(n"SC_NOV_Novice43_1355").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Novice43_1355_AfterTalkingToAngar::StaticClass());
    if(IsValid(FCharacterUniqueName(n"SC_GUR_BaalTyon_1210").NPCState))
        FCharacterUniqueName(n"SC_GUR_BaalTyon_1210").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_GUR_BaalTyon_1210_AfterTalkingToAngar::StaticClass());
    if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice04_1309").NPCState))
        FCharacterUniqueName(n"SC_NOV_Novice04_1309").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Novice04_1309_Start::StaticClass());
    if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice23_1334").NPCState))
        FCharacterUniqueName(n"SC_NOV_Novice23_1334").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Novice23_1334_Start::StaticClass());
    if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice10_1317").NPCState))
        FCharacterUniqueName(n"SC_NOV_Novice10_1317").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Novice10_1317_Start::StaticClass());
    if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice15_1322").NPCState))
        FCharacterUniqueName(n"SC_NOV_Novice15_1322").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Novice15_1322_Start::StaticClass());
    if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice25_1336").NPCState))
        FCharacterUniqueName(n"SC_NOV_Novice25_1336").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Novice25_1336_Start::StaticClass());
    if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice31_1342").NPCState))
        FCharacterUniqueName(n"SC_NOV_Novice31_1342").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Novice31_1342_Start::StaticClass());
    if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice20_1327").NPCState))
        FCharacterUniqueName(n"SC_NOV_Novice20_1327").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Novice20_1327_Start::StaticClass());
    if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice42_1354").NPCState))
        FCharacterUniqueName(n"SC_NOV_Novice42_1354").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Novice42_1354_Start::StaticClass());
    if(IsValid(FCharacterUniqueName(n"SC_TPL_Templar22_1432").NPCState))
        FCharacterUniqueName(n"SC_TPL_Templar22_1432").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_TPL_Templar22_1432_Start::StaticClass());
    if(IsValid(FCharacterUniqueName(n"SC_TPL_Templar21_1431").NPCState))
        FCharacterUniqueName(n"SC_TPL_Templar21_1431").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_TPL_Templar21_1431_Start::StaticClass());
    if(IsValid(FCharacterUniqueName(n"SC_TPL_Templar09_1413").NPCState))
        FCharacterUniqueName(n"SC_TPL_Templar09_1413").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_TPL_Templar09_1413_Start::StaticClass());
}

UFUNCTION()
mixin void TalasComeBack(UGameStory Story)
{
    if(IsValid(FCharacterUniqueName(n"SC_NOV_Talas_1300").NPCState))
    {
        FCharacterUniqueName(n"SC_NOV_Talas_1300").NPCState.LeavePartyOf(FCharacterUniqueName(n"Hero").GetNPCState());
        FCharacterUniqueName(n"SC_NOV_Talas_1300").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Talas_1300_Backincamp::StaticClass());
    }
}

UFUNCTION()
mixin void CampDivided(UGameStory Story)
{
    G1R::UStoryG1R::Get().ActivateStoryDataLayer("Cor_Kalom_Camp");

    UWorldPointManager::Get().CallGlobalEvent(n"OncampDivided");

    if(IsValid(FCharacterUniqueName(n"SC_GUR_CorKalom_1201").NPCState))
    {
        FCharacterUniqueName(n"SC_GUR_CorKalom_1201").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_GUR_CorKalom_1201_CampDivided::StaticClass());
        FCharacterUniqueName(n"SC_GUR_CorKalom_1201").NPCState.SetTrueGuild(UGE_Guild_Human_SwampCamp_Kalomnist_GuruLeader);
    }
    if(IsValid(FCharacterUniqueName(n"SC_GUR_BaalNamib_1204").NPCState))
    {
        FCharacterUniqueName(n"SC_GUR_BaalNamib_1204").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_GUR_BaalNamib_1204_CampDivided::StaticClass());
        FCharacterUniqueName(n"SC_GUR_BaalNamib_1204").NPCState.SetTrueGuild(UGE_Guild_Human_SwampCamp_Kalomnist_Guru);
    }
    if(IsValid(FCharacterUniqueName(n"SC_GUR_BaalTondral_1203").NPCState))
    {
        FCharacterUniqueName(n"SC_GUR_BaalTondral_1203").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_GUR_BaalTondral_1203_CampDivided::StaticClass());
        FCharacterUniqueName(n"SC_GUR_BaalTondral_1203").NPCState.SetTrueGuild(UGE_Guild_Human_SwampCamp_Kalomnist_Guru);
    }
    if(IsValid(FCharacterUniqueName(n"SC_NOV_Joru_1305").NPCState))
    {
        FCharacterUniqueName(n"SC_NOV_Joru_1305").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Joru_1305_CampDivided::StaticClass());
        FCharacterUniqueName(n"SC_NOV_Joru_1305").NPCState.SetTrueGuild(UGE_Guild_Human_SwampCamp_Kalomnist_Novice);
    }
    if(IsValid(FCharacterUniqueName(n"SC_NOV_Nyras_1303").NPCState))
    {
        FCharacterUniqueName(n"SC_NOV_Nyras_1303").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Nyras_1303_CampDivided_Ambient::StaticClass());
        FCharacterUniqueName(n"SC_NOV_Nyras_1303").NPCState.SetTrueGuild(UGE_Guild_Human_SwampCamp_Kalomnist_Novice);
    }
    if(IsValid(FCharacterUniqueName(n"SC_NOV_Viran_1302").NPCState))
    {
        FCharacterUniqueName(n"SC_NOV_Viran_1302").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Viran_1302_CampDivided::StaticClass());
        FCharacterUniqueName(n"SC_NOV_Viran_1302").NPCState.SetTrueGuild(UGE_Guild_Human_SwampCamp_Kalomnist_Novice);
    }
    if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice13_1320").NPCState))
    {
        FCharacterUniqueName(n"SC_NOV_Novice13_1320").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Novice13_1320_CampDivided::StaticClass());
        FCharacterUniqueName(n"SC_NOV_Novice13_1320").NPCState.SetTrueGuild(UGE_Guild_Human_SwampCamp_Kalomnist_Novice);
    }
    if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice27_1338").NPCState))
    {
        FCharacterUniqueName(n"SC_NOV_Novice27_1338").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Novice27_1338_CampDivided::StaticClass());
        FCharacterUniqueName(n"SC_NOV_Novice27_1338").NPCState.SetTrueGuild(UGE_Guild_Human_SwampCamp_Kalomnist_Novice);
    }
    if(IsValid(FCharacterUniqueName(n"SC_VLK_Melvin_582").NPCState))
    {
        FCharacterUniqueName(n"SC_VLK_Melvin_582").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_VLK_Melvin_582_CampDivided::StaticClass());
        FCharacterUniqueName(n"SC_VLK_Melvin_582").NPCState.SetTrueGuild(UGE_Guild_Human_SwampCamp_Kalomnist_Novice);
    }
    if(IsValid(FCharacterUniqueName(n"SC_GUR_BaalTyon_1210").NPCState))
    {
        FCharacterUniqueName(n"SC_GUR_BaalTyon_1210").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_GUR_BaalTyon_1210_CampDivided::StaticClass());
        FCharacterUniqueName(n"SC_GUR_BaalTyon_1210").NPCState.SetTrueGuild(UGE_Guild_Human_SwampCamp_Kalomnist_Guru);
    }
    if(IsValid(FCharacterUniqueName(n"SC_GUR_BaalOrun_1209").NPCState))
    {
        FCharacterUniqueName(n"SC_GUR_BaalOrun_1209").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_GUR_BaalOrun_1209_CampDivided::StaticClass());
        FCharacterUniqueName(n"SC_GUR_BaalOrun_1209").NPCState.SetTrueGuild(UGE_Guild_Human_SwampCamp_Kalomnist_Guru);
    }
    if(IsValid(FCharacterUniqueName(n"SC_TPL_GorNaDrak_1439").NPCState))
    {
        FCharacterUniqueName(n"SC_TPL_GorNaDrak_1439").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_TPL_GorNaDrak_1439_CampDivided::StaticClass());
        FCharacterUniqueName(n"SC_TPL_GorNaDrak_1439").NPCState.SetTrueGuild(UGE_Guild_Human_SwampCamp_Kalomnist_Templar);
    }
    if(IsValid(FCharacterUniqueName(n"SC_TPL_GorNaRan_1405").NPCState))
    {
        FCharacterUniqueName(n"SC_TPL_GorNaRan_1405").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_TPL_GorNaRan_1405_CampDivided::StaticClass());
        FCharacterUniqueName(n"SC_TPL_GorNaRan_1405").NPCState.SetTrueGuild(UGE_Guild_Human_SwampCamp_Kalomnist_Templar);
    }
    if(IsValid(FCharacterUniqueName(n"SC_TPL_Templar03_1406").NPCState))
    {
        FCharacterUniqueName(n"SC_TPL_Templar03_1406").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_TPL_Templar03_1406_CampDivided_Ambient::StaticClass());
        FCharacterUniqueName(n"SC_TPL_Templar03_1406").NPCState.SetTrueGuild(UGE_Guild_Human_SwampCamp_Kalomnist_Templar);
    }
    if(IsValid(FCharacterUniqueName(n"SC_TPL_Templar19_1425").NPCState))
    {
        FCharacterUniqueName(n"SC_TPL_Templar19_1425").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_TPL_Templar19_1425_CampDivided::StaticClass());
        FCharacterUniqueName(n"SC_TPL_Templar19_1425").NPCState.SetTrueGuild(UGE_Guild_Human_SwampCamp_Kalomnist_Templar);
    }
    if(IsValid(FCharacterUniqueName(n"SC_NOV_Balor_1304").NPCState))
    {
        FCharacterUniqueName(n"SC_NOV_Balor_1304").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Balor_1304_CampDivided::StaticClass());
        FCharacterUniqueName(n"SC_NOV_Balor_1304").NPCState.SetTrueGuild(UGE_Guild_Human_SwampCamp_Kalomnist_Novice);
    }
    if(IsValid(FCharacterUniqueName(n"OC_NOV_BaalParvez_1330").NPCState))
    {
        FCharacterUniqueName(n"OC_NOV_BaalParvez_1330").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_NOV_BaalParvez_1330_AfterCollapse::StaticClass());
    }
    if(IsValid(FCharacterUniqueName(n"OC_NOV_BaalTaran_1331").NPCState))
    {
        FCharacterUniqueName(n"OC_NOV_BaalTaran_1331").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_NOV_BaalTaran_1331_AfterCollapse::StaticClass());
    }
}

UFUNCTION()
mixin void AfterSaturasFocusCompleted(UGameStory Story)
{
    if(IsValid(FCharacterUniqueName(n"OC_STT_Diego").NPCState))
        FCharacterUniqueName(n"OC_STT_Diego").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_STT_Diego_LightHouse::StaticClass());
    if(IsValid(FCharacterUniqueName(n"NC_SLD_Gorn_699").NPCState))
        FCharacterUniqueName(n"NC_SLD_Gorn_699").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_NC_SLD_Gorn_699_LightHouse::StaticClass());
    if(IsValid(FCharacterUniqueName(n"SC_NOV_Lester").NPCState))
        FCharacterUniqueName(n"SC_NOV_Lester").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Lester_LightHouse::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_EBR_Gomez_100").NPCState))
    {
        FCharacterUniqueName(n"OC_EBR_Gomez_100").NPCState.AddItemToInventory(UArmor_OC_EBR_Gomez_100,1);
        FCharacterUniqueName(n"OC_EBR_Gomez_100").NPCState.Inventory.EquipArmorOfClass(UArmor_OC_EBR_Gomez_100);
    }
    
    if(IsValid(FCharacterUniqueName(n"OC_KDF_Milten").NPCState))
        FCharacterUniqueName(n"OC_KDF_Milten").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_KDF_Milten_WaitYard::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_KDF_Corristo_402").NPCState))
        FCharacterUniqueName(n"OC_KDF_Corristo_402").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_KDF_Corristo_402_WaitYard::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_KDF_Torrez_405").NPCState))
        FCharacterUniqueName(n"OC_KDF_Torrez_405").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_KDF_Torrez_405_WaitYard::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_KDF_Rodriguez_400").NPCState))
        FCharacterUniqueName(n"OC_KDF_Rodriguez_400").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_KDF_Rodriguez_400_WaitYard::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_KDF_Damarok_401").NPCState))
        FCharacterUniqueName(n"OC_KDF_Damarok_401").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_KDF_Damarok_401_WaitYard::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_KDF_Drago_403").NPCState))
        FCharacterUniqueName(n"OC_KDF_Drago_403").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_KDF_Drago_403_WaitYard::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OCR_GRD_Skip_211").NPCState))
        FCharacterUniqueName(n"OCR_GRD_Skip_211").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OCR_GRD_Skip_211_WaitYard::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_GRD_Guard15_231").NPCState))
        FCharacterUniqueName(n"OC_GRD_Guard15_231").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_GRD_Guard15_231_WaitYard::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_GRD_Guard26_252").NPCState))
        FCharacterUniqueName(n"OC_GRD_Guard26_252").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_GRD_Guard26_252_WaitYard::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_GRD_Guard16_232").NPCState))
        FCharacterUniqueName(n"OC_GRD_Guard16_232").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_GRD_Guard16_232_WaitYard::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_GRD_Guard09_225").NPCState))
        FCharacterUniqueName(n"OC_GRD_Guard09_225").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_GRD_Guard09_225_WaitYard::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_GRD_Guard11_227").NPCState))
        FCharacterUniqueName(n"OC_GRD_Guard11_227").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_GRD_Guard11_227_WaitYard::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_EBR_Bartholo_106").NPCState))
        FCharacterUniqueName(n"OC_EBR_Bartholo_106").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_EBR_Bartholo_106_WaitYard::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_GRD_Scorpio_205").NPCState))
    {
        FCharacterUniqueName(n"OC_GRD_Scorpio_205").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_GRD_Scorpio_205_Bannished::StaticClass());
        FCharacterUniqueName(n"OC_GRD_Scorpio_205").NPCState.SetTrueGuild(UGE_Guild_None);
    }
    if(IsValid(FCharacterUniqueName(n"UL_STT_Cavalorn_336").NPCState))
        FCharacterUniqueName(n"UL_STT_Cavalorn_336").NPCState.SetTrueGuild(UGE_Guild_None);


    UWorldPointManager::Get().CallGlobalEvent(n"OnRetrieveFocus");

}

UFUNCTION()
mixin void TriggerShavingCinematic(UGameStory Story)
{
    if(IsValid(FCharacterUniqueName(n"Hero").CharacterState))
    {
        if (FCharacterUniqueName(n"Hero").CharacterState.GetCharacter().GetCharacterVisualsComponent().GetCurrentHairPhase() == 5)
        {
            UGothicCinematicManagerSubsystemScript::Get().ForceStartCinematic(UShavingCinematic);
        }
        else
        {
            UGothicCinematicManagerSubsystemScript::Get().ForceStartCinematic(UShavingNoPonyTailCinematic);
        }
    }
}

UFUNCTION()
mixin void TriggerTattooCinematic(UGameStory Story)
{
    UGothicCinematicManagerSubsystemScript::Get().ForceStartCinematic(UTattooCinematic);
}


UFUNCTION()
mixin void FireMagesCinematic(UGameStory Story)
{
    if(IsValid(FCharacterUniqueName(n"OC_KDF_Corristo_402").NPCState))
        FCharacterUniqueName(n"OC_KDF_Corristo_402").NPCState.RemoveFromWorld();
    if(IsValid(FCharacterUniqueName(n"OC_KDF_Torrez_405").NPCState))
        FCharacterUniqueName(n"OC_KDF_Torrez_405").NPCState.RemoveFromWorld();
    if(IsValid(FCharacterUniqueName(n"OC_KDF_Rodriguez_400").NPCState))
        FCharacterUniqueName(n"OC_KDF_Rodriguez_400").NPCState.RemoveFromWorld();
    if(IsValid(FCharacterUniqueName(n"OC_KDF_Drago_403").NPCState))
        FCharacterUniqueName(n"OC_KDF_Drago_403").NPCState.RemoveFromWorld();
    if(IsValid(FCharacterUniqueName(n"OC_KDF_Damarok_401").NPCState))
        FCharacterUniqueName(n"OC_KDF_Damarok_401").NPCState.RemoveFromWorld();

    if(IsValid(FCharacterUniqueName(n"FM_SLD_Mercenary01_750").NPCState))
        FCharacterUniqueName(n"FM_SLD_Mercenary01_750").NPCState.RemoveFromWorld();
    if(IsValid(FCharacterUniqueName(n"FM_SLD_Mercenary02_751").NPCState))
        FCharacterUniqueName(n"FM_SLD_Mercenary02_751").NPCState.RemoveFromWorld();
    if(IsValid(FCharacterUniqueName(n"FM_SLD_Okyl_752").NPCState))
        FCharacterUniqueName(n"FM_SLD_Okyl_752").NPCState.RemoveFromWorld();
    if(IsValid(FCharacterUniqueName(n"FM_SLD_Baloro_753").NPCState))
        FCharacterUniqueName(n"FM_SLD_Baloro_753").NPCState.RemoveFromWorld();
    if(IsValid(FCharacterUniqueName(n"FM_SLD_Mercenary03_755").NPCState))
        FCharacterUniqueName(n"FM_SLD_Mercenary03_755").NPCState.RemoveFromWorld();
    if(IsValid(FCharacterUniqueName(n"FM_SLD_Mercenary04_756").NPCState))
        FCharacterUniqueName(n"FM_SLD_Mercenary04_756").NPCState.RemoveFromWorld();
    if(IsValid(FCharacterUniqueName(n"FM_SLD_Mercenary05_757").NPCState))
        FCharacterUniqueName(n"FM_SLD_Mercenary05_757").NPCState.RemoveFromWorld();
    if(IsValid(FCharacterUniqueName(n"FM_SLD_Mercenary06_758").NPCState))
        FCharacterUniqueName(n"FM_SLD_Mercenary06_758").NPCState.RemoveFromWorld();
    if(IsValid(FCharacterUniqueName(n"FM_SLD_Mercenary07_759").NPCState))
        FCharacterUniqueName(n"FM_SLD_Mercenary07_759").NPCState.RemoveFromWorld();
    if(IsValid(FCharacterUniqueName(n"FM_SLD_Mercenary08_760").NPCState))
        FCharacterUniqueName(n"FM_SLD_Mercenary08_760").NPCState.RemoveFromWorld();
    if(IsValid(FCharacterUniqueName(n"FM_SLD_Mercenary09_761").NPCState))
        FCharacterUniqueName(n"FM_SLD_Mercenary09_761").NPCState.RemoveFromWorld();
    if(IsValid(FCharacterUniqueName(n"FM_SLD_Mercenary10_762").NPCState))
        FCharacterUniqueName(n"FM_SLD_Mercenary10_762").NPCState.RemoveFromWorld();
    if(IsValid(FCharacterUniqueName(n"FM_SLD_Mercenary11_763").NPCState))
        FCharacterUniqueName(n"FM_SLD_Mercenary11_763").NPCState.RemoveFromWorld();
    if(IsValid(FCharacterUniqueName(n"FM_SLD_Mercenary12_764").NPCState))
        FCharacterUniqueName(n"FM_SLD_Mercenary12_764").NPCState.RemoveFromWorld();
    if(IsValid(FCharacterUniqueName(n"FM_SLD_Mercenary13_765").NPCState))
        FCharacterUniqueName(n"FM_SLD_Mercenary13_765").NPCState.RemoveFromWorld();
    if(IsValid(FCharacterUniqueName(n"FM_SFB_Scraper01_1030").NPCState))
        FCharacterUniqueName(n"FM_SFB_Scraper01_1030").NPCState.RemoveFromWorld();
    if(IsValid(FCharacterUniqueName(n"FM_SFB_Scraper02_1031").NPCState))
        FCharacterUniqueName(n"FM_SFB_Scraper02_1031").NPCState.RemoveFromWorld();
    if(IsValid(FCharacterUniqueName(n"FM_SFB_Scraper03_1032").NPCState))
        FCharacterUniqueName(n"FM_SFB_Scraper03_1032").NPCState.RemoveFromWorld();
    if(IsValid(FCharacterUniqueName(n"FM_SFB_Scraper04_1033").NPCState))
        FCharacterUniqueName(n"FM_SFB_Scraper04_1033").NPCState.RemoveFromWorld();
    if(IsValid(FCharacterUniqueName(n"FM_SFB_Scraper05_1034").NPCState))
        FCharacterUniqueName(n"FM_SFB_Scraper05_1034").NPCState.RemoveFromWorld();
    if(IsValid(FCharacterUniqueName(n"FM_SFB_Scraper06_1035").NPCState))
        FCharacterUniqueName(n"FM_SFB_Scraper06_1035").NPCState.RemoveFromWorld();
    if(IsValid(FCharacterUniqueName(n"FM_SFB_Scraper07_1036").NPCState))
        FCharacterUniqueName(n"FM_SFB_Scraper07_1036").NPCState.RemoveFromWorld();
    if(IsValid(FCharacterUniqueName(n"FM_SFB_Swiney_1037").NPCState))
        FCharacterUniqueName(n"FM_SFB_Swiney_1037").NPCState.RemoveFromWorld();
    if(IsValid(FCharacterUniqueName(n"FM_SFB_Scraper08_1038").NPCState))
        FCharacterUniqueName(n"FM_SFB_Scraper08_1038").NPCState.RemoveFromWorld();
    if(IsValid(FCharacterUniqueName(n"FM_SFB_Scraper09_1039").NPCState))
        FCharacterUniqueName(n"FM_SFB_Scraper09_1039").NPCState.RemoveFromWorld();
    if(IsValid(FCharacterUniqueName(n"FM_SFB_Scraper10_1040").NPCState))
        FCharacterUniqueName(n"FM_SFB_Scraper10_1040").NPCState.RemoveFromWorld();
    if(IsValid(FCharacterUniqueName(n"FM_SFB_Scraper11_1041").NPCState))
        FCharacterUniqueName(n"FM_SFB_Scraper11_1041").NPCState.RemoveFromWorld();
    if(IsValid(FCharacterUniqueName(n"FM_SFB_Scraper12_1042").NPCState))
        FCharacterUniqueName(n"FM_SFB_Scraper12_1042").NPCState.RemoveFromWorld();
    if(IsValid(FCharacterUniqueName(n"FM_SFB_Scraper13_1043").NPCState))
        FCharacterUniqueName(n"FM_SFB_Scraper13_1043").NPCState.RemoveFromWorld();
    if(IsValid(FCharacterUniqueName(n"FM_SFB_Scraper14_1044").NPCState))
        FCharacterUniqueName(n"FM_SFB_Scraper14_1044").NPCState.RemoveFromWorld();
    if(IsValid(FCharacterUniqueName(n"FM_ORG_Rogue01_890").NPCState))
        FCharacterUniqueName(n"FM_ORG_Rogue01_890").NPCState.RemoveFromWorld();
    if(IsValid(FCharacterUniqueName(n"FM_ORG_Rogue02_891").NPCState))
        FCharacterUniqueName(n"FM_ORG_Rogue02_891").NPCState.RemoveFromWorld();
    if(IsValid(FCharacterUniqueName(n"FM_ORG_Rogue03_892").NPCState))
        FCharacterUniqueName(n"FM_ORG_Rogue03_892").NPCState.RemoveFromWorld();

    if(IsValid(FCharacterUniqueName(n"OC_EBR_Gomez_100").NPCState))
        FCharacterUniqueName(n"OC_EBR_Gomez_100").NPCState.RemoveImmortality();

    if(IsValid(FCharacterUniqueName(n"NC_ORG_Rogue04_807").NPCState))
        FCharacterUniqueName(n"NC_ORG_Rogue04_807").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_NC_ORG_Rogue04_807_WaitFM::StaticClass());
    if(IsValid(FCharacterUniqueName(n"NC_KDW_Nefarius_603").NPCState))
        FCharacterUniqueName(n"NC_KDW_Nefarius_603").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_NC_KDW_Nefarius_603_Ncreport::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_GRD_Jackal_201").NPCState))
        FCharacterUniqueName(n"OC_GRD_Jackal_201").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_GRD_Jackal_201_Fmtaken::StaticClass());
    if(IsValid(FCharacterUniqueName(n"NC_SLD_Gorn_699").NPCState))
        FCharacterUniqueName(n"NC_SLD_Gorn_699").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_NC_SLD_Gorn_699_Ncreport::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_GRD_Fletcher_255").NPCState))
        FCharacterUniqueName(n"OC_GRD_Fletcher_255").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_GRD_Fletcher_255_Fmtaken::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OCR_GRD_Bloodwyn_233").NPCState))
        FCharacterUniqueName(n"OCR_GRD_Bloodwyn_233").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OCR_GRD_Bloodwyn_233_Fmtaken::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_GRD_Guard07_222").NPCState))
        FCharacterUniqueName(n"OC_GRD_Guard07_222").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_GRD_Guard07_222_FMTaken::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OCR_GRD_GateGuard01_212").NPCState))
        FCharacterUniqueName(n"OCR_GRD_GateGuard01_212").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OCR_GRD_GateGuard01_212_Fmtaken::StaticClass());
    if(IsValid(FCharacterUniqueName(n"NC_ORG_Sharky_843").NPCState))
        FCharacterUniqueName(n"NC_ORG_Sharky_843").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_NC_ORG_Sharky_843_Start::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_SLD_Kharim_729").NPCState))
        FCharacterUniqueName(n"OC_SLD_Kharim_729").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_SLD_Kharim_729_AfterFireMages::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_ORG_Mordrag_826").NPCState))
        FCharacterUniqueName(n"OC_ORG_Mordrag_826").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_ORG_Mordrag_826_AfterBeated::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_ORG_Mordrag_826").NPCState))
        FCharacterUniqueName(n"OC_ORG_Mordrag_826").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_ORG_Mordrag_826_AfterBeated::StaticClass());

    if(IsValid(FCharacterUniqueName(n"OC_KDF_Milten").NPCState))
    {
        FCharacterUniqueName(n"OC_KDF_Milten").NPCState.SetTrueGuild(UGE_Guild_None);
        FCharacterUniqueName(n"OC_KDF_Milten").NPCState.JoinPartyOf(FCharacterUniqueName(n"Hero").CharacterState);
        FCharacterUniqueName(n"OC_KDF_Milten").NPCState.TeleportToWaypointAndExchangeDailyRoutineToClass(UDailyRoutine_OC_KDF_Milten_AfterCinematic2::StaticClass(),n"Guide_Path_Milten_To_Out_Of_OC_1");
    }

    G1R::UStoryG1R::Get().FMTaken = 1; 
    G1R::UStoryG1R::Get().FireMagesDead = 1;

    G1R::UStoryG1R::Get().DeactivateStoryDataLayer("MainQuest_FreeMine_Default");
    G1R::UStoryG1R::Get().ActivateStoryDataLayer("MainQuest_FreeMine_Destroyed");
    G1R::UStoryG1R::Get().ActivateStoryDataLayer("MainQuest_FireMagesAssassination");
    UWorldPointManager::Get().CallGlobalEvent(n"OnFreeMineTaken");
    UWorldPointManager::Get().CallGlobalEvent(n"OnFireMagesMurdered");

    if(G1R::Quest::OldCamp_OCCHAPTER3_OCBANDITSCAMP.IsRunning())
    {
        G1R::Quest::OldCamp_OCCHAPTER3_OCBANDITSCAMP.FailQuest();
    }

    if(IsValid(FCharacterUniqueName(n"Hero").CharacterState))
        FCharacterUniqueName(n"Hero").CharacterState.TeleportToSpot(n"WP_HERO_AFTERFIREMAGES");

}

UFUNCTION()
mixin void SpawnMinecrawlerTunnelQuest(UGameStory Story)
{
    if(IsValid(FCharacterUniqueName(n"OM_GRD_Asghan_263").NPCState))
    {
        FCharacterUniqueName(n"OM_GRD_Asghan_263").NPCState.SetRelationshipTowards(FCharacterUniqueName(n"Hero").CharacterState, ERelationship::Friend);
        FCharacterUniqueName(n"OM_GRD_Asghan_263").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OM_GRD_Asghan_263_Opengate::StaticClass());
    }

    if(IsValid(FCharacterUniqueName(n"SC_NOV_Lester").NPCState))
        FCharacterUniqueName(n"SC_NOV_Lester").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Lester_Start::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_KDF_Milten").NPCState))
        FCharacterUniqueName(n"OC_KDF_Milten").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_KDF_Milten_Start::StaticClass());
    if(IsValid(FCharacterUniqueName(n"NC_SLD_Gorn_699").NPCState))
        FCharacterUniqueName(n"NC_SLD_Gorn_699").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_NC_SLD_Gorn_699_Start::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_STT_Diego").NPCState))
        FCharacterUniqueName(n"OC_STT_Diego").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_STT_Diego_OldCamp::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OM_GRD_Guard14_281N").NPCState))
        FCharacterUniqueName(n"OM_GRD_Guard14_281N").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OM_GRD_Guard14_281N_Start::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OM_STT_Ian_301").NPCState))
        FCharacterUniqueName(n"OM_STT_Ian_301").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OM_STT_Ian_301_OutsideMine::StaticClass());

    //FCharacterUniqueName(n"Hero").CharacterState.Character.GiveExperience(G1R::UStoryG1R::Get().XP_OM_BLOWTHEENTRANCE_COMPLETE);

    G1R::UStoryG1R::Get().Tunnel_Opened = 1; 

    UWorldPointManager::Get().CallGlobalEvent(n"SpawnMinecrawlerInTunnelQuest");

    FCharacterUniqueName(n"Hero").CharacterState.RemoveItemFromInventory(UItMs_ExplosionBarrel,1);
    FCharacterUniqueName(n"Hero").CharacterState.RemoveItemFromInventory(UItMs_ExplosionScroll,1);

}

UFUNCTION()
mixin void SunkenTowerRevealed(UGameStory Story)
{
    if(IsValid(FCharacterUniqueName(n"OC_EBR_Gomez_100").NPCState))
        FCharacterUniqueName(n"OC_EBR_Gomez_100").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_EBR_Gomez_100_Ot::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_EBR_Bartholo_106").NPCState))
    FCharacterUniqueName(n"OC_EBR_Bartholo_106").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_EBR_Bartholo_106_Ot::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_EBR_Arto_102").NPCState))
        FCharacterUniqueName(n"OC_EBR_Arto_102").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_EBR_Arto_102_Ot::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_EBR_Scar_101").NPCState))
        FCharacterUniqueName(n"OC_EBR_Scar_101").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_EBR_Scar_101_Ot::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_EBR_Raven_105").NPCState))
        FCharacterUniqueName(n"OC_EBR_Raven_105").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_EBR_Raven_105_Ot::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OCR_GRD_Bullit_203").NPCState))
        FCharacterUniqueName(n"OCR_GRD_Bullit_203").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OCR_GRD_Bullit_203_Ot::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_GRD_Scorpio_205").NPCState))
        FCharacterUniqueName(n"OC_GRD_Scorpio_205").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_GRD_Scorpio_205_Ot::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OCR_GRD_Cutter_208").NPCState))
        FCharacterUniqueName(n"OCR_GRD_Cutter_208").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OCR_GRD_Cutter_208_Ot::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OCR_GRD_Skip_211").NPCState))
        FCharacterUniqueName(n"OCR_GRD_Skip_211").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OCR_GRD_Skip_211_Ot::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OCR_GRD_Stone_219").NPCState))
    {
        FCharacterUniqueName(n"OCR_GRD_Stone_219").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OCR_GRD_Stone_219_Ot::StaticClass());    
        FCharacterUniqueName(n"OCR_GRD_Stone_219").NPCState.AddItemToInventory(UArmor_OCR_GRD_Stone_219, 1);
        FCharacterUniqueName(n"OCR_GRD_Stone_219").NPCState.Inventory.EquipArmorOfClass(UArmor_OCR_GRD_Stone_219);
        FCharacterUniqueName(n"OCR_GRD_Stone_219").NPCState.Inventory.RemoveAllItemsOfClass(UItMw_1H_Mace_Sledgehammer_01);
        FCharacterUniqueName(n"OCR_GRD_Stone_219").NPCState.Inventory.RemoveAllItemsOfClass(UItFo_Cheese);
        FCharacterUniqueName(n"OCR_GRD_Stone_219").NPCState.Inventory.RemoveAllItemsOfClass(UItFo_Apple);
        FCharacterUniqueName(n"OCR_GRD_Stone_219").NPCState.Inventory.RemoveAllItemsOfClass(UItMi_Orenugget);
        FCharacterUniqueName(n"OCR_GRD_Stone_219").NPCState.Inventory.RemoveAllItemsOfClass(UItMw_1H_Torch);
        FCharacterUniqueName(n"OCR_GRD_Stone_219").NPCState.SetTrueGuild(UGE_Guild_None);
        ULockPickSubsystem::SetActorUnlockedWorld(Story.World, n"OC_Prison_Dungeons_Cell_09_Door", false);
        UPuzzlesSubsystem::GlobalCloseDoorWorld(Story.World, n"OC_Prison_Dungeons_Cell_09_Door");
    }
        
    if(IsValid(FCharacterUniqueName(n"OC_GRD_Guard05_220").NPCState))
        FCharacterUniqueName(n"OC_GRD_Guard05_220").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_GRD_Guard05_220_Ot::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_GRD_Guard06_221").NPCState))
        FCharacterUniqueName(n"OC_GRD_Guard06_221").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_GRD_Guard06_221_Ot::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_GRD_Guard07_222").NPCState))
        FCharacterUniqueName(n"OC_GRD_Guard07_222").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_GRD_Guard07_222_Ot::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_GRD_Guard08_223").NPCState))
        FCharacterUniqueName(n"OC_GRD_Guard08_223").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_GRD_Guard08_223_Ot::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_GRD_Guard19_239").NPCState))
        FCharacterUniqueName(n"OC_GRD_Guard19_239").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_GRD_Guard19_239_Ot::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_GRD_Guard25_245").NPCState))
        FCharacterUniqueName(n"OC_GRD_Guard25_245").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_GRD_Guard25_245_Ot::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_GRD_Guard11_227").NPCState))
        FCharacterUniqueName(n"OC_GRD_Guard11_227").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_GRD_Guard11_227_Ot::StaticClass());
    if(IsValid(FCharacterUniqueName(n"OC_GRD_Guard16_232").NPCState))
        FCharacterUniqueName(n"OC_GRD_Guard16_232").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_GRD_Guard16_232_Ot::StaticClass());

    G1R::UStoryG1R::Get().ExploreSunkenTower = 1; 
}

UFUNCTION()
mixin void ChampionBurial(UGameStory Story)
{
    G1R::UStoryG1R::Get().ActivateStoryDataLayer("ChampionBurial_Layer");
}

UFUNCTION()
mixin void SleeperTempleEntrance(UGameStory Story)
{
    if(IsValid(FCharacterUniqueName(n"OW_OWR_ToChurnagg_2403").NPCState))
        FCharacterUniqueName(n"OW_OWR_ToChurnagg_2403").NPCState.TeleportToWaypointAndExchangeDailyRoutineToClass(UDailyRoutine_OW_OWR_ToChurnagg_2403_RunToTemple, n"FP_OTOWN_TEMPLE_ENTRANCE6");
    if(IsValid(FCharacterUniqueName(n"OW_OWR_OrcTempleWarriorM04_2044").NPCState))
        FCharacterUniqueName(n"OW_OWR_OrcTempleWarriorM04_2044").NPCState.TeleportToWaypointAndExchangeDailyRoutineToClass(UDailyRoutine_OW_OWR_OrcTempleWarriorM04_2044_RunToTemple, n"FP_OTOWN_TEMPLE_ENTRANCE7");
    if(IsValid(FCharacterUniqueName(n"OW_OWR_OrcTempleWarriorM03_2043").NPCState))
        FCharacterUniqueName(n"OW_OWR_OrcTempleWarriorM03_2043").NPCState.TeleportToWaypointAndExchangeDailyRoutineToClass(UDailyRoutine_OW_OWR_OrcTempleWarriorM03_2043_RunToTemple, n"FP_OTOWN_TEMPLE_ENTRANCE5");
}

UFUNCTION()
mixin void SleeperTempleEntranceIntelligence(UGameStory Story)
{
    if(IsValid(FCharacterUniqueName(n"OW_OWR_ToChurnagg_2403").NPCState))
        FCharacterUniqueName(n"OW_OWR_ToChurnagg_2403").NPCState.TeleportToWaypointAndExchangeDailyRoutineToClass(UDailyRoutine_OW_OWR_ToChurnagg_2403_Temple, n"FP_OTOWN_TEMPLE_ENTRANCE6");
    if(IsValid(FCharacterUniqueName(n"OW_OWR_OrcTempleWarriorM03_2043").NPCState))
        FCharacterUniqueName(n"OW_OWR_OrcTempleWarriorM03_2043").NPCState.TeleportToWaypointAndExchangeDailyRoutineToClass(UDailyRoutine_OW_OWR_OrcTempleWarriorM03_2043_Temple, n"FP_OTOWN_TEMPLE_ENTRANCE5");
    if(IsValid(FCharacterUniqueName(n"OW_OWR_OrcTempleWarriorM04_2044").NPCState))
        FCharacterUniqueName(n"OW_OWR_OrcTempleWarriorM04_2044").NPCState.TeleportToWaypointAndExchangeDailyRoutineToClass(UDailyRoutine_OW_OWR_OrcTempleWarriorM04_2044_Temple, n"FP_OTOWN_TEMPLE_ENTRANCE7");
}

UFUNCTION()
mixin void SleeperTempleTakenByKalom(UGameStory Story)
{
    UWorldPointManager::Get().CallGlobalEvent(n"OnSleeperTempleTaken");
    if(IsValid(FCharacterUniqueName(n"OW_OSM_UrNazkrog_2401").NPCState))
    {
         FCharacterUniqueName(n"OW_OSM_UrNazkrog_2401").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OW_OSM_UrNazkrog_2401_Trance::StaticClass());
        FCharacterUniqueName(n"OW_OSM_UrNazkrog_2401").NPCState.TeleportToSpot(n"FP_OTOWN_TEMPLE_ENTRANCE11");
    }
    
    if(IsValid(FCharacterUniqueName(n"OW_OWR_ToChurnagg_2403").NPCState))
    {
        FCharacterUniqueName(n"OW_OWR_ToChurnagg_2403").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OW_OWR_ToChurnagg_2403_Trance::StaticClass());
        FCharacterUniqueName(n"OW_OWR_ToChurnagg_2403").NPCState.TeleportToSpot(n"FP_OTOWN_TEMPLE_ENTRANCE8");
    }
    if(IsValid(FCharacterUniqueName(n"OW_OWR_OrcTempleWarriorM03_2043").NPCState))
    {
        FCharacterUniqueName(n"OW_OWR_OrcTempleWarriorM03_2043").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OW_OWR_OrcTempleWarriorM03_2043_Trance::StaticClass());
        FCharacterUniqueName(n"OW_OWR_OrcTempleWarriorM03_2043").NPCState.TeleportToSpot(n"FP_OTOWN_TEMPLE_ENTRANCE10");
    }
    if(IsValid(FCharacterUniqueName(n"OW_OWR_OrcTempleWarriorM04_2044").NPCState))
    {
        FCharacterUniqueName(n"OW_OWR_OrcTempleWarriorM04_2044").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OW_OWR_OrcTempleWarriorM04_2044_Trance::StaticClass());
        FCharacterUniqueName(n"OW_OWR_OrcTempleWarriorM04_2044").NPCState.TeleportToSpot(n"FP_OTOWN_TEMPLE_ENTRANCE9");
    }
    if(IsValid(FCharacterUniqueName(n"SC_VLK_Melvin_582").NPCState))
    {
        FCharacterUniqueName(n"SC_VLK_Melvin_582").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_VLK_Melvin_582_Confrontation::StaticClass());
        FCharacterUniqueName(n"SC_VLK_Melvin_582").NPCState.AddItemToInventory(UArmor_SC_VLK_Melvin_582, 1);
        FCharacterUniqueName(n"SC_VLK_Melvin_582").NPCState.Inventory.EquipArmorOfClass(UArmor_SC_VLK_Melvin_582);
        FCharacterUniqueName(n"SC_VLK_Melvin_582").NPCState.SetTrueGuild(UGE_SleeperTemple);
        FCharacterUniqueName(n"SC_VLK_Melvin_582").NPCState.RemoveImmortality();
    }
    if(IsValid(FCharacterUniqueName(n"SC_TPL_Templar03_1406").NPCState))
    {
        FCharacterUniqueName(n"SC_TPL_Templar03_1406").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_TPL_Templar03_1406_Confrontation);
        FCharacterUniqueName(n"SC_TPL_Templar03_1406").NPCState.SetTrueGuild(UGE_SleeperTemple);
    }
    if(IsValid(FCharacterUniqueName(n"SC_TPL_GorNaRan_1405").NPCState))
    {
        FCharacterUniqueName(n"SC_TPL_GorNaRan_1405").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_TPL_GorNaRan_1405_Confrontation);
        FCharacterUniqueName(n"SC_TPL_GorNaRan_1405").NPCState.SetTrueGuild(UGE_SleeperTemple);
    }
    G1R::Quest::SleeperTemple_STCHAPTER5_URIZIEL_URIZIEL_OBJ_CHARGE.SucceedQuest();
    G1R::UStoryG1R::Get().ActivateStoryDataLayer("Mainquest_SleeperTemple_Battle");
    
}

UFUNCTION()
mixin void FreeMineJackal(UGameStory Story)
{
    if(IsValid(FCharacterUniqueName(n"FM_GRD_Guard01_283").NPCState))
    {
        FCharacterUniqueName(n"FM_GRD_Guard01_283").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_FM_GRD_Guard01_283_Fmtaken2::StaticClass());
        FCharacterUniqueName(n"FM_GRD_Guard01_283").NPCState.SetRelationshipTowards(FCharacterUniqueName(n"Hero").CharacterState, ERelationship::Enemy);
        auto Guard01 = FCharacterUniqueName(n"FM_GRD_Guard01_283").NPCState;
        auto PlayerState = FCharacterUniqueName(n"Hero").CharacterState;

        if (IsValid(Guard01.AIAbility))
        {
            Guard01.AIAbility.StartFightCustom(PlayerState, false, 
                GameplayTag::AIConflict_FightType_Real, 
                GameplayTag::AIConflict_FightGoal_Kill, 
                GameplayTag::AIConflict_Duration_Permanent);
        }
        
    }

    if(IsValid(FCharacterUniqueName(n"FM_GRD_Guard03_285").NPCState))
    {
        FCharacterUniqueName(n"FM_GRD_Guard03_285").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_FM_GRD_Guard03_285_Fmtaken2::StaticClass());
        FCharacterUniqueName(n"FM_GRD_Guard03_285").NPCState.SetRelationshipTowards(FCharacterUniqueName(n"Hero").CharacterState, ERelationship::Enemy);
        auto Guard03 = FCharacterUniqueName(n"FM_GRD_Guard03_285").NPCState;
        auto PlayerState = FCharacterUniqueName(n"Hero").CharacterState;

        if (IsValid(Guard03.AIAbility))
        {
            Guard03.AIAbility.StartFightCustom(PlayerState, false, 
                GameplayTag::AIConflict_FightType_Real, 
                GameplayTag::AIConflict_FightGoal_Kill, 
                GameplayTag::AIConflict_Duration_Permanent);
        }
    }

    if(IsValid(FCharacterUniqueName(n"OC_GRD_Jackal_201").NPCState))
    {
        FCharacterUniqueName(n"OC_GRD_Jackal_201").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_GRD_Jackal_201_Fmtaken2::StaticClass());
        FCharacterUniqueName(n"OC_GRD_Jackal_201").NPCState.SetRelationshipTowards(FCharacterUniqueName(n"Hero").CharacterState, ERelationship::Enemy);

        auto Jackal = FCharacterUniqueName(n"OC_GRD_Jackal_201").NPCState;
        auto PlayerState = FCharacterUniqueName(n"Hero").CharacterState;

        if (IsValid(Jackal.AIAbility))
        {
            Jackal.AIAbility.StartFightCustom(PlayerState, false, 
                GameplayTag::AIConflict_FightType_Real, 
                GameplayTag::AIConflict_FightGoal_Kill, 
                GameplayTag::AIConflict_Duration_Permanent);
        }
    }

    if(IsValid(FCharacterUniqueName(n"NC_SLD_Gorn_699").NPCState))
    {
        FCharacterUniqueName(n"NC_SLD_Gorn_699").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_NC_SLD_Gorn_699_Followtofmc::StaticClass());
        FCharacterUniqueName(n"NC_SLD_Gorn_699").NPCState.JoinPartyOf(FCharacterUniqueName(n"Hero").CharacterState);
    }

    G1R::UStoryG1R::Get().FMHostile = 1;


}

UFUNCTION()
mixin bool IsDoorOpen(const UGameStory Story, FName Door)
{
    return AG1RGameState::IsDoorOpenWorld(Story.World, Door);
}

UFUNCTION()
mixin void ReturnToDefaultDailyroutine(UGameStory Story)
{
    // Contrary to this functions name, it is only for making 3 Diggers do their next routines during the ExchangeZone Raid quest. 
    // Changing this would require changing dialog scripts though.

    TSet<AGothicNPCState> PotentialPartyMembers;
    for (auto PartyMember : FCharacterUniqueName(n"Hero").CharacterState.InPartyWith)
    {
        auto NPCState = Cast<AGothicNPCState>(PartyMember);

        if (NPCState == nullptr)
            continue;

        if (!NPCState.HasAssignedDailyRoutine(UDailyRoutine_Generic_FollowHero))
            continue;

        PotentialPartyMembers.Add(NPCState);
    }


    TArray<AGothicCharacter> SpawnedCharacters;
    GetAllActorsOfClass(AGothicCharacter, SpawnedCharacters);

    // Check all current visually spawned characters as well, in case the party state got lost
    for (auto SpawnedCharacter : SpawnedCharacters)
    {
        auto NPCState = Cast<AGothicNPCState>(SpawnedCharacter.CharacterState);

        if (NPCState == nullptr)
            continue;

        if (!NPCState.HasAssignedDailyRoutine(UDailyRoutine_Generic_FollowHero))
            continue;

        PotentialPartyMembers.Add(NPCState);
    }

    int Counter = 0;
    for (auto PartyMember : PotentialPartyMembers)
    {
        if(Counter == 0)
        {
            PartyMember.ExchangeDailyRoutineToClass(UDailyRoutine_Human_Digger_ExchangeZoneCarryBoxesFloor::StaticClass());
            Counter++;

        }
        else if(Counter == 1)
        {
            PartyMember.ExchangeDailyRoutineToClass(UDailyRoutine_Human_Digger_ExchangeZoneCarryBoxesHigh::StaticClass());
            Counter++;
        }
        else if(Counter == 2)
        {
            PartyMember.ExchangeDailyRoutineToClass(UDailyRoutine_Human_Digger_ExchangeZoneCarryPlank::StaticClass());
            Counter = 0;
        }

        PartyMember.RemoveImmortality();
        PartyMember.LeavePartyOf(FCharacterUniqueName(n"Hero").CharacterState);
    }
}

UFUNCTION()
mixin void ChromaninRead(UGameStory Story, int Number)
{
    G1R::UStoryG1R::Get().ChromaninReaded = Number;
    
    if(Number == 1)
    {
        UWorldPointManager::Get().CallGlobalEvent(n"SecondChromanin");
    }
    else if(Number == 2)
    {
        UWorldPointManager::Get().CallGlobalEvent(n"ThirdChromanin");
    }
    else if(Number == 3)
    {
        UWorldPointManager::Get().CallGlobalEvent(n"FourthChromanin");
    }
    else if(Number == 4)
    {
        UWorldPointManager::Get().CallGlobalEvent(n"FifthChromanin");
    }
    else if(Number == 5)
    {
        UPuzzlesSubsystem::GlobalOpenDoor( n"SkeletonChamberDoor1");
        UPuzzlesSubsystem::GlobalOpenDoor( n"SkeletonChamberDoor2");
    }
    else if(Number == 6)
    {
        
    }
}

UFUNCTION()
mixin void OpenXardasTowerDoor(UGameStory Story)
{
    UPuzzlesSubsystem::GlobalOpenDoor( n"XardasTowerDoor");
}

UFUNCTION()
mixin void OpenSantinoPassageDoor(UGameStory Story)
{
    UPuzzlesSubsystem::GlobalUnlockDoor(n"OC_Santino_Door");
}

UFUNCTION()
mixin void QuestDealer_JOINOC(UGameStory Story)
{
    //G1R::UStoryG1R::Get().ExploreSunkenTower = 1;
    G1R::UStoryG1R::Get().ChangeChapter(1);
    G1R::Quest::OldCamp_OCCHAPTER1_FIREMAGESLETTER.StartQuest();
    G1R::UStoryG1R::Get().InitialCharacterAssigment();
    G1R::Quest::OldCamp_OCCHAPTER1_JOINOC.StartQuest();
}

UFUNCTION()
mixin void TryConvoyCleanup(UGameStory Story, AGothicCharacterState CharacterState)
{
    if (!IsValid(CharacterState) || CharacterState.CharacterUniqueName != n"Hero")
        return;
    if (G1R::UStoryG1R::Get().Convoy_RaidStart != 1)
        return;
    if (G1R::UStoryG1R::Get().Convoy_PlayerBriefed != 0)
        return;
    if (G1R::UStoryG1R::Get().Convoy_CleanupStep >= 2)
        return;
    if (!G1R::UStoryG1R::Get().Convoy_RaidStartTime.IsValid())
        return;
    float Elapsed = FInGameTime::Now().TotalSeconds - G1R::UStoryG1R::Get().Convoy_RaidStartTime.TotalSeconds;
    if (G1R::UStoryG1R::Get().Convoy_CleanupStep < 1 && Elapsed >= 1800.f)
    {
        DoConvoyCleanupStep1();
        G1R::UStoryG1R::Get().Convoy_CleanupStep = 1;
    }
    if (G1R::UStoryG1R::Get().Convoy_CleanupStep < 2 && Elapsed >= 5400.f)
    {
        DoConvoyCleanupStep2();
        G1R::UStoryG1R::Get().Convoy_CleanupStep = 2;
    }
}

UFUNCTION()
mixin void ForceConvoyCleanup(UGameStory Story)
{
    DoConvoyCleanupStep1(); 
    DoConvoyCleanupStep2();
}

void DoConvoyCleanupStep1()
{
    FCharacterUniqueName Guard31(n"OC_GRD_Guard31_283N");
    if (IsValid(Guard31.NPCState)) Guard31.NPCState.RemoveFromWorld();
    FCharacterUniqueName Guard32(n"OC_GRD_Guard32_284N");
    if (IsValid(Guard32.NPCState)) Guard32.NPCState.RemoveFromWorld();
    FCharacterUniqueName Guard33(n"OC_GRD_Guard33_285N");
    if (IsValid(Guard33.NPCState)) Guard33.NPCState.RemoveFromWorld();
    FCharacterUniqueName Guard34(n"OC_GRD_Guard34_286N");
    if (IsValid(Guard34.NPCState)) Guard34.NPCState.RemoveFromWorld();
    FCharacterUniqueName Guard35(n"OC_GRD_Guard35_287N");
    if (IsValid(Guard35.NPCState)) Guard35.NPCState.RemoveFromWorld();
    FCharacterUniqueName Guard36(n"OC_GRD_Guard36_288N");
    if (IsValid(Guard36.NPCState)) Guard36.NPCState.RemoveFromWorld();
    FCharacterUniqueName Guard37(n"OC_GRD_Guard37_289N");
    if (IsValid(Guard37.NPCState)) Guard37.NPCState.RemoveFromWorld();
    FCharacterUniqueName Guard38(n"OC_GRD_Guard38_290N");
    if (IsValid(Guard38.NPCState)) Guard38.NPCState.RemoveFromWorld();
    FCharacterUniqueName Guard39(n"OC_GRD_Guard39_291N");
    if (IsValid(Guard39.NPCState)) Guard39.NPCState.RemoveFromWorld();
    FCharacterUniqueName Digger35(n"OM_VLK_DIGGER35_1050N");
    if (IsValid(Digger35.NPCState)) Digger35.NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OM_VLK_Digger35_1050N_Start::StaticClass());
    FCharacterUniqueName Digger36(n"OM_VLK_DIGGER36_1051N");
    if (IsValid(Digger36.NPCState)) Digger36.NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OM_VLK_Digger36_1051N_Start::StaticClass());
    FCharacterUniqueName Digger37(n"OM_VLK_DIGGER37_1052N");
    if (IsValid(Digger37.NPCState)) Digger37.NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OM_VLK_Digger37_1052N_Start::StaticClass());
    FCharacterUniqueName GorNaDrak(n"SC_TPL_GORNADRAK_1439");
    if (IsValid(GorNaDrak.NPCState)) GorNaDrak.NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_TPL_GorNaDrak_1439_Start::StaticClass());
    FCharacterUniqueName Templar23(n"SC_TPL_TEMPLAR23_1440");
    if (IsValid(Templar23.NPCState)) Templar23.NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_TPL_Templar23_1440_Start::StaticClass());
}

void DoConvoyCleanupStep2()
{
    AGothicCharacterState HeroState = FCharacterUniqueName(n"Hero").CharacterState;
    ConvoyCleanup_ResetHostilityToHero(FCharacterUniqueName(n"NC_ORG_Wedge_850"), HeroState);
    ConvoyCleanup_ResetHostilityToHero(FCharacterUniqueName(n"NC_ORG_Butch_851"), HeroState);
    ConvoyCleanup_ResetHostilityToHero(FCharacterUniqueName(n"NC_ORG_Rogue33_882N"), HeroState);
    ConvoyCleanup_ResetHostilityToHero(FCharacterUniqueName(n"NC_ORG_Rogue34_883N"), HeroState);
    ConvoyCleanup_ResetHostilityToHero(FCharacterUniqueName(n"NC_ORG_Rogue35_884N"), HeroState);
    ConvoyCleanup_ResetHostilityToHero(FCharacterUniqueName(n"NC_ORG_Rogue36_885N"), HeroState);
    ConvoyCleanup_ResetHostilityToHero(FCharacterUniqueName(n"NC_ORG_Rogue37_886N"), HeroState);
    FCharacterUniqueName Wedge(n"NC_ORG_Wedge_850");
    if (IsValid(Wedge.NPCState)) Wedge.NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_NC_ORG_Wedge_850_Start::StaticClass());
    FCharacterUniqueName Butch(n"NC_ORG_Butch_851");
    if (IsValid(Butch.NPCState)) Butch.NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_NC_ORG_Butch_851_Start::StaticClass());
    FCharacterUniqueName Rogue35(n"NC_ORG_Rogue35_884N");
    if (IsValid(Rogue35.NPCState)) Rogue35.NPCState.RemoveFromWorld();
    FCharacterUniqueName Rogue34(n"NC_ORG_Rogue34_883N");
    if (IsValid(Rogue34.NPCState)) Rogue34.NPCState.RemoveFromWorld();
    FCharacterUniqueName Rogue33(n"NC_ORG_Rogue33_882N");
    if (IsValid(Rogue33.NPCState)) Rogue33.NPCState.RemoveFromWorld();
    FCharacterUniqueName Rogue37(n"NC_ORG_Rogue37_886N");
    if (IsValid(Rogue37.NPCState)) Rogue37.NPCState.RemoveFromWorld();
    FCharacterUniqueName Rogue36(n"NC_ORG_Rogue36_885N");
    if (IsValid(Rogue36.NPCState)) Rogue36.NPCState.RemoveFromWorld();

    G1R::UStoryG1R::Get().DeactivateStoryDataLayer("ConvoyAttack");
    G1R::UStoryG1R::Get().ActivateStoryDataLayer("ConvoyAttack_After");
}

void ConvoyCleanup_ResetHostilityToHero(FCharacterUniqueName Ref, AGothicCharacterState HeroState)
{
    if (!IsValid(Ref.NPCState))
        return;
    if (IsValid(HeroState))
    {
        TArray<UActivePersonalRelationshipModifier> ToDiscard;
        for (auto Modifier : Ref.NPCState.Relationship.ActivePersonalModifiers)
        {
            auto EnemyMod = Cast<UActivePersonalRelationshipModifier_Enemy>(Modifier);
            if (EnemyMod == nullptr)
                continue;
            if (EnemyMod.TargetCharacter != HeroState)
                continue;
            ToDiscard.Add(Modifier);
        }
        for (auto Mod : ToDiscard)
            Mod.Discard();
    }
    if (IsValid(Ref.NPCState.AI))
    {
        auto CharAI = Cast<UGameplayAbility_CharacterAI>(Ref.NPCState.AI);
        if (IsValid(CharAI))
            CharAI.AssessEvent(GameplayTag::AIEvent_State_Done, FRememberedPerception());
    }
}

#endif /** Keep this at the bottom */ 