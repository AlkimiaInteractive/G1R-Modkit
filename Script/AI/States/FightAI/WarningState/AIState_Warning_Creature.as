/** State in which we are aware of an enemy's presence but have not decided to enter combat yet */
/** For creatures */
UCLASS()
class UAIState_Warning_Creature : UAIState_Warning 
{
    // Use Far Warning instead of Close Warning if the target is further away than this
    UPROPERTY()
    float m_UseFarWarningThreshold = 850.0f;

    default ThreatApproachedTooMuchDistance = 1850.0f;
    default TooCloseDistance = 550;

    default AssessmentModuleClass = UAIARM_State_Warning_Creature;
    default NumWarningsBeforeCombat = 2;

    default SwitchAIStateMode = ESwitchAIStateMode::EndState_DisallowGracefulExit;
    default EndInteractionMode = ESwitchAIStateEndInteractionMode::EndAnyOngoingInteraction_Quick;

    int TauntCount = 0;

    void BeginWarning() override
    {
        FString DebugOwnerName = "AIState_Warning_Creature";
        
        SetCustomPathfollowingSetting(SetupPathfollowingSettings(DebugOwnerName));
        
        Super::BeginWarning();
    }

    void WarnOther() override
    {
        FGameplayTagContainer RequireWarningTag;
        RequireWarningTag.AddTag(GameplayTag::Combat_Taunt_Warning);

        FGameplayTagContainer RequireShortTag;
        RequireShortTag.AddTag(GameplayTag::Combat_Taunt_Short);

        FGameplayTagContainer RequiredTags = Self.GetDistanceTo(CharacterOfInterest) < m_UseFarWarningThreshold ?
            RequireShortTag :
            RequireWarningTag;

        if (!ShouldTaunt())
            return;
        
        if (!Self.IsSwimming() && !Self.IsDiving())
        {
            AI.TauntMatchingAll(RequiredTags, FGameplayTagContainer());
        }

        Super::WarnOther();
    }

    FString GetDisplayName() const override
    {
        return "Creature Warning";
    }

    bool ShouldTaunt()
    {
        auto CombatClass = AI.States[GameplayTag::AIState_Conflict_Combat];

        bool bCanDoTauntsWhileMoving = false;
        if (IsValid(CombatClass))
        {
            auto CombatStateDO = Cast<UAIState_Combat_G1R>(CombatClass.DefaultObject);
            bCanDoTauntsWhileMoving = CombatStateDO.bCanDoTauntsWhileMoving;
        }

        return bCanDoTauntsWhileMoving || !Self.IsMoving();
    }
}