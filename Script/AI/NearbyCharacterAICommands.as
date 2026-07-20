/**
 * Mixins about personal space and nearby characters
 * - returned characters are always alive and undefeated
 * - ...CrowdCollisions indicate CrowdAgentRadius as central parameter of messurement, which means this radius is often closer to the actual character visual size than the SimpleCollision
 *      A character does not need to use CrowdAvoidance to use these methods
 * - ...Collisions indicate SimpleCollisionRadius as central parameter of messurement, which means these values will represent the characters actual simple physics collisions
 */

/**
 * Returns true if there are living, undefeated characters that have less distance between crowd collisions of Self and Others than DistanceBetweenShapes
 * @param SearchNearbyCharacterRadius: measured by distance between actor locations. Cannot detect character by overlap, so make it large enough. Should be larger than DistanceBetweenCollisions
 */
mixin bool AreOthersNearbyCrowdCollisions(AGothicCharacter Self, float SearchNearbyCharacterRadius, float DistanceBetweenShapes, TArray<AGothicCharacter>& NearbyCharacters)
{
	if (Self == nullptr)
		return false;

	auto NASS = UNearbyActorsSubsystem::Get();

	// expects that there is no other Agent that has more than 4 times my size
	TArray<AActor> OtherCharacters = NASS.FindActorsOfClassInRadius(AGothicCharacter::StaticClass(), Self.ActorLocation, SearchNearbyCharacterRadius);
	OtherCharacters.Remove(Self);

	for (auto& Actor : OtherCharacters)
	{
		AGothicCharacter OtherCharacter = Cast<AGothicCharacter>(Actor);

		if (OtherCharacter.IsDead() || OtherCharacter.IsDefeated())
			continue;

		if (Self.IsCharacterNearbyCrowdCollisions(OtherCharacter, DistanceBetweenShapes))
		{
			NearbyCharacters.Add(Cast<AGothicCharacter>(Actor));
		}
	}

	return !NearbyCharacters.IsEmpty();
}

/**
 * Returns true if there are living, undefeated characters that have less distance between collisions of Self and Others than DistanceBetweenCollisions
 * @param SearchNearbyCharacterRadius: measured by distance between actor locations. Cannot detect overlaps, so make it large enough. Should be larger than DistanceBetweenCollisions
 */
mixin bool AreOthersNearbyCollisions(AGothicCharacter Self, float SearchNearbyCharacterRadius, float DistanceBetweenCollisions, TArray<AGothicCharacter>& NearbyCharacters)
{
	if (Self == nullptr)
		return false;

	auto NASS = UNearbyActorsSubsystem::Get();

	// expects that there is no other Agent that has more than 4 times my size
	TArray<AActor> OtherCharacters = NASS.FindActorsOfClassInRadius(AGothicCharacter::StaticClass(), Self.ActorLocation, SearchNearbyCharacterRadius);
	OtherCharacters.Remove(Self);

	for (auto& Actor : OtherCharacters)
	{
		AGothicCharacter OtherCharacter = Cast<AGothicCharacter>(Actor);

		if (OtherCharacter.IsDead() || OtherCharacter.IsDefeated())
			continue;

		if (Self.IsCharacterNearbyCollisions(OtherCharacter, DistanceBetweenCollisions))
		{
			NearbyCharacters.Add(Cast<AGothicCharacter>(Actor));
		}
	}

	return !NearbyCharacters.IsEmpty();
}

/** Is 2D Distance between CrowdAgentCollisions of both characters smaller than NearbyRadius */
mixin bool IsCharacterNearbyCrowdCollisions(AGothicCharacter Self, AGothicCharacter Other, float NearbyRadius)
{
	return Self.GetDistanceBetweenCrowdAgentCollisions(Other) < NearbyRadius;
}

/** Is 2D Distance between SimpleCollisions of both characters smaller than NearbyRadius */
mixin bool IsCharacterNearbyCollisions(AGothicCharacter Self, AGothicCharacter Other, float NearbyRadius)
{
	return Self.GetDistanceBetweenCharacterCollisions(Other) < NearbyRadius;
}

/** 2D Distance between SimpleCollisions of 2 characters. Negative values indicate overlaps.  */
mixin float GetDistanceBetweenCharacterCollisions(AGothicCharacter Self, AGothicCharacter Other)
{
	return Self.ActorLocation.Dist2D(Other.ActorLocation) - Self.SimpleCollisionRadius - Other.SimpleCollisionRadius;
}