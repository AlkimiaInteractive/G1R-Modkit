#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OC_STT_DEXTER_329 : UConversationCharacterSettings
        {
            default ForCharacter = n"OC_STT_DEXTER_329";
        }
        
        
        class UTopic_Hero__OC_STT_DEXTER_329 : UG1RDialogTopic
        {
            default ForCharacter = n"OC_STT_DEXTER_329";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetDexter() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceDexterExit : UTopic_Hero__OC_STT_DEXTER_329
        {
            default DebugId = int64(0xbdbfcb41a4c22fa1);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xbdbfcb41a4c22fa2), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xbdbfcb41a4c22fa2), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceDexterFirst : UTopic_Hero__OC_STT_DEXTER_329
        {
            default DebugId = int64(0xbdbfcb41a4c22fa3);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceDexterFirst);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xbdbfcb41a4c22fa4), Dexter != nullptr && Dexter.IsCloseToCharacter(Hero, G1R.ZivilAnquatschDist * 100.0f));
                    DB(int64(0xa3d887c688031190), Hero != nullptr && Hero.IsInConversation());
                }
                
                if (Dexter != nullptr && !Dexter.IsCloseToCharacter(Hero, G1R.ZivilAnquatschDist * 100.0f))
                    return false;
                
                if (Hero != nullptr && !Hero.IsInConversation())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xbdbfcb41a4c22fa5), EConversationDebugInfo::Executing);
                // You look tense ... how about some swampweed, straight ...
                Dexter.AI.Say(LocText("DIA_DEXTER_IAMNEW_10_00"));
                DC(int64(0xbdbfcb41a4c22fa5), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDexterJoinoc : UTopic_Hero__OC_STT_DEXTER_329
        {
            default DebugId = int64(0xbdbfcb41a4c22fb0);
            default Caption = LocText("DIA_DEXTER_JOINOC_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceDexterJoinoc);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xbdbfcb41a4c22fb1), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                    DB(int64(0xbdbfcb41a4c22fb2), Quest::OldCamp_OCCHAPTER1_KALOMSRECIPE != nullptr && !Quest::OldCamp_OCCHAPTER1_KALOMSRECIPE.HasBeenStarted());
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None))
                    return false;
                
                if (Quest::OldCamp_OCCHAPTER1_KALOMSRECIPE != nullptr && Quest::OldCamp_OCCHAPTER1_KALOMSRECIPE.HasBeenStarted())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xbdbfcb41a4c22fb3), EConversationDebugInfo::Executing);
                
                // I'm looking to join the Old Camp and become a Shadow. 
                Hero.AI.Say(LocText("DIA_DEXTER_JOINOC_15_00"));
                DC(int64(0xbdbfcb41a4c22fb3), EConversationDebugInfo::Done);
                DC(int64(0xbdbfcb41a4c22fb4), EConversationDebugInfo::Executing);
                
                // In other words, you're trying to prove yourself.
                Dexter.AI.Say(LocText("DIA_DEXTER_JOINOC_10_01"));
                DC(int64(0xbdbfcb41a4c22fb4), EConversationDebugInfo::Done);
                DC(int64(0xbdbfcb41a4c22fb5), EConversationDebugInfo::Executing);
                // Hmm ... yeah, there's something I could use a hand with. ...
                Dexter.AI.Say(LocText("DIA_DEXTER_JOINOC_10_02"));
                DC(int64(0xbdbfcb41a4c22fb5), EConversationDebugInfo::Done);
                DC(int64(0xbdbfcb41a4c22fb6), EConversationDebugInfo::Executing);
                
                // What do you need?
                Hero.AI.Say(LocText("DIA_DEXTER_JOINOC_15_03"));
                DC(int64(0xbdbfcb41a4c22fb6), EConversationDebugInfo::Done);
                DC(int64(0xbdbfcb41a4c22fb7), EConversationDebugInfo::Executing);
                
                // There's a guy in the Swamp Camp who goes by the name of ...
                Dexter.AI.Say(LocText("DIA_DEXTER_JOINOC_10_04"));
                DC(int64(0xbdbfcb41a4c22fb7), EConversationDebugInfo::Done);
                DC(int64(0xbdbfcb41a4c22fb8), EConversationDebugInfo::Executing);
                // He's also an alchemist, and he's got a recipe for a, how ...
                Dexter.AI.Say(LocText("DIA_DEXTER_JOINOC_10_05"));
                DC(int64(0xbdbfcb41a4c22fb8), EConversationDebugInfo::Done);
                DC(int64(0xf3a18964bb7f4fbd), EConversationDebugInfo::Executing);
                // They call it dreamjuice. They brew it with minecrawler ...
                Dexter.AI.Say(LocText("TEXT_MATTES_20231227_165615"));
                DC(int64(0xf3a18964bb7f4fbd), EConversationDebugInfo::Done);
                DC(int64(0xf3a18964bb7f4fbe), EConversationDebugInfo::Executing);
                // Diego wants ME to get that recipe. 
                Dexter.AI.Say(LocText("TEXT_MATTES_20231227_165811"));
                DC(int64(0xf3a18964bb7f4fbe), EConversationDebugInfo::Done);
                DC(int64(0xbdbfcb41a4c22fbb), EConversationDebugInfo::Executing);
                
                // What's stopping you?
                Hero.AI.Say(LocText("DIA_DEXTER_JOINOC_15_08"));
                DC(int64(0xbdbfcb41a4c22fbb), EConversationDebugInfo::Done);
                DC(int64(0xbdbfcb41a4c22fbc), EConversationDebugInfo::Executing);
                
                // Kalom. That old bastard won't talk to anyone who isn't a ...
                Dexter.AI.Say(LocText("DIA_DEXTER_JOINOC_10_09"));
                DC(int64(0xbdbfcb41a4c22fbc), EConversationDebugInfo::Done);
                DC(int64(0xbdbfcb41a4c22fbd), EConversationDebugInfo::Executing);
                // Kalom checks all the novices sooner or later. Once he ...
                Dexter.AI.Say(LocText("DIA_DEXTER_JOINOC_10_10"));
                DC(int64(0xbdbfcb41a4c22fbd), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_STT_DEXTER, Document::UDocumentSegment_Glossary_OC_STT_DEXTER_Introduction);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_KALOMSRECIPE, Document::UDocumentSegment_CH1_KALOMSRECIPE_Start);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_KALOMSRECIPE, Document::UDocumentSegment_CH1_KALOMSRECIPE_Pretend);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_BROWNIEPOINTS, Document::UDocumentSegment_CH1_BROWNIEPOINTS_DexterStart);
                DC(int64(0x24e2378fdddc6a21), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_BROWNIEPOINTS_BROWNIEPOINTS_OBJ_DEXTER.StartQuest();
                DC(int64(0x24e2378fdddc6a21), EConversationDebugInfo::Done);
                Subdialog(
                    UChoiceDexterJoinocOk,
                    UChoiceDexterJoinocHowmuch,
                    UChoiceDexterJoinocAdvance,
                    UChoiceDexterJoinocThreat,
                    UChoiceDexterJoinocOrenoworelse,
                    UChoiceDexterJoinocForgetit,
                    UTopic_Dexter_79661
                );
            }
        }
        
        
        class UChoiceDexterJoinocOk : UTopic_Hero__OC_STT_DEXTER_329
        {
            default DebugId = int64(0xbdbfcb41a4c22fc0);
            default Caption = LocText("DIA_DEXTER_JOINOC_OK_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UChoiceDexterJoinocOk);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xbdbfcb41a4c22fc1), EConversationDebugInfo::Executing);
                // All right. I'll see what I can do.
                Hero.AI.Say(LocText("DIA_DEXTER_JOINOC_OK_15_00"));
                DC(int64(0xbdbfcb41a4c22fc1), EConversationDebugInfo::Done);
                DC(int64(0xdbf97f77426ebe1e), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_KALOMSRECIPE.StartQuest();
                DC(int64(0xdbf97f77426ebe1e), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDexterJoinocHowmuch : UTopic_Hero__OC_STT_DEXTER_329
        {
            default DebugId = int64(0xbdbfcb41a4c22fc4);
            default Caption = LocText("DIA_DEXTER_JOINOC_HOWMUCH_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UChoiceDexterJoinocHowmuch);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xbdbfcb41a4c22fc5), EConversationDebugInfo::Executing);
                // Sounds like a tricky job. What's in it for me?
                Hero.AI.Say(LocText("DIA_DEXTER_JOINOC_HOWMUCH_15_00"));
                DC(int64(0xbdbfcb41a4c22fc5), EConversationDebugInfo::Done);
                DC(int64(0xbdbfcb41a4c22fc6), EConversationDebugInfo::Executing);
                
                // At some point, Diego will ask me what I think of you. ...
                Dexter.AI.Say(LocText("DIA_DEXTER_JOINOC_HOWMUCH_10_01"));
                DC(int64(0xbdbfcb41a4c22fc6), EConversationDebugInfo::Done);
                DC(int64(0xbdbfcb41a4c22fc7), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xbdbfcb41a4c22fc7), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDexterJoinocAdvance : UTopic_Hero__OC_STT_DEXTER_329
        {
            default DebugId = int64(0xbdbfcb41a4c22fc8);
            default Caption = LocText("DIA_DEXTER_JOINOC_ADVANCE_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UChoiceDexterJoinocAdvance);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("DIA_DEXTER_JOINOC_HOWMUCH_10_01"), int64(0xbdbfcb41a4c22fc8));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xbdbfcb41a4c22fc9), EConversationDebugInfo::Executing);
                // I might have to buy that recipe. I want fifty nuggets in ...
                Hero.AI.Say(LocText("DIA_DEXTER_JOINOC_ADVANCE_15_00"));
                DC(int64(0xbdbfcb41a4c22fc9), EConversationDebugInfo::Done);
                DC(int64(0xbdbfcb41a4c22fca), EConversationDebugInfo::Executing);
                
                // Forget it.
                Dexter.AI.Say(LocText("DIA_DEXTER_JOINOC_ADVANCE_10_01"));
                DC(int64(0xbdbfcb41a4c22fca), EConversationDebugInfo::Done);
                DC(int64(0xbdbfcb41a4c22fcb), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xbdbfcb41a4c22fcb), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDexterJoinocThreat : UTopic_Hero__OC_STT_DEXTER_329
        {
            default DebugId = int64(0xbdbfcb41a4c22fcc);
            default Caption = LocText("DIA_DEXTER_JOINOC_THREAT_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UChoiceDexterJoinocThreat);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("DIA_DEXTER_JOINOC_ADVANCE_10_01"), int64(0xbdbfcb41a4c22fcc));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xbdbfcb41a4c22fcd), EConversationDebugInfo::Executing);
                // No nuggets, no recipe.
                Hero.AI.Say(LocText("DIA_DEXTER_JOINOC_THREAT_15_00"));
                DC(int64(0xbdbfcb41a4c22fcd), EConversationDebugInfo::Done);
                DC(int64(0xbdbfcb41a4c22fce), EConversationDebugInfo::Executing);
                
                // Then you pay for it now, and I'll pay you back once you ...
                Dexter.AI.Say(LocText("DIA_DEXTER_JOINOC_THREAT_10_01"));
                DC(int64(0xbdbfcb41a4c22fce), EConversationDebugInfo::Done);
                DC(int64(0xbdbfcb41a4c22fcf), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xbdbfcb41a4c22fcf), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDexterJoinocOrenoworelse : UTopic_Hero__OC_STT_DEXTER_329
        {
            default DebugId = int64(0xbdbfcb41a4c22fd0);
            default Caption = LocText("DIA_DEXTER_JOINOC_ORENOWORELSE_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UChoiceDexterJoinocOrenoworelse);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("DIA_DEXTER_JOINOC_THREAT_10_01"), int64(0xbdbfcb41a4c22fd0));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xbdbfcb41a4c22fd1), EConversationDebugInfo::Executing);
                // No. Give me the nuggets, or get it yourself.
                Hero.AI.Say(LocText("DIA_DEXTER_JOINOC_ORENOWORELSE_15_00"));
                DC(int64(0xbdbfcb41a4c22fd1), EConversationDebugInfo::Done);
                DC(int64(0xbdbfcb41a4c22fd2), EConversationDebugInfo::Executing);
                
                // Alright, then. If you don't wanna do this job, I'll find ...
                Dexter.AI.Say(LocText("DIA_DEXTER_JOINOC_ORENOWORELSE_10_01"));
                DC(int64(0xbdbfcb41a4c22fd2), EConversationDebugInfo::Done);
                DC(int64(0xbdbfcb41a4c22fd3), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xbdbfcb41a4c22fd3), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDexterJoinocForgetit : UTopic_Hero__OC_STT_DEXTER_329
        {
            default DebugId = int64(0xbdbfcb41a4c22fd4);
            default Caption = LocText("DIA_DEXTER_JOINOC_FORGETIT_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UChoiceDexterJoinocForgetit);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("DIA_DEXTER_JOINOC_ORENOWORELSE_10_01"), int64(0xbdbfcb41a4c22fd4));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xbdbfcb41a4c22fd5), EConversationDebugInfo::Executing);
                // Fine. Forget about it. 
                Hero.AI.Say(LocText("DIA_DEXTER_JOINOC_FORGETIT_15_00"));
                DC(int64(0xbdbfcb41a4c22fd5), EConversationDebugInfo::Done);
                DC(int64(0xbdbfcb41a4c22fd6), EConversationDebugInfo::Executing);
                
                // Wait! 
                Dexter.AI.Say(LocText("DIA_DEXTER_JOINOC_FORGETIT_10_01"));
                DC(int64(0xbdbfcb41a4c22fd6), EConversationDebugInfo::Done);
                DC(int64(0xee3f743ab64d44c1), EConversationDebugInfo::Executing);
                // I was just testing you. Fifty nuggets, you said?
                Dexter.AI.Say(LocText("TEXT_WIP_QDPDXKL_20240307_182401"));
                DC(int64(0xee3f743ab64d44c1), EConversationDebugInfo::Done);
                DC(int64(0xbdbfcb41a4c22fd7), EConversationDebugInfo::Executing);
                
                // Sounds good.
                Hero.AI.Say(LocText("DIA_DEXTER_JOINOC_FORGETIT_15_02"));
                DC(int64(0xbdbfcb41a4c22fd7), EConversationDebugInfo::Done);
                DC(int64(0xbdbfcb41a4c22fd8), EConversationDebugInfo::Executing);
                
                // Okay, guess I can spare that much. Here. But don't you ...
                Dexter.AI.Say(LocText("DIA_DEXTER_JOINOC_FORGETIT_10_03"));
                DC(int64(0xbdbfcb41a4c22fd8), EConversationDebugInfo::Done);
                DC(int64(0xcbe41b81f2725efd), EConversationDebugInfo::Executing);
                Dexter.AddItemToInventory(UItMi_Orenugget, 50);
                DC(int64(0xcbe41b81f2725efd), EConversationDebugInfo::Done);
                DC(int64(0x69ca3b568785be48), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_KALOMSRECIPE.StartQuest();
                DC(int64(0x69ca3b568785be48), EConversationDebugInfo::Done);
                DC(int64(0x69ca3b568785be4c), EConversationDebugInfo::Executing);
                Dexter.AI.GiveItemTo(Hero, UItMi_Orenugget, 50);
                DC(int64(0x69ca3b568785be4c), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Dexter_79661 : UTopic_Hero__OC_STT_DEXTER_329
        {
            default DebugId = int64(0xf0ea6bc2d40c38aa);
            default Caption = LocText("TEXT_NISEA_20240119_191706_41");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Dexter_79661);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf0ea6bc2d40c38ab), EConversationDebugInfo::Executing);
                // What do the Mages want with some drug juice?
                Hero.AI.Say(LocText("TEXT_NISEA_20240119_191706_41"));
                DC(int64(0xf0ea6bc2d40c38ab), EConversationDebugInfo::Done);
                DC(int64(0xf0ea6bc2d40c38ae), EConversationDebugInfo::Executing);
                
                // Damned if I know. The Mages never bother to explain ...
                Dexter.AI.Say(LocText("TEXT_NISEA_20240119_191728"));
                DC(int64(0xf0ea6bc2d40c38ae), EConversationDebugInfo::Done);
                DC(int64(0xf0ea6bc2d40c38ad), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xf0ea6bc2d40c38ad), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDexterKalomsrecipesuccess : UTopic_Hero__OC_STT_DEXTER_329
        {
            default DebugId = int64(0xbdbfcb41a4c22fe7);
            default Caption = LocText("DIA_DEXTER_KALOMSRECIPESUCCESS_15_00");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceDexterJoinoc);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xbdbfcb41a4c22fe8), Quest::OldCamp_OCCHAPTER1_KALOMSRECIPE != nullptr && Quest::OldCamp_OCCHAPTER1_KALOMSRECIPE.IsRunning());
                    DB(int64(0xbdbfcb41a4c22fe9), Hero != nullptr && Hero.HasItem(UItWr_Scroll_Kalom, 1, 0));
                }
                
                if (Quest::OldCamp_OCCHAPTER1_KALOMSRECIPE != nullptr && !Quest::OldCamp_OCCHAPTER1_KALOMSRECIPE.IsRunning())
                    return false;
                
                if (Hero != nullptr && !Hero.HasItem(UItWr_Scroll_Kalom, 1, 0))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xbdbfcb41a4c22fea), EConversationDebugInfo::Executing);
                // I have your recipe.
                Hero.AI.Say(LocText("DIA_DEXTER_KALOMSRECIPESUCCESS_15_00"));
                DC(int64(0xbdbfcb41a4c22fea), EConversationDebugInfo::Done);
                DC(int64(0xbdbfcb41a4c22feb), EConversationDebugInfo::Executing);
                
                // Show me.
                Dexter.AI.Say(LocText("DIA_DEXTER_KALOMSRECIPESUCCESS_10_01"));
                DC(int64(0xbdbfcb41a4c22feb), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_BROWNIEPOINTS, Document::UDocumentSegment_CH1_BROWNIEPOINTS_DexterCompleted);
                DC(int64(0x814e98028469b2c4), EConversationDebugInfo::Executing);
                Hero.AI.GiveItemTo(Dexter, UItWr_Scroll_Kalom, 1);
                DC(int64(0x814e98028469b2c4), EConversationDebugInfo::Done);
                DC(int64(0x69ca3b568785be6b), EConversationDebugInfo::Executing);
                Dexter.AI.BeginInteractionWithoutSpot(GameplayTag::Action_Conversation_ReadScroll);
                DC(int64(0x69ca3b568785be6b), EConversationDebugInfo::Done);
                DC(int64(0xbdbfcb41a4c22fed), EConversationDebugInfo::Executing);
                // Seraphis, swampweed, crawler ichor ... hmm. That's the ...
                Dexter.AI.Say(LocText("DIA_DEXTER_KALOMSRECIPESUCCESS_10_02"));
                DC(int64(0xbdbfcb41a4c22fed), EConversationDebugInfo::Done);
                DC(int64(0x814e98028469b2b4), EConversationDebugInfo::Executing);
                Dexter.AI.EndAnyOngoingInteraction();
                DC(int64(0x814e98028469b2b4), EConversationDebugInfo::Done);
                DC(int64(0xbdbfcb41a4c22fee), EConversationDebugInfo::Executing);
                // Whatever. The Fire Mages will know what to do with it - ...
                Dexter.AI.Say(LocText("DIA_DEXTER_KALOMSRECIPESUCCESS_10_03"));
                DC(int64(0xbdbfcb41a4c22fee), EConversationDebugInfo::Done);
                DC(int64(0xbdbfcb41a4c22fef), EConversationDebugInfo::Executing);
                // I'll tell Diego about this. And here - for your efforts.
                Dexter.AI.Say(LocText("DIA_DEXTER_KALOMSRECIPESUCCESS_10_04"));
                DC(int64(0xbdbfcb41a4c22fef), EConversationDebugInfo::Done);
                DC(int64(0xcbe41b81f2725efd), EConversationDebugInfo::Executing);
                Dexter.AddItemToInventory(UItMi_Joint_03, 3);
                DC(int64(0xcbe41b81f2725efd), EConversationDebugInfo::Done);
                DC(int64(0x814e98028469b35e), EConversationDebugInfo::Executing);
                Dexter.AI.GiveItemTo(Hero, UItMi_Joint_03, 3);
                DC(int64(0x814e98028469b35e), EConversationDebugInfo::Done);
                DB(int64(0xdbf97f77426ebe2e), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None))
                {
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_KALOMSRECIPE, Document::UDocumentSegment_CH1_KALOMSRECIPE_ImpressedOC);
                }
                else
                {
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_KALOMSRECIPE, Document::UDocumentSegment_CH1_KALOMSRECIPE_ImpressedOutsider);
                }
                DC(int64(0x69ca3b568785be66), EConversationDebugInfo::Executing);
                Hero.AI.GiveItemTo(Dexter, UItWr_Scroll_Kalom, 1);
                DC(int64(0x69ca3b568785be66), EConversationDebugInfo::Done);
                DC(int64(0x24e2378fdddc6be4), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_BROWNIEPOINTS_BROWNIEPOINTS_OBJ_DEXTER.SucceedQuest();
                DC(int64(0x24e2378fdddc6be4), EConversationDebugInfo::Done);
                DC(int64(0xdbf97f77426ebf80), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_KALOMSRECIPE_KALOMSRECIPE_OBJ_RETURN.SucceedQuest();
                DC(int64(0xdbf97f77426ebf80), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDexterKraut : UTopic_Hero__OC_STT_DEXTER_329
        {
            default DebugId = int64(0xbdbfcb41a4c22fa6);
            default Caption = LocText("DIA_DEXTER_KRAUT_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceDexterKraut);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xbdbfcb41a4c22fa7), EConversationDebugInfo::Executing);
                // What's "swampweed?"
                Hero.AI.Say(LocText("DIA_DEXTER_KRAUT_15_00"));
                DC(int64(0xbdbfcb41a4c22fa7), EConversationDebugInfo::Done);
                DC(int64(0xbdbfcb41a4c22fa8), EConversationDebugInfo::Executing);
                
                // Green to the core, huh? You can smoke it. Takes the edge ...
                Dexter.AI.Say(LocText("DIA_DEXTER_KRAUT_10_01"));
                DC(int64(0xbdbfcb41a4c22fa8), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDexterTrade : UTopic_Hero__OC_STT_DEXTER_329
        {
            default DebugId = int64(0xbdbfcb41a4c22fa9);
            default Caption = LocText("DIA_DEXTER_TRADE_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xbdbfcb41a4c22faa), EConversationDebugInfo::Executing);
                
                // Show me your goods.
                Hero.AI.Say(LocText("DIA_DEXTER_TRADE_15_00"));
                DC(int64(0xbdbfcb41a4c22faa), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_STT_DEXTER, Document::UDocumentSegment_Glossary_OC_STT_DEXTER_Trader);
                DB(int64(0x7ec56dc721168b01), Dexter != nullptr && Dexter.IsAngryTowards(Hero));
                
                if (Dexter != nullptr && Dexter.IsAngryTowards(Hero))
                {
                    DC(int64(0x7ec56dc721168b05), EConversationDebugInfo::Executing);
                    // I only sell to people who respect the rules. Get lost!
                    Dexter.AI.Say(LocText("TEXT_WIP_SSLLGEC_20250210_111343_2995"));
                    DC(int64(0x7ec56dc721168b05), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_dexter_trade_exit_1");
                    DC(int64(0x7ec56dc721168b08), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x7ec56dc721168b08), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0x7ec56dc721168b0c), EConversationDebugInfo::Executing);
                    // Best stuff in the Colony.
                    Dexter.AI.Say(LocText("TEXT_WIP_SSLLGEC_20250210_111446_3750"));
                    DC(int64(0x7ec56dc721168b0c), EConversationDebugInfo::Done);
                    DB(int64(0xbdbfcb41a4c22fad), G1R.Dexter_Traded == 0);
                    
                    if (G1R.Dexter_Traded == 0)
                    {
                        DC(int64(0x69ca3b568785be79), EConversationDebugInfo::Executing);
                        G1R.Dexter_Traded = 1;
                        DC(int64(0x69ca3b568785be79), EConversationDebugInfo::Done);
                    }
                    DC(int64(0x69ca3b568785be75), EConversationDebugInfo::Executing);
                    Dexter.AI.StartTradingWith(Hero);
                    DC(int64(0x69ca3b568785be75), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_dexter_trade_exit_2");
                }
            }
        }
        
        
        class UChoiceDexterWherest : UTopic_Hero__OC_STT_DEXTER_329
        {
            default DebugId = int64(0xbdbfcb41a4c22fdc);
            default Caption = LocText("DIA_DEXTER_WHEREST_15_00");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceDexterJoinoc);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xbdbfcb41a4c22fdd), Quest::OldCamp_OCCHAPTER1_KALOMSRECIPE != nullptr && Quest::OldCamp_OCCHAPTER1_KALOMSRECIPE.IsRunning());
                }
                
                return Quest::OldCamp_OCCHAPTER1_KALOMSRECIPE != nullptr && Quest::OldCamp_OCCHAPTER1_KALOMSRECIPE.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xbdbfcb41a4c22fde), EConversationDebugInfo::Executing);
                // How do I get to the Swamp Camp?
                Hero.AI.Say(LocText("DIA_DEXTER_WHEREST_15_00"));
                DC(int64(0xbdbfcb41a4c22fde), EConversationDebugInfo::Done);
                DC(int64(0xbdbfcb41a4c22fdf), EConversationDebugInfo::Executing);
                
                // Just head out through the south gate and keep going ...
                Dexter.AI.Say(LocText("DIA_DEXTER_WHEREST_10_01"));
                DC(int64(0xbdbfcb41a4c22fdf), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_KALOMSRECIPE, Document::UDocumentSegment_CH1_KALOMSRECIPE_Location);
                DB(int64(0xbdbfcb41a4c22fe1), Dexter != nullptr && Dexter.HasItem(UItWr_Map_World, 1, 0));
                
                if (Dexter != nullptr && Dexter.HasItem(UItWr_Map_World, 1, 0))
                {
                    DC(int64(0xbdbfcb41a4c22fe2), EConversationDebugInfo::Executing);
                    // Come to think of it, I have one in my stock ... 
                    Dexter.AI.Say(LocText("DIA_DEXTER_WHEREST_10_02"));
                    DC(int64(0xbdbfcb41a4c22fe2), EConversationDebugInfo::Done);
                }
                DC(int64(0xbdbfcb41a4c22fe3), EConversationDebugInfo::Executing);
                // The south gate ... that's the one by the fallen tower, ...
                Hero.AI.Say(LocText("DIA_DEXTER_WHEREST_15_02"));
                DC(int64(0xbdbfcb41a4c22fe3), EConversationDebugInfo::Done);
                DC(int64(0xbdbfcb41a4c22fe4), EConversationDebugInfo::Executing);
                
                // That's right.
                Dexter.AI.Say(LocText("DIA_DEXTER_WHEREST_10_03"));
                DC(int64(0xbdbfcb41a4c22fe4), EConversationDebugInfo::Done);
                DB(int64(0x60290a3d99e78464), G1R.Dexter_SC == 0);
                
                if (G1R.Dexter_SC == 0)
                {
                    DC(int64(0x69ca3b568785be83), EConversationDebugInfo::Executing);
                    G1R.Dexter_SC = 1;
                    DC(int64(0x69ca3b568785be83), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_dexter_wherest_exit_1");
                }
                else
                {
                    
                    Other.Remember(n"choice_dexter_wherest_exit_2");
                }
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */