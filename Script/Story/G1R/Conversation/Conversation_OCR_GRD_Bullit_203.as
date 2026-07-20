#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OCR_GRD_BULLIT_203 : UConversationCharacterSettings
        {
            default ForCharacter = n"OCR_GRD_BULLIT_203";
        }
        
        
        class UTopic_Hero__OCR_GRD_BULLIT_203 : UG1RDialogTopic
        {
            default ForCharacter = n"OCR_GRD_BULLIT_203";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetBullit() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"hero");
            }
        }
        
        
        class UChoiceBullit109127 : UTopic_Hero__OCR_GRD_BULLIT_203
        {
            default DebugId = int64(0x167d579702b3e6e5);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceBullit109127);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x1748b60c9b860604), Hero != nullptr && Hero.HasDefeated(Bullit));
                    DB(int64(0x81f98c56dfa2d565), Quest::OldCamp_OCCHAPTER2_BULLYFORBULLIT != nullptr && !Quest::OldCamp_OCCHAPTER2_BULLYFORBULLIT.HasBeenStarted());
                }
                
                if (Hero != nullptr && !Hero.HasDefeated(Bullit))
                    return false;
                
                if (Quest::OldCamp_OCCHAPTER2_BULLYFORBULLIT != nullptr && Quest::OldCamp_OCCHAPTER2_BULLYFORBULLIT.HasBeenStarted())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x167d579702b3e6e4), EConversationDebugInfo::Executing);
                // Ow. What ... how ...?
                Bullit.AI.Say(LocText("TEXT_WIP_RUKFIKD_20241029_171300_41"));
                DC(int64(0x167d579702b3e6e4), EConversationDebugInfo::Done);
                DC(int64(0x167d579702b3e6e7), EConversationDebugInfo::Executing);
                
                // That felt good. 
                Hero.AI.Say(LocText("TEXT_WIP_RUKFIKD_20241029_171415"));
                DC(int64(0x167d579702b3e6e7), EConversationDebugInfo::Done);
                DC(int64(0x167d579702b3e6e8), EConversationDebugInfo::Executing);
                
                // Bloody hell. I ... I'm sorry, okay? We do that to all ...
                Bullit.AI.Say(LocText("TEXT_WIP_RUKFIKD_20241029_171506"));
                DC(int64(0x167d579702b3e6e8), EConversationDebugInfo::Done);
                DC(int64(0x167d579702b3e6e9), EConversationDebugInfo::Executing);
                // I'll leave you be. 
                Bullit.AI.Say(LocText("TEXT_WIP_RUKFIKD_20241029_171554"));
                DC(int64(0x167d579702b3e6e9), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_GRD_BULLIT, Document::UDocumentSegment_Glossary_OC_GRD_BULLIT_Introduction);
                DC(int64(0x1748b60c9b860605), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x1748b60c9b860605), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceBullit139992 : UTopic_Hero__OCR_GRD_BULLIT_203
        {
            default DebugId = int64(0xac7c76cc07d3672e);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceBullit139992);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x668dc368d5f42b4e), Quest::OldCamp_OCCHAPTER2_BULLYFORBULLIT != nullptr && Quest::OldCamp_OCCHAPTER2_BULLYFORBULLIT.IsRunning());
                    DB(int64(0x668dc368d5f42b4f), Bullit != nullptr && Bullit.WasDefeatedBy(Hero));
                }
                
                if (Quest::OldCamp_OCCHAPTER2_BULLYFORBULLIT != nullptr && !Quest::OldCamp_OCCHAPTER2_BULLYFORBULLIT.IsRunning())
                    return false;
                
                if (Bullit != nullptr && !Bullit.WasDefeatedBy(Hero))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xac7c76cc07d3672d), EConversationDebugInfo::Executing);
                // ... What the fuck? Why did you-
                Bullit.AI.Say(LocText("TEXT_WIP_DSWYRII_20250115_150309_41"));
                DC(int64(0xac7c76cc07d3672d), EConversationDebugInfo::Done);
                DC(int64(0xac7c76cc07d36730), EConversationDebugInfo::Executing);
                // Oh. You're that freshie. 
                Bullit.AI.Say(LocText("TEXT_WIP_DSWYRII_20250115_150413"));
                DC(int64(0xac7c76cc07d36730), EConversationDebugInfo::Done);
                DC(int64(0xac7c76cc07d36731), EConversationDebugInfo::Executing);
                
                // That's right. 
                Hero.AI.Say(LocText("TEXT_WIP_DSWYRII_20250115_150418"));
                DC(int64(0xac7c76cc07d36731), EConversationDebugInfo::Done);
                DC(int64(0xac7c76cc07d36736), EConversationDebugInfo::Executing);
                
                // Look, man, if this is about what we did to you at the ...
                Bullit.AI.Say(LocText("TEXT_WIP_DSWYRII_20250115_150706"));
                DC(int64(0xac7c76cc07d36736), EConversationDebugInfo::Done);
                DC(int64(0xac7c76cc07d36733), EConversationDebugInfo::Executing);
                
                // It's not just about that. Bother Syra again and it'll be ...
                Hero.AI.Say(LocText("TEXT_WIP_DSWYRII_20250115_150530"));
                DC(int64(0xac7c76cc07d36733), EConversationDebugInfo::Done);
                DC(int64(0xac7c76cc07d36735), EConversationDebugInfo::Executing);
                
                // That kitchen wench? What's it to you? 
                Bullit.AI.Say(LocText("TEXT_WIP_DSWYRII_20250115_150624"));
                DC(int64(0xac7c76cc07d36735), EConversationDebugInfo::Done);
                DC(int64(0xac7c76cc07d36738), EConversationDebugInfo::Executing);
                
                // Swear it to me. 
                Hero.AI.Say(LocText("TEXT_WIP_DSWYRII_20250115_150915"));
                DC(int64(0xac7c76cc07d36738), EConversationDebugInfo::Done);
                DC(int64(0xac7c76cc07d36739), EConversationDebugInfo::Executing);
                
                // ... All right, all right. I swear. Fuck's sake, you're a ...
                Bullit.AI.Say(LocText("TEXT_WIP_DSWYRII_20250115_150920"));
                DC(int64(0xac7c76cc07d36739), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_GRD_BULLIT, Document::UDocumentSegment_Glossary_OC_GRD_BULLIT_Introduction);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_GRD_BULLIT, Document::UDocumentSegment_Glossary_OC_GRD_BULLIT_Forgiven);
                DC(int64(0x5e669123545dbfaa), EConversationDebugInfo::Executing);
                G1R.BullitDefeated = 1;
                DC(int64(0x5e669123545dbfaa), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBullit145942 : UTopic_Hero__OCR_GRD_BULLIT_203
        {
            default DebugId = int64(0x4e78c69c1f0c11d7);
            default Caption = LocText("TEXT_WIP_CIVTSEI_20250129_224105");
            default PriorityRank = 3;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x668dc368d5f42b51), Quest::OldCamp_OCCHAPTER2_BULLYFORBULLIT != nullptr && Quest::OldCamp_OCCHAPTER2_BULLYFORBULLIT.IsRunning());
                    DB(int64(0x668dc368d5f42b55), Hero != nullptr && !Hero.HasDefeated(Bullit));
                }
                
                if (Quest::OldCamp_OCCHAPTER2_BULLYFORBULLIT != nullptr && !Quest::OldCamp_OCCHAPTER2_BULLYFORBULLIT.IsRunning())
                    return false;
                
                if (Hero != nullptr && Hero.HasDefeated(Bullit))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4e78c69c1f0c11d5), EConversationDebugInfo::Executing);
                // Hey, you like giving women a hard time, don't you?
                Hero.AI.Say(LocText("TEXT_WIP_CIVTSEI_20250129_224105"));
                DC(int64(0x4e78c69c1f0c11d5), EConversationDebugInfo::Done);
                DC(int64(0x4e78c69c1f0c11d6), EConversationDebugInfo::Executing);
                
                // Piss off, man.
                Bullit.AI.Say(LocText("TEXT_WIP_CIVTSEI_20250129_224105_41"));
                DC(int64(0x4e78c69c1f0c11d6), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Bullit_146212,
                    UTopic_Bullit_146192
                );
            }
        }
        
        
        class UTopic_Bullit_146212 : UTopic_Hero__OCR_GRD_BULLIT_203
        {
            default DebugId = int64(0x4e78c69c1f0c11e0);
            default Caption = LocText("TEXT_WIP_CIVTSEI_20250129_224547_2785");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Bullit_146212);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4e78c69c1f0c11e1), EConversationDebugInfo::Executing);
                // Think I'll be giving YOU a hard time.
                Hero.AI.Say(LocText("TEXT_WIP_CIVTSEI_20250129_224547_3436"));
                DC(int64(0x4e78c69c1f0c11e1), EConversationDebugInfo::Done);
                DC(int64(0x668dc368d5f42b53), EConversationDebugInfo::Executing);
                Bullit.AI.StartAttackingImmediatelyLootOnly(Hero);
                DC(int64(0x668dc368d5f42b53), EConversationDebugInfo::Done);
                DC(int64(0x668dc368d5f42b54), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x668dc368d5f42b54), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Bullit_146192 : UTopic_Hero__OCR_GRD_BULLIT_203
        {
            default DebugId = int64(0x4e78c69c1f0c11dc);
            default Caption = LocText("TEXT_WIP_CIVTSEI_20250129_224547");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Bullit_146192);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4e78c69c1f0c11dd), EConversationDebugInfo::Executing);
                // All right.
                Hero.AI.Say(LocText("TEXT_WIP_CIVTSEI_20250129_224547_1924"));
                DC(int64(0x4e78c69c1f0c11dd), EConversationDebugInfo::Done);
                DC(int64(0x129327624d0481f4), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x129327624d0481f4), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceBullitAufsmaul : UTopic_Hero__OCR_GRD_BULLIT_203
        {
            default DebugId = int64(0x61f259b5dbdb8723);
            default Caption = LocText("DIA_BULLIT_AUFSMAUL_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceBullitAufsmaul);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x81f98c56dfa2d56a), Hero != nullptr && !Hero.HasDefeated(Bullit));
                    DB(int64(0x81f98c56dfa2d56b), Quest::OldCamp_OCCHAPTER2_BULLYFORBULLIT != nullptr && !Quest::OldCamp_OCCHAPTER2_BULLYFORBULLIT.HasBeenStarted());
                }
                
                if (Hero != nullptr && Hero.HasDefeated(Bullit))
                    return false;
                
                if (Quest::OldCamp_OCCHAPTER2_BULLYFORBULLIT != nullptr && Quest::OldCamp_OCCHAPTER2_BULLYFORBULLIT.HasBeenStarted())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x61f259b5dbdb8724), EConversationDebugInfo::Executing);
                // I came to shut your fat mouth. 
                Hero.AI.Say(LocText("DIA_BULLIT_AUFSMAUL_15_00"));
                DC(int64(0x61f259b5dbdb8724), EConversationDebugInfo::Done);
                DC(int64(0x61f259b5dbdb8725), EConversationDebugInfo::Executing);
                
                // That so? Then bring it on, green-blood!
                Bullit.AI.Say(LocText("DIA_BULLIT_AUFSMAUL_06_01"));
                DC(int64(0x61f259b5dbdb8725), EConversationDebugInfo::Done);
                DC(int64(0xa406edb4170905af), EConversationDebugInfo::Executing);
                Bullit.AI.StartAttackingImmediatelyLootOnly(Hero);
                DC(int64(0xa406edb4170905af), EConversationDebugInfo::Done);
                DC(int64(0x61f259b5dbdb872a), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x61f259b5dbdb872a), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceBullitExit : UTopic_Hero__OCR_GRD_BULLIT_203
        {
            default DebugId = int64(0x61f259b5dbdb871f);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x61f259b5dbdb8720), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x61f259b5dbdb8720), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceBullitFirst : UTopic_Hero__OCR_GRD_BULLIT_203
        {
            default DebugId = int64(0x61f259b5dbdb8721);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceBullitFirst);
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_DSWYRII_20250115_150920"), int64(0x61f259b5dbdb8721));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x61f259b5dbdb8722), EConversationDebugInfo::Executing);
                // Well, who do we have here ... ain't you the freshie I ...
                Bullit.AI.Say(LocText("DIA_BULLIT_FIRST_06_00"));
                DC(int64(0x61f259b5dbdb8722), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_GRD_BULLIT, Document::UDocumentSegment_Glossary_OC_GRD_BULLIT_Introduction);
            }
        }
        
        
        class UChoiceGrd203BullitWait4sc : UTopic_Hero__OCR_GRD_BULLIT_203
        {
            default DebugId = int64(0x61f259b5dbdb872b);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceGrd203BullitWait4sc);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x91d92469945fb9fb), Quest::SleeperTemple_STCHAPTER5_URIZIEL != nullptr && Quest::SleeperTemple_STCHAPTER5_URIZIEL.IsRunning());
                }
                
                return Quest::SleeperTemple_STCHAPTER5_URIZIEL != nullptr && Quest::SleeperTemple_STCHAPTER5_URIZIEL.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x61f259b5dbdb872c), EConversationDebugInfo::Executing);
                // ... You. Beliar's arse, I shoulda just drowned you that ...
                Bullit.AI.Say(LocText("DIA_GRD_203_BULLIT_WAIT4SC_06_01"));
                DC(int64(0x61f259b5dbdb872c), EConversationDebugInfo::Done);
                DC(int64(0x61f259b5dbdb872d), EConversationDebugInfo::Executing);
                
                // Hindsight's a bitch, isn't it? 
                Hero.AI.Say(LocText("DIA_GRD_203_BULLIT_WAIT4SC_15_02"));
                DC(int64(0x61f259b5dbdb872d), EConversationDebugInfo::Done);
                DC(int64(0x61f259b5dbdb872e), EConversationDebugInfo::Executing);
                
                // Fuckin' meatbug. Trust me, I ain't holdin' back this ...
                Bullit.AI.Say(LocText("DIA_GRD_203_BULLIT_WAIT4SC_06_03"));
                DC(int64(0x61f259b5dbdb872e), EConversationDebugInfo::Done);
                DC(int64(0xa406edb4170905bc), EConversationDebugInfo::Executing);
                Bullit.SetTrueGuild(UGE_Guild_Human_OldCamp_Guard);
                DC(int64(0xa406edb4170905bc), EConversationDebugInfo::Done);
                DC(int64(0xa406edb4170905c2), EConversationDebugInfo::Executing);
                Bullit.AI.StartAttackingImmediately(Hero);
                DC(int64(0xa406edb4170905c2), EConversationDebugInfo::Done);
                DC(int64(0x61f259b5dbdb8734), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x61f259b5dbdb8734), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */