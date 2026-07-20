#ifdef WITH_STORY_G1R

UCLASS(meta=(DisplayName="Quest XY - Simple Example"))
class URegionTrait_Story_Quest_SimpleExample : UStoryActionRegionTrait
{
    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
        FindCharacter(n"OC_STT_DIEGO").AI.StartAttackingImmediately(Hero.CharacterState);
    }
}

UCLASS(meta=(DisplayName="Quest XY - Do Example Things"))
class URegionTrait_Story_Quest_DoExampleThings : UStoryActionRegionTrait
{
    default bEnableTriggerLimit = true;
    default NumTimesToTrigger = 1;

    // Example: Add quest condition via AS
    default QuestRequirements.FindOrAdd(G1R::Quest::UQuest_CreaturesGlossary_MoleratGlossary::StaticClass()).bRunning = true;
    
    // Example: Add Character condition via AS
    default CharacterRequirements.Add(FRegionStoryActionCharacterCondition());
    default CharacterRequirements.Last().CharacterName = n"Hero";
    default CharacterRequirements.Last().MustBeCloseToSpot = FInteractionSpotHandle(n"FP_MY_SPOT");
    default CharacterRequirements.Last().WithTheseTags.AddTag(GameplayTag::State_Combat);

    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
        // Example: Change daily routine of all characters with unique name SOME_UNIQUE_NAME
        for (auto NPC : FindCharacter(n"SOME_UNIQUE_NAME").AllNPCStates)
        {
            NPC.ExchangeDailyRoutineToClass(UDailyRoutine_StandAround_Only::StaticClass());
        }

        // Example: Let all charaters with UniqueName MY_SPECIAL_MOLERAT attack the hero
        for (auto NPC : FindCharacter(n"MY_SPECIAL_MOLERAT").AllNPCStates)
        {
            NPC.AI.StartAttackingImmediately(Hero.CharacterState);
        }

        // Example: Change the daily routine of a single NPC
        FindCharacter(n"OC_STT_DIEGO").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_StandAround_Only::StaticClass());
    }
}

UCLASS(meta=(DisplayName="Quest XY - Do Parametrized Example Things"))
class URegionTrait_Story_Quest_DoParametrizedExampleThings : UStoryActionRegionTrait
{
    /** This will be visible and editable in Unreal. */
    UPROPERTY(Category=ExampleParameters)
    TSubclassOf<UAIState_DailyRoutine> NewRoutineClass;

    /** This will be visible and editable in Unreal as a dropdown list with CharacterNames. */
    UPROPERTY(Category=ExampleParameters)
    FCharacterUniqueName CharacterToAttack;

    /** This will be visible and editable in Unreal as a dropdown list with CharacterNames. */
    UPROPERTY(Category=ExampleParameters)
    FCharacterUniqueName Attacker;

    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
        Attacker.AI.StartAttackingImmediately(CharacterToAttack.CharacterState);
    }
}

UCLASS(meta=(DisplayName="Stop Training Fight"))
class URegionTrait_Story_Quest_StopTrainingFight : UStoryActionRegionTrait
{
    /** This will be visible and editable in Unreal as a dropdown list with CharacterNames. */
    UPROPERTY(Category=ExampleParameters)
    FCharacterUniqueName Attacker;

    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
        Attacker.AI.StopTrainingFight();
    }
}

/** Generic region trait: selectable NPCs (non-player characters) that enter the region lose all perceptions (sight, hearing, smell). Perception is restored when they leave. */
UCLASS(meta=(DisplayName="NPCs in region lose all perceptions"))
class URegionTrait_Story_Generic_NPCsLoseAllPerceptions : UStoryActionRegionTrait
{
    UPROPERTY()
    TSet<AGothicCharacterState> m_NPCsWithPerceptionsDisabled;

    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
        if (!IsValid(CharacterState) || !IsValid(CharacterState.Character))
            return;
        if (CharacterState.Character.IsPlayerCharacter())
            return;
        if (!IsValid(CharacterState.AbilitySystemComponent))
            return;

        CharacterState.AbilitySystemComponent.AddLooseGameplayTag(GameplayTag::Debuff_Blind);
        CharacterState.AbilitySystemComponent.AddLooseGameplayTag(GameplayTag::Debuff_Deaf);
        CharacterState.AbilitySystemComponent.AddLooseGameplayTag(GameplayTag::Debuff_Anosmic);
        m_NPCsWithPerceptionsDisabled.Add(CharacterState);
    }

    UFUNCTION(BlueprintOverride)
    void HandleCharacterLeavingRegion(AGothicCharacterState CharacterState)
    {
        if (!m_NPCsWithPerceptionsDisabled.Contains(CharacterState))
            return;
        if (IsValid(CharacterState) && IsValid(CharacterState.AbilitySystemComponent))
        {
            CharacterState.AbilitySystemComponent.RemoveLooseGameplayTag(GameplayTag::Debuff_Blind);
            CharacterState.AbilitySystemComponent.RemoveLooseGameplayTag(GameplayTag::Debuff_Deaf);
            CharacterState.AbilitySystemComponent.RemoveLooseGameplayTag(GameplayTag::Debuff_Anosmic);
        }
        m_NPCsWithPerceptionsDisabled.Remove(CharacterState);
    }

    UFUNCTION(BlueprintOverride)
    void HandleHandleOwnerEndPlay()
    {
        for (auto NPCState : m_NPCsWithPerceptionsDisabled)
        {
            if (IsValid(NPCState) && IsValid(NPCState.AbilitySystemComponent))
            {
                NPCState.AbilitySystemComponent.RemoveLooseGameplayTag(GameplayTag::Debuff_Blind);
                NPCState.AbilitySystemComponent.RemoveLooseGameplayTag(GameplayTag::Debuff_Deaf);
                NPCState.AbilitySystemComponent.RemoveLooseGameplayTag(GameplayTag::Debuff_Anosmic);
            }
        }
        m_NPCsWithPerceptionsDisabled.Empty();
    }
}

/** Generic region trait: selectable NPCs (non-player characters) that enter the region have their weapon preference for ranged set to 0. Preference is restored upon leaving. */
UCLASS(meta=(DisplayName="NPCs in region can't use ranged weapons"))
class URegionTrait_Story_Generic_NPCWontUseRangedWeapons : UStoryActionRegionTrait
{
    UPROPERTY()
    private TSet<AGothicCharacterState> m_NPCsWithChangedPersonality;

    UPROPERTY()
    private TMap<AGothicCharacterState, TSubclassOf<UGothicCharacterPersonality>> m_NPCOriginalPersonality;

    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
        if (!IsValid(CharacterState) || !IsValid(CharacterState.Character))
            return;

        m_NPCOriginalPersonality.Add(CharacterState, CharacterState.CurrentPersonality);

        if (CharacterState.IsPersonalityBrave())
        {
            CharacterState.SetCurrentPersonality(UGothicCharacterPersonality_NoRanged_Brave);
            return;
        }

        if (CharacterState.IsPersonalityCoward())
        {
            CharacterState.SetCurrentPersonality(UGothicCharacterPersonality_NoRanged_Coward);
            return;
        }

        CharacterState.SetCurrentPersonality(UGothicCharacterPersonality_NoRanged);
    }

    UFUNCTION(BlueprintOverride)
    void HandleCharacterLeavingRegion(AGothicCharacterState CharacterState)
    {
        if (!m_NPCsWithChangedPersonality.Contains(CharacterState))
            return;

        TSubclassOf<UGothicCharacterPersonality> PersonalityClass;
        if (!m_NPCOriginalPersonality.Find(CharacterState, PersonalityClass))
            return;

        if (!IsValid(PersonalityClass))
            return;
        
        CharacterState.SetCurrentPersonality(PersonalityClass);
        m_NPCsWithChangedPersonality.Remove(CharacterState);
    }

    UFUNCTION(BlueprintOverride)
    void HandleHandleOwnerEndPlay()
    {
        for (auto NPCState : m_NPCsWithChangedPersonality)
        {
            TSubclassOf<UGothicCharacterPersonality> PersonalityClass;
            if (!m_NPCOriginalPersonality.Find(NPCState, PersonalityClass))
                return;

            if (!IsValid(PersonalityClass))
                return;
            
            NPCState.SetCurrentPersonality(PersonalityClass);
        }
        m_NPCsWithChangedPersonality.Empty();
    }
}

void ActivateConvoyRaid(UStoryActionRegionTrait RegionTrait, bool bFallback = false)
{
    if (G1R::UStoryG1R::Get().Convoy_RaidStart == 1)
        return;

    G1R::UStoryG1R::Get().Convoy_RaidStart = 1;

    auto NC_ORG_Butch_851 = RegionTrait.FindCharacter(n"NC_ORG_Butch_851");
    auto NC_ORG_Rogue35_884N = RegionTrait.FindCharacter(n"NC_ORG_Rogue35_884N");
    auto NC_ORG_Rogue34_883N = RegionTrait.FindCharacter(n"NC_ORG_Rogue34_883N");
    auto NC_ORG_Rogue33_882N = RegionTrait.FindCharacter(n"NC_ORG_Rogue33_882N");
    auto NC_ORG_Wedge_850 = RegionTrait.FindCharacter(n"NC_ORG_Wedge_850");
    auto NC_ORG_Rogue37_886N = RegionTrait.FindCharacter(n"NC_ORG_Rogue37_886N");
    auto NC_ORG_Rogue36_885N = RegionTrait.FindCharacter(n"NC_ORG_Rogue36_885N");

    auto OC_GRD_Guard31_283N = RegionTrait.FindCharacter(n"OC_GRD_Guard31_283N");
    auto OC_GRD_Guard32_284N = RegionTrait.FindCharacter(n"OC_GRD_Guard32_284N");
    auto OC_GRD_Guard33_285N = RegionTrait.FindCharacter(n"OC_GRD_Guard33_285N");
    auto OC_GRD_Guard34_286N = RegionTrait.FindCharacter(n"OC_GRD_Guard34_286N");
    auto OC_GRD_Guard35_287N = RegionTrait.FindCharacter(n"OC_GRD_Guard35_287N");
    auto OC_GRD_Guard36_288N = RegionTrait.FindCharacter(n"OC_GRD_Guard36_288N");
    auto OC_GRD_Guard37_289N = RegionTrait.FindCharacter(n"OC_GRD_Guard37_289N");
    auto OC_GRD_Guard38_290N = RegionTrait.FindCharacter(n"OC_GRD_Guard38_290N");
    auto OC_GRD_Guard39_291N = RegionTrait.FindCharacter(n"OC_GRD_Guard39_291N");

    if (IsValid(NC_ORG_Rogue33_882N.NPCState)) NC_ORG_Rogue33_882N.NPCState.GiveImmortality();
    if (IsValid(NC_ORG_Rogue34_883N.NPCState)) NC_ORG_Rogue34_883N.NPCState.GiveImmortality();
    if (IsValid(NC_ORG_Rogue35_884N.NPCState)) NC_ORG_Rogue35_884N.NPCState.GiveImmortality();
    if (IsValid(NC_ORG_Rogue36_885N.NPCState)) NC_ORG_Rogue36_885N.NPCState.GiveImmortality();
    if (IsValid(NC_ORG_Rogue37_886N.NPCState)) NC_ORG_Rogue37_886N.NPCState.GiveImmortality();

    if (IsValid(OC_GRD_Guard31_283N.NPCState)) OC_GRD_Guard31_283N.NPCState.GiveImmortality();
    if (IsValid(OC_GRD_Guard32_284N.NPCState)) OC_GRD_Guard32_284N.NPCState.GiveImmortality();
    if (IsValid(OC_GRD_Guard33_285N.NPCState)) OC_GRD_Guard33_285N.NPCState.GiveImmortality();
    if (IsValid(OC_GRD_Guard34_286N.NPCState)) OC_GRD_Guard34_286N.NPCState.GiveImmortality();
    if (IsValid(OC_GRD_Guard35_287N.NPCState)) OC_GRD_Guard35_287N.NPCState.GiveImmortality();
    if (IsValid(OC_GRD_Guard36_288N.NPCState)) OC_GRD_Guard36_288N.NPCState.GiveImmortality();
    if (IsValid(OC_GRD_Guard37_289N.NPCState)) OC_GRD_Guard37_289N.NPCState.GiveImmortality();
    if (IsValid(OC_GRD_Guard38_290N.NPCState)) OC_GRD_Guard38_290N.NPCState.GiveImmortality();
    if (IsValid(OC_GRD_Guard39_291N.NPCState)) OC_GRD_Guard39_291N.NPCState.GiveImmortality();

    TArray<AGothicCharacterState> RogueCharacterStates;
    RogueCharacterStates.Add(NC_ORG_Butch_851.CharacterState);
    RogueCharacterStates.Add(NC_ORG_Rogue35_884N.CharacterState);
    RogueCharacterStates.Add(NC_ORG_Rogue34_883N.CharacterState);
    RogueCharacterStates.Add(NC_ORG_Rogue33_882N.CharacterState);
    RogueCharacterStates.Add(NC_ORG_Wedge_850.CharacterState);
    RogueCharacterStates.Add(NC_ORG_Rogue37_886N.CharacterState);
    RogueCharacterStates.Add(NC_ORG_Rogue36_885N.CharacterState);

    TArray<AGothicCharacterState> GuardCharacterStates;
    GuardCharacterStates.Add(OC_GRD_Guard31_283N.CharacterState);
    GuardCharacterStates.Add(OC_GRD_Guard32_284N.CharacterState);
    GuardCharacterStates.Add(OC_GRD_Guard33_285N.CharacterState);
    GuardCharacterStates.Add(OC_GRD_Guard34_286N.CharacterState);
    GuardCharacterStates.Add(OC_GRD_Guard35_287N.CharacterState);
    GuardCharacterStates.Add(OC_GRD_Guard36_288N.CharacterState);
    GuardCharacterStates.Add(OC_GRD_Guard37_289N.CharacterState);
    GuardCharacterStates.Add(OC_GRD_Guard38_290N.CharacterState);
    GuardCharacterStates.Add(OC_GRD_Guard39_291N.CharacterState);

    TArray<AGothicCharacterState> CharacterStates;
    CharacterStates.Append(RogueCharacterStates);
    CharacterStates.Append(GuardCharacterStates);
    if (bFallback)
    {
        auto HeroRef = RegionTrait.FindCharacter(n"Hero");
        if (IsValid(HeroRef.CharacterState))
            CharacterStates.Add(HeroRef.CharacterState);
    }

    // Assign rogue - guard pairings (in fallback: Butch, Rogue33, Wedge skip fixed target)
    if (IsValid(NC_ORG_Butch_851.NPCState))
        NC_ORG_Butch_851.NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_NC_ORG_Butch_851_AfterConvoy::StaticClass());
    if (IsValid(NC_ORG_Butch_851.AI) && IsValid(OC_GRD_Guard32_284N.CharacterState) && !bFallback)
        NC_ORG_Butch_851.AI.StartAttackingImmediately(OC_GRD_Guard32_284N.CharacterState);

    if (IsValid(NC_ORG_Rogue35_884N.NPCState))
        NC_ORG_Rogue35_884N.NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_NC_ORG_Rogue35_884N_AfterConvoy::StaticClass());
    if (IsValid(NC_ORG_Rogue35_884N.AI) && IsValid(OC_GRD_Guard36_288N.CharacterState))
        NC_ORG_Rogue35_884N.AI.StartAttackingImmediately(OC_GRD_Guard36_288N.CharacterState);

    if (IsValid(NC_ORG_Rogue34_883N.NPCState))
        NC_ORG_Rogue34_883N.NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_NC_ORG_Rogue34_883N_AfterConvoy::StaticClass());
    if (IsValid(NC_ORG_Rogue34_883N.AI) && IsValid(OC_GRD_Guard35_287N.CharacterState))
        NC_ORG_Rogue34_883N.AI.StartAttackingImmediately(OC_GRD_Guard35_287N.CharacterState);

    if (IsValid(NC_ORG_Rogue33_882N.NPCState))
        NC_ORG_Rogue33_882N.NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_NC_ORG_Rogue33_882N_AfterConvoy::StaticClass());
    if (IsValid(NC_ORG_Rogue33_882N.AI) && IsValid(OC_GRD_Guard33_285N.CharacterState) && !bFallback)
        NC_ORG_Rogue33_882N.AI.StartAttackingImmediately(OC_GRD_Guard33_285N.CharacterState);

    if (IsValid(NC_ORG_Wedge_850.NPCState))
        NC_ORG_Wedge_850.NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_NC_ORG_Wedge_850_AfterConvoy::StaticClass());
    if (IsValid(NC_ORG_Wedge_850.AI) && IsValid(OC_GRD_Guard39_291N.CharacterState) && !bFallback)
        NC_ORG_Wedge_850.AI.StartAttackingImmediately(OC_GRD_Guard39_291N.CharacterState);

    if (IsValid(NC_ORG_Rogue37_886N.NPCState))
        NC_ORG_Rogue37_886N.NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_NC_ORG_Rogue37_886N_AfterConvoy::StaticClass());
    if (IsValid(NC_ORG_Rogue37_886N.AI) && IsValid(OC_GRD_Guard34_286N.CharacterState))
        NC_ORG_Rogue37_886N.AI.StartAttackingImmediately(OC_GRD_Guard34_286N.CharacterState);

    if (IsValid(NC_ORG_Rogue36_885N.NPCState))
        NC_ORG_Rogue36_885N.NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_NC_ORG_Rogue36_885N_AfterConvoy::StaticClass());
    if (IsValid(NC_ORG_Rogue36_885N.AI) && IsValid(OC_GRD_Guard37_289N.CharacterState))
        NC_ORG_Rogue36_885N.AI.StartAttackingImmediately(OC_GRD_Guard37_289N.CharacterState);

    // Full awareness for all participants so they switch targets when their current one is defeated
    for (auto RogueCharacterState : RogueCharacterStates)
    {
        if (!IsValid(RogueCharacterState) || !IsValid(RogueCharacterState.AI))
            continue;
        RogueCharacterState.AI.ForceHearingPerception(CharacterStates);
        RogueCharacterState.AI.ForceSightPerception(CharacterStates);
    }
    for (auto GuardCharacterState : GuardCharacterStates)
    {
        if (!IsValid(GuardCharacterState) || !IsValid(GuardCharacterState.AI))
            continue;
        GuardCharacterState.AI.ForceHearingPerception(CharacterStates);
        GuardCharacterState.AI.ForceSightPerception(CharacterStates);
    }

    // Fallback (not briefed): Guard31, Guard32, Guard33, Wedge attack the Hero
    if (bFallback)
    {
        auto HeroRef = RegionTrait.FindCharacter(n"Hero");
        if (IsValid(HeroRef.CharacterState))
        {
            AGothicCharacterState HeroState = HeroRef.CharacterState;
            if (IsValid(OC_GRD_Guard31_283N.AI))
                OC_GRD_Guard31_283N.AI.StartAttackingImmediately(HeroState);
            if (IsValid(OC_GRD_Guard32_284N.AI))
                OC_GRD_Guard32_284N.AI.StartAttackingImmediately(HeroState);
            if (IsValid(OC_GRD_Guard33_285N.AI))
                OC_GRD_Guard33_285N.AI.StartAttackingImmediately(HeroState);
            if (IsValid(NC_ORG_Wedge_850.AI))
                NC_ORG_Wedge_850.AI.StartAttackingImmediately(HeroState);
        }
    }
}

// Briefed but messed up: run after ActivateConvoyRaid(this). Same raid as happy path but Guard31, Guard32, Guard33 attacking the Hero.
void ConvoyRaid_AddGuards31_32_33_AttackHero(UStoryActionRegionTrait RegionTrait)
{
    auto HeroRef = RegionTrait.FindCharacter(n"Hero");
    if (!IsValid(HeroRef.CharacterState))
        return;
    AGothicCharacterState HeroState = HeroRef.CharacterState;
    auto OC_GRD_Guard31_283N = RegionTrait.FindCharacter(n"OC_GRD_Guard31_283N");
    auto OC_GRD_Guard32_284N = RegionTrait.FindCharacter(n"OC_GRD_Guard32_284N");
    auto OC_GRD_Guard33_285N = RegionTrait.FindCharacter(n"OC_GRD_Guard33_285N");
    if (IsValid(OC_GRD_Guard31_283N.AI))
        OC_GRD_Guard31_283N.AI.StartAttackingImmediately(HeroState);
    if (IsValid(OC_GRD_Guard32_284N.AI))
        OC_GRD_Guard32_284N.AI.StartAttackingImmediately(HeroState);
    if (IsValid(OC_GRD_Guard33_285N.AI))
        OC_GRD_Guard33_285N.AI.StartAttackingImmediately(HeroState);
}

TArray<AGothicCharacterState> GetLivingConvoyCharacterStates(UStoryActionRegionTrait RegionTrait)
{
    TArray<FName> Names;
    Names.Add(n"OC_GRD_Guard31_283N"); Names.Add(n"OC_GRD_Guard32_284N");
    Names.Add(n"OC_GRD_Guard33_285N"); Names.Add(n"OC_GRD_Guard34_286N");
    Names.Add(n"OC_GRD_Guard35_287N"); Names.Add(n"OC_GRD_Guard36_288N");
    Names.Add(n"OC_GRD_Guard37_289N"); Names.Add(n"OC_GRD_Guard38_290N");
    Names.Add(n"OC_GRD_Guard39_291N");

    TArray<AGothicCharacterState> Living;
    for (FName NPCName : Names)
    {
        auto Ref = RegionTrait.FindCharacter(NPCName);
        if (!IsValid(Ref.CharacterState)
            || Ref.CharacterState.HasGameplayTag(GameplayTag::State_Dead)
            || Ref.CharacterState.HasGameplayTag(GameplayTag::State_Defeated))
            continue;
        Living.Add(Ref.CharacterState);
    }
    return Living;
}

// Returns false if no living Guards remain (caller stops the timer)
bool RefreshConvoyPerceptions(UStoryActionRegionTrait RegionTrait)
{
    TArray<AGothicCharacterState> Living = GetLivingConvoyCharacterStates(RegionTrait);
    if (Living.Num() == 0)
        return false;
    for (auto State : Living)
    {
        if (!IsValid(State.AI))
            continue;
        State.AI.ForceHearingPerception(Living);
        State.AI.ForceSightPerception(Living);
    }
    return true;
}

UCLASS(meta=(DisplayName="Quest CONVOY"))
class URegionTrait_Story_Quest_ConvoyAttack : UStoryActionRegionTrait
{
    UPROPERTY() FTimerHandle m_ConvoyRefreshTimer;
    UPROPERTY() int32 m_ConvoyRefreshCount = 0;

    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
        ActivateConvoyRaid(this);
        if (!System::IsTimerActiveHandle(m_ConvoyRefreshTimer))
        {
            m_ConvoyRefreshCount = 0;
            m_ConvoyRefreshTimer = System::SetTimerDelegate(FTimerDynamicDelegate(this, n"ConvoyPerceptionRefresh"), 1.0f, true);
        }
    }

    UFUNCTION()
    void ConvoyPerceptionRefresh()
    {
        m_ConvoyRefreshCount++;
        if (m_ConvoyRefreshCount >= 300 || !RefreshConvoyPerceptions(this))
            System::ClearAndInvalidateTimerHandle(m_ConvoyRefreshTimer);
    }

    UFUNCTION(BlueprintOverride)
    void HandleHandleOwnerEndPlay()
    {
        System::ClearAndInvalidateTimerHandle(m_ConvoyRefreshTimer);
    }
}

// Fallback triggers when combat starts in convoy area outside the happy path (e.g. player attacks first).
UCLASS(meta=(DisplayName="Quest CONVOY Fallback"))
class URegionTrait_Story_Quest_ConvoyAttackFallback : UStoryActionRegionTrait
{
    UPROPERTY()
    FTimerHandle m_ConvoyFallbackPollTimer;

    UPROPERTY()
    FTimerHandle m_ConvoyRefreshTimer;
    UPROPERTY()
    int32 m_ConvoyRefreshCount = 0;

    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
        if (G1R::Quest::NewCamp_NCCHAPTER1_CONVOY == nullptr || !G1R::Quest::NewCamp_NCCHAPTER1_CONVOY.IsRunning())
            return;
        if (G1R::UStoryG1R::Get().Convoy_RaidStart == 1)
            return;

        // A convoy NPC (guard/rogue) entered region while in combat (only trigger if their opponent is Hero or another convoy NPC)
        if (CharacterState.HasGameplayTag(GameplayTag::State_Combat) && IsConvoyNPC(CharacterState.CharacterUniqueName) && IsAnyConvoyNPCInCombatWithConvoyOrHero())
        {
            TryTriggerFallbackRaid();
            return;
        }

        if (CharacterState.CharacterUniqueName == n"Hero" && IsAnyConvoyNPCInCombatWithConvoyOrHero())
        {
            TryTriggerFallbackRaid();
            return;
        }

        if (!System::IsTimerActiveHandle(m_ConvoyFallbackPollTimer))
        {
            m_ConvoyFallbackPollTimer = System::SetTimerDelegate(FTimerDynamicDelegate(this, n"ConvoyFallbackPoll"), 0.5f, true);
        }
    }

    UFUNCTION()
    void ConvoyFallbackPoll()
    {
        if (G1R::UStoryG1R::Get().Convoy_RaidStart == 1 || G1R::Quest::NewCamp_NCCHAPTER1_CONVOY == nullptr || !G1R::Quest::NewCamp_NCCHAPTER1_CONVOY.IsRunning())
        {
            StopConvoyFallbackPoll();
            return;
        }
        if (IsAnyConvoyNPCInCombatWithConvoyOrHero())
        {
            TryTriggerFallbackRaid();
            StopConvoyFallbackPoll();
            return;
        }
    }

    void StopConvoyFallbackPoll()
    {
        if (System::IsTimerActiveHandle(m_ConvoyFallbackPollTimer))
        {
            System::ClearAndInvalidateTimerHandle(m_ConvoyFallbackPollTimer);
        }
    }

    void TryTriggerFallbackRaid()
    {
        if (G1R::UStoryG1R::Get().Convoy_RaidStart == 1)
            return;
        bool bBriefed = G1R::UStoryG1R::Get().Convoy_PlayerBriefed == 1;
        if (bBriefed)
        {
            ActivateConvoyRaid(this);
            ConvoyRaid_AddGuards31_32_33_AttackHero(this);
        }
        else
        {
            ActivateConvoyRaid(this, true);
            if (G1R::Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr)
                G1R::Quest::NewCamp_NCCHAPTER1_CONVOY.FailQuest();
            G1R::UStoryG1R::Get().Convoy_RaidStartTime = FInGameTime::Now();
        }
        if (!System::IsTimerActiveHandle(m_ConvoyRefreshTimer))
        {
            m_ConvoyRefreshCount = 0;
            m_ConvoyRefreshTimer = System::SetTimerDelegate(FTimerDynamicDelegate(this, n"ConvoyPerceptionRefresh"), 1.0f, true);
        }
    }

    UFUNCTION()
    void ConvoyPerceptionRefresh()
    {
        m_ConvoyRefreshCount++;
        if (m_ConvoyRefreshCount >= 300 || !RefreshConvoyPerceptions(this))
            System::ClearAndInvalidateTimerHandle(m_ConvoyRefreshTimer);
    }

    UFUNCTION(BlueprintOverride)
    void HandleHandleOwnerEndPlay()
    {
        StopConvoyFallbackPoll();
        System::ClearAndInvalidateTimerHandle(m_ConvoyRefreshTimer);
    }

    bool IsConvoyNPC(FName UniqueName) const
    {
        return UniqueName == n"NC_ORG_Butch_851"    || UniqueName == n"NC_ORG_Rogue35_884N" || UniqueName == n"NC_ORG_Rogue34_883N"
            || UniqueName == n"NC_ORG_Rogue33_882N" || UniqueName == n"NC_ORG_Wedge_850"    || UniqueName == n"NC_ORG_Rogue37_886N"
            || UniqueName == n"NC_ORG_Rogue36_885N" || UniqueName == n"OC_GRD_Guard31_283N" || UniqueName == n"OC_GRD_Guard32_284N"
            || UniqueName == n"OC_GRD_Guard33_285N" || UniqueName == n"OC_GRD_Guard34_286N" || UniqueName == n"OC_GRD_Guard35_287N"
            || UniqueName == n"OC_GRD_Guard36_288N" || UniqueName == n"OC_GRD_Guard37_289N" || UniqueName == n"OC_GRD_Guard38_290N"
            || UniqueName == n"OC_GRD_Guard39_291N";
    }

    bool IsRogueConvoyNPC(FName UniqueName) const
    {
        return UniqueName == n"NC_ORG_Butch_851"    || UniqueName == n"NC_ORG_Rogue35_884N" || UniqueName == n"NC_ORG_Rogue34_883N"
            || UniqueName == n"NC_ORG_Rogue33_882N" || UniqueName == n"NC_ORG_Wedge_850"    || UniqueName == n"NC_ORG_Rogue37_886N"
            || UniqueName == n"NC_ORG_Rogue36_885N";
    }

    bool IsAnyConvoyNPCInCombatWithConvoyOrHero() const
    {
        TArray<FName> ConvoyNames;
        ConvoyNames.Add(n"NC_ORG_Butch_851");
        ConvoyNames.Add(n"NC_ORG_Rogue35_884N");
        ConvoyNames.Add(n"NC_ORG_Rogue34_883N");
        ConvoyNames.Add(n"NC_ORG_Rogue33_882N");
        ConvoyNames.Add(n"NC_ORG_Wedge_850");
        ConvoyNames.Add(n"NC_ORG_Rogue37_886N");
        ConvoyNames.Add(n"NC_ORG_Rogue36_885N");
        ConvoyNames.Add(n"OC_GRD_Guard31_283N");
        ConvoyNames.Add(n"OC_GRD_Guard32_284N");
        ConvoyNames.Add(n"OC_GRD_Guard33_285N");
        ConvoyNames.Add(n"OC_GRD_Guard34_286N");
        ConvoyNames.Add(n"OC_GRD_Guard35_287N");
        ConvoyNames.Add(n"OC_GRD_Guard36_288N");
        ConvoyNames.Add(n"OC_GRD_Guard37_289N");
        ConvoyNames.Add(n"OC_GRD_Guard38_290N");
        ConvoyNames.Add(n"OC_GRD_Guard39_291N");
        for (FName ConvoyUniqueName : ConvoyNames)
        {
            auto Char = FindCharacter(ConvoyUniqueName);
            if (!IsValid(Char.CharacterState) || !Char.CharacterState.HasGameplayTag(GameplayTag::State_Combat))
                continue;
            if (!IsValid(Char.AI))
                continue;
            auto ConflictGroup = Char.AI.GetGroupOfClass(UAIGroup_ConflictInstance);
            if (!IsValid(ConflictGroup))
                continue;
            if (IsRogueConvoyNPC(ConvoyUniqueName))
                return true;
            auto HeroRef = FindCharacter(n"Hero");
            if (IsValid(HeroRef.CharacterState) && ConflictGroup.IsCharacterInvolved(HeroRef.CharacterState.Character)
                && (Char.CharacterState.IsEnemyTowards(HeroRef.CharacterState) || Char.CharacterState.IsHostileTowards(HeroRef.CharacterState)))
                return true;
            for (FName OtherName : ConvoyNames)
            {
                if (OtherName == ConvoyUniqueName)
                    continue;
                auto OtherRef = FindCharacter(OtherName);
                if (IsValid(OtherRef.CharacterState) && ConflictGroup.IsCharacterInvolved(OtherRef.CharacterState.Character)
                    && (Char.CharacterState.IsEnemyTowards(OtherRef.CharacterState) || Char.CharacterState.IsHostileTowards(OtherRef.CharacterState)))
                    return true;
            }
        }
        return false;
    }
}

UCLASS(meta=(DisplayName="Quest CONVOY Cleanup"))
class URegionTrait_Story_Quest_ConvoyCleanup : UStoryActionRegionTrait
{
    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
        G1R::UStoryG1R::Get().TryConvoyCleanup(CharacterState);
    }

    UFUNCTION(BlueprintOverride)
    void HandleCharacterLeavingRegion(AGothicCharacterState CharacterState)
    {
        G1R::UStoryG1R::Get().TryConvoyCleanup(CharacterState);
    }
}

UCLASS(meta=(DisplayName="ORC ENCLAVE FIGHT"))
class URegionTrait_Story_Quest_OrcEnclaveFight : UStoryActionRegionTrait
{
    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
        if(IsValid(FCharacterUniqueName(n"OW_OWR_OrcWarriorM13_2026").NPCState))
            FindCharacter(n"OW_OWR_OrcWarriorM13_2026").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OW_OWR_OrcWarriorM13_2026_AfterFight::StaticClass());
        if(IsValid(FCharacterUniqueName(n"OW_OWR_OrcWarriorM14_2028").NPCState))
            FindCharacter(n"OW_OWR_OrcWarriorM14_2028").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OW_OWR_OrcWarriorM14_2028_AfterFight::StaticClass());
        if(IsValid(FCharacterUniqueName(n"OW_OWR_OrcWarriorM15_2029").NPCState))
            FindCharacter(n"OW_OWR_OrcWarriorM15_2029").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OW_OWR_OrcWarriorM15_2029_AfterFight::StaticClass());
        if(IsValid(FCharacterUniqueName(n"OW_OWR_OrcWarriorM18_2032").NPCState))
            FindCharacter(n"OW_OWR_OrcWarriorM18_2032").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OW_OWR_OrcWarriorM18_2032_AfterFight::StaticClass());
        if(IsValid(FCharacterUniqueName(n"OW_OWR_OrcWarriorM19_2033").NPCState))
            FindCharacter(n"OW_OWR_OrcWarriorM19_2033").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OW_OWR_OrcWarriorM19_2033_AfterFight::StaticClass());
        if(IsValid(FCharacterUniqueName(n"OW_OPS_OrcPeasantM01_2068").NPCState))
            FindCharacter(n"OW_OPS_OrcPeasantM01_2068").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OW_OPS_OrcPeasantM01_2068_AfterFight::StaticClass());
        if(IsValid(FCharacterUniqueName(n"OW_OPS_OrcPeasantM02_2069").NPCState))
            FindCharacter(n"OW_OPS_OrcPeasantM02_2069").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OW_OPS_OrcPeasantM02_2069_AfterFight::StaticClass());
        if(IsValid(FCharacterUniqueName(n"OW_OPS_OrcPeasantM03_2070").NPCState))
            FindCharacter(n"OW_OPS_OrcPeasantM03_2070").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OW_OPS_OrcPeasantM03_2070_AfterFight::StaticClass());
        if(IsValid(FCharacterUniqueName(n"OW_OPS_OrcPeasantM04_2071").NPCState))
            FindCharacter(n"OW_OPS_OrcPeasantM04_2071").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OW_OPS_OrcPeasantM04_2071_AfterFight::StaticClass());
        if(IsValid(FCharacterUniqueName(n"OW_OPS_OrcPeasantM05_2072").NPCState))
            FindCharacter(n"OW_OPS_OrcPeasantM05_2072").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OW_OPS_OrcPeasantM05_2072_AfterFight::StaticClass());
        if(IsValid(FCharacterUniqueName(n"OW_OPS_OrcPeasantM06_2073").NPCState))
            FindCharacter(n"OW_OPS_OrcPeasantM06_2073").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OW_OPS_OrcPeasantM06_2073_AfterFight::StaticClass());
        if(IsValid(FCharacterUniqueName(n"OW_OPS_OrcPeasantM19_2086").NPCState))
            FindCharacter(n"OW_OPS_OrcPeasantM19_2086").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OW_OPS_OrcPeasantM19_2086_AfterFight::StaticClass());
        if(IsValid(FCharacterUniqueName(n"OW_OPS_OrcPeasantM20_2087").NPCState))
            FindCharacter(n"OW_OPS_OrcPeasantM20_2087").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OW_OPS_OrcPeasantM20_2087_AfterFight::StaticClass());

        if(IsValid(FCharacterUniqueName(n"UL_OSL_UrShak_2200").NPCState))
            FindCharacter(n"UL_OSL_UrShak_2200").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_UL_OSL_UrShak_2200_Wait::StaticClass());

        UPuzzlesSubsystem::GlobalOpenDoor( n"OT_Inner_Door");
        UWorldPointManager::Get().CallGlobalEvent(n"OnOrcEnclaveFightStarted");
    }
} 

UCLASS(meta=(DisplayName="Yberion Invocation"))
class URegionTrait_Story_Quest_Yberion_Invocation : UStoryActionRegionTrait
{

    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
        G1R::UStoryG1R::Get().YberionInvocation();
    }
}

UCLASS(meta=(DisplayName="TrollCanyonFocus"))
class URegionTrait_Story_Quest_TrollCanyonFocus : UStoryActionRegionTrait
{
    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
        if(FindCharacter(n"Hero").CharacterState.HasItem(UItMs_Focus_02,1))
        {
            FindCharacter(n"OC_KDF_Milten").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_KDF_Milten_TcAltar::StaticClass());
        }
    }
}

UCLASS(meta=(DisplayName="BartholoWaitingInFireMagesBuilding"))
class URegionTrait_Story_Quest_BartholoWaitingInFireMagesBuilding : UStoryActionRegionTrait
{
    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
        G1R::UStoryG1R::Get().Bartholo_Teleport_Conversation = 1;
    }

    UFUNCTION(BlueprintOverride)
    void HandleCharacterLeavingRegion(AGothicCharacterState CharacterState)
    {
        G1R::UStoryG1R::Get().Bartholo_Teleport_Conversation = 0;
    }
}

UCLASS(meta=(DisplayName="Talas Come Back"))
class URegionTrait_Story_Quest_Talas_ComeBack : UStoryActionRegionTrait
{

    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
        G1R::UStoryG1R::Get().TalasComeBack();
    }
}

UCLASS(meta=(DisplayName="Camp Divided"))
class URegionTrait_Story_Quest_Camp_Divided : UStoryActionRegionTrait
{

    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
        G1R::UStoryG1R::Get().CampDivided();
    }
}

UCLASS(meta=(DisplayName="KalomistsRevealed"))
class URegionTrait_Story_Quest_KalomistsRevealed : UStoryActionRegionTrait
{

    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
        G1R::UStoryG1R::Get().RevealedKalomists = 1;
    }
}

UCLASS(meta=(DisplayName="HeroInsideOrcThroneRoom"))
class URegionTrait_Story_Quest_HeroInsideOrcThroneRoom : UStoryActionRegionTrait
{

    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
        G1R::UStoryG1R::Get().HeroInsideThroneRoom = 1;
    }

    UFUNCTION(BlueprintOverride)
    void HandleCharacterLeavingRegion(AGothicCharacterState CharacterState)
    {
        G1R::UStoryG1R::Get().HeroInsideThroneRoom = 0;
    }
}


UCLASS(meta=(DisplayName="BanditsCellInside"))
class URegionTrait_Story_Quest_Bandits_Cell_Inside : UStoryActionRegionTrait 
{

    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
        G1R::UStoryG1R::Get().HeroInsideBanditCell = 1;
    }
}

UCLASS(meta=(DisplayName="BanditsCellOutside"))
class URegionTrait_Story_Quest_Bandits_Cell_Outside : UStoryActionRegionTrait
{

    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
        G1R::UStoryG1R::Get().HeroInsideBanditCell = 0;
    }
}

UCLASS(meta=(DisplayName="FortressInside"))
class URegionTrait_Story_Quest_FortressInside : UStoryActionRegionTrait 
{
    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
        G1R::UStoryG1R::Get().Fortress_Inside = 1;
        G1R::UStoryG1R::Get().Fortress_Outside = 0;
    }
}

UCLASS(meta=(DisplayName="FortressOutside"))
class URegionTrait_Story_Quest_FortressOutside : UStoryActionRegionTrait 
{
    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
        G1R::UStoryG1R::Get().Fortress_Inside = 0;
        G1R::UStoryG1R::Get().Fortress_Outside = 1;
    }
}

UCLASS(meta=(DisplayName="MonasteryInside"))
class URegionTrait_Story_Quest_MonasteryInside : UStoryActionRegionTrait 
{
    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
        G1R::UStoryG1R::Get().Monastery_Inside = 1;
        G1R::UStoryG1R::Get().Monastery_Outside = 0;

        if(FindCharacter(n"NC_SLD_Gorn_699").NPCState.HasAssignedDailyRoutine(UDailyRoutine_NC_SLD_Gorn_699_Ruinwait2::StaticClass()))
        {
            FindCharacter(n"NC_SLD_Gorn_699").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_NC_SLD_Gorn_699_Ruinfollow::StaticClass());
        }
    }
}

UCLASS(meta=(DisplayName="MonasteryOutside"))
class URegionTrait_Story_Quest_MonasteryOutside : UStoryActionRegionTrait 
{
    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
        G1R::UStoryG1R::Get().Monastery_Inside = 0;
        G1R::UStoryG1R::Get().Monastery_Outside = 1;

        if(FindCharacter(n"NC_SLD_Gorn_699").NPCState.HasAssignedDailyRoutine(UDailyRoutine_NC_SLD_Gorn_699_Ruinfollow::StaticClass()))
        {
            FindCharacter(n"NC_SLD_Gorn_699").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_NC_SLD_Gorn_699_Ruinwait2::StaticClass());
        }
    }
}

UCLASS(meta=(DisplayName="MonasteryHole"))
class URegionTrait_Story_Quest_MonasteryHole : UStoryActionRegionTrait 
{
    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
        if(FindCharacter(n"NC_SLD_Gorn_699").NPCState.HasAssignedDailyRoutine(UDailyRoutine_NC_SLD_Gorn_699_Ruinfollow::StaticClass()))
        {
            FindCharacter(n"NC_SLD_Gorn_699").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_NC_SLD_Gorn_699_Ruinwall::StaticClass());
        }
    }
}

UCLASS(meta=(DisplayName="StonehengeInside"))
class URegionTrait_Story_Quest_StonehengeInside : UStoryActionRegionTrait 
{
    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
        if(FindCharacter(n"OC_STT_Diego").NPCState.HasAssignedDailyRoutine(UDailyRoutine_OC_STT_Diego_ShGateWait::StaticClass()))
        {
            FindCharacter(n"OC_STT_Diego").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_STT_Diego_FollowStoneHenge::StaticClass());
        }
    }
}

UCLASS(meta=(DisplayName="StonehengeOutside"))
class URegionTrait_Story_Quest_StonehengeOutside : UStoryActionRegionTrait 
{
    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
        if(FindCharacter(n"OC_STT_Diego").NPCState.HasAssignedDailyRoutine(UDailyRoutine_OC_STT_Diego_FollowStoneHenge::StaticClass()))
        {
            FindCharacter(n"OC_STT_Diego").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_STT_Diego_ShGateWait::StaticClass());
        }
    }
}

UCLASS(meta=(DisplayName="TrollCanyonOutside"))
class URegionTrait_Story_Quest_TrollCanyonOutside : UStoryActionRegionTrait 
{
    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
        if(FindCharacter(n"OC_KDF_Milten").NPCState.HasAssignedDailyRoutine(UDailyRoutine_OC_KDF_Milten_TCFollow::StaticClass()))
        {
            FindCharacter(n"OC_KDF_Milten").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_KDF_Milten_TcWaitAtDoor::StaticClass());
        }
    }
}

UCLASS(meta=(DisplayName="URSAHK FIGHT"))
class URegionTrait_Story_Quest_UrshakFight : UStoryActionRegionTrait
{
    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
        //  FindCharacter(n"OW_OWR_OrcTempleWarriorM09_2201").AI.StartAttackingImmediately(FindCharacter(n"UL_OSL_UrShak_2200").NPCState);
        //  FindCharacter(n"OW_OWR_OrcTempleWarriorM10_2202").AI.StartAttackingImmediately(FindCharacter(n"UL_OSL_UrShak_2200").NPCState);
        //  FindCharacter(n"OW_OWR_OrcTempleWarriorM11_2203").AI.StartAttackingImmediately(FindCharacter(n"UL_OSL_UrShak_2200").NPCState);
    }
}

UCLASS(meta=(DisplayName="InsideUrNazkrogCave"))
class URegionTrait_Story_Quest_InsideUrNazkrogCave : UStoryActionRegionTrait
{
    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
        if(FindCharacter(n"OW_OPS_Umakhal_2402").NPCState.HasAssignedDailyRoutine(UDailyRoutine_OW_OPS_Umakhal_2402_Follow::StaticClass()))
        {
            FindCharacter(n"OW_OPS_Umakhal_2402").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OW_OPS_Umakhal_2402_WaitCave::StaticClass());
        }
    }

    UFUNCTION(BlueprintOverride)
    void HandleCharacterLeavingRegion(AGothicCharacterState CharacterState)
    {
        if(FindCharacter(n"OW_OPS_Umakhal_2402").NPCState.HasAssignedDailyRoutine(UDailyRoutine_OW_OPS_Umakhal_2402_WaitCave::StaticClass()))
        {
            FindCharacter(n"OW_OPS_Umakhal_2402").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OW_OPS_Umakhal_2402_Follow::StaticClass());
        }
    }
}

UCLASS(meta=(DisplayName="SLEEPER TEMPLE ENTRANCE"))
class URegionTrait_Story_Quest_SleeperTempleEntrance : UStoryActionRegionTrait
{
    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
        if(!G1R::Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_INTELLIGENCEPATH.HasSucceeded() && !FindCharacter(n"OW_OWR_ToChurnagg_2403").NPCState.IsDead())
        {
            G1R::UStoryG1R::Get().SleeperTempleEntrance();
        }

        if(FindCharacter(n"OW_OWR_ToChurnagg_2403").NPCState.IsDead())
        {
            G1R::Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_ENTRANCE.SucceedQuest();
        }
    }
}

UCLASS(meta=(DisplayName="TEST CHROMANIN"))
class URegionTrait_Story_Quest_Chromanin : UStoryActionRegionTrait
{
    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
        G1R::UStoryG1R::Get().ChromaninRead(6);
    }
}

UCLASS(meta=(DisplayName="TEST BEFORE INVOCATION"))
class URegionTrait_Story_Quest_BeforeInvocation: UStoryActionRegionTrait
{
    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
        G1R::UStoryG1R::Get().BeforeYberionInvocation();
    }
}

UCLASS(meta=(DisplayName="FreeMineRecovered"))
class URegionTrait_Story_Quest_FreeMineRecovered : UStoryActionRegionTrait
{

    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
        G1R::UStoryG1R::Get().Freemine_Recovered = 1;
        G1R::UStoryG1R::Get().DeactivateStoryDataLayer("FreeMine_SecretPath");
    }
}

UCLASS(meta=(DisplayName="DiscoverBanditsCamp"))
class URegionTrait_Story_Quest_DiscoverBanditsCamp : UStoryActionRegionTrait
{

    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
        G1R::Quest::NewCamp_NCCHAPTER3_NCBANDITSCAMP_NCBANDITSCAMP_OBJ_FIND.SucceedQuest();
        G1R::Quest::OldCamp_OCCHAPTER3_OCBANDITSCAMP_OCBANDITSCAMP_OBJ_FIND.SucceedQuest();
        G1R::Quest::SwampCamp_SCCHAPTER3_SCBANDITSCAMP_SCBANDITSCAMP_OBJ_FIND.SucceedQuest();
    }
}

UCLASS(meta=(DisplayName="SaveNovices"))
class URegionTrait_Story_Quest_SaveNovices : UStoryActionRegionTrait
{

    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
        if( G1R::Quest::SwampCamp_SCCHAPTER3_KALOMEXPERIMENTS_KALOMEXPERIMENTS_OBJ_GUIDE.IsRunning())
        {
            G1R::UStoryG1R::Get().NoviceSaved = 1;
        }
    }
}

UCLASS(meta=(DisplayName="FreeMineFactionModifier"))
class URegionTrait_Story_Quest_FreeMineFactionModifier : UStoryActionRegionTrait
{

    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
        if(FindCharacter(n"OC_GRD_Jackal_201").CharacterState.IsDead())
        {
            G1R::UStoryG1R::Get().FMHostile = 1;
        }
    }
}

UCLASS(meta=(DisplayName="FreeMineGornLeaveTeammates"))
class URegionTrait_Story_Quest_FreeMineGornLeaveTeammates : UStoryActionRegionTrait
{

    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
        if(G1R::UStoryG1R::Get().Gorn_JoinedForFM == 1)
        {
            G1R::UStoryG1R::Get().Gorn_AloneForFM = 1;
        }
    }
}

UCLASS(meta=(DisplayName="LocationAbandonedMineOrcGrave"))
class URegionTrait_Story_Location_AbandonMine_OrcGrave : UStoryActionRegionTrait
{

    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
        G1R::UStoryG1R::Get().Location_AbandonedMine_OrcGrave = 1;
    }
}

UCLASS(meta=(DisplayName="BridgeGolemFallback"))
class URegionTrait_Story_BridgeGolemFallback : UStoryActionRegionTrait
{
    default bEnableTriggerLimit = true;
    default NumTimesToTrigger = 1;

    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
        if (!IsValid(CharacterState) || !IsValid(CharacterState.Character) || !CharacterState.Character.IsPlayerCharacter())
            return;

        auto GolemRef = FindCharacter(n"Golem_Stone_Bridge");
        if (IsValid(GolemRef.CharacterState) && IsValid(GolemRef.CharacterState.AbilitySystemComponent))
        {
            GolemRef.CharacterState.AbilitySystemComponent.RemoveActiveGameplayEffectBySourceEffect(
                UGE_BridgeGolem_Dormant::StaticClass(),
                GolemRef.CharacterState.AbilitySystemComponent);
            Log(f"[BridgeGolem] Fallback: removed dormant effect from Bridge Golem.");
        }

        G1R::UStoryG1R::Get().BridgeGolemCombatActive = 1;

        if (!IsValid(Hero.CharacterState))
            return;

        auto LesterRef = FindCharacter(n"SC_NOV_Lester");
        if (IsValid(LesterRef.CharacterState))
        {
            bool bLesterStagedAtBridge = IsValid(LesterRef.NPCState)
                && (LesterRef.NPCState.HasAssignedDailyRoutine(UDailyRoutine_SC_NOV_Lester_Fortresswait::StaticClass())
                    || LesterRef.NPCState.HasAssignedDailyRoutine(UDailyRoutine_SC_NOV_Lester_Fortressfollow::StaticClass()));

            if (!bLesterStagedAtBridge)
            {
                Log(f"[BridgeGolem] Fallback: Lester not staged at bridge (not on Fortresswait/Fortressfollow), skipping party join.");
            }
            else if (!LesterRef.CharacterState.IsDead() && !LesterRef.CharacterState.IsDefeated())
            {
                LesterRef.CharacterState.JoinPartyOf(Hero.CharacterState);
                LesterRef.NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Lester_Fortressfollow);
                Log(f"[BridgeGolem] Fallback: Lester joined Hero party and switched to Fortressfollow.");
            }
        }
    }
}

UCLASS(meta=(DisplayName="StoneGolemBridgeVolume"))
class URegionTrait_Story_StoneGolemBridgeVolume : UStoryActionRegionTrait
{
    UPROPERTY(Category=BridgeGolemEncounter)
    TSubclassOf<UQuest> RequiredQuestForDormancy;

    UPROPERTY()
    FActiveGameplayEffectHandle m_BridgeDormantEffectHandle;

    bool IsEncounterQuestRunning() const
    {
        if (!RequiredQuestForDormancy.IsValid())
            return false;
        auto Quest = UQuestSubsystem::Get().GetQuestByClass(RequiredQuestForDormancy);
        return IsValid(Quest) && Quest.IsRunning();
    }

    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
        if (!IsValid(CharacterState))
            return;

        // Keep the bridge golem dormant until the Hero enters the bridge trigger volume (quest encounter only).
        if (CharacterState.CharacterUniqueName == n"Golem_Stone_Bridge"
            && G1R::UStoryG1R::Get().BridgeGolemCombatActive == 0
            && IsEncounterQuestRunning()
            && IsValid(CharacterState.AbilitySystemComponent))
        {
            if (MagicScript::IsValidGameplayEffectHandle(m_BridgeDormantEffectHandle))
            {
                Log(f"[BridgeGolem] Dormant effect already applied, skipping reapply.");
                return;
            }

            FGameplayEffectContextHandle Context = CharacterState.AbilitySystemComponent.MakeEffectContext();
            FGameplayEffectSpecHandle SpecHandle = CharacterState.AbilitySystemComponent.MakeOutgoingSpec(UGE_BridgeGolem_Dormant::StaticClass(), 1.0f, Context);
            FActiveGameplayEffectHandle EffectHandle = CharacterState.AbilitySystemComponent.ApplyGameplayEffectSpecToSelf(SpecHandle);
            if (MagicScript::IsValidGameplayEffectHandle(EffectHandle) || MagicScript::WasSuccessfullyApplied(EffectHandle))
            {
                m_BridgeDormantEffectHandle = EffectHandle;
                Log(f"[BridgeGolem] Applied dormant effect to Bridge Golem (AIARM suppressed until activation).");
            }
            else
            {
                Log(f"[BridgeGolem] Failed to apply dormant effect.");
            }
            return;
        }

        if (!IsValid(CharacterState.Character) || !CharacterState.Character.IsPlayerCharacter())
            return;

        if (G1R::UStoryG1R::Get().BridgeStoneGolemEnemy != 1 || G1R::UStoryG1R::Get().BridgeGolemCombatActive != 0)
        {
            Log(f"[BridgeGolem] Hero entered but activation preconditions failed (BridgeStoneGolemEnemy={G1R::UStoryG1R::Get().BridgeStoneGolemEnemy}, BridgeGolemCombatActive={G1R::UStoryG1R::Get().BridgeGolemCombatActive}).");
            return;
        }

        G1R::UStoryG1R::Get().BridgeGolemCombatActive = 1;
        Log(f"[BridgeGolem] Activation triggered by Hero entering bridge volume.");

        auto HeroRef = FindCharacter(n"Hero");
        auto GolemRef = FindCharacter(n"Golem_Stone_Bridge");
        auto LesterRef = FindCharacter(n"SC_NOV_Lester");

        if (IsValid(GolemRef.CharacterState) && IsValid(GolemRef.CharacterState.AbilitySystemComponent))
        {
            if (MagicScript::IsValidGameplayEffectHandle(m_BridgeDormantEffectHandle))
            {
                GolemRef.CharacterState.AbilitySystemComponent.RemoveActiveGameplayEffect(m_BridgeDormantEffectHandle);
                Log(f"[BridgeGolem] Removed dormant effect from Bridge Golem.");
            }
        }

        if (IsValid(GolemRef.AI) && IsValid(HeroRef.CharacterState))
        {
            GolemRef.AI.ForceSightPerception(HeroRef.CharacterState);
            GolemRef.AI.ForceHearingPerception(HeroRef.CharacterState);
            //GolemRef.AI.StartAttackingImmediately(HeroRef.CharacterState);
            Log(f"[BridgeGolem] Forced golem perception on Hero.");
        }

        bool bLesterStagedAtBridge = IsValid(LesterRef.NPCState)
            && (LesterRef.NPCState.HasAssignedDailyRoutine(UDailyRoutine_SC_NOV_Lester_Fortresswait::StaticClass())
                || LesterRef.NPCState.HasAssignedDailyRoutine(UDailyRoutine_SC_NOV_Lester_Fortressfollow::StaticClass()));

        if (!bLesterStagedAtBridge)
        {
            Log(f"[BridgeGolem] Lester not staged at bridge (not on Fortresswait/Fortressfollow), skipping party join and combat.");
            return;
        }

        if (IsValid(LesterRef.CharacterState) && IsValid(HeroRef.CharacterState))
        {
            LesterRef.CharacterState.JoinPartyOf(HeroRef.CharacterState);
            Log(f"[BridgeGolem] Ensured Lester joins Hero party.");
        }

        if (IsValid(LesterRef.AI) && IsValid(GolemRef.CharacterState))
        {
            LesterRef.AI.ForceSightPerception(GolemRef.CharacterState);
            LesterRef.AI.ForceHearingPerception(GolemRef.CharacterState);
            LesterRef.AI.StartAttackingImmediately(GolemRef.CharacterState);
            Log(f"[BridgeGolem] Forced Lester perception and immediate attack on Bridge Golem.");
        }
    }

    UFUNCTION(BlueprintOverride)
    void HandleHandleOwnerEndPlay()
    {
        if (!MagicScript::IsValidGameplayEffectHandle(m_BridgeDormantEffectHandle))
            return;

        auto GolemRef = FindCharacter(n"Golem_Stone_Bridge");
        if (IsValid(GolemRef.CharacterState) && IsValid(GolemRef.CharacterState.AbilitySystemComponent))
        {
            GolemRef.CharacterState.AbilitySystemComponent.RemoveActiveGameplayEffect(m_BridgeDormantEffectHandle);
            Log(f"[BridgeGolem] Removed dormant effect during trait end play cleanup.");
        }
    }
}

UCLASS(meta=(DisplayName="ChangeToChapter1"))
class URegionTrait_Story_ChangeToChapter1 : UStoryActionRegionTrait
{

    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
        G1R::UStoryG1R::Get().ChangeChapter(1);
    }
}

UCLASS(meta=(DisplayName="LocationAbandonedMineAfterAmulet"))
class URegionTrait_Story_Location_AbandonedMine_AfterAmulet : UStoryActionRegionTrait
{

    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
        G1R::UStoryG1R::Get().Location_AbandonedMine_AfterAmulet = 1;
    }
}

UCLASS(meta=(DisplayName="OldMineCollapsed"))
class URegionTrait_Story_OldMineCollapsed : UStoryActionRegionTrait
{

    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
        if(G1R::UStoryG1R::Get().Chapter >= 3 && G1R::UStoryG1R::Get().CollapseMineNotify == 0)
        {
            G1R::UStoryG1R::Get().CollapseMineNotify = 1;
            FCharacterUniqueName(n"SC_TPL_Templar23_1440").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_TPL_Templar23_1440_RunToPlayer::StaticClass());
        }
    }
}

UCLASS(meta=(DisplayName="LocationNewCampOrePile"))
class URegionTrait_Story_Location_NewCamp_OrePile : UStoryActionRegionTrait
{

    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
        G1R::UStoryG1R::Get().Location_NewCamp_OrePile = 1;
    }
}

UCLASS(meta=(DisplayName="LocationSwampCampTemple"))
class URegionTrait_Story_Location_SwampCamp_Temple : UStoryActionRegionTrait
{

    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
        G1R::UStoryG1R::Get().Location_SwampCamp_Temple = 1;
    }
}

UCLASS(meta=(DisplayName="LocationOrcEnclaveArena"))
class URegionTrait_Story_Location_OrcEnclave_Arena : UStoryActionRegionTrait
{

    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
        G1R::UStoryG1R::Get().Location_OrcEnclave_Arena = 1;
    }
}

UCLASS(meta=(DisplayName="LocationXardasTowerBedroom"))
class URegionTrait_Story_LLocation_XardasTower_Bedroom : UStoryActionRegionTrait
{

    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
        G1R::UStoryG1R::Get().Location_XardasTower_Bedroom = 1;
    }
}

UCLASS(meta=(DisplayName="LocationOldMineCollapsed"))
class URegionTrait_Story_LLocation_OldMineCollapsed : UStoryActionRegionTrait
{

    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
        G1R::UStoryG1R::Get().Location_OldMineCollapsed = 1;
    }
}

UCLASS(meta=(DisplayName="SilasFound"))
class URegionTrait_Story_SilasFound : UStoryActionRegionTrait
{

    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
        G1R::UStoryG1R::Get().SilasFound = 1;

    }
}

UCLASS(meta=(DisplayName="TrespassingNCTavern"))
class URegionTrait_Story_TrespassingNCTavern : UStoryActionRegionTrait
{

    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
        if( G1R::UStoryG1R::Get().Tavern_Permission == 0)
        {
            FindCharacter(n"NC_ORG_Rogue27_876").AI.StartAttackingImmediately(Hero.CharacterState);
            FindCharacter(n"NC_ORG_Rogue26_875").AI.StartAttackingImmediately(Hero.CharacterState);
        }
    }
}

UCLASS(meta=(DisplayName="GetAccessToNCTavern"))
class URegionTrait_Story_GetAccessToNCTavern : UStoryActionRegionTrait
{

    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
        G1R::UStoryG1R::Get().Tavern_Permission = 1; 
    }
}

UCLASS(meta=(DisplayName="GetRidOfUmakhal"))
class URegionTrait_Story_GetRidOfUmakhal : UStoryActionRegionTrait
{

    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
        G1R::Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_OBJ_RIDOFUMAKHAL.SucceedQuest();
    }
}

UCLASS(meta=(DisplayName="FreeMineJackalSkip"))
class URegionTrait_FreeMine_JackalSkip : UStoryActionRegionTrait
{

    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
        if( G1R::UStoryG1R::Get().FMHostile == 0)
        {
            G1R::UStoryG1R::Get().FreeMineJackal();
        }
    }
}

UCLASS(meta=(DisplayName="HunoForge"))
class URegionTrait_HunoForge : UStoryActionRegionTrait
{

    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
        if(FindCharacter(n"OC_VLK_Huno_538").NPCState.HasAssignedDailyRoutine(UDailyRoutine_OC_VLK_Huno_538_Start::StaticClass()))
        {
            G1R::UStoryG1R::Get().Huno_DailyRoutine = 1;
        }
        else if (FindCharacter(n"OC_VLK_Huno_538").NPCState.HasAssignedDailyRoutine(UDailyRoutine_OC_VLK_Huno_538_InExtremoWait::StaticClass()))
        {
            G1R::UStoryG1R::Get().Huno_DailyRoutine = 2;
        }

        FindCharacter(n"OC_VLK_Huno_538").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Huno_538_HeroInsideForge::StaticClass());
    }

    UFUNCTION(BlueprintOverride)
    void HandleCharacterLeavingRegion(AGothicCharacterState CharacterState)
    {
        if(G1R::UStoryG1R::Get().Huno_DailyRoutine == 1)
        {
            G1R::UStoryG1R::Get().Huno_DailyRoutine = 0;
            FindCharacter(n"OC_VLK_Huno_538").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Huno_538_Start::StaticClass());
        }
        else  if(G1R::UStoryG1R::Get().Huno_DailyRoutine == 2)
        {
            G1R::UStoryG1R::Get().Huno_DailyRoutine = 0;
            FindCharacter(n"OC_VLK_Huno_538").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Huno_538_InExtremoWait::StaticClass());
        }
    }
}

UCLASS(meta=(DisplayName="StoneForge"))
class URegionTrait_StoneForge : UStoryActionRegionTrait
{
    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
        if(FindCharacter(n"OCR_GRD_Stone_219").NPCState.HasAssignedDailyRoutine(UDailyRoutine_OCR_GRD_Stone_219_Start::StaticClass()))
        {
            G1R::UStoryG1R::Get().Stone_DailyRoutine = 1;
            FindCharacter(n"OCR_GRD_Stone_219").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OCR_GRD_Stone_219_OCHeroInsideForge::StaticClass());
        }
    }

    UFUNCTION(BlueprintOverride)
    void HandleCharacterLeavingRegion(AGothicCharacterState CharacterState)
    {
        if(G1R::UStoryG1R::Get().Stone_DailyRoutine == 1)
        {
            G1R::UStoryG1R::Get().Stone_DailyRoutine = 0;
            FindCharacter(n"OCR_GRD_Stone_219").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OCR_GRD_Stone_219_Start::StaticClass());
        }
    }
}

UCLASS(meta=(DisplayName="DarrionForge"))
class URegionTrait_DarrionForge : UStoryActionRegionTrait
{

    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
        FindCharacter(n"SC_NOV_Darrion_1312").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Darrion_1312_HeroInsideForge::StaticClass());
        FindCharacter(n"SC_NOV_Novice40_1351").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Novice40_1351_HeroInsideForge::StaticClass());

        if(FindCharacter(n"OCR_GRD_Stone_219").NPCState.HasAssignedDailyRoutine(UDailyRoutine_OCR_GRD_Stone_219_ScNew::StaticClass()))
        {
            G1R::UStoryG1R::Get().Stone_DailyRoutine = 2;
            FindCharacter(n"OCR_GRD_Stone_219").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OCR_GRD_Stone_219_SCHeroInsideForge::StaticClass());
        }
    }

    UFUNCTION(BlueprintOverride)
    void HandleCharacterLeavingRegion(AGothicCharacterState CharacterState)
    {
        FindCharacter(n"SC_NOV_Darrion_1312").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Darrion_1312_Start::StaticClass());
        FindCharacter(n"SC_NOV_Novice40_1351").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Novice40_1351_Start::StaticClass());

        if(G1R::UStoryG1R::Get().Stone_DailyRoutine == 2)
        {
            G1R::UStoryG1R::Get().Stone_DailyRoutine = 0;
            FindCharacter(n"OCR_GRD_Stone_219").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OCR_GRD_Stone_219_ScNew::StaticClass());
        }
    }
}

UCLASS(meta=(DisplayName="WaitPlayerInProhibitedArea"))
class URegionTrait_Story_Quest_WaitPlayerInProhibitedArea : UStoryActionRegionTrait
{
    /** This will be visible and editable in Unreal as a dropdown list with CharacterNames. */
    UPROPERTY(Category=Parameters)
    FName FrepointPosition;

    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
        FCharacterUniqueName Mud = FindCharacter(n"OC_VLK_Mud_574");
        FCharacterUniqueName Shrat = FindCharacter(n"SC_NOV_Shrat_1356");


        if(Mud.NPCState.HasAssignedDailyRoutine(UDailyRoutine_OC_VLK_Mud_574_Follow::StaticClass()))
        {
            if(FrepointPosition == n"FP_NC_FOLLOWER_WAIT")
            {
                Mud.NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Mud_574_WaitOutsideNC);
            }
            else if (FrepointPosition == n"FP_OC_FOLLOWER_WAIT")
            {
                Mud.NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Mud_574_WaitOutsideOC);
            }
            else if (FrepointPosition == n"FP_SC_FOLLOWER_WAIT")
            {
                Mud.NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Mud_574_WaitOutsideSC);
            }
            else if (FrepointPosition == n"FP_SC_KALOM_FOLLOWER_WAIT")
            {
                Mud.NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Mud_574_WaitOutsideKalom);
            }
        }

        if(Shrat.NPCState.HasAssignedDailyRoutine(UDailyRoutine_SC_NOV_Shrat_1356_Follow::StaticClass()))
        {
            if(FrepointPosition == n"FP_NC_FOLLOWER_WAIT")
            {
                Shrat.NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Shrat_1356_WaitOutsideNC);
            }
            else if (FrepointPosition == n"FP_OC_FOLLOWER_WAIT")
            {
                Shrat.NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Shrat_1356_WaitOutsideOC);
            }
            else if (FrepointPosition == n"FP_SC_FOLLOWER_WAIT")
            {
                Shrat.NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Shrat_1356_WaitOutsideSC);
            }
            else if (FrepointPosition == n"FP_SC_KALOM_FOLLOWER_WAIT")
            {
                Shrat.NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Shrat_1356_WaitOutsideKalom);
            }
        }
    }

    UFUNCTION(BlueprintOverride)
    void HandleCharacterLeavingRegion(AGothicCharacterState CharacterState)
    {
        FCharacterUniqueName Mud = FindCharacter(n"OC_VLK_Mud_574");
        FCharacterUniqueName Shrat = FindCharacter(n"SC_NOV_Shrat_1356");

        if(Mud.NPCState.HasAssignedDailyRoutine(UDailyRoutine_OC_VLK_Mud_574_WaitOutsideNC::StaticClass()) || 
        Mud.NPCState.HasAssignedDailyRoutine(UDailyRoutine_OC_VLK_Mud_574_WaitOutsideOC::StaticClass()) ||
        Mud.NPCState.HasAssignedDailyRoutine(UDailyRoutine_OC_VLK_Mud_574_WaitOutsideSC::StaticClass()) ||
        Mud.NPCState.HasAssignedDailyRoutine(UDailyRoutine_OC_VLK_Mud_574_WaitOutsideKalom::StaticClass()) )
        {
            Mud.NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Mud_574_Follow);
        }

        if(Shrat.NPCState.HasAssignedDailyRoutine(UDailyRoutine_SC_NOV_Shrat_1356_WaitOutsideNC::StaticClass()) || 
        Shrat.NPCState.HasAssignedDailyRoutine(UDailyRoutine_SC_NOV_Shrat_1356_WaitOutsideOC::StaticClass()) ||
        Shrat.NPCState.HasAssignedDailyRoutine(UDailyRoutine_SC_NOV_Shrat_1356_WaitOutsideSC::StaticClass()) ||
        Shrat.NPCState.HasAssignedDailyRoutine(UDailyRoutine_SC_NOV_Shrat_1356_WaitOutsideKalom::StaticClass()) )
        {
            Shrat.NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Shrat_1356_Follow);
        }
    }
}

UCLASS(meta=(DisplayName="Companion Party Region - Parametrized"))
class URegionTrait_Story_CompanionPartyRegion : UStoryActionRegionTrait
{
    UPROPERTY(Category=CompanionParty)
    FCharacterUniqueName CompanionCharacter;

    UPROPERTY(Category=CompanionParty)
    TSubclassOf<UQuest> RequiredQuestRunning;

    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
        // Only process for player or companion
        if (!IsValid(CharacterState) || !IsValid(CharacterState.Character))
            return;

        bool bIsPlayer = CharacterState.Character.IsPlayerCharacter();
        bool bIsCompanion = IsValid(CompanionCharacter.CharacterState) && CharacterState == CompanionCharacter.CharacterState;
        
        if (!bIsPlayer && !bIsCompanion)
            return;

        if (RequiredQuestRunning.IsValid())
        {
            auto Quest = UQuestSubsystem::Get().GetQuestByClass(RequiredQuestRunning);
            if (!IsValid(Quest) || !Quest.IsRunning())
                return;
        }

        auto HeroState = Hero.CharacterState;
        auto CompanionState = CompanionCharacter.CharacterState;
        
        if (!IsValid(HeroState) || !IsValid(CompanionState))
            return;

        if (CompanionState.IsDead() || CompanionState.IsDefeated())
            return;

        if (!CompanionState.IsInPartyWith(HeroState))
        {
            CompanionState.JoinPartyOf(HeroState);
        }
    }

    UFUNCTION(BlueprintOverride)
    void HandleCharacterLeavingRegion(AGothicCharacterState CharacterState)
    {
        if (!IsValid(CharacterState) || !IsValid(CharacterState.Character))
            return;

        bool bIsPlayer = CharacterState.Character.IsPlayerCharacter();
        bool bIsCompanion = IsValid(CompanionCharacter.CharacterState) && CharacterState == CompanionCharacter.CharacterState;
        
        if (!bIsPlayer && !bIsCompanion)
            return;

        auto HeroState = Hero.CharacterState;
        auto CompanionState = CompanionCharacter.CharacterState;
        
        if (!IsValid(HeroState) || !IsValid(CompanionState))
            return;

        if (CompanionState.IsInPartyWith(HeroState))
        {
            CompanionState.LeavePartyOf(HeroState);
        }
    }
}

class UGE_MonasteryRuins_BlockConversation : UScriptGameplayEffect
{
    default DurationPolicy = EGameplayEffectDurationType::Infinite;
    default BlockAbilityTagsComponent.InheritableBlockedAbilityTagsContainer.AddTag(GameplayTag::Ability_Conversation_Act);
}

bool MonasteryRuins_IsGornReadyForTrollFight(FCharacterUniqueName Gorn, float ArrivalRadius = 500.0f)
{
    if (!IsValid(Gorn.NPCState) || !IsValid(Gorn.CharacterState))
        return false;
    if (Gorn.CharacterState.IsDead() || Gorn.CharacterState.IsDefeated())
        return false;
    if (!Gorn.NPCState.HasAssignedDailyRoutine(UDailyRoutine_NC_SLD_Gorn_699_Ruinstay_02::StaticClass()))
        return false;
    return Gorn.CharacterState.IsCloseToWaypoint(n"FP_AM_GORN_YARD_02", ArrivalRadius);
}

#ifdef WITH_STORY_G1R
UCLASS(meta=(DisplayName="Monastery Ruins - Gorn Party Region"))
class URegionTrait_Story_MonasteryRuins_GornParty : UStoryActionRegionTrait
{
    FName TrollDeadSaveKey = n"MonasteryTroll_Dead";
    FName ArrivalFXPlayedSaveKey = n"MonasteryTroll_ArrivalFXPlayed";

    UPROPERTY()
    UDelegateHandleContainer m_OnTrollDieMeBeforeHandle;

    UPROPERTY()
    TMap<AGothicCharacterState, FActiveGameplayEffectHandle> m_ConversationBlockHandles;

    UPROPERTY()
    TSubclassOf<UCameraShakeBase> ArrivalCameraShake = UMatineeCameraShake_MonasteryTroll_Arrival::StaticClass();

    UPROPERTY()
    FTimerHandle m_TauntSoundTimer;

    UPROPERTY()
    FTimerHandle m_GornFearTimer;

    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
        if (!IsValid(CharacterState) || !IsValid(CharacterState.Character))
            return;

        bool bIsPlayer = CharacterState.Character.IsPlayerCharacter();
        auto Gorn = FindCharacter(n"NC_SLD_GORN_699");
        bool bIsGorn = IsValid(Gorn.CharacterState) && CharacterState == Gorn.CharacterState;
        
        if (!bIsPlayer && !bIsGorn)
            return;

        if (!G1R::Quest::NewCamp_NCCHAPTER3_MONASTERYRUIN.IsRunning())
            return;

        auto HeroState = Hero.CharacterState;
        if (!IsValid(HeroState))
            return;

        auto GornState = Gorn.CharacterState;
        bool bGornReady = IsValid(GornState) && MonasteryRuins_IsGornReadyForTrollFight(Gorn);
        bool bGornWaitingInYard = IsValid(Gorn.NPCState) && (
            Gorn.NPCState.HasAssignedDailyRoutine(UDailyRoutine_NC_SLD_Gorn_699_Ruinstay::StaticClass()) ||
            Gorn.NPCState.HasAssignedDailyRoutine(UDailyRoutine_NC_SLD_Gorn_699_Ruinstay_02::StaticClass()));
        bool bGornWaitingAtWall = IsValid(Gorn.NPCState) && (
            Gorn.NPCState.HasAssignedDailyRoutine(UDailyRoutine_NC_SLD_Gorn_699_Ruinwall::StaticClass()) ||
            Gorn.NPCState.HasAssignedDailyRoutine(UDailyRoutine_NC_SLD_Gorn_699_WaitAtWall::StaticClass()));
        bool bCanStartEncounter =
            G1R::Quest::NewCamp_NCCHAPTER3_MONASTERYRUIN_MONASTERYRUIN_OBJ_DOOR.HasSucceeded() ||
            bGornReady ||
            HeroState.HasItem(UItMs_Focus_04, 1);

        if (!bCanStartEncounter)
             return;

        if (bGornReady &&
        !GornState.IsInPartyWith(HeroState))
        {
            GornState.JoinPartyOf(HeroState);
        }

        if (!bGornReady &&
            !bGornWaitingInYard &&
            !bGornWaitingAtWall &&
            IsValid(Gorn.NPCState) &&
            IsValid(GornState) &&
            !GornState.IsDead() &&
            !GornState.IsDefeated())
        {
            if (!Gorn.NPCState.HasAssignedDailyRoutine(UDailyRoutine_NC_SLD_Gorn_699_WaitAtWall::StaticClass()))
            {
                Gorn.NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_NC_SLD_Gorn_699_WaitAtWall::StaticClass());
            }
        }

        if (bIsPlayer && IsTrollAlive() && !HasArrivalFXPlayed())
        {
            PlayArrivalSequence();
            MarkArrivalFXPlayed(HeroState.Character.GetWorld());
        }

        InititateTrollCombatSequence();

        // Block conversation with Gorn while the Troll is alive (skip if already dead, e.g. re-entry after save)
        if (bIsPlayer && IsTrollAlive())
        {
            ApplyConversationBlock(HeroState);
        }
    }

    bool HasTrollDied()
    {
        if (!IsValid(Hero.CharacterState) || !IsValid(Hero.CharacterState.Character))
            return false;
        float32 savedState = 0.0f;
        bool bLoaded = AG1RGameState::GetWorldFloatData(Hero.CharacterState.Character.GetWorld(), TrollDeadSaveKey, savedState);
        return bLoaded && savedState > 0.9f;
    }

    void MarkTrollDead(UWorld InWorld)
    {
        AG1RGameState::SaveWorldFloatData(InWorld, TrollDeadSaveKey, 1.0f);
    }

    bool HasArrivalFXPlayed()
    {
        if (!IsValid(Hero.CharacterState) || !IsValid(Hero.CharacterState.Character))
            return false;
        float32 savedState = 0.0f;
        bool bLoaded = AG1RGameState::GetWorldFloatData(Hero.CharacterState.Character.GetWorld(), ArrivalFXPlayedSaveKey, savedState);
        return bLoaded && savedState > 0.9f;
    }

    void MarkArrivalFXPlayed(UWorld InWorld)
    {
        AG1RGameState::SaveWorldFloatData(InWorld, ArrivalFXPlayedSaveKey, 1.0f);
    }

    void PlayArrivalSequence()
    {
        auto Troll = FindCharacter(n"AM_JuvenileTroll_01");
        if (IsValid(Troll.CharacterState) && IsValid(Troll.CharacterState.Character))
        {
            auto fxComponent = Troll.CharacterState.Character.GetFXComponent();
            if (fxComponent != nullptr)
            {
                fxComponent.PlayEffect(GameplayTag::FX_Environment_MonasteryRuins_SkullDoor_JawDown, nullptr);
            }
        }

        auto PC = Gameplay::GetPlayerController(0);
        if (IsValid(PC) && PC.IsLocalController() && ArrivalCameraShake != nullptr)
        {
            PC.ClientStartCameraShake(ArrivalCameraShake);
        }

        System::ClearAndInvalidateTimerHandle(m_TauntSoundTimer);
        m_TauntSoundTimer = System::SetTimerDelegate(FTimerDynamicDelegate(this, n"PlayTrollTauntSound"), 1.0f, false);

        System::ClearAndInvalidateTimerHandle(m_GornFearTimer);
        m_GornFearTimer = System::SetTimerDelegate(FTimerDynamicDelegate(this, n"PlayGornFearReaction"), 0.5f, false);
    }

    UFUNCTION()
    void PlayGornFearReaction()
    {
        auto Gorn = FindCharacter(n"NC_SLD_GORN_699");
        auto Troll = FindCharacter(n"AM_JuvenileTroll_01");

        if (!IsValid(Gorn.CharacterState) || !IsValid(Gorn.AI))
            return;
        if (Gorn.CharacterState.IsDead() || Gorn.CharacterState.IsDefeated())
            return;
        if (!MonasteryRuins_IsGornReadyForTrollFight(Gorn))
            return;
        if (!IsValid(Troll.CharacterState))
            return;

        //Gorn.AI.DrawCombatWeapon();

        FGenericVoicelineRequestContext VoicelineContext;
        VoicelineContext.TagsMe.AddTag(GameplayTag::VoicelineContext_MagicFear);
        Gorn.CharacterState.Voiceline.SayVoicelineWithContext(
            GameplayTag::Sound_Voice_Reaction_Flee_MagicalFear,
            nullptr,
            VoicelineContext,
            EPerceptionNoiseLoudness::Loud);
    }

    UFUNCTION()
    void PlayTrollTauntSound()
    {
        auto Troll = FindCharacter(n"AM_JuvenileTroll_01");
        if (!IsValid(Troll.CharacterState) || !IsValid(Troll.CharacterState.Character))
            return;
        if (Troll.CharacterState.IsDead() || Troll.CharacterState.IsDefeated())
            return;

        auto fxComponent = Troll.CharacterState.Character.GetFXComponent();
        if (fxComponent != nullptr)
        {
            fxComponent.PlayEffect(GameplayTag::FX_Creature_Troll_JuvenileTroll_Taunt01, nullptr);
        }
    }

    UFUNCTION(BlueprintOverride)
    void HandleCharacterLeavingRegion(AGothicCharacterState CharacterState)
    {
        if (!IsValid(CharacterState) || !IsValid(CharacterState.Character))
            return;

        bool bIsPlayer = CharacterState.Character.IsPlayerCharacter();
        auto Gorn = FindCharacter(n"NC_SLD_GORN_699");
        bool bIsGorn = IsValid(Gorn.CharacterState) && CharacterState == Gorn.CharacterState;
        
        if (!bIsPlayer && !bIsGorn)
            return;

        auto HeroState = Hero.CharacterState;
        if (!IsValid(HeroState))
            return;

        auto GornState = Gorn.CharacterState;
        if (IsValid(GornState) && GornState.IsInPartyWith(HeroState))
        {
            GornState.LeavePartyOf(HeroState);
        }

        if (bIsPlayer)
        {
            RemoveConversationBlock(HeroState);
        }
    }

    UFUNCTION(BlueprintOverride)
    void HandleHandleOwnerEndPlay()
    {
        System::ClearAndInvalidateTimerHandle(m_TauntSoundTimer);
        System::ClearAndInvalidateTimerHandle(m_GornFearTimer);
        UnbindTrollDeath();
        for (auto Entry : m_ConversationBlockHandles)
        {
            if (IsValid(Entry.Key) && IsValid(Entry.Key.AbilitySystemComponent))
            {
                Entry.Key.AbilitySystemComponent.RemoveActiveGameplayEffect(Entry.Value);
            }
        }
        m_ConversationBlockHandles.Empty();
    }

    bool IsTrollAlive()
    {
        if (HasTrollDied())
            return false;
        auto Troll = FindCharacter(n"AM_JuvenileTroll_01");
        return IsValid(Troll.CharacterState) && !Troll.CharacterState.IsDead() && !Troll.CharacterState.IsDefeated();
    }

    void ApplyConversationBlock(AGothicCharacterState CharacterState)
    {
        if (!IsValid(CharacterState) || !IsValid(CharacterState.AbilitySystemComponent) || m_ConversationBlockHandles.Contains(CharacterState))
            return;

        auto Troll = FindCharacter(n"AM_JuvenileTroll_01");
        if (!IsValid(Troll.CharacterState) || !IsValid(Troll.CharacterState.Character))
            return;

        FGameplayEffectContextHandle Context = CharacterState.AbilitySystemComponent.MakeEffectContext();
        FGameplayEffectSpecHandle SpecHandle = CharacterState.AbilitySystemComponent.MakeOutgoingSpec(UGE_MonasteryRuins_BlockConversation::StaticClass(), 1.0f, Context);
        FActiveGameplayEffectHandle EffectHandle = CharacterState.AbilitySystemComponent.ApplyGameplayEffectSpecToSelf(SpecHandle);
        if (MagicScript::IsValidGameplayEffectHandle(EffectHandle) || MagicScript::WasSuccessfullyApplied(EffectHandle))
        {
            m_ConversationBlockHandles.Add(CharacterState, EffectHandle);
            auto TrollASC = Cast<UGothicAbilitySystemComponent>(Troll.CharacterState.Character.GetAbilitySystemComponent());
            if (IsValid(TrollASC))
            {
                m_OnTrollDieMeBeforeHandle = MagicScript::AttachToEventTag(TrollASC.GetAvatar(), GameplayTag::Event_Die_Me_Before, this, n"OnTrollDeath");
            }
        }
    }

    void RemoveConversationBlock(AGothicCharacterState CharacterState)
    {
        if (!m_ConversationBlockHandles.Contains(CharacterState))
            return;

        if (IsValid(CharacterState) && IsValid(CharacterState.AbilitySystemComponent))
        {
            CharacterState.AbilitySystemComponent.RemoveActiveGameplayEffect(m_ConversationBlockHandles[CharacterState]);
        }
        m_ConversationBlockHandles.Remove(CharacterState);
        if (m_ConversationBlockHandles.Num() == 0)
        {
            UnbindTrollDeath();
        }
    }

    void UnbindTrollDeath()
    {
        auto Troll = FindCharacter(n"AM_JuvenileTroll_01");
        if (IsValid(Troll.CharacterState) && IsValid(Troll.CharacterState.Character))
        {
            auto TrollASC = Cast<UGothicAbilitySystemComponent>(Troll.CharacterState.Character.GetAbilitySystemComponent());
            if (IsValid(TrollASC))
            {
                MagicScript::DetachFromEvent(TrollASC.GetAvatar(), m_OnTrollDieMeBeforeHandle);
            }
        }
    }

    

    UFUNCTION()
    void OnTrollDeath(FGameplayEventData EventData)
    {
        auto TrollChar = Cast<AGothicCharacter>(EventData.Target);
        if (IsValid(TrollChar))
        {
            MarkTrollDead(TrollChar.GetWorld());
        }
        UnbindTrollDeath();
        TArray<AGothicCharacterState> ToRemove;
        for (auto Entry : m_ConversationBlockHandles)
        {
            ToRemove.Add(Entry.Key);
        }
        for (auto CharacterState : ToRemove)
        {
            RemoveConversationBlock(CharacterState);
        }
    }

    /** Make the Troll charge into the cloister and attack Player */
    void InititateTrollCombatSequence()
    {
        auto Troll = FindCharacter(n"AM_JuvenileTroll_01");

        // Check if troll exists and is alive
        if (!IsValid(Troll.CharacterState))
            return;

        if (Troll.CharacterState.IsDead() || Troll.CharacterState.IsDefeated())
            return;

        // Set troll's daily routine to charge (sprint) to the waypoint
        if (IsValid(Troll.NPCState))
        {
            Troll.NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_AM_JuvenileTroll_01_Charge::StaticClass());
        }
    }
}
#endif

UCLASS(meta=(DisplayName="Toggle Story DataLayers"))
class URegionTrait_Story_Generic_DataLayerToggle : UStoryActionRegionTrait
{
    /** Datalayers to activate when a character enters the region. */
    UPROPERTY(Category=DataLayers)
    TArray<FString> DataLayersToActivateOnEnter;

    /** Datalayers to deactivate when a character enters the region. */
    UPROPERTY(Category=DataLayers)
    TArray<FString> DataLayersToDeactivateOnEnter;

    /** When true, operations are reversed on leave: activated layers get deactivated, deactivated layers get reactivated. */
    UPROPERTY(Category=DataLayers)
    bool bReverseOnLeave = false;

    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
        for (auto LayerName : DataLayersToActivateOnEnter)
            G1R::UStoryG1R::Get().ActivateStoryDataLayer(LayerName);

        for (auto LayerName : DataLayersToDeactivateOnEnter)
            G1R::UStoryG1R::Get().DeactivateStoryDataLayer(LayerName);
    }

    UFUNCTION(BlueprintOverride)
    void HandleCharacterLeavingRegion(AGothicCharacterState CharacterState)
    {
        if (!bReverseOnLeave)
            return;

        for (auto LayerName : DataLayersToActivateOnEnter)
            G1R::UStoryG1R::Get().DeactivateStoryDataLayer(LayerName);

        for (auto LayerName : DataLayersToDeactivateOnEnter)
            G1R::UStoryG1R::Get().ActivateStoryDataLayer(LayerName);
    }

    UFUNCTION(BlueprintOverride)
    void HandleHandleOwnerEndPlay()
    {
        if (!bReverseOnLeave)
            return;

        for (auto LayerName : DataLayersToActivateOnEnter)
            G1R::UStoryG1R::Get().DeactivateStoryDataLayer(LayerName);

        for (auto LayerName : DataLayersToDeactivateOnEnter)
            G1R::UStoryG1R::Get().ActivateStoryDataLayer(LayerName);
    }
}

UCLASS(meta=(DisplayName="InExtremo"))
class URegionTrait_Story_InExtremo : UStoryActionRegionTrait
{

    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
        G1R::UStoryG1R::Get().IntroInExtremo = 1; 
    }
}

UCLASS(meta=(DisplayName="ForgedRivalries3 - Stone Refresh"))
class URegionTrait_Story_Quest_ForgedRivalries3_StoneRefresh : UStoryActionRegionTrait
{
    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
        auto Stone = FCharacterUniqueName(n"OCR_GRD_Stone_219");
        if (!IsValid(Stone.NPCState))
            return;
        
        Stone.NPCState.Inventory.RemoveAllItemsOfClass(UArmor_OCR_GRD_Stone_219);
        Stone.NPCState.AddItemToInventory(UArmor_OCR_GRD_Stone_219_03, 1);
        Stone.NPCState.Inventory.EquipArmorOfClass(UArmor_OCR_GRD_Stone_219_03);

        Stone.NPCState.AddItemToInventory(UItFo_Cheese, 1);
        Stone.NPCState.AddItemToInventory(UItFo_Apple, 1);
        Stone.NPCState.AddItemToInventory(UItMw_1H_Torch, 1);
        Stone.NPCState.AddItemToInventory(UItMi_Orenugget, 10);

        if (G1R::UStoryG1R::Get().ForgedRivalries3_StoneKnowsDarrionAccept == 1)
        {
            Stone.NPCState.AddItemToInventory(UItMw_1H_Mace_Sledgehammer_01, 1);
            Stone.NPCState.Inventory.EquipMeleeWeaponOfClass(UItMw_1H_Mace_Sledgehammer_01);
            Stone.NPCState.AddItemToInventory(UItMi_Joint_02, 3);            
        }

        else
        {
            Stone.NPCState.AddItemToInventory(UItFo_Potion_Booze, 3);
        }
        
        G1R::UStoryG1R::Get().ForgedRivalries3_StoneRefreshed = 1;
    }
}

#endif /** Keep this at the bottom of the file */

