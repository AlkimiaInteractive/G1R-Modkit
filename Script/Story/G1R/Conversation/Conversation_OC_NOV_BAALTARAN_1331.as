#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OC_NOV_BAALTARAN_1331 : UConversationCharacterSettings
        {
            default ForCharacter = n"OC_NOV_BAALTARAN_1331";
        }
        
        
        class UTopic_Hero__OC_NOV_BAALTARAN_1331 : UG1RDialogTopic
        {
            default ForCharacter = n"OC_NOV_BAALTARAN_1331";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetBaalTaran() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceBaaltaranBeweis : UTopic_Hero__OC_NOV_BAALTARAN_1331
        {
            default DebugId = int64(0x6a66140eaa0ad1ac);
            default Caption = LocText("DIA_BAALTARAN_BEWEIS_15_00");
            default PriorityRank = 2;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBaaltaranLehre);
            default Rules.HideIfKnows(UChoiceBaaltaranBeweis);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6a66140eaa0ad1ad), EConversationDebugInfo::Executing);
                // How does this god show you his power?
                Hero.AI.Say(LocText("DIA_BAALTARAN_BEWEIS_15_00"));
                DC(int64(0x6a66140eaa0ad1ad), EConversationDebugInfo::Done);
                DC(int64(0x6a66140eaa0ad1ae), EConversationDebugInfo::Executing);
                
                // He speaks to us through our visions. Hear his voice ...
                BaalTaran.AI.Say(LocText("DIA_BAALTARAN_BEWEIS_05_01"));
                DC(int64(0x6a66140eaa0ad1ae), EConversationDebugInfo::Done);
                DC(int64(0x6a66140eaa0ad1af), EConversationDebugInfo::Executing);
                // The herbs we gather in the swamp help us with this: ...
                BaalTaran.AI.Say(LocText("DIA_BAALTARAN_BEWEIS_05_02"));
                DC(int64(0x6a66140eaa0ad1af), EConversationDebugInfo::Done);
                DC(int64(0x6a66140eaa0ad1b0), EConversationDebugInfo::Executing);
                
                // I see.
                Hero.AI.Say(LocText("DIA_BAALTARAN_BEWEIS_15_03"));
                DC(int64(0x6a66140eaa0ad1b0), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBaaltaranBruderschaft : UTopic_Hero__OC_NOV_BAALTARAN_1331
        {
            default DebugId = int64(0x6a66140eaa0ad198);
            default Caption = LocText("DIA_BAALTARAN_BRUDERSCHAFT_15_00");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBaaltaranGreet);
            default Rules.HideIfKnows(UChoiceBaaltaranBruderschaft);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6a66140eaa0ad199), EConversationDebugInfo::Executing);
                // Brotherhood of the Sleeper?
                Hero.AI.Say(LocText("DIA_BAALTARAN_BRUDERSCHAFT_15_00"));
                DC(int64(0x6a66140eaa0ad199), EConversationDebugInfo::Done);
                DC(int64(0x6a66140eaa0ad19a), EConversationDebugInfo::Executing);
                
                // Yes. We are a brotherhood of men following a new faith.
                BaalTaran.AI.Say(LocText("DIA_BAALTARAN_BRUDERSCHAFT_05_01"));
                DC(int64(0x6a66140eaa0ad19a), EConversationDebugInfo::Done);
                DC(int64(0x6a66140eaa0ad19b), EConversationDebugInfo::Executing);
                // We have a camp east of here, in the swamps. My mission ...
                BaalTaran.AI.Say(LocText("DIA_BAALTARAN_BRUDERSCHAFT_05_02"));
                DC(int64(0x6a66140eaa0ad19b), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBaaltaranExit : UTopic_Hero__OC_NOV_BAALTARAN_1331
        {
            default DebugId = int64(0x6a66140eaa0ad193);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6a66140eaa0ad194), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x6a66140eaa0ad194), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceBaaltaranFreiheit : UTopic_Hero__OC_NOV_BAALTARAN_1331
        {
            default DebugId = int64(0x6a66140eaa0ad1a8);
            default Caption = LocText("DIA_BAALTARAN_FREIHEIT_15_00");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBaaltaranLehre);
            default Rules.HideIfKnows(UChoiceBaaltaranFreiheit);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6a66140eaa0ad1a9), EConversationDebugInfo::Executing);
                // And how exactly will the Sleeper "lead you to freedom?"
                Hero.AI.Say(LocText("DIA_BAALTARAN_FREIHEIT_15_00"));
                DC(int64(0x6a66140eaa0ad1a9), EConversationDebugInfo::Done);
                DC(int64(0x6a66140eaa0ad1aa), EConversationDebugInfo::Executing);
                
                // Through a great invocation we have been preparing for a ...
                BaalTaran.AI.Say(LocText("DIA_BAALTARAN_FREIHEIT_05_01"));
                DC(int64(0x6a66140eaa0ad1aa), EConversationDebugInfo::Done);
                DC(int64(0x6a66140eaa0ad1ab), EConversationDebugInfo::Executing);
                // During this invocation, the Sleeper will grant us a ...
                BaalTaran.AI.Say(LocText("DIA_BAALTARAN_FREIHEIT_05_02"));
                DC(int64(0x6a66140eaa0ad1ab), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBaaltaranGreet : UTopic_Hero__OC_NOV_BAALTARAN_1331
        {
            default DebugId = int64(0x6a66140eaa0ad195);
            default Caption = LocText("DIA_BAALTARAN_GREET_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceBaaltaranGreet);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6a66140eaa0ad196), EConversationDebugInfo::Executing);
                
                // Hey, I'm new here. Who are you?
                Hero.AI.Say(LocText("DIA_BAALTARAN_GREET_15_00"));
                DC(int64(0x6a66140eaa0ad196), EConversationDebugInfo::Done);
                DC(int64(0x6a66140eaa0ad197), EConversationDebugInfo::Executing);
                
                // Me? I am Taran. I'm with the Brotherhood of the Sleeper.
                BaalTaran.AI.Say(LocText("DIA_BAALTARAN_GREET_05_01"));
                DC(int64(0x6a66140eaa0ad197), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_NOV_BAALTARAN, Document::UDocumentSegment_Glossary_OC_NOV_BAALTARAN_Introduction);
            }
        }
        
        
        class UChoiceBaaltaranIntocastle : UTopic_Hero__OC_NOV_BAALTARAN_1331
        {
            default DebugId = int64(0x6a66140eaa0ad1b9);
            default Caption = LocText("DIA_BAALTARAN_INTOCASTLE_15_00");
            default PriorityRank = 4;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBaaltaranGreet);
            default Rules.HideIfKnows(UChoiceBaaltaranIntocastle);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xc12c60aa2623803d), G1R != nullptr && !G1R.HasReachedChapter(2));
                }
                
                return G1R != nullptr && !G1R.HasReachedChapter(2);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6a66140eaa0ad1ba), EConversationDebugInfo::Executing);
                // I have to get into the castle. Can you help me with that ...
                Hero.AI.Say(LocText("DIA_BAALTARAN_INTOCASTLE_15_00"));
                DC(int64(0x6a66140eaa0ad1ba), EConversationDebugInfo::Done);
                DC(int64(0x6a66140eaa0ad1bb), EConversationDebugInfo::Executing);
                
                // I fear not, Brother. The only ones that the warders ...
                BaalTaran.AI.Say(LocText("DIA_BAALTARAN_INTOCASTLE_05_01"));
                DC(int64(0x6a66140eaa0ad1bb), EConversationDebugInfo::Done);
                DC(int64(0x6a66140eaa0ad1bc), EConversationDebugInfo::Executing);
                // That is how we sustain ourselves: we harvest swampweed ...
                BaalTaran.AI.Say(LocText("DIA_BAALTARAN_INTOCASTLE_05_02"));
                DC(int64(0x6a66140eaa0ad1bc), EConversationDebugInfo::Done);
                DC(int64(0x6a66140eaa0ad1bd), EConversationDebugInfo::Executing);
                // If you were one of Cor Kalom's couriers, you could get ...
                BaalTaran.AI.Say(LocText("DIA_BAALTARAN_INTOCASTLE_05_03"));
                DC(int64(0x6a66140eaa0ad1bd), EConversationDebugInfo::Done);
                DC(int64(0x6a66140eaa0ad1be), EConversationDebugInfo::Executing);
                // What business do you have in the castle, anyway?
                BaalTaran.AI.Say(LocText("DIA_BAALTARAN_INTOCASTLE_05_04"));
                DC(int64(0x6a66140eaa0ad1be), EConversationDebugInfo::Done);
                Subdialog(
                    UChoiceBaaltaranIntocastleMeetsomeone
                );
            }
        }
        
        
        class UChoiceBaaltaranIntocastleMeetsomeone : UTopic_Hero__OC_NOV_BAALTARAN_1331
        {
            default DebugId = int64(0xe8603e87342bdd87);
            default Caption = LocText("DIA_BAALTARAN_INTOCASTLE_MEETSOMEONE_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6a66140eaa0ad1c1), EConversationDebugInfo::Executing);
                // There's someone I have to see.
                Hero.AI.Say(LocText("DIA_BAALTARAN_INTOCASTLE_MEETSOMEONE_15_00"));
                DC(int64(0x6a66140eaa0ad1c1), EConversationDebugInfo::Done);
                DC(int64(0x6a66140eaa0ad1c2), EConversationDebugInfo::Executing);
                
                // Who? Why not just wait for him to come out?
                BaalTaran.AI.Say(LocText("DIA_BAALTARAN_INTOCASTLE_MEETSOMEONE_05_01"));
                DC(int64(0x6a66140eaa0ad1c2), EConversationDebugInfo::Done);
                Subdialog(
                    UChoiceBaaltaranIntocastleForgetit,
                    UChoiceBaaltaranIntocastleMage
                );
            }
        }
        
        
        class UChoiceBaaltaranIntocastleForgetit : UTopic_Hero__OC_NOV_BAALTARAN_1331
        {
            default DebugId = int64(0xe8603e87342bdd89);
            default Caption = LocText("DIA_BAALTARAN_INTOCASTLE_FORGETIT_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6a66140eaa0ad1c5), EConversationDebugInfo::Executing);
                // None of your business.
                Hero.AI.Say(LocText("DIA_BAALTARAN_INTOCASTLE_FORGETIT_15_00"));
                DC(int64(0x6a66140eaa0ad1c5), EConversationDebugInfo::Done);
                DC(int64(0x6a66140eaa0ad1c6), EConversationDebugInfo::Executing);
                
                // As you say, stranger. I just wanted to help you.
                BaalTaran.AI.Say(LocText("DIA_BAALTARAN_INTOCASTLE_FORGETIT_05_01"));
                DC(int64(0x6a66140eaa0ad1c6), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBaaltaranIntocastleMage : UTopic_Hero__OC_NOV_BAALTARAN_1331
        {
            default DebugId = int64(0xe8603e87342bdd8d);
            default Caption = LocText("DIA_BAALTARAN_INTOCASTLE_MAGE_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6a66140eaa0ad1c8), EConversationDebugInfo::Executing);
                
                // One of the mages.
                Hero.AI.Say(LocText("DIA_BAALTARAN_INTOCASTLE_MAGE_15_00"));
                DC(int64(0x6a66140eaa0ad1c8), EConversationDebugInfo::Done);
                DC(int64(0x6a66140eaa0ad1c9), EConversationDebugInfo::Executing);
                
                // Ahh ... well, it is true, those hardly leave the castle. ...
                BaalTaran.AI.Say(LocText("DIA_BAALTARAN_INTOCASTLE_MAGE_05_01"));
                DC(int64(0x6a66140eaa0ad1c9), EConversationDebugInfo::Done);
                DC(int64(0x6a66140eaa0ad1ca), EConversationDebugInfo::Executing);
                // What do you want of them? Buy magic runes? Or potions?
                BaalTaran.AI.Say(LocText("DIA_BAALTARAN_INTOCASTLE_MAGE_05_02"));
                DC(int64(0x6a66140eaa0ad1ca), EConversationDebugInfo::Done);
                Subdialog(
                    UChoiceBaaltaranIntocastleExactly,
                    UChoiceBaaltaranIntocastleLetter
                );
            }
        }
        
        
        class UChoiceBaaltaranIntocastleExactly : UTopic_Hero__OC_NOV_BAALTARAN_1331
        {
            default DebugId = int64(0xe8603e87342bdd8f);
            default Caption = LocText("DIA_BAALTARAN_INTOCASTLE_EXACTLY_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6a66140eaa0ad1cd), EConversationDebugInfo::Executing);
                // That's right.
                Hero.AI.Say(LocText("DIA_BAALTARAN_INTOCASTLE_EXACTLY_15_00"));
                DC(int64(0x6a66140eaa0ad1cd), EConversationDebugInfo::Done);
                DC(int64(0x6a66140eaa0ad1ce), EConversationDebugInfo::Executing);
                
                // I knew it! What else would a simple man like you want ...
                BaalTaran.AI.Say(LocText("DIA_BAALTARAN_INTOCASTLE_EXACTLY_05_01"));
                DC(int64(0x6a66140eaa0ad1ce), EConversationDebugInfo::Done);
                DC(int64(0x6a66140eaa0ad1cf), EConversationDebugInfo::Executing);
                // Take my advice: forget about the mages. They charge far ...
                BaalTaran.AI.Say(LocText("DIA_BAALTARAN_INTOCASTLE_EXACTLY_05_02"));
                DC(int64(0x6a66140eaa0ad1cf), EConversationDebugInfo::Done);
                DC(int64(0x6a66140eaa0ad1d0), EConversationDebugInfo::Executing);
                // Whatever runes or potions you need, you will get them ...
                BaalTaran.AI.Say(LocText("DIA_BAALTARAN_INTOCASTLE_EXACTLY_05_03"));
                DC(int64(0x6a66140eaa0ad1d0), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBaaltaranIntocastleLetter : UTopic_Hero__OC_NOV_BAALTARAN_1331
        {
            default DebugId = int64(0xe8603e87342bdd95);
            default Caption = LocText("DIA_BAALTARAN_INTOCASTLE_LETTER_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6a66140eaa0ad1d2), EConversationDebugInfo::Executing);
                
                // I have a letter for the highest Fire Mage.
                Hero.AI.Say(LocText("DIA_BAALTARAN_INTOCASTLE_LETTER_15_00"));
                DC(int64(0x6a66140eaa0ad1d2), EConversationDebugInfo::Done);
                DC(int64(0x6a66140eaa0ad1d3), EConversationDebugInfo::Executing);
                
                // Really? Where did you get it? Wait, allow me to guess: ...
                BaalTaran.AI.Say(LocText("DIA_BAALTARAN_INTOCASTLE_LETTER_05_01"));
                DC(int64(0x6a66140eaa0ad1d3), EConversationDebugInfo::Done);
                DC(int64(0x6a66140eaa0ad1d4), EConversationDebugInfo::Executing);
                // Quite careless of you to just tell me this. But fear ...
                BaalTaran.AI.Say(LocText("DIA_BAALTARAN_INTOCASTLE_LETTER_05_02"));
                DC(int64(0x6a66140eaa0ad1d4), EConversationDebugInfo::Done);
                DC(int64(0x6a66140eaa0ad1d5), EConversationDebugInfo::Executing);
                // But do yourself a favor and keep this to yourself in the ...
                BaalTaran.AI.Say(LocText("DIA_BAALTARAN_INTOCASTLE_LETTER_05_03"));
                DC(int64(0x6a66140eaa0ad1d5), EConversationDebugInfo::Done);
                DC(int64(0x6a66140eaa0ad1d6), EConversationDebugInfo::Executing);
                // Messages from the outside are extremely valuable.
                BaalTaran.AI.Say(LocText("DIA_BAALTARAN_INTOCASTLE_LETTER_05_04"));
                DC(int64(0x6a66140eaa0ad1d6), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBaaltaranLehre : UTopic_Hero__OC_NOV_BAALTARAN_1331
        {
            default DebugId = int64(0x6a66140eaa0ad1a1);
            default Caption = LocText("DIA_BAALTARAN_LEHRE_15_00");
            default PriorityRank = 2;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBaaltaranBruderschaft);
            default Rules.HideIfKnows(UChoiceBaaltaranLehre);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6a66140eaa0ad1a2), EConversationDebugInfo::Executing);
                
                // Tell me about the Sleeper.
                Hero.AI.Say(LocText("DIA_BAALTARAN_LEHRE_15_00"));
                DC(int64(0x6a66140eaa0ad1a2), EConversationDebugInfo::Done);
                DC(int64(0x6a66140eaa0ad1a3), EConversationDebugInfo::Executing);
                
                // Well, where do I even start? The Sleeper is a powerful ...
                BaalTaran.AI.Say(LocText("DIA_BAALTARAN_LEHRE_05_01"));
                DC(int64(0x6a66140eaa0ad1a3), EConversationDebugInfo::Done);
                DC(int64(0x6a66140eaa0ad1a4), EConversationDebugInfo::Executing);
                // So far, his powers are limited to the realm of thoughts, ...
                BaalTaran.AI.Say(LocText("DIA_BAALTARAN_LEHRE_05_02"));
                DC(int64(0x6a66140eaa0ad1a4), EConversationDebugInfo::Done);
                DC(int64(0x6a66140eaa0ad1a5), EConversationDebugInfo::Executing);
                // And it is we who he chose to spread the faith and ...
                BaalTaran.AI.Say(LocText("DIA_BAALTARAN_LEHRE_05_03"));
                DC(int64(0x6a66140eaa0ad1a5), EConversationDebugInfo::Done);
                DC(int64(0x4f4013217835caf), EConversationDebugInfo::Executing);
                
                // If he's so powerful, why does he need believers?
                Hero.AI.Say(LocText("TEXT_WIP_MRZXSLD_20241031_135926"));
                DC(int64(0x4f4013217835caf), EConversationDebugInfo::Done);
                DC(int64(0x6a66140eaa0ad1a6), EConversationDebugInfo::Executing);
                
                // Like I said, he is still bound by his sleep. Until his ...
                BaalTaran.AI.Say(LocText("DIA_BAALTARAN_LEHRE_05_04"));
                DC(int64(0x6a66140eaa0ad1a6), EConversationDebugInfo::Done);
                DC(int64(0x6a66140eaa0ad1a7), EConversationDebugInfo::Executing);
                // But it's also in our own best interest - once the day is ...
                BaalTaran.AI.Say(LocText("DIA_BAALTARAN_LEHRE_05_05"));
                DC(int64(0x6a66140eaa0ad1a7), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBaaltaranWaytost : UTopic_Hero__OC_NOV_BAALTARAN_1331
        {
            default DebugId = int64(0x6a66140eaa0ad1b1);
            default Caption = LocText("DIA_BAALTARAN_WAYTOST_15_00");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBaaltaranBruderschaft);
            default Rules.HideIfKnows(UChoiceBaaltaranWaytost);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x6a66140eaa0ad1b2), Quest::SwampCamp_SCCHAPTER1_JOINPSI != nullptr && !Quest::SwampCamp_SCCHAPTER1_JOINPSI.HasBeenStarted());
                }
                
                return Quest::SwampCamp_SCCHAPTER1_JOINPSI != nullptr && !Quest::SwampCamp_SCCHAPTER1_JOINPSI.HasBeenStarted();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6a66140eaa0ad1b3), EConversationDebugInfo::Executing);
                
                // How do I get to the camp of the Brotherhood?
                Hero.AI.Say(LocText("DIA_BAALTARAN_WAYTOST_15_00"));
                DC(int64(0x6a66140eaa0ad1b3), EConversationDebugInfo::Done);
                DC(int64(0x6a66140eaa0ad1b4), EConversationDebugInfo::Executing);
                
                // It's a bit of a walk - I'm busy right now, but my ...
                BaalTaran.AI.Say(LocText("DIA_BAALTARAN_WAYTOST_05_01"));
                DC(int64(0x6a66140eaa0ad1b4), EConversationDebugInfo::Done);
                DC(int64(0x6a66140eaa0ad1b5), EConversationDebugInfo::Executing);
                // He's usually near the market, on the other side of the ...
                BaalTaran.AI.Say(LocText("DIA_BAALTARAN_WAYTOST_05_02"));
                DC(int64(0x6a66140eaa0ad1b5), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_NOV_BAALPARVEZ, Document::UDocumentSegment_Glossary_OC_NOV_BAALPARVEZ_Guide);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_JOINPSI, Document::UDocumentSegment_CH1_JOINPSI_Parvez);
                DC(int64(0x11437211dc44a20c), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER1_JOINPSI.StartQuest();
                DC(int64(0x11437211dc44a20c), EConversationDebugInfo::Done);
                DC(int64(0x11437211dc44a20e), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER1_JOINPSI_JOINPSI_OBJ_VISIT.StartQuest();
                DC(int64(0x11437211dc44a20e), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */