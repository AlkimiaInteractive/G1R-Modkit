UCLASS()
class UAIGroup_Warning_Base : UAIGroup_StateEvent
{
    default MaximumMembers = -1;
    default bAllowJoiningAfterActionHasStarted = true;

    UPROPERTY()
    TSet<AGothicCharacter> CharactersBeingWarned;

    UPROPERTY()
    FInGameTime TimeForWarning;

    UPROPERTY()
    int NumWarningsDone = 0;

    float CalculatePriorityForCharacter(AGothicCharacter Character) override
    {
        float Multiplier = 1.0f;

        if (Character.HasGameplayTag(GameplayTag::CampRole_Boss) || 
            Character.HasGameplayTag(GameplayTag::CampRole_Boss) ||
            Character.HasGameplayTag(GameplayTag::CampRole_Boss) ||
            Character.HasGameplayTag(GameplayTag::Character_Personality_Brave))
        {
            Multiplier *= 2.0f;
        }

        if (Character.HasGameplayTag(GameplayTag::Character_Personality_Coward))
        {
            Multiplier *= 0.5f;
        }

        return Character.GetLevelAttribute() * Multiplier;
    }
} 