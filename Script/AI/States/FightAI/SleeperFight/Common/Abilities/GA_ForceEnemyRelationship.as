UCLASS()
class UGA_ForceEnemyRelationship : UGameplayAbilityCreatureBasic
{
    default m_ActivateAbilityOnGranted = true;
    UPROPERTY()
    FGameplayTag m_ConversationTag = GameplayTag::AIState_Conversation;
    UPROPERTY()
    FGameplayTag m_ConflictTag = GameplayTag::AIState_Conflict;

    UPROPERTY()
    private FTimerHandle TaskTimer;

    UFUNCTION(BlueprintOverride)
    void OnActivateAbility_Scriptable(FGameplayAbilityActorInfo GAActorInfo,
                                      FGameplayEventData TriggerEventData)
    {        
        TaskTimer = System::SetTimerDelegate(FTimerDynamicDelegate(this, n"ForceEnemy"), 5.f, false);
    }

    UFUNCTION()
    void ForceEnemy()
    {
        if(System::IsTimerActiveHandle(TaskTimer))
            System::ClearAndInvalidateTimerHandle(TaskTimer);
        
        auto PlayerCharacter = Cast<AGothicCharacter>(Gameplay::GetPlayerCharacter(0));
        auto playerState = Cast<AGothicCharacterState>(PlayerCharacter.PlayerState);
        auto avatar = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());
        auto avatarCharacterState = Cast<AGothicCharacterState>(avatar.GetCharacterState());
        //avatar.GetCharacterState().SetRelationshipTowards(playerState, ERelationship::Enemy);
        FGameplayTagContainer tags;
        tags.AddTag(m_ConversationTag);
        tags.AddTag(m_ConflictTag);
        if(avatar.GetGothicAbilitySystemComponent().HasAnyGameplayTags(tags))
        {
            ClearAbility();
            //Print("Cleared Ability", 10.f, FLinearColor::Red);
            return;
        }
        avatarCharacterState.AI.StartFightCustomWithWeapon(playerState, GameplayTag::AIConflict_FightType_Real, GameplayTag::AIConflict_FightGoal_Kill, GameplayTag::AIConflict_Duration_Permanent);
        //Print("StartFightCustomWithWeapon", 10.f, FLinearColor::Green);
        ClearAbility();
        
    }
}