#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_CUTSCENE_001_INTRO : UConversationCharacterSettings
        {
            default ForCharacter = n"CUTSCENE_001_INTRO";
        }
        
        
        class UTopic_Hero__CUTSCENE_001_INTRO : UG1RDialogTopic
        {
            default ForCharacter = n"CUTSCENE_001_INTRO";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetCutsceneIntro() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetGuard() const property
            {
                return GetCharacter(n"CHARACTER_DUM_GUARD_0");
            }
            
            AGothicCharacterState GetJudge() const property
            {
                return GetCharacter(n"CUTSCENE_DUM_JUDGE_0");
            }
            
            AGothicCharacterState GetKingAdvisor() const property
            {
                return GetCharacter(n"CUTSCENE_DUM_KINGADVISOR_0");
            }
            
            AGothicCharacterState GetKingRhobar() const property
            {
                return GetCharacter(n"CUTSCENE_DUM_KINGRHOBAR_0");
            }
            
            AGothicCharacterState GetMage() const property
            {
                return GetCharacter(n"CUTSCENE_DUM_MAGE_0");
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetNARRATOR() const property
            {
                return GetCharacter(n"NARRATOR");
            }
            
            AGothicCharacterState GetGomez() const property
            {
                return GetCharacter(n"OC_EBR_GOMEZ_100");
            }
            
            AGothicCharacterState GetDiego() const property
            {
                return GetCharacter(n"OC_STT_DIEGO");
            }
            
            AGothicCharacterState GetBullit() const property
            {
                return GetCharacter(n"OCR_GRD_BULLIT_203");
            }
            
            AGothicCharacterState GetXardas() const property
            {
                return GetCharacter(n"XT_DMB_XARDAS_404");
            }
        }
        
        
        class UChoiceCutscene105129 : UTopic_Hero__CUTSCENE_001_INTRO
        {
            default DebugId = int64(0x69035d432cb0968a);
            default Caption = LocText("TEXT_WIP_ZHVBVKG_20241012_011550_2083");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceCutscene167379);
            default Rules.HideIfKnows(UChoiceCutscene105129);
            
            default ExtraCharactersToInvite.Add(n"NARRATOR");
            default ExtraCharactersToInvite.Add(n"CUTSCENE_DUM_JUDGE_0");
            default ExtraCharactersToInvite.Add(n"CUTSCENE_DUM_MAGE_0");
            default ExtraCharactersToInvite.Add(n"OCR_GRD_BULLIT_203");
            default ExtraCharactersToInvite.Add(n"OC_STT_DIEGO");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xafd73db6eab3430a), EConversationDebugInfo::Executing);
                // Month after month, the king supplied everything the ...
                NARRATOR.AI.Say(LocText("TEXT_WIP_FEIRYVC_20250203_102915"));
                DC(int64(0xafd73db6eab3430a), EConversationDebugInfo::Done);
                DC(int64(0xf6aecc0f8876eea3), EConversationDebugInfo::Executing);
                // Month after month they brought the ore to the edge of ...
                NARRATOR.AI.Say(LocText("TEXT_WIP_YIEWCID_20251021_114722"));
                DC(int64(0xf6aecc0f8876eea3), EConversationDebugInfo::Done);
                DC(int64(0xafd73db6eab3430b), EConversationDebugInfo::Executing);
                // Until the present day.
                NARRATOR.AI.Say(LocText("TEXT_WIP_FEIRYVC_20250203_102939"));
                DC(int64(0xafd73db6eab3430b), EConversationDebugInfo::Done);
                DC(int64(0xf6aecc0f8876eea4), EConversationDebugInfo::Executing);
                // Another convict was brought to the cliff.
                NARRATOR.AI.Say(LocText("TEXT_WIP_YIEWCID_20251021_114753"));
                DC(int64(0xf6aecc0f8876eea4), EConversationDebugInfo::Done);
                DC(int64(0xf6aecc0f8876eea5), EConversationDebugInfo::Executing);
                // He did not know but he would change everything.
                NARRATOR.AI.Say(LocText("TEXT_WIP_YIEWCID_20251021_114759"));
                DC(int64(0xf6aecc0f8876eea5), EConversationDebugInfo::Done);
                DC(int64(0xafd73db6eab342fa), EConversationDebugInfo::Executing);
                
                // In the name of King Rhobar, the second bearer of the ...
                Judge.AI.Say(LocText("TEXT_WIP_FEIRYVC_20250203_101446"));
                DC(int64(0xafd73db6eab342fa), EConversationDebugInfo::Done);
                DC(int64(0x920c6d2c3c1e732d), EConversationDebugInfo::Executing);
                // I sentence this convict to...
                Judge.AI.Say(LocText("TEXT_WIP_KSNHEKD_20250507_020116"));
                DC(int64(0x920c6d2c3c1e732d), EConversationDebugInfo::Done);
                DC(int64(0xafd73db6eab342fb), EConversationDebugInfo::Executing);
                
                // Stop! 
                Mage.AI.Say(LocText("TEXT_WIP_FEIRYVC_20250203_101526"));
                DC(int64(0xafd73db6eab342fb), EConversationDebugInfo::Done);
                DC(int64(0x920c6d2c3c1e732e), EConversationDebugInfo::Executing);
                // Convict, I've got an offer to make you. 
                Mage.AI.Say(LocText("TEXT_WIP_KSNHEKD_20250507_020200"));
                DC(int64(0x920c6d2c3c1e732e), EConversationDebugInfo::Done);
                DC(int64(0x920c6d2c3c1e732f), EConversationDebugInfo::Executing);
                // This letter must reach the leader of the Magicians of ...
                Mage.AI.Say(LocText("TEXT_WIP_KSNHEKD_20250507_020214"));
                DC(int64(0x920c6d2c3c1e732f), EConversationDebugInfo::Done);
                DC(int64(0x69035d432cb09694), EConversationDebugInfo::Executing);
                
                // You are wasting your time! 
                Hero.AI.Say(LocText("TEXT_WIP_ZHVBVKG_20241012_012909"));
                DC(int64(0x69035d432cb09694), EConversationDebugInfo::Done);
                DC(int64(0xafd73db6eab342fc), EConversationDebugInfo::Executing);
                
                // You may choose your own reward.
                Mage.AI.Say(LocText("TEXT_WIP_FEIRYVC_20250203_101652"));
                DC(int64(0xafd73db6eab342fc), EConversationDebugInfo::Done);
                DC(int64(0x920c6d2c3c1e7330), EConversationDebugInfo::Executing);
                // They will give you anything you ask for.
                Mage.AI.Say(LocText("TEXT_WIP_KSNHEKD_20250507_020247"));
                DC(int64(0x920c6d2c3c1e7330), EConversationDebugInfo::Done);
                DC(int64(0x69035d432cb09696), EConversationDebugInfo::Executing);
                
                // Very well, I will take your letter... 
                Hero.AI.Say(LocText("TEXT_WIP_ZHVBVKG_20241012_012928"));
                DC(int64(0x69035d432cb09696), EConversationDebugInfo::Done);
                DC(int64(0x920c6d2c3c1e7331), EConversationDebugInfo::Executing);
                // ... on one condition...
                Hero.AI.Say(LocText("TEXT_WIP_KSNHEKD_20250507_020310"));
                DC(int64(0x920c6d2c3c1e7331), EConversationDebugInfo::Done);
                DC(int64(0x920c6d2c3c1e7332), EConversationDebugInfo::Executing);
                // Spare me the rest of his nonsense!
                Hero.AI.Say(LocText("TEXT_WIP_KSNHEKD_20250507_020314"));
                DC(int64(0x920c6d2c3c1e7332), EConversationDebugInfo::Done);
                DC(int64(0xafd73db6eab342fd), EConversationDebugInfo::Executing);
                
                // How dare you!
                Judge.AI.Say(LocText("TEXT_WIP_FEIRYVC_20250203_101709"));
                DC(int64(0xafd73db6eab342fd), EConversationDebugInfo::Done);
                DC(int64(0xafd73db6eab342fe), EConversationDebugInfo::Executing);
                
                // Keep silent!
                Mage.AI.Say(LocText("TEXT_WIP_FEIRYVC_20250203_101800"));
                DC(int64(0xafd73db6eab342fe), EConversationDebugInfo::Done);
                DC(int64(0xafd73db6eab342ff), EConversationDebugInfo::Executing);
                // Right, send him in!
                Mage.AI.Say(LocText("TEXT_WIP_FEIRYVC_20250203_101822"));
                DC(int64(0xafd73db6eab342ff), EConversationDebugInfo::Done);
                DC(int64(0x69035d432cb0969a), EConversationDebugInfo::Executing);
                
                // Aaahhhhhhhhhhhhhhhhhhhhhhhhhhhhh!
                Hero.AI.Say(LocText("TEXT_WIP_ZHVBVKG_20241012_012955"));
                DC(int64(0x69035d432cb0969a), EConversationDebugInfo::Done);
                DC(int64(0x69035d432cb0969b), EConversationDebugInfo::Executing);
                
                // Welcome to the Colony!
                Bullit.AI.Say(LocText("TEXT_WIP_ZHVBVKG_20241012_013006"));
                DC(int64(0x69035d432cb0969b), EConversationDebugInfo::Done);
                DC(int64(0x69035d432cb0969c), EConversationDebugInfo::Executing);
                
                // That's enough, leave him alone and now scram!
                Diego.AI.Say(LocText("TEXT_WIP_ZHVBVKG_20241012_013020"));
                DC(int64(0x69035d432cb0969c), EConversationDebugInfo::Done);
                DC(int64(0x69035d432cb0968d), EConversationDebugInfo::Executing);
                // Get up!
                Diego.AI.Say(LocText("TEXT_WIP_ZHVBVKG_20241012_012732"));
                DC(int64(0x69035d432cb0968d), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceCutscene167363 : UTopic_Hero__CUTSCENE_001_INTRO
        {
            default DebugId = int64(0x3c02c0b4999d8f34);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 3;
            
            default JustOne.Add(n"End");
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceCutscene105129);
            default Rules.HideIfKnows(UChoiceCutscene167363);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3c02c0b4999d8f33), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x3c02c0b4999d8f33), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceCutscene167379 : UTopic_Hero__CUTSCENE_001_INTRO
        {
            default DebugId = int64(0x3c02c0b4999d8f38);
            default Caption = LocText("TEXT_WIP_ITVKJJF_20240313_120929");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceCutscene167379);
            
            default ExtraCharactersToInvite.Add(n"NARRATOR");
            default ExtraCharactersToInvite.Add(n"CUTSCENE_DUM_KINGRHOBAR_0");
            default ExtraCharactersToInvite.Add(n"XT_DMB_XARDAS_404");
            default ExtraCharactersToInvite.Add(n"CHARACTER_DUM_GUARD_0");
            default ExtraCharactersToInvite.Add(n"OC_EBR_GOMEZ_100");
            default ExtraCharactersToInvite.Add(n"CUTSCENE_DUM_KINGADVISOR_0");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb73e4cb0101b0ba), EConversationDebugInfo::Executing);
                // The Kingdom of Myrtana, united by King Rhobar II.
                NARRATOR.AI.Say(LocText("TEXT_WIP_ITVKJJF_20240313_120929"));
                DC(int64(0xb73e4cb0101b0ba), EConversationDebugInfo::Done);
                DC(int64(0xb73e4cb0101b0bb), EConversationDebugInfo::Executing);
                // During the long years of his reign, he was able to ...
                NARRATOR.AI.Say(LocText("TEXT_WIP_ITVKJJF_20240313_121403"));
                DC(int64(0xb73e4cb0101b0bb), EConversationDebugInfo::Done);
                DC(int64(0xafd73db6eab342df), EConversationDebugInfo::Executing);
                
                // Enough, get me the damn mage!
                KingRhobar.AI.Say(LocText("TEXT_WIP_FEIRYVC_20250203_100853"));
                DC(int64(0xafd73db6eab342df), EConversationDebugInfo::Done);
                DC(int64(0x16bd4aedb2fe4a20), EConversationDebugInfo::Executing);
                // Uggh!
                KingRhobar.AI.Say(LocText("TEXT_WIP_DKPDOUC_20260303_012643"));
                DC(int64(0x16bd4aedb2fe4a20), EConversationDebugInfo::Done);
                DC(int64(0xb73e4cb0101b0bc), EConversationDebugInfo::Executing);
                
                // All except one. 
                NARRATOR.AI.Say(LocText("TEXT_WIP_ITVKJJF_20240313_121956"));
                DC(int64(0xb73e4cb0101b0bc), EConversationDebugInfo::Done);
                DC(int64(0xb73e4cb0101b0bd), EConversationDebugInfo::Executing);
                // The war against the Orcs took its toll and the prisoners ...
                NARRATOR.AI.Say(LocText("TEXT_WIP_ITVKJJF_20240313_122002"));
                DC(int64(0xb73e4cb0101b0bd), EConversationDebugInfo::Done);
                DC(int64(0xb73e4cb0101b0be), EConversationDebugInfo::Executing);
                //  The king needed swords for his army
                NARRATOR.AI.Say(LocText("TEXT_WIP_ITVKJJF_20240313_122003"));
                DC(int64(0xb73e4cb0101b0be), EConversationDebugInfo::Done);
                DC(int64(0xb73e4cb0101b0bf), EConversationDebugInfo::Executing);
                // and every man guilty of a crime no matter how ...
                NARRATOR.AI.Say(LocText("TEXT_WIP_ITVKJJF_20240313_122004"));
                DC(int64(0xb73e4cb0101b0bf), EConversationDebugInfo::Done);
                DC(int64(0xb73e4cb0101b0c0), EConversationDebugInfo::Executing);
                // To make it impossible for them to escape, the King sent ...
                NARRATOR.AI.Say(LocText("TEXT_WIP_ITVKJJF_20240313_122005"));
                DC(int64(0xb73e4cb0101b0c0), EConversationDebugInfo::Done);
                DC(int64(0xb73e4cb0101b0c1), EConversationDebugInfo::Executing);
                // I was one of them.
                NARRATOR.AI.Say(LocText("TEXT_WIP_ITVKJJF_20240313_122005_41"));
                DC(int64(0xb73e4cb0101b0c1), EConversationDebugInfo::Done);
                DC(int64(0xdbe591605dc7b687), EConversationDebugInfo::Executing);
                
                // (effort sound casting a mighty magic spell)
                Xardas.AI.Say(LocText("TEXT_WIP_JEIRYVC_20250207_021220"));
                DC(int64(0xdbe591605dc7b687), EConversationDebugInfo::Done);
                DC(int64(0xb73e4cb0101b0c2), EConversationDebugInfo::Executing);
                
                // Ah, something disturbed the delicate structure of magic.
                NARRATOR.AI.Say(LocText("TEXT_WIP_ITVKJJF_20240313_122136"));
                DC(int64(0xb73e4cb0101b0c2), EConversationDebugInfo::Done);
                DC(int64(0x16bd4aedb2fe4a21), EConversationDebugInfo::Executing);
                // We were trapped inside our own barrier.
                NARRATOR.AI.Say(LocText("TEXT_WIP_DKPDOUC_20260303_012848"));
                DC(int64(0x16bd4aedb2fe4a21), EConversationDebugInfo::Done);
                DC(int64(0xafd73db6eab34300), EConversationDebugInfo::Executing);
                // During the years there were many attempts to open the ...
                NARRATOR.AI.Say(LocText("TEXT_WIP_FEIRYVC_20250203_102654"));
                DC(int64(0xafd73db6eab34300), EConversationDebugInfo::Done);
                DC(int64(0xb73e4cb0101b0c3), EConversationDebugInfo::Executing);
                // One second of negligence was enough for the prisoners.
                NARRATOR.AI.Say(LocText("TEXT_WIP_ITVKJJF_20240313_122138"));
                DC(int64(0xb73e4cb0101b0c3), EConversationDebugInfo::Done);
                DC(int64(0xafd73db6eab342e9), EConversationDebugInfo::Executing);
                
                // Wait a second, we don't have to...
                Guard.AI.Say(LocText("TEXT_WIP_FEIRYVC_20250203_101235"));
                DC(int64(0xafd73db6eab342e9), EConversationDebugInfo::Done);
                DC(int64(0xdaa24e1da728fa76), EConversationDebugInfo::Executing);
                
                // The valley of mines was now under the control of the ...
                NARRATOR.AI.Say(LocText("TEXT_WIP_INRSZMD_20250529_205434"));
                DC(int64(0xdaa24e1da728fa76), EConversationDebugInfo::Done);
                DC(int64(0xb73e4cb0101b0c4), EConversationDebugInfo::Executing);
                // The king had no choice. He had to negotiate. He needed ...
                NARRATOR.AI.Say(LocText("TEXT_WIP_ITVKJJF_20240313_122138_2083"));
                DC(int64(0xb73e4cb0101b0c4), EConversationDebugInfo::Done);
                DC(int64(0xafd73db6eab2bd91), EConversationDebugInfo::Executing);
                
                // We got him by the balls. He has to pay it!
                Gomez.AI.Say(LocText("TEXT_WIP_FEIRYVC_20250203_032944"));
                DC(int64(0xafd73db6eab2bd91), EConversationDebugInfo::Done);
                DC(int64(0xafd73db6eab34309), EConversationDebugInfo::Executing);
                
                // By Innos, this is extortion!
                KingAdvisor.AI.Say(LocText("TEXT_WIP_FEIRYVC_20250203_102823"));
                DC(int64(0xafd73db6eab34309), EConversationDebugInfo::Done);
                DC(int64(0xafd73db6eab342e0), EConversationDebugInfo::Executing);
                
                // We just need that ore!
                KingRhobar.AI.Say(LocText("TEXT_WIP_FEIRYVC_20250203_101025"));
                DC(int64(0xafd73db6eab342e0), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */