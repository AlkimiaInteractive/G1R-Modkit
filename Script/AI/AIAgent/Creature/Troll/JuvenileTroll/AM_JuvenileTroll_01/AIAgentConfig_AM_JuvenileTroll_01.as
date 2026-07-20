
UCLASS()
class UAIAgentConfig_AM_JuvenileTroll_01 : UAIAgentConfig_JuvenileTroll
{
	default m_CharacterDefinition = UCharacterDefinition_AM_JuvenileTroll_01::StaticClass();
}

#ifdef WITH_STORY_G1R
class UDailyRoutine_AM_JuvenileTroll_01_Charge : UAIState_DailyRoutine_Creature
{
	default Schedule(0, 0, UAIState_Troll_ChargeToWaypoint(), Location::Anywhere, 50000);
}

/** AIState that makes the troll sprint to the freepoint, taunt, then attack */
UCLASS()
class UAIState_Troll_ChargeToWaypoint : UGothicCharacterAIState
{
	default bSupportsSimulatedSteps = true;

	// Save key to persist intro completion across AIState instances
	FName IntroSaveKey = n"MonasteryTroll_IntroComplete";

	// Taunt montage to play when the troll arrives
	UPROPERTY()
	TSoftObjectPtr<UAnimMontage> TauntMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/JuvenileTroll/Combat/Taunts/A_JuvenilleTroll_Taunt_02_Montage.A_JuvenilleTroll_Taunt_02_Montage'";

	/** Max distance from FP_AM_GORN_YARD_02 for Gorn to count as present for the scripted duo fight. */
	UPROPERTY(Category="MonasteryRuinsTroll")
	float GornRuinsEncounterArrivalRadius = 500.0f;

	bool IsGornReadyForMonasteryRuinsTrollFight(FCharacterUniqueName Gorn)
	{
		if (!IsValid(Gorn.NPCState) || !IsValid(Gorn.CharacterState))
			return false;
		if (Gorn.CharacterState.IsDead() || Gorn.CharacterState.IsDefeated())
			return false;
		if (!Gorn.NPCState.HasAssignedDailyRoutine(UDailyRoutine_NC_SLD_Gorn_699_Ruinstay_02::StaticClass()))
			return false;
		return Gorn.CharacterState.IsCloseToWaypoint(n"FP_AM_GORN_YARD_02", GornRuinsEncounterArrivalRadius);
	}

	bool HasIntroCompleted()
	{
		float32 savedState = 0.0f;
		bool bLoaded = AG1RGameState::GetWorldFloatData(World, IntroSaveKey, savedState);
		return bLoaded && savedState > 0.9f;
	}

	void MarkIntroCompleted()
	{
		AG1RGameState::SaveWorldFloatData(GetWorld(), IntroSaveKey, 1.0f);
	}

	UFUNCTION(BlueprintOverride)
	void DoTask()
	{		
		FCharacterUniqueName Gorn = FCharacterUniqueName(n"NC_SLD_GORN_699");

		// Only do the intro sequence (charge + taunt) once
		if (!HasIntroCompleted())
		{
			// Make Troll blind and deaf during the intro (prevents reacting to Gorn/Player)
			DisablePerception();

			SetWalkSpeed(EWalkSpeed::Sprinting);
			AI.GotoFreepoint(FInteractionSpotHandle(n"FP_MR_CLOISTER_SNAPPER_05"));
			
			if (IsGornReadyForMonasteryRuinsTrollFight(Gorn))
			{
				AI.TurnToCharacter(Gorn.CharacterState);
			}
			else
			{
				auto TurnTarget = Cast<AGothicCharacter>(Gameplay::GetPlayerCharacter(0));
				if (IsValid(TurnTarget) && IsValid(TurnTarget.CharacterState) && !TurnTarget.CharacterState.IsDead() && !TurnTarget.CharacterState.IsDefeated())
				{
					AI.TurnToCharacter(TurnTarget.CharacterState);
				}
			}
			
			PlayTauntMontage();
			EnablePerception();
			MarkIntroCompleted();
		}

		bool bGornReady = IsGornReadyForMonasteryRuinsTrollFight(Gorn);

		if (bGornReady && IsValid(CharacterState))
		{
            TArray<AGothicCharacterState> CombatParticipants;
            CombatParticipants.Add(CharacterState);
            CombatParticipants.Add(Gorn.CharacterState);

            AI.ForceSightPerception(CombatParticipants);
            AI.ForceHearingPerception(CombatParticipants);

            if (IsValid(Gorn.AI))
            {
                Gorn.AI.ForceSightPerception(CombatParticipants);
                Gorn.AI.ForceHearingPerception(CombatParticipants);
                Gorn.AI.StartAttackingImmediately(CharacterState);
            }

            AI.StartAttackingImmediately(Gorn.CharacterState);
			return;
		}

		auto PlayerCharacter = Cast<AGothicCharacter>(Gameplay::GetPlayerCharacter(0));
		if (IsValid(PlayerCharacter) && IsValid(PlayerCharacter.CharacterState) && IsValid(CharacterState))
		{
			if (!PlayerCharacter.CharacterState.IsDead() && !PlayerCharacter.CharacterState.IsDefeated())
			{
				TArray<AGothicCharacterState> CombatParticipants;
				CombatParticipants.Add(CharacterState);
				CombatParticipants.Add(PlayerCharacter.CharacterState);

				AI.ForceSightPerception(CombatParticipants);
				AI.ForceHearingPerception(CombatParticipants);
				AI.StartAttackingImmediately(PlayerCharacter.CharacterState);
				return;
			}
		}
		
		// Return to base daily routine if no valid targets
		CharacterState.NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_Troll_Base::StaticClass());
	}

	void PlayTauntMontage()
	{
		if (!IsValid(CharacterState) || !IsValid(CharacterState.Character))
			return;

		auto Mesh = CharacterState.Character.Mesh;
		if (!IsValid(Mesh) || !IsValid(Mesh.AnimInstance))
			return;

		UAnimMontage Montage = TauntMontage.Get();
		if (!IsValid(Montage))
			return;

		FAlphaBlendArgs Blend;
		Blend.BlendTime = 0.2f;
		Mesh.AnimInstance.Montage_PlayWithBlendIn(Montage, Blend);

		WaitSeconds(2.5f);
	}

	void DisablePerception()
	{
		if (!IsValid(CharacterState) || !IsValid(CharacterState.Character))
			return;

		auto AbilitySystem = CharacterState.Character.GetAbilitySystemComponent();
		if (!IsValid(AbilitySystem))
			return;

		AbilitySystem.AddLooseGameplayTag(GameplayTag::Debuff_Blind);
		AbilitySystem.AddLooseGameplayTag(GameplayTag::Debuff_Deaf);
	}

	void EnablePerception()
	{
		if (!IsValid(CharacterState) || !IsValid(CharacterState.Character))
			return;

		auto AbilitySystem = CharacterState.Character.GetAbilitySystemComponent();
		if (!IsValid(AbilitySystem))
			return;

		AbilitySystem.RemoveLooseGameplayTag(GameplayTag::Debuff_Blind);
		AbilitySystem.RemoveLooseGameplayTag(GameplayTag::Debuff_Deaf);
	}
}
#endif