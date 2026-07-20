/** Lets the Agent walk between InteractionSpots randomly, sometimes performing a random Action. */
UCLASS()
class UAIState_Roam : UAIState_RandomInteractions_RandomSpots
{
    default ChanceToDoActionOnSpot = 0.25f;
    default bPreferSpotsInLookingDirection = true;
    default bPreferSpotOutsideSpotReachRadius = true;
}
