#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OC_VLK_HUNO_538 : UConversationCharacterSettings
        {
            default ForCharacter = n"OC_VLK_HUNO_538";
        }
        
        
        class UTopic_Hero__OC_VLK_HUNO_538 : UG1RDialogTopic
        {
            default ForCharacter = n"OC_VLK_HUNO_538";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetHuno() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetGomez() const property
            {
                return GetCharacter(n"OC_EBR_GOMEZ_100");
            }
        }
        
        
        class UChoiceHuno108256 : UTopic_Hero__OC_VLK_HUNO_538
        {
            default DebugId = int64(0xc37373dfc26f0f9b);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.RangeType = EConversationForceRangeType::FarRange;
            default bSayHeyYou = true;
            default ForceSettings.ApproachBy = EConversationForceWalk::LetOtherWalk;
            
            default Rules.HideIfKnows(UChoiceHuno108256);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xc37373dfc26f0fb2), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Crafting_Blacksmith_Trained));
                    DB(int64(0x7df080107e502b5f), G1R.Huno_WaitAfterTraining.IsValid() && G1R.Huno_WaitAfterTraining.IsAtLeastXDaysAgo(1));
                }
                
                if (Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Crafting_Blacksmith_Trained))
                    return false;
                
                if (G1R.Huno_WaitAfterTraining.IsValid() && !G1R.Huno_WaitAfterTraining.IsAtLeastXDaysAgo(1))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc37373dfc26f0f97), EConversationDebugInfo::Executing);
                // Oy. Got a second?
                Huno.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_154514_41"));
                DC(int64(0xc37373dfc26f0f97), EConversationDebugInfo::Done);
                DC(int64(0x7df080107e502b9b), EConversationDebugInfo::Executing);
                
                // What is it? 
                Hero.AI.Say(LocText("TEXT_WIP_LIYYDND_20241122_142246"));
                DC(int64(0x7df080107e502b9b), EConversationDebugInfo::Done);
                DC(int64(0x7df080107e502b9c), EConversationDebugInfo::Executing);
                
                // Well, don't let it get to your head, but you ain't half ...
                Huno.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_154518"));
                DC(int64(0x7df080107e502b9c), EConversationDebugInfo::Done);
                DC(int64(0x7df080107e502b9d), EConversationDebugInfo::Executing);
                // I got an offer to make you, if you're interested. It'll ...
                Huno.AI.Say(LocText("TEXT_WIP_LIYYDND_20241122_144558"));
                DC(int64(0x7df080107e502b9d), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Huno_108263,
                    UTopic_Huno_108283
                );
            }
        }
        
        
        class UTopic_Huno_108263 : UTopic_Hero__OC_VLK_HUNO_538
        {
            default DebugId = int64(0xc37373dfc26f0fa0);
            default Caption = LocText("TEXT_WIP_QNGRNMJ_20241119_154529_2238");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Huno_108263);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc37373dfc26f0fa1), EConversationDebugInfo::Executing);
                // Tell me. 
                Hero.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_154529_2238"));
                DC(int64(0xc37373dfc26f0fa1), EConversationDebugInfo::Done);
                DC(int64(0xc37373dfc26f0fcf), EConversationDebugInfo::Executing);
                
                // So, I got this blueprint for a weapon - Lurker's Bite, ...
                Huno.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_154732"));
                DC(int64(0xc37373dfc26f0fcf), EConversationDebugInfo::Done);
                DC(int64(0xc37373dfc26f0fd0), EConversationDebugInfo::Executing);
                // I could show you how to make it - if you give me a hand ...
                Huno.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_154733"));
                DC(int64(0xc37373dfc26f0fd0), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Huno_108283 : UTopic_Hero__OC_VLK_HUNO_538
        {
            default DebugId = int64(0xc37373dfc26f0fa4);
            default Caption = LocText("TEXT_WIP_QNGRNMJ_20241119_154529_2785");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Huno_108283);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc37373dfc26f0fa5), EConversationDebugInfo::Executing);
                
                // Not right now.
                Hero.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_154529_2785"));
                DC(int64(0xc37373dfc26f0fa5), EConversationDebugInfo::Done);
                DC(int64(0xc37373dfc26f0fd1), EConversationDebugInfo::Executing);
                
                // Huh - well, suit yourself. 
                Huno.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_154748"));
                DC(int64(0xc37373dfc26f0fd1), EConversationDebugInfo::Done);
                DC(int64(0xc37373dfc26f0fd2), EConversationDebugInfo::Executing);
                // You know where to find me if you change your mind.
                Huno.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_154753"));
                DC(int64(0xc37373dfc26f0fd2), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceHuno108322 : UTopic_Hero__OC_VLK_HUNO_538
        {
            default DebugId = int64(0xc37373dfc26f0fbb);
            default Caption = LocText("TEXT_WIP_QNGRNMJ_20241119_154544");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Huno_108283);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_QNGRNMJ_20241119_154748"), int64(0xc37373dfc26f0fbb));
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_QNGRNMJ_20241119_154732"), int64(0xc37373dfc26f0fbb));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc37373dfc26f0fb6), EConversationDebugInfo::Executing);
                
                // About that offer ... 
                Hero.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_154544"));
                DC(int64(0xc37373dfc26f0fb6), EConversationDebugInfo::Done);
                DC(int64(0xc37373dfc26f0fb7), EConversationDebugInfo::Executing);
                
                // Still stands, if you're interested. 
                Huno.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_154544_3436"));
                DC(int64(0xc37373dfc26f0fb7), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Huno_108325,
                    UTopic_Huno_108345
                );
            }
        }
        
        
        class UTopic_Huno_108325 : UTopic_Hero__OC_VLK_HUNO_538
        {
            default DebugId = int64(0xc37373dfc26f0fbe);
            default Caption = LocText("TEXT_WIP_QNGRNMJ_20241119_154529_2238");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Huno_108325);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc37373dfc26f0fbf), EConversationDebugInfo::Executing);
                // Tell me. 
                Hero.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_154529_2238"));
                DC(int64(0xc37373dfc26f0fbf), EConversationDebugInfo::Done);
                DC(int64(0xc37373dfc26f0fd3), EConversationDebugInfo::Executing);
                
                // So, I got this blueprint for a weapon - Lurker's Bite, ...
                Huno.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_154732"));
                DC(int64(0xc37373dfc26f0fd3), EConversationDebugInfo::Done);
                DC(int64(0xc37373dfc26f0fd4), EConversationDebugInfo::Executing);
                // I could show you how to make it - if you give me a hand ...
                Huno.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_154733"));
                DC(int64(0xc37373dfc26f0fd4), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Huno_108345 : UTopic_Hero__OC_VLK_HUNO_538
        {
            default DebugId = int64(0xc37373dfc26f0fc2);
            default Caption = LocText("TEXT_WIP_QNGRNMJ_20241119_154529_2785");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Huno_108345);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc37373dfc26f0fc3), EConversationDebugInfo::Executing);
                
                // Not right now.
                Hero.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_154529_2785"));
                DC(int64(0xc37373dfc26f0fc3), EConversationDebugInfo::Done);
                DC(int64(0xc37373dfc26f0fd5), EConversationDebugInfo::Executing);
                
                // You know where to find me if you change your mind.
                Huno.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_154753"));
                DC(int64(0xc37373dfc26f0fd5), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceHuno108625 : UTopic_Hero__OC_VLK_HUNO_538
        {
            default DebugId = int64(0xc37373dfc26f0fee);
            default Caption = FText::FromString("[Followup Topic]");;
            default bIsFollowupTopic = true;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Huno_108263);
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Huno_108325);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc37373dfc26f0fe9), EConversationDebugInfo::Executing);
                
                // What do you need?
                Hero.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_155607"));
                DC(int64(0xc37373dfc26f0fe9), EConversationDebugInfo::Done);
                DC(int64(0xc37373dfc26f0fea), EConversationDebugInfo::Executing);
                
                // Okay, so, Fisk's recently put in an order for a batch of ...
                Huno.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_155607_1609"));
                DC(int64(0xc37373dfc26f0fea), EConversationDebugInfo::Done);
                DC(int64(0xd2b8c19a3e229371), EConversationDebugInfo::Executing);
                // Thing is, I'm behind on orders, so I got no time for ...
                Huno.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_162330"));
                DC(int64(0xd2b8c19a3e229371), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Huno_108584,
                    UTopic_Huno_108426,
                    UTopic_Huno_108446,
                    UTopic_Huno_108554,
                    UTopic_Huno_108688,
                    UTopic_Huno_108729
                );
            }
        }
        
        
        class UTopic_Huno_108584 : UTopic_Hero__OC_VLK_HUNO_538
        {
            default DebugId = int64(0xd2b8c19a3e229394);
            default Caption = LocText("TEXT_WIP_QNGRNMJ_20241119_162935_2785");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Huno_108584);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd2b8c19a3e229395), EConversationDebugInfo::Executing);
                // Tell me about this "Lurker's Bite."
                Hero.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_162935_2785"));
                DC(int64(0xd2b8c19a3e229395), EConversationDebugInfo::Done);
                DC(int64(0xd2b8c19a3e22939c), EConversationDebugInfo::Executing);
                
                // The name sticks, don't it? It's a fast piece o' steel, ...
                Huno.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_162952"));
                DC(int64(0xd2b8c19a3e22939c), EConversationDebugInfo::Done);
                DC(int64(0xd2b8c19a3e229397), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xd2b8c19a3e229397), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Huno_108426 : UTopic_Hero__OC_VLK_HUNO_538
        {
            default DebugId = int64(0xd2b8c19a3e22937a);
            default Caption = LocText("TEXT_WIP_QNGRNMJ_20241119_162405_41");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Huno_108426);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd2b8c19a3e22937b), EConversationDebugInfo::Executing);
                // Sickles? That sounds like something the farmers from the ...
                Hero.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_162405_41"));
                DC(int64(0xd2b8c19a3e22937b), EConversationDebugInfo::Done);
                DC(int64(0xd2b8c19a3e229385), EConversationDebugInfo::Executing);
                
                // I hope this ain't you sayin' Fisk cuts deals with the ...
                Huno.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_162421"));
                DC(int64(0xd2b8c19a3e229385), EConversationDebugInfo::Done);
                DC(int64(0xd2b8c19a3e229386), EConversationDebugInfo::Executing);
                // Look, mate, you want that weapon or not? 
                Huno.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_162422"));
                DC(int64(0xd2b8c19a3e229386), EConversationDebugInfo::Done);
                DC(int64(0xd2b8c19a3e22937d), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xd2b8c19a3e22937d), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Huno_108446 : UTopic_Hero__OC_VLK_HUNO_538
        {
            default DebugId = int64(0xd2b8c19a3e22937e);
            default Caption = LocText("TEXT_WIP_QNGRNMJ_20241119_162405_2238");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Huno_108446);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd2b8c19a3e22937f), EConversationDebugInfo::Executing);
                // What's Fisks role in this? 
                Hero.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_162405_2238"));
                DC(int64(0xd2b8c19a3e22937f), EConversationDebugInfo::Done);
                DC(int64(0xd2b8c19a3e22939d), EConversationDebugInfo::Executing);
                
                // He knows people. And he knows how to get 'em what they ...
                Huno.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_163054"));
                DC(int64(0xd2b8c19a3e22939d), EConversationDebugInfo::Done);
                DC(int64(0xd2b8c19a3e229381), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xd2b8c19a3e229381), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Huno_108554 : UTopic_Hero__OC_VLK_HUNO_538
        {
            default DebugId = int64(0xd2b8c19a3e22938b);
            default Caption = LocText("TEXT_WIP_QNGRNMJ_20241119_162659_1924");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Huno_108554);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x9693d45864e5fbcb), Hero != nullptr && Hero.HasSaid(LocText("TEXT_WIP_QNGRNMJ_20241119_162405_2238")));
                }
                
                return Hero != nullptr && Hero.HasSaid(LocText("TEXT_WIP_QNGRNMJ_20241119_162405_2238"));
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd2b8c19a3e22938c), EConversationDebugInfo::Executing);
                // Hmm, sounds risky.
                Hero.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_162659_1924"));
                DC(int64(0xd2b8c19a3e22938c), EConversationDebugInfo::Done);
                DC(int64(0xd2b8c19a3e229392), EConversationDebugInfo::Executing);
                
                // Well, welcome to the colony, mate.
                Huno.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_162747"));
                DC(int64(0xd2b8c19a3e229392), EConversationDebugInfo::Done);
                DC(int64(0xd2b8c19a3e229393), EConversationDebugInfo::Executing);
                // But believe me, that sword is gonna be worth it. 
                Huno.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_162758"));
                DC(int64(0xd2b8c19a3e229393), EConversationDebugInfo::Done);
                DC(int64(0xd2b8c19a3e22938e), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xd2b8c19a3e22938e), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Huno_108688 : UTopic_Hero__OC_VLK_HUNO_538
        {
            default DebugId = int64(0xd2b8c19a3e22939e);
            default Caption = LocText("TEXT_WIP_QNGRNMJ_20241119_163303_3436");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Huno_108688);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd2b8c19a3e22939f), EConversationDebugInfo::Executing);
                // All right, I'll handle it. How many sickles do you need?
                Hero.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_163303_3436"));
                DC(int64(0xd2b8c19a3e22939f), EConversationDebugInfo::Done);
                DC(int64(0xd2b8c19a3e2293b0), EConversationDebugInfo::Executing);
                
                // Five. You can use me forge if you want. Get them to ...
                Huno.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_164450"));
                DC(int64(0xd2b8c19a3e2293b0), EConversationDebugInfo::Done);
                DC(int64(0xd2b8c19a3e2293b1), EConversationDebugInfo::Executing);
                // Here, some iron and wood. Should be enough to finish the ...
                Huno.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_164555"));
                DC(int64(0xd2b8c19a3e2293b1), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_LURKERBITE, Document::UDocumentSegment_CH1_LURKERBITE_Entry1);
                DC(int64(0xe87722ef5b6a460d), EConversationDebugInfo::Executing);
                Huno.AddItemToInventory(UItMi_Smith_Iron, 5);
                DC(int64(0xe87722ef5b6a460d), EConversationDebugInfo::Done);
                DC(int64(0xd2b8c19a3e2293e0), EConversationDebugInfo::Executing);
                Huno.AI.GiveItemTo(Hero, UItMi_Smith_Iron, 5);
                DC(int64(0xd2b8c19a3e2293e0), EConversationDebugInfo::Done);
                DC(int64(0x270fa1196f3ea3b9), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_LURKER_BITE.StartQuest();
                DC(int64(0x270fa1196f3ea3b9), EConversationDebugInfo::Done);
                DC(int64(0x9693d45864e5fb59), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_LURKER_BITE_LURKER_BITE_OBJ_CRAFTSCYTHES.StartQuest();
                DC(int64(0x9693d45864e5fb59), EConversationDebugInfo::Done);
                DC(int64(0x1b448840217065b7), EConversationDebugInfo::Executing);
                Hero.AddItemToInventory(UItMi_Smith_Willow, 5);
                DC(int64(0x1b448840217065b7), EConversationDebugInfo::Done);
                DC(int64(0xd2b8c19a3e2293c7), EConversationDebugInfo::Executing);
                // If you waste the material, you'll have to find more ...
                Huno.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_165304_686"));
                DC(int64(0xd2b8c19a3e2293c7), EConversationDebugInfo::Done);
                DC(int64(0xd2b8c19a3e2293cb), EConversationDebugInfo::Executing);
                // And make them nice and sturdy, okay?
                Huno.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_165312"));
                DC(int64(0xd2b8c19a3e2293cb), EConversationDebugInfo::Done);
                DC(int64(0xd2b8c19a3e2293e3), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xd2b8c19a3e2293e3), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Huno_108729 : UTopic_Hero__OC_VLK_HUNO_538
        {
            default DebugId = int64(0xd2b8c19a3e2293a5);
            default Caption = LocText("TEXT_WIP_QNGRNMJ_20241119_163413_3286");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Huno_108729);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd2b8c19a3e2293a6), EConversationDebugInfo::Executing);
                // Mhh, let me give it some thought.
                Hero.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_163413_3286"));
                DC(int64(0xd2b8c19a3e2293a6), EConversationDebugInfo::Done);
                DC(int64(0xd2b8c19a3e2293ac), EConversationDebugInfo::Executing);
                
                // Okay, but be quick about it. I ain't got all day. 
                Huno.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_163448"));
                DC(int64(0xd2b8c19a3e2293ac), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceHuno109075 : UTopic_Hero__OC_VLK_HUNO_538
        {
            default DebugId = int64(0x9c33826e149367ac);
            default Caption = LocText("TEXT_WIP_QNGRNMJ_20241119_174803");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Huno_108688);
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Huno_109213);
            default Rules.HideIfKnows(UChoiceHuno109075);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_QNGRNMJ_20241119_174454"), int64(0x9c33826e149367ac));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9c33826e149367a7), EConversationDebugInfo::Executing);
                
                // I gave Fisk those sickles. 
                Hero.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_174803"));
                DC(int64(0x9c33826e149367a7), EConversationDebugInfo::Done);
                DC(int64(0x9c33826e149367a8), EConversationDebugInfo::Executing);
                
                // Good. What did he say? 
                Huno.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_174803_3569"));
                DC(int64(0x9c33826e149367a8), EConversationDebugInfo::Done);
                DC(int64(0x9c33826e149367b2), EConversationDebugInfo::Executing);
                
                // He said you'll get your pay once his contact "comes ...
                Hero.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_175156"));
                DC(int64(0x9c33826e149367b2), EConversationDebugInfo::Done);
                DC(int64(0x9c33826e149367b3), EConversationDebugInfo::Executing);
                
                // I've heard that one before. Last time I had to chase him ...
                Huno.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_175233"));
                DC(int64(0x9c33826e149367b3), EConversationDebugInfo::Done);
                DC(int64(0x9c33826e149367b5), EConversationDebugInfo::Executing);
                // Anyway, time for my end of the bargain. I'll teach you ...
                Huno.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_175256_443"));
                DC(int64(0x9c33826e149367b5), EConversationDebugInfo::Done);
                DC(int64(0x9c33826e149367b9), EConversationDebugInfo::Executing);
                // First, head to the forge and make a short blade - just ...
                Huno.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_175323"));
                DC(int64(0x9c33826e149367b9), EConversationDebugInfo::Done);
                DC(int64(0x9c33826e149367ba), EConversationDebugInfo::Executing);
                // Once you got the blade, take it over to the workbench. ...
                Huno.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_175329"));
                DC(int64(0x9c33826e149367ba), EConversationDebugInfo::Done);
                DC(int64(0x9c33826e149367bb), EConversationDebugInfo::Executing);
                // You're gonna need oak wood for the handle, another bit ...
                Huno.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_175355"));
                DC(int64(0x9c33826e149367bb), EConversationDebugInfo::Done);
                DC(int64(0x9c33826e149367bc), EConversationDebugInfo::Executing);
                // Then you sharpen the edge until it sings.
                Huno.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_175402"));
                DC(int64(0x9c33826e149367bc), EConversationDebugInfo::Done);
                DC(int64(0x9c33826e149367be), EConversationDebugInfo::Executing);
                // Remember - it's all about balance. Make one end too ...
                Huno.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_175429"));
                DC(int64(0x9c33826e149367be), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_LURKERBITE, Document::UDocumentSegment_CH1_LURKERBITE_Entry4);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_VLK_HUNO, Document::UDocumentSegment_Glossary_OC_VLK_HUNO_GoodTeacher);
                DC(int64(0xe87722ef5b6a460d), EConversationDebugInfo::Executing);
                Huno.AddItemToInventory(UItMi_Smith_Oak, 1);
                DC(int64(0xe87722ef5b6a460d), EConversationDebugInfo::Done);
                DC(int64(0x270fa1196f3ea3c5), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_LURKER_BITE_LURKER_BITE_OBJ_RETURN.SucceedQuest();
                DC(int64(0x270fa1196f3ea3c5), EConversationDebugInfo::Done);
                DC(int64(0x9733703e83584173), EConversationDebugInfo::Executing);
                Hero.LearnRecipe(UReMw_1H_Sword_Short_03);
                DC(int64(0x9733703e83584173), EConversationDebugInfo::Done);
                DC(int64(0x9733703e83584175), EConversationDebugInfo::Executing);
                Hero.LearnRecipe(UReMi_Smith_1H_Sword_Short_03);
                DC(int64(0x9733703e83584175), EConversationDebugInfo::Done);
                DC(int64(0x406e35c0c007bb24), EConversationDebugInfo::Executing);
                Huno.AI.GiveItemTo(Hero, UItMi_Smith_Oak, 1);
                DC(int64(0x406e35c0c007bb24), EConversationDebugInfo::Done);
                DC(int64(0x98679385be7980e9), EConversationDebugInfo::Executing);
                Hero.AddItemToInventory(UItMi_Smith_Leatherstraps, 1);
                DC(int64(0x98679385be7980e9), EConversationDebugInfo::Done);
                DC(int64(0x98679385be7980eb), EConversationDebugInfo::Executing);
                Hero.AddItemToInventory(UItMi_Smith_Iron, 1);
                DC(int64(0x98679385be7980eb), EConversationDebugInfo::Done);
                DC(int64(0x9c33826e149367d0), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x9c33826e149367d0), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceHuno109146 : UTopic_Hero__OC_VLK_HUNO_538
        {
            default DebugId = int64(0xd2b8c19a3e2293ec);
            default Caption = LocText("TEXT_WIP_QNGRNMJ_20241119_170103");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Huno_108729);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_QNGRNMJ_20241119_163448"), int64(0xd2b8c19a3e2293ec));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x270fa1196f3ea3bc), Quest::OldCamp_OCCHAPTER1_LURKER_BITE != nullptr && !Quest::OldCamp_OCCHAPTER1_LURKER_BITE.IsRunning());
                }
                
                return Quest::OldCamp_OCCHAPTER1_LURKER_BITE != nullptr && !Quest::OldCamp_OCCHAPTER1_LURKER_BITE.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd2b8c19a3e2293e7), EConversationDebugInfo::Executing);
                // About those sickles ... 
                Hero.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_170103"));
                DC(int64(0xd2b8c19a3e2293e7), EConversationDebugInfo::Done);
                DC(int64(0xd2b8c19a3e2293e8), EConversationDebugInfo::Executing);
                
                // Yeah? 
                Huno.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_170103_2386"));
                DC(int64(0xd2b8c19a3e2293e8), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Huno_109213,
                    UTopic_Huno_109233
                );
            }
        }
        
        
        class UTopic_Huno_109213 : UTopic_Hero__OC_VLK_HUNO_538
        {
            default DebugId = int64(0xd2b8c19a3e2293ef);
            default Caption = LocText("TEXT_WIP_QNGRNMJ_20241119_163303_3436");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Huno_109213);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd2b8c19a3e2293f0), EConversationDebugInfo::Executing);
                // All right, I'll handle it. How many sickles do you need?
                Hero.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_163303_3436"));
                DC(int64(0xd2b8c19a3e2293f0), EConversationDebugInfo::Done);
                DC(int64(0xd2b8c19a3e2293fa), EConversationDebugInfo::Executing);
                
                // Five. You can use me forge if you want. Get them to ...
                Huno.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_164450"));
                DC(int64(0xd2b8c19a3e2293fa), EConversationDebugInfo::Done);
                DC(int64(0xd2b8c19a3e2293fb), EConversationDebugInfo::Executing);
                // Here, some iron and wood. Should be enough to finish the ...
                Huno.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_164555"));
                DC(int64(0xd2b8c19a3e2293fb), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_LURKERBITE, Document::UDocumentSegment_CH1_LURKERBITE_Entry1);
                DC(int64(0xe87722ef5b6a460d), EConversationDebugInfo::Executing);
                Huno.AddItemToInventory(UItMi_Smith_Iron, 5);
                DC(int64(0xe87722ef5b6a460d), EConversationDebugInfo::Done);
                DC(int64(0xd2b8c19a3e2293cd), EConversationDebugInfo::Executing);
                Hero.AddItemToInventory(UItMi_Smith_Willow, 5);
                DC(int64(0xd2b8c19a3e2293cd), EConversationDebugInfo::Done);
                DC(int64(0xd2b8c19a3e2293e0), EConversationDebugInfo::Executing);
                Huno.AI.GiveItemTo(Hero, UItMi_Smith_Iron, 5);
                DC(int64(0xd2b8c19a3e2293e0), EConversationDebugInfo::Done);
                DC(int64(0x270fa1196f3ea3bb), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_LURKER_BITE.StartQuest();
                DC(int64(0x270fa1196f3ea3bb), EConversationDebugInfo::Done);
                DC(int64(0x9693d45864e5fb5b), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_LURKER_BITE_LURKER_BITE_OBJ_CRAFTSCYTHES.StartQuest();
                DC(int64(0x9693d45864e5fb5b), EConversationDebugInfo::Done);
                DC(int64(0xd2b8c19a3e2293c7), EConversationDebugInfo::Executing);
                // If you waste the material, you'll have to find more ...
                Huno.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_165304_686"));
                DC(int64(0xd2b8c19a3e2293c7), EConversationDebugInfo::Done);
                DC(int64(0xd2b8c19a3e2293cb), EConversationDebugInfo::Executing);
                // And make them nice and sturdy, okay?
                Huno.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_165312"));
                DC(int64(0xd2b8c19a3e2293cb), EConversationDebugInfo::Done);
                DC(int64(0xd2b8c19a3e2293e3), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xd2b8c19a3e2293e3), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Huno_109233 : UTopic_Hero__OC_VLK_HUNO_538
        {
            default DebugId = int64(0xd2b8c19a3e2293f3);
            default Caption = LocText("TEXT_WIP_QNGRNMJ_20241119_154529_2785");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Huno_109233);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd2b8c19a3e2293f4), EConversationDebugInfo::Executing);
                // Not right now.
                Hero.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_154529_2785"));
                DC(int64(0xd2b8c19a3e2293f4), EConversationDebugInfo::Done);
                DC(int64(0xd2b8c19a3e2293fc), EConversationDebugInfo::Executing);
                
                // Okay, but be quick about it. I ain't got all day. 
                Huno.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_163448"));
                DC(int64(0xd2b8c19a3e2293fc), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceHuno119235 : UTopic_Hero__OC_VLK_HUNO_538
        {
            default DebugId = int64(0xa7deef969d1cb4d5);
            default Caption = LocText("TEXT_WIP_GILDIL_20241216_121504_2219");
            default PriorityRank = 3;
            default PropertyTags.AddTag(GameplayTag::Skill_Crafting_Blacksmith_Trained);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf11f5810a9502196), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Crafting_Blacksmith_Trained));
                    DB(int64(0x7635b90f6fabbbd4), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Crafting_Blacksmith_Master));
                }
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Crafting_Blacksmith_Trained))
                    return false;
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Crafting_Blacksmith_Master))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa7deef969d1cb4d3), EConversationDebugInfo::Executing);
                
                // I want to learn how to smith.
                Hero.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_150930"));
                DC(int64(0xa7deef969d1cb4d3), EConversationDebugInfo::Done);
                DC(int64(0xa7deef969d1cb4d4), EConversationDebugInfo::Executing);
                
                // Yeah? Smithin' ain't just hammerin' iron til it looks ...
                Huno.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_150930_94"));
                DC(int64(0xa7deef969d1cb4d4), EConversationDebugInfo::Done);
                DC(int64(0xa7deef969d1cb4d7), EConversationDebugInfo::Executing);
                // But let's see if you got what it takes ...
                Huno.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_151153"));
                DC(int64(0xa7deef969d1cb4d7), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_VLK_HUNO, Document::UDocumentSegment_Glossary_OC_VLK_HUNO_Teacher);
                DB(int64(0xa7deef969d1cb4e0), Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Crafting_Blacksmith_Trained));
                
                if (Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Crafting_Blacksmith_Trained))
                {
                    DB(int64(0xd3b370af852689b0), Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Crafting_Blacksmith_Trained));
                    
                    if (Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Crafting_Blacksmith_Trained))
                    {
                        DC(int64(0xa7deef969d1cb4e3), EConversationDebugInfo::Executing);
                        // Now, before you even start, you gotta know what sort of ...
                        Huno.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_151540"));
                        DC(int64(0xa7deef969d1cb4e3), EConversationDebugInfo::Done);
                        DC(int64(0xa7deef969d1cb4ee), EConversationDebugInfo::Executing);
                        // You want to forge somethin' from scratch, so you first ...
                        Huno.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_151810"));
                        DC(int64(0xa7deef969d1cb4ee), EConversationDebugInfo::Done);
                        DC(int64(0xa7deef969d1cb4ef), EConversationDebugInfo::Executing);
                        // Then you get it into shape on the anvil - and when it's ...
                        Huno.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_151856"));
                        DC(int64(0xa7deef969d1cb4ef), EConversationDebugInfo::Done);
                        DC(int64(0xa7deef969d1cb4f0), EConversationDebugInfo::Executing);
                        // The hilt and the finer bits you can fix up at the ...
                        Huno.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_151957"));
                        DC(int64(0xa7deef969d1cb4f0), EConversationDebugInfo::Done);
                        DC(int64(0xa7deef969d1cb4f2), EConversationDebugInfo::Executing);
                        // And if you got a blade, it's important you sharpen it ...
                        Huno.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_152111"));
                        DC(int64(0xa7deef969d1cb4f2), EConversationDebugInfo::Done);
                        DC(int64(0xf833fa7803504c47), EConversationDebugInfo::Executing);
                        Hero.LearnSkill(UGE_Skill_Crafting_Blacksmith_Trained);
                        DC(int64(0xf833fa7803504c47), EConversationDebugInfo::Done);
                        DC(int64(0xd6adfdff796ea153), EConversationDebugInfo::Executing);
                        Hero.LearnRecipe(UReMi_Smith_Blade_Short);
                        DC(int64(0xd6adfdff796ea153), EConversationDebugInfo::Done);
                        DC(int64(0xd6adfdff796ea155), EConversationDebugInfo::Executing);
                        Hero.LearnRecipe(UReMi_Smith_Head_Scythe);
                        DC(int64(0xd6adfdff796ea155), EConversationDebugInfo::Done);
                        DC(int64(0xd6adfdff796ea157), EConversationDebugInfo::Executing);
                        Hero.LearnRecipe(UReMi_Smith_Head_Hammer);
                        DC(int64(0xd6adfdff796ea157), EConversationDebugInfo::Done);
                        DC(int64(0xd6adfdff796ea159), EConversationDebugInfo::Executing);
                        Hero.LearnRecipe(UReMi_Smith_Blade_Sickle);
                        DC(int64(0xd6adfdff796ea159), EConversationDebugInfo::Done);
                        DC(int64(0xd6adfdff796ea15b), EConversationDebugInfo::Executing);
                        Hero.LearnRecipe(UReMi_Smith_1H_Sword_Short_01);
                        DC(int64(0xd6adfdff796ea15b), EConversationDebugInfo::Done);
                        DC(int64(0xd6adfdff796ea15d), EConversationDebugInfo::Executing);
                        Hero.LearnRecipe(UReMw_1H_Sword_Short_01);
                        DC(int64(0xd6adfdff796ea15d), EConversationDebugInfo::Done);
                        DC(int64(0xd6adfdff796ea15f), EConversationDebugInfo::Executing);
                        Hero.LearnRecipe(UReMi_Smith_1H_Sword_Scythe_01);
                        DC(int64(0xd6adfdff796ea15f), EConversationDebugInfo::Done);
                        DC(int64(0xd6adfdff796ea161), EConversationDebugInfo::Executing);
                        Hero.LearnRecipe(UReMw_1H_Sword_Scythe_01);
                        DC(int64(0xd6adfdff796ea161), EConversationDebugInfo::Done);
                        DC(int64(0xd6adfdff796ea163), EConversationDebugInfo::Executing);
                        Hero.LearnRecipe(UReMi_Smith_1H_Mace_Sledgehammer_01);
                        DC(int64(0xd6adfdff796ea163), EConversationDebugInfo::Done);
                        DC(int64(0xd6adfdff796ea165), EConversationDebugInfo::Executing);
                        Hero.LearnRecipe(UReMw_1H_Mace_Sledgehammer_01);
                        DC(int64(0xd6adfdff796ea165), EConversationDebugInfo::Done);
                        DC(int64(0xd6adfdff796ea167), EConversationDebugInfo::Executing);
                        Hero.LearnRecipe(UReMi_Smith_1H_Axe_Sickle_01);
                        DC(int64(0xd6adfdff796ea167), EConversationDebugInfo::Done);
                        DC(int64(0xd6adfdff796ea169), EConversationDebugInfo::Executing);
                        Hero.LearnRecipe(UReMw_1H_Axe_Sickle_01);
                        DC(int64(0xd6adfdff796ea169), EConversationDebugInfo::Done);
                        DC(int64(0x7df080107e502b5e), EConversationDebugInfo::Executing);
                        G1R.Huno_WaitAfterTraining = FInGameTime::Now();
                        DC(int64(0x7df080107e502b5e), EConversationDebugInfo::Done);
                        
                        Other.Remember(n"choice_huno_119235_exit_1");
                        DC(int64(0xf11f5810a9502045), EConversationDebugInfo::Executing);
                        EndConversation();
                        DC(int64(0xf11f5810a9502045), EConversationDebugInfo::Done);
                        return;
                    }
                    else
                    {
                        DC(int64(0xa7deef969d1cb4e1), EConversationDebugInfo::Executing);
                        // I can teach you a thing or two - but not for free.
                        Huno.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_151538"));
                        DC(int64(0xa7deef969d1cb4e1), EConversationDebugInfo::Done);
                        
                        Other.Remember(n"choice_huno_119235_exit_2");
                    }
                }
                else
                {
                    DC(int64(0xa7deef969d1cb4ed), EConversationDebugInfo::Executing);
                    // Hm. You ain't quite there yet.
                    Huno.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_151626"));
                    DC(int64(0xa7deef969d1cb4ed), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_huno_119235_exit_3");
                }
            }
        }
        
        
        class UChoiceHuno120923 : UTopic_Hero__OC_VLK_HUNO_538
        {
            default DebugId = int64(0xfe5526e157d4df66);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceHuno120923);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xb75d79e3d48f89a), G1R != nullptr && G1R.IsInChapter(5));
                    DB(int64(0xf10a76655659e3bf), G1R.KnowStone != 0);
                }
                
                if (G1R != nullptr && !G1R.IsInChapter(5))
                    return false;
                
                if (G1R.KnowStone == 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xfe5526e157d4df62), EConversationDebugInfo::Executing);
                // Oy! You heard what they did to Stone?
                Huno.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_111452_41"));
                DC(int64(0xfe5526e157d4df62), EConversationDebugInfo::Done);
                DC(int64(0xfe5526e157d4df68), EConversationDebugInfo::Executing);
                
                // What?
                Hero.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_111526"));
                DC(int64(0xfe5526e157d4df68), EConversationDebugInfo::Done);
                DC(int64(0xfe5526e157d4df69), EConversationDebugInfo::Executing);
                
                // Bastards dragged him to Gomez's dungeons. Callin' it ...
                Huno.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_111527"));
                DC(int64(0xfe5526e157d4df69), EConversationDebugInfo::Done);
                DC(int64(0xfe5526e157d4df6a), EConversationDebugInfo::Executing);
                // Total bollocks, if you ask me.
                Huno.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_111528"));
                DC(int64(0xfe5526e157d4df6a), EConversationDebugInfo::Done);
                DB(int64(0xfe5526e157d4df75), G1R.ForgedRivalries2_StoneMarkedCraft != 0);
                DB(int64(0xfe5526e157d4df6c), G1R.ForgedRivalries2_DarrionMarkedCraft != 0);
                
                if ((G1R.ForgedRivalries2_StoneMarkedCraft != 0) || (G1R.ForgedRivalries2_DarrionMarkedCraft != 0))
                {
                    DC(int64(0xfe5526e157d4df7a), EConversationDebugInfo::Executing);
                    // Though that business with Gomez's war hammer doesn't ...
                    Huno.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_111640_2238"));
                    DC(int64(0xfe5526e157d4df7a), EConversationDebugInfo::Done);
                }
                Subdialog(
                    UTopic_Huno_120969,
                    UTopic_Huno_120989,
                    UTopic_Huno_121136,
                    UTopic_Huno_121160
                );
            }
        }
        
        
        class UTopic_Huno_120969 : UTopic_Hero__OC_VLK_HUNO_538
        {
            default DebugId = int64(0xfe5526e157d4df7f);
            default Caption = LocText("TEXT_WIP_TRYREI_20241211_111701_1924");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Huno_120969);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xfe5526e157d4df80), EConversationDebugInfo::Executing);
                // What happened?
                Hero.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_111701_1924"));
                DC(int64(0xfe5526e157d4df80), EConversationDebugInfo::Done);
                DC(int64(0xfe5526e157d4df8d), EConversationDebugInfo::Executing);
                
                // Ever since the Fire Mages are dead, Gomez's been seein' ...
                Huno.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_111712"));
                DC(int64(0xfe5526e157d4df8d), EConversationDebugInfo::Done);
                DB(int64(0xfe5526e157d4df92), Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1 != nullptr && Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1.HasBeenStarted());
                
                if (Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1 != nullptr && Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1.HasBeenStarted())
                {
                    DC(int64(0xfe5526e157d4df9b), EConversationDebugInfo::Executing);
                    // Also, Stone's been... different lately. Sneaking around, ...
                    Huno.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_111859_3286"));
                    DC(int64(0xfe5526e157d4df9b), EConversationDebugInfo::Done);
                }
                DC(int64(0xfe5526e157d4dfa0), EConversationDebugInfo::Executing);
                // Lucky they didn't string him up from the castle walls.
                Huno.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_111916_686"));
                DC(int64(0xfe5526e157d4dfa0), EConversationDebugInfo::Done);
                DC(int64(0xfe5526e157d4dfa7), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xfe5526e157d4dfa7), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Huno_120989 : UTopic_Hero__OC_VLK_HUNO_538
        {
            default DebugId = int64(0xfe5526e157d4df83);
            default Caption = LocText("TEXT_WIP_TRYREI_20241211_111701_3436");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Huno_120989);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xfe5526e157d4df84), EConversationDebugInfo::Executing);
                // Where are they keeping him?
                Hero.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_111701_3436"));
                DC(int64(0xfe5526e157d4df84), EConversationDebugInfo::Done);
                DC(int64(0xfe5526e157d4dfab), EConversationDebugInfo::Executing);
                
                // Castle dungeons, lowest level. Look, Stone's a right ...
                Huno.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_112214"));
                DC(int64(0xfe5526e157d4dfab), EConversationDebugInfo::Done);
                DC(int64(0xfe5526e157d4dfac), EConversationDebugInfo::Executing);
                // So if someone were helpin' him out ... But you never ...
                Huno.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_112252"));
                DC(int64(0xfe5526e157d4dfac), EConversationDebugInfo::Done);
                DC(int64(0xfe5526e157d4df86), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xfe5526e157d4df86), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Huno_121136 : UTopic_Hero__OC_VLK_HUNO_538
        {
            default DebugId = int64(0xfe5526e157d4dfad);
            default Caption = LocText("TEXT_WIP_TRYREI_20241211_112438_2386");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Huno_121136);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xfe5526e157d4dfae), EConversationDebugInfo::Executing);
                // I'll look into it.
                Hero.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_112438_2386"));
                DC(int64(0xfe5526e157d4dfae), EConversationDebugInfo::Done);
                DC(int64(0xfe5526e157d4dfb4), EConversationDebugInfo::Executing);
                
                // Watch yourself. Warders are ready to take a swing at ...
                Huno.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_112445"));
                DC(int64(0xfe5526e157d4dfb4), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH5_FORGEDRIVALRIES_3, Document::UDocumentSegment_CH5_FORGEDRIVALRIES_3_FindStone);
                DC(int64(0xb75d79e3d48f88d), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3.StartQuest();
                DC(int64(0xb75d79e3d48f88d), EConversationDebugInfo::Done);
                DC(int64(0xb75d79e3d48f892), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_FINDSTONE.StartQuest();
                DC(int64(0xb75d79e3d48f892), EConversationDebugInfo::Done);
                DC(int64(0xb75d79e3d48f893), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xb75d79e3d48f893), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Huno_121160 : UTopic_Hero__OC_VLK_HUNO_538
        {
            default DebugId = int64(0xfe5526e157d4dfb5);
            default Caption = LocText("TEXT_WIP_TRYREI_20241211_112454_3984");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Huno_121160);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xfe5526e157d4dfb6), EConversationDebugInfo::Executing);
                // That's none of my business.
                Hero.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_112454_3984"));
                DC(int64(0xfe5526e157d4dfb6), EConversationDebugInfo::Done);
                DC(int64(0xfe5526e157d4dfbc), EConversationDebugInfo::Executing);
                
                // Yeah, suppose it ain't.
                Huno.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_112500"));
                DC(int64(0xfe5526e157d4dfbc), EConversationDebugInfo::Done);
                DB(int64(0xfe5526e157d4dfc1), G1R.Stone_Teacher != 0);
                
                if (G1R.Stone_Teacher != 0)
                {
                    DC(int64(0xfe5526e157d4dfc6), EConversationDebugInfo::Executing);
                    // Ain't Stone the one who taught you the craft? Funny how ...
                    Huno.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_112522_1609"));
                    DC(int64(0xfe5526e157d4dfc6), EConversationDebugInfo::Done);
                    DC(int64(0xfe5526e157d4dfca), EConversationDebugInfo::Executing);
                    // Well, not like loyalty matters in here anyway.
                    Huno.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_112536"));
                    DC(int64(0xfe5526e157d4dfca), EConversationDebugInfo::Done);
                    DC(int64(0xb75d79e3d48f954), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xb75d79e3d48f954), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0xfe5526e157d4dfcc), EConversationDebugInfo::Executing);
                    // Still ... a smith like Stone knows a lot o' secrets. ...
                    Huno.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_112639_3569"));
                    DC(int64(0xfe5526e157d4dfcc), EConversationDebugInfo::Done);
                    DC(int64(0xfe5526e157d4dfda), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xfe5526e157d4dfda), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
        class UChoiceHuno122758 : UTopic_Hero__OC_VLK_HUNO_538
        {
            default DebugId = int64(0x3d41c45fd116de32);
            default Caption = LocText("TEXT_WIP_QVABRVD_20241212_095731");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceHuno122758);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x3d41c45fd116de36), Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_GETDARRIONKEY != nullptr && !Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_GETDARRIONKEY.HasFailed());
                    DB(int64(0x3d41c45fd116de3a), Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_GETGOMEZKEY != nullptr && !Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_GETGOMEZKEY.HasSucceeded());
                    DB(int64(0x3d41c45fd116de3b), Hero != nullptr && !Hero.HasItem(UItKe_Dungeonkey, 1, 0));
                    DB(int64(0x3d41c45fd116de51), Hero != nullptr && Hero.HasItem(UItMs_StoneSketch, 1, 0));
                }
                
                if (Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_GETDARRIONKEY != nullptr && Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_GETDARRIONKEY.HasFailed())
                    return false;
                
                if (Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_GETGOMEZKEY != nullptr && Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_GETGOMEZKEY.HasSucceeded())
                    return false;
                
                if (Hero != nullptr && Hero.HasItem(UItKe_Dungeonkey, 1, 0))
                    return false;
                
                if (Hero != nullptr && !Hero.HasItem(UItMs_StoneSketch, 1, 0))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3d41c45fd116de2d), EConversationDebugInfo::Executing);
                // Can you craft something for me?
                Hero.AI.Say(LocText("TEXT_WIP_QVABRVD_20241212_095731"));
                DC(int64(0x3d41c45fd116de2d), EConversationDebugInfo::Done);
                DC(int64(0x3d41c45fd116de2e), EConversationDebugInfo::Executing);
                
                // What do you need?
                Huno.AI.Say(LocText("TEXT_WIP_QVABRVD_20241212_095731_41"));
                DC(int64(0x3d41c45fd116de2e), EConversationDebugInfo::Done);
                DC(int64(0x3d41c45fd116de34), EConversationDebugInfo::Executing);
                
                // Take a look at this.
                Hero.AI.Say(LocText("TEXT_WIP_QVABRVD_20241212_095841"));
                DC(int64(0x3d41c45fd116de34), EConversationDebugInfo::Done);
                DC(int64(0x3d41c45fd116de5f), EConversationDebugInfo::Executing);
                Hero.AI.GiveItemTo(Huno, UItMs_StoneSketch, 1);
                DC(int64(0x3d41c45fd116de5f), EConversationDebugInfo::Done);
                DC(int64(0x3d41c45fd116de68), EConversationDebugInfo::Executing);
                // Yeah, let me see ... Hmm, a key. Pretty complex too. ...
                Huno.AI.Say(LocText("TEXT_WIP_QVABRVD_20241212_103047"));
                DC(int64(0x3d41c45fd116de68), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Huno_122792,
                    UTopic_Huno_122812,
                    UTopic_Huno_122871,
                    UTopic_Huno_122898
                );
            }
        }
        
        
        class UTopic_Huno_122792 : UTopic_Hero__OC_VLK_HUNO_538
        {
            default DebugId = int64(0x3d41c45fd116de6a);
            default Caption = LocText("TEXT_WIP_QVABRVD_20241212_103137_1924");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Huno_122792);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3d41c45fd116de6b), EConversationDebugInfo::Executing);
                // Can you make it?
                Hero.AI.Say(LocText("TEXT_WIP_QVABRVD_20241212_103137_1924"));
                DC(int64(0x3d41c45fd116de6b), EConversationDebugInfo::Done);
                DC(int64(0x3d41c45fd116de75), EConversationDebugInfo::Executing);
                
                // With what? I barely got enough stuff for maintainin' the ...
                Huno.AI.Say(LocText("TEXT_WIP_QVABRVD_20241212_103143"));
                DC(int64(0x3d41c45fd116de75), EConversationDebugInfo::Done);
                DC(int64(0x3d41c45fd116de6d), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x3d41c45fd116de6d), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Huno_122812 : UTopic_Hero__OC_VLK_HUNO_538
        {
            default DebugId = int64(0x3d41c45fd116de6e);
            default Caption = LocText("TEXT_WIP_QVABRVD_20241212_103137_3436");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Huno_122812);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3d41c45fd116de6f), EConversationDebugInfo::Executing);
                // It's for Stone's cell.
                Hero.AI.Say(LocText("TEXT_WIP_QVABRVD_20241212_103137_3436"));
                DC(int64(0x3d41c45fd116de6f), EConversationDebugInfo::Done);
                DC(int64(0x3d41c45fd116de76), EConversationDebugInfo::Executing);
                
                // Blimey, so that's what this is about. I'd help you, but ...
                Huno.AI.Say(LocText("TEXT_WIP_QVABRVD_20241212_103228"));
                DC(int64(0x3d41c45fd116de76), EConversationDebugInfo::Done);
                DC(int64(0x3d41c45fd116de71), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x3d41c45fd116de71), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Huno_122871 : UTopic_Hero__OC_VLK_HUNO_538
        {
            default DebugId = int64(0x3d41c45fd116de77);
            default Caption = LocText("TEXT_WIP_QVABRVD_20241212_103300_3286");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Huno_122871);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3d41c45fd116de78), EConversationDebugInfo::Executing);
                // Who could craft it?
                Hero.AI.Say(LocText("TEXT_WIP_QVABRVD_20241212_103300_3286"));
                DC(int64(0x3d41c45fd116de78), EConversationDebugInfo::Done);
                DC(int64(0x3d41c45fd116de7e), EConversationDebugInfo::Executing);
                
                // You need someone who actually knows his stuff. And got ...
                Huno.AI.Say(LocText("TEXT_WIP_QVABRVD_20241212_103306"));
                DC(int64(0x3d41c45fd116de7e), EConversationDebugInfo::Done);
                DC(int64(0x3d41c45fd116de7f), EConversationDebugInfo::Executing);
                // Darrion, the swamp smith - he could be the right bloke ...
                Huno.AI.Say(LocText("TEXT_WIP_QVABRVD_20241212_103314"));
                DC(int64(0x3d41c45fd116de7f), EConversationDebugInfo::Done);
                DC(int64(0x3d41c45fd116de7a), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x3d41c45fd116de7a), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Huno_122898 : UTopic_Hero__OC_VLK_HUNO_538
        {
            default DebugId = int64(0x3d41c45fd116de80);
            default Caption = LocText("TEXT_WIP_QVABRVD_20241212_103340_686");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Huno_122898);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_QVABRVD_20241212_103314"), int64(0x3d41c45fd116de80));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x3d41c45fd116df5f), Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_ASKDARRIONKEY != nullptr && Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_ASKDARRIONKEY.HasFailed());
                }
                
                return Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_ASKDARRIONKEY != nullptr && Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_ASKDARRIONKEY.HasFailed();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3d41c45fd116de81), EConversationDebugInfo::Executing);
                // Darrion said no.
                Hero.AI.Say(LocText("TEXT_WIP_QVABRVD_20241212_103340_686"));
                DC(int64(0x3d41c45fd116de81), EConversationDebugInfo::Done);
                DC(int64(0x3d41c45fd116de8d), EConversationDebugInfo::Executing);
                
                // Then you'll have to get the original. Gomez never parts ...
                Huno.AI.Say(LocText("TEXT_WIP_QVABRVD_20241212_103707"));
                DC(int64(0x3d41c45fd116de8d), EConversationDebugInfo::Done);
                DC(int64(0x3d41c45fd116de83), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x3d41c45fd116de83), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceHuno131171 : UTopic_Hero__OC_VLK_HUNO_538
        {
            default DebugId = int64(0x901d3081e789a7d1);
            default Caption = LocText("TEXT_WIP_XRYREI_20241215_181020");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceHuno131171);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_RRYREI_20241213_155717"), int64(0x901d3081e789a7d1));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x901d3081e789a7cc), EConversationDebugInfo::Executing);
                // Stone wants you to know he's alive.
                Hero.AI.Say(LocText("TEXT_WIP_XRYREI_20241215_181020"));
                DC(int64(0x901d3081e789a7cc), EConversationDebugInfo::Done);
                DC(int64(0x901d3081e789a7cd), EConversationDebugInfo::Executing);
                
                // So the stubborn git actually made it, ha.
                Huno.AI.Say(LocText("TEXT_WIP_XRYREI_20241215_181020_3334"));
                DC(int64(0x901d3081e789a7cd), EConversationDebugInfo::Done);
                DB(int64(0x901d3081e789a7f8), G1R.ForgedRivalries3_StoneKnowsDarrionReject != 0);
                
                if (G1R.ForgedRivalries3_StoneKnowsDarrionReject != 0)
                {
                    DC(int64(0x901d3081e789a80c), EConversationDebugInfo::Executing);
                    // He's drowning his sorrows at the New Camp.
                    Hero.AI.Say(LocText("TEXT_WIP_XRYREI_20241215_181427"));
                    DC(int64(0x901d3081e789a80c), EConversationDebugInfo::Done);
                    DC(int64(0x901d3081e789a80d), EConversationDebugInfo::Executing);
                    
                    // He's hidin' behind the bandits? Well ... better than ...
                    Huno.AI.Say(LocText("TEXT_WIP_XRYREI_20241215_181427_1246"));
                    DC(int64(0x901d3081e789a80d), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x901d3081e789a807), EConversationDebugInfo::Executing);
                    
                    // He's working with Darrion now.
                    Hero.AI.Say(LocText("TEXT_WIP_XRYREI_20241215_181336"));
                    DC(int64(0x901d3081e789a807), EConversationDebugInfo::Done);
                    DC(int64(0x901d3081e789a808), EConversationDebugInfo::Executing);
                    
                    // And he ain't too proud for that? Well ... easier givin' ...
                    Huno.AI.Say(LocText("TEXT_WIP_XRYREI_20241215_181336_1351"));
                    DC(int64(0x901d3081e789a808), EConversationDebugInfo::Done);
                }
                Subdialog(
                    UTopic_Huno_131370,
                    UTopic_Huno_131390,
                    UTopic_Huno_131476
                );
            }
        }
        
        
        class UTopic_Huno_131370 : UTopic_Hero__OC_VLK_HUNO_538
        {
            default DebugId = int64(0x901d3081e789a814);
            default Caption = LocText("TEXT_WIP_XRYREI_20241215_181511_2483");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Huno_131370);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x901d3081e789a815), EConversationDebugInfo::Executing);
                // How has the forge been holding up?
                Hero.AI.Say(LocText("TEXT_WIP_XRYREI_20241215_181511_2483"));
                DC(int64(0x901d3081e789a815), EConversationDebugInfo::Done);
                DC(int64(0x901d3081e789a822), EConversationDebugInfo::Executing);
                
                // Well how's it look? Every warder thinks their rusty old ...
                Huno.AI.Say(LocText("TEXT_WIP_XRYREI_20241215_181534"));
                DC(int64(0x901d3081e789a822), EConversationDebugInfo::Done);
                DB(int64(0x901d3081e789a839), Gomez != nullptr && !Gomez.IsEveryoneOfThisKindDead());
                
                if (Gomez != nullptr && !Gomez.IsEveryoneOfThisKindDead())
                {
                    DC(int64(0x901d3081e789a83e), EConversationDebugInfo::Executing);
                    // Gomez wants me up in the castle forge. "Better ...
                    Huno.AI.Say(LocText("TEXT_WIP_XRYREI_20241215_181815_1091"));
                    DC(int64(0x901d3081e789a83e), EConversationDebugInfo::Done);
                    DC(int64(0x901d3081e789a842), EConversationDebugInfo::Executing);
                    // Meanin', he wants his only smith right where he can keep ...
                    Huno.AI.Say(LocText("TEXT_WIP_XRYREI_20241215_181913"));
                    DC(int64(0x901d3081e789a842), EConversationDebugInfo::Done);
                    DC(int64(0x901d3081e789a848), EConversationDebugInfo::Executing);
                    ReturnToLastSelection(1);
                    DC(int64(0x901d3081e789a848), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x901d3081e789a844), EConversationDebugInfo::Executing);
                    // With Gomez feedin' the worms and the castle in chaos ... ...
                    Huno.AI.Say(LocText("TEXT_WIP_XRYREI_20241215_181926_1723"));
                    DC(int64(0x901d3081e789a844), EConversationDebugInfo::Done);
                    DC(int64(0x901d3081e789a84c), EConversationDebugInfo::Executing);
                    ReturnToLastSelection(1);
                    DC(int64(0x901d3081e789a84c), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UTopic_Huno_131390 : UTopic_Hero__OC_VLK_HUNO_538
        {
            default DebugId = int64(0x901d3081e789a818);
            default Caption = LocText("TEXT_WIP_XRYREI_20241215_181511_1869");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Huno_131390);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x901d3081e789a819), EConversationDebugInfo::Executing);
                // Stone said you'd be working yourself to the bone.
                Hero.AI.Say(LocText("TEXT_WIP_XRYREI_20241215_181511_1869"));
                DC(int64(0x901d3081e789a819), EConversationDebugInfo::Done);
                DC(int64(0x901d3081e789a824), EConversationDebugInfo::Executing);
                
                // But that's just like him. Barely slipped the noose, and ...
                Huno.AI.Say(LocText("TEXT_WIP_XRYREI_20241215_181609"));
                DC(int64(0x901d3081e789a824), EConversationDebugInfo::Done);
                DC(int64(0x901d3081e789a85f), EConversationDebugInfo::Executing);
                // He's got muscles like steel, but a soft heart.
                Huno.AI.Say(LocText("TEXT_WIP_XRYREI_20241215_183129"));
                DC(int64(0x901d3081e789a85f), EConversationDebugInfo::Done);
                DC(int64(0x901d3081e789a81b), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x901d3081e789a81b), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Huno_131476 : UTopic_Hero__OC_VLK_HUNO_538
        {
            default DebugId = int64(0x901d3081e789a825);
            default Caption = LocText("TEXT_WIP_XRYREI_20241215_181627_3528");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Huno_131476);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x901d3081e789a826), EConversationDebugInfo::Executing);
                // I'm just letting you know.
                Hero.AI.Say(LocText("TEXT_WIP_XRYREI_20241215_181627_3528"));
                DC(int64(0x901d3081e789a826), EConversationDebugInfo::Done);
                DC(int64(0x901d3081e789a82c), EConversationDebugInfo::Executing);
                
                // Thanks! I'm glad he made it.
                Huno.AI.Say(LocText("TEXT_WIP_XRYREI_20241215_181630"));
                DC(int64(0x901d3081e789a82c), EConversationDebugInfo::Done);
                DC(int64(0x901d3081e789a82d), EConversationDebugInfo::Executing);
                // Now if you'll excuse me, I gotta get things done ...
                Huno.AI.Say(LocText("TEXT_WIP_XRYREI_20241215_181641"));
                DC(int64(0x901d3081e789a82d), EConversationDebugInfo::Done);
                DC(int64(0x901d3081e789a831), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x901d3081e789a831), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceHunoBuysmith : UTopic_Hero__OC_VLK_HUNO_538
        {
            default DebugId = int64(0x70e45933fe7af270);
            default Caption = LocText("DIA_HUNO_BUYSMITH_15_00");
            default PriorityRank = 2;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x468a493a1a595dd7), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Crafting_Blacksmith_Trained));
                    DB(int64(0x468a493a1a595dd7), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Crafting_Blacksmith_Master));
                }
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Crafting_Blacksmith_Trained))
                    return true;
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Crafting_Blacksmith_Master))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x70e45933fe7af272), EConversationDebugInfo::Executing);
                // I want to buy smithing tools. 
                Hero.AI.Say(LocText("DIA_HUNO_BUYSMITH_15_00"));
                DC(int64(0x70e45933fe7af272), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_VLK_HUNO, Document::UDocumentSegment_Glossary_OC_VLK_HUNO_Trader);
                DC(int64(0x70e45933fe7af27f), EConversationDebugInfo::Executing);
                Huno.AI.StartTradingWith(Hero);
                DC(int64(0x70e45933fe7af27f), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceHunoExit : UTopic_Hero__OC_VLK_HUNO_538
        {
            default DebugId = int64(0x70e45933fe7af24f);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x70e45933fe7af250), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x70e45933fe7af250), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceHunoHowlong : UTopic_Hero__OC_VLK_HUNO_538
        {
            default DebugId = int64(0x70e45933fe7af255);
            default Caption = LocText("DIA_HUNO_HOWLONG_15_00");
            default PriorityRank = 2;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceHunoYouknowyourjob);
            default Rules.HideIfKnows(UChoiceHunoHowlong);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x70e45933fe7af256), EConversationDebugInfo::Executing);
                // How long do you need for a single sword? 
                Hero.AI.Say(LocText("DIA_HUNO_HOWLONG_15_00"));
                DC(int64(0x70e45933fe7af256), EConversationDebugInfo::Done);
                DC(int64(0x70e45933fe7af257), EConversationDebugInfo::Executing);
                
                // Depends. A basic one, I can whip up in the blink of an ...
                Huno.AI.Say(LocText("DIA_HUNO_HOWLONG_09_01"));
                DC(int64(0x70e45933fe7af257), EConversationDebugInfo::Done);
                DC(int64(0x70e45933fe7af25a), EConversationDebugInfo::Executing);
                
                // What about something more intricate?
                Hero.AI.Say(LocText("DIA_HUNO_HOWLONG_15_04"));
                DC(int64(0x70e45933fe7af25a), EConversationDebugInfo::Done);
                DC(int64(0x423c311dbf8d0df9), EConversationDebugInfo::Executing);
                
                // Well that can take a bit. Whistler had me do one like ...
                Huno.AI.Say(LocText("TEXT_WIP_BDCKZPD_20241104_165114"));
                DC(int64(0x423c311dbf8d0df9), EConversationDebugInfo::Done);
                DC(int64(0x70e45933fe7af25b), EConversationDebugInfo::Executing);
                // Paid me a full hundred and fifty nuggets for it, but I'm ...
                Huno.AI.Say(LocText("DIA_HUNO_HOWLONG_09_05"));
                DC(int64(0x70e45933fe7af25b), EConversationDebugInfo::Done);
                DC(int64(0x70e45933fe7af25c), EConversationDebugInfo::Executing);
                // Felt like I was talkin' to a princess orderin' her ...
                Huno.AI.Say(LocText("DIA_HUNO_HOWLONG_09_06"));
                DC(int64(0x70e45933fe7af25c), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceHunoHowsyourbusiness : UTopic_Hero__OC_VLK_HUNO_538
        {
            default DebugId = int64(0x70e45933fe7af25e);
            default Caption = LocText("DIA_HUNO_HOWSYOURBUSINESS_15_00");
            default PriorityRank = 2;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceHunoHowlong);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x70e45933fe7af25f), EConversationDebugInfo::Executing);
                
                // How's business?
                Hero.AI.Say(LocText("DIA_HUNO_HOWSYOURBUSINESS_15_00"));
                DC(int64(0x70e45933fe7af25f), EConversationDebugInfo::Done);
                DC(int64(0x70e45933fe7af260), EConversationDebugInfo::Executing);
                
                // Why do you care? 
                Huno.AI.Say(LocText("DIA_HUNO_HOWSYOURBUSINESS_09_01"));
                DC(int64(0x70e45933fe7af260), EConversationDebugInfo::Done);
                DC(int64(0x70e45933fe7af261), EConversationDebugInfo::Executing);
                
                // Maybe I want to order something. 
                Hero.AI.Say(LocText("DIA_HUNO_HOWSYOURBUSINESS_15_02"));
                DC(int64(0x70e45933fe7af261), EConversationDebugInfo::Done);
                DC(int64(0x70e45933fe7af262), EConversationDebugInfo::Executing);
                
                // Like what?
                Huno.AI.Say(LocText("DIA_HUNO_HOWSYOURBUSINESS_09_03"));
                DC(int64(0x70e45933fe7af262), EConversationDebugInfo::Done);
                DC(int64(0x70e45933fe7af263), EConversationDebugInfo::Executing);
                
                // I'm still trying to figure that out. 
                Hero.AI.Say(LocText("DIA_HUNO_HOWSYOURBUSINESS_15_04"));
                DC(int64(0x70e45933fe7af263), EConversationDebugInfo::Done);
                DC(int64(0x70e45933fe7af264), EConversationDebugInfo::Executing);
                
                // Then come back when you have, and quit buggin' me. 
                Huno.AI.Say(LocText("DIA_HUNO_HOWSYOURBUSINESS_09_05"));
                DC(int64(0x70e45933fe7af264), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceHunoYouknowyourjob : UTopic_Hero__OC_VLK_HUNO_538
        {
            default DebugId = int64(0x70e45933fe7af251);
            default Caption = LocText("DIA_HUNO_YOUKNOWYOURJOB_15_00");
            default PriorityRank = 2;
            
            default Rules.HideIfKnows(UChoiceHunoYouknowyourjob);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x70e45933fe7af252), EConversationDebugInfo::Executing);
                
                // Mhh, you seem to be good at this.
                Hero.AI.Say(LocText("DIA_HUNO_YOUKNOWYOURJOB_15_00"));
                DC(int64(0x70e45933fe7af252), EConversationDebugInfo::Done);
                DC(int64(0x70e45933fe7af253), EConversationDebugInfo::Executing);
                
                // No one's complained yet. 
                Huno.AI.Say(LocText("DIA_HUNO_YOUKNOWYOURJOB_09_01"));
                DC(int64(0x70e45933fe7af253), EConversationDebugInfo::Done);
                DC(int64(0x70e45933fe7af254), EConversationDebugInfo::Executing);
                // And they best not. Every arsehole in here needs a bloody ...
                Huno.AI.Say(LocText("DIA_HUNO_YOUKNOWYOURJOB_09_02"));
                DC(int64(0x70e45933fe7af254), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_VLK_HUNO, Document::UDocumentSegment_Glossary_OC_VLK_HUNO_Introduction);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */