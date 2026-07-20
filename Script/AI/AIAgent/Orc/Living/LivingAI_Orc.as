//PARENT CLASS
UCLASS()
class UAIState_RandomInteractions_Orc : UAIState_RandomInteractions
{
    default BackupInteractions.Add(FInteraction(GameplayTag::Action_Ambient_StandAround,InDurationSeconds = 30.0f));
    default BackupInteractions.Add(FInteraction(GameplayTag::Action_Interact_Sit_Chair));
    default BackupInteractions.Add(FInteraction(GameplayTag::Action_Ambient_Eat));
    default BackupInteractions.Add(FInteraction(GameplayTag::Action_Ambient_Drink));
}

class UDailyRoutine_Orc_Base : UAIState_DailyRoutine_Orc
{
    UPROPERTY()
    float WaypointRadius = 2000.0f;

    UDailyRoutine_Orc_Base(float InWaypointRadius)
    {
        WaypointRadius = InWaypointRadius;
    }

    default Schedule(0, 0, UAIState_Orc_Sleep(), Location::Spawnpoint, WaypointRadius);
    default Schedule(6, 0, UAIState_Orc_Living(), Location::Spawnpoint, WaypointRadius);
}

class UDailyRoutine_Orc_Peasant : UAIState_DailyRoutine_Orc
{
    UPROPERTY()
    float WaypointRadius = 2000.0f;

    UPROPERTY()
    UCharacterAIState NightState;

    UPROPERTY()
    UCharacterAIState DayState;

    UDailyRoutine_Orc_Peasant()
    {
        WaypointRadius = 2000.0f;
        NightState = UAIState_Orc_Living();
        DayState = UAIState_Orc_Living();
    }

    UDailyRoutine_Orc_Peasant(float InWaypointRadius, UCharacterAIState InNightState = UAIState_Orc_Living(), UCharacterAIState InDayState = UAIState_Orc_Living())
    {
        WaypointRadius = InWaypointRadius;
        NightState = InNightState;
        DayState = InDayState;

    }

    default Schedule(0, 0, UAIState_Orc_Sleep(), Location::Spawnpoint, WaypointRadius);
    default Schedule(6, 0, DayState, Location::Spawnpoint, WaypointRadius);
    default Schedule(19, 0, NightState, Location::Spawnpoint, WaypointRadius);
}

class UDailyRoutine_Orc_Watch : UAIState_DailyRoutine_Orc
{
    UPROPERTY()
    float WaypointRadius = 3000.0f;
    
    UDailyRoutine_Orc_Watch(float InWaypointRadius)
    {
        WaypointRadius = InWaypointRadius;
    }

    default Schedule(0, 0, UAIState_Orc_Watch(), Location::Spawnpoint, WaypointRadius);
}

class UDailyRoutine_Orc_Watch_Patrol : UAIState_DailyRoutine_Orc
{
    UPROPERTY()
    FGameplayTag Path;

    UDailyRoutine_Orc_Watch_Patrol(FGameplayTag InPath)
    {
        Path = InPath;
    }

        default Schedule(20, 0, UAIState_Orc_Watch_Patrolling_Route(Path), Location::Spawnpoint);
}

class UDailyRoutine_Orc_Guard : UAIState_DailyRoutine_Orc
{
    default Schedule(0, 0, UAIState_Orc_GuardPassage(), Location::Spawnpoint, 400);
}

// class UDailyRoutine_Orc_Blacksmith : UAIState_DailyRoutine_Orc
// {
//     default Schedule(0, 0, UAIState_Orc_Blacksmith(), Location::Spawnpoint, 1000);
// }

class UDailyRoutine_Orc_PotionAlchemy : UAIState_DailyRoutine_Orc
{
    default Schedule(0, 0, UAIState_Orc_PotionAlchemy(), Location::Spawnpoint, 1000);
}

class UDailyRoutine_Orc_Trance : UAIState_DailyRoutine_Orc
{
    default Schedule(0, 0, UAIState_Orc_Trance(), Location::Spawnpoint, 1000);
}

class UDailyRoutine_Orc_Trance_Miniboss : UAIState_DailyRoutine_Orc
{
    UFUNCTION(BlueprintOverride)
    void Activate()
    {
        RestoreAttributes();
    }
    default Schedule(0, 0, UAIState_Orc_Trance(), Location::Spawnpoint, 1000);
}

class UDailyRoutine_Orc_Sleep : UAIState_DailyRoutine_Orc
{
    UPROPERTY()
    float WaypointRadius = 2000.0f;

    UDailyRoutine_Orc_Sleep(float InWaypointRadius)
    {
        WaypointRadius = InWaypointRadius;
    }

    default Schedule(0, 0, UAIState_Orc_Sleep(), Location::Spawnpoint, WaypointRadius);
}

class UDailyRoutine_Orc_Pray : UAIState_DailyRoutine_Orc
{
    UPROPERTY()
    float WaypointRadius = 1000.0f;
    
    UDailyRoutine_Orc_Pray(float InWaypointRadius)
    {
        WaypointRadius = InWaypointRadius;
    }

    default Schedule(0, 0, UAIState_Orc_Pray(), Location::Spawnpoint, WaypointRadius);
}

class UDailyRoutine_Undead_Orc_SleeperTemple : UAIState_DailyRoutine_Orc
{
    float radius = 700.0f;

    UDailyRoutine_Undead_Orc_SleeperTemple(float Inradius)
    {
        radius = Inradius;
    }

    default Schedule(7, 0, UAIState_Orc_StandAround(), Location::Spawnpoint, radius);
}

class UDailyRoutine_Orc_SitGround : UAIState_DailyRoutine_Orc
{
    default Schedule(0,0,UAIState_Orc_SitOnGround(), Location::Spawnpoint, 1000);
}

class UDailyRoutine_Orc_Feeding : UAIState_DailyRoutine_Orc
{
    default Schedule(0,0,UAIState_Orc_Feeding(), Location::Spawnpoint, 1000);
}

class UDailyRoutine_Orc_Cheering : UAIState_DailyRoutine_Orc
{
    default Schedule(0,0,UAIState_Orc_Cheering(), Location::Spawnpoint, 1000);
}


class UDailyRoutine_Orc_Drink : UAIState_DailyRoutine_Orc
{
    default Schedule(0,0,UAIState_Orc_Drink(), Location::Spawnpoint, 1000);
}

class UDailyRoutine_Orc_DrinkGround : UAIState_DailyRoutine_Orc
{
    default Schedule(0,0,UAIState_Orc_DrinkOnGround(), Location::Spawnpoint, 1000);
}

class UDailyRoutine_Orc_SmashFood : UAIState_DailyRoutine_Orc
{
    default Schedule(0,0,UAIState_Orc_SmashFood(), Location::Spawnpoint, 1000);
}

class UDailyRoutine_Orc_SmashFood_Standing : UAIState_DailyRoutine_Orc
{
    default Schedule(0,0,UAIState_Orc_SmashFood_Standing(), Location::Spawnpoint, 1000);
}

class UDailyRoutine_Orc_LeatherWorking : UAIState_DailyRoutine_Orc
{
    default Schedule(0,0,UAIState_Orc_LeatherWorking(), Location::Spawnpoint, 1000);
}
class UDailyRoutine_Orc_WarmHands : UAIState_DailyRoutine_Orc
{
    default Schedule(0,0,UAIState_Orc_WarmHands(), Location::Spawnpoint, 1000);
}

class UDailyRoutine_Orc_Eat : UAIState_DailyRoutine_Orc
{
    default Schedule(0,0,UAIState_Orc_Eat(), Location::Spawnpoint, 1000);
}

// class UDailyRoutine_Orc_EatBowl : UAIState_DailyRoutine_Orc
// {
//     default Schedule(0,0,UAIState_Orc_EatBowl(), Location::Spawnpoint, 1000);
// }

class UDailyRoutine_Orc_EatGround : UAIState_DailyRoutine_Orc
{
    default Schedule(0,0,UAIState_Orc_EatOnGround(), Location::Spawnpoint, 1000);
}

class UDailyRoutine_Orc_Butcher : UAIState_DailyRoutine_Orc
{
    default Schedule(0,0,UAIState_Orc_Butcher(), Location::Spawnpoint, 1000);
}

class UDailyRoutine_Orc_PlayDrum : UAIState_DailyRoutine_Orc
{
    default Schedule(0,0,UAIState_Orc_PlayDrum(), Location::Spawnpoint, 1000);
}

class UDailyRoutine_Orc_Dance : UAIState_DailyRoutine_Orc
{
    default Schedule(0,0,UAIState_Orc_Dance(), Location::Spawnpoint, 1000);
}
class UDailyRoutine_Orc_StandAround : UAIState_DailyRoutine_Orc
{
    default Schedule(0,0,UAIState_Orc_Living(), Location::Spawnpoint, 1000);
}

class UDailyRoutine_Orc_PracticeAxe : UAIState_DailyRoutine_Orc
{
    default Schedule(0,0,UAIState_Orc_PracticeAxe(), Location::Spawnpoint, 1000);
}

class UDailyRoutine_Orc_GrindOre : UAIState_DailyRoutine_Orc
{
    default Schedule(0,0,UAIState_Orc_GrindOre(), Location::Spawnpoint, 1000);
}

class UDailyRoutine_Orc_GrindingMachine : UAIState_DailyRoutine_Orc
{
    default Schedule(0,0,UAIState_Orc_GrindingMachine(), Location::Spawnpoint, 1000);
}

class UDailyRoutine_Orc_Enemy_SleeperTemple: UAIState_DailyRoutine_Orc
{
    UPROPERTY()
    float WaypointRadius = 750.0f;

    UDailyRoutine_Orc_Enemy_SleeperTemple(float InWaypointRadius)
    {
        WaypointRadius = InWaypointRadius;
    }

    default Schedule(0, 0, UAIState_Orc_Enemy_StandAround(), Location::Spawnpoint, WaypointRadius);
}

UCLASS()
class UAIState_Orc_Living : UAIState_RandomInteractions_Orc 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_StandAround,InWeight = 0.40f,InDurationSeconds = 10.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Interact_Sit_Ground,InWeight = 0.15f,InDurationSeconds = 25.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_GuardPassage,InWeight = 0.15f,InDurationSeconds = 15.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Eat,InWeight = 0.15f,InDurationSeconds = 50.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Drink,InWeight = 0.15f,InDurationSeconds = 50.0f));
}

UCLASS()
class UAIState_Orc_GuardPassage : UAIState_RandomInteractions_Orc 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_GuardPassage,InDurationSeconds = 120.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_GuardWatch,InDurationSeconds = 120.0f));
}

UCLASS()
class UAIState_Orc_Trance : UAIState_RandomInteractions_Orc 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Trance,InDurationSeconds = 120.0f));
}

UCLASS()
class UAIState_Orc_PotionAlchemy : UAIState_RandomInteractions_Orc 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_PotionAlchemy,InDurationSeconds = 120.0f));
}

UCLASS()
class UAIState_Orc_PotionAlchemy_Female : UAIState_RandomInteractions_Orc 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_PotionAlchemyFemale,InDurationSeconds = 120.0f));
}

UCLASS()
class UAIState_Orc_Butcher : UAIState_RandomInteractions_Orc 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Crafting_Cook,InDurationSeconds = 120.0f));
}

UCLASS()
class UAIState_Orc_GrindOre : UAIState_RandomInteractions_Orc 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_GrindOre,InDurationSeconds = 120.0f));
}

UCLASS()
class UAIState_Orc_GrindingMachine : UAIState_RandomInteractions_Orc 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_TurnWheel,InDurationSeconds = 120.0f));
}

UCLASS()
class UAIState_Orc_WarmHands : UAIState_RandomInteractions_Orc 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Campfire,InDurationSeconds = 120.0f));
}

UCLASS()
class UAIState_Orc_Campfire : UAIState_RandomInteractions_Orc 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Campfire, InWeight = 60.0f, InDurationSeconds = 120.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Drink_Ground, InWeight = 20.0f, InDurationSeconds = 120.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Interact_Sit_Ground, InWeight = 20.0f, InDurationSeconds = 120.0f));
}

UCLASS()
class UAIState_Orc_PracticeAxe : UAIState_RandomInteractions_Orc 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Practice1HSword,InDurationSeconds = 120.0f));
}

// UCLASS()
// class UAIState_Orc_Blacksmith: UGothicCharacterAIState 
// {
//    UFUNCTION(BlueprintOverride)
//     void DoTask()
//     {
//         while(!bShouldExitState)
//         {
//             AI.UseForge(100.0f);
//             AI.UseAnvil(50.0f);
//             AI.UseWhetStone(50.0f);
//             //AI.UseBarrel(10.0f);
//             //AI.UseWorkbench(10.0f);
//         }
//     }
// }

UCLASS()
class UAIState_Orc_Watch : UAIState_RandomInteractions_Orc 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_GuardWatch,InWeight = 0.90f,InDurationSeconds = 30.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Interact_Sit_Chair,InWeight = 0.10f,InDurationSeconds = 20.0f));
}

UCLASS()
class UAIState_Orc_SitOnGround : UAIState_RandomInteractions_Orc 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Interact_Sit_Ground,InDurationSeconds = 120.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Drink_Ground,InDurationSeconds = 120.0f));
}

UCLASS()
class UAIState_Orc_Feeding : UAIState_RandomInteractions_Orc 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_SowRice,InDurationSeconds = 120.0f));
}

UCLASS()
class UAIState_Orc_Sleep : UAIState_RandomInteractions_Orc 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Sleep,InDurationSeconds = 120.0f));
}

UCLASS()
class UAIState_Orc_Pray : UAIState_RandomInteractions_Orc 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Pray,InDurationSeconds = 120.0f));
}

UCLASS()
class UAIState_Orc_Drink : UAIState_RandomInteractions_Orc 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Drink,InDurationSeconds = 120.0f));
}

UCLASS()
class UAIState_Orc_DrinkOnGround : UAIState_RandomInteractions_Orc 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Drink_Ground,InDurationSeconds = 120.0f));
}

UCLASS()
class UAIState_Orc_Eat : UAIState_RandomInteractions_Orc 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Eat,InDurationSeconds = 120.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Eat_Bowl,InDurationSeconds = 120.0f));
}

// UCLASS()
// class UAIState_Orc_EatBowl : UAIState_RandomInteractions_Orc 
// {
//     default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Eat_Bowl,InDurationSeconds = 120.0f));
// }

UCLASS()
class UAIState_Orc_EatOnGround : UAIState_RandomInteractions_Orc 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Eat_Ground,InDurationSeconds = 120.0f));
}

UCLASS()
class UAIState_Orc_Cheering : UAIState_RandomInteractions_Orc 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_ArenaSpectator,InDurationSeconds = 120.0f));
}

UCLASS()
class UAIState_Orc_PlayDrum : UAIState_RandomInteractions_Orc 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_PlayDrum,InDurationSeconds = 120.0f));
}

UCLASS()
class UAIState_Orc_Dance : UAIState_RandomInteractions_Orc 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Dance,InDurationSeconds = 120.0f));
}

UCLASS()
class UAIState_Orc_LeatherWorking : UAIState_RandomInteractions_Orc 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Leatherworking,InDurationSeconds = 120.0f));
}

UCLASS()
class UAIState_Orc_SmashFood : UAIState_RandomInteractions_Orc 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_StandAround,InWeight = 0.30f,InDurationSeconds = 13.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_SmashFood,InWeight = 0.60f,InDurationSeconds = 60.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Eat,InWeight = 0.10f,InDurationSeconds = 17.0f));
}

UCLASS()
class UAIState_Orc_SmashFood_Standing : UAIState_RandomInteractions_Orc 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_StandAround,InWeight = 0.30f,InDurationSeconds = 13.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_SmashFood_Standing,InWeight = 0.60f,InDurationSeconds = 60.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Eat,InWeight = 0.10f,InDurationSeconds = 17.0f));
}

UCLASS()
class UAIState_Orc_Handicraft : UAIState_RandomInteractions_Orc 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_StandAround,InWeight = 0.30f,InDurationSeconds = 13.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Handicraft,InWeight = 0.60f,InDurationSeconds = 60.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Eat,InWeight = 0.10f,InDurationSeconds = 16.0f));
}

UCLASS()
class UAIState_Orc_StandAround : UAIState_RandomInteractions_Orc 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_StandAround,InWeight = 0.50f,InDurationSeconds = 13.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Drink,InWeight = 0.20f,InDurationSeconds = 60.0f));
}

UCLASS()
class UAIState_Orc_StandAroundWithEat : UAIState_RandomInteractions_Orc 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_StandAround,InWeight = 0.50f,InDurationSeconds = 13.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Drink,InWeight = 0.20f,InDurationSeconds = 60.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Eat,InWeight = 0.20f,InDurationSeconds = 60.0f));
}

UCLASS()
class UAIState_Orc_Watch_Patrolling_Route : UAIState_FollowBreadcrumbs
{
    UPROPERTY()
    FGameplayTag Path;

    UAIState_Orc_Watch_Patrolling_Route(FGameplayTag InPath)
    {
        Path = InPath;
    }

    default FollowSpotsWithTag = Path;

    void HandleArrivedAtBreadcrumb(FInteractionSpotHandle Breadcrumb) override
    {
        if (Math::RandRange(0, 100) > 80)
        {
            if (AI.CanGuardWatch(CharacterState.CharacterLocation, ActionRadius))
            {
                AI.GuardWatch(Duration = 10.0f);
            }
        }
    }
}

UCLASS()
class UAIState_Orc_Enemy_StandAround : UAIState_RandomInteractions_Orc 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_StandAround, InDurationSeconds = 10.0f));
}

UCLASS()
class UAIState_Orc_StandAroundInConversation : UAIState_RandomInteractions_Orc 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_StandAround_Conversation));
}

class UDailyRoutine_Orc_OW_OSC_OrcScoutM21_2204_Start : UAIState_DailyRoutine_Orc
{
    default Schedule(0,0,UAIState_Orc_StandAround(), Location::Spawnpoint, 2000);
    default Schedule(10,0,UAIState_Orc_GuardPassage(), Location::Spawnpoint, 2000);
    default Schedule(14,0,UAIState_Orc_EatOnGround(), Location::Spawnpoint, 2000);
    default Schedule(17,0,UAIState_Orc_GuardPassage(), Location::Spawnpoint, 2000);
    default Schedule(21,0,UAIState_Orc_StandAround(), Location::Spawnpoint, 2000);
}

class UDailyRoutine_Orc_OW_OSC_OrcScoutM22_2205_Start : UAIState_DailyRoutine_Orc
{
    default Schedule(0,0,UAIState_Orc_GuardPassage(), Location::Spawnpoint, 2000);
    default Schedule(9,0,UAIState_Orc_StandAround(), Location::Spawnpoint, 2000);
    default Schedule(15,0,UAIState_Orc_EatOnGround(), Location::Spawnpoint, 2000);
    default Schedule(18,0,UAIState_Orc_GuardPassage(), Location::Spawnpoint, 2000);
    default Schedule(20,0,UAIState_Orc_StandAround(), Location::Spawnpoint, 2000);
}

UCLASS()
class UAIState_RunToOrcStandAround : UAIState_Orc_StandAroundInConversation
{
    default InitialWalkspeed = EWalkSpeed::Running;
}


