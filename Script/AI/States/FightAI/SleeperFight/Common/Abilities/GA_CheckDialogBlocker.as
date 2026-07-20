UCLASS()
class UGA_CheckDialogBlocker : UGameplayAbilityCreatureBasic
{
    default m_ActivateAbilityOnGranted = true;

    UPROPERTY()
    FString m_InitialDialog;

    UFUNCTION(BlueprintOverride)
    void OnActivateAbility_Scriptable(FGameplayAbilityActorInfo GAActorInfo,
                                      FGameplayEventData TriggerEventData)
    {
        auto PlayerCharacter = Cast<AGothicCharacter>(Gameplay::GetPlayerCharacter(0));
        auto playerState = Cast<AGothicCharacterState>(PlayerCharacter.PlayerState);
        if(!HasListened(playerState, m_InitialDialog))
        {
            ClearAbility();
            return;
        }
        auto avatar = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());
        if(avatar.IsEnemyTowards(PlayerCharacter))
        {
            ClearAbility();
            return;
        }
        avatar.GetCharacterState().SetRelationshipTowards(playerState, ERelationship::Enemy);
        ClearAbility();
    }

    bool HasListened(AGothicCharacterState PlayerState, FString Text)
    {
        if(PlayerState.HasListenedTo(LocText(Text)))
        {
            FString textToPrint = "HAS LISTENED";
            textToPrint.Append(Text);
            Print(textToPrint, 50.f, FLinearColor::Green);
            return true;
        }

        FString textToPrint = "HAS NOT LISTENED";
        textToPrint.Append(Text);
        Print(textToPrint, 50.f, FLinearColor::Red);
        return false;
    }

}