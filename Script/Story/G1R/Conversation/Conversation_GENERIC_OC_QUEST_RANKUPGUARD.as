#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_GENERIC_OC_QUEST_RANKUPGUARD : UConversationCharacterSettings
        {
            default ForCharacter = n"GENERIC_OC_QUEST_RANKUPGUARD";
        }
        
        
        class UTopic_Hero__GENERIC_OC_QUEST_RANKUPGUARD : UG1RDialogTopic
        {
            default ForCharacter = n"GENERIC_OC_QUEST_RANKUPGUARD";
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
        
        
        class UTopic_Quest_OCRankUp1 : UTopic_Hero__GENERIC_OC_QUEST_RANKUPGUARD
        {
            default DebugId = int64(0xfb3a7ee8603dab29);
            default Caption = LocText("TEXT_WIP_PHRCFQN_20241216_153345_3984");
            default PriorityRank = 1;
            default JustOne.Add(n"OCRankUp");
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Quest.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Intro)) return false;
                if (!Quest.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer11)) return false;
                if (!Quest.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer12)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xbf6145a9263cbe95), G1R.RecruitedDiggers < 3);
                    DB(int64(0x84d011413d331cf3), Quest::OldCamp_OCCHAPTER3_RANKUPGUARD != nullptr && Quest::OldCamp_OCCHAPTER3_RANKUPGUARD.IsRunning());
                    DB(int64(0x3fd629012ef0f541), Quest != nullptr && !Quest.HasStoryEventInMemory(n"TalkedRankGuard", Hero));
                    DB(int64(0x90c782a4dcfc1eb), G1R.RandomDiggerPhrase_1 == 0);
                }
                
                if (G1R.RecruitedDiggers >= 3)
                    return false;
                
                if (Quest::OldCamp_OCCHAPTER3_RANKUPGUARD != nullptr && !Quest::OldCamp_OCCHAPTER3_RANKUPGUARD.IsRunning())
                    return false;
                
                if (Quest != nullptr && Quest.HasStoryEventInMemory(n"TalkedRankGuard", Hero))
                    return false;
                
                if (G1R.RandomDiggerPhrase_1 != 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xfb3a7ee8603dab27), EConversationDebugInfo::Executing);
                // Hey, I need you to come with me. 
                Hero.AI.Say(LocText("TEXT_WIP_PHRCFQN_20241216_153345_3984"));
                DC(int64(0xfb3a7ee8603dab27), EConversationDebugInfo::Done);
                DC(int64(0x82402499c76b52ee), EConversationDebugInfo::Executing);
                
                Quest.AI.Say(GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Intro);
                DC(int64(0x82402499c76b52ee), EConversationDebugInfo::Done);
                DC(int64(0xbf6145a9263cbeb3), EConversationDebugInfo::Executing);
                
                // There's a new shipment coming into the Exchange Zone. 
                Hero.AI.Say(LocText("TEXT_WIP_PHRCFQN_20241216_161604"));
                DC(int64(0xbf6145a9263cbeb3), EConversationDebugInfo::Done);
                DC(int64(0x82402499c76b52f0), EConversationDebugInfo::Executing);
                
                Quest.AI.Say(GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer11);
                DC(int64(0x82402499c76b52f0), EConversationDebugInfo::Done);
                DC(int64(0x82402499c76b52f1), EConversationDebugInfo::Executing);
                Quest.AI.Say(GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer12);
                DC(int64(0x82402499c76b52f1), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Quest_144149,
                    UTopic_Quest_132621,
                    UTopic_Quest_132641,
                    UTopic_Quest_133090
                );
                DC(int64(0xbf6145a9263cbec7), EConversationDebugInfo::Executing);
                Quest.ExchangeDailyRoutineToClass(UDailyRoutine_Generic_FollowHero);
                DC(int64(0xbf6145a9263cbec7), EConversationDebugInfo::Done);
                DC(int64(0xbf6145a9263cbec9), EConversationDebugInfo::Executing);
                G1R.RecruitedDiggers += 1;
                DC(int64(0xbf6145a9263cbec9), EConversationDebugInfo::Done);
                DC(int64(0x44869f122f483bff), EConversationDebugInfo::Executing);
                Quest.GiveImmortality();
                DC(int64(0x44869f122f483bff), EConversationDebugInfo::Done);
                DC(int64(0x3fd629012ef0f540), EConversationDebugInfo::Executing);
                Quest.StoreStoryEventInMemory(n"TalkedRankGuard", Hero);
                DC(int64(0x3fd629012ef0f540), EConversationDebugInfo::Done);
                DC(int64(0xa378a13b6d0f139c), EConversationDebugInfo::Executing);
                Quest.JoinPartyOf(Hero);
                DC(int64(0xa378a13b6d0f139c), EConversationDebugInfo::Done);
                DC(int64(0xa3e119ebe950a598), EConversationDebugInfo::Executing);
                G1R.RandomDiggerPhrase_1 = 1;
                DC(int64(0xa3e119ebe950a598), EConversationDebugInfo::Done);
                DC(int64(0xa06ce143f10d8560), EConversationDebugInfo::Executing);
                G1R.DiggerRankUpOrder = 1;
                DC(int64(0xa06ce143f10d8560), EConversationDebugInfo::Done);
                DC(int64(0xa3ae4ece1a13777), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xa3ae4ece1a13777), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Quest_144149 : UTopic_Hero__GENERIC_OC_QUEST_RANKUPGUARD
        {
            default DebugId = int64(0x460eb839e69a9232);
            default Caption = LocText("TEXT_WIP_FSWYRII_20250117_131158_41");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Quest_144149);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Quest.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer13)) return false;
                if (!Quest.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer14)) return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x460eb839e69a9233), EConversationDebugInfo::Executing);
                // I could also just beat you all the way to the Exchange ...
                Hero.AI.Say(LocText("TEXT_WIP_FSWYRII_20250117_131158_41"));
                DC(int64(0x460eb839e69a9233), EConversationDebugInfo::Done);
                DC(int64(0x82402499c76b52f2), EConversationDebugInfo::Executing);
                
                Quest.AI.Say(GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer13);
                DC(int64(0x82402499c76b52f2), EConversationDebugInfo::Done);
                DC(int64(0x82402499c76b52f3), EConversationDebugInfo::Executing);
                Quest.AI.Say(GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer14);
                DC(int64(0x82402499c76b52f3), EConversationDebugInfo::Done);
                DC(int64(0x460eb839e69a9235), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x460eb839e69a9235), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Quest_132621 : UTopic_Hero__GENERIC_OC_QUEST_RANKUPGUARD
        {
            default DebugId = int64(0xbf6145a9263cbeba);
            default Caption = LocText("TEXT_WIP_PHRCFQN_20241216_161939_3436");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Quest_132621);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Quest.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer15)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xbf6145a9263cbec3), Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 20, 0));
                }
                
                return Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 20, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xbf6145a9263cbebb), EConversationDebugInfo::Executing);
                // How about twenty nuggets?
                Hero.AI.Say(LocText("TEXT_WIP_PHRCFQN_20241216_161939_3436"));
                DC(int64(0xbf6145a9263cbebb), EConversationDebugInfo::Done);
                DC(int64(0x82402499c76b52f4), EConversationDebugInfo::Executing);
                
                Quest.AI.Say(GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer15);
                DC(int64(0x82402499c76b52f4), EConversationDebugInfo::Done);
                DC(int64(0xbf6145a9263cbefd), EConversationDebugInfo::Executing);
                Hero.AI.GiveItemTo(Quest, UItMi_Orenugget, 20);
                DC(int64(0xbf6145a9263cbefd), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Quest_132641 : UTopic_Hero__GENERIC_OC_QUEST_RANKUPGUARD
        {
            default DebugId = int64(0xbf6145a9263cbebe);
            default Caption = LocText("TEXT_WIP_PHRCFQN_20241216_161939_686");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Quest_132641);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Quest.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer16)) return false;
                if (!Quest.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer17)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xbf6145a9263cbeee), Hero != nullptr && Hero.HasItem(UItMi_Joint_01, 1, 0));
                }
                
                return Hero != nullptr && Hero.HasItem(UItMi_Joint_01, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xbf6145a9263cbebf), EConversationDebugInfo::Executing);
                // How about some herb, fresh from the swamp?
                Hero.AI.Say(LocText("TEXT_WIP_PHRCFQN_20241216_161939_686"));
                DC(int64(0xbf6145a9263cbebf), EConversationDebugInfo::Done);
                DC(int64(0x82402499c76b52f5), EConversationDebugInfo::Executing);
                
                Quest.AI.Say(GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer16);
                DC(int64(0x82402499c76b52f5), EConversationDebugInfo::Done);
                DC(int64(0x82402499c76b52f6), EConversationDebugInfo::Executing);
                Quest.AI.Say(GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer17);
                DC(int64(0x82402499c76b52f6), EConversationDebugInfo::Done);
                DB(int64(0xbf6145a9263cbef1), Hero != nullptr && Hero.HasItem(UItMi_Joint_01, 1, 0));
                DB(int64(0xbf6145a9263cbef4), Hero != nullptr && Hero.HasItem(UItMi_Joint_02, 1, 0));
                DB(int64(0xbf6145a9263cbefb), Hero != nullptr && Hero.HasItem(UItMi_Joint_03, 1, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItMi_Joint_01, 1, 0))
                {
                    DC(int64(0xbf6145a9263cbef3), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Quest, UItMi_Joint_01, 1);
                    DC(int64(0xbf6145a9263cbef3), EConversationDebugInfo::Done);
                }
                else if (Hero != nullptr && Hero.HasItem(UItMi_Joint_02, 1, 0))
                {
                    DC(int64(0xbf6145a9263cbef6), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Quest, UItMi_Joint_02, 2);
                    DC(int64(0xbf6145a9263cbef6), EConversationDebugInfo::Done);
                }
                else if (Hero != nullptr && Hero.HasItem(UItMi_Joint_03, 1, 0))
                {
                    DC(int64(0xbf6145a9263cbef8), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Quest, UItMi_Joint_03, 1);
                    DC(int64(0xbf6145a9263cbef8), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UTopic_Quest_133090 : UTopic_Hero__GENERIC_OC_QUEST_RANKUPGUARD
        {
            default DebugId = int64(0xbf6145a9263cbefe);
            default Caption = LocText("TEXT_WIP_PHRCFQN_20241216_165629_2801");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Quest_133090);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Quest.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer18)) return false;
                if (!Quest.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer19)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf8f95978025caab3), Hero != nullptr && !Hero.HasItem(UItMi_Orenugget, 20, 0));
                }
                
                return Hero != nullptr && !Hero.HasItem(UItMi_Orenugget, 20, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xbf6145a9263cbeff), EConversationDebugInfo::Executing);
                // Look, I don't have the nuggets on me right now, but I'll ...
                Hero.AI.Say(LocText("TEXT_WIP_PHRCFQN_20241216_165629_2801"));
                DC(int64(0xbf6145a9263cbeff), EConversationDebugInfo::Done);
                DC(int64(0x82402499c76b52f7), EConversationDebugInfo::Executing);
                
                Quest.AI.Say(GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer18);
                DC(int64(0x82402499c76b52f7), EConversationDebugInfo::Done);
                DC(int64(0xf8f95978025caab0), EConversationDebugInfo::Executing);
                
                // Yeah, trust me. You’ll get your cut. Just help me move ...
                Hero.AI.Say(LocText("TEXT_WIP_WNJITDF_20250310_110626"));
                DC(int64(0xf8f95978025caab0), EConversationDebugInfo::Done);
                DC(int64(0x82402499c76b52f8), EConversationDebugInfo::Executing);
                
                Quest.AI.Say(GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer19);
                DC(int64(0x82402499c76b52f8), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Quest_OCRankUp2 : UTopic_Hero__GENERIC_OC_QUEST_RANKUPGUARD
        {
            default DebugId = int64(0xa3e119ebe950a569);
            default Caption = LocText("TEXT_WIP_PHRCFQN_20241216_153345_3984");
            default PriorityRank = 1;
            default JustOne.Add(n"OCRankUp");
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Quest.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Intro)) return false;
                if (!Quest.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer21)) return false;
                if (!Quest.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer22)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xbf6145a9263cbe95), G1R.RecruitedDiggers < 3);
                    DB(int64(0x84d011413d331cf3), Quest::OldCamp_OCCHAPTER3_RANKUPGUARD != nullptr && Quest::OldCamp_OCCHAPTER3_RANKUPGUARD.IsRunning());
                    DB(int64(0x3fd629012ef0f541), Quest != nullptr && !Quest.HasStoryEventInMemory(n"TalkedRankGuard", Hero));
                    DB(int64(0xda7a24febf05d76e), G1R.RandomDiggerPhrase_2 == 0);
                }
                
                if (G1R.RecruitedDiggers >= 3)
                    return false;
                
                if (Quest::OldCamp_OCCHAPTER3_RANKUPGUARD != nullptr && !Quest::OldCamp_OCCHAPTER3_RANKUPGUARD.IsRunning())
                    return false;
                
                if (Quest != nullptr && Quest.HasStoryEventInMemory(n"TalkedRankGuard", Hero))
                    return false;
                
                if (G1R.RandomDiggerPhrase_2 != 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xfb3a7ee8603dab27), EConversationDebugInfo::Executing);
                
                // Hey, I need you to come with me. 
                Hero.AI.Say(LocText("TEXT_WIP_PHRCFQN_20241216_153345_3984"));
                DC(int64(0xfb3a7ee8603dab27), EConversationDebugInfo::Done);
                DC(int64(0x82402499c76b52ee), EConversationDebugInfo::Executing);
                
                Quest.AI.Say(GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Intro);
                DC(int64(0x82402499c76b52ee), EConversationDebugInfo::Done);
                DC(int64(0xbf6145a9263cbeb3), EConversationDebugInfo::Executing);
                
                // There's a new shipment coming into the Exchange Zone. 
                Hero.AI.Say(LocText("TEXT_WIP_PHRCFQN_20241216_161604"));
                DC(int64(0xbf6145a9263cbeb3), EConversationDebugInfo::Done);
                DC(int64(0x82402499c76b52fa), EConversationDebugInfo::Executing);
                
                Quest.AI.Say(GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer21);
                DC(int64(0x82402499c76b52fa), EConversationDebugInfo::Done);
                DC(int64(0x84d011413d331c98), EConversationDebugInfo::Executing);
                
                // Do you need me to spell it out for you? 
                Hero.AI.Say(LocText("TEXT_WIP_OHRCFQN_20241217_092238"));
                DC(int64(0x84d011413d331c98), EConversationDebugInfo::Done);
                DC(int64(0x82402499c76b52fb), EConversationDebugInfo::Executing);
                
                Quest.AI.Say(GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer22);
                DC(int64(0x82402499c76b52fb), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Quest_133021,
                    UTopic_Quest_133041,
                    UTopic_Quest_133131
                );
                DC(int64(0x84d011413d331cb2), EConversationDebugInfo::Executing);
                Quest.ExchangeDailyRoutineToClass(UDailyRoutine_Generic_FollowHero);
                DC(int64(0x84d011413d331cb2), EConversationDebugInfo::Done);
                DC(int64(0x84d011413d331cb4), EConversationDebugInfo::Executing);
                G1R.RecruitedDiggers += 1;
                DC(int64(0x84d011413d331cb4), EConversationDebugInfo::Done);
                DC(int64(0x44869f122f483c01), EConversationDebugInfo::Executing);
                Quest.GiveImmortality();
                DC(int64(0x44869f122f483c01), EConversationDebugInfo::Done);
                DC(int64(0xa378a13b6d0f13a0), EConversationDebugInfo::Executing);
                Quest.JoinPartyOf(Hero);
                DC(int64(0xa378a13b6d0f13a0), EConversationDebugInfo::Done);
                DC(int64(0xa3e119ebe950a59a), EConversationDebugInfo::Executing);
                G1R.RandomDiggerPhrase_2 = 1;
                DC(int64(0xa3e119ebe950a59a), EConversationDebugInfo::Done);
                DC(int64(0xa06ce143f10d8563), EConversationDebugInfo::Executing);
                G1R.DiggerRankUpOrder = 2;
                DC(int64(0xa06ce143f10d8563), EConversationDebugInfo::Done);
                DC(int64(0xa3ae4ece1a13776), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xa3ae4ece1a13776), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Quest_133021 : UTopic_Hero__GENERIC_OC_QUEST_RANKUPGUARD
        {
            default DebugId = int64(0x84d011413d331c9c);
            default Caption = LocText("TEXT_WIP_OHRCFQN_20241217_092519");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Quest_133021);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Quest.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer23)) return false;
                if (!Quest.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer24)) return false;
                if (!Quest.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer25)) return false;
                if (!Quest.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer26)) return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x84d011413d331c9d), EConversationDebugInfo::Executing);
                // You won't like what's gonna happen when you say "no."
                Hero.AI.Say(LocText("TEXT_WIP_OHRCFQN_20241217_092519_41"));
                DC(int64(0x84d011413d331c9d), EConversationDebugInfo::Done);
                DC(int64(0x82402499c76b52fc), EConversationDebugInfo::Executing);
                
                Quest.AI.Say(GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer23);
                DC(int64(0x82402499c76b52fc), EConversationDebugInfo::Done);
                DC(int64(0x84d011413d331ca8), EConversationDebugInfo::Executing);
                
                // I have a hunch you've been skimming ore from the Old ...
                Hero.AI.Say(LocText("TEXT_WIP_OHRCFQN_20241217_102050"));
                DC(int64(0x84d011413d331ca8), EConversationDebugInfo::Done);
                DC(int64(0x82402499c76b52fd), EConversationDebugInfo::Executing);
                
                Quest.AI.Say(GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer24);
                DC(int64(0x82402499c76b52fd), EConversationDebugInfo::Done);
                DC(int64(0x460eb839e69a9242), EConversationDebugInfo::Executing);
                
                // Are you coming? Or are you an ore thief?
                Hero.AI.Say(LocText("TEXT_WIP_FSWYRII_20250117_133429"));
                DC(int64(0x460eb839e69a9242), EConversationDebugInfo::Done);
                DC(int64(0x82402499c76b52fe), EConversationDebugInfo::Executing);
                
                Quest.AI.Say(GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer25);
                DC(int64(0x82402499c76b52fe), EConversationDebugInfo::Done);
                DC(int64(0x82402499c76b52ff), EConversationDebugInfo::Executing);
                Quest.AI.Say(GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer26);
                DC(int64(0x82402499c76b52ff), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Quest_133041 : UTopic_Hero__GENERIC_OC_QUEST_RANKUPGUARD
        {
            default DebugId = int64(0x84d011413d331ca0);
            default Caption = LocText("TEXT_WIP_OHRCFQN_20241217_092519_2083");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Quest_133041);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Quest.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer27)) return false;
                if (!Quest.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer25)) return false;
                if (!Quest.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer26)) return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x84d011413d331ca1), EConversationDebugInfo::Executing);
                
                // Come on, or the only thing you'll be digging tomorrow is ...
                Hero.AI.Say(LocText("TEXT_WIP_OHRCFQN_20241217_092519_2238"));
                DC(int64(0x84d011413d331ca1), EConversationDebugInfo::Done);
                DC(int64(0x82402499c76b5300), EConversationDebugInfo::Executing);
                
                Quest.AI.Say(GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer27);
                DC(int64(0x82402499c76b5300), EConversationDebugInfo::Done);
                DC(int64(0x84d011413d331ca5), EConversationDebugInfo::Executing);
                
                // Are you sure about that? 
                Hero.AI.Say(LocText("TEXT_WIP_OHRCFQN_20241217_101819"));
                DC(int64(0x84d011413d331ca5), EConversationDebugInfo::Done);
                DC(int64(0x82402499c76b5302), EConversationDebugInfo::Executing);
                
                Quest.AI.Say(GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer25);
                DC(int64(0x82402499c76b5302), EConversationDebugInfo::Done);
                DC(int64(0x82402499c76b5303), EConversationDebugInfo::Executing);
                Quest.AI.Say(GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer26);
                DC(int64(0x82402499c76b5303), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Quest_133131 : UTopic_Hero__GENERIC_OC_QUEST_RANKUPGUARD
        {
            default DebugId = int64(0x84d011413d331caa);
            default Caption = LocText("TEXT_WIP_OHRCFQN_20241217_102132_1924");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Quest_133131);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Quest.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer28)) return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x84d011413d331cab), EConversationDebugInfo::Executing);
                
                // You looked like a stand-up guy. Surely you wouldn't turn ...
                Hero.AI.Say(LocText("TEXT_WIP_OHRCFQN_20241217_102132_1924"));
                DC(int64(0x84d011413d331cab), EConversationDebugInfo::Done);
                DC(int64(0xeffd827de4050336), EConversationDebugInfo::Executing);
                
                Quest.AI.Say(GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer28);
                DC(int64(0xeffd827de4050336), EConversationDebugInfo::Done);
                DC(int64(0x84d011413d331cad), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x84d011413d331cad), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Quest_OCRankUp3 : UTopic_Hero__GENERIC_OC_QUEST_RANKUPGUARD
        {
            default DebugId = int64(0xa3e119ebe950a56b);
            default Caption = LocText("TEXT_WIP_PHRCFQN_20241216_153345_3984");
            default PriorityRank = 1;
            default JustOne.Add(n"OCRankUp");
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Quest.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Intro)) return false;
                if (!Quest.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer31)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xbf6145a9263cbe95), G1R.RecruitedDiggers < 3);
                    DB(int64(0x84d011413d331cf3), Quest::OldCamp_OCCHAPTER3_RANKUPGUARD != nullptr && Quest::OldCamp_OCCHAPTER3_RANKUPGUARD.IsRunning());
                    DB(int64(0x3fd629012ef0f541), Quest != nullptr && !Quest.HasStoryEventInMemory(n"TalkedRankGuard", Hero));
                    DB(int64(0xa3e119ebe950a5a5), G1R.RandomDiggerPhrase_3 == 0);
                }
                
                if (G1R.RecruitedDiggers >= 3)
                    return false;
                
                if (Quest::OldCamp_OCCHAPTER3_RANKUPGUARD != nullptr && !Quest::OldCamp_OCCHAPTER3_RANKUPGUARD.IsRunning())
                    return false;
                
                if (Quest != nullptr && Quest.HasStoryEventInMemory(n"TalkedRankGuard", Hero))
                    return false;
                
                if (G1R.RandomDiggerPhrase_3 != 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xfb3a7ee8603dab27), EConversationDebugInfo::Executing);
                // Hey, I need you to come with me. 
                Hero.AI.Say(LocText("TEXT_WIP_PHRCFQN_20241216_153345_3984"));
                DC(int64(0xfb3a7ee8603dab27), EConversationDebugInfo::Done);
                DC(int64(0x82402499c76b52ee), EConversationDebugInfo::Executing);
                
                Quest.AI.Say(GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Intro);
                DC(int64(0x82402499c76b52ee), EConversationDebugInfo::Done);
                DC(int64(0xbf6145a9263cbeb3), EConversationDebugInfo::Executing);
                
                // There's a new shipment coming into the Exchange Zone. 
                Hero.AI.Say(LocText("TEXT_WIP_PHRCFQN_20241216_161604"));
                DC(int64(0xbf6145a9263cbeb3), EConversationDebugInfo::Done);
                DC(int64(0xe4524a915c83d74d), EConversationDebugInfo::Executing);
                
                Quest.AI.Say(GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer31);
                DC(int64(0xe4524a915c83d74d), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Quest_132765,
                    UTopic_Quest_132785,
                    UTopic_Quest_132811
                );
            }
        }
        
        
        class UTopic_Quest_132765 : UTopic_Hero__GENERIC_OC_QUEST_RANKUPGUARD
        {
            default DebugId = int64(0xbf6145a9263cbecc);
            default Caption = LocText("TEXT_WIP_PHRCFQN_20241216_163024_2386");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Quest_132765);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Quest.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer32)) return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xbf6145a9263cbecd), EConversationDebugInfo::Executing);
                // The fresh air will do you good.
                Hero.AI.Say(LocText("TEXT_WIP_PHRCFQN_20241216_163024_2386"));
                DC(int64(0xbf6145a9263cbecd), EConversationDebugInfo::Done);
                DC(int64(0xe4524a915c83d74e), EConversationDebugInfo::Executing);
                
                Quest.AI.Say(GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer32);
                DC(int64(0xe4524a915c83d74e), EConversationDebugInfo::Done);
                DC(int64(0xbf6145a9263cbecf), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xbf6145a9263cbecf), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Quest_132785 : UTopic_Hero__GENERIC_OC_QUEST_RANKUPGUARD
        {
            default DebugId = int64(0xbf6145a9263cbed0);
            default Caption = LocText("TEXT_WIP_PHRCFQN_20241216_163024_1609");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Quest_132785);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Quest.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer33)) return false;
                if (!Quest.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer34)) return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xbf6145a9263cbed1), EConversationDebugInfo::Executing);
                // Because then I'll let everyone know you helped out when ...
                Hero.AI.Say(LocText("TEXT_WIP_PHRCFQN_20241216_163024_1609"));
                DC(int64(0xbf6145a9263cbed1), EConversationDebugInfo::Done);
                DC(int64(0xe4524a915c83d74f), EConversationDebugInfo::Executing);
                
                Quest.AI.Say(GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer33);
                DC(int64(0xe4524a915c83d74f), EConversationDebugInfo::Done);
                DC(int64(0x460eb839e69a923c), EConversationDebugInfo::Executing);
                
                // Sure. 
                Hero.AI.Say(LocText("TEXT_WIP_FSWYRII_20250117_132001"));
                DC(int64(0x460eb839e69a923c), EConversationDebugInfo::Done);
                DC(int64(0xe4524a915c83d750), EConversationDebugInfo::Executing);
                
                Quest.AI.Say(GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer34);
                DC(int64(0xe4524a915c83d750), EConversationDebugInfo::Done);
                DC(int64(0xbf6145a9263cbee4), EConversationDebugInfo::Executing);
                Quest.ExchangeDailyRoutineToClass(UDailyRoutine_Generic_FollowHero);
                DC(int64(0xbf6145a9263cbee4), EConversationDebugInfo::Done);
                DC(int64(0xbf6145a9263cbee6), EConversationDebugInfo::Executing);
                G1R.RecruitedDiggers += 1;
                DC(int64(0xbf6145a9263cbee6), EConversationDebugInfo::Done);
                DC(int64(0x44869f122f483c03), EConversationDebugInfo::Executing);
                Quest.GiveImmortality();
                DC(int64(0x44869f122f483c03), EConversationDebugInfo::Done);
                DC(int64(0x3fd629012ef0f547), EConversationDebugInfo::Executing);
                Quest.StoreStoryEventInMemory(n"TalkedRankGuard", Hero);
                DC(int64(0x3fd629012ef0f547), EConversationDebugInfo::Done);
                DC(int64(0xbf6145a9263cbe99), EConversationDebugInfo::Executing);
                G1R.RandomDiggerPhrase_3 = 1;
                DC(int64(0xbf6145a9263cbe99), EConversationDebugInfo::Done);
                DC(int64(0xa378a13b6d0f139e), EConversationDebugInfo::Executing);
                Quest.JoinPartyOf(Hero);
                DC(int64(0xa378a13b6d0f139e), EConversationDebugInfo::Done);
                DC(int64(0xa06ce143f10d8566), EConversationDebugInfo::Executing);
                G1R.DiggerRankUpOrder = 5;
                DC(int64(0xa06ce143f10d8566), EConversationDebugInfo::Done);
                DC(int64(0xa3ae4ece1a13773), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xa3ae4ece1a13773), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Quest_132811 : UTopic_Hero__GENERIC_OC_QUEST_RANKUPGUARD
        {
            default DebugId = int64(0xbf6145a9263cbed6);
            default Caption = LocText("TEXT_WIP_PHRCFQN_20241216_163052_3569");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Quest_132811);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Quest.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer35)) return false;
                if (!Quest.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer36)) return false;
                if (!Quest.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer37)) return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xbf6145a9263cbed7), EConversationDebugInfo::Executing);
                // How about: because then I won't break your nose?
                Hero.AI.Say(LocText("TEXT_WIP_PHRCFQN_20241216_163052_3569"));
                DC(int64(0xbf6145a9263cbed7), EConversationDebugInfo::Done);
                DC(int64(0xe4524a915c83d756), EConversationDebugInfo::Executing);
                
                Quest.AI.Say(GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer35);
                DC(int64(0xe4524a915c83d756), EConversationDebugInfo::Done);
                DC(int64(0xe4524a915c83d757), EConversationDebugInfo::Executing);
                Quest.AI.Say(GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer36);
                DC(int64(0xe4524a915c83d757), EConversationDebugInfo::Done);
                DC(int64(0xe4524a915c83d758), EConversationDebugInfo::Executing);
                Quest.AI.Say(GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer37);
                DC(int64(0xe4524a915c83d758), EConversationDebugInfo::Done);
                DC(int64(0xbf6145a9263cbed9), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xbf6145a9263cbed9), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Quest_OCRankUp4 : UTopic_Hero__GENERIC_OC_QUEST_RANKUPGUARD
        {
            default DebugId = int64(0xa3e119ebe950a56d);
            default Caption = LocText("TEXT_WIP_PHRCFQN_20241216_153345_3984");
            default PriorityRank = 1;
            default JustOne.Add(n"OCRankUp");
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Quest.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Intro)) return false;
                if (!Quest.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer41)) return false;
                if (!Quest.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer42)) return false;
                if (!Quest.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer43)) return false;
                if (!Quest.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer44)) return false;
                if (!Quest.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer45)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xbf6145a9263cbe95), G1R.RecruitedDiggers < 3);
                    DB(int64(0x84d011413d331cf3), Quest::OldCamp_OCCHAPTER3_RANKUPGUARD != nullptr && Quest::OldCamp_OCCHAPTER3_RANKUPGUARD.IsRunning());
                    DB(int64(0x3fd629012ef0f541), Quest != nullptr && !Quest.HasStoryEventInMemory(n"TalkedRankGuard", Hero));
                    DB(int64(0xa3e119ebe950a5a7), G1R.RandomDiggerPhrase_4 == 0);
                }
                
                if (G1R.RecruitedDiggers >= 3)
                    return false;
                
                if (Quest::OldCamp_OCCHAPTER3_RANKUPGUARD != nullptr && !Quest::OldCamp_OCCHAPTER3_RANKUPGUARD.IsRunning())
                    return false;
                
                if (Quest != nullptr && Quest.HasStoryEventInMemory(n"TalkedRankGuard", Hero))
                    return false;
                
                if (G1R.RandomDiggerPhrase_4 != 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xfb3a7ee8603dab27), EConversationDebugInfo::Executing);
                // Hey, I need you to come with me. 
                Hero.AI.Say(LocText("TEXT_WIP_PHRCFQN_20241216_153345_3984"));
                DC(int64(0xfb3a7ee8603dab27), EConversationDebugInfo::Done);
                DC(int64(0x82402499c76b52ee), EConversationDebugInfo::Executing);
                
                Quest.AI.Say(GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Intro);
                DC(int64(0x82402499c76b52ee), EConversationDebugInfo::Done);
                DC(int64(0xbf6145a9263cbeb3), EConversationDebugInfo::Executing);
                
                // There's a new shipment coming into the Exchange Zone. 
                Hero.AI.Say(LocText("TEXT_WIP_PHRCFQN_20241216_161604"));
                DC(int64(0xbf6145a9263cbeb3), EConversationDebugInfo::Done);
                DC(int64(0xe4524a915c83d751), EConversationDebugInfo::Executing);
                
                Quest.AI.Say(GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer41);
                DC(int64(0xe4524a915c83d751), EConversationDebugInfo::Done);
                DC(int64(0xbf6145a9263cbeda), EConversationDebugInfo::Executing);
                
                // What do you mean? 
                Hero.AI.Say(LocText("TEXT_WIP_PHRCFQN_20241216_163520"));
                DC(int64(0xbf6145a9263cbeda), EConversationDebugInfo::Done);
                DC(int64(0xe4524a915c83d752), EConversationDebugInfo::Executing);
                
                Quest.AI.Say(GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer42);
                DC(int64(0xe4524a915c83d752), EConversationDebugInfo::Done);
                DC(int64(0xe4524a915c83d753), EConversationDebugInfo::Executing);
                Quest.AI.Say(GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer43);
                DC(int64(0xe4524a915c83d753), EConversationDebugInfo::Done);
                DC(int64(0x460eb839e69a9241), EConversationDebugInfo::Executing);
                
                // Well, since you're back on your feet ...
                Hero.AI.Say(LocText("TEXT_WIP_FSWYRII_20250117_132505"));
                DC(int64(0x460eb839e69a9241), EConversationDebugInfo::Done);
                DC(int64(0xe4524a915c83d754), EConversationDebugInfo::Executing);
                
                Quest.AI.Say(GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer44);
                DC(int64(0xe4524a915c83d754), EConversationDebugInfo::Done);
                DC(int64(0xe4524a915c83d755), EConversationDebugInfo::Executing);
                Quest.AI.Say(GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer45);
                DC(int64(0xe4524a915c83d755), EConversationDebugInfo::Done);
                DC(int64(0x3fd629012ef0f544), EConversationDebugInfo::Executing);
                Quest.StoreStoryEventInMemory(n"TalkedRankGuard", Hero);
                DC(int64(0x3fd629012ef0f544), EConversationDebugInfo::Done);
                DC(int64(0xa3e119ebe950a59c), EConversationDebugInfo::Executing);
                G1R.RandomDiggerPhrase_4 = 1;
                DC(int64(0xa3e119ebe950a59c), EConversationDebugInfo::Done);
                DC(int64(0xa06ce143f10d8569), EConversationDebugInfo::Executing);
                G1R.DiggerRankUpOrder = 4;
                DC(int64(0xa06ce143f10d8569), EConversationDebugInfo::Done);
                DC(int64(0xa3ae4ece1a13774), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xa3ae4ece1a13774), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Quest_OCRankUp5 : UTopic_Hero__GENERIC_OC_QUEST_RANKUPGUARD
        {
            default DebugId = int64(0xa3e119ebe950a56f);
            default Caption = LocText("TEXT_WIP_PHRCFQN_20241216_153345_3984");
            default PriorityRank = 1;
            default JustOne.Add(n"OCRankUp");
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Quest.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Intro)) return false;
                if (!Quest.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Outro)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xbf6145a9263cbe95), G1R.RecruitedDiggers < 3);
                    DB(int64(0x84d011413d331cf3), Quest::OldCamp_OCCHAPTER3_RANKUPGUARD != nullptr && Quest::OldCamp_OCCHAPTER3_RANKUPGUARD.IsRunning());
                    DB(int64(0x3fd629012ef0f541), Quest != nullptr && !Quest.HasStoryEventInMemory(n"TalkedRankGuard", Hero));
                    DB(int64(0xa3e119ebe950a5a4), G1R.RandomDiggerPhrase_5 == 0);
                }
                
                if (G1R.RecruitedDiggers >= 3)
                    return false;
                
                if (Quest::OldCamp_OCCHAPTER3_RANKUPGUARD != nullptr && !Quest::OldCamp_OCCHAPTER3_RANKUPGUARD.IsRunning())
                    return false;
                
                if (Quest != nullptr && Quest.HasStoryEventInMemory(n"TalkedRankGuard", Hero))
                    return false;
                
                if (G1R.RandomDiggerPhrase_5 != 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xfb3a7ee8603dab27), EConversationDebugInfo::Executing);
                // Hey, I need you to come with me. 
                Hero.AI.Say(LocText("TEXT_WIP_PHRCFQN_20241216_153345_3984"));
                DC(int64(0xfb3a7ee8603dab27), EConversationDebugInfo::Done);
                DC(int64(0x82402499c76b52ee), EConversationDebugInfo::Executing);
                
                Quest.AI.Say(GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Intro);
                DC(int64(0x82402499c76b52ee), EConversationDebugInfo::Done);
                DC(int64(0xbf6145a9263cbeb3), EConversationDebugInfo::Executing);
                
                // There's a new shipment coming into the Exchange Zone. 
                Hero.AI.Say(LocText("TEXT_WIP_PHRCFQN_20241216_161604"));
                DC(int64(0xbf6145a9263cbeb3), EConversationDebugInfo::Done);
                DC(int64(0x82402499c76b52ef), EConversationDebugInfo::Executing);
                
                Quest.AI.Say(GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Outro);
                DC(int64(0x82402499c76b52ef), EConversationDebugInfo::Done);
                DC(int64(0x3fd629012ef0f544), EConversationDebugInfo::Executing);
                Quest.StoreStoryEventInMemory(n"TalkedRankGuard", Hero);
                DC(int64(0x3fd629012ef0f544), EConversationDebugInfo::Done);
                DC(int64(0xa3e119ebe950a59e), EConversationDebugInfo::Executing);
                G1R.RandomDiggerPhrase_5 = 1;
                DC(int64(0xa3e119ebe950a59e), EConversationDebugInfo::Done);
                DC(int64(0xa06ce143f10d856c), EConversationDebugInfo::Executing);
                G1R.DiggerRankUpOrder = 3;
                DC(int64(0xa06ce143f10d856c), EConversationDebugInfo::Done);
                DC(int64(0xa3ae4ece1a13775), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xa3ae4ece1a13775), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */