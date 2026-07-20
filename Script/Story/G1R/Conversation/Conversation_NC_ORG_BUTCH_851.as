#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_NC_ORG_BUTCH_851 : UConversationCharacterSettings
        {
            default ForCharacter = n"NC_ORG_BUTCH_851";
        }
        
        
        class UTopic_Hero__NC_ORG_BUTCH_851 : UG1RDialogTopic
        {
            default ForCharacter = n"NC_ORG_BUTCH_851";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetButch() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceButch232840 : UTopic_Hero__NC_ORG_BUTCH_851
        {
            default DebugId = int64(0xfc71d1183fcce396);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x7e544846c881444b), Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr && !Quest::NewCamp_NCCHAPTER1_CONVOY.HasBeenStarted());
                    DB(int64(0xfc71d1183fcce39a), G1R.Butch_Welcome != 0);
                    DB(int64(0xfc71d1183fcce39b), Hero != nullptr && Hero.IsInConversation());
                    DB(int64(0xfc71d1183fcce44d), Hero != nullptr && !Hero.HasDefeated(Butch));
                }
                
                if (Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr && Quest::NewCamp_NCCHAPTER1_CONVOY.HasBeenStarted())
                    return false;
                
                if (G1R.Butch_Welcome == 0)
                    return false;
                
                if (Hero != nullptr && !Hero.IsInConversation())
                    return false;
                
                if (Hero != nullptr && Hero.HasDefeated(Butch))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xfc71d1183fcce391), EConversationDebugInfo::Executing);
                Butch.AI.StartFightCustomWithFists(Hero, GameplayTag::AIConflict_FightType_Petty, GameplayTag::AIConflict_FightGoal_Defeat, GameplayTag::AIConflict_Duration_Minimal);
                DC(int64(0xfc71d1183fcce391), EConversationDebugInfo::Done);
                DC(int64(0xfc71d1183fcce398), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xfc71d1183fcce398), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceButch84921 : UTopic_Hero__NC_ORG_BUTCH_851
        {
            default DebugId = int64(0xa193faa2e0fc117f);
            default Caption = LocText("TEXT_WIP_NWAGUXL_20240318_102219");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceButch84921);
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_BJTCJRF_20240604_141147_41"), int64(0xa193faa2e0fc117f));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x7e544846c8814449), Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr && Quest::NewCamp_NCCHAPTER1_CONVOY.IsRunning());
                }
                
                return Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr && Quest::NewCamp_NCCHAPTER1_CONVOY.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa193faa2e0fc117d), EConversationDebugInfo::Executing);
                // Hey. 
                Hero.AI.Say(LocText("TEXT_WIP_NWAGUXL_20240318_102219"));
                DC(int64(0xa193faa2e0fc117d), EConversationDebugInfo::Done);
                DC(int64(0xa193faa2e0fc117e), EConversationDebugInfo::Executing);
                
                // No time for chatter, freshie. We got a job to do. 
                Butch.AI.Say(LocText("TEXT_WIP_NWAGUXL_20240318_102219_2238"));
                DC(int64(0xa193faa2e0fc117e), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_ORG_BUTCH, Document::UDocumentSegment_Glossary_NC_ORG_BUTCH_Introduction);
                DC(int64(0x7e544846c8814447), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x7e544846c8814447), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceButchExit : UTopic_Hero__NC_ORG_BUTCH_851
        {
            default DebugId = int64(0xdc624744960d9346);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xdc624744960d9347), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xdc624744960d9347), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceButchHello : UTopic_Hero__NC_ORG_BUTCH_851
        {
            default DebugId = int64(0xdc624744960d9348);
            default Caption = LocText("DIA_BUTCH_HELLO_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceButchHello);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x7e544846c881444b), Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr && !Quest::NewCamp_NCCHAPTER1_CONVOY.IsRunning());
                }
                
                return Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr && !Quest::NewCamp_NCCHAPTER1_CONVOY.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xdc624744960d9349), EConversationDebugInfo::Executing);
                // Hey, I'm new here. Who are you?
                Hero.AI.Say(LocText("DIA_BUTCH_HELLO_15_00"));
                DC(int64(0xdc624744960d9349), EConversationDebugInfo::Done);
                DC(int64(0xdc624744960d934a), EConversationDebugInfo::Executing);
                
                // None of your fuckin' business. Get outta me face. 
                Butch.AI.Say(LocText("DIA_BUTCH_HELLO_13_01"));
                DC(int64(0xdc624744960d934a), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_ORG_BUTCH, Document::UDocumentSegment_Glossary_NC_ORG_BUTCH_Introduction);
                DC(int64(0xfc71d1183fcce393), EConversationDebugInfo::Executing);
                G1R.Butch_Welcome = 1;
                DC(int64(0xfc71d1183fcce393), EConversationDebugInfo::Done);
                DC(int64(0xdc624744960d934b), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xdc624744960d934b), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */