UCLASS()
class UGA_ForcePlayerSightPerceptionOnStart : UGameplayAbilityCreatureBasic
{
    default m_TickEnabled = true;
    default m_bCanEverTick = true;
    default m_ActivateAbilityOnGranted = true;

    UFUNCTION(BlueprintOverride)
    void OnUpdateAbility_Scriptable(float DeltaTime)
    {
        auto gothicChar = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());
        if(gothicChar == nullptr)
            return;
        auto ai = gothicChar.CharacterState.AI;
        if(ai == nullptr)
            return;
        for(int i=0; i < Gameplay::GetNumPlayerControllers(); i++)
        {
            ai.ForceSightPerception(Cast<AGothicCharacterState>(Gameplay::GetPlayerState(i)));
        }
        EndAbility();
    }
}