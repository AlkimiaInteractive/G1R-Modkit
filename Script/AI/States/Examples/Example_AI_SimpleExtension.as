/**
 * This example show how to add something as an AI.Something() function to be reused in any other script file.
 * It can be called like so:
 * 
 *     AI.Example_GoGetWood(...);
 * 
 * Add these mixins to make re-using your custom states from other states easier!
 */
mixin FAbilityTaskExecutor Example_GoGetWood(UGameplayAbility_CharacterAI AI, FName AtWaypoint, float Radius = 2000.0f)
{
    return AI.TryUseFreepointAt(GameplayTag::Action_Ambient_GetWood, AtWaypoint, Radius);
}


/***********************************************************************************
 * The mixin-function that was defined above can now be used in any AIState like so:
 ***********************************************************************************/

UCLASS()
class UAIState_Example_SimpleAIExtension : UGothicCharacterAIState 
{
    /** Defines the sequence of actions this character should do during this state. */
    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        AI.Example_GoGetWood(n"WP_SOMEWHERE");

        AI.GotoWaypoint(n"WP_COOKINGPLACE");
    }
}