UCLASS()
class UVisualFeatures_FM_SFB_Scraper02_1031 : UCharacterVisualFeaturesDefinition
{
    default DirtSettings.HasDirt = true;
    default DirtSettings.DirtColor1 = FLinearColor(0.411458f, 0.291491f,0.153406f,1.0f);
    default DirtSettings.DirtColor2 = FLinearColor(0.1875f, 0.142111f,0.076172f,1.0f);
    default DirtSettings.DirtAlbedoIntensity = 0.3;
    default DirtSettings.DirtAmountIntensity = 1.0;
    default DirtSettings.DirtAmount0 = 1.0;
    default DirtSettings.DirtHit0 = FVector(-10.308681f, -1.717377f,86.996002f);
    default DirtSettings.DirtRadius0 = 77.801994;
    default DirtSettings.DirtAmount1 = 1.0;
    default DirtSettings.DirtHit1 = FVector(-9.858435f, -6.639211f,23.19453f);
    default DirtSettings.DirtRadius1 = 75.967575;
    default DirtSettings.DirtAmount2 = 1.0;
    default DirtSettings.DirtHit2 = FVector(-1.169632f, -2.284079f,179.736435f);
    default DirtSettings.DirtRadius2 = 42.941803;

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
    default ScarsSettings.IsDarkSkin = true;
    default ScarsSettings.SelectedMasks = FVector(1.0f, 1.0f,0.0f);
    default ScarsSettings.SelectedTextures = FVector(3.0f, 1.0f,4.0f);
    default ScarsSettings.ScarNormalIntensity = 2.0;
}