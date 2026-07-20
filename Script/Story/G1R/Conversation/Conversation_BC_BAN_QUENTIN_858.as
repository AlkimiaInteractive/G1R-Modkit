#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_BC_BAN_QUENTIN_858 : UConversationCharacterSettings
        {
            default ForCharacter = n"BC_BAN_QUENTIN_858";
        }
        
        
        class UTopic_Hero__BC_BAN_QUENTIN_858 : UG1RDialogTopic
        {
            default ForCharacter = n"BC_BAN_QUENTIN_858";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetQuentin() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetBandit() const property
            {
                return GetCharacter(n"BC_BAN_Arlin_852");
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceQuentin129340 : UTopic_Hero__BC_BAN_QUENTIN_858
        {
            default DebugId = int64(0xd577347741a104a4);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd577347741a104a3), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xd577347741a104a3), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceQuentin130346 : UTopic_Hero__BC_BAN_QUENTIN_858
        {
            default DebugId = int64(0xd577347741a10552);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceQuentin130346);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xd577347741a105f1), Quest::NewCamp_NCCHAPTER3_NCBANDITSCAMP != nullptr && !Quest::NewCamp_NCCHAPTER3_NCBANDITSCAMP.IsRunning());
                    DB(int64(0xd577347741a105ef), Quest::OldCamp_OCCHAPTER3_OCBANDITSCAMP != nullptr && !Quest::OldCamp_OCCHAPTER3_OCBANDITSCAMP.IsRunning());
                    DB(int64(0xd577347741a105f3), Quest::SwampCamp_SCCHAPTER3_SCBANDITSCAMP != nullptr && !Quest::SwampCamp_SCCHAPTER3_SCBANDITSCAMP.IsRunning());
                }
                
                if (Quest::NewCamp_NCCHAPTER3_NCBANDITSCAMP != nullptr && !Quest::NewCamp_NCCHAPTER3_NCBANDITSCAMP.IsRunning())
                    return true;
                
                if (Quest::OldCamp_OCCHAPTER3_OCBANDITSCAMP != nullptr && !Quest::OldCamp_OCCHAPTER3_OCBANDITSCAMP.IsRunning())
                    return true;
                
                if (Quest::SwampCamp_SCCHAPTER3_SCBANDITSCAMP != nullptr && !Quest::SwampCamp_SCCHAPTER3_SCBANDITSCAMP.IsRunning())
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd577347741a10554), EConversationDebugInfo::Executing);
                // You wouldn't be stupid enough to sneak in and walk right ...
                Quentin.AI.Say(LocText("TEXT_WIP_QKQHPDM_20241213_133428"));
                DC(int64(0xd577347741a10554), EConversationDebugInfo::Done);
                DC(int64(0xd577347741a10555), EConversationDebugInfo::Executing);
                
                // Brannok let me in.
                Hero.AI.Say(LocText("TEXT_WIP_QKQHPDM_20241213_133441"));
                DC(int64(0xd577347741a10555), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_BC_BAN_QUENTIN, Document::UDocumentSegment_Glossary_BC_BAN_QUENTIN_Introduction);
                DB(int64(0xf92c6a740f9aa28f), Quest::BanditsCamp_BANDITSTRUST != nullptr && Quest::BanditsCamp_BANDITSTRUST.HasSucceeded());
                
                if (Quest::BanditsCamp_BANDITSTRUST != nullptr && Quest::BanditsCamp_BANDITSTRUST.HasSucceeded())
                {
                    DC(int64(0xf92c6a740f9aa298), EConversationDebugInfo::Executing);
                    // I dealt with Arlin for you. 
                    Hero.AI.Say(LocText("TEXT_WIP_YFNFOFG_20250324_114317"));
                    DC(int64(0xf92c6a740f9aa298), EConversationDebugInfo::Done);
                    DB(int64(0xd2fd8b474ab3f1d1), Bandit != nullptr && Bandit.HasAssignedDailyRoutine(UDailyRoutine_BC_BAN_Arlin_852_Home));
                    
                    if (Bandit != nullptr && Bandit.HasAssignedDailyRoutine(UDailyRoutine_BC_BAN_Arlin_852_Home))
                    {
                        DC(int64(0xd2fd8b474ab3f1d2), EConversationDebugInfo::Executing);
                        // Ah, so you're that guy he was raving about. Well done. 
                        Quentin.AI.Say(LocText("TEXT_WIP_YRWYRII_20250110_150701"));
                        DC(int64(0xd2fd8b474ab3f1d2), EConversationDebugInfo::Done);
                    }
                    else
                    {
                        DC(int64(0xd2fd8b474ab3f1d4), EConversationDebugInfo::Executing);
                        // Meaning?
                        Quentin.AI.Say(LocText("TEXT_WIP_YRWYRII_20250110_150704"));
                        DC(int64(0xd2fd8b474ab3f1d4), EConversationDebugInfo::Done);
                        DB(int64(0xd2fd8b474ab3f1bb), Bandit != nullptr && Bandit.IsEveryoneOfThisKindDead());
                        DB(int64(0xd2fd8b474ab3f1c6), Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_UPLRCKI_20250107_160503")));
                        
                        if (Bandit != nullptr && Bandit.IsEveryoneOfThisKindDead())
                        {
                            DC(int64(0xd2fd8b474ab3f1bc), EConversationDebugInfo::Executing);
                            // I killed him. 
                            Hero.AI.Say(LocText("TEXT_WIP_YRWYRII_20250110_150424"));
                            DC(int64(0xd2fd8b474ab3f1bc), EConversationDebugInfo::Done);
                            DC(int64(0xd2fd8b474ab3f1bd), EConversationDebugInfo::Executing);
                            
                            // Straight shooter, eh? Guess that means he talked. 
                            Quentin.AI.Say(LocText("TEXT_WIP_YRWYRII_20250110_150424_41"));
                            DC(int64(0xd2fd8b474ab3f1bd), EConversationDebugInfo::Done);
                            DC(int64(0xd2fd8b474ab3f1c4), EConversationDebugInfo::Executing);
                            // Shame, I always liked him. Not the brightest torch in ...
                            Quentin.AI.Say(LocText("TEXT_WIP_YRWYRII_20250110_150522"));
                            DC(int64(0xd2fd8b474ab3f1c4), EConversationDebugInfo::Done);
                        }
                        else if (Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_UPLRCKI_20250107_160503")))
                        {
                            DC(int64(0xd2fd8b474ab3f1be), EConversationDebugInfo::Executing);
                            
                            // I left him there.
                            Hero.AI.Say(LocText("TEXT_WIP_YRWYRII_20250110_150426"));
                            DC(int64(0xd2fd8b474ab3f1be), EConversationDebugInfo::Done);
                            DC(int64(0xd2fd8b474ab3f1bf), EConversationDebugInfo::Executing);
                            
                            // I guess that means he talked.
                            Quentin.AI.Say(LocText("TEXT_WIP_YRWYRII_20250110_150426_2083"));
                            DC(int64(0xd2fd8b474ab3f1bf), EConversationDebugInfo::Done);
                            DC(int64(0xd2fd8b474ab3f1c5), EConversationDebugInfo::Executing);
                            // Shame, I always liked him. Not the brightest torch in ...
                            Quentin.AI.Say(LocText("TEXT_WIP_YRWYRII_20250110_150522"));
                            DC(int64(0xd2fd8b474ab3f1c5), EConversationDebugInfo::Done);
                        }
                        else
                        {
                            DC(int64(0xd2fd8b474ab3f1cb), EConversationDebugInfo::Executing);
                            
                            // I sprang him out. He should be here soon. 
                            Hero.AI.Say(LocText("TEXT_WIP_YRWYRII_20250110_150611"));
                            DC(int64(0xd2fd8b474ab3f1cb), EConversationDebugInfo::Done);
                            DC(int64(0xd2fd8b474ab3f1cc), EConversationDebugInfo::Executing);
                            
                            // Good job.
                            Quentin.AI.Say(LocText("TEXT_WIP_YRWYRII_20250110_150611_2238"));
                            DC(int64(0xd2fd8b474ab3f1cc), EConversationDebugInfo::Done);
                        }
                    }
                }
                DC(int64(0xd2fd8b474ab3f1f6), EConversationDebugInfo::Executing);
                // Anyway. Unless you got something important to discuss ...
                Quentin.AI.Say(LocText("TEXT_WIP_YRWYRII_20250110_150814_3436"));
                DC(int64(0xd2fd8b474ab3f1f6), EConversationDebugInfo::Done);
                DB(int64(0xd2fd8b474ab3f201), Quest::OldCamp_OCCHAPTER3_OCBANDITSCAMP != nullptr && Quest::OldCamp_OCCHAPTER3_OCBANDITSCAMP.IsRunning());
                DB(int64(0x3fad8d97598fa381), Quest::NewCamp_NCCHAPTER3_NCBANDITSCAMP != nullptr && Quest::NewCamp_NCCHAPTER3_NCBANDITSCAMP.IsRunning());
                DB(int64(0x3fad8d97598fa382), Quest::SwampCamp_SCCHAPTER3_SCBANDITSCAMP != nullptr && Quest::SwampCamp_SCCHAPTER3_SCBANDITSCAMP.IsRunning());
                
                if (Quest::OldCamp_OCCHAPTER3_OCBANDITSCAMP != nullptr && Quest::OldCamp_OCCHAPTER3_OCBANDITSCAMP.IsRunning())
                {
                    
                }
                else if (Quest::NewCamp_NCCHAPTER3_NCBANDITSCAMP != nullptr && Quest::NewCamp_NCCHAPTER3_NCBANDITSCAMP.IsRunning())
                {
                    
                }
                else if (Quest::SwampCamp_SCCHAPTER3_SCBANDITSCAMP != nullptr && Quest::SwampCamp_SCCHAPTER3_SCBANDITSCAMP.IsRunning())
                {
                    
                }
                else
                {
                    DC(int64(0xd2fd8b474ab3f204), EConversationDebugInfo::Executing);
                    // I don't have anything.
                    Hero.AI.Say(LocText("TEXT_WIP_YRWYRII_20250110_151217"));
                    DC(int64(0xd2fd8b474ab3f204), EConversationDebugInfo::Done);
                    DC(int64(0xd2fd8b474ab3f205), EConversationDebugInfo::Executing);
                    
                    // Then why are you still here? 
                    Quentin.AI.Say(LocText("TEXT_WIP_YRWYRII_20250110_151217_686"));
                    DC(int64(0xd2fd8b474ab3f205), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_quentin_130346_exit_2");
                    DC(int64(0xd577347741a10558), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xd577347741a10558), EConversationDebugInfo::Done);
                    return;
                }
                DC(int64(0xd2fd8b474ab3f202), EConversationDebugInfo::Executing);
                // There is something, yes. 
                Hero.AI.Say(LocText("TEXT_WIP_YRWYRII_20250110_151213"));
                DC(int64(0xd2fd8b474ab3f202), EConversationDebugInfo::Done);
                
                Other.Remember(n"choice_quentin_130346_exit_1");
            }
        }
        
        
        class UChoiceQuentin131045 : UTopic_Hero__BC_BAN_QUENTIN_858
        {
            default DebugId = int64(0xd577347741a105f9);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceQuentin131045);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xd577347741a105fe), Quest::NewCamp_NCCHAPTER3_NCBANDITSCAMP != nullptr && Quest::NewCamp_NCCHAPTER3_NCBANDITSCAMP.IsRunning());
                    DB(int64(0xd577347741a10601), Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_YRWYRII_20250110_151217_686")));
                    DB(int64(0xd577347741a105fc), Quest::OldCamp_OCCHAPTER3_OCBANDITSCAMP != nullptr && Quest::OldCamp_OCCHAPTER3_OCBANDITSCAMP.IsRunning());
                    DB(int64(0xd577347741a10602), Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_YRWYRII_20250110_151217_686")));
                    DB(int64(0xd577347741a10600), Quest::SwampCamp_SCCHAPTER3_SCBANDITSCAMP != nullptr && Quest::SwampCamp_SCCHAPTER3_SCBANDITSCAMP.IsRunning());
                    DB(int64(0xd577347741a10603), Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_YRWYRII_20250110_151217_686")));
                }
                
                if (Quest::NewCamp_NCCHAPTER3_NCBANDITSCAMP != nullptr && Quest::NewCamp_NCCHAPTER3_NCBANDITSCAMP.IsRunning() && Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_YRWYRII_20250110_151217_686")))
                    return true;
                
                if (Quest::OldCamp_OCCHAPTER3_OCBANDITSCAMP != nullptr && Quest::OldCamp_OCCHAPTER3_OCBANDITSCAMP.IsRunning() && Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_YRWYRII_20250110_151217_686")))
                    return true;
                
                if (Quest::SwampCamp_SCCHAPTER3_SCBANDITSCAMP != nullptr && Quest::SwampCamp_SCCHAPTER3_SCBANDITSCAMP.IsRunning() && Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_YRWYRII_20250110_151217_686")))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd577347741a105f8), EConversationDebugInfo::Executing);
                // You again. 
                Quentin.AI.Say(LocText("TEXT_WIP_QKQHPDM_20241213_153214_1091"));
                DC(int64(0xd577347741a105f8), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceQuentin131102 : UTopic_Hero__BC_BAN_QUENTIN_858
        {
            default DebugId = int64(0xd577347741a10607);
            default Caption = FText::FromString("[Followup Topic]");;
            default bIsFollowupTopic = true;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceQuentin130346);
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceQuentin131045);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DB(int64(0xd577347741a104bc), Quest::NewCamp_NCCHAPTER3_NCBANDITSCAMP != nullptr && Quest::NewCamp_NCCHAPTER3_NCBANDITSCAMP.IsRunning());
                DB(int64(0xd577347741a104bf), Quest::OldCamp_OCCHAPTER3_OCBANDITSCAMP != nullptr && Quest::OldCamp_OCCHAPTER3_OCBANDITSCAMP.IsRunning());
                DB(int64(0xd577347741a104c0), Quest::SwampCamp_SCCHAPTER3_SCBANDITSCAMP != nullptr && Quest::SwampCamp_SCCHAPTER3_SCBANDITSCAMP.IsRunning());
                
                if (Quest::NewCamp_NCCHAPTER3_NCBANDITSCAMP != nullptr && Quest::NewCamp_NCCHAPTER3_NCBANDITSCAMP.IsRunning())
                {
                    DC(int64(0xd577347741a104cb), EConversationDebugInfo::Executing);
                    // Lee sent me.
                    Hero.AI.Say(LocText("TEXT_WIP_QKQHPDM_20241213_121821"));
                    DC(int64(0xd577347741a104cb), EConversationDebugInfo::Done);
                    DC(int64(0xd2fd8b474ab3f230), EConversationDebugInfo::Executing);
                    
                    // Lee?
                    Quentin.AI.Say(LocText("TEXT_WIP_YRWYRII_20250110_152228"));
                    DC(int64(0xd2fd8b474ab3f230), EConversationDebugInfo::Done);
                    DC(int64(0xd2fd8b474ab3f231), EConversationDebugInfo::Executing);
                    
                    // Yeah. He wants you to stop poaching our guys. 
                    Hero.AI.Say(LocText("TEXT_WIP_YRWYRII_20250110_152237"));
                    DC(int64(0xd2fd8b474ab3f231), EConversationDebugInfo::Done);
                    DC(int64(0x460eb839e69a9230), EConversationDebugInfo::Executing);
                    
                    // And you come here saying this straight to my face. Part ...
                    Quentin.AI.Say(LocText("TEXT_WIP_FSWYRII_20250117_124500"));
                    DC(int64(0x460eb839e69a9230), EConversationDebugInfo::Done);
                    DC(int64(0xd2fd8b474ab3f20d), EConversationDebugInfo::Executing);
                    // The other is ... impressed, I suppose. You got guts, if ...
                    Quentin.AI.Say(LocText("TEXT_WIP_YRWYRII_20250110_152012"));
                    DC(int64(0xd2fd8b474ab3f20d), EConversationDebugInfo::Done);
                    DC(int64(0xd2fd8b474ab3f20e), EConversationDebugInfo::Executing);
                    // How long since they threw you in? 
                    Quentin.AI.Say(LocText("TEXT_WIP_YRWYRII_20250110_152042"));
                    DC(int64(0xd2fd8b474ab3f20e), EConversationDebugInfo::Done);
                    DC(int64(0xd2fd8b474ab3f20f), EConversationDebugInfo::Executing);
                    
                    // Not long.
                    Hero.AI.Say(LocText("TEXT_WIP_YRWYRII_20250110_152049"));
                    DC(int64(0xd2fd8b474ab3f20f), EConversationDebugInfo::Done);
                    DC(int64(0xd2fd8b474ab3f210), EConversationDebugInfo::Executing);
                    
                    // And already a merc. Not bad. 
                    Quentin.AI.Say(LocText("TEXT_WIP_YRWYRII_20250110_152058"));
                    DC(int64(0xd2fd8b474ab3f210), EConversationDebugInfo::Done);
                    DC(int64(0xd2fd8b474ab3f232), EConversationDebugInfo::Executing);
                    // Well, you can tell Lee that I ain't poaching anyone. ...
                    Quentin.AI.Say(LocText("TEXT_WIP_YRWYRII_20250110_152427"));
                    DC(int64(0xd2fd8b474ab3f232), EConversationDebugInfo::Done);
                    DC(int64(0xd2fd8b474ab3f233), EConversationDebugInfo::Executing);
                    // Or groveling before magic-slinging bastards, in whatever ...
                    Quentin.AI.Say(LocText("TEXT_WIP_YRWYRII_20250110_152452"));
                    DC(int64(0xd2fd8b474ab3f233), EConversationDebugInfo::Done);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_NCBANDITSCAMP, Document::UDocumentSegment_CH3_NCBANDITSCAMP_Quentin);
                    Subdialog(
                        UTopic_Quentin_129709,
                        UTopic_Quentin_129773
                    );
                }
                else if (Quest::OldCamp_OCCHAPTER3_OCBANDITSCAMP != nullptr && Quest::OldCamp_OCCHAPTER3_OCBANDITSCAMP.IsRunning())
                {
                    DC(int64(0xd577347741a1057a), EConversationDebugInfo::Executing);
                    // Thorus sent me. He wants to know if you're a threat. 
                    Hero.AI.Say(LocText("TEXT_WIP_QKQHPDM_20241213_135943"));
                    DC(int64(0xd577347741a1057a), EConversationDebugInfo::Done);
                    DC(int64(0x6b50f48009bbe842), EConversationDebugInfo::Executing);
                    
                    // And you just come here and say that to my face?
                    Quentin.AI.Say(LocText("TEXT_WIP_BSWYRII_20250113_143129"));
                    DC(int64(0x6b50f48009bbe842), EConversationDebugInfo::Done);
                    DC(int64(0x6b50f48009bbe843), EConversationDebugInfo::Executing);
                    // You're either a brilliant, bold strategist or dumb as a ...
                    Quentin.AI.Say(LocText("TEXT_WIP_BSWYRII_20250113_143143"));
                    DC(int64(0x6b50f48009bbe843), EConversationDebugInfo::Done);
                    DC(int64(0xd577347741a1057c), EConversationDebugInfo::Executing);
                    // How long since they threw you in? 
                    Quentin.AI.Say(LocText("TEXT_WIP_YRWYRII_20250110_152042"));
                    DC(int64(0xd577347741a1057c), EConversationDebugInfo::Done);
                    DC(int64(0xd577347741a1057d), EConversationDebugInfo::Executing);
                    
                    // Not long.
                    Hero.AI.Say(LocText("TEXT_WIP_YRWYRII_20250110_152049"));
                    DC(int64(0xd577347741a1057d), EConversationDebugInfo::Done);
                    DC(int64(0xd577347741a105a0), EConversationDebugInfo::Executing);
                    
                    // And already a warder. Means you got skills.
                    Quentin.AI.Say(LocText("TEXT_WIP_QKQHPDM_20241213_140124"));
                    DC(int64(0xd577347741a105a0), EConversationDebugInfo::Done);
                    DC(int64(0xd577347741a105a1), EConversationDebugInfo::Executing);
                    // Well, you can tell Thorus we won't bother him as long as ...
                    Quentin.AI.Say(LocText("TEXT_WIP_QKQHPDM_20241213_140134"));
                    DC(int64(0xd577347741a105a1), EConversationDebugInfo::Done);
                    DC(int64(0x6b50f48009bbe86c), EConversationDebugInfo::Executing);
                    // It's true that we've had more guys join up with us ...
                    Quentin.AI.Say(LocText("TEXT_WIP_BSWYRII_20250113_145010"));
                    DC(int64(0x6b50f48009bbe86c), EConversationDebugInfo::Done);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_OCBANDITSCAMP, Document::UDocumentSegment_CH3_OCBANDITSCAMP_Quentin);
                    Subdialog(
                        UTopic_Quentin_130450,
                        UTopic_Quentin_130526
                    );
                }
                else if (Quest::SwampCamp_SCCHAPTER3_SCBANDITSCAMP != nullptr && Quest::SwampCamp_SCCHAPTER3_SCBANDITSCAMP.IsRunning())
                {
                    DC(int64(0xd577347741a105c4), EConversationDebugInfo::Executing);
                    // Baal Orun sent me. He has a proposal.
                    Hero.AI.Say(LocText("TEXT_WIP_QKQHPDM_20241213_141609"));
                    DC(int64(0xd577347741a105c4), EConversationDebugInfo::Done);
                    DC(int64(0xd577347741a105c5), EConversationDebugInfo::Executing);
                    
                    // If it involves "the Sleeper," I'm out. We don't believe ...
                    Quentin.AI.Say(LocText("TEXT_WIP_QKQHPDM_20241213_141624"));
                    DC(int64(0xd577347741a105c5), EConversationDebugInfo::Done);
                    DC(int64(0x6b50f48009bbe893), EConversationDebugInfo::Executing);
                    
                    // Relax, it's about the swampweed. Orun is in charge of ...
                    Hero.AI.Say(LocText("TEXT_WIP_BSWYRII_20250113_145437"));
                    DC(int64(0x6b50f48009bbe893), EConversationDebugInfo::Done);
                    DC(int64(0xd577347741a105c8), EConversationDebugInfo::Executing);
                    
                    // Hm. Funny.
                    Quentin.AI.Say(LocText("TEXT_WIP_QKQHPDM_20241213_141718"));
                    DC(int64(0xd577347741a105c8), EConversationDebugInfo::Done);
                    DC(int64(0x6b50f48009bbe894), EConversationDebugInfo::Executing);
                    
                    // Why?
                    Hero.AI.Say(LocText("TEXT_WIP_BSWYRII_20250113_145755"));
                    DC(int64(0x6b50f48009bbe894), EConversationDebugInfo::Done);
                    DC(int64(0xd577347741a105cb), EConversationDebugInfo::Executing);
                    
                    // 'Cause about a month ago, a novice sent by Cor Kalom ...
                    Quentin.AI.Say(LocText("TEXT_WIP_QKQHPDM_20241213_142544"));
                    DC(int64(0xd577347741a105cb), EConversationDebugInfo::Done);
                    Subdialog(
                        UTopic_Quentin_147768,
                        UTopic_Quentin_147788
                    );
                    Subdialog(
                        UTopic_Quentin_130698,
                        UTopic_Quentin_130678,
                        UTopic_Quentin_130736
                    );
                    DC(int64(0x8c29f1142628ae76), EConversationDebugInfo::Executing);
                    Quest::SwampCamp_SCCHAPTER3_SCBANDITSCAMP_SCBANDITSCAMP_OBJ_QUENTIN.SucceedQuest();
                    DC(int64(0x8c29f1142628ae76), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UTopic_Quentin_129709 : UTopic_Hero__BC_BAN_QUENTIN_858
        {
            default DebugId = int64(0xd577347741a104df);
            default Caption = LocText("TEXT_WIP_QKQHPDM_20241213_123611_3569");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Quentin_129709);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd577347741a104e0), EConversationDebugInfo::Executing);
                // Wouldn't it be safer with one of the big camps?
                Hero.AI.Say(LocText("TEXT_WIP_QKQHPDM_20241213_123611_3569"));
                DC(int64(0xd577347741a104e0), EConversationDebugInfo::Done);
                DC(int64(0xd577347741a104e8), EConversationDebugInfo::Executing);
                
                // We're doing just fine. 
                Quentin.AI.Say(LocText("TEXT_WIP_QKQHPDM_20241213_123959"));
                DC(int64(0xd577347741a104e8), EConversationDebugInfo::Done);
                DC(int64(0x6b50f48009bbe7f3), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x6b50f48009bbe7f3), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Quentin_129773 : UTopic_Hero__BC_BAN_QUENTIN_858
        {
            default DebugId = int64(0xd577347741a104eb);
            default Caption = LocText("TEXT_WIP_QKQHPDM_20241213_125327_2801");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Quentin_129773);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd577347741a104ec), EConversationDebugInfo::Executing);
                // How are we going to solve this? 
                Hero.AI.Say(LocText("TEXT_WIP_QKQHPDM_20241213_125327_2801"));
                DC(int64(0xd577347741a104ec), EConversationDebugInfo::Done);
                DC(int64(0xd577347741a104f2), EConversationDebugInfo::Executing);
                
                // There ain't nothing to solve. We live our lives, they ...
                Quentin.AI.Say(LocText("TEXT_WIP_QKQHPDM_20241213_125427"));
                DC(int64(0xd577347741a104f2), EConversationDebugInfo::Done);
                DC(int64(0x6b50f48009bbe7ff), EConversationDebugInfo::Executing);
                // Like I said, we ain't poaching anyone, but I'm not going ...
                Quentin.AI.Say(LocText("TEXT_WIP_BSWYRII_20250113_140910"));
                DC(int64(0x6b50f48009bbe7ff), EConversationDebugInfo::Done);
                DC(int64(0x6b50f48009bbe800), EConversationDebugInfo::Executing);
                // If Lee has a problem with that, he can tell it to my ...
                Quentin.AI.Say(LocText("TEXT_WIP_BSWYRII_20250113_140934"));
                DC(int64(0x6b50f48009bbe800), EConversationDebugInfo::Done);
                DC(int64(0x6b50f48009bbe801), EConversationDebugInfo::Executing);
                // Honestly, you strike me as a decent guy. Why not stay ...
                Quentin.AI.Say(LocText("TEXT_WIP_BSWYRII_20250113_140952"));
                DC(int64(0x6b50f48009bbe801), EConversationDebugInfo::Done);
                DC(int64(0xd577347741a104f3), EConversationDebugInfo::Executing);
                
                // I already pledged myself to the mercenaries. 
                Hero.AI.Say(LocText("TEXT_WIP_QKQHPDM_20241213_125442"));
                DC(int64(0xd577347741a104f3), EConversationDebugInfo::Done);
                DC(int64(0xd577347741a104f4), EConversationDebugInfo::Executing);
                
                // Loyalty. I can respect that. Still, feel free to swing ...
                Quentin.AI.Say(LocText("TEXT_WIP_QKQHPDM_20241213_125443"));
                DC(int64(0xd577347741a104f4), EConversationDebugInfo::Done);
                DC(int64(0x6b50f48009bbe891), EConversationDebugInfo::Executing);
                // Now, is that all? 
                Quentin.AI.Say(LocText("TEXT_WIP_BSWYRII_20250113_145333"));
                DC(int64(0x6b50f48009bbe891), EConversationDebugInfo::Done);
                DC(int64(0x570acab4847d8629), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER3_NCBANDITSCAMP_NCBANDITSCAMP_OBJ_QUENTIN.SucceedQuest();
                DC(int64(0x570acab4847d8629), EConversationDebugInfo::Done);
                DC(int64(0x570acab4847d862c), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x570acab4847d862c), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Quentin_130450 : UTopic_Hero__BC_BAN_QUENTIN_858
        {
            default DebugId = int64(0xd577347741a105a7);
            default Caption = LocText("TEXT_WIP_QKQHPDM_20241213_140237_292");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Quentin_130450);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd577347741a105a8), EConversationDebugInfo::Executing);
                // Wouldn't it be safer with one of the big camps?
                Hero.AI.Say(LocText("TEXT_WIP_QKQHPDM_20241213_140237_292"));
                DC(int64(0xd577347741a105a8), EConversationDebugInfo::Done);
                DC(int64(0xd577347741a105ac), EConversationDebugInfo::Executing);
                
                // We're doing just fine. 
                Quentin.AI.Say(LocText("TEXT_WIP_QKQHPDM_20241213_140722"));
                DC(int64(0xd577347741a105ac), EConversationDebugInfo::Done);
                DC(int64(0x570acab4847d8631), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x570acab4847d8631), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Quentin_130526 : UTopic_Hero__BC_BAN_QUENTIN_858
        {
            default DebugId = int64(0xd577347741a105af);
            default Caption = LocText("TEXT_WIP_QKQHPDM_20241213_125327_2801");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Quentin_130526);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd577347741a105b0), EConversationDebugInfo::Executing);
                // How are we going to solve this? 
                Hero.AI.Say(LocText("TEXT_WIP_QKQHPDM_20241213_125327_2801"));
                DC(int64(0xd577347741a105b0), EConversationDebugInfo::Done);
                DC(int64(0xd577347741a105b3), EConversationDebugInfo::Executing);
                
                // There ain't nothing to solve. We live our lives, they ...
                Quentin.AI.Say(LocText("TEXT_WIP_QKQHPDM_20241213_125427"));
                DC(int64(0xd577347741a105b3), EConversationDebugInfo::Done);
                DC(int64(0xd577347741a105b5), EConversationDebugInfo::Executing);
                // Like I said, we ain't poaching anyone, but I'm not going ...
                Quentin.AI.Say(LocText("TEXT_WIP_BSWYRII_20250113_140910"));
                DC(int64(0xd577347741a105b5), EConversationDebugInfo::Done);
                DC(int64(0xd577347741a105e5), EConversationDebugInfo::Executing);
                // If Gomez has a problem with that, he can tell it to my ...
                Quentin.AI.Say(LocText("TEXT_WIP_QKQHPDM_20241213_152038"));
                DC(int64(0xd577347741a105e5), EConversationDebugInfo::Done);
                DC(int64(0x6b50f48009bbe886), EConversationDebugInfo::Executing);
                // Honestly, you strike me as a decent guy. Why not stay ...
                Quentin.AI.Say(LocText("TEXT_WIP_BSWYRII_20250113_140952"));
                DC(int64(0x6b50f48009bbe886), EConversationDebugInfo::Done);
                DC(int64(0x6b50f48009bbe888), EConversationDebugInfo::Executing);
                
                // I pledged myself to the warders. 
                Hero.AI.Say(LocText("TEXT_WIP_BSWYRII_20250113_145240"));
                DC(int64(0x6b50f48009bbe888), EConversationDebugInfo::Done);
                DC(int64(0x6b50f48009bbe889), EConversationDebugInfo::Executing);
                
                // Well, I guess I can respect that. Even if I wonder how ...
                Quentin.AI.Say(LocText("TEXT_WIP_BSWYRII_20250113_145246"));
                DC(int64(0x6b50f48009bbe889), EConversationDebugInfo::Done);
                DC(int64(0x6b50f48009bbe88a), EConversationDebugInfo::Executing);
                // Anyway, feel free to swing by whenever you're nearby - ...
                Quentin.AI.Say(LocText("TEXT_WIP_BSWYRII_20250113_145306"));
                DC(int64(0x6b50f48009bbe88a), EConversationDebugInfo::Done);
                DC(int64(0x6b50f48009bbe892), EConversationDebugInfo::Executing);
                // Now, is that all? 
                Quentin.AI.Say(LocText("TEXT_WIP_BSWYRII_20250113_145333"));
                DC(int64(0x6b50f48009bbe892), EConversationDebugInfo::Done);
                DC(int64(0xf2ac185c2a0065de), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER3_OCBANDITSCAMP_OCBANDITSCAMP_OBJ_QUENTIN.SucceedQuest();
                DC(int64(0xf2ac185c2a0065de), EConversationDebugInfo::Done);
                DC(int64(0xd577347741a105c3), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xd577347741a105c3), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Quentin_147768 : UTopic_Hero__BC_BAN_QUENTIN_858
        {
            default DebugId = int64(0x6b50f48009bbe899);
            default Caption = LocText("TEXT_WIP_BSWYRII_20250113_150126_2995");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Quentin_147768);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6b50f48009bbe89a), EConversationDebugInfo::Executing);
                // Cor Kalom isn't in the Swamp Camp anymore. 
                Hero.AI.Say(LocText("TEXT_WIP_BSWYRII_20250113_150126_2995"));
                DC(int64(0x6b50f48009bbe89a), EConversationDebugInfo::Done);
                DC(int64(0x6b50f48009bbe8a4), EConversationDebugInfo::Executing);
                // Let's just say there've been some "changes" in ...
                Hero.AI.Say(LocText("TEXT_WIP_BSWYRII_20250113_150354"));
                DC(int64(0x6b50f48009bbe8a4), EConversationDebugInfo::Done);
                DC(int64(0x6b50f48009bbe8a5), EConversationDebugInfo::Executing);
                
                // Sounds ominous. But fine. 
                Quentin.AI.Say(LocText("TEXT_WIP_BSWYRII_20250113_150403"));
                DC(int64(0x6b50f48009bbe8a5), EConversationDebugInfo::Done);
                DC(int64(0x6b50f48009bbe8a6), EConversationDebugInfo::Executing);
                // The truth is, I ain't too fond of those herbs.
                Quentin.AI.Say(LocText("TEXT_WIP_BSWYRII_20250113_150414"));
                DC(int64(0x6b50f48009bbe8a6), EConversationDebugInfo::Done);
                DC(int64(0x6b50f48009bbe8a7), EConversationDebugInfo::Executing);
                // They make you slow, in your muscles and in your head. ...
                Quentin.AI.Say(LocText("TEXT_WIP_BSWYRII_20250113_150604"));
                DC(int64(0x6b50f48009bbe8a7), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Quentin_147788 : UTopic_Hero__BC_BAN_QUENTIN_858
        {
            default DebugId = int64(0x6b50f48009bbe89d);
            default Caption = LocText("TEXT_WIP_BSWYRII_20250113_150126_731");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Quentin_147788);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6b50f48009bbe89e), EConversationDebugInfo::Executing);
                
                // Like I said, Baal Orun is in charge of the herb business ...
                Hero.AI.Say(LocText("TEXT_WIP_BSWYRII_20250113_150126_731"));
                DC(int64(0x6b50f48009bbe89e), EConversationDebugInfo::Done);
                DC(int64(0x6b50f48009bbe8a3), EConversationDebugInfo::Executing);
                
                // Sounds ominous. But fine. 
                Quentin.AI.Say(LocText("TEXT_WIP_BSWYRII_20250113_150241"));
                DC(int64(0x6b50f48009bbe8a3), EConversationDebugInfo::Done);
                DC(int64(0x6b50f48009bbe8a8), EConversationDebugInfo::Executing);
                // The truth is, I ain't too fond of those herbs.
                Quentin.AI.Say(LocText("TEXT_WIP_BSWYRII_20250113_150414"));
                DC(int64(0x6b50f48009bbe8a8), EConversationDebugInfo::Done);
                DC(int64(0x6b50f48009bbe8a9), EConversationDebugInfo::Executing);
                // They make you slow, in your muscles and in your head. ...
                Quentin.AI.Say(LocText("TEXT_WIP_BSWYRII_20250113_150604"));
                DC(int64(0x6b50f48009bbe8a9), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Quentin_130698 : UTopic_Hero__BC_BAN_QUENTIN_858
        {
            default DebugId = int64(0xd577347741a105d1);
            default Caption = LocText("TEXT_WIP_QKQHPDM_20241213_142628_1351");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Quentin_130698);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd577347741a105d2), EConversationDebugInfo::Executing);
                
                // Because everyone needs a break, and the smoke rolls help ...
                Hero.AI.Say(LocText("TEXT_WIP_QKQHPDM_20241213_142628_1246"));
                DC(int64(0xd577347741a105d2), EConversationDebugInfo::Done);
                DC(int64(0xd577347741a105d8), EConversationDebugInfo::Executing);
                // Trust me. Your guys will thank you for it.
                Hero.AI.Say(LocText("TEXT_WIP_QKQHPDM_20241213_142734"));
                DC(int64(0xd577347741a105d8), EConversationDebugInfo::Done);
                DC(int64(0xd577347741a105d9), EConversationDebugInfo::Executing);
                
                // Hmm. They probably will. But-
                Quentin.AI.Say(LocText("TEXT_WIP_QKQHPDM_20241213_142744"));
                DC(int64(0xd577347741a105d9), EConversationDebugInfo::Done);
                DC(int64(0x6b50f48009bbe8b2), EConversationDebugInfo::Executing);
                // (sighs) Ah, for fuck's sake. Fine. Tell Orun I'm ...
                Quentin.AI.Say(LocText("TEXT_WIP_BSWYRII_20250113_151152"));
                DC(int64(0x6b50f48009bbe8b2), EConversationDebugInfo::Done);
                DC(int64(0x6b50f48009bbe8b8), EConversationDebugInfo::Executing);
                // Is there anything else? 
                Quentin.AI.Say(LocText("TEXT_WIP_BSWYRII_20250113_151417"));
                DC(int64(0x6b50f48009bbe8b8), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_SCBANDITSCAMP, Document::UDocumentSegment_CH3_SCBANDITSCAMP_Quentin);
            }
        }
        
        
        class UTopic_Quentin_130678 : UTopic_Hero__BC_BAN_QUENTIN_858
        {
            default DebugId = int64(0xd577347741a105cd);
            default Caption = LocText("TEXT_WIP_QKQHPDM_20241213_142628");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Quentin_130678);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd577347741a105ce), EConversationDebugInfo::Executing);
                // It's not just about swampweed. The Brotherhood cares ...
                Hero.AI.Say(LocText("TEXT_WIP_QKQHPDM_20241213_142628_3511"));
                DC(int64(0xd577347741a105ce), EConversationDebugInfo::Done);
                DC(int64(0xd577347741a105d7), EConversationDebugInfo::Executing);
                
                // That's a fair point. But ...
                Quentin.AI.Say(LocText("TEXT_WIP_QKQHPDM_20241213_142705"));
                DC(int64(0xd577347741a105d7), EConversationDebugInfo::Done);
                DC(int64(0xd577347741a106b9), EConversationDebugInfo::Executing);
                // (sighs) Ah, for fuck's sake. Fine. Tell Orun I'm ...
                Quentin.AI.Say(LocText("TEXT_WIP_BSWYRII_20250113_151152"));
                DC(int64(0xd577347741a106b9), EConversationDebugInfo::Done);
                DC(int64(0x6b50f48009bbe8b9), EConversationDebugInfo::Executing);
                // Is there anything else? 
                Quentin.AI.Say(LocText("TEXT_WIP_BSWYRII_20250113_151417"));
                DC(int64(0x6b50f48009bbe8b9), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_SCBANDITSCAMP, Document::UDocumentSegment_CH3_SCBANDITSCAMP_Quentin);
            }
        }
        
        
        class UTopic_Quentin_130736 : UTopic_Hero__BC_BAN_QUENTIN_858
        {
            default DebugId = int64(0xd577347741a105da);
            default Caption = LocText("TEXT_WIP_QKQHPDM_20241213_142758");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Quentin_130736);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd577347741a105db), EConversationDebugInfo::Executing);
                // Because you'd be stupid to refuse this deal. We can be a ...
                Hero.AI.Say(LocText("TEXT_WIP_QKQHPDM_20241213_142758_2483"));
                DC(int64(0xd577347741a105db), EConversationDebugInfo::Done);
                DC(int64(0xd577347741a105de), EConversationDebugInfo::Executing);
                
                // (deep sigh) You just had to resort to threats, didn't ...
                Quentin.AI.Say(LocText("TEXT_WIP_QKQHPDM_20241213_142911"));
                DC(int64(0xd577347741a105de), EConversationDebugInfo::Done);
                DC(int64(0x6b50f48009bbe8ba), EConversationDebugInfo::Executing);
                // Shame. I was just starting to like you. 
                Quentin.AI.Say(LocText("TEXT_WIP_BSWYRII_20250113_151510"));
                DC(int64(0x6b50f48009bbe8ba), EConversationDebugInfo::Done);
                DC(int64(0xd577347741a105e0), EConversationDebugInfo::Executing);
                Quentin.AI.StartAttackingImmediatelyLootOnly(Hero);
                DC(int64(0xd577347741a105e0), EConversationDebugInfo::Done);
                DC(int64(0xd577347741a105e1), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xd577347741a105e1), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceQuentin139225 : UTopic_Hero__BC_BAN_QUENTIN_858
        {
            default DebugId = int64(0x6b50f48009bbe7c9);
            default Caption = LocText("TEXT_WIP_YRWYRII_20250110_152641_2386");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceQuentin139225);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x3fad8d97598fa396), Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_BSWYRII_20250113_145010")));
                    DB(int64(0x6b50f48009bbe7d0), Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_YRWYRII_20250110_152452")));
                }
                
                if (Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_BSWYRII_20250113_145010")))
                    return true;
                
                if (Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_YRWYRII_20250110_152452")))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd2fd8b474ab3f235), EConversationDebugInfo::Executing);
                // What's your problem with mages? 
                Hero.AI.Say(LocText("TEXT_WIP_YRWYRII_20250110_152641_2386"));
                DC(int64(0xd2fd8b474ab3f235), EConversationDebugInfo::Done);
                DC(int64(0x6b50f48009bbe77b), EConversationDebugInfo::Executing);
                
                // What do you care?
                Quentin.AI.Say(LocText("TEXT_WIP_BSWYRII_20250113_132501"));
                DC(int64(0x6b50f48009bbe77b), EConversationDebugInfo::Done);
                DC(int64(0x6b50f48009bbe77d), EConversationDebugInfo::Executing);
                
                // Just trying to understand.
                Hero.AI.Say(LocText("TEXT_WIP_BSWYRII_20250113_132528"));
                DC(int64(0x6b50f48009bbe77d), EConversationDebugInfo::Done);
                DC(int64(0x6b50f48009bbe77e), EConversationDebugInfo::Executing);
                
                // (deep sigh) I was a soldier before this. Fought orcs up ...
                Quentin.AI.Say(LocText("TEXT_WIP_BSWYRII_20250113_132534"));
                DC(int64(0x6b50f48009bbe77e), EConversationDebugInfo::Done);
                DC(int64(0x6b50f48009bbe77f), EConversationDebugInfo::Executing);
                // There was a Fire Mage in our division, and one day, we ...
                Quentin.AI.Say(LocText("TEXT_WIP_BSWYRII_20250113_133350"));
                DC(int64(0x6b50f48009bbe77f), EConversationDebugInfo::Done);
                DC(int64(0x6b50f48009bbe786), EConversationDebugInfo::Executing);
                // They were pushing us hard, and we were barely standing a ...
                Quentin.AI.Say(LocText("TEXT_WIP_BSWYRII_20250113_133520"));
                DC(int64(0x6b50f48009bbe786), EConversationDebugInfo::Done);
                DC(int64(0x6b50f48009bbe787), EConversationDebugInfo::Executing);
                
                // What happened? 
                Hero.AI.Say(LocText("TEXT_WIP_BSWYRII_20250113_133622"));
                DC(int64(0x6b50f48009bbe787), EConversationDebugInfo::Done);
                DC(int64(0x6b50f48009bbe788), EConversationDebugInfo::Executing);
                
                // What happened was that yonder holy mage decided that us ...
                Quentin.AI.Say(LocText("TEXT_WIP_BSWYRII_20250113_133625"));
                DC(int64(0x6b50f48009bbe788), EConversationDebugInfo::Done);
                DC(int64(0x6b50f48009bbe789), EConversationDebugInfo::Executing);
                // It killed the orcs. It killed most of us, too. 
                Quentin.AI.Say(LocText("TEXT_WIP_BSWYRII_20250113_134155"));
                DC(int64(0x6b50f48009bbe789), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Quentin_137885,
                    UTopic_Quentin_137905,
                    UTopic_Quentin_138362,
                    UTopic_Quentin_138382,
                    UTopic_Quentin_138615
                );
                DC(int64(0x6b50f48009bbe7bd), EConversationDebugInfo::Executing);
                // I know people fuck up, and though I'm pretty sure that ...
                Quentin.AI.Say(LocText("TEXT_WIP_BSWYRII_20250113_134727_3286"));
                DC(int64(0x6b50f48009bbe7bd), EConversationDebugInfo::Done);
                DC(int64(0x6b50f48009bbe7c6), EConversationDebugInfo::Executing);
                // The problem is the nature of magic in and of itself. No ...
                Quentin.AI.Say(LocText("TEXT_WIP_BSWYRII_20250113_134852"));
                DC(int64(0x6b50f48009bbe7c6), EConversationDebugInfo::Done);
                DC(int64(0x6b50f48009bbe7d3), EConversationDebugInfo::Executing);
                // It makes you think you're "better than them," and that's ...
                Quentin.AI.Say(LocText("TEXT_WIP_BSWYRII_20250113_135237"));
                DC(int64(0x6b50f48009bbe7d3), EConversationDebugInfo::Done);
                DC(int64(0x6b50f48009bbe7d4), EConversationDebugInfo::Executing);
                // So, yeah, I'm sure there are good mages out there, but ...
                Quentin.AI.Say(LocText("TEXT_WIP_BSWYRII_20250113_135351"));
                DC(int64(0x6b50f48009bbe7d4), EConversationDebugInfo::Done);
                DC(int64(0x6b50f48009bbe7d5), EConversationDebugInfo::Executing);
                // Turned out I wasn't the only New Camper who saw it that ...
                Quentin.AI.Say(LocText("TEXT_WIP_BSWYRII_20250113_135432"));
                DC(int64(0x6b50f48009bbe7d5), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Quentin_137885 : UTopic_Hero__BC_BAN_QUENTIN_858
        {
            default DebugId = int64(0x6b50f48009bbe78d);
            default Caption = LocText("TEXT_WIP_BSWYRII_20250113_134233_41");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Quentin_137885);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6b50f48009bbe78e), EConversationDebugInfo::Executing);
                
                // How did you survive? 
                Hero.AI.Say(LocText("TEXT_WIP_BSWYRII_20250113_134233_41"));
                DC(int64(0x6b50f48009bbe78e), EConversationDebugInfo::Done);
                DC(int64(0x6b50f48009bbe799), EConversationDebugInfo::Executing);
                
                // Dumb luck. There was a rock overhang just next to where ...
                Quentin.AI.Say(LocText("TEXT_WIP_BSWYRII_20250113_134255"));
                DC(int64(0x6b50f48009bbe799), EConversationDebugInfo::Done);
                DC(int64(0x6b50f48009bbe79a), EConversationDebugInfo::Executing);
                // Prime spot to see your own comrades burn to death ...
                Quentin.AI.Say(LocText("TEXT_WIP_BSWYRII_20250113_134321"));
                DC(int64(0x6b50f48009bbe79a), EConversationDebugInfo::Done);
                DC(int64(0x6b50f48009bbe790), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x6b50f48009bbe790), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Quentin_137905 : UTopic_Hero__BC_BAN_QUENTIN_858
        {
            default DebugId = int64(0x6b50f48009bbe791);
            default Caption = LocText("TEXT_WIP_BSWYRII_20250113_134233_2238");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Quentin_137905);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6b50f48009bbe792), EConversationDebugInfo::Executing);
                // Was that mage put to justice? 
                Hero.AI.Say(LocText("TEXT_WIP_BSWYRII_20250113_134233_2238"));
                DC(int64(0x6b50f48009bbe792), EConversationDebugInfo::Done);
                DC(int64(0x6b50f48009bbe7ab), EConversationDebugInfo::Executing);
                
                // Give it your best guess. 
                Quentin.AI.Say(LocText("TEXT_WIP_BSWYRII_20250113_134425"));
                DC(int64(0x6b50f48009bbe7ab), EConversationDebugInfo::Done);
                DC(int64(0x6b50f48009bbe794), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x6b50f48009bbe794), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Quentin_138362 : UTopic_Hero__BC_BAN_QUENTIN_858
        {
            default DebugId = int64(0x6b50f48009bbe79b);
            default Caption = LocText("TEXT_WIP_BSWYRII_20250113_134407_1924");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Quentin_138362);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6b50f48009bbe79c), EConversationDebugInfo::Executing);
                // What an asshole. 
                Hero.AI.Say(LocText("TEXT_WIP_BSWYRII_20250113_134407_1924"));
                DC(int64(0x6b50f48009bbe79c), EConversationDebugInfo::Done);
                DC(int64(0x6b50f48009bbe7b4), EConversationDebugInfo::Executing);
                
                // That's putting it mildly. 
                Quentin.AI.Say(LocText("TEXT_WIP_BSWYRII_20250113_134533"));
                DC(int64(0x6b50f48009bbe7b4), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Quentin_138382 : UTopic_Hero__BC_BAN_QUENTIN_858
        {
            default DebugId = int64(0x6b50f48009bbe7a1);
            default Caption = LocText("TEXT_WIP_BSWYRII_20250113_134409_2785");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Quentin_138382);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6b50f48009bbe7a2), EConversationDebugInfo::Executing);
                
                // I'm sorry. 
                Hero.AI.Say(LocText("TEXT_WIP_BSWYRII_20250113_134409_2785"));
                DC(int64(0x6b50f48009bbe7a2), EConversationDebugInfo::Done);
                DC(int64(0x6b50f48009bbe7b5), EConversationDebugInfo::Executing);
                
                // Hm. 
                Quentin.AI.Say(LocText("TEXT_WIP_BSWYRII_20250113_134543"));
                DC(int64(0x6b50f48009bbe7b5), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Quentin_138615 : UTopic_Hero__BC_BAN_QUENTIN_858
        {
            default DebugId = int64(0x6b50f48009bbe7ae);
            default Caption = LocText("TEXT_WIP_BSWYRII_20250113_134502_3436");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Quentin_138615);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6b50f48009bbe7af), EConversationDebugInfo::Executing);
                
                // And now you hate all mages?
                Hero.AI.Say(LocText("TEXT_WIP_BSWYRII_20250113_134502_3436"));
                DC(int64(0x6b50f48009bbe7af), EConversationDebugInfo::Done);
                DC(int64(0x6b50f48009bbe7b6), EConversationDebugInfo::Executing);
                
                // Look, I'm not an idiot. 
                Quentin.AI.Say(LocText("TEXT_WIP_BSWYRII_20250113_134556"));
                DC(int64(0x6b50f48009bbe7b6), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceQuentin143056 : UTopic_Hero__BC_BAN_QUENTIN_858
        {
            default DebugId = int64(0x6b50f48009bbe80e);
            default Caption = LocText("TEXT_WIP_BSWYRII_20250113_141435");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceQuentin143056);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6b50f48009bbe80a), EConversationDebugInfo::Executing);
                
                // How are you guys getting by? You don't trade with the ...
                Hero.AI.Say(LocText("TEXT_WIP_BSWYRII_20250113_141435"));
                DC(int64(0x6b50f48009bbe80a), EConversationDebugInfo::Done);
                DC(int64(0x6b50f48009bbe80b), EConversationDebugInfo::Executing);
                
                // So?
                Quentin.AI.Say(LocText("TEXT_WIP_BSWYRII_20250113_141435_686"));
                DC(int64(0x6b50f48009bbe80b), EConversationDebugInfo::Done);
                DC(int64(0x6b50f48009bbe813), EConversationDebugInfo::Executing);
                
                // So, where do you get your resources from? Food, wine, ...
                Hero.AI.Say(LocText("TEXT_WIP_BSWYRII_20250113_141546"));
                DC(int64(0x6b50f48009bbe813), EConversationDebugInfo::Done);
                DC(int64(0x6b50f48009bbe812), EConversationDebugInfo::Executing);
                
                // Food, we gather and hunt. Sure, a molerat steak ain't a ...
                Quentin.AI.Say(LocText("TEXT_WIP_BSWYRII_20250113_141519"));
                DC(int64(0x6b50f48009bbe812), EConversationDebugInfo::Done);
                DC(int64(0x6b50f48009bbe816), EConversationDebugInfo::Executing);
                // Wine's rare, but there's other booze, and sometimes we ...
                Quentin.AI.Say(LocText("TEXT_WIP_BSWYRII_20250113_141950"));
                DC(int64(0x6b50f48009bbe816), EConversationDebugInfo::Done);
                DC(int64(0x6b50f48009bbe814), EConversationDebugInfo::Executing);
                // And as far as weapons are concerned, well, this is ...
                Quentin.AI.Say(LocText("TEXT_WIP_BSWYRII_20250113_141628"));
                DC(int64(0x6b50f48009bbe814), EConversationDebugInfo::Done);
                DC(int64(0x6b50f48009bbe815), EConversationDebugInfo::Executing);
                // What more do you need? 
                Quentin.AI.Say(LocText("TEXT_WIP_BSWYRII_20250113_141701"));
                DC(int64(0x6b50f48009bbe815), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceQuentin144038 : UTopic_Hero__BC_BAN_QUENTIN_858
        {
            default DebugId = int64(0x6b50f48009bbe81b);
            default Caption = LocText("TEXT_WIP_BSWYRII_20250113_142214");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceQuentin144038);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6b50f48009bbe817), EConversationDebugInfo::Executing);
                
                // What do you make of Gomez? 
                Hero.AI.Say(LocText("TEXT_WIP_BSWYRII_20250113_142214"));
                DC(int64(0x6b50f48009bbe817), EConversationDebugInfo::Done);
                DC(int64(0x6b50f48009bbe818), EConversationDebugInfo::Executing);
                
                // He's a warlord and a cutthroat. No more and no less. 
                Quentin.AI.Say(LocText("TEXT_WIP_BSWYRII_20250113_142214_3984"));
                DC(int64(0x6b50f48009bbe818), EConversationDebugInfo::Done);
                DC(int64(0x6b50f48009bbe81d), EConversationDebugInfo::Executing);
                // Don't get me wrong, I ain't no saint either, but if ...
                Quentin.AI.Say(LocText("TEXT_WIP_BSWYRII_20250113_142244"));
                DC(int64(0x6b50f48009bbe81d), EConversationDebugInfo::Done);
                DC(int64(0x6b50f48009bbe81e), EConversationDebugInfo::Executing);
                // There's a reason I joined up with Lee and Lares back ...
                Quentin.AI.Say(LocText("TEXT_WIP_BSWYRII_20250113_142427"));
                DC(int64(0x6b50f48009bbe81e), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceQuentin144522 : UTopic_Hero__BC_BAN_QUENTIN_858
        {
            default DebugId = int64(0x6b50f48009bbe823);
            default Caption = LocText("TEXT_WIP_BSWYRII_20250113_142448");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceQuentin144522);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6b50f48009bbe81f), EConversationDebugInfo::Executing);
                
                // What are your thoughts on the Brotherhood? 
                Hero.AI.Say(LocText("TEXT_WIP_BSWYRII_20250113_142448"));
                DC(int64(0x6b50f48009bbe81f), EConversationDebugInfo::Done);
                DB(int64(0x6b50f48009bbe826), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp))
                {
                    DC(int64(0x6b50f48009bbe82b), EConversationDebugInfo::Executing);
                    // Why? You trying to "show me the Sleeper's light?"
                    Quentin.AI.Say(LocText("TEXT_WIP_BSWYRII_20250113_142520"));
                    DC(int64(0x6b50f48009bbe82b), EConversationDebugInfo::Done);
                    DC(int64(0x6b50f48009bbe82c), EConversationDebugInfo::Executing);
                    
                    // Just curious. 
                    Hero.AI.Say(LocText("TEXT_WIP_BSWYRII_20250113_142520_443"));
                    DC(int64(0x6b50f48009bbe82c), EConversationDebugInfo::Done);
                    DC(int64(0x6b50f48009bbe835), EConversationDebugInfo::Executing);
                    
                    // You're one level-headed templar. 
                    Quentin.AI.Say(LocText("TEXT_WIP_BSWYRII_20250113_142610"));
                    DC(int64(0x6b50f48009bbe835), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x6b50f48009bbe82f), EConversationDebugInfo::Executing);
                    // What am I? Your counselor, or something?
                    Quentin.AI.Say(LocText("TEXT_WIP_BSWYRII_20250113_142522"));
                    DC(int64(0x6b50f48009bbe82f), EConversationDebugInfo::Done);
                    DC(int64(0x6b50f48009bbe830), EConversationDebugInfo::Executing);
                    
                    // I'm curious. 
                    Hero.AI.Say(LocText("TEXT_WIP_BSWYRII_20250113_142522_1769"));
                    DC(int64(0x6b50f48009bbe830), EConversationDebugInfo::Done);
                    DC(int64(0x6b50f48009bbe836), EConversationDebugInfo::Executing);
                    
                    // Uh-huh. 
                    Quentin.AI.Say(LocText("TEXT_WIP_BSWYRII_20250113_142855"));
                    DC(int64(0x6b50f48009bbe836), EConversationDebugInfo::Done);
                }
                DC(int64(0x6b50f48009bbe838), EConversationDebugInfo::Executing);
                // Honestly, I don't have an opinion on them. 
                Quentin.AI.Say(LocText("TEXT_WIP_BSWYRII_20250113_142908_491"));
                DC(int64(0x6b50f48009bbe838), EConversationDebugInfo::Done);
                DC(int64(0x6b50f48009bbe83f), EConversationDebugInfo::Executing);
                // To me, it looks like a bunch of sad men trying to cope ...
                Quentin.AI.Say(LocText("TEXT_WIP_BSWYRII_20250113_142934"));
                DC(int64(0x6b50f48009bbe83f), EConversationDebugInfo::Done);
                DC(int64(0x6b50f48009bbe840), EConversationDebugInfo::Executing);
                // Then again, I do know their gurus have strange powers, ...
                Quentin.AI.Say(LocText("TEXT_WIP_BSWYRII_20250113_143014"));
                DC(int64(0x6b50f48009bbe840), EConversationDebugInfo::Done);
                DC(int64(0x6b50f48009bbe841), EConversationDebugInfo::Executing);
                // I'll just keep my distance. Worked thus far. 
                Quentin.AI.Say(LocText("TEXT_WIP_BSWYRII_20250113_143041"));
                DC(int64(0x6b50f48009bbe841), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceQuentin220345 : UTopic_Hero__BC_BAN_QUENTIN_858
        {
            default DebugId = int64(0x3216f5378b45f81e);
            default Caption = LocText("TEXT_WIP_HBBFEBC_20260206_180952");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceQuentin220345);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf7fe73424d213f34), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp));
                    DB(int64(0xf7fe73424d213f35), Quest::NewCamp_NCCHAPTER4_BANNEDFROMOC != nullptr && !Quest::NewCamp_NCCHAPTER4_BANNEDFROMOC.HasBeenStarted());
                    DB(int64(0x5b7b18e2528c9561), Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_MRZXSLD_20241031_122854_41")));
                    DB(int64(0xf7fe73424d213f34), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp));
                    DB(int64(0xf7fe73424d213f35), Quest::NewCamp_NCCHAPTER4_BANNEDFROMOC != nullptr && !Quest::NewCamp_NCCHAPTER4_BANNEDFROMOC.HasBeenStarted());
                    DB(int64(0x5b7b18e2528c9561), Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_MRZXSLD_20241031_124131_443")));
                }
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && Quest::NewCamp_NCCHAPTER4_BANNEDFROMOC != nullptr && !Quest::NewCamp_NCCHAPTER4_BANNEDFROMOC.HasBeenStarted() && Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_MRZXSLD_20241031_122854_41")))
                    return true;
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && Quest::NewCamp_NCCHAPTER4_BANNEDFROMOC != nullptr && !Quest::NewCamp_NCCHAPTER4_BANNEDFROMOC.HasBeenStarted() && Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_MRZXSLD_20241031_124131_443")))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3216f5378b45f81a), EConversationDebugInfo::Executing);
                
                // Hey, can I join you?
                Hero.AI.Say(LocText("TEXT_WIP_HBBFEBC_20260206_180952"));
                DC(int64(0x3216f5378b45f81a), EConversationDebugInfo::Done);
                DC(int64(0x3216f5378b45f81b), EConversationDebugInfo::Executing);
                
                // No way.
                Quentin.AI.Say(LocText("TEXT_WIP_HBBFEBC_20260206_180952_41"));
                DC(int64(0x3216f5378b45f81b), EConversationDebugInfo::Done);
                DC(int64(0xe4fd696bc76351e3), EConversationDebugInfo::Executing);
                
                // Well, no harm in asking.
                Hero.AI.Say(LocText("TEXT_WIP_CLVUYVI_20260216_201457"));
                DC(int64(0xe4fd696bc76351e3), EConversationDebugInfo::Done);
                DC(int64(0x3216f5378b45f822), EConversationDebugInfo::Executing);
                
                // Sure.
                Quentin.AI.Say(LocText("TEXT_WIP_HBBFEBC_20260206_181056"));
                DC(int64(0x3216f5378b45f822), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */