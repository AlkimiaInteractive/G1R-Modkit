UCLASS()
class UFXDefinition_SwampsharkTemplate : UGothicFXDefinition
{
    default RequiredTags.AddTag(GameplayTag::Species_Creature_Swampshark);

    UFUNCTION(BlueprintOverride)
    void PrepareFX(AActor Instigator, FHitResult HitResult)
    {
        AGothicCharacter InstigatorCharacter = Cast<AGothicCharacter>(Instigator);

        if(InstigatorCharacter == nullptr)
            return;
        
        UGothicMovementComponent Movement = InstigatorCharacter.GetGothicMovementComponent();

        if(Movement == nullptr)
            return;

        float32 WaterDepth = Movement.GetWaterDepth();
        
        if(WaterDepth <= 0)
        {
            FModEvent.EventParameters.FindOrAdd(n"WaterLevel") = 0.0f;
        }
        else
        {
            FModEvent.EventParameters.FindOrAdd(n"WaterLevel") = 1.0f;
        }
        
    }
}