#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_SC_GUR_BAALORUN_1209 : UConversationCharacterSettings
        {
            default ForCharacter = n"SC_GUR_BAALORUN_1209";
        }
        
        
        class UTopic_Hero__SC_GUR_BAALORUN_1209 : UG1RDialogTopic
        {
            default ForCharacter = n"SC_GUR_BAALORUN_1209";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetBaalOrun() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"hero");
            }
            
            AGothicCharacterState GetCaine() const property
            {
                return GetCharacter(n"SC_NOV_CAINE_1301");
            }
        }
        
        
        class UChoiceBaalorun131138 : UTopic_Hero__SC_GUR_BAALORUN_1209
        {
            default DebugId = int64(0xd577347741a10681);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceBaalorun131138);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xd577347741a10684), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Templar));
                    DB(int64(0xd577347741a106e5), Hero != nullptr && Hero.IsInConversation());
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Templar))
                    return false;
                
                if (Hero != nullptr && !Hero.IsInConversation())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd577347741a10680), EConversationDebugInfo::Executing);
                // Ah. There you are. 
                BaalOrun.AI.Say(LocText("TEXT_WIP_QKQHPDM_20241213_155545_1723"));
                DC(int64(0xd577347741a10680), EConversationDebugInfo::Done);
                DC(int64(0xd4b448ade3c662f7), EConversationDebugInfo::Executing);
                
                // You wanted to see me? 
                Hero.AI.Say(LocText("TEXT_WIP_APMSWZD_20241219_143505"));
                DC(int64(0xd4b448ade3c662f7), EConversationDebugInfo::Done);
                DC(int64(0xd577347741a106e4), EConversationDebugInfo::Executing);
                
                // I did indeed. I must say, your path has been an ...
                BaalOrun.AI.Say(LocText("TEXT_WIP_QKQHPDM_20241213_163546"));
                DC(int64(0xd577347741a106e4), EConversationDebugInfo::Done);
                DC(int64(0xd4b448ade3c662fa), EConversationDebugInfo::Executing);
                // Suffice it to say, it's not what I expected when I first ...
                BaalOrun.AI.Say(LocText("TEXT_WIP_APMSWZD_20241219_143722"));
                DC(int64(0xd4b448ade3c662fa), EConversationDebugInfo::Done);
                DC(int64(0xd577347741a10689), EConversationDebugInfo::Executing);
                // Anyway. I will get to the point. Cor Kalom's departure ...
                BaalOrun.AI.Say(LocText("TEXT_WIP_QKQHPDM_20241213_161208"));
                DC(int64(0xd577347741a10689), EConversationDebugInfo::Done);
                DC(int64(0xd4b448ade3c662fb), EConversationDebugInfo::Executing);
                // Now that he's gone, that task falls to me. 
                BaalOrun.AI.Say(LocText("TEXT_WIP_APMSWZD_20241219_143906"));
                DC(int64(0xd4b448ade3c662fb), EConversationDebugInfo::Done);
                DC(int64(0xd577347741a1068a), EConversationDebugInfo::Executing);
                
                // And? 
                Hero.AI.Say(LocText("TEXT_WIP_QKQHPDM_20241213_161225"));
                DC(int64(0xd577347741a1068a), EConversationDebugInfo::Done);
                DC(int64(0xd4b448ade3c66300), EConversationDebugInfo::Executing);
                
                // And I believe we'll have to expand if we are to sustain ...
                BaalOrun.AI.Say(LocText("TEXT_WIP_APMSWZD_20241219_144003"));
                DC(int64(0xd4b448ade3c66300), EConversationDebugInfo::Done);
                DC(int64(0xd577347741a1068b), EConversationDebugInfo::Executing);
                // There's a group of outlaws that have broken from the ...
                BaalOrun.AI.Say(LocText("TEXT_WIP_QKQHPDM_20241213_161226"));
                DC(int64(0xd577347741a1068b), EConversationDebugInfo::Done);
                DC(int64(0xd4b448ade3c66301), EConversationDebugInfo::Executing);
                
                // You want me to bring them your offer.
                Hero.AI.Say(LocText("TEXT_WIP_APMSWZD_20241219_144207"));
                DC(int64(0xd4b448ade3c66301), EConversationDebugInfo::Done);
                DC(int64(0xd577347741a1068c), EConversationDebugInfo::Executing);
                
                // Correct. 
                BaalOrun.AI.Say(LocText("TEXT_WIP_QKQHPDM_20241213_161240"));
                DC(int64(0xd577347741a1068c), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_GUR_BAALORUN, Document::UDocumentSegment_Glossary_SC_GUR_BAALORUN_NewLeader);
            }
        }
        
        
        class UChoiceBaalorun131281 : UTopic_Hero__SC_GUR_BAALORUN_1209
        {
            default DebugId = int64(0xd577347741a106a1);
            default Caption = LocText("TEXT_WIP_QKQHPDM_20241213_161329_1702");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBaalorun131138);
            default Rules.HideIfKnows(UChoiceBaalorun131281);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd577347741a10690), EConversationDebugInfo::Executing);
                // Why send me? 
                Hero.AI.Say(LocText("TEXT_WIP_QKQHPDM_20241213_161329_1702"));
                DC(int64(0xd577347741a10690), EConversationDebugInfo::Done);
                DC(int64(0xd577347741a10697), EConversationDebugInfo::Executing);
                
                // Do you really need an answer to that? 
                BaalOrun.AI.Say(LocText("TEXT_WIP_QKQHPDM_20241213_161334"));
                DC(int64(0xd577347741a10697), EConversationDebugInfo::Done);
                DC(int64(0xd4b448ade3c66302), EConversationDebugInfo::Executing);
                
                // Because I get things done?
                Hero.AI.Say(LocText("TEXT_WIP_APMSWZD_20241219_144300"));
                DC(int64(0xd4b448ade3c66302), EConversationDebugInfo::Done);
                DC(int64(0xd577347741a10698), EConversationDebugInfo::Executing);
                
                // Correct. Not to mention that it's crystal clear where ...
                BaalOrun.AI.Say(LocText("TEXT_WIP_QKQHPDM_20241213_161358"));
                DC(int64(0xd577347741a10698), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBaalorun131286 : UTopic_Hero__SC_GUR_BAALORUN_1209
        {
            default DebugId = int64(0xd577347741a106a3);
            default Caption = LocText("TEXT_WIP_QKQHPDM_20241213_161431_2650");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBaalorun131138);
            default Rules.HideIfKnows(UChoiceBaalorun131286);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd577347741a1069c), EConversationDebugInfo::Executing);
                
                // Where can I find those bandits exactly? 
                Hero.AI.Say(LocText("TEXT_WIP_QKQHPDM_20241213_161431_2650"));
                DC(int64(0xd577347741a1069c), EConversationDebugInfo::Done);
                DC(int64(0xd577347741a1069f), EConversationDebugInfo::Executing);
                
                // Like I said, they are up in the mountains. Just follow ...
                BaalOrun.AI.Say(LocText("TEXT_WIP_QKQHPDM_20241213_161448"));
                DC(int64(0xd577347741a1069f), EConversationDebugInfo::Done);
                DC(int64(0xd577347741a106a0), EConversationDebugInfo::Executing);
                // But be careful. They are distrustful, and they won't ...
                BaalOrun.AI.Say(LocText("TEXT_WIP_QKQHPDM_20241213_161457"));
                DC(int64(0xd577347741a106a0), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_SCBANDITSCAMP, Document::UDocumentSegment_CH3_SCBANDITSCAMP_Location);
            }
        }
        
        
        class UChoiceBaalorun131306 : UTopic_Hero__SC_GUR_BAALORUN_1209
        {
            default DebugId = int64(0xd577347741a106a7);
            default Caption = LocText("TEXT_WIP_QKQHPDM_20241213_162127");
            default PriorityRank = 2;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBaalorun131138);
            default Rules.HideIfKnows(UChoiceBaalorun131306);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd577347741a106a5), EConversationDebugInfo::Executing);
                // What's the deal with these outlaws? 
                Hero.AI.Say(LocText("TEXT_WIP_QKQHPDM_20241213_162127"));
                DC(int64(0xd577347741a106a5), EConversationDebugInfo::Done);
                DC(int64(0xd577347741a106a6), EConversationDebugInfo::Executing);
                
                // Frankly, I'm not too familiar with them. From what I've ...
                BaalOrun.AI.Say(LocText("TEXT_WIP_QKQHPDM_20241213_162127_1661"));
                DC(int64(0xd577347741a106a6), EConversationDebugInfo::Done);
                DC(int64(0xd577347741a106a9), EConversationDebugInfo::Executing);
                // Their leader is a man called Quentin, and he has somehow ...
                BaalOrun.AI.Say(LocText("TEXT_WIP_QKQHPDM_20241213_162155"));
                DC(int64(0xd577347741a106a9), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBaalorun131332 : UTopic_Hero__SC_GUR_BAALORUN_1209
        {
            default DebugId = int64(0xd577347741a106ac);
            default Caption = LocText("TEXT_WIP_QKQHPDM_20241213_162239");
            default PriorityRank = 4;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBaalorun131138);
            default Rules.HideIfKnows(UChoiceBaalorun131332);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd577347741a106aa), EConversationDebugInfo::Executing);
                
                // I'll handle it. 
                Hero.AI.Say(LocText("TEXT_WIP_QKQHPDM_20241213_162239"));
                DC(int64(0xd577347741a106aa), EConversationDebugInfo::Done);
                DC(int64(0xd4b448ade3c66310), EConversationDebugInfo::Executing);
                
                // I'll trust you will.
                BaalOrun.AI.Say(LocText("TEXT_WIP_APMSWZD_20241219_145544"));
                DC(int64(0xd4b448ade3c66310), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_SCBANDITSCAMP, Document::UDocumentSegment_CH3_SCBANDITSCAMP_Start);
                DC(int64(0xd577347741a10686), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER3_SCBANDITSCAMP.StartQuest();
                DC(int64(0xd577347741a10686), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBaalorun131364 : UTopic_Hero__SC_GUR_BAALORUN_1209
        {
            default DebugId = int64(0xd577347741a106b0);
            default Caption = LocText("TEXT_WIP_QKQHPDM_20241213_162515");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceBaalorun131364);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_BSWYRII_20250113_151152"), int64(0xd577347741a106b0));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd577347741a106ae), EConversationDebugInfo::Executing);
                // I spoke with the bandits. Quentin agreed to the deal. 
                Hero.AI.Say(LocText("TEXT_WIP_QKQHPDM_20241213_162515"));
                DC(int64(0xd577347741a106ae), EConversationDebugInfo::Done);
                DC(int64(0xd577347741a106af), EConversationDebugInfo::Executing);
                
                // He did? That's excellent. I must say, I wasn't certain ...
                BaalOrun.AI.Say(LocText("TEXT_WIP_QKQHPDM_20241213_162515_3615"));
                DC(int64(0xd577347741a106af), EConversationDebugInfo::Done);
                DC(int64(0xd577347741a106b4), EConversationDebugInfo::Executing);
                
                // What happens next?
                Hero.AI.Say(LocText("TEXT_WIP_QKQHPDM_20241213_162756"));
                DC(int64(0xd577347741a106b4), EConversationDebugInfo::Done);
                DC(int64(0xd577347741a106b5), EConversationDebugInfo::Executing);
                
                // I'll dispatch a group of templars to oversee the ...
                BaalOrun.AI.Say(LocText("TEXT_WIP_QKQHPDM_20241213_162758"));
                DC(int64(0xd577347741a106b5), EConversationDebugInfo::Done);
                DC(int64(0xd4b448ade3c66316), EConversationDebugInfo::Executing);
                // Either way, this is a crucial step in maintaining our ...
                BaalOrun.AI.Say(LocText("TEXT_WIP_APMSWZD_20241219_150131"));
                DC(int64(0xd4b448ade3c66316), EConversationDebugInfo::Done);
                DC(int64(0xd577347741a106b6), EConversationDebugInfo::Executing);
                // Take this reward as a token of my gratitude. 
                BaalOrun.AI.Say(LocText("TEXT_WIP_QKQHPDM_20241213_162843"));
                DC(int64(0xd577347741a106b6), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_SCBANDITSCAMP, Document::UDocumentSegment_CH3_SCBANDITSCAMP_Completed);
                DC(int64(0xcbe41b81f2725efd), EConversationDebugInfo::Executing);
                BaalOrun.AddItemToInventory(UItMi_Orenugget, 100);
                DC(int64(0xcbe41b81f2725efd), EConversationDebugInfo::Done);
                DC(int64(0xd577347741a106b8), EConversationDebugInfo::Executing);
                BaalOrun.AI.GiveItemTo(Hero, UItMi_Orenugget, 100);
                DC(int64(0xd577347741a106b8), EConversationDebugInfo::Done);
                DC(int64(0xd577347741a106e7), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER3_SCBANDITSCAMP_SCBANDITSCAMP_OBJ_REPORT.SucceedQuest();
                DC(int64(0xd577347741a106e7), EConversationDebugInfo::Done);
                DC(int64(0x56529d3224c732f4), EConversationDebugInfo::Executing);
                Hero.GiveExperience(1000);
                DC(int64(0x56529d3224c732f4), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBaalorun134478 : UTopic_Hero__SC_GUR_BAALORUN_1209
        {
            default DebugId = int64(0xd4b448ade3c662fe);
            default Caption = LocText("TEXT_WIP_APMSWZD_20241219_143940");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBaalorun131138);
            default Rules.HideIfKnows(UChoiceBaalorun134478);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd4b448ade3c662fc), EConversationDebugInfo::Executing);
                // What do you make of what happened? Y'Berion's death, ...
                Hero.AI.Say(LocText("TEXT_WIP_APMSWZD_20241219_143940"));
                DC(int64(0xd4b448ade3c662fc), EConversationDebugInfo::Done);
                DC(int64(0xd4b448ade3c662fd), EConversationDebugInfo::Executing);
                
                // (deep sigh) Truth be told? I don't know. What I do know, ...
                BaalOrun.AI.Say(LocText("TEXT_WIP_APMSWZD_20241219_143940_41"));
                DC(int64(0xd4b448ade3c662fd), EConversationDebugInfo::Done);
                DC(int64(0xd4b448ade3c66311), EConversationDebugInfo::Executing);
                // He made me see the Sleeper and his glory, and he kept us ...
                BaalOrun.AI.Say(LocText("TEXT_WIP_APMSWZD_20241219_145659"));
                DC(int64(0xd4b448ade3c66311), EConversationDebugInfo::Done);
                DC(int64(0xd4b448ade3c66312), EConversationDebugInfo::Executing);
                // My point is, he was a true leader, and Cor Kalom, for ...
                BaalOrun.AI.Say(LocText("TEXT_WIP_APMSWZD_20241219_145720"));
                DC(int64(0xd4b448ade3c66312), EConversationDebugInfo::Done);
                DC(int64(0xd4b448ade3c66314), EConversationDebugInfo::Executing);
                
                // So you believe the Sleeper is a demon? 
                Hero.AI.Say(LocText("TEXT_WIP_APMSWZD_20241219_145941"));
                DC(int64(0xd4b448ade3c66314), EConversationDebugInfo::Done);
                DC(int64(0xd4b448ade3c66313), EConversationDebugInfo::Executing);
                
                // ... I don't know what I believe anymore. I will ...
                BaalOrun.AI.Say(LocText("TEXT_WIP_APMSWZD_20241219_145842"));
                DC(int64(0xd4b448ade3c66313), EConversationDebugInfo::Done);
                DC(int64(0xd4b448ade3c66315), EConversationDebugInfo::Executing);
                // Answers will come. 
                BaalOrun.AI.Say(LocText("TEXT_WIP_APMSWZD_20241219_150023"));
                DC(int64(0xd4b448ade3c66315), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBaalorun135517 : UTopic_Hero__SC_GUR_BAALORUN_1209
        {
            default DebugId = int64(0xd4b448ade3c66305);
            default Caption = LocText("TEXT_WIP_APMSWZD_20241219_144402");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBaalorun131281);
            default Rules.HideIfKnows(UChoiceBaalorun135517);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd4b448ade3c66303), EConversationDebugInfo::Executing);
                
                // What kind of deal are you proposing?
                Hero.AI.Say(LocText("TEXT_WIP_APMSWZD_20241219_144402"));
                DC(int64(0xd4b448ade3c66303), EConversationDebugInfo::Done);
                DC(int64(0xd4b448ade3c66304), EConversationDebugInfo::Executing);
                
                // The same arrangement we have with the men from the New ...
                BaalOrun.AI.Say(LocText("TEXT_WIP_APMSWZD_20241219_144402_2238"));
                DC(int64(0xd4b448ade3c66304), EConversationDebugInfo::Done);
                DC(int64(0xd4b448ade3c66307), EConversationDebugInfo::Executing);
                // We supply them with swampweed, which they can in turn ...
                BaalOrun.AI.Say(LocText("TEXT_WIP_APMSWZD_20241219_144434"));
                DC(int64(0xd4b448ade3c66307), EConversationDebugInfo::Done);
                DC(int64(0xd4b448ade3c66308), EConversationDebugInfo::Executing);
                // How they do it is up to their leader. 
                BaalOrun.AI.Say(LocText("TEXT_WIP_APMSWZD_20241219_144457"));
                DC(int64(0xd4b448ade3c66308), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBaalorun135930 : UTopic_Hero__SC_GUR_BAALORUN_1209
        {
            default DebugId = int64(0xd4b448ade3c6630b);
            default Caption = LocText("TEXT_WIP_APMSWZD_20241219_144551");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBaalorun131138);
            default Rules.HideIfKnows(UChoiceBaalorun135930);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd4b448ade3c66309), EConversationDebugInfo::Executing);
                
                // What if they refuse? 
                Hero.AI.Say(LocText("TEXT_WIP_APMSWZD_20241219_144551"));
                DC(int64(0xd4b448ade3c66309), EConversationDebugInfo::Done);
                DC(int64(0xd4b448ade3c6630a), EConversationDebugInfo::Executing);
                
                // Then you'll have to remind them why our Brotherhood can ...
                BaalOrun.AI.Say(LocText("TEXT_WIP_APMSWZD_20241219_144551_2785"));
                DC(int64(0xd4b448ade3c6630a), EConversationDebugInfo::Done);
                DC(int64(0xd4b448ade3c6630d), EConversationDebugInfo::Executing);
                // Or a dangerous foe ... 
                BaalOrun.AI.Say(LocText("TEXT_WIP_APMSWZD_20241219_144624"));
                DC(int64(0xd4b448ade3c6630d), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBaalorunExit : UTopic_Hero__SC_GUR_BAALORUN_1209
        {
            default DebugId = int64(0xb77b651f8815e7ce);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb77b651f8815e7cf), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xb77b651f8815e7cf), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceBaalorunFirsttalk : UTopic_Hero__SC_GUR_BAALORUN_1209
        {
            default DebugId = int64(0xb77b651f8815e7e4);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceBaalorunFirsttalk);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xb7340001a5e350d4), Quest::SwampCamp_SCCHAPTER1_GHORIMSRELIEF != nullptr && Quest::SwampCamp_SCCHAPTER1_GHORIMSRELIEF.HasSucceeded());
                    DB(int64(0x646f6c8d1ce49636), G1R != nullptr && !G1R.HasReachedChapter(2));
                }
                
                if (Quest::SwampCamp_SCCHAPTER1_GHORIMSRELIEF != nullptr && !Quest::SwampCamp_SCCHAPTER1_GHORIMSRELIEF.HasSucceeded())
                    return false;
                
                if (G1R != nullptr && G1R.HasReachedChapter(2))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb77b651f8815e7e6), EConversationDebugInfo::Executing);
                // Stranger. Ghorim told me what you did for him - well ...
                BaalOrun.AI.Say(LocText("DIA_BAALORUN_FIRSTTALK_12_00"));
                DC(int64(0xb77b651f8815e7e6), EConversationDebugInfo::Done);
                DC(int64(0xb77b651f8815e7e7), EConversationDebugInfo::Executing);
                // I assume you are looking to join us. 
                BaalOrun.AI.Say(LocText("DIA_BAALORUN_FIRSTTALK_12_01"));
                DC(int64(0xb77b651f8815e7e7), EConversationDebugInfo::Done);
                DC(int64(0xb77b651f8815e7e8), EConversationDebugInfo::Executing);
                // This is why I'm giving you a chance to prove your worth ...
                BaalOrun.AI.Say(LocText("DIA_BAALORUN_FIRSTTALK_12_02"));
                DC(int64(0xb77b651f8815e7e8), EConversationDebugInfo::Done);
                DC(int64(0xb77b651f8815e7e9), EConversationDebugInfo::Executing);
                // Our harvesters out in the bog should have a delivery ...
                BaalOrun.AI.Say(LocText("DIA_BAALORUN_FIRSTTALK_12_03"));
                DC(int64(0xb77b651f8815e7e9), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_JOINPSI, Document::UDocumentSegment_CH1_JOINPSI_OrunTrick);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_DELIVERWEED, Document::UDocumentSegment_CH1_DELIVERWEED_Start);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_GUR_BAALORUN, Document::UDocumentSegment_Glossary_SC_GUR_BAALORUN_Introduction);
                DC(int64(0x281bfa5ab8fe1d7), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER1_DELIVERWEED.StartQuest();
                DC(int64(0x281bfa5ab8fe1d7), EConversationDebugInfo::Done);
                DC(int64(0x138d345a7dba4c20), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER1_JOINPSI_JOINPSI_OBJ_ORUN.StartQuest();
                DC(int64(0x138d345a7dba4c20), EConversationDebugInfo::Done);
                Subdialog(
                    UChoiceBaalorunFirsttalkMuteende,
                    UChoiceBaalorunFirsttalkWhere
                );
            }
        }
        
        
        class UChoiceBaalorunFirsttalkMuteende : UTopic_Hero__SC_GUR_BAALORUN_1209
        {
            default DebugId = int64(0xe8603e87342bf2be);
            default Caption = LocText("TEXT_CHOICE_BAALORUN_FIRSTTALK_MUTEENDE");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x281bfa5ab8fe1ca), EConversationDebugInfo::Executing);
                G1R.BaalOrun_responsive = 0;
                DC(int64(0x281bfa5ab8fe1ca), EConversationDebugInfo::Done);
                DC(int64(0xb77b651f8815e7f0), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xb77b651f8815e7f0), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceBaalorunFirsttalkWhere : UTopic_Hero__SC_GUR_BAALORUN_1209
        {
            default DebugId = int64(0xe8603e87342bf2c2);
            default Caption = LocText("DIA_BAALORUN_FIRSTTALK_WHERE_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb77b651f8815e7f2), EConversationDebugInfo::Executing);
                // Where do I find these harvesters?
                Hero.AI.Say(LocText("DIA_BAALORUN_FIRSTTALK_WHERE_15_00"));
                DC(int64(0xb77b651f8815e7f2), EConversationDebugInfo::Done);
                DC(int64(0xb77b651f8815e7f3), EConversationDebugInfo::Executing);
                
                // Have I given you permission to address me?
                BaalOrun.AI.Say(LocText("DIA_BAALORUN_FIRSTTALK_WHERE_12_01"));
                DC(int64(0xb77b651f8815e7f3), EConversationDebugInfo::Done);
                DC(int64(0xb77b651f8815e7f4), EConversationDebugInfo::Executing);
                // May the Sleeper forgive you for this blunder. As for ...
                BaalOrun.AI.Say(LocText("DIA_BAALORUN_FIRSTTALK_WHERE_12_02"));
                DC(int64(0xb77b651f8815e7f4), EConversationDebugInfo::Done);
                DC(int64(0x5dcd7126285f528), EConversationDebugInfo::Executing);
                // Now go. This mission is of utmost importance.
                BaalOrun.AI.Say(LocText("TEXT_WIP_DDCKZPD_20241106_132907"));
                DC(int64(0x5dcd7126285f528), EConversationDebugInfo::Done);
                DC(int64(0x281bfa5ab8fe1cf), EConversationDebugInfo::Executing);
                G1R.BaalOrun_responsive = 0;
                DC(int64(0x281bfa5ab8fe1cf), EConversationDebugInfo::Done);
                DC(int64(0xb77b651f8815e7f6), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xb77b651f8815e7f6), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceBaalorunGotweed : UTopic_Hero__SC_GUR_BAALORUN_1209
        {
            default DebugId = int64(0xb77b651f8815e7f7);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceBaalorunGotweed);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xb77b651f8815e7f8), Quest::VIRAN_BLOODFLIES != nullptr && Quest::VIRAN_BLOODFLIES.HasSucceeded());
                    DB(int64(0x646f6c8d1ce49637), G1R != nullptr && !G1R.HasReachedChapter(2));
                }
                
                if (Quest::VIRAN_BLOODFLIES != nullptr && !Quest::VIRAN_BLOODFLIES.HasSucceeded())
                    return false;
                
                if (G1R != nullptr && G1R.HasReachedChapter(2))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb77b651f8815e7f9), EConversationDebugInfo::Executing);
                // So ... I heard you protected our harvesters. Well done. 
                BaalOrun.AI.Say(LocText("DIA_BAALORUN_GOTWEED_12_00"));
                DC(int64(0xb77b651f8815e7f9), EConversationDebugInfo::Done);
                DC(int64(0xb77b651f8815e7fa), EConversationDebugInfo::Executing);
                // You not only proved that you are on our side, but also ...
                BaalOrun.AI.Say(LocText("DIA_BAALORUN_GOTWEED_12_01"));
                DC(int64(0xb77b651f8815e7fa), EConversationDebugInfo::Done);
                DC(int64(0xb77b651f8815e7fb), EConversationDebugInfo::Executing);
                // We need men like you. If Cor Kalom asks me, I will give ...
                BaalOrun.AI.Say(LocText("DIA_BAALORUN_GOTWEED_12_02"));
                DC(int64(0xb77b651f8815e7fb), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_JOINPSI, Document::UDocumentSegment_CH1_JOINPSI_OrunImpressed);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_GUR_BAALORUN, Document::UDocumentSegment_Glossary_SC_GUR_BAALORUN_Introduction);
                DC(int64(0x281bfa5ab8fe1e7), EConversationDebugInfo::Executing);
                G1R.BaalOrun_responsive = 1;
                DC(int64(0x281bfa5ab8fe1e7), EConversationDebugInfo::Done);
                DC(int64(0x1a34e2931ab9db9f), EConversationDebugInfo::Executing);
                G1R.Kalom_Counter += 1;
                DC(int64(0x1a34e2931ab9db9f), EConversationDebugInfo::Done);
                DC(int64(0x138d345a7dba4c9b), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER1_JOINPSI_JOINPSI_OBJ_ORUN.SucceedQuest();
                DC(int64(0x138d345a7dba4c9b), EConversationDebugInfo::Done);
                DB(int64(0x1a34e2931ab9dba3), G1R.Kalom_Counter >= 2);
                DB(int64(0x1547dbe6d32bec7f), G1R.CaineVanished == 0);
                
                if (G1R.Kalom_Counter >= 2 && G1R.CaineVanished == 0)
                {
                    DC(int64(0x1a34e2931ab9dba5), EConversationDebugInfo::Executing);
                    if (ensure(IsValid(Caine))) { Caine.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Caine_1301_Dead); }
                    DC(int64(0x1a34e2931ab9dba5), EConversationDebugInfo::Done);
                    DC(int64(0x608d6fba46cd82e4), EConversationDebugInfo::Executing);
                    G1R.ActivateStoryDataLayer("FindingCaine");
                    DC(int64(0x608d6fba46cd82e4), EConversationDebugInfo::Done);
                    DC(int64(0x608d6fba46cd82e6), EConversationDebugInfo::Executing);
                    UWorldPointManager::Get().CallGlobalEvent(n"OnFindingCaine");
                    DC(int64(0x608d6fba46cd82e6), EConversationDebugInfo::Done);
                    DC(int64(0x1547dbe6d32bec7d), EConversationDebugInfo::Executing);
                    G1R.CaineVanished = 1;
                    DC(int64(0x1547dbe6d32bec7d), EConversationDebugInfo::Done);
                    DC(int64(0x28003880c3e01fb5), EConversationDebugInfo::Executing);
                    if (ensure(IsValid(Caine))) { Caine.NPCState.RemoveFromWorld(); }
                    DC(int64(0x28003880c3e01fb5), EConversationDebugInfo::Done);
                }
                DB(int64(0xb77b651f8815e7fe), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None))
                {
                    DC(int64(0x281bfa5ab8fe1e3), EConversationDebugInfo::Executing);
                    Quest::SwampCamp_SCCHAPTER1_JOINPSI.StartQuest();
                    DC(int64(0x281bfa5ab8fe1e3), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_baalorun_gotweed_exit_1");
                }
                else
                {
                    
                    Other.Remember(n"choice_baalorun_gotweed_exit_2");
                }
            }
        }
        
        
        class UChoiceBaalorunNotalk : UTopic_Hero__SC_GUR_BAALORUN_1209
        {
            default DebugId = int64(0xb77b651f8815e7d0);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xb77b651f8815e7d1), Hero != nullptr && Hero.IsInConversation());
                    DB(int64(0xb77b651f8815e7d2), G1R.BaalOrun_responsive == 0);
                    DB(int64(0xb77b651f8815e7d3), BaalOrun != nullptr && !BaalOrun.IsFriendlyTowards(Hero));
                    DB(int64(0xda6737a239ade7a7), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                }
                
                if (Hero != nullptr && !Hero.IsInConversation())
                    return false;
                
                if (G1R.BaalOrun_responsive != 0)
                    return false;
                
                if (BaalOrun != nullptr && BaalOrun.IsFriendlyTowards(Hero))
                    return false;
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_GUR_BAALORUN, Document::UDocumentSegment_Glossary_SC_GUR_BAALORUN_Introduction);
                DB(int64(0x14efdc7c8b96dc0e), Quest::SwampCamp_SCCHAPTER1_JOINPSI != nullptr && Quest::SwampCamp_SCCHAPTER1_JOINPSI.IsRunning());
                
                if (Quest::SwampCamp_SCCHAPTER1_JOINPSI != nullptr && Quest::SwampCamp_SCCHAPTER1_JOINPSI.IsRunning())
                {
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_GUR_BAALORUN, Document::UDocumentSegment_Glossary_SC_GUR_BAALORUN_Ignore);
                }
                Subdialog(
                    UChoiceBaalorunNotalkImp,
                    UChoiceBaalorunNotalkSleeper,
                    UChoiceBaalorunNotalkHi,
                    UBaalOrun_109833
                );
            }
        }
        
        
        class UChoiceBaalorunNotalkImp : UTopic_Hero__SC_GUR_BAALORUN_1209
        {
            default DebugId = int64(0xe8603e87342bf2a9);
            default Caption = LocText("DIA_BAALORUN_NOTALK_IMP_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb77b651f8815e7d6), EConversationDebugInfo::Executing);
                // How's it going, old man?
                Hero.AI.Say(LocText("DIA_BAALORUN_NOTALK_IMP_15_00"));
                DC(int64(0xb77b651f8815e7d6), EConversationDebugInfo::Done);
                DC(int64(0xb77b651f8815e7d7), EConversationDebugInfo::Executing);
                
                // (disappointed sigh)
                BaalOrun.AI.Say(LocText("DIA_BAALORUN_NOTALK_IMP_12_01"));
                DC(int64(0xb77b651f8815e7d7), EConversationDebugInfo::Done);
                DC(int64(0x281bfa5ab8fe1f1), EConversationDebugInfo::Executing);
                G1R.BaalOrun_Sacrilege = 1;
                DC(int64(0x281bfa5ab8fe1f1), EConversationDebugInfo::Done);
                DC(int64(0xb77b651f8815e7d9), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xb77b651f8815e7d9), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBaalorunNotalkSleeper : UTopic_Hero__SC_GUR_BAALORUN_1209
        {
            default DebugId = int64(0xe8603e87342bf2af);
            default Caption = LocText("DIA_BAALORUN_NOTALK_SLEEPER_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb77b651f8815e7db), EConversationDebugInfo::Executing);
                // May the Sleeper be with you.
                Hero.AI.Say(LocText("DIA_BAALORUN_NOTALK_SLEEPER_15_00"));
                DC(int64(0xb77b651f8815e7db), EConversationDebugInfo::Done);
                DC(int64(0xb77b651f8815e7dc), EConversationDebugInfo::Executing);
                
                // (disappointed sigh)
                BaalOrun.AI.Say(LocText("DIA_BAALORUN_NOTALK_SLEEPER_12_01"));
                DC(int64(0xb77b651f8815e7dc), EConversationDebugInfo::Done);
                DC(int64(0x281bfa5ab8fe1f8), EConversationDebugInfo::Executing);
                G1R.BaalOrun_Sacrilege = 1;
                DC(int64(0x281bfa5ab8fe1f8), EConversationDebugInfo::Done);
                DC(int64(0xb77b651f8815e7de), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xb77b651f8815e7de), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBaalorunNotalkHi : UTopic_Hero__SC_GUR_BAALORUN_1209
        {
            default DebugId = int64(0xe8603e87342bf2b5);
            default Caption = LocText("DIA_BAALORUN_NOTALK_HI_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb77b651f8815e7e0), EConversationDebugInfo::Executing);
                // Hi there! I'm new to the Colony.
                Hero.AI.Say(LocText("DIA_BAALORUN_NOTALK_HI_15_00"));
                DC(int64(0xb77b651f8815e7e0), EConversationDebugInfo::Done);
                DC(int64(0xb77b651f8815e7e1), EConversationDebugInfo::Executing);
                
                // (disappointed sigh)
                BaalOrun.AI.Say(LocText("DIA_BAALORUN_NOTALK_HI_12_01"));
                DC(int64(0xb77b651f8815e7e1), EConversationDebugInfo::Done);
                DC(int64(0x281bfa5ab8fe1ff), EConversationDebugInfo::Executing);
                G1R.BaalOrun_Sacrilege = 1;
                DC(int64(0x281bfa5ab8fe1ff), EConversationDebugInfo::Done);
                DC(int64(0xb77b651f8815e7e3), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xb77b651f8815e7e3), EConversationDebugInfo::Done);
            }
        }
        
        
        class UBaalOrun_109833 : UTopic_Hero__SC_GUR_BAALORUN_1209
        {
            default DebugId = int64(0xd4543e68b8590846);
            default Caption = LocText("TEXT_WIP_DIIZCGC_20240913_102612_41");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd4543e68b8590847), EConversationDebugInfo::Executing);
                // I'll be going. 
                Hero.AI.Say(LocText("TEXT_WIP_DIIZCGC_20240913_102612_41"));
                DC(int64(0xd4543e68b8590847), EConversationDebugInfo::Done);
                DC(int64(0xd4543e68b859084c), EConversationDebugInfo::Executing);
                
                // (disappointed sigh)
                BaalOrun.AI.Say(LocText("DIA_BAALORUN_NOTALK_SLEEPER_12_01"));
                DC(int64(0xd4543e68b859084c), EConversationDebugInfo::Done);
                DC(int64(0x281bfa5ab8fe1ff), EConversationDebugInfo::Executing);
                G1R.BaalOrun_Sacrilege = 1;
                DC(int64(0x281bfa5ab8fe1ff), EConversationDebugInfo::Done);
                DC(int64(0xd4543e68b859084b), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xd4543e68b859084b), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceBaalorunPerm : UTopic_Hero__SC_GUR_BAALORUN_1209
        {
            default DebugId = int64(0xb77b651f8815e80a);
            default Caption = LocText("DIA_BAALORUN_PERM_15_00");
            default PriorityRank = 2;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xb77b651f8815e80b), Quest::SwampCamp_SCCHAPTER1_DELIVERWEED != nullptr && Quest::SwampCamp_SCCHAPTER1_DELIVERWEED.HasSucceeded());
                    DB(int64(0x4c84972ccb7578b2), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                    DB(int64(0x4c84972ccb7578b3), G1R != nullptr && !G1R.HasReachedChapter(3));
                    DB(int64(0xda6737a239ade7a8), G1R.BaalOrun_responsive != 0);
                }
                
                if (Quest::SwampCamp_SCCHAPTER1_DELIVERWEED != nullptr && !Quest::SwampCamp_SCCHAPTER1_DELIVERWEED.HasSucceeded())
                    return false;
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp))
                    return false;
                
                if (G1R != nullptr && G1R.HasReachedChapter(3))
                    return false;
                
                if (G1R.BaalOrun_responsive == 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb77b651f8815e80c), EConversationDebugInfo::Executing);
                // How's the production?
                Hero.AI.Say(LocText("DIA_BAALORUN_PERM_15_00"));
                DC(int64(0xb77b651f8815e80c), EConversationDebugInfo::Done);
                DC(int64(0x5dcd7126285f529), EConversationDebugInfo::Executing);
                
                // And once again, you speak to me unprompted. But I shall ...
                BaalOrun.AI.Say(LocText("TEXT_WIP_DDCKZPD_20241106_133101"));
                DC(int64(0x5dcd7126285f529), EConversationDebugInfo::Done);
                DC(int64(0xb77b651f8815e80d), EConversationDebugInfo::Executing);
                // It's demanding. The novices are pushing themselves to ...
                BaalOrun.AI.Say(LocText("DIA_BAALORUN_PERM_12_01"));
                DC(int64(0xb77b651f8815e80d), EConversationDebugInfo::Done);
                DC(int64(0xb77b651f8815e80e), EConversationDebugInfo::Executing);
                // But they know their sweat honors the Sleeper. And so the ...
                BaalOrun.AI.Say(LocText("DIA_BAALORUN_PERM_12_02"));
                DC(int64(0xb77b651f8815e80e), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBaalorunWeedatkaloms : UTopic_Hero__SC_GUR_BAALORUN_1209
        {
            default DebugId = int64(0xb77b651f8815e801);
            default Caption = LocText("DIA_BAALORUN_WEEDATKALOMS_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceBaalorunWeedatkaloms);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xb77b651f8815e802), Quest::SwampCamp_SCCHAPTER1_DELIVERWEED != nullptr && Quest::SwampCamp_SCCHAPTER1_DELIVERWEED.HasSucceeded());
                }
                
                return Quest::SwampCamp_SCCHAPTER1_DELIVERWEED != nullptr && Quest::SwampCamp_SCCHAPTER1_DELIVERWEED.HasSucceeded();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb77b651f8815e803), EConversationDebugInfo::Executing);
                
                // I brought Cor Kalom the swampweed. 
                Hero.AI.Say(LocText("DIA_BAALORUN_WEEDATKALOMS_15_00"));
                DC(int64(0xb77b651f8815e803), EConversationDebugInfo::Done);
                DC(int64(0xb77b651f8815e804), EConversationDebugInfo::Executing);
                
                // Well done. Here, a little reward for your efforts. 
                BaalOrun.AI.Say(LocText("DIA_BAALORUN_WEEDATKALOMS_12_01"));
                DC(int64(0xb77b651f8815e804), EConversationDebugInfo::Done);
                DC(int64(0xb77b651f8815e805), EConversationDebugInfo::Executing);
                // It is a scroll that will give you the power to put ...
                BaalOrun.AI.Say(LocText("DIA_BAALORUN_WEEDATKALOMS_12_02"));
                DC(int64(0xb77b651f8815e805), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_GUR_BAALORUN, Document::UDocumentSegment_Glossary_SC_GUR_BAALORUN_Introduction);
                DC(int64(0x281bfa5ab8fe20b), EConversationDebugInfo::Executing);
                G1R.BaalOrun_responsive = 1;
                DC(int64(0x281bfa5ab8fe20b), EConversationDebugInfo::Done);
                DC(int64(0x281bfa5ab8fe20d), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_SC_DELIVERWEED_REPORT);
                DC(int64(0x281bfa5ab8fe20d), EConversationDebugInfo::Done);
                DC(int64(0x281bfa5ab8fe20f), EConversationDebugInfo::Executing);
                BaalOrun.AddItemToInventory(UItAr_Scroll_Sleep, 1);
                DC(int64(0x281bfa5ab8fe20f), EConversationDebugInfo::Done);
                DC(int64(0x281bfa5ab8fe211), EConversationDebugInfo::Executing);
                BaalOrun.AI.GiveItemTo(Hero, UItAr_Scroll_Sleep, 1);
                DC(int64(0x281bfa5ab8fe211), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */