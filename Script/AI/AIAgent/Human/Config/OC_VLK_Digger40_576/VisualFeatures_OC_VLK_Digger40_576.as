UCLASS()
class UVisualFeatures_OC_VLK_Digger40_576 : UCharacterVisualFeaturesDefinition
{
    default DirtSettings.HasDirt = true;
    default DirtSettings.DirtColor1 = FLinearColor(0.411458f, 0.291491f,0.153406f,1.0f);
    default DirtSettings.DirtColor2 = FLinearColor(0.1875f, 0.142111f,0.076172f,1.0f);
    default DirtSettings.DirtAlbedoIntensity = 0.3;
    default DirtSettings.DirtAmountIntensity = 1.0;
    default DirtSettings.DirtAmount0 = 0.616154;
    default DirtSettings.DirtHit0 = FVector(15.624397f, -9.31529f,86.96019f);
    default DirtSettings.DirtRadius0 = 54.825542;
    default DirtSettings.DirtAmount1 = 1.0;
    default DirtSettings.DirtHit1 = FVector(3.857315f, -7.452433f,17.949808f);
    default DirtSettings.DirtRadius1 = 53.457291;
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

    default ScarsSettings.HasScars = true;
    default ScarsSettings.IsDarkSkin = false;
    default ScarsSettings.SelectedMasks = FVector(1.0f, 4.0f,0.0f);
    default ScarsSettings.SelectedTextures = FVector(2.0f, 2.0f,4.0f);
    default ScarsSettings.ScarNormalIntensity = 2.0;
}