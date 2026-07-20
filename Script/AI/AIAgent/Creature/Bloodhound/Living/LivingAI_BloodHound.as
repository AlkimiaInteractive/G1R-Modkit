UCLASS()
class UGameplayAbility_CharacterAI_Bloodhound : UGameplayAbility_CreatureAI
{
    default ModeOfFleeOnUnfavorableCombat = EFleeOnUnfavorableCombatMode::OnUnfavorable_PredatorOnly;
    default InitialDailyRoutineClass = UDailyRoutine_BloodHound::StaticClass();
    
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Combat, UAIState_Combat_Bloodhound::StaticClass());
}

class UDailyRoutine_BloodHound : UAIState_DailyRoutine_Creature
{
    default Schedule(7, 0, UAIState_BloodHound_Living_Day(), Location::Spawnpoint, 1500.0f);
    default Schedule(23, 0, UAIState_BloodHound_Living_Night(), Location::Spawnpoint, 1500.0f);
}

UCLASS()
class UAIState_BloodHound_Living_Day : UAIState_Roam 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Dig, 0.2f, 10.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Roar, 0.2f, 15.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_ScratchEar, 0.2f, 15.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Eat, 0.1f, 20.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Shake, 0.1f, 20.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Lay, 0.1f, 10.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Smell, 0.2f, 10.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_LookAround, 0.2f, 10.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Drink, 0.2f, 15.0f));


    default ChanceToDoActionOnSpot = 0.75f;
    default SpotReachRadius = 200.0f;
    
}

class UAIState_BloodHound_Living_Night : UAIState_RandomInteractions
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Sleep, 0.6f, InDurationSeconds = 120.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Lay, 0.4f, InDurationSeconds = 15.0f));
}