UCLASS()
class UAIState_AlertPickpocket : UAIState_AlertCrime
{
    default OwnedGameplayTags.AddTag(GameplayTag::AIState_AlertCrime_Pickpocket);
    default AIStateTag = GameplayTag::AIState_AlertCrime_Pickpocket;
    default SwitchAIStateMode = ESwitchAIStateMode::Interrupt;
    default EndInteractionMode = ESwitchAIStateEndInteractionMode::None;

    default AlertVoicelineTag = GameplayTag::Sound_Voice_Reaction_Crime_Pickpocketing_BehindYou;
    default AlertEventTag = GameplayTag::Perception_Alert_Pickpocket;
    default VictimDirectAssessmentEventTag = GameplayTag::AIEvent_Heard_Alert_Pickpocket;
}