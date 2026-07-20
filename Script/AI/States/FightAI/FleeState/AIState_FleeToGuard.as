class UAIState_FleeToGuard : UAIState_Flee
{
    default OwnedGameplayTags.AddTag(GameplayTag::AIState_Conflict_Flee_GetGuardHelp);
    default AIStateTag = GameplayTag::AIState_Conflict_Flee_GetGuardHelp;
    default IsTickingTask = true;

    // TODO: Implement find, get and follow guard
    
    default FleeVoicelineTag = GameplayTag::Sound_Voice_Reaction_Crime_Alarm_CallGuards;

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
        if (AnyStrongerEnemyPerceivingMe())
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

        if (AnyStrongerEnemySensed())
            return true;

        if (!IsValid(CharacterOfInterest))
            return false;

        if (CharacterOfInterest.GetDistanceTo(Self) > FearTooCloseRange)
            return false;

        return true;
    }

    bool AnyStrongerEnemySensed() const
    {
        auto SensedCharacters = Self.Perception.GetAllSensedCharactersWithRelationship(ERelationship::Enemy, FGameplayTagContainer(), FGameplayTagContainer());

        for (auto Character : SensedCharacters)
        {
            if (Character.IsStrongerThan(Self))
                return true;
        }

        return false;
    }

    bool AnyStrongerEnemyPerceivingMe() const
    {
        auto CharactersPerceivingMe = Self.Perception.GetCharactersPerceivingMe(EPerceptionSense::See, FGameplayTagContainer(), FGameplayTagContainer());

        for (auto Character : CharactersPerceivingMe)
        {
            if (!Self.IsEnemyTowards(Character))
                continue;

            if (Character.IsStrongerThan(Self))
                return true;
        }

        return false;
    }

    FString GetDisplayName() const override
    {
        return "Flee to Guard State";
    }
}