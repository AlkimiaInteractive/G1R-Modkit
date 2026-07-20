//PARENT CLASS

//     default bAllowBlockingPathWhileStationary = true;
UCLASS()
class UAIState_RandomInteractions_Human : UAIState_RandomInteractions
{
    default BackupInteractions.Add(FInteraction(GameplayTag::Action_Ambient_StandAround,InDurationSeconds = 30.0f));
    default BackupInteractions.Add(FInteraction(GameplayTag::Action_Interact_Sit_Chair));
    default BackupInteractions.Add(FInteraction(GameplayTag::Action_Ambient_Eat));
    default BackupInteractions.Add(FInteraction(GameplayTag::Action_Ambient_Drink));
}

UCLASS()
class UAIState_RandomInteractions_ChainedSpots_Human : UAIState_RandomInteractions_OnChainedSpots
{
    default BackupInteractions.Add(FInteraction(GameplayTag::Action_Ambient_StandAround,InDurationSeconds = 30.0f));
    default BackupInteractions.Add(FInteraction(GameplayTag::Action_Interact_Sit_Chair));
    default BackupInteractions.Add(FInteraction(GameplayTag::Action_Ambient_Eat));
    default BackupInteractions.Add(FInteraction(GameplayTag::Action_Ambient_Drink));
}

//STATES

UCLASS()
class UAIState_Cook : UAIState_RandomInteractions_Human 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Crafting_Cook));
}

UCLASS()
class UAIState_Menace : UAIState_RandomInteractions_Human 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Menace));
}

UCLASS()
class UAIState_CheckGoods : UAIState_RandomInteractions_Human 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_CheckGoods));
}

UCLASS()
class UAIState_TakeNotes : UAIState_RandomInteractions_Human 
{
    default bAllowBlockingPathWhileStationary = true;

    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_TakeNotes));
}

UCLASS()
class UAIState_CheckGoods_TakeNotes : UAIState_RandomInteractions_Human 
{
    default bAllowBlockingPathWhileStationary = true;

    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_TakeNotes));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_CheckGoods));
}


UCLASS()
class UAIState_CutWood_Trunk : UAIState_RandomInteractions_Human 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_CutWood_OnTrunk));
}

UCLASS()
class UAIState_CutWood_Tree: UAIState_RandomInteractions_Human 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_CutWood_Tree));
}

UCLASS()
class UAIState_Shout: UAIState_RandomInteractions_Human 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Shout));
}

UCLASS()
class UAIState_CalmPeople: UAIState_RandomInteractions_Human 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_CalmPeople));
}


UCLASS()
class UAIState_LeanBar : UAIState_RandomInteractions_Human 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_LeanBar));
    default OwnedGameplayTags.AddTag(GameplayTag::Character_AllowFarInteractions);
}

UCLASS()
class UAIState_LeanWall : UAIState_RandomInteractions_Human 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_LeanWall));
}

UCLASS()
class UAIState_Recruit : UAIState_RandomInteractions_Human 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Recruit));
}

// ------------------------------------------------------------------------------
// Transport - Go only once, then rest
// ------------------------------------------------------------------------------

UCLASS(Abstract)
class UAIState_TransportObjectOnce : UAIState_CarryObject
{
    /** State to do for resting */
    UPROPERTY()
    TSubclassOf<UCharacterAIState> RestingAIState = UAIState_SitAround::StaticClass();

    void DoAfterLeftObject() override
    {
        AI.GotoPreferredLocation();

        DoSubstate(RestingAIState);        
    }
}

class UAIState_TransportOreBag : UAIState_TransportObjectOnce
{
    UAIState_TransportOreBag(FName InTakeOreBagPosition, FName InLeaveOreBagPosition)
    {
        TakingSpot = InTakeOreBagPosition;
        LeavingSpot = InLeaveOreBagPosition;
        Item = UItAI_Orebag::StaticClass();
    }

    default TakeObjectAction = GameplayTag::Action_Ambient_TakeOreBag;
    default LeaveObjectAction = GameplayTag::Action_Ambient_LeaveOreBag;
    
    default RestingAIState = UAIState_StandAround::StaticClass();
}

class UAIState_TransportBox : UAIState_TransportObjectOnce
{
    UAIState_TransportBox(FName InTakeObjectPosition, FName InLeaveObjectPosition)
    {
        TakingSpot = InTakeObjectPosition;
        LeavingSpot = InLeaveObjectPosition;
        Item = UItAI_Box::StaticClass();
    }

    default TakeObjectAction = GameplayTag::Action_Ambient_TakeBox;
    default LeaveObjectAction = GameplayTag::Action_Ambient_LeaveBox;
}

class UAIState_TransportFoodBag : UAIState_TransportObjectOnce
{
    UAIState_TransportFoodBag(FName InTakeObjectPosition, FName InLeaveObjectPosition)
    {
        TakingSpot = InTakeObjectPosition;
        LeavingSpot = InLeaveObjectPosition;
        Item = UItAI_Foodbag::StaticClass();
    }

    default TakeObjectAction = GameplayTag::Action_Ambient_TakeFoodBag;
    default LeaveObjectAction = GameplayTag::Action_Ambient_LeaveFoodBag;
}

class UAIState_TransportMeat : UAIState_TransportObjectOnce
{
    UAIState_TransportMeat(FName InTakeObjectPosition, FName InLeaveObjectPosition)
    {
        TakingSpot = InTakeObjectPosition;
        LeavingSpot = InLeaveObjectPosition;
    }

    default TakeObjectAction = GameplayTag::Action_Ambient_TakeMeat;
    default LeaveObjectAction = GameplayTag::Action_Ambient_LeaveMeat;
}

class UAIState_TransportPlank : UAIState_TransportObjectOnce
{
    UAIState_TransportPlank(FName InTakeObjectPosition, FName InLeaveObjectPosition)
    {
        TakingSpot = InTakeObjectPosition;
        LeavingSpot = InLeaveObjectPosition;
        Item = UItAI_Plank::StaticClass();
    }

    default TakeObjectAction = GameplayTag::Action_Ambient_TakePlank;
    default LeaveObjectAction = GameplayTag::Action_Ambient_LeavePlank;
}

class UAIState_TransportWood : UAIState_TransportObjectOnce
{
    UAIState_TransportWood(FName InTakeObjectPosition, FName InLeaveObjectPosition)
    {
        TakingSpot = InTakeObjectPosition;
        LeavingSpot = InLeaveObjectPosition;
        Item = UItAI_BrushWood::StaticClass();
    }

    default TakeObjectAction = GameplayTag::Action_Ambient_GetWood;
    default LeaveObjectAction = GameplayTag::Action_Ambient_LeaveWood;
}

// ------------------------------------------------------------------------------
// Carry - Go back and forth
// ------------------------------------------------------------------------------

UCLASS(Abstract)
class UAIState_CarryObjectAndRest : UAIState_CarryObject
{
    /** 
     * Probability value 0..1 deciding whether the character should rest after leaving the object.
     * 
     * Value 0 meaning "never rest"
     * Value 1 meaning "always rest"
     */
    UPROPERTY()
    float RestChance = 0;

    /** If the character is resting, how long should resting take? (-1 for infinite) */
    UPROPERTY()
    float RestDurationSeconds = 40.0;

    /** State to do for resting */
    UPROPERTY()
    TSubclassOf<UCharacterAIState> RestingAIState = UAIState_SitAround::StaticClass();

    void DoAfterLeftObject() override
    {
        if (RestingAIState == nullptr)
            return;

        if (RestChance == 1.0f || Math::RandRange(0.0, 1.0) < RestChance)
        {
            DoSubstate(UAIState_SitAround()).TimeLimit(RestDurationSeconds);
        }
    }
}

class UAIState_CarryOreBags : UAIState_CarryObjectAndRest
{
    UAIState_CarryOreBags(FName InTakeOreBagPosition, FName InLeaveOreBagPosition, float GetRadius = 1000.0f, float LeaveRadius = 1000.0f)
    {
        TakingSpot = InTakeOreBagPosition;
        LeavingSpot = InLeaveOreBagPosition;
        Item = UItAI_Orebag::StaticClass();
        CollectRadius = GetRadius;
        DeliveryRadius = LeaveRadius;
    }

    default TakeObjectAction = GameplayTag::Action_Ambient_TakeOreBag;
    default LeaveObjectAction = GameplayTag::Action_Ambient_LeaveOreBag;

    default RestChance = 0;
    default RestDurationSeconds = 60.0;
    default RestingAIState = UAIState_SitAround::StaticClass();


}

class UAIState_CarryObjectAndChangeDailyRoutine : UAIState_CarryObject
{

    UPROPERTY()
    float RestChance = 1;

    /** If the character is resting, how long should resting take? (-1 for infinite) */
    UPROPERTY()
    float RestDurationSeconds = 40.0;

    /** State to do for resting */
    UPROPERTY()
    TSubclassOf<UCharacterAIState> RestingAIState = UAIState_SitAround::StaticClass();

    void DoAfterLeftObject() override
    {
        if (RestingAIState == nullptr)
            return;

        if (RestChance == 1.0f)
        {
            AI.NPCState.ExchangeDailyRoutine(UDailyRoutine_OM_VLK_Digger35_1050N_Rest());
        }
    }
}

class UAIState_CarryOreBagsAndExchangeDailyRoutine : UAIState_CarryObjectAndChangeDailyRoutine
{
    UAIState_CarryOreBagsAndExchangeDailyRoutine(FName InTakeOreBagPosition, FName InLeaveOreBagPosition, float GetRadius = 1000.0f, float LeaveRadius = 1000.0f)
    {
        TakingSpot = InTakeOreBagPosition;
        LeavingSpot = InLeaveOreBagPosition;
        Item = UItAI_Orebag::StaticClass();
        CollectRadius = GetRadius;
        DeliveryRadius = LeaveRadius;
    }

    default TakeObjectAction = GameplayTag::Action_Ambient_TakeOreBag;
    default LeaveObjectAction = GameplayTag::Action_Ambient_LeaveOreBag;

    default RestChance = 1;
}

class UAIState_CarryBoxes : UAIState_CarryObjectAndRest
{
    UAIState_CarryBoxes(FName InTakeObjectPosition, FName InLeaveObjectPosition, float GetRadius = 1000.0f, float LeaveRadius = 1000.0f)
    {
        TakingSpot = InTakeObjectPosition;
        LeavingSpot = InLeaveObjectPosition;
        Item = UItAI_Box::StaticClass();
        CollectRadius = GetRadius;
        DeliveryRadius = LeaveRadius;
    }

    default RestChance = 0;

    default TakeObjectAction = GameplayTag::Action_Ambient_TakeBox;
    default LeaveObjectAction = GameplayTag::Action_Ambient_LeaveBox;
}

class UAIState_CarryBoxesMidHigh : UAIState_CarryObjectAndRest
{
    UAIState_CarryBoxesMidHigh (FName InTakeObjectPosition, FName InLeaveObjectPosition, float GetRadius = 1000.0f, float LeaveRadius = 1000.0f)
    {
        TakingSpot = InTakeObjectPosition;
        LeavingSpot = InLeaveObjectPosition;
        Item = UItAI_BoxMidHigh::StaticClass();
        CollectRadius = GetRadius;
        DeliveryRadius = LeaveRadius;
    }

    default RestChance = 0;

    default TakeObjectAction = GameplayTag::Action_Ambient_TakeBox;
    default LeaveObjectAction = GameplayTag::Action_Ambient_LeaveBox;
}


class UAIState_CarryPlanks : UAIState_CarryObjectAndRest
{
    UAIState_CarryPlanks(FName InTakeObjectPosition, FName InLeaveObjectPosition, float GetRadius = 1000.0f, float LeaveRadius = 1000.0f)
    {
        TakingSpot = InTakeObjectPosition;
        LeavingSpot = InLeaveObjectPosition;
        Item = UItAI_Plank::StaticClass();
        CollectRadius = GetRadius;
        DeliveryRadius = LeaveRadius;
    }

    default TakeObjectAction = GameplayTag::Action_Ambient_TakePlank;
    default LeaveObjectAction = GameplayTag::Action_Ambient_LeavePlank;

    default RestChance = 0.0;
}

class UAIState_CarryPlanksFromWall : UAIState_CarryObjectAndRest
{
    UAIState_CarryPlanksFromWall(FName InTakeObjectPosition, FName InLeaveObjectPosition, float GetRadius = 1000.0f, float LeaveRadius = 1000.0f)
    {
        TakingSpot = InTakeObjectPosition;
        LeavingSpot = InLeaveObjectPosition;
        Item = UItAI_PlankFromWall::StaticClass();
        CollectRadius = GetRadius;
        DeliveryRadius = LeaveRadius;
    }

    default TakeObjectAction = GameplayTag::Action_Ambient_TakePlank;
    default LeaveObjectAction = GameplayTag::Action_Ambient_LeavePlank;

    default RestChance = 0.0;
}

class UAIState_CarryFoodBags : UAIState_CarryObjectAndRest
{
    UAIState_CarryFoodBags(FName InTakeObjectPosition, FName InLeaveObjectPosition, float GetRadius = 1000.0f, float LeaveRadius = 1000.0f)
    {
        TakingSpot = InTakeObjectPosition;
        LeavingSpot = InLeaveObjectPosition;
        Item = UItAI_Foodbag::StaticClass();
        CollectRadius = GetRadius;
        DeliveryRadius = LeaveRadius;
    }


    default TakeObjectAction = GameplayTag::Action_Ambient_TakeFoodBag;
    default LeaveObjectAction = GameplayTag::Action_Ambient_LeaveFoodBag;

    default RestChance = 0.0;
}

class UAIState_CarryMeat : UAIState_CarryObjectAndRest
{
    UAIState_CarryMeat(FName InTakeObjectPosition, FName InLeaveObjectPosition, float GetRadius = 1000.0f, float LeaveRadius = 1000.0f)
    {
        TakingSpot = InTakeObjectPosition;
        LeavingSpot = InLeaveObjectPosition;
        CollectRadius = GetRadius;
        DeliveryRadius = LeaveRadius;
    }

    default TakeObjectAction = GameplayTag::Action_Ambient_TakeMeat;
    default LeaveObjectAction = GameplayTag::Action_Ambient_LeaveMeat;
}



class UAIState_CarryWood : UAIState_CarryObjectAndRest
{
    UAIState_CarryWood(FName InTakeObjectPosition, FName InLeaveObjectPosition, float GetRadius = 1000.0f, float LeaveRadius = 1000.0f)
    {
        TakingSpot = InTakeObjectPosition;
        LeavingSpot = InLeaveObjectPosition;
        Item = UItAI_BrushWood::StaticClass();
        CollectRadius = GetRadius;
        DeliveryRadius = LeaveRadius;
    }

    default TakeObjectAction = GameplayTag::Action_Ambient_GetWood;
    default LeaveObjectAction = GameplayTag::Action_Ambient_LeaveWood;

    default RestChance = 0.0;
}

class UAIState_CarryWoodFromWall : UAIState_CarryObjectAndRest
{
    UAIState_CarryWoodFromWall(FName InTakeObjectPosition, FName InLeaveObjectPosition, float GetRadius = 1000.0f, float LeaveRadius = 1000.0f)
    {
        TakingSpot = InTakeObjectPosition;
        LeavingSpot = InLeaveObjectPosition;
        Item = UItAI_BrushWoodFromWall::StaticClass();
        CollectRadius = GetRadius;
        DeliveryRadius = LeaveRadius;
    }

    default TakeObjectAction = GameplayTag::Action_Ambient_GetWood;
    default LeaveObjectAction = GameplayTag::Action_Ambient_LeaveWood;

    default RestChance = 0.0;
}


// ------------------------------------------------------------------------------

UCLASS()
class UAIState_ProcessOre : UGothicCharacterSimulateableAIState 
{
    UAIState_ProcessOre(FName InBucketPosition, FName InOrePosition)
    {
        BucketPosition = InBucketPosition;
        OrePosition = InOrePosition;

    }

    UPROPERTY()
    FName BucketPosition;
    UPROPERTY()
    FName OrePosition;

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        AI.TryUseFreepointAt(GameplayTag::Action_Ambient_GetBucket,BucketPosition,500.f);

        while(!bShouldExitState)
        {
            AI.TryUseFreepointAt(GameplayTag::Action_Ambient_FillBucket,OrePosition,1000.f);
            AI.TryUseFreepointAt(GameplayTag::Action_Ambient_PlaceBucket,BucketPosition,1000.f);
            AI.TryUseFreepointAt(GameplayTag::Action_Ambient_TurnWheel,BucketPosition,1000.f,10.0f);
            AI.TryUseFreepointAt(GameplayTag::Action_Ambient_RecoverBucket,BucketPosition,1000.f);
        }
    }
}

UCLASS()
class UAIState_Smith : UGothicCharacterAIState 
{
    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        while(!bShouldExitState)
        {
            AI.TryUseFreepointAtPreferredLocation(GameplayTag::Action_Crafting_Forge,TimeLimitSeconds=40.0f);
            AI.TryUseFreepointAtPreferredLocation(GameplayTag::Action_Crafting_Anvil,TimeLimitSeconds=30.0f);
            AI.TryUseFreepointAtPreferredLocation(GameplayTag::Action_Crafting_Barrel,TimeLimitSeconds=30.0f);
            AI.TryUseFreepointAtPreferredLocation(GameplayTag::Action_Crafting_WhetStone,TimeLimitSeconds=40.0f);
            AI.TryUseFreepointAtPreferredLocation(GameplayTag::Action_Crafting_Workbench,TimeLimitSeconds=30.0f);

            int Random = Math::RandRange(0,100);
            
            if(Random >= 50)
            {
                AI.TryUseFreepointAtPreferredLocation(GameplayTag::Action_Interact_Sit_Chair,TimeLimitSeconds=40.0f);
            }
            else
            {
                AI.TryUseFreepointAtPreferredLocation(GameplayTag::Action_Ambient_SmokeWeed,TimeLimitSeconds=40.0f);
            }

            WaitSeconds(1.0f);
        }
    }
}

UCLASS()
class UAIState_Smith_Workbench : UAIState_RandomInteractions 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Crafting_Workbench));
}


/** Opens the door without traversing it. */
UCLASS()
class UAIState_OpenDoorOrGate : UGothicCharacterSimulateableAIState
{
    UAIState_OpenDoorOrGate(FName InDoorConfigName, FGameplayTag InOpenTag, TSubclassOf<UAIState_DailyRoutine> InRoutineAfterOpening, float InWaitTimeBeforeSwitchingRoutine = 0.f)
    {
        DoorConfigName = InDoorConfigName;
        OpenTag = InOpenTag;
        RoutineAfterOpening = InRoutineAfterOpening;
        WaitTimeBeforeSwitchingRoutine = InWaitTimeBeforeSwitchingRoutine;
    }

    UPROPERTY()
    FName DoorConfigName;

    UPROPERTY()
    TSubclassOf<UAIState_DailyRoutine> RoutineAfterOpening;
    
    UPROPERTY()
    FGameplayTag OpenTag;

    UPROPERTY()
    float WaitTimeBeforeSwitchingRoutine = 0.f;

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        if (!InteractiveObject::DoesDoorExist(DoorConfigName))
        {
            PrintError(f"{GetName()}: There is no door with this name: {DoorConfigName}, check 'DoorConfigName' in this dailyroutine");
            WaitSeconds(1.f);
            EndTaskAsFailure();
            return;
        }

        if (IsDoorOpen())
        {
            NPCState.ExchangeDailyRoutineToClass(RoutineAfterOpening);
            return;
        }

        while (!bShouldExitState && !IsDoorOpen())
        {
            if (IsInDailyRoutineSimulation())
            {
                WaitOneTick();
                continue;
            }

            EGenericTaskResult Result = AI.TryUseFreepointAtPreferredLocation(OpenTag).Result;

            if (Result == EGenericTaskResult::Failed)
            {
                PrintError(f"Could not use. Check {GetName()}: It needs an 'AtWaypoint' set, which is near the lever/door that should be used + a radius thats large enough");
                EndTaskAsFailure();
                return;
            }

            WaitOneTick();
        }

        if (RoutineAfterOpening.IsValid())
        {
            WaitSeconds(WaitTimeBeforeSwitchingRoutine);
            NPCState.ExchangeDailyRoutineToClass(RoutineAfterOpening);
        }
    }

    protected bool IsDoorOpen() const
    {
        return InteractiveObject::IsDoorOpen(DoorConfigName);
    }
}

UCLASS()
class UAIState_OpenOrcTownSecretDoor : UAIState_RandomInteractions_Human 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Door_OrcSecretDoor));
}

UCLASS()
class UAIState_Guard : UAIState_RandomInteractions_Human 
{
    default OwnedGameplayTags.AddTag(GameplayTag::State_CantBeDistracted);
    default bAllowBlockingPathWhileStationary = true;
    
    UAIState_Guard(FName FocusWaypoint)
    {
        IdleFocusSpotName = FocusWaypoint;
    }

    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_GuardPassage));
}

UCLASS()
class UAIState_Thorus_Guard : UAIState_RandomInteractions_Human 
{
    default OwnedGameplayTags.AddTag(GameplayTag::State_CantBeDistracted);

    UAIState_Thorus_Guard(FName FocusWaypoint)
    {
        IdleFocusSpotName = FocusWaypoint;
    }

    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_ThorusGuardPassage));
}

UCLASS()
class UAIState_RunToGuard : UAIState_Guard
{
    default InitialWalkspeed = EWalkSpeed::Running;
}

UCLASS()
class UAIState_RunToSit : UAIState_Sit 
{
    default InitialWalkspeed = EWalkSpeed::Running;
}

UCLASS()
class UAIState_RunToStandAround : UAIState_StandAround
{
    default InitialWalkspeed = EWalkSpeed::Running;
}

UCLASS()
class UAIState_RunToInspect : UAIState_Inspect
{
    default InitialWalkspeed = EWalkSpeed::Running;
}

UCLASS()
class UAIState_RunToSmallTalk : UAIState_Smalltalk
{
    default InitialWalkspeed = EWalkSpeed::Running;
}

UCLASS()
class UAIState_RunToHerbAlchemy : UAIState_HerbAlchemy
{
    default InitialWalkspeed = EWalkSpeed::Running;
}

UCLASS()
class UAIState_RunToReadBook : UAIState_ReadBook_Seated
{
    default InitialWalkspeed = EWalkSpeed::Running;
}

UCLASS()
class UAIState_Lurk : UAIState_RandomInteractions_Human 
{
    default OwnedGameplayTags.AddTag(GameplayTag::State_Quiet);

    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Lurk));
}

UCLASS()
class UAIState_GuardPatrol : UAIState_UseFreepoint 
{
    UAIState_GuardPatrol(float InTimeLimit)
    {
        TimeLimit = InTimeLimit;
    }

    UPROPERTY()
    float TimeLimit = 20.0f;

    default PossibleActions.AddTag(GameplayTag::Action_Ambient_GuardPassage);
    default FreepointUseTimeLimit = TimeLimit;
}

UCLASS()
class UAIState_GuardWatch : UAIState_RandomInteractions_Human 
{
    default bAllowBlockingPathWhileStationary = true;

    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_GuardWatch));
}

UCLASS()
class UAIState_RoastScavenger : UAIState_RandomInteractions_Human 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_RoastScavenger));
}

UCLASS()
class UAIState_ArenaGreetings : UAIState_RandomInteractions_Human 
{
    default bAllowBlockingPathWhileStationary = true;

    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_ArenaGreetings));
}

UCLASS()
class UAIState_WorkOnMaps : UAIState_RandomInteractions_Human 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_WorkOnMaps));
}

UCLASS()
class UAIState_LightTorch: UAIState_UseFreepoint 
{
    UAIState_LightTorch(TArray<FName> InactionPoints)
    {
        actionPoints = InactionPoints;
    }

    UPROPERTY()
    TArray<FName> actionPoints;

    UFUNCTION(BlueprintOverride, meta=(NoSuperCall))
    void DoTask()
    {
        while(!bShouldExitState)
        {
            for(int i = 0; i < actionPoints.Num();i++)
            {
                AI.TryUseFreepointAt(GameplayTag::Action_Ambient_LightTorch,actionPoints[i],1000.f);
            }
        }
    }
}

class UAIState_Wait : UAIState_RandomInteractions
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_StandAround, 0.80f, 30.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Interact_Sit_Ground, 0.10f, 30.0f));
}

UCLASS()
class UAIState_LookAround : UAIState_RandomInteractions 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_LookAround, InDurationSeconds = 10.0f));
}

// UCLASS()
// class UAIState_GetWoodAndCook :UGothicCharacterAIState
// {
//     UAIState_GetWoodAndCook(FName InWoodPosition)
//     {
//         WoodPosition = InWoodPosition;
//     }

//     UPROPERTY()
//     FName WoodPosition;

//     UFUNCTION(BlueprintOverride)
//     void DoTask()
//     {
//         AI.GotoPreferredLocation();

//         FVector PrevLocation = CharacterState.CharacterLocation;
//         AI.TryUseFreepointAt(GameplayTag::Action_Pick_ToCarry,WoodPosition,1000.f);
//         AI.TryUseFreepointAt(GameplayTag::Action_Carry_PutDown,PrevLocation,1000.f);
//         AI.TryUseFreepointAt(GameplayTag::Action_Ambient_LightFire,PrevLocation,1000.f, 20.0f);

//         while(!bShouldExitState)
//         {
//             AI.TryUseFreepointAt(GameplayTag::Action_Crafting_Cook,PrevLocation,1000.f);
//             WaitSeconds(5.0f);
//         }
//     }
// }

UCLASS()
class UAIState_RefillDrinkingTrough :UGothicCharacterAIState
{
    UAIState_RefillDrinkingTrough(FName InWaterPosition)
    {
        WaterPosition = InWaterPosition;
    }

    UPROPERTY()
    FName WaterPosition;

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        AI.GotoPreferredLocation();

        AI.TryUseFreepointAtPreferredLocation(GameplayTag::Action_Ambient_GetBucket);
        AI.TryUseFreepointAt(GameplayTag::Action_Ambient_FillBucket,WaterPosition);
        AI.TryUseFreepointAtPreferredLocation(GameplayTag::Action_Ambient_EmptyBucket);
        AI.TryUseFreepointAt(GameplayTag::Action_Ambient_FillBucket,WaterPosition);
        AI.TryUseFreepointAtPreferredLocation(GameplayTag::Action_Ambient_EmptyBucket);
        AI.TryUseFreepointAtPreferredLocation(GameplayTag::Action_Ambient_LeaveBucket);
        
    }
}

UCLASS()
class UAIState_GuardAndSmallTalk : UGothicCharacterSimulateableAIState 
{
    
    UAIState_GuardAndSmallTalk(FName InSmallTalkPosition)
    {
        SmallTalkPosition = InSmallTalkPosition;
    }

    UPROPERTY()
    FName SmallTalkPosition;

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        AI.GotoPreferredLocation();

        while(!bShouldExitState)
        {
            AI.TryUseFreepointAtPreferredLocation(GameplayTag::Action_Ambient_GuardPassage,TimeLimitSeconds=60.0f);
            AI.TryUseFreepointAt(GameplayTag::Action_Smalltalk,SmallTalkPosition,TimeLimitSeconds=60.0f);
        
            WaitSeconds(1.0f);
        }
    }
}

UCLASS()
class UAIState_RepairBuilding : UAIState_RandomInteractions 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_RepairBuilding, InDurationSeconds = 30.0f));
}

UCLASS()
class UAIState_RepairFloor : UAIState_RandomInteractions 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_RepairFloor, InDurationSeconds = 30.0f));
}

UCLASS()
class UAIState_Sleep : UGothicCharacterSimulateableAIState
{
    default OwnedGameplayTags.AddTag(GameplayTag::State_Quiet);

    FGameplayTag InteractionTag = GameplayTag::Action_Ambient_Sleep;

    AGothicCharacterState FoundOtherInMyBed = nullptr;

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        while (!bShouldExitState)
        {
            FInteractionSpotHandle UsableBed = InteractionSpots::FindClosestUsableSpotInRadiusWithTag(CharacterState, CharacterState.PreferredLocation.CenterPoint, CharacterState.PreferredLocation.RadiusFromCenter, InteractionTag);

            if (!UsableBed.IsSet())
            {
                FailedToUseBed();
                WaitSeconds(1);
                continue;
            }

            while (!bShouldExitState && !UsableBed.IsUsedBy(CharacterState))
            {
                auto Task = TaskInteractWithSpot(AI, UsableBed, InteractionTag, -1.0f);

                Task.bEndWhenEnteredState = true;
                
                if (!FAbilityTaskExecutor(Task).WasSuccessful())
                {
                    FailedToUseBed();
                    WaitSeconds(1);
                    continue;
                }

                FoundOtherInMyBed = nullptr;

                WaitOneTick();
            }

            while (!bShouldExitState && !IsInDailyRoutineSimulation() && IsValid(FoundOtherInMyBed))
            {
                AI.Say(GameplayTag::Sound_Voice_Reaction_Intruder_GetOutOfHere, TargetCharacter = FoundOtherInMyBed.Character);
                WaitOneTick();
            }

            WaitSeconds(1);
        }
    }

    void FailedToUseBed()
    {
        WakeUpPlayer();
    }

    void WakeUpPlayer()
    {
        FInteractionSpotHandle PotentialBedSpot = InteractionSpots::FindClosestSpotInRadiusWithTag(CharacterState.PreferredLocation.CenterPoint, CharacterState.PreferredLocation.RadiusFromCenter, InteractionTag);

        if (!PotentialBedSpot.IsSet())
            return;

        if (!PotentialBedSpot.IsUsedBy(AGothicPlayerState::MainPlayerState) && !PotentialBedSpot.IsClaimedBy(AGothicPlayerState::MainPlayerState))
            return;

        if (IsInDailyRoutineSimulation())
        {
            CharacterState.TeleportToSpot(PotentialBedSpot.SpotName);
        }
        else
        {
            if (!AI.GotoPosition(PotentialBedSpot.Location).WasSuccessful())
                return;
        }

        FoundOtherInMyBed = AGothicPlayerState::MainPlayerState;

        // If we are in simulation right now, this will end sleep and spawn our visuals
        FGameplayTagContainer WithTags;
        WithTags.AddTag(GameplayTag::Ability_Interact_Bed);
        
        FGameplayEventData Payload;
        Payload.EventTag = GameplayTag::Interrupt_Action_Bed;
        Payload.Instigator = CharacterState;
        AbilitySystem::SendGameplayEventToActor(AGothicPlayerState::MainPlayerState, Payload.EventTag, Payload);
    }

}

UCLASS()
class UAIState_SleepStanding : UAIState_RandomInteractions 
{
    default OwnedGameplayTags.AddTag(GameplayTag::State_Quiet);

    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Sleep_Standing));
}

UCLASS()
class UAIState_Sleep_Seated : UAIState_RandomInteractions 
{
    default OwnedGameplayTags.AddTag(GameplayTag::State_Quiet);

    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Sleep_Seated));
}

UCLASS()
class UAIState_Sleep_Table : UAIState_RandomInteractions 
{
    default OwnedGameplayTags.AddTag(GameplayTag::State_Quiet);

    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Sleep_Table));
}

UCLASS()
class UAIState_Listen : UAIState_RandomInteractions 
{
    default bAllowBlockingPathWhileStationary = true;

    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Listen));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Listen_Ground));
}

UCLASS()
class UAIState_Women_SitAround : UAIState_RandomInteractions 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Interact_Sit_Chair));
}

UCLASS()
class UAIState_Women_Sit_ReadBook : UAIState_RandomInteractions 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_ReadBook_Seated));
}


UCLASS()
class UAIState_Fan : UAIState_RandomInteractions 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Fan));
}

UCLASS()
class UAIState_BrushHair : UAIState_RandomInteractions 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_BrushHair));
}

UCLASS()
class UAIState_Bath : UAIState_RandomInteractions 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Bath));
}

UCLASS()
class UAIState_SitPool : UAIState_RandomInteractions 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_SitPool));
}

UCLASS()
class UAIState_HoldTray : UAIState_RandomInteractions 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_HoldTray));
}

UCLASS()
class UAIState_LightOnCandles : UAIState_RandomInteractions 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_LightOnCandle));
}

UCLASS()
class UAIState_LightOffCandles : UAIState_RandomInteractions 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_LightOffCandle));
}

UCLASS()
class UAIState_PotionAlchemy : UAIState_RandomInteractions 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_PotionAlchemy));
}

UCLASS()
class UAIState_Inscription : UAIState_RandomInteractions 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Crafting_Inscription));
}

UCLASS()
class UAIState_RepairBow : UAIState_RandomInteractions 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_RepairBow));
}

UCLASS()
class UAIState_PotionAlchemyAndSmoke : UGothicCharacterSimulateableAIState 
{
    UAIState_PotionAlchemyAndSmoke(FName InSmokePosition)
    {
        SmokePosition = InSmokePosition;
    }

    UPROPERTY()
    FName SmokePosition;

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        while(!bShouldExitState)
        {
            AI.TryUseFreepointAtPreferredLocation(GameplayTag::Action_Ambient_PotionAlchemy,TimeLimitSeconds=60.0f);
            AI.TryUseFreepointAt(GameplayTag::Action_Ambient_SmokeWeed,SmokePosition,TimeLimitSeconds=60.0f);
        
            WaitSeconds(1.0f);
        }
    }
}

UCLASS()
class UAIState_HerbAlchemy : UAIState_RandomInteractions 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_HerbAlchemy));
}

UCLASS()
class UAIState_PlayTune : UAIState_RandomInteractions 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_PlayTune));
}

UCLASS()
class UAIState_PlayDarts : UAIState_RandomInteractions 
{
    default bAllowBlockingPathWhileStationary = true;

    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_PlayDarts));
}

UCLASS()
class UAIState_PlayKnife : UAIState_RandomInteractions 
{
    default bAllowBlockingPathWhileStationary = false;

    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_PlayKnife));
}

UCLASS()
class UAIState_PlayStone : UAIState_RandomInteractions 
{
    default bAllowBlockingPathWhileStationary = false;

    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_PlayStone));
}

UCLASS()
class UAIState_Sit_PlayStone : UAIState_RandomInteractions 
{
    default bAllowBlockingPathWhileStationary = false;

    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_PlayStone_Seated));
}

UCLASS()
class UAIState_CountOre : UAIState_RandomInteractions 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_CountOre));
}

UCLASS()
class UAIState_Trader_CountOre : UAIState_RandomInteractions 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_CountOre, 0.25f, 40.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Drink, 0.15f, 15.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Eat, 0.15f, 25.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_StandAround, 0.05f, 60.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_LeanWall, 0.25f, 25.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_SmokeWeed, 0.25f, 25.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Pee, 0.1f, 15.0f));
}

UCLASS()
class UAIState_CountOre_Seated : UAIState_RandomInteractions 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_CountOreSeated));
}

UCLASS()
class UAIState_Trader_Seated : UAIState_RandomInteractions 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_CountOreSeated, 0.80f, 50.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Drink_Seated, 0.20f, 20.0f));
}

UCLASS()
class UAIState_TuneInstrument : UAIState_RandomInteractions 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_TuneInstrument));
}

UCLASS()
class UAIState_Preach : UAIState_RandomInteractions 
{
    default bAllowBlockingPathWhileStationary = true;

    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Preach));
}

UCLASS()
class UAIState_WashSelf : UAIState_RandomInteractions 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_WashSelf));
}



UCLASS()
class UAIState_ReadBook : UAIState_RandomInteractions 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_ReadBook));
}

UCLASS()
class UAIState_ReadBook_Lectern : UAIState_RandomInteractions 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_ReadBook_Lectern));
}

UCLASS()
class UAIState_ReadBook_Shelf : UAIState_RandomInteractions 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_ReadBook_Shell));
}

UCLASS()
class UAIState_ReadBook_Seated : UAIState_RandomInteractions 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_ReadBook_Seated));
}

UCLASS()
class UAIState_PickOre : UAIState_RandomInteractions 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_PickOre));
}

UCLASS()
class UAIState_PickOre_Ground : UAIState_RandomInteractions 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_PickOre_Ground));
}

class UAIState_BlowFire : UAIState_RandomInteractions 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_BlowFire));
}

class UAIState_LightFire : UAIState_RandomInteractions 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_LightFire));
}

class UAIState_PickRice : UAIState_RandomInteractions 
{
    default bAllowBlockingPathWhileStationary = true;

    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_PickRice, 0.35f, 25.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_RiceClean, 0.30f, 25.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_SowRice, 0.35f, 25.0f)); 
}

class UAIState_WashSelf_and_Work : UGothicCharacterAIState
{
    UAIState_WashSelf_and_Work(FName InWashPosition)
    {
        WashPosition = InWashPosition;
    }

    UPROPERTY()
    FName WashPosition;

    
    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        AI.TryUseFreepointAt(GameplayTag::Action_Ambient_WashSelf_High,WashPosition,TimeLimitSeconds= 13.0f);
        
        while(!bShouldExitState)
        {
            AI.TryUseFreepointAtPreferredLocation(GameplayTag::Action_Ambient_PickRice,TimeLimitSeconds= 60.0f);
        
            WaitSeconds(1.0f);
        }
    }
}

class UAIState_SowRice : UAIState_RandomInteractions 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_SowRice));
}

class UAIState_CleanFloor : UAIState_RandomInteractions 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Clean));
}

class UAIState_GrindingMill_Bucket : UAIState_RandomInteractions 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_TossOre));
}

class UAIState_Teach_Train : UAIState_RandomInteractions 
{
    default bAllowBlockingPathWhileStationary = true;

    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_TeachTrain));
}

class UAIState_PracticeBow : UAIState_RandomInteractions 
{
    default bAllowBlockingPathWhileStationary = true;
    default OverrideBlockingPathPersonalSpaceRadius.Set(800.0f);
    default BlockedPathWaitHoldMontageSection = n"Loop01";

    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_PracticeBow));
}

class UAIState_PracticeSword_1H : UAIState_RandomInteractions 
{
    default bAllowBlockingPathWhileStationary = true;
    default OverrideBlockingPathPersonalSpaceRadius.Set(500.0f);
    default BlockedPathWaitHoldMontageSection = n"Loop01";

    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Practice1HSword));
}

class UAIState_PracticeSword_2H : UAIState_RandomInteractions 
{
    default bAllowBlockingPathWhileStationary = true;
    default OverrideBlockingPathPersonalSpaceRadius.Set(500.0f);
    default BlockedPathWaitHoldMontageSection = n"Loop";

    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Practice2HSword));
}

class UAIState_PracticeMace_1H : UAIState_RandomInteractions 
{
    default bAllowBlockingPathWhileStationary = true;
    default OverrideBlockingPathPersonalSpaceRadius.Set(500.0f);
    default BlockedPathWaitHoldMontageSection = n"Loop01";

    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Practice1HMace));
}

class UAIState_PracticeMace_1H_NoDummy : UAIState_RandomInteractions 
{
    default bAllowBlockingPathWhileStationary = true;
    default OverrideBlockingPathPersonalSpaceRadius.Set(500.0f);
    default BlockedPathWaitHoldMontageSection = n"Loop01";

    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Practice1HMaceNoDummy));
}

class UAIState_Pee : UAIState_RandomInteractions 
{
    default bAllowBlockingPathWhileStationary = true;

    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Pee));
}

class UAIState_ServeFoodAndEat : UAIState_RandomInteractions
{
        default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_ServeFood));
        default Interactions.Last().Priority = 2;
        default Interactions.Last().RequireTimeSinceAction.Add(GameplayTag::Action_Ambient_ServeFood, FInGameTime::FromHours(20));
        
        default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_WaitLine, InDurationSeconds = 2.0));
        default Interactions.Last().Priority = 1;
        default Interactions.Last().RequireTimeSinceAction.Add(GameplayTag::Action_Ambient_ServeFood, FInGameTime::FromHours(10));

        default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Eat_Bowl));

        //default AdditionalLocationAndRadius.Add(n"FP_NC_WASHSELF_03", 800.0f);
}

// UCLASS()
// class UAIState_ServeFoodAndEat : UGothicCharacterSimulateableAIState 
// {
//     UAIState_ServeFoodAndEat(FName InEatPosition)
//     {
//         EatPosition = InEatPosition;
//     }

//     UPROPERTY()
//     FName EatPosition;
//     EGenericTaskResult Result;
//     bool alreadyserved; 

//     UFUNCTION(BlueprintOverride)
//     void DoTask()
//     {
//         Result = AI.TryUseFreepointAtPreferredLocation(GameplayTag::Action_Ambient_ServeFood).Result;
//         if(Result == EGenericTaskResult::Success)
//         {
//             alreadyserved = true;
//         }

//         while(!bShouldExitState)
//         {
//             if(!alreadyserved)
//             {
//                 Result = AI.TryUseFreepointAtPreferredLocation(GameplayTag::Action_Ambient_ServeFood).Result;
//                 if(Result != EGenericTaskResult::Success)
//                 {
//                     AI.TryUseFreepointAtPreferredLocation(GameplayTag::Action_Ambient_WaitLine,TimeLimitSeconds = 5.f);
//                 }
//                 else
//                 {
//                     alreadyserved = true;
//                 }
//             }
//             else
//             {
//                 AI.TryUseFreepointAt(GameplayTag::Action_Ambient_Eat,InteractionSpots::GetLocationByName(EatPosition),1000.f);
//             }
        
//             WaitSeconds(1.0f);
//         }
//     }
// }

class UAIState_Rest : UAIState_RandomInteractions
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Interact_Sit, 0.70f, 40.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Drink, 0.20f, 30.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_SmokeWeed, 0.18f, 30.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Pee, 0.02f, 24.0f));
}

class UAIState_Rest_Woman : UAIState_RandomInteractions
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Interact_Sit, 0.70f, 40.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Drink, 0.20f, 30.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_SmokeWeed, 0.18f, 30.0f));
}

class UAIState_Meditate : UAIState_RandomInteractions 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Meditate));
}

class UAIState_MeditateYberion : UAIState_RandomInteractions 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_MeditateYberion));
    default OwnedGameplayTags.AddTag(GameplayTag::Character_AllowFarInteractions);
}

class UAIState_Pray : UAIState_RandomInteractions 
{
    default bAllowBlockingPathWhileStationary = true;

    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Pray));
}

class UAIState_Stand : UAIState_RandomInteractions 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_StandAround));
}

class UAIState_SitCampfire : UAIState_RandomInteractions 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_SmokeWeed_Seated, 0.90f, 40.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Eat_Seated, 0.90f, 40.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Drink_Seated, 0.90f, 40.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_PlayStone_Seated, 0.1f, 40.0f));
}

class UAIState_Campfire : UAIState_RandomInteractions 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Campfire));
}

class UAIState_Fake_Fear : UAIState_RandomInteractions 
{
    default InitialWalkspeed = EWalkSpeed::Running;
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Fear));
}

class UAIState_Sweep : UAIState_RandomInteractions 
{
    UAIState_Sweep(float InDurationSeconds)
    {
        DurationSeconds = InDurationSeconds;
    }

    UPROPERTY()
    float DurationSeconds = 30.0f;

    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Sweep, DurationSeconds));
}

class UAIState_Inspect : UAIState_RandomInteractions 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Inspect,InDurationSeconds = 25.0f));
}

class UAIState_Inspect_Front : UAIState_RandomInteractions 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Inspect_Front,InDurationSeconds = 25.0f));
}

class UAIState_Inspect_Up : UAIState_RandomInteractions 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Inspect_Up,InDurationSeconds = 25.0f));
}

class UAIState_Inspect_Down : UAIState_RandomInteractions 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Inspect_Down,InDurationSeconds = 25.0f));
}

class UAIState_CheckBody : UAIState_RandomInteractions 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_CheckBody,InDurationSeconds = 25.0f));
}

class UAIState_Wounded : UAIState_RandomInteractions 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Wounded,InDurationSeconds = 25.0f));
}

class UAIState_Exhausted : UAIState_RandomInteractions 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Exhausted,InDurationSeconds = 25.0f));
}

class UAIState_Drained : UAIState_RandomInteractions 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Drained));
}

class UAIState_Eat : UAIState_RandomInteractions 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Eat));
}

class UAIState_Eat_Seated : UAIState_RandomInteractions 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Eat_Seated));
}

class UAIState_Eat_Ground : UAIState_RandomInteractions 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Eat_Ground));
}

class UAIState_Drink : UAIState_RandomInteractions 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Drink));
}

class UAIState_Drink_Ground : UAIState_RandomInteractions 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Drink_Ground));
}

class UAIState_Disturb : UAIState_RandomInteractions 
{
    default OwnedGameplayTags.AddTag(GameplayTag::State_Drugs_Forced_Alcohol_High);
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Disturb));
}

class UAIState_CheckRain : UAIState_RandomInteractions 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_CheckRain));
}

class UAIState_RainStart : UAIState_RandomInteractions 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_RainStart));
}

class UAIState_ArenaSpectator : UAIState_RandomInteractions 
{
    default bAllowBlockingPathWhileStationary = true;

    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_ArenaSpectator));
}

class UAIState_ArenaSpectator_Seated : UAIState_RandomInteractions 
{
    default bAllowBlockingPathWhileStationary = false;

    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_ArenaSpectator_Seated));
}

class UAIState_Leatherworking : UAIState_RandomInteractions 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Leatherworking));
}

class UAIState_WaitSmalltalk : UAIState_RandomInteractions
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_WaitSmalltalk, 0.60f, 60.0f));
}

class UAIState_StandAround : UAIState_RandomInteractions
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Drink, 0.25f, 15.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Eat, 0.25f, 15.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_StandAround, 0.05f, 15.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_LeanWall, 0.25f, 30.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_SmokeWeed, 0.25f, 15.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Pee, 0.1f, 15.0f));
}

class UAIState_StandAround_Rayk : UAIState_StandAround
{
    default OwnedGameplayTags.AddTag(GameplayTag::State_Drugs_Forced_Alcohol_High);
}

class UAIState_SitAround : UAIState_RandomInteractions
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Drink_Seated, 0.25f, 15.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_PlayStone_Seated, 0.15f, 45.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_PlayKnife, 0.15f, 45.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_SmokeWeed_Seated, 0.25f, 30.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_CarveWood, 0.15f, 45.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_SharpWeapon, 0.1f, 45.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Interact_Sit_Ground, 0.25f, 20.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Interact_Sit_Chair, 0.05f, 10.0f));

    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Pee, 0.1f, 15.0f));
    default Interactions.Last().RequireTimeSinceAction.Add(GameplayTag::Action_Ambient_Pee, FInGameTime::FromHours(8));
}

class UAIState_SitAround_Woman : UAIState_RandomInteractions
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Drink_Seated, 0.25f, 15.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_SmokeWeed_Seated, 0.25f, 30.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Interact_Sit_Ground, 0.25f, 20.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Interact_Sit_Chair, 0.05f, 10.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Eat_Seated_Bowl, 0.15f, 30.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_ReadBook_Seated, 0.10f, 20.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_BrushHair, 0.20f, 20.0f));
}

class UAIState_SitAroundWhileRain : UAIState_SitAround
{
    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        bool shouldReactToRain = false;
        bool shouldRRun = false;


        if(Math::RandRange(0.0f,1.0f) < 0.70f)
        {
            shouldReactToRain = true;
        }

        if(Math::RandRange(0.0f,1.0f) < 0.90f)
        {
            shouldRRun = true;
         }

        while(!bShouldExitState)
        {
            if(shouldReactToRain && Self != nullptr && Self.IsInRain(2))
            {
                if(shouldRRun)
                {
                    SetWalkSpeed(EWalkSpeed::Running);
                }
                
                // Don't try to activate again if already CoveringHead
                if(!Self.HasGameplayTag(GameplayTag::State_CoveringHead))
                {
                    FGameplayEventData Payload;
                    GothicGAS::AddRainCoverHeadData(Payload, 2);
                    GothicGAS::SendGameplayEvent(CharacterState, GameplayTag::Action_CoverInRain, Payload);
                }
            }

            WaitSeconds(0.5);
        }
    }
}

class UAIState_Sit : UAIState_RandomInteractions 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Interact_Sit));
}

class UAIState_SitThrone : UAIState_RandomInteractions 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Interact_Sit_Throne));

    default bAllowBlockingPathWhileStationary = false;

    default OwnedGameplayTags.AddTag(GameplayTag::Character_AllowFarInteractions);
}

class UAIState_Sit_Bed : UAIState_RandomInteractions 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Interact_Sit_Bed));
}

class UAIState_Stay : UAIState_RandomInteractions 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_StandAround));
}

class UAIState_Push : UAIState_RandomInteractions 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Push));
}

class UAIState_Smoke : UAIState_RandomInteractions 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_SmokeWeed));
}

class UAIState_Smoke_Seated : UAIState_RandomInteractions 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_SmokeWeed_Seated));
}
class UAIState_Smoke_Ground : UAIState_RandomInteractions 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_SmokeWeed_Ground));
}

class UAIState_CookCauldron : UAIState_RandomInteractions 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Cook_Cauldron));

    default OwnedGameplayTags.AddTag(GameplayTag::Character_AllowFarInteractions);
}

UCLASS()
class UAIState_Orc_SitOnFloor : UAIState_RandomInteractions 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Interact_Sit));
}

UCLASS()
class UAIState_Xardas_CheckNotes : UAIState_RandomInteractions 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_XardasCheckNotes));
}

UCLASS()
class UAIState_GrindingOven_TurnWheel : UAIState_RandomInteractions 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_TurnWheel));
}

UCLASS()
class UAIState_TestGotoWP : UGothicCharacterSimulateableAIState 
{
    default bSupportsSimulatedSteps = true;

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        while(!bShouldExitState)
        {
            AI.GotoPreferredLocation();

            WaitSeconds(1);
        }
    }
}

UCLASS()
class UAIState_TestRunToWP : UGothicCharacterAIState 
{
    default bSupportsSimulatedSteps = true;

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        while(!bShouldExitState)
        {
            SetWalkSpeed(EWalkSpeed::Running);
            AI.GotoPreferredLocation();

            WaitSeconds(1);
        }
    }
}

// DEPRECATED : this does not set PreferredLocation - some things will be broken. See UAIState_RunToSit as an example to replace this. TODO delete
UCLASS()
class UAIState_ActionRunning : UGothicCharacterAIState 
{
    UAIState_ActionRunning(FGameplayTag InAction, FName InPosition)
    {
        Action = InAction;
        Position = InPosition;
    }

    UPROPERTY()
    FName Position;
    UPROPERTY()
    FGameplayTag Action;

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        SetWalkSpeed(EWalkSpeed::Running);
        while(!bShouldExitState)
        {
            AI.TryUseFreepointAt(Action,Position,TimeLimitSeconds=60.0f);
            WaitSeconds(1.0f);
        }
    }
}

UCLASS()
class UAIState_StayNeutral : UAIState_Debug_Any 
{
    
}

UCLASS()
class UAIState_Preach_YBerion : UAIState_Debug_Any 
{
    
}

UCLASS()
class UAIState_Drained_YBerion : UAIState_Debug_Any 
{
    
}

UCLASS()
class UAIState_WaitForRescue : UAIState_Debug_Any 
{
    
}

UCLASS()
class UAIState_HostileGuard : UAIState_Debug_Any 
{
    
}

UCLASS()
class UAIState_AlignGuard : UAIState_Debug_Any 
{
    
}

UCLASS()
class UAIState_Intercept : UAIState_Debug_Any 
{
     
}

UCLASS()
class UAIState_InterceptMadCorKalom : UAIState_Debug_Any 
{
    
}

UCLASS()
class UAIState_OTMeditate : UAIState_Debug_Any 
{
    
}

UCLASS()
class UAIState_Sleeper : UAIState_Debug_Any 
{
    
}

UCLASS()
class UAIState_ReadBook_Xardas : UAIState_Debug_Any 
{
    
}

UCLASS()
class UAIState_Orc_Stomper : UAIState_Debug_Any 
{
    
}

UCLASS()
class UAIState_Orc_Stonemill : UAIState_Debug_Any 
{
    
}

UCLASS()
class UAIState_CookForMe : UAIState_Debug_Any 
{
    
}

UCLASS()
class UAIState_MCHunting : UAIState_Debug_Any 
{
    
}

UCLASS()
class UAIState_WalkAround : UAIState_Debug_Any 
{
    
}

UCLASS()
class UAIState_PracticeMagic : UAIState_RandomInteractions 
{
    default bAllowBlockingPathWhileStationary = true;
    
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_PracticeMagic));
}

UCLASS()
class UAIState_BodyGuard : UAIState_Debug_Any 
{
    
}

UCLASS()
class UAIState_SharpWeapon : UAIState_RandomInteractions_Human 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_SharpWeapon));
} 

UCLASS()
class UAIState_CarveWood : UAIState_RandomInteractions_Human 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_CarveWood));
} 

UCLASS()
class UAIState_Smith_Anvil : UAIState_RandomInteractions_Human 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Crafting_Anvil));
}

UCLASS()
class UAIState_Smith_Anvil_Spawn : UAIState_RandomInteractions_Human 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Crafting_Anvil_Spawn));
}

UCLASS()
class UAIState_Smith_Cool : UAIState_Debug_Any 
{
    
}

UCLASS()
class UAIState_Smith_Sharp : UAIState_RandomInteractions_Human 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Crafting_WhetStone));
}    

UCLASS()
class UAIState_Smith_Fire : UAIState_RandomInteractions_Human 
{
   default Interactions.Add(FInteraction(GameplayTag::Action_Crafting_Forge));
}    

UCLASS()
class UAIState_Charlotte_Dance : UAIState_Debug_Any 
{
    
}

UCLASS()
class UAIState_Dance : UAIState_RandomInteractions_Human 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Dance));
}

UCLASS()
class UAIState_WomanDance : UAIState_RandomInteractions_Human 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_WomanDance));
}

UCLASS()
class UAIState_Clap : UAIState_RandomInteractions_Human 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Clap));
}

UCLASS()
class UAIState_Clap_Seated : UAIState_RandomInteractions_Human 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Clap_Seated));
}

UCLASS()
class UAIState_WE_LuteEvent : UAIState_RandomInteractions_Human 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Dance));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Dance_Seated));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Clap));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Clap_Seated));
}

UCLASS()
class UAIState_WE_LuteEvent_Dance : UAIState_RandomInteractions_Human 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Dance));
}

UCLASS()
class UAIState_WE_LuteEvent_Clap : UAIState_RandomInteractions_Human 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Clap));
}



UCLASS()
class UAIState_Firespit : UAIState_RandomInteractions_Human 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Firespit));
}

UCLASS()
class UAIState_WatchInExtremo : UAIState_RandomInteractions_Human 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_InExtremoConcert_RaiseFist, 0.45f, 20.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_InExtremoConcert_Stomp, 0.35f, 15.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_InExtremoConcert_Sway, 0.25f, 15.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_InExtremoConcert_HeadBang, 0.15f, 9.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_InExtremoConcert_AirGuitar, 0.15f, 8.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_InExtremoConcert_RapidHandRaise, 0.3f, 15.0f));
}

UCLASS()
class UAIState_WatchInExtremo_Intense : UAIState_RandomInteractions_Human 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_InExtremoConcert_FistPump, 0.45f, 20.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_InExtremoConcert_HairWhip, 0.35f, 15.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_InExtremoConcert_Pogo, 0.1f, 8.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_InExtremoConcert_AirGuitar02, 0.1f, 8.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_InExtremoConcert_AirKick, 0.1f, 8.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_InExtremoConcert_HeadBangIntense, 0.15f, 10.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_InExtremoConcert_RapidHandRaise, 0.3f, 15.0f));
}

UCLASS()
class UAIState_WatchInExtremo_Chill : UAIState_RandomInteractions_Human 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Drink_Ground, 0.25f, 15.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Eat_Ground, 0.25f, 15.0f));
}

UCLASS()
class UAIState_WaitInextremo : UAIState_RandomInteractions_Human 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_ArenaSpectator, 0.35f, 20.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_InExtremoConcert_RapidHandRaise, 0.5f, 20.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Listen, 0.25f, 20.0f));
    
}

UCLASS()
class UAIState_Ebr_HangAround : UAIState_Debug_Any 
{
    
}

UCLASS()
class UAIState_TestHangAround : UAIState_Debug_Any 
{
    
}

UCLASS()
class UAIState_Speech : UAIState_Debug_Any 
{
    
}

UCLASS()
class UAIState_Position : UAIState_Debug_Any 
{
    
}

UCLASS()
class UAIState_GuidePC : UAIState_Debug_Any 
{
    
}

UCLASS()
class UAIState_FollowPC : UAIState_Debug_Any 
{
    
}

UCLASS()
class UAIState_TestBully : UAIState_Debug_Any 
{
    
}

UCLASS()
class UAIState_Orepile : UAIState_Debug_Any 
{
    
}

UCLASS()
class UAIState_Walk : UAIState_Debug_Any 
{
    
}

UCLASS()
class UAIState_MineBellows : UAIState_Debug_Any 
{
   
}

UCLASS()
class UAIState_SittingDuck : UAIState_Debug_Any 
{
    
}

UCLASS()
class UAIState_GuardItems : UAIState_Debug_Any 
{
    
}

UCLASS()
class UAIState_HerbShop : UAIState_Debug_Any 
{
    
}

UCLASS()
class UAIState_GuardWheelOpen : UAIState_Debug_Any 
{
    
}

UCLASS()
class UAIState_GuardWheelClosed : UAIState_Debug_Any 
{
    
}

// This is an import of the tasks from the original game. Until they are
// implemented, they are listed here as stubs.


UCLASS()
class UAIState_Debug_Any : UAIState_Debug_Any___
{
    default bSupportsSimulatedSteps = true;
    // FGameplayTagContainer PossibleActions;
}

UCLASS()
class UAIState_Debug_Any___ : UAIState_UseFreepoint
{
    default PossibleActions.AddTag(GameplayTag::Action_Ambient_Wander);
    default PossibleActions.AddTag(GameplayTag::Action_Ambient_ArenaSpectator);
    default PossibleActions.AddTag(GameplayTag::Action_Ambient_Bath);
    default PossibleActions.AddTag(GameplayTag::Action_Ambient_Chest);
    default PossibleActions.AddTag(GameplayTag::Action_Ambient_Chest);
    default PossibleActions.AddTag(GameplayTag::Action_Crafting_Cook);
    default PossibleActions.AddTag(GameplayTag::Action_Ambient_CutWood);
    default PossibleActions.AddTag(GameplayTag::Action_Ambient_Dance);
    default PossibleActions.AddTag(GameplayTag::Action_Ambient_Dig);
    default PossibleActions.AddTag(GameplayTag::Action_Ambient_DontUse);
    default PossibleActions.AddTag(GameplayTag::Action_Ambient_Drink);
    default PossibleActions.AddTag(GameplayTag::Action_Ambient_Eat);
    default PossibleActions.AddTag(GameplayTag::Action_Ambient_Fan);
    default PossibleActions.AddTag(GameplayTag::Action_Ambient_FillCauldron);
    default PossibleActions.AddTag(GameplayTag::Action_Ambient_GetFood);
    default PossibleActions.AddTag(GameplayTag::Action_Ambient_GetWood);
    default PossibleActions.AddTag(GameplayTag::Action_Ambient_GuardPassage);
    default PossibleActions.AddTag(GameplayTag::Action_Ambient_Howl);
    default PossibleActions.AddTag(GameplayTag::Action_Ambient_Inspect);
    default PossibleActions.AddTag(GameplayTag::Action_Ambient_LayDown);
    default PossibleActions.AddTag(GameplayTag::Action_Ambient_LeaveMeat);
    default PossibleActions.AddTag(GameplayTag::Action_Ambient_LeaveOreBag);
    default PossibleActions.AddTag(GameplayTag::Action_Ambient_LeaveWood);
    default PossibleActions.AddTag(GameplayTag::Action_Ambient_LightFire);
    default PossibleActions.AddTag(GameplayTag::Action_Ambient_Listen);
    default PossibleActions.AddTag(GameplayTag::Action_Ambient_LookAround);
    default PossibleActions.AddTag(GameplayTag::Action_Ambient_Pee);
    default PossibleActions.AddTag(GameplayTag::Action_Ambient_Pick);
    default PossibleActions.AddTag(GameplayTag::Action_Ambient_PlayTune);
    default PossibleActions.AddTag(GameplayTag::Action_Ambient_PotionAlchemy);
    default PossibleActions.AddTag(GameplayTag::Action_Ambient_PracticeBow);
    default PossibleActions.AddTag(GameplayTag::Action_Ambient_PracticeMagic);
    default PossibleActions.AddTag(GameplayTag::Action_Ambient_Practice1HSword);
    default PossibleActions.AddTag(GameplayTag::Action_Ambient_Practice2HSword);
    default PossibleActions.AddTag(GameplayTag::Action_Ambient_ReadBook);
    default PossibleActions.AddTag(GameplayTag::Action_Ambient_ReceiveFood);
    default PossibleActions.AddTag(GameplayTag::Action_Ambient_Recruit);
    default PossibleActions.AddTag(GameplayTag::Action_Ambient_RepairBow);
    default PossibleActions.AddTag(GameplayTag::Action_Ambient_RepairBuilding);
    default PossibleActions.AddTag(GameplayTag::Action_Ambient_RoastScavenger);
    default PossibleActions.AddTag(GameplayTag::Action_Ambient_ScratchEar);
    default PossibleActions.AddTag(GameplayTag::Action_Ambient_Shake);
    default PossibleActions.AddTag(GameplayTag::Action_Ambient_SharpWeapon);
    default PossibleActions.AddTag(GameplayTag::Action_Interact_Sit_Chair);
    default PossibleActions.AddTag(GameplayTag::Action_Ambient_Sleep);
    default PossibleActions.AddTag(GameplayTag::Action_Smalltalk);
    default PossibleActions.AddTag(GameplayTag::Action_Crafting_Anvil);
    default PossibleActions.AddTag(GameplayTag::Action_Crafting_Forge);
    default PossibleActions.AddTag(GameplayTag::Action_Crafting_WhetStone);
    default PossibleActions.AddTag(GameplayTag::Action_Crafting_Barrel);
    default PossibleActions.AddTag(GameplayTag::Action_Ambient_SmokeWeed);
    default PossibleActions.AddTag(GameplayTag::Action_Ambient_StandAround);
    default PossibleActions.AddTag(GameplayTag::Action_Ambient_Sweep);
    default PossibleActions.AddTag(GameplayTag::Action_Ambient_TakeCauldron);
    default PossibleActions.AddTag(GameplayTag::Action_Ambient_TakeMeat);
    default PossibleActions.AddTag(GameplayTag::Action_Ambient_TakeOreBag);
    default PossibleActions.AddTag(GameplayTag::Action_Ambient_TuneInstrument);
    default PossibleActions.AddTag(GameplayTag::Action_Ambient_WashSelf);
    default PossibleActions.AddTag(GameplayTag::Action_Ambient_WatchUnderBridge);
    default PossibleActions.AddTag(GameplayTag::Action_Ambient_Roar);

}