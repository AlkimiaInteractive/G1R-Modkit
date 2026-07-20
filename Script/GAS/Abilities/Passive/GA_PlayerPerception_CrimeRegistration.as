UCLASS()
class UGA_PlayerPerception_CrimeRegistration : UGameplayAbility_PlayerPerception
{
    private UCrimeProcessingSubsystem _CrimeProcessingSubsystem;

    private FGameplayTagContainer UseTelemetryForCrimeTypes;
    default UseTelemetryForCrimeTypes.AddTag(GameplayTag::Crime_Trespassing);
    default UseTelemetryForCrimeTypes.AddTag(GameplayTag::Crime_Theft);
    default UseTelemetryForCrimeTypes.AddTag(GameplayTag::Crime_Pickpocket);
    default UseTelemetryForCrimeTypes.AddTag(GameplayTag::Crime_Lockpicking);
    default UseTelemetryForCrimeTypes.AddTag(GameplayTag::Crime_Interaction);

    UFUNCTION()
    UCrimeProcessingSubsystem GetCrimeProcessingSubsystem() property
    {
        if (IsValid(_CrimeProcessingSubsystem))
            return _CrimeProcessingSubsystem;

        _CrimeProcessingSubsystem = Cast<UCrimeProcessingSubsystem_Human>(UCrimeProcessingSubsystem_Human::Get());
        return _CrimeProcessingSubsystem;
    }

    UFUNCTION(BlueprintOverride)
    void SetupPerceptions(UCharacterPerceptionComponent Perception)
    {
        AGothicCharacter OwnerCharacter = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());

        auto PerceptionComponent = OwnerCharacter.Perception;        

        // DEFEATED
        PerceptionComponent.OnMyselfGotKnockedOut().
            PerceptionGained.BindUFunction(this, n"OnMyselfGotKnockedOut");
        
        PerceptionComponent.OnSomeoneElseGotKnockedOut()
            .HandleInstigatorActor(OwnerCharacter).
            PerceptionGained.BindUFunction(this, n"OnSomeoneElseGotKnockedOutByMe");
        
        // WEAPON DRAWN [GENERAL WEAPON BAN]
        PerceptionComponent.SelfChangedAreaWithWeaponInHand().
            PerceptionGained.BindUFunction(this, n"OnWeaponDrawnInArea");
        
        PerceptionComponent.SelfDrawnWeapon().
            PerceptionGained.BindUFunction(this, n"OnWeaponDrawnInArea");
        
        // DIRECT THREAT
        PerceptionComponent.SelfMakingDirectThreatAtOther_MeleeWeapon()
            .PerceptionGained.BindUFunction(this, n"OnMakingDirectThreatAtOther_MeleeWeapon");

        PerceptionComponent.SelfMakingDirectThreatAtOther_Fists()
            .PerceptionGained.BindUFunction(this, n"OnMakingDirectThreatAtOther_Fists");

        PerceptionComponent.SelfMakingDirectThreatAtOther_RangedWeapon()
            .PerceptionGained.BindUFunction(this, n"OnMakingDirectThreatAtOther_RangedWeapon");

        PerceptionComponent.SelfMakingDirectThreatAtOther_HighThreatMagic()
            .PerceptionGained.BindUFunction(this, n"OnMakingDirectThreatAtOther_HighThreatMagic");

        // MURDER;
        PerceptionComponent.OnSomeoneElseGotKilled().
            HandleInstigatorActor(OwnerCharacter).
            PerceptionGained.BindUFunction(this, n"OnSomeoneElseGotKilledByMe");

        PerceptionComponent.OnSelfIsExecuting().
            HandleOriginActor(OwnerCharacter).
            PerceptionGained.BindUFunction(this, n"OnSelfExecutedSomeone");

        // ASSAULT
        PerceptionComponent.HitOnSelfWithFists().
            PerceptionGained.BindUFunction(this, n"OnSensedHitOnSelf_Fist");

        PerceptionComponent.HitOnSelfWithWeaponMelee().
            PerceptionGained.BindUFunction(this, n"OnSensedHitOnSelf_MeleeWeapon");

        PerceptionComponent.HitOnSelfWithWeaponRanged().
            PerceptionGained.BindUFunction(this, n"OnSensedHitOnSelf_RangedWeapon");

        PerceptionComponent.HitOnSelfWithThrowable().
            PerceptionGained.BindUFunction(this, n"OnSensedHitOnSelf_RangedWeapon");

        PerceptionComponent.HitOnSelfWithHighThreatRune().
            PerceptionGained.BindUFunction(this, n"OnSensedHitOnSelf_HighThreatMagic");

        PerceptionComponent.HitOnSelfWithHighThreatScroll().
            PerceptionGained.BindUFunction(this, n"OnSensedHitOnSelf_HighThreatMagic");

        PerceptionComponent.SpellEffectStartedOnSelf_Paralyzed().
            PerceptionGained.BindUFunction(this, n"OnSensedHitOnSelf_HighThreatMagic");

        PerceptionComponent.SpellEffectStartedOnSelf_FireRain().
            PerceptionGained.BindUFunction(this, n"OnSensedHitOnSelf_HighThreatMagic");

        PerceptionComponent.SpellEffectStartedOnSelf_Pyrokinesis().
            PerceptionGained.BindUFunction(this, n"OnSensedHitOnSelf_HighThreatMagic");

        PerceptionComponent.SpellEffectStartedOnSelf_UrizielWaveOfDeath().
            PerceptionGained.BindUFunction(this, n"OnSensedHitOnSelf_HighThreatMagic");
        
        PerceptionComponent.HitOnSelfWithLowThreatRune().
            PerceptionGained.BindUFunction(this, n"OnSensedHitOnSelf_LowThreatMagic");

        PerceptionComponent.HitOnSelfWithLowThreatScroll().
            PerceptionGained.BindUFunction(this, n"OnSensedHitOnSelf_LowThreatMagic");
        
        PerceptionComponent.SpellEffectStartedOnSelf_Sleep().
            PerceptionGained.BindUFunction(this, n"OnSensedHitOnSelf_LowThreatMagic");

        // PICKPOCKETING
        PerceptionComponent.SensedPickpocketingFailedOnSelf().
            PerceptionGained.BindUFunction(this, n"OnPickpocketingFailed");

        PerceptionComponent.SensedPickpocketingSuccessOnSelf().
            PerceptionGained.BindUFunction(this, n"OnPickpocketingSucceeded");

        PerceptionComponent.SensedPickpocketingTelekinesisOnSelf().
            PerceptionGained.BindUFunction(this, n"OnPickpocketingSucceeded");

        // INTERACTION
        PerceptionComponent.OnStartedUsingOwnedInteractable().
            PerceptionGained.BindUFunction(this, n"OnStartedUsingOwnedInteractable");
        
        PerceptionComponent.OnStartedPickingOwnedLock().
            PerceptionGained.BindUFunction(this, n"OnStartedPickingOwnedLock");

        // THEFT
        Perception.OnSelfPickedUpOwnedItem().
            PerceptionGained.BindUFunction(this, n"OnStoleItem");

        Perception.OnSelfTookItemFromOwnedContainer().
            PerceptionGained.BindUFunction(this, n"OnStoleItem");

        // TRESPASSING 
        PerceptionComponent.SelfChangedArea().
            PerceptionGained.BindUFunction(this, n"OnLeavingArea");
    }

    UFUNCTION()
    private void OnMyselfGotKnockedOut(const FRememberedPerception&in Perception,
                                       const FPerceptionShortTermMemory&in Memory)
    {
        bool bInstigatorTrainingWithAffected = Perception.Instigator.CharacterState
            .GetHostilityTowards(Perception.Affected.CharacterState) == ERelationshipHostility::TrainingFight;

        if (bInstigatorTrainingWithAffected)
            return;

        bool bForgivenBeforeBySameInstigator = Perception.Instigator.CharacterState.LongTermMemory
            .FilterEventsAffecting(Perception.Affected.CharacterState.CharacterGlobalId, GameplayTag::Memory_Combat_Forgive)
            .CausedBy(Perception.Instigator.CharacterState.CharacterGlobalId)
            .Count > 0;
        
        FCrimeRegisterData CrimeRegisterData;
        if (!bForgivenBeforeBySameInstigator)
        {
            RegisterGlobalCrimes(
                GameplayTag::Crime_Anti_Defeated_Other, 
                Perception.Affected.CharacterState,
                Perception.Instigator.CharacterState
            );
        }
        else
        {
            RegisterGlobalCrimes(
                GameplayTag::Crime_DefeatedAgain, 
                Perception.Affected.CharacterState,
                Perception.Instigator.CharacterState
            );
        }        
    }

    UFUNCTION()
    private void OnSomeoneElseGotKnockedOutByMe(const FRememberedPerception&in Perception,
                                            const FPerceptionShortTermMemory&in Memory)
    {
        bool bInstigatorTrainingWithAffected = Perception.Instigator.CharacterState
            .GetHostilityTowards(Perception.Affected.CharacterState) == ERelationshipHostility::TrainingFight;

        if (bInstigatorTrainingWithAffected)
            return;

        if (Perception.EffectCauserTags.HasTag(GameplayTag::Item_Range_Melee) &&
            !Perception.EffectCauserTags.HasTag(GameplayTag::Item_Weapon_Fist) &&
            !Perception.EffectCauserTags.HasTag(GameplayTag::Item_Weapon_Rune) &&
            !Perception.EffectCauserTags.HasTag(GameplayTag::Item_Weapon_Scroll))
        {
            // Melee Weapon
            RegisterGlobalCrimes(
                GameplayTag::Crime_Assault_Weapon_Melee, 
                Perception.Instigator.CharacterState,
                Perception.Affected.CharacterState
            );
        }
        else if (Perception.EffectCauserTags.HasTag(GameplayTag::Item_Weapon_Fist))
        {
            // Fists
            RegisterGlobalCrimes(
                GameplayTag::Crime_Assault_Fists, 
                Perception.Instigator.CharacterState,
                Perception.Affected.CharacterState
            );
        }
        else if (Perception.EffectCauserTags.HasTag(GameplayTag::Item_Range_Long) &&
            !Perception.EffectCauserTags.HasTag(GameplayTag::Item_Weapon_Fist) &&
            !Perception.EffectCauserTags.HasTag(GameplayTag::Item_Weapon_Rune) &&
            !Perception.EffectCauserTags.HasTag(GameplayTag::Item_Weapon_Scroll))
        {
            // Ranged Weapon
            RegisterGlobalCrimes(
                GameplayTag::Crime_Assault_Weapon_Ranged, 
                Perception.Instigator.CharacterState,
                Perception.Affected.CharacterState
            );
        }
        else if (Perception.EffectCauserTags.HasTag(GameplayTag::Item_Property_Throwable))
        {
            // Throwable
            RegisterGlobalCrimes(
                GameplayTag::Crime_Assault_Weapon_Ranged, 
                Perception.Instigator.CharacterState,
                Perception.Affected.CharacterState
            );
        }
        else if (Perception.EffectCauserTags.HasTag(GameplayTag::Item_Weapon_Rune) &&
            !Perception.EffectCauserTags.HasTag(GameplayTag::Item_Property_NoThreat) &&
            !Perception.EffectCauserTags.HasTag(GameplayTag::Item_Property_LowThreat))
        {
            // Rune High Threat
            RegisterGlobalCrimes(
                GameplayTag::Crime_Assault_Weapon_Magic_HighThreat, 
                Perception.Instigator.CharacterState,
                Perception.Affected.CharacterState
            );
        }
        else if (Perception.EffectCauserTags.HasTag(GameplayTag::Item_Weapon_Scroll) &&
            !Perception.EffectCauserTags.HasTag(GameplayTag::Item_Property_NoThreat) &&
            !Perception.EffectCauserTags.HasTag(GameplayTag::Item_Property_LowThreat))
        {
            // Scroll High Threat
            RegisterGlobalCrimes(
                GameplayTag::Crime_Assault_Weapon_Magic_HighThreat, 
                Perception.Instigator.CharacterState,
                Perception.Affected.CharacterState
            );
        }

        RegisterGlobalCrimes(
            GameplayTag::Crime_Anti_Defeated_Self, 
            Perception.Instigator.CharacterState,
            Perception.Affected.CharacterState
        );
    }

    UFUNCTION()
    private void OnWeaponDrawnInArea(const FRememberedPerception&in Perception,
                                     const FPerceptionShortTermMemory&in Memory)
    {
        AGothicCharacterState OriginCharacterState = Perception.Origin.CharacterState;

        if (OriginCharacterState == nullptr)
            return;
        
        FGameplayTag AreaTag = OriginCharacterState.AreaTagOfLocation;

        auto OwnershipSubsystem = UOwnershipSubsystem::Get();
    
        // If area not owned, exit early
        if (!OwnershipSubsystem.IsAreaOwnedByAnyGuild(AreaTag) && !OwnershipSubsystem.IsAreaOwnedByAnyPerson(AreaTag))
            return;

        // Handle cases where only one trespassing type is true
        if (OriginCharacterState.Character.HasDrawnFists())
        {
            RegisterGlobalCrimes(GameplayTag::Crime_FistsDrawn, OriginCharacterState, nullptr, AreaTag);
        }
        else if (OriginCharacterState.Character.CarryComponent.IsEquippedWeaponAThreat())
        {
            RegisterGlobalCrimes(GameplayTag::Crime_ThreateningWeaponDrawn, OriginCharacterState, nullptr, AreaTag);
        }
    }

    UFUNCTION()
    private void OnSelfExecutedSomeone(const FRememberedPerception&in Perception,
                                            const FPerceptionShortTermMemory&in Memory)
    {
        RegisterGlobalCrimes(
            GameplayTag::Crime_Murder, 
            Perception.Origin.CharacterState,
            Perception.Affected.CharacterState
        );
    }

    UFUNCTION()
    private void OnSomeoneElseGotKilledByMe(const FRememberedPerception&in Perception,
                                            const FPerceptionShortTermMemory&in Memory)
    {
        RegisterGlobalCrimes(
            GameplayTag::Crime_Murder, 
            Perception.Instigator.CharacterState,
            Perception.Affected.CharacterState
        );
    }

    UFUNCTION()
    private void OnSensedHitOnSelf_Fist(const FRememberedPerception&in Perception,
                                        const FPerceptionShortTermMemory&in Memory)
    {
        RegisterGlobalCrimes(
            GameplayTag::Crime_Assault_Fists, 
            Perception.Instigator.CharacterState,
            Perception.Affected.CharacterState
        );
    }

    UFUNCTION()
    private void OnSensedHitOnSelf_MeleeWeapon(const FRememberedPerception&in Perception,
                                               const FPerceptionShortTermMemory&in Memory)
    {
        RegisterGlobalCrimes(
            GameplayTag::Crime_Assault_Weapon_Melee, 
            Perception.Instigator.CharacterState,
            Perception.Affected.CharacterState
        );
    }

    UFUNCTION()
    private void OnSensedHitOnSelf_RangedWeapon(const FRememberedPerception&in Perception,
                                                const FPerceptionShortTermMemory&in Memory)
    {
        RegisterGlobalCrimes(
            GameplayTag::Crime_Assault_Weapon_Ranged, 
            Perception.Instigator.CharacterState,
            Perception.Affected.CharacterState
        );
    }

    UFUNCTION()
    private void OnSensedHitOnSelf_HighThreatMagic(const FRememberedPerception&in Perception,
                                                   const FPerceptionShortTermMemory&in Memory)
    {
        RegisterGlobalCrimes(
            GameplayTag::Crime_Assault_Weapon_Magic_HighThreat, 
            Perception.Instigator.CharacterState,
            Perception.Affected.CharacterState
        );
    }

    UFUNCTION()
    private void OnSensedHitOnSelf_LowThreatMagic(const FRememberedPerception&in Perception,
                                                  const FPerceptionShortTermMemory&in Memory)
    {
        RegisterGlobalCrimes(
            GameplayTag::Crime_Assault_Weapon_Magic_LowThreat, 
            Perception.Instigator.CharacterState,
            Perception.Affected.CharacterState
        );
    }

    UFUNCTION()
    private void OnPickpocketingFailed(const FRememberedPerception&in Perception,
                                        const FPerceptionShortTermMemory&in Memory)
    {
        RegisterGlobalCrimes(
            GameplayTag::Crime_Pickpocket_Fail, 
            Perception.Instigator.CharacterState,
            Perception.Affected.CharacterState
        );
    }

    UFUNCTION()
    private void OnPickpocketingSucceeded(const FRememberedPerception&in Perception,
                                        const FPerceptionShortTermMemory&in Memory)
    {
        RegisterGlobalCrimes(
            GameplayTag::Crime_Pickpocket_Success, 
            Perception.Instigator.CharacterState,
            Perception.Affected.CharacterState
        );
    }

    UFUNCTION()
    private void OnStartedUsingOwnedInteractable(const FRememberedPerception&in Perception,
                                                 const FPerceptionShortTermMemory&in Memory)
    {
        AGothicCharacterState OriginCharacterState = Perception.Origin.CharacterState;

        if (!IsValid(OriginCharacterState) || !IsValid(OriginCharacterState.Character))
            return;
        
        auto OwnedInteractable = Perception.PerceivedObject;

        if (IsValid(OwnedInteractable.ItemDefinition))
            return;

        if (!IsValid(OwnedInteractable.InteractiveObjectDefinition))
            return;

        bool bIsOwnedByGuild = !OwnedInteractable.OwnedByGuilds.IsEmpty();
        bool bIsOwnedByPerson = !OwnedInteractable.PersonallyOwnedBy.IsEmpty();

        // If no ownership is detected, exit early
        if (!bIsOwnedByGuild && !bIsOwnedByPerson)
            return;

        FGameplayTag CrimeTag = GameplayTag::Crime_Interaction;        
        RegisterGlobalCrimes(CrimeTag, Perception.Sensing.CharacterState, nullptr, InteractiveObject = OwnedInteractable);
    }

    UFUNCTION()
    private void OnStartedPickingOwnedLock(const FRememberedPerception&in Perception,
                                                 const FPerceptionShortTermMemory&in Memory)
    {
        AGothicCharacterState OriginCharacterState = Perception.Origin.CharacterState;

        if (!IsValid(OriginCharacterState) || !IsValid(OriginCharacterState.Character))
            return;
        
        auto OwnedInteractable = Perception.PerceivedObject;

        if (IsValid(OwnedInteractable.ItemDefinition))
            return;

        if (!IsValid(OwnedInteractable.InteractiveObjectDefinition))
            return;

        bool bIsOwnedByGuild = !OwnedInteractable.OwnedByGuilds.IsEmpty();
        bool bIsOwnedByPerson = !OwnedInteractable.PersonallyOwnedBy.IsEmpty();

        // If no ownership is detected, exit early
        if (!bIsOwnedByGuild && !bIsOwnedByPerson)
            return;

        FGameplayTag CrimeTag = GameplayTag::Crime_Lockpicking;
        
        RegisterGlobalCrimes(CrimeTag, Perception.Sensing.CharacterState, nullptr, InteractiveObject = OwnedInteractable);
    }

    UFUNCTION()
    private void OnStoleItem(const FRememberedPerception&in Perception,
                             const FPerceptionShortTermMemory&in Memory)
    {
        RegisterGlobalCrimes(
            GameplayTag::Crime_Theft, 
            Perception.Sensing.CharacterState, 
            nullptr, 
            InteractiveObject = Perception.PerceivedObject
        );
    }

    UFUNCTION()
    private void OnLeavingArea(const FRememberedPerception&in Perception,
                                     const FPerceptionShortTermMemory&in Memory)
    {
        AGothicCharacterState OriginCharacterState = Perception.Origin.CharacterState;

        if (OriginCharacterState == nullptr)
            return;
        
        FGameplayTag AreaTag = OriginCharacterState.AreaTagOfLocation;
        
        for (auto Tag : Perception.EffectCauserTags.GameplayTags)
        {
            if (AreaTag.MatchesTag(Tag))
                break;

            EndContinuousTrespassingCrime(Perception.Origin.CharacterState, GameplayTag::Crime_Trespassing_OnGuild, Tag);
            EndContinuousTrespassingCrime(Perception.Origin.CharacterState, GameplayTag::Crime_Trespassing_OnPerson, Tag);
        }

        if (Perception.EffectCauserTags.HasTag(AreaTag))
            return;
        
        // Check trespassing statuses
        bool bIsTrespassingOnGuild = OriginCharacterState.IsCharacterInAreaOwnedByDifferentGuild();
        bool bIsTrespassingOnPerson = OriginCharacterState.IsCharacterInAreaOwnedByDifferentPerson();

        // If no trespassing is detected, exit early
        if (!bIsTrespassingOnGuild && !bIsTrespassingOnPerson)
            return;

        // Handle cases where only one trespassing type is true
        if (bIsTrespassingOnPerson)
        {
            RegisterGlobalCrimes(GameplayTag::Crime_Trespassing_OnPerson, Perception.Origin.CharacterState, nullptr, AreaTag);
        }

        if (bIsTrespassingOnGuild)
        {
            RegisterGlobalCrimes(GameplayTag::Crime_Trespassing_OnGuild, Perception.Origin.CharacterState, nullptr, AreaTag);
        }
    }

    UFUNCTION()
    private void OnMakingDirectThreatAtOther_MeleeWeapon(
            const FRememberedPerception&in Perception, const FPerceptionShortTermMemory&in Memory)
    {
        RegisterGlobalCrimes(
            GameplayTag::Crime_DirectThreat_Weapon_Melee,
            Perception.Sensing.CharacterState,
            Perception.Origin.CharacterState
        );
    }

    UFUNCTION()
    private void OnMakingDirectThreatAtOther_RangedWeapon(
            const FRememberedPerception&in Perception, const FPerceptionShortTermMemory&in Memory)
    {
        RegisterGlobalCrimes(
            GameplayTag::Crime_DirectThreat_Weapon_Ranged,
            Perception.Sensing.CharacterState,
            Perception.Origin.CharacterState
        );
    }

    UFUNCTION()
    private void OnMakingDirectThreatAtOther_Fists(
            const FRememberedPerception&in Perception, const FPerceptionShortTermMemory&in Memory)
    {
        RegisterGlobalCrimes(
            GameplayTag::Crime_DirectThreat_Fists,
            Perception.Sensing.CharacterState,
            Perception.Origin.CharacterState
        );
    }

    UFUNCTION()
    private void OnMakingDirectThreatAtOther_HighThreatMagic(
            const FRememberedPerception&in Perception, const FPerceptionShortTermMemory&in Memory)
    {
        RegisterGlobalCrimes(
            GameplayTag::Crime_DirectThreat_Weapon_Magic_HighThreat,
            Perception.Sensing.CharacterState,
            Perception.Origin.CharacterState
        );
    }

    UFUNCTION()
    void EndContinuousTrespassingCrime(AGothicCharacterState Criminal, FGameplayTag CrimeType, FGameplayTag AreaTag)
    {
        CrimeProcessingSubsystem.EndContinuousTrespassingCrime(Criminal, CrimeType, AreaTag);
    }

    UFUNCTION()
    void EndContinuousCrime(AGothicCharacterState Criminal, FGameplayTag CrimeType)
    {
        CrimeProcessingSubsystem.EndContinuousCrime(Criminal, CrimeType);
    }


    /// Register crimes taking into account the criminal's tranformation state
    UFUNCTION()
    void RegisterGlobalCrimes(FGameplayTag CrimeType, 
        AGothicCharacterState CriminalCharacterState, AGothicCharacterState VictimCharacterState,
        FGameplayTag AreaTag = FGameplayTag::Empty, FPerceivedInteractiveObject InteractiveObject = FPerceivedInteractiveObject())
    {
        FCrimeRegisterData CrimeRegisterData = CrimeProcessingSubsystem.MakeNewCrimeRegisterData(
            CrimeType,
            CriminalCharacterState,
            nullptr,
            VictimCharacterState,
            AreaTag,
            InteractiveObject
        );
        if (!CrimeRegisterData.bIsValid)
            return;

        CrimeProcessingSubsystem.RegisterGlobalCrimeOnly(CrimeRegisterData);

        AGothicCharacterState FinalCriminalCharacterState = nullptr;
        AGothicCharacterState ActualDamager = nullptr;

        CrimeProcessingSubsystem.ResolveCriminalForCrime(CriminalCharacterState, FinalCriminalCharacterState, ActualDamager);
        
        if (!IsValid(ActualDamager))
        {
            CrimeTelemetry(CrimeRegisterData);
            return;
        }
        
        FCrimeRegisterData TransformedCrimeRegisterData = CrimeProcessingSubsystem.MakeNewCrimeRegisterData(
            CrimeType,
            FinalCriminalCharacterState,
            ActualDamager,
            VictimCharacterState,
            AreaTag,
            InteractiveObject
        );
        if (!TransformedCrimeRegisterData.bIsValid)
            return;

        CrimeProcessingSubsystem.RegisterGlobalCrimeOnly(TransformedCrimeRegisterData);
        CrimeTelemetry(TransformedCrimeRegisterData);
    }

    void CrimeTelemetry(FCrimeRegisterData CrimeRegisterData)
    {
        if (!CrimeRegisterData.CrimeType.MatchesAny(UseTelemetryForCrimeTypes))
            return;

        auto PlayerCharacter = Gameplay::GetPlayerCharacter(0);
        if (!IsValid(PlayerCharacter))
            return;

        auto PlayerGothicCharacter = Cast<AGothicCharacter>(PlayerCharacter);
        if (!IsValid(PlayerGothicCharacter))
            return;

        auto PlayerCharacterState = Cast<AGothicPlayerState>(PlayerGothicCharacter.PlayerState);
        if (!IsValid(PlayerCharacterState))
            return;        
        
        if (PlayerCharacter.PlayerState != CrimeRegisterData.CriminalCharacterState)
            return;
        
        FString VictimsString = "";
        for (auto VictimGuild : CrimeRegisterData.VictimGuilds.GameplayTags)
        {
            if (VictimsString != "")
            {
                VictimsString.Append(",");
            }

            VictimsString.Append(VictimGuild.ToString());
        }

        for (auto VictimCharacterState : CrimeRegisterData.VictimCharacterStates)
        {
            if (!IsValid(VictimCharacterState))
                continue;

            if (VictimsString != "")
            {
                VictimsString.Append(",");
            }

            VictimsString.Append(VictimCharacterState.CharacterUniqueName.ToString());
        }

        FString InteractableID = "";

        if (IsValid(CrimeRegisterData.InteractiveObjectDefinitionClass))
        {
            InteractableID = CrimeRegisterData.InteractiveObjectDefinitionClass.DefaultObject.Name.ToString();
        }

        if (IsValid(CrimeRegisterData.ItemDefinitionClass))
        {
            if (InteractableID != "")
            {
                InteractableID.Append(",");
            }

            InteractableID.Append(CrimeRegisterData.ItemDefinitionClass.DefaultObject.Name.ToString());
        }

        auto InstigatorId = CrimeRegisterData.CriminalCharacterState.CharacterUniqueName.ToString();
        if (CrimeRegisterData.CriminalCharacterState.HasGameplayTag(GameplayTag::State_Transformed))
        {
            InstigatorId.Append("_");
            FString TransformedName = PlayerCharacter.Name.ToString();
            FString FirstSplitLeft; FString FirstSplitRight;
            TransformedName.Split("_", FirstSplitLeft, FirstSplitRight);

            FString SecondSplitLeft; FString SecondSplitRight;
            FirstSplitRight.Split("_", SecondSplitLeft, SecondSplitRight);

            InstigatorId.Append(SecondSplitLeft);
        }

        auto CrimeType = CrimeRegisterData.CrimeType.ToString();
        auto Area = CrimeRegisterData.AreaTag.ToString();

        Log("[Telemetry] Crime Registered");
        Log(f"[Telemetry]      PlayerState: {PlayerCharacterState}");
        Log(f"[Telemetry]      VictimsString: {VictimsString}");
        Log(f"[Telemetry]      InstigatorId: {InstigatorId}");
        Log(f"[Telemetry]      CrimeType: {CrimeType}");
        Log(f"[Telemetry]      InteractableId: {InteractableID}");
        Log(f"[Telemetry]      AreaTag: {Area}");

        UTelemetryHelper::OnCrimeRegistered(PlayerCharacterState, VictimsString, InstigatorId, CrimeType, InteractableID, Area);
    }
}
