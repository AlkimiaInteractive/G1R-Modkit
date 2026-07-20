
class UGothicModExt_WorldExtensions_ExampleInteractionSpots : UGothicModExt_WorldSubsystem
{
	UFUNCTION(BlueprintOverride)
	void HandleRegisterInteractionSpots()
	{
		FInteractionSpot SpotB;
		SpotB.Name = n"ExampleInteractionSpots_SpotB";
		SpotB.Location = FVector(110689, -76542, -517);
		SpotB.PossibleActions.AddTag(GameplayTag::Action_Ambient_Lurk);
			
		InteractionSpots.AddSpot(SpotB);
	}
}
