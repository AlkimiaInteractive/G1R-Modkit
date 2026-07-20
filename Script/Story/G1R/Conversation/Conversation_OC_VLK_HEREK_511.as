#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OC_VLK_HEREK_511 : UConversationCharacterSettings
        {
            default ForCharacter = n"OC_VLK_HEREK_511";
        }
        
        
        class UTopic_Hero__OC_VLK_HEREK_511 : UG1RDialogTopic
        {
            default ForCharacter = n"OC_VLK_HEREK_511";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetHerek() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"Hero");
            }
        }
        
        
        class UChoiceHerekAnlegen : UTopic_Hero__OC_VLK_HEREK_511
        {
            default DebugId = int64(0x436f3dd8408b37bb);
            default Caption = LocText("DIA_HEREK_ANLEGEN_15_00");
            default PriorityRank = 2;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceHerekMotz);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x436f3dd8408b37bc), EConversationDebugInfo::Executing);
                // Scary. How about you try me?
                Hero.AI.Say(LocText("DIA_HEREK_ANLEGEN_15_00"));
                DC(int64(0x436f3dd8408b37bc), EConversationDebugInfo::Done);
                DC(int64(0x436f3dd8408b37bd), EConversationDebugInfo::Executing);
                
                // You want me to fuck you up? Sure thing!
                Herek.AI.Say(LocText("DIA_HEREK_ANLEGEN_01_01"));
                DC(int64(0x436f3dd8408b37bd), EConversationDebugInfo::Done);
                DC(int64(0x6da0b63c604a4dc1), EConversationDebugInfo::Executing);
                Herek.AI.StartAttackingImmediatelyLootOnly(Hero);
                DC(int64(0x6da0b63c604a4dc1), EConversationDebugInfo::Done);
                DC(int64(0x436f3dd8408b37c0), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x436f3dd8408b37c0), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceHerekBully : UTopic_Hero__OC_VLK_HEREK_511
        {
            default DebugId = int64(0x436f3dd8408b37a6);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceHerekBully);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x436f3dd8408b37a7), Herek != nullptr && Herek.IsCloseToCharacter(Hero, G1R.ZivilAnquatschDist * 100.0f));
                    DB(int64(0x436f3dd8408b37a8), G1R.Herek_ProtectionBully != 0);
                    DB(int64(0x93a54e9a362090b6), Quest::NewCamp_NCCHAPTER1_JOINNC != nullptr && !Quest::NewCamp_NCCHAPTER1_JOINNC.HasSucceeded());
                    DB(int64(0x93a54e9a362090c3), Quest::SwampCamp_SCCHAPTER1_JOINPSI != nullptr && !Quest::SwampCamp_SCCHAPTER1_JOINPSI.HasSucceeded());
                }
                
                if (Herek != nullptr && !Herek.IsCloseToCharacter(Hero, G1R.ZivilAnquatschDist * 100.0f))
                    return false;
                
                if (G1R.Herek_ProtectionBully == 0)
                    return false;
                
                if (Quest::NewCamp_NCCHAPTER1_JOINNC != nullptr && Quest::NewCamp_NCCHAPTER1_JOINNC.HasSucceeded())
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER1_JOINPSI != nullptr && Quest::SwampCamp_SCCHAPTER1_JOINPSI.HasSucceeded())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x436f3dd8408b37a9), EConversationDebugInfo::Executing);
                // Oy, you! Wait a minute. You just had a chat with ...
                Herek.AI.Say(LocText("DIA_HEREK_BULLY_01_00"));
                DC(int64(0x436f3dd8408b37a9), EConversationDebugInfo::Done);
                DC(int64(0x436f3dd8408b37aa), EConversationDebugInfo::Executing);
                
                // Why are you asking? 
                Hero.AI.Say(LocText("DIA_HEREK_BULLY_15_01"));
                DC(int64(0x436f3dd8408b37aa), EConversationDebugInfo::Done);
                DC(int64(0x436f3dd8408b37ab), EConversationDebugInfo::Executing);
                
                // Good job not paying your protection money.
                Herek.AI.Say(LocText("DIA_HEREK_BULLY_01_02"));
                DC(int64(0x436f3dd8408b37ab), EConversationDebugInfo::Done);
                DC(int64(0x436f3dd8408b37ac), EConversationDebugInfo::Executing);
                // That means WE gotta pay your part now. 
                Herek.AI.Say(LocText("DIA_HEREK_BULLY_01_03"));
                DC(int64(0x436f3dd8408b37ac), EConversationDebugInfo::Done);
                DC(int64(0x436f3dd8408b37ad), EConversationDebugInfo::Executing);
                // I'll make sure you remember that next time he asks you. 
                Herek.AI.Say(LocText("DIA_HEREK_BULLY_01_04"));
                DC(int64(0x436f3dd8408b37ad), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_VLK_HEREK, Document::UDocumentSegment_Glossary_OC_VLK_HEREK_Introduction_2);
                DC(int64(0x6da0b63c604a4dc8), EConversationDebugInfo::Executing);
                Herek.SetRelationshipTowards(Hero, ERelationship::Angry);
                DC(int64(0x6da0b63c604a4dc8), EConversationDebugInfo::Done);
                DC(int64(0x6da0b63c604a4dca), EConversationDebugInfo::Executing);
                Herek.AI.StartAttackingImmediatelyLootOnly(Hero);
                DC(int64(0x6da0b63c604a4dca), EConversationDebugInfo::Done);
                DC(int64(0x436f3dd8408b37b1), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x436f3dd8408b37b1), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceHerekExit : UTopic_Hero__OC_VLK_HEREK_511
        {
            default DebugId = int64(0x436f3dd8408b37a4);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x436f3dd8408b37a5), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x436f3dd8408b37a5), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceHerekMotz : UTopic_Hero__OC_VLK_HEREK_511
        {
            default DebugId = int64(0x436f3dd8408b37b2);
            default Caption = LocText("DIA_HEREK_MOTZ_15_00");
            default PriorityRank = 2;
            
            default Rules.HideIfKnows(UChoiceHerekMotz);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x436f3dd8408b37b3), G1R.Herek_ProtectionBully == 0);
                }
                
                return G1R.Herek_ProtectionBully == 0;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x436f3dd8408b37b4), EConversationDebugInfo::Executing);
                // Hey - how's it going?
                Hero.AI.Say(LocText("DIA_HEREK_MOTZ_15_00"));
                DC(int64(0x436f3dd8408b37b4), EConversationDebugInfo::Done);
                DC(int64(0x436f3dd8408b37b5), EConversationDebugInfo::Executing);
                
                // Fuck off. 
                Herek.AI.Say(LocText("DIA_HEREK_MOTZ_01_01"));
                DC(int64(0x436f3dd8408b37b5), EConversationDebugInfo::Done);
                DC(int64(0x436f3dd8408b37b6), EConversationDebugInfo::Executing);
                
                // What?
                Hero.AI.Say(LocText("DIA_HEREK_MOTZ_15_02"));
                DC(int64(0x436f3dd8408b37b6), EConversationDebugInfo::Done);
                DC(int64(0x436f3dd8408b37b7), EConversationDebugInfo::Executing);
                
                // I don't like your mug, that's all. 
                Herek.AI.Say(LocText("DIA_HEREK_MOTZ_01_03"));
                DC(int64(0x436f3dd8408b37b7), EConversationDebugInfo::Done);
                DC(int64(0x436f3dd8408b37b8), EConversationDebugInfo::Executing);
                // You know why I'm here? Cause I killed twelve men in a ...
                Herek.AI.Say(LocText("DIA_HEREK_MOTZ_01_04"));
                DC(int64(0x436f3dd8408b37b8), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_VLK_HEREK, Document::UDocumentSegment_Glossary_OC_VLK_HEREK_Introduction);
                DC(int64(0x6da0b63c604a4dd7), EConversationDebugInfo::Executing);
                Herek.SetRelationshipTowards(Hero, ERelationship::Angry);
                DC(int64(0x6da0b63c604a4dd7), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */