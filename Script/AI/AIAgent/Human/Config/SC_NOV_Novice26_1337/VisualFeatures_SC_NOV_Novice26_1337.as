UCLASS()
class UVisualFeatures_SC_NOV_Novice26_1337 : UCharacterVisualFeaturesDefinition
{
    default DirtSettings.HasDirt = true;
    default DirtSettings.DirtColor1 = FLinearColor(0.411458f, 0.291491f,0.153406f,1.0f);
    default DirtSettings.DirtColor2 = FLinearColor(0.1875f, 0.142111f,0.076172f,1.0f);
    default DirtSettings.DirtAlbedoIntensity = 0.3;
    default DirtSettings.DirtAmountIntensity = 1.0;
    default DirtSettings.DirtAmount0 = 0.614044;
    default DirtSettings.DirtHit0 = FVector(6.745781f, 3.835173f,77.106659f);
    default DirtSettings.DirtRadius0 = 50.279682;
    default DirtSettings.DirtAmount1 = 1.0;
    default DirtSettings.DirtHit1 = FVector(-3.442576f, 5.383849f,13.167966f);
    default DirtSettings.DirtRadius1 = 52.98061;
    default DirtSettings.DirtAmount2 = 0.0;
    default DirtSettings.DirtHit2 = FVector(0.0f, 0.0f,0.0f);
    default DirtSettings.DirtRadius2 = 0.0;

    default TattooSettings.HasTattoo = true;
    default TattooSettings.HeadTattooMap = n"/Game/Assets/Characters/Humans/Tattos/Novice/T_SC_Tattoos_Novice2_Head_MASK.T_SC_Tattoos_Novice2_Head_MASK";
    default TattooSettings.TattooColorHead = FLinearColor(0.015686f, 0.035294f,0.035294f,1.0f);
    default TattooSettings.TorsoTattooMap = n"/Game/Assets/Characters/Humans/Tattos/Novice/T_SC_Tattoos_Novice2_Torso_MASK.T_SC_Tattoos_Novice2_Torso_MASK";
    default TattooSettings.TattooColorTorso = FLinearColor(0.015686f, 0.035294f,0.035294f,1.0f);
    default TattooSettings.LegsTattooMap = n"/Game/Assets/Characters/Humans/Tattos/Novice/T_SC_Tattoos_Novice1_Legs_MASK.T_SC_Tattoos_Novice1_Legs_MASK";
    default TattooSettings.TattooColorLegs = FLinearColor(0.015686f, 0.035294f,0.035294f,1.0f);
    default TattooSettings.TattooColorIntensity = 0.8;
    default TattooSettings.TattooNormalIntensity = 1.0;
    default TattooSettings.TattooSubsurfaceOpacityMultiplier = 1.0;

    default ScarsSettings.HasScars = false;
    default ScarsSettings.IsDarkSkin = false;
    default ScarsSettings.SelectedMasks = FVector(0.0f, 7.0f,1.0f);
    default ScarsSettings.SelectedTextures = FVector(3.0f, 3.0f,1.0f);
    default ScarsSettings.ScarNormalIntensity = 2.0;
}