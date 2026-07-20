UCLASS()
class UVisualFeatures_OM_VLK_Glen_583 : UCharacterVisualFeaturesDefinition
{
    default DirtSettings.HasDirt = true;
    default DirtSettings.DirtColor1 = FLinearColor(0.411458f, 0.291491f,0.153406f,1.0f);
    default DirtSettings.DirtColor2 = FLinearColor(0.1875f, 0.142111f,0.076172f,1.0f);
    default DirtSettings.DirtAlbedoIntensity = 0.3;
    default DirtSettings.DirtAmountIntensity = 1.0;
    default DirtSettings.DirtAmount0 = 1.0;
    default DirtSettings.DirtHit0 = FVector(-9.761257f, -11.085377f,87.67057f);
    default DirtSettings.DirtRadius0 = 65.472046;
    default DirtSettings.DirtAmount1 = 1.0;
    default DirtSettings.DirtHit1 = FVector(2.607443f, 9.201584f,24.274622f);
    default DirtSettings.DirtRadius1 = 78.610809;
    default DirtSettings.DirtAmount2 = 1.0;
    default DirtSettings.DirtHit2 = FVector(-2.070649f, 6.130438f,172.685028f);
    default DirtSettings.DirtRadius2 = 49.149681;

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
    default ScarsSettings.SelectedMasks = FVector(4.0f, 6.0f,5.0f);
    default ScarsSettings.SelectedTextures = FVector(1.0f, 4.0f,4.0f);
    default ScarsSettings.ScarNormalIntensity = 2.0;
}