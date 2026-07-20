/**
 * Per-NPC storage of the most recent location at which this witness visually
 * perceived the player.
 */
class UAIValueSet_LastSeenPlayer : UAIValueSet
{
    bool bHasValue = false;
    FName PlayerGlobalID;
    FVector LastSeenPos = FVector::ZeroVector;
    FVector LastSeenNavPos = FVector::ZeroVector;

    bool bIsCurrentlySeeingPlayer = false;
}

namespace LastSeenPlayerContext
{
    void Update(const UGameplayAbility_CharacterAI_Gothic AI, AGothicCharacter PlayerCharacter)
    {
        if (!IsValid(AI) || !IsValid(PlayerCharacter))
            return;

        UAIValueSet_LastSeenPlayer Ctx = AI.SpawnedStorage(UAIValueSet_LastSeenPlayer);
        Ctx.bHasValue = true;
        Ctx.PlayerGlobalID = IsValid(PlayerCharacter.CharacterState)
            ? PlayerCharacter.CharacterState.CharacterGlobalId
            : FName();
        Ctx.LastSeenPos = PlayerCharacter.ActorLocation;
        Ctx.LastSeenNavPos = PlayerCharacter.NavAgentLocation;
    }

    /** True when a sighting is stored and (if ExpectedPlayer is valid) the cached
     *  GlobalID matches. */
    bool TryGet(const UGameplayAbility_CharacterAI_Gothic AI,
                AGothicCharacterState ExpectedPlayer,
                FVector&out OutPos, FVector&out OutNavPos)
    {
        if (!IsValid(AI))
            return false;

        UAIValueSet_LastSeenPlayer Ctx = AI.SpawnedStorage(UAIValueSet_LastSeenPlayer);
        if (!Ctx.bHasValue)
            return false;

        if (IsValid(ExpectedPlayer) && Ctx.PlayerGlobalID != ExpectedPlayer.CharacterGlobalId)
            return false;

        OutPos = Ctx.LastSeenPos;
        OutNavPos = Ctx.LastSeenNavPos;
        return true;
    }
}
