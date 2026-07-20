UCLASS()
class UAIState_Flee : UAIState_Fear
{
	default OwnedGameplayTags.AddTag(GameplayTag::AIState_Conflict_Flee);
	default AIStateTag = GameplayTag::AIState_Conflict_Flee;
	// default OwnedGameplayTags.AddTag(GameplayTag::Debuff_Fear);
	default IsTickingTask = true;

	float StartTimeSeconds;

	float FleeDurationSeconds = 60.0f;	
	float MinFleeDurationBeforeEarlyExit = 10.0f;

	default bFleeWhenClose = true;
	default FearTooCloseRange = 1000;
	default FearFleeRange = 1500.0f;

	float GuardSearchRadius = 10000.0f;
	float FleeAwayFromEnemiesWeight = 0.5f;
	float FleeTowardGuardWeight = 0.5f;
	
	// Guard result cached for this many seconds to avoid expensive pathfinding every recalc.
	float GuardCacheLifetimeSeconds = 1.0f;

	AGothicCharacter CachedGuardCharacter;
	float CachedGuardTime = -1.0f;

	bool IsSameSpecies(AGothicCharacter A, AGothicCharacter B) const
	{
		if (!IsValid(A) || !IsValid(B))
			return false;
		if (!IsValid(A.CharacterState) || !IsValid(B.CharacterState))
			return false;
		return A.CharacterState.Species.MatchesTag(B.CharacterState.Species) && B.CharacterState.Species.MatchesTag(A.CharacterState.Species);
	}

	TArray<AGothicCharacter> GetCharactersToFleeFrom() override
	{
		TArray<AGothicCharacter> Result;
		auto SensedCharacters = Self.Perception.GetAllSensedCharacters(FGameplayTagContainer(), FGameplayTagContainer());
		for (auto Character : SensedCharacters)
		{
			if (!IsValid(Character))
				continue;
			if (Character == Self)
				continue;
			if (Character.IsDead() || Character.IsDefeated())
				continue;
			if (!IsValid(Self.CharacterState) || !IsValid(Character.CharacterState))
				continue;
			if (IsSameSpecies(Self, Character))
				continue;
			Result.Add(Character);
		}
		return Result;
	}

	void UpdateCaches() override
	{
		if (World.TimeSeconds - CachedGuardTime >= GuardCacheLifetimeSeconds || !IsValid(CachedGuardCharacter))
		{
			CachedGuardCharacter = FindNearestReachableGuard();
			CachedGuardTime = World.TimeSeconds;
		}
	}

	UFUNCTION(BlueprintOverride)
	void DoTask()
	{
		StartTimeSeconds = World.TimeSeconds;
		Super::DoTask();
	}

	bool FearInteractionCondition() const override
	{
		if (!bShouldStayInFearState)
			return false;

		if (bShouldMoveToNewPosition)
			return false;

		return true;
	}

	bool ShouldStayInFearState() const override
	{
		float Elapsed = World.TimeSeconds - StartTimeSeconds;
		if (Elapsed > FleeDurationSeconds)
			return false;
		// Early exit when safe: after minimum duration, stop if no enemies sensed (uses per-tick cache).
		if (Elapsed >= MinFleeDurationBeforeEarlyExit && CachedSensedLivingEnemies.Num() == 0)
			return false;
		return true;
	}

	// Inverse-distance-weighted "away" from all sensed enemies; blend toward cached nearest guard if available.
	FVector CalculateFleeDirection() const override
	{
		FVector AwaySum = FVector::ZeroVector;
		float WeightSum = 0.0f;
		for (auto Enemy : CachedSensedLivingEnemies)
		{
			if (!IsValid(Enemy))
				continue;
			float Dist = Self.GetFeetLocation().Distance(Enemy.GetFeetLocation());
			if (Dist < 1.0f)
				Dist = 1.0f;
			float W = 1.0f / Dist;
			FVector Away = (Self.GetFeetLocation() - Enemy.GetFeetLocation()).GetSafeNormal2D();
			AwaySum += Away * W;
			WeightSum += W;
		}
		FVector AwayFromEnemies = FVector::ZeroVector;
		if (WeightSum > 0.0f)
			AwayFromEnemies = AwaySum.GetSafeNormal2D();
		else if (IsValid(CharacterOfInterest))
			AwayFromEnemies = (Self.GetFeetLocation() - CharacterOfInterest.GetFeetLocation()).GetSafeNormal2D();

		if (!IsValid(CachedGuardCharacter))
			return AwayFromEnemies;
		FVector ToGuard = (CachedGuardCharacter.GetFeetLocation() - Self.GetFeetLocation()).GetSafeNormal2D();
		FVector Blended = (AwayFromEnemies * FleeAwayFromEnemiesWeight + ToGuard * FleeTowardGuardWeight).GetSafeNormal2D();
		return Blended;
	}

	AGothicCharacter FindNearestReachableGuard() const
	{
		FScopeCycleCounter ScopeCycleCounter(FStatID(n"FindNearestReachableGuard"));

		for (auto OtherCharacter : Self.Perception.GetAllPotentiallyReachableCharactersInRadiusSortedByDistance(GuardSearchRadius))
		{
			if (!IsValid(OtherCharacter) || !OtherCharacter.HasGameplayTag(GameplayTag::CampRole_Guard))
				continue;

			if (OtherCharacter.IsDefeated() || OtherCharacter.IsDead())
				continue;

			if (OtherCharacter.IsPlayerCharacterOrPlayerControlled())
				continue;

			return OtherCharacter;
		}

		return nullptr;
	}

	FString GetDisplayName() const override
	{
		return "Flee State";
	}
}

class UAIState_Flee_Predator : UAIState_Flee
{
	default IsTickingTask = true;

	FVector CalculateFleeDirection() const override
	{
		FVector AwaySum = FVector::ZeroVector;
		float WeightSum = 0.0f;
		for (auto Enemy : CachedSensedLivingEnemies)
		{
			if (!IsValid(Enemy))
				continue;
			float Dist = Self.GetFeetLocation().Distance(Enemy.GetFeetLocation());
			if (Dist < 1.0f)
				Dist = 1.0f;
			float W = 1.0f / Dist;
			FVector Away = (Self.GetFeetLocation() - Enemy.GetFeetLocation()).GetSafeNormal2D();
			AwaySum += Away * W;
			WeightSum += W;
		}
		if (WeightSum > 0.0f)
			return AwaySum.GetSafeNormal2D();
		if (IsValid(CharacterOfInterest))
			return (Self.GetFeetLocation() - CharacterOfInterest.GetFeetLocation()).GetSafeNormal2D();
		return FVector::ZeroVector;
	}

	bool FearInteractionCondition() const override
	{
		if (!bShouldStayInFearState)
			return false;

		if (bShouldMoveToNewPosition)
			return false;

		return true;
	}

	bool ShouldStayInFearState() const override
	{
		if (World.TimeSeconds - StartTimeSeconds > FleeDurationSeconds)
			return false;

		return true;
	}

	bool ShouldCalculateNewPosition() const override
	{
		if (!bFleeWhenClose)
			return false;

		if (bShouldMoveToNewPosition)
			return false;

		if (AnyPredatorSensed())
			return true;

		if (!IsValid(CharacterOfInterest))
			return false;

		if (CharacterOfInterest.GetDistanceTo(Self) > FearTooCloseRange)
			return false;

		return true;
	}

	bool AnyPredatorSensed() const
	{
		// Checking for "Prey" here, as hostiliy goes "Give my anyone who sees me as prey"
		return Self.Perception.GetAllSensedCharactersWithHostility(
			ERelationshipHostility::Prey, 
			FGameplayTagContainer(), 
			FGameplayTagContainer()
		).Num() > 0;
	}

	bool AnyReachableEnemySensed() const
	{
		auto SensedCharacters = Self.Perception.GetAllSensedCharactersWithRelationship(ERelationship::Enemy, FGameplayTagContainer(), FGameplayTagContainer());

		for (auto Character : SensedCharacters)
		{
			if (Self.Perception.IsCharacterPotentiallyReachable(Character))
				return true;
		}

		return false;
	}

	bool AnyPredatorPerceivingMe() const
	{
		auto CharactersPerceivingMe = Self.Perception.GetCharactersPerceivingMe(EPerceptionSense::See, FGameplayTagContainer(), FGameplayTagContainer());

		for (auto Character : CharactersPerceivingMe)
		{
			if (Self.CharacterState.Relationship.GetHostilityTowards(Character.CharacterState) == ERelationshipHostility::Prey)
				return true;
		}

		return false;
	}
}

UCLASS()
class UAIState_Flee_UnreachableEnemy : UAIState_Flee
{
	default AssessmentModuleClass = UAIARM_State_FleeUnreachableEnemy;
	default OwnedGameplayTags.AddTag(GameplayTag::AIState_Conflict_Flee);
	default AIStateTag = GameplayTag::AIState_Conflict_Flee;
	default IsTickingTask = true;

	default FleeSpeed = EWalkSpeed::Sprinting;

	void DoBeforeFear() override
	{
		Super::DoBeforeFear();
		AI.UndrawWeapon();
	}

	bool FearInteractionCondition() const override
	{
		if (!bShouldStayInFearState)
			return false;

		if (AnyUnreachableEnemyPerceivingMe())
			return false;

		if (bShouldMoveToNewPosition)
			return false;

		return true;
	}

	bool ShouldStayInFearState() const override
	{
		if (AnyReachableEnemySensed())
			return false;

		if (AnyUnreachableEnemyPerceivingMe())
			return true;

		if (World.TimeSeconds - StartTimeSeconds > FleeDurationSeconds)
			return false;

		return true;
	}

	bool ShouldCalculateNewPosition() const override
	{
		if (!bFleeWhenClose)
			return false;

		if (bShouldMoveToNewPosition)
			return false;

		// TODO need additional early return to account for unreachable enemies we can't sense directly

		if (AnyUnreachableEnemySensed())
			return true;

		if (!IsValid(CharacterOfInterest))
			return false;

		if (CharacterOfInterest.GetDistanceTo(Self) > FearTooCloseRange)
			return false;

		return true;
	}

	bool AnyUnreachableEnemySensed() const
	{
		auto SensedCharacters = Self.Perception.GetAllSensedCharactersWithRelationship(ERelationship::Enemy, FGameplayTagContainer(), FGameplayTagContainer());

		for (auto Character : SensedCharacters)
		{
			if (!Self.Perception.IsCharacterPotentiallyReachable(Character))
				return true;
		}

		return false;
	}

	bool AnyReachableEnemySensed() const
	{
		auto SensedCharacters = Self.Perception.GetAllSensedCharactersWithRelationship(ERelationship::Enemy, FGameplayTagContainer(), FGameplayTagContainer());

		for (auto Character : SensedCharacters)
		{
			if (Self.Perception.IsCharacterPotentiallyReachable(Character))
				return true;
		}

		return false;
	}

	bool AnyUnreachableEnemyPerceivingMe() const
	{
		auto CharactersPerceivingMe = Self.Perception.GetCharactersPerceivingMe(EPerceptionSense::See, FGameplayTagContainer(), FGameplayTagContainer());

		for (auto Character : CharactersPerceivingMe)
		{
			if (!Self.IsEnemyTowards(Character))
				continue;

			if (!Self.Perception.IsCharacterPotentiallyReachable(Character))
				return true;
		}

		return false;
	}
}

UCLASS()
class UAIState_Flee_UnreachableEnemy_NoHidingInteraction : UAIState_Flee_UnreachableEnemy
{
	default bHide = false;
}

UCLASS()
class UAIState_Flee_Predator_NoHidingInteraction : UAIState_Flee_Predator
{
	default bHide = false;
}

UCLASS()
class UAIState_Flee_AlwaysFlee : UAIState_Flee
{
	default bHide = false;
	default bFleeWhenClose = true;
	default FearTooCloseRange = 1000;
	default FleeSpeed = EWalkSpeed::Running;
}