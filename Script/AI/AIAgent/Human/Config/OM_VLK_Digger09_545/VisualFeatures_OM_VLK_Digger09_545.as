UCLASS()
class UVisualFeatures_OM_VLK_Digger09_545 : UCharacterVisualFeaturesDefinition
{
    default DirtSettings.HasDirt = true;
    default DirtSettings.DirtColor1 = FLinearColor(0.411458f, 0.291491f,0.153406f,1.0f);
    default DirtSettings.DirtColor2 = FLinearColor(0.1875f, 0.142111f,0.076172f,1.0f);
    default DirtSettings.DirtAlbedoIntensity = 0.3;
    default DirtSettings.DirtAmountIntensity = 1.0;
    default DirtSettings.DirtAmount0 = 1.0;
    default DirtSettings.DirtHit0 = FVector(-13.354831f, -14.895735f,76.927071f);
    default DirtSettings.DirtRadius0 = 77.431641;
    default DirtSettings.DirtAmount1 = 1.0;
    default DirtSettings.DirtHit1 = FVector(-0.41719f, -7.365923f,20.675388f);
    default DirtSettings.DirtRadius1 = 64.670067;
    default DirtSettings.DirtAmount2 = 1.0;
    default DirtSettings.DirtHit2 = FVector(-7.704067f, 6.59634f,178.708069f);
    default DirtSettings.DirtRadius2 = 49.445763;

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
    default ScarsSettings.IsDarkSkin = true;
    default ScarsSettings.SelectedMasks = FVector(3.0f, 6.0f,1.0f);
    default ScarsSettings.SelectedTextures = FVector(1.0f, 2.0f,2.0f);
    default ScarsSettings.ScarNormalIntensity = 2.0;
}