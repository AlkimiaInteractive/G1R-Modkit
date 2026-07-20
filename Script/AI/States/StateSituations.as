UCLASS()
class UFightAI_StateSituation : UObject
{
    UPROPERTY()
    UGameplayAbility_CharacterAI_Gothic AI;

    UGothicCharacterAIState GetState() const property
    {
        return Cast<UGothicCharacterAIState>(AI.CurrentState);
    }

    /** Override and return true if the NPC is in the situation that this class represents. */
    bool IsInSituation() const
    {        
        return false;
    }
}



//////////////////////////////////////////////////////////////////////////


//////////////////////////////
// CHARACTER BASED SITUATIONS
//////////////////////////////

UCLASS()
class USS_CharacterCheck : UFightAI_StateSituation
{
    UPROPERTY()
    AGothicCharacter CharacterToCheck;
}

UCLASS()
class USS_IsCharacterWithinDistance : USS_CharacterCheck
{
    USS_IsCharacterWithinDistance(float InDistance)
    {
        Distance = InDistance;
    }

    UPROPERTY()
    float Distance = 0.0f;

    bool IsInSituation() const override
    {
        return AI.Character.GetDistanceTo(CharacterToCheck) <= Distance;
    }
}