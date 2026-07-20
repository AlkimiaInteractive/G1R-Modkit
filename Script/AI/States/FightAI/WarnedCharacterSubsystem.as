struct FWarningCharacterHandle
{
    FWarningCharacterHandle(const AGothicCharacterState WarningCharacterState)
    {
        CharacterState = WarningCharacterState;
    }

    const AGothicCharacterState CharacterState;
    TSet<AGothicCharacterState> WarnedCharacters;
}

struct FWarnedCharacterReasons
{
    AGothicCharacterState CharacterState;
    // TMap<EWarningReason, int> ReasonCounters;
}

enum EWarningReason
{
    Territory,
    Trespassing,
    Pickpocket,
    Theft,
    Interaction,
    WeaponThreat,
    MAX
}

class UWarnedCharacterSubsystem : UScriptWorldSubsystem
{
    TSet<AGothicCharacterState> WarningCharacters;
    TMap<AGothicCharacterState, FWarningCharacterHandle> WarningCharacterHandles;

    bool RegisterJoinWarning(const AGothicCharacterState Starter, const AGothicCharacterState Ally)
    {
        if (!IsValid(Starter) || !IsValid(Ally) || Starter == Ally)
            return false;

        PruneInvalidMembers();

        FWarningCharacterHandle AllyHandle;
        if (!WarningCharacters.Contains(Ally) || !WarningCharacterHandles.Find(Ally, AllyHandle))
            return false;

        if (!WarningCharacters.Contains(Starter))
        {
            WarningCharacters.Add(Starter);
        }

        FWarningCharacterHandle WarningCharacterHandle = WarningCharacterHandles.FindOrAdd(Starter, FWarningCharacterHandle(Starter));
        WarningCharacterHandle.WarnedCharacters = AllyHandle.WarnedCharacters;
        return true;
    }

    bool RegisterBeginWarning(const AGothicCharacterState Starter, const AGothicCharacterState Target /*, EWarningReason Reason*/)
    {
        if (!IsValid(Starter) || !IsValid(Target) || Starter == Target)
            return false;

        PruneInvalidMembers();

        if (!WarningCharacters.Contains(Starter))
        {
            WarningCharacters.Add(Starter);
        }

        FWarningCharacterHandle WarningCharacterHandle = WarningCharacterHandles.FindOrAdd(Starter, FWarningCharacterHandle(Starter));
        WarningCharacterHandle.WarnedCharacters.Add(Target);
        return true;
    }

    void RegisterStopWarningCharacter(const AGothicCharacterState Warner, const AGothicCharacterState WarnedCharacter)
    {
        FWarningCharacterHandle WarningCharacterHandle;
        if (!WarningCharacterHandles.Find(Warner, WarningCharacterHandle))
            return;

        WarningCharacterHandle.WarnedCharacters.Remove(WarnedCharacter);
        PruneInvalidMembers();
    }

    bool IsCharacterWarning(const AGothicCharacterState Warner)
    {
        PruneInvalidMembers();

        if (!WarningCharacters.Contains(Warner) || !WarningCharacterHandles.Contains(Warner))
            return false;

        return true;
    }

    private void PruneInvalidMembers()
    {
        TSet<AGothicCharacterState> ToRemove;
        for (auto CharacterState : WarningCharacters)
        {
            if (!IsValid(CharacterState) || !CharacterState.HasGameplayTag(GameplayTag::AIState_Conflict_Warning))
            {
                ToRemove.Add(CharacterState);
                continue;
            }

            FWarningCharacterHandle CharacterHandle;
            if (!WarningCharacterHandles.Find(CharacterState, CharacterHandle))
            {
                ToRemove.Add(CharacterState);
                continue;
            }

            if (CharacterHandle.WarnedCharacters.IsEmpty())
            {
                ToRemove.Add(CharacterState);
                continue;
            }
        }

        for (auto CharacterToRemove : ToRemove)
        {
            WarningCharacterHandles.Remove(CharacterToRemove);
            WarningCharacters.Remove(CharacterToRemove);
        }
    }
}