UCLASS()
class AForcedMudTeleportPlayerDetectionActor : APlayerDetectionActorBase
{
    UPROPERTY(NotVisible, NotEditable)
    FName m_SaveGameKey = n"Mud_Sleeper_Teleport_ToCheerPlace_Completed";
    UPROPERTY(NotVisible, NotEditable)
    FName m_MudSleeperUniqueName = n"ST_VLK_Mud_Sleeper";

    void OnCharacterEnter(AGothicCharacter character) override
    {
        Super::OnCharacterEnter(character);
        if(!HasAuthority())
        {
            return;
        }
            
        float32 savedState = 0.0f;
        bool bLoaded = AG1RGameState::GetWorldFloatData(World, m_SaveGameKey, savedState);
        if(bLoaded)
        {
            if(savedState > 0.9f)
            {
                return;
            }
        }
        if(FCharacterUniqueName(m_MudSleeperUniqueName).NPCState == nullptr)
            return;        
        auto abComp = FCharacterUniqueName(m_MudSleeperUniqueName).NPCState.AbilitySystemComponent;
        abComp.SendGameplayEvent(GameplayTag::Event_Teleport_Scripted_MudSleeper_ToCheer, FGameplayEventData());
    }

}
