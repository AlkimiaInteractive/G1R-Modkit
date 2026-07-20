#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_AM_UOW_UNDEADORCTEMPLEGUARD01_3032 : UConversationCharacterSettings
        {
            default ForCharacter = n"AM_UOW_UNDEADORCTEMPLEGUARD01_3032";
        }
        
        
        class UTopic_Hero__AM_UOW_UNDEADORCTEMPLEGUARD01_3032 : UG1RDialogTopic
        {
            default ForCharacter = n"AM_UOW_UNDEADORCTEMPLEGUARD01_3032";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetUndeadOrcTempleGuard01() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceUndeadorctempleguard01152917 : UTopic_Hero__AM_UOW_UNDEADORCTEMPLEGUARD01_3032
        {
            default DebugId = int64(0xa7be4353e2d30671);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceUndeadorctempleguard01152917);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa7be4353e2d3067a), Hero != nullptr && Hero.IsCloseToCharacter(UndeadOrcTempleGuard01, 1000.0f));
                    DB(int64(0xa7be4353e2d3067b), Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE != nullptr && Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE.IsRunning());
                }
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(UndeadOrcTempleGuard01, 1000.0f))
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE != nullptr && !Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE.IsRunning())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa7be4353e2d30670), EConversationDebugInfo::Executing);
                // KILL THE MORRA! KRUSHAK AWAKEN!
                UndeadOrcTempleGuard01.AI.Say(LocText("TEXT_WIP_JNXNLPG_20250211_123318_2083"));
                DC(int64(0xa7be4353e2d30670), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */