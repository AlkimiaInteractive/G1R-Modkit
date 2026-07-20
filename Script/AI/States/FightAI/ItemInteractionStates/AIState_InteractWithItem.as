/** AI State to interact with a seen item on the ground */
UCLASS()
class UAIState_InteractWithItem : UAIState_PerceptionResponse
{
    default AssessmentModuleClass = UAIARM_State_InteractWithItem;
    default OwnedGameplayTags.AddTag(GameplayTag::AIState_InteractWithItem);
    default AIStateTag = GameplayTag::AIState_InteractWithItem;

    default OwnedGameplayTags.AddTag(GameplayTag::Debuff_Distracted);
    default OwnedGameplayTags.AddTag(GameplayTag::Debuff_ReducedSense_Hearing);

    UPROPERTY()
    const float InteractionTime = 5.0f;

    UPROPERTY()
    const EWalkSpeed BaseWalkSpeed = EWalkSpeed::Walking;

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        Super::DoTask();
        PerformInteraction();
        
        AI.WaitSeconds(2.0f);
        AI.AssessEvent(GameplayTag::AIEvent_State_Done, FRememberedPerception());
    }

    FString GetDisplayName() const override
    {
        return "InteractWithItem";
    }

    UFUNCTION()
    void PerformInteraction()
    {

    }

    UFUNCTION()
    void AssessDone()
    {
        AI.AssessEvent(GameplayTag::AIEvent_State_Done, FRememberedPerception());
        AI.WaitSeconds(3.0f);
        EndTaskAsSuccess();
    }
}

UCLASS()
class UAIState_InteractWithItem_Eat : UAIState_InteractWithItem
{
    default OwnedGameplayTags.AddTag(GameplayTag::AIState_InteractWithItem_Eat);
    default AIStateTag = GameplayTag::AIState_InteractWithItem_Eat;
    default BaseWalkSpeed = EWalkSpeed::Running;

    void PerformInteraction() override
    {
        Super::PerformInteraction();

        AItemVisualWorld RememberedItemActor = Cast<AItemVisualWorld>(RememberedPerception.Origin.Actor);
        if (!IsValid(RememberedItemActor))
            return;
        
        WaitSeconds(0.4f);
        
        while (RememberedItemActor.GetVelocity().Size() > 30.0f)
        {
            WaitOneTick();
        }

        auto ItemsFound = UNearbyActorsSubsystem::Get().FindActorsOfClassInRadius(AItemVisualWorld, RememberedPerception.Origin.Actor.ActorLocation, 100.0f);
        AItemVisualWorld FoundItemActor = nullptr;
        for (auto Actor : ItemsFound)
        {
            AItemVisualWorld ItemActor = Cast<AItemVisualWorld>(Actor);
            if (ItemActor.ItemDefinition.Class != RememberedItemActor.ItemDefinition.Class)
                continue;

            FoundItemActor = ItemActor;
            break;
        }

        if (!IsValid(FoundItemActor))
            return;

        SetWalkSpeed(BaseWalkSpeed);
        AI.EatSpecificItem(FoundItemActor);

        AssessDone();
    }

    FString GetDisplayName() const override
    {
        return "Eat Item";
    }
}

UCLASS(Abstract)
class UAIState_InteractWithItem_PickUp_Base : UAIState_InteractWithItem
{
    UPROPERTY()
    TSubclassOf<UItemDefinition> PickedUpItemClass;

    void PerformInteraction() override
    {
        Super::PerformInteraction();

        AItemVisualWorld RememberedItemActor = Cast<AItemVisualWorld>(RememberedPerception.Origin.Actor);
        if (!IsValid(RememberedItemActor))
            return;
        
        WaitSeconds(0.4f);

        while (RememberedItemActor.GetVelocity().Size() > 30.0f)
        {
            WaitOneTick();
        }

        auto ItemsFound = UNearbyActorsSubsystem::Get().FindActorsOfClassInRadius(AItemVisualWorld, RememberedPerception.Origin.Actor.ActorLocation, 100.0f);
        AItemVisualWorld FoundItemActor = nullptr;
        for (auto Actor : ItemsFound)
        {
            AItemVisualWorld ItemActor = Cast<AItemVisualWorld>(Actor);
            if (ItemActor.ItemDefinition.Class != RememberedItemActor.ItemDefinition.Class)
                continue;

            FoundItemActor = ItemActor;
            break;
        }

        if (!IsValid(FoundItemActor))
            return;

        FVector ItemPosition = FoundItemActor.ActorLocation;
        TSubclassOf<UItemDefinition> ItemClass = FoundItemActor.ItemDefinition.Class;
        if (AI.FindAndPickUpItem(FoundItemActor.ItemDefinition.Class, ItemPosition, 100.0f).WasSuccessful())
        {
            PickedUpItemClass = ItemClass;
        }
    }
}

UCLASS()
class UAIState_InteractWithItem_PickUp : UAIState_InteractWithItem_PickUp_Base
{
    default OwnedGameplayTags.AddTag(GameplayTag::AIState_InteractWithItem_PickUp);
    default AIStateTag = GameplayTag::AIState_InteractWithItem_PickUp;

    void PerformInteraction() override
    {
        Super::PerformInteraction();
        
        AssessDone();
    }

    FString GetDisplayName() const override
    {
        return "Pick Up Item";
    }
}

UCLASS()
class UAIState_InteractWithItem_PickUpAndConsume : UAIState_InteractWithItem_PickUp_Base
{
    default OwnedGameplayTags.AddTag(GameplayTag::AIState_InteractWithItem_PickUpAndConsume);
    default AIStateTag = GameplayTag::AIState_InteractWithItem_PickUpAndConsume;

    void PerformInteraction() override
    {
        Super::PerformInteraction();

        if (!IsValid(PickedUpItemClass))
        {
            AssessDone();
            return;
        }

        AI.UseItem(PickedUpItemClass);
        AI.WaitSeconds(1.0f);
        AssessDone();
    }

    FString GetDisplayName() const override
    {
        return "Pick Up and Consume Item";
    }
}

class UAIState_InteractWithMeatbug : UAIState_InteractWithItem
{
    default OwnedGameplayTags.AddTag(GameplayTag::AIState_InteractWithItem_Meatbug);
    default AIStateTag = GameplayTag::AIState_InteractWithItem_Meatbug;
    default BaseWalkSpeed = EWalkSpeed::Running;

    void PerformInteraction() override
    {
        Super::PerformInteraction();

        AGothicCharacter MeatbugToSmash = RememberedPerception.Origin.Character;
        if (!IsValid(MeatbugToSmash))
            return;

        AI.CharacterState.SetRelationshipTowards(MeatbugToSmash.CharacterState, ERelationship::Enemy);
        SetWalkSpeed(BaseWalkSpeed);
        AI.SmashMeatbug(MeatbugToSmash);

        AssessDone();
    }

    FString GetDisplayName() const override
    {
        return "Smash Meatbug";
    }
}