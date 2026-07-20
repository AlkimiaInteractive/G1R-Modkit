UCLASS()
class UCombatBehaviorSet_UseHealingConsumable : UCombatBehaviorSet
{
    default Roles.Add(ECombatRole::HealSelf);

    // BEHAVIORS ///////
    default Behavior_MediumPriority()
            .DoNode(UCBT_Tree_ExitBlockStance());
            
    default Behavior_MediumPriority()
            .DoNode(UCBT_Tree_ConsumeItemIfNoEnemyClose());
            
    default Behavior_MediumPriority()
            .DoNode(UCBT_Tree_DodgeAwayFromEnemyWhenCloserThan(150.0f, 10.0f))
                .AddRequirement(UCS_Not(UCS_EnemyDefeated()));
                
    default Behavior_Movement()
                .DoNode(UCBT_Tree_SpreadOut_Strafer());

    default Behavior_Movement()
                .DoNode(UCBT_Tree_MoveToDoSelectedAttack_Strafer(), 0.1f);
    
    default Behavior_Movement()
                .DoNode(UCBT_Tree_Positioning_Strafer());

    ////////////////////
    
    bool ShouldUseBehavior(FString&out Reason = "") const override
    {
        if (!Super::ShouldUseBehavior(Reason))
            return false;

        if (Combat.SelectedItemAction == nullptr)
            return false;
        
        if (!Combat.SelectedItemAction.ActionTag.MatchesTag(GameplayTag::Action_QuickConsume))
            return false;

        float LastUseTimeSeconds = -MAX_flt;
        Combat.AI.LastTimeItemActionUsages.Find(GameplayTag::Action_QuickConsume, LastUseTimeSeconds);
        float Time = Combat.AI.World.TimeSeconds - LastUseTimeSeconds;
        if (Time < 5.0f)
            return false;

        if (Combat.CharacterOfInterest == nullptr)
            return true;

        if (Combat.DistanceToCharacterOfInterest < 400.0f)
            return false;
        
        ERelationshipHostility RelationshipHostility = Combat.Self.Relationship.GetHostilityTowards(Combat.CharacterOfInterest.CharacterState);
        if (RelationshipHostility == ERelationshipHostility::TrainingFight)
            return false;
        
        return true;
    }

    void SetupConfigValues() override
    {
        Super::SetupConfigValues();

        Combat.Positioning.MinimumPositionDistance = 30.0f;
        Combat.Config.PreferredDistance = 500.0f;
    }

    bool IsValidForCharacter(const AGothicCharacter Character) const override
    {
        if (Character.Inventory.GetItemsWithSpec(GameplayTag::Item_Property_Consumable).Num() == 0)
            return false;

        return Super::IsValidForCharacter(Character);
    }
}

UCLASS()
class UCombatBehaviorSetPackage_Items : UCombatBehaviorSetPackage
{
    default CombatBehaviorSetClasses.Add(UCombatBehaviorSet_UseHealingConsumable::StaticClass());
}