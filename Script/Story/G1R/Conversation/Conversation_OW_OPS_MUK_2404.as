#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OW_OPS_MUK_2404 : UConversationCharacterSettings
        {
            default ForCharacter = n"OW_OPS_MUK_2404";
        }
        
        
        class UTopic_Hero__OW_OPS_MUK_2404 : UG1RDialogTopic
        {
            default ForCharacter = n"OW_OPS_MUK_2404";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetMuk() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetUmakhal() const property
            {
                return GetCharacter(n"OW_OPS_UMAKHAL_2402");
            }
        }
        
        
        class UChoiceMuk100415 : UTopic_Hero__OW_OPS_MUK_2404
        {
            default DebugId = int64(0xe6bb99a9eea7c1c3);
            default Caption = LocText("TEXT_WIP_OAYMWIF_20240704_105127");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceMuk99976);
            default Rules.HideIfKnows(UChoiceMuk100415);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x229e9e10b3ddfb87), Umakhal != nullptr && Umakhal.HasAssignedDailyRoutine(UDailyRoutine_OW_OPS_Umakhal_2402_WaitEntrance));
                    DB(int64(0x229e9e10b3ddfb8c), Quest::ORCENCLAVE_MUKINCURSION != nullptr && !Quest::ORCENCLAVE_MUKINCURSION.HasBeenStarted());
                    DB(int64(0x42386345169a400a), Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE != nullptr && !Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE.HasSucceeded());
                    DB(int64(0x229e9e10b3ddfb87), Umakhal != nullptr && Umakhal.HasAssignedDailyRoutine(UDailyRoutine_OW_OPS_Umakhal_2402_WaitArena));
                    DB(int64(0x229e9e10b3ddfb8c), Quest::ORCENCLAVE_MUKINCURSION != nullptr && !Quest::ORCENCLAVE_MUKINCURSION.HasBeenStarted());
                    DB(int64(0x42386345169a400b), Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE != nullptr && !Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE.HasSucceeded());
                    DB(int64(0x229e9e10b3ddfb87), Umakhal != nullptr && Umakhal.HasAssignedDailyRoutine(UDailyRoutine_OW_OPS_Umakhal_2402_WaitThrone));
                    DB(int64(0x229e9e10b3ddfb8c), Quest::ORCENCLAVE_MUKINCURSION != nullptr && !Quest::ORCENCLAVE_MUKINCURSION.HasBeenStarted());
                    DB(int64(0x42386345169a400c), Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE != nullptr && !Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE.HasSucceeded());
                    DB(int64(0xf9c3048b07bb38b4), Umakhal != nullptr && Umakhal.IsEveryoneOfThisKindDead());
                    DB(int64(0x229e9e10b3ddfb84), Quest::ORCENCLAVE_MUKINCURSION != nullptr && !Quest::ORCENCLAVE_MUKINCURSION.HasBeenStarted());
                    DB(int64(0xc64e4ee6b7ddfe5), Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_OBJ_RIDOFUMAKHAL != nullptr && !Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_OBJ_RIDOFUMAKHAL.HasSucceeded());
                    DB(int64(0x42386345169a4009), Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE != nullptr && !Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE.HasSucceeded());
                }
                
                if (Umakhal != nullptr && Umakhal.HasAssignedDailyRoutine(UDailyRoutine_OW_OPS_Umakhal_2402_WaitEntrance) && Quest::ORCENCLAVE_MUKINCURSION != nullptr && !Quest::ORCENCLAVE_MUKINCURSION.HasBeenStarted() && Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE != nullptr && !Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE.HasSucceeded())
                    return true;
                
                if (Umakhal != nullptr && Umakhal.HasAssignedDailyRoutine(UDailyRoutine_OW_OPS_Umakhal_2402_WaitArena) && Quest::ORCENCLAVE_MUKINCURSION != nullptr && !Quest::ORCENCLAVE_MUKINCURSION.HasBeenStarted() && Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE != nullptr && !Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE.HasSucceeded())
                    return true;
                
                if (Umakhal != nullptr && Umakhal.HasAssignedDailyRoutine(UDailyRoutine_OW_OPS_Umakhal_2402_WaitThrone) && Quest::ORCENCLAVE_MUKINCURSION != nullptr && !Quest::ORCENCLAVE_MUKINCURSION.HasBeenStarted() && Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE != nullptr && !Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE.HasSucceeded())
                    return true;
                
                if (Umakhal != nullptr && Umakhal.IsEveryoneOfThisKindDead() && Quest::ORCENCLAVE_MUKINCURSION != nullptr && !Quest::ORCENCLAVE_MUKINCURSION.HasBeenStarted() && Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_OBJ_RIDOFUMAKHAL != nullptr && !Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_OBJ_RIDOFUMAKHAL.HasSucceeded() && Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE != nullptr && !Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE.HasSucceeded())
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe6bb99a9eea7c1c1), EConversationDebugInfo::Executing);
                // What do you want?
                Hero.AI.Say(LocText("TEXT_WIP_OAYMWIF_20240704_105127"));
                DC(int64(0xe6bb99a9eea7c1c1), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceMuk100426 : UTopic_Hero__OW_OPS_MUK_2404
        {
            default DebugId = int64(0xe6bb99a9eea7c1c8);
            default Caption = FText::FromString("[Followup Topic]");;
            default bIsFollowupTopic = true;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceMuk100415);
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceMuk102226);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9d5bf4c6fa761b27), EConversationDebugInfo::Executing);
                
                // Well, um ... some moons before, Krashok took Muk out ...
                Muk.AI.Say(LocText("TEXT_WIP_JYRXZUK_20240703_154458"));
                DC(int64(0x9d5bf4c6fa761b27), EConversationDebugInfo::Done);
                DC(int64(0x4517bf9906b9c90d), EConversationDebugInfo::Executing);
                
                // The Old Camp?
                Hero.AI.Say(LocText("TEXT_WIP_XGKWYUI_20240716_164756"));
                DC(int64(0x4517bf9906b9c90d), EConversationDebugInfo::Done);
                DC(int64(0x4517bf9906b9c90c), EConversationDebugInfo::Executing);
                
                // I think that is the name, yes. Muk found fresh body of ...
                Muk.AI.Say(LocText("TEXT_WIP_XGKWYUI_20240716_164710"));
                DC(int64(0x4517bf9906b9c90c), EConversationDebugInfo::Done);
                DC(int64(0x9d5bf4c6fa761b29), EConversationDebugInfo::Executing);
                // Meaty, mushy, so full of taste ... now Muk wants it ...
                Muk.AI.Say(LocText("TEXT_WIP_JYRXZUK_20240703_154610"));
                DC(int64(0x9d5bf4c6fa761b29), EConversationDebugInfo::Done);
                DC(int64(0x9d5bf4c6fa761b2a), EConversationDebugInfo::Executing);
                
                // You ... want me to bring you this food? 
                Hero.AI.Say(LocText("TEXT_WIP_JYRXZUK_20240703_154627"));
                DC(int64(0x9d5bf4c6fa761b2a), EConversationDebugInfo::Done);
                DC(int64(0x9d5bf4c6fa761b2b), EConversationDebugInfo::Executing);
                
                // Yes. Yes! If the morra does, Muk will always be ...
                Muk.AI.Say(LocText("TEXT_WIP_JYRXZUK_20240703_154638"));
                DC(int64(0x9d5bf4c6fa761b2b), EConversationDebugInfo::Done);
                DC(int64(0x4517bf9906b9c93a), EConversationDebugInfo::Executing);
                
                // Hmm ... this might be useful.
                Hero.AI.Say(LocText("TEXT_WIP_XGKWYUI_20240716_170927"));
                DC(int64(0x4517bf9906b9c93a), EConversationDebugInfo::Done);
                DC(int64(0x4517bf9906b9c949), EConversationDebugInfo::Executing);
                // Say, Muk: if I bring you this food, can you help me get ...
                Hero.AI.Say(LocText("TEXT_WIP_XGKWYUI_20240716_171212"));
                DC(int64(0x4517bf9906b9c949), EConversationDebugInfo::Done);
                DC(int64(0x4517bf9906b9c94a), EConversationDebugInfo::Executing);
                
                // Temple? Why?!
                Muk.AI.Say(LocText("TEXT_WIP_XGKWYUI_20240716_171241"));
                DC(int64(0x4517bf9906b9c94a), EConversationDebugInfo::Done);
                DC(int64(0x4517bf9906b9c94b), EConversationDebugInfo::Executing);
                
                // Yes or no?
                Hero.AI.Say(LocText("TEXT_WIP_XGKWYUI_20240716_171249"));
                DC(int64(0x4517bf9906b9c94b), EConversationDebugInfo::Done);
                DC(int64(0x4517bf9906b9c94c), EConversationDebugInfo::Executing);
                
                // ... Difficult. Muk is not supposed to, but the food ... ...
                Muk.AI.Say(LocText("TEXT_WIP_XGKWYUI_20240716_171255"));
                DC(int64(0x4517bf9906b9c94c), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OW_OPS_MUK, Document::UDocumentSegment_Glossary_OW_OPS_MUK_Food);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH5_MUKINCURSION, Document::UDocumentSegment_CH5_MUKINCURSION_Start);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH5_ACCESSSLEEPERTEMPLE, Document::UDocumentSegment_CH5_ACCESSSLEEPERTEMPLE_HelpMuk);
                Subdialog(
                    UTopic_Muk_200231,
                    UTopic_Muk_200251,
                    UTopic_Muk_200278,
                    UTopic_Muk_200300
                );
            }
        }
        
        
        class UTopic_Muk_200231 : UTopic_Hero__OW_OPS_MUK_2404
        {
            default DebugId = int64(0xd57b2dc71a67a6d);
            default Caption = LocText("TEXT_WIP_ZOQQDM_20260710_150538_2138");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Muk_200231);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x26b30c201c0046ef), Hero != nullptr && Hero.HasItem(UItFo_Apple, 1, 0));
                }
                
                return Hero != nullptr && Hero.HasItem(UItFo_Apple, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9d5bf4c6fa761b2e), EConversationDebugInfo::Executing);
                // Is this the food you wanted?
                Hero.AI.Say(LocText("TEXT_WIP_JYRXZUK_20240703_154707_3902"));
                DC(int64(0x9d5bf4c6fa761b2e), EConversationDebugInfo::Done);
                DC(int64(0xeeb2d8e292e1a421), EConversationDebugInfo::Executing);
                Hero.AI.TryInteractionWithoutSpot(GameplayTag::Action_Conversation_ShowApple, 3);
                DC(int64(0xeeb2d8e292e1a421), EConversationDebugInfo::Done);
                DC(int64(0x9d5bf4c6fa761b35), EConversationDebugInfo::Executing);
                // Hm? That's an apple! No. No, the food was warm. Cooked!
                Muk.AI.Say(LocText("TEXT_WIP_JYRXZUK_20240703_154727"));
                DC(int64(0x9d5bf4c6fa761b35), EConversationDebugInfo::Done);
                DC(int64(0xbae9335006ad58c0), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xbae9335006ad58c0), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Muk_200251 : UTopic_Hero__OW_OPS_MUK_2404
        {
            default DebugId = int64(0xd57b2dc71a67a71);
            default Caption = LocText("TEXT_WIP_JYRXZUK_20240703_154707_292");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Muk_200251);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9d5bf4c6fa761b32), EConversationDebugInfo::Executing);
                // How about some meat?
                Hero.AI.Say(LocText("TEXT_WIP_JYRXZUK_20240703_154707_292"));
                DC(int64(0x9d5bf4c6fa761b32), EConversationDebugInfo::Done);
                DC(int64(0x9d5bf4c6fa761b36), EConversationDebugInfo::Executing);
                
                // Bah! Muk has meat, a lot. It was warm and with spice and ...
                Muk.AI.Say(LocText("TEXT_WIP_JYRXZUK_20240703_154833"));
                DC(int64(0x9d5bf4c6fa761b36), EConversationDebugInfo::Done);
                DC(int64(0xbae9335006ad58c3), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xbae9335006ad58c3), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Muk_200278 : UTopic_Hero__OW_OPS_MUK_2404
        {
            default DebugId = int64(0xd57b2dc71a67a86);
            default Caption = LocText("TEXT_WIP_JYRXZUK_20240703_154852_94");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Muk_200278);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9d5bf4c6fa761b38), EConversationDebugInfo::Executing);
                // What about some Grilled Biter?
                Hero.AI.Say(LocText("TEXT_WIP_JYRXZUK_20240703_154852_94"));
                DC(int64(0x9d5bf4c6fa761b38), EConversationDebugInfo::Done);
                DC(int64(0x9d5bf4c6fa761b3b), EConversationDebugInfo::Executing);
                
                // Biters? Morra eat biters? Uh... not good.
                Muk.AI.Say(LocText("TEXT_WIP_JYRXZUK_20240703_155019"));
                DC(int64(0x9d5bf4c6fa761b3b), EConversationDebugInfo::Done);
                DC(int64(0x4517bf9906b9c94e), EConversationDebugInfo::Executing);
                // It is something else ... oh, if only Muk knew the morra ...
                Muk.AI.Say(LocText("TEXT_WIP_XGKWYUI_20240716_171628"));
                DC(int64(0x4517bf9906b9c94e), EConversationDebugInfo::Done);
                DC(int64(0xbae9335006ad58c6), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xbae9335006ad58c6), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Muk_200300 : UTopic_Hero__OW_OPS_MUK_2404
        {
            default DebugId = int64(0xd57b2dc71a67a95);
            default Caption = LocText("TEXT_WIP_ISLVYVK_20250707_103732");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Muk_200300);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9afb83adba2704f5), EConversationDebugInfo::Executing);
                // You mean meatbug ragout? Mushy? Meaty? With mushrooms?
                Hero.AI.Say(LocText("TEXT_WIP_ISLVYVK_20250707_103732"));
                DC(int64(0x9afb83adba2704f5), EConversationDebugInfo::Done);
                DC(int64(0x9afb83adba2704f6), EConversationDebugInfo::Executing);
                
                // Yes! Sounds good! That's what I want!
                Muk.AI.Say(LocText("TEXT_WIP_ISLVYVK_20250707_103734"));
                DC(int64(0x9afb83adba2704f6), EConversationDebugInfo::Done);
                DC(int64(0x9d5bf4c6fa761b42), EConversationDebugInfo::Executing);
                Quest::ORCENCLAVE_MUKINCURSION.StartQuest();
                DC(int64(0x9d5bf4c6fa761b42), EConversationDebugInfo::Done);
                DC(int64(0xb643ac31c20478bf), EConversationDebugInfo::Executing);
                Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_STEALTHPATH.StartQuest();
                DC(int64(0xb643ac31c20478bf), EConversationDebugInfo::Done);
                DC(int64(0xc413ac721f0749eb), EConversationDebugInfo::Executing);
                Muk.ExchangeDailyRoutineToClass(UDailyRoutine_OW_OPS_Muk_2404_Alone);
                DC(int64(0xc413ac721f0749eb), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceMuk100990 : UTopic_Hero__OW_OPS_MUK_2404
        {
            default DebugId = int64(0x9d5bf4c6fa761b16);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceMuk99976);
            default Rules.HideIfKnows(UChoiceMuk100990);
            
            default ExtraCharactersToInvite.Add(n"OW_OPS_UMAKHAL_2402");
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x9d5bf4c6fa761b1c), Umakhal != nullptr && Umakhal.HasAssignedDailyRoutine(UDailyRoutine_OW_OPS_Umakhal_2402_Follow));
                    DB(int64(0x9d5bf4c6fa761b1d), Umakhal != nullptr && Umakhal.IsCloseToCharacter(Hero, 1500.0f));
                    DB(int64(0x81f64416fab85d94), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Skilled));
                    DB(int64(0x42386345169a4003), Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE != nullptr && !Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE.HasSucceeded());
                    DB(int64(0x9d5bf4c6fa761b1c), Umakhal != nullptr && Umakhal.HasAssignedDailyRoutine(UDailyRoutine_OW_OPS_Umakhal_2402_Follow));
                    DB(int64(0x9d5bf4c6fa761b1d), Umakhal != nullptr && Umakhal.IsCloseToCharacter(Hero, 1500.0f));
                    DB(int64(0x81f64416fab85d94), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Master));
                    DB(int64(0x42386345169a4004), Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE != nullptr && !Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE.HasSucceeded());
                }
                
                if (Umakhal != nullptr && Umakhal.HasAssignedDailyRoutine(UDailyRoutine_OW_OPS_Umakhal_2402_Follow) && Umakhal != nullptr && Umakhal.IsCloseToCharacter(Hero, 1500.0f) && Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Skilled) && Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE != nullptr && !Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE.HasSucceeded())
                    return true;
                
                if (Umakhal != nullptr && Umakhal.HasAssignedDailyRoutine(UDailyRoutine_OW_OPS_Umakhal_2402_Follow) && Umakhal != nullptr && Umakhal.IsCloseToCharacter(Hero, 1500.0f) && Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Master) && Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE != nullptr && !Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE.HasSucceeded())
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9d5bf4c6fa761b18), EConversationDebugInfo::Executing);
                // But they can't speak while Umakhal is here. 
                Muk.AI.Say(LocText("TEXT_WIP_JYRXZUK_20240703_153606"));
                DC(int64(0x9d5bf4c6fa761b18), EConversationDebugInfo::Done);
                DC(int64(0x9d5bf4c6fa761b19), EConversationDebugInfo::Executing);
                // Can the morra shake him off? Then they could speak.
                Muk.AI.Say(LocText("TEXT_WIP_JYRXZUK_20240703_153634"));
                DC(int64(0x9d5bf4c6fa761b19), EConversationDebugInfo::Done);
                DC(int64(0x56529d3224c731fa), EConversationDebugInfo::Executing);
                
                // Go away, Muk. This is none of your business.
                Umakhal.AI.Say(LocText("TEXT_WIP_OEUGPYB_20250311_145255"));
                DC(int64(0x56529d3224c731fa), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OW_OPS_MUK, Document::UDocumentSegment_Glossary_OW_OPS_MUK_Alone);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH5_ACCESSSLEEPERTEMPLE, Document::UDocumentSegment_CH5_ACCESSSLEEPERTEMPLE_Muk);
                DC(int64(0xd57b2dc71a679ce), EConversationDebugInfo::Executing);
                Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_OBJ_RIDOFUMAKHAL.StartQuest();
                DC(int64(0xd57b2dc71a679ce), EConversationDebugInfo::Done);
                DC(int64(0x9d5bf4c6fa761b1e), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x9d5bf4c6fa761b1e), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceMuk102226 : UTopic_Hero__OW_OPS_MUK_2404
        {
            default DebugId = int64(0x9d5bf4c6fa761b5d);
            default Caption = LocText("TEXT_WIP_OAYMWIF_20240704_105054");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceMuk99976);
            default Rules.HideIfKnows(UChoiceMuk102226);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf9c3048b07bb38ab), Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_OBJ_RIDOFUMAKHAL != nullptr && Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_OBJ_RIDOFUMAKHAL.HasSucceeded());
                    DB(int64(0xf9c3048b07bb38ae), Quest::ORCENCLAVE_MUKINCURSION != nullptr && !Quest::ORCENCLAVE_MUKINCURSION.HasBeenStarted());
                    DB(int64(0x42386345169a400e), Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE != nullptr && !Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE.HasSucceeded());
                    DB(int64(0x64e9f15b29fe64b9), Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_JYRXZUK_20240703_153606")));
                    DB(int64(0xf9c3048b07bb38b8), Umakhal != nullptr && Umakhal.IsEveryoneOfThisKindDead());
                    DB(int64(0x229e9e10b3ddfb85), Quest::ORCENCLAVE_MUKINCURSION != nullptr && !Quest::ORCENCLAVE_MUKINCURSION.HasBeenStarted());
                    DB(int64(0xc64e4ee6b7ddfe2), Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_OBJ_RIDOFUMAKHAL != nullptr && Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_OBJ_RIDOFUMAKHAL.HasSucceeded());
                    DB(int64(0x42386345169a400d), Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE != nullptr && !Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE.HasSucceeded());
                    DB(int64(0x64e9f15b29fe64b8), Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_JYRXZUK_20240703_153606")));
                }
                
                if (Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_OBJ_RIDOFUMAKHAL != nullptr && Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_OBJ_RIDOFUMAKHAL.HasSucceeded() && Quest::ORCENCLAVE_MUKINCURSION != nullptr && !Quest::ORCENCLAVE_MUKINCURSION.HasBeenStarted() && Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE != nullptr && !Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE.HasSucceeded() && Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_JYRXZUK_20240703_153606")))
                    return true;
                
                if (Umakhal != nullptr && Umakhal.IsEveryoneOfThisKindDead() && Quest::ORCENCLAVE_MUKINCURSION != nullptr && !Quest::ORCENCLAVE_MUKINCURSION.HasBeenStarted() && Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_OBJ_RIDOFUMAKHAL != nullptr && Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_OBJ_RIDOFUMAKHAL.HasSucceeded() && Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE != nullptr && !Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE.HasSucceeded() && Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_JYRXZUK_20240703_153606")))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe6bb99a9eea7c1c0), EConversationDebugInfo::Executing);
                // Umakhal won't bother us now. 
                Hero.AI.Say(LocText("TEXT_WIP_OAYMWIF_20240704_105054"));
                DC(int64(0xe6bb99a9eea7c1c0), EConversationDebugInfo::Done);
                DC(int64(0x4517bf9906b9c90a), EConversationDebugInfo::Executing);
                
                // Morra smart! How did he make mighty Umakhal unfollow ...
                Muk.AI.Say(LocText("TEXT_WIP_XGKWYUI_20240716_095622"));
                DC(int64(0x4517bf9906b9c90a), EConversationDebugInfo::Done);
                DC(int64(0x4517bf9906b9c90b), EConversationDebugInfo::Executing);
                
                // I have my ways. What did you want to speak about?
                Hero.AI.Say(LocText("TEXT_WIP_XGKWYUI_20240716_095640"));
                DC(int64(0x4517bf9906b9c90b), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceMuk103094 : UTopic_Hero__OW_OPS_MUK_2404
        {
            default DebugId = int64(0xcce0358b62c9b978);
            default Caption = LocText("TEXT_WIP_WGKWYUI_20240717_221216");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceMuk103094);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4517bf9906b9c92e), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Master));
                    DB(int64(0x4517bf9906b9c92e), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Skilled));
                }
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Master))
                    return true;
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Skilled))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xcce0358b62c9b974), EConversationDebugInfo::Executing);
                // What are your thoughts on the Sleeper?
                Hero.AI.Say(LocText("TEXT_WIP_WGKWYUI_20240717_221216"));
                DC(int64(0xcce0358b62c9b974), EConversationDebugInfo::Done);
                DC(int64(0xcce0358b62c9b975), EConversationDebugInfo::Executing);
                
                // Muk's ... thoughts?
                Muk.AI.Say(LocText("TEXT_WIP_WGKWYUI_20240717_221216_41"));
                DC(int64(0xcce0358b62c9b975), EConversationDebugInfo::Done);
                DC(int64(0xcce0358b62c9b97c), EConversationDebugInfo::Executing);
                
                // Do you look forward to when he wakes up?
                Hero.AI.Say(LocText("TEXT_WIP_WGKWYUI_20240717_221352"));
                DC(int64(0xcce0358b62c9b97c), EConversationDebugInfo::Done);
                DC(int64(0xcce0358b62c9b97e), EConversationDebugInfo::Executing);
                
                // Um ... maybe? Muk doesn't know. 
                Muk.AI.Say(LocText("TEXT_WIP_WGKWYUI_20240717_221444"));
                DC(int64(0xcce0358b62c9b97e), EConversationDebugInfo::Done);
                DC(int64(0xcce0358b62c9b97f), EConversationDebugInfo::Executing);
                // Ur-Nazkrog, Grazkrak... everyone speaks about the ...
                Muk.AI.Say(LocText("TEXT_WIP_WGKWYUI_20240717_221508"));
                DC(int64(0xcce0358b62c9b97f), EConversationDebugInfo::Done);
                DC(int64(0xcce0358b62c9b980), EConversationDebugInfo::Executing);
                // But Muk already likes the world. He doesn't want ...
                Muk.AI.Say(LocText("TEXT_WIP_WGKWYUI_20240717_221549"));
                DC(int64(0xcce0358b62c9b980), EConversationDebugInfo::Done);
                DC(int64(0xcce0358b62c9b981), EConversationDebugInfo::Executing);
                // That's all. 
                Muk.AI.Say(LocText("TEXT_WIP_WGKWYUI_20240717_221627"));
                DC(int64(0xcce0358b62c9b981), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceMuk104218 : UTopic_Hero__OW_OPS_MUK_2404
        {
            default DebugId = int64(0xcce0358b62c9b990);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceMuk104218);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4df59c83834d0b13), G1R != nullptr && G1R.IsDoorOpen(n"Orc_Secret_Door"));
                }
                
                return G1R != nullptr && G1R.IsDoorOpen(n"Orc_Secret_Door");
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xcce0358b62c9b98d), EConversationDebugInfo::Executing);
                // There! If the morra follows this tunnel, he will be in ...
                Muk.AI.Say(LocText("TEXT_WIP_WGKWYUI_20240717_222352_2785"));
                DC(int64(0xcce0358b62c9b98d), EConversationDebugInfo::Done);
                DC(int64(0xcce0358b62c9b994), EConversationDebugInfo::Executing);
                // But he must be silent! The warriors will throw him out ...
                Muk.AI.Say(LocText("TEXT_WIP_WGKWYUI_20240717_222526"));
                DC(int64(0xcce0358b62c9b994), EConversationDebugInfo::Done);
                DC(int64(0xcce0358b62c9b995), EConversationDebugInfo::Executing);
                // Even the Ulu-Mulu won't help him. What does the morra ...
                Muk.AI.Say(LocText("TEXT_WIP_WGKWYUI_20240717_222640"));
                DC(int64(0xcce0358b62c9b995), EConversationDebugInfo::Done);
                DC(int64(0xcce0358b62c9b996), EConversationDebugInfo::Executing);
                
                // It's complicated. Thank you, Muk. 
                Hero.AI.Say(LocText("TEXT_WIP_WGKWYUI_20240717_222651"));
                DC(int64(0xcce0358b62c9b996), EConversationDebugInfo::Done);
                DC(int64(0xcce0358b62c9b998), EConversationDebugInfo::Executing);
                
                // No, Muk thanks the morra! The mush will keep Muk's belly ...
                Muk.AI.Say(LocText("TEXT_WIP_WGKWYUI_20240717_222747"));
                DC(int64(0xcce0358b62c9b998), EConversationDebugInfo::Done);
                DC(int64(0xcce0358b62c9b999), EConversationDebugInfo::Executing);
                // If he ever finds more of the mush ... 
                Muk.AI.Say(LocText("TEXT_WIP_WGKWYUI_20240717_222827"));
                DC(int64(0xcce0358b62c9b999), EConversationDebugInfo::Done);
                DC(int64(0xcce0358b62c9b99a), EConversationDebugInfo::Executing);
                
                // I'll see what I can do.
                Hero.AI.Say(LocText("TEXT_WIP_WGKWYUI_20240717_222840"));
                DC(int64(0xcce0358b62c9b99a), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OW_OPS_MUK, Document::UDocumentSegment_Glossary_OW_OPS_MUK_SecretPath);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH5_ACCESSSLEEPERTEMPLE, Document::UDocumentSegment_CH5_ACCESSSLEEPERTEMPLE_SecretPath);
            }
        }
        
        
        class UChoiceMuk105136 : UTopic_Hero__OW_OPS_MUK_2404
        {
            default DebugId = int64(0x4517bf9906b9c929);
            default Caption = LocText("TEXT_WIP_XGKWYUI_20240716_165726");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceMuk105136);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4517bf9906b9c92e), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Master));
                    DB(int64(0x4517bf9906b9c92e), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Skilled));
                }
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Master))
                    return true;
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Skilled))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4517bf9906b9c925), EConversationDebugInfo::Executing);
                // You seem ... different than the other orcs. 
                Hero.AI.Say(LocText("TEXT_WIP_XGKWYUI_20240716_165726"));
                DC(int64(0x4517bf9906b9c925), EConversationDebugInfo::Done);
                DC(int64(0x4517bf9906b9c926), EConversationDebugInfo::Executing);
                
                // "Different?"
                Muk.AI.Say(LocText("TEXT_WIP_XGKWYUI_20240716_165726_2785"));
                DC(int64(0x4517bf9906b9c926), EConversationDebugInfo::Done);
                DC(int64(0x4517bf9906b9c933), EConversationDebugInfo::Executing);
                
                // The way you speak. 
                Hero.AI.Say(LocText("TEXT_WIP_XGKWYUI_20240716_165821"));
                DC(int64(0x4517bf9906b9c933), EConversationDebugInfo::Done);
                DC(int64(0x4517bf9906b9c934), EConversationDebugInfo::Executing);
                
                // Oh. Well - Muk's kin say it is because Muk hit his head ...
                Muk.AI.Say(LocText("TEXT_WIP_XGKWYUI_20240716_165840"));
                DC(int64(0x4517bf9906b9c934), EConversationDebugInfo::Done);
                DC(int64(0x4517bf9906b9c935), EConversationDebugInfo::Executing);
                // But would Muk remember if he did? 
                Muk.AI.Say(LocText("TEXT_WIP_XGKWYUI_20240716_165943"));
                DC(int64(0x4517bf9906b9c935), EConversationDebugInfo::Done);
                DC(int64(0x4517bf9906b9c936), EConversationDebugInfo::Executing);
                // Ah. It doesn't matter. Muk is strong, and so is his ...
                Muk.AI.Say(LocText("TEXT_WIP_XGKWYUI_20240716_165958"));
                DC(int64(0x4517bf9906b9c936), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceMuk105739 : UTopic_Hero__OW_OPS_MUK_2404
        {
            default DebugId = int64(0xbfa11b5924e00cfe);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceMuk104218);
            default Rules.HideIfKnows(UChoiceMuk105739);
            
            default Rules.RequireCharacterCloseToWaypoint(n"HERO", n"WP_ORC_STORY_TUNNEL", 100.0f, int64(0xbfa11b5924e00cfe));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xbfa11b5924e00cfb), EConversationDebugInfo::Executing);
                // Good luck!
                Muk.AI.Say(LocText("TEXT_WIP_ZOVLFV_20241105_111052_41"));
                DC(int64(0xbfa11b5924e00cfb), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceMuk106010 : UTopic_Hero__OW_OPS_MUK_2404
        {
            default DebugId = int64(0x4517bf9906b9c93f);
            default Caption = LocText("TEXT_WIP_XGKWYUI_20240716_170947");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceMuk100426);
            default Rules.HideIfKnows(UChoiceMuk106010);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4df59c83834d0b05), Quest::ORCENCLAVE_MUKINCURSION != nullptr && Quest::ORCENCLAVE_MUKINCURSION.IsRunning());
                }
                
                return Quest::ORCENCLAVE_MUKINCURSION != nullptr && Quest::ORCENCLAVE_MUKINCURSION.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4517bf9906b9c93b), EConversationDebugInfo::Executing);
                
                // Remind me - what did that food look like?
                Hero.AI.Say(LocText("TEXT_WIP_XGKWYUI_20240716_170947"));
                DC(int64(0x4517bf9906b9c93b), EConversationDebugInfo::Done);
                DC(int64(0x4517bf9906b9c93c), EConversationDebugInfo::Executing);
                
                // Food? Oh. Yes! It's warm, and dark, and meaty. 
                Muk.AI.Say(LocText("TEXT_WIP_XGKWYUI_20240716_170947_3286"));
                DC(int64(0x4517bf9906b9c93c), EConversationDebugInfo::Done);
                DC(int64(0x4517bf9906b9c943), EConversationDebugInfo::Executing);
                // Muk will never forget the taste ... 
                Muk.AI.Say(LocText("TEXT_WIP_XGKWYUI_20240716_171027"));
                DC(int64(0x4517bf9906b9c943), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceMuk200192 : UTopic_Hero__OW_OPS_MUK_2404
        {
            default DebugId = int64(0xd57b2dc71a67a22);
            default Caption = LocText("TEXT_WIP_JYRXZUK_20240703_155038_1037");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceMuk99976);
            default Rules.HideIfKnows(UChoiceMuk200192);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x9d5bf4c6fa761b4a), Quest::ORCENCLAVE_MUKINCURSION != nullptr && Quest::ORCENCLAVE_MUKINCURSION.IsRunning());
                    DB(int64(0x9d5bf4c6fa761b4b), Hero != nullptr && Hero.HasItem(UItFo_Meatbugragout, 1, 0));
                }
                
                if (Quest::ORCENCLAVE_MUKINCURSION != nullptr && !Quest::ORCENCLAVE_MUKINCURSION.IsRunning())
                    return false;
                
                if (Hero != nullptr && !Hero.HasItem(UItFo_Meatbugragout, 1, 0))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9d5bf4c6fa761b3d), EConversationDebugInfo::Executing);
                
                // (Offer meatbug ragout) Is this what you want? 
                Hero.AI.Say(LocText("TEXT_WIP_JYRXZUK_20240703_155038_1037"));
                DC(int64(0x9d5bf4c6fa761b3d), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH5_MUKINCURSION, Document::UDocumentSegment_CH5_MUKINCURSION_End);
                DC(int64(0xeeb2d8e292e1a42d), EConversationDebugInfo::Executing);
                Hero.AI.TryInteractionWithoutSpot(GameplayTag::Action_Conversation_ShowMeatbugRagout, 3);
                DC(int64(0xeeb2d8e292e1a42d), EConversationDebugInfo::Done);
                DC(int64(0x9d5bf4c6fa761b40), EConversationDebugInfo::Executing);
                // Let Muk see ... YES! Yes, that is the food! So good ... ...
                Muk.AI.Say(LocText("TEXT_WIP_JYRXZUK_20240703_155101"));
                DC(int64(0x9d5bf4c6fa761b40), EConversationDebugInfo::Done);
                DC(int64(0x9d5bf4c6fa761b4d), EConversationDebugInfo::Executing);
                Hero.RemoveItemFromInventory(UItFo_Meatbugragout, 1, 0);
                DC(int64(0x9d5bf4c6fa761b4d), EConversationDebugInfo::Done);
                DC(int64(0x4df59c83834d0b0d), EConversationDebugInfo::Executing);
                Quest::ORCENCLAVE_MUKINCURSION_MUKINCURSION_OBJ_FOOD.SucceedQuest();
                DC(int64(0x4df59c83834d0b0d), EConversationDebugInfo::Done);
                DC(int64(0xf2fc6546c5997caf), EConversationDebugInfo::Executing);
                Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_STEALTHPATH.SucceedQuest();
                DC(int64(0xf2fc6546c5997caf), EConversationDebugInfo::Done);
                DC(int64(0xcce0358b62c9b982), EConversationDebugInfo::Executing);
                // Now, about the temple ... 
                Hero.AI.Say(LocText("TEXT_WIP_WGKWYUI_20240717_222233"));
                DC(int64(0xcce0358b62c9b982), EConversationDebugInfo::Done);
                DC(int64(0xcce0358b62c9b983), EConversationDebugInfo::Executing);
                
                // Right. Right, the morra wants to see the temple! 
                Muk.AI.Say(LocText("TEXT_WIP_WGKWYUI_20240717_222255"));
                DC(int64(0xcce0358b62c9b983), EConversationDebugInfo::Done);
                DC(int64(0x9d5bf4c6fa761b4f), EConversationDebugInfo::Executing);
                // Muk knows a secret path, and Muk will show him. Come!
                Muk.AI.Say(LocText("TEXT_WIP_JYRXZUK_20240703_155751_3511"));
                DC(int64(0x9d5bf4c6fa761b4f), EConversationDebugInfo::Done);
                DC(int64(0x9d5bf4c6fa761b51), EConversationDebugInfo::Executing);
                Muk.ExchangeDailyRoutineToClass(UDailyRoutine_OW_OPS_Muk_2404_OpenGate);
                DC(int64(0x9d5bf4c6fa761b51), EConversationDebugInfo::Done);
                DC(int64(0x9d5bf4c6fa761b52), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x9d5bf4c6fa761b52), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceMuk99960 : UTopic_Hero__OW_OPS_MUK_2404
        {
            default DebugId = int64(0x588059eee9a820d2);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 3;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x588059eee9a820d1), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x588059eee9a820d1), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceMuk99976 : UTopic_Hero__OW_OPS_MUK_2404
        {
            default DebugId = int64(0x588059eee9a820d6);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::WalkToOther;
            
            default Rules.HideIfKnows(UChoiceMuk99976);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x42386345169a3fc4), Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE != nullptr && !Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE.HasSucceeded());
                }
                
                return Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE != nullptr && !Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE.HasSucceeded();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OW_OPS_MUK, Document::UDocumentSegment_Glossary_OW_OPS_MUK_Introduction);
                DB(int64(0xd7d74b03ea9f3d4c), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Master));
                DB(int64(0x25f202a74ccd4882), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Skilled));
                
                if ((Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Master)) || (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Skilled)))
                {
                    DC(int64(0x25f202a74ccd4884), EConversationDebugInfo::Executing);
                    // Morra! Morra!
                    Muk.AI.Say(LocText("TEXT_WIP_YGKWYUI_20240715_175913_41"));
                    DC(int64(0x25f202a74ccd4884), EConversationDebugInfo::Done);
                    DC(int64(0x4517bf9906b9c8fd), EConversationDebugInfo::Executing);
                    
                    // Are you talking to me?
                    Hero.AI.Say(LocText("TEXT_WIP_XGKWYUI_20240716_094243"));
                    DC(int64(0x4517bf9906b9c8fd), EConversationDebugInfo::Done);
                    DC(int64(0x4517bf9906b9c8fe), EConversationDebugInfo::Executing);
                    
                    // Yes! 
                    Muk.AI.Say(LocText("TEXT_WIP_XGKWYUI_20240716_094248"));
                    DC(int64(0x4517bf9906b9c8fe), EConversationDebugInfo::Done);
                    DC(int64(0x4517bf9906b9c8ff), EConversationDebugInfo::Executing);
                    // So long since Muk saw a morra! Can they speak?
                    Muk.AI.Say(LocText("TEXT_WIP_XGKWYUI_20240716_094329"));
                    DC(int64(0x4517bf9906b9c8ff), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_muk_99976_exit_1");
                }
                else
                {
                    DC(int64(0x25f202a74ccd4886), EConversationDebugInfo::Executing);
                    // Morra! Morra!
                    Muk.AI.Say(LocText("TEXT_WIP_YGKWYUI_20240715_175913_41"), ForceSubtitleLanguage = n"foreign");
                    DC(int64(0x25f202a74ccd4886), EConversationDebugInfo::Done);
                    DC(int64(0x4517bf9906b9c900), EConversationDebugInfo::Executing);
                    // So long since Muk saw a morra! Can they speak?
                    Muk.AI.Say(LocText("TEXT_WIP_XGKWYUI_20240716_094329"), ForceSubtitleLanguage = n"foreign");
                    DC(int64(0x4517bf9906b9c900), EConversationDebugInfo::Done);
                    DC(int64(0x4517bf9906b9c901), EConversationDebugInfo::Executing);
                    
                    // Dammit ... I have no idea what he's saying.
                    Hero.AI.Say(LocText("TEXT_WIP_XGKWYUI_20240716_094355"));
                    DC(int64(0x4517bf9906b9c901), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_muk_99976_exit_2");
                }
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */