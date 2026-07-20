#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OC_VLK_GUY_530 : UConversationCharacterSettings
        {
            default ForCharacter = n"OC_VLK_GUY_530";
        }
        
        
        class UTopic_Hero__OC_VLK_GUY_530 : UG1RDialogTopic
        {
            default ForCharacter = n"OC_VLK_GUY_530";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetGuy() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceGuy78347 : UTopic_Hero__OC_VLK_GUY_530
        {
            default DebugId = int64(0x49efae23ee3d73ca);
            default Caption = LocText("TEXT_MATTES_20231220_173131");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceGuyHello);
            default Rules.HideIfKnows(UChoiceGuy78347);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x49efae23ee3d73d2), Quest::OldCamp_OCCHAPTER1_LOSTNEK != nullptr && Quest::OldCamp_OCCHAPTER1_LOSTNEK.IsRunning());
                    DB(int64(0x8f73702fb85ea53b), Hero != nullptr && !Hero.HasItem(UItAt_Amulet_Neks, 1, 0));
                }
                
                if (Quest::OldCamp_OCCHAPTER1_LOSTNEK != nullptr && !Quest::OldCamp_OCCHAPTER1_LOSTNEK.IsRunning())
                    return false;
                
                if (Hero != nullptr && Hero.HasItem(UItAt_Amulet_Neks, 1, 0))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x49efae23ee3d73c8), EConversationDebugInfo::Executing);
                // I'm looking for Nek, the warder. Any idea where he went?
                Hero.AI.Say(LocText("TEXT_MATTES_20231220_173131"));
                DC(int64(0x49efae23ee3d73c8), EConversationDebugInfo::Done);
                DC(int64(0x49efae23ee3d73cd), EConversationDebugInfo::Executing);
                
                // That's the second time someone's asked me that. No, I ...
                Guy.AI.Say(LocText("TEXT_MATTES_20231220_173244"));
                DC(int64(0x49efae23ee3d73cd), EConversationDebugInfo::Done);
                DC(int64(0x49efae23ee3d73ce), EConversationDebugInfo::Executing);
                // Or maybe he ran over to the New Camp or had some bad ...
                Guy.AI.Say(LocText("TEXT_MATTES_20231220_173328"));
                DC(int64(0x49efae23ee3d73ce), EConversationDebugInfo::Done);
                DC(int64(0x49efae23ee3d73cf), EConversationDebugInfo::Executing);
                // Maybe Snaf could tell you more, though. He's the last ...
                Guy.AI.Say(LocText("TEXT_MATTES_20231220_173454"));
                DC(int64(0x49efae23ee3d73cf), EConversationDebugInfo::Done);
                DC(int64(0x49efae23ee3d73d0), EConversationDebugInfo::Executing);
                
                // Alright. 
                Hero.AI.Say(LocText("TEXT_MATTES_20231220_173540"));
                DC(int64(0x49efae23ee3d73d0), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_LOSTNEK, Document::UDocumentSegment_CH1_LOSTNEK_AskSnaf);
                DC(int64(0x63819e1318108459), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_LOSTNEK_LOSTNEK_OBJ_GUY.SucceedQuest();
                DC(int64(0x63819e1318108459), EConversationDebugInfo::Done);
                DC(int64(0x63819e131810845e), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_LOSTNEK_LOSTNEK_OBJ_SNAF.StartQuest();
                DC(int64(0x63819e131810845e), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceGuyAdnc : UTopic_Hero__OC_VLK_GUY_530
        {
            default DebugId = int64(0x6fbf4a409ca215e);
            default Caption = LocText("DIA_GUY_ADNC_15_00");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceGuyHello);
            default Rules.HideIfKnows(UChoiceGuyAdnc);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6fbf4a409ca215f), EConversationDebugInfo::Executing);
                // How about the New Camp?
                Hero.AI.Say(LocText("DIA_GUY_ADNC_15_00"));
                DC(int64(0x6fbf4a409ca215f), EConversationDebugInfo::Done);
                DC(int64(0x6fbf4a409ca2160), EConversationDebugInfo::Executing);
                
                // Well, if you don't mind getting your throat slit for a ...
                Guy.AI.Say(LocText("DIA_GUY_ADNC_03_01"));
                DC(int64(0x6fbf4a409ca2160), EConversationDebugInfo::Done);
                DC(int64(0x6fbf4a409ca2161), EConversationDebugInfo::Executing);
                // No, it's not THAT bad. But it's ... different.
                Guy.AI.Say(LocText("DIA_GUY_ADNC_03_02"));
                DC(int64(0x6fbf4a409ca2161), EConversationDebugInfo::Done);
                DC(int64(0x6fbf4a409ca2162), EConversationDebugInfo::Executing);
                // In here, Gomez and his guys keep the peace. There's ...
                Guy.AI.Say(LocText("DIA_GUY_ADNC_03_03"));
                DC(int64(0x6fbf4a409ca2162), EConversationDebugInfo::Done);
                DC(int64(0x6fbf4a409ca2163), EConversationDebugInfo::Executing);
                // The only ones with the brawn and the brain to run that ...
                Guy.AI.Say(LocText("DIA_GUY_ADNC_03_04"));
                DC(int64(0x6fbf4a409ca2163), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceGuyAdoc : UTopic_Hero__OC_VLK_GUY_530
        {
            default DebugId = int64(0x6fbf4a409ca214b);
            default Caption = LocText("DIA_GUY_ADOC_15_00");
            default PriorityRank = 2;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceGuyHello);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6fbf4a409ca214c), EConversationDebugInfo::Executing);
                
                // What are the perks of the Old Camp?
                Hero.AI.Say(LocText("DIA_GUY_ADOC_15_00"));
                DC(int64(0x6fbf4a409ca214c), EConversationDebugInfo::Done);
                DC(int64(0x6fbf4a409ca214d), EConversationDebugInfo::Executing);
                
                // Hmmm... Well, as long as you pay the warders your ...
                Guy.AI.Say(LocText("DIA_GUY_ADOC_03_01"));
                DC(int64(0x6fbf4a409ca214d), EConversationDebugInfo::Done);
                DC(int64(0x6fbf4a409ca214e), EConversationDebugInfo::Executing);
                // Also, we're the only place where you can get your hands ...
                Guy.AI.Say(LocText("DIA_GUY_ADOC_03_02"));
                DC(int64(0x6fbf4a409ca214e), EConversationDebugInfo::Done);
                Subdialog(
                    UChoiceGuyAdocBack,
                    UChoiceGuyAdocWarez,
                    UChoiceGuyAdocProtection
                );
            }
        }
        
        
        class UChoiceGuyAdocBack : UTopic_Hero__OC_VLK_GUY_530
        {
            default DebugId = int64(0xe8603e87342be5f6);
            default Caption = LocText("DIA_GUY_ADOC_BACK_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6fbf4a409ca2151), EConversationDebugInfo::Executing);
                // That's all for now. Thanks. 
                Hero.AI.Say(LocText("DIA_GUY_ADOC_BACK_15_00"));
                DC(int64(0x6fbf4a409ca2151), EConversationDebugInfo::Done);
                DC(int64(0x6fbf4a409ca2152), EConversationDebugInfo::Executing);
                
                // Sure. I like it here.
                Guy.AI.Say(LocText("DIA_GUY_ADOC_BACK_03_01"));
                DC(int64(0x6fbf4a409ca2152), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceGuyAdocWarez : UTopic_Hero__OC_VLK_GUY_530
        {
            default DebugId = int64(0xe8603e87342be5fa);
            default Caption = LocText("DIA_GUY_ADOC_WAREZ_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6fbf4a409ca2154), EConversationDebugInfo::Executing);
                
                // What kind of goods fetch the best prices here?
                Hero.AI.Say(LocText("DIA_GUY_ADOC_WAREZ_15_00"));
                DC(int64(0x6fbf4a409ca2154), EConversationDebugInfo::Done);
                DC(int64(0x6fbf4a409ca2155), EConversationDebugInfo::Executing);
                
                // Well, uh, as I said, everything from outside the ...
                Guy.AI.Say(LocText("DIA_GUY_ADOC_WAREZ_03_01"));
                DC(int64(0x6fbf4a409ca2155), EConversationDebugInfo::Done);
                DC(int64(0x6fbf4a409ca2156), EConversationDebugInfo::Executing);
                // If you got a weapon to sell, you'll always find a buyer, ...
                Guy.AI.Say(LocText("DIA_GUY_ADOC_WAREZ_03_02"));
                DC(int64(0x6fbf4a409ca2156), EConversationDebugInfo::Done);
                DC(int64(0xefd96d4c14dc8773), EConversationDebugInfo::Executing);
                
                // The warders seem to be well equipped.
                Hero.AI.Say(LocText("TEXT_NISEA_20231227_140857"));
                DC(int64(0xefd96d4c14dc8773), EConversationDebugInfo::Done);
                DC(int64(0x6fbf4a409ca2157), EConversationDebugInfo::Executing);
                
                // Mmm, they sure are - they just looted their armors off ...
                Guy.AI.Say(LocText("DIA_GUY_ADOC_WAREZ_03_03"));
                DC(int64(0x6fbf4a409ca2157), EConversationDebugInfo::Done);
                DC(int64(0x6fbf4a409ca2158), EConversationDebugInfo::Executing);
                // They've become their banner, so to speak. Unless you ...
                Guy.AI.Say(LocText("DIA_GUY_ADOC_WAREZ_03_04"));
                DC(int64(0x6fbf4a409ca2158), EConversationDebugInfo::Done);
                DC(int64(0x6fbf4a409ca2159), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x6fbf4a409ca2159), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceGuyAdocProtection : UTopic_Hero__OC_VLK_GUY_530
        {
            default DebugId = int64(0xe8603e87342be602);
            default Caption = LocText("DIA_GUY_ADOC_PROTECTION_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6fbf4a409ca215b), EConversationDebugInfo::Executing);
                // What if two guys start a fight, and they both paid their ...
                Hero.AI.Say(LocText("DIA_GUY_ADOC_PROTECTION_15_00"));
                DC(int64(0x6fbf4a409ca215b), EConversationDebugInfo::Done);
                DC(int64(0x6fbf4a409ca215c), EConversationDebugInfo::Executing);
                
                // Then they just sit back and watch. As long as no one ...
                Guy.AI.Say(LocText("DIA_GUY_ADOC_PROTECTION_03_01"));
                DC(int64(0x6fbf4a409ca215c), EConversationDebugInfo::Done);
                DC(int64(0x6fbf4a409ca215d), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x6fbf4a409ca215d), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceGuyAdst : UTopic_Hero__OC_VLK_GUY_530
        {
            default DebugId = int64(0x6fbf4a409ca2164);
            default Caption = LocText("DIA_GUY_ADST_15_00");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceGuyHello);
            default Rules.HideIfKnows(UChoiceGuyAdst);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6fbf4a409ca2165), EConversationDebugInfo::Executing);
                // What's it like in the Swamp Camp?
                Hero.AI.Say(LocText("DIA_GUY_ADST_15_00"));
                DC(int64(0x6fbf4a409ca2165), EConversationDebugInfo::Done);
                DC(int64(0x6fbf4a409ca2166), EConversationDebugInfo::Executing);
                
                // Hmm, best ask one of them.
                Guy.AI.Say(LocText("DIA_GUY_ADST_03_01"));
                DC(int64(0x6fbf4a409ca2166), EConversationDebugInfo::Done);
                DC(int64(0x6fbf4a409ca2167), EConversationDebugInfo::Executing);
                // There's always a few novices here in our camp, sure ...
                Guy.AI.Say(LocText("DIA_GUY_ADST_03_02"));
                DC(int64(0x6fbf4a409ca2167), EConversationDebugInfo::Done);
                DC(int64(0x6fbf4a409ca2168), EConversationDebugInfo::Executing);
                // I never went myself, but from what I've heard, it's not ...
                Guy.AI.Say(LocText("DIA_GUY_ADST_03_03"));
                DC(int64(0x6fbf4a409ca2168), EConversationDebugInfo::Done);
                DC(int64(0x6fbf4a409ca2169), EConversationDebugInfo::Executing);
                // Oh, and lately, they've been recruiting like there's no ...
                Guy.AI.Say(LocText("DIA_GUY_ADST_03_04"));
                DC(int64(0x6fbf4a409ca2169), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceGuyExit : UTopic_Hero__OC_VLK_GUY_530
        {
            default DebugId = int64(0x6fbf4a409ca2140);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6fbf4a409ca2141), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x6fbf4a409ca2141), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGuyHello : UTopic_Hero__OC_VLK_GUY_530
        {
            default DebugId = int64(0x6fbf4a409ca2142);
            default Caption = LocText("DIA_GUY_HELLO_15_00");
            default PriorityRank = 2;
            
            default Rules.HideIfKnows(UChoiceGuyHello);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x6fbf4a409ca2143), G1R != nullptr && !G1R.HasReachedChapter(2));
                }
                
                return G1R != nullptr && !G1R.HasReachedChapter(2);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6fbf4a409ca2144), EConversationDebugInfo::Executing);
                // Hello, there. 
                Hero.AI.Say(LocText("DIA_GUY_HELLO_15_00"));
                DC(int64(0x6fbf4a409ca2144), EConversationDebugInfo::Done);
                DC(int64(0x6fbf4a409ca2145), EConversationDebugInfo::Executing);
                
                // Hmm ... Haven't seen you before. You're new here, aren't ...
                Guy.AI.Say(LocText("DIA_GUY_HELLO_03_01"));
                DC(int64(0x6fbf4a409ca2145), EConversationDebugInfo::Done);
                DC(int64(0x6fbf4a409ca2146), EConversationDebugInfo::Executing);
                
                // Just got in.
                Hero.AI.Say(LocText("DIA_GUY_HELLO_15_02"));
                DC(int64(0x6fbf4a409ca2146), EConversationDebugInfo::Done);
                DC(int64(0x6fbf4a409ca2147), EConversationDebugInfo::Executing);
                
                // Well then welcome to the Colony. I'm Guy. Already ...
                Guy.AI.Say(LocText("DIA_GUY_HELLO_03_03"));
                DC(int64(0x6fbf4a409ca2147), EConversationDebugInfo::Done);
                DC(int64(0x6fbf4a409ca2148), EConversationDebugInfo::Executing);
                
                // Not yet. What would you recommend?
                Hero.AI.Say(LocText("DIA_GUY_HELLO_15_04"));
                DC(int64(0x6fbf4a409ca2148), EConversationDebugInfo::Done);
                DC(int64(0x6fbf4a409ca2149), EConversationDebugInfo::Executing);
                
                // Uh... Depends, I guess. They all got their pros and ...
                Guy.AI.Say(LocText("DIA_GUY_HELLO_03_05"));
                DC(int64(0x6fbf4a409ca2149), EConversationDebugInfo::Done);
                DC(int64(0x6fbf4a409ca214a), EConversationDebugInfo::Executing);
                // You can stay here until you've made up your mind, ...
                Guy.AI.Say(LocText("DIA_GUY_HELLO_03_06"));
                DC(int64(0x6fbf4a409ca214a), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_VLK_GUY, Document::UDocumentSegment_Glossary_OC_VLK_GUY_Introduction);
            }
        }
        
        
        class UChoiceGuyMyownhut : UTopic_Hero__OC_VLK_GUY_530
        {
            default DebugId = int64(0x6fbf4a409ca216a);
            default Caption = LocText("DIA_GUY_MYOWNHUT_15_00");
            default PriorityRank = 4;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceGuyHello);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6fbf4a409ca216b), EConversationDebugInfo::Executing);
                // Which of the huts is free?
                Hero.AI.Say(LocText("DIA_GUY_MYOWNHUT_15_00"));
                DC(int64(0x6fbf4a409ca216b), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_VLK_GUY, Document::UDocumentSegment_Glossary_OC_VLK_GUY_FreeHut);
                Print("Skipped Guy.AI.PointAtWaypoint(nOCR_HUT_26)");
                DC(int64(0x6fbf4a409ca216d), EConversationDebugInfo::Executing);
                // The one right by the arena. It's got a red awning out ...
                Guy.AI.Say(LocText("DIA_GUY_MYOWNHUT_03_01"));
                DC(int64(0x6fbf4a409ca216d), EConversationDebugInfo::Done);
                DC(int64(0x1dd7903b670c6df2), EConversationDebugInfo::Executing);
                
                // All right.
                Hero.AI.Say(LocText("TEXT_WIP_BYTNSIJ_20240905_143530"));
                DC(int64(0x1dd7903b670c6df2), EConversationDebugInfo::Done);
                Print("Skipped Guy.AI.StopPointAt()");
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */