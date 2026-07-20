/** Grants the given amount of experience */
#ifdef WITH_STORY_G1R

UCLASS()
class UGothicCinematicManagerSubsystemScript : UGothicCinematicManagerSubsystem
{
    default m_StartupCinematicClass = UIntroPt2Cinematic::StaticClass();
}

class UGothicCinematicBase : UGothicCinematic 
{
    FMovieSceneSequencePlaybackSettings LevelSequenceSettings;
    default LevelSequenceSettings.bHideHud = true;
    default LevelSequenceSettings.bDisableMovementInput = true;
    default PlaybackSettings = LevelSequenceSettings;

    FLevelSequenceCameraSettings LevelSequenceCameraSettings;
    default LevelSequenceCameraSettings.bOverrideAspectRatioAxisConstraint = true;
    default LevelSequenceCameraSettings.AspectRatioAxisConstraint = EAspectRatioAxisConstraint::AspectRatio_MaintainYFOV;
    
    FAbilityTaskCameraFadeSetup FadeIn;
    default FadeIn.m_Duration = 0.3f;
    default FadeIn.m_FadeAudio = true;
    default FadeIn.m_TargetAlpha = 1.f;

    FAbilityTaskCameraFadeSetup FadeOut;
    default FadeOut.m_Duration = 0.3f;
    default FadeOut.m_FadeAudio = true;
    default FadeOut.m_TargetAlpha = 0.f;
    default FadeOut.m_DelayBeforeFade = 1.f;

    default FadeInSetup = FadeIn;
    default FadeOutSetup = FadeOut;
}

class UTESTCinematic : UGothicCinematicBase 
{
    default LevelSequenceAsset = n"LevelSequence'/Game/Cinematics/Assets/TestCinematic_Facialls.TestCinematic_Facialls'";

    //Story Logic Before Cinematic
    UFUNCTION(BlueprintOverride)
    void SetupBeforeSequence()
    {
    }

    //Story Logic After Cinematic
    UFUNCTION(BlueprintOverride)
    void SetupAfterSequence()
    {
        
    }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class UIntroPt2Cinematic : UGothicCinematicBase 
{
    default LevelSequenceAsset = n"LevelSequence'/Game/Cinematics/CUTSCENES/1_IntroTrial_Cutscene/1_SEQUENCES/LS_CS_IntroTrial_MASTER.LS_CS_IntroTrial_MASTER'";

    default CinematicDataLayers.AddUnique(TSoftObjectPtr<UDataLayerAsset>(n"DataLayerAsset'/Game/Maps/MainMap/DataLayers/MainMap/Cinematics_IntroTrial.Cinematics_IntroTrial'"));
    default TeleportToCinematicWP = n"QuickTeleport_Cinematic_Intro";

    // Forces Fade to be already Black
    default FadeInSetup.m_StartAlpha = 1.0f;

    
    TSoftObjectPtr<UMaterialParameterCollection> MaterialBarrier = "MaterialParameterCollection'/Game/Materials/ParameterCollections/MPC_Gothic_Global_Parameters.MPC_Gothic_Global_Parameters'";

    //Story Logic Before Cinematic

    UFUNCTION(BlueprintOverride)
    void SetupBeforeSequence()
    {
        if(IsValid(FCharacterUniqueName(n"OCR_GRD_Bullit_203").NPCState))
            FCharacterUniqueName(n"OCR_GRD_Bullit_203").NPCState.TeleportToSpot(n"WP_EZ_CS1_Bullit");
        if(IsValid(FCharacterUniqueName(n"OC_GRD_Guard12_228").NPCState))
            FCharacterUniqueName(n"OC_GRD_Guard12_228").NPCState.TeleportToSpot(n"WP_EZ_CS1_MGuard02");
        if(IsValid(FCharacterUniqueName(n"OC_GRD_Guard02_206").NPCState))
            FCharacterUniqueName(n"OC_GRD_Guard02_206").NPCState.TeleportToSpot(n"WP_EZ_CS1_MGuard01");

        if(IsValid(FCharacterUniqueName(n"OC_STT_Diego").NPCState))
            FCharacterUniqueName(n"OC_STT_Diego").NPCState.TeleportToSpot(n"WP_EZ_CS1_Diego");       
         
        UWeatherSubsystem Weather = UWeatherSubsystem::Get();
        if (Weather != nullptr)
        {
            Weather.FreezeSkyTime(FInGameTime::Make(0,11,30,0));
        }
        
        if(MaterialBarrier.IsValid())
        {
            FName ParameterName = n"Cinematic Data (Is In Cinematic, x, x)";
            FLinearColor Color = Material::GetVectorParameterValue(MaterialBarrier.Get(), ParameterName);
            Color.R = 1.f;
            Material::SetVectorParameterValue(MaterialBarrier.Get(), ParameterName, Color);
        }

        BlockHeroMovement();
        
    }

    //@DE - Avoid initial movement for all heroes 
    void BlockHeroMovement()
    {
        FGameplayTagContainer tagsToAdd = FGameplayTagContainer();
        tagsToAdd.AddTag(GameplayTag::Block_Action_Jump);
        tagsToAdd.AddTag(GameplayTag::State_IgnoreMovementInput);
        tagsToAdd.AddTag(GameplayTag::State_NoInput_Controller);

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
                character.GetGothicAbilitySystemComponent().AddLooseTags(tagsToAdd);
            }
        }
    }

    UFUNCTION(BlueprintOverride)
    void SetupAfterActorsReady()
    {
        if(IsValid(FCharacterUniqueName(n"OCR_GRD_Bullit_203").NPCState))
            FCharacterUniqueName(n"OCR_GRD_Bullit_203").CharacterState.HideInventoryType(true, EInventoryTypes::MeleeSlot);
        if(IsValid(FCharacterUniqueName(n"OC_GRD_Guard12_228").NPCState))
            FCharacterUniqueName(n"OC_GRD_Guard12_228").CharacterState.HideInventoryType(true, EInventoryTypes::MeleeSlot);
        if(IsValid(FCharacterUniqueName(n"OC_GRD_Guard12_228").NPCState))
            FCharacterUniqueName(n"OC_GRD_Guard12_228").CharacterState.HideInventoryType(true, EInventoryTypes::RangedSlot);
        if(IsValid(FCharacterUniqueName(n"OC_GRD_Guard02_206").NPCState))
            FCharacterUniqueName(n"OC_GRD_Guard02_206").CharacterState.HideInventoryType(true, EInventoryTypes::MeleeSlot);
        if(IsValid(FCharacterUniqueName(n"OC_GRD_Guard02_206").NPCState))
            FCharacterUniqueName(n"OC_GRD_Guard02_206").CharacterState.HideInventoryType(true, EInventoryTypes::RangedSlot);       
        if(IsValid(FCharacterUniqueName(n"OCR_GRD_Bullit_203").NPCState))
            FCharacterUniqueName(n"OCR_GRD_Bullit_203").CharacterState.HideInventoryType(true, EInventoryTypes::RangedSlot);

         if(IsValid(FCharacterUniqueName(n"Hero").PlayerState))
            FCharacterUniqueName(n"Hero").PlayerState.TeleportToSpot(n"WP_PLAYER_START");
    }


    //Story Logic After Cinematic

    UFUNCTION(BlueprintOverride)
    void SetupAfterSequence()
    {
        if(IsValid(FCharacterUniqueName(n"OCR_GRD_Bullit_203").NPCState))
            FCharacterUniqueName(n"OCR_GRD_Bullit_203").NPCState.TeleportToSpot(n"FP_OC_STANDAROUND_67");
        if(IsValid(FCharacterUniqueName(n"OC_GRD_Guard12_228").NPCState))
            FCharacterUniqueName(n"OC_GRD_Guard12_228").NPCState.TeleportToSpot(n"FP_OC_GUARDPASSAGE_21");
        if(IsValid(FCharacterUniqueName(n"OC_GRD_Guard02_206").NPCState))
            FCharacterUniqueName(n"OC_GRD_Guard02_206").NPCState.TeleportToSpot(n"FP_OC_SMALLTALK_56");

        if(IsValid(FCharacterUniqueName(n"OC_STT_Diego").NPCState))
            FCharacterUniqueName(n"OC_STT_Diego").NPCState.TeleportToWaypointAndExchangeDailyRoutineToClass(UDailyRoutine_OC_STT_Diego_Start,n"FP_EZ_DEMO_Guard");  
               

        UWeatherSubsystem Weather = UWeatherSubsystem::Get();
        if (Weather != nullptr)
        {
            Weather.UnfreezeSkyTime();
            Weather.SetPlayerWeatherImmediate(EWeather::Sunny);
        }

        if(MaterialBarrier.IsValid())
        {
            FName ParameterName = n"Cinematic Data (Is In Cinematic, x, x)";
            FLinearColor Color = Material::GetVectorParameterValue(MaterialBarrier.Get(), ParameterName);
            Color.R = 0.f;
            Material::SetVectorParameterValue(MaterialBarrier.Get(), ParameterName, Color);
        }             
       
        FCharacterUniqueName(n"Hero").CharacterState.GetCharacter().GetWeatherComponent().SetWetness(0.4f);
        if(IsValid(FCharacterUniqueName(n"OCR_GRD_Bullit_203").NPCState))
        {
            FCharacterUniqueName(n"OCR_GRD_Bullit_203").CharacterState.HideInventoryType(false, EInventoryTypes::MeleeSlot);
            FCharacterUniqueName(n"OCR_GRD_Bullit_203").CharacterState.HideInventoryType(false, EInventoryTypes::RangedSlot);       
        }
        
        if(IsValid(FCharacterUniqueName(n"OC_GRD_Guard12_228").NPCState))
        {
            FCharacterUniqueName(n"OC_GRD_Guard12_228").CharacterState.HideInventoryType(false, EInventoryTypes::MeleeSlot);       
            FCharacterUniqueName(n"OC_GRD_Guard12_228").CharacterState.HideInventoryType(false, EInventoryTypes::RangedSlot);  
        } 
        if(IsValid(FCharacterUniqueName(n"OC_GRD_Guard02_206").NPCState))
        {   
            FCharacterUniqueName(n"OC_GRD_Guard02_206").CharacterState.HideInventoryType(false, EInventoryTypes::MeleeSlot);      
            FCharacterUniqueName(n"OC_GRD_Guard02_206").CharacterState.HideInventoryType(false, EInventoryTypes::RangedSlot);    
        }

        auto AchievementSystem = UGothicAchievementSubsystem::Get(this);
        
        if (IsValid(AchievementSystem))
        {
            AchievementSystem.UpdateAchievements();
        }
    }        
}



class UProphecyCinematic : UGothicCinematicBase 
{
    default LevelSequenceAsset = n"LevelSequence'/Game/Cinematics/CUTSCENES/2_Prophecy_Cutscene/1_SEQUENCES/LS_CS_PROPHECY_MASTER.LS_CS_PROPHECY_MASTER'";

    default CinematicDataLayers.AddUnique(TSoftObjectPtr<UDataLayerAsset>(n"DataLayerAsset'/Game/Maps/MainMap/DataLayers/MainMap/Cinematics_Prophecy.Cinematics_Prophecy'"));
    default TeleportToCinematicWP = n"QuickTeleport_Cinematic_GreatPrayer";

    FOverrideTimeByRange time1;
    default time1.From = FClockTime(00,00);
    default time1.To = FClockTime(23,59,59);
    default time1.Time = FClockTime(22,00);
    default OverrideTimeByRange.Add(time1);

    int PrevSkeletalMeshLOD = 0;

    //Story Logic Before Cinematic
    UFUNCTION(BlueprintOverride)
    void SetupBeforeSequence()
    {
        PrevSkeletalMeshLOD = System::GetConsoleVariableIntValue("r.SkeletalMeshLODBias");
        System::ExecuteConsoleCommand("r.SkeletalMeshLODBias 2");

        if(IsValid(FCharacterUniqueName(n"SC_GUR_YBerion_1200").NPCState))
            FCharacterUniqueName(n"SC_GUR_YBerion_1200").NPCState.TeleportToSpot(n"FP_SC_CALL_SLEEPER");
        if(IsValid(FCharacterUniqueName(n"SC_GUR_CorAngar_1202").NPCState))
            FCharacterUniqueName(n"SC_GUR_CorAngar_1202").NPCState.TeleportToSpot(n"FP_SC_CALL_SLEEPER_LEFT");
        if(IsValid(FCharacterUniqueName(n"SC_GUR_CorKalom_1201").NPCState))
            FCharacterUniqueName(n"SC_GUR_CorKalom_1201").NPCState.TeleportToSpot(n"FP_SC_CALL_SLEEPER_RIGHT");
        if(IsValid(FCharacterUniqueName(n"OG_GUR_BaalLukor_1211").NPCState))
            FCharacterUniqueName(n"OG_GUR_BaalLukor_1211").NPCState.TeleportToSpot(n"FP_SC_CALL_SLEEPER_LUKOR_START");

        if(IsValid(FCharacterUniqueName(n"Hero").CharacterState))
            FCharacterUniqueName(n"Hero").CharacterState.TeleportToSpot(n"WP_SC_PROPHECY_HERO");
        
        if(IsValid(FCharacterUniqueName(n"SC_NOV_Lester").NPCState))
            FCharacterUniqueName(n"SC_NOV_Lester").NPCState.TeleportToSpot(n"FP_SC_PROPHECY_LESTER");
        if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice09_1316").NPCState))
            FCharacterUniqueName(n"SC_NOV_Novice09_1316").NPCState.TeleportToSpot(n"WP_SC_PROPHECY_12");
        if(IsValid(FCharacterUniqueName(n"SC_GUR_BaalTyon_1210").NPCState))
            FCharacterUniqueName(n"SC_GUR_BaalTyon_1210").NPCState.TeleportToSpot(n"WP_SC_PROPHECY_5");
        if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice38_1349").NPCState))
            FCharacterUniqueName(n"SC_NOV_Novice38_1349").NPCState.TeleportToSpot(n"WP_SC_PROPHECY_1");
        if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice03_1308").NPCState))
            FCharacterUniqueName(n"SC_NOV_Novice03_1308").NPCState.TeleportToSpot(n"FP_SC_PROPHECY_32");
        if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice08_1315").NPCState))
            FCharacterUniqueName(n"SC_NOV_Novice08_1315").NPCState.TeleportToSpot(n"FP_SC_PROPHECY_8");

    }

    //Story Logic After Cinematic
    UFUNCTION(BlueprintOverride)
    void SetupAfterSequence()
    {
        System::ExecuteConsoleCommand("r.SkeletalMeshLODBias "+ PrevSkeletalMeshLOD);

        // FCharacterUniqueName(n"SC_GUR_YBerion_1200").NPCState.TeleportToSpot(n"FP_SC_CALL_SLEEPER");
        // FCharacterUniqueName(n"SC_GUR_CorAngar_1202").NPCState.TeleportToSpot(n"FP_SC_CALL_SLEEPER_LEFT");
        // FCharacterUniqueName(n"SC_GUR_CorKalom_1201").NPCState.TeleportToSpot(n"FP_SC_CALL_SLEEPER_RIGHT");
        // FCharacterUniqueName(n"OG_GUR_BaalLukor_1211").NPCState.TeleportToSpot(n"FP_SC_CALL_SLEEPER_LUKOR_START");

        if(IsValid(FCharacterUniqueName(n"Hero").CharacterState))
            FCharacterUniqueName(n"Hero").CharacterState.TeleportToSpot(n"WP_SC_PROPHECY_HERO_END");
        if(IsValid(FCharacterUniqueName(n"SC_NOV_Lester").NPCState))
            FCharacterUniqueName(n"SC_NOV_Lester").NPCState.TeleportToSpot(n"FP_SC_PROPHECY_LESTER");
        
        if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice12_1319").NPCState))
            FCharacterUniqueName(n"SC_NOV_Novice12_1319").NPCState.TeleportToWaypointAndExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Novice12_1319_AfterRitual::StaticClass(),n"FP_SC_PROPHECY_1");
        if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice33_1344").NPCState))
        {
            FCharacterUniqueName(n"SC_NOV_Novice33_1344").NPCState.TeleportToWaypointAndExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Novice33_1344_AfterRitual::StaticClass(),n"FP_SC_MEDITATE_03");
            FCharacterUniqueName(n"SC_NOV_Novice33_1344").NPCState.RemoveImmortality();
        }
        if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice38_1349").NPCState))
            FCharacterUniqueName(n"SC_NOV_Novice38_1349").NPCState.TeleportToWaypointAndExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Novice38_1349_AfterRitual::StaticClass(),n"FP_SC_PROPHECY_END_12");
        if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice37_1348").NPCState))
        {
            FCharacterUniqueName(n"SC_NOV_Novice37_1348").NPCState.TeleportToWaypointAndExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Novice37_1348_AfterRitual::StaticClass(),n"FP_SC_PROPHECY_END_7");
            FCharacterUniqueName(n"SC_NOV_Novice37_1348").NPCState.RemoveImmortality();
        }
        if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice35_1346").NPCState))
            FCharacterUniqueName(n"SC_NOV_Novice35_1346").NPCState.TeleportToWaypointAndExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Novice35_1346_AfterRitual::StaticClass(),n"FP_SC_SMALLTALK_18");
        if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice39_1350").NPCState))
            FCharacterUniqueName(n"SC_NOV_Novice39_1350").NPCState.TeleportToWaypointAndExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Novice39_1350_Start::StaticClass(),n"IO_SC_BENCH_25");
        if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice01_1306").NPCState))
        {
            FCharacterUniqueName(n"SC_NOV_Novice01_1306").NPCState.TeleportToWaypointAndExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Novice01_1306_AfterRitual::StaticClass(),n"FP_SC_CAMPFIRE_03");
            FCharacterUniqueName(n"SC_NOV_Novice01_1306").NPCState.RemoveImmortality();
        }
        if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice15_1322").NPCState))
            FCharacterUniqueName(n"SC_NOV_Novice15_1322").NPCState.TeleportToWaypointAndExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Novice15_1322_AfterRitual::StaticClass(),n"FP_SC_PROPHECY_END_4");
        if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice04_1309").NPCState))
            FCharacterUniqueName(n"SC_NOV_Novice04_1309").NPCState.TeleportToWaypointAndExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Novice04_1309_AfterRitual::StaticClass(),n"FP_SC_PROPHECY_END_1");
        if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice18_1325").NPCState))
            FCharacterUniqueName(n"SC_NOV_Novice18_1325").NPCState.TeleportToWaypointAndExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Novice18_1325_Start::StaticClass(),n"IO_SC_BENCH_27");
        if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice25_1336").NPCState))
            FCharacterUniqueName(n"SC_NOV_Novice25_1336").NPCState.TeleportToWaypointAndExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Novice25_1336_AfterRitual::StaticClass(),n"FP_SC_PROPHECY_49");
        if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice07_1314").NPCState))
        {
            FCharacterUniqueName(n"SC_NOV_Novice07_1314").NPCState.TeleportToWaypointAndExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Novice07_1314_Start::StaticClass(),n"FP_SC_SMOKE_02");
            FCharacterUniqueName(n"SC_NOV_Novice07_1314").NPCState.RemoveImmortality();
        }
        if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice05_1311").NPCState))
            FCharacterUniqueName(n"SC_NOV_Novice05_1311").NPCState.TeleportToWaypointAndExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Novice05_1311_Start::StaticClass(),n"FP_SC_SMALLTALK_04");
        if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice09_1316").NPCState))
        {   
            FCharacterUniqueName(n"SC_NOV_Novice09_1316").NPCState.TeleportToWaypointAndExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Novice09_1316_Start::StaticClass(),n"FP_SC_PROPHECY_35");
            FCharacterUniqueName(n"SC_NOV_Novice09_1316").NPCState.RemoveImmortality();
        }
        if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice30_1341").NPCState))
        {
            FCharacterUniqueName(n"SC_NOV_Novice30_1341").NPCState.TeleportToWaypointAndExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Novice30_1341_AfterRitual::StaticClass(),n"FP_SC_PROPHECY_36");
            FCharacterUniqueName(n"SC_NOV_Novice30_1341").NPCState.RemoveImmortality();
        }
        if(IsValid(FCharacterUniqueName(n"SC_GUR_BaalTyon_1210").NPCState))
        {
            FCharacterUniqueName(n"SC_GUR_BaalTyon_1210").NPCState.TeleportToWaypointAndExchangeDailyRoutineToClass(UDailyRoutine_SC_GUR_BaalTyon_1210_AfterRitual::StaticClass(),n"FP_SC_PREACHING_01");
            FCharacterUniqueName(n"SC_GUR_BaalTyon_1210").NPCState.RemoveImmortality();
        }
            
        if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice19_1326").NPCState))
        {
            FCharacterUniqueName(n"SC_NOV_Novice19_1326").NPCState.TeleportToWaypointAndExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Novice19_1326_AfterRitual::StaticClass(),n"FP_SC_LISTEN_04");
            FCharacterUniqueName(n"SC_NOV_Novice19_1326").NPCState.RemoveImmortality();
        }
        if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice10_1317").NPCState))
            FCharacterUniqueName(n"SC_NOV_Novice10_1317").NPCState.TeleportToWaypointAndExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Novice10_1317_AfterRitual::StaticClass(),n"FP_SC_PROPHECY_25");
        if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice23_1334").NPCState))
            FCharacterUniqueName(n"SC_NOV_Novice23_1334").NPCState.TeleportToWaypointAndExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Novice23_1334_AfterRitual::StaticClass(),n"FP_SC_PROPHECY_11");
        if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice13_1320").NPCState))
            FCharacterUniqueName(n"SC_NOV_Novice13_1320").NPCState.TeleportToWaypointAndExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Novice13_1320_Start::StaticClass(),n"FP_SC_SMALLTALK_05");
        if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice28_1339").NPCState))
            FCharacterUniqueName(n"SC_NOV_Novice28_1339").NPCState.TeleportToWaypointAndExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Novice28_1339_AfterRitual::StaticClass(),n"FP_SC_PROPHECY_43");
        if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice36_1347").NPCState))
        {
            FCharacterUniqueName(n"SC_NOV_Novice36_1347").NPCState.TeleportToWaypointAndExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Novice36_1347_Start::StaticClass(),n"FP_SC_SMALLTALK_07");
            FCharacterUniqueName(n"SC_NOV_Novice36_1347").NPCState.RemoveImmortality();
        }
        if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice24_1335").NPCState))
        {
            FCharacterUniqueName(n"SC_NOV_Novice24_1335").NPCState.TeleportToWaypointAndExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Novice24_1335_AfterRitual::StaticClass(),n"FP_SC_PROPHECY_44");
            FCharacterUniqueName(n"SC_NOV_Novice24_1335").NPCState.RemoveImmortality();
        }
        if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice43_1355").NPCState))
        {
            FCharacterUniqueName(n"SC_NOV_Novice43_1355").NPCState.TeleportToWaypointAndExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Novice43_1355_AfterRitual::StaticClass(),n"FP_SC_PROPHECY_45");
            FCharacterUniqueName(n"SC_NOV_Novice43_1355").NPCState.RemoveImmortality();
        }
        if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice16_1323").NPCState))
            FCharacterUniqueName(n"SC_NOV_Novice16_1323").NPCState.TeleportToWaypointAndExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Novice16_1323_AfterRitual::StaticClass(),n"FP_SC_PROPHECY_46");

        if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice14_1321").NPCState))
            FCharacterUniqueName(n"SC_NOV_Novice14_1321").NPCState.TeleportToSpot(n"FP_SC_PROPHECY_13");
        if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice31_1342").NPCState))
            FCharacterUniqueName(n"SC_NOV_Novice31_1342").NPCState.TeleportToSpot(n"FP_SC_PROPHECY_14");
        if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice40_1351").NPCState))
        {
            FCharacterUniqueName(n"SC_NOV_Novice40_1351").NPCState.TeleportToSpot(n"FP_SC_PROPHECY_18");
            FCharacterUniqueName(n"SC_NOV_Novice40_1351").NPCState.RemoveImmortality();
        }
        if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice42_1354").NPCState))
            FCharacterUniqueName(n"SC_NOV_Novice42_1354").NPCState.TeleportToSpot(n"FP_SC_PROPHECY_26");
        if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice17_1324").NPCState))
            FCharacterUniqueName(n"SC_NOV_Novice17_1324").NPCState.TeleportToSpot(n"FP_SC_PROPHECY_27");
        if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice06_1313").NPCState))
            FCharacterUniqueName(n"SC_NOV_Novice06_1313").NPCState.TeleportToSpot(n"FP_SC_PROPHECY_28");
        if(IsValid(FCharacterUniqueName(n"SC_NOV_Novice20_1327").NPCState))
            FCharacterUniqueName(n"SC_NOV_Novice20_1327").NPCState.TeleportToSpot(n"WP_SC_PROPHECY_16");


        FCharacterUniqueName(n"SC_GUR_CorAngar_1202").NPCState.RemoveImmortality();
        FCharacterUniqueName(n"SC_GUR_YBerion_1200").NPCState.RemoveImmortality();
        FCharacterUniqueName(n"SC_NOV_Novice03_1308").NPCState.RemoveImmortality();
        FCharacterUniqueName(n"SC_NOV_Novice08_1315").NPCState.RemoveImmortality();
        FCharacterUniqueName(n"SC_NOV_Novice26_1337").NPCState.RemoveImmortality();
        FCharacterUniqueName(n"SC_NOV_Novice29_1340").NPCState.RemoveImmortality();
        FCharacterUniqueName(n"SC_TPL_Templar24_1441").NPCState.RemoveImmortality();
        FCharacterUniqueName(n"SC_TPL_Templar25_1442").NPCState.RemoveImmortality();

        G1R::UStoryG1R::Get().YberionInvocation();
    }
}

////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////

class UFireMagesCinematic : UGothicCinematicBase 
{
    default LevelSequenceAsset = n"LevelSequence'/Game/Cinematics/CUTSCENES/3_FiremagesExecution_Cutscene/1_SEQUENCES/LS_CS_FiremagesExecution_MASTER.LS_CS_FiremagesExecution_MASTER'";

    default CinematicDataLayers.AddUnique(TSoftObjectPtr<UDataLayerAsset>(n"DataLayerAsset'/Game/Maps/MainMap/DataLayers/MainMap/Cinematics_FiremagesExecution.Cinematics_FiremagesExecution'"));
    default TeleportToCinematicWP = n"QuickTeleport_Cinematic_FireMages";

    FOverrideTimeByRange time1;
    default time1.From = FClockTime(05,49);
    default time1.To = FClockTime(06,59);
    default time1.Time = FClockTime(06,12);
    default OverrideTimeByRange.Add(time1);
    FOverrideTimeByRange time2;
    default time2.From = FClockTime(06,59);
    default time2.To = FClockTime(18,58);
    default time2.Time = FClockTime(12,30);
    default OverrideTimeByRange.Add(time2);
    FOverrideTimeByRange time3;
    default time3.From = FClockTime(18,58);
    default time3.To = FClockTime(20,02);
    default time3.Time = FClockTime(06,12);
    default OverrideTimeByRange.Add(time3);
    FOverrideTimeByRange time4;
    default time4.From = FClockTime(20,02);
    default time4.To = FClockTime(05,49);
    default time4.Time = FClockTime(22,00);
    default OverrideTimeByRange.Add(time4);



    //Story Logic Before Cinematic
    UFUNCTION(BlueprintOverride)
    void SetupBeforeSequence()
    {
                
        if(IsValid(FCharacterUniqueName(n"OC_KDF_Milten").NPCState))
            FCharacterUniqueName(n"OC_KDF_Milten").NPCState.TeleportToSpot(n"WP_OC_CS3_Milten_Start");

        if(IsValid(FCharacterUniqueName(n"OC_EBR_Gomez_100").NPCState))
        {
            FCharacterUniqueName(n"OC_EBR_Gomez_100").NPCState.TeleportToSpot(n"WP_OC_CS3_Gomez_Start");
            FCharacterUniqueName(n"OC_EBR_Gomez_100").NPCState.AddItemToInventory(UArmor_OC_EBR_Gomez_100,1);
            FCharacterUniqueName(n"OC_EBR_Gomez_100").NPCState.Inventory.EquipArmorOfClass(UArmor_OC_EBR_Gomez_100); 
        }
        if(IsValid(FCharacterUniqueName(n"OC_KDF_Corristo_402").NPCState))
            FCharacterUniqueName(n"OC_KDF_Corristo_402").NPCState.TeleportToSpot(n"FP_OC_STAND_YARD_3");
        if(IsValid(FCharacterUniqueName(n"OC_GRD_Guard09_225").NPCState))
            FCharacterUniqueName(n"OC_GRD_Guard09_225").NPCState.TeleportToSpot(n"FP_OC_STAND_YARD_9");
        if(IsValid(FCharacterUniqueName(n"OC_GRD_Guard11_227").NPCState))
            FCharacterUniqueName(n"OC_GRD_Guard11_227").NPCState.TeleportToSpot(n"FP_OC_STAND_YARD_10");
        if(IsValid(FCharacterUniqueName(n"OC_GRD_Guard16_232").NPCState))
            FCharacterUniqueName(n"OC_GRD_Guard16_232").NPCState.TeleportToSpot(n"FP_OC_STAND_YARD_8");
        if(IsValid(FCharacterUniqueName(n"OC_GRD_Guard15_231").NPCState))
            FCharacterUniqueName(n"OC_GRD_Guard15_231").NPCState.TeleportToSpot(n"FP_OC_STAND_YARD_11");
        if(IsValid(FCharacterUniqueName(n"OC_GRD_Guard26_252").NPCState))
            FCharacterUniqueName(n"OC_GRD_Guard26_252").NPCState.TeleportToSpot(n"FP_OC_STAND_YARD_7");
        if(IsValid(FCharacterUniqueName(n"OC_GRD_Guard04_218").NPCState))
            FCharacterUniqueName(n"OC_GRD_Guard04_218").NPCState.TeleportToSpot(n"FP_OC_GUARDPASSAGE_05");
        if(IsValid(FCharacterUniqueName(n"OC_GRD_Guard25_245").NPCState))
            FCharacterUniqueName(n"OC_GRD_Guard25_245").NPCState.TeleportToSpot(n"FP_OC_GUARDPASSAGE_04");
        if(IsValid(FCharacterUniqueName(n"OC_GRD_Guard02_206").NPCState))
            FCharacterUniqueName(n"OC_GRD_Guard02_206").NPCState.TeleportToSpot(n"WP_OC_CS3_Guard_1");
        if(IsValid(FCharacterUniqueName(n"OC_GRD_Guard10_226").NPCState))
            FCharacterUniqueName(n"OC_GRD_Guard10_226").NPCState.TeleportToSpot(n"WP_OC_CS3_Guard_2");
        if(IsValid(FCharacterUniqueName(n"OC_GRD_Guard03_209").NPCState))        
            FCharacterUniqueName(n"OC_GRD_Guard03_209").NPCState.TeleportToSpot(n"WP_OC_CS3_Guard_3");
        if(IsValid(FCharacterUniqueName(n"OC_KDF_Rodriguez_400").NPCState))
            FCharacterUniqueName(n"OC_KDF_Rodriguez_400").NPCState.TeleportToSpot(n"FP_OC_STAND_YARD_2");
        if(IsValid(FCharacterUniqueName(n"OC_KDF_Torrez_405").NPCState))
            FCharacterUniqueName(n"OC_KDF_Torrez_405").NPCState.TeleportToSpot(n"FP_OC_STAND_YARD_4");
        if(IsValid(FCharacterUniqueName(n"OC_KDF_Drago_403").NPCState))
            FCharacterUniqueName(n"OC_KDF_Drago_403").NPCState.TeleportToSpot(n"FP_OC_STAND_YARD_1");
        if(IsValid(FCharacterUniqueName(n"OC_KDF_Damarok_401").NPCState))
            FCharacterUniqueName(n"OC_KDF_Damarok_401").NPCState.TeleportToSpot(n"FP_OC_STAND_YARD_5");  

        // UWeatherSubsystem Weather = UWeatherSubsystem::Get();
        // if (Weather != nullptr)
        // {
        //     //Weather.FreezeSkyTime(FInGameTime::Make(0,11,30,0));
        //     Weather.SetPlayerWeatherImmediate(EWeather::Rain_Level3);
        // }  
    }

    UFUNCTION(BlueprintOverride)
    void SetupAfterActorsReady()
    {
        if(IsValid(FCharacterUniqueName(n"OC_EBR_Gomez_100").NPCState))
        {
            FCharacterUniqueName(n"OC_EBR_Gomez_100").NPCState.RemoveImmortality();
            FCharacterUniqueName(n"OC_EBR_Gomez_100").CharacterState.HideInventoryType(true, EInventoryTypes::MeleeSlot);
        }

        if(IsValid(FCharacterUniqueName(n"OC_GRD_Guard09_225").NPCState))
        {
            FCharacterUniqueName(n"OC_GRD_Guard09_225").CharacterState.HideInventoryType(true, EInventoryTypes::MeleeSlot);
            FCharacterUniqueName(n"OC_GRD_Guard09_225").CharacterState.HideInventoryType(true, EInventoryTypes::RangedSlot);
            FCharacterUniqueName(n"OC_GRD_Guard09_225").NPCState.RemoveImmortality();
        }

        if(IsValid(FCharacterUniqueName(n"OC_GRD_Guard11_227").NPCState))
        {
            FCharacterUniqueName(n"OC_GRD_Guard11_227").CharacterState.HideInventoryType(true, EInventoryTypes::MeleeSlot);
            FCharacterUniqueName(n"OC_GRD_Guard11_227").CharacterState.HideInventoryType(true, EInventoryTypes::RangedSlot);
            FCharacterUniqueName(n"OC_GRD_Guard11_227").NPCState.RemoveImmortality();
        }

        if(IsValid(FCharacterUniqueName(n"OC_GRD_Guard16_232").NPCState))
        {
            FCharacterUniqueName(n"OC_GRD_Guard16_232").CharacterState.HideInventoryType(true, EInventoryTypes::MeleeSlot);
            FCharacterUniqueName(n"OC_GRD_Guard16_232").CharacterState.HideInventoryType(true, EInventoryTypes::RangedSlot);
            FCharacterUniqueName(n"OC_GRD_Guard16_232").NPCState.RemoveImmortality();
        }

        if(IsValid(FCharacterUniqueName(n"OC_GRD_Guard15_231").NPCState))
        {
            FCharacterUniqueName(n"OC_GRD_Guard15_231").CharacterState.HideInventoryType(true, EInventoryTypes::MeleeSlot);
            FCharacterUniqueName(n"OC_GRD_Guard15_231").CharacterState.HideInventoryType(true, EInventoryTypes::RangedSlot);
            FCharacterUniqueName(n"OC_GRD_Guard15_231").NPCState.RemoveImmortality();
        }

        if(IsValid(FCharacterUniqueName(n"OC_GRD_Guard26_252").NPCState))
        {
            FCharacterUniqueName(n"OC_GRD_Guard26_252").CharacterState.HideInventoryType(true, EInventoryTypes::MeleeSlot);
            FCharacterUniqueName(n"OC_GRD_Guard26_252").CharacterState.HideInventoryType(true, EInventoryTypes::RangedSlot);
            FCharacterUniqueName(n"OC_GRD_Guard26_252").NPCState.RemoveImmortality();
        }

        if(IsValid(FCharacterUniqueName(n"OC_GRD_Guard04_218").NPCState))
        {
            FCharacterUniqueName(n"OC_GRD_Guard04_218").CharacterState.HideInventoryType(true, EInventoryTypes::MeleeSlot);
            FCharacterUniqueName(n"OC_GRD_Guard04_218").CharacterState.HideInventoryType(true, EInventoryTypes::RangedSlot);
            FCharacterUniqueName(n"OC_GRD_Guard04_218").NPCState.RemoveImmortality();
        }

        if(IsValid(FCharacterUniqueName(n"OC_GRD_Guard25_245").NPCState))
        {
            FCharacterUniqueName(n"OC_GRD_Guard25_245").CharacterState.HideInventoryType(true, EInventoryTypes::MeleeSlot);
            FCharacterUniqueName(n"OC_GRD_Guard25_245").CharacterState.HideInventoryType(true, EInventoryTypes::RangedSlot);
            FCharacterUniqueName(n"OC_GRD_Guard25_245").NPCState.RemoveImmortality();
        }
            
        if(IsValid(FCharacterUniqueName(n"OC_GRD_Guard02_206").NPCState))
        {
            FCharacterUniqueName(n"OC_GRD_Guard02_206").CharacterState.HideInventoryType(true, EInventoryTypes::MeleeSlot);
            FCharacterUniqueName(n"OC_GRD_Guard02_206").CharacterState.HideInventoryType(true, EInventoryTypes::RangedSlot);
            FCharacterUniqueName(n"OC_GRD_Guard02_206").NPCState.RemoveImmortality();
        }
        if(IsValid(FCharacterUniqueName(n"OC_GRD_Guard10_226").NPCState))
        {
            FCharacterUniqueName(n"OC_GRD_Guard10_226").CharacterState.HideInventoryType(true, EInventoryTypes::MeleeSlot);
            FCharacterUniqueName(n"OC_GRD_Guard10_226").CharacterState.HideInventoryType(true, EInventoryTypes::RangedSlot);
            FCharacterUniqueName(n"OC_GRD_Guard10_226").NPCState.RemoveImmortality();
        }
            

        if(IsValid(FCharacterUniqueName(n"OC_GRD_Guard03_209").NPCState))
        {
            FCharacterUniqueName(n"OC_GRD_Guard03_209").CharacterState.HideInventoryType(true, EInventoryTypes::MeleeSlot);
            FCharacterUniqueName(n"OC_GRD_Guard03_209").CharacterState.HideInventoryType(true, EInventoryTypes::RangedSlot);
            FCharacterUniqueName(n"OC_GRD_Guard03_209").NPCState.RemoveImmortality();
        }

        if(IsValid(FCharacterUniqueName(n"OC_GRD_Fletcher_255").NPCState))
            FCharacterUniqueName(n"OC_GRD_Fletcher_255").NPCState.RemoveImmortality();
        if(IsValid(FCharacterUniqueName(n"OC_GRD_Thorus_200").NPCState))
            FCharacterUniqueName(n"OC_GRD_Thorus_200").NPCState.RemoveImmortality();
        if(IsValid(FCharacterUniqueName(n"OC_KDF_Corristo_402").NPCState))
            FCharacterUniqueName(n"OC_KDF_Corristo_402").NPCState.RemoveImmortality();
        if(IsValid(FCharacterUniqueName(n"OC_KDF_Damarok_401").NPCState))
            FCharacterUniqueName(n"OC_KDF_Damarok_401").NPCState.RemoveImmortality();
        if(IsValid(FCharacterUniqueName(n"OC_KDF_Drago_403").NPCState))
            FCharacterUniqueName(n"OC_KDF_Drago_403").NPCState.RemoveImmortality();
        if(IsValid(FCharacterUniqueName(n"OC_KDF_Rodriguez_400").NPCState))
            FCharacterUniqueName(n"OC_KDF_Rodriguez_400").NPCState.RemoveImmortality();
        if(IsValid(FCharacterUniqueName(n"OC_KDF_Torrez_405").NPCState))
            FCharacterUniqueName(n"OC_KDF_Torrez_405").NPCState.RemoveImmortality();
        if(IsValid(FCharacterUniqueName(n"OC_EBR_Bartholo_106").NPCState))
            FCharacterUniqueName(n"OC_EBR_Bartholo_106").NPCState.RemoveImmortality();
        if(IsValid(FCharacterUniqueName(n"NC_ORG_Buster_833").NPCState))
            FCharacterUniqueName(n"NC_ORG_Buster_833").NPCState.RemoveImmortality();
        if(IsValid(FCharacterUniqueName(n"NC_ORG_Cipher_873").NPCState))
            FCharacterUniqueName(n"NC_ORG_Cipher_873").NPCState.RemoveImmortality();
        if(IsValid(FCharacterUniqueName(n"NC_ORG_Lares_801").NPCState))
            FCharacterUniqueName(n"NC_ORG_Lares_801").NPCState.RemoveImmortality();
        if(IsValid(FCharacterUniqueName(n"NC_ORG_Wolf_855").NPCState))
            FCharacterUniqueName(n"NC_ORG_Wolf_855").NPCState.RemoveImmortality();
        if(IsValid(FCharacterUniqueName(n"NC_SLD_Cord_709").NPCState))
            FCharacterUniqueName(n"NC_SLD_Cord_709").NPCState.RemoveImmortality();
        if(IsValid(FCharacterUniqueName(n"NC_SLD_Jarvis_728").NPCState))
            FCharacterUniqueName(n"NC_SLD_Jarvis_728").NPCState.RemoveImmortality();
        if(IsValid(FCharacterUniqueName(n"NC_SLD_Lee_700").NPCState))
            FCharacterUniqueName(n"NC_SLD_Lee_700").NPCState.RemoveImmortality();
        if(IsValid(FCharacterUniqueName(n"NC_SLD_Orik_701").NPCState))
            FCharacterUniqueName(n"NC_SLD_Orik_701").NPCState.RemoveImmortality();
        if(IsValid(FCharacterUniqueName(n"NC_SLD_Torlof_737").NPCState))
            FCharacterUniqueName(n"NC_SLD_Torlof_737").NPCState.RemoveImmortality();
        if(IsValid(FCharacterUniqueName(n"OC_EBR_Raven_105").NPCState))
            FCharacterUniqueName(n"OC_EBR_Raven_105").NPCState.RemoveImmortality();
        if(IsValid(FCharacterUniqueName(n"OM_VLK_Grimes_586").NPCState))
            FCharacterUniqueName(n"OM_VLK_Grimes_586").NPCState.RemoveImmortality();
    }

    //Story Logic After Cinematic
    UFUNCTION(BlueprintOverride)
    void SetupAfterSequence()
    {
        G1R::UStoryG1R::Get().FireMagesCinematic();

        if(IsValid(FCharacterUniqueName(n"OC_EBR_Gomez_100").NPCState)){
            FCharacterUniqueName(n"OC_EBR_Gomez_100").CharacterState.HideInventoryType(false, EInventoryTypes::MeleeSlot);
            FCharacterUniqueName(n"OC_EBR_Gomez_100").NPCState.Inventory.UnequipArmor();
        }
        
        if(IsValid(FCharacterUniqueName(n"OC_GRD_Guard09_225").NPCState)){
            FCharacterUniqueName(n"OC_GRD_Guard09_225").CharacterState.HideInventoryType(false, EInventoryTypes::MeleeSlot);
            FCharacterUniqueName(n"OC_GRD_Guard09_225").CharacterState.HideInventoryType(false, EInventoryTypes::RangedSlot);
        }
        if(IsValid(FCharacterUniqueName(n"OC_GRD_Guard11_227").NPCState)){
            FCharacterUniqueName(n"OC_GRD_Guard11_227").CharacterState.HideInventoryType(false, EInventoryTypes::MeleeSlot);
            FCharacterUniqueName(n"OC_GRD_Guard11_227").CharacterState.HideInventoryType(false, EInventoryTypes::RangedSlot);
        }
        if(IsValid(FCharacterUniqueName(n"OC_GRD_Guard16_232").NPCState)){
            FCharacterUniqueName(n"OC_GRD_Guard16_232").CharacterState.HideInventoryType(false, EInventoryTypes::RangedSlot);
            FCharacterUniqueName(n"OC_GRD_Guard16_232").CharacterState.HideInventoryType(false, EInventoryTypes::MeleeSlot);
        }
        if(IsValid(FCharacterUniqueName(n"OC_GRD_Guard15_231").NPCState)){
            FCharacterUniqueName(n"OC_GRD_Guard15_231").CharacterState.HideInventoryType(false, EInventoryTypes::MeleeSlot);
            FCharacterUniqueName(n"OC_GRD_Guard15_231").CharacterState.HideInventoryType(false, EInventoryTypes::RangedSlot);
        }
        if(IsValid(FCharacterUniqueName(n"OC_GRD_Guard26_252").NPCState)){
            FCharacterUniqueName(n"OC_GRD_Guard26_252").CharacterState.HideInventoryType(false, EInventoryTypes::MeleeSlot);
            FCharacterUniqueName(n"OC_GRD_Guard26_252").CharacterState.HideInventoryType(false, EInventoryTypes::RangedSlot);
        }

        if(IsValid(FCharacterUniqueName(n"OC_GRD_Guard04_218").NPCState)){
            FCharacterUniqueName(n"OC_GRD_Guard04_218").CharacterState.HideInventoryType(false, EInventoryTypes::MeleeSlot);
            FCharacterUniqueName(n"OC_GRD_Guard04_218").CharacterState.HideInventoryType(false, EInventoryTypes::RangedSlot);
        }
        if(IsValid(FCharacterUniqueName(n"OC_GRD_Guard25_245").NPCState)){
            FCharacterUniqueName(n"OC_GRD_Guard25_245").CharacterState.HideInventoryType(false, EInventoryTypes::MeleeSlot);
            FCharacterUniqueName(n"OC_GRD_Guard25_245").CharacterState.HideInventoryType(false, EInventoryTypes::RangedSlot);
        }
        if(IsValid(FCharacterUniqueName(n"OC_GRD_Guard02_206").NPCState)){
            FCharacterUniqueName(n"OC_GRD_Guard02_206").CharacterState.HideInventoryType(false, EInventoryTypes::MeleeSlot);
            FCharacterUniqueName(n"OC_GRD_Guard02_206").CharacterState.HideInventoryType(false, EInventoryTypes::RangedSlot);
        }
        if(IsValid(FCharacterUniqueName(n"OC_GRD_Guard10_226").NPCState)){
            FCharacterUniqueName(n"OC_GRD_Guard10_226").CharacterState.HideInventoryType(false, EInventoryTypes::MeleeSlot);
            FCharacterUniqueName(n"OC_GRD_Guard10_226").CharacterState.HideInventoryType(false, EInventoryTypes::RangedSlot);
        }
        if(IsValid(FCharacterUniqueName(n"OC_GRD_Guard03_209").NPCState)){
            FCharacterUniqueName(n"OC_GRD_Guard03_209").CharacterState.HideInventoryType(false, EInventoryTypes::MeleeSlot);
            FCharacterUniqueName(n"OC_GRD_Guard03_209").CharacterState.HideInventoryType(false, EInventoryTypes::RangedSlot);
        }

        TSoftObjectPtr<UFMODEvent> FiremageMusicOverrideEvent = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/MUSIC/Cutscenes/MUSIC_fireMagesDeath.MUSIC_fireMagesDeath'";
        U2DAudioSubsystem::Get().PlayOneShot(FiremageMusicOverrideEvent);

        if(IsValid(FCharacterUniqueName(n"NC_SLD_Torlof_737").NPCState))
        {
            FCharacterUniqueName(n"NC_SLD_Torlof_737").CharacterState.ExchangeDailyRoutineToClass(UDailyRoutine_NC_SLD_Torlof_737_FMReport::StaticClass());
        }

        if(IsValid(FCharacterUniqueName(n"NC_SLD_Mercenary03_705").NPCState))
        {
            FCharacterUniqueName(n"NC_SLD_Mercenary03_705").CharacterState.ExchangeDailyRoutineToClass(UDailyRoutine_NC_SLD_Mercenary03_705_FMReport::StaticClass());
        }
    }       
}


////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////

class UUrizielCinematic : UGothicCinematicBase 
{
    default LevelSequenceAsset = n"/Script/LevelSequence.LevelSequence'/Game/Cinematics/CUTSCENES/4_UrizielCharge_Cutscene/1_SEQUENCES/LS_CS_URIZIEL_MASTER.LS_CS_URIZIEL_MASTER'";

    default CinematicDataLayers.AddUnique(TSoftObjectPtr<UDataLayerAsset>(n"DataLayerAsset'/Game/Maps/MainMap/DataLayers/MainMap/Cinematics_UrizielCharge.Cinematics_UrizielCharge'"));
    default TeleportToCinematicWP = n"QuickTeleport_Cinematic_ChargingUriziel";

    //Story Logic Before Cinematic
    UFUNCTION(BlueprintOverride)
    void SetupBeforeSequence()
    {
        // FCharacterUniqueName(n"NC_ORG_Rogue27_876").NPCState.TeleportToSpot(n"WP_NC_CS_URIZIEL_1");
        // FCharacterUniqueName(n"NC_ORG_Rogue18_831").NPCState.TeleportToSpot(n"WP_NC_CS_URIZIEL_2");

        if(IsValid(FCharacterUniqueName(n"NC_KDW_Myxir_601").NPCState))
            FCharacterUniqueName(n"NC_KDW_Myxir_601").NPCState.TeleportToSpot(n"WP_NC_CS_URIZIEL_3");
        if(IsValid(FCharacterUniqueName(n"NC_KDW_Merdarion_602").NPCState))
            FCharacterUniqueName(n"NC_KDW_Merdarion_602").NPCState.TeleportToSpot(n"WP_NC_CS_URIZIEL_4");
        if(IsValid(FCharacterUniqueName(n"NC_KDW_Nefarius_603").NPCState))
            FCharacterUniqueName(n"NC_KDW_Nefarius_603").NPCState.TeleportToSpot(n"WP_NC_CS_URIZIEL_5");
        if(IsValid(FCharacterUniqueName(n"NC_KDW_Riordian_605").NPCState))
            FCharacterUniqueName(n"NC_KDW_Riordian_605").NPCState.TeleportToSpot(n"WP_NC_CS_URIZIEL_6");

        // FCharacterUniqueName(n"NC_ORG_Rogue03_806").NPCState.TeleportToSpot(n"WP_NC_CS_URIZIEL_7");
        // FCharacterUniqueName(n"NC_ORG_Rogue06_811").NPCState.TeleportToSpot(n"WP_NC_CS_URIZIEL_8");
        // FCharacterUniqueName(n"NC_ORG_Rogue22_837").NPCState.TeleportToSpot(n"WP_NC_CS_URIZIEL_11");
        // FCharacterUniqueName(n"NC_SLD_Mercenary07_710").NPCState.TeleportToSpot(n"WP_NC_CS_URIZIEL_9");
        // FCharacterUniqueName(n"NC_ORG_Rogue09_817").NPCState.TeleportToSpot(n"WP_NC_CS_URIZIEL_10");
        // FCharacterUniqueName(n"NC_SLD_Torlof_737").NPCState.TeleportToSpot(n"FP_NC_SMALLTALK_07");
        // FCharacterUniqueName(n"NC_SLD_Mercenary13_730").NPCState.TeleportToSpot(n"FP_NC_SMALLTALK_06");
    }

    UFUNCTION(BlueprintOverride)
    void SetupAfterActorsReady()
    {
        FCharacterUniqueName(n"Hero").CharacterState.HideInventoryType(true, EInventoryTypes::MeleeSlot);
    }

    //Story Logic After Cinematic
    UFUNCTION(BlueprintOverride)
    void SetupAfterSequence()
    {
        G1R::Quest::SleeperTemple_STCHAPTER5_URIZIEL_URIZIEL_CINEMATIC.SucceedQuest();

        if(IsValid(FCharacterUniqueName(n"NC_KDW_Merdarion_602").NPCState))
            FCharacterUniqueName(n"NC_KDW_Merdarion_602").NPCState.RemoveImmortality();
        if(IsValid(FCharacterUniqueName(n"NC_KDW_Myxir_601").NPCState))
            FCharacterUniqueName(n"NC_KDW_Myxir_601").NPCState.RemoveImmortality();
        if(IsValid(FCharacterUniqueName(n"NC_KDW_Nefarius_603").NPCState))
            FCharacterUniqueName(n"NC_KDW_Nefarius_603").NPCState.RemoveImmortality();    
        if(IsValid(FCharacterUniqueName(n"NC_KDW_Riordian_605").NPCState))
            FCharacterUniqueName(n"NC_KDW_Riordian_605").NPCState.RemoveImmortality();
        if(IsValid(FCharacterUniqueName(n"NC_ORG_Rogue03_806").NPCState))
            FCharacterUniqueName(n"NC_ORG_Rogue03_806").NPCState.RemoveImmortality();
        if(IsValid(FCharacterUniqueName(n"NC_ORG_Rogue06_811").NPCState))
            FCharacterUniqueName(n"NC_ORG_Rogue06_811").NPCState.RemoveImmortality();
        if(IsValid(FCharacterUniqueName(n"NC_ORG_Rogue18_831").NPCState))
            FCharacterUniqueName(n"NC_ORG_Rogue18_831").NPCState.RemoveImmortality();
        if(IsValid(FCharacterUniqueName(n"SC_TPL_GorNaRan_1405").NPCState))
            FCharacterUniqueName(n"SC_TPL_GorNaRan_1405").NPCState.RemoveImmortality();
        if(IsValid(FCharacterUniqueName(n"NC_KDW_Saturas_600").NPCState))
            FCharacterUniqueName(n"NC_KDW_Saturas_600").NPCState.RemoveImmortality();
        if(IsValid(FCharacterUniqueName(n"UL_OSL_UrShak_2200").NPCState))
            FCharacterUniqueName(n"UL_OSL_UrShak_2200").NPCState.RemoveImmortality(); 

        if(IsValid(FCharacterUniqueName(n"OC_KDF_Milten").NPCState))
        {
            FCharacterUniqueName(n"OC_KDF_Milten").CharacterState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_KDF_Milten_WaitOrePile::StaticClass());
            FCharacterUniqueName(n"OC_KDF_Milten").CharacterState.TeleportToSpot(n"FP_NC_OREMOUNT_MILTEN");
        }
        
        if(IsValid(FCharacterUniqueName(n"Hero").CharacterState)){
            FCharacterUniqueName(n"Hero").CharacterState.Character.RemoveItemFromInventory(UItMw_2H_Sword_Uriziel_02,1);
            FCharacterUniqueName(n"Hero").CharacterState.Character.AddItemToInventory(UItMw_2H_Sword_Uriziel_03,1);

            FCharacterUniqueName(n"Hero").CharacterState.TeleportToSpot(n"WP_NC_CS_Uriziel_Hero_End");
            FCharacterUniqueName(n"Hero").CharacterState.HideInventoryType(false, EInventoryTypes::MeleeSlot);
            FCharacterUniqueName(n"Hero").PlayerState.RemoveItemFromInventory(UItMi_UrizielGem_01,1);
            FCharacterUniqueName(n"Hero").PlayerState.RemoveItemFromInventory(UItMi_UrizielGem_02,1);
            FCharacterUniqueName(n"Hero").PlayerState.RemoveItemFromInventory(UItMi_UrizielGem_03,1);
            FCharacterUniqueName(n"Hero").PlayerState.RemoveItemFromInventory(UItMi_UrizielGem_04,1);
            FCharacterUniqueName(n"Hero").PlayerState.RemoveItemFromInventory(UItMi_UrizielGem_05,1);
        }

        if(G1R::Quest::NewCamp_NCCHAPTER4_FINDXARDAS.IsRunning())
        {
            G1R::Quest::NewCamp_NCCHAPTER4_FINDXARDAS.FailQuest();
        }

        if(IsValid(FCharacterUniqueName(n"SC_GUR_CorKalom_1201").NPCState))
        {
            FCharacterUniqueName(n"SC_GUR_CorKalom_1201").NPCState.RemoveFromWorld();
            FCharacterUniqueName(n"SC_GUR_CorKalom_1201").CharacterState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_GUR_CorKalom_1201_Dead::StaticClass());
        }

        G1R::UStoryG1R::Get().SleeperTempleTakenByKalom();

    }
}

////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////

class UExtroCinematic : UGothicCinematicBase 
{
    default LevelSequenceAsset = n"LevelSequence'/Game/Cinematics/CUTSCENES/5_Extro_Cutscene/LS_CS_Extro_MASTER.LS_CS_Extro_MASTER'";

    default CinematicDataLayers.AddUnique(TSoftObjectPtr<UDataLayerAsset>(n"DataLayerAsset'/Game/Maps/MainMap/DataLayers/MainMap/Cinematics_Extro.Cinematics_Extro'"));
    //default TeleportToCinematicWP = n"QuickTeleport_Cinematic_Extro";
    default TeleportToCinematicWP = n"QuickTeleport_SleepersRoom";

    //Story Logic Before Cinematic
    UFUNCTION(BlueprintOverride)
    void SetupBeforeSequence()
    {

    }

    UFUNCTION(BlueprintOverride)
    void SetupAfterActorsReady()
    {
        FCharacterUniqueName(n"Hero").CharacterState.HideInventoryType(true, EInventoryTypes::MeleeSlot);
    }

    //Story Logic After Cinematic
    UFUNCTION(BlueprintOverride)
    void SetupAfterSequence()
    {
        AGothicCharacterState PlayerState = AGothicPlayerState::LocalPlayerState;

        if(!IsValid(PlayerState))
            return;

        auto GTS = UGameTimeSubsystem::Get();

        if(!IsValid(GTS))
        return;

        FMemorizedEvent SleeperDefeatedEvent;
        SleeperDefeatedEvent.EventTags.AddTag(GameplayTag::Memory_Chapter_Completed);
        SleeperDefeatedEvent.Magnitude = 6.0f;
        SleeperDefeatedEvent.Time = GTS.CurrentGameTime;
        SleeperDefeatedEvent.Position = PlayerState.ActorLocation;
        SleeperDefeatedEvent.InstigatorGlobalId = PlayerState.CharacterGlobalId;
        SleeperDefeatedEvent.OptionalClass1 = G1R::UStoryG1R;

        FCharacterUniqueName(n"Hero").CharacterState.LongTermMemory.MemorizeEvent(SleeperDefeatedEvent);

        FCharacterUniqueName(n"Hero").CharacterState.HideInventoryType(false, EInventoryTypes::MeleeSlot);

        // Temporary solution to control which loading screen to show
        auto loadingScreenHelperSubsystem = ULoadingScreenHelperSubsystem::Get();
        if (IsValid(loadingScreenHelperSubsystem))
        {
            loadingScreenHelperSubsystem.SetCurrentLoadingScreenType(ELoadingScreenType::BlackScreen);
        }

        // Go to Credits Screen
        Gameplay::OpenLevel(FName("FinalCreditsMap"));
    }
}

////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////

class UExtroMagicCinematic : UGothicCinematicBase 
{
    default LevelSequenceAsset = n"LevelSequence'/Game/Cinematics/CUTSCENES/5_Extro_Cutscene/LS_CS_Extro_MASTER_MAGIC.LS_CS_Extro_MASTER_MAGIC'";

    default CinematicDataLayers.AddUnique(TSoftObjectPtr<UDataLayerAsset>(n"DataLayerAsset'/Game/Maps/MainMap/DataLayers/MainMap/Cinematics_Extro.Cinematics_Extro'"));
    default TeleportToCinematicWP = n"QuickTeleport_Cinematic_ExtroMagic";
    // default TeleportToCinematicWP = n"QuickTeleport_SleepersRoom";

    //Story Logic Before Cinematic
    UFUNCTION(BlueprintOverride)
    void SetupBeforeSequence()
    {

    }

    UFUNCTION(BlueprintOverride)
    void SetupAfterActorsReady()
    {
        FCharacterUniqueName(n"Hero").CharacterState.HideInventoryType(true, EInventoryTypes::MeleeSlot);
    }

    //Story Logic After Cinematic
    UFUNCTION(BlueprintOverride)
    void SetupAfterSequence()
    {
        AGothicCharacterState PlayerState = AGothicPlayerState::LocalPlayerState;

        if(!IsValid(PlayerState))
            return;

        auto GTS = UGameTimeSubsystem::Get();

        if(!IsValid(GTS))
        return;

        FMemorizedEvent SleeperDefeatedEvent;
        SleeperDefeatedEvent.EventTags.AddTag(GameplayTag::Memory_Chapter_Completed);
        SleeperDefeatedEvent.Magnitude = 6.0f;
        SleeperDefeatedEvent.Time = GTS.CurrentGameTime;
        SleeperDefeatedEvent.Position = PlayerState.ActorLocation;
        SleeperDefeatedEvent.InstigatorGlobalId = PlayerState.CharacterGlobalId;
        SleeperDefeatedEvent.OptionalClass1 = G1R::UStoryG1R;

        FCharacterUniqueName(n"Hero").CharacterState.LongTermMemory.MemorizeEvent(SleeperDefeatedEvent);

        FCharacterUniqueName(n"Hero").CharacterState.HideInventoryType(false, EInventoryTypes::MeleeSlot);

        // Temporary solution to control which loading screen to show
        auto loadingScreenHelperSubsystem = ULoadingScreenHelperSubsystem::Get();
        if (IsValid(loadingScreenHelperSubsystem))
        {
            loadingScreenHelperSubsystem.SetCurrentLoadingScreenType(ELoadingScreenType::BlackScreen);
        }
        // Go to Credit Screen
        Gameplay::OpenLevel(FName("FinalCreditsMap"));
    }
}

////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////

class UNyrasFocusStoneCinematic : UGothicCinematicBase 
{
    default LevelSequenceAsset = n"LevelSequence'/Game/Cinematics/CUTSCENES/SECONDARY/6_NyrasFocusStone/LS_CS_SND_NyrasFocusStone_MASTER.LS_CS_SND_NyrasFocusStone_MASTER'";

    default CinematicDataLayers.AddUnique(TSoftObjectPtr<UDataLayerAsset>(n"DataLayerAsset'/Game/Maps/MainMap/DataLayers/MainMap/Cinematics_NyrasFocus.Cinematics_NyrasFocus'"));
    default TeleportToCinematicWP = n"QuickTeleport_Cinematic_NyrasFocusStone";

    FOverrideTimeByRange time1;
    default time1.From = FClockTime(05,49);
    default time1.To = FClockTime(06,59);
    default time1.Time = FClockTime(06,17);
    default OverrideTimeByRange.Add(time1);
    FOverrideTimeByRange time2;
    default time2.From = FClockTime(06,59);
    default time2.To = FClockTime(18,58);
    default time2.Time = FClockTime(15,30);
    default OverrideTimeByRange.Add(time2);
    FOverrideTimeByRange time3;
    default time3.From = FClockTime(18,58);
    default time3.To = FClockTime(20,02);
    default time3.Time = FClockTime(06,17);
    default OverrideTimeByRange.Add(time3);
    FOverrideTimeByRange time4;
    default time4.From = FClockTime(20,02);
    default time4.To = FClockTime(05,49);
    default time4.Time = FClockTime(22,00);
    default OverrideTimeByRange.Add(time4);

    //Story Logic Before Cinematic
    UFUNCTION(BlueprintOverride)
    void SetupBeforeSequence()
    {
        UWeatherSubsystem Weather = UWeatherSubsystem::Get();
        if (Weather != nullptr && (Weather.PlayerWeather == EWeather::Rain_Level3 || Weather.PlayerWeather == EWeather::Rain_Level2 ))
        {
            //Weather.FreezeSkyTime(FInGameTime::Make(0,11,30,0));
            Weather.SetPlayerWeatherImmediate(EWeather::Rain_Level1);
        }  
    }

    //Story Logic After Cinematic
    UFUNCTION(BlueprintOverride)
    void SetupAfterSequence()
    {
        
        G1R::UStoryG1R::Get().DeactivateStoryDataLayer("NyrasCinematicLogic");
        G1R::UStoryG1R::Get().AfterCinematic_Nyras = 1;

        FCharacterUniqueName(n"Hero").CharacterState.TeleportToSpot(n"WP_CS_NyrasFocusStone_NH_End");

        if(IsValid(FCharacterUniqueName(n"SC_NOV_Nyras_1303").NPCState))
        {
            FCharacterUniqueName(n"SC_NOV_Nyras_1303").NPCState.RemoveImmortality();
            FCharacterUniqueName(n"SC_NOV_Nyras_1303").NPCState.LeavePartyOf(FCharacterUniqueName(n"Hero").CharacterState);
            FCharacterUniqueName(n"SC_NOV_Nyras_1303").NPCState.AddItemToInventory(UItMs_Focus_01);
            FCharacterUniqueName(n"SC_NOV_Nyras_1303").NPCState.TeleportToWaypointAndExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Nyras_1303_AfterCinematic::StaticClass(),n"FP_NYRAS_FOCUS_AFTERCINEMATIC");
        }

        UPuzzlesSubsystem::CallGameplayMessage(GameplayTag::Message_FocusStone_Disable, n"ItMs_Focus_01");
        
    }
}

////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////

class UOldMineExplosionCinematic : UGothicCinematicBase 
{
    default LevelSequenceAsset = n"LevelSequence'/Game/Cinematics/CUTSCENES/SECONDARY/7_OldMineExplosion/LS_CS_SND_OldMineExplosion_MASTER.LS_CS_SND_OldMineExplosion_MASTER'";

    default CinematicDataLayers.AddUnique(TSoftObjectPtr<UDataLayerAsset>(n"DataLayerAsset'/Game/Maps/MainMap/DataLayers/MainMap/Cinematics_OldMineExplosion.Cinematics_OldMineExplosion'"));
    default TeleportToCinematicWP = n"QuickTeleport_Cinematic_OldMineExplosion";

    //Story Logic Before Cinematic
    UFUNCTION(BlueprintOverride)
    void SetupBeforeSequence()
    {
        G1R::UStoryG1R::Get().DeactivateStoryDataLayer("OldMineBlockedPath");
    }

    //Story Logic After Cinematic
    UFUNCTION(BlueprintOverride)
    void SetupAfterSequence()
    {
        G1R::Quest::OldMine_BLOWTHEENTRANCE.SucceedQuest();

        G1R::UStoryG1R::Get().SpawnMinecrawlerTunnelQuest();
        G1R::Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_TUNNEL.SucceedQuest();

        FCharacterUniqueName(n"Hero").CharacterState.TeleportToSpot(n"WP_CS_OldMineExplosion_HERO_END");
        G1R::UStoryG1R::Get().ActivateStoryDataLayer("OldMineBlockedPath_AfterCutscene");

    }
}

////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////

class UUluMuluPresentationCinematic : UGothicCinematicBase 
{
    default LevelSequenceAsset = n"LevelSequence'/Game/Cinematics/CUTSCENES/SECONDARY/8_ULUMULU/LS_CS_SND_ULUMULU_MASTER.LS_CS_SND_ULUMULU_MASTER'";

    default CinematicDataLayers.AddUnique(TSoftObjectPtr<UDataLayerAsset>(n"DataLayerAsset'/Game/Maps/MainMap/DataLayers/MainMap/Cinematics_UluMulu.Cinematics_UluMulu'"));
    default TeleportToCinematicWP = n"QuickTeleport_Cinematic_UluMuluPresentation";

    FOverrideTimeByRange time1;
    default time1.From = FClockTime(05,49);
    default time1.To = FClockTime(06,59);
    default time1.Time = FClockTime(06,15);
    default OverrideTimeByRange.Add(time1);
    FOverrideTimeByRange time2;
    default time2.From = FClockTime(06,59);
    default time2.To = FClockTime(18,58);
    default time2.Time = FClockTime(10,55);
    default OverrideTimeByRange.Add(time2);
    FOverrideTimeByRange time3;
    default time3.From = FClockTime(18,58);
    default time3.To = FClockTime(20,02);
    default time3.Time = FClockTime(06,15);
    default OverrideTimeByRange.Add(time3);
    FOverrideTimeByRange time4;
    default time4.From = FClockTime(20,02);
    default time4.To = FClockTime(05,49);
    default time4.Time = FClockTime(22,00);
    default OverrideTimeByRange.Add(time4);

    //Story Logic Before Cinematic
    UFUNCTION(BlueprintOverride)
    void SetupBeforeSequence()
    {
       
    }
    
    UFUNCTION(BlueprintOverride)
    void SetupAfterActorsReady()
    {
        if(IsValid(FCharacterUniqueName(n"Hero").PlayerState))
            FCharacterUniqueName(n"Hero").PlayerState.HideInventoryType(true, EInventoryTypes::MeleeSlot);
    }

    //Story Logic After Cinematic
    UFUNCTION(BlueprintOverride)
    void SetupAfterSequence()
    {
        if(IsValid(FCharacterUniqueName(n"Hero").PlayerState))
        {
            FCharacterUniqueName(n"Hero").PlayerState.RemoveItemFromInventory(UItMw_2H_Staff_Ulumulu,1);

            FCharacterUniqueName(n"Hero").PlayerState.HideInventoryType(false, EInventoryTypes::MeleeSlot);
            FCharacterUniqueName(n"Hero").PlayerState.TeleportToSpot(n"WP_CS_Ulumulu_HERO_END");
        }

        UPuzzlesSubsystem::GlobalOpenDoor( n"OT_Enter_Door");
        G1R::UStoryG1R::Get().ActivateStoryDataLayer("Cinematics_Ulumulu_AfterCutscene");

        if(IsValid(FCharacterUniqueName(n"OW_OSM_UrNazkrog_2401").NPCState))
        {
            FCharacterUniqueName(n"OW_OSM_UrNazkrog_2401").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OW_OSM_UrNazkrog_2401_Start::StaticClass());
        }

        if(IsValid(FCharacterUniqueName(n"OW_OWR_ToChurnagg_2403").NPCState))
        {
            FCharacterUniqueName(n"OW_OWR_ToChurnagg_2403").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OW_OWR_ToChurnagg_2403_Start::StaticClass());
        }

        G1R::UStoryG1R::Get().ChangeChapter(5);

        if(IsValid(FCharacterUniqueName(n"OW_OSM_UrNazkrog_2401").NPCState))
        {
            FCharacterUniqueName(n"OW_OSM_UrNazkrog_2401").NPCState.RemoveImmortality();
        }
        if(IsValid(FCharacterUniqueName(n"OW_OWR_ToChurnagg_2403").NPCState))
        {
            FCharacterUniqueName(n"OW_OWR_ToChurnagg_2403").NPCState.RemoveImmortality();
        }
        if(IsValid(FCharacterUniqueName(n"OWR_OrcWarriorM09_2022").NPCState))
        {
            FCharacterUniqueName(n"OWR_OrcWarriorM09_2022").NPCState.RemoveImmortality();
        }
        if(IsValid(FCharacterUniqueName(n"OWR_OrcWarriorM10_2023").NPCState))
        {
            FCharacterUniqueName(n"OWR_OrcWarriorM10_2023").NPCState.RemoveImmortality();
        }
        if(IsValid(FCharacterUniqueName(n"OW_OWR_Grazkrak_2400").NPCState))
        {
            FCharacterUniqueName(n"OW_OWR_Grazkrak_2400").NPCState.RemoveImmortality();
        }
        
    }
}

////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////

class USleeperTempleOpeningCinematic : UGothicCinematicBase 
{
    default LevelSequenceAsset = n"LevelSequence'/Game/Cinematics/CUTSCENES/SECONDARY/9_SleeperTempleOpening/LS_CS_SND_SleeperTempleOpening_MASTER.LS_CS_SND_SleeperTempleOpening_MASTER'";

    default CinematicDataLayers.AddUnique(TSoftObjectPtr<UDataLayerAsset>(n"DataLayerAsset'/Game/Maps/MainMap/DataLayers/MainMap/Cinematics_SleeperTempleOpening.Cinematics_SleeperTempleOpening'"));
    default TeleportToCinematicWP = n"QuickTeleport_Cinematic_SleeperTempleOpening";

    //Story Logic Before Cinematic
    UFUNCTION(BlueprintOverride)
    void SetupBeforeSequence()
    {
       
    }

    //Story Logic After Cinematic
    UFUNCTION(BlueprintOverride)
    void SetupAfterSequence()
    {
        G1R::UStoryG1R::Get().AfterCinematic_Sleeper = 1;
        G1R::Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_OBJ_ACCESS.SucceedQuest();

        FCharacterUniqueName(n"Hero").CharacterState.TeleportToSpot(n"WP_CS_SleeperTempleOpening_HERO_END");

        if(G1R::Quest::ORCENCLAVE_THECHAMPIONBURIAL.IsRunning())
        {
            G1R::Quest::ORCENCLAVE_THECHAMPIONBURIAL.FailQuest();
        }

        if(G1R::Quest::ORCENCLAVE_MUKINCURSION.IsRunning())
        {
            G1R::Quest::ORCENCLAVE_MUKINCURSION.FailQuest();
        }
    }
}


////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////

class UFireDemonBloodDoorCinematic : UGothicCinematicBase 
{
    default LevelSequenceAsset = n"LevelSequence'/Game/Cinematics/CUTSCENES/SECONDARY/10_FireDemonBloodDoor/LS_CS_SND_FireDemonBloodDoor_MASTER.LS_CS_SND_FireDemonBloodDoor_MASTER'";

    default CinematicDataLayers.AddUnique(TSoftObjectPtr<UDataLayerAsset>(n"DataLayerAsset'/Game/Maps/MainMap/DataLayers/MainMap/Cinematics_FireDemonBloodDoor.Cinematics_FireDemonBloodDoor'"));
    default TeleportToCinematicWP = n"QuickTeleport_Cinematic_FireDemonBloodDoor";

    //Story Logic Before Cinematic
    UFUNCTION(BlueprintOverride)
    void SetupBeforeSequence()
    {
        UWorldPointManager::Get().CallGlobalEvent(n"OnSleeperBloodPuzzleCompleted");
    }

    //Story Logic After Cinematic
    UFUNCTION(BlueprintOverride)
    void SetupAfterSequence()
    {
        G1R::UStoryG1R::Get().ActivateStoryDataLayer("Cinematics_FireDemon_AfterCutscene");
    }
}


////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////

class UTattooCinematic : UGothicCinematicBase 
{
    default LevelSequenceAsset = n"LevelSequence'/Game/Cinematics/SC_Tattoos+Shaving/LS_CS_TATTOO_MASTER.LS_CS_TATTOO_MASTER'";

    default CinematicDataLayers.AddUnique(TSoftObjectPtr<UDataLayerAsset>(n"DataLayerAsset'/Game/Maps/MainMap/DataLayers/MainMap/Cinematics_Tattoo.Cinematics_Tattoo'"));
    // default TeleportToCinematicWP = n"";

    //Story Logic Before Cinematic
    UFUNCTION(BlueprintOverride)
    void SetupBeforeSequence()
    {
        if(IsValid(FCharacterUniqueName(n"Hero").CharacterState))
        {            
            FCharacterUniqueName(n"Hero").CharacterState.GetCharacter().GetCharacterVisualsComponent().SetNewArmor(UNov_Armor_Cinematic,true);
        }
    }

    UFUNCTION(BlueprintOverride)
    void SetupAfterActorsReady()
    {
        if(IsValid(FCharacterUniqueName(n"Hero").CharacterState))
        {
            FCharacterUniqueName(n"Hero").CharacterState.HideInventoryType(true, EInventoryTypes::MeleeSlot);
            FCharacterUniqueName(n"Hero").CharacterState.HideInventoryType(true, EInventoryTypes::RangedSlot);
        }
    }

    //Story Logic After Cinematic
    UFUNCTION(BlueprintOverride)
    void SetupAfterSequence()
    {
        if(IsValid(FCharacterUniqueName(n"Hero").CharacterState))
        {
            FCharacterUniqueName(n"Hero").CharacterState.GetCharacter().GetCharacterVisualsComponent().SetHasTattoo(true);
            FCharacterUniqueName(n"Hero").CharacterState.GetCharacter().GetCharacterVisualsComponent().RefreshVisuals(true);

            //FGameplayTagContainer tagsToAdd = FGameplayTagContainer();
            //tagsToAdd.AddTag(GameplayTag::Visuals_Humans_Player_Tattoo);
            //FCharacterUniqueName(n"Hero").CharacterState.GetCharacter().GetGothicAbilitySystemComponent().AddLooseTags(tagsToAdd);


            // FGameplayEffectSpecHandle geSpecHandle = sourceAbComp.MakeOutgoingSpec(m_DebuffGE, 1, contextHandle);
            // MagicScript::SetGameplayEffectSpecDuration(geSpecHandle, GetDuration());
            // //FActiveGameplayEffectHandle handle = QuickApplyGEToTarget(targetAbComp, m_DebuffGE, GetDuration());
            // FActiveGameplayEffectHandle handle = sourceAbComp.ApplyGameplayEffectSpecToTarget(geSpecHandle, targetAbComp);



            FCharacterUniqueName(n"Hero").CharacterState.HideInventoryType(false, EInventoryTypes::MeleeSlot);
            FCharacterUniqueName(n"Hero").CharacterState.HideInventoryType(false, EInventoryTypes::RangedSlot);
        }

        if(IsValid(FCharacterUniqueName(n"SC_GUR_BaalNamib_1204").NPCState))
            FCharacterUniqueName(n"SC_GUR_BaalNamib_1204").NPCState.TeleportToSpot(n"WP_SC_CSTattoo_Namib_End");

        if(IsValid(FCharacterUniqueName(n"Hero").PlayerState))
            FCharacterUniqueName(n"Hero").PlayerState.TeleportToSpot(n"WP_SC_CSTattoo_Hero_End");
    }
}





////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////

class UShavingCinematic : UGothicCinematicBase 
{
    default LevelSequenceAsset = n"LevelSequence'/Game/Cinematics/SC_Tattoos+Shaving/LS_CS_SHAVING_MASTER.LS_CS_SHAVING_MASTER'";

    default CinematicDataLayers.AddUnique(TSoftObjectPtr<UDataLayerAsset>(n"DataLayerAsset'/Game/Maps/MainMap/DataLayers/MainMap/Cinematics_ShaveHead.Cinematics_ShaveHead'"));
    // default TeleportToCinematicWP = n"";

    //Story Logic Before Cinematic
    UFUNCTION(BlueprintOverride)
    void SetupBeforeSequence()
    {
    }


    UFUNCTION(BlueprintOverride)
    void SetupAfterActorsReady()
    {
        if(IsValid(FCharacterUniqueName(n"Hero").CharacterState))
        {
            FCharacterUniqueName(n"Hero").CharacterState.HideInventoryType(true, EInventoryTypes::MeleeSlot);
            FCharacterUniqueName(n"Hero").CharacterState.HideInventoryType(true, EInventoryTypes::RangedSlot);
        }
    }

    //Story Logic After Cinematic
    UFUNCTION(BlueprintOverride)
    void SetupAfterSequence()
    {       
        if(IsValid(FCharacterUniqueName(n"Hero").CharacterState))
        {
            FCharacterUniqueName(n"Hero").CharacterState.GetCharacter().GetCharacterVisualsComponent().SetHairPhase(0,true);
            FCharacterUniqueName(n"Hero").CharacterState.GetCharacter().GetCharacterVisualsComponent().RefreshVisuals();


            FCharacterUniqueName(n"Hero").CharacterState.HideInventoryType(false, EInventoryTypes::MeleeSlot);
            FCharacterUniqueName(n"Hero").CharacterState.HideInventoryType(false, EInventoryTypes::RangedSlot);
        }

        if(IsValid(FCharacterUniqueName(n"SC_NOV_Joru_1305").NPCState))
            FCharacterUniqueName(n"SC_NOV_Joru_1305").NPCState.TeleportToSpot(n"WP_SC_CSShave_Joru_End");

        if(IsValid(FCharacterUniqueName(n"Hero").PlayerState))
            FCharacterUniqueName(n"Hero").PlayerState.TeleportToSpot(n"WP_SC_CSShave_Hero_End");
    }
}

class UShavingNoPonyTailCinematic : UShavingCinematic 
{
    default LevelSequenceAsset = n"LevelSequence'/Game/Cinematics/SC_Tattoos+Shaving/LS_CS_SHAVING_MASTER_NoPonytail.LS_CS_SHAVING_MASTER_NoPonytail'";
}

////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////

               
UCLASS(meta=(DisplayName="Cinematic - IntroPt2"))
class URegionTrait_Story_Cinematic_IntroPt2 : UCinematicRegionTrait
{
    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
        UGothicCinematicManagerSubsystemScript::Get().RegisterActor(CharacterState, UIntroPt2Cinematic);
    }

    UFUNCTION(BlueprintOverride)
    void HandleCharacterLeavingRegion(AGothicCharacterState CharacterState)
    {
        UGothicCinematicManagerSubsystemScript::Get().UnregisterActor(Cast<AGothicPlayerState>(CharacterState));
    }
}

UCLASS(meta=(DisplayName="Cinematic - Prophecy"))
class URegionTrait_Story_Cinematic_Prophecy : UCinematicRegionTrait
{
    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
        UGothicCinematicManagerSubsystemScript::Get().RegisterActor(CharacterState, UProphecyCinematic);
    }

    UFUNCTION(BlueprintOverride)
    void HandleCharacterLeavingRegion(AGothicCharacterState CharacterState)
    {
        UGothicCinematicManagerSubsystemScript::Get().UnregisterActor(Cast<AGothicPlayerState>(CharacterState));
    }
}

UCLASS(meta=(DisplayName="Cinematic - FireMages"))
class URegionTrait_Story_Cinematic_FireMages: UCinematicRegionTrait
{
    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
        UGothicCinematicManagerSubsystemScript::Get().RegisterActor(CharacterState, UFireMagesCinematic);
    }

    UFUNCTION(BlueprintOverride)
    void HandleCharacterLeavingRegion(AGothicCharacterState CharacterState)
    {
        UGothicCinematicManagerSubsystemScript::Get().UnregisterActor(Cast<AGothicPlayerState>(CharacterState));
    }
}

UCLASS(meta=(DisplayName="Cinematic - Uriziel"))
class URegionTrait_Story_Cinematic_Uriziel : UCinematicRegionTrait
{
    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
        UGothicCinematicManagerSubsystemScript::Get().RegisterActor(CharacterState, UUrizielCinematic);
    }

    UFUNCTION(BlueprintOverride)
    void HandleCharacterLeavingRegion(AGothicCharacterState CharacterState)
    {
        UGothicCinematicManagerSubsystemScript::Get().UnregisterActor(Cast<AGothicPlayerState>(CharacterState));
    }
}


UCLASS(meta=(DisplayName="Cinematic - Extro"))
class URegionTrait_Story_Cinematic_Extro : UCinematicRegionTrait
{
    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
        UGothicCinematicManagerSubsystemScript::Get().RegisterActor(CharacterState, UExtroCinematic);
    }

    UFUNCTION(BlueprintOverride)
    void HandleCharacterLeavingRegion(AGothicCharacterState CharacterState)
    {
        UGothicCinematicManagerSubsystemScript::Get().UnregisterActor(Cast<AGothicPlayerState>(CharacterState));
    }
}


UCLASS(meta=(DisplayName="Cinematic - ExtroMagic"))
class URegionTrait_Story_Cinematic_ExtroMagic : UCinematicRegionTrait
{
    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
        UGothicCinematicManagerSubsystemScript::Get().RegisterActor(CharacterState, UExtroMagicCinematic);
    }

    UFUNCTION(BlueprintOverride)
    void HandleCharacterLeavingRegion(AGothicCharacterState CharacterState)
    {
        UGothicCinematicManagerSubsystemScript::Get().UnregisterActor(Cast<AGothicPlayerState>(CharacterState));
    }
}


UCLASS(meta=(DisplayName="Cinematic - Nyras Focus Stone"))
class URegionTrait_Story_Cinematic_NyrasFocusStone : UCinematicRegionTrait
{
    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
        UGothicCinematicManagerSubsystemScript::Get().RegisterActor(CharacterState, UNyrasFocusStoneCinematic);
    }

    UFUNCTION(BlueprintOverride)
    void HandleCharacterLeavingRegion(AGothicCharacterState CharacterState)
    {
        UGothicCinematicManagerSubsystemScript::Get().UnregisterActor(Cast<AGothicPlayerState>(CharacterState));
    }
}


UCLASS(meta=(DisplayName="Cinematic - Old Mine Explosion"))
class URegionTrait_Story_Cinematic_OldMineExplosion : UCinematicRegionTrait
{
    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
        UGothicCinematicManagerSubsystemScript::Get().RegisterActor(CharacterState, UOldMineExplosionCinematic);
    }

    UFUNCTION(BlueprintOverride)
    void HandleCharacterLeavingRegion(AGothicCharacterState CharacterState)
    {
        UGothicCinematicManagerSubsystemScript::Get().UnregisterActor(Cast<AGothicPlayerState>(CharacterState));
    }
}


UCLASS(meta=(DisplayName="Cinematic - Ulu Mulu Presentation"))
class URegionTrait_Story_Cinematic_UluMuluPresentation : UCinematicRegionTrait
{
    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
        UGothicCinematicManagerSubsystemScript::Get().RegisterActor(CharacterState, UUluMuluPresentationCinematic);
    }

    UFUNCTION(BlueprintOverride)
    void HandleCharacterLeavingRegion(AGothicCharacterState CharacterState)
    {
        UGothicCinematicManagerSubsystemScript::Get().UnregisterActor(Cast<AGothicPlayerState>(CharacterState));
    }
}


UCLASS(meta=(DisplayName="Cinematic - Sleeper Temple Opening"))
class URegionTrait_Story_Cinematic_SleeperTempleOpening : UCinematicRegionTrait
{
    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
        UGothicCinematicManagerSubsystemScript::Get().RegisterActor(CharacterState, USleeperTempleOpeningCinematic);
    }

    UFUNCTION(BlueprintOverride)
    void HandleCharacterLeavingRegion(AGothicCharacterState CharacterState)
    {
        UGothicCinematicManagerSubsystemScript::Get().UnregisterActor(Cast<AGothicPlayerState>(CharacterState));
    }
}

UCLASS(meta=(DisplayName="Cinematic - FireDemon Blood Door"))
class URegionTrait_Story_Cinematic_FireDemonBloodDoor : UCinematicRegionTrait
{
    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
        UGothicCinematicManagerSubsystemScript::Get().RegisterActor(CharacterState, UFireDemonBloodDoorCinematic);
    }

    UFUNCTION(BlueprintOverride)
    void HandleCharacterLeavingRegion(AGothicCharacterState CharacterState)
    {
        UGothicCinematicManagerSubsystemScript::Get().UnregisterActor(Cast<AGothicPlayerState>(CharacterState));
    }
}

UCLASS(meta=(DisplayName="Cinematic - Tattoo"))
class URegionTrait_Story_Cinematic_Tattoo : UCinematicRegionTrait
{
    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
        UGothicCinematicManagerSubsystemScript::Get().RegisterActor(CharacterState, UTattooCinematic);
    }

    UFUNCTION(BlueprintOverride)
    void HandleCharacterLeavingRegion(AGothicCharacterState CharacterState)
    {
        UGothicCinematicManagerSubsystemScript::Get().UnregisterActor(Cast<AGothicPlayerState>(CharacterState));
    }
}

UCLASS(meta=(DisplayName="Cinematic - Shaving"))
class URegionTrait_Story_Cinematic_Shaving : UCinematicRegionTrait
{
    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
        UGothicCinematicManagerSubsystemScript::Get().RegisterActor(CharacterState, UShavingCinematic);
    }

    UFUNCTION(BlueprintOverride)
    void HandleCharacterLeavingRegion(AGothicCharacterState CharacterState)
    {
        UGothicCinematicManagerSubsystemScript::Get().UnregisterActor(Cast<AGothicPlayerState>(CharacterState));
    }
}



UCLASS(meta=(DisplayName="Cinematic - TEST"))
class URegionTrait_Story_Cinematic_TEST : UCinematicRegionTrait
{
    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
        UGothicCinematicManagerSubsystemScript::Get().RegisterActor(CharacterState, UTESTCinematic);
    }

    UFUNCTION(BlueprintOverride)
    void HandleCharacterLeavingRegion(AGothicCharacterState CharacterState)
    {
        UGothicCinematicManagerSubsystemScript::Get().UnregisterActor(Cast<AGothicPlayerState>(CharacterState));
    }
}


#endif /** Keep this at the bottom of the file */

