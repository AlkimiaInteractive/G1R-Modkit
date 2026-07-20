#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OW_OWR_GRAZKRAK_2400 : UConversationCharacterSettings
        {
            default ForCharacter = n"OW_OWR_GRAZKRAK_2400";
        }
        
        
        class UTopic_Hero__OW_OWR_GRAZKRAK_2400 : UG1RDialogTopic
        {
            default ForCharacter = n"OW_OWR_GRAZKRAK_2400";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetGrazkrak() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetOW_OWR_ORCWARRIORM14_2028() const property
            {
                return GetCharacter(n"OW_OWR_ORCWARRIORM14_2028");
            }
            
            AGothicCharacterState GetOW_OWR_ORCWARRIORM15_2029() const property
            {
                return GetCharacter(n"OW_OWR_ORCWARRIORM15_2029");
            }
            
            AGothicCharacterState GetUrShak() const property
            {
                return GetCharacter(n"UL_OSL_URSHAK_2200");
            }
        }
        
        
        class UChoiceGrazkrak99790 : UTopic_Hero__OW_OWR_GRAZKRAK_2400
        {
            default DebugId = int64(0x9e69cf19e4acafe4);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9e69cf19e4acafe3), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x9e69cf19e4acafe3), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGrazkrak99806 : UTopic_Hero__OW_OWR_GRAZKRAK_2400
        {
            default DebugId = int64(0x9e69cf19e4acafe8);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceGrazkrak99806);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OW_OWR_GRAZKRAK, Document::UDocumentSegment_Glossary_OW_OWR_GRAZKRAK_Introduction);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH5_ACCESSSLEEPERTEMPLE, Document::UDocumentSegment_CH5_ACCESSSLEEPERTEMPLE_Duel);
                DB(int64(0xa77480f9b999e9bc), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Skilled));
                DB(int64(0x177bf289e38bb2a8), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Master));
                
                if ((Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Skilled)) || (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Master)))
                {
                    DC(int64(0x5c7e55a5f0b784a3), EConversationDebugInfo::Executing);
                    // You're carrying the Ulu-Mulu. You deserve an honorable ...
                    Grazkrak.AI.Say(LocText("TEXT_WIP_DAYMWIF_20240709_113323_2238"));
                    DC(int64(0x5c7e55a5f0b784a3), EConversationDebugInfo::Done);
                    DC(int64(0x5c7e55a5f0b784ac), EConversationDebugInfo::Executing);
                    // A fight to the death. Bâlyar is with me! Die!
                    Grazkrak.AI.Say(LocText("TEXT_WIP_DAYMWIF_20240709_113508"));
                    DC(int64(0x5c7e55a5f0b784ac), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0xa77480f9b999ea77), EConversationDebugInfo::Executing);
                    // You're carrying the Ulu-Mulu. You deserve an honorable ...
                    Grazkrak.AI.Say(LocText("TEXT_WIP_DAYMWIF_20240709_113323_2238"), ForceSubtitleLanguage = n"foreign");
                    DC(int64(0xa77480f9b999ea77), EConversationDebugInfo::Done);
                    DC(int64(0xa77480f9b999ea7a), EConversationDebugInfo::Executing);
                    // A fight to the death. Bâlyar is with me! Die!
                    Grazkrak.AI.Say(LocText("TEXT_WIP_DAYMWIF_20240709_113508"), ForceSubtitleLanguage = n"foreign");
                    DC(int64(0xa77480f9b999ea7a), EConversationDebugInfo::Done);
                }
                DC(int64(0x9e69cf19e4acaff7), EConversationDebugInfo::Executing);
                if (ensure(IsValid(OW_OWR_ORCWARRIORM14_2028))) { OW_OWR_ORCWARRIORM14_2028.ExchangeDailyRoutineToClass(UDailyRoutine_OW_OWR_OrcWarriorM14_2028_Fight); }
                DC(int64(0x9e69cf19e4acaff7), EConversationDebugInfo::Done);
                DC(int64(0x9e69cf19e4acaff9), EConversationDebugInfo::Executing);
                if (ensure(IsValid(OW_OWR_ORCWARRIORM15_2029))) { OW_OWR_ORCWARRIORM15_2029.ExchangeDailyRoutineToClass(UDailyRoutine_OW_OWR_OrcWarriorM15_2029_Fight); }
                DC(int64(0x9e69cf19e4acaff9), EConversationDebugInfo::Done);
                DC(int64(0x9ebf65605a98312f), EConversationDebugInfo::Executing);
                if (ensure(IsValid(UrShak))) { UrShak.ExchangeDailyRoutineToClass(UDailyRoutine_UL_OSL_UrShak_2200_Wait); }
                DC(int64(0x9ebf65605a98312f), EConversationDebugInfo::Done);
                DC(int64(0x89835ad73104f743), EConversationDebugInfo::Executing);
                Grazkrak.AI.StartAttackingImmediately(Hero);
                DC(int64(0x89835ad73104f743), EConversationDebugInfo::Done);
                DC(int64(0xd57b2dc71a67945), EConversationDebugInfo::Executing);
                Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_OBJ_DUEL.StartQuest();
                DC(int64(0xd57b2dc71a67945), EConversationDebugInfo::Done);
                DC(int64(0x9e69cf19e4acaff5), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x9e69cf19e4acaff5), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */