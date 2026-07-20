class UGA_Human_Speak : UGameplayAbilitySpeak
{
    //default ActivationBlockedTags.AddTag(GameplayTag::State_Hit);
    
    default m_LoadAssetsPriority = 150;

    default SoundAttenuation = n"SoundAttenuation'/Game/Conversation/SA_Human_Voice.SA_Human_Voice'";
    default SoundAttenuationByLoudness.FindOrAdd(EPerceptionNoiseLoudness::Loud) = n"/Script/Engine.SoundAttenuation'/Game/Conversation/SA_Human_Voice_Loud.SA_Human_Voice_Loud'";
    default SoundAttenuationByLoudness.FindOrAdd(EPerceptionNoiseLoudness::Moderate) = n"/Script/Engine.SoundAttenuation'/Game/Conversation/SA_Human_Voice_Moderate.SA_Human_Voice_Moderate'";
    default SoundAttenuationByLoudness.FindOrAdd(EPerceptionNoiseLoudness::Quiet) = n"/Script/Engine.SoundAttenuation'/Game/Conversation/SA_Human_Voice_Quiet.SA_Human_Voice_Quiet'";
    default SoundAttenuationByLoudness.FindOrAdd(EPerceptionNoiseLoudness::VeryLoud) = n"/Script/Engine.SoundAttenuation'/Game/Conversation/SA_Human_Voice_VeryLoud.SA_Human_Voice_VeryLoud'";
    default SoundAttenuationByLoudness.FindOrAdd(EPerceptionNoiseLoudness::Whisper) = n"/Script/Engine.SoundAttenuation'/Game/Conversation/SA_Human_Voice_Whisper.SA_Human_Voice_Whisper'";

    default BlockGesturesWhenHasAnyOf.AddTag(GameplayTag::State_Interact);
    default BlockGesturesWhenHasAnyOf.AddTag(GameplayTag::State_Carrying);
    default BlockGesturesWhenHasAnyOf.AddTag(GameplayTag::State_AligningCharacter);

    default AllowGesturesWhenHasAnyOf.AddTag(GameplayTag::Action_Ambient_WatchFight);
}
