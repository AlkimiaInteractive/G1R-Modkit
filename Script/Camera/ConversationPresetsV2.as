
/**
 * 
 * PRESET EXPLANATIONS
 * 
 */

 /** 
  * 
  * -- UConversationCameraPresetWorldSpace --
  * 
  * Position and Rotation will directly be applied as worldspace transform
  * 
 */

/**  
 *
 * -- UConversationCameraPresetSpeakerOffset --
 * 
 * - Position and Rotation Curve Values will be added to the Speaker Transform
 * - Yaw is turned 180° by default to face the speaker
 * 
*/

/**  
 *
 * -- UConversationCameraPresetListenerOffset --
 * 
 * - Same as Speaker Offset, only with Listener as reference point for offset
 * 
*/

/**  
 *
 * -- UConversationCameraPresetCenterOffset --
 * 
 * - Offset from the center point between Speaker and Listener
 * 
 * - Camera Height is calculated to face center point with Rotation Input Curve pitch
 * - IMPORTANT: A Pitch value close or equal to 90 will have no proper result 
 * 
 * - Position Input Curve Z value will be added as offset to height of center point
 * - Position Input Curve X Determines distance between camera and center point
 * 
 * - Rotation Input Curve Roll is not used
 * - Rotation Input Curve Yaw describe angle the camera is facing center point from
 * - Output Yaw will be calculated to always face center point
 * 
 * - Values from Rotation offset Curve will be added to rotation after all calculations 
 * 
*/

/**  
 *
 * -- UConversationCameraPresetFocusActor --
 * 
 * - Position is applied as offset to the Speaker just like the Speaker Offset Preset.
 * 
 * - For the rotation an additional Actor called ReferencePoint is used, values on the LerpAlphaCurve, usually between 0 and 1 determin the camera rotation.
 * - A value of 0 will make the camera face the Speaker, a value of 1 will make it face the ReferencePoint, values between it will face a position on the line between those 2.
 * 
 * - Additionally values from RotationOffsetCurve will be added to the rotation after the calculation.
 * 
*/

/**  
 *
 * -- UConversationCameraPresetFoVAngle --
 * 
 * - Calculates transform so speaker and listener will remain in the same horizontal position on screen
 * - horizontal position is calculated from the Camera FoV Factor * FoVAngle Curve value
 * 
 * - Example: A Value on the Curve of 0.66 would result in the Actors being on 1/3 and 2/3 of the screen width
 * - A Factor of 1 would have both Actors at the left and right edge of the screen
 * 
 * - Rotation Curve Yaw determines the angle the camera is facing the view point between actors
 * - A Yaw value of 90 will make the camera face the middle between them from the right side
 * - IMPORTANT: A Yaw Value close or equal to 0 or 180 will have no proper result
 * 
 * - Camera Height is calculated to face center point with pitch of Angle Input Curve
 * - IMPORTANT: A Pitch value close or equal to 90 will have no proper result 
 * 
 * - Angle input Curve Roll is not used
 * 
 * - Values from Position Offset curve will be added after the calculation
 * - Values from Rotation Offset curve will be added after the calculation
*/

/**
 * 
 * -- Gameplay Tags--
 * 
 * - GameplayTag::Action_Conversation_Start
 * - Preset can be used t the first topic choice screen of conversation
 * 
 * - GameplayTag::Action_Conversation_TopicChoice
 * - Preset can be used during Topic choice (except the first one)
 *
 * - GameplayTag::Action_Conversation_Default;
 * - Preset can be used during a Topic
 * 
 * - GameplayTag::Action_Conversation_SubChoice
 * - Preset can be used during a Sub Choice
 * 
 */

/**  
 *
 * -- General Information --
 * 
 * - Adding values to a curve at the exact same timekey will overwrite them
 * - For instant transitions use slightly different values, example: 3.0f and 3.001 
 * 
 * - TIPP:
 * - Set InitialChoiceWeight to a heigh number and give it the Start tag for easy and fast testing
 * 
 * - TIPP:
 * - When importing Presets from a testing Camera keep in mind what side will be used in Conversation Camera
 * - or set bIgnoreSideInvertsFromCamera = true  
 * 
 * - EXAMPLE LINE: put one of those into the Act function of a given generated dialogue class (here Orry)
 * - Other.SetDialogueCamPreset(Orry.GetAvatarActorFromActorInfo(), n"PresetName");
 * 
 * - Note using center orientated Presets like FoV and CenterRotation with an angle close to but not exactly 90
 * - will look weird when they get reversed
 * 
*/

/**
 * 
 * PRESET IMPLEMENTATION
 * 
 */


//SHOT DEFAULTS DEFINITION /////////////////////////////////////////////////////////////////////////////

namespace LightingPresets
{
    FLightSet WideShot()
    { 
        FLightSet LightingParameters;

        LightingParameters.KeyLightParam.LightPos.AddVectorAt(0.0f, FVector(38.0788f, -286.337769f, 122.875771f));
        LightingParameters.KeyLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-41.773136f, 78.391579f, -0.0f));
        LightingParameters.KeyLightParam.LightIntensityCurve.AddValueAt(0.f, 1.f);
        LightingParameters.KeyLightParam.LightColor = FLinearColor(1.f, 0.854993f, 0.658375f, 1.f);
        LightingParameters.KeyLightParam.SourceWidth = 250.f;
        LightingParameters.KeyLightParam.SourceHeight = 125.f;
        LightingParameters.KeyLightParam.AttenuationRadius = 600.f;
        LightingParameters.KeyLightParam.LightingChannels.bChannel0 = false;
        LightingParameters.KeyLightParam.LightingChannels.bChannel1 = true;
        LightingParameters.KeyLightParam.LightingChannels.bChannel2 = false;

        LightingParameters.RimLightParam.LightPos.AddVectorAt(0.0f, FVector(10.897493f, 365.965057f, 33.873058f));
        LightingParameters.RimLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-14.737277f, -90.271034f, 0.762405f));
        LightingParameters.RimLightParam.LightIntensityCurve.AddValueAt(0.f, 1.f);
        LightingParameters.RimLightParam.LightColor = FLinearColor(0.799103f, 0.62396f, 1.f, 1.f);
        LightingParameters.RimLightParam.SourceWidth = 250.f;
        LightingParameters.RimLightParam.SourceHeight = 128.f;
        LightingParameters.RimLightParam.AttenuationRadius = 450.f;
        LightingParameters.RimLightParam.LightingChannels.bChannel0 = false;
        LightingParameters.RimLightParam.LightingChannels.bChannel1 = true;
        LightingParameters.RimLightParam.LightingChannels.bChannel2 = false;

        LightingParameters.KeyReverseLightParam.LightPos.AddVectorAt(0.0f, FVector(268.748383f, 145.551529f, 110.003998f));
        LightingParameters.KeyReverseLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-46.284248f, -142.094177f, 0.037285f));
        LightingParameters.KeyReverseLightParam.LightIntensityCurve.AddValueAt(0.f, 1.f);
        LightingParameters.KeyReverseLightParam.LightColor = FLinearColor(1.f, 0.854993f, 0.658375f, 1.f);
        LightingParameters.KeyReverseLightParam.SourceWidth = 250.f;
        LightingParameters.KeyReverseLightParam.SourceHeight = 125.f;
        LightingParameters.KeyReverseLightParam.AttenuationRadius = 650.f;
        LightingParameters.KeyReverseLightParam.LightingChannels.bChannel0 = false;
        LightingParameters.KeyReverseLightParam.LightingChannels.bChannel1 = false;
        LightingParameters.KeyReverseLightParam.LightingChannels.bChannel2 = true;

        LightingParameters.RimReverseLightParam.LightPos.AddVectorAt(0.0f, FVector(-169.371811f, -281.970795f, 2.32207f));
        LightingParameters.RimReverseLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-21.197866f, 45.113724f, 0.0f));
        LightingParameters.RimReverseLightParam.LightIntensityCurve.AddValueAt(0.f, 1.f);
        LightingParameters.RimReverseLightParam.LightColor = FLinearColor(0.799103f, 0.62396f, 1.f, 1.f);
        LightingParameters.RimReverseLightParam.SourceWidth = 250.f;
        LightingParameters.RimReverseLightParam.SourceHeight = 125.f;
        LightingParameters.RimReverseLightParam.AttenuationRadius = 400.f;
        LightingParameters.RimReverseLightParam.LightingChannels.bChannel0 = false;
        LightingParameters.RimReverseLightParam.LightingChannels.bChannel1 = false;
        LightingParameters.RimReverseLightParam.LightingChannels.bChannel2 = true;
   

        LightingParameters.BarnDoorAngle = 45.f;
        LightingParameters.BarnDoorLength = 20.f;
        LightingParameters.VolumetricScatteringIntensity = 0.f;
        LightingParameters.IndirectLightingIntensity = 0.f;

        LightingParameters.SpeakerLightingChannels.bChannel0 = false;
        LightingParameters.SpeakerLightingChannels.bChannel1 = true;
        LightingParameters.SpeakerLightingChannels.bChannel2 = false;
        LightingParameters.ListenerLightingChannels.bChannel0 = false;
        LightingParameters.ListenerLightingChannels.bChannel1 = false;
        LightingParameters.ListenerLightingChannels.bChannel2 = true;
        LightingParameters.AdditionalParticipantLightingChannels.bChannel0 = false;
        LightingParameters.AdditionalParticipantLightingChannels.bChannel1 = false;
        LightingParameters.AdditionalParticipantLightingChannels.bChannel2 = true;

        LightingParameters.LightUnitType = ELightUnits::Candelas;

        LightingParameters.ShotMode = EConversationCameraShotMode::WideShot;

        return LightingParameters;
    }


    FLightSet CloseShot()
    { 
        FLightSet LightingParameters;
    
        LightingParameters.KeyLightParam.LightPos.AddVectorAt(0.f, FVector(36.22039f, -138.65834f, 75.358513f));
        LightingParameters.KeyLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-64.027443f, 100.149918f, 0.825281f));
        LightingParameters.KeyLightParam.LightColor = FLinearColor(1.f, 0.973445f, 0.904661f, 1.f);
        LightingParameters.KeyLightParam.LightIntensityCurve.AddValueAt(0.f, 0.1f);
        LightingParameters.KeyLightParam.SourceWidth = 250.f;
        LightingParameters.KeyLightParam.SourceHeight = 128.f;
        LightingParameters.KeyLightParam.AttenuationRadius = 250.f;
        LightingParameters.KeyLightParam.LightingChannels.bChannel0 = false;
        LightingParameters.KeyLightParam.LightingChannels.bChannel1 = true;
        LightingParameters.KeyLightParam.LightingChannels.bChannel2 = false;

        LightingParameters.RimLightParam.LightPos.AddVectorAt(0.f, FVector(-43.605824f, 160.180542f, 46.665382f));
        LightingParameters.RimLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-50.93589f, -86.005913f, -10.529387f));
        LightingParameters.RimLightParam.LightColor = FLinearColor(1.f, 0.846873f, 0.982251f, 1.f);
        LightingParameters.RimLightParam.LightIntensityCurve.AddValueAt(0.f, 0.1f);
        LightingParameters.RimLightParam.SourceWidth = 128.f;
        LightingParameters.RimLightParam.SourceHeight = 128.f;
        LightingParameters.RimLightParam.AttenuationRadius = 250.f;
        LightingParameters.RimLightParam.LightingChannels.bChannel0 = false;
        LightingParameters.RimLightParam.LightingChannels.bChannel1 = true;
        LightingParameters.RimLightParam.LightingChannels.bChannel2 = false;

        LightingParameters.KeyReverseLightParam.LightPos.AddVectorAt(0.f, FVector(57.129742f, 124.885155f, 73.787521f));
        LightingParameters.KeyReverseLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-62.49324f, -80.76001f, 0.512507f));
        LightingParameters.KeyReverseLightParam.LightColor = FLinearColor(1.f, 0.973445f, 0.904661f, 1.f);
        LightingParameters.KeyReverseLightParam.LightIntensityCurve.AddValueAt(0.f, 0.1f);
        LightingParameters.KeyReverseLightParam.SourceWidth = 250.f;
        LightingParameters.KeyReverseLightParam.SourceHeight = 128.f;
        LightingParameters.KeyReverseLightParam.AttenuationRadius = 250.f;      
        LightingParameters.KeyReverseLightParam.LightingChannels.bChannel0 = false;
        LightingParameters.KeyReverseLightParam.LightingChannels.bChannel1 = false;
        LightingParameters.KeyReverseLightParam.LightingChannels.bChannel2 = true;   

        LightingParameters.RimReverseLightParam.LightPos.AddVectorAt(0.f, FVector(59.535038f, -111.440926f, 25.028675f));
        LightingParameters.RimReverseLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-20.375233f, 106.613701f, -0.f));  
        LightingParameters.RimReverseLightParam.LightColor = FLinearColor(1.f, 0.846873f, 0.982251f, 1.f);
        LightingParameters.RimReverseLightParam.LightIntensityCurve.AddValueAt(0.f, 0.1f);
        LightingParameters.RimReverseLightParam.SourceWidth = 250.f;
        LightingParameters.RimReverseLightParam.SourceHeight = 128.f;
        LightingParameters.RimReverseLightParam.AttenuationRadius = 300.f;  
        LightingParameters.RimReverseLightParam.LightingChannels.bChannel0 = false;
        LightingParameters.RimReverseLightParam.LightingChannels.bChannel1 = false;
        LightingParameters.RimReverseLightParam.LightingChannels.bChannel2 = true;
        
        LightingParameters.BarnDoorAngle = 45.f;
        LightingParameters.BarnDoorLength = 20.f;
        LightingParameters.VolumetricScatteringIntensity = 0.f;
        LightingParameters.IndirectLightingIntensity = 0.f;

        LightingParameters.SpeakerLightingChannels.bChannel0 = false;
        LightingParameters.SpeakerLightingChannels.bChannel1 = true;
        LightingParameters.SpeakerLightingChannels.bChannel2 = false;
        LightingParameters.ListenerLightingChannels.bChannel0 = false;
        LightingParameters.ListenerLightingChannels.bChannel1 = false;
        LightingParameters.ListenerLightingChannels.bChannel2 = true;
        LightingParameters.AdditionalParticipantLightingChannels.bChannel0 = false;
        LightingParameters.AdditionalParticipantLightingChannels.bChannel1 = false;
        LightingParameters.AdditionalParticipantLightingChannels.bChannel2 = true;

        LightingParameters.LightUnitType = ELightUnits::Candelas;

        LightingParameters.ShotMode = EConversationCameraShotMode::CloseShot;

        return LightingParameters;
    }
   
}





///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    // TEMP all presets as follow up

    // default FollowUpPresetWhitelist.Add(UConversationPreset_Individual_CloseUp::StaticClass());
    // default FollowUpPresetWhitelist.Add(UConversationPreset_Individual_Medium::StaticClass());
    // default FollowUpPresetWhitelist.Add(UConversationPreset_OverTheShoulder_CloseUp::StaticClass());
    // default FollowUpPresetWhitelist.Add(UConversationPreset_OverTheShoulder_Medium::StaticClass());
    // default FollowUpPresetWhitelist.Add(UConversationPreset_OverTheShoulder_Cowboy::StaticClass());
    // default FollowUpPresetWhitelist.Add(UConversationPreset_TwoShot_Cowboy::StaticClass());
    // default FollowUpPresetWhitelist.Add(UConversationPreset_TwoShot_ExtraFull::StaticClass());
    // default FollowUpPresetWhitelist.Add(n"TWO SHOT EXTRA LONG");
    // default FollowUpPresetWhitelist.Add(UConversationPreset_TwoShot_ExtraWide);
    // default FollowUpPresetWhitelist.Add(UConversationPreset_TwoShot_Full::StaticClass());
    // default FollowUpPresetWhitelist.Add(n"TWO SHOT LONG");
    // default FollowUpPresetWhitelist.Add(UConversationPreset_TwoShot_Wide);
    // default FollowUpPresetWhitelist.Add(UConversationPreset_Default_CloseUp::StaticClass());
    // default FollowUpPresetWhitelist.Add(n"DEFAULT WIDE");


//FINAL CAMERAS//////////////////////////////////////////////////////////////////////////////

class UConversationPreset_TwoShot_ExtraWide : UConversationCameraPresetCenterOffset
{
    default PresetName = n"TWO SHOT EXTRA WIDE";

    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::None;
    default FocusMode = EConversationCameraFocusMode::Speaker;

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_SubChoice);

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;
    
    default InitialChoiceWeight = 100.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.f, 2.8f);
    default CameraFoVCurve.AddValueAt(0.f, 50.f);
    default CameraFocalLengthCurve.AddValueAt(0.f, 65.f);
    
    default CenterPositionCurve.AddVectorAt(0.f, FVector(376.926819f, -1009.612427f, -46.547745f));
    default CenterRotationCurve.AddRotatorAt(0.f, FRotator(0.319273f, -249.539108f, 0.220046f));

    default AnimSequenceName = n"CameraBreathWIDE";

    default MaxHeightDifference = 150.0f;     
    
    default MinDistance = 38.0f; 
    default MaxDistance = 550.0f;   

    default ForbiddenTagsSpeakerAndListener.AddTag(GameplayTag::Action_Ambient_SharpWeapon);
    
    default ForbiddenCharacterTagsSpeaker.AddTag(GameplayTag::Species_Creature_Demon);

    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Full::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_WideTC::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

    //SUBCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_ExtraWide::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    //SPEAK
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium::StaticClass();
    default PossibleTransitions.Last().Weight = 90.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 90.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUp_Orc_NH::StaticClass();
    default PossibleTransitions.Last().Weight = 90.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHigh::StaticClass();    
    default PossibleTransitions.Last().Weight = 90.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHigh_Orc::StaticClass();    
    default PossibleTransitions.Last().Weight = 90.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHigh_Orc_NH::StaticClass();    
    default PossibleTransitions.Last().Weight = 90.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHighExtra::StaticClass();    
    default PossibleTransitions.Last().Weight = 90.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHighExtra_Orc::StaticClass();    
    default PossibleTransitions.Last().Weight = 90.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHighExtra_Orc_NH::StaticClass();    
    default PossibleTransitions.Last().Weight = 90.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Flat::StaticClass();
    default PossibleTransitions.Last().Weight = 25.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_FlatHigh::StaticClass();
    default PossibleTransitions.Last().Weight = 25.0f;


//// Default Wide /////  

    default LightingParameters = LightingPresets::WideShot();

   
    
    
}
//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________





class UConversationPreset_TwoShot_Wide : UConversationCameraPresetCenterOffset
{
    default PresetName = n"TWO SHOT WIDE";

    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::None;
    default FocusMode = EConversationCameraFocusMode::Speaker;

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Topic_Speak);

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;
    default bNeverUseForReverseShot = true;

    default InitialChoiceWeight = 100.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.f, 2.3f);
    default CameraFoVCurve.AddValueAt(0.f, 50.f);
    default CameraFocalLengthCurve.AddValueAt(0.f, 35.f);

    default CenterPositionCurve.AddVectorAt(0.f, FVector(88.365089f, -591.054749f, -74.756317f));
    default CenterRotationCurve.AddRotatorAt(0.f, FRotator(2.147805f, -262.399811f, 0.128112f));

    default AnimSequenceName = n"CameraBreathWIDE";
    default CameraModifiers.Add(UDirectionInputModifier::StaticClass());

    default MaxHeightDifference = 150.0f;     
    
    default MinDistance = 38.0f; 
    default MaxDistance = 485.0f;  

    default ForbiddenCharacterTagsSpeaker.AddTag(GameplayTag::Species_Creature_Demon);


    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_CLOSE::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_LONG::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_HIGH_LONG::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_HIGH::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_CLOSE_HIGH::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHigh::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHigh_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHighExtra::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHighExtra_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_WideTC::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

    //SUBCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy_500::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy_500_LONG::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_CowboyHigh::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass =UConversationPreset_TwoShot_CowboyHighExtra::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_CowboyTC::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

    //SPEAK
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_ORC_NH::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_Orc_HIGH::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_ORC_NH_HIGH::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_Orc_NH::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHigh::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_HIGH::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHigh_Orc::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHigh_Orc_NH::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;


    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHighExtra::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHighExtra_Orc::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHighExtra_Orc_NH::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;


//// Default Wide /////  


    default LightingParameters = LightingPresets::WideShot();

    
}
//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________








class UConversationPreset_TwoShot_ExtraFull : UConversationCameraPresetCenterOffset
{
    default PresetName = n"TWO SHOT EXTRA FULL";

    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::None;
    default FocusMode = EConversationCameraFocusMode::Speaker;

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Topic_Speak);

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;
    default bNeverUseForReverseShot = true;

    default InitialChoiceWeight = 100.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.f, 4.f);
    default CameraFoVCurve.AddValueAt(0.f, 90.f);
    default CameraFocalLengthCurve.AddValueAt(0.f, 40.f);
    
    default CenterPositionCurve.AddVectorAt(0.f, FVector(345.047516f, -599.777893f, -108.161819f));
    default CenterRotationCurve.AddRotatorAt(0.f, FRotator(6.443846f, -240.528351f, 0.028058f));

    default AnimSequenceName = n"CameraBreathWIDE";
    default CameraModifiers.Add(UDirectionInputModifier::StaticClass());

    default MaxHeightDifference = 180.0f;

    default MinDistance = 38.0f; 
    default MaxDistance = 605.0f;  

    default ForbiddenTagsSpeakerAndListener.AddTag(GameplayTag::Species_Creature_Demon);


    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_CLOSE::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_LONG::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_HIGH_LONG::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_HIGH::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_CLOSE_HIGH::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHigh::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHigh_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHighExtra::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHighExtra_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_WideTC::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

    //SUBCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy_500::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy_500_LONG::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_CowboyHigh::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass =UConversationPreset_TwoShot_CowboyHighExtra::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_CowboyTC::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

    //SPEAK
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_ORC_NH::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_Orc_HIGH::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_ORC_NH_HIGH::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_Orc_NH::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHigh::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_HIGH::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHigh_Orc::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHigh_Orc_NH::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHighExtra::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHighExtra_Orc::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHighExtra_Orc_NH::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Flat::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::DuringMonolog;
    default PossibleTransitions.Last().Weight = 25.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_FlatHigh::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::DuringMonolog;
    default PossibleTransitions.Last().Weight = 25.0f;



//// Default Wide Diagonal  /////  

   default LightingParameters = LightingPresets::WideShot();

    default LightingParameters.KeyLightParam.LightPos.AddVectorAt(0.0f, FVector(75.04361f, -271.275513f, 132.027939f));
    default LightingParameters.KeyLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-41.739227f, 78.336235f, 0.0f));
    default LightingParameters.KeyLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyLightParam.SourceHeight = 125.f;
    default LightingParameters.KeyLightParam.AttenuationRadius = 600.f;

    default LightingParameters.RimLightParam.LightPos.AddVectorAt(0.0f, FVector(-153.86528f, 397.966187f, 47.730236f));
    default LightingParameters.RimLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-14.703367f, -85.326378f, 0.762405f));
    default LightingParameters.RimLightParam.SourceWidth = 250.f;
    default LightingParameters.RimLightParam.SourceHeight = 128.f;
    default LightingParameters.RimLightParam.AttenuationRadius = 550.f;

    default LightingParameters.KeyReverseLightParam.LightPos.AddVectorAt(0.0f, FVector(129.892258f, 260.328705f, 149.683105f));
    default LightingParameters.KeyReverseLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-46.318157f, -111.255646f, 0.037285f));
    default LightingParameters.KeyReverseLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyReverseLightParam.SourceHeight = 125.f;
    default LightingParameters.KeyReverseLightParam.AttenuationRadius = 650.f;

    default LightingParameters.RimReverseLightParam.LightPos.AddVectorAt(0.0f, FVector(75.630623f, -376.245514f, 13.033268f));
    default LightingParameters.RimReverseLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-29.231775f, 86.614624f, 0.0f));
    default LightingParameters.RimReverseLightParam.SourceWidth = 250.f;
    default LightingParameters.RimReverseLightParam.SourceHeight = 125.f;
    default LightingParameters.RimReverseLightParam.AttenuationRadius = 550.f;
}

//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________




class UConversationPreset_TwoShot_Full : UConversationCameraPresetCenterOffset
{
    default PresetName = n"TWO SHOT FULL";
    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::None;
    default FocusMode = EConversationCameraFocusMode::Speaker;

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_TopicChoice);

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 100.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.f, 1.8f);
    default CameraFoVCurve.AddValueAt(0.f, 90.f);
    default CameraFocalLengthCurve.AddValueAt(0.f, 33.f);
    
    default CenterPositionCurve.AddVectorAt(0.f, FVector(282.974701f, -350.56955f, -62.475258f));
    default CenterRotationCurve.AddRotatorAt(0.f, FRotator(1.215468f, -231.833038f, -0.009254f));

    default AnimSequenceName = n"CameraBreathWIDE";

    default MaxHeightDifference = 135.0f;

    default MinDistance = 38.0f; 
    default MaxDistance = 400.0f;  

    default ForbiddenCharacterTagsSpeaker.AddTag(GameplayTag::Species_Creature_Demon);


    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Full::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    //SUBCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_ExtraWide::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    //SPEAK
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium::StaticClass();
    default PossibleTransitions.Last().Weight = 90.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 90.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUp_Orc_NH::StaticClass();
    default PossibleTransitions.Last().Weight = 90.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHigh::StaticClass();    
    default PossibleTransitions.Last().Weight = 90.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHigh_Orc::StaticClass();    
    default PossibleTransitions.Last().Weight = 90.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHigh_Orc_NH::StaticClass();    
    default PossibleTransitions.Last().Weight = 90.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHighExtra::StaticClass();    
    default PossibleTransitions.Last().Weight = 90.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHighExtra_Orc::StaticClass();    
    default PossibleTransitions.Last().Weight = 90.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHighExtra_Orc_NH::StaticClass();    
    default PossibleTransitions.Last().Weight = 90.0f;


//// Default Wide Diagonal  /////  

   default LightingParameters = LightingPresets::WideShot();

    default LightingParameters.KeyLightParam.LightPos.AddVectorAt(0.0f, FVector(75.04361f, -271.275513f, 132.027939f));
    default LightingParameters.KeyLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-41.739227f, 78.336235f, 0.0f));
    default LightingParameters.KeyLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyLightParam.SourceHeight = 125.f;
    default LightingParameters.KeyLightParam.AttenuationRadius = 600.f;

    default LightingParameters.RimLightParam.LightPos.AddVectorAt(0.0f, FVector(-153.86528f, 397.966187f, 47.730236f));
    default LightingParameters.RimLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-14.703367f, -85.326378f, 0.762405f));
    default LightingParameters.RimLightParam.SourceWidth = 250.f;
    default LightingParameters.RimLightParam.SourceHeight = 128.f;
    default LightingParameters.RimLightParam.AttenuationRadius = 550.f;

    default LightingParameters.KeyReverseLightParam.LightPos.AddVectorAt(0.0f, FVector(129.892258f, 260.328705f, 149.683105f));
    default LightingParameters.KeyReverseLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-46.318157f, -111.255646f, 0.037285f));
    default LightingParameters.KeyReverseLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyReverseLightParam.SourceHeight = 125.f;
    default LightingParameters.KeyReverseLightParam.AttenuationRadius = 650.f;

    default LightingParameters.RimReverseLightParam.LightPos.AddVectorAt(0.0f, FVector(75.630623f, -376.245514f, 13.033268f));
    default LightingParameters.RimReverseLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-29.231775f, 86.614624f, 0.0f));
    default LightingParameters.RimReverseLightParam.SourceWidth = 250.f;
    default LightingParameters.RimReverseLightParam.SourceHeight = 125.f;
    default LightingParameters.RimReverseLightParam.AttenuationRadius = 550.f;
}



class UConversationPreset_TwoShot_Flat : UConversationCameraPresetCenterOffset
{
    default PresetName = n"TWO SHOT FLAT";
    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::None;
    default FocusMode = EConversationCameraFocusMode::Speaker;

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Topic_Speak);

    default PitchAdjustTarget = EConversationCameraFocusTarget::Middle;

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;
    default bNeverUseForReverseShot = true;

    default InitialChoiceWeight = 100.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.f, 3.5f);
    default CameraFoVCurve.AddValueAt(0.f, 90.f);
    default CameraFocalLengthCurve.AddValueAt(0.f, 25.f);
    
    default CenterPositionCurve.AddVectorAt(0.f, FVector(15.403484f, -173.172302f, -18.887245f));
    default CenterRotationCurve.AddRotatorAt(0.f, FRotator(0.f, -265.351501f, 0.f));

    default AnimSequenceName = n"CameraBreathWIDE";
    default CameraModifiers.Add(UDirectionInputModifier::StaticClass());

    default MaxHeightDifference = 40.0f;

    default MinDistance = 33.0f; 
    default MaxDistance = 143.0f; 

    default ForbiddenTagsSpeakerAndListener.AddTag(GameplayTag::Species_Creature_Demon);
   

    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHigh::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHigh_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHighExtra::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHighExtra_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_WideTC::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

    //SUBCHOICE

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Full::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_CowboyHigh::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass =UConversationPreset_TwoShot_CowboyHighExtra::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_CowboyTC::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

    //SPEAK

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_CloseUp::StaticClass();
    default PossibleTransitions.Last().Weight = 50.0f;
    

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium::StaticClass();
    default PossibleTransitions.Last().Weight = 65.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 65.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_Orc_NH::StaticClass();
    default PossibleTransitions.Last().Weight = 65.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHigh::StaticClass();    
    default PossibleTransitions.Last().Weight = 65.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHigh_Orc::StaticClass();    
    default PossibleTransitions.Last().Weight = 65.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHigh_Orc_NH::StaticClass();    
    default PossibleTransitions.Last().Weight = 65.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHighExtra::StaticClass();    
    default PossibleTransitions.Last().Weight = 65.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHighExtra_Orc::StaticClass();    
    default PossibleTransitions.Last().Weight = 65.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHighExtra_Orc_NH::StaticClass();    
    default PossibleTransitions.Last().Weight = 65.0f;


    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUp_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 55.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUp_Orc_NH::StaticClass();
    default PossibleTransitions.Last().Weight = 55.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHigh_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 55.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHigh_Orc_NH::StaticClass();
    default PossibleTransitions.Last().Weight = 55.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHighExtra_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 55.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHighExtra_Orc_NH::StaticClass();
    default PossibleTransitions.Last().Weight = 55.0f;


   



    

    default LightingParameters = LightingPresets::CloseShot();

    default LightingParameters.KeyLightParam.LightPos.AddVectorAt(0.f, FVector(56.831142f, -157.492325f, 74.333717f));
    default LightingParameters.KeyLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-49.302364f, 96.974464f, 1.348915f));
    default LightingParameters.KeyLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyLightParam.SourceHeight = 128.f;
    default LightingParameters.KeyLightParam.AttenuationRadius = 350.f;

    default LightingParameters.RimLightParam.LightPos.AddVectorAt(0.f, FVector(-20.494322f, 184.975418f, 40.464062f));
    default LightingParameters.RimLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-40.599983f, -90.936783f, 0.0f));
    default LightingParameters.RimLightParam.SourceWidth = 100.f;
    default LightingParameters.RimLightParam.SourceHeight = 100.f;
    default LightingParameters.RimLightParam.AttenuationRadius = 300.f;

    default LightingParameters.KeyReverseLightParam.LightPos.AddVectorAt(0.f, FVector(102.256836f, 175.313599f, 71.941345f));
    default LightingParameters.KeyReverseLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-49.081566f, -108.808128f, 2.872869f));
    default LightingParameters.KeyReverseLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyReverseLightParam.SourceHeight = 128.f;
    default LightingParameters.KeyReverseLightParam.AttenuationRadius = 320.f;

    default LightingParameters.RimReverseLightParam.LightPos.AddVectorAt(0.f, FVector(-101.270424f, -171.74437f, 39.618412f));
    default LightingParameters.RimReverseLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-39.400017f, 91.884262f, 0.0f));
    default LightingParameters.RimReverseLightParam.SourceWidth = 128.f;
    default LightingParameters.RimReverseLightParam.SourceHeight = 128.f;
    default LightingParameters.RimReverseLightParam.AttenuationRadius = 300.f;
}


//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________




class UConversationPreset_TwoShot_FlatHigh : UConversationCameraPresetCenterOffset
{
    default PresetName = n"TWO SHOT FLAT HIGH";
    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::None;
    default FocusMode = EConversationCameraFocusMode::Speaker;

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Topic_Speak);

    default PitchAdjustTarget = EConversationCameraFocusTarget::Middle;

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;
    default bNeverUseForReverseShot = true;

    default InitialChoiceWeight = 100.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.f, 2.5f);
    default CameraFoVCurve.AddValueAt(0.f, 90.f);
    default CameraFocalLengthCurve.AddValueAt(0.f, 25.f);
    
    default CenterPositionCurve.AddVectorAt(0.f, FVector(15.403484f, -173.172302f, -31.887245f));
    default CenterRotationCurve.AddRotatorAt(0.f, FRotator(1.f, -265.351501f, 0.f));

    default AnimSequenceName = n"CameraBreathWIDE";
    default CameraModifiers.Add(UDirectionInputModifier::StaticClass());

    default MinHeightDifference = 40.01f;
    default MaxHeightDifference = 65.0f;

    default MinDistance = 33.0f; 
    default MaxDistance = 143.0f;  

    default ForbiddenTagsSpeakerAndListener.AddTag(GameplayTag::Species_Creature_Demon);
    

    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHigh::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHigh_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHighExtra::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHighExtra_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_WideTC::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

    //SUBCHOICE

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Full::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_CowboyHigh::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass =UConversationPreset_TwoShot_CowboyHighExtra::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_CowboyTC::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

    //SPEAK
     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_CloseUp::StaticClass();
    default PossibleTransitions.Last().Weight = 45.0f;
    

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium::StaticClass();
    default PossibleTransitions.Last().Weight = 65.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 65.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_Orc_NH::StaticClass();
    default PossibleTransitions.Last().Weight = 65.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHigh::StaticClass();    
    default PossibleTransitions.Last().Weight = 65.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHigh_Orc::StaticClass();    
    default PossibleTransitions.Last().Weight = 65.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHigh_Orc_NH::StaticClass();    
    default PossibleTransitions.Last().Weight = 65.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHighExtra::StaticClass();    
    default PossibleTransitions.Last().Weight = 65.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHighExtra_Orc::StaticClass();    
    default PossibleTransitions.Last().Weight = 65.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHighExtra_Orc_NH::StaticClass();    
    default PossibleTransitions.Last().Weight = 65.0f;


    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUp_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 55.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUp_Orc_NH::StaticClass();
    default PossibleTransitions.Last().Weight = 55.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHigh_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 55.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHigh_Orc_NH::StaticClass();
    default PossibleTransitions.Last().Weight = 55.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHighExtra_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 55.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHighExtra_Orc_NH::StaticClass();
    default PossibleTransitions.Last().Weight = 55.0f;


    

    

     default LightingParameters = LightingPresets::CloseShot();

    default LightingParameters.KeyLightParam.LightPos.AddVectorAt(0.f, FVector(56.831142f, -157.492325f, 74.333717f));
    default LightingParameters.KeyLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-49.302364f, 96.974464f, 1.348915f));
    default LightingParameters.KeyLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyLightParam.SourceHeight = 128.f;
    default LightingParameters.KeyLightParam.AttenuationRadius = 350.f;

    default LightingParameters.RimLightParam.LightPos.AddVectorAt(0.f, FVector(-20.494322f, 184.975418f, 40.464062f));
    default LightingParameters.RimLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-40.599983f, -90.936783f, 0.0f));
    default LightingParameters.RimLightParam.SourceWidth = 100.f;
    default LightingParameters.RimLightParam.SourceHeight = 100.f;
    default LightingParameters.RimLightParam.AttenuationRadius = 300.f;

    default LightingParameters.KeyReverseLightParam.LightPos.AddVectorAt(0.f, FVector(102.256836f, 175.313599f, 71.941345f));
    default LightingParameters.KeyReverseLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-49.081566f, -108.808128f, 2.872869f));
    default LightingParameters.KeyReverseLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyReverseLightParam.SourceHeight = 128.f;
    default LightingParameters.KeyReverseLightParam.AttenuationRadius = 320.f;

    default LightingParameters.RimReverseLightParam.LightPos.AddVectorAt(0.f, FVector(-101.270424f, -171.74437f, 39.618412f));
    default LightingParameters.RimReverseLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-39.400017f, 91.884262f, 0.0f));
    default LightingParameters.RimReverseLightParam.SourceWidth = 128.f;
    default LightingParameters.RimReverseLightParam.SourceHeight = 128.f;
    default LightingParameters.RimReverseLightParam.AttenuationRadius = 300.f;
}


//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________



class UConversationPreset_TwoShot_Cowboy : UConversationCameraPresetListenerOffset
{
    default PresetName = n"TWO SHOT COWBOY";
    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::None;
    default FocusMode = EConversationCameraFocusMode::Speaker;

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_SubChoice);

    
    default PitchAdjustTarget = EConversationCameraFocusTarget::Speaker;

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 100.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.0, 8.f);
    default CameraFoVCurve.AddValueAt(0.0, 90.000000);
    default CameraFocalLengthCurve.AddValueAt(0.0, 90.000000);

    default ListenerPositionOffsetCurve.AddVectorAt(0.f, FVector(-329.487518f, 411.808563f, -38.776215f));
    default ListenerRotationOffsetCurve.AddRotatorAt(0.f, FRotator(1.474397f, -47.44809f, -0.15648f));

    default AnimSequenceName = n"CameraBreathWIDE";

   

    default MaxHeightDifference = 30.0f;

    default MinDistance = 38.0f; 
    default MaxDistance = 173.0f;     

    default ForbiddenCharacterTagsSpeaker.AddTag(GameplayTag::Species_Creature_Demon);


    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_WideTC::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

    //SUBCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    //SPEAK
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHigh::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_Orc::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHigh_Orc::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUp_Orc_NH::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHigh_Orc_NH::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHighExtra_Orc_NH::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;
        

    ///default close entero diagonal//////

     default LightingParameters = LightingPresets::CloseShot();

    default LightingParameters.KeyLightParam.LightPos.AddVectorAt(0.0f, FVector(-13.216854f, -175.818542f, 87.633041f));
    default LightingParameters.KeyLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-48.218857f, 85.199112f, 4.153944f));
    default LightingParameters.KeyLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyLightParam.SourceHeight = 128.f;
    default LightingParameters.KeyLightParam.AttenuationRadius = 450.f;

    default LightingParameters.RimLightParam.LightPos.AddVectorAt(0.0f, FVector(-62.477619f, 208.868301f, 28.132442f));
    default LightingParameters.RimLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-51.765873f, -110.229309f, 0.0f));
    default LightingParameters.RimLightParam.SourceWidth = 250.f;
    default LightingParameters.RimLightParam.SourceHeight = 128.f;
    default LightingParameters.RimLightParam.AttenuationRadius = 350.f;

    default LightingParameters.KeyReverseLightParam.LightPos.AddVectorAt(0.f, FVector(83.26001f, 170.242966f, 103.36821f));
    default LightingParameters.KeyReverseLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-70.353355f, -95.68882f, 0.0f));     
    default LightingParameters.KeyReverseLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyReverseLightParam.SourceHeight = 128.f;
    default LightingParameters.KeyReverseLightParam.AttenuationRadius = 300.f;            

    default LightingParameters.RimReverseLightParam.LightPos.AddVectorAt(0.f, FVector(-5.333393f, -189.08049f, 23.821426f));
    default LightingParameters.RimReverseLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-22.700504f, 82.536758f, 0.0f));
    default LightingParameters.RimReverseLightParam.SourceWidth = 128.f;
    default LightingParameters.RimReverseLightParam.SourceHeight = 128.f;
    default LightingParameters.RimReverseLightParam.AttenuationRadius = 300.f;
}


//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________




class UConversationPreset_TwoShot_CowboyHigh : UConversationCameraPresetListenerOffset
{
    default PresetName = n"TWO SHOT COWBOY HIGH";
    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::None;
    default FocusMode = EConversationCameraFocusMode::Speaker;

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_SubChoice);

    default PitchAdjustTarget = EConversationCameraFocusTarget::Speaker;

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 100.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.0, 8.f);
    default CameraFoVCurve.AddValueAt(0.0, 90.000000);
    default CameraFocalLengthCurve.AddValueAt(0.0, 90.000000);

    default ListenerPositionOffsetCurve.AddVectorAt(0.f, FVector(-329.487518f, 411.808563f, -58.776215f));
    default ListenerRotationOffsetCurve.AddRotatorAt(0.f, FRotator(2.474397f, -47.44809f, -0.15648f));

    default AnimSequenceName = n"CameraBreathWIDE";

    default MinHeightDifference = 30.01f;
    default MaxHeightDifference = 50.0f;

    default MinDistance = 38.0f; 
    default MaxDistance = 173.0f;     

    default ForbiddenCharacterTagsSpeaker.AddTag(GameplayTag::Species_Creature_Demon);


    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHigh::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHigh_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHighExtra::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHighExtra_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_WideTC::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

    //SUBCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_CowboyHigh::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    //SPEAK
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_Orc::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUp_Orc_NH::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHigh::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHigh_Orc::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHigh_Orc_NH::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHighExtra::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHighExtra_Orc::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHighExtra_Orc_NH::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;


    

   ///default close entero diagonal//////

     default LightingParameters = LightingPresets::CloseShot();

    default LightingParameters.KeyLightParam.LightPos.AddVectorAt(0.0f, FVector(-13.216854f, -175.818542f, 87.633041f));
    default LightingParameters.KeyLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-48.218857f, 85.199112f, 4.153944f));
    default LightingParameters.KeyLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyLightParam.SourceHeight = 128.f;
    default LightingParameters.KeyLightParam.AttenuationRadius = 450.f;

    default LightingParameters.RimLightParam.LightPos.AddVectorAt(0.0f, FVector(-62.477619f, 208.868301f, 28.132442f));
    default LightingParameters.RimLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-51.765873f, -110.229309f, 0.0f));
    default LightingParameters.RimLightParam.SourceWidth = 250.f;
    default LightingParameters.RimLightParam.SourceHeight = 128.f;
    default LightingParameters.RimLightParam.AttenuationRadius = 350.f;

    default LightingParameters.KeyReverseLightParam.LightPos.AddVectorAt(0.f, FVector(83.26001f, 170.242966f, 103.36821f));
    default LightingParameters.KeyReverseLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-70.353355f, -95.68882f, 0.0f));     
    default LightingParameters.KeyReverseLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyReverseLightParam.SourceHeight = 128.f;
    default LightingParameters.KeyReverseLightParam.AttenuationRadius = 300.f;            

    default LightingParameters.RimReverseLightParam.LightPos.AddVectorAt(0.f, FVector(-5.333393f, -189.08049f, 23.821426f));
    default LightingParameters.RimReverseLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-22.700504f, 82.536758f, 0.0f));
    default LightingParameters.RimReverseLightParam.SourceWidth = 128.f;
    default LightingParameters.RimReverseLightParam.SourceHeight = 128.f;
    default LightingParameters.RimReverseLightParam.AttenuationRadius = 300.f;
}


//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________




class UConversationPreset_TwoShot_CowboyHighExtra : UConversationCameraPresetListenerOffset
{
    default PresetName =  n"TWO SHOT COWBOY HIGH EXTRA";
    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::None;
    default FocusMode = EConversationCameraFocusMode::Speaker;

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_SubChoice);

    default PitchAdjustTarget = EConversationCameraFocusTarget::Speaker;

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 100.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.0, 8.f);
    default CameraFoVCurve.AddValueAt(0.0, 90.000000);
    default CameraFocalLengthCurve.AddValueAt(0.0, 90.000000);

    default ListenerPositionOffsetCurve.AddVectorAt(0.f, FVector(-329.487518f, 411.808563f, -80.776215f));
    default ListenerRotationOffsetCurve.AddRotatorAt(0.f, FRotator(4.474397f, -47.44809f, -0.15648f));

    default AnimSequenceName = n"CameraBreathWIDE";

    default MinHeightDifference = 50.01f;
    default MaxHeightDifference = 80.0f;

    default MinDistance = 38.0f; 
    default MaxDistance = 173.0f;     

    default ForbiddenCharacterTagsSpeaker.AddTag(GameplayTag::Species_Creature_Demon);


    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHighExtra::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHighExtra_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_WideTC::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

    //SUBCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass =UConversationPreset_TwoShot_CowboyHighExtra::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    //SPEAK
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_Orc::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUp_Orc_NH::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHigh::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHigh_Orc::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHigh_Orc_NH::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHighExtra::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHighExtra_Orc::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHighExtra_Orc_NH::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;
 

    

    ///default close entero diagonal//////

     default LightingParameters = LightingPresets::CloseShot();

    default LightingParameters.KeyLightParam.LightPos.AddVectorAt(0.0f, FVector(-13.216854f, -175.818542f, 87.633041f));
    default LightingParameters.KeyLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-48.218857f, 85.199112f, 4.153944f));
    default LightingParameters.KeyLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyLightParam.SourceHeight = 128.f;
    default LightingParameters.KeyLightParam.AttenuationRadius = 450.f;

    default LightingParameters.RimLightParam.LightPos.AddVectorAt(0.0f, FVector(-62.477619f, 208.868301f, 28.132442f));
    default LightingParameters.RimLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-51.765873f, -110.229309f, 0.0f));
    default LightingParameters.RimLightParam.SourceWidth = 250.f;
    default LightingParameters.RimLightParam.SourceHeight = 128.f;
    default LightingParameters.RimLightParam.AttenuationRadius = 350.f;

    default LightingParameters.KeyReverseLightParam.LightPos.AddVectorAt(0.f, FVector(83.26001f, 170.242966f, 103.36821f));
    default LightingParameters.KeyReverseLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-70.353355f, -95.68882f, 0.0f));     
    default LightingParameters.KeyReverseLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyReverseLightParam.SourceHeight = 128.f;
    default LightingParameters.KeyReverseLightParam.AttenuationRadius = 300.f;            

    default LightingParameters.RimReverseLightParam.LightPos.AddVectorAt(0.f, FVector(-5.333393f, -189.08049f, 23.821426f));
    default LightingParameters.RimReverseLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-22.700504f, 82.536758f, 0.0f));
    default LightingParameters.RimReverseLightParam.SourceWidth = 128.f;
    default LightingParameters.RimReverseLightParam.SourceHeight = 128.f;
    default LightingParameters.RimReverseLightParam.AttenuationRadius = 300.f;
}



//______________________________________________________________________________________________________________________________________________________________________
//____________________________________________________________________________________________________________________________________________




class UConversationPreset_TwoShot_CowboyTC : UConversationCameraPresetListenerOffset
{
    default PresetName = n"TWO SHOT COWBOY TC";
    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::None;
    default FocusMode = EConversationCameraFocusMode::Speaker;
    
   
    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_SubChoice);

   default PitchAdjustTarget = EConversationCameraFocusTarget::Speaker;

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 1.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.f, 5.f);
    default CameraFoVCurve.AddValueAt(0.f, 90.f);
    default CameraFocalLengthCurve.AddValueAt(0.f, 50.f);
    
    default ListenerPositionOffsetCurve.AddVectorAt(0.f, FVector(-158.58667f, 190.899582f, -50.320389f));
    default ListenerRotationOffsetCurve.AddRotatorAt(0.f, FRotator(4.346519f, -41.677063f, 0.f));

    default AnimSequenceName = n"CameraBreathWIDE";
    
    default MaxHeightDifference = 110.0f;

    default MinDistance = 38.0f; 
    default MaxDistance = 220.0f;   

    default ForbiddenCharacterTagsSpeaker.AddTag(GameplayTag::Species_Creature_Demon);      


    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHigh::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHigh_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHighExtra::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHighExtra_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_WideTC::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

    //SUBCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_CowboyHigh::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass =UConversationPreset_TwoShot_CowboyHighExtra::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_CowboyTC::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    //SPEAK
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_Orc::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUp_Orc_NH::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHigh::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHigh_Orc::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHigh_Orc_NH::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHighExtra::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHighExtra_Orc::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHighExtra_Orc_NH::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;


    
  ///default close entero diagonal//////

     default LightingParameters = LightingPresets::CloseShot();

    default LightingParameters.KeyLightParam.LightPos.AddVectorAt(0.0f, FVector(-13.216854f, -175.818542f, 87.633041f));
    default LightingParameters.KeyLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-48.218857f, 85.199112f, 4.153944f));
    default LightingParameters.KeyLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyLightParam.SourceHeight = 128.f;
    default LightingParameters.KeyLightParam.AttenuationRadius = 450.f;

    default LightingParameters.RimLightParam.LightPos.AddVectorAt(0.0f, FVector(-62.477619f, 208.868301f, 28.132442f));
    default LightingParameters.RimLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-51.765873f, -110.229309f, 0.0f));
    default LightingParameters.RimLightParam.SourceWidth = 250.f;
    default LightingParameters.RimLightParam.SourceHeight = 128.f;
    default LightingParameters.RimLightParam.AttenuationRadius = 350.f;

    default LightingParameters.KeyReverseLightParam.LightPos.AddVectorAt(0.f, FVector(83.26001f, 170.242966f, 103.36821f));
    default LightingParameters.KeyReverseLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-70.353355f, -95.68882f, 0.0f));     
    default LightingParameters.KeyReverseLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyReverseLightParam.SourceHeight = 128.f;
    default LightingParameters.KeyReverseLightParam.AttenuationRadius = 300.f;            

    default LightingParameters.RimReverseLightParam.LightPos.AddVectorAt(0.f, FVector(-5.333393f, -189.08049f, 23.821426f));
    default LightingParameters.RimReverseLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-22.700504f, 82.536758f, 0.0f));
    default LightingParameters.RimReverseLightParam.SourceWidth = 128.f;
    default LightingParameters.RimReverseLightParam.SourceHeight = 128.f;
    default LightingParameters.RimReverseLightParam.AttenuationRadius = 300.f;
}






class UConversationPreset_WideTC : UConversationCameraPresetListenerOffset
{
    default PresetName = n"WIDE TC";
    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::None;
    default FocusMode = EConversationCameraFocusMode::Speaker;

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_TopicChoice);
    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_SubChoice);

    default PitchAdjustTarget = EConversationCameraFocusTarget::Speaker;
    
    default bAlwaysValid = false;
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 100.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.f, 4.5f);
    default CameraFoVCurve.AddValueAt(0.f, 90.f);
    default CameraFocalLengthCurve.AddValueAt(0.f, 40.f);
    
    default ListenerPositionOffsetCurve.AddVectorAt(0.f, FVector(-145.360916f, 143.413376f, -35.825905f));
    default ListenerRotationOffsetCurve.AddRotatorAt(0.f, FRotator(0.87016f, -36.755611f, 0.030402f));

    default AnimSequenceName = n"CameraBreathWIDE";
     
    default MaxHeightDifference = 95.0f;

    default MinDistance = 38.0f; 
    default MaxDistance = 220.0f;  

    default ForbiddenCharacterTagsSpeaker.AddTag(GameplayTag::Species_Creature_Demon);
  

    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Full::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_WideTC::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

    //SUBCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_ExtraWide::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    //SPEAK
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_Orc::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUp_Orc_NH::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHigh::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHigh_Orc::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHigh_Orc_NH::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;


    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHighExtra::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHighExtra_Orc::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHighExtra_Orc_NH::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium::StaticClass();
    default PossibleTransitions.Last().Weight = 50.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 50.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc_NH::StaticClass();
    default PossibleTransitions.Last().Weight = 50.0f;

    


    

      ///default close entero diagonal//////

     default LightingParameters = LightingPresets::CloseShot();

    default LightingParameters.KeyLightParam.LightPos.AddVectorAt(0.0f, FVector(-13.216854f, -175.818542f, 87.633041f));
    default LightingParameters.KeyLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-48.218857f, 85.199112f, 4.153944f));
    default LightingParameters.KeyLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyLightParam.SourceHeight = 128.f;
    default LightingParameters.KeyLightParam.AttenuationRadius = 450.f;

    default LightingParameters.RimLightParam.LightPos.AddVectorAt(0.0f, FVector(-62.477619f, 208.868301f, 28.132442f));
    default LightingParameters.RimLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-51.765873f, -110.229309f, 0.0f));
    default LightingParameters.RimLightParam.SourceWidth = 250.f;
    default LightingParameters.RimLightParam.SourceHeight = 128.f;
    default LightingParameters.RimLightParam.AttenuationRadius = 350.f;

    default LightingParameters.KeyReverseLightParam.LightPos.AddVectorAt(0.f, FVector(83.26001f, 170.242966f, 103.36821f));
    default LightingParameters.KeyReverseLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-70.353355f, -95.68882f, 0.0f));     
    default LightingParameters.KeyReverseLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyReverseLightParam.SourceHeight = 128.f;
    default LightingParameters.KeyReverseLightParam.AttenuationRadius = 300.f;            

    default LightingParameters.RimReverseLightParam.LightPos.AddVectorAt(0.f, FVector(-5.333393f, -189.08049f, 23.821426f));
    default LightingParameters.RimReverseLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-22.700504f, 82.536758f, 0.0f));
    default LightingParameters.RimReverseLightParam.SourceWidth = 128.f;
    default LightingParameters.RimReverseLightParam.SourceHeight = 128.f;
    default LightingParameters.RimReverseLightParam.AttenuationRadius = 300.f;
}



///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////OVER THE SHOULDER SHOTS/////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////




class UConversationPreset_OverTheShoulder_Cowboy : UConversationCameraPresetListenerOffset
{
    default PresetName = n"OVER THE SHOULDER COWBOY";
    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::None;
    default FocusMode = EConversationCameraFocusMode::Speaker;
    

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_TopicChoice_Start);
    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_TopicChoice);

   
    default PitchAdjustTarget = EConversationCameraFocusTarget::Speaker;

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 100.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.0, 10.f);
    default CameraFoVCurve.AddValueAt(0.0, 90.f);
    default CameraFocalLengthCurve.AddValueAt(0.0, 57.f);

    default ListenerPositionOffsetCurve.AddVectorAt(0.f, FVector(-173.391434f, 121.005562f, -14.70159f));
    default ListenerRotationOffsetCurve.AddRotatorAt(0.f, FRotator(-0.876037f, -28.987162f, 0.f));

    default AnimSequenceName = n"CameraBreathWIDE";

    
    default CameraFocusPointOffset = 0.0f;

    default MaxHeightDifference = 40.0f;       
    
    default MinDistance = 43.0f; 
    default MaxDistance = 220.0f;     

    default ForbiddenTagsSpeakerAndListener.AddTag(GameplayTag::Species_Orc);
    default ForbiddenCharacterTagsSpeaker.AddTag(GameplayTag::Species_Creature_Demon);


    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_Orc::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    //SUBCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_CowboyHigh::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass =UConversationPreset_TwoShot_CowboyHighExtra::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_CowboyTC::StaticClass();    
    default PossibleTransitions.Last().Weight = 1.0f;

    //SPEAK
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium::StaticClass();    
    default PossibleTransitions.Last().Weight = 80.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_Orc::StaticClass();    
    default PossibleTransitions.Last().Weight = 80.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUp_Orc_NH::StaticClass();    
    default PossibleTransitions.Last().Weight = 80.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHigh::StaticClass();    
    default PossibleTransitions.Last().Weight = 80.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHigh_Orc::StaticClass();    
    default PossibleTransitions.Last().Weight = 80.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHigh_Orc_NH::StaticClass();    
    default PossibleTransitions.Last().Weight = 80.0f;


    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHighExtra::StaticClass();    
    default PossibleTransitions.Last().Weight = 80.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHighExtra_Orc::StaticClass();    
    default PossibleTransitions.Last().Weight = 80.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHighExtra_Orc_NH::StaticClass();    
    default PossibleTransitions.Last().Weight = 80.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Flat::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::DuringMonolog;    
    default PossibleTransitions.Last().Weight = 30.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_FlatHigh::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::DuringMonolog;    
    default PossibleTransitions.Last().Weight = 30.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc_NH::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

    

    

    default LightingParameters = LightingPresets::CloseShot();

    
}
//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________







class UConversationPreset_OverTheShoulder_CowboyHigh : UConversationCameraPresetListenerOffset
{
    default PresetName = n"OVER THE SHOULDER COWBOY HIGH";
    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::None;
    default FocusMode = EConversationCameraFocusMode::Speaker;
    
      
    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_TopicChoice_Start);
    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_TopicChoice);

    
    default PitchAdjustTarget = EConversationCameraFocusTarget::Speaker;

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 100.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.0, 10.f);
    default CameraFoVCurve.AddValueAt(0.0, 90.f);
    default CameraFocalLengthCurve.AddValueAt(0.0, 57.f);

    default ListenerPositionOffsetCurve.AddVectorAt(0.f, FVector(-173.678268f, 128.005562f, -35.763941f));
    default ListenerRotationOffsetCurve.AddRotatorAt(0.f, FRotator(3.f, -30.515009f, 0.f));
    
    default AnimSequenceName = n"CameraBreathWIDE";

    
    default CameraFocusPointOffset = 0.0f;

    default MinHeightDifference = 40.01f;    
    default MaxHeightDifference = 60.0f;       
    
    default MinDistance = 43.0f; 
    default MaxDistance = 220.0f; 

    default ForbiddenTagsSpeakerAndListener.AddTag(GameplayTag::Species_Orc);
    default ForbiddenCharacterTagsSpeaker.AddTag(GameplayTag::Species_Creature_Demon);


    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHigh::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHigh_Orc::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    //SUBCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_CowboyHigh::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass =UConversationPreset_TwoShot_CowboyHighExtra::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_CowboyTC::StaticClass();    
    default PossibleTransitions.Last().Weight = 1.0f;

    //SPEAK
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHigh::StaticClass();    
    default PossibleTransitions.Last().Weight = 80.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHigh_Orc::StaticClass();    
    default PossibleTransitions.Last().Weight = 80.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHigh_Orc_NH::StaticClass();    
    default PossibleTransitions.Last().Weight = 80.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_FlatHigh::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::DuringMonolog;    
    default PossibleTransitions.Last().Weight = 30.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc_NH::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;
    


    

    default LightingParameters = LightingPresets::CloseShot();

    
}
//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________


class UConversationPreset_OverTheShoulder_CowboyHighExtra : UConversationCameraPresetListenerOffset
{
    default PresetName = n"OVER THE SHOULDER COWBOY HIGH EXTRA";
    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::None;
    default FocusMode = EConversationCameraFocusMode::Speaker;
    
      
    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_TopicChoice_Start);
    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_TopicChoice);

    
    default PitchAdjustTarget = EConversationCameraFocusTarget::Speaker;

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 100.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.0, 10.f);
    default CameraFoVCurve.AddValueAt(0.0, 90.f);
    default CameraFocalLengthCurve.AddValueAt(0.0, 57.f);

    default ListenerPositionOffsetCurve.AddVectorAt(0.f, FVector(-173.678268f, 128.005562f, -67.763941f));
    default ListenerRotationOffsetCurve.AddRotatorAt(0.f, FRotator(9.0f, -30.515009f, 0.f));

    default AnimSequenceName = n"CameraBreathWIDE";

    
    default CameraFocusPointOffset = 0.0f;

    default MinHeightDifference = 60.01f;    
    default MaxHeightDifference = 85.0f;       
    
    default MinDistance = 43.0f; 
    default MaxDistance = 220.0f; 

    default ForbiddenTagsSpeakerAndListener.AddTag(GameplayTag::Species_Orc);
    default ForbiddenCharacterTagsSpeaker.AddTag(GameplayTag::Species_Creature_Demon);


    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHighExtra::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHighExtra_Orc::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    //SUBCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_CowboyHigh::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass =UConversationPreset_TwoShot_CowboyHighExtra::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_CowboyTC::StaticClass();    
    default PossibleTransitions.Last().Weight = 1.0f;

    //SPEAK
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHighExtra::StaticClass();    
    default PossibleTransitions.Last().Weight = 80.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHighExtra_Orc::StaticClass();    
    default PossibleTransitions.Last().Weight = 80.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHighExtra_Orc_NH::StaticClass();    
    default PossibleTransitions.Last().Weight = 80.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_FlatHigh::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::DuringMonolog;    
    default PossibleTransitions.Last().Weight = 30.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc_NH::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;
    

    

    default LightingParameters = LightingPresets::CloseShot();

        
}
//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________


class UConversationPreset_OverTheShoulder_Medium : UConversationCameraPresetListenerOffset
{
    default PresetName = n"OVER THE SHOULDER MEDIUM";

    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;
    default HideMode = EConversationCameraHideMode::HideListenerWeapon;
    default MultiConversationValidity = EConversationMultiParticipantMode::OnlySpeakerListener;


    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Topic_Speak);
    // default AssociatedTags.AddTag(GameplayTag::Action_GiveItem);

    default PitchAdjustTarget = EConversationCameraFocusTarget::Speaker;
    

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 100.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 1.0f;
    default FilmbackPresetName = "35mm VistaVision";
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.f, 13.8f);
    default CameraFoVCurve.AddValueAt(0.0, 90.f);
    default CameraFocalLengthCurve.AddValueAt(0.0, 62.f);
    
    default ListenerPositionOffsetCurve.AddVectorAt(0.f, FVector(-74.380333f, 48.298786f, 1.879274f));
    default ListenerRotationOffsetCurve.AddRotatorAt(0.f, FRotator(-2.213814f, -22.4f, -0.009689f));

    default AnimSequenceName = n"CameraBreathCLOSE";
    default CameraModifiers.Add(UDirectionInputModifier::StaticClass());

    
    default CameraFocusPointOffset = 0.0f;
    
    default MaxHeightDifference = 20.0f;
   
    default MinDistance = 43.0f; 
    default MaxDistance = 193.0f; 

    default ForbiddenTagsSpeakerAndListener.AddTag(GameplayTag::Species_Orc);
    default ForbiddenTagsSpeakerAndListener.AddTag(GameplayTag::Species_Creature_Demon);

    default ForbiddenTagsSpeakerAndListener.AddTag(GameplayTag::Action_Ambient_LeanWall);

    
          

    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Full::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;    

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_WideTC::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

    //SUBCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_ExtraWide::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    //SPEAK

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_CloseUp::StaticClass();
    default PossibleTransitions.Last().Weight = 60.0f;      
    
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 25.0f;  


    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUp::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 80.0f;    

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHigh::StaticClass();  
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog; 
    default PossibleTransitions.Last().Weight = 80.0f; 
    
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 10.0f;   

       
    
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Flat::StaticClass();    
    default PossibleTransitions.Last().Weight = 70.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_FlatHigh::StaticClass();    
    default PossibleTransitions.Last().Weight = 70.0f;   

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Wide::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::DuringMonolog;
    default PossibleTransitions.Last().Weight = 50.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_ExtraFull::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::DuringMonolog;
    default PossibleTransitions.Last().Weight = 35.0f;
    

    

    default LightingParameters = LightingPresets::CloseShot();
}
//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________


class UConversationPreset_OverTheShoulder_MediumHigh : UConversationCameraPresetListenerOffset
{
    default PresetName = n"OVER THE SHOULDER MEDIUM HIGH";
    
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;
    default HideMode = EConversationCameraHideMode::HideListenerWeapon;

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Topic_Speak);

    // default AssociatedTags.AddTag(GameplayTag::Action_GiveItem);

    default PitchAdjustTarget = EConversationCameraFocusTarget::Speaker;
    

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 100.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 1.0f;
    default FilmbackPresetName = "35mm VistaVision";
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.f, 13.8f);
    default CameraFoVCurve.AddValueAt(0.0, 90.f);
    default CameraFocalLengthCurve.AddValueAt(0.0, 62.f);
    
    default ListenerPositionOffsetCurve.AddVectorAt(0.f, FVector(-75.083748f, 65.119026f, -11.874042f));
    default ListenerRotationOffsetCurve.AddRotatorAt(0.f, FRotator(1.5f, -27.502834f, 0.f));  

    default AnimSequenceName = n"CameraBreathCLOSE";
    default CameraModifiers.Add(UDirectionInputModifier::StaticClass());

    
    default CameraFocusPointOffset = 0.0f;
    
    default MinHeightDifference = 20.01f; 
    default MaxHeightDifference = 40.0f;
   
    default MinDistance = 43.0f; 
    default MaxDistance = 183.0f; 

    default ForbiddenTagsSpeakerAndListener.AddTag(GameplayTag::Species_Orc);
    default ForbiddenTagsSpeakerAndListener.AddTag(GameplayTag::Species_Creature_Demon);


    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Full::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHigh::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;    

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_WideTC::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

    //SUBCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_ExtraWide::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    //SPEAK

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_CloseUp::StaticClass();
    default PossibleTransitions.Last().Weight = 60.0f;   
    
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 25.0f;


    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHigh::StaticClass();  
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog; 
    default PossibleTransitions.Last().Weight = 80.0f;  

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHighExtra::StaticClass();  
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog; 
    default PossibleTransitions.Last().Weight = 80.0f;  

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHigh::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 10.0f;   
       

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_FlatHigh::StaticClass();    
    default PossibleTransitions.Last().Weight = 70.0f;
    

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Wide::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::DuringMonolog;
    default PossibleTransitions.Last().Weight = 50.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_ExtraFull::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::DuringMonolog;
    default PossibleTransitions.Last().Weight = 35.0f;

    

    default LightingParameters = LightingPresets::CloseShot();
}
//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________


class UConversationPreset_OverTheShoulder_MediumHighExtra : UConversationCameraPresetListenerOffset
{
    default PresetName = n"OVER THE SHOULDER MEDIUM HIGH EXTRA";
    
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;
    default HideMode = EConversationCameraHideMode::HideListenerWeapon;

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Topic_Speak);

    // default AssociatedTags.AddTag(GameplayTag::Action_GiveItem);

    default PitchAdjustTarget = EConversationCameraFocusTarget::Speaker;    

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 100.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 1.0f;
    default FilmbackPresetName = "35mm VistaVision";
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.f, 13.8f);
    default CameraFoVCurve.AddValueAt(0.0, 90.f);
    default CameraFocalLengthCurve.AddValueAt(0.0, 62.f);
    
    default ListenerPositionOffsetCurve.AddVectorAt(0.f, FVector(-75.f, 64.119026f, -19.874042f));
    default ListenerRotationOffsetCurve.AddRotatorAt(0.f, FRotator(3.9f, -27.502834f, 0.f));    

    default AnimSequenceName = n"CameraBreathCLOSE";
    default CameraModifiers.Add(UDirectionInputModifier::StaticClass());

    
    default CameraFocusPointOffset = 0.0f;
    
    default MinHeightDifference = 40.01f; 
    default MaxHeightDifference = 60.0f;
   
    default MinDistance = 43.0f; 
    default MaxDistance = 193.0f; 

    default ForbiddenTagsSpeakerAndListener.AddTag(GameplayTag::Species_Orc);
    default ForbiddenTagsSpeakerAndListener.AddTag(GameplayTag::Species_Creature_Demon);
          

    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Full::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHighExtra::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;    

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_WideTC::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

    //SUBCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_ExtraWide::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    //SPEAK

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_CloseUp::StaticClass();
    default PossibleTransitions.Last().Weight = 60.0f;    
    

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 25.0f;  

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHigh::StaticClass();  
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog; 
    default PossibleTransitions.Last().Weight = 80.0f;  

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHighExtra::StaticClass();  
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog; 
    default PossibleTransitions.Last().Weight = 80.0f;  

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHighExtra::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 10.0f; 



    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_FlatHigh::StaticClass();    
    default PossibleTransitions.Last().Weight = 70.0f;

       

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Wide::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::DuringMonolog;
    default PossibleTransitions.Last().Weight = 50.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_ExtraFull::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::DuringMonolog;
    default PossibleTransitions.Last().Weight = 35.0f;


    

    default LightingParameters = LightingPresets::CloseShot();
}
//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________





class UConversationPreset_OverTheShoulder_CloseUp : UConversationCameraPresetListenerOffset
{
    default PresetName = n"OVER THE SHOULDER CLOSE UP";
    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;
    default HideMode = EConversationCameraHideMode::HideListenerWeapon;

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Topic_Speak);

    default PitchAdjustTarget = EConversationCameraFocusTarget::Speaker;

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 100.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 1.0f;
    default FilmbackPresetName = "35mm VistaVision";
    default CropSettings.AspectRatio = 1.777778f;
    

    default CameraApertureCurve.AddValueAt(0.f, 20.f);
    default CameraFoVCurve.AddValueAt(0.f, 90.f);
    default CameraFocalLengthCurve.AddValueAt(0.f, 90.f);
    

    default ListenerPositionOffsetCurve.AddVectorAt(0.0f, FVector(-95.288635f, 48.370033f, -2.391936f));
    default ListenerRotationOffsetCurve.AddRotatorAt(0.0f, FRotator(0.749639f, -17.700441f, -0.078874f));

    default AnimSequenceName = n"CameraBreathCLOSE";
    default CameraModifiers.Add(UDirectionInputModifier::StaticClass());

    // default CameraFocusBone = "face_C_noseTip";
    default CameraFocusPointOffset = 0.0f;

    default MaxHeightDifference = 15.0f;      

    default MinDistance = 43.0f; 
    default MaxDistance = 163.0f;   

    default ForbiddenTagsSpeakerAndListener.AddTag(GameplayTag::Species_Orc);
    default ForbiddenTagsSpeakerAndListener.AddTag(GameplayTag::Species_Creature_Demon);
         

    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;    

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_CowboyTC::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_WideTC::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

    //SUBCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    //SPEAK

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 80.0f;      

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUp::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 40.0f;
    

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium::StaticClass();    
    default PossibleTransitions.Last().Weight = 70.0f;   


    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Flat::StaticClass();    
    default PossibleTransitions.Last().Weight = 70.0f;

       

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Wide::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::DuringMonolog;
    default PossibleTransitions.Last().Weight = 50.0f;
    

       
    ///default close////

    default LightingParameters = LightingPresets::CloseShot();
}

//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________



class UConversationPreset_OverTheShoulder_CloseUpHigh : UConversationCameraPresetListenerOffset
{
    default PresetName = n"OVER THE SHOULDER CLOSE UP HIGH";
    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;
    default HideMode = EConversationCameraHideMode::HideListenerWeapon;

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Topic_Speak);

    default PitchAdjustTarget = EConversationCameraFocusTarget::Speaker;

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 100.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 1.0f;
    default FilmbackPresetName = "35mm VistaVision";
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.f, 16.f);
    default CameraFoVCurve.AddValueAt(0.f, 90.f);
    default CameraFocalLengthCurve.AddValueAt(0.f, 90.f);

    default ListenerPositionOffsetCurve.AddVectorAt(0.0f, FVector(-95.137962f, 48.264606f, 7.40659f));
    default ListenerRotationOffsetCurve.AddRotatorAt(0.0f, FRotator(-2.463986f, -17.268095f, -0.059682f));

    default AnimSequenceName = n"CameraBreathCLOSE";
    default CameraModifiers.Add(UDirectionInputModifier::StaticClass());

    
    default CameraFocusPointOffset = 0.0f;

    default MinHeightDifference = 15.01f;
    default MaxHeightDifference = 27.0f;      

    default MinDistance = 43.0f; 
    default MaxDistance = 163.0f;      

    default ForbiddenTagsSpeakerAndListener.AddTag(GameplayTag::Species_Orc);
    default ForbiddenTagsSpeakerAndListener.AddTag(GameplayTag::Species_Creature_Demon);
     

    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;    

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_WideTC::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

    //SUBCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_CowboyTC::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

    //SPEAK

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 80.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHigh::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 80.0f;

    

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUp::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 40.0f;

    

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHigh::StaticClass();  
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog; 
    default PossibleTransitions.Last().Weight = 40.0f;

    

      
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium::StaticClass();    
    default PossibleTransitions.Last().Weight = 70.0f;


    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Flat::StaticClass();    
    default PossibleTransitions.Last().Weight = 70.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_FlatHigh::StaticClass();    
    default PossibleTransitions.Last().Weight = 70.0f;

       

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Wide::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::DuringMonolog;
    default PossibleTransitions.Last().Weight = 50.0f;
     

    

    ///default close////

    default LightingParameters = LightingPresets::CloseShot();
}

//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________


class UConversationPreset_OverTheShoulder_CloseUpHighExtra : UConversationCameraPresetListenerOffset
{
    default PresetName = n"OVER THE SHOULDER CLOSE UP HIGH EXTRA";
    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;
    default HideMode = EConversationCameraHideMode::HideListenerWeapon;

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Topic_Speak);

    default PitchAdjustTarget = EConversationCameraFocusTarget::Speaker;

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 100.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 1.0f;
    default FilmbackPresetName = "35mm VistaVision";
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.f, 16.f);
    default CameraFoVCurve.AddValueAt(0.f, 90.f);
    default CameraFocalLengthCurve.AddValueAt(0.f, 85.f);

    default ListenerPositionOffsetCurve.AddVectorAt(0.0f, FVector(-133.53331f, 81.258942f, 8.572548f));
    default ListenerRotationOffsetCurve.AddRotatorAt(0.0f, FRotator(-4.426671f, -21.227209f, -0.686944f));

    default AnimSequenceName = n"CameraBreathCLOSE";
    default CameraModifiers.Add(UDirectionInputModifier::StaticClass());

    
    default CameraFocusPointOffset = 0.0f;

    default MinHeightDifference = 27.01f;
    default MaxHeightDifference = 50.0f;      

    default MinDistance = 43.0f; 
    default MaxDistance = 210.0f;     

    default ForbiddenTagsSpeakerAndListener.AddTag(GameplayTag::Species_Orc);
    default ForbiddenTagsSpeakerAndListener.AddTag(GameplayTag::Species_Creature_Demon);
     
    
    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;   


    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHigh::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;   


    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHighExtra::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;
   

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_WideTC::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

    //SUBCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_CowboyTC::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_CowboyHigh::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass =UConversationPreset_TwoShot_CowboyHighExtra::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    //SPEAK
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHigh::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 80.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHighExtra::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 80.0f;

    

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHigh::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 40.0f;

    

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHighExtra::StaticClass();  
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog; 
    default PossibleTransitions.Last().Weight = 40.0f;

    

      
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium::StaticClass();    
    default PossibleTransitions.Last().Weight = 70.0f;


    
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_FlatHigh::StaticClass();    
    default PossibleTransitions.Last().Weight = 70.0f;

       

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Wide::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::DuringMonolog;
    default PossibleTransitions.Last().Weight = 50.0f;
     
    
    


    ///default close////

    default LightingParameters = LightingPresets::CloseShot();
}



///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////INDIVIDUAL SHOTS/////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////






class UConversationPreset_Individual_Medium : UConversationCameraHeightAdjustSpeaker
{
    default PresetName = n"INDIVIDUAL MEDIUM";
    default HideMode = EConversationCameraHideMode::HideListener;
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;

    default PitchAdjustTarget = EConversationCameraFocusTarget::None;

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Topic_Speak);
    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Topic_Start);

    default AssociatedTags.AddTag(GameplayTag::Action_GiveItem);

    default ForbiddenCharacterTagsListener.AddTag(GameplayTag::State_Combat_Melee_Torch);

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 99.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.0, 11.f);
    default CameraFoVCurve.AddValueAt(0.0, 90.000000);
    default CameraFocalLengthCurve.AddValueAt(0.0, 65.000000);         
    
    
    default AdjustedPositionOffsetCurve.AddVectorAt(0.0f, FVector(188.007904f, -110.923256f, -13.013909f));
    default AdjustedRotationCurve.AddRotatorAt(0.0f, FRotator(1.806072f, -213.91066f, 0.033507f));   
    

    // Values to control the pitch towards Listener
    default MinPitchToListener = -35.0f;
    default MaxPitchToListener = 35.0f;
    default PitchToListenerMultiplier = 0.8f;

         
    default AnimSequenceName = n"CameraBreathCLOSE";
    default CameraModifiers.Add(UDirectionInputModifier::StaticClass());

    
    default CameraFocusPointOffset = 0.0f;

    default ForbiddenTagsSpeakerAndListener.AddTag(GameplayTag::Species_Orc);
    default ForbiddenTagsSpeakerAndListener.AddTag(GameplayTag::Species_Creature_Demon);


    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;    

    
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHigh::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;    

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_HIGH::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_LONG::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_HIGH_LONG::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_CLOSE::StaticClass();   
    default PossibleTransitions.Last().Weight = 1.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_CLOSE_HIGH::StaticClass();   
    default PossibleTransitions.Last().Weight = 1.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_WideTC::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;    

   

    //SUBCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy_500::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy_500_LONG::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_CowboyHigh::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_CowboyTC::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;



    //SPEAK


    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUp::StaticClass();
    default PossibleTransitions.Last().Weight = 75.0f;   
    
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHigh::StaticClass();    
    default PossibleTransitions.Last().Weight = 75.0f;     

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHighExtra::StaticClass();    
    default PossibleTransitions.Last().Weight = 75.0f;


    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500::StaticClass();    
    default PossibleTransitions.Last().Weight = 60.0f; 

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_HIGH::StaticClass();    
    default PossibleTransitions.Last().Weight = 60.0f;  

    

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_CloseUp::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 40.0f;         

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 10.0f;   
        
   
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Wide_Speak_500::StaticClass();
    default PossibleTransitions.Last().Weight = 85.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Wide_Speak_500_LONG::StaticClass();    
    default PossibleTransitions.Last().Weight = 85.0f;    

   
    

    default LightingParameters = LightingPresets::CloseShot();

    


}
//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________       
     


class UConversationPreset_Individual_CloseUp : UConversationCameraHeightAdjustSpeaker
{
    default PresetName = n"INDIVIDUAL CLOSE UP";
    default HideMode = EConversationCameraHideMode::HideListener;
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Topic_Speak);

    default ForbiddenCharacterTagsListener.AddTag(GameplayTag::State_Combat_Melee_Torch);

    default PitchAdjustTarget = EConversationCameraFocusTarget::None;

    default bAlwaysValid = false;
  
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 100.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.0, 25.0);
    default CameraFoVCurve.AddValueAt(0.0, 90.000000);
    default CameraFocalLengthCurve.AddValueAt(0.0, 75.000000);

    default AdjustedPositionOffsetCurve.AddVectorAt(0.0f, FVector(165.760345f, -58.178436f, -13.30327f));
    default AdjustedRotationCurve.AddRotatorAt(0.0f, FRotator(4.98195f, -203.444687f, 0.0f));

    
  // Values to control the pitch towards Listener
    default MinPitchToListener = -35.0f;
    default MaxPitchToListener = 35.0f;
    default PitchToListenerMultiplier = 1.f;
    
      
    
    default AnimSequenceName = n"CameraBreathCLOSE";
    default CameraModifiers.Add(UDirectionInputModifier::StaticClass());

    
    default CameraFocusPointOffset = 0.0f;

    default ForbiddenTagsSpeakerAndListener.AddTag(GameplayTag::Species_Orc);
    default ForbiddenTagsSpeakerAndListener.AddTag(GameplayTag::Species_Creature_Demon);


    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHigh::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;    

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHighExtra::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;    

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_HIGH::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_LONG::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_HIGH_LONG::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_CLOSE::StaticClass();   
    default PossibleTransitions.Last().Weight = 1.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_CLOSE_HIGH::StaticClass();   
    default PossibleTransitions.Last().Weight = 1.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_WideTC::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

    

    

    //SUBCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy_500::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy_500_LONG::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_CowboyHigh::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_CowboyTC::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

    

    //SPEAK       
    
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium::StaticClass();    
    default PossibleTransitions.Last().Weight = 90.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHigh::StaticClass();    
    default PossibleTransitions.Last().Weight = 90.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHighExtra::StaticClass();    
    default PossibleTransitions.Last().Weight = 90.0f;  

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500::StaticClass();    
    default PossibleTransitions.Last().Weight = 90.0f; 

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_HIGH::StaticClass();    
    default PossibleTransitions.Last().Weight = 90.0f;  
       

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUp::StaticClass();    
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 30.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHigh::StaticClass();    
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 30.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHighExtra::StaticClass();    
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 30.0f;



    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Wide_Speak_500::StaticClass();       
    default PossibleTransitions.Last().Weight = 60.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Wide_Speak_500_LONG::StaticClass(); 
    default PossibleTransitions.Last().Weight = 60.0f;    

    

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 40.0f;   
    

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_CloseUp::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 10.0f;

 
    

       
   
    default LightingParameters = LightingPresets::CloseShot();

   
}
//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________



///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


class UConversationPreset_Default_CloseUp : UConversationCameraHeightAdjustSpeaker

{
    default PresetName = n"DEFAULT CLOSE UP";
    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::None;
    default FocusMode = EConversationCameraFocusMode::Speaker;

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Default);

    default PitchAdjustTarget = EConversationCameraFocusTarget::None;

    default bAlwaysValid = true;
  
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 100.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.0, 13.000000);
    default CameraFoVCurve.AddValueAt(0.0, 90.000000);
    default CameraFocalLengthCurve.AddValueAt(0.0, 40.000000);

      default AdjustedPositionOffsetCurve.AddVectorAt(0.0f, FVector(130.352936f, -36.355106f, -1.270691f));
    default AdjustedRotationCurve.AddRotatorAt(0.0f, FRotator(-1.855694f, -199.750549f, 0.0f));

    // Values to control the pitch towards Listener
    default MinPitchToListener = -35.0f;
    default MaxPitchToListener = 35.0f;
    default PitchToListenerMultiplier = 1.f;
    
    default AnimSequenceName = n"CameraBreathCLOSE";
    
    
    default CameraFocusPointOffset = 0.0f;



    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHigh::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHigh_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHighExtra::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHighExtra_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_HIGH::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_LONG::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_HIGH_LONG::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_CLOSE::StaticClass();   
    default PossibleTransitions.Last().Weight = 1.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_CLOSE_HIGH::StaticClass();   
    default PossibleTransitions.Last().Weight = 1.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_WideTC::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

    


    //SUBCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy_500::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy_500_LONG::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_CowboyHigh::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass =UConversationPreset_TwoShot_CowboyHighExtra::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_CowboyTC::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

    //SPEAK
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_CloseUp::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

      default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_CloseUp_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

      default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_CloseUp_Orc_NH::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;
    
    
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc_NH::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;   


    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUp::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Wide_Speak_500::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUp_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

      default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUp_Orc_NH::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHigh::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Wide_Speak_500_LONG::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHigh_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHigh_Orc_NH::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHighExtra::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHighExtra_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

      default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHighExtra_Orc_NH::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_ORC_NH::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_Orc_HIGH::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_ORC_NH_HIGH::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_Orc_NH::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHigh::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_HIGH::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHigh_Orc::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHigh_Orc_NH::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHighExtra::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHighExtra_Orc::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHighExtra_Orc_NH::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;




   

    default LightingParameters = LightingPresets::CloseShot();

    default LightingParameters.KeyLightParam.LightPos.AddVectorAt(0.f, FVector(30.072744f, -117.338387f, 106.839622f));
    default LightingParameters.KeyLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-70.746941f, 101.096382f, 0.f));
    default LightingParameters.KeyLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyLightParam.SourceHeight = 128.f;
    default LightingParameters.KeyLightParam.AttenuationRadius = 220.f;
    
    default LightingParameters.RimLightParam.LightPos.AddVectorAt(0.f, FVector(-50.723396f, 121.361267f, 63.488483f));
    default LightingParameters.RimLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-50.927406f, -85.840706f, 0.f));
    default LightingParameters.RimLightParam.SourceWidth = 128.f;
    default LightingParameters.RimLightParam.SourceHeight = 128.f;
    default LightingParameters.RimLightParam.AttenuationRadius = 180.f;

}
//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________





///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////TRADING SHOTS///////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


class UConversationPreset_TradingClose : UConversationCameraHeightAdjustSpeaker
{
    default PresetName = n"TRADING CLOSE";

    default HideMode = EConversationCameraHideMode::HideListener;
    default LoopMode = EConversationCameraLoopMode::None;
    default FocusMode = EConversationCameraFocusMode::Speaker;

    default AssociatedTags.AddTag(GameplayTag::Action_Trading);

    default PitchAdjustTarget = EConversationCameraFocusTarget::None;

    default bAlwaysValid = false;
        
      
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 1.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 1.0f;
    default FilmbackPresetName = "35mm VistaVision";
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.f, 20.f);
    default CameraFoVCurve.AddValueAt(0.f, 90.f);
    default CameraFocalLengthCurve.AddValueAt(0.f, 30.f);
    
    default AdjustedPositionOffsetCurve.AddVectorAt(0.0f, FVector(127.845253f, -0.058691f, -3.353106f));
    default AdjustedRotationCurve.AddRotatorAt(0.0f, FRotator(-7.f, -177.937714f, 0.0f));

    default AnimSequenceName = n"CameraBreathCLOSE";
    default CameraModifiers.Add(UDirectionInputModifier::StaticClass());

    default CameraFocusPointOffset = 0.0f;


    // Values to control the pitch towards Listener
    default MinPitchToListener = -35.0f;
    default MaxPitchToListener = 35.0f;
    default PitchToListenerMultiplier = 1.f;

    

    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHigh::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHigh_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHighExtra::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHighExtra_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_HIGH::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_LONG::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_HIGH_LONG::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_CLOSE::StaticClass();   
    default PossibleTransitions.Last().Weight = 1.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_CLOSE_HIGH::StaticClass();   
    default PossibleTransitions.Last().Weight = 1.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_WideTC::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;    

    

    //SUBCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy_500::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy_500_LONG::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_CowboyHigh::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_CowboyTC::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;  
   
    

    default LightingParameters = LightingPresets::CloseShot();

    

}



//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________




class UConversationPreset_Trading : UConversationCameraHeightAdjustSpeaker
{
    default PresetName = n"TRADING";

    default HideMode = EConversationCameraHideMode::HideListenerWeapon;
    default LoopMode = EConversationCameraLoopMode::None;
    default FocusMode = EConversationCameraFocusMode::Speaker;

    default AssociatedTags.AddTag(GameplayTag::Action_Trading);

    default PitchAdjustTarget = EConversationCameraFocusTarget::None;

    default bAlwaysValid = false;
    
    default bNeverUseForReverseShot = true; 
  
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 100.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 1.0f;
    default FilmbackPresetName = "35mm VistaVision";
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.f, 11.f);
    default CameraFoVCurve.AddValueAt(0.f, 90.f);
    default CameraFocalLengthCurve.AddValueAt(0.f, 34.f);
    
     default AdjustedPositionOffsetCurve.AddVectorAt(0.0f, FVector(155.812546f, -34.529938f, 8.041345f));
    default AdjustedRotationCurve.AddRotatorAt(0.0f, FRotator(-11.12692f, -200.10791f, 0.534034f));

    default AnimSequenceName = n"CameraBreathCLOSE";
    default CameraModifiers.Add(UDirectionInputModifier::StaticClass());

    default CameraFocusPointOffset = 0.0f;


    // Values to control the pitch towards Listener
    default MinPitchToListener = -35.0f;
    default MaxPitchToListener = 35.0f;
    default PitchToListenerMultiplier = 1.f;

    

    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHigh::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHigh_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHighExtra::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHighExtra_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_HIGH::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_LONG::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_HIGH_LONG::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_CLOSE::StaticClass();   
    default PossibleTransitions.Last().Weight = 1.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_CLOSE_HIGH::StaticClass();   
    default PossibleTransitions.Last().Weight = 1.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_WideTC::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;    

    

    //SUBCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy_500::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy_500_LONG::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_CowboyHigh::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_CowboyTC::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;  
   
    

    default LightingParameters = LightingPresets::CloseShot();

    

}





//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////GIVE ITEM SHOTS ////////////////////////////////////////////////////////////////////////////////////////
//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________


class UConversationPreset_GiveItemClose : UConversationCameraPresetListenerOffset
{
    default PresetName = n"GIVE ITEM CLOSE";
    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;
    

    default AssociatedTags.AddTag(GameplayTag::Action_GiveItem);

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 100.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 1.0f;
    default FilmbackPresetName = "35mm VistaVision";
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.f, 5.5f);
    default CameraFoVCurve.AddValueAt(0.0, 90.f);
    default CameraFocalLengthCurve.AddValueAt(0.0, 35.f);
    
    default ListenerPositionOffsetCurve.AddVectorAt(0.0f, FVector(-37.030151f, 53.983784f, -10.906192f));
    default ListenerRotationOffsetCurve.AddRotatorAt(0.0f, FRotator(1.508838f, -36.91655f, 0.0f));

    default AnimSequenceName = n"CameraBreathCLOSE";
    default CameraModifiers.Add(UDirectionInputModifier::StaticClass());

    
    default CameraFocusPointOffset = 0.0f;
    
    // default MaxHeightDifference = 21.0f;
   
    // default MinDistance = 60.0f; 
    default MaxDistance = 120.0f; 

    default ForbiddenTagsSpeakerAndListener.AddTag(GameplayTag::Species_Orc);
    default ForbiddenTagsSpeakerAndListener.AddTag(GameplayTag::Species_Creature_Demon);

    default ForbiddenTagsSpeakerAndListener.AddTag(GameplayTag::Action_Interact_Sit_Chair);



    default PitchAdjustTarget = EConversationCameraFocusTarget::Speaker;

    

    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;   

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHigh::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;    

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHighExtra::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;    

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_WideTC::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;    


    //SUBCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_CowboyHigh::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass =UConversationPreset_TwoShot_CowboyHighExtra::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_CowboyTC::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

    //SPEAK
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUp::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 80.0f; 
    
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHigh::StaticClass();  
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog; 
    default PossibleTransitions.Last().Weight = 80.0f;   

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHighExtra::StaticClass();  
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog; 
    default PossibleTransitions.Last().Weight = 80.0f;    

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 50.0f;    

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_CloseUp::StaticClass();
    default PossibleTransitions.Last().Weight = 50.0f;    
    
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium::StaticClass();
    default PossibleTransitions.Last().Weight = 55.0f;           

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Wide::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::DuringMonolog;
    default PossibleTransitions.Last().Weight = 40.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_ExtraFull::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::DuringMonolog;
    default PossibleTransitions.Last().Weight = 25.0f;


///default close////

    default LightingParameters = LightingPresets::CloseShot();

}

///////////////////////////////////


class UConversationPreset_GiveItemSit : UConversationCameraPresetListenerOffset
{
    default PresetName = n"GIVE ITEM SIT";
    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;
   

    default AssociatedTags.AddTag(GameplayTag::Action_GiveItem);

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 100.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 1.0f;
    default FilmbackPresetName = "35mm VistaVision";
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.f, 7.0f);
    default CameraFoVCurve.AddValueAt(0.0, 90.f);
    default CameraFocalLengthCurve.AddValueAt(0.0, 60.f);
    
    default ListenerPositionOffsetCurve.AddVectorAt(0.0f, FVector(-50.014618f, 45.837845f, -2.850297f));
    default ListenerRotationOffsetCurve.AddRotatorAt(0.0f, FRotator(-0.454519f, -21.039459f, 0.0f));

    default AnimSequenceName = n"CameraBreathCLOSE";
    default CameraModifiers.Add(UDirectionInputModifier::StaticClass());

    
    default CameraFocusPointOffset = 0.0f;
    
    // default MaxHeightDifference = 21.0f;
   
    // default MinDistance = 60.0f; 
    default MaxDistance = 140.0f;  

    default ForbiddenTagsSpeakerAndListener.AddTag(GameplayTag::Species_Orc);
    default ForbiddenTagsSpeakerAndListener.AddTag(GameplayTag::Species_Creature_Demon); 

    default RequiredTagsSpeakerOrListener.AddTag(GameplayTag::Action_Interact_Sit_Chair);

    default PitchAdjustTarget = EConversationCameraFocusTarget::Speaker;

    

    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;   

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHigh::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;    

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHighExtra::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;    

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_WideTC::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;    


    //SUBCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_CowboyHigh::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass =UConversationPreset_TwoShot_CowboyHighExtra::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_CowboyTC::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

    //SPEAK
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUp::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 80.0f; 
    
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHigh::StaticClass();  
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog; 
    default PossibleTransitions.Last().Weight = 80.0f;   

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHighExtra::StaticClass();  
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog; 
    default PossibleTransitions.Last().Weight = 80.0f;    

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 50.0f;    

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_CloseUp::StaticClass();
    default PossibleTransitions.Last().Weight = 50.0f;    
    
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium::StaticClass();
    default PossibleTransitions.Last().Weight = 55.0f;           

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Wide::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::DuringMonolog;
    default PossibleTransitions.Last().Weight = 40.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_ExtraFull::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::DuringMonolog;
    default PossibleTransitions.Last().Weight = 25.0f;


///default close////


    default LightingParameters = LightingPresets::CloseShot();

}

class UConversationPreset_GiveItemSitClose : UConversationCameraHeightAdjustSpeaker
{
    default PresetName = n"GIVE ITEM SIT CLOSE";
    default HideMode = EConversationCameraHideMode::HideListener;
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;
    
    
    default AssociatedTags.AddTag(GameplayTag::Action_GiveItem);

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 100.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.0, 25.0);
    default CameraFoVCurve.AddValueAt(0.0, 90.000000);
    default CameraFocalLengthCurve.AddValueAt(0.0, 75.000000);

    default AdjustedPositionOffsetCurve.AddVectorAt(0.0f, FVector(165.760345f, -58.178436f, -13.30327f));
    default AdjustedRotationCurve.AddRotatorAt(0.0f, FRotator(4.98195f, -203.444687f, 0.0f));

    
  // Values to control the pitch towards Listener
    default MinPitchToListener = -35.0f;
    default MaxPitchToListener = 35.0f;
    default PitchToListenerMultiplier = 1.f;
    
    default AnimSequenceName = n"CameraBreathCLOSE";
    default CameraModifiers.Add(UDirectionInputModifier::StaticClass());

    
    default CameraFocusPointOffset = 0.0f;

    default ForbiddenTagsSpeakerAndListener.AddTag(GameplayTag::Species_Orc);
    default ForbiddenTagsSpeakerAndListener.AddTag(GameplayTag::Species_Creature_Demon);

    default RequiredTagsSpeakerOrListener.AddTag(GameplayTag::Action_Interact_Sit_Chair);

    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;   

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHigh::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;    

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHighExtra::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;    

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_WideTC::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;    


    //SUBCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_CowboyHigh::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass =UConversationPreset_TwoShot_CowboyHighExtra::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_CowboyTC::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

    //SPEAK
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUp::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 80.0f; 
    
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHigh::StaticClass();  
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog; 
    default PossibleTransitions.Last().Weight = 80.0f;   

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHighExtra::StaticClass();  
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog; 
    default PossibleTransitions.Last().Weight = 80.0f;    

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 50.0f;    

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_CloseUp::StaticClass();
    default PossibleTransitions.Last().Weight = 50.0f;    
    
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium::StaticClass();
    default PossibleTransitions.Last().Weight = 55.0f;           

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Wide::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::DuringMonolog;
    default PossibleTransitions.Last().Weight = 40.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_ExtraFull::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::DuringMonolog;
    default PossibleTransitions.Last().Weight = 25.0f;


///default close////

    default LightingParameters = LightingPresets::CloseShot();


}
//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________



///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////CUSTOMIZE ARMOR SHOT ////////////////////////////////////////////////////////////////////////////////////////
//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________


// class UConversationPreset_CustomizeArmor : UConversationCameraPresetListenerOffset
// {
//     default PresetName = n"CUSTOM ARMOR";

//     default HideMode = EConversationCameraHideMode::HideSpeaker;
//     default LoopMode = EConversationCameraLoopMode::None;
//     default FocusMode = EConversationCameraFocusMode::Listener;
    

//     default AssociatedTags.AddTag(GameplayTag::Action_CustomizeArmor);
//     default bIgnoreSideInvertsFromCamera = true;

//     default bAlwaysValid = false;
  
//     default bStaticActorTransforms = false;

//     default InitialChoiceWeight = 100.0f;
//     default TransitionTime = 0.0f;

//     default SqueezeFactor = 2.0f;
//     default CropSettings.AspectRatio = 1.777778f;

//     default CameraApertureCurve.AddValueAt(0.f, 1.2f);
//     default CameraFoVCurve.AddValueAt(0.f, 90.f);
//     default CameraFocalLengthCurve.AddValueAt(0.f, 21.f);

//     default AnimSequenceName = n"CameraBreathWIDE";

    
//     default CameraFocusPointOffset = 0.0f;
    
//     default ListenerPositionOffsetCurve.AddVectorAt(0.0f, FVector(228.959991f, 66.204903f, -68.498001f));
//     default ListenerRotationOffsetCurve.AddRotatorAt(0.0f, FRotator(0.f, 185.699142f, 0.f));


//     default PitchAdjustTarget = EConversationCameraFocusTarget::Listener;

//     default LightingParameters = LightingPresets::CloseShot();


//     default LightingParameters.KeyReverseLightParam.LightPos.AddVectorAt(0.0f, FVector(-47.819878f, 147.852768f, 20.911608f));
//     default LightingParameters.KeyReverseLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-34.917637f, -118.171906f, -91.699913f));

//     default LightingParameters.RimReverseLightParam.LightPos.AddVectorAt(0.0f, FVector(-41.701061f, -150.101746f, 16.959869f));
//     default LightingParameters.RimReverseLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-23.134991f, 68.464813f, 0.0f));

    


//     //WHITELIST________________________________________________________________________________________________
//     //TOPICCHOICE
//     default PossibleTransitions.Add(FPresetTransitionEntry());
//     default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy::StaticClass();
//     default PossibleTransitions.Last().Weight = 100.0f;

//     default PossibleTransitions.Add(FPresetTransitionEntry());
//     default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_Orc::StaticClass();
//     default PossibleTransitions.Last().Weight = 100.0f;

//     default PossibleTransitions.Add(FPresetTransitionEntry());
//     default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHigh::StaticClass();
//     default PossibleTransitions.Last().Weight = 100.0f;

//     default PossibleTransitions.Add(FPresetTransitionEntry());
//     default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHigh_Orc::StaticClass();
//     default PossibleTransitions.Last().Weight = 100.0f;

//     default PossibleTransitions.Add(FPresetTransitionEntry());
//     default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHighExtra::StaticClass();
//     default PossibleTransitions.Last().Weight = 100.0f;

//     default PossibleTransitions.Add(FPresetTransitionEntry());
//     default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHighExtra_Orc::StaticClass();
//     default PossibleTransitions.Last().Weight = 100.0f;

//     default PossibleTransitions.Add(FPresetTransitionEntry());
//     default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_WideTC::StaticClass();
//     default PossibleTransitions.Last().Weight = 1.0f;

 

//     //SUBCHOICE
//     default PossibleTransitions.Add(FPresetTransitionEntry());
//     default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy::StaticClass();
//     default PossibleTransitions.Last().Weight = 100.0f;

//     default PossibleTransitions.Add(FPresetTransitionEntry());
//     default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_CowboyTC::StaticClass();
//     default PossibleTransitions.Last().Weight = 100.0f;
// }

///////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class UConversationPreset_Armor_Top : UConversationCameraPresetListenerOffset

{
    default PresetName = n"ARMOR TOP";
    default HideMode = EConversationCameraHideMode::HideSpeaker;
    default LoopMode = EConversationCameraLoopMode::None;
    default FocusMode = EConversationCameraFocusMode::Listener;

    // default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Default);
    default AssociatedTags.AddTag(GameplayTag::Action_CustomizeArmor);
    default AssociatedTags.AddTag(GameplayTag::UI_ArmorCustom_Top);
    default bIgnoreSideInvertsFromCamera = true;
    // default bOnlyUseAsDefaultWithSameTag = true;


    default bAlwaysValid = false;
 
  
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 100.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 1.0f;
    default FilmbackPresetName = "35mm VistaVision";
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.0, 3.000000);
    default CameraFoVCurve.AddValueAt(0.0, 90.000000);
    default CameraFocalLengthCurve.AddValueAt(0.0, 27.000000);

    default ListenerPositionOffsetCurve.AddVectorAt(0.0f, FVector(135.865417f, 52.017982f, -24.666788f));
    default ListenerRotationOffsetCurve.AddRotatorAt(0.0f, FRotator(-0.792937f, 183.828323f, -0.233225f));
    
    default AnimSequenceName = n"CameraBreathCLOSE";
    
    
    default CameraFocusPointOffset = 0.0f;

    
    

    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHigh::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHigh_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHighExtra::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHighExtra_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_WideTC::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

   

    //SUBCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_CowboyTC::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;


    default LightingParameters = LightingPresets::CloseShot();

}

///////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class UConversationPreset_Armor_Top_2 : UConversationCameraPresetListenerOffset

{
    default PresetName = n"ARMOR TOP 2";
    default HideMode = EConversationCameraHideMode::HideSpeaker;
    default LoopMode = EConversationCameraLoopMode::None;
    default FocusMode = EConversationCameraFocusMode::Listener;

    // default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Default);
    default AssociatedTags.AddTag(GameplayTag::Action_CustomizeArmor);
    default AssociatedTags.AddTag(GameplayTag::UI_ArmorCustom_Top);
    default bIgnoreSideInvertsFromCamera = true;
    // default bOnlyUseAsDefaultWithSameTag = true;


    default bAlwaysValid = false;
 
  
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 1.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 1.0f;
    default FilmbackPresetName = "35mm VistaVision";
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.0, 3.000000);
    default CameraFoVCurve.AddValueAt(0.0, 90.000000);
    default CameraFocalLengthCurve.AddValueAt(0.0, 27.000000);

    default ListenerPositionOffsetCurve.AddVectorAt(0.0f, FVector(136.628098f, -27.697451f, -24.318886f));
    default ListenerRotationOffsetCurve.AddRotatorAt(0.0f, FRotator(-0.762822f, 150.938797f, 0.346074f));
    
    default AnimSequenceName = n"CameraBreathCLOSE";
    
    
    default CameraFocusPointOffset = 0.0f;

    
    

    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHigh::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHigh_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHighExtra::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHighExtra_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_WideTC::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

   

    //SUBCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_CowboyTC::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;


    default LightingParameters = LightingPresets::CloseShot();
}

///////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class UConversationPreset_Armor_Belt : UConversationCameraPresetListenerOffset

{
    default PresetName = n"ARMOR BELT";
    default HideMode = EConversationCameraHideMode::HideSpeaker;
    default LoopMode = EConversationCameraLoopMode::None;
    default FocusMode = EConversationCameraFocusMode::Listener;

    // default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Default);
    default AssociatedTags.AddTag(GameplayTag::UI_ArmorCustom_Belt);
    default bIgnoreSideInvertsFromCamera = true;
    // default bOnlyUseAsDefaultWithSameTag = true;


    default bAlwaysValid = false;
 
  
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 100.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 1.0f;
    default FilmbackPresetName = "35mm VistaVision";
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.0, 3.5);
    default CameraFoVCurve.AddValueAt(0.0, 90.000000);
    default CameraFocalLengthCurve.AddValueAt(0.0, 30.000000);

    default ListenerPositionOffsetCurve.AddVectorAt(0.0f, FVector(138.919785f, 64.274147f, -48.706745f));
    default ListenerRotationOffsetCurve.AddRotatorAt(0.0f, FRotator(-5.78777f, 188.496918f, 0.0f));
    
    default AnimSequenceName = n"CameraBreathCLOSE";
    
    
    default CameraFocusPointOffset = -25.0f;

    // default PitchAdjustTarget = EConversationCameraFocusTarget::Listener;

    

    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHigh::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHigh_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHighExtra::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHighExtra_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_WideTC::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

   

    //SUBCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_CowboyTC::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;


    default LightingParameters = LightingPresets::CloseShot();
}

///////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class UConversationPreset_Armor_Belt_2 : UConversationCameraPresetListenerOffset

{
    default PresetName = n"ARMOR BELT 2";
    default HideMode = EConversationCameraHideMode::HideSpeaker;
    default LoopMode = EConversationCameraLoopMode::None;
    default FocusMode = EConversationCameraFocusMode::Listener;

    // default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Default);
    default AssociatedTags.AddTag(GameplayTag::UI_ArmorCustom_Belt);
    default bIgnoreSideInvertsFromCamera = true;
    // default bOnlyUseAsDefaultWithSameTag = true;


    default bAlwaysValid = false;
 
  
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 10.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 1.0f;
    default FilmbackPresetName = "35mm VistaVision";
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.0, 3.5);
    default CameraFoVCurve.AddValueAt(0.0, 90.000000);
    default CameraFocalLengthCurve.AddValueAt(0.0, 30.000000);

    default ListenerPositionOffsetCurve.AddVectorAt(0.0f, FVector(149.073456f, -35.347057f, -48.778725f));
    default ListenerRotationOffsetCurve.AddRotatorAt(0.0f, FRotator(-4.619256f, 150.322754f, 0.593176f));

    default AnimSequenceName = n"CameraBreathCLOSE";
    
    
    default CameraFocusPointOffset = -25.0f;

    // default PitchAdjustTarget = EConversationCameraFocusTarget::Listener;

    

    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHigh::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHigh_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHighExtra::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHighExtra_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_WideTC::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

   

    //SUBCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_CowboyTC::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;


    default LightingParameters = LightingPresets::CloseShot();
}


///////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class UConversationPreset_Armor_Belt_3 : UConversationCameraPresetListenerOffset

{
    default PresetName = n"ARMOR BELT 3";
    default HideMode = EConversationCameraHideMode::HideSpeaker;
    default LoopMode = EConversationCameraLoopMode::None;
    default FocusMode = EConversationCameraFocusMode::Listener;

    // default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Default);
    default AssociatedTags.AddTag(GameplayTag::UI_ArmorCustom_Belt);
    default bIgnoreSideInvertsFromCamera = true;
    // default bOnlyUseAsDefaultWithSameTag = true;


    default bAlwaysValid = false;
 
  
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 1.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 1.0f;
    default FilmbackPresetName = "35mm VistaVision";
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.0, 3.5);
    default CameraFoVCurve.AddValueAt(0.0, 90.000000);
    default CameraFocalLengthCurve.AddValueAt(0.0, 30.000000);

    default ListenerPositionOffsetCurve.AddVectorAt(0.0f, FVector(135.549088f, 45.295193f, -27.933643f));
    default ListenerRotationOffsetCurve.AddRotatorAt(0.0f, FRotator(-15.49323f, 180.653854f, 0.0f));

    default AnimSequenceName = n"CameraBreathCLOSE";
    
    
    default CameraFocusPointOffset = -25.0f;

    // default PitchAdjustTarget = EConversationCameraFocusTarget::Listener;

    

    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHigh::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHigh_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHighExtra::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHighExtra_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_WideTC::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

   

    //SUBCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_CowboyTC::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;


    default LightingParameters = LightingPresets::CloseShot();
}

///////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class UConversationPreset_Armor_Shoes : UConversationCameraPresetListenerOffset

{
    default PresetName = n"ARMOR SHOES";
    default HideMode = EConversationCameraHideMode::HideSpeaker;
    default LoopMode = EConversationCameraLoopMode::None;
    default FocusMode = EConversationCameraFocusMode::Listener;

    // default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Default);
    default AssociatedTags.AddTag(GameplayTag::UI_ArmorCustom_Shoes);
    default bIgnoreSideInvertsFromCamera = true;
    // default bOnlyUseAsDefaultWithSameTag = true;


    default bAlwaysValid = false;
    default bDoObstructionCheckFootHeightListener = true; 
 
  
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 100.0f;
    default TransitionTime = 0.0f;

   default SqueezeFactor = 1.0f;
    default FilmbackPresetName = "35mm VistaVision";
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.0, 3.0);
    default CameraFoVCurve.AddValueAt(0.0, 90.000000);
    default CameraFocalLengthCurve.AddValueAt(0.0, 25.000000);

     default ListenerPositionOffsetCurve.AddVectorAt(0.0f, FVector(131.807861f, 38.885593f, -118.577385f));
    default ListenerRotationOffsetCurve.AddRotatorAt(0.0f, FRotator(-4.56662f, 178.657913f, -0.103027f));
    
    default AnimSequenceName = n"CameraBreathCLOSE";
    
    
    default CameraFocusPointOffset = -40.0f;

    // default PitchAdjustTarget = EConversationCameraFocusTarget::Listener;

    
        


    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHigh::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHigh_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHighExtra::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHighExtra_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_WideTC::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

   

    //SUBCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_CowboyTC::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;


    default LightingParameters = LightingPresets::CloseShot();

    default LightingParameters.KeyReverseLightParam.LightPos.AddVectorAt(0.0f, FVector(8.863954f, 128.86821f, -87.492119f));
    default LightingParameters.KeyReverseLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-18.830379f, -91.380302f, -90.286446f));    
    default LightingParameters.KeyReverseLightParam.SourceWidth = 125.f;
    default LightingParameters.KeyReverseLightParam.SourceHeight = 50.f;
    default LightingParameters.KeyReverseLightParam.AttenuationRadius = 250.f;      
       

    default LightingParameters.RimReverseLightParam.LightPos.AddVectorAt(0.0f, FVector(-9.20109f, -116.756866f, -90.706818f));
    default LightingParameters.RimReverseLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-23.107141f, 98.828667f, 0.0f));     
    default LightingParameters.RimReverseLightParam.SourceWidth = 75.f;
    default LightingParameters.RimReverseLightParam.SourceHeight = 75.f;
    default LightingParameters.RimReverseLightParam.AttenuationRadius = 250.f;  

}


///////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class UConversationPreset_Armor_Shoes_2 : UConversationCameraPresetListenerOffset

{
    default PresetName = n"ARMOR SHOES 2";
    default HideMode = EConversationCameraHideMode::HideSpeaker;
    default LoopMode = EConversationCameraLoopMode::None;
    default FocusMode = EConversationCameraFocusMode::Listener;

    // default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Default);
    default AssociatedTags.AddTag(GameplayTag::UI_ArmorCustom_Shoes);
    default bIgnoreSideInvertsFromCamera = true;
    // default bOnlyUseAsDefaultWithSameTag = true;


    default bAlwaysValid = false;
    default bDoObstructionCheckFootHeightListener = true; 
 
  
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 10.0f;
    default TransitionTime = 0.0f;

   default SqueezeFactor = 1.0f;
    default FilmbackPresetName = "35mm VistaVision";
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.0, 3.0);
    default CameraFoVCurve.AddValueAt(0.0, 90.000000);
    default CameraFocalLengthCurve.AddValueAt(0.0, 25.000000);

    default ListenerPositionOffsetCurve.AddVectorAt(0.0f, FVector(89.954063f, 110.378769f, -125.736328f));
    default ListenerRotationOffsetCurve.AddRotatorAt(0.0f, FRotator(1.4f, 212.752579f, 0.0f));
    
    default AnimSequenceName = n"CameraBreathCLOSE";
    
    
    default CameraFocusPointOffset = -40.0f;

    // default PitchAdjustTarget = EConversationCameraFocusTarget::Listener;

   
        


    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHigh::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHigh_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHighExtra::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHighExtra_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_WideTC::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

   

    //SUBCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_CowboyTC::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;



     default LightingParameters = LightingPresets::CloseShot();

    default LightingParameters.KeyReverseLightParam.LightPos.AddVectorAt(0.0f, FVector(8.863954f, 128.86821f, -87.492119f));
    default LightingParameters.KeyReverseLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-18.830379f, -91.380302f, -90.286446f));    
    default LightingParameters.KeyReverseLightParam.SourceWidth = 125.f;
    default LightingParameters.KeyReverseLightParam.SourceHeight = 50.f;
    default LightingParameters.KeyReverseLightParam.AttenuationRadius = 250.f;      
       

    default LightingParameters.RimReverseLightParam.LightPos.AddVectorAt(0.0f, FVector(-9.20109f, -116.756866f, -90.706818f));
    default LightingParameters.RimReverseLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-23.107141f, 98.828667f, 0.0f));     
    default LightingParameters.RimReverseLightParam.SourceWidth = 75.f;
    default LightingParameters.RimReverseLightParam.SourceHeight = 75.f;
    default LightingParameters.RimReverseLightParam.AttenuationRadius = 250.f;  

}

///////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class UConversationPreset_Armor_Shoes_3 : UConversationCameraPresetListenerOffset

{
    default PresetName = n"ARMOR SHOES 3";
    default HideMode = EConversationCameraHideMode::HideSpeaker;
    default LoopMode = EConversationCameraLoopMode::None;
    default FocusMode = EConversationCameraFocusMode::Listener;

    // default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Default);
    default AssociatedTags.AddTag(GameplayTag::UI_ArmorCustom_Shoes);
    default bIgnoreSideInvertsFromCamera = true;
    // default bOnlyUseAsDefaultWithSameTag = true;


    default bAlwaysValid = false;
    default bDoObstructionCheckFootHeightListener = true; 
 
  
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 5.0f;
    default TransitionTime = 0.0f;

   default SqueezeFactor = 1.0f;
    default FilmbackPresetName = "35mm VistaVision";
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.0, 3.0);
    default CameraFoVCurve.AddValueAt(0.0, 90.000000);
    default CameraFocalLengthCurve.AddValueAt(0.0, 25.000000);

    default ListenerPositionOffsetCurve.AddVectorAt(0.0f, FVector(105.377411f, -92.749809f, -125.712685f));
    default ListenerRotationOffsetCurve.AddRotatorAt(0.0f, FRotator(0.628532f, 120.668694f, -0.110978f));
    
    default AnimSequenceName = n"CameraBreathCLOSE";
    
    
    default CameraFocusPointOffset = -40.0f;

    // default PitchAdjustTarget = EConversationCameraFocusTarget::Listener;

     
        


    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHigh::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHigh_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHighExtra::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHighExtra_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_WideTC::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

   

    //SUBCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_CowboyTC::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;



    default LightingParameters = LightingPresets::CloseShot();

    default LightingParameters.KeyReverseLightParam.LightPos.AddVectorAt(0.0f, FVector(8.863954f, 128.86821f, -87.492119f));
    default LightingParameters.KeyReverseLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-18.830379f, -91.380302f, -90.286446f));    
    default LightingParameters.KeyReverseLightParam.SourceWidth = 125.f;
    default LightingParameters.KeyReverseLightParam.SourceHeight = 50.f;
    default LightingParameters.KeyReverseLightParam.AttenuationRadius = 250.f;      
       

    default LightingParameters.RimReverseLightParam.LightPos.AddVectorAt(0.0f, FVector(-9.20109f, -116.756866f, -90.706818f));
    default LightingParameters.RimReverseLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-23.107141f, 98.828667f, 0.0f));     
    default LightingParameters.RimReverseLightParam.SourceWidth = 75.f;
    default LightingParameters.RimReverseLightParam.SourceHeight = 75.f;
    default LightingParameters.RimReverseLightParam.AttenuationRadius = 250.f; 
}

///////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class UConversationPreset_Armor_Shoes_4 : UConversationCameraPresetListenerOffset

{
    default PresetName = n"ARMOR SHOES 4";
    default HideMode = EConversationCameraHideMode::HideSpeaker;
    default LoopMode = EConversationCameraLoopMode::None;
    default FocusMode = EConversationCameraFocusMode::Listener;

    // default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Default);
    default AssociatedTags.AddTag(GameplayTag::UI_ArmorCustom_Shoes);
    default bIgnoreSideInvertsFromCamera = true;
    // default bOnlyUseAsDefaultWithSameTag = true;


    default bAlwaysValid = false;
    default bDoObstructionCheckFootHeightListener = true; 
 
  
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 1.0f;
    default TransitionTime = 0.0f;

   default SqueezeFactor = 1.0f;
    default FilmbackPresetName = "35mm VistaVision";
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.0, 3.0);
    default CameraFoVCurve.AddValueAt(0.0, 90.000000);
    default CameraFocalLengthCurve.AddValueAt(0.0, 25.000000);

     default ListenerPositionOffsetCurve.AddVectorAt(0.0f, FVector(72.220726f, 81.219925f, -65.082787f));
    default ListenerRotationOffsetCurve.AddRotatorAt(0.0f, FRotator(-28.90839f, 209.728546f, 0.0f));
    
    default AnimSequenceName = n"CameraBreathCLOSE";
    
    
    default CameraFocusPointOffset = -20.0f;

    // default PitchAdjustTarget = EConversationCameraFocusTarget::Listener;

   
        


    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHigh::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHigh_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHighExtra::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHighExtra_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_WideTC::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

   

    //SUBCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_CowboyTC::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;



     default LightingParameters = LightingPresets::CloseShot();

    default LightingParameters.KeyReverseLightParam.LightPos.AddVectorAt(0.0f, FVector(8.863954f, 128.86821f, -87.492119f));
    default LightingParameters.KeyReverseLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-18.830379f, -91.380302f, -90.286446f));    
    default LightingParameters.KeyReverseLightParam.SourceWidth = 125.f;
    default LightingParameters.KeyReverseLightParam.SourceHeight = 50.f;
    default LightingParameters.KeyReverseLightParam.AttenuationRadius = 250.f;      
       

    default LightingParameters.RimReverseLightParam.LightPos.AddVectorAt(0.0f, FVector(-9.20109f, -116.756866f, -90.706818f));
    default LightingParameters.RimReverseLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-23.107141f, 98.828667f, 0.0f));     
    default LightingParameters.RimReverseLightParam.SourceWidth = 75.f;
    default LightingParameters.RimReverseLightParam.SourceHeight = 75.f;
    default LightingParameters.RimReverseLightParam.AttenuationRadius = 250.f;  
}


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////NEW LONG HORIZONTAL DISTANCE SHOTS  //////////////////////////////////////////////////////////////////////////////////////////


class UConversationPreset_OverTheShoulder_Cowboy_500 : UConversationCameraPresetListenerOffset
{
    default PresetName = n"OVER THE SHOULDER COWBOY 500";
    default LoopMode = EConversationCameraLoopMode::None;
    default FocusMode = EConversationCameraFocusMode::Speaker;
    default HideMode = EConversationCameraHideMode::None;

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_TopicChoice_Start);
    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_TopicChoice);
    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_SubChoice);

    default PitchAdjustTarget = EConversationCameraFocusTarget::Speaker;

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 100.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.0, 10.f);
    default CameraFoVCurve.AddValueAt(0.0, 90.f);
    default CameraFocalLengthCurve.AddValueAt(0.0, 50.f);

    default ListenerPositionOffsetCurve.AddVectorAt(0.0f, FVector(-163.796509f, 116.399818f, -0.2335f));
    default ListenerRotationOffsetCurve.AddRotatorAt(0.0f, FRotator(-4.437841f, -24.869967f, 0.0f));

    default AnimSequenceName = n"CameraBreathWIDE";

    
    default CameraFocusPointOffset = 0.0f;

    default MaxHeightDifference = 40.0f;       
    
    default MinDistance = 220.01f; 
    default MaxDistance = 350.0f;     

    // default ForbiddenTagsSpeakerAndListener.AddTag(GameplayTag::Species_Orc);
    // default ForbiddenCharacterTagsSpeaker.AddTag(GameplayTag::Species_Creature_Demon);


    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_HIGH::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_LONG::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_HIGH_LONG::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_CLOSE::StaticClass();   
    default PossibleTransitions.Last().Weight = 1.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_CLOSE_HIGH::StaticClass();   
    default PossibleTransitions.Last().Weight = 1.0f;

    // default PossibleTransitions.Add(FPresetTransitionEntry());
    // default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_Orc::StaticClass();   
    // default PossibleTransitions.Last().Weight = 100.0f;

    //SUBCHOICE

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy_500::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy_500_LONG::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    
    // default PossibleTransitions.Add(FPresetTransitionEntry());
    // default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_CowboyTC::StaticClass();    
    // default PossibleTransitions.Last().Weight = 1.0f;

    //SPEAK

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500::StaticClass();    
    default PossibleTransitions.Last().Weight = 80.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 80.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_ORC_NH::StaticClass();
    default PossibleTransitions.Last().Weight = 80.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_Orc_HIGH::StaticClass();
    default PossibleTransitions.Last().Weight = 80.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_ORC_NH_HIGH::StaticClass();
    default PossibleTransitions.Last().Weight = 80.0f;

    // default PossibleTransitions.Add(FPresetTransitionEntry());
    // default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_Orc::StaticClass();    
    // default PossibleTransitions.Last().Weight = 80.0f;

    // default PossibleTransitions.Add(FPresetTransitionEntry());
    // default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_Orc_NH::StaticClass();    
    // default PossibleTransitions.Last().Weight = 80.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_HIGH::StaticClass();    
    default PossibleTransitions.Last().Weight = 80.0f; 
   
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc_NH::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;
    

    ///default close entero///

   default LightingParameters = LightingPresets::CloseShot();

    default LightingParameters.KeyLightParam.LightPos.AddVectorAt(0.0f, FVector(105.962036f, -145.830475f, 87.061447f));
    default LightingParameters.KeyLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-47.183167f, 115.15831f, 0.0f));
    default LightingParameters.KeyLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyLightParam.SourceHeight = 128.f;
    default LightingParameters.KeyLightParam.AttenuationRadius = 450.f;

    default LightingParameters.RimLightParam.LightPos.AddVectorAt(0.0f, FVector(-89.032387f, 174.166183f, 2.0f));
    default LightingParameters.RimLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-51.384537f, -97.303352f, 0.0f));
    default LightingParameters.RimLightParam.SourceWidth = 250.f;
    default LightingParameters.RimLightParam.SourceHeight = 128.f;
    default LightingParameters.RimLightParam.AttenuationRadius = 350.f;

    default LightingParameters.KeyReverseLightParam.LightPos.AddVectorAt(0.0f, FVector(3.960295f, 153.10582f, 102.495285f));
    default LightingParameters.KeyReverseLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-71.183342f, -78.903618f, 0.f));        
    default LightingParameters.KeyReverseLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyReverseLightParam.SourceHeight = 128.f;
    default LightingParameters.KeyReverseLightParam.AttenuationRadius = 250.f;            

    default LightingParameters.RimReverseLightParam.LightPos.AddVectorAt(0.0f, FVector(51.082512f, -164.402679f, 39.912994f));
    default LightingParameters.RimReverseLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-23.014482f, 89.094925f, 0.0f));
    default LightingParameters.RimReverseLightParam.SourceWidth = 250.f;
    default LightingParameters.RimReverseLightParam.SourceHeight = 128.f;
    default LightingParameters.RimReverseLightParam.AttenuationRadius = 300.f;
}



class UConversationPreset_OverTheShoulder_Cowboy_500_HIGH : UConversationCameraPresetListenerOffset
{
    default PresetName = n"OVER THE SHOULDER COWBOY 500 HIGH";
    default LoopMode = EConversationCameraLoopMode::None;
    default FocusMode = EConversationCameraFocusMode::Speaker;
    default HideMode = EConversationCameraHideMode::None;

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_TopicChoice_Start);
    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_TopicChoice);
    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_SubChoice);

   
    default PitchAdjustTarget = EConversationCameraFocusTarget::Speaker;

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 100.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.0, 10.f);
    default CameraFoVCurve.AddValueAt(0.0, 90.f);
    default CameraFocalLengthCurve.AddValueAt(0.0, 45.f);

    default ListenerPositionOffsetCurve.AddVectorAt(0.0f, FVector(-165.74028f, 116.247475f, -23.812754f));
    default ListenerRotationOffsetCurve.AddRotatorAt(0.0f, FRotator(-2.507175f, -24.869968f, 0.0f));

    default AnimSequenceName = n"CameraBreathWIDE";

    
    default CameraFocusPointOffset = 0.0f;

    default MinHeightDifference = 40.01f; 
    // default MaxHeightDifference = 40.0f;       
    
    default MinDistance = 220.01f; 
    default MaxDistance = 350.0f;     

    // default ForbiddenTagsSpeakerAndListener.AddTag(GameplayTag::Species_Orc);
    // default ForbiddenCharacterTagsSpeaker.AddTag(GameplayTag::Species_Creature_Demon);


    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_HIGH::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_LONG::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_HIGH_LONG::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_CLOSE::StaticClass();   
    default PossibleTransitions.Last().Weight = 1.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_CLOSE_HIGH::StaticClass();   
    default PossibleTransitions.Last().Weight = 1.0f;

    // default PossibleTransitions.Add(FPresetTransitionEntry());
    // default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_Orc::StaticClass();   
    // default PossibleTransitions.Last().Weight = 100.0f;

    //SUBCHOICE

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy_500::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy_500_LONG::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    
    // default PossibleTransitions.Add(FPresetTransitionEntry());
    // default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_CowboyTC::StaticClass();    
    // default PossibleTransitions.Last().Weight = 1.0f;

    //SPEAK

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500::StaticClass();    
    default PossibleTransitions.Last().Weight = 80.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 80.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_ORC_NH::StaticClass();
    default PossibleTransitions.Last().Weight = 80.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_Orc_HIGH::StaticClass();
    default PossibleTransitions.Last().Weight = 80.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_ORC_NH_HIGH::StaticClass();
    default PossibleTransitions.Last().Weight = 80.0f;

    // default PossibleTransitions.Add(FPresetTransitionEntry());
    // default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_Orc::StaticClass();    
    // default PossibleTransitions.Last().Weight = 80.0f;

    // default PossibleTransitions.Add(FPresetTransitionEntry());
    // default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_Orc_NH::StaticClass();    
    // default PossibleTransitions.Last().Weight = 80.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_HIGH::StaticClass();    
    default PossibleTransitions.Last().Weight = 80.0f; 
   
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc_NH::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;   

    
   

     ///default close entero///

   default LightingParameters = LightingPresets::CloseShot();

    default LightingParameters.KeyLightParam.LightPos.AddVectorAt(0.0f, FVector(105.962036f, -145.830475f, 87.061447f));
    default LightingParameters.KeyLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-47.183167f, 115.15831f, 0.0f));
    default LightingParameters.KeyLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyLightParam.SourceHeight = 128.f;
    default LightingParameters.KeyLightParam.AttenuationRadius = 450.f;

    default LightingParameters.RimLightParam.LightPos.AddVectorAt(0.0f, FVector(-89.032387f, 174.166183f, 2.0f));
    default LightingParameters.RimLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-51.384537f, -97.303352f, 0.0f));
    default LightingParameters.RimLightParam.SourceWidth = 250.f;
    default LightingParameters.RimLightParam.SourceHeight = 128.f;
    default LightingParameters.RimLightParam.AttenuationRadius = 350.f;

    default LightingParameters.KeyReverseLightParam.LightPos.AddVectorAt(0.0f, FVector(3.960295f, 153.10582f, 102.495285f));
    default LightingParameters.KeyReverseLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-71.183342f, -78.903618f, 0.f));        
    default LightingParameters.KeyReverseLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyReverseLightParam.SourceHeight = 128.f;
    default LightingParameters.KeyReverseLightParam.AttenuationRadius = 250.f;            

    default LightingParameters.RimReverseLightParam.LightPos.AddVectorAt(0.0f, FVector(51.082512f, -164.402679f, 39.912994f));
    default LightingParameters.RimReverseLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-23.014482f, 89.094925f, 0.0f));
    default LightingParameters.RimReverseLightParam.SourceWidth = 250.f;
    default LightingParameters.RimReverseLightParam.SourceHeight = 128.f;
    default LightingParameters.RimReverseLightParam.AttenuationRadius = 300.f;
}

//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________

class UConversationPreset_OverTheShoulder_Cowboy_500_LONG : UConversationCameraPresetListenerOffset
{
    default PresetName = n"OVER THE SHOULDER COWBOY 500 LONG";
    default LoopMode = EConversationCameraLoopMode::None;
    default FocusMode = EConversationCameraFocusMode::Speaker;
    default HideMode = EConversationCameraHideMode::None;

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_TopicChoice_Start);
    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_TopicChoice);
    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_SubChoice);

    default AssociatedTags.AddTag(GameplayTag::Action_Conversation_LukorPray);

    default PitchAdjustTarget = EConversationCameraFocusTarget::Speaker;

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 100.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.0, 10.f);
    default CameraFoVCurve.AddValueAt(0.0, 90.f);
    default CameraFocalLengthCurve.AddValueAt(0.0, 45.f);

    default ListenerPositionOffsetCurve.AddVectorAt(0.0f, FVector(-161.303238f, 116.695877f, -0.00339f));
    default ListenerRotationOffsetCurve.AddRotatorAt(0.0f, FRotator(-4.555106f, -22.266518f, -0.0f));

    default AnimSequenceName = n"CameraBreathWIDE";

    
    default CameraFocusPointOffset = 0.0f;

    default MaxHeightDifference = 40.0f;       
    
    default MinDistance = 350.01f; 
    default MaxDistance = 650.0f;     

    // default ForbiddenTagsSpeakerAndListener.AddTag(GameplayTag::Species_Orc);
    // default ForbiddenCharacterTagsSpeaker.AddTag(GameplayTag::Species_Creature_Demon);


    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_HIGH::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_LONG::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_HIGH_LONG::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_CLOSE::StaticClass();   
    default PossibleTransitions.Last().Weight = 1.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_CLOSE_HIGH::StaticClass();   
    default PossibleTransitions.Last().Weight = 1.0f;

    // default PossibleTransitions.Add(FPresetTransitionEntry());
    // default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_Orc::StaticClass();   
    // default PossibleTransitions.Last().Weight = 100.0f;

    //SUBCHOICE

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy_500::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy_500_LONG::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    
    // default PossibleTransitions.Add(FPresetTransitionEntry());
    // default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_CowboyTC::StaticClass();    
    // default PossibleTransitions.Last().Weight = 1.0f;

    //SPEAK

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500::StaticClass();    
    default PossibleTransitions.Last().Weight = 80.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 80.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_ORC_NH::StaticClass();
    default PossibleTransitions.Last().Weight = 80.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_Orc_HIGH::StaticClass();
    default PossibleTransitions.Last().Weight = 80.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_ORC_NH_HIGH::StaticClass();
    default PossibleTransitions.Last().Weight = 80.0f;

    // default PossibleTransitions.Add(FPresetTransitionEntry());
    // default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_Orc::StaticClass();    
    // default PossibleTransitions.Last().Weight = 80.0f;

    // default PossibleTransitions.Add(FPresetTransitionEntry());
    // default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_Orc_NH::StaticClass();    
    // default PossibleTransitions.Last().Weight = 80.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_HIGH::StaticClass();    
    default PossibleTransitions.Last().Weight = 80.0f; 
   
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc_NH::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;
    

    

      ///default close entero///

   default LightingParameters = LightingPresets::CloseShot();

    default LightingParameters.KeyLightParam.LightPos.AddVectorAt(0.0f, FVector(105.962036f, -145.830475f, 87.061447f));
    default LightingParameters.KeyLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-47.183167f, 115.15831f, 0.0f));
    default LightingParameters.KeyLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyLightParam.SourceHeight = 128.f;
    default LightingParameters.KeyLightParam.AttenuationRadius = 450.f;

    default LightingParameters.RimLightParam.LightPos.AddVectorAt(0.0f, FVector(-89.032387f, 174.166183f, 2.0f));
    default LightingParameters.RimLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-51.384537f, -97.303352f, 0.0f));
    default LightingParameters.RimLightParam.SourceWidth = 250.f;
    default LightingParameters.RimLightParam.SourceHeight = 128.f;
    default LightingParameters.RimLightParam.AttenuationRadius = 350.f;

    default LightingParameters.KeyReverseLightParam.LightPos.AddVectorAt(0.0f, FVector(3.960295f, 153.10582f, 102.495285f));
    default LightingParameters.KeyReverseLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-71.183342f, -78.903618f, 0.f));        
    default LightingParameters.KeyReverseLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyReverseLightParam.SourceHeight = 128.f;
    default LightingParameters.KeyReverseLightParam.AttenuationRadius = 250.f;            

    default LightingParameters.RimReverseLightParam.LightPos.AddVectorAt(0.0f, FVector(51.082512f, -164.402679f, 39.912994f));
    default LightingParameters.RimReverseLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-23.014482f, 89.094925f, 0.0f));
    default LightingParameters.RimReverseLightParam.SourceWidth = 250.f;
    default LightingParameters.RimReverseLightParam.SourceHeight = 128.f;
    default LightingParameters.RimReverseLightParam.AttenuationRadius = 300.f;
}



//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________

class UConversationPreset_OverTheShoulder_Cowboy_500_HIGH_LONG : UConversationCameraPresetListenerOffset
{
    default PresetName = n"OVER THE SHOULDER COWBOY 500 HIGH LONG";
    default LoopMode = EConversationCameraLoopMode::None;
    default FocusMode = EConversationCameraFocusMode::Speaker;
    default HideMode = EConversationCameraHideMode::None;

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_TopicChoice_Start);
    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_TopicChoice);
    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_SubChoice);

    default AssociatedTags.AddTag(GameplayTag::Action_Conversation_LukorPray);

    default PitchAdjustTarget = EConversationCameraFocusTarget::Speaker;

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 100.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.0, 10.f);
    default CameraFoVCurve.AddValueAt(0.0, 90.f);
    default CameraFocalLengthCurve.AddValueAt(0.0, 50.f);

    default ListenerPositionOffsetCurve.AddVectorAt(0.0f, FVector(-165.74028f, 116.247475f, -23.812754f));
    default ListenerRotationOffsetCurve.AddRotatorAt(0.0f, FRotator(-2.507175f, -22.869968f, 0.0f));

    default AnimSequenceName = n"CameraBreathWIDE";

    
    default CameraFocusPointOffset = 0.0f;

    default MinHeightDifference = 40.01f; 
    // default MaxHeightDifference = 40.0f;       
    
    default MinDistance = 350.01f; 
    default MaxDistance = 650.0f;     

    // default ForbiddenTagsSpeakerAndListener.AddTag(GameplayTag::Species_Orc);
    // default ForbiddenCharacterTagsSpeaker.AddTag(GameplayTag::Species_Creature_Demon);


    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_HIGH::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_LONG::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_HIGH_LONG::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_CLOSE::StaticClass();   
    default PossibleTransitions.Last().Weight = 1.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_CLOSE_HIGH::StaticClass();   
    default PossibleTransitions.Last().Weight = 1.0f;

    // default PossibleTransitions.Add(FPresetTransitionEntry());
    // default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_Orc::StaticClass();   
    // default PossibleTransitions.Last().Weight = 100.0f;

    //SUBCHOICE

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy_500::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy_500_LONG::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    
    // default PossibleTransitions.Add(FPresetTransitionEntry());
    // default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_CowboyTC::StaticClass();    
    // default PossibleTransitions.Last().Weight = 1.0f;

    //SPEAK

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500::StaticClass();    
    default PossibleTransitions.Last().Weight = 80.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 80.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_ORC_NH::StaticClass();
    default PossibleTransitions.Last().Weight = 80.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_Orc_HIGH::StaticClass();
    default PossibleTransitions.Last().Weight = 80.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_ORC_NH_HIGH::StaticClass();
    default PossibleTransitions.Last().Weight = 80.0f;

    // default PossibleTransitions.Add(FPresetTransitionEntry());
    // default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_Orc::StaticClass();    
    // default PossibleTransitions.Last().Weight = 80.0f;

    // default PossibleTransitions.Add(FPresetTransitionEntry());
    // default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_Orc_NH::StaticClass();    
    // default PossibleTransitions.Last().Weight = 80.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_HIGH::StaticClass();    
    default PossibleTransitions.Last().Weight = 80.0f; 
   
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc_NH::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;
    

    

      ///default close entero///

   default LightingParameters = LightingPresets::CloseShot();

    default LightingParameters.KeyLightParam.LightPos.AddVectorAt(0.0f, FVector(105.962036f, -145.830475f, 87.061447f));
    default LightingParameters.KeyLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-47.183167f, 115.15831f, 0.0f));
    default LightingParameters.KeyLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyLightParam.SourceHeight = 128.f;
    default LightingParameters.KeyLightParam.AttenuationRadius = 450.f;

    default LightingParameters.RimLightParam.LightPos.AddVectorAt(0.0f, FVector(-89.032387f, 174.166183f, 2.0f));
    default LightingParameters.RimLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-51.384537f, -97.303352f, 0.0f));
    default LightingParameters.RimLightParam.SourceWidth = 250.f;
    default LightingParameters.RimLightParam.SourceHeight = 128.f;
    default LightingParameters.RimLightParam.AttenuationRadius = 350.f;

    default LightingParameters.KeyReverseLightParam.LightPos.AddVectorAt(0.0f, FVector(3.960295f, 153.10582f, 102.495285f));
    default LightingParameters.KeyReverseLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-71.183342f, -78.903618f, 0.f));        
    default LightingParameters.KeyReverseLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyReverseLightParam.SourceHeight = 128.f;
    default LightingParameters.KeyReverseLightParam.AttenuationRadius = 250.f;            

    default LightingParameters.RimReverseLightParam.LightPos.AddVectorAt(0.0f, FVector(51.082512f, -164.402679f, 39.912994f));
    default LightingParameters.RimReverseLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-23.014482f, 89.094925f, 0.0f));
    default LightingParameters.RimReverseLightParam.SourceWidth = 250.f;
    default LightingParameters.RimReverseLightParam.SourceHeight = 128.f;
    default LightingParameters.RimReverseLightParam.AttenuationRadius = 300.f;
}



//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________


class UConversationPreset_OverTheShoulder_Cowboy_500_CLOSE : UConversationCameraPresetListenerOffset
{
    default PresetName = n"OVER THE SHOULDER COWBOY 500 CLOSE";
    default LoopMode = EConversationCameraLoopMode::None;
    default FocusMode = EConversationCameraFocusMode::Speaker;
    default HideMode = EConversationCameraHideMode::None;

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_TopicChoice_Start);
    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_TopicChoice);
    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_SubChoice);

    default AssociatedTags.AddTag(GameplayTag::Action_Conversation_LukorPray);

    default PitchAdjustTarget = EConversationCameraFocusTarget::Speaker;

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 100.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.0, 10.f);
    default CameraFoVCurve.AddValueAt(0.0, 90.f);
    default CameraFocalLengthCurve.AddValueAt(0.0, 35.f);

    default ListenerPositionOffsetCurve.AddVectorAt(0.0f, FVector(-92.866402f, 73.629684f, 1.364656f));
    default ListenerRotationOffsetCurve.AddRotatorAt(0.0f, FRotator(-6.518725f, -26.386309f, -0.0f));

    default AnimSequenceName = n"CameraBreathWIDE";

    
    default CameraFocusPointOffset = 0.0f;

    default MaxHeightDifference = 40.0f;       
    
    default MinDistance = 220.01f; 
    default MaxDistance = 650.0f;     

    // default ForbiddenTagsSpeakerAndListener.AddTag(GameplayTag::Species_Orc);
    // default ForbiddenCharacterTagsSpeaker.AddTag(GameplayTag::Species_Creature_Demon);


    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_HIGH::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_LONG::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_HIGH_LONG::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_CLOSE::StaticClass();   
    default PossibleTransitions.Last().Weight = 1.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_CLOSE_HIGH::StaticClass();   
    default PossibleTransitions.Last().Weight = 1.0f;

   

    //SUBCHOICE

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy_500::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy_500_LONG::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    
   

    //SPEAK

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500::StaticClass();    
    default PossibleTransitions.Last().Weight = 80.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 80.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_ORC_NH::StaticClass();
    default PossibleTransitions.Last().Weight = 80.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_Orc_HIGH::StaticClass();
    default PossibleTransitions.Last().Weight = 80.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_ORC_NH_HIGH::StaticClass();
    default PossibleTransitions.Last().Weight = 80.0f;

    

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_HIGH::StaticClass();    
    default PossibleTransitions.Last().Weight = 80.0f; 
   
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc_NH::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;
    
    

    

    ///default close entero///

   default LightingParameters = LightingPresets::CloseShot();

    default LightingParameters.KeyLightParam.LightPos.AddVectorAt(0.0f, FVector(105.962036f, -145.830475f, 87.061447f));
    default LightingParameters.KeyLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-47.183167f, 115.15831f, 0.0f));
    default LightingParameters.KeyLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyLightParam.SourceHeight = 128.f;
    default LightingParameters.KeyLightParam.AttenuationRadius = 450.f;

    default LightingParameters.RimLightParam.LightPos.AddVectorAt(0.0f, FVector(-89.032387f, 174.166183f, 2.0f));
    default LightingParameters.RimLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-51.384537f, -97.303352f, 0.0f));
    default LightingParameters.RimLightParam.SourceWidth = 250.f;
    default LightingParameters.RimLightParam.SourceHeight = 128.f;
    default LightingParameters.RimLightParam.AttenuationRadius = 350.f;

    default LightingParameters.KeyReverseLightParam.LightPos.AddVectorAt(0.0f, FVector(3.960295f, 153.10582f, 102.495285f));
    default LightingParameters.KeyReverseLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-71.183342f, -78.903618f, 0.f));        
    default LightingParameters.KeyReverseLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyReverseLightParam.SourceHeight = 128.f;
    default LightingParameters.KeyReverseLightParam.AttenuationRadius = 250.f;            

    default LightingParameters.RimReverseLightParam.LightPos.AddVectorAt(0.0f, FVector(51.082512f, -164.402679f, 39.912994f));
    default LightingParameters.RimReverseLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-23.014482f, 89.094925f, 0.0f));
    default LightingParameters.RimReverseLightParam.SourceWidth = 250.f;
    default LightingParameters.RimReverseLightParam.SourceHeight = 128.f;
    default LightingParameters.RimReverseLightParam.AttenuationRadius = 300.f;
}



class UConversationPreset_OverTheShoulder_Cowboy_500_CLOSE_HIGH : UConversationCameraPresetListenerOffset
{
    default PresetName = n"OVER THE SHOULDER COWBOY 500 CLOSE HIGH ";
    default LoopMode = EConversationCameraLoopMode::None;
    default FocusMode = EConversationCameraFocusMode::Speaker;
    default HideMode = EConversationCameraHideMode::None;

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_TopicChoice_Start);
    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_TopicChoice);
    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_SubChoice);

    default AssociatedTags.AddTag(GameplayTag::Action_Conversation_LukorPray);

    default PitchAdjustTarget = EConversationCameraFocusTarget::Speaker;

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 100.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.0, 10.f);
    default CameraFoVCurve.AddValueAt(0.0, 90.f);
    default CameraFocalLengthCurve.AddValueAt(0.0, 35.f);

    default ListenerPositionOffsetCurve.AddVectorAt(0.0f, FVector(-92.866402f, 73.629684f, -22.364656f));
    default ListenerRotationOffsetCurve.AddRotatorAt(0.0f, FRotator(-2.518725f, -26.386309f, -0.0f));

    default AnimSequenceName = n"CameraBreathWIDE";

    
    default CameraFocusPointOffset = 0.0f;

    default MinHeightDifference = 40.01f; 
    // default MaxHeightDifference = 40.0f;       
    
    default MinDistance = 220.01f; 
    default MaxDistance = 650.0f;     

    // default ForbiddenTagsSpeakerAndListener.AddTag(GameplayTag::Species_Orc);
    // default ForbiddenCharacterTagsSpeaker.AddTag(GameplayTag::Species_Creature_Demon);


    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_HIGH::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_LONG::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_HIGH_LONG::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_CLOSE::StaticClass();   
    default PossibleTransitions.Last().Weight = 1.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_CLOSE_HIGH::StaticClass();   
    default PossibleTransitions.Last().Weight = 1.0f;

   

    //SUBCHOICE

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy_500::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy_500_LONG::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    
   

    //SPEAK

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500::StaticClass();    
    default PossibleTransitions.Last().Weight = 80.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 80.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_ORC_NH::StaticClass();
    default PossibleTransitions.Last().Weight = 80.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_Orc_HIGH::StaticClass();
    default PossibleTransitions.Last().Weight = 80.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_ORC_NH_HIGH::StaticClass();
    default PossibleTransitions.Last().Weight = 80.0f;

    

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_HIGH::StaticClass();    
    default PossibleTransitions.Last().Weight = 80.0f; 
   
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc_NH::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;
    
    

   ///default close entero///

   default LightingParameters = LightingPresets::CloseShot();

    default LightingParameters.KeyLightParam.LightPos.AddVectorAt(0.0f, FVector(105.962036f, -145.830475f, 87.061447f));
    default LightingParameters.KeyLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-47.183167f, 115.15831f, 0.0f));
    default LightingParameters.KeyLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyLightParam.SourceHeight = 128.f;
    default LightingParameters.KeyLightParam.AttenuationRadius = 450.f;

    default LightingParameters.RimLightParam.LightPos.AddVectorAt(0.0f, FVector(-89.032387f, 174.166183f, 2.0f));
    default LightingParameters.RimLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-51.384537f, -97.303352f, 0.0f));
    default LightingParameters.RimLightParam.SourceWidth = 250.f;
    default LightingParameters.RimLightParam.SourceHeight = 128.f;
    default LightingParameters.RimLightParam.AttenuationRadius = 350.f;

    default LightingParameters.KeyReverseLightParam.LightPos.AddVectorAt(0.0f, FVector(3.960295f, 153.10582f, 102.495285f));
    default LightingParameters.KeyReverseLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-71.183342f, -78.903618f, 0.f));        
    default LightingParameters.KeyReverseLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyReverseLightParam.SourceHeight = 128.f;
    default LightingParameters.KeyReverseLightParam.AttenuationRadius = 250.f;            

    default LightingParameters.RimReverseLightParam.LightPos.AddVectorAt(0.0f, FVector(51.082512f, -164.402679f, 39.912994f));
    default LightingParameters.RimReverseLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-23.014482f, 89.094925f, 0.0f));
    default LightingParameters.RimReverseLightParam.SourceWidth = 250.f;
    default LightingParameters.RimReverseLightParam.SourceHeight = 128.f;
    default LightingParameters.RimReverseLightParam.AttenuationRadius = 300.f;
}

//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________

class UConversationPreset_OverTheShoulder_Medium_500 : UConversationCameraPresetListenerOffset
{
    default PresetName = n"OVER THE SHOULDER MEDIUM 500";
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;
    default HideMode = EConversationCameraHideMode::None;
    default MultiConversationValidity = EConversationMultiParticipantMode::OnlySpeakerListener;

    default PitchAdjustTarget = EConversationCameraFocusTarget::Speaker;

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Topic_Speak);
    

    default AssociatedTags.AddTag(GameplayTag::Action_Conversation_LukorPray);

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 100.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 1.0f;
    default FilmbackPresetName = "35mm VistaVision";
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.f, 13.8f);
    default CameraFoVCurve.AddValueAt(0.0, 90.f);
    default CameraFocalLengthCurve.AddValueAt(0.0, 65.f);
    
    default ListenerPositionOffsetCurve.AddVectorAt(0.0f, FVector(-106.008492f, 54.673443f, 2.328409f));
    default ListenerRotationOffsetCurve.AddRotatorAt(0.0f, FRotator(-3.223911f, -15.501793f, 0.0f));

    default AnimSequenceName = n"CameraBreathCLOSE";
    default CameraModifiers.Add(UDirectionInputModifier::StaticClass());

    
    default CameraFocusPointOffset = 0.0f;
    
    default MaxHeightDifference = 20.0f;
   
    default MinDistance = 193.01f; 
    default MaxDistance = 650.0f; 

    default ForbiddenTagsSpeakerAndListener.AddTag(GameplayTag::Species_Orc);
    default ForbiddenTagsSpeakerAndListener.AddTag(GameplayTag::Species_Creature_Demon);

    default ForbiddenTagsSpeakerAndListener.AddTag(GameplayTag::Action_Ambient_LeanWall);

    
          

    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE
    

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_HIGH::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_LONG::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_HIGH_LONG::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_CLOSE::StaticClass();   
    default PossibleTransitions.Last().Weight = 1.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_CLOSE_HIGH::StaticClass();   
    default PossibleTransitions.Last().Weight = 1.0f;
    

    //SUBCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy_500::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy_500_LONG::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    //SPEAK
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Wide_Speak_500::StaticClass();    
    default PossibleTransitions.Last().Weight = 80.0f;   

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Wide_Speak_500_LONG::StaticClass();    
    default PossibleTransitions.Last().Weight = 80.0f;   

       

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 50.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_Orc::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 50.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_ORC_NH::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 50.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_Orc_HIGH::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 50.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_ORC_NH_HIGH::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 50.0f;

   

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_CloseUp::StaticClass();
    default PossibleTransitions.Last().Weight = 50.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_CloseUp_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 50.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_CloseUp_Orc_NH::StaticClass();
    default PossibleTransitions.Last().Weight = 50.0f;    

    
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium::StaticClass();
    default PossibleTransitions.Last().Weight = 55.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 55.0f;
    
     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc_NH::StaticClass();
    default PossibleTransitions.Last().Weight = 55.0f;    
    

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Wide::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::DuringMonolog;
    default PossibleTransitions.Last().Weight = 60.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_ExtraFull::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::DuringMonolog;
    default PossibleTransitions.Last().Weight = 45.0f;    

    

      ///default close entero///

   default LightingParameters = LightingPresets::CloseShot();

    default LightingParameters.KeyLightParam.LightPos.AddVectorAt(0.0f, FVector(105.962036f, -145.830475f, 87.061447f));
    default LightingParameters.KeyLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-47.183167f, 115.15831f, 0.0f));
    default LightingParameters.KeyLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyLightParam.SourceHeight = 128.f;
    default LightingParameters.KeyLightParam.AttenuationRadius = 450.f;

    default LightingParameters.RimLightParam.LightPos.AddVectorAt(0.0f, FVector(-89.032387f, 174.166183f, 2.0f));
    default LightingParameters.RimLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-51.384537f, -97.303352f, 0.0f));
    default LightingParameters.RimLightParam.SourceWidth = 250.f;
    default LightingParameters.RimLightParam.SourceHeight = 128.f;
    default LightingParameters.RimLightParam.AttenuationRadius = 350.f;

    default LightingParameters.KeyReverseLightParam.LightPos.AddVectorAt(0.0f, FVector(3.960295f, 153.10582f, 102.495285f));
    default LightingParameters.KeyReverseLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-71.183342f, -78.903618f, 0.f));        
    default LightingParameters.KeyReverseLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyReverseLightParam.SourceHeight = 128.f;
    default LightingParameters.KeyReverseLightParam.AttenuationRadius = 250.f;            

    default LightingParameters.RimReverseLightParam.LightPos.AddVectorAt(0.0f, FVector(51.082512f, -164.402679f, 39.912994f));
    default LightingParameters.RimReverseLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-23.014482f, 89.094925f, 0.0f));
    default LightingParameters.RimReverseLightParam.SourceWidth = 250.f;
    default LightingParameters.RimReverseLightParam.SourceHeight = 128.f;
    default LightingParameters.RimReverseLightParam.AttenuationRadius = 300.f;
}


class UConversationPreset_OverTheShoulder_Medium_500_HIGH : UConversationCameraPresetListenerOffset
{
    default PresetName = n"OVER THE SHOULDER MEDIUM 500 HIGH";
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;
    default HideMode = EConversationCameraHideMode::None;
    default MultiConversationValidity = EConversationMultiParticipantMode::OnlySpeakerListener;

    default PitchAdjustTarget = EConversationCameraFocusTarget::Speaker;

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Topic_Speak);
    

    default AssociatedTags.AddTag(GameplayTag::Action_Conversation_LukorPray);

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 100.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 1.0f;
    default FilmbackPresetName = "35mm VistaVision";
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.f, 13.8f);
    default CameraFoVCurve.AddValueAt(0.0, 90.f);
    default CameraFocalLengthCurve.AddValueAt(0.0, 65.f);
    
    default ListenerPositionOffsetCurve.AddVectorAt(0.0f, FVector(-106.008492f, 54.673443f, -4.328409f));
    default ListenerRotationOffsetCurve.AddRotatorAt(0.0f, FRotator(-2.223911f, -15.501793f, 0.0f));

    default AnimSequenceName = n"CameraBreathCLOSE";
    default CameraModifiers.Add(UDirectionInputModifier::StaticClass());

    
    default CameraFocusPointOffset = 0.0f;
    
    default MinHeightDifference = 20.01f;
    
   
    default MinDistance = 193.01f; 
    default MaxDistance = 650.0f; 

    default ForbiddenTagsSpeakerAndListener.AddTag(GameplayTag::Species_Orc);
    default ForbiddenTagsSpeakerAndListener.AddTag(GameplayTag::Species_Creature_Demon);

    default ForbiddenTagsSpeakerAndListener.AddTag(GameplayTag::Action_Ambient_LeanWall);

    
          

    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_HIGH::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_LONG::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_HIGH_LONG::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_CLOSE::StaticClass();   
    default PossibleTransitions.Last().Weight = 1.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_CLOSE_HIGH::StaticClass();   
    default PossibleTransitions.Last().Weight = 1.0f;

    
   
    //SUBCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy_500::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy_500_LONG::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    //SPEAK
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Wide_Speak_500::StaticClass();    
    default PossibleTransitions.Last().Weight = 80.0f;  

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Wide_Speak_500_LONG::StaticClass();    
    default PossibleTransitions.Last().Weight = 80.0f;   

         

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_HIGH::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 50.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_Orc::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 50.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_ORC_NH::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 50.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_Orc_HIGH::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 50.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_ORC_NH_HIGH::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 50.0f;
    

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_CloseUp::StaticClass();
    default PossibleTransitions.Last().Weight = 50.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_CloseUp_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 50.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_CloseUp_Orc_NH::StaticClass();
    default PossibleTransitions.Last().Weight = 50.0f;    

    
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium::StaticClass();
    default PossibleTransitions.Last().Weight = 55.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 55.0f;
    
     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc_NH::StaticClass();
    default PossibleTransitions.Last().Weight = 55.0f;    
    

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Wide::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::DuringMonolog;
    default PossibleTransitions.Last().Weight = 60.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_ExtraFull::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::DuringMonolog;
    default PossibleTransitions.Last().Weight = 45.0f;
    

    

   ///default close entero///

   default LightingParameters = LightingPresets::CloseShot();

    default LightingParameters.KeyLightParam.LightPos.AddVectorAt(0.0f, FVector(105.962036f, -145.830475f, 87.061447f));
    default LightingParameters.KeyLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-47.183167f, 115.15831f, 0.0f));
    default LightingParameters.KeyLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyLightParam.SourceHeight = 128.f;
    default LightingParameters.KeyLightParam.AttenuationRadius = 450.f;

    default LightingParameters.RimLightParam.LightPos.AddVectorAt(0.0f, FVector(-89.032387f, 174.166183f, 2.0f));
    default LightingParameters.RimLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-51.384537f, -97.303352f, 0.0f));
    default LightingParameters.RimLightParam.SourceWidth = 250.f;
    default LightingParameters.RimLightParam.SourceHeight = 128.f;
    default LightingParameters.RimLightParam.AttenuationRadius = 350.f;

    default LightingParameters.KeyReverseLightParam.LightPos.AddVectorAt(0.0f, FVector(3.960295f, 153.10582f, 102.495285f));
    default LightingParameters.KeyReverseLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-71.183342f, -78.903618f, 0.f));        
    default LightingParameters.KeyReverseLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyReverseLightParam.SourceHeight = 128.f;
    default LightingParameters.KeyReverseLightParam.AttenuationRadius = 250.f;            

    default LightingParameters.RimReverseLightParam.LightPos.AddVectorAt(0.0f, FVector(51.082512f, -164.402679f, 39.912994f));
    default LightingParameters.RimReverseLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-23.014482f, 89.094925f, 0.0f));
    default LightingParameters.RimReverseLightParam.SourceWidth = 250.f;
    default LightingParameters.RimReverseLightParam.SourceHeight = 128.f;
    default LightingParameters.RimReverseLightParam.AttenuationRadius = 300.f;
}



//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________

class UConversationPreset_OverTheShoulder_Medium_500_Orc : UConversationCameraPresetListenerOffset
{
    default PresetName = n"OVER THE SHOULDER MEDIUM 500 ORC";
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;
    default HideMode = EConversationCameraHideMode::HideListenerWeapon;
    default MultiConversationValidity = EConversationMultiParticipantMode::OnlySpeakerListener;

    default PitchAdjustTarget = EConversationCameraFocusTarget::Speaker;

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Topic_Speak);
    

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 90.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 1.0f;
    default FilmbackPresetName = "35mm VistaVision";
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.f, 13.8f);
    default CameraFoVCurve.AddValueAt(0.0, 90.f);
    default CameraFocalLengthCurve.AddValueAt(0.0, 70.f);
    
    default ListenerPositionOffsetCurve.AddVectorAt(0.0f, FVector(-85.013741f, 30.909256f, -2.789448f));
    default ListenerRotationOffsetCurve.AddRotatorAt(0.0f, FRotator(-0.893238f, -8.341355f, 0.115998f));

    default AnimSequenceName = n"CameraBreathCLOSE";
    default CameraModifiers.Add(UDirectionInputModifier::StaticClass());

    
    default CameraFocusPointOffset = 0.0f;
    
    default MaxHeightDifference = 35.0f;
   
    default MinDistance = 193.01f; 
    default MaxDistance = 650.0f; 

    default RequiredCharacterTagsSpeaker.AddTag(GameplayTag::Species_Orc);
    

    default ForbiddenTagsSpeakerAndListener.AddTag(GameplayTag::Action_Ambient_LeanWall);

    
          

    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE
    

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_HIGH::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_LONG::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_HIGH_LONG::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_CLOSE::StaticClass();   
    default PossibleTransitions.Last().Weight = 1.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_CLOSE_HIGH::StaticClass();   
    default PossibleTransitions.Last().Weight = 1.0f;

   
    //SUBCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy_500::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy_500_LONG::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    //SPEAK
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Wide_Speak_500::StaticClass();    
    default PossibleTransitions.Last().Weight = 80.0f;  

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Wide_Speak_500_LONG::StaticClass();    
    default PossibleTransitions.Last().Weight = 80.0f;   

       
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 50.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_Orc::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 50.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_ORC_NH::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 50.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_Orc_HIGH::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 50.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_ORC_NH_HIGH::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 50.0f;

    
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_CloseUp::StaticClass();
    default PossibleTransitions.Last().Weight = 50.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_CloseUp_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 50.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_CloseUp_Orc_NH::StaticClass();
    default PossibleTransitions.Last().Weight = 50.0f;    

    
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium::StaticClass();
    default PossibleTransitions.Last().Weight = 55.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 55.0f;
    
     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc_NH::StaticClass();
    default PossibleTransitions.Last().Weight = 55.0f;    
    

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Wide::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::DuringMonolog;
    default PossibleTransitions.Last().Weight = 60.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_ExtraFull::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::DuringMonolog;
    default PossibleTransitions.Last().Weight = 45.0f;
    

    

    ///default close entero///

   default LightingParameters = LightingPresets::CloseShot();

    default LightingParameters.KeyLightParam.LightPos.AddVectorAt(0.0f, FVector(105.962036f, -145.830475f, 87.061447f));
    default LightingParameters.KeyLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-47.183167f, 115.15831f, 0.0f));
    default LightingParameters.KeyLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyLightParam.SourceHeight = 128.f;
    default LightingParameters.KeyLightParam.AttenuationRadius = 450.f;

    default LightingParameters.RimLightParam.LightPos.AddVectorAt(0.0f, FVector(-89.032387f, 174.166183f, 2.0f));
    default LightingParameters.RimLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-51.384537f, -97.303352f, 0.0f));
    default LightingParameters.RimLightParam.SourceWidth = 250.f;
    default LightingParameters.RimLightParam.SourceHeight = 128.f;
    default LightingParameters.RimLightParam.AttenuationRadius = 350.f;

    default LightingParameters.KeyReverseLightParam.LightPos.AddVectorAt(0.0f, FVector(3.960295f, 153.10582f, 102.495285f));
    default LightingParameters.KeyReverseLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-71.183342f, -78.903618f, 0.f));        
    default LightingParameters.KeyReverseLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyReverseLightParam.SourceHeight = 128.f;
    default LightingParameters.KeyReverseLightParam.AttenuationRadius = 250.f;            

    default LightingParameters.RimReverseLightParam.LightPos.AddVectorAt(0.0f, FVector(51.082512f, -164.402679f, 39.912994f));
    default LightingParameters.RimReverseLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-23.014482f, 89.094925f, 0.0f));
    default LightingParameters.RimReverseLightParam.SourceWidth = 250.f;
    default LightingParameters.RimReverseLightParam.SourceHeight = 128.f;
    default LightingParameters.RimReverseLightParam.AttenuationRadius = 300.f;
}

class UConversationPreset_OverTheShoulder_Medium_500_ORC_NH : UConversationCameraPresetListenerOffset
{
    default PresetName = n"OVER THE SHOULDER MEDIUM 500 ORC NH";
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;    
    default MultiConversationValidity = EConversationMultiParticipantMode::OnlySpeakerListener;

    default PitchAdjustTarget = EConversationCameraFocusTarget::Speaker;

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Topic_Speak);
    

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 90.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 1.0f;
    default FilmbackPresetName = "35mm VistaVision";
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.f, 13.8f);
    default CameraFoVCurve.AddValueAt(0.0, 90.f);
    default CameraFocalLengthCurve.AddValueAt(0.0, 65.f);
    
     default ListenerPositionOffsetCurve.AddVectorAt(0.0f, FVector(-184.840134f, 94.962296f, 34.062195f));
    default ListenerRotationOffsetCurve.AddRotatorAt(0.0f, FRotator(-7.672354f, -16.56509f, 0.0f));

    default AnimSequenceName = n"CameraBreathCLOSE";
    default CameraModifiers.Add(UDirectionInputModifier::StaticClass());

    
    default CameraFocusPointOffset = 0.0f;
    
    default MaxHeightDifference = 35.0f;
   
    default MinDistance = 193.01f; 
    default MaxDistance = 650.0f; 

    default RequiredCharacterTagsListener.AddTag(GameplayTag::Species_Orc);

    default ForbiddenTagsSpeakerAndListener.AddTag(GameplayTag::Action_Ambient_LeanWall);

    
          

    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_HIGH::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_LONG::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_HIGH_LONG::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_CLOSE::StaticClass();   
    default PossibleTransitions.Last().Weight = 1.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_CLOSE_HIGH::StaticClass();   
    default PossibleTransitions.Last().Weight = 1.0f;

    
   
    //SUBCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy_500::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy_500_LONG::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    //SPEAK
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Wide_Speak_500::StaticClass();    
    default PossibleTransitions.Last().Weight = 80.0f;  

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Wide_Speak_500_LONG::StaticClass();    
    default PossibleTransitions.Last().Weight = 80.0f;    

    

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_HIGH::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 50.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_Orc::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 50.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_ORC_NH::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 50.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_Orc_HIGH::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 50.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_ORC_NH_HIGH::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 50.0f;

   

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_CloseUp::StaticClass();
    default PossibleTransitions.Last().Weight = 50.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_CloseUp_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 50.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_CloseUp_Orc_NH::StaticClass();
    default PossibleTransitions.Last().Weight = 50.0f;    

    
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium::StaticClass();
    default PossibleTransitions.Last().Weight = 55.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 55.0f;
    
     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc_NH::StaticClass();
    default PossibleTransitions.Last().Weight = 55.0f;    
    

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Wide::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::DuringMonolog;
    default PossibleTransitions.Last().Weight = 60.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_ExtraFull::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::DuringMonolog;
    default PossibleTransitions.Last().Weight = 45.0f;
    

    
///default close entero///

   default LightingParameters = LightingPresets::CloseShot();

    default LightingParameters.KeyLightParam.LightPos.AddVectorAt(0.0f, FVector(105.962036f, -145.830475f, 87.061447f));
    default LightingParameters.KeyLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-47.183167f, 115.15831f, 0.0f));
    default LightingParameters.KeyLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyLightParam.SourceHeight = 128.f;
    default LightingParameters.KeyLightParam.AttenuationRadius = 450.f;

    default LightingParameters.RimLightParam.LightPos.AddVectorAt(0.0f, FVector(-89.032387f, 174.166183f, 2.0f));
    default LightingParameters.RimLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-51.384537f, -97.303352f, 0.0f));
    default LightingParameters.RimLightParam.SourceWidth = 250.f;
    default LightingParameters.RimLightParam.SourceHeight = 128.f;
    default LightingParameters.RimLightParam.AttenuationRadius = 350.f;

    default LightingParameters.KeyReverseLightParam.LightPos.AddVectorAt(0.0f, FVector(3.960295f, 153.10582f, 102.495285f));
    default LightingParameters.KeyReverseLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-71.183342f, -78.903618f, 0.f));        
    default LightingParameters.KeyReverseLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyReverseLightParam.SourceHeight = 128.f;
    default LightingParameters.KeyReverseLightParam.AttenuationRadius = 250.f;            

    default LightingParameters.RimReverseLightParam.LightPos.AddVectorAt(0.0f, FVector(51.082512f, -164.402679f, 39.912994f));
    default LightingParameters.RimReverseLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-23.014482f, 89.094925f, 0.0f));
    default LightingParameters.RimReverseLightParam.SourceWidth = 250.f;
    default LightingParameters.RimReverseLightParam.SourceHeight = 128.f;
    default LightingParameters.RimReverseLightParam.AttenuationRadius = 300.f;

}
//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________

class UConversationPreset_OverTheShoulder_Medium_500_Orc_HIGH : UConversationCameraPresetListenerOffset
{
    default PresetName = n"OVER THE SHOULDER MEDIUM 500 ORC HIGH";
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;
    default HideMode = EConversationCameraHideMode::HideListenerWeapon;
    default MultiConversationValidity = EConversationMultiParticipantMode::OnlySpeakerListener;

    default PitchAdjustTarget = EConversationCameraFocusTarget::Speaker;

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Topic_Speak);
    

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 90.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 1.0f;
    default FilmbackPresetName = "35mm VistaVision";
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.f, 13.8f);
    default CameraFoVCurve.AddValueAt(0.0, 90.f);
    default CameraFocalLengthCurve.AddValueAt(0.0, 70.f);
    
    default ListenerPositionOffsetCurve.AddVectorAt(0.0f, FVector(-84.904091f, 33.877106f, -9.2367f));
    default ListenerRotationOffsetCurve.AddRotatorAt(0.0f, FRotator(-3.737162f, -9.53718f, 0.116343f));

    default AnimSequenceName = n"CameraBreathCLOSE";
    default CameraModifiers.Add(UDirectionInputModifier::StaticClass());

    
    default CameraFocusPointOffset = 0.0f;
    
    default MinHeightDifference = 35.01f;
    default MaxHeightDifference = 65.0f;
   
    default MinDistance = 193.01f; 
    default MaxDistance = 650.0f; 

    default RequiredCharacterTagsSpeaker.AddTag(GameplayTag::Species_Orc);
    

    default ForbiddenTagsSpeakerAndListener.AddTag(GameplayTag::Action_Ambient_LeanWall);

    
          

    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE
    

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_HIGH::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_LONG::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_HIGH_LONG::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_CLOSE::StaticClass();   
    default PossibleTransitions.Last().Weight = 1.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_CLOSE_HIGH::StaticClass();   
    default PossibleTransitions.Last().Weight = 1.0f;

    

    //SUBCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy_500::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy_500_LONG::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    //SPEAK
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Wide_Speak_500::StaticClass();    
    default PossibleTransitions.Last().Weight = 80.0f;    

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Wide_Speak_500_LONG::StaticClass();    
    default PossibleTransitions.Last().Weight = 80.0f;  
          

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 50.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_Orc::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 50.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_ORC_NH::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 50.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_Orc_HIGH::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 50.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_ORC_NH_HIGH::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 50.0f;

    

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_CloseUp::StaticClass();
    default PossibleTransitions.Last().Weight = 50.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_CloseUp_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 50.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_CloseUp_Orc_NH::StaticClass();
    default PossibleTransitions.Last().Weight = 50.0f;    

    
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium::StaticClass();
    default PossibleTransitions.Last().Weight = 55.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 55.0f;
    
     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc_NH::StaticClass();
    default PossibleTransitions.Last().Weight = 55.0f;    
    

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Wide::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::DuringMonolog;
    default PossibleTransitions.Last().Weight = 60.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_ExtraFull::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::DuringMonolog;
    default PossibleTransitions.Last().Weight = 45.0f;
    

    

    ///default close entero///

   default LightingParameters = LightingPresets::CloseShot();

    default LightingParameters.KeyLightParam.LightPos.AddVectorAt(0.0f, FVector(105.962036f, -145.830475f, 87.061447f));
    default LightingParameters.KeyLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-47.183167f, 115.15831f, 0.0f));
    default LightingParameters.KeyLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyLightParam.SourceHeight = 128.f;
    default LightingParameters.KeyLightParam.AttenuationRadius = 450.f;

    default LightingParameters.RimLightParam.LightPos.AddVectorAt(0.0f, FVector(-89.032387f, 174.166183f, 2.0f));
    default LightingParameters.RimLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-51.384537f, -97.303352f, 0.0f));
    default LightingParameters.RimLightParam.SourceWidth = 250.f;
    default LightingParameters.RimLightParam.SourceHeight = 128.f;
    default LightingParameters.RimLightParam.AttenuationRadius = 350.f;

    default LightingParameters.KeyReverseLightParam.LightPos.AddVectorAt(0.0f, FVector(3.960295f, 153.10582f, 102.495285f));
    default LightingParameters.KeyReverseLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-71.183342f, -78.903618f, 0.f));        
    default LightingParameters.KeyReverseLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyReverseLightParam.SourceHeight = 128.f;
    default LightingParameters.KeyReverseLightParam.AttenuationRadius = 250.f;            

    default LightingParameters.RimReverseLightParam.LightPos.AddVectorAt(0.0f, FVector(51.082512f, -164.402679f, 39.912994f));
    default LightingParameters.RimReverseLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-23.014482f, 89.094925f, 0.0f));
    default LightingParameters.RimReverseLightParam.SourceWidth = 250.f;
    default LightingParameters.RimReverseLightParam.SourceHeight = 128.f;
    default LightingParameters.RimReverseLightParam.AttenuationRadius = 300.f;
}

class UConversationPreset_OverTheShoulder_Medium_500_ORC_NH_HIGH : UConversationCameraPresetListenerOffset
{
    default PresetName = n"OVER THE SHOULDER MEDIUM 500 ORC NH HIGH";
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;    
    default MultiConversationValidity = EConversationMultiParticipantMode::OnlySpeakerListener;

    default PitchAdjustTarget = EConversationCameraFocusTarget::Speaker;

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Topic_Speak);
    

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 90.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 1.0f;
    default FilmbackPresetName = "35mm VistaVision";
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.f, 13.8f);
    default CameraFoVCurve.AddValueAt(0.0, 90.f);
    default CameraFocalLengthCurve.AddValueAt(0.0, 65.f);
    
    default ListenerPositionOffsetCurve.AddVectorAt(0.0f, FVector(-190.840134f, 101.962296f, 70.062195f));
    default ListenerRotationOffsetCurve.AddRotatorAt(0.0f, FRotator(-10.672354f, -16.56509f, 0.0f));

    default AnimSequenceName = n"CameraBreathCLOSE";
    default CameraModifiers.Add(UDirectionInputModifier::StaticClass());

    
    default CameraFocusPointOffset = 0.0f;
    
    default MinHeightDifference = 35.01f;
    default MaxHeightDifference = 65.0f;
   
    default MinDistance = 193.01f; 
    default MaxDistance = 650.0f; 

    default RequiredCharacterTagsListener.AddTag(GameplayTag::Species_Orc);

    default ForbiddenTagsSpeakerAndListener.AddTag(GameplayTag::Action_Ambient_LeanWall);

    
          

    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_HIGH::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_LONG::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_HIGH_LONG::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_CLOSE::StaticClass();   
    default PossibleTransitions.Last().Weight = 1.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_CLOSE_HIGH::StaticClass();   
    default PossibleTransitions.Last().Weight = 1.0f;

    

   
    //SUBCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy_500::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy_500_LONG::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    //SPEAK
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Wide_Speak_500::StaticClass();    
    default PossibleTransitions.Last().Weight = 80.0f;  

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Wide_Speak_500_LONG::StaticClass();    
    default PossibleTransitions.Last().Weight = 80.0f;    

      

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_HIGH::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 50.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_Orc::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 50.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_ORC_NH::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 50.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_Orc_HIGH::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 50.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_ORC_NH_HIGH::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 50.0f;

    

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_CloseUp::StaticClass();
    default PossibleTransitions.Last().Weight = 50.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_CloseUp_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 50.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_CloseUp_Orc_NH::StaticClass();
    default PossibleTransitions.Last().Weight = 50.0f;    

    
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium::StaticClass();
    default PossibleTransitions.Last().Weight = 55.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 55.0f;
    
     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc_NH::StaticClass();
    default PossibleTransitions.Last().Weight = 55.0f;    
    

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Wide::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::DuringMonolog;
    default PossibleTransitions.Last().Weight = 60.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_ExtraFull::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::DuringMonolog;
    default PossibleTransitions.Last().Weight = 45.0f;
    

    

    ///default close entero///

   default LightingParameters = LightingPresets::CloseShot();

    default LightingParameters.KeyLightParam.LightPos.AddVectorAt(0.0f, FVector(105.962036f, -145.830475f, 87.061447f));
    default LightingParameters.KeyLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-47.183167f, 115.15831f, 0.0f));
    default LightingParameters.KeyLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyLightParam.SourceHeight = 128.f;
    default LightingParameters.KeyLightParam.AttenuationRadius = 450.f;

    default LightingParameters.RimLightParam.LightPos.AddVectorAt(0.0f, FVector(-89.032387f, 174.166183f, 2.0f));
    default LightingParameters.RimLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-51.384537f, -97.303352f, 0.0f));
    default LightingParameters.RimLightParam.SourceWidth = 250.f;
    default LightingParameters.RimLightParam.SourceHeight = 128.f;
    default LightingParameters.RimLightParam.AttenuationRadius = 350.f;

    default LightingParameters.KeyReverseLightParam.LightPos.AddVectorAt(0.0f, FVector(3.960295f, 153.10582f, 102.495285f));
    default LightingParameters.KeyReverseLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-71.183342f, -78.903618f, 0.f));        
    default LightingParameters.KeyReverseLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyReverseLightParam.SourceHeight = 128.f;
    default LightingParameters.KeyReverseLightParam.AttenuationRadius = 250.f;            

    default LightingParameters.RimReverseLightParam.LightPos.AddVectorAt(0.0f, FVector(51.082512f, -164.402679f, 39.912994f));
    default LightingParameters.RimReverseLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-23.014482f, 89.094925f, 0.0f));
    default LightingParameters.RimReverseLightParam.SourceWidth = 250.f;
    default LightingParameters.RimReverseLightParam.SourceHeight = 128.f;
    default LightingParameters.RimReverseLightParam.AttenuationRadius = 300.f;
}
//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________


class UConversationPreset_Wide_Speak_500 : UConversationCameraPresetCenterOffset
{
    default PresetName = n"WIDE SPEAK 500";
    default LoopMode = EConversationCameraLoopMode::None;
    default FocusMode = EConversationCameraFocusMode::Speaker;
    default HideMode = EConversationCameraHideMode::None;
   

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Topic_Speak);    

   
    default bAlwaysValid = false;
    default bStaticActorTransforms = false;
    default bNeverUseForReverseShot = true; 

    default InitialChoiceWeight = 100.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.f, 2.f);
    default CameraFoVCurve.AddValueAt(0.0, 90.f);
    default CameraFocalLengthCurve.AddValueAt(0.0, 21.f);
    
    default CenterPositionCurve.AddVectorAt(0.0f, FVector(-19.670944f, -297.960388f, -54.249577f));
    default CenterRotationCurve.AddVectorAt(0.0f, FVector(0.368968f, -273.560608f, 0.173138f));

    default AnimSequenceName = n"CameraBreathWIDE";
    default CameraModifiers.Add(UDirectionInputModifier::StaticClass());

    
    default CameraFocusPointOffset = 0.0f;
    
      
    default MinDistance = 163.01f; 
    default MaxDistance = 310.0f; 
   

    
          

    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_HIGH::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_LONG::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_HIGH_LONG::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_CLOSE::StaticClass();   
    default PossibleTransitions.Last().Weight = 1.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_CLOSE_HIGH::StaticClass();   
    default PossibleTransitions.Last().Weight = 1.0f;

   

    
    

    //SUBCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy_500::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy_500_LONG::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    //SPEAK
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 50.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_Orc::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 50.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_ORC_NH::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 50.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_Orc_HIGH::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 50.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_ORC_NH_HIGH::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 50.0f;

    
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium::StaticClass();    
    default PossibleTransitions.Last().Weight = 70.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc::StaticClass();    
    default PossibleTransitions.Last().Weight = 70.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc_NH::StaticClass();    
    default PossibleTransitions.Last().Weight = 70.0f;

    //// Default Wide /////  

    default LightingParameters = LightingPresets::WideShot();

    

}

class UConversationPreset_Wide_Speak_500_LONG : UConversationCameraPresetCenterOffset
{
    default PresetName = n"WIDE SPEAK 500 LONG";
    default LoopMode = EConversationCameraLoopMode::None;
    default FocusMode = EConversationCameraFocusMode::Speaker;
    default HideMode = EConversationCameraHideMode::None;
    

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Topic_Speak);    
   

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;
    default bNeverUseForReverseShot = true; 

    default InitialChoiceWeight = 100.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.f, 2.f);
    default CameraFoVCurve.AddValueAt(0.0, 90.f);
    default CameraFocalLengthCurve.AddValueAt(0.0, 18.f);
    
    default CenterPositionCurve.AddVectorAt(0.0f, FVector(-36.027611f, -365.612305f, -31.260767f));
    default CenterRotationCurve.AddVectorAt(0.0f, FVector(0.214099f, -274.93631f, 0.172953f));

    default AnimSequenceName = n"CameraBreathWIDE";
    default CameraModifiers.Add(UDirectionInputModifier::StaticClass());

    
    default CameraFocusPointOffset = 0.0f;
    
       
    default MinDistance = 310.01f; 
    default MaxDistance = 515.0f; 

      

             

    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_HIGH::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_LONG::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_HIGH_LONG::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_CLOSE::StaticClass();   
    default PossibleTransitions.Last().Weight = 1.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_CLOSE_HIGH::StaticClass();   
    default PossibleTransitions.Last().Weight = 1.0f;

        
    

    //SUBCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy_500::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy_500_LONG::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    //SPEAK
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_HIGH::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 50.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_Orc::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 50.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_ORC_NH::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 50.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_Orc_HIGH::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 50.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_ORC_NH_HIGH::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 50.0f;

   

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium::StaticClass();    
    default PossibleTransitions.Last().Weight = 70.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc::StaticClass();    
    default PossibleTransitions.Last().Weight = 70.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc_NH::StaticClass();    
    default PossibleTransitions.Last().Weight = 70.0f;

    

    //// Default Wide /////  

    default LightingParameters = LightingPresets::WideShot();

    
}

//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________

class UConversationPreset_TwoShot_Cowboy_500 : UConversationCameraPresetListenerOffset
{
    default PresetName = n"TWO SHOT COWBOY 500";
    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::None;
    default FocusMode = EConversationCameraFocusMode::Speaker;

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_TopicChoice);
    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_SubChoice);

    default PitchAdjustTarget = EConversationCameraFocusTarget::Speaker;

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 100.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.0, 8.f);
    default CameraFoVCurve.AddValueAt(0.0, 90.000000);
    default CameraFocalLengthCurve.AddValueAt(0.0, 45.000000);

    default ListenerPositionOffsetCurve.AddVectorAt(0.f, FVector(-329.487518f, 411.808563f, -60.776215f));
    default ListenerRotationOffsetCurve.AddRotatorAt(0.f, FRotator(1.474397f, -43.44809f, -0.15648f));

    default AnimSequenceName = n"CameraBreathWIDE";

   
    default MinDistance = 173.01f; 
    default MaxDistance = 500.0f;     

    


    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_HIGH::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_LONG::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_HIGH_LONG::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_CLOSE::StaticClass();   
    default PossibleTransitions.Last().Weight = 1.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_CLOSE_HIGH::StaticClass();   
    default PossibleTransitions.Last().Weight = 1.0f;

  
   

    //SUBCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy_500::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy_500_LONG::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    //SPEAK
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_HIGH::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_ORC_NH::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_Orc_HIGH::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_ORC_NH_HIGH::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium::StaticClass();    
    default PossibleTransitions.Last().Weight = 70.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc::StaticClass();    
    default PossibleTransitions.Last().Weight = 70.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc_NH::StaticClass();    
    default PossibleTransitions.Last().Weight = 70.0f;
       

   
//// Default Wide Diagonal  /////  

   default LightingParameters = LightingPresets::WideShot();

    default LightingParameters.KeyLightParam.LightPos.AddVectorAt(0.0f, FVector(75.04361f, -271.275513f, 132.027939f));
    default LightingParameters.KeyLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-41.739227f, 78.336235f, 0.0f));
    default LightingParameters.KeyLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyLightParam.SourceHeight = 125.f;
    default LightingParameters.KeyLightParam.AttenuationRadius = 600.f;

    default LightingParameters.RimLightParam.LightPos.AddVectorAt(0.0f, FVector(-153.86528f, 397.966187f, 47.730236f));
    default LightingParameters.RimLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-14.703367f, -85.326378f, 0.762405f));
    default LightingParameters.RimLightParam.SourceWidth = 250.f;
    default LightingParameters.RimLightParam.SourceHeight = 128.f;
    default LightingParameters.RimLightParam.AttenuationRadius = 550.f;

    default LightingParameters.KeyReverseLightParam.LightPos.AddVectorAt(0.0f, FVector(129.892258f, 260.328705f, 149.683105f));
    default LightingParameters.KeyReverseLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-46.318157f, -111.255646f, 0.037285f));
    default LightingParameters.KeyReverseLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyReverseLightParam.SourceHeight = 125.f;
    default LightingParameters.KeyReverseLightParam.AttenuationRadius = 650.f;

    default LightingParameters.RimReverseLightParam.LightPos.AddVectorAt(0.0f, FVector(75.630623f, -376.245514f, 13.033268f));
    default LightingParameters.RimReverseLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-29.231775f, 86.614624f, 0.0f));
    default LightingParameters.RimReverseLightParam.SourceWidth = 250.f;
    default LightingParameters.RimReverseLightParam.SourceHeight = 125.f;
    default LightingParameters.RimReverseLightParam.AttenuationRadius = 550.f;
}


//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________


class UConversationPreset_TwoShot_Cowboy_500_LONG : UConversationCameraPresetListenerOffset
{
    default PresetName = n"TWO SHOT COWBOY 500 LONG";
    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::None;
    default FocusMode = EConversationCameraFocusMode::Speaker;

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_TopicChoice);
    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_SubChoice);

   
    default PitchAdjustTarget = EConversationCameraFocusTarget::Speaker;

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 100.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.0, 8.f);
    default CameraFoVCurve.AddValueAt(0.0, 90.000000);
    default CameraFocalLengthCurve.AddValueAt(0.0, 45.000000);

    default ListenerPositionOffsetCurve.AddVectorAt(0.0f, FVector(-251.951141f, 243.636047f, -18.804232f));
    default ListenerRotationOffsetCurve.AddRotatorAt(0.0f, FRotator(-1.628495f, -31.616116f, 0.161626f));

    default AnimSequenceName = n"CameraBreathWIDE";

   


    default MinDistance = 500.01f; 
    default MaxDistance = 650.0f;     

    


    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_HIGH::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_LONG::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_HIGH_LONG::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_CLOSE::StaticClass();   
    default PossibleTransitions.Last().Weight = 1.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_CLOSE_HIGH::StaticClass();   
    default PossibleTransitions.Last().Weight = 1.0f;

  
   

    //SUBCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy_500::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy_500_LONG::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    //SPEAK
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_HIGH::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_ORC_NH::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_Orc_HIGH::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_ORC_NH_HIGH::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium::StaticClass();    
    default PossibleTransitions.Last().Weight = 70.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc::StaticClass();    
    default PossibleTransitions.Last().Weight = 70.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc_NH::StaticClass();    
    default PossibleTransitions.Last().Weight = 70.0f;

        

//// Default Wide Diagonal  /////  

   default LightingParameters = LightingPresets::WideShot();

    default LightingParameters.KeyLightParam.LightPos.AddVectorAt(0.0f, FVector(75.04361f, -271.275513f, 132.027939f));
    default LightingParameters.KeyLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-41.739227f, 78.336235f, 0.0f));
    default LightingParameters.KeyLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyLightParam.SourceHeight = 125.f;
    default LightingParameters.KeyLightParam.AttenuationRadius = 600.f;

    default LightingParameters.RimLightParam.LightPos.AddVectorAt(0.0f, FVector(-153.86528f, 397.966187f, 47.730236f));
    default LightingParameters.RimLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-14.703367f, -85.326378f, 0.762405f));
    default LightingParameters.RimLightParam.SourceWidth = 250.f;
    default LightingParameters.RimLightParam.SourceHeight = 128.f;
    default LightingParameters.RimLightParam.AttenuationRadius = 550.f;

    default LightingParameters.KeyReverseLightParam.LightPos.AddVectorAt(0.0f, FVector(129.892258f, 260.328705f, 149.683105f));
    default LightingParameters.KeyReverseLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-46.318157f, -111.255646f, 0.037285f));
    default LightingParameters.KeyReverseLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyReverseLightParam.SourceHeight = 125.f;
    default LightingParameters.KeyReverseLightParam.AttenuationRadius = 650.f;

    default LightingParameters.RimReverseLightParam.LightPos.AddVectorAt(0.0f, FVector(75.630623f, -376.245514f, 13.033268f));
    default LightingParameters.RimReverseLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-29.231775f, 86.614624f, 0.0f));
    default LightingParameters.RimReverseLightParam.SourceWidth = 250.f;
    default LightingParameters.RimReverseLightParam.SourceHeight = 125.f;
    default LightingParameters.RimReverseLightParam.AttenuationRadius = 550.f;
}



//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________




///////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////    


//------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------------
//ORC SHOTS for ORCS---------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------------


class UConversationPreset_OverTheShoulder_Cowboy_Orc : UConversationCameraPresetListenerOffset
{
    default PresetName = n"OVER THE SHOULDER COWBOY ORC";
    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::None;
    default FocusMode = EConversationCameraFocusMode::Speaker;
    

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_TopicChoice_Start);
    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_TopicChoice);

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 100.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.0, 10.f);
    default CameraFoVCurve.AddValueAt(0.0, 90.f);
    default CameraFocalLengthCurve.AddValueAt(0.0, 60.f);

    default ListenerPositionOffsetCurve.AddVectorAt(0.0f, FVector(-183.089844f, 158.378799f, -49.547142f));
    default ListenerRotationOffsetCurve.AddRotatorAt(0.0f, FRotator(5.101134f, -32.969696f, -0.0f));   
    


    default AnimSequenceName = n"CameraBreathWIDE";

    
    default CameraFocusPointOffset = 0.0f;

    default MaxHeightDifference = 40.0f;       
    
    default MinDistance = 35.0f; 
    default MaxDistance = 180.0f;     

    default RequiredCharacterTagsSpeaker.AddTag(GameplayTag::Species_Orc);



    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_Orc::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    //SUBCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_CowboyHigh::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass =UConversationPreset_TwoShot_CowboyHighExtra::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_CowboyTC::StaticClass();    
    default PossibleTransitions.Last().Weight = 1.0f;

    //SPEAK
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_Orc::StaticClass();   
    default PossibleTransitions.Last().Weight = 80.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUp_Orc_NH::StaticClass();   
    default PossibleTransitions.Last().Weight = 80.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium::StaticClass();   
    default PossibleTransitions.Last().Weight = 80.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHigh_Orc::StaticClass();    
    default PossibleTransitions.Last().Weight = 80.0f;

       default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHigh_Orc_NH::StaticClass();    
    default PossibleTransitions.Last().Weight = 80.0f;


    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHigh::StaticClass();    
    default PossibleTransitions.Last().Weight = 80.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHighExtra_Orc::StaticClass();    
    default PossibleTransitions.Last().Weight = 80.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHighExtra_Orc_NH::StaticClass();    
    default PossibleTransitions.Last().Weight = 80.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHighExtra::StaticClass();    
    default PossibleTransitions.Last().Weight = 80.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Flat::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::DuringMonolog;    
    default PossibleTransitions.Last().Weight = 30.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_FlatHigh::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::DuringMonolog;    
    default PossibleTransitions.Last().Weight = 30.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

    
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc_NH::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;


    

    default PitchAdjustTarget = EConversationCameraFocusTarget::Speaker;

     ///default close///

   default LightingParameters = LightingPresets::CloseShot();

    
}
//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________


class UConversationPreset_OverTheShoulder_CowboyHigh_Orc : UConversationCameraPresetListenerOffset
{
    default PresetName = n"OVER THE SHOULDER COWBOY HIGH ORC";
    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::None;
    default FocusMode = EConversationCameraFocusMode::Speaker;
    
      
    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_TopicChoice_Start);
    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_TopicChoice);

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 100.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.0, 10.f);
    default CameraFoVCurve.AddValueAt(0.0, 90.f);
    default CameraFocalLengthCurve.AddValueAt(0.0, 60.f);

    default ListenerPositionOffsetCurve.AddVectorAt(0.0f, FVector(-183.089844f, 158.378799f, -89.547142f));
    default ListenerRotationOffsetCurve.AddRotatorAt(0.0f, FRotator(12.101134f, -30.969696f, -0.0f));  
    

    default AnimSequenceName = n"CameraBreathWIDE";

    
    default CameraFocusPointOffset = 0.0f;

    default MinHeightDifference = 40.01f;    
    default MaxHeightDifference = 60.0f;       
    
    default MinDistance = 40.0f; 
    default MaxDistance = 200.0f; 

    default RequiredCharacterTagsSpeaker.AddTag(GameplayTag::Species_Orc);


    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHigh_Orc::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    //SUBCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_CowboyHigh::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass =UConversationPreset_TwoShot_CowboyHighExtra::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_CowboyTC::StaticClass();    
    default PossibleTransitions.Last().Weight = 1.0f;

    //SPEAK
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHigh::StaticClass();    
    default PossibleTransitions.Last().Weight = 80.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHigh_Orc::StaticClass();    
    default PossibleTransitions.Last().Weight = 80.0f;

    
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHigh_Orc_NH::StaticClass();    
    default PossibleTransitions.Last().Weight = 80.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_FlatHigh::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::DuringMonolog;    
    default PossibleTransitions.Last().Weight = 30.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

       default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc_NH::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

   


    default PitchAdjustTarget = EConversationCameraFocusTarget::Speaker;

     ///default close ///

   default LightingParameters = LightingPresets::CloseShot();

    
}
//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________




class UConversationPreset_OverTheShoulder_CowboyHighExtra_Orc : UConversationCameraPresetListenerOffset
{
    default PresetName = n"OVER THE SHOULDER COWBOY HIGH EXTRA ORC";
    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::None;
    default FocusMode = EConversationCameraFocusMode::Speaker;
    
      
    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_TopicChoice_Start);
    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_TopicChoice);

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 100.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.0, 10.f);
    default CameraFoVCurve.AddValueAt(0.0, 90.f);
    default CameraFocalLengthCurve.AddValueAt(0.0, 60.f);

    
    default ListenerPositionOffsetCurve.AddVectorAt(0.0f, FVector(-183.089844f, 158.378799f, -129.547142f));
    default ListenerRotationOffsetCurve.AddRotatorAt(0.0f, FRotator(18.101134f, -30.969696f, -0.0f)); 

    default AnimSequenceName = n"CameraBreathWIDE";

    
    default CameraFocusPointOffset = 0.0f;

    default MinHeightDifference = 60.01f;    
    default MaxHeightDifference = 105.0f;       
    
    default MinDistance = 40.0f; 
    default MaxDistance = 200.0f; 

    default RequiredCharacterTagsSpeaker.AddTag(GameplayTag::Species_Orc);


    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHighExtra_Orc::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    //SUBCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_CowboyHigh::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass =UConversationPreset_TwoShot_CowboyHighExtra::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_CowboyTC::StaticClass();    
    default PossibleTransitions.Last().Weight = 1.0f;

    //SPEAK
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHighExtra::StaticClass();    
    default PossibleTransitions.Last().Weight = 80.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHighExtra_Orc::StaticClass();    
    default PossibleTransitions.Last().Weight = 80.0f;

      default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHighExtra_Orc_NH::StaticClass();    
    default PossibleTransitions.Last().Weight = 80.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_FlatHigh::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::DuringMonolog;    
    default PossibleTransitions.Last().Weight = 30.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc_NH::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

    

    default PitchAdjustTarget = EConversationCameraFocusTarget::Speaker;

     ///default close ///

   default LightingParameters = LightingPresets::CloseShot();

    
    
}

// //______________________________________________________________________________________________________________________________________________________________________
// //______________________________________________________________________________________________________________________________________________________________________


class UConversationPreset_OverTheShoulder_Medium_Orc : UConversationCameraPresetListenerOffset
{
    default PresetName = n"OVER THE SHOULDER MEDIUM ORC";
    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;
    default HideMode = EConversationCameraHideMode::HideListenerWeapon;

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Topic_Speak);

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 100.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 1.0f;
    default FilmbackPresetName = "35mm VistaVision";
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.f, 9.f);
    default CameraFoVCurve.AddValueAt(0.0, 90.f);
    default CameraFocalLengthCurve.AddValueAt(0.0, 55.f);
    
    default ListenerPositionOffsetCurve.AddVectorAt(0.0f, FVector(-83.907227f, 92.291733f, -21.227997f));
    default ListenerRotationOffsetCurve.AddRotatorAt(0.0f, FRotator(4.5f, -33.098923f, 0.240529f));   
       


    default AnimSequenceName = n"CameraBreathCLOSE";
    default CameraModifiers.Add(UDirectionInputModifier::StaticClass());

    
    default CameraFocusPointOffset = 0.0f;
    
    default MaxHeightDifference = 35.0f;
   
    default MinDistance = 30.0f; 
    default MaxDistance = 170.0f; 

    default RequiredCharacterTagsSpeaker.AddTag(GameplayTag::Species_Orc);
    
    default ForbiddenTagsSpeakerAndListener.AddTag(GameplayTag::Action_Ambient_LeanWall);
          

    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Full::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHigh_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;
        

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_WideTC::StaticClass();
    default PossibleTransitions.Last().Weight = 10.0f;

    //SUBCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_ExtraWide::StaticClass();
    default PossibleTransitions.Last().Weight = 50.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_CowboyHigh::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_CowboyTC::StaticClass();
    default PossibleTransitions.Last().Weight = 10.0f;

    //SPEAK
    // default PossibleTransitions.Add(FPresetTransitionEntry());
    // default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUp::StaticClass();
    // default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    // default PossibleTransitions.Last().Weight = 80.0f;

    // default PossibleTransitions.Add(FPresetTransitionEntry());
    // default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUp_Orc::StaticClass();
    // default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    // default PossibleTransitions.Last().Weight = 80.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUp_Orc_NH::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 80.0f;

    // default PossibleTransitions.Add(FPresetTransitionEntry());
    // default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHigh::StaticClass();  
    // default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog; 
    // default PossibleTransitions.Last().Weight = 80.0f;

    //  default PossibleTransitions.Add(FPresetTransitionEntry());
    // default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHigh_Orc::StaticClass();  
    // default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog; 
    // default PossibleTransitions.Last().Weight = 80.0f;

      default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHigh_Orc_NH::StaticClass();  
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog; 
    default PossibleTransitions.Last().Weight = 80.0f;
    

    // default PossibleTransitions.Add(FPresetTransitionEntry());
    // default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium::StaticClass();
    // default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    // default PossibleTransitions.Last().Weight = 50.0f;

    // default PossibleTransitions.Add(FPresetTransitionEntry());
    // default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_Orc::StaticClass();
    // default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    // default PossibleTransitions.Last().Weight = 50.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_Orc_NH::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 50.0f;


    // default PossibleTransitions.Add(FPresetTransitionEntry());
    // default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_CloseUp::StaticClass();
    // default PossibleTransitions.Last().Weight = 50.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_CloseUp_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 80.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_CloseUp_Orc_NH::StaticClass();
    default PossibleTransitions.Last().Weight = 50.0f;
    
    
    // default PossibleTransitions.Add(FPresetTransitionEntry());
    // default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium::StaticClass();
    // default PossibleTransitions.Last().Weight = 55.0f;

    
    // default PossibleTransitions.Add(FPresetTransitionEntry());
    // default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc::StaticClass();
    // default PossibleTransitions.Last().Weight = 55.0f;

       default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc_NH::StaticClass();
    default PossibleTransitions.Last().Weight = 60.0f;
   

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Flat::StaticClass();    
    default PossibleTransitions.Last().Weight = 70.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_FlatHigh::StaticClass();    
    default PossibleTransitions.Last().Weight = 70.0f;   

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Wide::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::DuringMonolog;
    default PossibleTransitions.Last().Weight = 50.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_ExtraFull::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::DuringMonolog;
    default PossibleTransitions.Last().Weight = 40.0f;
    

    default PitchAdjustTarget = EConversationCameraFocusTarget::Speaker;

    default LightingParameters = LightingPresets::CloseShot();
}
//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________


class UConversationPreset_OverTheShoulder_MediumHigh_Orc : UConversationCameraPresetListenerOffset
{
    default PresetName = n"OVER THE SHOULDER MEDIUM HIGH ORC";
    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;
    default HideMode = EConversationCameraHideMode::HideListenerWeapon;

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Topic_Speak);

    default PitchAdjustTarget = EConversationCameraFocusTarget::Speaker;

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 100.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 1.0f;
    default FilmbackPresetName = "35mm VistaVision";
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.f, 7.f);
    default CameraFoVCurve.AddValueAt(0.0, 90.f);
    default CameraFocalLengthCurve.AddValueAt(0.0, 55.f);
    
    default ListenerPositionOffsetCurve.AddVectorAt(0.0f, FVector(-84.419479f, 88.893463f, -30.02297f));
    default ListenerRotationOffsetCurve.AddRotatorAt(0.0f, FRotator(6.6f, -31.11956f, 0.0f));   



    default AnimSequenceName = n"CameraBreathCLOSE";
    default CameraModifiers.Add(UDirectionInputModifier::StaticClass());

    
    default CameraFocusPointOffset = 0.0f;
    
    default MinHeightDifference = 35.01f; 
    default MaxHeightDifference = 60.0f;
   
    default MinDistance = 30.0f; 
    default MaxDistance = 170.0f; 

    default RequiredCharacterTagsSpeaker.AddTag(GameplayTag::Species_Orc);
          

    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Full::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHigh_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;    

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_WideTC::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

    //SUBCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_ExtraWide::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_CowboyHigh::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_CowboyTC::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

    //SPEAK
    // default PossibleTransitions.Add(FPresetTransitionEntry());
    // default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHighExtra::StaticClass();  
    // default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog; 
    // default PossibleTransitions.Last().Weight = 80.0f;

    // default PossibleTransitions.Add(FPresetTransitionEntry());
    // default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHighExtra_Orc::StaticClass();  
    // default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog; 
    // default PossibleTransitions.Last().Weight = 80.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUp_Orc_NH::StaticClass();  
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog; 
    default PossibleTransitions.Last().Weight = 80.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHigh_Orc_NH::StaticClass();  
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog; 
    default PossibleTransitions.Last().Weight = 80.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHighExtra_Orc_NH::StaticClass();  
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog; 
    default PossibleTransitions.Last().Weight = 80.0f;

    // default PossibleTransitions.Add(FPresetTransitionEntry());
    // default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHigh::StaticClass();
    // default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    // default PossibleTransitions.Last().Weight = 50.0f;

    // default PossibleTransitions.Add(FPresetTransitionEntry());
    // default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHigh_Orc::StaticClass();
    // default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    // default PossibleTransitions.Last().Weight = 50.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_Orc_NH::StaticClass();  
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog; 
    default PossibleTransitions.Last().Weight = 40.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHigh_Orc_NH::StaticClass();  
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog; 
    default PossibleTransitions.Last().Weight = 40.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHighExtra_Orc_NH::StaticClass();  
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog; 
    default PossibleTransitions.Last().Weight = 40.0f;


    // default PossibleTransitions.Add(FPresetTransitionEntry());
    // default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_CloseUp::StaticClass();
    // default PossibleTransitions.Last().Weight = 50.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_CloseUp_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 80.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_CloseUp_Orc_NH::StaticClass();
    default PossibleTransitions.Last().Weight = 50.0f; 

   
    
    // default PossibleTransitions.Add(FPresetTransitionEntry());
    // default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium::StaticClass();
    // default PossibleTransitions.Last().Weight = 55.0f;

    //  default PossibleTransitions.Add(FPresetTransitionEntry());
    // default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc::StaticClass();
    // default PossibleTransitions.Last().Weight = 55.0f;

      default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc_NH::StaticClass();
    default PossibleTransitions.Last().Weight = 60.0f;
    
    
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Flat::StaticClass();
    default PossibleTransitions.Last().Weight = 70.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_FlatHigh::StaticClass();
    default PossibleTransitions.Last().Weight = 70.0f;

    

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Wide::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::DuringMonolog;
    default PossibleTransitions.Last().Weight = 50.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_ExtraFull::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::DuringMonolog;
    default PossibleTransitions.Last().Weight = 40.0f;

    

    default LightingParameters = LightingPresets::CloseShot();
}
//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________




class UConversationPreset_OverTheShoulder_MediumHighExtra_Orc : UConversationCameraPresetListenerOffset
{
    default PresetName = n"OVER THE SHOULDER MEDIUM HIGH EXTRA ORC";
    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;
    default HideMode = EConversationCameraHideMode::HideListenerWeapon;

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Topic_Speak);

    default PitchAdjustTarget = EConversationCameraFocusTarget::Speaker;

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 100.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 1.0f;
    default FilmbackPresetName = "35mm VistaVision";
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.f, 7.f);
    default CameraFoVCurve.AddValueAt(0.0, 90.f);
    default CameraFocalLengthCurve.AddValueAt(0.0, 55.f);
    
    default ListenerPositionOffsetCurve.AddVectorAt(0.0f, FVector(-80.168091f, 90.933067f, -45.054573f));
    default ListenerRotationOffsetCurve.AddRotatorAt(0.0f, FRotator(10.6f, -32.604855f, -1.029561f));
    

    default AnimSequenceName = n"CameraBreathCLOSE";
    default CameraModifiers.Add(UDirectionInputModifier::StaticClass());

    
    default CameraFocusPointOffset = 0.0f;
    
    default MinHeightDifference = 60.01f; 
    default MaxHeightDifference = 85.0f;
   
    default MinDistance = 30.0f; 
    default MaxDistance = 170.0f; 

    default RequiredCharacterTagsSpeaker.AddTag(GameplayTag::Species_Orc);
          

    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Full::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHigh_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHighExtra_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;   
    

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_WideTC::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

    //SUBCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_ExtraWide::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_CowboyHigh::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_CowboyHighExtra::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_CowboyTC::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

    //SPEAK
    // default PossibleTransitions.Add(FPresetTransitionEntry());
    // default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHighExtra::StaticClass();  
    // default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog; 
    // default PossibleTransitions.Last().Weight = 80.0f;

    //  default PossibleTransitions.Add(FPresetTransitionEntry());
    // default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHighExtra_Orc::StaticClass();  
    // default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog; 
    // default PossibleTransitions.Last().Weight = 80.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHigh_Orc_NH::StaticClass();  
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog; 
    default PossibleTransitions.Last().Weight = 80.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHighExtra_Orc_NH::StaticClass();  
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog; 
    default PossibleTransitions.Last().Weight = 80.0f;

    // default PossibleTransitions.Add(FPresetTransitionEntry());
    // default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHighExtra::StaticClass();
    // default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    // default PossibleTransitions.Last().Weight = 50.0f;

    //  default PossibleTransitions.Add(FPresetTransitionEntry());
    // default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHighExtra_Orc::StaticClass();
    // default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    // default PossibleTransitions.Last().Weight = 50.0f;

    
     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHigh_Orc_NH::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 40.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHighExtra_Orc_NH::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 40.0f;

    // default PossibleTransitions.Add(FPresetTransitionEntry());
    // default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_CloseUp::StaticClass();
    // default PossibleTransitions.Last().Weight = 50.0f;

       default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_CloseUp_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 80.0f;

       default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_CloseUp_Orc_NH::StaticClass();
    default PossibleTransitions.Last().Weight = 50.0f;
    

    // default PossibleTransitions.Add(FPresetTransitionEntry());
    // default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium::StaticClass();
    // default PossibleTransitions.Last().Weight = 55.0f;

    // default PossibleTransitions.Add(FPresetTransitionEntry());
    // default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc::StaticClass();
    // default PossibleTransitions.Last().Weight = 55.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc_NH::StaticClass();
    default PossibleTransitions.Last().Weight = 60.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Flat::StaticClass();    
    default PossibleTransitions.Last().Weight = 70.0f;     

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_FlatHigh::StaticClass();    
    default PossibleTransitions.Last().Weight = 70.0f;
    

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Wide::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::DuringMonolog;
    default PossibleTransitions.Last().Weight = 50.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_ExtraFull::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::DuringMonolog;
    default PossibleTransitions.Last().Weight = 40.0f;


    

    default LightingParameters = LightingPresets::CloseShot();
}
//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________



class UConversationPreset_OverTheShoulder_CloseUp_Orc : UConversationCameraPresetListenerOffset
{
    default PresetName = n"OVER THE SHOULDER CLOSE UP ORC";
    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;
    default HideMode = EConversationCameraHideMode::HideListenerWeapon;

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Topic_Speak);

    default PitchAdjustTarget = EConversationCameraFocusTarget::Speaker;

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 100.0f;
    default TransitionTime = 0.0f;

     default SqueezeFactor = 1.0f;
    default FilmbackPresetName = "35mm VistaVision";
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.f, 11.f);
    default CameraFoVCurve.AddValueAt(0.f, 90.f);
    default CameraFocalLengthCurve.AddValueAt(0.f, 80.f);

    default ListenerPositionOffsetCurve.AddVectorAt(0.0f, FVector(-121.876129f, 92.538109f, 0.0f));
    default ListenerRotationOffsetCurve.AddRotatorAt(0.0f, FRotator(0.f, -26.334686f, 0.520526f));    

     
    default AnimSequenceName = n"CameraBreathCLOSE";
    default CameraModifiers.Add(UDirectionInputModifier::StaticClass());

    
    default CameraFocusPointOffset = 0.f;

    default MaxHeightDifference = 20.0f;      

    // default MinDistance = 35.0f; 
    default MaxDistance = 250.0f;   

    default RequiredCharacterTagsSpeaker.AddTag(GameplayTag::Species_Orc);
         

    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Full::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHigh_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;    

    
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_CowboyTC::StaticClass();
    default PossibleTransitions.Last().Weight = 10.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_WideTC::StaticClass();
    default PossibleTransitions.Last().Weight = 10.0f;

    //SUBCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_CowboyHigh::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_ExtraWide::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;
    

    //SPEAK
    // default PossibleTransitions.Add(FPresetTransitionEntry());
    // default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium::StaticClass();
    // default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    // default PossibleTransitions.Last().Weight = 50.0f;

    //  default PossibleTransitions.Add(FPresetTransitionEntry());
    // default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_Orc::StaticClass();
    // default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    // default PossibleTransitions.Last().Weight = 50.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_Orc_NH::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 40.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHigh_Orc_NH::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 40.0f;

    // default PossibleTransitions.Add(FPresetTransitionEntry());
    // default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUp::StaticClass();
    // default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    // default PossibleTransitions.Last().Weight = 35.0f;

    //  default PossibleTransitions.Add(FPresetTransitionEntry());
    // default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUp_Orc::StaticClass();
    // default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    // default PossibleTransitions.Last().Weight = 35.0f;

      default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUp_Orc_NH::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 90.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHigh_Orc_NH::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 90.0f;

    // default PossibleTransitions.Add(FPresetTransitionEntry());
    // default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium::StaticClass();    
    // default PossibleTransitions.Last().Weight = 70.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc::StaticClass();    
    default PossibleTransitions.Last().Weight = 70.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc_NH::StaticClass();    
    default PossibleTransitions.Last().Weight = 70.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Flat::StaticClass();    
    default PossibleTransitions.Last().Weight = 70.0f;     

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_FlatHigh::StaticClass();    
    default PossibleTransitions.Last().Weight = 70.0f;
    

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Wide::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::DuringMonolog;
    default PossibleTransitions.Last().Weight = 50.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_ExtraFull::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::DuringMonolog;
    default PossibleTransitions.Last().Weight = 40.0f;  


   
    

    default LightingParameters = LightingPresets::CloseShot();
}

//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________


class UConversationPreset_OverTheShoulder_CloseUpHigh_Orc : UConversationCameraPresetListenerOffset
{
    default PresetName = n"OVER THE SHOULDER CLOSE UP HIGH ORC";
    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;
    default HideMode = EConversationCameraHideMode::HideListenerWeapon;

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Topic_Speak);

    default PitchAdjustTarget = EConversationCameraFocusTarget::Speaker;

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 100.0f;
    default TransitionTime = 0.0f;

     default SqueezeFactor = 1.0f;
    default FilmbackPresetName = "35mm VistaVision";
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.f, 11.f);
    default CameraFoVCurve.AddValueAt(0.f, 90.f);
    default CameraFocalLengthCurve.AddValueAt(0.f, 80.f);

    default ListenerPositionOffsetCurve.AddVectorAt(0.0f, FVector(-118.017166f, 97.962349f, -11.543534f));
    default ListenerRotationOffsetCurve.AddRotatorAt(0.0f, FRotator(3.4f, -29.544876f, 0.0f));   

   

    default AnimSequenceName = n"CameraBreathCLOSE";
    default CameraModifiers.Add(UDirectionInputModifier::StaticClass());

    
    default CameraFocusPointOffset = 0.f;

    default MinHeightDifference = 20.01f;
    default MaxHeightDifference = 30.0f;      

    // default MinDistance = 35.0f; 
    default MaxDistance = 250.0f;     

    default RequiredCharacterTagsSpeaker.AddTag(GameplayTag::Species_Orc);
     

     //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Full::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHigh_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;    

    
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_CowboyTC::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_WideTC::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

    //SUBCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_CowboyHigh::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_ExtraWide::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;
    

    //SPEAK
    // default PossibleTransitions.Add(FPresetTransitionEntry());
    // default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium::StaticClass();
    // default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    // default PossibleTransitions.Last().Weight = 50.0f;

    //  default PossibleTransitions.Add(FPresetTransitionEntry());
    // default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_Orc::StaticClass();
    // default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    // default PossibleTransitions.Last().Weight = 50.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_Orc_NH::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 40.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHigh_Orc_NH::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 40.0f;

    // default PossibleTransitions.Add(FPresetTransitionEntry());
    // default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUp::StaticClass();
    // default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    // default PossibleTransitions.Last().Weight = 35.0f;

    //  default PossibleTransitions.Add(FPresetTransitionEntry());
    // default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUp_Orc::StaticClass();
    // default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    // default PossibleTransitions.Last().Weight = 35.0f;

      default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUp_Orc_NH::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 90.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHigh_Orc_NH::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 90.0f;

    // default PossibleTransitions.Add(FPresetTransitionEntry());
    // default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium::StaticClass();    
    // default PossibleTransitions.Last().Weight = 70.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc::StaticClass();    
    default PossibleTransitions.Last().Weight = 70.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc_NH::StaticClass();    
    default PossibleTransitions.Last().Weight = 70.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Flat::StaticClass();    
    default PossibleTransitions.Last().Weight = 70.0f;     

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_FlatHigh::StaticClass();    
    default PossibleTransitions.Last().Weight = 70.0f;
    

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Wide::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::DuringMonolog;
    default PossibleTransitions.Last().Weight = 50.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_ExtraFull::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::DuringMonolog;
    default PossibleTransitions.Last().Weight = 40.0f;  


    

    default LightingParameters = LightingPresets::CloseShot();
}

//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________


class UConversationPreset_OverTheShoulder_CloseUpHighExtra_Orc : UConversationCameraPresetListenerOffset
{
    default PresetName = n"OVER THE SHOULDER CLOSE UP HIGH EXTRA ORC";
    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;
    default HideMode = EConversationCameraHideMode::HideListenerWeapon;

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Topic_Speak);

    default PitchAdjustTarget = EConversationCameraFocusTarget::Speaker;

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 100.0f;
    default TransitionTime = 0.0f;

     default SqueezeFactor = 1.0f;
    default FilmbackPresetName = "35mm VistaVision";
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.f, 11.f);
    default CameraFoVCurve.AddValueAt(0.f, 90.f);
    default CameraFocalLengthCurve.AddValueAt(0.f, 80.f);

    default ListenerPositionOffsetCurve.AddVectorAt(0.0f, FVector(-118.017166f, 93.962349f, -19.543534f));
    default ListenerRotationOffsetCurve.AddRotatorAt(0.0f, FRotator(5.065922f, -27.544876f, 0.0f)); 

    default AnimSequenceName = n"CameraBreathCLOSE";
    default CameraModifiers.Add(UDirectionInputModifier::StaticClass());

    
    default CameraFocusPointOffset = 0.f;

    default MinHeightDifference = 30.01f;
    default MaxHeightDifference = 45.0f;      

    // default MinDistance = 35.0f; 
    default MaxDistance = 250.0f;    

    default RequiredCharacterTagsSpeaker.AddTag(GameplayTag::Species_Orc);
     
    
    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Full::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHigh_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;    

    
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_CowboyTC::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_WideTC::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

    //SUBCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_CowboyHigh::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_ExtraWide::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;
    

    //SPEAK
    // default PossibleTransitions.Add(FPresetTransitionEntry());
    // default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium::StaticClass();
    // default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    // default PossibleTransitions.Last().Weight = 50.0f;

    //  default PossibleTransitions.Add(FPresetTransitionEntry());
    // default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_Orc::StaticClass();
    // default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    // default PossibleTransitions.Last().Weight = 50.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHigh_Orc_NH::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 40.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHighExtra_Orc_NH::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 40.0f;

    // default PossibleTransitions.Add(FPresetTransitionEntry());
    // default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUp::StaticClass();
    // default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    // default PossibleTransitions.Last().Weight = 35.0f;

    //  default PossibleTransitions.Add(FPresetTransitionEntry());
    // default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUp_Orc::StaticClass();
    // default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    // default PossibleTransitions.Last().Weight = 35.0f;

      default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHigh_Orc_NH::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 90.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHighExtra_Orc_NH::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 90.0f;

    // default PossibleTransitions.Add(FPresetTransitionEntry());
    // default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium::StaticClass();    
    // default PossibleTransitions.Last().Weight = 70.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc::StaticClass();    
    default PossibleTransitions.Last().Weight = 70.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc_NH::StaticClass();    
    default PossibleTransitions.Last().Weight = 70.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Flat::StaticClass();    
    default PossibleTransitions.Last().Weight = 70.0f;     

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_FlatHigh::StaticClass();    
    default PossibleTransitions.Last().Weight = 70.0f;
    

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Wide::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::DuringMonolog;
    default PossibleTransitions.Last().Weight = 50.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_ExtraFull::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::DuringMonolog;
    default PossibleTransitions.Last().Weight = 40.0f;   

   

    

    default LightingParameters = LightingPresets::CloseShot();
}

////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


class UConversationPreset_Individual_Medium_Orc : UConversationCameraHeightAdjustSpeaker
{
    default PresetName = n"INDIVIDUAL MEDIUM ORC";
    default HideMode = EConversationCameraHideMode::HideListener;
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Topic_Speak);
    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Topic_Start);

    default PitchAdjustTarget = EConversationCameraFocusTarget::None;

    default ForbiddenCharacterTagsListener.AddTag(GameplayTag::State_Combat_Melee_Torch);

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 100.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 1.0f;
    default FilmbackPresetName = "35mm VistaVision";
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.0, 8.f);
    default CameraFoVCurve.AddValueAt(0.0, 90.000000);
    default CameraFocalLengthCurve.AddValueAt(0.0, 55.000000);

    default AdjustedPositionOffsetCurve.AddVectorAt(0.0f, FVector(191.123184f, -109.519844f, -29.373243f));
    default AdjustedRotationCurve.AddRotatorAt(0.0f, FRotator(6.688846f, -211.3405f, -0.007354f));

     // Values to control the pitch towards Listener
    default MinPitchToListener = -35.0f;
    default MaxPitchToListener = 35.0f;
    default PitchToListenerMultiplier = 0.8f;
   
     
    default AnimSequenceName = n"CameraBreathCLOSE";
    default CameraModifiers.Add(UDirectionInputModifier::StaticClass());

    
    default CameraFocusPointOffset = 0.f;

   
    default RequiredCharacterTagsSpeaker.AddTag(GameplayTag::Species_Orc);

       



    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHigh::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHigh_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_HIGH::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_LONG::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_HIGH_LONG::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_CLOSE::StaticClass();   
    default PossibleTransitions.Last().Weight = 1.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_CLOSE_HIGH::StaticClass();   
    default PossibleTransitions.Last().Weight = 1.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_WideTC::StaticClass();
    default PossibleTransitions.Last().Weight = 10.0f;

   
    

    //SUBCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy_500::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy_500_LONG::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_CowboyHigh::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_CowboyHighExtra::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_CowboyTC::StaticClass();
    default PossibleTransitions.Last().Weight = 10.0f;

    

    //SPEAK
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUp::StaticClass();
    default PossibleTransitions.Last().Weight = 75.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Wide_Speak_500::StaticClass();
    default PossibleTransitions.Last().Weight = 75.0f;

      default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 70.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_ORC_NH::StaticClass();
    default PossibleTransitions.Last().Weight = 70.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_Orc_HIGH::StaticClass();
    default PossibleTransitions.Last().Weight = 70.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_ORC_NH_HIGH::StaticClass();
    default PossibleTransitions.Last().Weight = 70.0f;   

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUp_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 75.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUp_Orc_NH::StaticClass();
    default PossibleTransitions.Last().Weight = 75.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHigh::StaticClass();    
    default PossibleTransitions.Last().Weight = 75.0f;

      default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Wide_Speak_500_LONG::StaticClass();    
    default PossibleTransitions.Last().Weight = 75.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHigh_Orc::StaticClass();    
    default PossibleTransitions.Last().Weight = 75.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHigh_Orc_NH::StaticClass();    
    default PossibleTransitions.Last().Weight = 75.0f;


    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHighExtra::StaticClass();    
    default PossibleTransitions.Last().Weight = 75.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHighExtra_Orc::StaticClass();    
    default PossibleTransitions.Last().Weight = 75.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHighExtra_Orc_NH::StaticClass();    
    default PossibleTransitions.Last().Weight = 75.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_CloseUp::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 60.0f;  

    
    // default PossibleTransitions.Add(FPresetTransitionEntry());
    // default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_CloseUp_Orc::StaticClass();
    // default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    // default PossibleTransitions.Last().Weight = 60.0f; 

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_CloseUp_Orc_NH::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 60.0f;  
     

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 20.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 20.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc_NH::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 20.0f;  


    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_CloseUp::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;  

    //   default PossibleTransitions.Add(FPresetTransitionEntry());
    // default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_CloseUp_Orc::StaticClass();
    // default PossibleTransitions.Last().Weight = 1.0f;  

      default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_CloseUp_Orc_NH::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;  

    
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc_NH::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

  




        

    default LightingParameters = LightingPresets::CloseShot();

    
}
//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________


class UConversationPreset_Individual_CloseUp_Orc : UConversationCameraHeightAdjustSpeaker
{
    default PresetName = n"INDIVIDUAL CLOSE UP ORC";
    default HideMode = EConversationCameraHideMode::HideListener;
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Topic_Speak);

    default PitchAdjustTarget = EConversationCameraFocusTarget::None;

    default ForbiddenCharacterTagsListener.AddTag(GameplayTag::State_Combat_Melee_Torch);

    default bAlwaysValid = false;
  
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 100.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 1.0f;
    default FilmbackPresetName = "35mm VistaVision";
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.0, 10.000000);
    default CameraFoVCurve.AddValueAt(0.0, 90.000000);
    default CameraFocalLengthCurve.AddValueAt(0.0, 60.000000);

    default AdjustedPositionOffsetCurve.AddVectorAt(0.0f, FVector(181.732788f, -53.663074f, -23.677612f));
    default AdjustedRotationCurve.AddRotatorAt(0.0f, FRotator(7.4f, -198.452545f, 0.0f));

     // Values to control the pitch towards Listener
    default MinPitchToListener = -35.0f;
    default MaxPitchToListener = 35.0f;
    default PitchToListenerMultiplier = 0.8f;
    
     
    
    default AnimSequenceName = n"CameraBreathCLOSE";
    default CameraModifiers.Add(UDirectionInputModifier::StaticClass());

    
    default CameraFocusPointOffset = 0.0f;

    
    default RequiredCharacterTagsSpeaker.AddTag(GameplayTag::Species_Orc);
      



    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHigh::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHigh_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHighExtra::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHighExtra_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_HIGH::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_LONG::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_HIGH_LONG::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_CLOSE::StaticClass();   
    default PossibleTransitions.Last().Weight = 1.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_CLOSE_HIGH::StaticClass();   
    default PossibleTransitions.Last().Weight = 1.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_WideTC::StaticClass();
    default PossibleTransitions.Last().Weight = 10.0f;

   

   

    //SUBCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy_500::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy_500_LONG::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_CowboyHigh::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_CowboyTC::StaticClass();
    default PossibleTransitions.Last().Weight = 10.0f;

   

    //SPEAK
    

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 60.0f;

    // default PossibleTransitions.Add(FPresetTransitionEntry());
    // default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc::StaticClass();
    // default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    // default PossibleTransitions.Last().Weight = 60.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc_NH::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 60.0f;   


    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_CloseUp::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 20.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_CloseUp_Orc::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 20.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_CloseUp_Orc_NH::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 20.0f;
    

    
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium::StaticClass();    
    default PossibleTransitions.Last().Weight = 90.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500::StaticClass();    
    default PossibleTransitions.Last().Weight = 90.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 90.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_ORC_NH::StaticClass();
    default PossibleTransitions.Last().Weight = 90.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_Orc_HIGH::StaticClass();
    default PossibleTransitions.Last().Weight = 90.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_ORC_NH_HIGH::StaticClass();
    default PossibleTransitions.Last().Weight = 90.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_Orc::StaticClass();    
    default PossibleTransitions.Last().Weight = 90.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_Orc_NH::StaticClass();    
    default PossibleTransitions.Last().Weight = 90.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUp::StaticClass();    
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 60.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Wide_Speak_500::StaticClass();  
    default PossibleTransitions.Last().Weight = 60.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUp_Orc::StaticClass();    
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 60.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUp_Orc_NH::StaticClass();    
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 60.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHigh::StaticClass();    
    default PossibleTransitions.Last().Weight = 90.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_HIGH::StaticClass();    
    default PossibleTransitions.Last().Weight = 90.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHigh_Orc::StaticClass();    
    default PossibleTransitions.Last().Weight = 90.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHigh_Orc_NH::StaticClass();    
    default PossibleTransitions.Last().Weight = 90.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHigh::StaticClass();    
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 60.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Wide_Speak_500_LONG::StaticClass();    
    default PossibleTransitions.Last().Weight = 60.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHigh_Orc::StaticClass();    
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 60.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHigh_Orc_NH::StaticClass();    
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 60.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHighExtra::StaticClass();    
    default PossibleTransitions.Last().Weight = 90.0f; 

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHighExtra_Orc::StaticClass();    
    default PossibleTransitions.Last().Weight = 90.0f; 

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHighExtra_Orc_NH::StaticClass();    
    default PossibleTransitions.Last().Weight = 90.0f; 

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHighExtra::StaticClass();    
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 60.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHighExtra_Orc::StaticClass();    
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 60.0f;

        default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHighExtra_Orc_NH::StaticClass();    
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 60.0f;


    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

    
    // default PossibleTransitions.Add(FPresetTransitionEntry());
    // default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc::StaticClass();
    // default PossibleTransitions.Last().Weight = 1.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc_NH::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;    


    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_CloseUp::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_CloseUp_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

    
     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_CloseUp_Orc_NH::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

        

    default LightingParameters = LightingPresets::CloseShot();

  
}
//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________


//ORC SHOTS for NH---------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------------




class UConversationPreset_OverTheShoulder_Medium_Orc_NH : UConversationCameraPresetListenerOffset
{
    default PresetName = n"OVER THE SHOULDER MEDIUM ORC NH";
    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;
    

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Topic_Speak);

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;

    default PitchAdjustTarget = EConversationCameraFocusTarget::Speaker;

    default InitialChoiceWeight = 100.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 1.0f;
    default FilmbackPresetName = "35mm VistaVision";
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.f, 12.f);
    default CameraFoVCurve.AddValueAt(0.0, 90.f);
    default CameraFocalLengthCurve.AddValueAt(0.0, 40.f);
    
    default ListenerPositionOffsetCurve.AddVectorAt(0.0f, FVector(-90.781639f, 85.412422f, 44.863747f));
    default ListenerRotationOffsetCurve.AddRotatorAt(0.0f, FRotator(-19.017317f, -36.847107f, 0.0f));
       


    default AnimSequenceName = n"CameraBreathCLOSE";
    default CameraModifiers.Add(UDirectionInputModifier::StaticClass());

    
    default CameraFocusPointOffset = 0.0f;
    
    default MaxHeightDifference = 31.0f;
   
    default MinDistance = 40.0f; 
    default MaxDistance = 180.0f; 

    default RequiredCharacterTagsListener.AddTag(GameplayTag::Species_Orc);


    default ForbiddenTagsSpeakerAndListener.AddTag(GameplayTag::Action_Ambient_LeanWall);
          

    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Full::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;    

    

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_WideTC::StaticClass();
    default PossibleTransitions.Last().Weight = 10.0f;

    //SUBCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_ExtraWide::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    //SPEAK
    // default PossibleTransitions.Add(FPresetTransitionEntry());
    // default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUp::StaticClass();
    // default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    // default PossibleTransitions.Last().Weight = 80.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUp_Orc::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 60.0f;

    // default PossibleTransitions.Add(FPresetTransitionEntry());
    // default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHigh::StaticClass();  
    // default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog; 
    // default PossibleTransitions.Last().Weight = 80.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHigh_Orc::StaticClass();  
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog; 
    default PossibleTransitions.Last().Weight = 60.0f;

    // default PossibleTransitions.Add(FPresetTransitionEntry());
    // default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHighExtra::StaticClass();  
    // default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog; 
    // default PossibleTransitions.Last().Weight = 80.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHighExtra_Orc::StaticClass();  
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog; 
    default PossibleTransitions.Last().Weight = 60.0f;


    // default PossibleTransitions.Add(FPresetTransitionEntry());
    // default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium::StaticClass();
    // default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    // default PossibleTransitions.Last().Weight = 50.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_Orc::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 90.0f;

    // default PossibleTransitions.Add(FPresetTransitionEntry());
    // default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_CloseUp::StaticClass();
    // default PossibleTransitions.Last().Weight = 50.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_CloseUp_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 80.0f;

      default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_CloseUp_Orc_NH::StaticClass();
    default PossibleTransitions.Last().Weight = 60.0f;

    

    // default PossibleTransitions.Add(FPresetTransitionEntry());
    // default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium::StaticClass();
    // default PossibleTransitions.Last().Weight = 55.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 30.0f;

        default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc_NH::StaticClass();
    default PossibleTransitions.Last().Weight = 10.0f;

    

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Flat::StaticClass();
    default PossibleTransitions.Last().Weight = 80.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_FlatHigh::StaticClass();
    default PossibleTransitions.Last().Weight = 80.0f;   

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Wide::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::DuringMonolog;
    default PossibleTransitions.Last().Weight = 50.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_ExtraFull::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::DuringMonolog;
    default PossibleTransitions.Last().Weight = 35.0f;
    

    

     ///default close entero///

   default LightingParameters = LightingPresets::CloseShot();

    default LightingParameters.KeyLightParam.LightPos.AddVectorAt(0.0f, FVector(105.962036f, -145.830475f, 87.061447f));
    default LightingParameters.KeyLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-47.183167f, 115.15831f, 0.0f));
    default LightingParameters.KeyLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyLightParam.SourceHeight = 128.f;
    default LightingParameters.KeyLightParam.AttenuationRadius = 450.f;

    default LightingParameters.RimLightParam.LightPos.AddVectorAt(0.0f, FVector(-89.032387f, 174.166183f, 2.0f));
    default LightingParameters.RimLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-51.384537f, -97.303352f, 0.0f));
    default LightingParameters.RimLightParam.SourceWidth = 250.f;
    default LightingParameters.RimLightParam.SourceHeight = 128.f;
    default LightingParameters.RimLightParam.AttenuationRadius = 350.f;

    default LightingParameters.KeyReverseLightParam.LightPos.AddVectorAt(0.0f, FVector(3.960295f, 153.10582f, 102.495285f));
    default LightingParameters.KeyReverseLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-71.183342f, -78.903618f, 0.f));        
    default LightingParameters.KeyReverseLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyReverseLightParam.SourceHeight = 128.f;
    default LightingParameters.KeyReverseLightParam.AttenuationRadius = 250.f;            

    default LightingParameters.RimReverseLightParam.LightPos.AddVectorAt(0.0f, FVector(51.082512f, -164.402679f, 39.912994f));
    default LightingParameters.RimReverseLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-23.014482f, 89.094925f, 0.0f));
    default LightingParameters.RimReverseLightParam.SourceWidth = 250.f;
    default LightingParameters.RimReverseLightParam.SourceHeight = 128.f;
    default LightingParameters.RimReverseLightParam.AttenuationRadius = 300.f;
}
//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________


class UConversationPreset_OverTheShoulder_MediumHigh_Orc_NH : UConversationCameraPresetListenerOffset
{
    default PresetName = n"OVER THE SHOULDER MEDIUM HIGH ORC NH";
    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;
    

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Topic_Speak);

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;
    
    default PitchAdjustTarget = EConversationCameraFocusTarget::Speaker;

    default InitialChoiceWeight = 100.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 1.0f;
    default FilmbackPresetName = "35mm VistaVision";
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.f, 12.f);
    default CameraFoVCurve.AddValueAt(0.0, 90.f);
    default CameraFocalLengthCurve.AddValueAt(0.0, 40.f);
    
    default ListenerPositionOffsetCurve.AddVectorAt(0.0f, FVector(-95.781639f, 90.412422f, 70.863747f));
    default ListenerRotationOffsetCurve.AddRotatorAt(0.0f, FRotator(-23.017317f, -36.847107f, 0.0f));



    default AnimSequenceName = n"CameraBreathCLOSE";
    default CameraModifiers.Add(UDirectionInputModifier::StaticClass());

    
    default CameraFocusPointOffset = 0.0f;
    
    default MinHeightDifference = 31.01f; 
    default MaxHeightDifference = 55.0f;
   
    default MinDistance = 40.0f; 
    default MaxDistance = 180.0f; 

    default RequiredCharacterTagsListener.AddTag(GameplayTag::Species_Orc);
          

    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Full::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHigh_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;
    

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_WideTC::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

    //SUBCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_ExtraWide::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    //SPEAK
    // default PossibleTransitions.Add(FPresetTransitionEntry());
    // default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHighExtra::StaticClass();  
    // default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog; 
    // default PossibleTransitions.Last().Weight = 80.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHighExtra_Orc::StaticClass();  
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog; 
    default PossibleTransitions.Last().Weight = 60.0f;


    // default PossibleTransitions.Add(FPresetTransitionEntry());
    // default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_CloseUp::StaticClass();
    // default PossibleTransitions.Last().Weight = 50.0f;

    
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_CloseUp_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 80.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_CloseUp_Orc_NH::StaticClass();
    default PossibleTransitions.Last().Weight = 60.0f;  
    

    // default PossibleTransitions.Add(FPresetTransitionEntry());
    // default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium::StaticClass();
    // default PossibleTransitions.Last().Weight = 55.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 30.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc_NH::StaticClass();
    default PossibleTransitions.Last().Weight = 10.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Flat::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::DuringMonolog;
    default PossibleTransitions.Last().Weight = 80.0f;    

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_FlatHigh::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::DuringMonolog;
    default PossibleTransitions.Last().Weight = 80.0f;

    // default PossibleTransitions.Add(FPresetTransitionEntry());
    // default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHigh::StaticClass();
    // default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    // default PossibleTransitions.Last().Weight = 50.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHigh_Orc::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 90.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Wide::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::DuringMonolog;
    default PossibleTransitions.Last().Weight = 50.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_ExtraFull::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::DuringMonolog;
    default PossibleTransitions.Last().Weight = 35.0f;


     ///default close entero///

   default LightingParameters = LightingPresets::CloseShot();

    default LightingParameters.KeyLightParam.LightPos.AddVectorAt(0.0f, FVector(105.962036f, -145.830475f, 87.061447f));
    default LightingParameters.KeyLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-47.183167f, 115.15831f, 0.0f));
    default LightingParameters.KeyLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyLightParam.SourceHeight = 128.f;
    default LightingParameters.KeyLightParam.AttenuationRadius = 450.f;

    default LightingParameters.RimLightParam.LightPos.AddVectorAt(0.0f, FVector(-89.032387f, 174.166183f, 2.0f));
    default LightingParameters.RimLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-51.384537f, -97.303352f, 0.0f));
    default LightingParameters.RimLightParam.SourceWidth = 250.f;
    default LightingParameters.RimLightParam.SourceHeight = 128.f;
    default LightingParameters.RimLightParam.AttenuationRadius = 350.f;

    default LightingParameters.KeyReverseLightParam.LightPos.AddVectorAt(0.0f, FVector(3.960295f, 153.10582f, 102.495285f));
    default LightingParameters.KeyReverseLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-71.183342f, -78.903618f, 0.f));        
    default LightingParameters.KeyReverseLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyReverseLightParam.SourceHeight = 128.f;
    default LightingParameters.KeyReverseLightParam.AttenuationRadius = 250.f;            

    default LightingParameters.RimReverseLightParam.LightPos.AddVectorAt(0.0f, FVector(51.082512f, -164.402679f, 39.912994f));
    default LightingParameters.RimReverseLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-23.014482f, 89.094925f, 0.0f));
    default LightingParameters.RimReverseLightParam.SourceWidth = 250.f;
    default LightingParameters.RimReverseLightParam.SourceHeight = 128.f;
    default LightingParameters.RimReverseLightParam.AttenuationRadius = 300.f;
}
//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________




class UConversationPreset_OverTheShoulder_MediumHighExtra_Orc_NH : UConversationCameraPresetListenerOffset
{
    default PresetName = n"OVER THE SHOULDER MEDIUM HIGH EXTRA ORC NH";
    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;
    

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Topic_Speak);

    default PitchAdjustTarget = EConversationCameraFocusTarget::Speaker;

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 100.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 1.0f;
    default FilmbackPresetName = "35mm VistaVision";
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.f, 12.f);
    default CameraFoVCurve.AddValueAt(0.0, 90.f);
    default CameraFocalLengthCurve.AddValueAt(0.0, 40.f);
    
     default ListenerPositionOffsetCurve.AddVectorAt(0.0f, FVector(-85.781639f, 80.412422f, 81.863747f));
    default ListenerRotationOffsetCurve.AddRotatorAt(0.0f, FRotator(-25.017317f, -36.847107f, 0.0f));
    

    default AnimSequenceName = n"CameraBreathCLOSE";
    default CameraModifiers.Add(UDirectionInputModifier::StaticClass());

    
    default CameraFocusPointOffset = 0.0f;
    
    default MinHeightDifference = 55.01f; 
    default MaxHeightDifference = 75.0f;
   
    default MinDistance = 40.0f; 
    default MaxDistance = 180.0f; 

    default RequiredCharacterTagsListener.AddTag(GameplayTag::Species_Orc);
          

    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Full::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHigh_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHighExtra_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_WideTC::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

    //SUBCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_ExtraWide::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    //SPEAK
    // default PossibleTransitions.Add(FPresetTransitionEntry());
    // default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHighExtra::StaticClass();  
    // default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog; 
    // default PossibleTransitions.Last().Weight = 80.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHighExtra_Orc::StaticClass();  
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog; 
    default PossibleTransitions.Last().Weight = 60.0f;

    // default PossibleTransitions.Add(FPresetTransitionEntry());
    // default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_CloseUp::StaticClass();
    // default PossibleTransitions.Last().Weight = 50.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_CloseUp_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 80.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_CloseUp_Orc_NH::StaticClass();
    default PossibleTransitions.Last().Weight = 60.0f;
    

    // default PossibleTransitions.Add(FPresetTransitionEntry());
    // default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium::StaticClass();
    // default PossibleTransitions.Last().Weight = 55.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 30.0f;

      default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc_NH::StaticClass();
    default PossibleTransitions.Last().Weight = 10.0f;
    

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_FlatHigh::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::DuringMonolog;
    default PossibleTransitions.Last().Weight = 80.0f;

    // default PossibleTransitions.Add(FPresetTransitionEntry());
    // default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHighExtra::StaticClass();
    // default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    // default PossibleTransitions.Last().Weight = 50.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHighExtra_Orc::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 90.0f;

    //  default PossibleTransitions.Add(FPresetTransitionEntry());
    // default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHighExtra_Orc_NH::StaticClass();
    // default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    // default PossibleTransitions.Last().Weight = 50.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Wide::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::DuringMonolog;
    default PossibleTransitions.Last().Weight = 50.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_ExtraFull::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::DuringMonolog;
    default PossibleTransitions.Last().Weight = 35.0f;


    
     ///default close entero///

   default LightingParameters = LightingPresets::CloseShot();

    default LightingParameters.KeyLightParam.LightPos.AddVectorAt(0.0f, FVector(105.962036f, -145.830475f, 87.061447f));
    default LightingParameters.KeyLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-47.183167f, 115.15831f, 0.0f));
    default LightingParameters.KeyLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyLightParam.SourceHeight = 128.f;
    default LightingParameters.KeyLightParam.AttenuationRadius = 450.f;

    default LightingParameters.RimLightParam.LightPos.AddVectorAt(0.0f, FVector(-89.032387f, 174.166183f, 2.0f));
    default LightingParameters.RimLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-51.384537f, -97.303352f, 0.0f));
    default LightingParameters.RimLightParam.SourceWidth = 250.f;
    default LightingParameters.RimLightParam.SourceHeight = 128.f;
    default LightingParameters.RimLightParam.AttenuationRadius = 350.f;

    default LightingParameters.KeyReverseLightParam.LightPos.AddVectorAt(0.0f, FVector(3.960295f, 153.10582f, 102.495285f));
    default LightingParameters.KeyReverseLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-71.183342f, -78.903618f, 0.f));        
    default LightingParameters.KeyReverseLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyReverseLightParam.SourceHeight = 128.f;
    default LightingParameters.KeyReverseLightParam.AttenuationRadius = 250.f;            

    default LightingParameters.RimReverseLightParam.LightPos.AddVectorAt(0.0f, FVector(51.082512f, -164.402679f, 39.912994f));
    default LightingParameters.RimReverseLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-23.014482f, 89.094925f, 0.0f));
    default LightingParameters.RimReverseLightParam.SourceWidth = 250.f;
    default LightingParameters.RimReverseLightParam.SourceHeight = 128.f;
    default LightingParameters.RimReverseLightParam.AttenuationRadius = 300.f;
}
//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________



class UConversationPreset_OverTheShoulder_CloseUp_Orc_NH : UConversationCameraPresetListenerOffset
{
    default PresetName = n"OVER THE SHOULDER CLOSE UP ORC NH";
    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;
    

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Topic_Speak);

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 100.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 1.0f;
    default FilmbackPresetName = "35mm VistaVision";
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.f, 12.f);
    default CameraFoVCurve.AddValueAt(0.f, 90.f);
    default CameraFocalLengthCurve.AddValueAt(0.f, 80.f);

    default ListenerPositionOffsetCurve.AddVectorAt(0.0f, FVector(-135.09256f, 146.924194f, 66.228165f));
    default ListenerRotationOffsetCurve.AddRotatorAt(0.0f, FRotator(-14.5f, -37.528416f, 0.0f));

     
    default AnimSequenceName = n"CameraBreathCLOSE";
    default CameraModifiers.Add(UDirectionInputModifier::StaticClass());

   
    default CameraFocusPointOffset = 0.0f;

    default MaxHeightDifference = 19.99f;      

    // default MinDistance = 60.0f; 
    default MaxDistance = 250.0f;   

    default RequiredCharacterTagsListener.AddTag(GameplayTag::Species_Orc);
         

    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

        
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_CowboyTC::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_WideTC::StaticClass();
    default PossibleTransitions.Last().Weight = 10.0f;

    //SUBCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    //SPEAK

    // default PossibleTransitions.Add(FPresetTransitionEntry());
    // default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium::StaticClass();
    // default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    // default PossibleTransitions.Last().Weight = 20.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_Orc::StaticClass();    
    default PossibleTransitions.Last().Weight = 20.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHigh_Orc::StaticClass();    
    default PossibleTransitions.Last().Weight = 20.0f;


    // default PossibleTransitions.Add(FPresetTransitionEntry());
    // default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUp::StaticClass();
    // default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    // default PossibleTransitions.Last().Weight = 35.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUp_Orc::StaticClass();    
    default PossibleTransitions.Last().Weight = 95.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHigh_Orc::StaticClass();    
    default PossibleTransitions.Last().Weight = 95.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHighExtra_Orc::StaticClass();    
    default PossibleTransitions.Last().Weight = 95.0f;

    // default PossibleTransitions.Add(FPresetTransitionEntry());
    // default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium::StaticClass();    
    // default PossibleTransitions.Last().Weight = 30.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc::StaticClass();    
    default PossibleTransitions.Last().Weight = 20.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc_NH::StaticClass();    
    default PossibleTransitions.Last().Weight = 20.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Flat::StaticClass();    
    default PossibleTransitions.Last().Weight = 60.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_FlatHigh::StaticClass();    
    default PossibleTransitions.Last().Weight = 60.0f;
    

   
    default PitchAdjustTarget = EConversationCameraFocusTarget::Speaker;

    default LightingParameters = LightingPresets::CloseShot();
}

//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________


class UConversationPreset_OverTheShoulder_CloseUpHigh_Orc_NH : UConversationCameraPresetListenerOffset
{
    default PresetName = n"OVER THE SHOULDER CLOSE UP HIGH ORC NH";
    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;
    

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Topic_Speak);

    default PitchAdjustTarget = EConversationCameraFocusTarget::Speaker;

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 100.0f;
    default TransitionTime = 0.0f;

     default SqueezeFactor = 1.0f;
    default FilmbackPresetName = "35mm VistaVision";
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.f, 12.f);
    default CameraFoVCurve.AddValueAt(0.f, 90.f);
    default CameraFocalLengthCurve.AddValueAt(0.f, 80.f);

   
    default ListenerPositionOffsetCurve.AddVectorAt(0.0f, FVector(-153.09256f, 158.924194f, 100.228165f));
    default ListenerRotationOffsetCurve.AddRotatorAt(0.0f, FRotator(-19.923209f, -37.528416f, 0.0f));   
   


    default AnimSequenceName = n"CameraBreathCLOSE";
    default CameraModifiers.Add(UDirectionInputModifier::StaticClass());

    
    default CameraFocusPointOffset = 0.0f;

    default MinHeightDifference = 20.0f;
    default MaxHeightDifference = 49.99f;      

    // default MinDistance = 40.0f; 
    default MaxDistance = 250.0f;     

    default RequiredCharacterTagsListener.AddTag(GameplayTag::Species_Orc);
     

    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHigh_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_WideTC::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

    //SUBCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_CowboyHigh::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_CowboyTC::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

    //SPEAK
    // default PossibleTransitions.Add(FPresetTransitionEntry());
    // default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium::StaticClass();
    // default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    // default PossibleTransitions.Last().Weight = 50.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_Orc::StaticClass();    
    default PossibleTransitions.Last().Weight = 20.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHigh_Orc::StaticClass();    
    default PossibleTransitions.Last().Weight = 20.0f;

    // default PossibleTransitions.Add(FPresetTransitionEntry());
    // default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUp::StaticClass();
    // default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    // default PossibleTransitions.Last().Weight = 35.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUp_Orc::StaticClass();    
    default PossibleTransitions.Last().Weight = 90.0f;   

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHigh_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 90.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHighExtra_Orc::StaticClass(); 
    default PossibleTransitions.Last().Weight = 90.0f;

    // default PossibleTransitions.Add(FPresetTransitionEntry());
    // default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium::StaticClass();    
    // default PossibleTransitions.Last().Weight = 70.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc::StaticClass();    
    default PossibleTransitions.Last().Weight = 30.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc_NH::StaticClass();    
    default PossibleTransitions.Last().Weight = 30.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Flat::StaticClass();    
    default PossibleTransitions.Last().Weight = 70.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_FlatHigh::StaticClass();    
    default PossibleTransitions.Last().Weight = 70.0f;    


    

    default LightingParameters = LightingPresets::CloseShot();
}

//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________


class UConversationPreset_OverTheShoulder_CloseUpHighExtra_Orc_NH : UConversationCameraPresetListenerOffset
{
    default PresetName = n"OVER THE SHOULDER CLOSE UP HIGH EXTRA ORC NH";
    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;
    

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Topic_Speak);

    default PitchAdjustTarget = EConversationCameraFocusTarget::Speaker;

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 100.0f;
    default TransitionTime = 0.0f;

     default SqueezeFactor = 1.0f;
    default FilmbackPresetName = "35mm VistaVision";
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.f, 12.f);
    default CameraFoVCurve.AddValueAt(0.f, 90.f);
    default CameraFocalLengthCurve.AddValueAt(0.f, 80.f);
   
    default ListenerPositionOffsetCurve.AddVectorAt(0.0f, FVector(-159.09256f, 163.924194f, 115.228165f));
    default ListenerRotationOffsetCurve.AddRotatorAt(0.0f, FRotator(-20.923209f, -37.528416f, 0.0f));

    default AnimSequenceName = n"CameraBreathCLOSE";
    default CameraModifiers.Add(UDirectionInputModifier::StaticClass());

    
    default CameraFocusPointOffset = 0.0f;

    default MinHeightDifference = 50.0f;
    default MaxHeightDifference = 67.0f;      

    // default MinDistance = 40.0f; 
    default MaxDistance = 250.0f;    

    default RequiredCharacterTagsListener.AddTag(GameplayTag::Species_Orc);
     
    
    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE
    
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHighExtra_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;
  

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHigh_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;
   

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_WideTC::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

    //SUBCHOICE
    
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_CowboyTC::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_CowboyHigh::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass =UConversationPreset_TwoShot_CowboyHighExtra::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    //SPEAK
    // default PossibleTransitions.Add(FPresetTransitionEntry());
    // default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium::StaticClass();
    // default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    // default PossibleTransitions.Last().Weight = 50.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_Orc::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 20.0f;

    // default PossibleTransitions.Add(FPresetTransitionEntry());
    // default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHigh::StaticClass();
    // default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    // default PossibleTransitions.Last().Weight = 50.0f;    

    
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHigh_Orc::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 20.0f;    


    // default PossibleTransitions.Add(FPresetTransitionEntry());
    // default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHighExtra::StaticClass();
    // default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    // default PossibleTransitions.Last().Weight = 50.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHighExtra_Orc::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 20.0f;

    // default PossibleTransitions.Add(FPresetTransitionEntry());
    // default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHighExtra::StaticClass();  
    // default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog; 
    // default PossibleTransitions.Last().Weight = 35.0f;

        default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHigh_Orc::StaticClass();  
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog; 
    default PossibleTransitions.Last().Weight = 90.0f;

       default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHighExtra_Orc::StaticClass();  
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog; 
    default PossibleTransitions.Last().Weight = 90.0f;

    // default PossibleTransitions.Add(FPresetTransitionEntry());
    // default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium::StaticClass();    
    // default PossibleTransitions.Last().Weight = 70.0f;

    
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc::StaticClass();    
    default PossibleTransitions.Last().Weight = 30.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc_NH::StaticClass();    
    default PossibleTransitions.Last().Weight = 30.0f;  

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Flat::StaticClass();    
    default PossibleTransitions.Last().Weight = 70.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_FlatHigh::StaticClass();    
    default PossibleTransitions.Last().Weight = 70.0f;      


    

    default LightingParameters = LightingPresets::CloseShot();
}


class UConversationPreset_Individual_Medium_Orc_NH : UConversationCameraHeightAdjustSpeaker
{
    default PresetName = n"INDIVIDUAL MEDIUM ORC NH";
    default HideMode = EConversationCameraHideMode::HideListener;
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Topic_Speak);
    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Topic_Start);

    default PitchAdjustTarget = EConversationCameraFocusTarget::None;

    default ForbiddenCharacterTagsListener.AddTag(GameplayTag::State_Combat_Melee_Torch);

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 100.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.0, 11.f);
    default CameraFoVCurve.AddValueAt(0.0, 90.000000);
    default CameraFocalLengthCurve.AddValueAt(0.0, 65.000000);

    default AdjustedPositionOffsetCurve.AddVectorAt(0.0f, FVector(188.007904f, -110.923256f, -13.013909f));
    default AdjustedRotationCurve.AddRotatorAt(0.0f, FRotator(1.806072f, -215.91066f, 0.033507f));   
    

    // Values to control the pitch towards Listener
    default MinPitchToListener = -35.0f;
    default MaxPitchToListener = 35.0f;
    default PitchToListenerMultiplier = 0.8f;

   
     
    default AnimSequenceName = n"CameraBreathCLOSE";
    default CameraModifiers.Add(UDirectionInputModifier::StaticClass());

    
    default CameraFocusPointOffset = 0.0f;

    default RequiredCharacterTagsListener.AddTag(GameplayTag::Species_Orc);



    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE
    
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHigh_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHighExtra_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_HIGH::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_LONG::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_HIGH_LONG::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_CLOSE::StaticClass();   
    default PossibleTransitions.Last().Weight = 1.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_CLOSE_HIGH::StaticClass();   
    default PossibleTransitions.Last().Weight = 1.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_WideTC::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

    

   

    //SUBCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy_500::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy_500_LONG::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_CowboyHigh::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_CowboyTC::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

    

    //SPEAK
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUp::StaticClass();
    default PossibleTransitions.Last().Weight = 75.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Wide_Speak_500::StaticClass();
    default PossibleTransitions.Last().Weight = 75.0f;

      default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 70.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_ORC_NH::StaticClass();
    default PossibleTransitions.Last().Weight = 70.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_Orc_HIGH::StaticClass();
    default PossibleTransitions.Last().Weight = 70.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_ORC_NH_HIGH::StaticClass();
    default PossibleTransitions.Last().Weight = 70.0f; 

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUp_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 75.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUp_Orc_NH::StaticClass();
    default PossibleTransitions.Last().Weight = 75.0f;


    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHigh::StaticClass();    
    default PossibleTransitions.Last().Weight = 75.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Wide_Speak_500_LONG::StaticClass();    
    default PossibleTransitions.Last().Weight = 75.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHigh_Orc::StaticClass();    
    default PossibleTransitions.Last().Weight = 75.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHigh_Orc_NH::StaticClass();    
    default PossibleTransitions.Last().Weight = 75.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHighExtra::StaticClass();    
    default PossibleTransitions.Last().Weight = 75.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHighExtra_Orc::StaticClass();    
    default PossibleTransitions.Last().Weight = 75.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHighExtra_Orc_NH::StaticClass();    
    default PossibleTransitions.Last().Weight = 75.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_CloseUp::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 60.0f;  

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_CloseUp_Orc::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 60.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_CloseUp_Orc_NH::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 60.0f;    

    

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 20.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 20.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc_NH::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 20.0f;    



    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_CloseUp::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;  

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_CloseUp_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;  

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_CloseUp_Orc_NH::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;  
    

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc_NH::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

   


    
  

    

    default LightingParameters = LightingPresets::CloseShot();

   


}
//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________



class UConversationPreset_Individual_CloseUp_Orc_NH : UConversationCameraHeightAdjustSpeaker
{
    default PresetName = n"INDIVIDUAL CLOSE UP ORC NH";
    default HideMode = EConversationCameraHideMode::HideListener;
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Topic_Speak);

    default PitchAdjustTarget = EConversationCameraFocusTarget::None;

    default ForbiddenCharacterTagsListener.AddTag(GameplayTag::State_Combat_Melee_Torch);

    default bAlwaysValid = false;
  
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 100.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.0, 25.000000);
    default CameraFoVCurve.AddValueAt(0.0, 90.000000);
    default CameraFocalLengthCurve.AddValueAt(0.0, 75.000000);

    default AdjustedPositionOffsetCurve.AddVectorAt(0.0f, FVector(165.760345f, -58.178436f, -23.30327f));
    default AdjustedRotationCurve.AddRotatorAt(0.0f, FRotator(7.98195f, -203.444687f, 0.0f));
    
  // Values to control the pitch towards Listener
    default MinPitchToListener = -35.0f;
    default MaxPitchToListener = 35.0f;
    default PitchToListenerMultiplier = 1.f;
    
    
    
    default AnimSequenceName = n"CameraBreathCLOSE";
    default CameraModifiers.Add(UDirectionInputModifier::StaticClass());

    
    default CameraFocusPointOffset = 0.0f;

   
    default RequiredCharacterTagsListener.AddTag(GameplayTag::Species_Orc);
      



    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE
    
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHigh_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CowboyHighExtra_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_HIGH::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_LONG::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_HIGH_LONG::StaticClass();   
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_CLOSE::StaticClass();   
    default PossibleTransitions.Last().Weight = 1.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_500_CLOSE_HIGH::StaticClass();   
    default PossibleTransitions.Last().Weight = 1.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_WideTC::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;  

    

    //SUBCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
	default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy_500::StaticClass();
	default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_Cowboy_500_LONG::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_CowboyHigh::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_CowboyTC::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

    


    //SPEAK
    
    
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 60.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 60.0f;

      default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc_NH::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 60.0f;

   

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_CloseUp::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 20.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_CloseUp_Orc::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 20.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_CloseUp_Orc_NH::StaticClass();
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 20.0f;

    
    
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium::StaticClass();    
    default PossibleTransitions.Last().Weight = 90.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500::StaticClass();    
    default PossibleTransitions.Last().Weight = 90.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 90.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_ORC_NH::StaticClass();
    default PossibleTransitions.Last().Weight = 90.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_Orc_HIGH::StaticClass();
    default PossibleTransitions.Last().Weight = 90.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_ORC_NH_HIGH::StaticClass();
    default PossibleTransitions.Last().Weight = 90.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_Orc::StaticClass();    
    default PossibleTransitions.Last().Weight = 90.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_Orc_NH::StaticClass();    
    default PossibleTransitions.Last().Weight = 90.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUp::StaticClass();    
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 60.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Wide_Speak_500::StaticClass();    
    default PossibleTransitions.Last().Weight = 60.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUp_Orc::StaticClass();    
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 60.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUp_Orc_NH::StaticClass();    
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 60.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHigh::StaticClass();    
    default PossibleTransitions.Last().Weight = 90.0f;

       default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_500_HIGH::StaticClass();    
    default PossibleTransitions.Last().Weight = 90.0f;


    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHigh_Orc::StaticClass();    
    default PossibleTransitions.Last().Weight = 90.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHigh_Orc_NH::StaticClass();    
    default PossibleTransitions.Last().Weight = 90.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHigh::StaticClass();    
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 60.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Wide_Speak_500_LONG::StaticClass();    
    default PossibleTransitions.Last().Weight = 60.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHigh_Orc::StaticClass();    
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 60.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHigh_Orc_NH::StaticClass();    
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 60.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHighExtra::StaticClass();    
    default PossibleTransitions.Last().Weight = 90.0f; 

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHighExtra_Orc::StaticClass();    
    default PossibleTransitions.Last().Weight = 90.0f; 

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHighExtra_Orc_NH::StaticClass();    
    default PossibleTransitions.Last().Weight = 90.0f; 

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHighExtra::StaticClass();    
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 60.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHighExtra_Orc::StaticClass();    
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 60.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHighExtra_Orc_NH::StaticClass();    
    default PossibleTransitions.Last().MonologStateValidity = EConversationPresetMonologState::OutsideOfMonolog;
    default PossibleTransitions.Last().Weight = 60.0f;


    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Orc_NH::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;
    

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_CloseUp::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_CloseUp_Orc::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_CloseUp_Orc_NH::StaticClass();
    default PossibleTransitions.Last().Weight = 1.0f;


        

    default LightingParameters = LightingPresets::CloseShot();

    
}
//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________





/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
//// DEMON CAMERAS ////////////////////////////////////////
////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////

class UConversationPreset_Individual_CloseUp_Demon : UConversationCameraHeightAdjustSpeaker
{
    default PresetName = n"INDIVIDUAL CLOSE UP DEMON";
    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Topic_Speak);

    default PitchAdjustTarget = EConversationCameraFocusTarget::None;

    default bAlwaysValid = false;
  
    default bStaticActorTransforms = true;

    default InitialChoiceWeight = 100.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.0, 8.000000);
    default CameraFoVCurve.AddValueAt(0.0, 90.000000);
    default CameraFocalLengthCurve.AddValueAt(0.0, 45.000000);

    default AdjustedPositionOffsetCurve.AddVectorAt(0.0f, FVector(214.713806f, -51.653805f, -37.876305f));
    default AdjustedRotationCurve.AddRotatorAt(0.0f, FRotator(10.15f, -199.280518f, -0.0f));
    
           

    // Values to control the pitch towards Listener
    default MinPitchToListener = -35.0f;
    default MaxPitchToListener = 35.0f;
    default PitchToListenerMultiplier = 1.0f;       


        
    default AnimSequenceName = n"CameraBreathCLOSE";
    default CameraModifiers.Add(UDirectionInputModifier::StaticClass());

    
    default CameraFocusPointOffset = 0.f;

    default RequiredCharacterTagsSpeaker.AddTag(GameplayTag::Species_Creature_Demon); 
    

    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_Demon::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f; 

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Demon_TC::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f; 

   

    default LightingParameters = LightingPresets::CloseShot();

    default LightingParameters.KeyLightParam.LightPos.AddVectorAt(0.f, FVector(30.072744f, -117.338387f, 106.839622f));
    default LightingParameters.KeyLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-70.746941f, 101.096382f, 0.f));
    default LightingParameters.KeyLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyLightParam.SourceHeight = 128.f;
    default LightingParameters.KeyLightParam.AttenuationRadius = 220.f;
    
    default LightingParameters.RimLightParam.LightPos.AddVectorAt(0.f, FVector(-50.723396f, 121.361267f, 63.488483f));
    default LightingParameters.RimLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-50.927406f, -85.840706f, 0.f));
    default LightingParameters.RimLightParam.SourceWidth = 128.f;
    default LightingParameters.RimLightParam.SourceHeight = 128.f;
    default LightingParameters.RimLightParam.AttenuationRadius = 180.f;
}
//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________

class UConversationPreset_Individual_CloseUp_Demon_NH : UConversationCameraHeightAdjustSpeaker
{
    default PresetName = n"INDIVIDUAL CLOSE UP DEMON NH";
    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Topic_Speak);

    default PitchAdjustTarget = EConversationCameraFocusTarget::None;

    default bAlwaysValid = false;
  
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 100.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.0, 8.000000);
    default CameraFoVCurve.AddValueAt(0.0, 90.000000);
    default CameraFocalLengthCurve.AddValueAt(0.0, 75.000000);

    default AdjustedPositionOffsetCurve.AddVectorAt(0.0f, FVector(165.760345f, -58.178436f, -23.30327f));
    default AdjustedRotationCurve.AddRotatorAt(0.0f, FRotator(7.98195f, -203.444687f, 0.0f));
    
  // Values to control the pitch towards Listener
    default MinPitchToListener = -35.0f;
    default MaxPitchToListener = 35.0f;
    default PitchToListenerMultiplier = 1.f;
    

    
    
    default AnimSequenceName = n"CameraBreathCLOSE";
    default CameraModifiers.Add(UDirectionInputModifier::StaticClass());

    
    default CameraFocusPointOffset = 0.0f;

    default RequiredCharacterTagsListener.AddTag(GameplayTag::Species_Creature_Demon);  

    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_Demon::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f; 

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Demon_TC::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f; 


   

    default LightingParameters = LightingPresets::CloseShot();

    default LightingParameters.KeyLightParam.LightPos.AddVectorAt(0.f, FVector(30.072744f, -117.338387f, 106.839622f));
    default LightingParameters.KeyLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-70.746941f, 101.096382f, 0.f));
    default LightingParameters.KeyLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyLightParam.SourceHeight = 128.f;
    default LightingParameters.KeyLightParam.AttenuationRadius = 220.f;
    
    default LightingParameters.RimLightParam.LightPos.AddVectorAt(0.f, FVector(-50.723396f, 121.361267f, 63.488483f));
    default LightingParameters.RimLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-50.927406f, -85.840706f, 0.f));
    default LightingParameters.RimLightParam.SourceWidth = 128.f;
    default LightingParameters.RimLightParam.SourceHeight = 128.f;
    default LightingParameters.RimLightParam.AttenuationRadius = 180.f;
}
//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________


class UConversationPreset_Individual_Medium_Demon : UConversationCameraHeightAdjustSpeaker
{
    default PresetName = n"INDIVIDUAL MEDIUM DEMON";
    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Topic_Speak);

    default PitchAdjustTarget = EConversationCameraFocusTarget::None;

    default bAlwaysValid = false;
  
    default bStaticActorTransforms = true;

    default InitialChoiceWeight = 100.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.0, 8.000000);
    default CameraFoVCurve.AddValueAt(0.0, 90.000000);
    default CameraFocalLengthCurve.AddValueAt(0.0, 30.000000);

    default AdjustedPositionOffsetCurve.AddVectorAt(0.0f, FVector(185.609665f, -121.303841f, -23.774967f));
    default AdjustedRotationCurve.AddRotatorAt(0.0f, FRotator(3.3f, -214.599182f, 0.0f));
    
 
    
    default AnimSequenceName = n"CameraBreathCLOSE";
    default CameraModifiers.Add(UDirectionInputModifier::StaticClass());

    
    default CameraFocusPointOffset = 0.f;

    default RequiredCharacterTagsSpeaker.AddTag(GameplayTag::Species_Creature_Demon); 

    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_Demon::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f; 

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Demon_TC::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f; 

   

    

    default LightingParameters = LightingPresets::CloseShot();

    default LightingParameters.KeyLightParam.LightPos.AddVectorAt(0.f, FVector(30.072744f, -117.338387f, 106.839622f));
    default LightingParameters.KeyLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-70.746941f, 101.096382f, 0.f));
    default LightingParameters.KeyLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyLightParam.SourceHeight = 128.f;
    default LightingParameters.KeyLightParam.AttenuationRadius = 220.f;
    
    default LightingParameters.RimLightParam.LightPos.AddVectorAt(0.f, FVector(-50.723396f, 121.361267f, 63.488483f));
    default LightingParameters.RimLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-50.927406f, -85.840706f, 0.f));
    default LightingParameters.RimLightParam.SourceWidth = 128.f;
    default LightingParameters.RimLightParam.SourceHeight = 128.f;
    default LightingParameters.RimLightParam.AttenuationRadius = 180.f;
}
//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________

class UConversationPreset_Individual_Medium_Demon_NH : UConversationCameraHeightAdjustSpeaker
{
    default PresetName = n"INDIVIDUAL MEDIUM DEMON NH";
    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Topic_Speak);

     default PitchAdjustTarget = EConversationCameraFocusTarget::None;

    default bAlwaysValid = false;
  
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 100.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.0, 8.000000);
    default CameraFoVCurve.AddValueAt(0.0, 90.000000);
    default CameraFocalLengthCurve.AddValueAt(0.0, 55.000000);

    default AdjustedPositionOffsetCurve.AddVectorAt(0.0f, FVector(188.007904f, -110.923256f, -13.013909f));
    default AdjustedRotationCurve.AddRotatorAt(0.0f, FRotator(1.806072f, -215.91066f, 0.033507f));   
    

    // Values to control the pitch towards Listener
    default MinPitchToListener = -35.0f;
    default MaxPitchToListener = 35.0f;
    default PitchToListenerMultiplier = 0.8f;

  
    
     
    
    default AnimSequenceName = n"CameraBreathCLOSE";
    default CameraModifiers.Add(UDirectionInputModifier::StaticClass());

    
    default CameraFocusPointOffset = 0.0f;

    default RequiredCharacterTagsListener.AddTag(GameplayTag::Species_Creature_Demon);  

    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_Demon::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;  

     default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Demon_TC::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f; 

   

   

    default LightingParameters = LightingPresets::CloseShot();

    default LightingParameters.KeyLightParam.LightPos.AddVectorAt(0.f, FVector(30.072744f, -117.338387f, 106.839622f));
    default LightingParameters.KeyLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-70.746941f, 101.096382f, 0.f));
    default LightingParameters.KeyLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyLightParam.SourceHeight = 128.f;
    default LightingParameters.KeyLightParam.AttenuationRadius = 220.f;
    
    default LightingParameters.RimLightParam.LightPos.AddVectorAt(0.f, FVector(-50.723396f, 121.361267f, 63.488483f));
    default LightingParameters.RimLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-50.927406f, -85.840706f, 0.f));
    default LightingParameters.RimLightParam.SourceWidth = 128.f;
    default LightingParameters.RimLightParam.SourceHeight = 128.f;
    default LightingParameters.RimLightParam.AttenuationRadius = 180.f;
}
//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________



class UConversationPreset_OverTheShoulder_Cowboy_Demon : UConversationCameraPresetListenerOffset
{
    default PresetName = n"OVER THE SHOULDER COWBOY DEMON";
    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::None;
    default FocusMode = EConversationCameraFocusMode::Speaker;

    default PitchAdjustTarget = EConversationCameraFocusTarget::None;
    

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_TopicChoice_Start);
    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_TopicChoice);
    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_SubChoice);

    default bAlwaysValid = false;
  
    default bStaticActorTransforms = true;

    default InitialChoiceWeight = 100.0f;
    default TransitionTime = 0.0f;

   default SqueezeFactor = 1.0f;
    default FilmbackPresetName = "35mm VistaVision";
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.0, 10.000000);
    default CameraFoVCurve.AddValueAt(0.0, 90.000000);
    default CameraFocalLengthCurve.AddValueAt(0.0, 30.000000);

    default ListenerPositionOffsetCurve.AddVectorAt(0.0f, FVector(-99.062828f, 83.741951f, -30.880016f));
    default ListenerRotationOffsetCurve.AddRotatorAt(0.f, FRotator(15.988989f, -26.103204f, -0.f));    
    
    default MaxHeightDifference = 300.0f;  
    
    default MinDistance = 100.0f;
    default MaxDistance = 400.0f;   
    
    default AnimSequenceName = n"CameraBreathCLOSE";
    default CameraModifiers.Add(UDirectionInputModifier::StaticClass());

    
    default CameraFocusPointOffset = 0.f;

   
    default RequiredCharacterTagsSpeaker.AddTag(GameplayTag::Species_Creature_Demon); 

    

    default LightingParameters = LightingPresets::CloseShot();

    default LightingParameters.KeyLightParam.LightPos.AddVectorAt(0.f, FVector(30.072744f, -117.338387f, 106.839622f));
    default LightingParameters.KeyLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-70.746941f, 101.096382f, 0.f));
    default LightingParameters.KeyLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyLightParam.SourceHeight = 128.f;
    default LightingParameters.KeyLightParam.AttenuationRadius = 220.f;
    
    default LightingParameters.RimLightParam.LightPos.AddVectorAt(0.f, FVector(-50.723396f, 121.361267f, 63.488483f));
    default LightingParameters.RimLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-50.927406f, -85.840706f, 0.f));
    default LightingParameters.RimLightParam.SourceWidth = 128.f;
    default LightingParameters.RimLightParam.SourceHeight = 128.f;
    default LightingParameters.RimLightParam.AttenuationRadius = 180.f;
}
//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________


class UConversationPreset_OverTheShoulder_Medium_Demon : UConversationCameraPresetListenerOffset
{
    default PresetName = n"OVER THE SHOULDER MEDIUM DEMON";
    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Topic_Speak);

    default bAlwaysValid = false;

    default PitchAdjustTarget = EConversationCameraFocusTarget::None;
  
    default bStaticActorTransforms = true;

    default InitialChoiceWeight = 100.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 1.0f;
    default FilmbackPresetName = "35mm VistaVision";
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.0, 15.000000);
    default CameraFoVCurve.AddValueAt(0.0, 90.000000);
    default CameraFocalLengthCurve.AddValueAt(0.0, 60.000000);

    default ListenerPositionOffsetCurve.AddVectorAt(0.0f, FVector(-106.310242f, 55.529629f, -45.020677f));
    default ListenerRotationOffsetCurve.AddRotatorAt(0.0f, FRotator(24.f, -14.977471f, 0.f));  
 
    default MaxHeightDifference = 300.0f;  

    default MinDistance = 100.0f; 
    default MaxDistance = 400.0f;   
    
    default AnimSequenceName = n"CameraBreathCLOSE";
    default CameraModifiers.Add(UDirectionInputModifier::StaticClass());

    
    default CameraFocusPointOffset = 0.f;

    default RequiredCharacterTagsSpeaker.AddTag(GameplayTag::Species_Creature_Demon); 

    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_Demon::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;   

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_Demon_TC::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f; 

   

    

    default LightingParameters = LightingPresets::CloseShot();

    default LightingParameters.KeyLightParam.LightPos.AddVectorAt(0.f, FVector(30.072744f, -117.338387f, 106.839622f));
    default LightingParameters.KeyLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-70.746941f, 101.096382f, 0.f));
    default LightingParameters.KeyLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyLightParam.SourceHeight = 128.f;
    default LightingParameters.KeyLightParam.AttenuationRadius = 220.f;
    
    default LightingParameters.RimLightParam.LightPos.AddVectorAt(0.f, FVector(-50.723396f, 121.361267f, 63.488483f));
    default LightingParameters.RimLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-50.927406f, -85.840706f, 0.f));
    default LightingParameters.RimLightParam.SourceWidth = 128.f;
    default LightingParameters.RimLightParam.SourceHeight = 128.f;
    default LightingParameters.RimLightParam.AttenuationRadius = 180.f;
}
//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________

class UConversationPreset_Individual_Medium_Demon_TC : UConversationCameraHeightAdjustSpeaker
{
    default PresetName = n"INDIVIDUAL MEDIUM DEMON TC";
    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_TopicChoice_Start);
    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_TopicChoice);
    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_SubChoice);

    default PitchAdjustTarget = EConversationCameraFocusTarget::None;

    default bAlwaysValid = false;
  
    default bStaticActorTransforms = true;

    default InitialChoiceWeight = 1.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.0, 8.000000);
    default CameraFoVCurve.AddValueAt(0.0, 90.000000);
    default CameraFocalLengthCurve.AddValueAt(0.0, 30.000000);

    default AdjustedPositionOffsetCurve.AddVectorAt(0.0f, FVector(185.609665f, -121.303841f, -23.774967f));
    default AdjustedRotationCurve.AddRotatorAt(0.0f, FRotator(3.3f, -214.599182f, 0.0f));

    
    
 
    
    default AnimSequenceName = n"CameraBreathCLOSE";
    default CameraModifiers.Add(UDirectionInputModifier::StaticClass());

    
    default CameraFocusPointOffset = 0.f;

    default RequiredCharacterTagsSpeaker.AddTag(GameplayTag::Species_Creature_Demon); 

    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_Demon::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f; 

   

    

    default LightingParameters = LightingPresets::CloseShot();

    default LightingParameters.KeyLightParam.LightPos.AddVectorAt(0.f, FVector(30.072744f, -117.338387f, 106.839622f));
    default LightingParameters.KeyLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-70.746941f, 101.096382f, 0.f));
    default LightingParameters.KeyLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyLightParam.SourceHeight = 128.f;
    default LightingParameters.KeyLightParam.AttenuationRadius = 220.f;
    
    default LightingParameters.RimLightParam.LightPos.AddVectorAt(0.f, FVector(-50.723396f, 121.361267f, 63.488483f));
    default LightingParameters.RimLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-50.927406f, -85.840706f, 0.f));
    default LightingParameters.RimLightParam.SourceWidth = 128.f;
    default LightingParameters.RimLightParam.SourceHeight = 128.f;
    default LightingParameters.RimLightParam.AttenuationRadius = 180.f;
}
//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________


// class UConversationPreset_OverTheShoulder_Medium_Demon_NH : UConversationCameraPresetListenerOffset
// {
//     default PresetName = n"OVER THE SHOULDER MEDIUM DEMON NH";
//     default HideMode = EConversationCameraHideMode::None;
//     default LoopMode = EConversationCameraLoopMode::Repeat;
//     default FocusMode = EConversationCameraFocusMode::Speaker;

//     default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Topic_Speak);

//     default bAlwaysValid = false;
  
//     default bStaticActorTransforms = false;
//

//     default InitialChoiceWeight = 100.0f;
//     default TransitionTime = 0.0f;

//     default SqueezeFactor = 1.0f;
//     default FilmbackPresetName = "35mm VistaVision";
//     default CropSettings.AspectRatio = 1.777778f;

//     default CameraApertureCurve.AddValueAt(0.0, 5.000000);
//     default CameraFoVCurve.AddValueAt(0.0, 90.000000);
//     default CameraFocalLengthCurve.AddValueAt(0.0, 50.000000);

//     default ListenerPositionOffsetCurve.AddVectorAt(0.0f, FVector(-98.207458f, -56.720734f, 49.347443f));
//     default ListenerRotationOffsetCurve.AddRotatorAt(0.f, FRotator(-13.777843f, 18.108488f, 0.0f));

 
//     // default MaxHeightDifference = 300.0f;  

//     // default MinDistance = 90.0f; 
//     // default MaxDistance = 130.0f;   
    
//     default AnimSequenceName = n"CameraBreathCLOSE";
//     default CameraModifiers.Add(UDirectionInputModifier::StaticClass());


//     default CameraFocusPointOffset = 0.0f;

//     default ForbiddenCharacterTagsListener.AddTag(GameplayTag::Species_Orc);
//     default ForbiddenCharacterTagsSpeaker.AddTag(GameplayTag::Species_Orc);  
//     default ForbiddenCharacterTagsListener.AddTag(GameplayTag::Species_Human);  

//     //WHITELIST________________________________________________________________________________________________
//     //TOPICCHOICE
//     default PossibleTransitions.Add(FPresetTransitionEntry());
//     default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Cowboy_Demon::StaticClass();
//     default PossibleTransitions.Last().Weight = 100.0f;    
    
  
//     default PitchAdjustTarget = EConversationCameraFocusTarget::Speaker;

//     default LightingParameters = LightingPresets::CloseShot();

//     default LightingParameters.KeyLightParam.LightPos.AddVectorAt(0.f, FVector(30.072744f, -117.338387f, 106.839622f));
//     default LightingParameters.KeyLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-70.746941f, 101.096382f, 0.f));
//     default LightingParameters.KeyLightParam.SourceWidth = 250.f;
//     default LightingParameters.KeyLightParam.SourceHeight = 128.f;
//     default LightingParameters.KeyLightParam.AttenuationRadius = 220.f;
    
//     default LightingParameters.RimLightParam.LightPos.AddVectorAt(0.f, FVector(-50.723396f, 121.361267f, 63.488483f));
//     default LightingParameters.RimLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-50.927406f, -85.840706f, 0.f));
//     default LightingParameters.RimLightParam.SourceWidth = 128.f;
//     default LightingParameters.RimLightParam.SourceHeight = 128.f;
//     default LightingParameters.RimLightParam.AttenuationRadius = 180.f;
// }
//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________
















//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________
/// EXCLUSIVE SHOTS FOR THE DEMO
////////////////////////////////////////////////////////

class UConversationPreset_Drax_Conv_Demo : UConversationCameraPresetWorldSpace
{

    default PresetName = n"DRAX CONV DEMO";

    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;
    default PitchAdjustTarget = EConversationCameraFocusTarget::None;

    default bAlwaysValid = false;
  
    
    default TransitionTime = 0.0f;
    default InitialChoiceWeight = 0;
    
    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.77f;
    default CameraApertureCurve.AddValueAt(0.0f, 5.0f);
    default CameraFoVCurve.AddValueAt(0.0f, 90.0f);
    default CameraFocalLengthCurve.AddValueAt(0.0f, 45.0f);
    
    default PositionCurve.AddVectorAt(0.0f, FVector(108374.234375f, -75008.328125f, -186.53569f));
    default RotationCurve.AddVectorAt(0.0f, FVector(-10.245651f, -49.424122f, -1.502362f));

    default LightingParameters = LightingPresets::WideShot();

    //WHITELIST________________________________________________________________________________________________
    
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;
    
    
}

class UConversationPreset_FinalConver_DEMO_WIDE_1 : UConversationCameraPresetWorldSpace
{
    default PresetName = n"FINAL CONVER DEMO WIDE 1"; 

    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;
    default PitchAdjustTarget = EConversationCameraFocusTarget::None;

    default bAlwaysValid = false;
  
    
    default TransitionTime = 0.0f;
    default InitialChoiceWeight = 0;
    
    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.77f;
    default CameraApertureCurve.AddValueAt(0.0f, 5.0f);
    default CameraFoVCurve.AddValueAt(0.0f, 90.0f);
    default CameraFocalLengthCurve.AddValueAt(0.0f, 21.0f);
    
    default PositionCurve.AddVectorAt(0.0f, FVector(109636.8125f, -69922.5f, 2376.520508f));
    default RotationCurve.AddVectorAt(0.0f, FVector(2.206221f, 117.633759f, -0.077035f));

    default LightingParameters = LightingPresets::CloseShot();

    default AnimSequenceName = n"CameraBreathWIDE";
}

class UConversationPreset_FinalConver_DEMO_WIDE_2 : UConversationCameraPresetWorldSpace
{
    default PresetName = n"FINAL CONVER DEMO WIDE 2";

    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;
    default PitchAdjustTarget = EConversationCameraFocusTarget::None;

    default bAlwaysValid = false;
  
    
    default TransitionTime = 0.0f;
    default InitialChoiceWeight = 0;
    
    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.77f;
    default CameraApertureCurve.AddValueAt(0.0f, 5.0f);
    default CameraFoVCurve.AddValueAt(0.0f, 90.0f);
    default CameraFocalLengthCurve.AddValueAt(0.0f, 60.0f);
    
    default PositionCurve.AddVectorAt(0.0f, FVector(108657.882812f, -69362.476562f, 2412.081299f));
    default RotationCurve.AddVectorAt(0.0f, FVector(-4.595037f, -5.349881f, -0.104389f));

    default LightingParameters = LightingPresets::CloseShot();

    default AnimSequenceName = n"CameraBreathWIDE";
}

class UConversationPreset_FinalConver_DEMO_FS_DRAX : UConversationCameraPresetWorldSpace
{
    default PresetName = n"FINAL CONVER DEMO FS DRAX";

    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;
    default PitchAdjustTarget = EConversationCameraFocusTarget::None;

    default bAlwaysValid = false;
  
    
    default TransitionTime = 0.0f;
    default InitialChoiceWeight = 0;
    
    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.77f;
    default CameraApertureCurve.AddValueAt(0.0f, 4.8f);
    default CameraFoVCurve.AddValueAt(0.0f, 90.0f);
    default CameraFocalLengthCurve.AddValueAt(0.0f, 40.0f);
    
    default PositionCurve.AddVectorAt(0.0f, FVector(109436.164062f, -69487.929688f, 2356.883789f));
    default RotationCurve.AddVectorAt(0.0f, FVector(10.723988f, -2.844813f, -0.654292f));

    default LightingParameters = LightingPresets::CloseShot();

    default AnimSequenceName = n"CameraBreathCLOSE";   
}

class UConversationPreset_FinalConver_DEMO_FS_RATFORD : UConversationCameraPresetWorldSpace
{
    default PresetName = n"FINAL CONVER DEMO FS RATFORD";

    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;
    default PitchAdjustTarget = EConversationCameraFocusTarget::None;

    default bAlwaysValid = false;
  
    
    default TransitionTime = 0.0f;
    default InitialChoiceWeight = 0;
    
    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.77f;
    default CameraApertureCurve.AddValueAt(0.0f, 6.0f);
    default CameraFoVCurve.AddValueAt(0.0f, 90.0f);
    default CameraFocalLengthCurve.AddValueAt(0.0f, 35.0f);
    
    default PositionCurve.AddVectorAt(0.0f, FVector(109441.046875f, -69344.5625f, 2348.415283f));
    default RotationCurve.AddVectorAt(0.0f, FVector(2.093363f, -124.503654f, -3.642078f));

    default LightingParameters = LightingPresets::CloseShot();

    default AnimSequenceName = n"CameraBreathCLOSE";   
}

class UConversationPreset_FinalConver_DEMO_IND_NYRAS : UConversationCameraPresetWorldSpace
{
    default PresetName = n"FINAL CONVER DEMO IND NYRAS";

    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;
    default PitchAdjustTarget = EConversationCameraFocusTarget::None;

    default bAlwaysValid = false;
  
    
    default TransitionTime = 0.0f;
    default InitialChoiceWeight = 0;
    
    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.77f;
    default CameraApertureCurve.AddValueAt(0.0f, 5.2f);
    default CameraFoVCurve.AddValueAt(0.0f, 90.0f);
    default CameraFocalLengthCurve.AddValueAt(0.0f, 70.0f);
    
    default PositionCurve.AddVectorAt(0.0f, FVector(109504.570312f, -69526.359375f, 2385.418457f));
    default RotationCurve.AddVectorAt(0.0f, FVector(1.354538f, 126.762466f, -1.336843f));

    default LightingParameters = LightingPresets::CloseShot();

    default AnimSequenceName = n"CameraBreathCLOSE";   

    
    default CameraFocusPointOffset = 0.0f;
}

class UConversationPreset_FinalConver_DEMO_OTS_DRAX : UConversationCameraPresetWorldSpace
{
    default PresetName = n"FINAL CONVER DEMO OTS DRAX";

    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;
    default PitchAdjustTarget = EConversationCameraFocusTarget::None;

    default bAlwaysValid = false;
  
    
    default TransitionTime = 0.0f;
    default InitialChoiceWeight = 0;
    
    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.77f;
    default CameraApertureCurve.AddValueAt(0.0f, 5.0f);
    default CameraFoVCurve.AddValueAt(0.0f, 90.0f);
    default CameraFocalLengthCurve.AddValueAt(0.0f, 80.0f);
    
    default PositionCurve.AddVectorAt(0.0f, FVector(109230.898438f, -69273.859375f, 2417.703613f));
    default RotationCurve.AddVectorAt(0.0f, FVector(-5.266433f, -27.946674f, -0.336149f));

    default LightingParameters = LightingPresets::CloseShot();

    default AnimSequenceName = n"CameraBreathCLOSE";  

    
    default CameraFocusPointOffset = 0.0f; 
}

class UConversationPreset_FinalConver_DEMO_OTS_RATFORD : UConversationCameraPresetWorldSpace
{
    default PresetName = n"FINAL CONVER DEMO OTS RATFORD";

    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;
    default PitchAdjustTarget = EConversationCameraFocusTarget::None;

    default bAlwaysValid = false;
  
    
    default TransitionTime = 0.0f;
    default InitialChoiceWeight = 0;
    
    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.77f;
    default CameraApertureCurve.AddValueAt(0.0f, 5.2f);
    default CameraFoVCurve.AddValueAt(0.0f, 90.0f);
    default CameraFocalLengthCurve.AddValueAt(0.0f, 85.0f);
    
    default PositionCurve.AddVectorAt(0.0f, FVector(109755.4375f, -69423.195312f, 2427.302002f));
    default RotationCurve.AddVectorAt(0.0f, FVector(-8.686958f, -161.825439f, -2.62305f));

    default LightingParameters = LightingPresets::CloseShot();

    default AnimSequenceName = n"CameraBreathCLOSE";   

    
    default CameraFocusPointOffset = 0.0f;
}

class UConversationPreset_FinalConver_DEMO_IND_MED_RATFORD : UConversationCameraPresetWorldSpace
{
    default PresetName = n"FINAL CONVER DEMO IND MED RATFORD";

    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;
    default PitchAdjustTarget = EConversationCameraFocusTarget::None;

    default bAlwaysValid = false;
  
    
    default TransitionTime = 0.0f;
    default InitialChoiceWeight = 0;
    
    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.77f;
    default CameraApertureCurve.AddValueAt(0.0f, 8.5f);
    default CameraFoVCurve.AddValueAt(0.0f, 90.0f);
    default CameraFocalLengthCurve.AddValueAt(0.0f, 70.0f);
    
    default PositionCurve.AddVectorAt(0.0f, FVector(109547.578125f, -69413.242188f, 2369.216309f));
    default RotationCurve.AddVectorAt(0.0f, FVector(2.388541f, -150.401535f, -3.558877f));

    default LightingParameters = LightingPresets::CloseShot();

    default AnimSequenceName = n"CameraBreathCLOSE";   

    
    default CameraFocusPointOffset = 0.0f;
}

class UConversationPreset_FinalConver_DEMO_IND_CU_RATFORD : UConversationCameraPresetWorldSpace
{
    default PresetName = n"FINAL CONVER DEMO IND CU RATFORD";

    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;
    default PitchAdjustTarget = EConversationCameraFocusTarget::None;

    default bAlwaysValid = false;
  
    
    default TransitionTime = 0.0f;
    default InitialChoiceWeight = 0;
    
    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.77f;
    default CameraApertureCurve.AddValueAt(0.0f, 10.0f);
    default CameraFoVCurve.AddValueAt(0.0f, 90.0f);
    default CameraFocalLengthCurve.AddValueAt(0.0f, 85.0f);
    
    default PositionCurve.AddVectorAt(0.0f, FVector(109420.101562f, -69370.859375f, 2373.651367f));
    default RotationCurve.AddVectorAt(0.0f, FVector(2.896395f, -120.619957f, -2.726449f));

    default LightingParameters = LightingPresets::CloseShot();

    default AnimSequenceName = n"CameraBreathCLOSE";   

    
    default CameraFocusPointOffset = 0.0f;
}

class UConversationPreset_FinalConver_DEMO_WIDE_3 : UConversationCameraPresetWorldSpace
{
    default PresetName = n"FINAL CONVER DEMO WIDE 3";

    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;
    default PitchAdjustTarget = EConversationCameraFocusTarget::None;

    default bAlwaysValid = false;
  
    
    default TransitionTime = 0.0f;
    default InitialChoiceWeight = 0;
    
    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.77f;
    default CameraApertureCurve.AddValueAt(0.0f, 5.0f);
    default CameraFoVCurve.AddValueAt(0.0f, 90.0f);
    default CameraFocalLengthCurve.AddValueAt(0.0f, 32.0f);
    
    default PositionCurve.AddVectorAt(0.0f, FVector(109927.1875f, -69279.929688f, 2428.920898f));
    default RotationCurve.AddVectorAt(0.0f, FVector(-9.814693f, -160.277023f, -0.363543f));

    default LightingParameters = LightingPresets::CloseShot();

    
    default LightingParameters.KeyLightParam.LightIntensityCurve.AddValueAt(0.f, 0.f);     
        

      
    default LightingParameters.RimLightParam.LightIntensityCurve.AddValueAt(0.f, 0.f);        

        
   default LightingParameters.KeyReverseLightParam.LightIntensityCurve.AddValueAt(0.f, 0.f);           

       
    default LightingParameters.RimReverseLightParam.LightIntensityCurve.AddValueAt(0.f, 0.f);      
        
      

    default LightingParameters.SpeakerLightingChannels.bChannel0 = true;
    default LightingParameters.SpeakerLightingChannels.bChannel1 = false;
    default LightingParameters.SpeakerLightingChannels.bChannel2 = false;
    default LightingParameters.ListenerLightingChannels.bChannel0 = true;
    default LightingParameters.ListenerLightingChannels.bChannel1 = false;
    default LightingParameters.ListenerLightingChannels.bChannel2 = false;
    default LightingParameters.AdditionalParticipantLightingChannels.bChannel0 = true;
    default LightingParameters.AdditionalParticipantLightingChannels.bChannel1 = false;
    default LightingParameters.AdditionalParticipantLightingChannels.bChannel2 = false;

    default AnimSequenceName = n"CameraBreathWIDE";   
}

//------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------------
//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________
/// EXCLUSIVE SHOTS FOR 4 FRIENDS CONVERSATIONS
//------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------------


class UConversationPreset_TWO_SHOT_MILTEN_DIEGO_4FRIENDS_1C : UConversationCameraPresetWorldSpace
{
    default PresetName = n"TWO SHOT MILTEN DIEGO 4FRIENDS 1C";

    default HideMode = EConversationCameraHideMode::HideListener;
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;
    default PitchAdjustTarget = EConversationCameraFocusTarget::None;

    default bAlwaysValid = false;
  
    
    default TransitionTime = 0.0f;
    default InitialChoiceWeight = 0;
    
    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.77f;
    default CameraApertureCurve.AddValueAt(0.0f, 5.0f);
    default CameraFoVCurve.AddValueAt(0.0f, 90.0f);
    default CameraFocalLengthCurve.AddValueAt(0.0f, 32.0f);
    
    default PositionCurve.AddVectorAt(0.0f, FVector(158522.765625f, -69185.257812f, -2418.891357f));
    default RotationCurve.AddVectorAt(0.0f, FVector(2.324777f, -24.828135f, 1.460126f));

    default AnimSequenceName = n"CameraBreathWIDE"; 

    default LightingParameters = LightingPresets::CloseShot();

    default LightingParameters.KeyLightParam.LightPos.AddVectorAt(0.f, FVector(30.072744f, -117.338387f, 106.839622f));
    default LightingParameters.KeyLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-70.746941f, 101.096382f, 0.f));
    default LightingParameters.KeyLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyLightParam.SourceHeight = 128.f;
    default LightingParameters.KeyLightParam.AttenuationRadius = 220.f;
    
    default LightingParameters.RimLightParam.LightPos.AddVectorAt(0.f, FVector(-50.723396f, 121.361267f, 63.488483f));
    default LightingParameters.RimLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-50.927406f, -85.840706f, 0.f));
    default LightingParameters.RimLightParam.SourceWidth = 128.f;
    default LightingParameters.RimLightParam.SourceHeight = 128.f;
    default LightingParameters.RimLightParam.AttenuationRadius = 180.f;

    default LightingParameters.KeyReverseLightParam.LightPos.AddVectorAt(0.0f, FVector(231.300293f, 12.191214f, 101.046272f));
    default LightingParameters.KeyReverseLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-22.280821f, -112.729263f, -4.853063f));
    default LightingParameters.KeyReverseLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyReverseLightParam.SourceHeight = 128.f;
    default LightingParameters.KeyReverseLightParam.AttenuationRadius = 220.f;

    default LightingParameters.RimReverseLightParam.LightPos.AddVectorAt(0.0f, FVector(151.241394f, -236.490799f, 57.572384f));
    default LightingParameters.RimReverseLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(1.409744f, 57.549133f, 0.0f));
    default LightingParameters.RimReverseLightParam.SourceWidth = 128.f;
    default LightingParameters.RimReverseLightParam.SourceHeight = 128.f;
    default LightingParameters.RimReverseLightParam.AttenuationRadius = 180.f;

    //WHITELIST________________________________________________________________________________________________
    
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_PACK_SHOT_1_4FRIENDS_1C::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;
    
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_PACK_SHOT_2_4FRIENDS_1C::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;  
    
}



class UConversationPreset_WIDE_SHOT_GORN_4FRIENDS_1C : UConversationCameraPresetWorldSpace
{
    default PresetName = n"WIDE SHOT GORN 4FRIENDS 1C";

    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;
    default PitchAdjustTarget = EConversationCameraFocusTarget::None;

    default bAlwaysValid = false;
  
    
    default TransitionTime = 0.0f;
    default InitialChoiceWeight = 0;
    
    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.77f;
    default CameraApertureCurve.AddValueAt(0.0f, 5.0f);
    default CameraFoVCurve.AddValueAt(0.0f, 90.0f);
    default CameraFocalLengthCurve.AddValueAt(0.0f, 50.0f);
    
    default PositionCurve.AddVectorAt(0.0f, FVector(157824.03125f, -69382.171875f, -2325.397705f));
    default RotationCurve.AddVectorAt(0.0f, FVector(-7.733116f, 16.026096f, -0.287943f));

    default LightingParameters = LightingPresets::WideShot();

    default AnimSequenceName = n"CameraBreathWIDE"; 

    default LightingParameters = LightingPresets::WideShot();

    default LightingParameters.KeyLightParam.LightPos.AddVectorAt(0.0f, FVector(287.037384f, 72.020409f, 139.589737f));
    default LightingParameters.KeyLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-6.545993f, -160.430222f, 4.199695f));
    default LightingParameters.KeyLightParam.SourceWidth = 500.f;
    default LightingParameters.KeyLightParam.SourceHeight = 250.f;
    default LightingParameters.KeyLightParam.AttenuationRadius = 700.f;

    default LightingParameters.RimLightParam.LightPos.AddVectorAt(0.0f, FVector(-379.500671f, -98.383965f, 109.611916f));
    default LightingParameters.RimLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(5.542461f, -5.405639f, 0.0f));
    default LightingParameters.RimLightParam.SourceWidth = 850.f;
    default LightingParameters.RimLightParam.SourceHeight = 500.f;
    default LightingParameters.RimLightParam.AttenuationRadius = 700.f;

    default LightingParameters.KeyReverseLightParam.LightPos.AddVectorAt(0.0f, FVector(-231.992798f, -175.136841f, 208.485321f));
    default LightingParameters.KeyReverseLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-34.645317f, -29.407291f, 11.879292f));
    default LightingParameters.KeyReverseLightParam.SourceWidth = 500.f;
    default LightingParameters.KeyReverseLightParam.SourceHeight = 250.f;
    default LightingParameters.KeyReverseLightParam.AttenuationRadius = 700.f;

    default LightingParameters.RimReverseLightParam.LightPos.AddVectorAt(0.0f, FVector(371.577789f, -186.314102f, 4.300833f));
    default LightingParameters.RimReverseLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-9.105413f, 175.128433f, 5.893703f));
    default LightingParameters.RimReverseLightParam.SourceWidth = 500.f;
    default LightingParameters.RimReverseLightParam.SourceHeight = 500.f;
    default LightingParameters.RimReverseLightParam.AttenuationRadius = 700.f;

    //WHITELIST________________________________________________________________________________________________
    
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_PACK_SHOT_1_4FRIENDS_1C::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;
    
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_PACK_SHOT_2_4FRIENDS_1C::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;  

}




class UConversationPreset_WIDE_SHOT_DIEGO_4FRIENDS_1C : UConversationCameraPresetWorldSpace
{
    default PresetName = n"WIDE SHOT DIEGO 4FRIENDS 1C";

    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;
    default PitchAdjustTarget = EConversationCameraFocusTarget::None;

    default bAlwaysValid = false;
  
    
    default TransitionTime = 0.0f;
    default InitialChoiceWeight = 0;
    
    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.77f;
    default CameraApertureCurve.AddValueAt(0.0f, 5.0f);
    default CameraFoVCurve.AddValueAt(0.0f, 90.0f);
    default CameraFocalLengthCurve.AddValueAt(0.0f, 40.0f);
    
    default PositionCurve.AddVectorAt(0.0f, FVector(158130.359375f, -69733.335938f, -2480.877686f));
    default RotationCurve.AddVectorAt(0.0f, FVector(3.069149f, 53.269325f, -0.130738f));

    default LightingParameters = LightingPresets::WideShot();

    default AnimSequenceName = n"CameraBreathWIDE";   

    default LightingParameters = LightingPresets::WideShot();

    default LightingParameters.KeyLightParam.LightPos.AddVectorAt(0.0f, FVector(189.423004f, 142.173904f, 96.977074f));
    default LightingParameters.KeyLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-14.954892f, -166.609802f, 0.0f));
    default LightingParameters.KeyLightParam.SourceWidth = 500.f;
    default LightingParameters.KeyLightParam.SourceHeight = 250.f;
    default LightingParameters.KeyLightParam.AttenuationRadius = 700.f;

    default LightingParameters.RimLightParam.LightPos.AddVectorAt(0.0f, FVector(-234.002594f, 56.469208f, 96.439789f));
    default LightingParameters.RimLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-1.507665f, 25.536892f, 0.0f));
    default LightingParameters.RimLightParam.SourceWidth = 850.f;
    default LightingParameters.RimLightParam.SourceHeight = 500.f;
    default LightingParameters.RimLightParam.AttenuationRadius = 700.f;

    default LightingParameters.KeyReverseLightParam.LightPos.AddVectorAt(0.0f, FVector(244.182449f, 74.376228f, 123.221115f));
    default LightingParameters.KeyReverseLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-22.189749f, 167.410217f, 0.0f));
    default LightingParameters.KeyReverseLightParam.SourceWidth = 500.f;
    default LightingParameters.KeyReverseLightParam.SourceHeight = 250.f;
    default LightingParameters.KeyReverseLightParam.AttenuationRadius = 700.f;

    default LightingParameters.RimReverseLightParam.LightPos.AddVectorAt(0.0f, FVector(-279.917938f, -156.275482f, 45.230778f));
    default LightingParameters.RimReverseLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-1.515977f, 39.200462f, 0.0f));
    default LightingParameters.RimReverseLightParam.SourceWidth = 500.f;
    default LightingParameters.RimReverseLightParam.SourceHeight = 500.f;
    default LightingParameters.RimReverseLightParam.AttenuationRadius = 700.f;

    //WHITELIST________________________________________________________________________________________________
    
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_PACK_SHOT_1_4FRIENDS_1C::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;
    
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_PACK_SHOT_2_4FRIENDS_1C::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;  
}

class UConversationPreset_WIDE_SHOT_DIEGO_GORN_4FRIENDS_1C : UConversationCameraPresetWorldSpace
{
    default PresetName = n"WIDE SHOT DIEGO GORN 4FRIENDS 1C";

    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;
    default PitchAdjustTarget = EConversationCameraFocusTarget::None;

    default bAlwaysValid = false;
  
    
    default TransitionTime = 0.0f;
    default InitialChoiceWeight = 0;
    
    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.77f;
    default CameraApertureCurve.AddValueAt(0.0f, 5.0f);
    default CameraFoVCurve.AddValueAt(0.0f, 90.0f);
    default CameraFocalLengthCurve.AddValueAt(0.0f, 40.0f);
    
    default PositionCurve.AddVectorAt(0.0f, FVector(158130.359375f, -69733.335938f, -2480.877686f));
    default RotationCurve.AddVectorAt(0.0f, FVector(3.069149f, 53.269325f, -0.130738f));

    default LightingParameters = LightingPresets::WideShot();

    default AnimSequenceName = n"CameraBreathWIDE";   

    default LightingParameters = LightingPresets::WideShot();

   default LightingParameters.KeyLightParam.LightPos.AddVectorAt(0.0f, FVector(157.872864f, 102.338211f, 141.831741f));
    default LightingParameters.KeyLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-14.109792f, -129.191986f, 4.567864f));
    default LightingParameters.KeyLightParam.SourceWidth = 500.f;
    default LightingParameters.KeyLightParam.SourceHeight = 250.f;
    default LightingParameters.KeyLightParam.AttenuationRadius = 700.f;

    default LightingParameters.RimLightParam.LightPos.AddVectorAt(0.0f, FVector(-419.844513f, -175.562424f, 56.141392f));
    default LightingParameters.RimLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(5.65537f, 20.873569f, 0.0f));
    default LightingParameters.RimLightParam.SourceWidth = 850.f;
    default LightingParameters.RimLightParam.SourceHeight = 500.f;
    default LightingParameters.RimLightParam.AttenuationRadius = 700.f;

    default LightingParameters.KeyReverseLightParam.LightPos.AddVectorAt(0.0f, FVector(-228.813202f, -179.05838f, 208.667953f));
    default LightingParameters.KeyReverseLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-34.758228f, -28.507311f, 11.879292f));
    default LightingParameters.KeyReverseLightParam.SourceWidth = 500.f;
    default LightingParameters.KeyReverseLightParam.SourceHeight = 250.f;
    default LightingParameters.KeyReverseLightParam.AttenuationRadius = 700.f;

    default LightingParameters.RimReverseLightParam.LightPos.AddVectorAt(0.0f, FVector(374.452362f, -180.488571f, 3.284689f));
    default LightingParameters.RimReverseLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-9.218323f, 176.028412f, 5.893703f));
    default LightingParameters.RimReverseLightParam.SourceWidth = 500.f;
    default LightingParameters.RimReverseLightParam.SourceHeight = 500.f;
    default LightingParameters.RimReverseLightParam.AttenuationRadius = 700.f;

    //WHITELIST________________________________________________________________________________________________
    
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_PACK_SHOT_1_4FRIENDS_1C::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;
    
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_PACK_SHOT_2_4FRIENDS_1C::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;  
}





class UConversationPreset_PACK_SHOT_1_4FRIENDS_1C : UConversationCameraPresetWorldSpace
{
    default PresetName = n"PACK SHOT 1 4FRIENDS 1C";

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_TopicChoice);
    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_TopicChoice_Start);
    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_SubChoice);

    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;
    default PitchAdjustTarget = EConversationCameraFocusTarget::None;    

    default bAlwaysValid = false;
  
    
    default TransitionTime = 0.0f;
    default InitialChoiceWeight = 0.0f;
    
    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.77f;
    default CameraApertureCurve.AddValueAt(0.0f, 5.0f);
    default CameraFoVCurve.AddValueAt(0.0f, 90.0f);
    default CameraFocalLengthCurve.AddValueAt(0.0f, 29.0f);
    
    default PositionCurve.AddVectorAt(0.0f, FVector(158224.984375f, -69169.65625f, -2409.932617f));
    default RotationCurve.AddVectorAt(0.0f, FVector(-1.491431f, 0.735688f, -0.716648f));

    default AnimSequenceName = n"CameraBreathWIDE";   

    default LightingParameters = LightingPresets::WideShot();

    
    default LightingParameters.KeyLightParam.LightPos.AddVectorAt(0.0f, FVector(-67.544922f, -147.191696f, 229.664597f));
    default LightingParameters.KeyLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-51.821419f, 68.914352f, 0.0f));
    default LightingParameters.KeyLightParam.SourceWidth = 500.f;
    default LightingParameters.KeyLightParam.SourceHeight = 250.f;
    default LightingParameters.KeyLightParam.AttenuationRadius = 700.f;

   default LightingParameters.RimLightParam.LightPos.AddVectorAt(0.0f, FVector(16.59614f, 348.239044f, 166.489655f));
    default LightingParameters.RimLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-1.666145f, -85.301979f, 0.0f));
    default LightingParameters.RimLightParam.SourceWidth = 850.f;
    default LightingParameters.RimLightParam.SourceHeight = 500.f;
    default LightingParameters.RimLightParam.AttenuationRadius = 700.f;

    default LightingParameters.KeyReverseLightParam.LightPos.AddVectorAt(0.0f, FVector(292.178802f, 76.09626f, 192.543915f));
    default LightingParameters.KeyReverseLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-30.883171f, -142.050995f, -0.805449f));
    default LightingParameters.KeyReverseLightParam.SourceWidth = 500.f;
    default LightingParameters.KeyReverseLightParam.SourceHeight = 250.f;
    default LightingParameters.KeyReverseLightParam.AttenuationRadius = 700.f;

    default LightingParameters.RimReverseLightParam.LightPos.AddVectorAt(0.0f, FVector(76.520889f, -350.141998f, 210.478867f));
    default LightingParameters.RimReverseLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(1.666145f, 101.203064f, 0.0f));
    default LightingParameters.RimReverseLightParam.SourceWidth = 500.f;
    default LightingParameters.RimReverseLightParam.SourceHeight = 500.f;
    default LightingParameters.RimReverseLightParam.AttenuationRadius = 700.f;
}

class UConversationPreset_PACK_SHOT_2_4FRIENDS_1C : UConversationCameraPresetWorldSpace
{
    default PresetName = n"PACK SHOT 2 4FRIENDS 1C";

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_TopicChoice);
    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_TopicChoice_Start);
    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_SubChoice);

    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;
    default PitchAdjustTarget = EConversationCameraFocusTarget::None;

    default bAlwaysValid = false;
  
    
    default TransitionTime = 0.0f;
    default InitialChoiceWeight = 0.0f;
    
    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.77f;
    default CameraApertureCurve.AddValueAt(0.0f, 5.0f);
    default CameraFoVCurve.AddValueAt(0.0f, 90.0f);
    default CameraFocalLengthCurve.AddValueAt(0.0f, 28.0f);
    
     default PositionCurve.AddVectorAt(0.0f, FVector(158344.84375f, -69052.492188f, -2368.735596f));
    default RotationCurve.AddVectorAt(0.0f, FVector(-13.435892f, -33.231133f, 0.0f));

    default AnimSequenceName = n"CameraBreathWIDE";

    default LightingParameters = LightingPresets::WideShot();

    default LightingParameters.KeyLightParam.LightPos.AddVectorAt(0.0f, FVector(-196.17691f, -146.415359f, 231.70224f));
    default LightingParameters.KeyLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-43.406574f, 57.166977f, -0.0f));
    default LightingParameters.KeyLightParam.SourceWidth = 500.f;
    default LightingParameters.KeyLightParam.SourceHeight = 250.f;
    default LightingParameters.KeyLightParam.AttenuationRadius = 700.f;

    default LightingParameters.RimLightParam.LightPos.AddVectorAt(0.0f, FVector(-13.812846f, 322.926514f, 119.03492f));
    default LightingParameters.RimLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-1.727045f, -82.000969f, -0.0f));
    default LightingParameters.RimLightParam.SourceWidth = 850.f;
    default LightingParameters.RimLightParam.SourceHeight = 500.f;
    default LightingParameters.RimLightParam.AttenuationRadius = 700.f;

    default LightingParameters.KeyReverseLightParam.LightPos.AddVectorAt(0.0f, FVector(325.994141f, 87.876472f, 115.378647f));
    default LightingParameters.KeyReverseLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(1.727045f, -146.484314f, 0.0f));
    default LightingParameters.KeyReverseLightParam.SourceWidth = 500.f;
    default LightingParameters.KeyReverseLightParam.SourceHeight = 250.f;
    default LightingParameters.KeyReverseLightParam.AttenuationRadius = 700.f;

    default LightingParameters.RimReverseLightParam.LightPos.AddVectorAt(0.0f, FVector(-37.780922f, -460.798523f, 174.911835f));
    default LightingParameters.RimReverseLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(1.727045f, 85.628487f, 0.0f));
    default LightingParameters.RimReverseLightParam.SourceWidth = 500.f;
    default LightingParameters.RimReverseLightParam.SourceHeight = 500.f;
    default LightingParameters.RimReverseLightParam.AttenuationRadius = 700.f;   

    
}




class UConversationPreset_OTS_GORN_TO_NH_4FRIENDS_1C : UConversationCameraPresetWorldSpace
{
    default PresetName = n"OTS GORN TO NH 4FRIENDS 1C";

    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;
    default PitchAdjustTarget = EConversationCameraFocusTarget::None;

    default bAlwaysValid = false;
  
    
    default TransitionTime = 0.0f;
    default InitialChoiceWeight = 0;
    
    default SqueezeFactor = 1.0f;
    default FilmbackPresetName = "35mm VistaVision";
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.0f, 25.0f);
    default CameraFoVCurve.AddValueAt(0.0f, 90.0f);
    default CameraFocalLengthCurve.AddValueAt(0.0f, 100.0f);
    
    default PositionCurve.AddVectorAt(0.0f, FVector(158581.5f, -68935.390625f, -2367.572998f));
    default RotationCurve.AddVectorAt(0.0f, FVector(-5.043682f, -113.181778f, 5.563181f));

    default LightingParameters = LightingPresets::CloseShot();

    default AnimSequenceName = n"CameraBreathCLOSE"; 

    //WHITELIST________________________________________________________________________________________________
    
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_PACK_SHOT_1_4FRIENDS_1C::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;
    
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_PACK_SHOT_2_4FRIENDS_1C::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;     
}




class UConversationPreset_OTS_NH_TO_GORN_4FRIENDS_1C : UConversationCameraPresetWorldSpace
{
    default PresetName = n"OTS NH TO GORN 4FRIENDS 1C";

    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;
    default PitchAdjustTarget = EConversationCameraFocusTarget::None;

    default bAlwaysValid = false;
  
    
    default TransitionTime = 0.0f;
    default InitialChoiceWeight = 0;
    
    default SqueezeFactor = 1.0f;
    default FilmbackPresetName = "35mm VistaVision";
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.0f, 25.0f);
    default CameraFoVCurve.AddValueAt(0.0f, 90.0f);
    default CameraFocalLengthCurve.AddValueAt(0.0f, 95.0f);
    
    default PositionCurve.AddVectorAt(0.0f, FVector(158500.5625f, -69341.03125f, -2408.980713f));
    default RotationCurve.AddVectorAt(0.0f, FVector(4.702169f, 94.406639f, -2.857853f));

    default AnimSequenceName = n"CameraBreathCLOSE";   

    default LightingParameters = LightingPresets::CloseShot();

    default LightingParameters.KeyReverseLightParam.LightPos.AddVectorAt(0.0f, FVector(93.148338f, -137.774963f, 54.992523f));
    default LightingParameters.KeyReverseLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-47.888039f, 98.475182f, 0.0f));
    default LightingParameters.KeyReverseLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyReverseLightParam.SourceHeight = 128.f;
    default LightingParameters.KeyReverseLightParam.AttenuationRadius = 220.f;

    default LightingParameters.RimReverseLightParam.LightPos.AddVectorAt(0.0f, FVector(41.257896f, 147.513489f, 16.988754f));
    default LightingParameters.RimReverseLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-28.52298f, -92.726776f, 0.0f));
    default LightingParameters.RimReverseLightParam.SourceWidth = 128.f;
    default LightingParameters.RimReverseLightParam.SourceHeight = 128.f;
    default LightingParameters.RimReverseLightParam.AttenuationRadius = 180.f;

    //WHITELIST________________________________________________________________________________________________
    
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_PACK_SHOT_1_4FRIENDS_1C::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;
    
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_PACK_SHOT_2_4FRIENDS_1C::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;  

    
} 




class UConversationPreset_OTS_MILTEN_TO_DIEGO_4FRIENDS_1C : UConversationCameraPresetWorldSpace
{
    default PresetName = n"OTS MILTEN TO DIEGO 4FRIENDS 1C";

    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;
    default PitchAdjustTarget = EConversationCameraFocusTarget::None;

    default bAlwaysValid = false;
  
    
    default TransitionTime = 0.0f;
    default InitialChoiceWeight = 0;
    
    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.77f;
    default CameraApertureCurve.AddValueAt(0.0f, 5.0f);
    default CameraFoVCurve.AddValueAt(0.0f, 90.0f);
    default CameraFocalLengthCurve.AddValueAt(0.0f, 32.0f);
    
     default PositionCurve.AddVectorAt(0.0f, FVector(158541.5625f, -69205.460938f, -2422.353271f));
    default RotationCurve.AddVectorAt(0.0f, FVector(4.835895f, -66.205894f, 1.464815f));

    default AnimSequenceName = n"CameraBreathCLOSE"; 

    default LightingParameters = LightingPresets::CloseShot();

     default LightingParameters.KeyLightParam.LightPos.AddVectorAt(0.f, FVector(-54.703133f, 135.28978f, 44.719704f));
    default LightingParameters.KeyLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-50.93589f, -86.005913f, -10.529387f));
    default LightingParameters.KeyLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyLightParam.SourceHeight = 128.f;
    default LightingParameters.KeyLightParam.AttenuationRadius = 220.f;
    
    default LightingParameters.RimLightParam.LightPos.AddVectorAt(0.f, FVector(30.072744f, -117.338387f, 106.839622f));
    default LightingParameters.RimLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-70.746941f, 101.096382f, 0.f));
    default LightingParameters.RimLightParam.SourceWidth = 128.f;
    default LightingParameters.RimLightParam.SourceHeight = 128.f;
    default LightingParameters.RimLightParam.AttenuationRadius = 180.f;

    default LightingParameters.KeyReverseLightParam.LightPos.AddVectorAt(0.f, FVector(96.668289f, -75.362991f, 43.958393f));
    default LightingParameters.KeyReverseLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-23.530485f, 138.078659f, 0.f));       
    default LightingParameters.KeyReverseLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyReverseLightParam.SourceHeight = 128.f;
    default LightingParameters.KeyReverseLightParam.AttenuationRadius = 250.f;      
         

    default LightingParameters.RimReverseLightParam.LightPos.AddVectorAt(0.f, FVector(89.50592f, 129.534256f, 106.812492f));
    default LightingParameters.RimReverseLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-71.183342f, -78.903618f, 0.f));      
    default LightingParameters.RimReverseLightParam.SourceWidth = 128.f;
    default LightingParameters.RimReverseLightParam.SourceHeight = 128.f;
    default LightingParameters.RimReverseLightParam.AttenuationRadius = 300.f;  

    

    //WHITELIST________________________________________________________________________________________________
    
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_PACK_SHOT_1_4FRIENDS_1C::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;
    
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_PACK_SHOT_2_4FRIENDS_1C::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;  
}





class UConversationPreset_INDIVIDUAL_CLOSE_UP_MILTEN_4FRIENDS_1C : UConversationCameraPresetWorldSpace
{
    default PresetName = n"INDIVIDUAL CLOSE UP MILTEN 4FRIENDS 1C";

    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;
    default PitchAdjustTarget = EConversationCameraFocusTarget::None;

    default bAlwaysValid = false;
  
    
    default TransitionTime = 0.0f;
    default InitialChoiceWeight = 0;
    
    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.77f;
    default CameraApertureCurve.AddValueAt(0.0f, 20.0f);
    default CameraFoVCurve.AddValueAt(0.0f, 90.0f);
    default CameraFocalLengthCurve.AddValueAt(0.0f, 80.0f);
    
    default PositionCurve.AddVectorAt(0.0f, FVector(158489.375f, -69143.375f, -2424.087646f));
    default RotationCurve.AddVectorAt(0.0f, FVector(7.913807f, -30.460009f, 0.469269f));

    default AnimSequenceName = n"CameraBreathCLOSE";   

    default LightingParameters = LightingPresets::CloseShot();

    default LightingParameters.KeyLightParam.LightPos.AddVectorAt(0.f, FVector(30.072744f, -117.338387f, 106.839622f));
    default LightingParameters.KeyLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-70.746941f, 101.096382f, 0.f));
    default LightingParameters.KeyLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyLightParam.SourceHeight = 128.f;
    default LightingParameters.KeyLightParam.AttenuationRadius = 220.f;
    
    default LightingParameters.RimLightParam.LightPos.AddVectorAt(0.f, FVector(-54.703133f, 135.28978f, 44.719704f));
    default LightingParameters.RimLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-50.93589f, -86.005913f, -10.529387f));
    default LightingParameters.RimLightParam.SourceWidth = 128.f;
    default LightingParameters.RimLightParam.SourceHeight = 128.f;
    default LightingParameters.RimLightParam.AttenuationRadius = 180.f;          

    


    //WHITELIST________________________________________________________________________________________________
    
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_PACK_SHOT_1_4FRIENDS_1C::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;
    
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_PACK_SHOT_2_4FRIENDS_1C::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;  
    
   
}


class UConversationPreset_INDIVIDUAL_MEDIUM_LESTER_4FRIENDS_1C : UConversationCameraPresetWorldSpace
{
    default PresetName = n"INDIVIDUAL MEDIUM LESTER 4FRIENDS 1C";

    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;
    default PitchAdjustTarget = EConversationCameraFocusTarget::None;

    default bAlwaysValid = false;
  
    
    default TransitionTime = 0.0f;
    default InitialChoiceWeight = 0;
    
    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.77f;
    default CameraApertureCurve.AddValueAt(0.0f, 11.0f);
    default CameraFoVCurve.AddValueAt(0.0f, 90.0f);
    default CameraFocalLengthCurve.AddValueAt(0.0f, 35.0f);
    
    default PositionCurve.AddVectorAt(0.0f, FVector(158449.71875f, -69176.945312f, -2415.717285f));
    default RotationCurve.AddVectorAt(0.0f, FVector(3.002032f, 8.781888f, -0.073816f));

    default AnimSequenceName = n"CameraBreathCLOSE";   

    default LightingParameters = LightingPresets::CloseShot();

    default LightingParameters.KeyLightParam.LightPos.AddVectorAt(0.f, FVector(30.072744f, -117.338387f, 106.839622f));
    default LightingParameters.KeyLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-70.746941f, 101.096382f, 0.f));
    default LightingParameters.KeyLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyLightParam.SourceHeight = 128.f;
    default LightingParameters.KeyLightParam.AttenuationRadius = 220.f;
    
    default LightingParameters.RimLightParam.LightPos.AddVectorAt(0.f, FVector(-50.723396f, 121.361267f, 63.488483f));
    default LightingParameters.RimLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-50.927406f, -85.840706f, 0.f));
    default LightingParameters.RimLightParam.SourceWidth = 128.f;
    default LightingParameters.RimLightParam.SourceHeight = 128.f;
    default LightingParameters.RimLightParam.AttenuationRadius = 180.f;

    default LightingParameters.KeyReverseLightParam.LightPos.AddVectorAt(0.0f, FVector(231.300293f, 12.191214f, 101.046272f));
    default LightingParameters.KeyReverseLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-22.280821f, -112.729263f, -4.853063f));
    default LightingParameters.KeyReverseLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyReverseLightParam.SourceHeight = 128.f;
    default LightingParameters.KeyReverseLightParam.AttenuationRadius = 220.f;

    default LightingParameters.RimReverseLightParam.LightPos.AddVectorAt(0.0f, FVector(151.241394f, -236.490799f, 57.572384f));
    default LightingParameters.RimReverseLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(1.409744f, 57.549133f, 0.0f));
    default LightingParameters.RimReverseLightParam.SourceWidth = 128.f;
    default LightingParameters.RimReverseLightParam.SourceHeight = 128.f;
    default LightingParameters.RimReverseLightParam.AttenuationRadius = 180.f;

    


    //WHITELIST________________________________________________________________________________________________
    
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_PACK_SHOT_1_4FRIENDS_1C::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;
    
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_PACK_SHOT_2_4FRIENDS_1C::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;  
    
   
}




class UConversationPreset_POV_MILTEN_4FRIENDS_1C : UConversationCameraPresetWorldSpace
{
    default PresetName = n"POV MILTEN 4FRIENDS 1C";

    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;
    default PitchAdjustTarget = EConversationCameraFocusTarget::None;

    // default AssociatedTags.AddTag(GameplayTag::Action_GiveItem);

    default bAlwaysValid = false;
  
    
    default TransitionTime = 0.0f;
    default InitialChoiceWeight = 101.f;
    
    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.77f;
    default CameraApertureCurve.AddValueAt(0.0f, 5.0f);
    default CameraFoVCurve.AddValueAt(0.0f, 90.0f);
    default CameraFocalLengthCurve.AddValueAt(0.0f, 120.0f);
    
    default PositionCurve.AddVectorAt(0.0f, FVector(158286.359375f, -69123.703125f, -2399.406494f));
    default RotationCurve.AddVectorAt(0.0f, FVector(-0.228767f, -19.900759f, -3.138896f));

    default LightingParameters = LightingPresets::CloseShot();

    default AnimSequenceName = n"CameraBreathWIDE";   

    //WHITELIST________________________________________________________________________________________________
    
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_PACK_SHOT_1_4FRIENDS_1C::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;
    
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_PACK_SHOT_2_4FRIENDS_1C::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;  
}





class UConversationPreset_INDIVIDUAL_MEDIUM_GORN_4FRIENDS_1C : UConversationCameraPresetWorldSpace
{
    default PresetName = n"INDIVIDUAL MEDIUM GORN 4FRIENDS 1C";

    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;
    default PitchAdjustTarget = EConversationCameraFocusTarget::None;

    default bAlwaysValid = false;
  
    
    default TransitionTime = 0.0f;
    default InitialChoiceWeight = 0;
    
    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.77f;
    default CameraApertureCurve.AddValueAt(0.0f, 11.0f);
    default CameraFoVCurve.AddValueAt(0.0f, 90.0f);
    default CameraFocalLengthCurve.AddValueAt(0.0f, 40.0f);
    
    default PositionCurve.AddVectorAt(0.0f, FVector(158564.703125f, -69196.382812f, -2402.606934f));
    default RotationCurve.AddVectorAt(0.0f, FVector(3.560586f, 120.693306f, -0.401472f));

    default AnimSequenceName = n"CameraBreathCLOSE";  

    default LightingParameters = LightingPresets::CloseShot();

    default LightingParameters.KeyLightParam.LightPos.AddVectorAt(0.f, FVector(30.072744f, -117.338387f, 106.839622f));
    default LightingParameters.KeyLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-70.746941f, 101.096382f, 0.f));
    default LightingParameters.KeyLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyLightParam.SourceHeight = 128.f;
    default LightingParameters.KeyLightParam.AttenuationRadius = 220.f;
    
    default LightingParameters.RimLightParam.LightPos.AddVectorAt(0.f, FVector(-50.723396f, 121.361267f, 63.488483f));
    default LightingParameters.RimLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-50.927406f, -85.840706f, 0.f));
    default LightingParameters.RimLightParam.SourceWidth = 128.f;
    default LightingParameters.RimLightParam.SourceHeight = 128.f;
    default LightingParameters.RimLightParam.AttenuationRadius = 180.f;

    


    //WHITELIST________________________________________________________________________________________________
    
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_PACK_SHOT_1_4FRIENDS_1C::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;
    
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_PACK_SHOT_2_4FRIENDS_1C::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;  
}


// class UConversationPreset_GORN_GIVE_OBJECT_4FRIENDS_1C : UConversationCameraPresetWorldSpace
// {
//     default PresetName = n"GORN GIVE OBJECT 4FRIENDS 1C";

//     default HideMode = EConversationCameraHideMode::None;
//     default LoopMode = EConversationCameraLoopMode::Repeat;
//     default FocusMode = EConversationCameraFocusMode::Speaker;
//     default PitchAdjustTarget = EConversationCameraFocusTarget::None;

//     default AssociatedTags.AddTag(GameplayTag::Action_GiveItem);

//     default bAlwaysValid = true;
//
  
    
//     default TransitionTime = 0.0f;
//     default InitialChoiceWeight = 101.f;
    
//     default SqueezeFactor = 2.0f;
//     default CropSettings.AspectRatio = 1.77f;
//     default CameraApertureCurve.AddValueAt(0.0f, 5.0f);
//     default CameraFoVCurve.AddValueAt(0.0f, 90.0f);
//     default CameraFocalLengthCurve.AddValueAt(0.0f, 130.0f);

//     default PositionCurve.AddVectorAt(0.0f, FVector(158488.5625f, -69408.84375f, -2408.513916f));
//     default RotationCurve.AddVectorAt(0.0f, FVector(3.736823f, 90.91156f, -1.290782f));

//     default LightingParameters = LightingPresets::CloseShot();

//     default AnimSequenceName = n"CameraBreathCLOSE";   
// }


/////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////
////////////////////////LIGHTOUSE CONVERSATION/////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class UConversationPreset_PACK_SHOT_1_4FRIENDS_2C : UConversationCameraPresetWorldSpace
{
    default PresetName = n"PACK SHOT 1 4FRIENDS 2C";

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_TopicChoice);
    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_TopicChoice_Start);
    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_SubChoice);

    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;
    default PitchAdjustTarget = EConversationCameraFocusTarget::None;

    default bAlwaysValid = false;
  
    
    default TransitionTime = 0.0f;
    default InitialChoiceWeight = 0;
    
    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.77f;
    default CameraApertureCurve.AddValueAt(0.0f, 5.0f);
    default CameraFoVCurve.AddValueAt(0.0f, 90.0f);
    default CameraFocalLengthCurve.AddValueAt(0.0f, 33.0f);
    
    default PositionCurve.AddVectorAt(0.0f, FVector(73111.78125f, -85960.671875f, -3046.557861f));
    default RotationCurve.AddVectorAt(0.0f, FVector(-0.792039f, 163.251022f, 0.125729f));

    default AnimSequenceName = n"CameraBreathWIDE";

    
    default CameraFocusPointOffset = 0.0f;

    default LightingParameters = LightingPresets::WideShot();

    default LightingParameters.KeyLightParam.LightPos.AddVectorAt(0.0f, FVector(-49.158642f, -225.30687f, 110.085274f));
    default LightingParameters.KeyLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-39.572239f, 94.95459f, 0.0f));
    default LightingParameters.KeyLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyLightParam.SourceHeight = 250.f;
    default LightingParameters.KeyLightParam.AttenuationRadius = 400.f;

    default LightingParameters.RimLightParam.LightPos.AddVectorAt(0.0f, FVector(-43.771324f, 285.45462f, 82.04361f));
    default LightingParameters.RimLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-46.248592f, -69.666557f, 0.0f));
    default LightingParameters.RimLightParam.SourceWidth = 128.f;
    default LightingParameters.RimLightParam.SourceHeight = 128.f;
    default LightingParameters.RimLightParam.AttenuationRadius = 350.f;

    default LightingParameters.KeyReverseLightParam.LightPos.AddVectorAt(0.0f, FVector(-113.190659f, 223.35228f, 132.927139f));
    default LightingParameters.KeyReverseLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-50.804123f, -62.571087f, 0.0f));
    default LightingParameters.KeyReverseLightParam.SourceWidth = 500.f;
    default LightingParameters.KeyReverseLightParam.SourceHeight = 250.f;
    default LightingParameters.KeyReverseLightParam.AttenuationRadius = 700.f;

    default LightingParameters.RimReverseLightParam.LightPos.AddVectorAt(0.0f, FVector(11.556921f, -390.411926f, 128.131638f));
    default LightingParameters.RimReverseLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-39.496613f, 90.901749f, 0.0f));
    default LightingParameters.RimReverseLightParam.SourceWidth = 150.f;
    default LightingParameters.RimReverseLightParam.SourceHeight = 150.f;
    default LightingParameters.RimReverseLightParam.AttenuationRadius = 750.f;
      
}

class UConversationPreset_INDIVIDUAL_MEDIUM_DIEGO_4FRIENDS_2C : UConversationCameraPresetWorldSpace
{
    default PresetName = n"INDIVIDUAL MEDIUM DIEGO 4FRIENDS 2C";

    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;
    default PitchAdjustTarget = EConversationCameraFocusTarget::None;

    default bAlwaysValid = false;
  
    
    default TransitionTime = 0.0f;
    default InitialChoiceWeight = 0;
    
    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.77f;
    default CameraApertureCurve.AddValueAt(0.0f, 11.0f);
    default CameraFoVCurve.AddValueAt(0.0f, 90.0f);
    default CameraFocalLengthCurve.AddValueAt(0.0f, 32.0f);
    
    default PositionCurve.AddVectorAt(0.0f, FVector(72905.867188f, -85915.617188f, -3018.563721f));
    default RotationCurve.AddVectorAt(0.0f, FVector(1.265197f, 167.827881f, -0.121947f));

    default AnimSequenceName = n"CameraBreathCLOSE";

    
    default CameraFocusPointOffset = 0.0f;

    //WHITELIST________________________________________________________________________________________________
    
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_PACK_SHOT_1_4FRIENDS_2C::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f; 



    default LightingParameters = LightingPresets::CloseShot();

    default LightingParameters.KeyLightParam.LightPos.AddVectorAt(0.f, FVector(30.072744f, -117.338387f, 106.839622f));
    default LightingParameters.KeyLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-70.746941f, 101.096382f, 0.f));        
    default LightingParameters.KeyLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyLightParam.SourceHeight = 128.f;
    default LightingParameters.KeyLightParam.AttenuationRadius = 250.f;
       

    default LightingParameters.RimLightParam.LightPos.AddVectorAt(0.f, FVector(-54.703133f, 135.28978f, 44.719704f));
    default LightingParameters.RimLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-50.93589f, -86.005913f, -10.529387f));       
    default LightingParameters.RimLightParam.SourceWidth = 128.f;
    default LightingParameters.RimLightParam.SourceHeight = 128.f;
    default LightingParameters.RimLightParam.AttenuationRadius = 200.f;
       

    default LightingParameters.KeyReverseLightParam.LightPos.AddVectorAt(0.0f, FVector(241.342529f, 53.603588f, 67.003807f));
    default LightingParameters.KeyReverseLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-36.759312f, -93.520737f, -7.241585f));
    default LightingParameters.KeyReverseLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyReverseLightParam.SourceHeight = 128.f;
    default LightingParameters.KeyReverseLightParam.AttenuationRadius = 700.f;

    default LightingParameters.RimReverseLightParam.LightPos.AddVectorAt(0.0f, FVector(92.341583f, -358.496704f, 44.960426f));
    default LightingParameters.RimReverseLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-2.475949f, 103.95549f, 0.0f));
    default LightingParameters.RimReverseLightParam.SourceWidth = 128.f;
    default LightingParameters.RimReverseLightParam.SourceHeight = 128.f;
    default LightingParameters.RimReverseLightParam.AttenuationRadius = 500.f;

     

}

class UConversationPreset_INDIVIDUAL_MEDIUM_GORN_4FRIENDS_2C : UConversationCameraPresetWorldSpace
{
    default PresetName = n"INDIVIDUAL MEDIUM GORN 4FRIENDS 2C";

    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;
    default PitchAdjustTarget = EConversationCameraFocusTarget::None;

    default bAlwaysValid = false;
  
    
    default TransitionTime = 0.0f;
    default InitialChoiceWeight = 0;
    
    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.77f;
    default CameraApertureCurve.AddValueAt(0.0f, 11.0f);
    default CameraFoVCurve.AddValueAt(0.0f, 90.0f);
    default CameraFocalLengthCurve.AddValueAt(0.0f, 65.0f);
    
    default PositionCurve.AddVectorAt(0.0f, FVector(72839.46875f, -85909.273438f, -3041.522217f));
    default RotationCurve.AddVectorAt(0.0f, FVector(-2.794677f, 122.546097f, -1.187457f));

     default AnimSequenceName = n"CameraBreathCLOSE"; 

    
    default CameraFocusPointOffset = 0.0f;

    default LightingParameters = LightingPresets::CloseShot();

   

}

class UConversationPreset_INDIVIDUAL_CLOSEUP_GORN_4FRIENDS_2C : UConversationCameraPresetWorldSpace
{
    default PresetName = n"INDIVIDUAL CLOSEUP GORN 4FRIENDS 2C";

    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;
    default PitchAdjustTarget = EConversationCameraFocusTarget::None;

    default bAlwaysValid = false;
  
    
    default TransitionTime = 0.0f;
    default InitialChoiceWeight = 0;
    
    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.77f;
    default CameraApertureCurve.AddValueAt(0.0f, 25.0f);
    default CameraFoVCurve.AddValueAt(0.0f, 90.0f);
    default CameraFocalLengthCurve.AddValueAt(0.0f, 110.0f);
    
    default PositionCurve.AddVectorAt(0.0f, FVector(72825.460938f, -85820.398438f, -3039.04834f));
    default RotationCurve.AddVectorAt(0.0f, FVector(0.295841f, 131.033951f, -0.476862f));

    default AnimSequenceName = n"CameraBreathCLOSE"; 
    
    default CameraFocusPointOffset = 0.0f;

    default LightingParameters = LightingPresets::CloseShot();

     

    //WHITELIST________________________________________________________________________________________________
    
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_PACK_SHOT_1_4FRIENDS_2C::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f; 

}

class UConversationPreset_INDIVIDUAL_MEDIUM_MILTEN_4FRIENDS_2C : UConversationCameraPresetWorldSpace
{
    default PresetName = n"INDIVIDUAL MEDIUM MILTEN 4FRIENDS 2C";

    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;
    default PitchAdjustTarget = EConversationCameraFocusTarget::None;

    default bAlwaysValid = false;
  
    
    default TransitionTime = 0.0f;
    default InitialChoiceWeight = 0;
    
    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.77f;
    default CameraApertureCurve.AddValueAt(0.0f, 11.0f);
    default CameraFoVCurve.AddValueAt(0.0f, 90.0f);
    default CameraFocalLengthCurve.AddValueAt(0.0f, 65.0f);
    
    default PositionCurve.AddVectorAt(0.0f, FVector(72726.054688f, -85683.234375f, -3056.100342f));
    default RotationCurve.AddVectorAt(0.0f, FVector(-0.186402f, -65.987572f, 1.577095f));

    default AnimSequenceName = n"CameraBreathCLOSE"; 
    
    default CameraFocusPointOffset = 0.0f;

    default LightingParameters = LightingPresets::CloseShot();
    
    default LightingParameters.KeyLightParam.LightPos.AddVectorAt(0.0f, FVector(-20.826916f, 96.428291f, 76.338448f));
    default LightingParameters.KeyLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-65.00148f, -74.849815f, -0.0f));

    default LightingParameters.RimLightParam.LightPos.AddVectorAt(0.0f, FVector(-57.418388f, -146.000717f, 80.478416f));
    default LightingParameters.RimLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-48.038063f, 72.987442f, 12.952073f));


    

    //WHITELIST________________________________________________________________________________________________
    
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_PACK_SHOT_1_4FRIENDS_2C::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f; 

}

class UConversationPreset_INDIVIDUAL_MEDIUM_LESTER_4FRIENDS_2C : UConversationCameraPresetWorldSpace
{
    default PresetName = n"INDIVIDUAL MEDIUM LESTER 4FRIENDS 2C";

    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;
    default PitchAdjustTarget = EConversationCameraFocusTarget::None;

    default bAlwaysValid = false;
  
    
    default TransitionTime = 0.0f;
    default InitialChoiceWeight = 0;
    
    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.77f;
    default CameraApertureCurve.AddValueAt(0.0f, 11.0f);
    default CameraFoVCurve.AddValueAt(0.0f, 90.0f);
    default CameraFocalLengthCurve.AddValueAt(0.0f, 40.0f);
    
    default PositionCurve.AddVectorAt(0.0f, FVector(72823.78125f, -85794.773438f, -3029.17627f));
    default RotationCurve.AddVectorAt(0.0f, FVector(5.11213f, -178.354721f, 0.006734f));

    default AnimSequenceName = n"CameraBreathCLOSE";  
    
    default CameraFocusPointOffset = 0.0f;

    default LightingParameters = LightingPresets::CloseShot();

    

    //WHITELIST________________________________________________________________________________________________
    
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_PACK_SHOT_1_4FRIENDS_2C::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f; 

}

class UConversationPreset_INDIVIDUAL_CLOSEUP_DIEGO_4FRIENDS_2C : UConversationCameraPresetWorldSpace
{
    default PresetName = n"INDIVIDUAL CLOSEUP DIEGO 4FRIENDS 2C";

    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;
    default PitchAdjustTarget = EConversationCameraFocusTarget::None;

    default bAlwaysValid = false;
  
    
    default TransitionTime = 0.0f;
    default InitialChoiceWeight = 0;
    
    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.77f;
    default CameraApertureCurve.AddValueAt(0.0f, 25.0f);
    default CameraFoVCurve.AddValueAt(0.0f, 90.0f);
    default CameraFocalLengthCurve.AddValueAt(0.0f, 90.0f);
    
    default PositionCurve.AddVectorAt(0.0f, FVector(72937.96875f, -85882.648438f, -3020.38501f));
    default RotationCurve.AddVectorAt(0.0f, FVector(7.702733f, -178.315857f, -0.398368f));

    default AnimSequenceName = n"CameraBreathCLOSE"; 
    
    default CameraFocusPointOffset = 0.0f; 

    default LightingParameters = LightingPresets::CloseShot();

    

    //WHITELIST________________________________________________________________________________________________
    
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_PACK_SHOT_1_4FRIENDS_2C::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f; 

}

class UConversationPreset_INDIVIDUAL_CLOSEUP_NH_4FRIENDS_2C : UConversationCameraPresetWorldSpace
{
    default PresetName = n"INDIVIDUAL CLOSEUP NH 4FRIENDS 2C";

    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;
    default PitchAdjustTarget = EConversationCameraFocusTarget::None;

    default bAlwaysValid = false;
  
    
    default TransitionTime = 0.0f;
    default InitialChoiceWeight = 0;
    
    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.77f;
    default CameraApertureCurve.AddValueAt(0.0f, 25.0f);
    default CameraFoVCurve.AddValueAt(0.0f, 90.0f);
    default CameraFocalLengthCurve.AddValueAt(0.0f, 90.0f);
    
    default PositionCurve.AddVectorAt(0.0f, FVector(72721.351562f, -85697.101562f, -3049.518066f));
    default RotationCurve.AddVectorAt(0.0f, FVector(13.858956f, -47.859222f, 3.877296f));

    default AnimSequenceName = n"CameraBreathCLOSE"; 
    
    default CameraFocusPointOffset = 0.0f; 

    default LightingParameters = LightingPresets::CloseShot();

    

    //WHITELIST________________________________________________________________________________________________
    
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_PACK_SHOT_1_4FRIENDS_2C::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f; 

}

//------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------------
//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________
/// EXCLUSIVE SHOTS FOR VELAYA FINALE
//------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------------


class UConversationPreset_PACK_SHOT_1_VELAYA_FINALE : UConversationCameraPresetWorldSpace
{
    default PresetName = n"PACK SHOT 1 VELAYA FINALE";

      default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_TopicChoice);
    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_TopicChoice_Start);
    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_SubChoice);

    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;
    default PitchAdjustTarget = EConversationCameraFocusTarget::None;

    default bAlwaysValid = false;
  
    
    default TransitionTime = 0.0f;
    default InitialChoiceWeight = 0;
    
    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.77f;
    default CameraApertureCurve.AddValueAt(0.0f, 5.0f);
    default CameraFoVCurve.AddValueAt(0.0f, 90.0f);
    default CameraFocalLengthCurve.AddValueAt(0.0f, 45.0f);
    
    default PositionCurve.AddVectorAt(0.0f, FVector(113429.335938f, -105611.695312f, -3060.828369f));
    default RotationCurve.AddVectorAt(0.0f, FVector(0.0f, 105.151466f, 0.0f));

    default AnimSequenceName = n"CameraBreathWIDE"; 

    default LightingParameters = LightingPresets::CloseShot(); 

    default LightingParameters.KeyReverseLightParam.LightPos.AddVectorAt(0.f, FVector(184.723358f, -67.174858f, 74.79425f));
    default LightingParameters.KeyReverseLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-20.651741f, -152.529984f, 0.0f));    

    default LightingParameters.RimReverseLightParam.LightPos.AddVectorAt(0.f, FVector(54.773479f, -219.999161f, 56.102345f));
    default LightingParameters.RimReverseLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(2.940421f, 52.839993f, 0.0f));
    
}

class UConversationPreset_PACK_SHOT_3_VELAYA_FINALE : UConversationCameraPresetWorldSpace
{
    default PresetName = n"PACK SHOT 3 VELAYA FINALE";


    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;
    default PitchAdjustTarget = EConversationCameraFocusTarget::None;

    default bAlwaysValid = false;
  
    
    default TransitionTime = 0.0f;
    default InitialChoiceWeight = 0;
    
    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.77f;
    default CameraApertureCurve.AddValueAt(0.0f, 5.0f);
    default CameraFoVCurve.AddValueAt(0.0f, 90.0f);
    default CameraFocalLengthCurve.AddValueAt(0.0f, 30.0f);
    
    default PositionCurve.AddVectorAt(0.0f, FVector(113396.765625f, -105446.28125f, -3041.229492f));
    default RotationCurve.AddVectorAt(0.0f, FVector(-3.204974f, 121.199684f, -1.89272f));

    default AnimSequenceName = n"CameraBreathWIDE"; 

    default LightingParameters = LightingPresets::CloseShot(); 

    default LightingParameters.KeyReverseLightParam.LightPos.AddVectorAt(0.f, FVector(184.723358f, -67.174858f, 74.79425f));
    default LightingParameters.KeyReverseLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-20.651741f, -152.529984f, 0.0f));    

    default LightingParameters.RimReverseLightParam.LightPos.AddVectorAt(0.f, FVector(54.773479f, -219.999161f, 56.102345f));
    default LightingParameters.RimReverseLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(2.940421f, 52.839993f, 0.0f));
    
}


class UConversationPreset_PACK_SHOT_2_VELAYA_FINALE : UConversationCameraPresetWorldSpace
{
    default PresetName = n"PACK SHOT 2 VELAYA FINALE";


    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;
    default PitchAdjustTarget = EConversationCameraFocusTarget::None;

    default bAlwaysValid = false;
  
    
    default TransitionTime = 0.0f;
    default InitialChoiceWeight = 0;
    
    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.77f;
    default CameraApertureCurve.AddValueAt(0.0f, 5.0f);
    default CameraFoVCurve.AddValueAt(0.0f, 90.0f);
    default CameraFocalLengthCurve.AddValueAt(0.0f, 30.0f);
    
     default PositionCurve.AddVectorAt(0.0f, FVector(113049.921875f, -105000.546875f, -3061.266113f));
    default RotationCurve.AddVectorAt(0.0f, FVector(0.999585f, -33.258839f, 0.006958f));

    default AnimSequenceName = n"CameraBreathWIDE"; 

    default LightingParameters = LightingPresets::CloseShot(); 

    default LightingParameters.KeyReverseLightParam.LightPos.AddVectorAt(0.f, FVector(184.723358f, -67.174858f, 74.79425f));
    default LightingParameters.KeyReverseLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-20.651741f, -152.529984f, 0.0f));    

    default LightingParameters.RimReverseLightParam.LightPos.AddVectorAt(0.f, FVector(54.773479f, -219.999161f, 56.102345f));
    default LightingParameters.RimReverseLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(2.940421f, 52.839993f, 0.0f));
    
}

class UConversationPreset_INDIVIDUAL_CLOSEUP_SERAPHIA_VELAYA_FINALE : UConversationCameraPresetWorldSpace
{
    default PresetName = n"INDIVIDUAL CLOSEUP SERAPHIA VELAYA FINALE";

    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;
    default PitchAdjustTarget = EConversationCameraFocusTarget::None;

    default bAlwaysValid = false;
  
    
    default TransitionTime = 0.0f;
    default InitialChoiceWeight = 0;
    
    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.77f;
    default CameraApertureCurve.AddValueAt(0.0f, 20.0f);
    default CameraFoVCurve.AddValueAt(0.0f, 90.0f);
    default CameraFocalLengthCurve.AddValueAt(0.0f, 75.0f);
    
    default PositionCurve.AddVectorAt(0.0f, FVector(113433.757812f, -105169.632812f, -3049.397949f));
    default RotationCurve.AddVectorAt(0.0f, FVector(4.241224f, -142.982391f, 0.137811f));

    default AnimSequenceName = n"CameraBreathCLOSE"; 
    
    default CameraFocusPointOffset = 0.0f;

    default LightingParameters = LightingPresets::CloseShot();

     

    //WHITELIST________________________________________________________________________________________________
    
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_PACK_SHOT_1_VELAYA_FINALE::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

}

class UConversationPreset_INDIVIDUAL_CLOSEUP_VELAYA_END_FINALE : UConversationCameraPresetWorldSpace
{
    default PresetName = n"INDIVIDUAL CLOSEUP VELAYA END FINALE";

    default HideMode = EConversationCameraHideMode::HideListener;
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;
    default PitchAdjustTarget = EConversationCameraFocusTarget::None;

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Topic_Speak); 
       

    default bAlwaysValid = false;
  
    
    default TransitionTime = 0.0f;
    default InitialChoiceWeight = 0.f;
    
    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.77f;
    default CameraApertureCurve.AddValueAt(0.0f, 20.0f);
    default CameraFoVCurve.AddValueAt(0.0f, 90.0f);
    default CameraFocalLengthCurve.AddValueAt(0.0f, 45.0f);
    
    default PositionCurve.AddVectorAt(0.0f, FVector(113355.015625f, -105313.757812f, -3010.026123f));
    default RotationCurve.AddVectorAt(0.0f, FVector(-9.977118f, 145.899597f, -2.150728f));

    default AnimSequenceName = n"CameraBreathCLOSE"; 
    
    default CameraFocusPointOffset = 0.0f;

    default LightingParameters = LightingPresets::CloseShot();

     

    //WHITELIST________________________________________________________________________________________________
    

}


class UConversationPreset_OTS_MEDIUM_SERAPHIA_VELAYA_FINALE : UConversationCameraPresetWorldSpace
{
    default PresetName = n"OTS MEDIUM SERAPHIA VELAYA FINALE";

    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;
    default PitchAdjustTarget = EConversationCameraFocusTarget::None;

    default bAlwaysValid = false;
  
    
    default TransitionTime = 0.0f;
    default InitialChoiceWeight = 0;
    
    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.77f;
    default CameraApertureCurve.AddValueAt(0.0f, 13.8f);
    default CameraFoVCurve.AddValueAt(0.0f, 90.0f);
    default CameraFocalLengthCurve.AddValueAt(0.0f, 62.0f);
    
    default PositionCurve.AddVectorAt(0.0f, FVector(113427.601562f, -105034.75f, -3029.010498f));
    default RotationCurve.AddVectorAt(0.0f, FVector(-1.54679f, -127.220818f, 0.998698f));

    default AnimSequenceName = n"CameraBreathCLOSE"; 
    
    default CameraFocusPointOffset = 0.0f;

    default LightingParameters = LightingPresets::CloseShot();     


}

class UConversationPreset_OTS_MEDIUM_VELAYA_VELAYA_FINALE : UConversationCameraPresetWorldSpace
{
    default PresetName = n"OTS MEDIUM VELAYA VELAYA FINALE";

    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;
    default PitchAdjustTarget = EConversationCameraFocusTarget::None;

    default bAlwaysValid = false;
  
    
    default TransitionTime = 0.0f;
    default InitialChoiceWeight = 0;
    
    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.77f;
    default CameraApertureCurve.AddValueAt(0.0f, 13.8f);
    default CameraFoVCurve.AddValueAt(0.0f, 90.0f);
    default CameraFocalLengthCurve.AddValueAt(0.0f, 62.0f);    
    
    
    default PositionCurve.AddVectorAt(0.0f, FVector(113307.632812f, -105350.828125f, -3028.305908f));
    default RotationCurve.AddVectorAt(0.0f, FVector(-1.537075f, 88.168938f, -1.047053f));

    default AnimSequenceName = n"CameraBreathCLOSE"; 
    
    default CameraFocusPointOffset = 0.0f;

    default LightingParameters = LightingPresets::CloseShot();     


}

/////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////// VARRAGS FORCED CAMERAS ///////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////


class UConversationPreset_Individual_CU_VarragArrushat : UConversationCameraPresetWorldSpace
{
    default PresetName = n"INDIVIDUAL CU VARRAG ARRUSHAT";
    default HideMode = EConversationCameraHideMode::HideListener;
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Topic_Speak);    

    default PitchAdjustTarget = EConversationCameraFocusTarget::None;

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 0.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.0, 7.f);
    default CameraFoVCurve.AddValueAt(0.0, 90.000000);
    default CameraFocalLengthCurve.AddValueAt(0.0, 90.000000);

     default PositionCurve.AddVectorAt(0.0f, FVector(133279.3125f, -178838.4375f, 533.017578f));
    default RotationCurve.AddVectorAt(0.0f, FVector(8.484838f, 166.483017f, 0.554925f));

       
     
    default AnimSequenceName = n"CameraBreathCLOSE";
    default CameraModifiers.Add(UDirectionInputModifier::StaticClass());

    
    default CameraFocusPointOffset = 0.f; 
  

       

    //WHITELIST________________________________________________________________________________________________
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_VarragArrushat::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;
  

        

    default LightingParameters = LightingPresets::CloseShot();

    default LightingParameters.KeyLightParam.LightPos.AddVectorAt(0.f, FVector(30.072744f, -117.338387f, 106.839622f));
    default LightingParameters.KeyLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-70.746941f, 101.096382f, 0.f));
    default LightingParameters.KeyLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyLightParam.SourceHeight = 128.f;
    default LightingParameters.KeyLightParam.AttenuationRadius = 220.f;
    
    default LightingParameters.RimLightParam.LightPos.AddVectorAt(0.f, FVector(-50.723396f, 121.361267f, 63.488483f));
    default LightingParameters.RimLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-50.927406f, -85.840706f, 0.f));
    default LightingParameters.RimLightParam.SourceWidth = 128.f;
    default LightingParameters.RimLightParam.SourceHeight = 128.f;
    default LightingParameters.RimLightParam.AttenuationRadius = 180.f;


}

//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________


class UConversationPreset_Individual_Medium_VarragArrushat : UConversationCameraPresetWorldSpace
{
    default PresetName = n"INDIVIDUAL MEDIUM VARRAG ARRUSHAT";
    default HideMode = EConversationCameraHideMode::HideListener;
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Topic_Speak);
    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_TopicChoice);
    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_SubChoice);    

    default PitchAdjustTarget = EConversationCameraFocusTarget::None;

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 0.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.0, 8.f);
    default CameraFoVCurve.AddValueAt(0.0, 90.000000);
    default CameraFocalLengthCurve.AddValueAt(0.0, 60.000000);

    default PositionCurve.AddVectorAt(0.0f, FVector(133185.390625f, -178942.28125f, 521.390259f));
    default RotationCurve.AddVectorAt(0.0f, FVector(10.645418f, 149.187698f, -1.719375f));


    
   
     
    default AnimSequenceName = n"CameraBreathCLOSE";
    default CameraModifiers.Add(UDirectionInputModifier::StaticClass());

    
    default CameraFocusPointOffset = 0.f; 
  

       

    //WHITELIST________________________________________________________________________________________________
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Individual_Medium_VarragArrushat::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;
     
        

    default LightingParameters = LightingPresets::CloseShot();

    default LightingParameters.KeyLightParam.LightPos.AddVectorAt(0.f, FVector(30.072744f, -117.338387f, 106.839622f));
    default LightingParameters.KeyLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-70.746941f, 101.096382f, 0.f));
    default LightingParameters.KeyLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyLightParam.SourceHeight = 128.f;
    default LightingParameters.KeyLightParam.AttenuationRadius = 220.f;
    
    default LightingParameters.RimLightParam.LightPos.AddVectorAt(0.f, FVector(-50.723396f, 121.361267f, 63.488483f));
    default LightingParameters.RimLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-50.927406f, -85.840706f, 0.f));
    default LightingParameters.RimLightParam.SourceWidth = 128.f;
    default LightingParameters.RimLightParam.SourceHeight = 128.f;
    default LightingParameters.RimLightParam.AttenuationRadius = 180.f;

}


//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________


class UConversationPreset_Wide_VarragArrushat : UConversationCameraPresetWorldSpace
{
    default PresetName = n"WIDE VARRAG ARRUSHAT";
    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::None;
    default FocusMode = EConversationCameraFocusMode::Speaker;

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_TopicChoice);
    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_SubChoice);

    default PitchAdjustTarget = EConversationCameraFocusTarget::Speaker;

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 100.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.0, 1.8f);
    default CameraFoVCurve.AddValueAt(0.0, 90.000000);
    default CameraFocalLengthCurve.AddValueAt(0.0, 32.000000);

    default PositionCurve.AddVectorAt(0.0f, FVector(133935.703125f, -178885.03125f, 589.507202f));
    default RotationCurve.AddVectorAt(0.0f, FVector(-4.902744f, 148.748627f, 0.f));

    default AnimSequenceName = n"CameraBreathWIDE"; 

         



    //WHITELIST________________________________________________________________________________________________
    
        

   

     default LightingParameters = LightingPresets::CloseShot();

    default LightingParameters.KeyLightParam.LightPos.AddVectorAt(0.f, FVector(-34.314175f, -166.404495f, 77.663094f));
    default LightingParameters.KeyLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-34.70937f, 67.878105f, -0.0f));
    default LightingParameters.KeyLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyLightParam.SourceHeight = 128.f;
    default LightingParameters.KeyLightParam.AttenuationRadius = 240.f;


    default LightingParameters.RimLightParam.LightPos.AddVectorAt(0.f, FVector(-64.898094f, 163.305573f, 74.204155f));
    default LightingParameters.RimLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-39.781803f, -85.833664f, 0.f));
    default LightingParameters.RimLightParam.SourceWidth = 128.f;
    default LightingParameters.RimLightParam.SourceHeight = 128.f;
    default LightingParameters.RimLightParam.AttenuationRadius = 260.f;

    default LightingParameters.KeyReverseLightParam.LightPos.AddVectorAt(0.f, FVector(149.040436f, 113.341812f, 76.860558f));
    default LightingParameters.KeyReverseLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-41.693241f, -151.58696f, -0.0f));
    default LightingParameters.KeyReverseLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyReverseLightParam.SourceHeight = 128.f;
    default LightingParameters.KeyReverseLightParam.AttenuationRadius = 240.f;

    default LightingParameters.RimReverseLightParam.LightPos.AddVectorAt(0.f, FVector(35.822956f, -187.513748f, 90.153114f));
    default LightingParameters.RimReverseLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-40.218197f, 85.471069f, 0.f));
    default LightingParameters.RimReverseLightParam.SourceWidth = 128.f;
    default LightingParameters.RimReverseLightParam.SourceHeight = 128.f;
    default LightingParameters.RimReverseLightParam.AttenuationRadius = 280.f;
}

//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________

class UConversationPreset_Individual_CU_VarragHashor : UConversationCameraPresetWorldSpace
{
    default PresetName = n"INDIVIDUAL CU VARRAG HASHOR";
    default HideMode = EConversationCameraHideMode::HideListener;
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Topic_Speak);    

    default PitchAdjustTarget = EConversationCameraFocusTarget::None;

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 0.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.0, 7.f);
    default CameraFoVCurve.AddValueAt(0.0, 90.000000);
    default CameraFocalLengthCurve.AddValueAt(0.0, 90.000000);

    default PositionCurve.AddVectorAt(0.0f, FVector(151325.140625f, -164996.203125f, 494.308563f));
    default RotationCurve.AddVectorAt(0.0f, FVector(13.120048f, -179.130493f, -0.432876f));

       
     
    default AnimSequenceName = n"CameraBreathCLOSE";
    default CameraModifiers.Add(UDirectionInputModifier::StaticClass());

    
    default CameraFocusPointOffset = 0.f; 
  

       

    //WHITELIST________________________________________________________________________________________________
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Wide_VarragHashor::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;
  

        

    default LightingParameters = LightingPresets::CloseShot();

    default LightingParameters.KeyLightParam.LightPos.AddVectorAt(0.f, FVector(30.072744f, -117.338387f, 106.839622f));
    default LightingParameters.KeyLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-70.746941f, 101.096382f, 0.f));
    default LightingParameters.KeyLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyLightParam.SourceHeight = 128.f;
    default LightingParameters.KeyLightParam.AttenuationRadius = 220.f;
    
    default LightingParameters.RimLightParam.LightPos.AddVectorAt(0.f, FVector(-50.723396f, 121.361267f, 63.488483f));
    default LightingParameters.RimLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-50.927406f, -85.840706f, 0.f));
    default LightingParameters.RimLightParam.SourceWidth = 128.f;
    default LightingParameters.RimLightParam.SourceHeight = 128.f;
    default LightingParameters.RimLightParam.AttenuationRadius = 180.f;


}

//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________


class UConversationPreset_Individual_Medium_VarragHashor : UConversationCameraPresetWorldSpace
{
    default PresetName = n"INDIVIDUAL MEDIUM VARRAG HASHOR";
    default HideMode = EConversationCameraHideMode::HideListener;
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Topic_Speak);    

    default PitchAdjustTarget = EConversationCameraFocusTarget::None;

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 0.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.0, 8.f);
    default CameraFoVCurve.AddValueAt(0.0, 90.000000);
    default CameraFocalLengthCurve.AddValueAt(0.0, 60.000000);

    default PositionCurve.AddVectorAt(0.0f, FVector(151347.734375f, -165080.828125f, 523.268982f));
    default RotationCurve.AddVectorAt(0.0f, FVector(6.486157f, 167.851425f, 0.134614f));


    
   
     
    default AnimSequenceName = n"CameraBreathCLOSE";
    default CameraModifiers.Add(UDirectionInputModifier::StaticClass());

    
    default CameraFocusPointOffset = 0.f; 
  

       

    //WHITELIST________________________________________________________________________________________________
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Wide_VarragHashor::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;
     
        

    default LightingParameters = LightingPresets::CloseShot();

    default LightingParameters.KeyLightParam.LightPos.AddVectorAt(0.f, FVector(30.072744f, -117.338387f, 106.839622f));
    default LightingParameters.KeyLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-70.746941f, 101.096382f, 0.f));
    default LightingParameters.KeyLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyLightParam.SourceHeight = 128.f;
    default LightingParameters.KeyLightParam.AttenuationRadius = 220.f;
    
    default LightingParameters.RimLightParam.LightPos.AddVectorAt(0.f, FVector(-50.723396f, 121.361267f, 63.488483f));
    default LightingParameters.RimLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-50.927406f, -85.840706f, 0.f));
    default LightingParameters.RimLightParam.SourceWidth = 128.f;
    default LightingParameters.RimLightParam.SourceHeight = 128.f;
    default LightingParameters.RimLightParam.AttenuationRadius = 180.f;

}


//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________


class UConversationPreset_Wide_VarragHashor : UConversationCameraPresetWorldSpace
{
    default PresetName = n"WIDE VARRAG HASHOR";
    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::None;
    default FocusMode = EConversationCameraFocusMode::Speaker;

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_TopicChoice);
    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_SubChoice);

    default PitchAdjustTarget = EConversationCameraFocusTarget::Speaker;

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 100.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.0, 1.8f);
    default CameraFoVCurve.AddValueAt(0.0, 90.000000);
    default CameraFocalLengthCurve.AddValueAt(0.0, 32.000000);

    default PositionCurve.AddVectorAt(0.0f, FVector(152108.609375f, -164884.8125f, 479.344482f));
    default RotationCurve.AddVectorAt(0.0f, FVector(0.0f, 173.830948f, 0.0f));

    default AnimSequenceName = n"CameraBreathWIDE"; 

         



    //WHITELIST________________________________________________________________________________________________
    
        

   

     default LightingParameters = LightingPresets::CloseShot();

    default LightingParameters.KeyLightParam.LightPos.AddVectorAt(0.f, FVector(-34.314175f, -166.404495f, 77.663094f));
    default LightingParameters.KeyLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-34.70937f, 67.878105f, -0.0f));
    default LightingParameters.KeyLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyLightParam.SourceHeight = 128.f;
    default LightingParameters.KeyLightParam.AttenuationRadius = 240.f;


    default LightingParameters.RimLightParam.LightPos.AddVectorAt(0.f, FVector(-64.898094f, 163.305573f, 74.204155f));
    default LightingParameters.RimLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-39.781803f, -85.833664f, 0.f));
    default LightingParameters.RimLightParam.SourceWidth = 128.f;
    default LightingParameters.RimLightParam.SourceHeight = 128.f;
    default LightingParameters.RimLightParam.AttenuationRadius = 260.f;

    default LightingParameters.KeyReverseLightParam.LightPos.AddVectorAt(0.f, FVector(149.040436f, 113.341812f, 76.860558f));
    default LightingParameters.KeyReverseLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-41.693241f, -151.58696f, -0.0f));
    default LightingParameters.KeyReverseLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyReverseLightParam.SourceHeight = 128.f;
    default LightingParameters.KeyReverseLightParam.AttenuationRadius = 240.f;

    default LightingParameters.RimReverseLightParam.LightPos.AddVectorAt(0.f, FVector(35.822956f, -187.513748f, 90.153114f));
    default LightingParameters.RimReverseLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-40.218197f, 85.471069f, 0.f));
    default LightingParameters.RimReverseLightParam.SourceWidth = 128.f;
    default LightingParameters.RimReverseLightParam.SourceHeight = 128.f;
    default LightingParameters.RimReverseLightParam.AttenuationRadius = 280.f;
}


//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________

class UConversationPreset_Individual_CU_VarragRuushk : UConversationCameraPresetWorldSpace
{
    default PresetName = n"INDIVIDUAL CU VARRAG RUUUSHK";
    default HideMode = EConversationCameraHideMode::HideListener;
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Topic_Speak);    

    default PitchAdjustTarget = EConversationCameraFocusTarget::None;

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 0.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.0, 7.f);
    default CameraFoVCurve.AddValueAt(0.0, 90.000000);
    default CameraFocalLengthCurve.AddValueAt(0.0, 90.000000);

    default PositionCurve.AddVectorAt(0.0f, FVector(159625.671875f, -184347.484375f, 241.125763f));
    default RotationCurve.AddVectorAt(0.0f, FVector(13.098481f, -49.769054f, 0.496724f));

       
     
    default AnimSequenceName = n"CameraBreathCLOSE";
    default CameraModifiers.Add(UDirectionInputModifier::StaticClass());

    
    default CameraFocusPointOffset = 0.f; 
  

       

    //WHITELIST________________________________________________________________________________________________
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Wide_VarragRuushk::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;
  

        

    default LightingParameters = LightingPresets::CloseShot();

    default LightingParameters.KeyLightParam.LightPos.AddVectorAt(0.f, FVector(30.072744f, -117.338387f, 106.839622f));
    default LightingParameters.KeyLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-70.746941f, 101.096382f, 0.f));
    default LightingParameters.KeyLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyLightParam.SourceHeight = 128.f;
    default LightingParameters.KeyLightParam.AttenuationRadius = 220.f;
    
    default LightingParameters.RimLightParam.LightPos.AddVectorAt(0.f, FVector(-50.723396f, 121.361267f, 63.488483f));
    default LightingParameters.RimLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-50.927406f, -85.840706f, 0.f));
    default LightingParameters.RimLightParam.SourceWidth = 128.f;
    default LightingParameters.RimLightParam.SourceHeight = 128.f;
    default LightingParameters.RimLightParam.AttenuationRadius = 180.f;


}

//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________


class UConversationPreset_Individual_Medium_VarragRuushk : UConversationCameraPresetWorldSpace
{
    default PresetName = n"INDIVIDUAL MEDIUM VARRAG RUUUSHK";
    default HideMode = EConversationCameraHideMode::HideListener;
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Topic_Speak);    

    default PitchAdjustTarget = EConversationCameraFocusTarget::None;

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 0.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.0, 8.f);
    default CameraFoVCurve.AddValueAt(0.0, 90.000000);
    default CameraFocalLengthCurve.AddValueAt(0.0, 60.000000);

    default PositionCurve.AddVectorAt(0.0f, FVector(159638.109375f, -184220.359375f, 253.964249f));
    default RotationCurve.AddVectorAt(0.0f, FVector(5.014483f, -62.244221f, 0.657621f));

    
   
     
    default AnimSequenceName = n"CameraBreathCLOSE";
    default CameraModifiers.Add(UDirectionInputModifier::StaticClass());

    
    default CameraFocusPointOffset = 0.f; 
  

       

    //WHITELIST________________________________________________________________________________________________
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Wide_VarragRuushk::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;
     
        

    default LightingParameters = LightingPresets::CloseShot();

    default LightingParameters.KeyLightParam.LightPos.AddVectorAt(0.f, FVector(30.072744f, -117.338387f, 106.839622f));
    default LightingParameters.KeyLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-70.746941f, 101.096382f, 0.f));
    default LightingParameters.KeyLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyLightParam.SourceHeight = 128.f;
    default LightingParameters.KeyLightParam.AttenuationRadius = 220.f;
    
    default LightingParameters.RimLightParam.LightPos.AddVectorAt(0.f, FVector(-50.723396f, 121.361267f, 63.488483f));
    default LightingParameters.RimLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-50.927406f, -85.840706f, 0.f));
    default LightingParameters.RimLightParam.SourceWidth = 128.f;
    default LightingParameters.RimLightParam.SourceHeight = 128.f;
    default LightingParameters.RimLightParam.AttenuationRadius = 180.f;

}


//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________


class UConversationPreset_Wide_VarragRuushk : UConversationCameraPresetWorldSpace
{
    default PresetName = n"WIDE VARRAG RUUUSHK";
    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::None;
    default FocusMode = EConversationCameraFocusMode::Speaker;

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_TopicChoice);
    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_SubChoice);

    default PitchAdjustTarget = EConversationCameraFocusTarget::Speaker;

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 100.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.0, 1.8f);
    default CameraFoVCurve.AddValueAt(0.0, 90.000000);
    default CameraFocalLengthCurve.AddValueAt(0.0, 32.000000);

    default PositionCurve.AddVectorAt(0.0f, FVector(158421.59375f, -183431.796875f, 262.030518f));
    default RotationCurve.AddVectorAt(0.0f, FVector(0.0f, -57.716595f, 0.0f));

    default AnimSequenceName = n"CameraBreathWIDE"; 

         



    //WHITELIST________________________________________________________________________________________________
    
        

   

     default LightingParameters = LightingPresets::CloseShot();

    default LightingParameters.KeyLightParam.LightPos.AddVectorAt(0.f, FVector(-34.314175f, -166.404495f, 77.663094f));
    default LightingParameters.KeyLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-34.70937f, 67.878105f, -0.0f));
    default LightingParameters.KeyLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyLightParam.SourceHeight = 128.f;
    default LightingParameters.KeyLightParam.AttenuationRadius = 240.f;


    default LightingParameters.RimLightParam.LightPos.AddVectorAt(0.f, FVector(-64.898094f, 163.305573f, 74.204155f));
    default LightingParameters.RimLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-39.781803f, -85.833664f, 0.f));
    default LightingParameters.RimLightParam.SourceWidth = 128.f;
    default LightingParameters.RimLightParam.SourceHeight = 128.f;
    default LightingParameters.RimLightParam.AttenuationRadius = 260.f;

    default LightingParameters.KeyReverseLightParam.LightPos.AddVectorAt(0.f, FVector(149.040436f, 113.341812f, 76.860558f));
    default LightingParameters.KeyReverseLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-41.693241f, -151.58696f, -0.0f));
    default LightingParameters.KeyReverseLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyReverseLightParam.SourceHeight = 128.f;
    default LightingParameters.KeyReverseLightParam.AttenuationRadius = 240.f;

    default LightingParameters.RimReverseLightParam.LightPos.AddVectorAt(0.f, FVector(35.822956f, -187.513748f, 90.153114f));
    default LightingParameters.RimReverseLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-40.218197f, 85.471069f, 0.f));
    default LightingParameters.RimReverseLightParam.SourceWidth = 128.f;
    default LightingParameters.RimReverseLightParam.SourceHeight = 128.f;
    default LightingParameters.RimReverseLightParam.AttenuationRadius = 280.f;
}




//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________


//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________

class UConversationPreset_Individual_CU_VarragUnhilqt : UConversationCameraPresetWorldSpace
{
    default PresetName = n"INDIVIDUAL CU VARRAG UNHILQT";
    default HideMode = EConversationCameraHideMode::HideListener;
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Topic_Speak);    

    default PitchAdjustTarget = EConversationCameraFocusTarget::None;

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 0.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.0, 7.f);
    default CameraFoVCurve.AddValueAt(0.0, 90.000000);
    default CameraFocalLengthCurve.AddValueAt(0.0, 90.000000);

    default PositionCurve.AddVectorAt(0.0f, FVector(165290.59375f, -164897.78125f, 773.109741f));
    default RotationCurve.AddVectorAt(0.0f, FVector(9.266858f, -1.117276f, 3.504676f));

       
     
    default AnimSequenceName = n"CameraBreathCLOSE";
    default CameraModifiers.Add(UDirectionInputModifier::StaticClass());

    
    default CameraFocusPointOffset = 0.f; 
  

       

    //WHITELIST________________________________________________________________________________________________
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Wide_VarragUnhilqt::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;
  

        

    default LightingParameters = LightingPresets::CloseShot();

    default LightingParameters.KeyLightParam.LightPos.AddVectorAt(0.f, FVector(30.072744f, -117.338387f, 106.839622f));
    default LightingParameters.KeyLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-70.746941f, 101.096382f, 0.f));
    default LightingParameters.KeyLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyLightParam.SourceHeight = 128.f;
    default LightingParameters.KeyLightParam.AttenuationRadius = 220.f;
    
    default LightingParameters.RimLightParam.LightPos.AddVectorAt(0.f, FVector(-50.723396f, 121.361267f, 63.488483f));
    default LightingParameters.RimLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-50.927406f, -85.840706f, 0.f));
    default LightingParameters.RimLightParam.SourceWidth = 128.f;
    default LightingParameters.RimLightParam.SourceHeight = 128.f;
    default LightingParameters.RimLightParam.AttenuationRadius = 180.f;


}

//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________


class UConversationPreset_Individual_Medium_VarragUnhilqt : UConversationCameraPresetWorldSpace
{
    default PresetName = n"INDIVIDUAL MEDIUM VARRAG UNHILQT";
    default HideMode = EConversationCameraHideMode::HideListener;
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Topic_Speak);    

    default PitchAdjustTarget = EConversationCameraFocusTarget::None;

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 0.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.0, 8.f);
    default CameraFoVCurve.AddValueAt(0.0, 90.000000);
    default CameraFocalLengthCurve.AddValueAt(0.0, 60.000000);

     default PositionCurve.AddVectorAt(0.0f, FVector(165243.640625f, -164806.65625f, 779.211487f));
    default RotationCurve.AddVectorAt(0.0f, FVector(4.789558f, -13.034806f, 4.252575f));
    
   
     
    default AnimSequenceName = n"CameraBreathCLOSE";
    default CameraModifiers.Add(UDirectionInputModifier::StaticClass());

    
    default CameraFocusPointOffset = 0.f; 
  

       

    //WHITELIST________________________________________________________________________________________________
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Wide_VarragUnhilqt::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;
     
        

    default LightingParameters = LightingPresets::CloseShot();

    default LightingParameters.KeyLightParam.LightPos.AddVectorAt(0.f, FVector(30.072744f, -117.338387f, 106.839622f));
    default LightingParameters.KeyLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-70.746941f, 101.096382f, 0.f));
    default LightingParameters.KeyLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyLightParam.SourceHeight = 128.f;
    default LightingParameters.KeyLightParam.AttenuationRadius = 220.f;
    
    default LightingParameters.RimLightParam.LightPos.AddVectorAt(0.f, FVector(-50.723396f, 121.361267f, 63.488483f));
    default LightingParameters.RimLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-50.927406f, -85.840706f, 0.f));
    default LightingParameters.RimLightParam.SourceWidth = 128.f;
    default LightingParameters.RimLightParam.SourceHeight = 128.f;
    default LightingParameters.RimLightParam.AttenuationRadius = 180.f;

}


//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________


class UConversationPreset_Wide_VarragUnhilqt : UConversationCameraPresetWorldSpace
{
    default PresetName = n"WIDE VARRAG UNHILQT";
    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::None;
    default FocusMode = EConversationCameraFocusMode::Speaker;

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_TopicChoice);
    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_SubChoice);

    default PitchAdjustTarget = EConversationCameraFocusTarget::Speaker;

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 100.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.0, 1.8f);
    default CameraFoVCurve.AddValueAt(0.0, 90.000000);
    default CameraFocalLengthCurve.AddValueAt(0.0, 32.000000);

    default PositionCurve.AddVectorAt(0.0f, FVector(164342.75f, -165131.53125f, 765.398071f));
    default RotationCurve.AddVectorAt(0.0f, FVector(0.0f, -1.569917f, 0.0f));

    default AnimSequenceName = n"CameraBreathWIDE"; 

         



    //WHITELIST________________________________________________________________________________________________
    
        

   

     default LightingParameters = LightingPresets::CloseShot();

    default LightingParameters.KeyLightParam.LightPos.AddVectorAt(0.f, FVector(-34.314175f, -166.404495f, 77.663094f));
    default LightingParameters.KeyLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-34.70937f, 67.878105f, -0.0f));
    default LightingParameters.KeyLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyLightParam.SourceHeight = 128.f;
    default LightingParameters.KeyLightParam.AttenuationRadius = 240.f;


    default LightingParameters.RimLightParam.LightPos.AddVectorAt(0.f, FVector(-64.898094f, 163.305573f, 74.204155f));
    default LightingParameters.RimLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-39.781803f, -85.833664f, 0.f));
    default LightingParameters.RimLightParam.SourceWidth = 128.f;
    default LightingParameters.RimLightParam.SourceHeight = 128.f;
    default LightingParameters.RimLightParam.AttenuationRadius = 260.f;

    default LightingParameters.KeyReverseLightParam.LightPos.AddVectorAt(0.f, FVector(149.040436f, 113.341812f, 76.860558f));
    default LightingParameters.KeyReverseLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-41.693241f, -151.58696f, -0.0f));
    default LightingParameters.KeyReverseLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyReverseLightParam.SourceHeight = 128.f;
    default LightingParameters.KeyReverseLightParam.AttenuationRadius = 240.f;

    default LightingParameters.RimReverseLightParam.LightPos.AddVectorAt(0.f, FVector(35.822956f, -187.513748f, 90.153114f));
    default LightingParameters.RimReverseLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-40.218197f, 85.471069f, 0.f));
    default LightingParameters.RimReverseLightParam.SourceWidth = 128.f;
    default LightingParameters.RimReverseLightParam.SourceHeight = 128.f;
    default LightingParameters.RimReverseLightParam.AttenuationRadius = 280.f;
}




//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________
/// ANGAR - KALOM - ORC GRAVEYARD 
//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________


class UConversationPreset_Angar_Kalom_OrcGraveyard_WIDE : UConversationCameraPresetWorldSpace
{
    default PresetName = n"ANGAR KALOM ORCGRAVEYARD WIDE";
    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::None;
    default FocusMode = EConversationCameraFocusMode::Speaker;

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Topic_Speak);
    
    

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 0.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.0, 1.8f);
    default CameraFoVCurve.AddValueAt(0.0, 90.000000);
    default CameraFocalLengthCurve.AddValueAt(0.0, 21.000000);

    default PositionCurve.AddVectorAt(0.0f, FVector(50358.652344f, -107020.953125f, -8144.270996f));
    default RotationCurve.AddVectorAt(0.0f, FVector(-5.881258f, 83.323616f, 0.073279f));

    default AnimSequenceName = n"CameraBreathWIDE"; 

         



    //WHITELIST________________________________________________________________________________________________
           

   
    default LightingParameters = LightingPresets::WideShot();

    
}

class UConversationPreset_Angar_Kalom_OrcGraveyard_WIDE_2 : UConversationCameraPresetWorldSpace
{
    default PresetName = n"ANGAR KALOM ORCGRAVEYARD WIDE 2";
    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::None;
    default FocusMode = EConversationCameraFocusMode::Speaker;

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Topic_Speak);
    

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 0.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.0, 1.8f);
    default CameraFoVCurve.AddValueAt(0.0, 90.000000);
    default CameraFocalLengthCurve.AddValueAt(0.0, 32.000000);

    default PositionCurve.AddVectorAt(0.0f, FVector(50245.820312f, -106499.476562f, -8190.070312f));
    default RotationCurve.AddVectorAt(0.0f, FVector(0.88394f, 23.835861f, 0.233557f));

    default AnimSequenceName = n"CameraBreathWIDE"; 

         



    //WHITELIST________________________________________________________________________________________________
           

   
    default LightingParameters = LightingPresets::WideShot();

    
}


class UConversationPreset_Angar_Kalom_OrcGraveyard_WIDE_3 : UConversationCameraPresetWorldSpace
{
    default PresetName = n"ANGAR KALOM ORCGRAVEYARD WIDE 3";
    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::None;
    default FocusMode = EConversationCameraFocusMode::Speaker;

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Topic_Speak);
    

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 0.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.0, 3.8f);
    default CameraFoVCurve.AddValueAt(0.0, 90.000000);
    default CameraFocalLengthCurve.AddValueAt(0.0, 32.000000);

    default PositionCurve.AddVectorAt(0.0f, FVector(50720.527344f, -106133.085938f, -8083.623535f));
    default RotationCurve.AddVectorAt(0.0f, FVector(-9.938459f, -125.476738f, -0.660643f));

    default AnimSequenceName = n"CameraBreathWIDE"; 

         



    //WHITELIST________________________________________________________________________________________________
           

   
    default LightingParameters = LightingPresets::WideShot();

    
}


//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________
/// ORCS - TEMPLE ENTRANCE - URNAZKGROG - TOCHURNAGG
//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________


class UConversationPreset_Orc_Temple_Entrance_UrnazkrogNH : UConversationCameraPresetWorldSpace
{
    default PresetName = n"Orc Temple Entrance UrnazkrogNH";
    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::None;
    default FocusMode = EConversationCameraFocusMode::Speaker;

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Topic_Speak);
    
    

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 0.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.0, 8.f);
    default CameraFoVCurve.AddValueAt(0.0, 90.000000);
    default CameraFocalLengthCurve.AddValueAt(0.0, 65.000000);

    default PositionCurve.AddVectorAt(0.0f, FVector(156435.5f, -146657.75f, -275.54361f));
    default RotationCurve.AddVectorAt(0.0f, FVector(-4.592165f, -73.820595f, -0.488455f));

    default AnimSequenceName = n"CameraBreathWIDE"; 

         



    //WHITELIST________________________________________________________________________________________________
           

   
    default LightingParameters = LightingPresets::CloseShot();

    
}

class UConversationPreset_Orc_Temple_Entrance_NHUrnazkrog : UConversationCameraPresetWorldSpace
{
    default PresetName = n"Orc Temple Entrance NHUrnazkrog";
    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::None;
    default FocusMode = EConversationCameraFocusMode::Speaker;

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Topic_Speak);
    
    

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 0.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.0, 8.f);
    default CameraFoVCurve.AddValueAt(0.0, 90.000000);
    default CameraFocalLengthCurve.AddValueAt(0.0, 55.000000);

    default PositionCurve.AddVectorAt(0.0f, FVector(156391.234375f, -147376.046875f, -273.599518f));
    default RotationCurve.AddVectorAt(0.0f, FVector(-2.692413f, 63.895142f, -0.0f));

    default AnimSequenceName = n"CameraBreathWIDE"; 

         



    //WHITELIST________________________________________________________________________________________________
           

   
    default LightingParameters = LightingPresets::CloseShot();

    
}

class UConversationPreset_Orc_Temple_Entrance_ToChurnaggCU : UConversationCameraPresetWorldSpace
{
    default PresetName = n"Orc Temple Entrance ToChurnaggCU";
    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::None;
    default FocusMode = EConversationCameraFocusMode::Speaker;

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Topic_Speak);
    
    

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 0.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.0, 12.f);
    default CameraFoVCurve.AddValueAt(0.0, 90.000000);
    default CameraFocalLengthCurve.AddValueAt(0.0, 80.000000);

    default PositionCurve.AddVectorAt(0.0f, FVector(156246.890625f, -147085.546875f, -295.398132f));
    default RotationCurve.AddVectorAt(0.0f, FVector(-3.050057f, 84.867714f, -0.958093f));

    default AnimSequenceName = n"CameraBreathCLOSE"; 

         



    //WHITELIST________________________________________________________________________________________________
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Orc_Temple_Entrance_TC::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;
           

   
    default LightingParameters = LightingPresets::CloseShot();

    
}

class UConversationPreset_Orc_Temple_Entrance_NHCU : UConversationCameraPresetWorldSpace
{
    default PresetName = n"Orc Temple Entrance NHCU";
    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::None;
    default FocusMode = EConversationCameraFocusMode::Speaker;

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Topic_Speak);
    
    

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 0.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.0, 12.f);
    default CameraFoVCurve.AddValueAt(0.0, 90.000000);
    default CameraFocalLengthCurve.AddValueAt(0.0, 80.000000);

     default PositionCurve.AddVectorAt(0.0f, FVector(156362.53125f, -146994.75f, -305.827118f));
    default RotationCurve.AddVectorAt(0.0f, FVector(5.095694f, -49.652237f, 2.238927f));

    default AnimSequenceName = n"CameraBreathCLOSE"; 

         



    //WHITELIST________________________________________________________________________________________________
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Orc_Temple_Entrance_TC::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;
           

   
    default LightingParameters = LightingPresets::CloseShot();

    
}

class UConversationPreset_Orc_Temple_Entrance_UrnazkrogCU : UConversationCameraPresetWorldSpace
{
    default PresetName = n"Orc Temple Entrance UrnazkrogCU";
    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::None;
    default FocusMode = EConversationCameraFocusMode::Speaker;

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Topic_Speak);
    
    

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 0.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.0, 12.f);
    default CameraFoVCurve.AddValueAt(0.0, 90.000000);
    default CameraFocalLengthCurve.AddValueAt(0.0, 80.000000);

    default PositionCurve.AddVectorAt(0.0f, FVector(156297.53125f, -147282.609375f, -287.8479f));
    default RotationCurve.AddVectorAt(0.0f, FVector(-3.919574f, 52.560276f, 0.804953f));

    default AnimSequenceName = n"CameraBreathCLOSE"; 

         



    //WHITELIST________________________________________________________________________________________________
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Orc_Temple_Entrance_TC::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;
           

   
    default LightingParameters = LightingPresets::CloseShot();

    
}


class UConversationPreset_Orc_Temple_Entrance_TC : UConversationCameraPresetWorldSpace
{
    default PresetName = n"Orc Temple Entrance TC";
    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::None;
    default FocusMode = EConversationCameraFocusMode::Speaker;

    default AssociatedTags.AddTag(GameplayTag::Event_Conversation_TopicChoice);
    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_SubChoice);
    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Topic_Speak);    
    

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 0.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.0, 2.f);
    default CameraFoVCurve.AddValueAt(0.0, 90.000000);
    default CameraFocalLengthCurve.AddValueAt(0.0, 32.000000);

    default PositionCurve.AddVectorAt(0.0f, FVector(156317.03125f, -147527.765625f, -305.205719f));
    default RotationCurve.AddVectorAt(0.0f, FVector(-2.645918f, 74.566208f, -0.498378f));

    default AnimSequenceName = n"CameraBreathWIDE"; 

         



    //WHITELIST________________________________________________________________________________________________
           

   
    default LightingParameters = LightingPresets::WideShot();

    
}

class UConversationPreset_Orc_Temple_Entrance_Wide : UConversationCameraPresetWorldSpace
{
    default PresetName = n"Orc Temple Entrance Wide";
    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::None;
    default FocusMode = EConversationCameraFocusMode::Speaker;

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Topic_Speak);    
    

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 0.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.0, 2.f);
    default CameraFoVCurve.AddValueAt(0.0, 90.000000);
    default CameraFocalLengthCurve.AddValueAt(0.0, 32.000000);

    default PositionCurve.AddVectorAt(0.0f, FVector(155872.21875f, -147498.40625f, -307.580292f));
    default RotationCurve.AddVectorAt(0.0f, FVector(0.427971f, 47.159054f, 1.714726f));

    default AnimSequenceName = n"CameraBreathWIDE"; 

         



    //WHITELIST________________________________________________________________________________________________
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_Orc_Temple_Entrance_TC::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;

   
    default LightingParameters = LightingPresets::WideShot();

    
}


//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________

class UConversationPreset_Baal_Tyon_Vision : UConversationCameraPresetWorldSpace
{
    default PresetName = n"Baal Tyon Vision";
    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::None;
    default FocusMode = EConversationCameraFocusMode::Speaker;

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Topic_Speak);    
    

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 0.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 1.0f;
    default CropSettings.AspectRatio = 1.777778f;
    default FilmbackPresetName = "35mm VistaVision"; 

    default CameraApertureCurve.AddValueAt(0.0, 2.f);
    default CameraFoVCurve.AddValueAt(0.0, 90.000000);
    default CameraFocalLengthCurve.AddValueAt(0.0, 32.000000);

    default PositionCurve.AddVectorAt(0.0f, FVector(46013.765625f, -112472.953125f, -8604.410156f));
    default RotationCurve.AddVectorAt(0.0f, FVector(-14.849299f, 113.409073f, 0.0f));


    default AnimSequenceName = n"CameraBreathWIDE"; 

         



    //WHITELIST________________________________________________________________________________________________
           

   
    default LightingParameters = LightingPresets::WideShot();

    
}


//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________

class UConversationPreset_Jan_Fight_BirdEye : UConversationCameraPresetWorldSpace
{
    default PresetName = n"Jan Fight BirdEye";
    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::None;
    default FocusMode = EConversationCameraFocusMode::Speaker;

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Topic_Speak);    
    

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 0.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 1.0f;
    default CropSettings.AspectRatio = 1.777778f;
    default FilmbackPresetName = "35mm VistaVision"; 

    default CameraApertureCurve.AddValueAt(0.0, 2.f);
    default CameraFoVCurve.AddValueAt(0.0, 90.000000);
    default CameraFocalLengthCurve.AddValueAt(0.0, 20.000000);

    default PositionCurve.AddVectorAt(0.0f, FVector(156378.1875f, -102906.984375f, -3210.348877f));
    default RotationCurve.AddVectorAt(0.0f, FVector(-28.491007f, 163.764023f, 0.140302f));


    default AnimSequenceName = n"CameraBreathWIDE"; 

         



    //WHITELIST________________________________________________________________________________________________
           

   
    default LightingParameters = LightingPresets::WideShot();

    
}

//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________

class UConversationPreset_Lester_ShowFocus : UConversationCameraPresetWorldSpace
{
    default PresetName = n"Lester Show Focus";
    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::None;
    default FocusMode = EConversationCameraFocusMode::Speaker;

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Topic_Speak);    
    

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 0.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 1.0f;
    default CropSettings.AspectRatio = 1.777778f;
    default FilmbackPresetName = "35mm VistaVision"; 

    default CameraApertureCurve.AddValueAt(0.0, 30.f);
    default CameraFoVCurve.AddValueAt(0.0, 90.000000);
    default CameraFocalLengthCurve.AddValueAt(0.0, 45.000000);

       default PositionCurve.AddVectorAt(0.0f, FVector(86517.054688f, -146365.578125f, 6969.158691f));
    default RotationCurve.AddVectorAt(0.0f, FVector(-3.973962f, 157.112885f, 0.371287f));


    default AnimSequenceName = n"CameraBreathWIDE"; 

         



    //WHITELIST________________________________________________________________________________________________
           

   
    default LightingParameters = LightingPresets::WideShot();

    
}


//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________



///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////DUPLICATED SHOTS FOR DUPLICATED URIZIEL ////////////////////////////////////////////////////////////////////////////////////////
//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________



class UConversationPreset_Individual_Medium_Uriziel : UConversationCameraHeightAdjustSpeaker
{
    default PresetName = n"INDIVIDUAL MEDIUM URIZIEL";
    default HideMode = EConversationCameraHideMode::DontModify;
    default LoopMode = EConversationCameraLoopMode::Repeat;
    default FocusMode = EConversationCameraFocusMode::Speaker;

    default PitchAdjustTarget = EConversationCameraFocusTarget::None;

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Topic_Speak);
    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Topic_Start);

    default AssociatedTags.AddTag(GameplayTag::Action_GiveItem);

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 0.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.0, 11.f);
    default CameraFoVCurve.AddValueAt(0.0, 90.000000);
    default CameraFocalLengthCurve.AddValueAt(0.0, 65.000000);         
    
    
    default AdjustedPositionOffsetCurve.AddVectorAt(0.0f, FVector(188.007904f, -110.923256f, -13.013909f));
    default AdjustedRotationCurve.AddRotatorAt(0.0f, FRotator(1.806072f, -213.91066f, 0.033507f));   
    

    // Values to control the pitch towards Listener
    default MinPitchToListener = -35.0f;
    default MaxPitchToListener = 35.0f;
    default PitchToListenerMultiplier = 0.8f;

    
     
    default AnimSequenceName = n"CameraBreathCLOSE";
    default CameraModifiers.Add(UDirectionInputModifier::StaticClass());

    
    default CameraFocusPointOffset = 0.0f;

    default ForbiddenTagsSpeakerAndListener.AddTag(GameplayTag::Species_Orc);
    default ForbiddenTagsSpeakerAndListener.AddTag(GameplayTag::Species_Creature_Demon);


    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE
      

    

    

   
    

    default LightingParameters = LightingPresets::CloseShot();

    


}
//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________   

class UConversationPreset_TwoShot_Flat_Uriziel : UConversationCameraPresetCenterOffset
{
    default PresetName = n"TWO SHOT FLAT URIZIEL";
    default HideMode = EConversationCameraHideMode::DontModify;
    default LoopMode = EConversationCameraLoopMode::None;
    default FocusMode = EConversationCameraFocusMode::Speaker;

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Topic_Speak);

    default PitchAdjustTarget = EConversationCameraFocusTarget::Middle;

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;
    default bNeverUseForReverseShot = true;

    default InitialChoiceWeight = 0.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.f, 3.5f);
    default CameraFoVCurve.AddValueAt(0.f, 90.f);
    default CameraFocalLengthCurve.AddValueAt(0.f, 25.f);
    
    default CenterPositionCurve.AddVectorAt(0.f, FVector(15.403484f, -173.172302f, -18.887245f));
    default CenterRotationCurve.AddRotatorAt(0.f, FRotator(0.f, -265.351501f, 0.f));

    default AnimSequenceName = n"CameraBreathWIDE";
    default CameraModifiers.Add(UDirectionInputModifier::StaticClass());

    default MaxHeightDifference = 40.0f;

    default MinDistance = 33.0f; 
    default MaxDistance = 143.0f; 

    default ForbiddenTagsSpeakerAndListener.AddTag(GameplayTag::Species_Creature_Demon);
   

    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE
    
   default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_TwoShot_CowboyTC_Uriziel::StaticClass();
    default PossibleTransitions.Last().Weight = 100.0f;



    

    default LightingParameters = LightingPresets::CloseShot();

    default LightingParameters.KeyLightParam.LightPos.AddVectorAt(0.f, FVector(56.831142f, -157.492325f, 74.333717f));
    default LightingParameters.KeyLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-49.302364f, 96.974464f, 1.348915f));
    default LightingParameters.KeyLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyLightParam.SourceHeight = 128.f;
    default LightingParameters.KeyLightParam.AttenuationRadius = 350.f;

    default LightingParameters.RimLightParam.LightPos.AddVectorAt(0.f, FVector(-20.494322f, 184.975418f, 40.464062f));
    default LightingParameters.RimLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-40.599983f, -90.936783f, 0.0f));
    default LightingParameters.RimLightParam.SourceWidth = 100.f;
    default LightingParameters.RimLightParam.SourceHeight = 100.f;
    default LightingParameters.RimLightParam.AttenuationRadius = 300.f;

    default LightingParameters.KeyReverseLightParam.LightPos.AddVectorAt(0.f, FVector(102.256836f, 175.313599f, 71.941345f));
    default LightingParameters.KeyReverseLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-49.081566f, -108.808128f, 2.872869f));
    default LightingParameters.KeyReverseLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyReverseLightParam.SourceHeight = 128.f;
    default LightingParameters.KeyReverseLightParam.AttenuationRadius = 320.f;

    default LightingParameters.RimReverseLightParam.LightPos.AddVectorAt(0.f, FVector(-101.270424f, -171.74437f, 39.618412f));
    default LightingParameters.RimReverseLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-39.400017f, 91.884262f, 0.0f));
    default LightingParameters.RimReverseLightParam.SourceWidth = 128.f;
    default LightingParameters.RimReverseLightParam.SourceHeight = 128.f;
    default LightingParameters.RimReverseLightParam.AttenuationRadius = 300.f;
}


//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________


class UConversationPreset_TwoShot_CowboyTC_Uriziel : UConversationCameraPresetListenerOffset
{
    default PresetName = n"TWO SHOT COWBOY TC URIZIEL";
    default HideMode = EConversationCameraHideMode::DontModify;
    default LoopMode = EConversationCameraLoopMode::None;
    default FocusMode = EConversationCameraFocusMode::Speaker;
    
   
    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_SubChoice);
     default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_TopicChoice_Start);
    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_TopicChoice);

   default PitchAdjustTarget = EConversationCameraFocusTarget::Speaker;

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 1.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.f, 5.f);
    default CameraFoVCurve.AddValueAt(0.f, 90.f);
    default CameraFocalLengthCurve.AddValueAt(0.f, 50.f);
    
    default ListenerPositionOffsetCurve.AddVectorAt(0.f, FVector(-158.58667f, 190.899582f, -50.320389f));
    default ListenerRotationOffsetCurve.AddRotatorAt(0.f, FRotator(4.346519f, -41.677063f, 0.f));

    default AnimSequenceName = n"CameraBreathWIDE";
    
    default MaxHeightDifference = 110.0f;

    default MinDistance = 38.0f; 
    default MaxDistance = 220.0f;   

    default ForbiddenCharacterTagsSpeaker.AddTag(GameplayTag::Species_Creature_Demon);      


    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE

    //SPEAK
    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_Medium_Orc::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUp_Orc_NH::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHigh::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHigh_Orc::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHigh_Orc_NH::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHighExtra::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_MediumHighExtra_Orc::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;

    default PossibleTransitions.Add(FPresetTransitionEntry());
    default PossibleTransitions.Last().PossibleNextPresetClass = UConversationPreset_OverTheShoulder_CloseUpHighExtra_Orc_NH::StaticClass();    
    default PossibleTransitions.Last().Weight = 100.0f;
    


    
  ///default close entero diagonal//////

     default LightingParameters = LightingPresets::CloseShot();

    default LightingParameters.KeyLightParam.LightPos.AddVectorAt(0.0f, FVector(-13.216854f, -175.818542f, 87.633041f));
    default LightingParameters.KeyLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-48.218857f, 85.199112f, 4.153944f));
    default LightingParameters.KeyLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyLightParam.SourceHeight = 128.f;
    default LightingParameters.KeyLightParam.AttenuationRadius = 450.f;

    default LightingParameters.RimLightParam.LightPos.AddVectorAt(0.0f, FVector(-62.477619f, 208.868301f, 28.132442f));
    default LightingParameters.RimLightParam.LightRotOffset.AddRotatorAt(0.0f, FRotator(-51.765873f, -110.229309f, 0.0f));
    default LightingParameters.RimLightParam.SourceWidth = 250.f;
    default LightingParameters.RimLightParam.SourceHeight = 128.f;
    default LightingParameters.RimLightParam.AttenuationRadius = 350.f;

    default LightingParameters.KeyReverseLightParam.LightPos.AddVectorAt(0.f, FVector(83.26001f, 170.242966f, 103.36821f));
    default LightingParameters.KeyReverseLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-70.353355f, -95.68882f, 0.0f));     
    default LightingParameters.KeyReverseLightParam.SourceWidth = 250.f;
    default LightingParameters.KeyReverseLightParam.SourceHeight = 128.f;
    default LightingParameters.KeyReverseLightParam.AttenuationRadius = 300.f;            

    default LightingParameters.RimReverseLightParam.LightPos.AddVectorAt(0.f, FVector(-5.333393f, -189.08049f, 23.821426f));
    default LightingParameters.RimReverseLightParam.LightRotOffset.AddRotatorAt(0.f, FRotator(-22.700504f, 82.536758f, 0.0f));
    default LightingParameters.RimReverseLightParam.SourceWidth = 128.f;
    default LightingParameters.RimReverseLightParam.SourceHeight = 128.f;
    default LightingParameters.RimReverseLightParam.AttenuationRadius = 300.f;
}


class UConversationPreset_OverTheShoulder_Cowboy_Uriziel : UConversationCameraPresetListenerOffset
{
    default PresetName = n"OVER THE SHOULDER COWBOY URIZIEL";
    default HideMode = EConversationCameraHideMode::DontModify;
    default LoopMode = EConversationCameraLoopMode::None;
    default FocusMode = EConversationCameraFocusMode::Speaker;
    

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_TopicChoice_Start);
    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_TopicChoice);

   
    default PitchAdjustTarget = EConversationCameraFocusTarget::Speaker;

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;

    default InitialChoiceWeight = 0.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.0, 10.f);
    default CameraFoVCurve.AddValueAt(0.0, 90.f);
    default CameraFocalLengthCurve.AddValueAt(0.0, 60.f);

    default ListenerPositionOffsetCurve.AddVectorAt(0.f, FVector(-173.391434f, 121.005562f, -14.70159f));
    default ListenerRotationOffsetCurve.AddRotatorAt(0.f, FRotator(-0.876037f, -28.987162f, 0.f));

    default AnimSequenceName = n"CameraBreathWIDE";

    
    default CameraFocusPointOffset = 0.0f;

    default MaxHeightDifference = 40.0f;       
    
    default MinDistance = 43.0f; 
    default MaxDistance = 220.0f;     

    default ForbiddenTagsSpeakerAndListener.AddTag(GameplayTag::Species_Orc);
    default ForbiddenCharacterTagsSpeaker.AddTag(GameplayTag::Species_Creature_Demon);


    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE
    

    

    

    default LightingParameters = LightingPresets::CloseShot();

    
}
//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________

class UConversationPreset_TwoShot_Wide_Uriziel : UConversationCameraPresetCenterOffset
{
    default PresetName = n"TWO SHOT WIDE URIZIEL";

    default HideMode = EConversationCameraHideMode::DontModify;
    default LoopMode = EConversationCameraLoopMode::None;
    default FocusMode = EConversationCameraFocusMode::Speaker;

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Topic_Speak);

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;
    default bNeverUseForReverseShot = true;

    default InitialChoiceWeight = 0.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.f, 2.3f);
    default CameraFoVCurve.AddValueAt(0.f, 50.f);
    default CameraFocalLengthCurve.AddValueAt(0.f, 35.f);

    default CenterPositionCurve.AddVectorAt(0.f, FVector(88.365089f, -591.054749f, -74.756317f));
    default CenterRotationCurve.AddRotatorAt(0.f, FRotator(2.147805f, -262.399811f, 0.128112f));

    default AnimSequenceName = n"CameraBreathWIDE";
    default CameraModifiers.Add(UDirectionInputModifier::StaticClass());

    default MaxHeightDifference = 150.0f;     
    
    default MinDistance = 38.0f; 
    default MaxDistance = 485.0f;  

    default ForbiddenCharacterTagsSpeaker.AddTag(GameplayTag::Species_Creature_Demon);


    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE
     

   


//// Default Wide /////  


    default LightingParameters = LightingPresets::WideShot();

    
}

//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________


class UConversationPreset_Gomez_InExtremo_Wide : UConversationCameraPresetWorldSpace
{
    default PresetName = n"GOMEZ IN EXTREMO WIDE";

    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::None;
    default FocusMode = EConversationCameraFocusMode::Speaker;

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Topic_Speak);

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;
    default bNeverUseForReverseShot = true;

    default InitialChoiceWeight = 0.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 1.0f;
    default FilmbackPresetName = "35mm VistaVision";
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.f, 2.3f);
    default CameraFoVCurve.AddValueAt(0.f, 50.f);
    default CameraFocalLengthCurve.AddValueAt(0.f, 40.f);

    default PositionCurve.AddVectorAt(0.0f, FVector(118929.734375f, -101297.578125f, -4129.658691f));
    default RotationCurve.AddVectorAt(0.0f, FVector(-8.338178f, -176.374435f, -1.361327f));

    default AnimSequenceName = n"CameraBreathWIDE";
    default CameraModifiers.Add(UDirectionInputModifier::StaticClass());      
     

    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE
     

   

//// Default Wide /////  


    default LightingParameters = LightingPresets::WideShot();

    default LightingParameters.SpeakerLightingChannels.bChannel0 = true;
    default LightingParameters.SpeakerLightingChannels.bChannel1 = false;
    default LightingParameters.SpeakerLightingChannels.bChannel2 = false;
    default LightingParameters.ListenerLightingChannels.bChannel0 = true;
    default LightingParameters.ListenerLightingChannels.bChannel1 = false;
    default LightingParameters.ListenerLightingChannels.bChannel2 = false;
    default LightingParameters.AdditionalParticipantLightingChannels.bChannel0 = true;
    default LightingParameters.AdditionalParticipantLightingChannels.bChannel1 = false;
    default LightingParameters.AdditionalParticipantLightingChannels.bChannel2 = false;

    
}


//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________

class UConversationPreset_Gomez_InExtremo_Close : UConversationCameraPresetWorldSpace
{
    default PresetName = n"GOMEZ IN EXTREMO CLOSE";

    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::None;
    default FocusMode = EConversationCameraFocusMode::Speaker;

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Topic_Speak);

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;
    default bNeverUseForReverseShot = true;

    default InitialChoiceWeight = 0.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 1.0f;
    default FilmbackPresetName = "35mm VistaVision";
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.f, 2.3f);
    default CameraFoVCurve.AddValueAt(0.f, 50.f);
    default CameraFocalLengthCurve.AddValueAt(0.f, 50.f);

     default PositionCurve.AddVectorAt(0.0f, FVector(118406.585938f, -101559.648438f, -4329.813965f));
    default RotationCurve.AddVectorAt(0.0f, FVector(-0.985931f, 167.453445f, -1.099221f));

    default AnimSequenceName = n"CameraBreathWIDE";
    default CameraModifiers.Add(UDirectionInputModifier::StaticClass());      
     

    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE
     

   

//// Default Wide /////  


    default LightingParameters = LightingPresets::WideShot();

    default LightingParameters.SpeakerLightingChannels.bChannel0 = true;
    default LightingParameters.SpeakerLightingChannels.bChannel1 = false;
    default LightingParameters.SpeakerLightingChannels.bChannel2 = false;
    default LightingParameters.ListenerLightingChannels.bChannel0 = true;
    default LightingParameters.ListenerLightingChannels.bChannel1 = false;
    default LightingParameters.ListenerLightingChannels.bChannel2 = false;
    default LightingParameters.AdditionalParticipantLightingChannels.bChannel0 = true;
    default LightingParameters.AdditionalParticipantLightingChannels.bChannel1 = false;
    default LightingParameters.AdditionalParticipantLightingChannels.bChannel2 = false;

    
}


//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________

class UConversationPreset_Gomez_InExtremo_Banner : UConversationCameraPresetWorldSpace
{
    default PresetName = n"GOMEZ IN EXTREMO BANNER";

    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::None;
    default FocusMode = EConversationCameraFocusMode::Speaker;

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Topic_Speak);

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;
    default bNeverUseForReverseShot = true;

    default InitialChoiceWeight = 0.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 1.0f;
    default FilmbackPresetName = "35mm VistaVision";
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.f, 2.3f);
    default CameraFoVCurve.AddValueAt(0.f, 50.f);
    default CameraFocalLengthCurve.AddValueAt(0.f, 21.f);

    default PositionCurve.AddVectorAt(0.0f, FVector(118373.234375f, -101132.40625f, -4209.254395f));
    default RotationCurve.AddVectorAt(0.0f, FVector(0.001481f, -159.318146f, 0.0f));

    default AnimSequenceName = n"CameraBreathWIDE";
    default CameraModifiers.Add(UDirectionInputModifier::StaticClass());      
     

    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE
     

   

//// Default Wide /////  


    default LightingParameters = LightingPresets::WideShot();

    default LightingParameters.SpeakerLightingChannels.bChannel0 = true;
    default LightingParameters.SpeakerLightingChannels.bChannel1 = false;
    default LightingParameters.SpeakerLightingChannels.bChannel2 = false;
    default LightingParameters.ListenerLightingChannels.bChannel0 = true;
    default LightingParameters.ListenerLightingChannels.bChannel1 = false;
    default LightingParameters.ListenerLightingChannels.bChannel2 = false;
    default LightingParameters.AdditionalParticipantLightingChannels.bChannel0 = true;
    default LightingParameters.AdditionalParticipantLightingChannels.bChannel1 = false;
    default LightingParameters.AdditionalParticipantLightingChannels.bChannel2 = false;

    
}


//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________

//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________

class UConversationPreset_MCEggs_Wide : UConversationCameraPresetWorldSpace
{
    default PresetName = n"MCEGGS WIDE";

    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::None;
    default FocusMode = EConversationCameraFocusMode::Speaker;

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Topic_Speak);

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;
    default bNeverUseForReverseShot = true;

    default InitialChoiceWeight = 0.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.f, 2.3f);
    default CameraFoVCurve.AddValueAt(0.f, 50.f);
    default CameraFocalLengthCurve.AddValueAt(0.f, 21.f);

   default PositionCurve.AddVectorAt(0.0f, FVector(42675.140625f, -116542.625f, -7688.448242f));
    default RotationCurve.AddVectorAt(0.0f, FVector(-1.139869f, -114.361732f, 0.07697f));

    default AnimSequenceName = n"CameraBreathWIDE";
    default CameraModifiers.Add(UDirectionInputModifier::StaticClass());      
     

    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE
     

   

//// Default Wide /////  


    default LightingParameters = LightingPresets::WideShot();

    
}


class UConversationPreset_MCEggs_OTS : UConversationCameraPresetWorldSpace
{
    default PresetName = n"MCEGGS OTS";

    default HideMode = EConversationCameraHideMode::HideListenerWeapon;
    default LoopMode = EConversationCameraLoopMode::None;
    default FocusMode = EConversationCameraFocusMode::Speaker;

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Topic_Speak);

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;
    default bNeverUseForReverseShot = true;

    default InitialChoiceWeight = 0.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 1.0f;
    default FilmbackPresetName = "35mm VistaVision";
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.f, 15.f);
    default CameraFoVCurve.AddValueAt(0.f, 50.f);
    default CameraFocalLengthCurve.AddValueAt(0.f, 70.f);

      default PositionCurve.AddVectorAt(0.0f, FVector(42392.703125f, -116725.632812f, -7649.682617f));
    default RotationCurve.AddVectorAt(0.0f, FVector(-1.567158f, -27.514629f, 0.0f));

    default AnimSequenceName = n"CameraBreathCLOSE";
    default CameraModifiers.Add(UDirectionInputModifier::StaticClass());      
     

    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE
     

   

//// Default Wide /////  


    default LightingParameters = LightingPresets::WideShot();

    
}


//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________

//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________

//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________

//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________

class UConversationPreset_OG_Lukor_Mural : UConversationCameraPresetWorldSpace
{
    default PresetName = n"OG LUKOR MURAL";

    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::None;
    default FocusMode = EConversationCameraFocusMode::Speaker;

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Topic_Speak);

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;
    default bNeverUseForReverseShot = true;

    default InitialChoiceWeight = 0.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.f, 20.3f);
    default CameraFoVCurve.AddValueAt(0.f, 50.f);
    default CameraFocalLengthCurve.AddValueAt(0.f, 32.f);

    default PositionCurve.AddVectorAt(0.0f, FVector(85041.898438f, -136635.359375f, -3622.0354f));
    default RotationCurve.AddVectorAt(0.0f, FVector(5.24707f, 12.334414f, 0.0f));

    default AnimSequenceName = n"CameraBreathWIDE";
    default CameraModifiers.Add(UDirectionInputModifier::StaticClass());      
     

    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE
     

   

//// Default Wide /////  


    default LightingParameters = LightingPresets::WideShot();

    
}


//______________________________________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________________________________

class UConversationPreset_OG_Lukor_Mural2 : UConversationCameraPresetWorldSpace
{
    default PresetName = n"OG LUKOR MURAL2";

    default HideMode = EConversationCameraHideMode::None;
    default LoopMode = EConversationCameraLoopMode::None;
    default FocusMode = EConversationCameraFocusMode::Speaker;

    default AssociatedTags.AddTag(GameplayTag::Conversation_Preset_Topic_Speak);

    default bAlwaysValid = false;
    default bStaticActorTransforms = false;
    default bNeverUseForReverseShot = true;

    default InitialChoiceWeight = 0.0f;
    default TransitionTime = 0.0f;

    default SqueezeFactor = 2.0f;
    default CropSettings.AspectRatio = 1.777778f;

    default CameraApertureCurve.AddValueAt(0.f, 20.3f);
    default CameraFoVCurve.AddValueAt(0.f, 50.f);
    default CameraFocalLengthCurve.AddValueAt(0.f, 32.f);

     default PositionCurve.AddVectorAt(0.0f, FVector(84713.09375f, -136457.359375f, -3692.557129f));
    default RotationCurve.AddVectorAt(0.0f, FVector(12.604986f, 112.233025f, 0.0f));

    default AnimSequenceName = n"CameraBreathWIDE";
    default CameraModifiers.Add(UDirectionInputModifier::StaticClass());      
     

    //WHITELIST________________________________________________________________________________________________
    //TOPICCHOICE
     

   

//// Default Wide /////  


    default LightingParameters = LightingPresets::WideShot();

    
}


/////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////

// class UConversationPreset_HeightAdjustExample : UConversationCameraHeightAdjustSpeaker
// {
//     default PresetName = n"HeightAdjustExample";
//     default HideMode = EConversationCameraHideMode::None;
//     default FocusMode = EConversationCameraFocusMode::Speaker;

//     // Don't use pitch adjustment for this preset, doesn't make sence
//     default PitchAdjustTarget = EConversationCameraFocusTarget::None;

//     default bAlwaysValid = false;
  
//     default bStaticActorTransforms = false;
//

//     default InitialChoiceWeight = 100.0f;
//     default TransitionTime = 0.0f;

//     default SqueezeFactor = 2.0f;
//     default CropSettings.AspectRatio = 1.777778f;

//     default CameraApertureCurve.AddValueAt(0.0, 8.000000);
//     default CameraFoVCurve.AddValueAt(0.0, 90.000000);
//     default CameraFocalLengthCurve.AddValueAt(0.0, 55.000000);

        
//     default AdjustedPositionOffsetCurve.AddVectorAt(0.0f, FVector(149.701263f, -100.704414f, 51.521351f));
//     default AdjustedRotationCurve.AddRotatorAt(0.0f, FRotator(-20.000006f, 140.411743f, 0.0f));

//     // Values to control the pitch towards Listener
//     default MinPitchToListener = -35.0f;
//     default MaxPitchToListener = 35.0f;
//     default PitchToListenerMultiplier = 1.0f;
  

//     default AnimSequenceName = n"CameraBreathCLOSE";
//     default CameraModifiers.Add(UDirectionInputModifier::StaticClass());

// //     default CameraFocusBone = "face_C_noseTip";
//     default CameraFocusPointOffset = -7.0f;

//     default LightingParameters = LightingPresets::CloseShot();
// }