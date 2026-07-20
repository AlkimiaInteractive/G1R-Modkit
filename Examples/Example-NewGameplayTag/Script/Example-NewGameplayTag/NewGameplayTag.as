
/**
 * The GameplayTag "My.Example.Tag" is registered through Config/GameplayTags.ini.
 * it automatically becomes available in script as `GameplayTag::My_Example_Tag`.
 */
class UExampleObjectWithNewGameplayTag : UObject
{
	FGameplayTag ExampleTag = GameplayTag::My_Example_Tag;
}
