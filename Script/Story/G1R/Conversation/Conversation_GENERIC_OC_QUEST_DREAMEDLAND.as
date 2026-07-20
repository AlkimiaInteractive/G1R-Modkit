#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_GENERIC_OC_QUEST_DREAMEDLAND : UConversationCharacterSettings
        {
            default ForCharacter = n"GENERIC_OC_QUEST_DREAMEDLAND";
        }
        
        
        class UTopic_Hero__GENERIC_OC_QUEST_DREAMEDLAND : UG1RDialogTopic
        {
            default ForCharacter = n"GENERIC_OC_QUEST_DREAMEDLAND";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetQuest() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceQuest137058 : UTopic_Hero__GENERIC_OC_QUEST_DREAMEDLAND
        {
            default DebugId = int64(0xb11e587503ea68ed);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            default Rules.HideIfKnows(UChoiceQuest137058);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb11e587503ea68ec), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xb11e587503ea68ec), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Quest_QuestDreamLand : UTopic_Hero__GENERIC_OC_QUEST_DREAMEDLAND
        {
            default DebugId = int64(0xb11e587503ea68f1);
            default Caption = LocText("TEXT_WIP_WKHQRQD_20250110_120704_491");
            default PriorityRank = 4;
            
            default Rules.HideIfKnows(UTopic_Quest_QuestDreamLand);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Quest.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Quest_QuestDreamLand_Reply1)) return false;
                if (!Quest.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Quest_QuestDreamLand_Reply2)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xb11e587503ea68f4), G1R != nullptr && G1R.HasReachedChapter(3));
                    DB(int64(0xb11e587503ea68f8), Hero != nullptr && !Hero.HasSaid(LocText("TEXT_WIP_WKHQRQD_20250110_120704_491")));
                }
                
                if (G1R != nullptr && !G1R.HasReachedChapter(3))
                    return false;
                
                if (Hero != nullptr && Hero.HasSaid(LocText("TEXT_WIP_WKHQRQD_20250110_120704_491")))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb11e587503ea68ef), EConversationDebugInfo::Executing);
                // Things seem calmer here than before. What's going on?
                Hero.AI.Say(LocText("TEXT_WIP_WKHQRQD_20250110_120704_491"));
                DC(int64(0xb11e587503ea68ef), EConversationDebugInfo::Done);
                DC(int64(0x201fa16fd4a33692), EConversationDebugInfo::Executing);
                
                Quest.AI.Say(GameplayTag::Sound_Voice_Conversation_Quest_QuestDreamLand_Reply1);
                DC(int64(0x201fa16fd4a33692), EConversationDebugInfo::Done);
                DC(int64(0x201fa16fd4a33693), EConversationDebugInfo::Executing);
                Quest.AI.Say(GameplayTag::Sound_Voice_Conversation_Quest_QuestDreamLand_Reply2);
                DC(int64(0x201fa16fd4a33693), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */