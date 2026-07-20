UCLASS()
class UVisualFeatures_BC_BAN_Bandit_19 : UCharacterVisualFeaturesDefinition
{
    default DirtSettings.HasDirt = true;
    default DirtSettings.DirtColor1 = FLinearColor(0.411458f, 0.291491f,0.153406f,1.0f);
    default DirtSettings.DirtColor2 = FLinearColor(0.1875f, 0.142111f,0.076172f,1.0f);
    default DirtSettings.DirtAlbedoIntensity = 0.3;
    default DirtSettings.DirtAmountIntensity = 1.0;
    default DirtSettings.DirtAmount0 = 0.573905;
    default DirtSettings.DirtHit0 = FVector(-2.187643f, 14.427925f,93.659943f);
    default DirtSettings.DirtRadius0 = 57.23497;
    default DirtSettings.DirtAmount1 = 1.0;
    default DirtSettings.DirtHit1 = FVector(-1.667366f, -3.064275f,22.80146f);
    default DirtSettings.DirtRadius1 = 51.691319;
    default DirtSettings.DirtAmount2 = 0.0;
    default DirtSettings.DirtHit2 = FVector(0.0f, 0.0f,0.0f);
    default DirtSettings.DirtRadius2 = 0.0;

    default TattooSettings.HasTattoo = false;
    default TattooSettings.HeadTattooMap = n"/Game/WeatherPlugins/FluidNinjaLive_New/Core/Assets/T_Black.T_Black";
    default TattooSettings.TattooColorHead = FLinearColor(0.015686f, 0.035294f,0.035294f,1.0f);
    default TattooSettings.TorsoTattooMap = n"/Game/WeatherPlugins/FluidNinjaLive_New/Core/Assets/T_Black.T_Black";
    default TattooSettings.TattooColorTorso = FLinearColor(0.015686f, 0.035294f,0.035294f,1.0f);
    default TattooSettings.LegsTattooMap = n"/Game/WeatherPlugins/FluidNinjaLive_New/Core/Assets/T_Black.T_Black";
    default TattooSettings.TattooColorLegs = FLinearColor(0.015686f, 0.035294f,0.035294f,1.0f);
    default TattooSettings.TattooColorIntensity = 0.8;
    default TattooSettings.TattooNormalIntensity = 1.0;
    default TattooSettings.TattooSubsurfaceOpacityMultiplier = 1.0;

    default ScarsSettings.HasScars = false;
    default ScarsSettings.IsDarkSkin = false;
    default ScarsSettings.SelectedMasks = FVector(7.0f, 2.0f,6.0f);
    default ScarsSettings.SelectedTextures = FVector(3.0f, 2.0f,3.0f);
    default ScarsSettings.ScarNormalIntensity = 2.0;
}