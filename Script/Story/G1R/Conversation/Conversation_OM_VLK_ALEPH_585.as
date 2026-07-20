#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OM_VLK_ALEPH_585 : UConversationCharacterSettings
        {
            default ForCharacter = n"OM_VLK_ALEPH_585";
        }
        
        
        class UTopic_Hero__OM_VLK_ALEPH_585 : UG1RDialogTopic
        {
            default ForCharacter = n"OM_VLK_ALEPH_585";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetAleph() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetBrandick() const property
            {
                return GetCharacter(n"OM_GRD_BRANDICK_261");
            }
        }
        
        
        class UChoiceVlk585AlephAngry : UTopic_Hero__OM_VLK_ALEPH_585
        {
            default DebugId = int64(0xbb12b884375e8a0d);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceVlk585AlephAngry);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("GRD_261_BRANDICK_ALEPH_INFO_06_02"), int64(0xbb12b884375e8a0d));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xbb12b884375e8a0e), EConversationDebugInfo::Executing);
                // Oy, did you tell on me? Son of a fuckin' molerat ... sod ...
                Aleph.AI.Say(LocText("VLK_585_ALEPH_ANGRY_INFO_05_01"));
                DC(int64(0xbb12b884375e8a0e), EConversationDebugInfo::Done);
                DC(int64(0xa42ac433b352669e), EConversationDebugInfo::Executing);
                Aleph.SetRelationshipUntilDefeat(Hero, ERelationship::Angry);
                DC(int64(0xa42ac433b352669e), EConversationDebugInfo::Done);
                DC(int64(0xbb12b884375e8a10), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xbb12b884375e8a10), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceVlk585AlephClever : UTopic_Hero__OM_VLK_ALEPH_585
        {
            default DebugId = int64(0xbb12b884375e89fa);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceVlk585AlephClever);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xbb12b884375e89fb), EConversationDebugInfo::Executing);
                // Huh, bloody fools ...
                Aleph.AI.Say(LocText("VLK_585_ALEPH_CLEVER_INFO_05_01"));
                DC(int64(0xbb12b884375e89fb), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OM_VLK_ALEPH, Document::UDocumentSegment_Glossary_OM_VLK_ALEPH_Introduction);
            }
        }
        
        
        class UChoiceVlk585AlephExit : UTopic_Hero__OM_VLK_ALEPH_585
        {
            default DebugId = int64(0xbb12b884375e89f4);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xbb12b884375e89f9), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xbb12b884375e89f9), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceVlk585AlephGlen : UTopic_Hero__OM_VLK_ALEPH_585
        {
            default DebugId = int64(0xbb12b884375e8a14);
            default Caption = LocText("VLK_585_ALEPH_GLEN_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceVlk585AlephKey);
            default Rules.HideIfKnows(UChoiceVlk585AlephGlen);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xbb12b884375e8a15), Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 10, 0));
                }
                
                return Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 10, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xbb12b884375e8a16), EConversationDebugInfo::Executing);
                // Here. This better be worth it.
                Hero.AI.Say(LocText("VLK_585_ALEPH_GLEN_INFO_15_01"));
                DC(int64(0xbb12b884375e8a16), EConversationDebugInfo::Done);
                DC(int64(0xbb12b884375e8a17), EConversationDebugInfo::Executing);
                
                // All right - you've probably clocked it already, but ...
                Aleph.AI.Say(LocText("VLK_585_ALEPH_GLEN_INFO_05_02"));
                DC(int64(0xbb12b884375e8a17), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OM_VLK_ALEPH, Document::UDocumentSegment_Glossary_OM_VLK_ALEPH_Lock);
                DC(int64(0xa42ac433b35266d1), EConversationDebugInfo::Executing);
                Hero.AI.GiveItemTo(Aleph, UItMi_Orenugget, 10);
                DC(int64(0xa42ac433b35266d1), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceVlk585AlephGuards : UTopic_Hero__OM_VLK_ALEPH_585
        {
            default DebugId = int64(0xbb12b884375e89fc);
            default Caption = LocText("VLK_585_ALEPH_GUARDS_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceVlk585AlephClever);
            default Rules.HideIfKnows(UChoiceVlk585AlephGuards);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xbb12b884375e89fd), EConversationDebugInfo::Executing);
                // Who's a fool?
                Hero.AI.Say(LocText("VLK_585_ALEPH_GUARDS_INFO_15_01"));
                DC(int64(0xbb12b884375e89fd), EConversationDebugInfo::Done);
                DC(int64(0xbb12b884375e89fe), EConversationDebugInfo::Executing);
                
                // The warders. I only work when they're close by or when ...
                Aleph.AI.Say(LocText("VLK_585_ALEPH_GUARDS_INFO_05_02"));
                DC(int64(0xbb12b884375e89fe), EConversationDebugInfo::Done);
                DC(int64(0xbb12b884375e89ff), EConversationDebugInfo::Executing);
                
                // And they don't notice?
                Hero.AI.Say(LocText("VLK_585_ALEPH_GUARDS_INFO_15_03"));
                DC(int64(0xbb12b884375e89ff), EConversationDebugInfo::Done);
                DC(int64(0xbb12b884375e8a00), EConversationDebugInfo::Executing);
                
                // Ah, well, some days I end up with a little less than the ...
                Aleph.AI.Say(LocText("VLK_585_ALEPH_GUARDS_INFO_05_04"));
                DC(int64(0xbb12b884375e8a00), EConversationDebugInfo::Done);
                DC(int64(0xbb12b884375e8a01), EConversationDebugInfo::Executing);
                // See, not toilin' me brains out means I catch all sorts ...
                Aleph.AI.Say(LocText("VLK_585_ALEPH_GUARDS_INFO_05_05"));
                DC(int64(0xbb12b884375e8a01), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OM_VLK_ALEPH, Document::UDocumentSegment_Glossary_OM_VLK_ALEPH_Gossip);
                DC(int64(0xa42ac433b35266d7), EConversationDebugInfo::Executing);
                Aleph.ExchangeDailyRoutineToClass(UDailyRoutine_OM_VLK_Aleph_585_Busy);
                DC(int64(0xa42ac433b35266d7), EConversationDebugInfo::Done);
                DC(int64(0xa42ac433b35266d9), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Brandick))) { Brandick.ExchangeDailyRoutineToClass(UDailyRoutine_OM_GRD_Brandick_261_Watch); }
                DC(int64(0xa42ac433b35266d9), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceVlk585AlephInfo : UTopic_Hero__OM_VLK_ALEPH_585
        {
            default DebugId = int64(0xbb12b884375e8a05);
            default Caption = LocText("VLK_585_ALEPH_INFO_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceVlk585AlephGuards);
            default Rules.HideIfKnows(UChoiceVlk585AlephInfo);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xbb12b884375e8a06), Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 10, 0));
                }
                
                return Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 10, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xbb12b884375e8a07), EConversationDebugInfo::Executing);
                // All right. Here are ten nuggets.
                Hero.AI.Say(LocText("VLK_585_ALEPH_INFO_INFO_15_01"));
                DC(int64(0xbb12b884375e8a07), EConversationDebugInfo::Done);
                DC(int64(0xbb12b884375e8a08), EConversationDebugInfo::Executing);
                
                // Good. If you go back to the mainshaft and follow the ...
                Aleph.AI.Say(LocText("VLK_585_ALEPH_INFO_INFO_05_02"));
                DC(int64(0xbb12b884375e8a08), EConversationDebugInfo::Done);
                DC(int64(0xbb12b884375e8a09), EConversationDebugInfo::Executing);
                // There's a warder by the second one, but he ain't likely ...
                Aleph.AI.Say(LocText("VLK_585_ALEPH_INFO_INFO_05_03"));
                DC(int64(0xbb12b884375e8a09), EConversationDebugInfo::Done);
                DC(int64(0xbb12b884375e8a0a), EConversationDebugInfo::Executing);
                // In that area, you'll come across a few pricey healing ...
                Aleph.AI.Say(LocText("VLK_585_ALEPH_INFO_INFO_05_04"));
                DC(int64(0xbb12b884375e8a0a), EConversationDebugInfo::Done);
                DC(int64(0xbb12b884375e8a0b), EConversationDebugInfo::Executing);
                // Come back anytime if you need more gossip. I'm sure I ...
                Aleph.AI.Say(LocText("VLK_585_ALEPH_INFO_INFO_05_05"));
                DC(int64(0xbb12b884375e8a0b), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OM_VLK_ALEPH, Document::UDocumentSegment_Glossary_OM_VLK_ALEPH_SecretLocation);
                DC(int64(0xa42ac433b35266e4), EConversationDebugInfo::Executing);
                Hero.AI.GiveItemTo(Aleph, UItMi_Orenugget, 10);
                DC(int64(0xa42ac433b35266e4), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceVlk585AlephKey : UTopic_Hero__OM_VLK_ALEPH_585
        {
            default DebugId = int64(0xbb12b884375e8a11);
            default Caption = LocText("VLK_585_ALEPH_KEY_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceVlk585AlephInfo);
            default Rules.HideIfKnows(UChoiceVlk585AlephKey);
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("GRD_261_BRANDICK_ALEPH_INFO_15_01"), int64(0xbb12b884375e8a11));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xbb12b884375e8a12), EConversationDebugInfo::Executing);
                // Can you give me more gossip? 
                Hero.AI.Say(LocText("VLK_585_ALEPH_KEY_INFO_15_01"));
                DC(int64(0xbb12b884375e8a12), EConversationDebugInfo::Done);
                DC(int64(0xbb12b884375e8a13), EConversationDebugInfo::Executing);
                
                // Sure thing. Got the nuggs?
                Aleph.AI.Say(LocText("VLK_585_ALEPH_KEY_INFO_05_02"));
                DC(int64(0xbb12b884375e8a13), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceVlk585AlephSchuppen : UTopic_Hero__OM_VLK_ALEPH_585
        {
            default DebugId = int64(0xbb12b884375e8a19);
            default Caption = LocText("VLK_585_ALEPH_SCHUPPEN_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("GRD_271_ULBERT_DRUNK_INFO_07_04"), int64(0xbb12b884375e8a19));
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("GRD_261_BRANDICK_ALEPH_INFO_06_03"), int64(0xbb12b884375e8a19));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf57d25ff3e85397e), Quest::OldMine_OMCHAPTER2_STORAGESHED_STORAGESHED_OBJ_KEY != nullptr && !Quest::OldMine_OMCHAPTER2_STORAGESHED_STORAGESHED_OBJ_KEY.HasSucceeded());
                }
                
                return Quest::OldMine_OMCHAPTER2_STORAGESHED_STORAGESHED_OBJ_KEY != nullptr && !Quest::OldMine_OMCHAPTER2_STORAGESHED_STORAGESHED_OBJ_KEY.HasSucceeded();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xbb12b884375e8a1a), EConversationDebugInfo::Executing);
                
                // What can you tell me about the key for the storage? 
                Hero.AI.Say(LocText("VLK_585_ALEPH_SCHUPPEN_INFO_15_01"));
                DC(int64(0xbb12b884375e8a1a), EConversationDebugInfo::Done);
                DC(int64(0xbb12b884375e8a1b), EConversationDebugInfo::Executing);
                
                // Well ... that depends ...
                Aleph.AI.Say(LocText("VLK_585_ALEPH_SCHUPPEN_INFO_05_02"));
                DC(int64(0xbb12b884375e8a1b), EConversationDebugInfo::Done);
                DC(int64(0xbb12b884375e8a1c), EConversationDebugInfo::Executing);
                
                // On how much ore I'm willing to part with? 
                Hero.AI.Say(LocText("VLK_585_ALEPH_SCHUPPEN_INFO_15_03"));
                DC(int64(0xbb12b884375e8a1c), EConversationDebugInfo::Done);
                DC(int64(0xbb12b884375e8a1d), EConversationDebugInfo::Executing);
                
                // You're a fast learner.
                Aleph.AI.Say(LocText("VLK_585_ALEPH_SCHUPPEN_INFO_05_04"));
                DC(int64(0xbb12b884375e8a1d), EConversationDebugInfo::Done);
                Subdialog(
                    UChoiceVlk585AlephSchuppen50,
                    UChoiceVlk585AlephSchuppen30,
                    UChoiceVlk585AlephSchuppen15,
                    UChoiceVlk585AlephSchuppenBack
                );
            }
        }
        
        
        class UChoiceVlk585AlephSchuppen50 : UTopic_Hero__OM_VLK_ALEPH_585
        {
            default DebugId = int64(0xe8603e87342bef62);
            default Caption = LocText("TEXT_CHOICE_VLK_585_ALEPH_SCHUPPEN_50");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa42ac433b3527dc1), Hero != nullptr && !Hero.HasItem(UItKe_Om_03, 1, 0));
                }
                
                return Hero != nullptr && !Hero.HasItem(UItKe_Om_03, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DB(int64(0xbb12b884375e8a21), Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 50, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 50, 0))
                {
                    DC(int64(0xbb12b884375e8a22), EConversationDebugInfo::Executing);
                    // Fifty should do the trick.
                    Hero.AI.Say(LocText("VLK_585_ALEPH_SCHUPPEN_50_15_01"));
                    DC(int64(0xbb12b884375e8a22), EConversationDebugInfo::Done);
                    DC(int64(0xbb12b884375e8a23), EConversationDebugInfo::Executing);
                    
                    // How generous. Here's the key - oh, and take this ring as ...
                    Aleph.AI.Say(LocText("VLK_585_ALEPH_SCHUPPEN_50_05_02"));
                    DC(int64(0xbb12b884375e8a23), EConversationDebugInfo::Done);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_STORAGESHED, Document::UDocumentSegment_CH1_STORAGESHED_Key);
                    DC(int64(0xa42ac433b35266f8), EConversationDebugInfo::Executing);
                    Hero.AddItemToInventory(UItKe_Om_03, 1);
                    DC(int64(0xa42ac433b35266f8), EConversationDebugInfo::Done);
                    DC(int64(0xa42ac433b3526700), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Aleph, UItMi_Orenugget, 50);
                    DC(int64(0xa42ac433b3526700), EConversationDebugInfo::Done);
                    DC(int64(0xa42ac433b3526702), EConversationDebugInfo::Executing);
                    Aleph.SetRelationshipTowards(Hero, ERelationship::Friend);
                    DC(int64(0xa42ac433b3526702), EConversationDebugInfo::Done);
                    DC(int64(0xa2bcb717f59ae7d7), EConversationDebugInfo::Executing);
                    Quest::OldMine_OMCHAPTER2_STORAGESHED_STORAGESHED_OBJ_KEY.SucceedQuest();
                    DC(int64(0xa2bcb717f59ae7d7), EConversationDebugInfo::Done);
                    DC(int64(0x12f475b5917c706f), EConversationDebugInfo::Executing);
                    Hero.AddItemToInventory(UItAt_Ring_Strong_01, 1);
                    DC(int64(0x12f475b5917c706f), EConversationDebugInfo::Done);
                    DC(int64(0x3beee4cd5da8f345), EConversationDebugInfo::Executing);
                    Aleph.RemoveItemFromInventory(UItKe_Om_03, 1, 1);
                    DC(int64(0x3beee4cd5da8f345), EConversationDebugInfo::Done);
                    DC(int64(0x3beee4cd5da8f347), EConversationDebugInfo::Executing);
                    Aleph.RemoveItemFromInventory(UItAt_Ring_Strong_01, 1, 0);
                    DC(int64(0x3beee4cd5da8f347), EConversationDebugInfo::Done);
                    DC(int64(0x1b672654c1559630), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x1b672654c1559630), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0xbb12b884375e8a2c), EConversationDebugInfo::Executing);
                    // You ain't got that much ... 
                    Aleph.AI.Say(LocText("VLK_585_ALEPH_SCHUPPEN_50_05_03"));
                    DC(int64(0xbb12b884375e8a2c), EConversationDebugInfo::Done);
                    DC(int64(0xbb12b884375e8a2e), EConversationDebugInfo::Executing);
                    ReturnToLastSelection(1);
                    DC(int64(0xbb12b884375e8a2e), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UChoiceVlk585AlephSchuppen30 : UTopic_Hero__OM_VLK_ALEPH_585
        {
            default DebugId = int64(0xe8603e87342bef75);
            default Caption = LocText("TEXT_CHOICE_VLK_585_ALEPH_SCHUPPEN_30");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa42ac433b3527dc1), Hero != nullptr && !Hero.HasItem(UItKe_Om_03, 1, 0));
                }
                
                return Hero != nullptr && !Hero.HasItem(UItKe_Om_03, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DB(int64(0xbb12b884375e8a31), Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 30, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 30, 0))
                {
                    DC(int64(0xbb12b884375e8a35), EConversationDebugInfo::Executing);
                    // Thirty nuggets sound fair? 
                    Hero.AI.Say(LocText("VLK_585_ALEPH_SCHUPPEN_30_15_01"));
                    DC(int64(0xbb12b884375e8a35), EConversationDebugInfo::Done);
                    DC(int64(0xbb12b884375e8a36), EConversationDebugInfo::Executing);
                    
                    // All right. As for the key: funny you'd ask, because I ...
                    Aleph.AI.Say(LocText("VLK_585_ALEPH_SCHUPPEN_30_05_02"));
                    DC(int64(0xbb12b884375e8a36), EConversationDebugInfo::Done);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_STORAGESHED, Document::UDocumentSegment_CH1_STORAGESHED_Key);
                    DC(int64(0xa42ac433b3526718), EConversationDebugInfo::Executing);
                    Hero.AddItemToInventory(UItKe_Om_03, 1);
                    DC(int64(0xa42ac433b3526718), EConversationDebugInfo::Done);
                    DC(int64(0xa42ac433b352671a), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Aleph, UItMi_Orenugget, 30);
                    DC(int64(0xa42ac433b352671a), EConversationDebugInfo::Done);
                    DC(int64(0xa2bcb717f59ae7d9), EConversationDebugInfo::Executing);
                    Quest::OldMine_OMCHAPTER2_STORAGESHED_STORAGESHED_OBJ_KEY.SucceedQuest();
                    DC(int64(0xa2bcb717f59ae7d9), EConversationDebugInfo::Done);
                    DC(int64(0x3beee4cd5da8f34f), EConversationDebugInfo::Executing);
                    Aleph.RemoveItemFromInventory(UItKe_Om_03, 1, 1);
                    DC(int64(0x3beee4cd5da8f34f), EConversationDebugInfo::Done);
                    DC(int64(0x1b672654c155962f), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x1b672654c155962f), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0xbb12b884375e8a38), EConversationDebugInfo::Executing);
                    // You ain't got that much. Try again.
                    Aleph.AI.Say(LocText("VLK_585_ALEPH_SCHUPPEN_30_05_03"));
                    DC(int64(0xbb12b884375e8a38), EConversationDebugInfo::Done);
                    DC(int64(0xbb12b884375e8a3a), EConversationDebugInfo::Executing);
                    ReturnToLastSelection(1);
                    DC(int64(0xbb12b884375e8a3a), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UChoiceVlk585AlephSchuppen15 : UTopic_Hero__OM_VLK_ALEPH_585
        {
            default DebugId = int64(0xe8603e87342bef84);
            default Caption = LocText("TEXT_CHOICE_VLK_585_ALEPH_SCHUPPEN_15");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa42ac433b3527dc1), Hero != nullptr && !Hero.HasItem(UItKe_Om_03, 1, 0));
                }
                
                return Hero != nullptr && !Hero.HasItem(UItKe_Om_03, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xbb12b884375e8a3c), EConversationDebugInfo::Executing);
                // How about fifteen?
                Hero.AI.Say(LocText("VLK_585_ALEPH_SCHUPPEN_15_15_01"));
                DC(int64(0xbb12b884375e8a3c), EConversationDebugInfo::Done);
                DC(int64(0xbb12b884375e8a3d), EConversationDebugInfo::Executing);
                
                // Fifteen, you say? Oh ... my memory's all foggy ... 
                Aleph.AI.Say(LocText("VLK_585_ALEPH_SCHUPPEN_15_05_02"));
                DC(int64(0xbb12b884375e8a3d), EConversationDebugInfo::Done);
                DC(int64(0xbb12b884375e8a3f), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xbb12b884375e8a3f), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceVlk585AlephSchuppenBack : UTopic_Hero__OM_VLK_ALEPH_585
        {
            default DebugId = int64(0xb8d5d0d8e7d55c21);
            default Caption = LocText("TEXT_BACK");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */