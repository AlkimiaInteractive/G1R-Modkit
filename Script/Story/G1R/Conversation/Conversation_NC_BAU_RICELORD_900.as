#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_NC_BAU_RICELORD_900 : UConversationCharacterSettings
        {
            default ForCharacter = n"NC_BAU_RICELORD_900";
        }
        
        
        class UTopic_Hero__NC_BAU_RICELORD_900 : UG1RDialogTopic
        {
            default ForCharacter = n"NC_BAU_RICELORD_900";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetRiceLord() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetRayk() const property
            {
                return GetCharacter(n"NC_BAU_RAYK_941");
            }
        }
        
        
        class UChoiceRiceLord78563 : UTopic_Hero__NC_BAU_RICELORD_900
        {
            default DebugId = int64(0xb7eeaacd12174d51);
            default Caption = LocText("TEXT_DDIAZ_20240205_144555");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceRiceLord78563);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xb7eeaacd12174d55), Quest::NewCamp_NCCHAPTER1_RICELORDJOB != nullptr && Quest::NewCamp_NCCHAPTER1_RICELORDJOB.IsRunning());
                    DB(int64(0xeb67f06250d6d4c3), Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_ZFHDBGC_20240305_192939")));
                    DB(int64(0xcf584b8ed87279b6), Quest::NewCamp_NCCHAPTER1_RICELORDJOB != nullptr && Quest::NewCamp_NCCHAPTER1_RICELORDJOB.IsRunning());
                    DB(int64(0xcf584b8ed87279b7), Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_DDIAZ_20240206_111400_41")));
                }
                
                if (Quest::NewCamp_NCCHAPTER1_RICELORDJOB != nullptr && Quest::NewCamp_NCCHAPTER1_RICELORDJOB.IsRunning() && Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_ZFHDBGC_20240305_192939")))
                    return true;
                
                if (Quest::NewCamp_NCCHAPTER1_RICELORDJOB != nullptr && Quest::NewCamp_NCCHAPTER1_RICELORDJOB.IsRunning() && Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_DDIAZ_20240206_111400_41")))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb7eeaacd12174d4f), EConversationDebugInfo::Executing);
                // I helped Silas in the tavern. 
                Hero.AI.Say(LocText("TEXT_DDIAZ_20240205_144555"));
                DC(int64(0xb7eeaacd12174d4f), EConversationDebugInfo::Done);
                DC(int64(0xb7eeaacd12174d50), EConversationDebugInfo::Executing);
                
                // Good. Any trouble?
                RiceLord.AI.Say(LocText("TEXT_DDIAZ_20240205_144555_41"));
                DC(int64(0xb7eeaacd12174d50), EConversationDebugInfo::Done);
                DB(int64(0x466a7f49ecb2c684), G1R.RaykBeated != 0);
                
                if (G1R.RaykBeated != 0)
                {
                    DC(int64(0x466a7f49ecb2c685), EConversationDebugInfo::Executing);
                    // Guy named Rayk was acting up. I handled it.
                    Hero.AI.Say(LocText("TEXT_WIP_ZFHDBGC_20240305_193943"));
                    DC(int64(0x466a7f49ecb2c685), EConversationDebugInfo::Done);
                    DC(int64(0x466a7f49ecb2c686), EConversationDebugInfo::Executing);
                    
                    // The bare-knuckled way, I'm guessin'. Good. 
                    RiceLord.AI.Say(LocText("TEXT_WIP_ZFHDBGC_20240305_193943_686"));
                    DC(int64(0x466a7f49ecb2c686), EConversationDebugInfo::Done);
                    DC(int64(0x466a7f49ecb2c689), EConversationDebugInfo::Executing);
                    // Rayk's a sad character - used to be a good man, but fell ...
                    RiceLord.AI.Say(LocText("TEXT_WIP_ZFHDBGC_20240305_194055"));
                    DC(int64(0x466a7f49ecb2c689), EConversationDebugInfo::Done);
                    DC(int64(0x466a7f49ecb2c68a), EConversationDebugInfo::Executing);
                    // Anyway, take this for your efforts. 
                    RiceLord.AI.Say(LocText("TEXT_WIP_ZFHDBGC_20240305_194114"));
                    DC(int64(0x466a7f49ecb2c68a), EConversationDebugInfo::Done);
                    DC(int64(0xe87722ef5b6a460d), EConversationDebugInfo::Executing);
                    RiceLord.AddItemToInventory(UItMi_Orenugget, 25);
                    DC(int64(0xe87722ef5b6a460d), EConversationDebugInfo::Done);
                    DC(int64(0xb7eeaacd12174d57), EConversationDebugInfo::Executing);
                    RiceLord.AI.GiveItemTo(Hero, UItMi_Orenugget, 25);
                    DC(int64(0xb7eeaacd12174d57), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x466a7f49ecb2c687), EConversationDebugInfo::Executing);
                    // A guy named Rayk was acting up. I bought him a drink and ...
                    Hero.AI.Say(LocText("TEXT_WIP_ZFHDBGC_20240305_193946"));
                    DC(int64(0x466a7f49ecb2c687), EConversationDebugInfo::Done);
                    DC(int64(0x466a7f49ecb2c688), EConversationDebugInfo::Executing);
                    
                    // Really? Didn't peg you for a diplomat. What did he say? 
                    RiceLord.AI.Say(LocText("TEXT_WIP_ZFHDBGC_20240305_193946_2386"));
                    DC(int64(0x466a7f49ecb2c688), EConversationDebugInfo::Done);
                    Subdialog(
                        URiceLord_85227,
                        URiceLord_85247
                    );
                    DC(int64(0xe87722ef5b6a460d), EConversationDebugInfo::Executing);
                    RiceLord.AddItemToInventory(UItMi_Orenugget, 25);
                    DC(int64(0xe87722ef5b6a460d), EConversationDebugInfo::Done);
                    DC(int64(0xcf584b8ed87279bb), EConversationDebugInfo::Executing);
                    RiceLord.AI.GiveItemTo(Hero, UItMi_Orenugget, 25);
                    DC(int64(0xcf584b8ed87279bb), EConversationDebugInfo::Done);
                }
                DC(int64(0xcf584b8ed87279bd), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER1_RICELORDJOB_RICELORDJOB_OBJ_REPORTRL.SucceedQuest();
                DC(int64(0xcf584b8ed87279bd), EConversationDebugInfo::Done);
                DC(int64(0xcf584b8ed87279c3), EConversationDebugInfo::Executing);
                // Gotta say, seems you ain't as useless as most 'round ...
                RiceLord.AI.Say(LocText("TEXT_DDIAZ_20240206_120639_2238"));
                DC(int64(0xcf584b8ed87279c3), EConversationDebugInfo::Done);
                DB(int64(0xcf584b8ed87279c7), Quest::NewCamp_NCCHAPTER1_JOINNC != nullptr && Quest::NewCamp_NCCHAPTER1_JOINNC.IsRunning());
                
                if (Quest::NewCamp_NCCHAPTER1_JOINNC != nullptr && Quest::NewCamp_NCCHAPTER1_JOINNC.IsRunning())
                {
                    DC(int64(0xcf584b8ed87279c8), EConversationDebugInfo::Executing);
                    // If I do, would you speak to Lares for me? I'm trying to ...
                    Hero.AI.Say(LocText("TEXT_DDIAZ_20240206_121946"));
                    DC(int64(0xcf584b8ed87279c8), EConversationDebugInfo::Done);
                    DC(int64(0xcf584b8ed87279c9), EConversationDebugInfo::Executing);
                    
                    // High climber, are we? Sure, I can do that. 
                    RiceLord.AI.Say(LocText("TEXT_DDIAZ_20240206_121946_1924"));
                    DC(int64(0xcf584b8ed87279c9), EConversationDebugInfo::Done);
                }
                Subdialog(
                    URiceLord_108964,
                    URiceLord_108984
                );
            }
        }
        
        
        class URiceLord_85227 : UTopic_Hero__NC_BAU_RICELORD_900
        {
            default DebugId = int64(0x466a7f49ecb2c691);
            default Caption = LocText("TEXT_WIP_ZFHDBGC_20240305_194226_3984");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(URiceLord_85227);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x466a7f49ecb2c692), EConversationDebugInfo::Executing);
                // Not much. 
                Hero.AI.Say(LocText("TEXT_WIP_ZFHDBGC_20240305_194226_3984"));
                DC(int64(0x466a7f49ecb2c692), EConversationDebugInfo::Done);
                DC(int64(0x466a7f49ecb2c699), EConversationDebugInfo::Executing);
                
                // I see. Well, take that for your efforts. 
                RiceLord.AI.Say(LocText("TEXT_WIP_ZFHDBGC_20240305_194342"));
                DC(int64(0x466a7f49ecb2c699), EConversationDebugInfo::Done);
            }
        }
        
        
        class URiceLord_85247 : UTopic_Hero__NC_BAU_RICELORD_900
        {
            default DebugId = int64(0x466a7f49ecb2c695);
            default Caption = LocText("TEXT_WIP_ZFHDBGC_20240305_194226_3569");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(URiceLord_85247);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x466a7f49ecb2c696), EConversationDebugInfo::Executing);
                
                // He said he knows you. And that you fucked him over. 
                Hero.AI.Say(LocText("TEXT_WIP_ZFHDBGC_20240305_194226_3569"));
                DC(int64(0x466a7f49ecb2c696), EConversationDebugInfo::Done);
                DC(int64(0x466a7f49ecb2c69c), EConversationDebugInfo::Executing);
                
                // Did he, now?
                RiceLord.AI.Say(LocText("TEXT_WIP_ZFHDBGC_20240305_194422"));
                DC(int64(0x466a7f49ecb2c69c), EConversationDebugInfo::Done);
                DC(int64(0x466a7f49ecb2c69e), EConversationDebugInfo::Executing);
                
                // Is it true?
                Hero.AI.Say(LocText("TEXT_WIP_ZFHDBGC_20240305_194506"));
                DC(int64(0x466a7f49ecb2c69e), EConversationDebugInfo::Done);
                DC(int64(0x466a7f49ecb2c69f), EConversationDebugInfo::Executing);
                
                // Depends on who's tellin' the story, I s'pose. Yeah, I ...
                RiceLord.AI.Say(LocText("TEXT_WIP_ZFHDBGC_20240305_194510"));
                DC(int64(0x466a7f49ecb2c69f), EConversationDebugInfo::Done);
                DC(int64(0x466a7f49ecb2c6a0), EConversationDebugInfo::Executing);
                // But I did it 'cause I'm the right man for the job. Rayk ...
                RiceLord.AI.Say(LocText("TEXT_WIP_ZFHDBGC_20240305_194558"));
                DC(int64(0x466a7f49ecb2c6a0), EConversationDebugInfo::Done);
                DC(int64(0x466a7f49ecb2c6a1), EConversationDebugInfo::Executing);
                // Fuck's sake, I even offered him to be me foreman, but ...
                RiceLord.AI.Say(LocText("TEXT_WIP_ZFHDBGC_20240305_194626"));
                DC(int64(0x466a7f49ecb2c6a1), EConversationDebugInfo::Done);
                DC(int64(0x466a7f49ecb2c6a2), EConversationDebugInfo::Executing);
                // Anyway, enough of that. You took care of the job - ...
                RiceLord.AI.Say(LocText("TEXT_WIP_ZFHDBGC_20240305_194704"));
                DC(int64(0x466a7f49ecb2c6a2), EConversationDebugInfo::Done);
            }
        }
        
        
        class URiceLord_108964 : UTopic_Hero__NC_BAU_RICELORD_900
        {
            default DebugId = int64(0x36f542dcf94cedad);
            default Caption = LocText("TEXT_WIP_AGXCIAC_20240904_141738_41");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(URiceLord_108964);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x36f542dcf94cedae), EConversationDebugInfo::Executing);
                
                // Maybe later.
                Hero.AI.Say(LocText("TEXT_WIP_AGXCIAC_20240904_141738_41"));
                DC(int64(0x36f542dcf94cedae), EConversationDebugInfo::Done);
                DC(int64(0x36f542dcf94cedb6), EConversationDebugInfo::Executing);
                
                // Well, be fast about it. I ain't got all day. 
                RiceLord.AI.Say(LocText("TEXT_WIP_AGXCIAC_20240904_141939"));
                DC(int64(0x36f542dcf94cedb6), EConversationDebugInfo::Done);
            }
        }
        
        
        class URiceLord_108984 : UTopic_Hero__NC_BAU_RICELORD_900
        {
            default DebugId = int64(0x36f542dcf94cedb1);
            default Caption = LocText("TEXT_DDIAZ_20240206_122338");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(URiceLord_108984);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xcf584b8ed87279cf), EConversationDebugInfo::Executing);
                
                // All right. Tell me more. 
                Hero.AI.Say(LocText("TEXT_DDIAZ_20240206_122338"));
                DC(int64(0xcf584b8ed87279cf), EConversationDebugInfo::Done);
                DC(int64(0xcf584b8ed87279d1), EConversationDebugInfo::Executing);
                
                // That's the spirit.
                RiceLord.AI.Say(LocText("TEXT_DDIAZ_20240206_122447"));
                DC(int64(0xcf584b8ed87279d1), EConversationDebugInfo::Done);
                DC(int64(0xcf584b8ed87279d2), EConversationDebugInfo::Executing);
                // Me foreman, Bran, went missin' a couple days ago. I want ...
                RiceLord.AI.Say(LocText("TEXT_DDIAZ_20240206_122544"));
                DC(int64(0xcf584b8ed87279d2), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_RICELORDFOREMAN, Document::UDocumentSegment_CH1_RICELORDFOREMAN_Start);
                DC(int64(0xcf584b8ed87279dd), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN.StartQuest();
                DC(int64(0xcf584b8ed87279dd), EConversationDebugInfo::Done);
                DC(int64(0x132d36919eee4a1a), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Rayk))) { Rayk.ExchangeDailyRoutineToClass(UDailyRoutine_NC_BAU_Rayk_941_Sleep); }
                DC(int64(0x132d36919eee4a1a), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceRiceLord79261 : UTopic_Hero__NC_BAU_RICELORD_900
        {
            default DebugId = int64(0x70be289386490898);
            default Caption = LocText("TEXT_DDIAZ_20240205_142233");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceRicelordHello);
            default Rules.HideIfKnows(UChoiceRiceLord79261);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x9dc6f21bc5b718c6), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                }
                
                return Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x70be289386490896), EConversationDebugInfo::Executing);
                // I'm looking to make myself useful. Do you need help with ...
                Hero.AI.Say(LocText("TEXT_DDIAZ_20240205_142233"));
                DC(int64(0x70be289386490896), EConversationDebugInfo::Done);
                DC(int64(0x70be289386490897), EConversationDebugInfo::Executing);
                
                // From a freshie? Hmm ... You know what, now that you ...
                RiceLord.AI.Say(LocText("TEXT_DDIAZ_20240205_142233_3902"));
                DC(int64(0x70be289386490897), EConversationDebugInfo::Done);
                DC(int64(0x70be28938649089a), EConversationDebugInfo::Executing);
                // Silas, the innkeep at the lake tavern, said he could use ...
                RiceLord.AI.Say(LocText("TEXT_DDIAZ_20240205_143032"));
                DC(int64(0x70be28938649089a), EConversationDebugInfo::Done);
                DC(int64(0x653d12cc4be39623), EConversationDebugInfo::Executing);
                // Go there and tell him I sent you. Maybe you can make ...
                RiceLord.AI.Say(LocText("TEXT_WIP_BKSKLDM_20240219_102839"));
                DC(int64(0x653d12cc4be39623), EConversationDebugInfo::Done);
                DC(int64(0x6cb95be92da295f5), EConversationDebugInfo::Executing);
                
                // All right. 
                Hero.AI.Say(LocText("TEXT_WIP_VFHDBGC_20240301_181640"));
                DC(int64(0x6cb95be92da295f5), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_RICELORDJOB, Document::UDocumentSegment_CH1_RICELORDJOB_Intro);
                DC(int64(0xb7eeaacd12174d4d), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER1_RICELORDJOB.StartQuest();
                DC(int64(0xb7eeaacd12174d4d), EConversationDebugInfo::Done);
                DC(int64(0xe6263f0bcd03bbc), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER1_RICELORDJOB_RICELORDJOB_OBJ_ASK_SILAS.StartQuest();
                DC(int64(0xe6263f0bcd03bbc), EConversationDebugInfo::Done);
                DC(int64(0xb7eeaacd12174d4e), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xb7eeaacd12174d4e), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceRiceLord81400 : UTopic_Hero__NC_BAU_RICELORD_900
        {
            default DebugId = int64(0x132d36919eee4a46);
            default Caption = LocText("TEXT_WIP_QJSKLDM_20240212_120939");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceRiceLord81400);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_QJSKLDM_20240212_111727_2785"), int64(0x132d36919eee4a46));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x132d36919eee4a49), Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN != nullptr && Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN.IsRunning());
                }
                
                return Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN != nullptr && Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x132d36919eee4a44), EConversationDebugInfo::Executing);
                // I found Bran. He's dead.
                Hero.AI.Say(LocText("TEXT_WIP_QJSKLDM_20240212_120939"));
                DC(int64(0x132d36919eee4a44), EConversationDebugInfo::Done);
                DC(int64(0x132d36919eee4a45), EConversationDebugInfo::Executing);
                
                // ... How?
                RiceLord.AI.Say(LocText("TEXT_WIP_QJSKLDM_20240212_120939_3984"));
                DC(int64(0x132d36919eee4a45), EConversationDebugInfo::Done);
                Subdialog(
                    URiceLord_81426,
                    URiceLord_85832,
                    URiceLord_81446
                );
            }
        }
        
        
        class URiceLord_81426 : UTopic_Hero__NC_BAU_RICELORD_900
        {
            default DebugId = int64(0x132d36919eee4a4c);
            default Caption = LocText("TEXT_WIP_QJSKLDM_20240212_121116_3569");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(URiceLord_81426);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x16ea4de256928502), Hero != nullptr && Hero.HasItem(UItMs_Axe_Bran, 1, 0));
                }
                
                return Hero != nullptr && Hero.HasItem(UItMs_Axe_Bran, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x132d36919eee4a4d), EConversationDebugInfo::Executing);
                // Silas killed him in his cellar. I found proof.
                Hero.AI.Say(LocText("TEXT_WIP_QJSKLDM_20240212_121116_3569"));
                DC(int64(0x132d36919eee4a4d), EConversationDebugInfo::Done);
                DC(int64(0x2ae5b369ff5142f5), EConversationDebugInfo::Executing);
                Hero.RemoveItemFromInventory(UItMs_Axe_Bran, 1, 0);
                DC(int64(0x2ae5b369ff5142f5), EConversationDebugInfo::Done);
                DC(int64(0x2ae5b369ff5142f8), EConversationDebugInfo::Executing);
                Hero.AddItemToInventory(UItMw_1H_Axe_Bran, 1);
                DC(int64(0x2ae5b369ff5142f8), EConversationDebugInfo::Done);
                DC(int64(0x132d36919eee4a54), EConversationDebugInfo::Executing);
                // ... Silas? But why? 
                RiceLord.AI.Say(LocText("TEXT_WIP_QJSKLDM_20240212_121407"));
                DC(int64(0x132d36919eee4a54), EConversationDebugInfo::Done);
                DC(int64(0x91cd37b949f162f8), EConversationDebugInfo::Executing);
                
                // Seems like Bran was after his stash.
                Hero.AI.Say(LocText("TEXT_WIP_LIWVLHC_20240312_172712"));
                DC(int64(0x91cd37b949f162f8), EConversationDebugInfo::Done);
                DC(int64(0x91cd37b949f162f9), EConversationDebugInfo::Executing);
                
                // I see. Probably his debts. Shit ... he should've just ...
                RiceLord.AI.Say(LocText("TEXT_WIP_LIWVLHC_20240312_172712_2801"));
                DC(int64(0x91cd37b949f162f9), EConversationDebugInfo::Done);
                DC(int64(0x91cd37b949f162fa), EConversationDebugInfo::Executing);
                // Good job about Silas, though. Stash or not, there'll be ...
                RiceLord.AI.Say(LocText("TEXT_WIP_LIWVLHC_20240312_173024"));
                DC(int64(0x91cd37b949f162fa), EConversationDebugInfo::Done);
                DC(int64(0x91cd37b949f162fb), EConversationDebugInfo::Executing);
                // Here - for your efforts. 
                RiceLord.AI.Say(LocText("TEXT_WIP_LIWVLHC_20240312_173113"));
                DC(int64(0x91cd37b949f162fb), EConversationDebugInfo::Done);
                DC(int64(0xe87722ef5b6a460d), EConversationDebugInfo::Executing);
                RiceLord.AddItemToInventory(UItMi_Orenugget, 50);
                DC(int64(0xe87722ef5b6a460d), EConversationDebugInfo::Done);
                DC(int64(0x132d36919eee4a59), EConversationDebugInfo::Executing);
                RiceLord.AI.GiveItemTo(Hero, UItMi_Orenugget, 50);
                DC(int64(0x132d36919eee4a59), EConversationDebugInfo::Done);
                DC(int64(0x132d36919eee4a5e), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN_RICELORDFOREMAN_OBJ_REPORT.SucceedQuest();
                DC(int64(0x132d36919eee4a5e), EConversationDebugInfo::Done);
                DC(int64(0xa2f911ca66fa904b), EConversationDebugInfo::Executing);
                G1R.Points_NC += 20;
                DC(int64(0xa2f911ca66fa904b), EConversationDebugInfo::Done);
                DC(int64(0x7858bf075764a0e1), EConversationDebugInfo::Executing);
                RiceLord.RemoveImmortality();
                DC(int64(0x7858bf075764a0e1), EConversationDebugInfo::Done);
                DC(int64(0x56a4a1bf169aa8f7), EConversationDebugInfo::Executing);
                G1R.SilasGuilty = 1;
                DC(int64(0x56a4a1bf169aa8f7), EConversationDebugInfo::Done);
            }
        }
        
        
        class URiceLord_85832 : UTopic_Hero__NC_BAU_RICELORD_900
        {
            default DebugId = int64(0x91cd37b949f162ef);
            default Caption = LocText("TEXT_WIP_LIWVLHC_20240312_172426_1609");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(URiceLord_85832);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_LIWVLHC_20240312_171819"), int64(0x91cd37b949f162ef));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x2ae5b369ff514315), Hero != nullptr && Hero.HasItem(UItMs_Axe_Bran, 1, 0));
                }
                
                return Hero != nullptr && Hero.HasItem(UItMs_Axe_Bran, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x91cd37b949f162f0), EConversationDebugInfo::Executing);
                // Silas killed him. I showed him proof, and he tried to ...
                Hero.AI.Say(LocText("TEXT_WIP_LIWVLHC_20240312_172426_1609"));
                DC(int64(0x91cd37b949f162f0), EConversationDebugInfo::Done);
                DC(int64(0x2ae5b369ff5142fb), EConversationDebugInfo::Executing);
                Hero.RemoveItemFromInventory(UItMs_Axe_Bran, 1, 0);
                DC(int64(0x2ae5b369ff5142fb), EConversationDebugInfo::Done);
                DC(int64(0x2ae5b369ff5142fd), EConversationDebugInfo::Executing);
                Hero.AddItemToInventory(UItMw_1H_Axe_Bran, 1);
                DC(int64(0x2ae5b369ff5142fd), EConversationDebugInfo::Done);
                DC(int64(0x91cd37b949f162f3), EConversationDebugInfo::Executing);
                // ... That bastard. But why?
                RiceLord.AI.Say(LocText("TEXT_WIP_LIWVLHC_20240312_172609"));
                DC(int64(0x91cd37b949f162f3), EConversationDebugInfo::Done);
                DC(int64(0x91cd37b949f162f8), EConversationDebugInfo::Executing);
                
                // Seems like Bran was after his stash.
                Hero.AI.Say(LocText("TEXT_WIP_LIWVLHC_20240312_172712"));
                DC(int64(0x91cd37b949f162f8), EConversationDebugInfo::Done);
                DC(int64(0x91cd37b949f162f9), EConversationDebugInfo::Executing);
                
                // I see. Probably his debts. Shit ... he should've just ...
                RiceLord.AI.Say(LocText("TEXT_WIP_LIWVLHC_20240312_172712_2801"));
                DC(int64(0x91cd37b949f162f9), EConversationDebugInfo::Done);
                DC(int64(0x91cd37b949f162fa), EConversationDebugInfo::Executing);
                // Good job about Silas, though. Stash or not, there'll be ...
                RiceLord.AI.Say(LocText("TEXT_WIP_LIWVLHC_20240312_173024"));
                DC(int64(0x91cd37b949f162fa), EConversationDebugInfo::Done);
                DC(int64(0x91cd37b949f162fb), EConversationDebugInfo::Executing);
                // Here - for your efforts. 
                RiceLord.AI.Say(LocText("TEXT_WIP_LIWVLHC_20240312_173113"));
                DC(int64(0x91cd37b949f162fb), EConversationDebugInfo::Done);
                DC(int64(0xe87722ef5b6a460d), EConversationDebugInfo::Executing);
                RiceLord.AddItemToInventory(UItMi_Orenugget, 50);
                DC(int64(0xe87722ef5b6a460d), EConversationDebugInfo::Done);
                DC(int64(0x132d36919eee4a59), EConversationDebugInfo::Executing);
                RiceLord.AI.GiveItemTo(Hero, UItMi_Orenugget, 50);
                DC(int64(0x132d36919eee4a59), EConversationDebugInfo::Done);
                DC(int64(0x132d36919eee4a5e), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN_RICELORDFOREMAN_OBJ_REPORT.SucceedQuest();
                DC(int64(0x132d36919eee4a5e), EConversationDebugInfo::Done);
                DC(int64(0xa2f911ca66fa904d), EConversationDebugInfo::Executing);
                G1R.Points_NC += 20;
                DC(int64(0xa2f911ca66fa904d), EConversationDebugInfo::Done);
                DC(int64(0x7858bf075764a0df), EConversationDebugInfo::Executing);
                RiceLord.RemoveImmortality();
                DC(int64(0x7858bf075764a0df), EConversationDebugInfo::Done);
                DC(int64(0x56a4a1bf169aa8f9), EConversationDebugInfo::Executing);
                G1R.SilasGuilty = 1;
                DC(int64(0x56a4a1bf169aa8f9), EConversationDebugInfo::Done);
            }
        }
        
        
        class URiceLord_81446 : UTopic_Hero__NC_BAU_RICELORD_900
        {
            default DebugId = int64(0x132d36919eee4a50);
            default Caption = LocText("TEXT_WIP_QJSKLDM_20240212_121116_443");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(URiceLord_81446);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x132d36919eee4a51), EConversationDebugInfo::Executing);
                // Not sure. I found him in Silas' cellar, in the lake. ...
                Hero.AI.Say(LocText("TEXT_WIP_QJSKLDM_20240212_121116_443"));
                DC(int64(0x132d36919eee4a51), EConversationDebugInfo::Done);
                DC(int64(0x132d36919eee4a57), EConversationDebugInfo::Executing);
                
                // I see. Probably his debts. Shit ... he should've just ...
                RiceLord.AI.Say(LocText("TEXT_WIP_LIWVLHC_20240312_172712_2801"));
                DC(int64(0x132d36919eee4a57), EConversationDebugInfo::Done);
                DB(int64(0x2ae5b369ff514310), Hero != nullptr && Hero.HasItem(UItMs_Axe_Bran, 1, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItMs_Axe_Bran, 1, 0))
                {
                    DC(int64(0x2ae5b369ff514312), EConversationDebugInfo::Executing);
                    Hero.RemoveItemFromInventory(UItMs_Axe_Bran, 1, 0);
                    DC(int64(0x2ae5b369ff514312), EConversationDebugInfo::Done);
                    DC(int64(0x2ae5b369ff514314), EConversationDebugInfo::Executing);
                    Hero.AddItemToInventory(UItMw_1H_Axe_Bran, 1);
                    DC(int64(0x2ae5b369ff514314), EConversationDebugInfo::Done);
                }
                DC(int64(0xa2f911ca66fa9060), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN_RICELORDFOREMAN_OBJ_REPORT.SucceedQuest();
                DC(int64(0xa2f911ca66fa9060), EConversationDebugInfo::Done);
                DC(int64(0xa2f911ca66fa9062), EConversationDebugInfo::Executing);
                G1R.Points_NC += 20;
                DC(int64(0xa2f911ca66fa9062), EConversationDebugInfo::Done);
                DC(int64(0x7858bf075764a0dd), EConversationDebugInfo::Executing);
                RiceLord.RemoveImmortality();
                DC(int64(0x7858bf075764a0dd), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceRiceLord81564 : UTopic_Hero__NC_BAU_RICELORD_900
        {
            default DebugId = int64(0x495be431265da39c);
            default Caption = LocText("TEXT_DDIAZ_20240206_122616_686");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(URiceLord_108984);
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceRicelord109255);
            default Rules.HideIfKnows(UChoiceRiceLord81564);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xcf584b8ed87279d5), EConversationDebugInfo::Executing);
                // What can you tell me about Bran?
                Hero.AI.Say(LocText("TEXT_DDIAZ_20240206_122616_686"));
                DC(int64(0xcf584b8ed87279d5), EConversationDebugInfo::Done);
                DC(int64(0xc937a22c9f012079), EConversationDebugInfo::Executing);
                
                // Nothing, really.
                RiceLord.AI.Say(LocText("TEXT_DDIAZ_20240206_133348"));
                DC(int64(0xc937a22c9f012079), EConversationDebugInfo::Done);
                DC(int64(0x653d12cc4be39624), EConversationDebugInfo::Executing);
                // Go ask the farmers. I'm sure they know somethin'.
                RiceLord.AI.Say(LocText("TEXT_WIP_BKSKLDM_20240219_103055"));
                DC(int64(0x653d12cc4be39624), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_RICELORDFOREMAN, Document::UDocumentSegment_CH1_RICELORDFOREMAN_AskFarmers);
            }
        }
        
        
        class UChoiceRiceLord81916 : UTopic_Hero__NC_BAU_RICELORD_900
        {
            default DebugId = int64(0x132d36919eee4a61);
            default Caption = LocText("TEXT_WIP_QJSKLDM_20240212_122745");
            default PriorityRank = 3;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x1095bc8aa316c3e7), Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN != nullptr && Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN.IsRunning());
                    DB(int64(0x1095bc8aa316c3e8), Hero != nullptr && !Hero.HasListenedTo(LocText("TEXT_WIP_QJSKLDM_20240212_111727_2785")));
                    DB(int64(0x1095bc8aa316c3e9), Hero != nullptr && Hero.HasItem(UItWr_Scroll_Bran_01, 1, 0));
                    DB(int64(0x132d36919eee4a64), Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN != nullptr && Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN.IsRunning());
                    DB(int64(0x132d36919eee4a66), Hero != nullptr && !Hero.HasListenedTo(LocText("TEXT_WIP_QJSKLDM_20240212_111727_2785")));
                    DB(int64(0x132d36919eee4a67), Hero != nullptr && Hero.HasItem(UItMs_Axe_Bran, 1, 0));
                    DB(int64(0x16ea4de256928503), Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_VHHDWEM_20240208_151904_2386")));
                }
                
                if (Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN != nullptr && Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN.IsRunning() && Hero != nullptr && !Hero.HasListenedTo(LocText("TEXT_WIP_QJSKLDM_20240212_111727_2785")) && Hero != nullptr && Hero.HasItem(UItWr_Scroll_Bran_01, 1, 0))
                    return true;
                
                if (Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN != nullptr && Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN.IsRunning() && Hero != nullptr && !Hero.HasListenedTo(LocText("TEXT_WIP_QJSKLDM_20240212_111727_2785")) && Hero != nullptr && Hero.HasItem(UItMs_Axe_Bran, 1, 0) && Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_VHHDWEM_20240208_151904_2386")))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x132d36919eee4a5f), EConversationDebugInfo::Executing);
                // Bran's dead.
                Hero.AI.Say(LocText("TEXT_WIP_QJSKLDM_20240212_122745"));
                DC(int64(0x132d36919eee4a5f), EConversationDebugInfo::Done);
                DC(int64(0x132d36919eee4a60), EConversationDebugInfo::Executing);
                
                // What?! How? 
                RiceLord.AI.Say(LocText("TEXT_WIP_QJSKLDM_20240212_122745_2995"));
                DC(int64(0x132d36919eee4a60), EConversationDebugInfo::Done);
                DC(int64(0x132d36919eee4a68), EConversationDebugInfo::Executing);
                
                // I'm still figuring that out.
                Hero.AI.Say(LocText("TEXT_WIP_QJSKLDM_20240212_124651"));
                DC(int64(0x132d36919eee4a68), EConversationDebugInfo::Done);
                DC(int64(0x132d36919eee4a69), EConversationDebugInfo::Executing);
                
                // Then come back when you have, for fuck's sake!
                RiceLord.AI.Say(LocText("TEXT_WIP_QJSKLDM_20240212_124658"));
                DC(int64(0x132d36919eee4a69), EConversationDebugInfo::Done);
                DC(int64(0x132d36919eee4a6a), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x132d36919eee4a6a), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceRicelord109255 : UTopic_Hero__NC_BAU_RICELORD_900
        {
            default DebugId = int64(0x36f542dcf94cedb9);
            default Caption = LocText("TEXT_WIP_AGXCIAC_20240904_142121");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceRicelord109255);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x8b8cc2ac806c1129), Quest::NewCamp_NCCHAPTER1_RICELORDJOB != nullptr && Quest::NewCamp_NCCHAPTER1_RICELORDJOB.HasSucceeded());
                    DB(int64(0x8b8cc2ac806c112a), Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN != nullptr && !Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN.HasBeenStarted());
                    DB(int64(0x9dc6f21bc5b718c7), G1R != nullptr && !G1R.HasReachedChapter(2));
                }
                
                if (Quest::NewCamp_NCCHAPTER1_RICELORDJOB != nullptr && !Quest::NewCamp_NCCHAPTER1_RICELORDJOB.HasSucceeded())
                    return false;
                
                if (Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN != nullptr && Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN.HasBeenStarted())
                    return false;
                
                if (G1R != nullptr && G1R.HasReachedChapter(2))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x36f542dcf94cedb7), EConversationDebugInfo::Executing);
                // Tell me more about this second job you mentioned. 
                Hero.AI.Say(LocText("TEXT_WIP_AGXCIAC_20240904_142121"));
                DC(int64(0x36f542dcf94cedb7), EConversationDebugInfo::Done);
                DC(int64(0x36f542dcf94cedb8), EConversationDebugInfo::Executing);
                
                // That's the spirit.
                RiceLord.AI.Say(LocText("TEXT_DDIAZ_20240206_122447"));
                DC(int64(0x36f542dcf94cedb8), EConversationDebugInfo::Done);
                DC(int64(0x36f542dcf94cedbb), EConversationDebugInfo::Executing);
                // Me foreman, Bran, went missin' a couple days ago. I want ...
                RiceLord.AI.Say(LocText("TEXT_DDIAZ_20240206_122544"));
                DC(int64(0x36f542dcf94cedbb), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_RICELORDFOREMAN, Document::UDocumentSegment_CH1_RICELORDFOREMAN_Start);
                DC(int64(0x132d36919eee4a1a), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Rayk))) { Rayk.ExchangeDailyRoutineToClass(UDailyRoutine_NC_BAU_Rayk_941_Sleep); }
                DC(int64(0x132d36919eee4a1a), EConversationDebugInfo::Done);
                DC(int64(0x36f542dcf94cedc3), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN.StartQuest();
                DC(int64(0x36f542dcf94cedc3), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceRicelord109346 : UTopic_Hero__NC_BAU_RICELORD_900
        {
            default DebugId = int64(0xa2f911ca66fa905d);
            default Caption = FText::FromString("[Followup Topic]");;
            default bIsFollowupTopic = true;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceRiceLord81400);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x9dc6f21bc5b718c9), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                }
                
                return Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x132d36919eee4a5b), EConversationDebugInfo::Executing);
                // Anyway, that's all the work I got for now. Listen, if ...
                RiceLord.AI.Say(LocText("TEXT_WIP_QJSKLDM_20240212_121627_491"));
                DC(int64(0x132d36919eee4a5b), EConversationDebugInfo::Done);
                DC(int64(0x91cd37b949f16303), EConversationDebugInfo::Executing);
                // He and I go way back, and if he asks me, I'll tell him ...
                RiceLord.AI.Say(LocText("TEXT_WIP_LIWVLHC_20240312_173811"));
                DC(int64(0x91cd37b949f16303), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_BAU_RICELORD, Document::UDocumentSegment_Glossary_NC_BAU_RICELORD_Respect);
                Subdialog(
                    URiceLord_87761,
                    URiceLord_87781,
                    URiceLord_88029
                );
            }
        }
        
        
        class URiceLord_87761 : UTopic_Hero__NC_BAU_RICELORD_900
        {
            default DebugId = int64(0x91cd37b949f1630a);
            default Caption = LocText("TEXT_WIP_LIWVLHC_20240312_173921_2995");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(URiceLord_87761);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("ORG_801_LARES_WANNAJOIN_11_01"), int64(0x91cd37b949f1630a));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x91cd37b949f1630b), EConversationDebugInfo::Executing);
                // I already talked to him. 
                Hero.AI.Say(LocText("TEXT_WIP_LIWVLHC_20240312_173921_2995"));
                DC(int64(0x91cd37b949f1630b), EConversationDebugInfo::Done);
                DC(int64(0x91cd37b949f16312), EConversationDebugInfo::Executing);
                
                // Ah. So that's why you came to me in the first place, eh? ...
                RiceLord.AI.Say(LocText("TEXT_WIP_LIWVLHC_20240312_174002"));
                DC(int64(0x91cd37b949f16312), EConversationDebugInfo::Done);
                DC(int64(0x91cd37b949f16314), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x91cd37b949f16314), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class URiceLord_87781 : UTopic_Hero__NC_BAU_RICELORD_900
        {
            default DebugId = int64(0x91cd37b949f1630e);
            default Caption = LocText("TEXT_WIP_LIWVLHC_20240312_173921_731");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(URiceLord_87781);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x91cd37b949f1630f), EConversationDebugInfo::Executing);
                // I'll do that. 
                Hero.AI.Say(LocText("TEXT_WIP_LIWVLHC_20240312_173921_731"));
                DC(int64(0x91cd37b949f1630f), EConversationDebugInfo::Done);
                DC(int64(0x91cd37b949f16316), EConversationDebugInfo::Executing);
                
                // You should. Be seein' ya. 
                RiceLord.AI.Say(LocText("TEXT_WIP_LIWVLHC_20240312_174058"));
                DC(int64(0x91cd37b949f16316), EConversationDebugInfo::Done);
                DC(int64(0x91cd37b949f16315), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x91cd37b949f16315), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class URiceLord_88029 : UTopic_Hero__NC_BAU_RICELORD_900
        {
            default DebugId = int64(0x91cd37b949f16317);
            default Caption = LocText("TEXT_WIP_LIWVLHC_20240312_174109_1340");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(URiceLord_88029);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x91cd37b949f16318), EConversationDebugInfo::Executing);
                // Maybe. 
                Hero.AI.Say(LocText("TEXT_WIP_LIWVLHC_20240312_174109_1340"));
                DC(int64(0x91cd37b949f16318), EConversationDebugInfo::Done);
                DC(int64(0x91cd37b949f1631c), EConversationDebugInfo::Executing);
                
                // Suit yourself. Be seein' ya. 
                RiceLord.AI.Say(LocText("TEXT_WIP_LIWVLHC_20240312_174120"));
                DC(int64(0x91cd37b949f1631c), EConversationDebugInfo::Done);
                DC(int64(0x91cd37b949f1631b), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x91cd37b949f1631b), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceRicelord84998 : UTopic_Hero__NC_BAU_RICELORD_900
        {
            default DebugId = int64(0x6cb95be92da295f3);
            default Caption = LocText("TEXT_WIP_VFHDBGC_20240301_175924");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceRicelordHello);
            default Rules.HideIfKnows(UChoiceRicelord84998);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6cb95be92da295f1), EConversationDebugInfo::Executing);
                // They really call you "Rice Lord?"
                Hero.AI.Say(LocText("TEXT_WIP_VFHDBGC_20240301_175924"));
                DC(int64(0x6cb95be92da295f1), EConversationDebugInfo::Done);
                DC(int64(0x6cb95be92da295f2), EConversationDebugInfo::Executing);
                
                // Say what you want, it sticks. 
                RiceLord.AI.Say(LocText("TEXT_WIP_VFHDBGC_20240301_175924_2238"));
                DC(int64(0x6cb95be92da295f2), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceRicelordExit : UTopic_Hero__NC_BAU_RICELORD_900
        {
            default DebugId = int64(0xfd4971c1f6cdfb10);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xfd4971c1f6cdfb11), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xfd4971c1f6cdfb11), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceRicelordHello : UTopic_Hero__NC_BAU_RICELORD_900
        {
            default DebugId = int64(0xfd4971c1f6cdfb12);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceRicelordHello);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x29a48247a2bfdbfe), Hero != nullptr && Hero.IsInConversation());
                }
                
                return Hero != nullptr && Hero.IsInConversation();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6cb95be92da295ef), EConversationDebugInfo::Executing);
                // Now that's a face I ain't seen before. Just got in? Or ...
                RiceLord.AI.Say(LocText("TEXT_WIP_VFHDBGC_20240301_174650"));
                DC(int64(0x6cb95be92da295ef), EConversationDebugInfo::Done);
                DC(int64(0xfd4971c1f6cdfb13), EConversationDebugInfo::Executing);
                
                // Both.
                Hero.AI.Say(LocText("DIA_RICELORD_HELLO_15_00"));
                DC(int64(0xfd4971c1f6cdfb13), EConversationDebugInfo::Done);
                DC(int64(0xfd4971c1f6cdfb14), EConversationDebugInfo::Executing);
                
                // I see. Name's Hakon, though most folk here call me the ...
                RiceLord.AI.Say(LocText("DIA_RICELORD_HELLO_12_01"));
                DC(int64(0xfd4971c1f6cdfb14), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_BAU_RICELORD, Document::UDocumentSegment_Glossary_NC_BAU_RICELORD_Introduction);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */