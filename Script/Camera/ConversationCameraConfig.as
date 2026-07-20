class AConversationCameraConfigured : AConversationCameraPresetChoice
{
    // --------------------------------
    //  CAMERA PRESETS
    // --------------------------------

   //------------------------------- VARIABLES

    /** Minimum time a voiceline has to be for causing a preset change */
   default MinSpeakTime = 1.0f;

    /** Amount of validity tests happening for animated Presets */
   default DefaultTestAmount = 8;

    /**
	 * If speaker or listener move further away from their initial position than this value
	 * lerp towards actual position
	 */
   default ActorPositionThreshold = 300.0f;

    /** Speed of lerp, see above */
   default ActorLerpSpeed = 20.0f;

     /** Time the same character has to speak until monolog state is reached */
   default MonologTimeThreshold = 6.0f;

   /** Size of the Sweep Test sphere to determine if the desired view is obscured */
   default ObstructionSweepTestSize = 15.0f;


   /** Distance To Camera in which materials will be completely invisible */
   default AlphaFadePercentage = 80.0f;

   /** Radius of the viewing area when camera is obstructed */
   default AlphaFadeRadius = 0.9f;

   /** Extends of a Box around the camera that hides non participating character inside */
   default HideCharacterAroundCameraExtent = FVector(45, 45, 20);


	/** 
    * If true this will show debug lines for the side choice sweep cast at the start of conversation 
    * If the sweep cast was blocked the line will appear red, otherwise green
    * Keep in mind, the Sweep cast is thicker than the debug line
    */ 
   default bDebugShowSideChoiceTest = false;


   //------------------------------- BOOLEANS

    /**
	 * If true HandleSpeakEvent will set a new Preset every time it's called
	 * If false HandleSpeakEvent will only set a new Preset if the Speaker changed since the last Preset
	 **/
   default bNewPresetOnSameSpeaker = false;

    /** Default side */
   default bUseRightSide = true;



   //------------------------------- ACTIONS

   /** Priority Event Tags */
   default PriorityEventSubscriptions.AddTag(GameplayTag::Action_Trading);
   default PriorityEventSubscriptions.AddTag(GameplayTag::Action_CustomizeArmor);
   default PriorityEventSubscriptions.AddTag(GameplayTag::UI_ArmorCustom_Shoes);
   default PriorityEventSubscriptions.AddTag(GameplayTag::UI_ArmorCustom_Belt);
   default PriorityEventSubscriptions.AddTag(GameplayTag::UI_ArmorCustom_Top);
   default PriorityEventSubscriptions.AddTag(GameplayTag::Action_GiveItem);
   default PriorityEventSubscriptions.AddTag(GameplayTag::Action_Conversation_LukorPray);
   default PriorityEventSubscriptions.AddTag(GameplayTag::Action_Ambient_SmokeWeed);



   //------------------------------- POST PROCESSING

   // default PostProcessSettings.bOverride_LocalExposureShadowContrastScale = false;
   // default PostProcessSettings.LocalExposureShadowContrastScale = 0.5f;

   // default PostProcessSettings.bOverride_LocalExposureHighlightContrastScale = false;
   // default PostProcessSettings.LocalExposureHighlightContrastScale = 0.35f;



   //------------------------------- PATHS AND CLASSES



   // --------------------------------
   //  LIGHTING
   // --------------------------------

   // Enabling Modifiers and Functionalities
   default LightingAdjuster.bEnableDaytimeIntensityLerp = false;

   default LightingAdjuster.bEnableLocationModifier = true;
   default LightingAdjuster.bEnableDaytimeModifier = true;  
   default LightingAdjuster.bEnableWeatherModifier = true;
   default LightingAdjuster.bEnableFogModifier = true;
   default LightingAdjuster.bEnableShotModifier = true;
   default LightingAdjuster.bEnableShadowModifier = true;
   default LightingAdjuster.bEnableExternalLightModifier = true;
   default LightingAdjuster.bEnableSkinToneModifier = true;
   default LightingAdjuster.bEnableParticipantNumberModifier = true;
   default LightingAdjuster.bEnableSceneBrightnessModifier = true;
   default LightingAdjuster.bEnableSceneUniqueAreaModifer = true;

   default bForceAlwaysOutside = false;
   default bForceAlwaysInside = false; 

   // Inside/Outside Detection config

   default IndoorDetectionConfig.SweepTraceSphereRadius = 10.0f;
   default IndoorDetectionConfig.NumSamples = 1000;
   default IndoorDetectionConfig.CollisionChannel = ECollisionChannel::ECC_Visibility;
   default IndoorDetectionConfig.TraceRadius = 5500.0f;
   default IndoorDetectionConfig.ConeFullAngleDegrees = 160.0f;

   default IndoorDetectionConfig.ScoreWeight_Indoor_EnclosedByWalls = 1.0f;
   default IndoorDetectionConfig.ScoreWeight_Indoor_HasRoof = 2.0f;
   default IndoorDetectionConfig.ScoreWeight_Outdoor_NoWalls = 32.0f;
   default IndoorDetectionConfig.ScoreWeight_Outdoor_VisibleSky = 32.0f;


   
   // Value used to have a rough estimation on how much the final KeyLight Intensity changed after applying Modifiers
   default LightingAdjuster.RoughKeyLightReferenceIntensity = 1.0f;

   // Base Eye Intensity without modifiers
   default LightingAdjuster.EyeIntensityBaseValue = 0.8f;

   // default LightingAdjuster.bDebugUpdateLightOnTick = true;


   default AdditionalLightMaterials.FindOrAdd(n"FlickerMaterial") = n"/Script/Engine.MaterialInstanceConstant'/Game/Assets/VFX/LightFunctions/MI_Fire_LF.MI_Fire_LF'";

   default CameraAnimSequences.FindOrAdd(n"CameraBreathCLOSE") = n"/Script/TemplateSequence.CameraAnimationSequence'/Game/Conversation/CameraBreath/CAS_CamShake_DialoguesCLOSE.CAS_CamShake_DialoguesCLOSE'";
   default CameraAnimSequences.FindOrAdd(n"CameraBreathWIDE") = n"/Script/TemplateSequence.CameraAnimationSequence'/Game/Conversation/CameraBreath/CAS_CamShake_DialoguesWIDE.CAS_CamShake_DialoguesWIDE'";

   default CinematicParameterCollection = n"/Script/Engine.MaterialParameterCollection'/Game/Materials/ParameterCollections/MPC_Gothic_Global_Parameters.MPC_Gothic_Global_Parameters'";
}



UCLASS(Abstract)
class ULightingModifierConditional : ULightingModifier
{
   bool bForceInShadow = false;
   bool bForceOutsideShadow = false;

   // class to inherit from
   // PLEASE DON'T TOUCH AFTER THIS LINE, thank you


   /** Ultra Dynamic Sky */
   default SkyMaterialParameterCollectionAsset = n"/Script/Engine.MaterialParameterCollection'/Game/Materials/ParameterCollections/MPC_Gothic_Global_Parameters.MPC_Gothic_Global_Parameters'";

   TOptional<FClockTime> ForDaytimeStart;
   TOptional<FClockTime> ForDaytimeEnd;
   TOptional<bool> bBeInside; // Inside if true, Outside if false
   TOptional<bool> bUseCloseShot; // Close if true, Wide if false
   TOptional<EWeather> ForWeather;

   TOptional<float> MinFogLevel; // Fog values go from 1 to 10
   TOptional<float> MaxFogLevel;

   TOptional<int32> ForSkinType;

   TOptional<float> ForExternalLightMin;
   TOptional<float> ForExternalLightMax;

   TOptional<FLinearColor> ForExternalLightColor;
   TOptional<FLinearColor> ForExternalLightColorThreshold;

   TOptional<bool> bBeInShadow;

   TOptional<bool> bSpeakerExklusive;
   TOptional<bool> bListenerExklusive;

   TOptional<float> ForSceneBrightnessMin;
   TOptional<float> ForSceneBrightnessMax;

   TOptional<int32> MinParticipantNumber;
   TOptional<int32> MaxParticipantNumber;

   // This participant must have ALL these tags for the modifier to apply
   FGameplayTagContainer RequiredOnThisParticipantTags;

   // This Participant must have NONE of these tags for the modifier to apply
   FGameplayTagContainer ForbiddenOnThisParticipantTags;

   // All given Tags have to be on at leats 1 Participant
   FGameplayTagContainer RequiredOnAnyParticipantTags;

   // None of the given Tags can be on any Participant
   FGameplayTagContainer ForbiddenOnAnyParticipantTags;

   TArray<FString> ForFirstConversationTopicName;



   UFUNCTION(BlueprintOverride)
   bool IsApplicable(AGothicCharacter Participant, TArray<AGothicCharacter> AllParticipants) const
   {
      // Note: Check Order roughly based on runtime

      // Speaker Exklusive
      if (bSpeakerExklusive.IsSet())
      {
         if (!ParticipantIsSpeaker(Participant))
         {
            return false;
         }
      }

      // Listener Exklusive
      if (bListenerExklusive.IsSet())
      {
         if(!ParticipantIsListener(Participant))
         {
            return false;
         }
      }
      

      // Skin Tone
      if (ForSkinType.IsSet() && ForSkinType.Value != GetParticipantSkinTone(Participant))
         return false;
   
      // Daytime
      if (ForDaytimeStart.IsSet() && ForDaytimeEnd.IsSet() && !GetCurrentSkyTime().IsBetween(ForDaytimeStart.Value, ForDaytimeEnd.Value))
         return false;

      // Wheather
      if (ForWeather.IsSet() && ForWeather.Value != GameWeather.PlayerWeather)
         return false;     

      // Fog
      if (ForWeather.IsSet() && ForWeather.Value != GameWeather.PlayerWeather)
         return false;     
      

      if (MinFogLevel.IsSet() && GameWeather.CurrentWeatherSettings.Fog < MinFogLevel.Value)
      {
         return false;   
      }

      if (MaxFogLevel.IsSet() && GameWeather.CurrentWeatherSettings.Fog > MaxFogLevel.Value)
      {
         return false;        
      }

      // First Conversation Topic Name
      if (!ForFirstConversationTopicName.IsEmpty())
      {
         if (!ForFirstConversationTopicName.Contains(GetFirstConversationTopicName()))
         {
            return false;
         }
      }

      // Participant Amount
      if (MinParticipantNumber.IsSet() && GetParticipantAmount() < MinParticipantNumber.Value)
      {
         return false;   
      }

      if (MaxParticipantNumber.IsSet() && GetParticipantAmount() > MaxParticipantNumber.Value)
      {
         return false;        
      }

      // Shot Mode
      if (bUseCloseShot.IsSet())
      {
         EConversationCameraShotMode ShotMode = EConversationCameraShotMode::CloseShot;
 
         if (GetCameraShotMode(ShotMode) && bUseCloseShot.Value != (ShotMode == EConversationCameraShotMode::CloseShot))     
         {
            return false;          
         }
      }

      if (!RequiredOnThisParticipantTags.IsEmpty())
      {
         for(FGameplayTag Tag : RequiredOnThisParticipantTags.GameplayTags)
         {
            if(!Participant.HasGameplayTag(Tag))
            {
               return false;
            }
         }
      }

      if (!ForbiddenOnThisParticipantTags.IsEmpty())
      {
         for(FGameplayTag Tag : ForbiddenOnThisParticipantTags.GameplayTags)
         {
            if(Participant.HasGameplayTag(Tag))
            {
               return false;
            }
         }
      }

      if (!RequiredOnAnyParticipantTags.IsEmpty())
      {
         for(FGameplayTag Tag : RequiredOnAnyParticipantTags.GameplayTags)
         {
            bool bTagWasOnAnyCharacter = false;
            for(auto Part : AllParticipants)
            {
               if(Part.HasGameplayTag(Tag))
               {
                  bTagWasOnAnyCharacter = true;
               }
            }

            if (!bTagWasOnAnyCharacter)
            {
               return false;
            }
         }
      }

      if (!ForbiddenOnAnyParticipantTags.IsEmpty())
      {
         for(FGameplayTag Tag : ForbiddenOnAnyParticipantTags.GameplayTags)
         {
            for(auto Part : AllParticipants)
            {
               if(Part.HasGameplayTag(Tag))
               {
                  return false;
               }
            }
         }
      }

      // Location
      if (bBeInside.IsSet() && bBeInside.Value != IsParticipantInside(Participant) )
         return false;

      // Shadow
      if (bBeInShadow.IsSet())
      {       
         bool bParticipantIsInShadow;

         // Forced Options
         if (bForceInShadow)
         {
            bParticipantIsInShadow = true;
         }
         else if (bForceOutsideShadow)
         {
            bParticipantIsInShadow = false;
         }

         // Actual Check
         bParticipantIsInShadow = ParticipantIsInShadow(Participant);

         if(bBeInShadow.Value != bParticipantIsInShadow)
         {
            return false; 
         }
      }

      // External Lighting
      if (ForExternalLightMin.IsSet())
      {
         float CurrentLightingScore = GetLightingScore(Participant);

         if(ForExternalLightMax.IsSet())
         {
            // Condition with max value

            if(CurrentLightingScore <= ForExternalLightMin.Value || CurrentLightingScore > ForExternalLightMax.Value)
               return false;
         }
         else
         {
            // Condition without max value
            if(CurrentLightingScore <= ForExternalLightMin.Value)
               return false;
         }
      }
      else if(ForExternalLightMax.IsSet())
      {
         // Condition with only max value
         float CurrentLightingScore = GetLightingScore(Participant);

         if(CurrentLightingScore > ForExternalLightMax.Value)
            return false;
      }

      // External Lighting Color    
      if (ForExternalLightColor.IsSet() && ForExternalLightColorThreshold.IsSet())
      {
         FLinearColor CurrentLightColor = GetExternalLightingColor(Participant);
         FLinearColor ColorDifference = GetColorDifferenceScore(CurrentLightColor, ForExternalLightColor.Value);

         if(ColorDifference.R > ForExternalLightColorThreshold.Value.R ||
         ColorDifference.G > ForExternalLightColorThreshold.Value.G ||
         ColorDifference.B > ForExternalLightColorThreshold.Value.B)
            return false;
      }

      // Scene Brightness
      if (ForSceneBrightnessMin.IsSet())
      {
         float CurrentSceneBrightness = GetEnvironmentLightingScore(Participant);

         if(ForSceneBrightnessMax.IsSet())
         {
            // Condition with max value

            if(CurrentSceneBrightness <= ForSceneBrightnessMin.Value || CurrentSceneBrightness > ForSceneBrightnessMax.Value)
               return false;
         }
         else
            {
            // Condition without max value
               if(CurrentSceneBrightness <= ForSceneBrightnessMin.Value)
               return false;
            }
         }
         else if(ForSceneBrightnessMax.IsSet())
         {
            // Condition with only max value
            float CurrentSceneBrightness = GetEnvironmentLightingScore(Participant);

            if(CurrentSceneBrightness > ForSceneBrightnessMax.Value)
               return false;
      }
      


      // Passed all Checks!
      return true;
   }

   UFUNCTION(BlueprintOverride)
   FClockTime GetDayTimeStart() const 
   {
      if(ForDaytimeStart.IsSet())
      {
         return ForDaytimeStart.Value;
      }
      else
      {
         return FClockTime();
      }
   }

   UFUNCTION(BlueprintOverride)
   FClockTime GetDayTimeEnd() const
   {
      if(ForDaytimeEnd.IsSet())
      {
         return ForDaytimeEnd.Value;
      }
      else
      {
         return FClockTime();
      }
   }
}


// DAYTIME
//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------------------------------------------



UCLASS()
class ULightingModifierDawn_Close: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Daytime;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(5,30));
   default ForDaytimeEnd.Set(FClockTime(5,49));
   default bUseCloseShot.Set(true);

   // Modifier Values
   default KeyLight.IntensityReplace = 0.02f;
   default RimLight.IntensityReplace =  0.015f;
   default KeyReverseLight.IntensityReplace = 0.015f;
   default RimReverseLight.IntensityReplace = 0.015f;

   default KeyLight.ColorReplace = FVector(0.35f, 0.21f, 0.39f);
   default RimLight.ColorReplace = FVector(0.20f, 0.18f, 0.34f);
   default KeyReverseLight.ColorReplace = FVector(0.35f, 0.21f, 0.39f);
   default RimReverseLight.ColorReplace = FVector(0.20f, 0.18f, 0.34f);

   default DiffuseColorBoost = 1.0f;

   default EyeIntensityFinetuneFactor = 50.f;
  
}

UCLASS()
class ULightingModifierDawn_Wide: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Daytime;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(5,30));
   default ForDaytimeEnd.Set(FClockTime(5,49));
   default bUseCloseShot.Set(false);

   // Modifier Values
   default KeyLight.IntensityReplace = 0.03f;
   default RimLight.IntensityReplace =  0.05f;
   default KeyReverseLight.IntensityReplace = 0.02f;
   default RimReverseLight.IntensityReplace = 0.05f;

   default KeyLight.ColorReplace = FVector(0.35f, 0.21f, 0.39f);
   default RimLight.ColorReplace = FVector(0.20f, 0.18f, 0.34f);
   default KeyReverseLight.ColorReplace = FVector(0.35f, 0.21f, 0.39f);
   default RimReverseLight.ColorReplace = FVector(0.20f, 0.18f, 0.34f);
   
   default DiffuseColorBoost = 1.5f;

   default EyeIntensityFinetuneFactor = 50.f;
  

}
//___________________________________________________________________________________________


UCLASS()
class ULightingModifierMagicHour_Close: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Daytime;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(5,49));
   default ForDaytimeEnd.Set(FClockTime(6,20));
   default bUseCloseShot.Set(true);

   // Modifier Values
   default KeyLight.IntensityReplace = 0.04f;
   default RimLight.IntensityReplace =  0.012f;
   default KeyReverseLight.IntensityReplace = 0.03f;
   default RimReverseLight.IntensityReplace = 0.012f;

   default KeyLight.ColorReplace = FVector(0.57f, 0.35f, 0.47f);
   default RimLight.ColorReplace = FVector(0.33f, 0.34f, 0.30f);
   default KeyReverseLight.ColorReplace = FVector(0.57f, 0.35f, 0.47f);
   default RimReverseLight.ColorReplace = FVector(0.33f, 0.34f, 0.30f);
   
   default DiffuseColorBoost = 1.0f;

   default EyeIntensityFinetuneFactor = 25.f;
  
}

UCLASS()
class ULightingModifierMagicHour_Wide: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Daytime;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(5,49));
   default ForDaytimeEnd.Set(FClockTime(6,20));
   default bUseCloseShot.Set(false);

   // Modifier Values
   default KeyLight.IntensityReplace = 0.05f;
   default RimLight.IntensityReplace =  0.1f;
   default KeyReverseLight.IntensityReplace = 0.045f;
   default RimReverseLight.IntensityReplace = 0.1f;

   default KeyLight.ColorReplace = FVector(0.57f, 0.35f, 0.47f);
   default RimLight.ColorReplace = FVector(0.33f, 0.34f, 0.30f);
   default KeyReverseLight.ColorReplace = FVector(0.57f, 0.35f, 0.47f);
   default RimReverseLight.ColorReplace = FVector(0.33f, 0.34f, 0.30f);
   
   default DiffuseColorBoost = 1.5f;

   default EyeIntensityFinetuneFactor = 25.f;
  

   
}
//______________________________________________________________________________________


// UCLASS()
// class ULightingModifierSunriseShadow_Close: ULightingModifierConditional
// {
//    default ModifierType = ELightingModifierType::Daytime;

//    // Conditions
//    default ForDaytimeStart.Set(FClockTime(6,27));
//    default ForDaytimeEnd.Set(FClockTime(7,00));
//    default bUseCloseShot.Set(true);

//    // Modifier Values
//    default KeyLight.IntensityReplace = 0.1f;
//    default RimLight.IntensityReplace = 0.09f;
//    default KeyReverseLight.IntensityReplace = 0.09f;
//    default RimReverseLight.IntensityReplace =  0.08f;

//    default KeyLight.ColorReplace = FVector(0.81f, 0.61f, 0.51f);
//    default RimLight.ColorReplace = FVector(0.40f, 0.32f, 0.49f);
//    default KeyReverseLight.ColorReplace = FVector(0.81f, 0.61f, 0.51f);
//    default RimReverseLight.ColorReplace = FVector(0.40f, 0.32f, 0.49f);
   
//    default DiffuseColorBoost = 1.0f;
 
//    default EyeIntensityFinetuneFactor = 5.5f;
// }

// class ULightingModifierSunriseShadow_Wide: ULightingModifierConditional
// {
//    default ModifierType = ELightingModifierType::Daytime;

//    // Conditions
//    default ForDaytimeStart.Set(FClockTime(6,27));
//    default ForDaytimeEnd.Set(FClockTime(7,00));
//    default bUseCloseShot.Set(false);

//    // Modifier Values
//    default KeyLight.IntensityReplace = 0.2f;
//    default RimLight.IntensityReplace =  0.9f;
//    default KeyReverseLight.IntensityReplace = 0.15f;
//    default RimReverseLight.IntensityReplace = 0.8f;

//    default KeyLight.ColorReplace = FVector(0.81f, 0.61f, 0.51f);
//    default RimLight.ColorReplace = FVector(0.40f, 0.32f, 0.49f);
//    default KeyReverseLight.ColorReplace = FVector(0.81f, 0.61f, 0.51f);
//    default RimReverseLight.ColorReplace = FVector(0.40f, 0.32f, 0.49f);
   
//    default DiffuseColorBoost = 1.0f;

//    default EyeIntensityFinetuneFactor = 5.5f;
 
// }
// //______________________________________________________________________________________

UCLASS()
class ULightingModifierSunrise_Close: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Daytime;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(6,20));
   default ForDaytimeEnd.Set(FClockTime(7,31));
   default bUseCloseShot.Set(true);

   // Modifier Values
   default KeyLight.IntensityReplace = 1.0f;
   default RimLight.IntensityReplace = 0.8f;
   default KeyReverseLight.IntensityReplace = 0.7f;
   default RimReverseLight.IntensityReplace =  0.8f;

   default KeyLight.ColorReplace = FVector(1.0f, 0.65f, 0.45f);
   default RimLight.ColorReplace = FVector(0.43f, 0.36f, 0.54f);
   default KeyReverseLight.ColorReplace = FVector(1.0f, 0.65f, 0.45f);
   default RimReverseLight.ColorReplace = FVector(0.43f, 0.36f, 0.54f);
   
   default DiffuseColorBoost = 1.0f;

   default EyeIntensityFinetuneFactor = 4.f;
 
}

class ULightingModifierSunrise_Wide: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Daytime;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(6,20));
   default ForDaytimeEnd.Set(FClockTime(7,31));
   default bUseCloseShot.Set(false);

   // Modifier Values
   default KeyLight.IntensityReplace = 2.f;
   default RimLight.IntensityReplace =  3.f;
   default KeyReverseLight.IntensityReplace = 2.f;
   default RimReverseLight.IntensityReplace = 3.f;

   default KeyLight.ColorReplace = FVector(1.0f, 0.65f, 0.45f);
   default RimLight.ColorReplace = FVector(0.43f, 0.36f, 0.54f);
   default KeyReverseLight.ColorReplace = FVector(1.0f, 0.65f, 0.45f);
   default RimReverseLight.ColorReplace = FVector(0.43f, 0.36f, 0.54f);
   
   default DiffuseColorBoost = 1.5f;

   default EyeIntensityFinetuneFactor = 4.f;
  
}
//______________________________________________________________________________________


UCLASS()
class ULightingModifierMorning_Close: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Daytime;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(7,31));
   default ForDaytimeEnd.Set(FClockTime(9,06));
   default bUseCloseShot.Set(true);

   // Modifier Values
   default KeyLight.IntensityReplace = 0.9f;
   default RimLight.IntensityReplace = 0.4f;
   default KeyReverseLight.IntensityReplace = 0.7f;
   default RimReverseLight.IntensityReplace = 0.4f;

   default KeyLight.ColorReplace = FVector(1.0f, 0.79f, 0.65f);
   default RimLight.ColorReplace = FVector(0.89f, 0.68f, 0.88f);
   default KeyReverseLight.ColorReplace = FVector(1.0f, 0.79f, 0.65f);
   default RimReverseLight.ColorReplace = FVector(0.89f, 0.68f, 0.88f);
   
   default DiffuseColorBoost = 1.0f;

   default EyeIntensityFinetuneFactor = 3.f;

   
 
}

class ULightingModifierMorning_Wide: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Daytime;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(7,31));
   default ForDaytimeEnd.Set(FClockTime(9,06));
   default bUseCloseShot.Set(false);

   // Modifier Values
   default KeyLight.IntensityReplace = 1.7f;
   default RimLight.IntensityReplace =  1.5f;
   default KeyReverseLight.IntensityReplace = 1.5f;
   default RimReverseLight.IntensityReplace = 1.7f;

   default KeyLight.ColorReplace = FVector(1.0f, 0.79f, 0.65f);
   default RimLight.ColorReplace = FVector(0.89f, 0.68f, 0.88f);
   default KeyReverseLight.ColorReplace = FVector(1.0f, 0.79f, 0.65f);
   default RimReverseLight.ColorReplace = FVector(0.89f, 0.68f, 0.88f);
   
   default DiffuseColorBoost = 1.5f;

   default EyeIntensityFinetuneFactor = 3.f;

   

   
 
}
//______________________________________________________________________________________


UCLASS()
class ULightingModifierDay_Close: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Daytime;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(9,06));
   default ForDaytimeEnd.Set(FClockTime(11,30));
   default bUseCloseShot.Set(true);

   // Modifier Values
   default KeyLight.IntensityReplace = 1.2f;
   default RimLight.IntensityReplace = 0.6f;
   default KeyReverseLight.IntensityReplace = 1.f;
   default RimReverseLight.IntensityReplace = 0.6f;

   default KeyLight.ColorReplace = FVector(0.75f, 0.64f, 0.5f);
   default RimLight.ColorReplace = FVector(0.54f, 0.47f, 0.61f);
   default KeyReverseLight.ColorReplace = FVector(0.75f, 0.64f, 0.5f);
   default RimReverseLight.ColorReplace = FVector(0.54f, 0.47f, 0.61f);
   
   default DiffuseColorBoost = 1.2f;

   default EyeIntensityFinetuneFactor = 1.5f;
 
}

class ULightingModifierDay_Wide: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Daytime;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(9,06));
   default ForDaytimeEnd.Set(FClockTime(11,30));
   default bUseCloseShot.Set(false);

   // Modifier Values
   default KeyLight.IntensityReplace = 2.2f;
   default RimLight.IntensityReplace =  2.f;
   default KeyReverseLight.IntensityReplace = 1.9f;
   default RimReverseLight.IntensityReplace = 2.f;
   
   default KeyLight.ColorReplace = FVector(0.75f, 0.64f, 0.5f);
   default RimLight.ColorReplace = FVector(0.54f, 0.47f, 0.61f);
   default KeyReverseLight.ColorReplace = FVector(0.75f, 0.64f, 0.5f);
   default RimReverseLight.ColorReplace = FVector(0.54f, 0.47f, 0.61f);
   
   default DiffuseColorBoost = 1.5f;

   default EyeIntensityFinetuneFactor = 1.5f;
 
}
//______________________________________________________________________________________


UCLASS()
class ULightingModifierNoon_Close: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Daytime;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(11,30));
   default ForDaytimeEnd.Set(FClockTime(14,00));
   default bUseCloseShot.Set(true);

   // Modifier Values
   default KeyLight.IntensityReplace = 1.5f;
   default RimLight.IntensityReplace = 0.7f;
   default KeyReverseLight.IntensityReplace = 1.4f;
   default RimReverseLight.IntensityReplace = 0.7f;

   default KeyLight.ColorReplace = FVector(0.75f, 0.64f, 0.5f);
   default RimLight.ColorReplace = FVector(0.54f, 0.47f, 0.61f);
   default KeyReverseLight.ColorReplace = FVector(0.75f, 0.64f, 0.5f);
   default RimReverseLight.ColorReplace = FVector(0.54f, 0.47f, 0.61f);
   
   default DiffuseColorBoost = 1.2f;

   default EyeIntensityFinetuneFactor = 2.f;
 
}

class ULightingModifierNoon_Wide: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Daytime;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(11,30));
   default ForDaytimeEnd.Set(FClockTime(14,00));
   default bUseCloseShot.Set(false);

   // Modifier Values
   default KeyLight.IntensityReplace = 2.5f;
   default RimLight.IntensityReplace = 3.f;
   default KeyReverseLight.IntensityReplace = 2.f;
   default RimReverseLight.IntensityReplace = 3.f;

   default KeyLight.ColorReplace = FVector(0.75f, 0.64f, 0.5f);
   default RimLight.ColorReplace = FVector(0.54f, 0.47f, 0.61f);
   default KeyReverseLight.ColorReplace = FVector(0.75f, 0.64f, 0.5f);
   default RimReverseLight.ColorReplace = FVector(0.54f, 0.47f, 0.61f);
   
   default DiffuseColorBoost = 2.f;

   default EyeIntensityFinetuneFactor = 2.f;
 
}
//______________________________________________________________________________________


UCLASS()
class ULightingModifierAfternoon_Close: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Daytime;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(14,00));
   default ForDaytimeEnd.Set(FClockTime(17,00));
   default bUseCloseShot.Set(true);

   // Modifier Values
   default KeyLight.IntensityReplace = 1.5f;
   default RimLight.IntensityReplace = 0.7f;
   default KeyReverseLight.IntensityReplace = 1.3f;
   default RimReverseLight.IntensityReplace = 0.7f;

   default KeyLight.ColorReplace = FVector(1.0f, 0.85f, 0.65f);
   default RimLight.ColorReplace = FVector(0.54f, 0.47f, 0.61f);
   default KeyReverseLight.ColorReplace = FVector(1.0f, 0.85f, 0.65f);
   default RimReverseLight.ColorReplace = FVector(0.54f, 0.47f, 0.61f);
   
   default DiffuseColorBoost = 1.2f;

    default EyeIntensityFinetuneFactor = 2.f;
 
}

class ULightingModifierAfternoon_Wide: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Daytime;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(14,00));
   default ForDaytimeEnd.Set(FClockTime(17,00));
   default bUseCloseShot.Set(false);

   // Modifier Values
   default KeyLight.IntensityReplace = 2.2f;
   default RimLight.IntensityReplace =  3.f;
   default KeyReverseLight.IntensityReplace = 1.5f;
   default RimReverseLight.IntensityReplace = 3.f;

   default KeyLight.ColorReplace = FVector(1.0f, 0.85f, 0.65f);
   default RimLight.ColorReplace = FVector(0.54f, 0.47f, 0.61f);
   default KeyReverseLight.ColorReplace = FVector(1.0f, 0.85f, 0.65f);
   default RimReverseLight.ColorReplace = FVector(0.54f, 0.47f, 0.61f);
   
   default DiffuseColorBoost = 2.f;

    default EyeIntensityFinetuneFactor = 2.f;
 
}
//______________________________________________________________________________________


UCLASS()
class ULightingModifierEvening_Close: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Daytime;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(17,00));
   default ForDaytimeEnd.Set(FClockTime(18,31));
   default bUseCloseShot.Set(true);

   // Modifier Values
   default KeyLight.IntensityReplace = 1.f;
   default RimLight.IntensityReplace = 0.6f;
   default KeyReverseLight.IntensityReplace = 0.9f;
   default RimReverseLight.IntensityReplace = 0.6f;

   default KeyLight.ColorReplace = FVector(0.92f, 0.80f, 0.57f);
   default RimLight.ColorReplace = FVector(0.54f, 0.47f, 0.61f);
   default KeyReverseLight.ColorReplace = FVector(0.92f, 0.80f, 0.57f);
   default RimReverseLight.ColorReplace = FVector(0.54f, 0.47f, 0.61f);
   
   default DiffuseColorBoost = 1.0f;

   default EyeIntensityFinetuneFactor = 1.5f;
 
}

class ULightingModifierEvening_Wide: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Daytime;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(17,00));
   default ForDaytimeEnd.Set(FClockTime(18,31));
   default bUseCloseShot.Set(false);

   // Modifier Values
   default KeyLight.IntensityReplace = 2.f;
   default RimLight.IntensityReplace =  2.f;
   default KeyReverseLight.IntensityReplace = 1.8f;
   default RimReverseLight.IntensityReplace = 2.f;

   default KeyLight.ColorReplace = FVector(0.92f, 0.80f, 0.57f);
   default RimLight.ColorReplace = FVector(0.54f, 0.47f, 0.61f);
   default KeyReverseLight.ColorReplace = FVector(0.92f, 0.80f, 0.57f);
   default RimReverseLight.ColorReplace = FVector(0.54f, 0.47f, 0.61f);
   
   default DiffuseColorBoost = 2.f;

   default EyeIntensityFinetuneFactor = 1.5f;
  
}
//______________________________________________________________________________________


UCLASS()
class ULightingModifierSunset_Close: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Daytime;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(18,31));
   default ForDaytimeEnd.Set(FClockTime(19,01));
   default bUseCloseShot.Set(true);

   // Modifier Values
   default KeyLight.IntensityReplace = 1.35f;
   default RimLight.IntensityReplace = 1.f;
   default KeyReverseLight.IntensityReplace = 1.f;
   default RimReverseLight.IntensityReplace = 1.f;

   default KeyLight.ColorReplace = FVector(0.96f, 0.75f, 0.44f);
   default RimLight.ColorReplace = FVector(0.54f, 0.46f, 0.41f);
   default KeyReverseLight.ColorReplace = FVector(0.96f, 0.75f, 0.44f);
   default RimReverseLight.ColorReplace = FVector(0.54f, 0.46f, 0.41f);
   
   default DiffuseColorBoost = 1.0f;

   default EyeIntensityFinetuneFactor = 1.1f;
 
}

class ULightingModifierSunset_Wide: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Daytime;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(18,31));
   default ForDaytimeEnd.Set(FClockTime(19,01));
   default bUseCloseShot.Set(false);

   // Modifier Values
   default KeyLight.IntensityReplace = 3.5f;
   default RimLight.IntensityReplace =  3.f;
   default KeyReverseLight.IntensityReplace = 2.5f;
   default RimReverseLight.IntensityReplace = 3.f;

   default KeyLight.ColorReplace = FVector(0.96f, 0.75f, 0.44f);
   default RimLight.ColorReplace = FVector(0.54f, 0.46f, 0.41f);
   default KeyReverseLight.ColorReplace = FVector(0.96f, 0.75f, 0.44f);
   default RimReverseLight.ColorReplace = FVector(0.54f, 0.46f, 0.41f);
   
   default DiffuseColorBoost = 1.7f;

   default EyeIntensityFinetuneFactor = 1.1f;
 
}
//______________________________________________________________________________________


UCLASS()
class ULightingModifierTwilight_Close: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Daytime;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(19,01));
   default ForDaytimeEnd.Set(FClockTime(19,30));
   default bUseCloseShot.Set(true);

   // Modifier Values
   default KeyLight.IntensityReplace = 1.2f;
   default RimLight.IntensityReplace = 0.8f;
   default KeyReverseLight.IntensityReplace = 0.9f;
   default RimReverseLight.IntensityReplace = 0.8f;

   default KeyLight.ColorReplace = FVector(0.84f, 0.46f, 0.27f);
   default RimLight.ColorReplace = FVector(0.55f, 0.45f, 0.40f);
   default KeyReverseLight.ColorReplace = FVector(0.84f, 0.46f, 0.27f);
   default RimReverseLight.ColorReplace = FVector(0.55f, 0.45f, 0.40f);
   
   default DiffuseColorBoost = 1.0f;

   default EyeIntensityFinetuneFactor = 1.4f;
 
}

class ULightingModifierTwilight_Wide: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Daytime;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(19,01));
   default ForDaytimeEnd.Set(FClockTime(19,30));
   default bUseCloseShot.Set(false);

   // Modifier Values
   default KeyLight.IntensityReplace = 2.f;
   default RimLight.IntensityReplace =  2.f;
   default KeyReverseLight.IntensityReplace = 1.6f;
   default RimReverseLight.IntensityReplace = 2.f;

   default KeyLight.ColorReplace = FVector(0.84f, 0.46f, 0.27f);
   default RimLight.ColorReplace = FVector(0.55f, 0.45f, 0.40f);
   default KeyReverseLight.ColorReplace = FVector(0.84f, 0.46f, 0.27f);
   default RimReverseLight.ColorReplace = FVector(0.55f, 0.45f, 0.40f);
   
   default DiffuseColorBoost = 1.3f;

   default EyeIntensityFinetuneFactor = 1.4f;
 
}
//______________________________________________________________________________________

// UCLASS()
// class ULightingModifierTwilightShadow_Close: ULightingModifierConditional
// {
//    default ModifierType = ELightingModifierType::Daytime;

//    // Conditions
//    default ForDaytimeStart.Set(FClockTime(17,16));
//    default ForDaytimeEnd.Set(FClockTime(17,31));
//    default bUseCloseShot.Set(true);

//    // Modifier Values
//    default KeyLight.IntensityReplace = 0.15f;
//    default RimLight.IntensityReplace = 0.1f;
//    default KeyReverseLight.IntensityReplace = 0.15f;
//    default RimReverseLight.IntensityReplace = 0.1f;

//    default KeyLight.ColorReplace = FVector(0.89f, 0.59f, 0.45f);
//    default RimLight.ColorReplace = FVector(0.40f, 0.30f, 0.54f);
//    default KeyReverseLight.ColorReplace = FVector(0.89f, 0.59f, 0.45f);
//    default RimReverseLight.ColorReplace = FVector(0.40f, 0.30f, 0.54f);
   
//    default DiffuseColorBoost = 1.0f;

//    default EyeIntensityFinetuneFactor = 4.f;
 
// }

// class ULightingModifierTwilightShadow_Wide: ULightingModifierConditional
// {
//    default ModifierType = ELightingModifierType::Daytime;

//    // Conditions
//    default ForDaytimeStart.Set(FClockTime(17,16));
//    default ForDaytimeEnd.Set(FClockTime(17,31));
//    default bUseCloseShot.Set(false);

//    // Modifier Values
//    default KeyLight.IntensityReplace = 0.3f;
//    default RimLight.IntensityReplace =  1.5f;
//    default KeyReverseLight.IntensityReplace = 0.3f;
//    default RimReverseLight.IntensityReplace = 1.5f;

//    default KeyLight.ColorReplace = FVector(0.89f, 0.59f, 0.45f);
//    default RimLight.ColorReplace = FVector(0.40f, 0.30f, 0.54f);
//    default KeyReverseLight.ColorReplace = FVector(0.89f, 0.59f, 0.45f);
//    default RimReverseLight.ColorReplace = FVector(0.40f, 0.30f, 0.54f);
   
//    default DiffuseColorBoost = 1.0f;

//    default EyeIntensityFinetuneFactor = 4.f;
 
// }
// //______________________________________________________________________________________

UCLASS()
class ULightingModifierGoldenHour_Close: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Daytime;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(19,30));
   default ForDaytimeEnd.Set(FClockTime(19,45));
   default bUseCloseShot.Set(true);

   // Modifier Values
   default KeyLight.IntensityReplace = 0.035f;
   default RimLight.IntensityReplace = 0.03f;
   default KeyReverseLight.IntensityReplace = 0.03f;
   default RimReverseLight.IntensityReplace = 0.03f;

   default KeyLight.ColorReplace = FVector(0.88f, 0.68f, 0.6f);
   default RimLight.ColorReplace = FVector(0.18f, 0.14f, 0.3f);
   default KeyReverseLight.ColorReplace = FVector(0.88f, 0.68f, 0.6f);
   default RimReverseLight.ColorReplace = FVector(0.18f, 0.14f, 0.3f);

   default DiffuseColorBoost = 1.0f;

   default EyeIntensityFinetuneFactor = 10.f;
 
}

class ULightingModifierGoldenHour_Wide: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Daytime;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(19,30));
   default ForDaytimeEnd.Set(FClockTime(19,45));
   default bUseCloseShot.Set(false);

   // Modifier Values
   default KeyLight.IntensityReplace = 0.065f;
   default RimLight.IntensityReplace =  0.075f;
   default KeyReverseLight.IntensityReplace = 0.055f;
   default RimReverseLight.IntensityReplace = 0.075f;

   default KeyLight.ColorReplace = FVector(0.88f, 0.68f, 0.6f);
   default RimLight.ColorReplace = FVector(0.18f, 0.14f, 0.3f);
   default KeyReverseLight.ColorReplace = FVector(0.88f, 0.68f, 0.6f);
   default RimReverseLight.ColorReplace = FVector(0.18f, 0.14f, 0.3f);
   
   default DiffuseColorBoost = 1.3f;

   default EyeIntensityFinetuneFactor = 10.f;
 
}
//______________________________________________________________________________________


UCLASS()
class ULightingModifierPreDusk_Close: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Daytime;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(19,45));
   default ForDaytimeEnd.Set(FClockTime(20,03));
   default bUseCloseShot.Set(true);

   // Modifier Values
   default KeyLight.IntensityReplace = 0.04f;
   default RimLight.IntensityReplace = 0.04f;
   default KeyReverseLight.IntensityReplace = 0.035f;
   default RimReverseLight.IntensityReplace = 0.04f;

   default KeyLight.ColorReplace = FVector(0.91f, 0.54f, 0.42f);
   default RimLight.ColorReplace = FVector(0.14f, 0.18f, 0.25f);
   default KeyReverseLight.ColorReplace = FVector(0.91f, 0.54f, 0.42f);
   default RimReverseLight.ColorReplace = FVector(0.14f, 0.18f, 0.25f);

   default DiffuseColorBoost = 1.0f;

   default EyeIntensityFinetuneFactor = 13.f;
 
}

class ULightingModifierPreDusk_Wide: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Daytime;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(19,45));
   default ForDaytimeEnd.Set(FClockTime(20,03));
   default bUseCloseShot.Set(false);

   // Modifier Values
   default KeyLight.IntensityReplace = 0.04f;
   default RimLight.IntensityReplace =  0.1f;
   default KeyReverseLight.IntensityReplace = 0.03f;
   default RimReverseLight.IntensityReplace = 0.1f;

   default KeyLight.ColorReplace = FVector(0.91f, 0.54f, 0.42f);
   default RimLight.ColorReplace = FVector(0.14f, 0.18f, 0.25f);
   default KeyReverseLight.ColorReplace = FVector(0.91f, 0.54f, 0.42f);
   default RimReverseLight.ColorReplace = FVector(0.14f, 0.18f, 0.25f);
   
   default DiffuseColorBoost = 1.0f;

   default EyeIntensityFinetuneFactor = 13.f;
 
}
//______________________________________________________________________________________


UCLASS()
class ULightingModifierDusk_Close: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Daytime;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(20,03));
   default ForDaytimeEnd.Set(FClockTime(20,20));
   default bUseCloseShot.Set(true);

   // Modifier Values
   default KeyLight.IntensityReplace = 0.015f;
   default RimLight.IntensityReplace = 0.015f;
   default KeyReverseLight.IntensityReplace = 0.01f;
   default RimReverseLight.IntensityReplace = 0.015f;

   default KeyLight.ColorReplace = FVector(0.44f, 0.28f, 0.44f);
   default RimLight.ColorReplace = FVector(0.10f, 0.13f, 0.18f);
   default KeyReverseLight.ColorReplace = FVector(0.44f, 0.28f, 0.44f);
   default RimReverseLight.ColorReplace = FVector(0.10f, 0.13f, 0.18f);

   default DiffuseColorBoost = 1.0f;

    default EyeIntensityFinetuneFactor = 50.f;
 
}

class ULightingModifierDusk_Wide: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Daytime;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(20,03));
   default ForDaytimeEnd.Set(FClockTime(20,20));
   default bUseCloseShot.Set(false);

   // Modifier Values
   default KeyLight.IntensityReplace = 0.03f;
   default RimLight.IntensityReplace =  0.1f;
   default KeyReverseLight.IntensityReplace = 0.02f;
   default RimReverseLight.IntensityReplace = 0.1f;

   default KeyLight.ColorReplace = FVector(0.44f, 0.28f, 0.44f);
   default RimLight.ColorReplace = FVector(0.10f, 0.13f, 0.18f);
   default KeyReverseLight.ColorReplace = FVector(0.44f, 0.28f, 0.44f);
   default RimReverseLight.ColorReplace = FVector(0.10f, 0.13f, 0.18f);
   
   default DiffuseColorBoost = 1.5f;

    default EyeIntensityFinetuneFactor = 50.f;
 
}
//______________________________________________________________________________________


UCLASS()
class ULightingModifierNight_Close: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Daytime;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(20,20));
   default ForDaytimeEnd.Set(FClockTime(5,30));
   default bUseCloseShot.Set(true);

   // Modifier Values
   default KeyLight.IntensityReplace =  0.02f;
   default RimLight.IntensityReplace = 0.01f;
   default KeyReverseLight.IntensityReplace =  0.02f;
   default RimReverseLight.IntensityReplace = 0.01f;

   default KeyLight.ColorReplace = FVector(0.06f, 0.16f, 0.54f);
   default RimLight.ColorReplace = FVector(0.14f, 0.16f, 0.14f);
   default KeyReverseLight.ColorReplace = FVector(0.06f, 0.16f, 0.54f);
   default RimReverseLight.ColorReplace = FVector(0.14f, 0.16f, 0.14f);

   default DiffuseColorBoost = 2.0f;

   default EyeIntensityFinetuneFactor = 60.f;
 
}

class ULightingModifierNight_Wide: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Daytime;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(20,20));
   default ForDaytimeEnd.Set(FClockTime(5,30));
   default bUseCloseShot.Set(false);

   // Modifier Values
   default KeyLight.IntensityReplace = 0.03f;
   default RimLight.IntensityReplace =  0.05f;
   default KeyReverseLight.IntensityReplace = 0.02f;
   default RimReverseLight.IntensityReplace = 0.05f;

   default KeyLight.ColorReplace = FVector(0.06f, 0.16f, 0.54f);
   default RimLight.ColorReplace = FVector(0.14f, 0.16f, 0.14f);
   default KeyReverseLight.ColorReplace = FVector(0.06f, 0.16f, 0.54f);
   default RimReverseLight.ColorReplace = FVector(0.14f, 0.16f, 0.14f);
   
   default DiffuseColorBoost = 2.0f;

   default EyeIntensityFinetuneFactor = 50.f;
 
}
//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------------------------------------------


//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------------------------------------------
// LOCATION______________________________________________________________________________________________________________

UCLASS()
class ULightingModifierInside_Close : ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Location;

   // Conditions
   default bBeInside.Set(true);
   default bUseCloseShot.Set(true);

   // Modifier Values
   default KeyLight.IntensityReplace = 0.015f;
   default RimLight.IntensityReplace =  0.008f;
   default KeyReverseLight.IntensityReplace = 0.015f;
   default RimReverseLight.IntensityReplace = 0.008f;

   default KeyLight.ColorReplace = FVector(0.30f,0.37f,0.68f);
   default KeyReverseLight.ColorReplace = FVector(0.27f,0.3f,0.36f);
   default RimLight.ColorReplace = FVector(0.30f,0.37f,0.68f);
   default RimReverseLight.ColorReplace = FVector(0.27f,0.3f,0.36f);

   default EyeIntensityFinetuneFactor = 60.f;
    
}

UCLASS()
class ULightingModifierInside_Wide : ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Location;

   // Conditions
   default bBeInside.Set(true);
   default bUseCloseShot.Set(false);

   // Modifier Values
   default KeyLight.IntensityReplace = 0.011f;
   default RimLight.IntensityReplace =  0.015f;
   default KeyReverseLight.IntensityReplace = 0.011f;
   default RimReverseLight.IntensityReplace = 0.015f;

   default KeyLight.ColorReplace = FVector(0.38f,0.46f,0.85f);
   default KeyReverseLight.ColorReplace = FVector(0.38f,0.46f,0.85f);
   default RimLight.ColorReplace = FVector(0.35f,0.38f,0.47f);
   default RimReverseLight.ColorReplace = FVector(0.35f,0.38f,0.47f);
   
    default EyeIntensityFinetuneFactor = 60.f;
 
}

UCLASS()
class ULightingModifierOutside : ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Location;

   // Conditions
   default bBeInside.Set(false);
}



//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------------------------------------------


//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------------------------------------------
// EXTERNAL LIGHTING_________________________________________________________________________________________________________________________

// Outside External Light

UCLASS()
class ULightingModifierDimLightOutside_Close: ULightingModifierConditional 
{
   default ModifierType = ELightingModifierType::ExternalLightIntensity;

   // Conditions
   default ForExternalLightMin.Set(0.5f);
   default ForExternalLightMax.Set(30.f);

   default ForDaytimeStart.Set(FClockTime(19,45));
   default ForDaytimeEnd.Set(FClockTime(6,20));

   default bBeInside.Set(false);
   default bUseCloseShot.Set(true);

   default ForbiddenOnThisParticipantTags.AddTag(GameplayTag::State_Spell_Light);

   // Modifier Values
   default KeyLight.IntensityPercent = -50.f;
   
   default KeyReverseLight.IntensityPercent = -50.f;
   

   default KeyLight.ColorReplace = FVector(0.77f,0.31f,0.19f);
   default KeyReverseLight.ColorReplace = FVector(0.77f,0.31f,0.19f);
   // default RimLight.ColorReplace = FVector(0.13f,0.14f,0.25f);
   // default RimReverseLight.ColorReplace = FVector(0.13f,0.14f,0.25f);

   // New Light
   default AdditionalLightValues.Add(FLightValues());
   default AdditionalLightValues.Last().LightMaterialName = n"FlickerMaterial";

   default AdditionalLightValues.Last().LightIntensityCurve.AddValueAt(0.0f, 0.015f);
   default AdditionalLightValues.Last().LightColor = FLinearColor(1.f, 0.27f, 0.f);

   default AdditionalLightValues.Last().LightPos.AddVectorAt(0.0f, FVector(-54.973637f, -148.530426f, 11.783226f));
   default AdditionalLightValues.Last().LightRotOffset.AddVectorAt(0.0f, FVector(0.218197f, 82.162346f, 0.f));
   
   default AdditionalLightValues.Last().AttenuationRadius = 250.f;
   default AdditionalLightValues.Last().SourceWidth = 50.f;
   default AdditionalLightValues.Last().SourceHeight = 50.f;


   default AdditionalLightValues.Last().RelativeParticipant = EConversationCameraRelativeParticipant::Speaker;
   default AdditionalLightValues.Last().LightingChannels.bChannel0 = false;
   default AdditionalLightValues.Last().LightingChannels.bChannel1 = true;
   default AdditionalLightValues.Last().LightingChannels.bChannel2 = false;


   default AdditionalLightValues.Add(FLightValues());
   default AdditionalLightValues.Last().LightMaterialName = n"FlickerMaterial";

   default AdditionalLightValues.Last().LightIntensityCurve.AddValueAt(0.0f, 0.015f);
   default AdditionalLightValues.Last().LightColor = FLinearColor(1.f, 0.27f, 0.f);

   default AdditionalLightValues.Last().LightPos.AddVectorAt(0.0f, FVector(157.867462f, 50.631966f, 40.69244f));
   default AdditionalLightValues.Last().LightRotOffset.AddVectorAt(0.0f, FVector(-0.218197f, -163.261826f, 0.f));
   
   default AdditionalLightValues.Last().AttenuationRadius = 250.f;
   default AdditionalLightValues.Last().SourceWidth = 50.f;
   default AdditionalLightValues.Last().SourceHeight = 50.f;

   default AdditionalLightValues.Last().RelativeParticipant = EConversationCameraRelativeParticipant::Listener;
   default AdditionalLightValues.Last().LightingChannels.bChannel0 = false;
   default AdditionalLightValues.Last().LightingChannels.bChannel1 = false;
   default AdditionalLightValues.Last().LightingChannels.bChannel2 = true;

   default DiffuseColorBoost = 2.f;

   default GeneralPriority = 6.0f; 

   default EyeIntensityFinetuneFactor = 2.f;

   default KeyLight.MinThreshold = 0.006;
   default RimLight.MinThreshold = 0.006;
   default KeyReverseLight.MinThreshold = 0.006;
   default RimReverseLight.MinThreshold = 0.006;

}

UCLASS()
class ULightingModifierDimLightOutside_Wide: ULightingModifierConditional 
{
   default ModifierType = ELightingModifierType::ExternalLightIntensity;

   // Conditions
   default ForExternalLightMin.Set(0.5f);
   default ForExternalLightMax.Set(30.f);

   default ForDaytimeStart.Set(FClockTime(19,45));
   default ForDaytimeEnd.Set(FClockTime(6,20));

   default bBeInside.Set(false);
   default bUseCloseShot.Set(false);

   default ForbiddenOnThisParticipantTags.AddTag(GameplayTag::State_Spell_Light);

   // Modifier Values
   default KeyLight.IntensityPercent = -20.f;
   
   default KeyReverseLight.IntensityPercent = -30.f;
   

   default KeyLight.ColorReplace = FVector(0.77f,0.31f,0.19f);
   default KeyReverseLight.ColorReplace = FVector(0.77f,0.31f,0.19f);
   // default RimLight.ColorReplace = FVector(0.13f,0.14f,0.25f);
   // default RimReverseLight.ColorReplace = FVector(0.13f,0.14f,0.25f);


   // New Light
   default AdditionalLightValues.Add(FLightValues());
   default AdditionalLightValues.Last().LightMaterialName = n"FlickerMaterial";
   default AdditionalLightValues.Last().LightIntensityCurve.AddValueAt(0.0f, 0.03f);
   default AdditionalLightValues.Last().LightColor = FLinearColor(1.f, 0.27f, 0.f);

   default AdditionalLightValues.Last().LightPos.AddVectorAt(0.0f, FVector(5.547096f, -250.954346f, 84.640976f));
   default AdditionalLightValues.Last().LightRotOffset.AddVectorAt(0.0f, FVector(-9.819188f, 88.362679f, -0.f));
   
   default AdditionalLightValues.Last().AttenuationRadius = 600.f;
   default AdditionalLightValues.Last().SourceWidth = 250.f;
   default AdditionalLightValues.Last().SourceHeight = 125.f;

   default AdditionalLightValues.Last().RelativeParticipant = EConversationCameraRelativeParticipant::Speaker;
   default AdditionalLightValues.Last().LightingChannels.bChannel0 = false;
   default AdditionalLightValues.Last().LightingChannels.bChannel1 = true;
   default AdditionalLightValues.Last().LightingChannels.bChannel2 = false;


   default AdditionalLightValues.Add(FLightValues());
   default AdditionalLightValues.Last().LightMaterialName = n"FlickerMaterial";
   default AdditionalLightValues.Last().LightIntensityCurve.AddValueAt(0.0f, 0.02f);
   default AdditionalLightValues.Last().LightColor = FLinearColor(1.f, 0.27f, 0.f);

   default AdditionalLightValues.Last().LightPos.AddVectorAt(0.0f, FVector(208.295319f, 319.695648f, 95.177452f));
   default AdditionalLightValues.Last().LightRotOffset.AddVectorAt(0.0f, FVector(-10.255584f, -132.637329f, 0.f));
   
   default AdditionalLightValues.Last().AttenuationRadius = 600.f;
   default AdditionalLightValues.Last().SourceWidth = 250.f;
   default AdditionalLightValues.Last().SourceHeight = 125.f;

   default AdditionalLightValues.Last().RelativeParticipant = EConversationCameraRelativeParticipant::Listener;
   default AdditionalLightValues.Last().LightingChannels.bChannel0 = false;
   default AdditionalLightValues.Last().LightingChannels.bChannel1 = false;
   default AdditionalLightValues.Last().LightingChannels.bChannel2 = true;

   default DiffuseColorBoost = 2.f;

   default GeneralPriority = 6.0f; 

   default EyeIntensityFinetuneFactor = 2.f;

   default KeyLight.MinThreshold = 0.006;
   default RimLight.MinThreshold = 0.006;
   default KeyReverseLight.MinThreshold = 0.006;
   default RimReverseLight.MinThreshold = 0.006;

}

//______________________________________________________________________________________



		

UCLASS()
class ULightingModifierMediumLightOutside_Close: ULightingModifierConditional 
{
   default ModifierType = ELightingModifierType::ExternalLightIntensity;

   // Conditions
   default ForExternalLightMin.Set(30.01f);
   default ForExternalLightMax.Set(60.f);

   default ForDaytimeStart.Set(FClockTime(19,45));
   default ForDaytimeEnd.Set(FClockTime(6,20));

   default bBeInside.Set(false);
   default bUseCloseShot.Set(true);

   // Modifier Values
   // default KeyLight.IntensityPercent = -5.f;
   // default RimLight.IntensityPercent = 90.f;
   // default KeyReverseLight.IntensityPercent = -5.f;
   default RimReverseLight.IntensityPercent = -90.f;

   default KeyLight.ColorReplace = FVector(1.f,0.38f,0.16f);
   default KeyReverseLight.ColorReplace = FVector(1.f,0.38f,0.16f);
   // default RimLight.ColorReplace = FVector(0.24f,0.22f,0.38f);
   // default RimReverseLight.ColorReplace = FVector(0.24f,0.22f,0.38f);

   default ForbiddenOnThisParticipantTags.AddTag(GameplayTag::State_Spell_Light);


   // New Light
   default AdditionalLightValues.Add(FLightValues());
   default AdditionalLightValues.Last().LightMaterialName = n"FlickerMaterial";
   default AdditionalLightValues.Last().LightIntensityCurve.AddValueAt(0.0f, 0.03f);
   default AdditionalLightValues.Last().LightColor = FLinearColor(1.f, 0.27f, 0.f);

   default AdditionalLightValues.Last().LightPos.AddVectorAt(0.0f, FVector(-54.973637f, -148.530426f, 11.783226f));
   default AdditionalLightValues.Last().LightRotOffset.AddVectorAt(0.0f, FVector(0.218197f, 82.162346f, 0.f));
   
   default AdditionalLightValues.Last().AttenuationRadius = 250.f;
   default AdditionalLightValues.Last().SourceWidth = 50.f;
   default AdditionalLightValues.Last().SourceHeight = 50.f;

   default AdditionalLightValues.Last().RelativeParticipant = EConversationCameraRelativeParticipant::Speaker;
   default AdditionalLightValues.Last().LightingChannels.bChannel0 = false;
   default AdditionalLightValues.Last().LightingChannels.bChannel1 = true;
   default AdditionalLightValues.Last().LightingChannels.bChannel2 = false;


   default AdditionalLightValues.Add(FLightValues());
   default AdditionalLightValues.Last().LightMaterialName = n"FlickerMaterial";
   default AdditionalLightValues.Last().LightIntensityCurve.AddValueAt(0.0f, 0.03f);
   default AdditionalLightValues.Last().LightColor = FLinearColor(1.f, 0.27f, 0.f);

   default AdditionalLightValues.Last().LightPos.AddVectorAt(0.0f, FVector(157.867462f, 50.631966f, 40.69244f));
   default AdditionalLightValues.Last().LightRotOffset.AddVectorAt(0.0f, FVector(-0.218197f, -163.261826f, 0.f));
   
   default AdditionalLightValues.Last().AttenuationRadius = 250.f;
   default AdditionalLightValues.Last().SourceWidth = 50.f;
   default AdditionalLightValues.Last().SourceHeight = 50.f;

   default AdditionalLightValues.Last().RelativeParticipant = EConversationCameraRelativeParticipant::Listener;
   default AdditionalLightValues.Last().LightingChannels.bChannel0 = false;
   default AdditionalLightValues.Last().LightingChannels.bChannel1 = false;
   default AdditionalLightValues.Last().LightingChannels.bChannel2 = true;

   default DiffuseColorBoost = 1.5f;

   default GeneralPriority = 6.0f; 
   

   default KeyLight.MinThreshold = 0.01;
   default RimLight.MinThreshold = 0.01;
   default KeyReverseLight.MinThreshold = 0.01;
   default RimReverseLight.MinThreshold = 0.008;

}

UCLASS()
class ULightingModifierMediumLightOutside_Wide: ULightingModifierConditional 
{
   default ModifierType = ELightingModifierType::ExternalLightIntensity;

   // Conditions
   default ForExternalLightMin.Set(30.01f);
   default ForExternalLightMax.Set(60.f);

   default ForDaytimeStart.Set(FClockTime(19,45));
   default ForDaytimeEnd.Set(FClockTime(6,20));

   default bBeInside.Set(false);
   default bUseCloseShot.Set(false);

   // Modifier Values
   // default KeyLight.IntensityPercent = -30.f;
   // default RimLight.IntensityPercent = 40.f;
   // default KeyReverseLight.IntensityPercent = -30.f;
   // default RimReverseLight.IntensityPercent = 40.f;

   default KeyLight.ColorReplace = FVector(1.f,0.38f,0.16f);
   default KeyReverseLight.ColorReplace = FVector(1.f,0.38f,0.16f);
   // default RimLight.ColorReplace = FVector(0.24f,0.22f,0.38f);
   // default RimReverseLight.ColorReplace = FVector(0.24f,0.22f,0.38f);

   default ForbiddenOnThisParticipantTags.AddTag(GameplayTag::State_Spell_Light);


   // New Light
   default AdditionalLightValues.Add(FLightValues());
   default AdditionalLightValues.Last().LightMaterialName = n"FlickerMaterial";
   default AdditionalLightValues.Last().LightIntensityCurve.AddValueAt(0.0f, 0.06f);
   default AdditionalLightValues.Last().LightPos.AddVectorAt(0.0f, FVector(5.547096f, -250.954346f, 84.640976f));
   default AdditionalLightValues.Last().LightRotOffset.AddVectorAt(0.0f, FVector(-9.819188f, 88.362679f, -0.f));
   default AdditionalLightValues.Last().LightColor = FLinearColor(1.f, 0.27f, 0.f);
   default AdditionalLightValues.Last().AttenuationRadius = 600.f;
   default AdditionalLightValues.Last().SourceWidth = 250.f;
   default AdditionalLightValues.Last().SourceHeight = 125.f;

   default AdditionalLightValues.Last().RelativeParticipant = EConversationCameraRelativeParticipant::Speaker;
   default AdditionalLightValues.Last().LightingChannels.bChannel0 = false;
   default AdditionalLightValues.Last().LightingChannels.bChannel1 = true;
   default AdditionalLightValues.Last().LightingChannels.bChannel2 = false;


   default AdditionalLightValues.Add(FLightValues());
   default AdditionalLightValues.Last().LightMaterialName = n"FlickerMaterial";
   default AdditionalLightValues.Last().LightIntensityCurve.AddValueAt(0.0f, 0.06f);
   default AdditionalLightValues.Last().LightPos.AddVectorAt(0.0f, FVector(208.295319f, 319.695648f, 95.177452f));
   default AdditionalLightValues.Last().LightRotOffset.AddVectorAt(0.0f, FVector(-10.255584f, -132.637329f, 0.f));
   default AdditionalLightValues.Last().LightColor = FLinearColor(1.f, 0.27f, 0.f);
   default AdditionalLightValues.Last().AttenuationRadius = 600.f;
   default AdditionalLightValues.Last().SourceWidth = 250.f;
   default AdditionalLightValues.Last().SourceHeight = 125.f;

   default AdditionalLightValues.Last().RelativeParticipant = EConversationCameraRelativeParticipant::Listener;
   default AdditionalLightValues.Last().LightingChannels.bChannel0 = false;
   default AdditionalLightValues.Last().LightingChannels.bChannel1 = false;
   default AdditionalLightValues.Last().LightingChannels.bChannel2 = true;

   default DiffuseColorBoost = 1.5f;

   default GeneralPriority = 6.0f; 

   default KeyLight.MinThreshold = 0.01;
   default RimLight.MinThreshold = 0.01;
   default KeyReverseLight.MinThreshold = 0.01;
   default RimReverseLight.MinThreshold = 0.01;

}
//______________________________________________________________________________________


UCLASS()
class ULightingModifierBrightLightOutside_Close: ULightingModifierConditional 
{
   default ModifierType = ELightingModifierType::ExternalLightIntensity;

   // Conditions
   default ForExternalLightMin.Set(60.01f);

   default ForDaytimeStart.Set(FClockTime(19,45));
   default ForDaytimeEnd.Set(FClockTime(6,20));

   default bBeInside.Set(false);
   default bUseCloseShot.Set(true);

   // Modifier Values
   default KeyLight.IntensityPercent = 150.f;
   default RimLight.IntensityPercent = 80.f;
   default KeyReverseLight.IntensityPercent = 150.f;
   default RimReverseLight.IntensityPercent = 80.f;

   default KeyLight.ColorReplace = FVector(1.f,0.38f,0.16f);
   default KeyReverseLight.ColorReplace = FVector(1.f,0.38f,0.16f);
   // default RimLight.ColorReplace = FVector(1.f,0.3f,0.01f);
   // default RimReverseLight.ColorReplace = FVector(1.f,0.3f,0.01f);

   default ForbiddenOnThisParticipantTags.AddTag(GameplayTag::State_Spell_Light);


   // New Light
   default AdditionalLightValues.Add(FLightValues());
   default AdditionalLightValues.Last().LightMaterialName = n"FlickerMaterial";
   default AdditionalLightValues.Last().LightIntensityCurve.AddValueAt(0.0f, 0.15f);

   default AdditionalLightValues.Last().LightPos.AddVectorAt(0.0f, FVector(-54.973637f, -148.530426f, 11.783226f));
   default AdditionalLightValues.Last().LightRotOffset.AddVectorAt(0.0f, FVector(0.218197f, 82.162346f, 0.f));
   default AdditionalLightValues.Last().LightColor = FLinearColor(1.f, 0.27f, 0.f);
   default AdditionalLightValues.Last().AttenuationRadius = 250.f;
   default AdditionalLightValues.Last().SourceWidth = 50.f;
   default AdditionalLightValues.Last().SourceHeight = 50.f;

   default AdditionalLightValues.Last().RelativeParticipant = EConversationCameraRelativeParticipant::Speaker;
   default AdditionalLightValues.Last().LightingChannels.bChannel0 = false;
   default AdditionalLightValues.Last().LightingChannels.bChannel1 = true;
   default AdditionalLightValues.Last().LightingChannels.bChannel2 = false;


   default AdditionalLightValues.Add(FLightValues());
   default AdditionalLightValues.Last().LightMaterialName = n"FlickerMaterial";
   default AdditionalLightValues.Last().LightIntensityCurve.AddValueAt(0.0f, 0.15f);

   default AdditionalLightValues.Last().LightPos.AddVectorAt(0.0f, FVector(157.867462f, 50.631966f, 40.69244f));
   default AdditionalLightValues.Last().LightRotOffset.AddVectorAt(0.0f, FVector(-0.218197f, -163.261826f, 0.f));
   default AdditionalLightValues.Last().LightColor = FLinearColor(1.f, 0.27f, 0.f);
   default AdditionalLightValues.Last().AttenuationRadius = 250.f;
   default AdditionalLightValues.Last().SourceWidth = 50.f;
   default AdditionalLightValues.Last().SourceHeight = 50.f;

   default AdditionalLightValues.Last().RelativeParticipant = EConversationCameraRelativeParticipant::Listener;
   default AdditionalLightValues.Last().LightingChannels.bChannel0 = false;
   default AdditionalLightValues.Last().LightingChannels.bChannel1 = false;
   default AdditionalLightValues.Last().LightingChannels.bChannel2 = true;

   default DiffuseColorBoost = 2.f;

   default GeneralPriority = 6.0f; 

   default KeyLight.MinThreshold = 0.01;
   default RimLight.MinThreshold = 0.01;
   default KeyReverseLight.MinThreshold = 0.01;
   default RimReverseLight.MinThreshold = 0.01;

}

UCLASS()
class ULightingModifierBrightLightOutside_Wide: ULightingModifierConditional 
{
   default ModifierType = ELightingModifierType::ExternalLightIntensity;

   // Conditions
   default ForExternalLightMin.Set(60.01f);

   default ForDaytimeStart.Set(FClockTime(19,45));
   default ForDaytimeEnd.Set(FClockTime(6,20));

   default bBeInside.Set(false);
   default bUseCloseShot.Set(false);

   // Modifier Values
   default KeyLight.IntensityPercent = 100.f;
   default RimLight.IntensityPercent = 25.f;
   default KeyReverseLight.IntensityPercent = 100.f;
   default RimReverseLight.IntensityPercent = 25.f;

   default KeyLight.ColorReplace = FVector(1.f,0.38f,0.16f);
   default KeyReverseLight.ColorReplace = FVector(1.f,0.38f,0.16f);
   // default RimLight.ColorReplace = FVector(1.f,0.3f,0.01f);
   // default RimReverseLight.ColorReplace = FVector(1.f,0.3f,0.01f);

   default ForbiddenOnThisParticipantTags.AddTag(GameplayTag::State_Spell_Light);


   // New Light
   default AdditionalLightValues.Add(FLightValues());
   default AdditionalLightValues.Last().LightMaterialName = n"FlickerMaterial";
   default AdditionalLightValues.Last().LightIntensityCurve.AddValueAt(0.0f, 0.2f);

   default AdditionalLightValues.Last().LightPos.AddVectorAt(0.0f, FVector(5.547096f, -250.954346f, 84.640976f));
   default AdditionalLightValues.Last().LightRotOffset.AddVectorAt(0.0f, FVector(-9.819188f, 88.362679f, -0.f));
   default AdditionalLightValues.Last().LightColor = FLinearColor(1.f, 0.27f, 0.f);
   default AdditionalLightValues.Last().AttenuationRadius = 600.f;
   default AdditionalLightValues.Last().SourceWidth = 250.f;
   default AdditionalLightValues.Last().SourceHeight = 125.f;

   default AdditionalLightValues.Last().RelativeParticipant = EConversationCameraRelativeParticipant::Speaker;
   default AdditionalLightValues.Last().LightingChannels.bChannel0 = false;
   default AdditionalLightValues.Last().LightingChannels.bChannel1 = true;
   default AdditionalLightValues.Last().LightingChannels.bChannel2 = false;


   default AdditionalLightValues.Add(FLightValues());
   default AdditionalLightValues.Last().LightMaterialName = n"FlickerMaterial";
   default AdditionalLightValues.Last().LightIntensityCurve.AddValueAt(0.0f, 0.2f);

   default AdditionalLightValues.Last().LightPos.AddVectorAt(0.0f, FVector(208.295319f, 319.695648f, 95.177452f));
   default AdditionalLightValues.Last().LightRotOffset.AddVectorAt(0.0f, FVector(-10.255584f, -132.637329f, 0.f));
   default AdditionalLightValues.Last().LightColor = FLinearColor(1.f, 0.27f, 0.f);
   default AdditionalLightValues.Last().AttenuationRadius = 600.f;
   default AdditionalLightValues.Last().SourceWidth = 250.f;
   default AdditionalLightValues.Last().SourceHeight = 125.f;

   default AdditionalLightValues.Last().RelativeParticipant = EConversationCameraRelativeParticipant::Listener;
   default AdditionalLightValues.Last().LightingChannels.bChannel0 = false;
   default AdditionalLightValues.Last().LightingChannels.bChannel1 = false;
   default AdditionalLightValues.Last().LightingChannels.bChannel2 = true;

   default DiffuseColorBoost = 2.f;

   default GeneralPriority = 6.0f; 

   default KeyLight.MinThreshold = 0.01;
   default RimLight.MinThreshold = 0.01;
   default KeyReverseLight.MinThreshold = 0.01;
   default RimReverseLight.MinThreshold = 0.01;


}
//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------------------------------------------

// Inside External Light




UCLASS()
class ULightingModifierDimLightInside_Close: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::ExternalLightIntensity;

   // Conditions
   default ForExternalLightMin.Set(1.f);
   default ForExternalLightMax.Set(25.f);

   default bBeInside.Set(true);
   default bUseCloseShot.Set(true);

   // Modifier Values
   
   default KeyLight.ColorReplace = FVector(0.68f,0.16f,0.007f);
   default KeyReverseLight.ColorReplace = FVector(0.68f,0.16f,0.007f);
   // default RimLight.ColorReplace = FVector(0.55f,0.23f,0.29f);
   // default RimReverseLight.ColorReplace = FVector(0.55f,0.23f,0.29f);

   // default RimLight.IntensityPercent = 10.f;
   // default RimReverseLight.IntensityPercent = 10.f; 

   default ForbiddenOnThisParticipantTags.AddTag(GameplayTag::State_Spell_Light);
   

   // New Light
   default AdditionalLightValues.Add(FLightValues());
   default AdditionalLightValues.Last().LightMaterialName = n"FlickerMaterial";
   default AdditionalLightValues.Last().LightIntensityCurve.AddValueAt(0.0f, 0.007);
   default AdditionalLightValues.Last().LightPos.AddVectorAt(0.0f, FVector(-54.973637f, -148.530426f, 11.783226f));
   default AdditionalLightValues.Last().LightRotOffset.AddVectorAt(0.0f, FVector(0.218197f, 82.162346f, 0.f));
   default AdditionalLightValues.Last().LightColor = FLinearColor(1.f, 0.27f, 0.f);
   default AdditionalLightValues.Last().AttenuationRadius = 250.f;
   default AdditionalLightValues.Last().SourceWidth = 50.f;
   default AdditionalLightValues.Last().SourceHeight = 50.f;

   default AdditionalLightValues.Last().RelativeParticipant = EConversationCameraRelativeParticipant::Speaker;
   default AdditionalLightValues.Last().LightingChannels.bChannel0 = false;
   default AdditionalLightValues.Last().LightingChannels.bChannel1 = true;
   default AdditionalLightValues.Last().LightingChannels.bChannel2 = false;


   default AdditionalLightValues.Add(FLightValues());
   default AdditionalLightValues.Last().LightMaterialName = n"FlickerMaterial";
   default AdditionalLightValues.Last().LightIntensityCurve.AddValueAt(0.0f, 0.007f);
   default AdditionalLightValues.Last().LightPos.AddVectorAt(0.0f, FVector(157.867462f, 50.631966f, 40.69244f));
   default AdditionalLightValues.Last().LightRotOffset.AddVectorAt(0.0f, FVector(-0.218197f, -163.261826f, 0.f));
   default AdditionalLightValues.Last().LightColor = FLinearColor(1.f, 0.27f, 0.f);
   default AdditionalLightValues.Last().AttenuationRadius = 250.f;
   default AdditionalLightValues.Last().SourceWidth = 50.f;
   default AdditionalLightValues.Last().SourceHeight = 50.f;

   default AdditionalLightValues.Last().RelativeParticipant = EConversationCameraRelativeParticipant::Listener;
   default AdditionalLightValues.Last().LightingChannels.bChannel0 = false;
   default AdditionalLightValues.Last().LightingChannels.bChannel1 = false;
   default AdditionalLightValues.Last().LightingChannels.bChannel2 = true;

   default DiffuseColorBoost = 2.0f;

   default EyeIntensityFinetuneFactor = 2.f; 

   default GeneralPriority = 6.0f; 
}

UCLASS()
class ULightingModifierDimLightInside_Wide: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::ExternalLightIntensity;

   // Conditions
   default ForExternalLightMin.Set(1.f);
   default ForExternalLightMax.Set(25.f);

   default bBeInside.Set(true);
   default bUseCloseShot.Set(false);

   // Modifier Values
   
   default KeyLight.ColorReplace = FVector(0.68f,0.16f,0.007f);
   default KeyReverseLight.ColorReplace = FVector(0.68f,0.16f,0.007f);
   // default RimLight.ColorReplace = FVector(0.55f,0.23f,0.29f);
   // default RimReverseLight.ColorReplace = FVector(0.55f,0.23f,0.29f);

   // default RimLight.IntensityPercent = 50.f;
   // default RimReverseLight.IntensityPercent = 50.f; 

   default ForbiddenOnThisParticipantTags.AddTag(GameplayTag::State_Spell_Light);


   // New Light
   default AdditionalLightValues.Add(FLightValues());
   default AdditionalLightValues.Last().LightMaterialName = n"FlickerMaterial";
   default AdditionalLightValues.Last().LightIntensityCurve.AddValueAt(0.0f, 0.01f);
   default AdditionalLightValues.Last().LightPos.AddVectorAt(0.0f, FVector(5.547096f, -250.954346f, 84.640976f));
   default AdditionalLightValues.Last().LightRotOffset.AddVectorAt(0.0f, FVector(-9.819188f, 88.362679f, -0.f));
   default AdditionalLightValues.Last().LightColor = FLinearColor(1.f, 0.27f, 0.f);
   default AdditionalLightValues.Last().AttenuationRadius = 600.f;
   default AdditionalLightValues.Last().SourceWidth = 250.f;
   default AdditionalLightValues.Last().SourceHeight = 125.f;

   default AdditionalLightValues.Last().RelativeParticipant = EConversationCameraRelativeParticipant::Speaker;
   default AdditionalLightValues.Last().LightingChannels.bChannel0 = false;
   default AdditionalLightValues.Last().LightingChannels.bChannel1 = true;
   default AdditionalLightValues.Last().LightingChannels.bChannel2 = false;


   default AdditionalLightValues.Add(FLightValues());
   default AdditionalLightValues.Last().LightMaterialName = n"FlickerMaterial";
   default AdditionalLightValues.Last().LightIntensityCurve.AddValueAt(0.0f, 0.01f);
   default AdditionalLightValues.Last().LightPos.AddVectorAt(0.0f, FVector(5.547096f, -250.954346f, 84.640976f));
   default AdditionalLightValues.Last().LightRotOffset.AddVectorAt(0.0f, FVector(-9.819188f, 88.362679f, -0.f));
   default AdditionalLightValues.Last().LightColor = FLinearColor(1.f, 0.27f, 0.f);
   default AdditionalLightValues.Last().AttenuationRadius = 600.f;
   default AdditionalLightValues.Last().SourceWidth = 250.f;
   default AdditionalLightValues.Last().SourceHeight = 125.f;

   default AdditionalLightValues.Last().RelativeParticipant = EConversationCameraRelativeParticipant::Listener;
   default AdditionalLightValues.Last().LightingChannels.bChannel0 = false;
   default AdditionalLightValues.Last().LightingChannels.bChannel1 = false;
   default AdditionalLightValues.Last().LightingChannels.bChannel2 = true;

   default DiffuseColorBoost = 1.5f;

   default EyeIntensityFinetuneFactor = 2.f; 

   default GeneralPriority = 6.0f; 
}
//______________________________________________________________________________________


UCLASS()
class ULightingModifierMediumLightInside_Close: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::ExternalLightIntensity;

   // Conditions
   default ForExternalLightMin.Set(25.01f);
   default ForExternalLightMax.Set(80.f);

   default bBeInside.Set(true);
   default bUseCloseShot.Set(true);

   // Modifier Values
   default KeyLight.IntensityPercent = 35.f;
   default RimLight.IntensityPercent = 100.f;
   default KeyReverseLight.IntensityPercent = 30.f;   
   default RimReverseLight.IntensityPercent = 100.f;   

   default KeyLight.ColorReplace = FVector(0.93f,0.22f,0.01f);
   default KeyReverseLight.ColorReplace = FVector(0.93f,0.22f,0.01f);
   default RimLight.ColorReplace = FVector(0.55f,0.23f,0.29f);
   default RimReverseLight.ColorReplace = FVector(0.55f,0.23f,0.29f);

   default ForbiddenOnThisParticipantTags.AddTag(GameplayTag::State_Spell_Light);


   // New Light
   default AdditionalLightValues.Add(FLightValues());
   default AdditionalLightValues.Last().LightMaterialName = n"FlickerMaterial";
   default AdditionalLightValues.Last().LightIntensityCurve.AddValueAt(0.0f, 0.03f);
   default AdditionalLightValues.Last().LightPos.AddVectorAt(0.0f, FVector(-54.973637f, -148.530426f, 11.783226f));
   default AdditionalLightValues.Last().LightRotOffset.AddVectorAt(0.0f, FVector(0.218197f, 82.162346f, 0.f));
   default AdditionalLightValues.Last().LightColor = FLinearColor(1.f, 0.27f, 0.f);
   default AdditionalLightValues.Last().AttenuationRadius = 250.f;
   default AdditionalLightValues.Last().SourceWidth = 50.f;
   default AdditionalLightValues.Last().SourceHeight = 50.f;

   default AdditionalLightValues.Last().RelativeParticipant = EConversationCameraRelativeParticipant::Speaker;
   default AdditionalLightValues.Last().LightingChannels.bChannel0 = false;
   default AdditionalLightValues.Last().LightingChannels.bChannel1 = true;
   default AdditionalLightValues.Last().LightingChannels.bChannel2 = false;


   default AdditionalLightValues.Add(FLightValues());
   default AdditionalLightValues.Last().LightMaterialName = n"FlickerMaterial";
   default AdditionalLightValues.Last().LightIntensityCurve.AddValueAt(0.0f, 0.03f);
   default AdditionalLightValues.Last().LightPos.AddVectorAt(0.0f, FVector(157.867462f, 50.631966f, 40.69244f));
   default AdditionalLightValues.Last().LightRotOffset.AddVectorAt(0.0f, FVector(-0.218197f, -163.261826f, 0.f));
   default AdditionalLightValues.Last().LightColor = FLinearColor(1.f, 0.27f, 0.f);
   default AdditionalLightValues.Last().AttenuationRadius = 250.f;
   default AdditionalLightValues.Last().SourceWidth = 50.f;
   default AdditionalLightValues.Last().SourceHeight = 50.f;

   default AdditionalLightValues.Last().RelativeParticipant = EConversationCameraRelativeParticipant::Listener;
   default AdditionalLightValues.Last().LightingChannels.bChannel0 = false;
   default AdditionalLightValues.Last().LightingChannels.bChannel1 = false;
   default AdditionalLightValues.Last().LightingChannels.bChannel2 = true;

   default DiffuseColorBoost = 2.0f;

   default EyeIntensityFinetuneFactor = 1.2f;  

   default GeneralPriority = 6.0f; 
}

UCLASS()
class ULightingModifierMediumLightInside_Wide: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::ExternalLightIntensity;

   // Conditions
   default ForExternalLightMin.Set(25.01f);
   default ForExternalLightMax.Set(80.f);

   default bBeInside.Set(true);
   default bUseCloseShot.Set(false);

   // Modifier Values
   default KeyLight.IntensityPercent = 5.f;
   default RimLight.IntensityPercent = 60.f;
   default KeyReverseLight.IntensityPercent = 5.f;   
   default RimReverseLight.IntensityPercent = 60.f;

   default KeyLight.ColorReplace = FVector(0.93f,0.22f,0.01f);
   default KeyReverseLight.ColorReplace = FVector(0.93f,0.22f,0.01f);
   default RimLight.ColorReplace = FVector(0.55f,0.23f,0.29f);
   default RimReverseLight.ColorReplace = FVector(0.55f,0.23f,0.29f);

   default ForbiddenOnThisParticipantTags.AddTag(GameplayTag::State_Spell_Light);


   // New Light
   default AdditionalLightValues.Add(FLightValues());
   default AdditionalLightValues.Last().LightMaterialName = n"FlickerMaterial";
   default AdditionalLightValues.Last().LightIntensityCurve.AddValueAt(0.0f, 0.04f);
   default AdditionalLightValues.Last().LightPos.AddVectorAt(0.0f, FVector(5.547096f, -250.954346f, 84.640976f));
   default AdditionalLightValues.Last().LightRotOffset.AddVectorAt(0.0f, FVector(-9.819188f, 88.362679f, -0.f));
   default AdditionalLightValues.Last().LightColor = FLinearColor(1.f, 0.27f, 0.f);
   default AdditionalLightValues.Last().AttenuationRadius = 600.f;
   default AdditionalLightValues.Last().SourceWidth = 250.f;
   default AdditionalLightValues.Last().SourceHeight = 125.f;

   default AdditionalLightValues.Last().RelativeParticipant = EConversationCameraRelativeParticipant::Speaker;
   default AdditionalLightValues.Last().LightingChannels.bChannel0 = false;
   default AdditionalLightValues.Last().LightingChannels.bChannel1 = true;
   default AdditionalLightValues.Last().LightingChannels.bChannel2 = false;


   default AdditionalLightValues.Add(FLightValues());
   default AdditionalLightValues.Last().LightMaterialName = n"FlickerMaterial";
   default AdditionalLightValues.Last().LightIntensityCurve.AddValueAt(0.0f, 0.04f);
   default AdditionalLightValues.Last().LightPos.AddVectorAt(0.0f, FVector(5.547096f, -250.954346f, 84.640976f));
   default AdditionalLightValues.Last().LightRotOffset.AddVectorAt(0.0f, FVector(-9.819188f, 88.362679f, -0.f));
   default AdditionalLightValues.Last().LightColor = FLinearColor(1.f, 0.27f, 0.f);
   default AdditionalLightValues.Last().AttenuationRadius = 600.f;
   default AdditionalLightValues.Last().SourceWidth = 250.f;
   default AdditionalLightValues.Last().SourceHeight = 125.f;

   default AdditionalLightValues.Last().RelativeParticipant = EConversationCameraRelativeParticipant::Listener;
   default AdditionalLightValues.Last().LightingChannels.bChannel0 = false;
   default AdditionalLightValues.Last().LightingChannels.bChannel1 = false;
   default AdditionalLightValues.Last().LightingChannels.bChannel2 = true;

   default DiffuseColorBoost = 2.0f;

   default EyeIntensityFinetuneFactor = 1.2f;  

   default GeneralPriority = 6.0f; 
}
//______________________________________________________________________________________


UCLASS()
class ULightingModifierBrightLightInside_Close: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::ExternalLightIntensity;

   // Conditions
   default ForExternalLightMin.Set(80.01f);

   default bBeInside.Set(true);
   default bUseCloseShot.Set(true);

   // Modifier Values
   default KeyLight.IntensityPercent = 100.f;
   default RimLight.IntensityPercent = 400.f;
   default KeyReverseLight.IntensityPercent = 100.f;
   default RimReverseLight.IntensityPercent = 400.f;

   default KeyLight.ColorReplace = FVector(0.93f,0.22f,0.01f);
   default KeyReverseLight.ColorReplace = FVector(0.93f,0.22f,0.01f);
   default RimLight.ColorReplace = FVector(0.93f,0.25f,0.015f);
   default RimReverseLight.ColorReplace = FVector(0.93f,0.25f,0.015f);

   default ForbiddenOnThisParticipantTags.AddTag(GameplayTag::State_Spell_Light);

   // New Light
   default AdditionalLightValues.Add(FLightValues());
   default AdditionalLightValues.Last().LightMaterialName = n"FlickerMaterial";
   default AdditionalLightValues.Last().LightIntensityCurve.AddValueAt(0.0f, 0.15f);
   default AdditionalLightValues.Last().LightPos.AddVectorAt(0.0f, FVector(-54.973637f, -148.530426f, 11.783226f));
   default AdditionalLightValues.Last().LightRotOffset.AddVectorAt(0.0f, FVector(0.218197f, 82.162346f, 0.f));
   default AdditionalLightValues.Last().LightColor = FLinearColor(1.f, 0.27f, 0.f);
   default AdditionalLightValues.Last().AttenuationRadius = 250.f;
   default AdditionalLightValues.Last().SourceWidth = 50.f;
   default AdditionalLightValues.Last().SourceHeight = 50.f;

   default AdditionalLightValues.Last().RelativeParticipant = EConversationCameraRelativeParticipant::Speaker;
   default AdditionalLightValues.Last().LightingChannels.bChannel0 = false;
   default AdditionalLightValues.Last().LightingChannels.bChannel1 = true;
   default AdditionalLightValues.Last().LightingChannels.bChannel2 = false;


   default AdditionalLightValues.Add(FLightValues());
   default AdditionalLightValues.Last().LightMaterialName = n"FlickerMaterial";
   default AdditionalLightValues.Last().LightIntensityCurve.AddValueAt(0.0f, 0.1f);
   default AdditionalLightValues.Last().LightPos.AddVectorAt(0.0f, FVector(157.867462f, 50.631966f, 40.69244f));
   default AdditionalLightValues.Last().LightRotOffset.AddVectorAt(0.0f, FVector(-0.218197f, -163.261826f, 0.f));
   default AdditionalLightValues.Last().LightColor = FLinearColor(1.f, 0.27f, 0.f);
   default AdditionalLightValues.Last().AttenuationRadius = 250.f;
   default AdditionalLightValues.Last().SourceWidth = 50.f;
   default AdditionalLightValues.Last().SourceHeight = 50.f;

   default AdditionalLightValues.Last().RelativeParticipant = EConversationCameraRelativeParticipant::Listener;
   default AdditionalLightValues.Last().LightingChannels.bChannel0 = false;
   default AdditionalLightValues.Last().LightingChannels.bChannel1 = false;
   default AdditionalLightValues.Last().LightingChannels.bChannel2 = true;

   default DiffuseColorBoost = 2.0f;


   default GeneralPriority = 6.0f; 
}

UCLASS()
class ULightingModifierBrightLightInside_Wide: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::ExternalLightIntensity;

   // Conditions
   default ForExternalLightMin.Set(80.01f);

   default bBeInside.Set(true);
   default bUseCloseShot.Set(false);

   // Modifier Values
   default KeyLight.IntensityPercent = 50.f;
   default RimLight.IntensityPercent = 200.f;
   default KeyReverseLight.IntensityPercent = 50.f;
   default RimReverseLight.IntensityPercent = 200.f;

   default KeyLight.ColorReplace = FVector(0.93f,0.22f,0.01f);
   default KeyReverseLight.ColorReplace = FVector(0.93f,0.22f,0.01f);
   default RimLight.ColorReplace = FVector(0.93f,0.25f,0.015f);
   default RimReverseLight.ColorReplace = FVector(0.93f,0.25f,0.015f);

   default ForbiddenOnThisParticipantTags.AddTag(GameplayTag::State_Spell_Light);


   // New Light
   default AdditionalLightValues.Add(FLightValues());
   default AdditionalLightValues.Last().LightMaterialName = n"FlickerMaterial";
   default AdditionalLightValues.Last().LightIntensityCurve.AddValueAt(0.0f, 0.2f);
   default AdditionalLightValues.Last().LightPos.AddVectorAt(0.0f, FVector(5.547096f, -250.954346f, 84.640976f));
   default AdditionalLightValues.Last().LightRotOffset.AddVectorAt(0.0f, FVector(-9.819188f, 88.362679f, -0.f));
   default AdditionalLightValues.Last().LightColor = FLinearColor(1.f, 0.27f, 0.f);
   default AdditionalLightValues.Last().AttenuationRadius = 600.f;
   default AdditionalLightValues.Last().SourceWidth = 250.f;
   default AdditionalLightValues.Last().SourceHeight = 125.f;

   default AdditionalLightValues.Last().RelativeParticipant = EConversationCameraRelativeParticipant::Speaker;
   default AdditionalLightValues.Last().LightingChannels.bChannel0 = false;
   default AdditionalLightValues.Last().LightingChannels.bChannel1 = true;
   default AdditionalLightValues.Last().LightingChannels.bChannel2 = false;


   default AdditionalLightValues.Add(FLightValues());
   default AdditionalLightValues.Last().LightMaterialName = n"FlickerMaterial";
   default AdditionalLightValues.Last().LightIntensityCurve.AddValueAt(0.0f, 0.2f);
   default AdditionalLightValues.Last().LightPos.AddVectorAt(0.0f, FVector(5.547096f, -250.954346f, 84.640976f));
   default AdditionalLightValues.Last().LightRotOffset.AddVectorAt(0.0f, FVector(-9.819188f, 88.362679f, -0.f));
   default AdditionalLightValues.Last().LightColor = FLinearColor(1.f, 0.27f, 0.f);
   default AdditionalLightValues.Last().AttenuationRadius = 600.f;
   default AdditionalLightValues.Last().SourceWidth = 250.f;
   default AdditionalLightValues.Last().SourceHeight = 125.f;

   default AdditionalLightValues.Last().RelativeParticipant = EConversationCameraRelativeParticipant::Listener;
   default AdditionalLightValues.Last().LightingChannels.bChannel0 = false;
   default AdditionalLightValues.Last().LightingChannels.bChannel1 = false;
   default AdditionalLightValues.Last().LightingChannels.bChannel2 = true;

   default DiffuseColorBoost = 2.0f;


   default GeneralPriority = 6.0f; 
}
//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------------------------------------------

//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------------------------------------------


//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------------------------------------------
// Weather_________________________________________________________________________________________________________________

UCLASS()
class ULightingModifierCloudy_Dawn_Close : ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Weather;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(5,30));
   default ForDaytimeEnd.Set(FClockTime(7,31));

   default bBeInside.Set(false);
   default ForWeather.Set(EWeather::Cloudy);
   default bUseCloseShot.Set(true);

   // Modifier Values
   default KeyLight.IntensityPercent = -35.f;
   default RimLight.IntensityPercent = -25.f;
   default KeyReverseLight.IntensityPercent = -35.f;
   default RimReverseLight.IntensityPercent = -25.f;

   default KeyLight.MinThreshold = 0.01;
   default RimLight.MinThreshold = 0.01;
   default KeyReverseLight.MinThreshold = 0.01;
   default RimReverseLight.MinThreshold = 0.01;
    

   default GeneralPriority = 2.0f;

   default EyeIntensityFinetuneFactor = 1.6f;
}

UCLASS()
class ULightingModifierCloudy_Dawn_Wide : ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Weather;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(5,30));
   default ForDaytimeEnd.Set(FClockTime(7,31));

   default bBeInside.Set(false);
   default ForWeather.Set(EWeather::Cloudy);
   default bUseCloseShot.Set(false);

   // Modifier Values
   default KeyLight.IntensityPercent = -45.f;
   default RimLight.IntensityPercent = -20.f;
   default KeyReverseLight.IntensityPercent = -45.f;
   default RimReverseLight.IntensityPercent = -20.f;

   default KeyLight.MinThreshold = 0.01;
   default RimLight.MinThreshold = 0.01;
   default KeyReverseLight.MinThreshold = 0.01;
   default RimReverseLight.MinThreshold = 0.01;
 

   default GeneralPriority = 2.0f;

   default EyeIntensityFinetuneFactor = 1.6f;
}

UCLASS()
class ULightingModifierCloudy_Day_Close : ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Weather;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(7,31));
   default ForDaytimeEnd.Set(FClockTime(14,00));

   default bBeInside.Set(false);
   default ForWeather.Set(EWeather::Cloudy);
   default bUseCloseShot.Set(true);

   // Modifier Values
   default KeyLight.IntensityPercent = -35.f;
   default RimLight.IntensityPercent = -35.f;
   default KeyReverseLight.IntensityPercent = -35.f;   
   default RimReverseLight.IntensityPercent = -35.f;

   default KeyLight.MinThreshold = 0.06;
   default RimLight.MinThreshold = 0.05;
   default KeyReverseLight.MinThreshold = 0.06;
   default RimReverseLight.MinThreshold = 0.05;
    

   default GeneralPriority = 2.0f;

   default EyeIntensityFinetuneFactor = 3.f;
}

UCLASS()
class ULightingModifierCloudy_Day_Wide : ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Weather;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(7,31));
   default ForDaytimeEnd.Set(FClockTime(14,00));

   default bBeInside.Set(false);
   default ForWeather.Set(EWeather::Cloudy);
   default bUseCloseShot.Set(false);

   // Modifier Values
   default KeyLight.IntensityPercent = -35.f;
   default RimLight.IntensityPercent = -35.f;
   default KeyReverseLight.IntensityPercent = -35.f;   
   default RimReverseLight.IntensityPercent = -35.f;

   default KeyLight.MinThreshold = 0.06;
   default RimLight.MinThreshold = 0.05;
   default KeyReverseLight.MinThreshold = 0.06;
   default RimReverseLight.MinThreshold = 0.05;
 

   default GeneralPriority = 2.0f;

   default EyeIntensityFinetuneFactor = 3.f;
}

UCLASS()
class ULightingModifierCloudy_Evening_Close : ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Weather;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(14,00));
   default ForDaytimeEnd.Set(FClockTime(18,31));

   default bBeInside.Set(false);
   default ForWeather.Set(EWeather::Cloudy);
   default bUseCloseShot.Set(true);

   // Modifier Values
   default KeyLight.IntensityPercent = -45.f;
   default RimLight.IntensityPercent = -45.f;
   default KeyReverseLight.IntensityPercent = -45.f;   
   default RimReverseLight.IntensityPercent = -45.f;

   default KeyLight.MinThreshold = 0.06;
   default RimLight.MinThreshold = 0.05;
   default KeyReverseLight.MinThreshold = 0.06;
   default RimReverseLight.MinThreshold = 0.05;
 

   default GeneralPriority = 2.0f;

   default EyeIntensityFinetuneFactor = 3.f;
}

UCLASS()
class ULightingModifierCloudy_Evening_Wide : ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Weather;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(14,00));
   default ForDaytimeEnd.Set(FClockTime(18,31));

   default bBeInside.Set(false);
   default ForWeather.Set(EWeather::Cloudy);
   default bUseCloseShot.Set(false);

   // Modifier Values
   default KeyLight.IntensityPercent = -45.f;
   default RimLight.IntensityPercent = -45.f;
   default KeyReverseLight.IntensityPercent = -45.f;   
   default RimReverseLight.IntensityPercent = -45.f;

   default KeyLight.MinThreshold = 0.06;
   default RimLight.MinThreshold = 0.05;
   default KeyReverseLight.MinThreshold = 0.06;
   default RimReverseLight.MinThreshold = 0.05;
 

   default GeneralPriority = 2.0f;

   default EyeIntensityFinetuneFactor = 3.f;
}

UCLASS()
class ULightingModifierCloudy_Dusk_Close : ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Weather;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(18,31));
   default ForDaytimeEnd.Set(FClockTime(19,30));

   default bBeInside.Set(false);
   default ForWeather.Set(EWeather::Cloudy);
   default bUseCloseShot.Set(true);

   // Modifier Values
   default KeyLight.IntensityPercent = -45.f;  
   default RimLight.IntensityPercent = -45.f;  

   default KeyReverseLight.IntensityPercent = -45.f;   
   default RimReverseLight.IntensityPercent = -45.f;
   

   default KeyLight.MinThreshold = 0.001;
   default RimLight.MinThreshold = 0.001;
   default KeyReverseLight.MinThreshold = 0.001;
   default RimReverseLight.MinThreshold = 0.001;
 

   default GeneralPriority = 2.0f;

   default EyeIntensityFinetuneFactor = 1.6f;
}

UCLASS()
class ULightingModifierCloudy_Dusk_Wide : ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Weather;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(18,31));
   default ForDaytimeEnd.Set(FClockTime(19,30));

   default bBeInside.Set(false);
   default ForWeather.Set(EWeather::Cloudy);
   default bUseCloseShot.Set(false);

   // Modifier Values
   default KeyLight.IntensityPercent = -55.f;
   default RimLight.IntensityPercent = -40.f;
   

   default KeyReverseLight.IntensityPercent = -55.f;   
   default RimReverseLight.IntensityPercent = -40.f;
   

   default KeyLight.MinThreshold = 0.01;
   default RimLight.MinThreshold = 0.01;
   default KeyReverseLight.MinThreshold = 0.01;
   default RimReverseLight.MinThreshold = 0.01;
  

   default GeneralPriority = 2.0f;

   default EyeIntensityFinetuneFactor = 1.6f;
}

//______________________________________________________________________________________
//______________________________________________________________________________________
//______________________________________________________________________________________
//______________________________________________________________________________________
//______________________________________________________________________________________
//////////////// RAIN LEVEL ////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////

UCLASS()
class ULightingModifierRain_Level1_Dawn_Close: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Weather;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(5,30));
   default ForDaytimeEnd.Set(FClockTime(5,49));

   default bBeInside.Set(false);
   default ForWeather.Set(EWeather::Rain_Level1);
   default bUseCloseShot.Set(true);

   // Modifier Values
   default KeyLight.IntensityPercent = -35.f;  
   default RimLight.IntensityPercent = -40.f;

   default KeyLight.ColorReplace = FVector(0.23f, 0.15f, 0.27f);
   default RimLight.ColorReplace = FVector(0.046f, 0.034f, 0.068f);
   

   default KeyReverseLight.IntensityPercent = -35.f;
   default RimReverseLight.IntensityPercent = -40.f;

   default KeyReverseLight.ColorReplace = FVector(0.23f, 0.15f, 0.27f);
   default RimReverseLight.ColorReplace = FVector(0.046f, 0.034f, 0.068f);

   default KeyLight.MinThreshold = 0.01;
   default RimLight.MinThreshold = 0.01;
   default KeyReverseLight.MinThreshold = 0.01;
   default RimReverseLight.MinThreshold = 0.01;
 

   default GeneralPriority = 2.0f;

   default EyeIntensityFinetuneFactor = 2.f;
}

UCLASS()
class ULightingModifierRain_Level1_Dawn_Wide: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Weather;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(5,30));
   default ForDaytimeEnd.Set(FClockTime(5,49));

   default bBeInside.Set(false);
   default ForWeather.Set(EWeather::Rain_Level1);
   default bUseCloseShot.Set(false);

   // Modifier Values
   default KeyLight.IntensityPercent = -30.f;  
   default RimLight.IntensityPercent = -70.f;

   default KeyLight.ColorReplace = FVector(0.23f, 0.15f, 0.27f);
   default RimLight.ColorReplace = FVector(0.046f, 0.034f, 0.068f);
   

   default KeyReverseLight.IntensityPercent = -30.f;
   default RimReverseLight.IntensityPercent = -70.f;

   default KeyReverseLight.ColorReplace = FVector(0.23f, 0.15f, 0.27f);
   default RimReverseLight.ColorReplace = FVector(0.046f, 0.034f, 0.068f);

    default KeyLight.MinThreshold = 0.01;
   default RimLight.MinThreshold = 0.01;
   default KeyReverseLight.MinThreshold = 0.01;
   default RimReverseLight.MinThreshold = 0.01;
 

   default GeneralPriority = 2.0f;

   default EyeIntensityFinetuneFactor = 2.f;
}

UCLASS()
class ULightingModifierRain_Level1_MagicHour_Close: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Weather;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(5,49));
   default ForDaytimeEnd.Set(FClockTime(6,20));

   default bBeInside.Set(false);
   default ForWeather.Set(EWeather::Rain_Level1);
   default bUseCloseShot.Set(true);

   // Modifier Values
   default KeyLight.IntensityPercent = -35.f;  
   default RimLight.IntensityPercent = -40.f;

   default KeyLight.ColorReplace = FVector(0.48f, 0.28f, 0.38f);
   default RimLight.ColorReplace = FVector(0.09f, 0.07f, 0.14f);
   

   default KeyReverseLight.IntensityPercent = -35.f;
   default RimReverseLight.IntensityPercent = -40.f;

   default KeyReverseLight.ColorReplace = FVector(0.48f, 0.28f, 0.38f);
   default RimReverseLight.ColorReplace = FVector(0.09f, 0.07f, 0.14f);

   default KeyLight.MinThreshold = 0.03;
   default RimLight.MinThreshold = 0.03;
   default KeyReverseLight.MinThreshold = 0.03;
   default RimReverseLight.MinThreshold = 0.03;
 

   default GeneralPriority = 2.0f;

   default EyeIntensityFinetuneFactor = 4.f;
}

UCLASS()
class ULightingModifierRain_Level1_MagicHour_Wide: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Weather;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(5,49));
   default ForDaytimeEnd.Set(FClockTime(6,20));

   default bBeInside.Set(false);
   default ForWeather.Set(EWeather::Rain_Level1);
   default bUseCloseShot.Set(false);

   // Modifier Values
   default KeyLight.IntensityPercent = -30.f;  
   default RimLight.IntensityPercent = -70.f;

   default KeyLight.ColorReplace = FVector(0.48f, 0.28f, 0.38f);
   default RimLight.ColorReplace = FVector(0.09f, 0.07f, 0.14f);
   

   default KeyReverseLight.IntensityPercent = -30.f;
   default RimReverseLight.IntensityPercent = -70.f;

   default KeyReverseLight.ColorReplace = FVector(0.48f, 0.28f, 0.38f);
   default RimReverseLight.ColorReplace = FVector(0.09f, 0.07f, 0.14f);

   default KeyLight.MinThreshold = 0.03;
   default RimLight.MinThreshold = 0.03;
   default KeyReverseLight.MinThreshold = 0.03;
   default RimReverseLight.MinThreshold = 0.03;
 

   default GeneralPriority = 2.0f;

   default EyeIntensityFinetuneFactor = 4.f;
}

UCLASS()
class ULightingModifierRain_Level1_Sunrise_Close: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Weather;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(6,20));
   default ForDaytimeEnd.Set(FClockTime(7,30));

   default bBeInside.Set(false);
   default ForWeather.Set(EWeather::Rain_Level1);
   default bUseCloseShot.Set(true);

   // Modifier Values
   default KeyLight.IntensityPercent = -35.f;  
   default RimLight.IntensityPercent = -40.f;

   default KeyLight.ColorReplace = FVector(0.43f, 0.28f, 0.19f);
   default RimLight.ColorReplace = FVector(0.14f, 0.10f, 0.24f);
   

   default KeyReverseLight.IntensityPercent = -35.f;
   default RimReverseLight.IntensityPercent = -40.f;

   default KeyReverseLight.ColorReplace = FVector(0.43f, 0.28f, 0.19f);
   default RimReverseLight.ColorReplace = FVector(0.14f, 0.10f, 0.24f);

   default KeyLight.MinThreshold = 0.1;
   default RimLight.MinThreshold = 0.1;
   default KeyReverseLight.MinThreshold = 0.1;
   default RimReverseLight.MinThreshold = 0.1;
 

   default GeneralPriority = 2.0f;

   default EyeIntensityFinetuneFactor = 1.f;
}

UCLASS()
class ULightingModifierRain_Level1_Sunrise_Wide: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Weather;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(6,20));
   default ForDaytimeEnd.Set(FClockTime(7,30));

   default bBeInside.Set(false);
   default ForWeather.Set(EWeather::Rain_Level1);
   default bUseCloseShot.Set(false);

   // Modifier Values
   default KeyLight.IntensityPercent = -30.f;  
   default RimLight.IntensityPercent = -60.f;

   default KeyLight.ColorReplace = FVector(0.43f, 0.28f, 0.19f);
   default RimLight.ColorReplace = FVector(0.14f, 0.10f, 0.24f);
   

   default KeyReverseLight.IntensityPercent = -30.f;
   default RimReverseLight.IntensityPercent = -60.f;

   default KeyReverseLight.ColorReplace = FVector(0.43f, 0.28f, 0.19f);
   default RimReverseLight.ColorReplace = FVector(0.14f, 0.10f, 0.24f);

   default KeyLight.MinThreshold = 0.1;
   default RimLight.MinThreshold = 0.1;
   default KeyReverseLight.MinThreshold = 0.1;
   default RimReverseLight.MinThreshold = 0.1;
 

   default GeneralPriority = 2.0f;

   default EyeIntensityFinetuneFactor = 1.f;
}

UCLASS()
class ULightingModifierRain_Level1_Morning_Close: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Weather;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(7,31));
   default ForDaytimeEnd.Set(FClockTime(9,06));

   default bBeInside.Set(false);
   default ForWeather.Set(EWeather::Rain_Level1);
   default bUseCloseShot.Set(true);

   // Modifier Values
   default KeyLight.IntensityPercent = -50.f;
   default KeyLight.ColorReplace = FVector(0.81f, 0.65f, 0.53f);
   default RimLight.IntensityPercent = -40.f;
   default RimLight.ColorReplace = FVector(0.39f, 0.40f, 0.57f);

   default KeyReverseLight.IntensityPercent = -50.f;
   default KeyReverseLight.ColorReplace = FVector(0.81f, 0.65f, 0.53f);
   default RimReverseLight.IntensityPercent = -40.f;
   default RimReverseLight.ColorReplace = FVector(0.39f, 0.40f, 0.57f);

   default KeyLight.MinThreshold = 0.1;
   default RimLight.MinThreshold = 0.1;
   default KeyReverseLight.MinThreshold = 0.1;
   default RimReverseLight.MinThreshold = 0.1;
 

   default GeneralPriority = 2.0f;

   default EyeIntensityFinetuneFactor = 1.f;
}

UCLASS()
class ULightingModifierRain_Level1_Morning_Wide: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Weather;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(7,31));
   default ForDaytimeEnd.Set(FClockTime(9,06));

   default bBeInside.Set(false);
   default ForWeather.Set(EWeather::Rain_Level1);
   default bUseCloseShot.Set(false);

   // Modifier Values
   default KeyLight.IntensityPercent = -50.f;
   default KeyLight.ColorReplace = FVector(0.81f, 0.65f, 0.53f);
   default RimLight.IntensityPercent = -70.f;
   default RimLight.ColorReplace = FVector(0.39f, 0.40f, 0.57f);

   default KeyReverseLight.IntensityPercent = -60.f;
   default KeyReverseLight.ColorReplace = FVector(0.81f, 0.65f, 0.53f);
   default RimReverseLight.IntensityPercent = -70.f;
   default RimReverseLight.ColorReplace = FVector(0.39f, 0.40f, 0.57f);

   default KeyLight.MinThreshold = 0.1;
   default RimLight.MinThreshold = 0.1;
   default KeyReverseLight.MinThreshold = 0.1;
   default RimReverseLight.MinThreshold = 0.1;
 

   default GeneralPriority = 2.0f;

   default EyeIntensityFinetuneFactor = 1.f;
}

UCLASS()
class ULightingModifierRain_Level1_Day_Close: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Weather;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(9,06));
   default ForDaytimeEnd.Set(FClockTime(18,31));

   default bBeInside.Set(false);
   default ForWeather.Set(EWeather::Rain_Level1);
   default bUseCloseShot.Set(true);

   // Modifier Values
   default KeyLight.IntensityPercent = -50.f;
   default KeyLight.ColorReplace = FVector(0.96f, 0.77f, 0.63f);
   default RimLight.IntensityPercent = -40.f;
   default RimLight.ColorReplace = FVector(0.26f, 0.27f, 0.39f);

   default KeyReverseLight.IntensityPercent = -50.f;
   default KeyReverseLight.ColorReplace = FVector(0.96f, 0.77f, 0.63f);
   default RimReverseLight.IntensityPercent = -40.f;
   default RimReverseLight.ColorReplace = FVector(0.26f, 0.27f, 0.39f);

   default KeyLight.MinThreshold = 0.1;
   default RimLight.MinThreshold = 0.1;
   default KeyReverseLight.MinThreshold = 0.1;
   default RimReverseLight.MinThreshold = 0.1;
 

   default GeneralPriority = 2.0f;

   default EyeIntensityFinetuneFactor = 1.f;
}

UCLASS()
class ULightingModifierRain_Level1_Day_Wide: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Weather;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(9,06));
   default ForDaytimeEnd.Set(FClockTime(18,31));

   default bBeInside.Set(false);
   default ForWeather.Set(EWeather::Rain_Level1);
   default bUseCloseShot.Set(false);

   // Modifier Values
   default KeyLight.IntensityPercent = -50.f;
   default KeyLight.ColorReplace = FVector(0.96f, 0.77f, 0.63f);
   default RimLight.IntensityPercent = -70.f;
   default RimLight.ColorReplace = FVector(0.26f, 0.27f, 0.39f);

   default KeyReverseLight.IntensityPercent = -60.f;
   default KeyReverseLight.ColorReplace = FVector(0.96f, 0.77f, 0.63f);
   default RimReverseLight.IntensityPercent = -70.f;
   default RimReverseLight.ColorReplace = FVector(0.26f, 0.27f, 0.39f);

   default KeyLight.MinThreshold = 0.1;
   default RimLight.MinThreshold = 0.1;
   default KeyReverseLight.MinThreshold = 0.1;
   default RimReverseLight.MinThreshold = 0.1;
 

   default GeneralPriority = 2.0f;

   default EyeIntensityFinetuneFactor = 1.f;
}


UCLASS()
class ULightingModifierRain_Level1_Sunset_Close: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Weather;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(18,31));
   default ForDaytimeEnd.Set(FClockTime(19,30));


   default bBeInside.Set(false);
   default ForWeather.Set(EWeather::Rain_Level1);
   default bUseCloseShot.Set(true);

   // Modifier Values
   default KeyLight.IntensityPercent = -45.f;
   default KeyLight.ColorReplace = FVector(0.57f, 0.45f, 0.26f);
   default RimLight.IntensityPercent = -60.f;
   default RimLight.ColorReplace = FVector(0.24f, 0.20f, 0.18f);

   default KeyReverseLight.IntensityPercent = -45.f;
   default KeyReverseLight.ColorReplace = FVector(0.57f, 0.45f, 0.26f);
   default RimReverseLight.IntensityPercent = -60.f;
   default RimReverseLight.ColorReplace = FVector(0.24f, 0.20f, 0.18f);

   default KeyLight.MinThreshold = 0.1;
   default RimLight.MinThreshold = 0.1;
   default KeyReverseLight.MinThreshold = 0.1;
   default RimReverseLight.MinThreshold = 0.1;
 

   default GeneralPriority = 2.0f;

   default EyeIntensityFinetuneFactor = 1.f;
}

UCLASS()
class ULightingModifierRain_Level1_Sunset_Wide: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Weather;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(18,31));
   default ForDaytimeEnd.Set(FClockTime(19,30));


   default bBeInside.Set(false);
   default ForWeather.Set(EWeather::Rain_Level1);
   default bUseCloseShot.Set(false);

   // Modifier Values
   default KeyLight.IntensityPercent = -65.f;
   default KeyLight.ColorReplace = FVector(0.57f, 0.45f, 0.26f);
   default RimLight.IntensityPercent = -85.f;
   default RimLight.ColorReplace = FVector(0.24f, 0.20f, 0.18f);

   default KeyReverseLight.IntensityPercent = -70.f;
   default KeyReverseLight.ColorReplace = FVector(0.57f, 0.45f, 0.26f);
   default RimReverseLight.IntensityPercent = -85.f;
   default RimReverseLight.ColorReplace = FVector(0.24f, 0.20f, 0.18f);

   default KeyLight.MinThreshold = 0.1;
   default RimLight.MinThreshold = 0.1;
   default KeyReverseLight.MinThreshold = 0.1;
   default RimReverseLight.MinThreshold = 0.1;
 

   default GeneralPriority = 2.0f;

   default EyeIntensityFinetuneFactor = 1.f;
}

UCLASS()
class ULightingModifierRain_Level1_GoldenHour_Close: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Weather;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(19,31));
   default ForDaytimeEnd.Set(FClockTime(20,03));


   default bBeInside.Set(false);
   default ForWeather.Set(EWeather::Rain_Level1);
   default bUseCloseShot.Set(true);

   // Modifier Values
   default KeyLight.IntensityPercent = -45.f;
   default KeyLight.ColorReplace = FVector(0.54f, 0.30f, 0.23f);
   default RimLight.IntensityPercent = -60.f;
   default RimLight.ColorReplace = FVector(0.12f, 0.10f, 0.09f);

   default KeyReverseLight.IntensityPercent = -45.f;
   default KeyReverseLight.ColorReplace = FVector(0.54f, 0.30f, 0.23f);
   default RimReverseLight.IntensityPercent = -60.f;
   default RimReverseLight.ColorReplace = FVector(0.12f, 0.10f, 0.09f);

   default KeyLight.MinThreshold = 0.03;
   default RimLight.MinThreshold = 0.03;
   default KeyReverseLight.MinThreshold = 0.03;
   default RimReverseLight.MinThreshold = 0.03;
 

   default GeneralPriority = 2.0f;

   default EyeIntensityFinetuneFactor = 3.f;
}

UCLASS()
class ULightingModifierRain_Level1_GoldenHour_Wide: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Weather;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(19,31));
   default ForDaytimeEnd.Set(FClockTime(20,03));


   default bBeInside.Set(false);
   default ForWeather.Set(EWeather::Rain_Level1);
   default bUseCloseShot.Set(false);

   // Modifier Values
   default KeyLight.IntensityPercent = -50.f;
   default KeyLight.ColorReplace = FVector(0.54f, 0.30f, 0.23f);
   default RimLight.IntensityPercent = -75.f;
   default RimLight.ColorReplace = FVector(0.12f, 0.10f, 0.09f);

   default KeyReverseLight.IntensityPercent = -60.f;
   default KeyReverseLight.ColorReplace = FVector(0.54f, 0.30f, 0.23f);
   default RimReverseLight.IntensityPercent = -75.f;
   default RimReverseLight.ColorReplace = FVector(0.12f, 0.10f, 0.09f);

   default KeyLight.MinThreshold = 0.03;
   default RimLight.MinThreshold = 0.03;
   default KeyReverseLight.MinThreshold = 0.03;
   default RimReverseLight.MinThreshold = 0.03;
 

   default GeneralPriority = 2.0f;

   default EyeIntensityFinetuneFactor = 3.f;
}


UCLASS()
class ULightingModifierRain_Level1_Night_Close: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Weather;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(20,03));
   default ForDaytimeEnd.Set(FClockTime(5,30));


   default bBeInside.Set(false);
   default ForWeather.Set(EWeather::Rain_Level1);
   default bUseCloseShot.Set(true);

   // Modifier Values
   default KeyLight.IntensityPercent = -45.f;
   default KeyLight.ColorReplace = FVector(0.07f, 0.22f, 0.75f);
   default RimLight.IntensityPercent = -60.f;
   default RimLight.ColorReplace = FVector(0.037f, 0.041f, 0.037f);

   default KeyReverseLight.IntensityPercent = -45.f;
   default KeyReverseLight.ColorReplace = FVector(0.07f, 0.22f, 0.75f);
   default RimReverseLight.IntensityPercent = -60.f;
   default RimReverseLight.ColorReplace = FVector(0.037f, 0.041f, 0.037f);

   default KeyLight.MinThreshold = 0.01;
   default RimLight.MinThreshold = 0.01;
   default KeyReverseLight.MinThreshold = 0.01;
   default RimReverseLight.MinThreshold = 0.01;
 

   default GeneralPriority = 2.0f;

   default EyeIntensityFinetuneFactor = 8.f;
}

UCLASS()
class ULightingModifierRain_Level1_Night_Wide: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Weather;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(20,03));
   default ForDaytimeEnd.Set(FClockTime(5,30));


   default bBeInside.Set(false);
   default ForWeather.Set(EWeather::Rain_Level1);
   default bUseCloseShot.Set(false);

   // Modifier Values
   default KeyLight.IntensityPercent = -60.f;
   default KeyLight.ColorReplace = FVector(0.07f, 0.22f, 0.75f);
   default RimLight.IntensityPercent = -75.f;
   default RimLight.ColorReplace = FVector(0.037f, 0.041f, 0.037f);

   default KeyReverseLight.IntensityPercent = -60.f;
   default KeyReverseLight.ColorReplace = FVector(0.07f, 0.22f, 0.75f);
   default RimReverseLight.IntensityPercent = -75.f;
   default RimReverseLight.ColorReplace = FVector(0.037f, 0.041f, 0.037f);

   default KeyLight.MinThreshold = 0.01;
   default RimLight.MinThreshold = 0.01;
   default KeyReverseLight.MinThreshold = 0.01;
   default RimReverseLight.MinThreshold = 0.01;
 

   default GeneralPriority = 2.0f;

   default EyeIntensityFinetuneFactor = 8.f;
}

//______________________________________________________________________________________
//______________________________________________________________________________________
//______________________________________________________________________________________
//______________________________________________________________________________________
//______________________________________________________________________________________

UCLASS()
class ULightingModifierRain_Level2_Dawn_Close: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Weather;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(5,30));
   default ForDaytimeEnd.Set(FClockTime(6,20));

   default bBeInside.Set(false);
   default ForWeather.Set(EWeather::Rain_Level2);
   default bUseCloseShot.Set(true);
   

   // Modifier Values
   default KeyLight.IntensityPercent = -45.f;
   default KeyLight.ColorReplace = FVector(0.3f, 0.4f, 0.5f);
   default RimLight.IntensityPercent = -45.f;
   default RimLight.ColorReplace = FVector(0.06f, 0.07f, 0.15f);

   default KeyReverseLight.IntensityPercent = -45.f;
   default KeyReverseLight.ColorReplace = FVector(0.3f, 0.4f, 0.5f);
   default RimReverseLight.IntensityPercent = -45.f;
   default RimReverseLight.ColorReplace = FVector(0.06f, 0.07f, 0.15f);

   default KeyLight.MinThreshold = 0.01;
   default RimLight.MinThreshold = 0.005;
   default KeyReverseLight.MinThreshold = 0.01;
   default RimReverseLight.MinThreshold = 0.005;

   default DiffuseColorBoost = 2.0f;

   default EyeIntensityFinetuneFactor = 6.f; 

   default GeneralPriority = 2.0f;
}

UCLASS()
class ULightingModifierRain_Level2_Dawn_Wide: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Weather;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(5,30));
   default ForDaytimeEnd.Set(FClockTime(6,20));

   default bBeInside.Set(false);
   default ForWeather.Set(EWeather::Rain_Level2);
   default bUseCloseShot.Set(false);

   // Modifier Values
   default KeyLight.IntensityPercent = -40.f;
   default KeyLight.ColorReplace = FVector(0.3f, 0.4f, 0.5f);
   default RimLight.IntensityPercent = -70.f;
   default RimLight.ColorReplace = FVector(0.06f, 0.07f, 0.15f);

   default KeyReverseLight.IntensityPercent = -40.f;
   default KeyReverseLight.ColorReplace = FVector(0.3f, 0.4f, 0.5f);
   default RimReverseLight.IntensityPercent = -70.f;
   default RimReverseLight.ColorReplace = FVector(0.06f, 0.07f, 0.15f);

   default KeyLight.MinThreshold = 0.01;
   default RimLight.MinThreshold = 0.005;
   default KeyReverseLight.MinThreshold = 0.01;
   default RimReverseLight.MinThreshold = 0.005;

   default DiffuseColorBoost = 2.0f; 

   default EyeIntensityFinetuneFactor = 6.f;

   default GeneralPriority = 2.0f;
}


UCLASS()
class ULightingModifierRain_Level2_Sunrise_Close: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Weather;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(6,20));
   default ForDaytimeEnd.Set(FClockTime(7,30));

   default bBeInside.Set(false);
   default ForWeather.Set(EWeather::Rain_Level2);
   default bUseCloseShot.Set(true);
   

   // Modifier Values
   default KeyLight.IntensityPercent = -45.f;
   default KeyLight.ColorReplace = FVector(0.82f, 0.53f, 0.37f);
   default RimLight.IntensityPercent = -45.f;
   default RimLight.ColorReplace = FVector(0.06f, 0.07f, 0.15f);

   default KeyReverseLight.IntensityPercent = -45.f;
   default KeyReverseLight.ColorReplace = FVector(0.82f, 0.53f, 0.37f);
   default RimReverseLight.IntensityPercent = -45.f;
   default RimReverseLight.ColorReplace = FVector(0.06f, 0.07f, 0.15f);

   default KeyLight.MinThreshold = 0.01;
   default RimLight.MinThreshold = 0.005;
   default KeyReverseLight.MinThreshold = 0.01;
   default RimReverseLight.MinThreshold = 0.005;

   default DiffuseColorBoost = 2.0f;

   default EyeIntensityFinetuneFactor = 1.f; 

   default GeneralPriority = 2.0f;
}

UCLASS()
class ULightingModifierRain_Level2_Sunrise_Wide: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Weather;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(6,20));
   default ForDaytimeEnd.Set(FClockTime(7,30));

   default bBeInside.Set(false);
   default ForWeather.Set(EWeather::Rain_Level2);
   default bUseCloseShot.Set(false);

   // Modifier Values
   default KeyLight.IntensityPercent = -40.f;
   default KeyLight.ColorReplace = FVector(0.82f, 0.53f, 0.37f);
   default RimLight.IntensityPercent = -70.f;
   default RimLight.ColorReplace = FVector(0.06f, 0.07f, 0.15f);

   default KeyReverseLight.IntensityPercent = -40.f;
   default KeyReverseLight.ColorReplace = FVector(0.82f, 0.53f, 0.37f);
   default RimReverseLight.IntensityPercent = -70.f;
   default RimReverseLight.ColorReplace = FVector(0.06f, 0.07f, 0.15f);

   default KeyLight.MinThreshold = 0.01;
   default RimLight.MinThreshold = 0.005;
   default KeyReverseLight.MinThreshold = 0.01;
   default RimReverseLight.MinThreshold = 0.005;

   default DiffuseColorBoost = 2.0f; 

   default EyeIntensityFinetuneFactor = 1.f;

   default GeneralPriority = 2.0f;
}


UCLASS()
class ULightingModifierRain_Level2_Morning_Close: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Weather;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(7,31));
   default ForDaytimeEnd.Set(FClockTime(09,06));

   default bBeInside.Set(false);
   default ForWeather.Set(EWeather::Rain_Level2);
   default bUseCloseShot.Set(true);

   // Modifier Values
   default KeyLight.IntensityPercent = -70.f;
   default KeyLight.ColorReplace = FVector(0.78f, 0.62f, 0.51f);

   default RimLight.IntensityPercent = -70.f;
   default RimLight.ColorReplace = FVector(0.14f, 0.16f, 0.14f);

   default KeyReverseLight.IntensityPercent = -70.f;
   default KeyReverseLight.ColorReplace = FVector(0.78f, 0.62f, 0.51f);

   default RimReverseLight.IntensityPercent = -70.f;
   default RimReverseLight.ColorReplace = FVector(0.14f, 0.16f, 0.14f);

   default KeyLight.MinThreshold = 0.1;
   default RimLight.MinThreshold = 0.1;
   default KeyReverseLight.MinThreshold = 0.1;
   default RimReverseLight.MinThreshold = 0.1;

   default DiffuseColorBoost = 2.0f;
 

   default GeneralPriority = 2.0f;

   default EyeIntensityFinetuneFactor = 1.f;
}

UCLASS()
class ULightingModifierRain_Level2_Morning_Wide: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Weather;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(7,31));
   default ForDaytimeEnd.Set(FClockTime(09,06));

   default bBeInside.Set(false);
   default ForWeather.Set(EWeather::Rain_Level2);
   default bUseCloseShot.Set(false);

   // Modifier Values
   default KeyLight.IntensityPercent = -60.f;
   default KeyLight.ColorReplace = FVector(0.78f, 0.62f, 0.51f);
   default RimLight.IntensityPercent = -75.f;
   default RimLight.ColorReplace = FVector(0.14f, 0.16f, 0.14f);

   default KeyReverseLight.IntensityPercent = -60.f;
   default KeyReverseLight.ColorReplace = FVector(0.78f, 0.62f, 0.51f);
   default RimReverseLight.IntensityPercent = -80.f;
   default RimReverseLight.ColorReplace = FVector(0.14f, 0.16f, 0.14f);

   default KeyLight.MinThreshold = 0.1;
   default RimLight.MinThreshold = 0.1;
   default KeyReverseLight.MinThreshold = 0.1;
   default RimReverseLight.MinThreshold = 0.1;

   default DiffuseColorBoost = 2.0f;

   default EyeIntensityFinetuneFactor = 1.f;
 

   default GeneralPriority = 2.0f;
}

UCLASS()
class ULightingModifierRain_Level2_Day_Close: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Weather;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(9,06));
   default ForDaytimeEnd.Set(FClockTime(18,31));

   default bBeInside.Set(false);
   default ForWeather.Set(EWeather::Rain_Level2);
   default bUseCloseShot.Set(true);

   // Modifier Values
   default KeyLight.IntensityPercent = -70.f;
   default KeyLight.ColorReplace = FVector(0.75f, 0.64f, 0.50f);

   default RimLight.IntensityPercent = -70.f;
   default RimLight.ColorReplace = FVector(0.14f, 0.16f, 0.14f);

   default KeyReverseLight.IntensityPercent = -70.f;
   default KeyReverseLight.ColorReplace = FVector(0.75f, 0.64f, 0.50f);

   default RimReverseLight.IntensityPercent = -70.f;
   default RimReverseLight.ColorReplace = FVector(0.14f, 0.16f, 0.14f);

   default KeyLight.MinThreshold = 0.1;
   default RimLight.MinThreshold = 0.1;
   default KeyReverseLight.MinThreshold = 0.1;
   default RimReverseLight.MinThreshold = 0.1;

   default DiffuseColorBoost = 2.0f;
 

   default GeneralPriority = 2.0f;

   default EyeIntensityFinetuneFactor = 1.2f;
}

UCLASS()
class ULightingModifierRain_Level2_Day_Wide: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Weather;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(9,06));
   default ForDaytimeEnd.Set(FClockTime(18,31));

   default bBeInside.Set(false);
   default ForWeather.Set(EWeather::Rain_Level2);
   default bUseCloseShot.Set(false);

   // Modifier Values
   default KeyLight.IntensityPercent = -75.f;
   default KeyLight.ColorReplace = FVector(0.75f, 0.64f, 0.50f);
   default RimLight.IntensityPercent = -85.f;
   default RimLight.ColorReplace = FVector(0.14f, 0.16f, 0.14f);

   default KeyReverseLight.IntensityPercent = -80.f;
   default KeyReverseLight.ColorReplace = FVector(0.75f, 0.64f, 0.50f);
   default RimReverseLight.IntensityPercent = -85.f;
   default RimReverseLight.ColorReplace = FVector(0.14f, 0.16f, 0.14f);

   default KeyLight.MinThreshold = 0.1;
   default RimLight.MinThreshold = 0.1;
   default KeyReverseLight.MinThreshold = 0.1;
   default RimReverseLight.MinThreshold = 0.1;

   default DiffuseColorBoost = 2.0f;

   default EyeIntensityFinetuneFactor = 1.2f;
 

   default GeneralPriority = 2.0f;
}



UCLASS()
class ULightingModifierRain_Level2_Sunset_Close: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Weather;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(18,31));
   default ForDaytimeEnd.Set(FClockTime(19,30));

   default bBeInside.Set(false);
   default ForWeather.Set(EWeather::Rain_Level2);
   default bUseCloseShot.Set(true);

   // Modifier Values
   default KeyLight.IntensityPercent = -70.f;
   default KeyLight.ColorReplace = FVector(0.71f, 0.56f, 0.33f);
   default RimLight.IntensityPercent = -80.f;
   default RimLight.ColorReplace = FVector(0.36f, 0.31f, 0.28f);

   default KeyReverseLight.IntensityPercent = -75.f;
   default KeyReverseLight.ColorReplace = FVector(0.71f, 0.56f, 0.33f);
   default RimReverseLight.IntensityPercent = -80.f;
   default RimReverseLight.ColorReplace = FVector(0.36f, 0.31f, 0.28f);

   default KeyLight.MinThreshold = 0.01;
   default RimLight.MinThreshold = 0.01;
   default KeyReverseLight.MinThreshold = 0.01;
   default RimReverseLight.MinThreshold = 0.01;

   default DiffuseColorBoost = 2.0f;

   default EyeIntensityFinetuneFactor = 1.4f;
 

   default GeneralPriority = 2.0f;
}

UCLASS()
class ULightingModifierRain_Level2_Sunset_Wide: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Weather;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(18,31));
   default ForDaytimeEnd.Set(FClockTime(19,30));

   default bBeInside.Set(false);
   default ForWeather.Set(EWeather::Rain_Level2);
   default bUseCloseShot.Set(false);

   // Modifier Values
   default KeyLight.IntensityPercent = -80.f;
   default KeyLight.ColorReplace = FVector(0.71f, 0.56f, 0.33f);
   default RimLight.IntensityPercent = -95.f;
   default RimLight.ColorReplace = FVector(0.36f, 0.31f, 0.28f);

   default KeyReverseLight.IntensityPercent = -85.f;
   default KeyReverseLight.ColorReplace = FVector(0.71f, 0.56f, 0.33f);
   default RimReverseLight.IntensityPercent = -95.f;
   default RimReverseLight.ColorReplace = FVector(0.36f, 0.31f, 0.28f);

   default KeyLight.MinThreshold = 0.01;
   default RimLight.MinThreshold = 0.01;
   default KeyReverseLight.MinThreshold = 0.01;
   default RimReverseLight.MinThreshold = 0.01;

   default DiffuseColorBoost = 2.0f;

   default EyeIntensityFinetuneFactor = 1.4f;
 

   default GeneralPriority = 2.0f;
}
//______________________________________________________________________________________

UCLASS()
class ULightingModifierRain_Level2_Night_Close: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Weather;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(19,31));
   default ForDaytimeEnd.Set(FClockTime(5,30));

   default bBeInside.Set(false);
   default ForWeather.Set(EWeather::Rain_Level2);
   default bUseCloseShot.Set(true);

   // Modifier Values
   default KeyLight.IntensityPercent = -45.f;
   default KeyLight.ColorReplace = FVector(0.07f, 0.22f, 0.75f);
   default RimLight.IntensityPercent = -60.f;
   default RimLight.ColorReplace = FVector(0.037f, 0.041f, 0.037f);

   default KeyReverseLight.IntensityPercent = -45.f;
   default KeyReverseLight.ColorReplace = FVector(0.07f, 0.22f, 0.75f);
   default RimReverseLight.IntensityPercent = -60.f;
   default RimReverseLight.ColorReplace = FVector(0.037f, 0.041f, 0.037f);

   default KeyLight.MinThreshold = 0.01;
   default RimLight.MinThreshold = 0.01;
   default KeyReverseLight.MinThreshold = 0.01;
   default RimReverseLight.MinThreshold = 0.01;

   default DiffuseColorBoost = 2.0f;

   default EyeIntensityFinetuneFactor = 8.f;
 

   default GeneralPriority = 2.0f;
}

UCLASS()
class ULightingModifierRain_Level2_Night_Wide: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Weather;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(19,31));
   default ForDaytimeEnd.Set(FClockTime(5,30));

   default bBeInside.Set(false);
   default ForWeather.Set(EWeather::Rain_Level2);
   default bUseCloseShot.Set(false);

   // Modifier Values
   default KeyLight.IntensityPercent = -60.f;
   default KeyLight.ColorReplace = FVector(0.07f, 0.22f, 0.75f);
   default RimLight.IntensityPercent = -85.f;
   default RimLight.ColorReplace = FVector(0.037f, 0.041f, 0.037f);

   default KeyReverseLight.IntensityPercent = -60.f;
   default KeyReverseLight.ColorReplace = FVector(0.07f, 0.22f, 0.75f);
   default RimReverseLight.IntensityPercent = -85.f;
   default RimReverseLight.ColorReplace = FVector(0.037f, 0.041f, 0.037f);

   default KeyLight.MinThreshold = 0.01;
   default RimLight.MinThreshold = 0.01;
   default KeyReverseLight.MinThreshold = 0.01;
   default RimReverseLight.MinThreshold = 0.01;

   default DiffuseColorBoost = 2.0f;

   default EyeIntensityFinetuneFactor = 8.f;
 

   default GeneralPriority = 2.0f;
}

//______________________________________________________________________________________
//______________________________________________________________________________________
//______________________________________________________________________________________
//______________________________________________________________________________________
//______________________________________________________________________________________


UCLASS()
class ULightingModifierRain_Level3_Dawn_Close: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Weather;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(5,30));
   default ForDaytimeEnd.Set(FClockTime(6,20));

   default bBeInside.Set(false);
   default ForWeather.Set(EWeather::Rain_Level3);
   default bUseCloseShot.Set(true);

   // Modifier Values
   default KeyLight.IntensityPercent = -35.f;
   default KeyLight.ColorReplace = FVector(0.3f, 0.4f, 0.5f);
   default RimLight.IntensityPercent = -35.f;
   default RimLight.ColorReplace = FVector(0.053f, 0.059f, 0.053f);

   default KeyReverseLight.IntensityPercent = -35.f;
   default KeyReverseLight.ColorReplace = FVector(0.3f, 0.4f, 0.5f);
   default RimReverseLight.IntensityPercent = -35.f;
   default RimReverseLight.ColorReplace = FVector(0.053f, 0.059f, 0.053f);

   default KeyLight.MinThreshold = 0.01;
   default RimLight.MinThreshold = 0.01;
   default KeyReverseLight.MinThreshold = 0.01;
   default RimReverseLight.MinThreshold = 0.01;

   default DiffuseColorBoost = 2.0f;

   default EyeIntensityFinetuneFactor = 6.f;    

   default GeneralPriority = 2.0f;
}

UCLASS()
class ULightingModifierRain_Level3_Dawn_Wide: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Weather;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(5,30));
   default ForDaytimeEnd.Set(FClockTime(6,20));

   default bBeInside.Set(false);
   default ForWeather.Set(EWeather::Rain_Level3);
   default bUseCloseShot.Set(false);

   // Modifier Values
   default KeyLight.IntensityPercent = -40.f;
   default KeyLight.ColorReplace = FVector(0.3f, 0.4f, 0.5f);
   default RimLight.IntensityPercent = -50.f;
   default RimLight.ColorReplace = FVector(0.034f, 0.039f, 0.034f);

   default KeyReverseLight.IntensityPercent = -40.f;
   default KeyReverseLight.ColorReplace = FVector(0.3f, 0.4f, 0.5f);
   default RimReverseLight.IntensityPercent = -50.f;
   default RimReverseLight.ColorReplace = FVector(0.034f, 0.039f, 0.034f);

   default KeyLight.MinThreshold = 0.01;
   default RimLight.MinThreshold = 0.01;
   default KeyReverseLight.MinThreshold = 0.01;
   default RimReverseLight.MinThreshold = 0.01;

   default DiffuseColorBoost = 2.0f;

   default EyeIntensityFinetuneFactor = 6.f;

   default GeneralPriority = 2.0f;
}

//______________________________________________________________________________________

UCLASS()
class ULightingModifierRain_Level3_Sunrise_Close: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Weather;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(6,20));
   default ForDaytimeEnd.Set(FClockTime(7,31));

   default bBeInside.Set(false);
   default ForWeather.Set(EWeather::Rain_Level3);
   default bUseCloseShot.Set(true);

   // Modifier Values
   default KeyLight.IntensityPercent = -35.f;
   default KeyLight.ColorReplace = FVector(0.3f, 0.4f, 0.5f);
   default RimLight.IntensityPercent = -35.f;
   default RimLight.ColorReplace = FVector(0.14f, 0.16f, 0.14f);

   default KeyReverseLight.IntensityPercent = -35.f;
   default KeyReverseLight.ColorReplace = FVector(0.3f, 0.4f, 0.5f);
   default RimReverseLight.IntensityPercent = -35.f;
   default RimReverseLight.ColorReplace = FVector(0.14f, 0.16f, 0.14f);

   default KeyLight.MinThreshold = 0.1;
   default RimLight.MinThreshold = 0.1;
   default KeyReverseLight.MinThreshold = 0.1;
   default RimReverseLight.MinThreshold = 0.1;

   default DiffuseColorBoost = 2.0f;

   default EyeIntensityFinetuneFactor = 1.f;    

   default GeneralPriority = 2.0f;
}

UCLASS()
class ULightingModifierRain_Level3_Sunrise_Wide: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Weather;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(6,20));
   default ForDaytimeEnd.Set(FClockTime(7,31));

   default bBeInside.Set(false);
   default ForWeather.Set(EWeather::Rain_Level3);
   default bUseCloseShot.Set(false);

   // Modifier Values
   default KeyLight.IntensityPercent = -40.f;
   default KeyLight.ColorReplace = FVector(0.3f, 0.4f, 0.5f);
   default RimLight.IntensityPercent = -25.f;
   default RimLight.ColorReplace = FVector(0.14f, 0.16f, 0.14f);

   default KeyReverseLight.IntensityPercent = -40.f;
   default KeyReverseLight.ColorReplace = FVector(0.3f, 0.4f, 0.5f);
   default RimReverseLight.IntensityPercent = -25.f;
   default RimReverseLight.ColorReplace = FVector(0.14f, 0.16f, 0.14f);

   default KeyLight.MinThreshold = 0.1;
   default RimLight.MinThreshold = 0.1;
   default KeyReverseLight.MinThreshold = 0.1;
   default RimReverseLight.MinThreshold = 0.1;

   default DiffuseColorBoost = 2.0f;

   default EyeIntensityFinetuneFactor = 1.f;

   default GeneralPriority = 2.0f;
}

//______________________________________________________________________________________

UCLASS()
class ULightingModifierRain_Level3_Day_Close: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Weather;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(7,31));
   default ForDaytimeEnd.Set(FClockTime(18,31));

   default bBeInside.Set(false);
   default ForWeather.Set(EWeather::Rain_Level3);
   default bUseCloseShot.Set(true);
   

   // Modifier Values
   default KeyLight.IntensityPercent = -80.f;
   default KeyLight.ColorReplace = FVector(0.57f, 0.45f, 0.37f);
   default RimLight.IntensityPercent = -70.f;
   default RimLight.ColorReplace = FVector(0.14f, 0.16f, 0.14f);

   default KeyReverseLight.IntensityPercent = -80.f;
   default KeyReverseLight.ColorReplace = FVector(0.57f, 0.45f, 0.37f);
   default RimReverseLight.IntensityPercent = -70.f;
   default RimReverseLight.ColorReplace = FVector(0.14f, 0.16f, 0.14f);

   default KeyLight.MinThreshold = 0.1;
   default RimLight.MinThreshold = 0.1;
   default KeyReverseLight.MinThreshold = 0.1;
   default RimReverseLight.MinThreshold = 0.1;

   default DiffuseColorBoost = 2.0f;

   default EyeIntensityFinetuneFactor = 2.f; 

   default GeneralPriority = 2.0f;
}

UCLASS()
class ULightingModifierRain_Level3_Day_Wide: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Weather;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(7,31));
   default ForDaytimeEnd.Set(FClockTime(18,31));

   default bBeInside.Set(false);
   default ForWeather.Set(EWeather::Rain_Level3);
   default bUseCloseShot.Set(false);
   

   // Modifier Values
   default KeyLight.IntensityPercent = -80.f;
   default KeyLight.ColorReplace = FVector(0.57f, 0.45f, 0.37f);
   default RimLight.IntensityPercent = -85.f;
   default RimLight.ColorReplace = FVector(0.14f, 0.16f, 0.14f);

   default KeyReverseLight.IntensityPercent = -80.f;
   default KeyReverseLight.ColorReplace = FVector(0.57f, 0.45f, 0.37f);
   default RimReverseLight.IntensityPercent = -90.f;
   default RimReverseLight.ColorReplace = FVector(0.14f, 0.16f, 0.14f);

   default KeyLight.MinThreshold = 0.1;
   default RimLight.MinThreshold = 0.1;
   default KeyReverseLight.MinThreshold = 0.1;
   default RimReverseLight.MinThreshold = 0.1;

   default DiffuseColorBoost = 2.0f;

   default EyeIntensityFinetuneFactor = 2.f; 

   default GeneralPriority = 2.0f;
}

//______________________________________________________________________________________

UCLASS()
class ULightingModifierRain_Level3_Sunset_Close: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Weather;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(18,31));
   default ForDaytimeEnd.Set(FClockTime(19,30));

   default bBeInside.Set(false);
   default ForWeather.Set(EWeather::Rain_Level3);
   default bUseCloseShot.Set(true);

   // Modifier Values
   default KeyLight.IntensityPercent = -80.f;
   default KeyLight.ColorReplace = FVector(0.71f, 0.56f, 0.33f);
   default RimLight.IntensityPercent = -90.f;
   default RimLight.ColorReplace = FVector(0.36f, 0.31f, 0.28f);

   default KeyReverseLight.IntensityPercent = -85.f;
   default KeyReverseLight.ColorReplace = FVector(0.71f, 0.56f, 0.33f);
   default RimReverseLight.IntensityPercent = -90.f;
   default RimReverseLight.ColorReplace = FVector(0.36f, 0.31f, 0.28f);

   default KeyLight.MinThreshold = 0.1;
   default RimLight.MinThreshold = 0.1;
   default KeyReverseLight.MinThreshold = 0.1;
   default RimReverseLight.MinThreshold = 0.1;

   default DiffuseColorBoost = 2.0f;

   default EyeIntensityFinetuneFactor = 3.f;  

   default GeneralPriority = 2.0f;
}

UCLASS()
class ULightingModifierRain_Level3_Sunset_Wide: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Weather;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(18,31));
   default ForDaytimeEnd.Set(FClockTime(19,30));

   default bBeInside.Set(false);
   default ForWeather.Set(EWeather::Rain_Level3);
   default bUseCloseShot.Set(false);

   // Modifier Values
   default KeyLight.IntensityPercent = -86.f;
   default KeyLight.ColorReplace = FVector(0.71f, 0.56f, 0.33f);
   default RimLight.IntensityPercent = -95.f;
   default RimLight.ColorReplace = FVector(0.36f, 0.31f, 0.28f);

   default KeyReverseLight.IntensityPercent = -90.f;
   default KeyReverseLight.ColorReplace = FVector(0.71f, 0.56f, 0.33f);
   default RimReverseLight.IntensityPercent = -95.f;
   default RimReverseLight.ColorReplace = FVector(0.36f, 0.31f, 0.28f);

   default KeyLight.MinThreshold = 0.1;
   default RimLight.MinThreshold = 0.1;
   default KeyReverseLight.MinThreshold = 0.1;
   default RimReverseLight.MinThreshold = 0.1;

   default DiffuseColorBoost = 2.0f;

   default EyeIntensityFinetuneFactor = 3.f;  

   default GeneralPriority = 2.0f;
}

//______________________________________________________________________________________

UCLASS()
class ULightingModifierRain_Level3_Night_Close: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Weather;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(19,31));
   default ForDaytimeEnd.Set(FClockTime(5,30));

   default bBeInside.Set(false);
   default ForWeather.Set(EWeather::Rain_Level3);
   default bUseCloseShot.Set(true);

   // Modifier Values
   default KeyLight.IntensityPercent = -45.f;
   default KeyLight.ColorReplace = FVector(0.07f, 0.22f, 0.75f);
   default RimLight.IntensityPercent = -60.f;
   default RimLight.ColorReplace = FVector(0.037f, 0.041f, 0.037f);

   default KeyReverseLight.IntensityPercent = -45.f;
   default KeyReverseLight.ColorReplace = FVector(0.07f, 0.22f, 0.75f);
   default RimReverseLight.IntensityPercent = -60.f;
   default RimReverseLight.ColorReplace = FVector(0.037f, 0.041f, 0.037f);

   default KeyLight.MinThreshold = 0.01;
   default RimLight.MinThreshold = 0.01;
   default KeyReverseLight.MinThreshold = 0.01;
   default RimReverseLight.MinThreshold = 0.01;

   default DiffuseColorBoost = 2.0f;

   default EyeIntensityFinetuneFactor = 9.f;  

   default GeneralPriority = 2.0f;
}

UCLASS()
class ULightingModifierRain_Level3_Night_Wide: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Weather;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(19,31));
   default ForDaytimeEnd.Set(FClockTime(5,30));

   default bBeInside.Set(false);
   default ForWeather.Set(EWeather::Rain_Level3);
   default bUseCloseShot.Set(false);

   // Modifier Values
   default KeyLight.IntensityPercent = -60.f;
   default KeyLight.ColorReplace = FVector(0.07f, 0.22f, 0.75f);
   default RimLight.IntensityPercent = -85.f;
   default RimLight.ColorReplace = FVector(0.037f, 0.041f, 0.037f);

   default KeyReverseLight.IntensityPercent = -60.f;
   default KeyReverseLight.ColorReplace = FVector(0.07f, 0.22f, 0.75f);
   default RimReverseLight.IntensityPercent = -85.f;
   default RimReverseLight.ColorReplace = FVector(0.037f, 0.041f, 0.037f);

   default KeyLight.MinThreshold = 0.01;
   default RimLight.MinThreshold = 0.01;
   default KeyReverseLight.MinThreshold = 0.01;
   default RimReverseLight.MinThreshold = 0.01;

   default DiffuseColorBoost = 2.0f;

   default EyeIntensityFinetuneFactor = 9.f;  

   default GeneralPriority = 2.0f;
}
//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------------------------------------------



//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------------------------------------------
// Fog_______________________________________________________________________________________________________________________________

// UCLASS()
// class ULightingModifierFog_Dawn_Close : ULightingModifierConditional
// {
//    default ModifierType = ELightingModifierType::Fog;

//    // Conditions
//    default ForDaytimeStart.Set(FClockTime(5,53));
//    default ForDaytimeEnd.Set(FClockTime(7,00));

//    default MinFogLevel.Set(3.f);
//    default MaxFogLevel.Set(10.f);

//    default bUseCloseShot.Set(true);

//    // Modifier Values
//    default KeyLight.IntensityPercent = -60.f;
//    default RimLight.IntensityPercent = -70.f;
//    default KeyReverseLight.IntensityPercent = -60.f;
//    default RimReverseLight.IntensityPercent = -70.f;

//    default KeyLight.MinThreshold = 0.01;
//    default RimLight.MinThreshold = 0.01;
//    default KeyReverseLight.MinThreshold = 0.01;
//    default RimReverseLight.MinThreshold = 0.01;
    

//    default GeneralPriority = 4.0f;
   
// }

// UCLASS()
// class ULightingModifierFog_Dawn_Wide : ULightingModifierConditional
// {
//    default ModifierType = ELightingModifierType::Fog;

//    // Conditions
//    default ForDaytimeStart.Set(FClockTime(5,53));
//    default ForDaytimeEnd.Set(FClockTime(7,00));

//    default MinFogLevel.Set(3.f);
//    default MaxFogLevel.Set(10.f);

//    default bUseCloseShot.Set(false);

//    // Modifier Values
//    default KeyLight.IntensityPercent = -50.f;
//    default RimLight.IntensityPercent = -75.f;
//    default KeyReverseLight.IntensityPercent = -50.f;
//    default RimReverseLight.IntensityPercent = -75.f;

//    default KeyLight.MinThreshold = 0.01;
//    default RimLight.MinThreshold = 0.01;
//    default KeyReverseLight.MinThreshold = 0.01;
//    default RimReverseLight.MinThreshold = 0.01;
  

//    default GeneralPriority = 4.0f;
// }

// UCLASS()
// class ULightingModifierFog_Day_Close : ULightingModifierConditional
// {
//    default ModifierType = ELightingModifierType::Fog;

//    // Conditions
//    default ForDaytimeStart.Set(FClockTime(7,01));
//    default ForDaytimeEnd.Set(FClockTime(15,29));

//    default MinFogLevel.Set(3.f);
//    default MaxFogLevel.Set(10.f);

//    // default bBeInside.Set(false);
//    default bUseCloseShot.Set(true);

//    // Modifier Values
//    default KeyLight.IntensityPercent = -55.f;
//    default RimLight.IntensityPercent = -65.f;
//    default KeyReverseLight.IntensityPercent = -55.f;   
//    default RimReverseLight.IntensityPercent = -65.f;

//    default KeyLight.MinThreshold = 0.03;
//    default RimLight.MinThreshold = 0.03;
//    default KeyReverseLight.MinThreshold = 0.03;
//    default RimReverseLight.MinThreshold = 0.03;
    

//    default GeneralPriority = 4.0f;
// }

// UCLASS()
// class ULightingModifierFog_Day_Wide : ULightingModifierConditional
// {
//    default ModifierType = ELightingModifierType::Fog;

//    // Conditions
//    default ForDaytimeStart.Set(FClockTime(7,01));
//    default ForDaytimeEnd.Set(FClockTime(15,29));

//    default MinFogLevel.Set(3.f);
//    default MaxFogLevel.Set(10.f);

//    // default bBeInside.Set(false);
//    default bUseCloseShot.Set(false);

//    // Modifier Values
//    default KeyLight.IntensityPercent = -55.f;
//    default RimLight.IntensityPercent = -65.f;
//    default KeyReverseLight.IntensityPercent = -55.f;   
//    default RimReverseLight.IntensityPercent = -65.f;

//    default KeyLight.MinThreshold = 0.03;
//    default RimLight.MinThreshold = 0.03;
//    default KeyReverseLight.MinThreshold = 0.03;
//    default RimReverseLight.MinThreshold = 0.03;
 

//    default GeneralPriority = 4.0f;
// }

// UCLASS()
// class ULightingModifierFog_Evening_Close : ULightingModifierConditional
// {
//    default ModifierType = ELightingModifierType::Fog;

//    // Conditions
//    default ForDaytimeStart.Set(FClockTime(15,30));
//    default ForDaytimeEnd.Set(FClockTime(17,15));

//    default MinFogLevel.Set(3.f);
//    default MaxFogLevel.Set(10.f);

//    // default bBeInside.Set(false);
//    default bUseCloseShot.Set(true);

//    // Modifier Values
//    default KeyLight.IntensityPercent = -85.f;
//    default RimLight.IntensityPercent = -85.f;
//    default KeyReverseLight.IntensityPercent = -85.f;   
//    default RimReverseLight.IntensityPercent = -85.f;

//    default KeyLight.MinThreshold = 0.01;
//    default RimLight.MinThreshold = 0.01;
//    default KeyReverseLight.MinThreshold = 0.01;
//    default RimReverseLight.MinThreshold = 0.01;
 

//    default GeneralPriority = 4.0f;
// }

// UCLASS()
// class ULightingModifierFog_Evening_Wide : ULightingModifierConditional
// {
//    default ModifierType = ELightingModifierType::Fog;

//    // Conditions
//    default ForDaytimeStart.Set(FClockTime(15,30));
//    default ForDaytimeEnd.Set(FClockTime(17,15));

//    default MinFogLevel.Set(3.f);
//    default MaxFogLevel.Set(10.f);

//    // default bBeInside.Set(false);
//    default bUseCloseShot.Set(false);

//    // Modifier Values
//    default KeyLight.IntensityPercent = -85.f;
//    default RimLight.IntensityPercent = -85.f;
//    default KeyReverseLight.IntensityPercent = -85.f;   
//    default RimReverseLight.IntensityPercent = -85.f;

//    default KeyLight.MinThreshold = 0.01;
//    default RimLight.MinThreshold = 0.01;
//    default KeyReverseLight.MinThreshold = 0.01;
//    default RimReverseLight.MinThreshold = 0.01;
 

//    default GeneralPriority = 4.0f;
// }

// UCLASS()
// class ULightingModifierFog_Night_Close : ULightingModifierConditional
// {
//    default ModifierType = ELightingModifierType::Fog;

//    // Conditions
//    default ForDaytimeStart.Set(FClockTime(17,16));
//    default ForDaytimeEnd.Set(FClockTime(05,52));

//    default MinFogLevel.Set(3.f);
//    default MaxFogLevel.Set(10.f);

//    // default bBeInside.Set(false);
//    default bUseCloseShot.Set(true);

//    // Modifier Values
//    default KeyLight.IntensityPercent = -35.f;  
//    default RimLight.IntensityPercent = -35.f; 
//    default KeyReverseLight.IntensityPercent = -35.f;   
//    default RimReverseLight.IntensityPercent = -35.f;
   

//    default KeyLight.MinThreshold = 0.001;
//    default RimLight.MinThreshold = 0.001;
//    default KeyReverseLight.MinThreshold = 0.001;
//    default RimReverseLight.MinThreshold = 0.001;
 

//    default GeneralPriority = 4.0f;
// }

// UCLASS()
// class ULightingModifierFog_Night_Wide : ULightingModifierConditional
// {
//    default ModifierType = ELightingModifierType::Fog;

//    // Conditions
//    default ForDaytimeStart.Set(FClockTime(17,16));
//    default ForDaytimeEnd.Set(FClockTime(05,52));

//    default MinFogLevel.Set(3.f);
//    default MaxFogLevel.Set(10.f);

//    // default bBeInside.Set(false);
//    default bUseCloseShot.Set(false);

//    // Modifier Values
//    default KeyLight.IntensityPercent = -35.f;   
//    default RimLight.IntensityPercent = -35.f; 
//    default KeyReverseLight.IntensityPercent = -35.f;   
//    default RimReverseLight.IntensityPercent = -35.f;
   

//    default KeyLight.MinThreshold = 0.001;
//    default RimLight.MinThreshold = 0.001;
//    default KeyReverseLight.MinThreshold = 0.001;
//    default RimReverseLight.MinThreshold = 0.001;
 

//    default GeneralPriority = 4.0f;
// }

//______________________________________________________________________________________
//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------------------------------------------

//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------------------------------------------
// UniqueArea_______________________________________________________________________________________________________________________________

UCLASS()
class ULightingModifierInSwampCamp_Night : ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::UniqueArea;

   default RequiredOnAnyParticipantTags.AddTag(GameplayTag::Conversation_InSwampCamp);   

   // Conditions

   default ForDaytimeStart.Set(FClockTime(20,03));
   default ForDaytimeEnd.Set(FClockTime(5,49));
   // default bBeInside.Set(false);
   // default bUseCloseShot.Set(true);
   

   // Modifier Values
   default KeyLight.IntensityPercent = -40.f;
   default RimLight.IntensityPercent = -40.f;
   default KeyReverseLight.IntensityPercent = -40.f;
   default RimReverseLight.IntensityPercent = -40.f;

   default KeyLight.MinThreshold = 0.008;
   default RimLight.MinThreshold = 0.008;
   default KeyReverseLight.MinThreshold = 0.008;
   default RimReverseLight.MinThreshold = 0.008;

   default GeneralPriority = 8.0f;

   default EyeIntensityFinetuneFactor = 1.5f; 
   
}

UCLASS()
class ULightingModifierInSwampCamp_MagicHour : ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::UniqueArea;

   default RequiredOnAnyParticipantTags.AddTag(GameplayTag::Conversation_InSwampCamp);
 

   // Conditions

   default ForDaytimeStart.Set(FClockTime(05,49));
   default ForDaytimeEnd.Set(FClockTime(06,21));
   // default bBeInside.Set(false);
   // default bUseCloseShot.Set(true);

   // Modifier Values
   default KeyLight.IntensityPercent = -55.f;
   default RimLight.IntensityPercent = -55.f;
   default KeyReverseLight.IntensityPercent = -55.f;
   default RimReverseLight.IntensityPercent = -55.f;

   default KeyLight.MinThreshold = 0.015;
   default RimLight.MinThreshold = 0.01;
   default KeyReverseLight.MinThreshold = 0.01;
   default RimReverseLight.MinThreshold = 0.01;

   default GeneralPriority = 8.0f;

   default EyeIntensityFinetuneFactor = 3.f; 
   
}

UCLASS()
class ULightingModifierInSwampCamp_Sunrise : ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::UniqueArea;

   default RequiredOnAnyParticipantTags.AddTag(GameplayTag::Conversation_InSwampCamp);
   default bBeInShadow.Set(true);

   // Conditions

   default ForDaytimeStart.Set(FClockTime(6,21));
   default ForDaytimeEnd.Set(FClockTime(7,31));
   // default bBeInside.Set(false);
   // default bUseCloseShot.Set(true);

   // Modifier Values
   default KeyLight.IntensityPercent = -40.f;
   default RimLight.IntensityPercent = -40.f;
   default KeyReverseLight.IntensityPercent = -40.f;
   default RimReverseLight.IntensityPercent = -40.f;

   default KeyLight.MinThreshold = 0.015;
   default RimLight.MinThreshold = 0.015;
   default KeyReverseLight.MinThreshold = 0.015;
   default RimReverseLight.MinThreshold = 0.015;

   default GeneralPriority = 8.0f;

   default EyeIntensityFinetuneFactor = 3.f; 
   
}

UCLASS()
class ULightingModifierInSwampCamp_Morning : ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::UniqueArea;

   default RequiredOnAnyParticipantTags.AddTag(GameplayTag::Conversation_InSwampCamp);
   default bBeInShadow.Set(true);

   // Conditions

   default ForDaytimeStart.Set(FClockTime(7,31));
   default ForDaytimeEnd.Set(FClockTime(9,07));
   // default bBeInside.Set(false);
   // default bUseCloseShot.Set(true);

   // Modifier Values
   default KeyLight.IntensityPercent = -40.f;
   default RimLight.IntensityPercent = -40.f;
   default KeyReverseLight.IntensityPercent = -40.f;
   default RimReverseLight.IntensityPercent = -40.f;

   default KeyLight.MinThreshold = 0.025;
   default RimLight.MinThreshold = 0.015;
   default KeyReverseLight.MinThreshold = 0.025;
   default RimReverseLight.MinThreshold = 0.015;

   default GeneralPriority = 8.0f;

   default EyeIntensityFinetuneFactor = 3.f; 
   
}

UCLASS()
class ULightingModifierInSwampCamp_Day : ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::UniqueArea;

   default RequiredOnAnyParticipantTags.AddTag(GameplayTag::Conversation_InSwampCamp);
   default bBeInShadow.Set(true);

   // Conditions

   default ForDaytimeStart.Set(FClockTime(9,07));
   default ForDaytimeEnd.Set(FClockTime(17,01));
   // default bBeInside.Set(false);
   // default bUseCloseShot.Set(true);

   // Modifier Values
   default KeyLight.IntensityPercent = -40.f;
   default RimLight.IntensityPercent = -40.f;
   default KeyReverseLight.IntensityPercent = -40.f;
   default RimReverseLight.IntensityPercent = -40.f;

   default KeyLight.MinThreshold = 0.06;
   default RimLight.MinThreshold = 0.03;
   default KeyReverseLight.MinThreshold = 0.05;
   default RimReverseLight.MinThreshold = 0.03;

   default GeneralPriority = 8.0f;

   default EyeIntensityFinetuneFactor = 3.f; 
   
}

UCLASS()
class ULightingModifierInSwampCamp_Evening : ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::UniqueArea;

   default RequiredOnAnyParticipantTags.AddTag(GameplayTag::Conversation_InSwampCamp);
   default bBeInShadow.Set(true);

   // Conditions

   default ForDaytimeStart.Set(FClockTime(17,01));
   default ForDaytimeEnd.Set(FClockTime(19,01));
   // default bBeInside.Set(false);
   // default bUseCloseShot.Set(true);

   // Modifier Values
   default KeyLight.IntensityPercent = -40.f;
   default RimLight.IntensityPercent = -40.f;
   default KeyReverseLight.IntensityPercent = -40.f;
   default RimReverseLight.IntensityPercent = -40.f;

   default KeyLight.MinThreshold = 0.02;
   default RimLight.MinThreshold = 0.015;
   default KeyReverseLight.MinThreshold = 0.02;
   default RimReverseLight.MinThreshold = 0.015;

   default GeneralPriority = 8.0f;

   default EyeIntensityFinetuneFactor = 3.f; 
   
}

UCLASS()
class ULightingModifierInSwampCamp_Twilight : ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::UniqueArea;

   default RequiredOnAnyParticipantTags.AddTag(GameplayTag::Conversation_InSwampCamp);
   default bBeInShadow.Set(true);

   // Conditions

   default ForDaytimeStart.Set(FClockTime(19,01));
   default ForDaytimeEnd.Set(FClockTime(19,30));
   // default bBeInside.Set(false);
   // default bUseCloseShot.Set(true);

   // Modifier Values
   default KeyLight.IntensityPercent = -40.f;
   default RimLight.IntensityPercent = -40.f;
   default KeyReverseLight.IntensityPercent = -40.f;
   default RimReverseLight.IntensityPercent = -40.f;

   default KeyLight.MinThreshold = 0.02;
   default RimLight.MinThreshold = 0.01;
   default KeyReverseLight.MinThreshold = 0.015;
   default RimReverseLight.MinThreshold = 0.01;

   default GeneralPriority = 8.0f;

   default EyeIntensityFinetuneFactor = 3.f; 
   
}

UCLASS()
class ULightingModifierInSwampCamp_GoldenHour : ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::UniqueArea;

   default RequiredOnAnyParticipantTags.AddTag(GameplayTag::Conversation_InSwampCamp);
 

   // Conditions

   default ForDaytimeStart.Set(FClockTime(19,30));
   default ForDaytimeEnd.Set(FClockTime(20,03));
   // default bBeInside.Set(false);
   // default bUseCloseShot.Set(true);

   // Modifier Values
   default KeyLight.IntensityPercent = -55.f;
   default RimLight.IntensityPercent = -55.f;
   default KeyReverseLight.IntensityPercent = -55.f;
   default RimReverseLight.IntensityPercent = -55.f;

   default KeyLight.MinThreshold = 0.015;
   default RimLight.MinThreshold = 0.01;
   default KeyReverseLight.MinThreshold = 0.01;
   default RimReverseLight.MinThreshold = 0.01;

   default GeneralPriority = 8.0f;

   default EyeIntensityFinetuneFactor = 3.f; 
   
}


//______________________________________________________________________________________
//______________________________________________________________________________________
//______________________________________________________________________________________
//______________________________________________________________________________________



UCLASS()
class ULightingModifierInSwampCamp_Sunrise_OutShadow : ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::UniqueArea;

   default RequiredOnAnyParticipantTags.AddTag(GameplayTag::Conversation_InSwampCamp);
   default bBeInShadow.Set(false);

   // Conditions

   default ForDaytimeStart.Set(FClockTime(6,21));
   default ForDaytimeEnd.Set(FClockTime(7,31));
   // default bBeInside.Set(false);
   // default bUseCloseShot.Set(true);

   // Modifier Values
   default KeyLight.IntensityPercent = -25.f;
   default RimLight.IntensityPercent = -35.f;
   default KeyReverseLight.IntensityPercent = -25.f;
   default RimReverseLight.IntensityPercent = -35.f;

   default KeyLight.MinThreshold = 0.025;
   default RimLight.MinThreshold = 0.025;
   default KeyReverseLight.MinThreshold = 0.025;
   default RimReverseLight.MinThreshold = 0.025;

   default GeneralPriority = 8.0f;

   default EyeIntensityFinetuneFactor = 1.5f; 
   
}

UCLASS()
class ULightingModifierInSwampCamp_Morning_OutShadow : ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::UniqueArea;

   default RequiredOnAnyParticipantTags.AddTag(GameplayTag::Conversation_InSwampCamp);
   default bBeInShadow.Set(false);

   // Conditions

   default ForDaytimeStart.Set(FClockTime(7,31));
   default ForDaytimeEnd.Set(FClockTime(9,07));
   // default bBeInside.Set(false);
   // default bUseCloseShot.Set(true);

   // Modifier Values
   default KeyLight.IntensityPercent = -25.f;
   default RimLight.IntensityPercent = -25.f;
   default KeyReverseLight.IntensityPercent = -25.f;
   default RimReverseLight.IntensityPercent = -25.f;

   default KeyLight.MinThreshold = 0.1;
   default RimLight.MinThreshold = 0.1;
   default KeyReverseLight.MinThreshold = 0.1;
   default RimReverseLight.MinThreshold = 0.1;

   default GeneralPriority = 8.0f;

   default EyeIntensityFinetuneFactor = 1.5f; 
   
}

UCLASS()
class ULightingModifierInSwampCamp_Day_OutShadow : ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::UniqueArea;

   default RequiredOnAnyParticipantTags.AddTag(GameplayTag::Conversation_InSwampCamp);
   default bBeInShadow.Set(false);

   // Conditions

   default ForDaytimeStart.Set(FClockTime(9,07));
   default ForDaytimeEnd.Set(FClockTime(17,01));
   // default bBeInside.Set(false);
   // default bUseCloseShot.Set(true);

   // Modifier Values
   default KeyLight.IntensityPercent = -25.f;
   default RimLight.IntensityPercent = -25.f;
   default KeyReverseLight.IntensityPercent = -25.f;
   default RimReverseLight.IntensityPercent = -25.f;

   default KeyLight.MinThreshold = 0.1;
   default RimLight.MinThreshold = 0.1;
   default KeyReverseLight.MinThreshold = 0.1;
   default RimReverseLight.MinThreshold = 0.1;

   default GeneralPriority = 8.0f;

   default EyeIntensityFinetuneFactor = 1.5f; 
   
}

UCLASS()
class ULightingModifierInSwampCamp_Evening_OutShadow : ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::UniqueArea;

   default RequiredOnAnyParticipantTags.AddTag(GameplayTag::Conversation_InSwampCamp);
   default bBeInShadow.Set(false);

   // Conditions

   default ForDaytimeStart.Set(FClockTime(17,01));
   default ForDaytimeEnd.Set(FClockTime(19,01));
   // default bBeInside.Set(false);
   // default bUseCloseShot.Set(true);

   // Modifier Values
   default KeyLight.IntensityPercent = -35.f;
   default RimLight.IntensityPercent = -35.f;
   default KeyReverseLight.IntensityPercent = -35.f;
   default RimReverseLight.IntensityPercent = -35.f;

   default KeyLight.MinThreshold = 0.1;
   default RimLight.MinThreshold = 0.1;
   default KeyReverseLight.MinThreshold = 0.1;
   default RimReverseLight.MinThreshold = 0.1;

   default GeneralPriority = 8.0f;

   default EyeIntensityFinetuneFactor = 1.5f;  
   
}

UCLASS()
class ULightingModifierInSwampCamp_Twilight_OutShadow : ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::UniqueArea;

   default RequiredOnAnyParticipantTags.AddTag(GameplayTag::Conversation_InSwampCamp);
   default bBeInShadow.Set(false);

   // Conditions

   default ForDaytimeStart.Set(FClockTime(19,01));
   default ForDaytimeEnd.Set(FClockTime(19,30));
   // default bBeInside.Set(false);
   // default bUseCloseShot.Set(true);

   // Modifier Values
   default KeyLight.IntensityPercent = -25.f;
   default RimLight.IntensityPercent = -35.f;
   default KeyReverseLight.IntensityPercent = -25.f;
   default RimReverseLight.IntensityPercent = -35.f;

   default KeyLight.MinThreshold = 0.025;
   default RimLight.MinThreshold = 0.025;
   default KeyReverseLight.MinThreshold = 0.025;
   default RimReverseLight.MinThreshold = 0.025;

   default GeneralPriority = 8.0f;

   default EyeIntensityFinetuneFactor = 1.5f; 
   
}

//______________________________________________________________________________________
//______________________________________________________________________________________
//______________________________________________________________________________________
//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------------------------------------------




//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------------------------------------------
// Skin Tone_______________________________________________________________________________________________________________________________

UCLASS()
class ULightingModifierPaleSkin_1 : ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::SkinTone;

   // Conditions
   default ForSkinType.Set(1);

   default KeyLight.IntensityPercent = -2.f;
   default RimLight.IntensityPercent = -2.f;
   default KeyReverseLight.IntensityPercent = -2.f;
   default RimReverseLight.IntensityPercent = -2.f;

   default KeyLight.MinThreshold = 0.005;
   default RimLight.MinThreshold = 0.005;
   default KeyReverseLight.MinThreshold = 0.005;
   default RimReverseLight.MinThreshold = 0.005;

   
}
//______________________________________________________________________________________


UCLASS()
class ULightingModifierFairSkin_2 : ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::SkinTone;

   // Conditions
   default ForSkinType.Set(2);

   default KeyLight.IntensityPercent = -1.5f;
   default RimLight.IntensityPercent = -1.5f;
   default KeyReverseLight.IntensityPercent = -1.5f;
   default RimReverseLight.IntensityPercent = -1.5f;

   default KeyLight.MinThreshold = 0.005;
   default RimLight.MinThreshold = 0.005;
   default KeyReverseLight.MinThreshold = 0.005;
   default RimReverseLight.MinThreshold = 0.005;
}
//______________________________________________________________________________________


UCLASS()
class ULightingModifierMediumSkin_3 : ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::SkinTone;

   // Conditions
   default ForSkinType.Set(3);

   default KeyLight.IntensityPercent = -1.1f;
   default RimLight.IntensityPercent = -1.1f;
   default KeyReverseLight.IntensityPercent = -1.1f;
   default RimReverseLight.IntensityPercent = -1.1f;

   default KeyLight.MinThreshold = 0.005;
   default RimLight.MinThreshold = 0.005;
   default KeyReverseLight.MinThreshold = 0.005;
   default RimReverseLight.MinThreshold = 0.005;

   
}
//______________________________________________________________________________________


UCLASS()
class ULightingModifierOliveSkin_4 : ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::SkinTone;

   // Conditions  
   default ForSkinType.Set(4);
}
//______________________________________________________________________________________


UCLASS()
class ULightingModifierLightBrownSkin_5 : ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::SkinTone;

   // Conditions
   default ForSkinType.Set(5);

   default KeyLight.IntensityPercent = 1.5f;
   default RimLight.IntensityPercent = 1.5f;
   default KeyReverseLight.IntensityPercent = 1.5f;
   default RimReverseLight.IntensityPercent = 1.5f;

   default KeyLight.MinThreshold = 0.005;
   default RimLight.MinThreshold = 0.005;
   default KeyReverseLight.MinThreshold = 0.005;
   default RimReverseLight.MinThreshold = 0.005;
}
//______________________________________________________________________________________


UCLASS()
class ULightingModifierDarkBrownSkin_6 : ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::SkinTone;

   // Conditions
   default ForSkinType.Set(6);

   default KeyLight.IntensityPercent = 3.0f;
   default RimLight.IntensityPercent = 3.0f;
   default KeyReverseLight.IntensityPercent = 3.0f;
   default RimReverseLight.IntensityPercent = 3.0f;

   default KeyLight.MinThreshold = 0.005;
   default RimLight.MinThreshold = 0.005;
   default KeyReverseLight.MinThreshold = 0.005;
   default RimReverseLight.MinThreshold = 0.005;
}

//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------------------------------------------

//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//Shadow_________________________________________________________________________________________________

UCLASS()
class ULightingModifierInShadowSpeaker_Dawn_Close: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Shadow;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(6,20));
   default ForDaytimeEnd.Set(FClockTime(7,31));

   default bBeInShadow.Set(true);
   default bSpeakerExklusive.Set(true);
   default bUseCloseShot.Set(true);


   default KeyLight.IntensityPercent = -88.f;
   default RimLight.IntensityPercent = -90.f;  
 
   default GeneralPriority = 3.0f;

   default EyeIntensityFinetuneFactor = 3.f;

   default KeyLight.MinThreshold = 0.12;
   default RimLight.MinThreshold = 0.1;
   default KeyReverseLight.MinThreshold = 0.12;
   default RimReverseLight.MinThreshold = 0.1;
   
}

UCLASS()
class ULightingModifierInShadowSpeaker_Dawn_Wide: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Shadow;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(6,20));
   default ForDaytimeEnd.Set(FClockTime(7,31));

   default bBeInShadow.Set(true);
   default bSpeakerExklusive.Set(true);
   default bUseCloseShot.Set(false);


   default KeyLight.IntensityPercent = -95.f;
   default RimLight.IntensityPercent = -91.f;   
 

   default GeneralPriority = 3.0f;

   default EyeIntensityFinetuneFactor = 3.f;

   default KeyLight.MinThreshold = 0.12;
   default RimLight.MinThreshold = 0.1;
   default KeyReverseLight.MinThreshold = 0.12;
   default RimReverseLight.MinThreshold = 0.1;
}


UCLASS()
class ULightingModifierInShadowListener_Dawn_Close: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Shadow;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(6,20));
   default ForDaytimeEnd.Set(FClockTime(7,31));

   default bBeInShadow.Set(true);
   default bListenerExklusive.Set(true);
   default bUseCloseShot.Set(true);

   default KeyReverseLight.IntensityPercent = -88.f;
   default RimReverseLight.IntensityPercent = -90.f;  

       

   default GeneralPriority = 3.0f;

   default EyeIntensityFinetuneFactor = 3.f;

   default KeyLight.MinThreshold = 0.12;
   default RimLight.MinThreshold = 0.1;
   default KeyReverseLight.MinThreshold = 0.12;
   default RimReverseLight.MinThreshold = 0.1;
}

UCLASS()
class ULightingModifierInShadowListener_Dawn_Wide: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Shadow;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(6,20));
   default ForDaytimeEnd.Set(FClockTime(7,31));

   default bBeInShadow.Set(true);
   default bListenerExklusive.Set(true);
   default bUseCloseShot.Set(false);

   default KeyReverseLight.IntensityPercent = -95.f;
   default RimReverseLight.IntensityPercent = -91.f;        
    

   default GeneralPriority = 3.0f;

   default EyeIntensityFinetuneFactor = 3.f;

   default KeyLight.MinThreshold = 0.12;
   default RimLight.MinThreshold = 0.1;
   default KeyReverseLight.MinThreshold = 0.12;
   default RimReverseLight.MinThreshold = 0.1;
}

//______________________________________________________________________________________
//______________________________________________________________________________________
//______________________________________________________________________________________
//______________________________________________________________________________________


UCLASS()
class ULightingModifierInShadowSpeaker_Day_Close: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Shadow;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(7,31));
   default ForDaytimeEnd.Set(FClockTime(14,00));

   default bBeInShadow.Set(true);
   default bSpeakerExklusive.Set(true);
   default bUseCloseShot.Set(true);


   default KeyLight.IntensityPercent = -90.f;
   default RimLight.IntensityPercent = -94.f;  
 
   default GeneralPriority = 3.0f;

   default EyeIntensityFinetuneFactor = 1.f;

   default KeyLight.MinThreshold = 0.12;
   default RimLight.MinThreshold = 0.1;
   default KeyReverseLight.MinThreshold = 0.12;
   default RimReverseLight.MinThreshold = 0.1;
   
}

UCLASS()
class ULightingModifierInShadowSpeaker_Day_Wide: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Shadow;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(7,31));
   default ForDaytimeEnd.Set(FClockTime(14,00));

   default bBeInShadow.Set(true);
   default bSpeakerExklusive.Set(true);
   default bUseCloseShot.Set(false);


   default KeyLight.IntensityPercent = -93.f;
   default RimLight.IntensityPercent = -88.f;   
 

   default GeneralPriority = 3.0f;

   default EyeIntensityFinetuneFactor = 1.f;

   default KeyLight.MinThreshold = 0.12;
   default RimLight.MinThreshold = 0.1;
   default KeyReverseLight.MinThreshold = 0.12;
   default RimReverseLight.MinThreshold = 0.1;
}


UCLASS()
class ULightingModifierInShadowListener_Day_Close: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Shadow;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(7,31));
   default ForDaytimeEnd.Set(FClockTime(14,00));

   default bBeInShadow.Set(true);
   default bListenerExklusive.Set(true);
   default bUseCloseShot.Set(true);

   default KeyReverseLight.IntensityPercent = -90.f;
   default RimReverseLight.IntensityPercent = -94.f;  

       

   default GeneralPriority = 3.0f;

   default EyeIntensityFinetuneFactor = 1.f;

   default KeyLight.MinThreshold = 0.12;
   default RimLight.MinThreshold = 0.1;
   default KeyReverseLight.MinThreshold = 0.12;
   default RimReverseLight.MinThreshold = 0.1;
}

UCLASS()
class ULightingModifierInShadowListener_Day_Wide: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Shadow;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(7,31));
   default ForDaytimeEnd.Set(FClockTime(14,00));

   default bBeInShadow.Set(true);
   default bListenerExklusive.Set(true);
   default bUseCloseShot.Set(false);

   default KeyReverseLight.IntensityPercent = -93.f;
   default RimReverseLight.IntensityPercent = -88.f;        
    

   default GeneralPriority = 3.0f;

   default EyeIntensityFinetuneFactor = 1.f;

   default KeyLight.MinThreshold = 0.12;
   default RimLight.MinThreshold = 0.1;
   default KeyReverseLight.MinThreshold = 0.12;
   default RimReverseLight.MinThreshold = 0.1;
}

//______________________________________________________________________________________
//______________________________________________________________________________________
//______________________________________________________________________________________
//______________________________________________________________________________________


UCLASS()
class ULightingModifierInShadowSpeaker_Evening_Close: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Shadow;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(14,00));
   default ForDaytimeEnd.Set(FClockTime(18,30));

   default bBeInShadow.Set(true);
   default bSpeakerExklusive.Set(true);
   default bUseCloseShot.Set(true);


   default KeyLight.IntensityPercent = -93.f;
   default RimLight.IntensityPercent = -93.f;   
 

   default GeneralPriority = 3.0f;

   default EyeIntensityFinetuneFactor = 3.f;

   default KeyLight.MinThreshold = 0.12;
   default RimLight.MinThreshold = 0.1;
   default KeyReverseLight.MinThreshold = 0.12;
   default RimReverseLight.MinThreshold = 0.1;
}

UCLASS()
class ULightingModifierInShadowSpeaker_Evening_Wide: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Shadow;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(14,00));
   default ForDaytimeEnd.Set(FClockTime(18,30));

   default bBeInShadow.Set(true);
   default bSpeakerExklusive.Set(true);
   default bUseCloseShot.Set(false);


   default KeyLight.IntensityPercent = -96.f;
   default RimLight.IntensityPercent = -86.f; 
   

   default GeneralPriority = 3.0f;

   default EyeIntensityFinetuneFactor = 3.f;

   default KeyLight.MinThreshold = 0.12;
   default RimLight.MinThreshold = 0.1;
   default KeyReverseLight.MinThreshold = 0.12;
   default RimReverseLight.MinThreshold = 0.1;
}


UCLASS()
class ULightingModifierInShadowListener_Evening_Close: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Shadow;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(14,00));
   default ForDaytimeEnd.Set(FClockTime(18,30));

   default bBeInShadow.Set(true);
   default bListenerExklusive.Set(true);
   default bUseCloseShot.Set(true);

   default KeyReverseLight.IntensityPercent = -93.f;
   default RimReverseLight.IntensityPercent = -93.f;    
 

   default GeneralPriority = 3.0f;

   default EyeIntensityFinetuneFactor = 3.f;

   default KeyLight.MinThreshold = 0.12;
   default RimLight.MinThreshold = 0.1;
   default KeyReverseLight.MinThreshold = 0.12;
   default RimReverseLight.MinThreshold = 0.1;
}

UCLASS()
class ULightingModifierInShadowListener_Evening_Wide: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Shadow;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(14,00));
   default ForDaytimeEnd.Set(FClockTime(18,30));

   default bBeInShadow.Set(true);
   default bListenerExklusive.Set(true);
   default bUseCloseShot.Set(false);

   default KeyReverseLight.IntensityPercent = -96.f;
   default RimReverseLight.IntensityPercent = -86.f;     
 

   default GeneralPriority = 3.0f;

   default EyeIntensityFinetuneFactor = 3.f;

   default KeyLight.MinThreshold = 0.12;
   default RimLight.MinThreshold = 0.1;
   default KeyReverseLight.MinThreshold = 0.12;
   default RimReverseLight.MinThreshold = 0.1;
}


//______________________________________________________________________________________
//______________________________________________________________________________________
//______________________________________________________________________________________
//______________________________________________________________________________________


UCLASS()
class ULightingModifierInShadowSpeaker_Dusk_Close: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Shadow;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(18,30));
   default ForDaytimeEnd.Set(FClockTime(19,30));

   default bBeInShadow.Set(true);
   default bSpeakerExklusive.Set(true);
   default bUseCloseShot.Set(true);


   default KeyLight.IntensityPercent = -95.f;
   default RimLight.IntensityPercent = -93.f;   
 

   default GeneralPriority = 3.0f;

   default EyeIntensityFinetuneFactor = 5.f;

   default KeyLight.MinThreshold = 0.02;
   default RimLight.MinThreshold = 0.02;
   default KeyReverseLight.MinThreshold = 0.02;
   default RimReverseLight.MinThreshold = 0.02;
}

UCLASS()
class ULightingModifierInShadowSpeaker_Dusk_Wide: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Shadow;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(18,30));
   default ForDaytimeEnd.Set(FClockTime(19,30));

   default bBeInShadow.Set(true);
   default bSpeakerExklusive.Set(true);
   default bUseCloseShot.Set(false);


   default KeyLight.IntensityPercent = -96.f;
   default RimLight.IntensityPercent = -95.f; 
   

   default GeneralPriority = 3.0f;

   default EyeIntensityFinetuneFactor = 5.f;

   default KeyLight.MinThreshold = 0.02;
   default RimLight.MinThreshold = 0.02;
   default KeyReverseLight.MinThreshold = 0.02;
   default RimReverseLight.MinThreshold = 0.02;
}


UCLASS()
class ULightingModifierInShadowListener_Dusk_Close: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Shadow;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(18,30));
   default ForDaytimeEnd.Set(FClockTime(19,30));

   default bBeInShadow.Set(true);
   default bListenerExklusive.Set(true);
   default bUseCloseShot.Set(true);

   default KeyReverseLight.IntensityPercent = -95.f;
   default RimReverseLight.IntensityPercent = -93.f;    
 

   default GeneralPriority = 3.0f;

   default EyeIntensityFinetuneFactor = 5.f;

   default KeyLight.MinThreshold = 0.03;
   default RimLight.MinThreshold = 0.03;
   default KeyReverseLight.MinThreshold = 0.03;
   default RimReverseLight.MinThreshold = 0.03;
}

UCLASS()
class ULightingModifierInShadowListener_Dusk_Wide: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Shadow;

   // Conditions
   default ForDaytimeStart.Set(FClockTime(18,30));
   default ForDaytimeEnd.Set(FClockTime(19,30));

   default bBeInShadow.Set(true);
   default bListenerExklusive.Set(true);
   default bUseCloseShot.Set(false);

   default KeyReverseLight.IntensityPercent = -96.f;
   default RimReverseLight.IntensityPercent = -95.f;    
 

   default GeneralPriority = 3.0f;

   default EyeIntensityFinetuneFactor = 5.f;

   default KeyLight.MinThreshold = 0.03;
   default RimLight.MinThreshold = 0.03;
   default KeyReverseLight.MinThreshold = 0.03;
   default RimReverseLight.MinThreshold = 0.03;
}

// -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// --------------------------------------------------------------------------------------------------------------------------------------------------
// -----------------------------------------------------------------------------------------------------------------------------------
// ---------------------------------------------------------------------------------------------------------------------------
// ---------------------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------



UCLASS()
class ULightingModifierOutShadowSpeaker: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Shadow;

   // Conditions
   default bBeInShadow.Set(false);
   default bSpeakerExklusive.Set(true);

}

UCLASS()
class ULightingModifierOutShadowListener: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::Shadow;

   // Conditions
   default bBeInShadow.Set(false);
   default bListenerExklusive.Set(true);
}

//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//SCENE BRIGHTNESS_________________________________________________________________________________________________

// UCLASS()
// class ULightingModifierSceneBrightness_InShadow_Minus_Dawn : ULightingModifierConditional
// {
//    default ModifierType = ELightingModifierType::SceneBrightness;

//    // Conditions  

//    default ForSceneBrightnessMin.Set(0.f);
//    default ForSceneBrightnessMax.Set(0.016f);

//    default bBeInShadow.Set(true); 
//    default bBeInside.Set(false);

//    default ForDaytimeStart.Set(FClockTime(6,20));
//    default ForDaytimeEnd.Set(FClockTime(7,31));
   

//    // Modifier Values
//    default KeyLight.IntensityPercent = -11.f;
//    default RimLight.IntensityPercent = -15.f;
//    default KeyReverseLight.IntensityPercent = -11.f;
//    default RimReverseLight.IntensityPercent = -15.f;

//    default KeyLight.MinThreshold = 0.025;
//    default RimLight.MinThreshold = 0.01;
//    default KeyReverseLight.MinThreshold = 0.025;
//    default RimReverseLight.MinThreshold = 0.01;  
      
// }


// UCLASS()
// class ULightingModifierSceneBrightness_InShadow_Minus_Day : ULightingModifierConditional
// {
//    default ModifierType = ELightingModifierType::SceneBrightness;

//    // Conditions  

//    default ForSceneBrightnessMin.Set(0.f);
//    default ForSceneBrightnessMax.Set(0.016f);

//    default bBeInShadow.Set(true); 
//    default bBeInside.Set(false);

//    default ForDaytimeStart.Set(FClockTime(07,31));
//    default ForDaytimeEnd.Set(FClockTime(17,00));
   

//    // Modifier Values
//    default KeyLight.IntensityPercent = -9.f;
//    default RimLight.IntensityPercent = -11.f;
//    default KeyReverseLight.IntensityPercent = -9.f;
//    default RimReverseLight.IntensityPercent = -11.f;

//    default KeyLight.MinThreshold = 0.03;
//    default RimLight.MinThreshold = 0.02;
//    default KeyReverseLight.MinThreshold = 0.03;
//    default RimReverseLight.MinThreshold = 0.02; 
      
// }


// UCLASS()
// class ULightingModifierSceneBrightness_InShadow_Minus_Evening : ULightingModifierConditional
// {
//    default ModifierType = ELightingModifierType::SceneBrightness;

//    // Conditions  

//    default ForSceneBrightnessMin.Set(0.f);
//    default ForSceneBrightnessMax.Set(0.016f);

//    default bBeInShadow.Set(true); 
//    default bBeInside.Set(false);

//    default ForDaytimeStart.Set(FClockTime(17,00));
//    default ForDaytimeEnd.Set(FClockTime(19,30));
   

//    // Modifier Values
//    default KeyLight.IntensityPercent = -11.f;
//    default RimLight.IntensityPercent = -13.f;
//    default KeyReverseLight.IntensityPercent = -11.f;
//    default RimReverseLight.IntensityPercent = -13.f;

//    default KeyLight.MinThreshold = 0.03;
//    default RimLight.MinThreshold = 0.01;
//    default KeyReverseLight.MinThreshold = 0.03;
//    default RimReverseLight.MinThreshold = 0.01; 
      
// }


///////////////////////////

// UCLASS()
// class ULightingModifierSceneBrightness_InShadow_Plus : ULightingModifierConditional
// {
//    default ModifierType = ELightingModifierType::SceneBrightness;

//    // Conditions  

//    default ForSceneBrightnessMin.Set(0.01551f);
//    default ForSceneBrightnessMax.Set(0.3f);

//    default bBeInShadow.Set(true); 
//    default bBeInside.Set(false);
   

//    // Modifier Values
//    default KeyLight.IntensityPercent = 10.f;
//    default RimLight.IntensityPercent = 10.f;
//    default KeyReverseLight.IntensityPercent = 10.f;
//    default RimReverseLight.IntensityPercent = 10.f;

//    default KeyLight.MinThreshold = 0.005;
//    default RimLight.MinThreshold = 0.005;
//    default KeyReverseLight.MinThreshold = 0.005;
//    default RimReverseLight.MinThreshold = 0.005; 
      
// }


//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//Participant Number_________________________________________________________________________________________________


UCLASS()
class ULightingModifierMoreThan2Participants_Five: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::ParticipantNumber;

   // Conditions
   default MinParticipantNumber.Set(5);
   // default ForDaytimeStart.Set(FClockTime(09,01));
   // default ForDaytimeEnd.Set(FClockTime(17,31));
   // default bUseCloseShot.Set(true);
   
   default TypePriority = 10.0f;

   // default KeyReverseLight.IntensityReplace = 0.f;
   // default RimReverseLight.IntensityReplace = 0.f;


   // default AdditionalLightValues.Add(FLightValues());
   // default AdditionalLightValues.Last().LightPos.AddVectorAt(0.0f, FVector(3.997079f, 158.869476f, 14.615378f));
	// default AdditionalLightValues.Last().LightRotOffset.AddRotatorAt(0.0f, FRotator(-20.573311f, -7.547106f, -0.0f));
	// default AdditionalLightValues.Last().LightIntensityCurve.AddValueAt(0.0f, 625.0f);
	// default AdditionalLightValues.Last().LightColor = FLinearColor(1.0f, 0.854993f, 0.658375f, 1.0f);
	// default AdditionalLightValues.Last().SourceWidth = 10.0f;
	// default AdditionalLightValues.Last().SourceHeight = 128.0f;
	// default AdditionalLightValues.Last().AttenuationRadius = 1000.0f;
	// default AdditionalLightValues.Last().RelativeParticipant = EConversationCameraRelativeParticipant::AdditionalParticipants;
	// default AdditionalLightValues.Last().LightingChannels.bChannel0 = false;
	// default AdditionalLightValues.Last().LightingChannels.bChannel1 = false;
	// default AdditionalLightValues.Last().LightingChannels.bChannel2 = true;
	

   // default AdditionalLightValues.Add(FLightValues());
	// default AdditionalLightValues.Last().LightPos.AddVectorAt(0.0f, FVector(129.873444f, 199.38887f, -6.604769f));
	// default AdditionalLightValues.Last().LightRotOffset.AddRotatorAt(0.0f, FRotator(-0.194481f, -149.552963f, 0.0f));
	// default AdditionalLightValues.Last().LightIntensityCurve.AddValueAt(0.0f, 625.0f);
	// default AdditionalLightValues.Last().LightColor = FLinearColor(1.0f, 0.854993f, 0.658375f, 1.0f);
	// default AdditionalLightValues.Last().SourceWidth = 10.0f;
	// default AdditionalLightValues.Last().SourceHeight = 128.0f;
	// default AdditionalLightValues.Last().AttenuationRadius = 1000.0f;
	// default AdditionalLightValues.Last().RelativeParticipant = EConversationCameraRelativeParticipant::AdditionalParticipants;

	// default AdditionalLightValues.Last().LightingChannels.bChannel0 = false;
	// default AdditionalLightValues.Last().LightingChannels.bChannel1 = false;
	// default AdditionalLightValues.Last().LightingChannels.bChannel2 = true;
	




   // ///KEY 1

   // default AdditionalLightValues.Add(FLightValues());
   // default AdditionalLightValues.Last().LightIntensityCurve.AddValueAt(0.0f, 10.f);

   // default AdditionalLightValues.Last().LightPos.AddVectorAt(0.0f, FVector(368.126678f, 40.735893f, 41.74239f));
	// default AdditionalLightValues.Last().LightRotOffset.AddRotatorAt(0.0f, FRotator(6.905126f, -153.618912f, 3.862517f));
   
   // default AdditionalLightValues.Last().LightColor = FLinearColor(0.75f, 0.64f, 0.5f);
   // default AdditionalLightValues.Last().AttenuationRadius = 700.f;
   // default AdditionalLightValues.Last().SourceWidth = 500.f;
   // default AdditionalLightValues.Last().SourceHeight = 250.f;   

   // default AdditionalLightValues.Last().RelativeParticipant = EConversationCameraRelativeParticipant::ConversationInitiator;
   // default AdditionalLightValues.Last().LightingChannels.bChannel0 = false;
   // default AdditionalLightValues.Last().LightingChannels.bChannel1 = false;
   // default AdditionalLightValues.Last().LightingChannels.bChannel2 = true;		



   //  ///RIM 1

   // default AdditionalLightValues.Add(FLightValues());
   // default AdditionalLightValues.Last().LightIntensityCurve.AddValueAt(0.0f, 11.f);

   // default AdditionalLightValues.Last().LightPos.AddVectorAt(0.0f, FVector(270.368378f, 127.428223f, 55.409077f));
	// default AdditionalLightValues.Last().LightRotOffset.AddRotatorAt(0.0f, FRotator(7.364687f, -161.421341f, 2.918246f));
   
   // default AdditionalLightValues.Last().LightColor = FLinearColor(0.54f, 0.47f, 0.61f);
   // default AdditionalLightValues.Last().AttenuationRadius = 700.f;
   // default AdditionalLightValues.Last().SourceWidth = 500.f;
   // default AdditionalLightValues.Last().SourceHeight = 250.f;

   // default AdditionalLightValues.Last().RelativeParticipant = EConversationCameraRelativeParticipant::ConversationInitiator;
   // default AdditionalLightValues.Last().LightingChannels.bChannel0 = false;
   // default AdditionalLightValues.Last().LightingChannels.bChannel1 = false;
   // default AdditionalLightValues.Last().LightingChannels.bChannel2 = true; 


   // ///KEY 2

   // default AdditionalLightValues.Add(FLightValues());
   // default AdditionalLightValues.Last().LightIntensityCurve.AddValueAt(0.0f, 12.f);

   // default AdditionalLightValues.Last().LightPos.AddVectorAt(0.0f, FVector(230.509079f, -314.60022f, 56.868145f));
	// default AdditionalLightValues.Last().LightRotOffset.AddRotatorAt(0.0f, FRotator(3.497211f, 111.492485f, -7.002131f));
   
   // default AdditionalLightValues.Last().LightColor = FLinearColor(0.75f, 0.64f, 0.5f);
   // default AdditionalLightValues.Last().AttenuationRadius = 700.f;
   // default AdditionalLightValues.Last().SourceWidth = 500.f;
   // default AdditionalLightValues.Last().SourceHeight = 250.f;   

   // default AdditionalLightValues.Last().RelativeParticipant = EConversationCameraRelativeParticipant::ConversationInitiator;
   // default AdditionalLightValues.Last().LightingChannels.bChannel0 = false;
   // default AdditionalLightValues.Last().LightingChannels.bChannel1 = false;
   // default AdditionalLightValues.Last().LightingChannels.bChannel2 = true;	


   // ///RIM 2

   // default AdditionalLightValues.Add(FLightValues());
   // default AdditionalLightValues.Last().LightIntensityCurve.AddValueAt(0.0f, 13.f);

   // default AdditionalLightValues.Last().LightPos.AddVectorAt(0.0f, FVector(-135.738815f, 130.806885f, 109.109184f));
	// default AdditionalLightValues.Last().LightRotOffset.AddRotatorAt(0.0f, FRotator(-6.973615f, -25.894545f, 2.923444f));
   
   // default AdditionalLightValues.Last().LightColor = FLinearColor(0.54f, 0.47f, 0.61f);
   // default AdditionalLightValues.Last().AttenuationRadius = 700.f;
   // default AdditionalLightValues.Last().SourceWidth = 500.f;
   // default AdditionalLightValues.Last().SourceHeight = 250.f;

   // default AdditionalLightValues.Last().RelativeParticipant = EConversationCameraRelativeParticipant::ConversationInitiator;
   // default AdditionalLightValues.Last().LightingChannels.bChannel0 = false;
   // default AdditionalLightValues.Last().LightingChannels.bChannel1 = false;
   // default AdditionalLightValues.Last().LightingChannels.bChannel2 = true; 
  

}


	




	
	

// UCLASS()
// class ULightingModifierMoreThan2Participants_Wide_Noon: ULightingModifierConditional
// {
//    default ModifierType = ELightingModifierType::ParticipantNumber;

//    // Conditions
//    default MinParticipantNumber.Set(3);
//    default ForDaytimeStart.Set(FClockTime(12,01));
//    default ForDaytimeEnd.Set(FClockTime(13,31));
//    default bUseCloseShot.Set(false);
   

//    default KeyReverseLight.IntensityReplace = 0.f;
//    default RimReverseLight.IntensityReplace = 0.f;

//   ///KEY 1

//    default AdditionalLightValues.Add(FLightValues());
//    default AdditionalLightValues.Last().LightIntensityCurve.AddValueAt(0.0f, 1.7f);
//    default AdditionalLightValues.Last().LightPos.AddVectorAt(0.0f, FVector(225493035585822577917952.0f, -27545654.0f, 121.12796f));
// 	default AdditionalLightValues.Last().LightRotOffset.AddRotatorAt(0.0f, FRotator(-13.147594f, -178.999619f, -0.0f));
//    default AdditionalLightValues.Last().LightColor = FLinearColor(0.75f, 0.64f, 0.5f);
//    default AdditionalLightValues.Last().AttenuationRadius = 700.f;
//    default AdditionalLightValues.Last().SourceWidth = 500.f;
//    default AdditionalLightValues.Last().SourceHeight = 250.f;    

//    default AdditionalLightValues.Last().RelativeParticipant = EConversationCameraRelativeParticipant::AdditionalParticipants;
//    default AdditionalLightValues.Last().LightingChannels.bChannel0 = false;
//    default AdditionalLightValues.Last().LightingChannels.bChannel1 = false;
//    default AdditionalLightValues.Last().LightingChannels.bChannel2 = true;	



//     ///RIM

//    default AdditionalLightValues.Add(FLightValues());
//    default AdditionalLightValues.Last().LightIntensityCurve.AddValueAt(0.0f, 1.3f);
//    default AdditionalLightValues.Last().LightPos.AddVectorAt(0.0f, FVector(173448.484375f, -36.258869f, 49.139259f));
// 	default AdditionalLightValues.Last().LightRotOffset.AddRotatorAt(0.0f, FRotator(0.790797f, 172.153885f, 0.0f));
//    default AdditionalLightValues.Last().LightColor = FLinearColor(0.54f, 0.47f, 0.61f);
//    default AdditionalLightValues.Last().AttenuationRadius = 700.f;
//    default AdditionalLightValues.Last().SourceWidth = 500.f;
//    default AdditionalLightValues.Last().SourceHeight = 250.f;

//    default AdditionalLightValues.Last().RelativeParticipant = EConversationCameraRelativeParticipant::AdditionalParticipants;
//    default AdditionalLightValues.Last().LightingChannels.bChannel0 = false;
//    default AdditionalLightValues.Last().LightingChannels.bChannel1 = false;
//    default AdditionalLightValues.Last().LightingChannels.bChannel2 = true;	
   

// }


//////////////////////////////////////////
//////////////////////////////////////////



UCLASS()
class ULightingModifierMoreThan2Participants_Three_Interior: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::ParticipantNumber;

   // Conditions
   default MinParticipantNumber.Set(3);
   default MaxParticipantNumber.Set (4);
   // default ForDaytimeStart.Set(FClockTime(09,01));
   // default ForDaytimeEnd.Set(FClockTime(17,31));
   // default bUseCloseShot.Set(true);
   default bBeInside.Set(true);
   
   default TypePriority = 10.0f;

   
//    default AdditionalLightValues.Add(FLightValues());
// 	default AdditionalLightValues.Last().LightPos.AddVectorAt(0.0f, FVector(-2.050899f, 0.084205f, 118.26519f));
// 	default AdditionalLightValues.Last().LightRotOffset.AddRotatorAt(0.0f, FRotator(0.00001f, -90.049789f, 0.0f));
// 	default AdditionalLightValues.Last().LightIntensityCurve.AddValueAt(0.0f, 625.0f);
// 	default AdditionalLightValues.Last().LightColor = FLinearColor(1.0f, 0.854993f, 0.658375f, 1.0f);
// 	default AdditionalLightValues.Last().SourceWidth = 10.0f;
// 	default AdditionalLightValues.Last().SourceHeight = 128.0f;
// 	default AdditionalLightValues.Last().AttenuationRadius = 1000.0f;
// 	default AdditionalLightValues.Last().RelativeParticipant = EConversationCameraRelativeParticipant::AdditionalParticipants;

// 	default AdditionalLightValues.Last().LightingChannels.bChannel0 = false;
// 	default AdditionalLightValues.Last().LightingChannels.bChannel1 = false;
// 	default AdditionalLightValues.Last().LightingChannels.bChannel2 = true;
// 	default AdditionalLightValues.Last().LightMaterialName = n"";

// default AdditionalLightValues.Add(FLightValues());
// 	default AdditionalLightValues.Last().LightPos.AddVectorAt(0.0f, FVector(227.842346f, 90.647911f, 148.265228f));
// 	default AdditionalLightValues.Last().LightRotOffset.AddRotatorAt(0.0f, FRotator(0.00001f, -90.049789f, 0.0f));
// 	default AdditionalLightValues.Last().LightIntensityCurve.AddValueAt(0.0f, 625.0f);
// 	default AdditionalLightValues.Last().LightColor = FLinearColor(1.0f, 0.854993f, 0.658375f, 1.0f);
// 	default AdditionalLightValues.Last().SourceWidth = 10.0f;
// 	default AdditionalLightValues.Last().SourceHeight = 128.0f;
// 	default AdditionalLightValues.Last().AttenuationRadius = 1000.0f;
// 	default AdditionalLightValues.Last().RelativeParticipant = EConversationCameraRelativeParticipant::AdditionalParticipants;

// 	default AdditionalLightValues.Last().LightingChannels.bChannel0 = false;
// 	default AdditionalLightValues.Last().LightingChannels.bChannel1 = false;
// 	default AdditionalLightValues.Last().LightingChannels.bChannel2 = true;
// 	default AdditionalLightValues.Last().LightMaterialName = n"";

}



// UCLASS()
// class ULightingModifierMoreThan2Participants_Close_Night: ULightingModifierConditional
// {
//    default ModifierType = ELightingModifierType::ParticipantNumber;

//    // Conditions
//    default MinParticipantNumber.Set(3);
//    default ForDaytimeStart.Set(FClockTime(18,01));
//    default ForDaytimeEnd.Set(FClockTime(06,00));
//    default bUseCloseShot.Set(true);
   

//    default KeyReverseLight.IntensityReplace = 0.f;
//    default RimReverseLight.IntensityReplace = 0.f;

//    default AdditionalLightValues.Add(FLightValues());
//    default AdditionalLightValues.Last().LightIntensityCurve.AddValueAt(0.0f, 100.f);
//    default AdditionalLightValues.Last().LightPos.AddVectorAt(0.0f, FVector(208.295319f, 319.695648f, 95.177452f));
//    default AdditionalLightValues.Last().LightRotOffset.AddVectorAt(0.0f, FVector(-10.255584f, -132.637329f, 0.f));
//    default AdditionalLightValues.Last().LightColor = FLinearColor(0.0f, 1.0f, 0.0f);
//    default AdditionalLightValues.Last().AttenuationRadius = 650.f;
//    default AdditionalLightValues.Last().SourceWidth = 250.f;
//    default AdditionalLightValues.Last().SourceHeight = 250.f;

//    default AdditionalLightValues.Last().RelativeParticipant = EConversationCameraRelativeParticipant::AdditionalParticipants;
//    default AdditionalLightValues.Last().LightingChannels.bChannel0 = false;
//    default AdditionalLightValues.Last().LightingChannels.bChannel1 = false;
//    default AdditionalLightValues.Last().LightingChannels.bChannel2 = true;


//    default AdditionalLightValues.Add(FLightValues());
//    default AdditionalLightValues.Last().LightIntensityCurve.AddValueAt(0.0f, 100.f);
//    default AdditionalLightValues.Last().LightPos.AddVectorAt(0.0f, FVector(408.295319f, 319.695648f, 105.177452f));
//    default AdditionalLightValues.Last().LightRotOffset.AddVectorAt(0.0f, FVector(-10.255584f, -132.637329f, 0.f));
//    default AdditionalLightValues.Last().LightColor = FLinearColor(1.0f, 0.0f, 0.0f);
//    default AdditionalLightValues.Last().AttenuationRadius = 650.f;
//    default AdditionalLightValues.Last().SourceWidth = 250.f;
//    default AdditionalLightValues.Last().SourceHeight = 250.f;

//    default AdditionalLightValues.Last().RelativeParticipant = EConversationCameraRelativeParticipant::AdditionalParticipants;
//    default AdditionalLightValues.Last().LightingChannels.bChannel0 = false;
//    default AdditionalLightValues.Last().LightingChannels.bChannel1 = false;
//    default AdditionalLightValues.Last().LightingChannels.bChannel2 = true;

// }


// UCLASS()
// class ULightingModifierMoreThan2Participants_Wide_Night: ULightingModifierConditional
// {
//    default ModifierType = ELightingModifierType::ParticipantNumber;

//    // Conditions
//    default MinParticipantNumber.Set(3);
//    default ForDaytimeStart.Set(FClockTime(18,01));
//    default ForDaytimeEnd.Set(FClockTime(06,00));
//    default bUseCloseShot.Set(false);
   

//    default KeyLight.IntensityReplace = 0.f;
//    default RimLight.IntensityReplace = 0.f;
//    default KeyReverseLight.IntensityReplace = 0.f;
//    default RimReverseLight.IntensityReplace = 0.f;

//    default AdditionalLightValues.Add(FLightValues());
//    default AdditionalLightValues.Last().LightIntensityCurve.AddValueAt(0.0f, 100.f);
//    default AdditionalLightValues.Last().LightPos.AddVectorAt(0.0f, FVector(208.295319f, 319.695648f, 95.177452f));
//    default AdditionalLightValues.Last().LightRotOffset.AddVectorAt(0.0f, FVector(-10.255584f, -132.637329f, 0.f));
//    default AdditionalLightValues.Last().LightColor = FLinearColor(0.0f, 1.0f, 0.0f);
//    default AdditionalLightValues.Last().AttenuationRadius = 650.f;
//    default AdditionalLightValues.Last().SourceWidth = 250.f;
//    default AdditionalLightValues.Last().SourceHeight = 250.f;

//    default AdditionalLightValues.Last().RelativeParticipant = EConversationCameraRelativeParticipant::AdditionalParticipants;
//    default AdditionalLightValues.Last().LightingChannels.bChannel0 = false;
//    default AdditionalLightValues.Last().LightingChannels.bChannel1 = true;
//    default AdditionalLightValues.Last().LightingChannels.bChannel2 = true;


//    default AdditionalLightValues.Add(FLightValues());
//    default AdditionalLightValues.Last().LightIntensityCurve.AddValueAt(0.0f, 100.f);
//    default AdditionalLightValues.Last().LightPos.AddVectorAt(0.0f, FVector(408.295319f, 319.695648f, 105.177452f));
//    default AdditionalLightValues.Last().LightRotOffset.AddVectorAt(0.0f, FVector(-10.255584f, -132.637329f, 0.f));
//    default AdditionalLightValues.Last().LightColor = FLinearColor(1.0f, 0.0f, 0.0f);
//    default AdditionalLightValues.Last().AttenuationRadius = 650.f;
//    default AdditionalLightValues.Last().SourceWidth = 250.f;
//    default AdditionalLightValues.Last().SourceHeight = 250.f;

//    default AdditionalLightValues.Last().RelativeParticipant = EConversationCameraRelativeParticipant::AdditionalParticipants;
//    default AdditionalLightValues.Last().LightingChannels.bChannel0 = false;
//    default AdditionalLightValues.Last().LightingChannels.bChannel1 = true;
//    default AdditionalLightValues.Last().LightingChannels.bChannel2 = true;

// }






//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// LIGHT SPELL
//////////////////////////////////////////////////////////////////////


UCLASS()
class ULightingModifierLightSpell_Night: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::ExternalLightIntensity;

   // Conditions

   default ForDaytimeStart.Set(FClockTime(19,31));
   default ForDaytimeEnd.Set(FClockTime(6,20));

   default RequiredOnAnyParticipantTags.AddTag(GameplayTag::State_Spell_Light);

   default bBeInside.Set(false);
   
   // Modifier Values
   // default KeyLight.ColorReplace = FVector(1.0f,1.0f,1.0f);
   // default KeyReverseLight.ColorReplace = FVector(1.0f,1.0f,1.0f);
   // default RimLight.ColorReplace = FVector(1.0f,1.0f,1.0f);
   // default RimReverseLight.ColorReplace = FVector(1.0f,1.0f,1.0f);

   // New Light
   default AdditionalLightValues.Add(FLightValues());

   default AdditionalLightValues.Last().LightIntensityCurve.AddValueAt(0.0f, 0.03f);
   default AdditionalLightValues.Last().LightColor = FLinearColor(1.00, 0.71, 0.45, 0.94);

   default AdditionalLightValues.Last().LightPos.AddVectorAt(0.0f, FVector(90.f, 1.f, 70.f));
   default AdditionalLightValues.Last().LightRotOffset.AddVectorAt(0.0f, FVector(-30.f, 180.f, 0.f));
   
   default AdditionalLightValues.Last().AttenuationRadius = 250.f;
   default AdditionalLightValues.Last().SourceWidth = 50.f;
   default AdditionalLightValues.Last().SourceHeight = 50.f;


   default AdditionalLightValues.Last().RelativeParticipant = EConversationCameraRelativeParticipant::Speaker;
   default AdditionalLightValues.Last().LightingChannels.bChannel0 = false;
   default AdditionalLightValues.Last().LightingChannels.bChannel1 = true;
   default AdditionalLightValues.Last().LightingChannels.bChannel2 = false;


   default AdditionalLightValues.Add(FLightValues());

   default AdditionalLightValues.Last().LightIntensityCurve.AddValueAt(0.0f, 0.025f);
   default AdditionalLightValues.Last().LightColor = FLinearColor(1.00, 0.71, 0.45, 0.94);

   default AdditionalLightValues.Last().LightPos.AddVectorAt(0.0f, FVector(90.f, 1.f, 70.f));
   default AdditionalLightValues.Last().LightRotOffset.AddVectorAt(0.0f, FVector(-30.f, 180.f, 0.f));
   
   default AdditionalLightValues.Last().AttenuationRadius = 250.f;
   default AdditionalLightValues.Last().SourceWidth = 50.f;
   default AdditionalLightValues.Last().SourceHeight = 50.f;

   default AdditionalLightValues.Last().RelativeParticipant = EConversationCameraRelativeParticipant::Listener;
   default AdditionalLightValues.Last().LightingChannels.bChannel0 = false;
   default AdditionalLightValues.Last().LightingChannels.bChannel1 = false;
   default AdditionalLightValues.Last().LightingChannels.bChannel2 = true;

   default DiffuseColorBoost = 2.f;

   default TypePriority = 5.f;

   default EyeIntensityFinetuneFactor = 3.f;

   default KeyLight.MinThreshold = 0.01;
   default RimLight.MinThreshold = 0.01;
   default KeyReverseLight.MinThreshold = 0.01;
   default RimReverseLight.MinThreshold = 0.01;

}

UCLASS()
class ULightingModifierLightSpell_Day: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::ExternalLightIntensity;

   // Conditions

   default ForDaytimeStart.Set(FClockTime(6,21));
   default ForDaytimeEnd.Set(FClockTime(19,30));

   default RequiredOnAnyParticipantTags.AddTag(GameplayTag::State_Spell_Light);

   default bBeInside.Set(false);


   // Modifier Values
   // default KeyLight.ColorReplace = FVector(1.0f,1.0f,1.0f);
   // default KeyReverseLight.ColorReplace = FVector(1.0f,1.0f,1.0f);
   // default RimLight.ColorReplace = FVector(1.0f,1.0f,1.0f);
   // default RimReverseLight.ColorReplace = FVector(1.0f,1.0f,1.0f);

   // default KeyLight.IntensityPercent = -30.f;
   
   // default KeyReverseLight.IntensityPercent = -30.f;

   // New Light
   default AdditionalLightValues.Add(FLightValues());

   default AdditionalLightValues.Last().LightIntensityCurve.AddValueAt(0.0f, 0.05f);
   default AdditionalLightValues.Last().LightColor = FLinearColor(1.00, 0.71, 0.45, 0.94);

   default AdditionalLightValues.Last().LightPos.AddVectorAt(0.0f, FVector(90.f, 1.f, 70.f));
   default AdditionalLightValues.Last().LightRotOffset.AddVectorAt(0.0f, FVector(-30.f, 180.f, 0.f));
   
   default AdditionalLightValues.Last().AttenuationRadius = 250.f;
   default AdditionalLightValues.Last().SourceWidth = 50.f;
   default AdditionalLightValues.Last().SourceHeight = 50.f;


   default AdditionalLightValues.Last().RelativeParticipant = EConversationCameraRelativeParticipant::Speaker;
   default AdditionalLightValues.Last().LightingChannels.bChannel0 = false;
   default AdditionalLightValues.Last().LightingChannels.bChannel1 = true;
   default AdditionalLightValues.Last().LightingChannels.bChannel2 = false;


   default AdditionalLightValues.Add(FLightValues());

   default AdditionalLightValues.Last().LightIntensityCurve.AddValueAt(0.0f, 0.05f);
   default AdditionalLightValues.Last().LightColor = FLinearColor(1.00, 0.71, 0.45, 0.94);

   default AdditionalLightValues.Last().LightPos.AddVectorAt(0.0f, FVector(90.f, 1.f, 70.f));
   default AdditionalLightValues.Last().LightRotOffset.AddVectorAt(0.0f, FVector(-30.f, 180.f, 0.f));
   
   default AdditionalLightValues.Last().AttenuationRadius = 250.f;
   default AdditionalLightValues.Last().SourceWidth = 50.f;
   default AdditionalLightValues.Last().SourceHeight = 50.f;

   default AdditionalLightValues.Last().RelativeParticipant = EConversationCameraRelativeParticipant::Listener;
   default AdditionalLightValues.Last().LightingChannels.bChannel0 = false;
   default AdditionalLightValues.Last().LightingChannels.bChannel1 = false;
   default AdditionalLightValues.Last().LightingChannels.bChannel2 = true;

   default DiffuseColorBoost = 2.f;

   default TypePriority = 5.f;

   default EyeIntensityFinetuneFactor = 3.f;

   default KeyLight.MinThreshold = 0.01;
   default RimLight.MinThreshold = 0.01;
   default KeyReverseLight.MinThreshold = 0.01;
   default RimReverseLight.MinThreshold = 0.01;
}

//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------------------------------------------

UCLASS()
class ULightingModifierLightSpell_Interior: ULightingModifierConditional
{
   default ModifierType = ELightingModifierType::ExternalLightIntensity;

   // Conditions

   // default ForDaytimeStart.Set(FClockTime(5,31));
   // default ForDaytimeEnd.Set(FClockTime(20,19));

   default RequiredOnAnyParticipantTags.AddTag(GameplayTag::State_Spell_Light);

   default bBeInside.Set(true);


   // Modifier Values
   // default KeyLight.ColorReplace = FVector(1.0f,1.0f,1.0f);
   // default KeyReverseLight.ColorReplace = FVector(1.0f,1.0f,1.0f);
   // default RimLight.ColorReplace = FVector(1.0f,1.0f,1.0f);
   // default RimReverseLight.ColorReplace = FVector(1.0f,1.0f,1.0f);

   // default KeyLight.IntensityPercent = -30.f;
   
   // default KeyReverseLight.IntensityPercent = -30.f;

   // New Light
   default AdditionalLightValues.Add(FLightValues());

   default AdditionalLightValues.Last().LightIntensityCurve.AddValueAt(0.0f, 0.03f);
   default AdditionalLightValues.Last().LightColor = FLinearColor(1.00, 0.71, 0.45, 0.94);

   default AdditionalLightValues.Last().LightPos.AddVectorAt(0.0f, FVector(90.f, 1.f, 70.f));
   default AdditionalLightValues.Last().LightRotOffset.AddVectorAt(0.0f, FVector(-30.f, 180.f, 0.f));
   
   default AdditionalLightValues.Last().AttenuationRadius = 250.f;
   default AdditionalLightValues.Last().SourceWidth = 50.f;
   default AdditionalLightValues.Last().SourceHeight = 50.f;


   default AdditionalLightValues.Last().RelativeParticipant = EConversationCameraRelativeParticipant::Speaker;
   default AdditionalLightValues.Last().LightingChannels.bChannel0 = false;
   default AdditionalLightValues.Last().LightingChannels.bChannel1 = true;
   default AdditionalLightValues.Last().LightingChannels.bChannel2 = false;


   default AdditionalLightValues.Add(FLightValues());

   default AdditionalLightValues.Last().LightIntensityCurve.AddValueAt(0.0f, 0.03f);
   default AdditionalLightValues.Last().LightColor = FLinearColor(1.00, 0.71, 0.45, 0.94);

   default AdditionalLightValues.Last().LightPos.AddVectorAt(0.0f, FVector(90.f, 1.f, 70.f));
   default AdditionalLightValues.Last().LightRotOffset.AddVectorAt(0.0f, FVector(-30.f, 180.f, 0.f));
   
   default AdditionalLightValues.Last().AttenuationRadius = 250.f;
   default AdditionalLightValues.Last().SourceWidth = 50.f;
   default AdditionalLightValues.Last().SourceHeight = 50.f;

   default AdditionalLightValues.Last().RelativeParticipant = EConversationCameraRelativeParticipant::Listener;
   default AdditionalLightValues.Last().LightingChannels.bChannel0 = false;
   default AdditionalLightValues.Last().LightingChannels.bChannel1 = false;
   default AdditionalLightValues.Last().LightingChannels.bChannel2 = true;

   default DiffuseColorBoost = 2.f;

   default TypePriority = 5.f;

   default EyeIntensityFinetuneFactor = 3.f;

   default KeyLight.MinThreshold = 0.01;
   default RimLight.MinThreshold = 0.01;
   default KeyReverseLight.MinThreshold = 0.01;
   default RimReverseLight.MinThreshold = 0.01;
}

//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//Extra_________________________________________________________________________________________________
// class ULightingModifierBlue: ULightingModifierConditional
// {
//    default ModifierType = ELightingModifierType::ExternalLightColor;

//    default KeyLight.ColorReplace = FVector(0.0f, 0.0f, 0.001f);
//    default RimLight.ColorReplace = FVector(0.0f, 0.0f, 0.001f);
//    default KeyReverseLight.ColorReplace = FVector(0.0f, 0.0f, 0.001f);
//    default RimReverseLight.ColorReplace = FVector(0.0f, 0.0f, 0.001f);

//    // Conditions
//    default ForExternalLightColorThreshold.Set(FLinearColor(0.5f, 0.5f, 0.5f));
//    default ForExternalLightColor.Set(FLinearColor(0.000029f, 0.000022f, 0.001457f));
// }


   // --------------------------------
   //  Camera Modifiers
   // --------------------------------


class UDirectionInputModifier: UGothicCameraModifierDirectionInput   
{
   // If false this modifier will do nothing
   default bModifierIsActive = false ;

   // Mouse/Stick Positions must be over this threshold to make the cmaera move
	default MousePercentageThreshold = 5.0f;
	default StickPercentageThreshold = 5.0f;

   // Max Rotations the Camera can be moved from this modifier
   default MaxYawChangeMouse = 3.f;
   default MaxPitchChangeMouse = 2.f;

   default MaxYawChangeStick = 3.0f;
   default MaxPitchChangeStick = 2.0f;

   // Movement speed for interpolation
	default MoveTimeStick = 15.f;
	default MoveTimeMouse = 15.f;
}