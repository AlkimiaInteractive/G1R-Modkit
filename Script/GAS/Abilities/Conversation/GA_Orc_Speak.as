class UGA_Orc_Speak : UGameplayAbilitySpeak
{
    default m_LoadAssetsPriority = 150;
    default SoundAttenuation = n"SoundAttenuation'/Game/Conversation/SA_Human_Voice.SA_Human_Voice'";

    default BlockGesturesWhenHasAnyOf.AddTag(GameplayTag::State_Interact);
    default BlockGesturesWhenHasAnyOf.AddTag(GameplayTag::State_Carrying);
}