class UCharacterDailyRoutineVisualsConfig_Human : UCharacterDailyRoutineVisualsConfig
{
    FDailyRoutineSimulationMesh DefaultHumanSettings;

    default DefaultHumanSettings.OffsetTransform = FTransform(FRotator(0.0f, -90.0f, 0.0f), FVector(0.0, 0.0, -90));
    default DefaultHumanSettings.SelectIfHasAllOf.AddTag(GameplayTag::Species_Human);
    default DefaultHumanSettings.WalkingAnimationLoop = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Movement_NPC/Grounded/N/Walk/A_Man_NPC_WalkFwd_01.A_Man_NPC_WalkFwd_01'";
    default DefaultHumanSettings.IdleAnimationLoop = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Living/GamesCom_Poses/A_Man_Digger_Idle_01.A_Man_Digger_Idle_01'";
    default DefaultHumanSettings.CollapsedAnimationLoop = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Hits/Defeated/Master/A_Man_Fists_Ma_Hit_Defeated_Push_Humanoid_Loop_01.A_Man_Fists_Ma_Hit_Defeated_Push_Humanoid_Loop_01'";
    default DefaultHumanSettings.SelectionPriority = 2.0f;

    default DefaultHumanSettings.SimulatedLightPresets.FindOrAdd(n"Torch");
    default DefaultHumanSettings.SimulatedLightPresets[n"Torch"].LightColor = FColor(255, 150, 0);
    default DefaultHumanSettings.SimulatedLightPresets[n"Torch"].LightIntensity = 10.0;
    default DefaultHumanSettings.SimulatedLightPresets[n"Torch"].LightRadius = 350.0;
    default DefaultHumanSettings.SimulatedLightPresets[n"Torch"].PositionOffset = FVector(50.0, 0.0, 90.0);

    /** Fallback --------------------------------------------------------------------------------------------------- */
    default Meshes.Add(DefaultHumanSettings);
    default Meshes.Last().Mesh = n"SkeletalMesh'/Game/Assets/Characters/Humans/Clothes/HeroClothes/SK_NH_BaseCloth_01_LOD5.SK_NH_BaseCloth_01_LOD5'";
    default Meshes.Last().SelectionPriority = 0.0f;

    /** Guild specific --------------------------------------------------------------------------------------------- */
    default Meshes.Add(DefaultHumanSettings);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Guild_Human_NewCamp_Mercenary );
    default Meshes.Last().Mesh = n"SkeletalMesh'/Game/Assets/Characters/Humans/Clothes/NC_Mercenary/Mercenary/SK_Mercenary_01_LOD5.SK_Mercenary_01_LOD5'";
    default Meshes.Last().SelectionPriority = 2.0f;
    
    default Meshes.Add(DefaultHumanSettings);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Guild_Human_NewCamp_Mercenary );
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Visuals_Humans_SkinType_02);
    default Meshes.Last().Mesh = n"SkeletalMesh'/Game/Assets/Characters/Humans/Clothes/NC_Mercenary/Mercenary/SK_Mercenary_Skin02_LOD5.SK_Mercenary_Skin02_LOD5'";
    default Meshes.Last().SelectionPriority = 4.0f;
    
    default Meshes.Add(DefaultHumanSettings);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Guild_Human_NewCamp_Mercenary );
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Visuals_Humans_HeadType_02);
    default Meshes.Last().Mesh = n"SkeletalMesh'/Game/Assets/Characters/Humans/Clothes/NC_Mercenary/Mercenary/SK_Mercenary_Head02_LOD5.SK_Mercenary_Head02_LOD5'";
    default Meshes.Last().SelectionPriority = 4.0f;


    default Meshes.Add(DefaultHumanSettings);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Guild_Human_NewCamp_Rogue );
    default Meshes.Last().Mesh = n"SkeletalMesh'/Game/Assets/Characters/Humans/Clothes/NC_Rogue/Rogue/SK_Rogue_01_LOD5.SK_Rogue_01_LOD5'";
    default Meshes.Last().SelectionPriority = 2.0f;

    default Meshes.Add(DefaultHumanSettings);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Guild_Human_NewCamp_Rogue );
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Visuals_Humans_SkinType_02);
    default Meshes.Last().Mesh = n"SkeletalMesh'/Game/Assets/Characters/Humans/Clothes/NC_Rogue/Rogue/SK_Rogue_Skin02_LOD5.SK_Rogue_Skin02_LOD5'";
    default Meshes.Last().SelectionPriority = 4.0f;

    default Meshes.Add(DefaultHumanSettings);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Guild_Human_NewCamp_Rogue );
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Visuals_Humans_HeadType_02);
    default Meshes.Last().Mesh = n"SkeletalMesh'/Game/Assets/Characters/Humans/Clothes/NC_Rogue/Rogue/SK_Rogue_Head02_LOD5.SK_Rogue_Head02_LOD5'";
    default Meshes.Last().SelectionPriority = 4.0f;


    default Meshes.Add(DefaultHumanSettings);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Guild_Human_Convoy_NewCamp );
    default Meshes.Last().Mesh = n"SkeletalMesh'/Game/Assets/Characters/Humans/Clothes/NC_Rogue/Rogue/SK_Rogue_01_LOD5.SK_Rogue_01_LOD5'";
    default Meshes.Last().SelectionPriority = 2.0f;

    default Meshes.Add(DefaultHumanSettings);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Guild_Human_Convoy_NewCamp );
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Visuals_Humans_SkinType_02);
    default Meshes.Last().Mesh = n"SkeletalMesh'/Game/Assets/Characters/Humans/Clothes/NC_Rogue/Rogue/SK_Rogue_Skin02_LOD5.SK_Rogue_Skin02_LOD5'";
    default Meshes.Last().SelectionPriority = 4.0f;

    default Meshes.Add(DefaultHumanSettings);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Guild_Human_Convoy_NewCamp );
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Visuals_Humans_HeadType_02);
    default Meshes.Last().Mesh = n"SkeletalMesh'/Game/Assets/Characters/Humans/Clothes/NC_Rogue/Rogue/SK_Rogue_Head02_LOD5.SK_Rogue_Head02_LOD5'";
    default Meshes.Last().SelectionPriority = 4.0f;


    default Meshes.Add(DefaultHumanSettings);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Guild_Human_NewCamp_WaterMage);
    default Meshes.Last().Mesh = n"SkeletalMesh'/Game/Assets/Characters/Humans/Clothes/NC_WaterMages/WaterRobe/SK_WaterRobe_01_LOD5.SK_WaterRobe_01_LOD5'";
    default Meshes.Last().SelectionPriority = 2.0f;

    default Meshes.Add(DefaultHumanSettings);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Guild_Human_NewCamp_WaterMage);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Visuals_Humans_SkinType_02);
    default Meshes.Last().Mesh = n"SkeletalMesh'/Game/Assets/Characters/Humans/Clothes/NC_WaterMages/HWaterRobe/SK_HWaterRobe_Skin02_LOD5.SK_HWaterRobe_Skin02_LOD5'";
    default Meshes.Last().SelectionPriority = 4.0f;


    default Meshes.Add(DefaultHumanSettings);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Visuals_Humans_Clothes_Blacksmith);
    default Meshes.Last().Mesh = n"SkeletalMesh'/Game/Assets/Characters/Humans/Clothes/NoC_Digger/Blacksmith/SK_Blacksmith_01_LOD5.SK_Blacksmith_01_LOD5'";
    default Meshes.Last().SelectionPriority = 2.0f;

    default Meshes.Add(DefaultHumanSettings);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Visuals_Humans_Clothes_Cook);
    default Meshes.Last().Mesh = n"SkeletalMesh'/Game/Assets/Characters/Humans/Clothes/NoC_Digger/Cook/SK_Cook_01_LOD5.SK_Cook_01_LOD5'";
    default Meshes.Last().SelectionPriority = 2.0f;


    default Meshes.Add(DefaultHumanSettings);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Guild_Human_OldCamp_Digger);
    default Meshes.Last().Mesh = n"SkeletalMesh'/Game/Assets/Characters/Humans/Clothes/NoC_Digger/Digger/SK_Digger_01_LOD5.SK_Digger_01_LOD5'";
    default Meshes.Last().SelectionPriority = 2.0f;

    default Meshes.Add(DefaultHumanSettings);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Guild_Human_OldCamp_Digger);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Visuals_Humans_SkinType_02);
    default Meshes.Last().Mesh = n"SkeletalMesh'/Game/Assets/Characters/Humans/Clothes/NoC_Digger/Digger/SK_Digger_Skin02_LOD5.SK_Digger_Skin02_LOD5'";
    default Meshes.Last().SelectionPriority = 4.0f;

    default Meshes.Add(DefaultHumanSettings);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Guild_Human_OldCamp_Digger);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Visuals_Humans_HeadType_02);
    default Meshes.Last().Mesh = n"SkeletalMesh'/Game/Assets/Characters/Humans/Clothes/NoC_Digger/Digger/SK_Digger_Head02_LOD5.SK_Digger_Head02_LOD5'";
    default Meshes.Last().SelectionPriority = 4.0f;


    default Meshes.Add(DefaultHumanSettings);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Guild_Human_DemonSummoner);
    default Meshes.Last().Mesh = n"SkeletalMesh'/Game/Assets/Characters/Humans/Clothes/NoC_RobeDarkArts/RobeDarkArts/SK_RobeDarkArts_01_LOD5.SK_RobeDarkArts_01_LOD5'";
    default Meshes.Last().SelectionPriority = 2.0f;


    default Meshes.Add(DefaultHumanSettings);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Guild_Human_OldCamp_FireMage);
    default Meshes.Last().Mesh = n"SkeletalMesh'/Game/Assets/Characters/Humans/Clothes/OC_FireMages/FireRobe/SK_FireRobe_01_LOD5.SK_FireRobe_01_LOD5'";
    default Meshes.Last().SelectionPriority = 2.0f;

    default Meshes.Add(DefaultHumanSettings);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Guild_Human_OldCamp_FireMage);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Visuals_Humans_SkinType_02);
    default Meshes.Last().Mesh = n"SkeletalMesh'/Game/Assets/Characters/Humans/Clothes/OC_FireMages/FireRobe/SK_FireRobe_Skin02_LOD5.SK_FireRobe_Skin02_LOD5'";
    default Meshes.Last().SelectionPriority = 4.0f;

    default Meshes.Add(DefaultHumanSettings);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Guild_Human_OldCamp_FireMage);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Visuals_Humans_HeadType_02);
    default Meshes.Last().Mesh = n"SkeletalMesh'/Game/Assets/Characters/Humans/Clothes/OC_FireMages/FireRobe/SK_FireRobe_Head02_LOD5.SK_FireRobe_Head02_LOD5'";
    default Meshes.Last().SelectionPriority = 2.0f;


    default Meshes.Add(DefaultHumanSettings);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Guild_Human_OldCamp_OreBaron);
    default Meshes.Last().Mesh = n"SkeletalMesh'/Game/Assets/Characters/Humans/Clothes/OC_Gomez/SK_OreBaronGomez_01_LOD5.SK_OreBaronGomez_01_LOD5'";
    default Meshes.Last().SelectionPriority = 2.0f;

    
    default Meshes.Add(DefaultHumanSettings);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Guild_Human_OldCamp_Guard );
    default Meshes.Last().Mesh = n"SkeletalMesh'/Game/Assets/Characters/Humans/Clothes/OC_Guard/MediumGuard/SK_MediumGuard_01_LOD5.SK_MediumGuard_01_LOD5'";
    default Meshes.Last().SelectionPriority = 2.0f;

    default Meshes.Add(DefaultHumanSettings);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Guild_Human_OldCamp_Guard );
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Visuals_Humans_SkinType_02);
    default Meshes.Last().Mesh = n"SkeletalMesh'/Game/Assets/Characters/Humans/Clothes/OC_Guard/MediumGuard/SK_MediumGuard_Skin02_LOD5.SK_MediumGuard_Skin02_LOD5'";
    default Meshes.Last().SelectionPriority = 4.0f;

    default Meshes.Add(DefaultHumanSettings);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Guild_Human_OldCamp_Guard );
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Visuals_Humans_HeadType_02);
    default Meshes.Last().Mesh = n"SkeletalMesh'/Game/Assets/Characters/Humans/Clothes/OC_Guard/MediumGuard/SK_MediumGuard_Head02_LOD5.SK_MediumGuard_Head02_LOD5'";
    default Meshes.Last().SelectionPriority = 4.0f;

    default Meshes.Add(DefaultHumanSettings);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Guild_Human_Convoy_OldCamp );
    default Meshes.Last().Mesh = n"SkeletalMesh'/Game/Assets/Characters/Humans/Clothes/OC_Guard/MediumGuard/SK_MediumGuard_01_LOD5.SK_MediumGuard_01_LOD5'";
    default Meshes.Last().SelectionPriority = 2.0f;

    default Meshes.Add(DefaultHumanSettings);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Guild_Human_Convoy_OldCamp );
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Visuals_Humans_SkinType_02);
    default Meshes.Last().Mesh = n"SkeletalMesh'/Game/Assets/Characters/Humans/Clothes/OC_Guard/MediumGuard/SK_MediumGuard_Skin02_LOD5.SK_MediumGuard_Skin02_LOD5'";
    default Meshes.Last().SelectionPriority = 4.0f;

    default Meshes.Add(DefaultHumanSettings);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Guild_Human_Convoy_OldCamp );
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Visuals_Humans_HeadType_02);
    default Meshes.Last().Mesh = n"SkeletalMesh'/Game/Assets/Characters/Humans/Clothes/OC_Guard/MediumGuard/SK_MediumGuard_Head02_LOD5.SK_MediumGuard_Head02_LOD5'";
    default Meshes.Last().SelectionPriority = 4.0f;


    default Meshes.Add(DefaultHumanSettings);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Guild_Human_OldCamp_OreBaron);
    default Meshes.Last().Mesh = n"SkeletalMesh'/Game/Assets/Characters/Humans/Clothes/OC_OreBaron/MO_OreBaron/SK_OreBaron_01_LOD5.SK_OreBaron_01_LOD5'";
    default Meshes.Last().SelectionPriority = 2.0f;


    default Meshes.Add(DefaultHumanSettings);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Guild_Human_OldCamp_Shadow);
    default Meshes.Last().Mesh = n"SkeletalMesh'/Game/Assets/Characters/Humans/Clothes/OC_Shadow/Shadow/SK_Shadow_01_LOD5.SK_Shadow_01_LOD5'";
    default Meshes.Last().SelectionPriority = 2.0f;

    default Meshes.Add(DefaultHumanSettings);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Guild_Human_OldCamp_Shadow);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Visuals_Humans_SkinType_02);
    default Meshes.Last().Mesh = n"SkeletalMesh'/Game/Assets/Characters/Humans/Clothes/OC_Shadow/Shadow/SK_Shadow_Skin02_LOD5.SK_Shadow_Skin02_LOD5'";
    default Meshes.Last().SelectionPriority = 4.0f;

    default Meshes.Add(DefaultHumanSettings);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Guild_Human_OldCamp_Shadow);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Visuals_Humans_HeadType_02);
    default Meshes.Last().Mesh = n"SkeletalMesh'/Game/Assets/Characters/Humans/Clothes/OC_Shadow/Shadow/SK_Shadow_Head02_LOD5.SK_Shadow_Head02_LOD5'";
    default Meshes.Last().SelectionPriority = 4.0f;


    default Meshes.Add(DefaultHumanSettings);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Guild_Human_SwampCamp_Guru);
    default Meshes.Last().Mesh = n"SkeletalMesh'/Game/Assets/Characters/Humans/Clothes/SC_Guru/Guru/SK_Guru_01_LOD5.SK_Guru_01_LOD5'";
    default Meshes.Last().SelectionPriority = 2.0f;
    //  default Meshes.Add(DefaultHumanSettings);
    //  default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Guild_Human_SwampCamp_Guru /*HGuru*/);
    //  default Meshes.Last().Mesh = n"SkeletalMesh'/Game/Assets/Characters/Humans/Clothes/SC_Guru/CorKalom/SK_GuruCorKalom_01_LOD5.SK_GuruCorKalom_01_LOD5'";
    //  default Meshes.Last().SelectionPriority = 2.0f;


    // default Meshes.Add(DefaultHumanSettings);
    // default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Guild_Human_SwampCamp_Novice_Light);
    // default Meshes.Last().Mesh = n"SkeletalMesh'/Game/Assets/Characters/Humans/Clothes/SC_Novice/LightNovice/SK_LightNovice_01_LOD5.SK_LightNovice_01_LOD5'";
    // default Meshes.Last().SelectionPriority = 4.0f;
    // default Meshes.Add(DefaultHumanSettings);
    // default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Guild_Human_SwampCamp_Novice_Light);
    // default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Visuals_Humans_SkinType_02);
    // default Meshes.Last().Mesh = n"SkeletalMesh'/Game/Assets/Characters/Humans/Clothes/SC_Novice/LightNovice/SK_LightNovice_Skin02_LOD5.SK_LightNovice_Skin02_LOD5'";
    // default Meshes.Last().SelectionPriority = 4.0f;


    default Meshes.Add(DefaultHumanSettings);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Guild_Human_SwampCamp_Novice);
    default Meshes.Last().Mesh = n"SkeletalMesh'/Game/Assets/Characters/Humans/Clothes/SC_Novice/Novice/SK_Novice_01_LOD5.SK_Novice_01_LOD5'";
    default Meshes.Last().SelectionPriority = 2.0f;

    default Meshes.Add(DefaultHumanSettings);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Guild_Human_SwampCamp_Novice);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Visuals_Humans_SkinType_02);
    default Meshes.Last().Mesh = n"SkeletalMesh'/Game/Assets/Characters/Humans/Clothes/SC_Novice/Novice/SK_Novice_Skin02_LOD5.SK_Novice_Skin02_LOD5'";
    default Meshes.Last().SelectionPriority = 4.0f;


    default Meshes.Add(DefaultHumanSettings);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Guild_Human_SwampCamp_Templar);
    default Meshes.Last().Mesh = n"SkeletalMesh'/Game/Assets/Characters/Humans/Clothes/SC_Templar/Templar/SK_Templar_01_LOD5.SK_Templar_01_LOD5'";
    default Meshes.Last().SelectionPriority = 2.0f;

    default Meshes.Add(DefaultHumanSettings);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Guild_Human_SwampCamp_Templar);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Visuals_Humans_SkinType_02);
    default Meshes.Last().Mesh = n"SkeletalMesh'/Game/Assets/Characters/Humans/Clothes/SC_Templar/Templar/SK_Templar_Skin02_LOD5.SK_Templar_Skin02_LOD5'";
    default Meshes.Last().SelectionPriority = 4.0f;


    default Meshes.Add(DefaultHumanSettings);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Guild_Human_NewCamp_Peasant);
    default Meshes.Last().Mesh = n"SkeletalMesh'/Game/Assets/Characters/Humans/Clothes/NoC_Digger/Digger/SK_Digger_01_LOD5.SK_Digger_01_LOD5'";
    default Meshes.Last().SelectionPriority = 2.0f;

    default Meshes.Add(DefaultHumanSettings);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Guild_Human_NewCamp_Peasant);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Visuals_Humans_SkinType_02);
    default Meshes.Last().Mesh = n"SkeletalMesh'/Game/Assets/Characters/Humans/Clothes/NoC_Digger/Digger/SK_Digger_Skin02_LOD5.SK_Digger_Skin02_LOD5'";
    default Meshes.Last().SelectionPriority = 4.0f;

    default Meshes.Add(DefaultHumanSettings);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Guild_Human_NewCamp_Peasant);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Visuals_Humans_HeadType_02);
    default Meshes.Last().Mesh = n"SkeletalMesh'/Game/Assets/Characters/Humans/Clothes/NoC_Digger/Digger/SK_Digger_Head02_LOD5.SK_Digger_Head02_LOD5'";
    default Meshes.Last().SelectionPriority = 4.0f;


    default Meshes.Add(DefaultHumanSettings);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Guild_Human_NewCamp_Rogue);
    default Meshes.Last().Mesh = n"SkeletalMesh'/Game/Assets/Characters/Humans/Clothes/NC_Rogue/HeavyRogue/SK_HeavyRogue_01_LOD5.SK_HeavyRogue_01_LOD5'";
    default Meshes.Last().SelectionPriority = 2.0f;

    default Meshes.Add(DefaultHumanSettings);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Guild_Human_NewCamp_Rogue);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Visuals_Humans_SkinType_02);
    default Meshes.Last().Mesh = n"SkeletalMesh'/Game/Assets/Characters/Humans/Clothes/NC_Rogue/HeavyRogue/SK_HeavyRogue_Skin02_LOD5.SK_HeavyRogue_Skin02_LOD5'";
    default Meshes.Last().SelectionPriority = 4.0f;

    default Meshes.Add(DefaultHumanSettings);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Guild_Human_NewCamp_Rogue);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Visuals_Humans_HeadType_02);
    default Meshes.Last().Mesh = n"SkeletalMesh'/Game/Assets/Characters/Humans/Clothes/NC_Rogue/HeavyRogue/SK_HeavyRogue_Head02_LOD5.SK_HeavyRogue_Head02_LOD5'";
    default Meshes.Last().SelectionPriority = 4.0f;


    default Meshes.Add(DefaultHumanSettings);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Guild_Human_NewCamp_Scraper);
    default Meshes.Last().Mesh = n"SkeletalMesh'/Game/Assets/Characters/Humans/Clothes/NoC_Digger/Digger/SK_Digger_01_LOD5.SK_Digger_01_LOD5'";
    default Meshes.Last().SelectionPriority = 2.0f;

    default Meshes.Add(DefaultHumanSettings);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Guild_Human_NewCamp_Scraper);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Visuals_Humans_SkinType_02);
    default Meshes.Last().Mesh = n"SkeletalMesh'/Game/Assets/Characters/Humans/Clothes/NoC_Digger/Digger/SK_Digger_Skin02_LOD5.SK_Digger_Skin02_LOD5'";
    default Meshes.Last().SelectionPriority = 4.0f;

    default Meshes.Add(DefaultHumanSettings);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Guild_Human_NewCamp_Scraper);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Visuals_Humans_HeadType_02);
    default Meshes.Last().Mesh = n"SkeletalMesh'/Game/Assets/Characters/Humans/Clothes/NoC_Digger/Digger/SK_Digger_Head02_LOD5.SK_Digger_Head02_LOD5'";
    default Meshes.Last().SelectionPriority = 4.0f;

    /** Sleeper dreams */
    default Meshes.Add(DefaultHumanSettings);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Guild_SleeperTemple_Diego);
    default Meshes.Last().Mesh = n"SkeletalMesh'/Game/Assets/Characters/Humans/Clothes/OC_Shadow/Shadow/SK_Shadow_01_LOD5.SK_Shadow_01_LOD5'";
    default Meshes.Last().SelectionPriority = 2.0f;

    default Meshes.Add(DefaultHumanSettings);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Guild_SleeperTemple_Gorn);
    default Meshes.Last().Mesh = n"SkeletalMesh'/Game/Assets/Characters/Humans/Clothes/NC_Mercenary/Mercenary/SK_Mercenary_Skin02_LOD5.SK_Mercenary_Skin02_LOD5'";
    default Meshes.Last().SelectionPriority = 2.0f;

    default Meshes.Add(DefaultHumanSettings);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Guild_SleeperTemple_Milten);
    default Meshes.Last().Mesh = n"SkeletalMesh'/Game/Assets/Characters/Humans/Clothes/OC_FireMages/FireRobe/SK_FireRobe_01_LOD5.SK_FireRobe_01_LOD5'";
    default Meshes.Last().SelectionPriority = 2.0f;

    default Meshes.Add(DefaultHumanSettings);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Guild_SleeperTemple_Lester);
    default Meshes.Last().Mesh = n"SkeletalMesh'/Game/Assets/Characters/Humans/Clothes/SC_Novice/Novice/SK_Novice_01_LOD5.SK_Novice_01_LOD5'";
    default Meshes.Last().SelectionPriority = 2.0f;

    default Meshes.Add(DefaultHumanSettings);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Guild_SleeperTemple_Xardas);
    default Meshes.Last().Mesh = n"SkeletalMesh'/Game/Assets/Characters/Humans/Clothes/NoC_RobeDarkArts/RobeDarkArts/SK_RobeDarkArts_01_LOD5.SK_RobeDarkArts_01_LOD5'";
    default Meshes.Last().SelectionPriority = 2.0f;

    default Meshes.Add(DefaultHumanSettings);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Character_Simulation_NoVisuals);
    default Meshes.Last().Mesh = nullptr;
    default Meshes.Last().SelectionPriority = 1000.0f;


    /** Women */
    default Meshes.Add(DefaultHumanSettings);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Visuals_Humans_Female_OldCamp_Velaya);
    default Meshes.Last().Mesh = n"SkeletalMesh'/Game/Assets/Characters/Humans/Clothes/OC_Velaya/SK_OC_WOC_Velaya_108_LOD5.SK_OC_WOC_Velaya_108_LOD5'";
    default Meshes.Last().SelectionPriority = 2.0f;

    default Meshes.Add(DefaultHumanSettings);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Visuals_Humans_Female_OldCamp_Velaya_02);
    default Meshes.Last().Mesh = n"SkeletalMesh'/Game/Assets/Characters/Humans/Clothes/OC_Female_Slaves/SK_OC_WOC_Velaya_108_02_LOD5.SK_OC_WOC_Velaya_108_02_LOD5'";
    default Meshes.Last().SelectionPriority = 2.0f;

    default Meshes.Add(DefaultHumanSettings);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Visuals_Humans_Female_OldCamp_Seraphia);
    default Meshes.Last().Mesh = n"SkeletalMesh'/Game/Assets/Characters/Humans/Clothes/NoC_LadyDress/SK_OC_WOC_Seraphia_110_LOD5.SK_OC_WOC_Seraphia_110_LOD5'";
    default Meshes.Last().SelectionPriority = 2.0f;

    default Meshes.Add(DefaultHumanSettings);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Visuals_Humans_Female_OldCamp_Syra);
    default Meshes.Last().Mesh = n"SkeletalMesh'/Game/Assets/Characters/Humans/Clothes/NoC_Syra_Clothes/SK_OC_WOC_Syra_109_LOD5.SK_OC_WOC_Syra_109_LOD5'";
    default Meshes.Last().SelectionPriority = 2.0f;

    default Meshes.Add(DefaultHumanSettings);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Visuals_Humans_Female_SectCamp_Chani);
    default Meshes.Last().Mesh = n"SkeletalMesh'/Game/Assets/Characters/Humans/Clothes/NoC_LadySwampCamp/SK_SC_WSC_Chani_1205_LOD5.SK_SC_WSC_Chani_1205_LOD5'";
    default Meshes.Last().SelectionPriority = 2.0f;

    default Meshes.Add(DefaultHumanSettings);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Visuals_Humans_Female_SectCamp_Natalia);
    default Meshes.Last().Mesh = n"SkeletalMesh'/Game/Assets/Characters/Humans/Clothes/NoC_LadySwampCamp/SK_SC_WSC_Natalia_1207_LOD5.SK_SC_WSC_Natalia_1207_LOD5'";
    default Meshes.Last().SelectionPriority = 2.0f;

    default Meshes.Add(DefaultHumanSettings);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Visuals_Humans_Female_OldCamp_Prisoner01);
    default Meshes.Last().Mesh = n"SkeletalMesh'/Game/Assets/Characters/Humans/Clothes/OC_Female_Prisoner/SK_OC_WOC_Prisoner01_111_LOD5.SK_OC_WOC_Prisoner01_111_LOD5'";
    default Meshes.Last().SelectionPriority = 2.0f;

    default Meshes.Add(DefaultHumanSettings);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Visuals_Humans_Female_OldCamp_Prisoner02);
    default Meshes.Last().Mesh = n"SkeletalMesh'/Game/Assets/Characters/Humans/Clothes/OC_Female_Prisoner/SK_OC_WOC_Prisoner02_112_LOD5.SK_OC_WOC_Prisoner02_112_LOD5'";
    default Meshes.Last().SelectionPriority = 2.0f;

}

class UCharacterDailyRoutineVisualsConfig_Orc : UCharacterDailyRoutineVisualsConfig
{
    FDailyRoutineSimulationMesh DefaultOrcSettings;

    default DefaultOrcSettings.OffsetTransform = FTransform(FRotator(0.0f, -90.0f, 0.0f), FVector(0.0, 0.0, -15.0));
    default DefaultOrcSettings.SelectIfHasAllOf.AddTag(GameplayTag::Species_Orc);
    default DefaultOrcSettings.WalkingAnimationLoop = n"AnimSequence'/Game/AnimLibrary/Humanoid/Orcs/Male/Movement/Grounded/N/Walk/A_OrcM_WalkFwd_01.A_OrcM_WalkFwd_01'";
    default DefaultOrcSettings.IdleAnimationLoop = n"AnimSequence'/Game/AnimLibrary/Humanoid/Orcs/Male/Living/Idles/IdlePose/A_OrcM_Idle_01.A_OrcM_Idle_01'";
    default DefaultOrcSettings.CollapsedAnimationLoop = n"AnimSequence'/Game/AnimLibrary/Humanoid/Orcs/Combat/Sword/Hits/OLD/KO_Death/A_OrcM_S1H_KO_F_Loop.A_OrcM_S1H_KO_F_Loop'";
    default DefaultOrcSettings.SelectionPriority = 1.0f;

    /** Fallback --------------------------------------------------------------------------------------------------- */
    default Meshes.Add(DefaultOrcSettings);
    default Meshes.Last().Mesh = n"SkeletalMesh'/Game/Assets/Characters/Orcs/Mutable/Man/OrcM_Base/SK_OrcM_Base_01_LOD5.SK_OrcM_Base_01_LOD5'";
    default Meshes.Last().SelectionPriority = 0.0f;

    /** Guild specific --------------------------------------------------------------------------------------------- */
    default Meshes.Add(DefaultOrcSettings);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Guild_Orc);
    default Meshes.Last().Mesh = n"SkeletalMesh'/Game/Assets/Characters/Orcs/Mutable/Man/OrcM_Base/SK_OrcM_Base_01_LOD5.SK_OrcM_Base_01_LOD5'";
    default Meshes.Last().SelectionPriority = 1.0f;

    default Meshes.Add(DefaultOrcSettings);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Guild_Orc_Scout);
    default Meshes.Last().Mesh = n"SkeletalMesh'/Game/Assets/Characters/Orcs/Mutable/Man/OrcM_Scout/SK_OrcM_Scout_01_LOD5.SK_OrcM_Scout_01_LOD5'";
    default Meshes.Last().SelectionPriority = 2.0f;
    
    default Meshes.Add(DefaultOrcSettings);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Guild_Orc_Shaman);
    default Meshes.Last().Mesh = n"SkeletalMesh'/Game/Assets/Characters/Orcs/Mutable/Man/OrcM_Shaman/SK_OrcM_Shaman_01_LOD5.SK_OrcM_Shaman_01_LOD5'";
    default Meshes.Last().SelectionPriority = 2.0f;
    
    default Meshes.Add(DefaultOrcSettings);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Guild_Orc_Slave);
    default Meshes.Last().Mesh = n"SkeletalMesh'/Game/Assets/Characters/Orcs/Mutable/Man/OrcM_Slave/SK_OrcM_Slave_01_LOD5.SK_OrcM_Slave_01_LOD5'";
    default Meshes.Last().SelectionPriority = 2.0f;
    
    default Meshes.Add(DefaultOrcSettings);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Guild_Orc_Warrior);
    default Meshes.Last().Mesh = n"SkeletalMesh'/Game/Assets/Characters/Orcs/Mutable/Man/OrcM_Warrior/SK_OrcM_Warrior_01_LOD5.SK_OrcM_Warrior_01_LOD5'";
    default Meshes.Last().SelectionPriority = 2.0f;
    
}

class UCharacterDailyRoutineVisualsConfig_Creature : UCharacterDailyRoutineVisualsConfig
{
    FDailyRoutineSimulationMesh DefaultCreatureSettings;

    default DefaultCreatureSettings.OffsetTransform = FTransform(FRotator(0.0f, -90.0f, 0.0f), FVector(0.0, 0.0, -15.0));
    default DefaultCreatureSettings.SelectIfHasAllOf.AddTag(GameplayTag::Species_Creature);
    default DefaultCreatureSettings.SelectionPriority = 1.0f;

    default Meshes.Add(DefaultCreatureSettings);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Species_Creature_Biter);
    default Meshes.Last().Mesh                 = n"SkeletalMesh'/Game/Assets/Characters/Creatures/Biter/SK_Biter_LOD5.SK_Biter_LOD5'";
    default Meshes.Last().WalkingAnimationLoop = n"AnimSequence'/Game/AnimLibrary/Creatures/Biter/Movement/Grounded/N/Walk/A_Biter_WalkFwd.A_Biter_WalkFwd'";
    default Meshes.Last().IdleAnimationLoop    = n"AnimSequence'/Game/AnimLibrary/Creatures/Biter/Movement/Idles/Breath/A_Biter_Idle_01.A_Biter_Idle_01'";

    default Meshes.Add(DefaultCreatureSettings);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Species_Creature_Bloodfly);
    default Meshes.Last().Mesh                 = n"SkeletalMesh'/Game/Assets/Characters/Creatures/Bloodfly/SK_Bloodfly_LOD5.SK_Bloodfly_LOD5'";
    default Meshes.Last().WalkingAnimationLoop = n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodfly/Movement/Grounded/N/Walk/A_Bloodfly_Walk_Fwd.A_Bloodfly_Walk_Fwd'";
    default Meshes.Last().IdleAnimationLoop    = n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodfly/Movement/Idles/Breath/A_Bloodfly_Idle_01.A_Bloodfly_Idle_01'";
    
    // ZDivergeOffset from AiAgentConfig_Navigation_Bloodfly
    default Meshes.Last().OffsetTransform = FTransform(FRotator(0.f, -90.0f, 0.f), FVector(0.0f, 0.0f, 60.0f)); 
    float FloorToVisualFeetOffset = 90.f;
    float FlyHeight = 80.f; // see DefaultPathfollowSettings, ZDivergeHeight
    default Meshes.Last().CustomOffsetTransform = FTransform(FRotator(0.f, 0.0, 0.f), FVector(0.0f, 0.0f, FloorToVisualFeetOffset + FlyHeight)); 

    default Meshes.Add(DefaultCreatureSettings);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Species_Creature_Bloodhound);
    default Meshes.Last().Mesh                 = n"SkeletalMesh'/Game/Assets/Characters/Creatures/Bloodhound/SK_Bloodhound_LOD5.SK_Bloodhound_LOD5'";
    default Meshes.Last().WalkingAnimationLoop = n"/Script/Engine.AnimSequence'/Game/AnimLibrary/Creatures/Bloodhound/Movement/Grounded/N/Walk/A_Bloodhound_WalkFwd.A_Bloodhound_WalkFwd'";
    default Meshes.Last().IdleAnimationLoop    = n"/Script/Engine.AnimSequence'/Game/AnimLibrary/Creatures/Bloodhound/Movement/Idles/Breath/A_Bloodhound_Idle_01.A_Bloodhound_Idle_01'";

    // default Meshes.Add(DefaultCreatureSettings);
    // default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Species_Creature_Demon);
    // default Meshes.Last().Mesh                 = n"SkeletalMesh'/Game/Assets/Characters/Creatures/DemonLord_01/SK_DemonLord_01_LOD5.SK_DemonLord_01_LOD5'";
    // default Meshes.Last().WalkingAnimationLoop = n"AnimSequence'/Game/AnimLibrary/Creatures/DemonLord_01/Movement/Grounded/N/Walk/A_DemonLord_01_Walk_Fwd.A_DemonLord_01_Walk_Fwd'";
    // default Meshes.Last().IdleAnimationLoop    = n"AnimSequence'/Game/AnimLibrary/Creatures/DemonLord_01/Movement/Idles/Breath/A_DemonLord_01_Idle_01.A_DemonLord_01_Idle_01'";

    // default Meshes.Add(DefaultCreatureSettings);
    // default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Species_Creature_Golem_Fire);
    // default Meshes.Last().Mesh                 = n"SkeletalMesh'/Game/Assets/Characters/Creatures/Fire_Golem/SK_Fire_Golem_LOD5.SK_Fire_Golem_LOD5'";
    // default Meshes.Last().WalkingAnimationLoop = n"AnimSequence'/Game/AnimLibrary/Creatures/Fire_Golem/Movement/Grounded/N/Walk/A_Fire_Golem_Walk_Fwd.A_Fire_Golem_Walk_Fwd'";
    // default Meshes.Last().IdleAnimationLoop    = n"AnimSequence'/Game/AnimLibrary/Creatures/Fire_Golem/Movement/Idles/Breath/A_Fire_Golem_Idle_01.A_Fire_Golem_Idle_01'";


    // default Meshes.Add(DefaultCreatureSettings);
    // default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Species_Creature_FireDemon);
    // default Meshes.Last().Mesh                 = n"SkeletalMesh'/Game/Assets/Characters/Creatures/FireDemon/SK_FireDemon_LOD5.SK_FireDemon_LOD5'";
    // default Meshes.Last().WalkingAnimationLoop = n"AnimSequence'/Game/AnimLibrary/Creatures/FireDemon/Movement/Grounded/N/Walk/A_FireDemon_Walk_Fwd.A_FireDemon_Walk_Fwd'";
    // default Meshes.Last().IdleAnimationLoop    = n"AnimSequence'/Game/AnimLibrary/Creatures/FireDemon/Movement/Idles/Breath/A_FireDemon_Idle_01.A_FireDemon_Idle_01'";


    // default Meshes.Add(DefaultCreatureSettings);
    // default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Species_Creature_Goblin_Black);
    // default Meshes.Last().Mesh                 = n"SkeletalMesh'/Game/Assets/Characters/Creatures/Goblin/Mutable/SK_Black_Goblin_01_LOD5.SK_Black_Goblin_01_LOD5'";
    // default Meshes.Last().WalkingAnimationLoop = n"AnimSequence'/Game/AnimLibrary/Creatures/Goblin/Movement/Grounded/N/Walk/A_Goblin_Walk_Fwd.A_Goblin_Walk_Fwd'";
    // default Meshes.Last().IdleAnimationLoop    = n"AnimSequence'/Game/AnimLibrary/Creatures/Goblin/Movement/Idles/Breath/A_Goblin_Idle_01.A_Goblin_Idle_01'";


    default Meshes.Add(DefaultCreatureSettings);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Species_Creature_Goblin /*_Green*/);
    default Meshes.Last().Mesh                 = n"SkeletalMesh'/Game/Assets/Characters/Creatures/Goblin/Mutable/SK_Green_Goblin_01_LOD5.SK_Green_Goblin_01_LOD5'";
    default Meshes.Last().WalkingAnimationLoop = n"/Script/Engine.AnimSequence'/Game/AnimLibrary/Creatures/Green_Goblin/Movement/Grounded/N/Walk/A_GreenGoblin_WalkFwd.A_GreenGoblin_WalkFwd'";
    default Meshes.Last().IdleAnimationLoop    = n"/Script/Engine.AnimSequence'/Game/AnimLibrary/Creatures/Green_Goblin/Movement/Idles/Breath/A_GreenGoblin_Idle_01.A_GreenGoblin_Idle_01'";


    // default Meshes.Add(DefaultCreatureSettings);
    // default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Species_Creature_Goblin_Warrior);
    // default Meshes.Last().Mesh                 = n"SkeletalMesh'/Game/Assets/Characters/Creatures/Goblin/Mutable/SK_Warrior_Goblin_01_LOD5.SK_Warrior_Goblin_01_LOD5'";
    // default Meshes.Last().WalkingAnimationLoop = n"AnimSequence'/Game/AnimLibrary/Creatures/Goblin/Movement/Grounded/N/Walk/A_Goblin_Walk_Fwd.A_Goblin_Walk_Fwd'";
    // default Meshes.Last().IdleAnimationLoop    = n"AnimSequence'/Game/AnimLibrary/Creatures/Goblin/Movement/Idles/Breath/A_Goblin_Idle_01.A_Goblin_Idle_01'";

    default Meshes.Add(DefaultCreatureSettings);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Species_Creature_Harpy);
    default Meshes.Last().Mesh                 = n"SkeletalMesh'/Game/Assets/Characters/Creatures/Harpy/Harpy_LOD5.Harpy_LOD5'";
    default Meshes.Last().WalkingAnimationLoop = n"AnimSequence'/Game/AnimLibrary/Creatures/Harpy/Movement/Grounded/N/Walk/A_Harpy_WalkFwd.A_Harpy_WalkFwd'";
    default Meshes.Last().IdleAnimationLoop    = n"AnimSequence'/Game/AnimLibrary/Creatures/Harpy/Movement/Idles/Grounded_Idles/Breath/A_Harpy_Idle_01.A_Harpy_Idle_01'";


    // default Meshes.Add(DefaultCreatureSettings);
    // default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Species_Creature_Ice_Golem_V2);
    // default Meshes.Last().Mesh                 = n"SkeletalMesh'/Game/Assets/Characters/Creatures/Ice_Golem_V2/SK_Ice_Golem_V2_LOD5.SK_Ice_Golem_V2_LOD5'";
    // default Meshes.Last().WalkingAnimationLoop = n"AnimSequence'/Game/AnimLibrary/Creatures/Ice_Golem_V2/Movement/Grounded/N/Walk/A_Ice_Golem_V2_WalkFwd.A_Ice_Golem_V2_WalkFwd'";
    // default Meshes.Last().IdleAnimationLoop    = n"AnimSequence'/Game/AnimLibrary/Creatures/Ice_Golem_V2/Movement/Idles/Breath/A_Ice_Golem_V2_Idle_01.A_Ice_Golem_V2_Idle_01'";


    // default Meshes.Add(DefaultCreatureSettings);
    // default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Species_Creature_LesserDemon);
    // default Meshes.Last().Mesh                 = n"SkeletalMesh'/Game/Assets/Characters/Creatures/LesserDemon/SK_LesserDemon_LOD5.SK_LesserDemon_LOD5'";
    // default Meshes.Last().WalkingAnimationLoop = n"AnimSequence'/Game/AnimLibrary/Creatures/LesserDemon/Movement/Grounded/N/Walk/A_LesserDemon_WalkFwd.A_LesserDemon_WalkFwd'";
    // default Meshes.Last().IdleAnimationLoop    = n"AnimSequence'/Game/AnimLibrary/Creatures/LesserDemon/Movement/Idles/Breath/A_LesserDemon_Idle_01.A_LesserDemon_Idle_01'";


    default Meshes.Add(DefaultCreatureSettings);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Species_Creature_Lizard_Fire);
    default Meshes.Last().Mesh                 = n"SkeletalMesh'/Game/Assets/Characters/Creatures/Lizard/SK_Lizard_Fire_LOD5.SK_Lizard_Fire_LOD5'";
    default Meshes.Last().WalkingAnimationLoop = n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard/Movement/Grounded/N/Walk/A_Lizard_WalkFwd.A_Lizard_WalkFwd'";
    default Meshes.Last().IdleAnimationLoop    = n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard/Movement/Idles/Breath/A_Lizard_Idle_01.A_Lizard_Idle_01'";


    default Meshes.Add(DefaultCreatureSettings);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Species_Creature_Lizard);
    default Meshes.Last().Mesh                 = n"SkeletalMesh'/Game/Assets/Characters/Creatures/Lizard/SK_Lizard_LOD5.SK_Lizard_LOD5'";
    default Meshes.Last().WalkingAnimationLoop = n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard/Movement/Grounded/N/Walk/A_Lizard_WalkFwd.A_Lizard_WalkFwd'";
    default Meshes.Last().IdleAnimationLoop    = n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard/Movement/Idles/Breath/A_Lizard_Idle_01.A_Lizard_Idle_01'";

    default Meshes.Add(DefaultCreatureSettings);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Species_Creature_Lurker);
    default Meshes.Last().Mesh                 = n"SkeletalMesh'/Game/Assets/Characters/Creatures/Lurker/SK_Lurker_LOD5.SK_Lurker_LOD5'";
    default Meshes.Last().WalkingAnimationLoop = n"AnimSequence'/Game/AnimLibrary/Creatures/Lurker/Movement/Grounded/N/Walk/A_Lurker_WalkFwd.A_Lurker_WalkFwd'";
    default Meshes.Last().IdleAnimationLoop    = n"AnimSequence'/Game/AnimLibrary/Creatures/Lurker/Movement/Idles/Breath/A_Lurker_Idle_01.A_Lurker_Idle_01'";

    default Meshes.Add(DefaultCreatureSettings);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Species_Creature_Minecrawler_Queen);
    default Meshes.Last().Mesh                 = nullptr;

    default Meshes.Add(DefaultCreatureSettings);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Species_Creature_Minecrawler_Nymph);
    default Meshes.Last().Mesh                 = nullptr;

    default Meshes.Add(DefaultCreatureSettings);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Species_Creature_Minecrawler);
    default Meshes.Last().Mesh                 = n"SkeletalMesh'/Game/Assets/Characters/Creatures/MCrawler/SK_MCrawler_LOD5.SK_MCrawler_LOD5'";
    default Meshes.Last().WalkingAnimationLoop = n"AnimSequence'/Game/AnimLibrary/Creatures/MCrawler/Movement/Grounded/N/Walk/A_MCrawler_WalkFwd.A_MCrawler_WalkFwd'";
    default Meshes.Last().IdleAnimationLoop    = n"AnimSequence'/Game/AnimLibrary/Creatures/MCrawler/Movement/Idles/Breath/A_MCrawler_Idle_01.A_MCrawler_Idle_01'";

    default Meshes.Add(DefaultCreatureSettings);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Species_Creature_Meatbug);
    default Meshes.Last().Mesh                 = n"SkeletalMesh'/Game/Assets/Characters/Creatures/Meatbug/SK_Meatbug_LOD5.SK_Meatbug_LOD5'";
    default Meshes.Last().WalkingAnimationLoop = n"AnimSequence'/Game/AnimLibrary/Creatures/Meatbug/Movement/A_Meatbug_WalkFwd.A_Meatbug_WalkFwd'";
    default Meshes.Last().IdleAnimationLoop    = n"AnimSequence'/Game/AnimLibrary/Creatures/Meatbug/GeneralIdles/A_Meatbug_Idle_01.A_Meatbug_Idle_01'";


    default Meshes.Add(DefaultCreatureSettings);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Species_Creature_Molerat);
    default Meshes.Last().Mesh                 = n"SkeletalMesh'/Game/Assets/Characters/Creatures/Molerat/SK_Molerat_LOD5.SK_Molerat_LOD5'";
    default Meshes.Last().WalkingAnimationLoop = n"AnimSequence'/Game/AnimLibrary/Creatures/Molerat/Movement/Grounded/N/Walk/A_Molerat_WalkFwd.A_Molerat_WalkFwd'";
    default Meshes.Last().IdleAnimationLoop    = n"AnimSequence'/Game/AnimLibrary/Creatures/Molerat/Movement/Idles/Breath/A_Molerat_Idle_01.A_Molerat_Idle_01'";


    default Meshes.Add(DefaultCreatureSettings);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Species_Creature_Orcdog);
    default Meshes.Last().Mesh                 = n"SkeletalMesh'/Game/Assets/Characters/Creatures/OrcDog/SK_OrcDog_LOD5.SK_OrcDog_LOD5'";
    default Meshes.Last().WalkingAnimationLoop = n"AnimSequence'/Game/AnimLibrary/Creatures/OrcDog/Movement/Grounded/N/Walk/A_OrcDog_WalkFwd.A_OrcDog_WalkFwd'";
    default Meshes.Last().IdleAnimationLoop    = n"AnimSequence'/Game/AnimLibrary/Creatures/OrcDog/Movement/Idles/Breath/A_OrcDog_Idle_01.A_OrcDog_Idle_01'";


    default Meshes.Add(DefaultCreatureSettings);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Species_Creature_Razor);
    default Meshes.Last().Mesh                 = n"SkeletalMesh'/Game/Assets/Characters/Creatures/Razor/SK_Razor_LOD5.SK_Razor_LOD5'";
    default Meshes.Last().WalkingAnimationLoop = n"AnimSequence'/Game/AnimLibrary/Creatures/Razor/Movement/Grounded/N/Walk/A_Razor_WalkFwd.A_Razor_WalkFwd'";
    default Meshes.Last().IdleAnimationLoop    = n"AnimSequence'/Game/AnimLibrary/Creatures/Razor/Movement/Idles/Breath/A_Razor_Idle_01.A_Razor_Idle_01'";


    // default Meshes.Add(DefaultCreatureSettings);
    // default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Species_Creature_Scavenger_Adult);
    // default Meshes.Last().Mesh                 = n"SkeletalMesh'/Game/Assets/Characters/Creatures/Scavenger/SK_Scavenger_Adult_LOD5.SK_Scavenger_Adult_LOD5'";
    // default Meshes.Last().WalkingAnimationLoop = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Movement/Grounded/N/Walk/A_Scavenger_WalkFwd.A_Scavenger_WalkFwd'";
    // default Meshes.Last().IdleAnimationLoop    = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Movement/Idles/Breath/A_Scavenger_Idle_01.A_Scavenger_Idle_01'";


    default Meshes.Add(DefaultCreatureSettings);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Species_Creature_Scavenger);
    default Meshes.Last().Mesh                 = n"SkeletalMesh'/Game/Assets/Characters/Creatures/Scavenger/SK_Scavenger_Med_LOD5.SK_Scavenger_Med_LOD5'";
    default Meshes.Last().WalkingAnimationLoop = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Med/Movement/Grounded/N/Walk/A_Scavenger_Med_WalkFwd.A_Scavenger_Med_WalkFwd'";
    default Meshes.Last().IdleAnimationLoop    = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Med/GeneralIdle/A_Scavenger_Med_Idle_01.A_Scavenger_Med_Idle_01'";
    

    // default Meshes.Add(DefaultCreatureSettings);
    // default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Species_Creature_Scavenger_Young);
    // default Meshes.Last().Mesh                 = n"SkeletalMesh'/Game/Assets/Characters/Creatures/Scavenger/SK_Scavenger_Young_LOD5.SK_Scavenger_Young_LOD5'";
    // default Meshes.Last().WalkingAnimationLoop = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Movement/Grounded/N/Walk/A_Scavenger_WalkFwd.A_Scavenger_WalkFwd'";
    // default Meshes.Last().IdleAnimationLoop    = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Movement/Idles/Breath/A_Scavenger_Idle_01.A_Scavenger_Idle_01'";


    default Meshes.Add(DefaultCreatureSettings);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Species_Creature_Shadowbeast);
    default Meshes.Last().Mesh                 = n"SkeletalMesh'/Game/Assets/Characters/Creatures/ShadowBeast/SK_Shadow_Beast_LOD5.SK_Shadow_Beast_LOD5'";
    default Meshes.Last().WalkingAnimationLoop = n"AnimSequence'/Game/AnimLibrary/Creatures/Shadow_Beast/Movement/Grounded/N/Walk/A_Shadow_Beast_WalkFwd.A_Shadow_Beast_WalkFwd'";
    default Meshes.Last().IdleAnimationLoop    = n"AnimSequence'/Game/AnimLibrary/Creatures/Shadow_Beast/Movement/Idles/Breath/A_Shadow_Beast_Idle_01.A_Shadow_Beast_Idle_01'";


    default Meshes.Add(DefaultCreatureSettings);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Species_Creature_Undead_Skeleton);
    default Meshes.Last().Mesh                 = n"SkeletalMesh'/Game/Assets/Characters/Creatures/Skeleton/Mutable/SK_Skeleton_01_LOD5.SK_Skeleton_01_LOD5'";
    default Meshes.Last().WalkingAnimationLoop = n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton/Movement/Grounded/N/Walk/A_Skeleton_WalkFwd.A_Skeleton_WalkFwd'";
    default Meshes.Last().IdleAnimationLoop    = n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton/Movement/Idles/Breath/A_Skeleton_Idle_01.A_Skeleton_Idle_01'";


    // default Meshes.Add(DefaultCreatureSettings);
    // default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Species_Creature_Skeleton_Mage);
    // default Meshes.Last().Mesh                 = n"SkeletalMesh'/Game/Assets/Characters/Creatures/Skeleton_Mage/SK_Skeleton_Mage_LOD5.SK_Skeleton_Mage_LOD5'";
    // default Meshes.Last().WalkingAnimationLoop = n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton_Mage/Movement/Grounded/N/Walk/A_Skeleton_Mage_WalkFwd.A_Skeleton_Mage_WalkFwd'";
    // default Meshes.Last().IdleAnimationLoop    = n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton_Mage/Movement/Idles/Breath/A_Skeleton_Mage_Idle_01.A_Skeleton_Mage_Idle_01'";


    default Meshes.Add(DefaultCreatureSettings);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Species_Creature_Snapper);
    default Meshes.Last().Mesh                 = n"SkeletalMesh'/Game/Assets/Characters/Creatures/Snapper/SK_Snapper_LOD5.SK_Snapper_LOD5'";
    default Meshes.Last().WalkingAnimationLoop = n"AnimSequence'/Game/AnimLibrary/Creatures/Snapper/Movement/Grounded/N/Walk/A_Snapper_WalkFwd.A_Snapper_WalkFwd'";
    default Meshes.Last().IdleAnimationLoop    = n"AnimSequence'/Game/AnimLibrary/Creatures/Snapper/Movement/Idles/Breath/A_Snapper_Idle_01.A_Snapper_Idle_01'";


    // default Meshes.Add(DefaultCreatureSettings);
    // default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Species_Creature_Golem_Stone);
    // default Meshes.Last().Mesh                 = n"SkeletalMesh'/Game/Assets/Characters/Creatures/Stone_Golem/SK_Stone_Golem_LOD5.SK_Stone_Golem_LOD5'";
    // default Meshes.Last().WalkingAnimationLoop = n"AnimSequence'/Game/AnimLibrary/Creatures/Stone_Golem/Movement/Grounded/N/Walk/A_Stone_Golem_WalkFwd.A_Stone_Golem_WalkFwd'";
    // default Meshes.Last().IdleAnimationLoop    = n"AnimSequence'/Game/AnimLibrary/Creatures/Stone_Golem/Movement/Idles/Breath/A_Stone_Golem_Idle_01.A_Stone_Golem_Idle_01'";


    // default Meshes.Add(DefaultCreatureSettings);
    // default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Species_Creature_Swampshark);
    // default Meshes.Last().Mesh                 = n"SkeletalMesh'/Game/Assets/Characters/Creatures/Swampshark/SK_Swampshark_LOD5.SK_Swampshark_LOD5'";
    // default Meshes.Last().IdleAnimationLoop    = n"AnimSequence'/Game/AnimLibrary/Creatures/Swampshark/GeneralIdles/A_Swampshark_Idle_01.A_Swampshark_Idle_01'";


    // default Meshes.Add(DefaultCreatureSettings);
    // default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Species_Creature_Troll_Adult);
    // default Meshes.Last().Mesh                 = n"SkeletalMesh'/Game/Assets/Characters/Creatures/Troll/SK_AdultTroll_LOD5.SK_AdultTroll_LOD5'";
    // default Meshes.Last().WalkingAnimationLoop = n"AnimSequence'/Game/AnimLibrary/Creatures/Troll/Movement/Grounded/N/Walk/A_Troll_WalkFwd.A_Troll_WalkFwd'";
    // default Meshes.Last().IdleAnimationLoop    = n"AnimSequence'/Game/AnimLibrary/Creatures/Troll/Movement/Idles/Breath/A_Troll_Idle_01.A_Troll_Idle_01'";


    // default Meshes.Add(DefaultCreatureSettings);
    // default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Species_Creature_Troll_Juvenile);
    // default Meshes.Last().Mesh                 = n"SkeletalMesh'/Game/Assets/Characters/Creatures/Troll/SK_JuvenileTroll_LOD5.SK_JuvenileTroll_LOD5'";
    // default Meshes.Last().WalkingAnimationLoop = n"AnimSequence'/Game/AnimLibrary/Creatures/Troll/Movement/Grounded/N/Walk/A_Troll_WalkFwd.A_Troll_WalkFwd'";
    // default Meshes.Last().IdleAnimationLoop    = n"AnimSequence'/Game/AnimLibrary/Creatures/Troll/Movement/Idles/Breath/A_Troll_Idle_01.A_Troll_Idle_01'";


    default Meshes.Add(DefaultCreatureSettings);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Species_Creature_Wolf);
    default Meshes.Last().Mesh                 = n"SkeletalMesh'/Game/Assets/Characters/Creatures/Wolf/SK_Wolf_LOD5.SK_Wolf_LOD5'";
    default Meshes.Last().WalkingAnimationLoop = n"AnimSequence'/Game/AnimLibrary/Creatures/Wolf/Movement/Grounded/N/Walk/A_Wolf_WalkFwd.A_Wolf_WalkFwd'";
    default Meshes.Last().IdleAnimationLoop    = n"AnimSequence'/Game/AnimLibrary/Creatures/Wolf/Movement/Idles/Breath/A_Wolf_Idle_01.A_Wolf_Idle_01'";

    default Meshes.Add(DefaultCreatureSettings);
    default Meshes.Last().SelectIfHasAllOf.AddTag(GameplayTag::Species_Creature_Undead_Zombie);
    default Meshes.Last().Mesh                 = n"SkeletalMesh'/Game/Assets/Characters/Creatures/Zombie/Mutable/SK_Zombie_01_LOD5.SK_Zombie_01_LOD5'";
    default Meshes.Last().WalkingAnimationLoop = n"AnimSequence'/Game/AnimLibrary/Creatures/Zombie/Movement/Grounded/N/Walk/A_Zombie_WalkFwd.A_Zombie_WalkFwd'";
    default Meshes.Last().IdleAnimationLoop    = n"AnimSequence'/Game/AnimLibrary/Creatures/Zombie/Movement/Idles/Breath/A_Zombie_Pose01_Idle_01.A_Zombie_Pose01_Idle_01'";
}