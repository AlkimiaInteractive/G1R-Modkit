/** State in which we are aware of an enemy's presence but have not decided to enter combat yet */
/** For Humans */
/** We will stay in place and tell the enemy to sheathe their weapon 3 times (not aggressive anymore - switch to daily routine) or until they get too close (switch to combat) */
UCLASS()
class UAIState_Warning_Human_Guard_NoWeaponsDrawnAllowed : UAIState_Warning_Human
{
    default OwnedGameplayTags.AddTag(GameplayTag::AIState_Conflict_Warning_Threat);
    default AIStateTag = GameplayTag::AIState_Conflict_Warning_Threat;
    
    TArray<FGameplayTag> WarningShoutVoicelines_Starter;
    default WarningShoutVoicelines_Starter.Add(GameplayTag::Sound_Voice_Reaction_Warning_WeaponDown);

    TArray<FGameplayTag> WarningShoutVoicelines_Later;
    default WarningShoutVoicelines_Later.Add(GameplayTag::Sound_Voice_Reaction_Warning_InsistWeaponDown);

    default ThreatApproachedTooMuchDistance = 300.0f;
    default NumWarningsBeforeCombat = 2;

    void CheckWarningTypeAndVoicelines() override
    {
        Super::CheckWarningTypeAndVoicelines();

        SetWarningVoicelines(WarningShoutVoicelines_Starter, WarningShoutVoicelines_Later);        
    }

    FString GetDisplayName() const override
    {
        return "No Weapons Allowed - Human Warning";
    }
}