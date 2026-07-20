UCLASS()
class ACinematicVisualsController : AActor
{
    UPROPERTY()
    UMaterialParameterCollection CinematicsParameterCollection;

    UFUNCTION(BlueprintCallable)
    void EnableCinematicVisuals(float CameraDistance, float SafeAreaDistance)
    {
        Material::SetScalarParameterValue(CinematicsParameterCollection, FName("Cinematics - Fade Enabled"), 1);
        Material::SetScalarParameterValue(CinematicsParameterCollection, FName("Cinematics - Fade Distance"), CameraDistance);
        Material::SetScalarParameterValue(CinematicsParameterCollection, FName("Cinematics - Fade Distance Offset"), SafeAreaDistance);
    }

    UFUNCTION(BlueprintCallable)
    void DisableCinematicVisuals()
    {
        Material::SetScalarParameterValue(CinematicsParameterCollection, FName("Cinematics - Fade Enabled"), 0);
    }
}