UCLASS()
class UVisualFeatures_SC_NOV_Novice02_1307 : UCharacterVisualFeaturesDefinition
{
    default DirtSettings.HasDirt = true;
    default DirtSettings.DirtColor1 = FLinearColor(0.411458f, 0.291491f,0.153406f,1.0f);
    default DirtSettings.DirtColor2 = FLinearColor(0.1875f, 0.142111f,0.076172f,1.0f);
    default DirtSettings.DirtAlbedoIntensity = 0.3;
    default DirtSettings.DirtAmountIntensity = 1.0;
    default DirtSettings.DirtAmount0 = 0.613089;
    default DirtSettings.DirtHit0 = FVector(-18.991022f, 11.250996f,87.8983f);
    default DirtSettings.DirtRadius0 = 49.569408;
    default DirtSettings.DirtAmount1 = 1.0;
    default DirtSettings.DirtHit1 = FVector(7.293739f, 9.260302f,23.857988f);
    default DirtSettings.DirtRadius1 = 61.131973;
    default DirtSettings.DirtAmount2 = 0.0;
    default DirtSettings.DirtHit2 = FVector(0.0f, 0.0f,0.0f);
    default DirtSettings.DirtRadius2 = 0.0;

    default TattooSettings.HasTattoo = true;
    default TattooSettings.HeadTattooMap = n"/Game/Assets/Characters/Humans/Tattos/Novice/T_SC_Tattoos_Novice3_Head_MASK.T_SC_Tattoos_Novice3_Head_MASK";
    default TattooSettings.TattooColorHead = FLinearColor(0.0f, 0.0f,0.0f,1.0f);
    default TattooSettings.TorsoTattooMap = n"/Game/Assets/Characters/Humans/Tattos/Novice/T_SC_Tattoos_Novice3_Torso_MASK.T_SC_Tattoos_Novice3_Torso_MASK";
    default TattooSettings.TattooColorTorso = FLinearColor(0.0f, 0.0f,0.0f,1.0f);
    default TattooSettings.LegsTattooMap = n"/Game/Assets/Characters/Humans/Tattos/Novice/T_SC_Tattoos_Novice1_Legs_MASK.T_SC_Tattoos_Novice1_Legs_MASK";
    default TattooSettings.TattooColorLegs = FLinearColor(0.0f, 0.0f,0.0f,1.0f);
    default TattooSettings.TattooColorIntensity = 0.8;
    default TattooSettings.TattooNormalIntensity = 1.0;
    default TattooSettings.TattooSubsurfaceOpacityMultiplier = 1.0;

    default ScarsSettings.HasScars = true;
    default ScarsSettings.IsDarkSkin = true;
    default ScarsSettings.SelectedMasks = FVector(7.0f, 4.0f,6.0f);
    default ScarsSettings.SelectedTextures = FVector(2.0f, 2.0f,4.0f);
    default ScarsSettings.ScarNormalIntensity = 2.0;
}