UCLASS()
class UVisualFeatures_OC_VLK_Digger43_579N : UCharacterVisualFeaturesDefinition
{
    default DirtSettings.HasDirt = true;
    default DirtSettings.DirtColor1 = FLinearColor(0.348958f, 0.239114f,0.112685f,1.0f);
    default DirtSettings.DirtColor2 = FLinearColor(0.140625f, 0.102702f,0.047607f,1.0f);
    default DirtSettings.DirtAlbedoIntensity = 0.5;
    default DirtSettings.DirtAmountIntensity = 0.5;
    default DirtSettings.DirtAmount0 = 0.3;
    default DirtSettings.DirtHit0 = FVector(5.023804f, -0.7889f,62.736588f);
    default DirtSettings.DirtRadius0 = 76.591339;
    default DirtSettings.DirtAmount1 = 0.2;
    default DirtSettings.DirtHit1 = FVector(6.626759f, 6.482307f,45.805733f);
    default DirtSettings.DirtRadius1 = 60.828545;
    default DirtSettings.DirtAmount2 = 0.2;
    default DirtSettings.DirtHit2 = FVector(27.389446f, 16.698517f,148.143463f);
    default DirtSettings.DirtRadius2 = 58.448486;

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
    default ScarsSettings.SelectedMasks = FVector(5.0f, 6.0f,5.0f);
    default ScarsSettings.SelectedTextures = FVector(4.0f, 1.0f,1.0f);
    default ScarsSettings.ScarNormalIntensity = 2.0;
}