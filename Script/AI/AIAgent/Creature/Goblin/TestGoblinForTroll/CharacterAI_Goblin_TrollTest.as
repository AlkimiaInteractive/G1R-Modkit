UCLASS()
class UGameplayAbility_CharacterAI_Goblin_TrollTest : UGameplayAbility_CharacterAI_Goblin_Green
{    
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Combat, UAIState_Combat_Goblin_TrollTest::StaticClass());
}