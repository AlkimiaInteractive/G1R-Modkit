#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OCR_GRD_STONE_219 : UConversationCharacterSettings
        {
            default ForCharacter = n"OCR_GRD_STONE_219";
        }
        
        
        class UTopic_Hero__OCR_GRD_STONE_219 : UG1RDialogTopic
        {
            default ForCharacter = n"OCR_GRD_STONE_219";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetStone() const property
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
            
            AGothicCharacterState GetGorNaZar() const property
            {
                return GetCharacter(n"OG_TPL_GORNAZAR_1446");
            }
            
            AGothicCharacterState GetSC_NOV_NOVICE09_1316() const property
            {
                return GetCharacter(n"SC_NOV_NOVICE09_1316");
            }
        }
        
        
        class UChoiceGrd219StoneExit : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0xc97265bc682da0);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default PropertyTags.AddTag(GameplayTag::Conversation_Topic_End);
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3f2a3fd0cd36c7e4), EConversationDebugInfo::Executing);
                // So long.  
                Hero.AI.Say(LocText("TEXT_DDIAZ_20231219_132411"));
                DC(int64(0x3f2a3fd0cd36c7e4), EConversationDebugInfo::Done);
                DC(int64(0xc97265bc682da3), EConversationDebugInfo::Executing);
                
                // Be seein' you. 
                Stone.AI.Say(LocText("INFO_EXIT_06_02"));
                DC(int64(0xc97265bc682da3), EConversationDebugInfo::Done);
                DC(int64(0xc97265bc682da4), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xc97265bc682da4), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGrd219StoneGetstuff : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0x6af6ebf73c6468bf);
            default Caption = LocText("GRD_219_STONE_GETSTUFF_INFO_15_01");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceGrd219StoneGetstuff);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xc97265bc682d88), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard));
                    DB(int64(0xc97265bc682d89), Stone != nullptr && Stone.HasAssignedDailyRoutine(UDailyRoutine_OCR_GRD_Stone_219_OCHeroInsideForge));
                    DB(int64(0xc97265bc682d88), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard));
                    DB(int64(0xc97265bc682d89), Stone != nullptr && Stone.HasAssignedDailyRoutine(UDailyRoutine_OCR_GRD_Stone_219_Start));
                }
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard) && Stone != nullptr && Stone.HasAssignedDailyRoutine(UDailyRoutine_OCR_GRD_Stone_219_OCHeroInsideForge))
                    return true;
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard) && Stone != nullptr && Stone.HasAssignedDailyRoutine(UDailyRoutine_OCR_GRD_Stone_219_Start))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc97265bc682d91), EConversationDebugInfo::Executing);
                // I need armor.
                Hero.AI.Say(LocText("GRD_219_STONE_GETSTUFF_INFO_15_01"));
                DC(int64(0xc97265bc682d91), EConversationDebugInfo::Done);
                DC(int64(0xc97265bc682d92), EConversationDebugInfo::Executing);
                
                // So Thorus gave you the Red, eh? Congratulations. 
                Stone.AI.Say(LocText("GRD_219_STONE_GETSTUFF_INFO_06_02"));
                DC(int64(0xc97265bc682d92), EConversationDebugInfo::Done);
                DC(int64(0xc97265bc682d93), EConversationDebugInfo::Executing);
                // Another man puttin' his head on the block for Gomez ... 
                Stone.AI.Say(LocText("GRD_219_STONE_GETSTUFF_INFO_06_03"));
                DC(int64(0xc97265bc682d93), EConversationDebugInfo::Done);
                DC(int64(0xc97265bc682d94), EConversationDebugInfo::Executing);
                // Well, all the same to me. Here, take this armor and this ...
                Stone.AI.Say(LocText("GRD_219_STONE_GETSTUFF_INFO_06_04"));
                DC(int64(0xc97265bc682d94), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OCR_GRD_STONE, Document::UDocumentSegment_Glossary_OCR_GRD_STONE_Introduction);
                DC(int64(0xea2bca374667d380), EConversationDebugInfo::Executing);
                Stone.AddItemToInventory(UItMw_1H_Sword_03, 1);
                DC(int64(0xea2bca374667d380), EConversationDebugInfo::Done);
                DC(int64(0xc97265bc682d96), EConversationDebugInfo::Executing);
                Stone.AI.GiveItemTo(Hero, UItMw_1H_Sword_03, 1);
                DC(int64(0xc97265bc682d96), EConversationDebugInfo::Done);
                DC(int64(0xc97265bc682d98), EConversationDebugInfo::Executing);
                Hero.AddItemToInventory(UGrd_Armor, 1);
                DC(int64(0xc97265bc682d98), EConversationDebugInfo::Done);
                DC(int64(0xc97265bc682d99), EConversationDebugInfo::Executing);
                Hero.Inventory.EquipArmorOfClass(UGrd_Armor);
                DC(int64(0xc97265bc682d99), EConversationDebugInfo::Done);
                DC(int64(0xc97265bc682d9a), EConversationDebugInfo::Executing);
                Hero.AI.EquipBestWeapon();
                DC(int64(0xc97265bc682d9a), EConversationDebugInfo::Done);
                DC(int64(0xf10a76655659e194), EConversationDebugInfo::Executing);
                G1R.KnowStone = 1;
                DC(int64(0xf10a76655659e194), EConversationDebugInfo::Done);
                DC(int64(0xc97265bc682d9b), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xc97265bc682d9b), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceStone112089 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0x5068e6dc3e211a05);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceStone112089);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x5068e6dc3e211a14), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Crafting_Blacksmith_Master));
                    DB(int64(0xe9e6f12c4d134853), Stone != nullptr && !Stone.HasAssignedDailyRoutine(UDailyRoutine_OCR_GRD_Stone_219_Ot));
                    DB(int64(0xe9e6f12c4d134854), Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3 != nullptr && !Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3.HasBeenStarted());
                }
                
                if (Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Crafting_Blacksmith_Master))
                    return false;
                
                if (Stone != nullptr && Stone.HasAssignedDailyRoutine(UDailyRoutine_OCR_GRD_Stone_219_Ot))
                    return false;
                
                if (Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3 != nullptr && Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3.HasBeenStarted())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DB(int64(0x5068e6dc3e211a0f), G1R.Stone_Teacher != 0);
                
                if (G1R.Stone_Teacher != 0)
                {
                    DC(int64(0x5068e6dc3e211a37), EConversationDebugInfo::Executing);
                    // You ain't half-bad at smithin'. Been meanin' to ask you ...
                    Stone.AI.Say(LocText("TEXT_WIP_WPNNHIJ_20241126_140501_2238"));
                    DC(int64(0x5068e6dc3e211a37), EConversationDebugInfo::Done);
                    DC(int64(0xc97265bc682dd3), EConversationDebugInfo::Executing);
                    G1R.KnowStone = 1;
                    DC(int64(0xc97265bc682dd3), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_stone_112089_exit_1");
                }
                else
                {
                    DC(int64(0x5068e6dc3e211a3c), EConversationDebugInfo::Executing);
                    // Oy, you seem to know your way around a forge. Darrion's ...
                    Stone.AI.Say(LocText("TEXT_WIP_WPNNHIJ_20241126_140506_1924"));
                    DC(int64(0x5068e6dc3e211a3c), EConversationDebugInfo::Done);
                    DC(int64(0xc97265bc682dd3), EConversationDebugInfo::Executing);
                    G1R.KnowStone = 1;
                    DC(int64(0xc97265bc682dd3), EConversationDebugInfo::Done);
                    Subdialog(
                        UTopic_Stone_112726,
                        UTopic_Stone_112746,
                        UTopic_Stone_112813
                    );
                }
            }
        }
        
        
        class UTopic_Stone_112726 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0x5068e6dc3e211ab1);
            default Caption = LocText("TEXT_WIP_WPNNHIJ_20241126_144914_3569");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Stone_112726);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5068e6dc3e211ab2), EConversationDebugInfo::Executing);
                // You know Darrion?
                Hero.AI.Say(LocText("TEXT_WIP_WPNNHIJ_20241126_144914_3569"));
                DC(int64(0x5068e6dc3e211ab2), EConversationDebugInfo::Done);
                DC(int64(0x5068e6dc3e211abf), EConversationDebugInfo::Executing);
                
                // Huh, sure do, from the old days. That little swamp rat. ...
                Stone.AI.Say(LocText("TEXT_WIP_WPNNHIJ_20241126_145345"));
                DC(int64(0x5068e6dc3e211abf), EConversationDebugInfo::Done);
                DC(int64(0xb0390184b1c215a6), EConversationDebugInfo::Executing);
                // Still hammers metal into weapons, mind you - just has to ...
                Stone.AI.Say(LocText("TEXT_WIP_KUNKPJ_20241201_233209"));
                DC(int64(0xb0390184b1c215a6), EConversationDebugInfo::Done);
                DC(int64(0x5068e6dc3e211ab4), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x5068e6dc3e211ab4), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Stone_112746 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0x5068e6dc3e211ab5);
            default Caption = LocText("TEXT_WIP_WPNNHIJ_20241126_144914_443");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Stone_112746);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_WPNNHIJ_20241126_145345"), int64(0x5068e6dc3e211ab5));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5068e6dc3e211ab6), EConversationDebugInfo::Executing);
                // Is something wrong with his work?
                Hero.AI.Say(LocText("TEXT_WIP_WPNNHIJ_20241126_144914_443"));
                DC(int64(0x5068e6dc3e211ab6), EConversationDebugInfo::Done);
                DC(int64(0x5068e6dc3e211ac3), EConversationDebugInfo::Executing);
                
                // No, o' course not. If you enjoy spendin' three days ...
                Stone.AI.Say(LocText("TEXT_WIP_WPNNHIJ_20241126_145544"));
                DC(int64(0x5068e6dc3e211ac3), EConversationDebugInfo::Done);
                DC(int64(0xb0390184b1c215a4), EConversationDebugInfo::Executing);
                // If I ever start talkin' to you about ornaments and ...
                Stone.AI.Say(LocText("TEXT_WIP_KUNKPJ_20241201_232640"));
                DC(int64(0xb0390184b1c215a4), EConversationDebugInfo::Done);
                DC(int64(0x5068e6dc3e211ab8), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x5068e6dc3e211ab8), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Stone_112813 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0x5068e6dc3e211ac4);
            default Caption = LocText("TEXT_WIP_WPNNHIJ_20241126_145638_491");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Stone_112813);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5068e6dc3e211ac5), EConversationDebugInfo::Executing);
                // Yes, I trained with him.
                Hero.AI.Say(LocText("TEXT_WIP_WPNNHIJ_20241126_145638_491"));
                DC(int64(0x5068e6dc3e211ac5), EConversationDebugInfo::Done);
                DC(int64(0x5068e6dc3e211acb), EConversationDebugInfo::Executing);
                
                // Then I could use your help. If you can spare time from ...
                Stone.AI.Say(LocText("TEXT_WIP_WPNNHIJ_20241126_145644"));
                DC(int64(0x5068e6dc3e211acb), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceStone112719 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0x5068e6dc3e211aa4);
            default Caption = FText::FromString("[Followup Topic]");;
            default bIsFollowupTopic = true;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceStone112089);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5068e6dc3e211abc), EConversationDebugInfo::Executing);
                
                // What do you have in mind?
                Hero.AI.Say(LocText("TEXT_WIP_WPNNHIJ_20241126_144950"));
                DC(int64(0x5068e6dc3e211abc), EConversationDebugInfo::Done);
                DC(int64(0x5068e6dc3e211abd), EConversationDebugInfo::Executing);
                
                // Heard from some novices that one of the templars has ...
                Stone.AI.Say(LocText("TEXT_WIP_WPNNHIJ_20241126_144950_1769"));
                DC(int64(0x5068e6dc3e211abd), EConversationDebugInfo::Done);
                DC(int64(0x5068e6dc3e211abe), EConversationDebugInfo::Executing);
                // Could be worth lookin' into, if you're curious about ...
                Stone.AI.Say(LocText("TEXT_WIP_WPNNHIJ_20241126_144951"));
                DC(int64(0x5068e6dc3e211abe), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Stone_112142,
                    UTopic_Stone_112162,
                    UTopic_Stone_112245,
                    UTopic_Stone_112384,
                    UTopic_Stone_112854,
                    UTopic_Stone_112404
                );
            }
        }
        
        
        class UTopic_Stone_112142 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0x5068e6dc3e211a43);
            default Caption = LocText("TEXT_WIP_WPNNHIJ_20241126_140601_3286");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Stone_112142);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5068e6dc3e211a48), EConversationDebugInfo::Executing);
                // Tell me more about this sword.
                Hero.AI.Say(LocText("TEXT_WIP_WPNNHIJ_20241126_140601_3286"));
                DC(int64(0x5068e6dc3e211a48), EConversationDebugInfo::Done);
                DC(int64(0x5068e6dc3e211a5a), EConversationDebugInfo::Executing);
                
                // Sounds like Darrion's work to me. A "work of art", o' ...
                Stone.AI.Say(LocText("TEXT_WIP_WPNNHIJ_20241126_140954"));
                DC(int64(0x5068e6dc3e211a5a), EConversationDebugInfo::Done);
                DC(int64(0xf45bc3ea707d1f81), EConversationDebugInfo::Executing);
                
                // But that isn't your style at all.
                Hero.AI.Say(LocText("TEXT_WIP_TBJDHIL_20241216_234519"));
                DC(int64(0xf45bc3ea707d1f81), EConversationDebugInfo::Done);
                DC(int64(0x5068e6dc3e211a93), EConversationDebugInfo::Executing);
                
                // They're sayin' the damned thing is perfectly balanced, ...
                Stone.AI.Say(LocText("TEXT_WIP_WPNNHIJ_20241126_142435"));
                DC(int64(0x5068e6dc3e211a93), EConversationDebugInfo::Done);
                DC(int64(0x5068e6dc3e211a4a), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x5068e6dc3e211a4a), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Stone_112162 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0x5068e6dc3e211a47);
            default Caption = LocText("TEXT_WIP_WPNNHIJ_20241126_140601_2785");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Stone_112162);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5068e6dc3e211a44), EConversationDebugInfo::Executing);
                // Why are you telling me this?
                Hero.AI.Say(LocText("TEXT_WIP_WPNNHIJ_20241126_140601_2785"));
                DC(int64(0x5068e6dc3e211a44), EConversationDebugInfo::Done);
                DC(int64(0x5068e6dc3e211a4e), EConversationDebugInfo::Executing);
                
                // Because I'm workin' me arse off for Gomez and the lads, ...
                Stone.AI.Say(LocText("TEXT_WIP_WPNNHIJ_20241126_140614"));
                DC(int64(0x5068e6dc3e211a4e), EConversationDebugInfo::Done);
                DC(int64(0x5068e6dc3e211a4f), EConversationDebugInfo::Executing);
                // If you find that sword ... take a look, eh? Study it. ...
                Stone.AI.Say(LocText("TEXT_WIP_WPNNHIJ_20241126_140712"));
                DC(int64(0x5068e6dc3e211a4f), EConversationDebugInfo::Done);
                DC(int64(0x5068e6dc3e211a46), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x5068e6dc3e211a46), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Stone_112245 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0x5068e6dc3e211a53);
            default Caption = LocText("TEXT_WIP_WPNNHIJ_20241126_140831_2386");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Stone_112245);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_WPNNHIJ_20241126_140712"), int64(0x5068e6dc3e211a53));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5068e6dc3e211a54), EConversationDebugInfo::Executing);
                // Where can I find this templar?
                Hero.AI.Say(LocText("TEXT_WIP_WPNNHIJ_20241126_140831_2386"));
                DC(int64(0x5068e6dc3e211a54), EConversationDebugInfo::Done);
                DC(int64(0x5068e6dc3e211a82), EConversationDebugInfo::Executing);
                
                // I'm guessin' that'll be the Swamp Camp.
                Stone.AI.Say(LocText("TEXT_WIP_WPNNHIJ_20241126_141840"));
                DC(int64(0x5068e6dc3e211a82), EConversationDebugInfo::Done);
                DC(int64(0x5068e6dc3e211a94), EConversationDebugInfo::Executing);
                // Look for someone who's praisin' his sword as much as the ...
                Stone.AI.Say(LocText("TEXT_WIP_WPNNHIJ_20241126_142842"));
                DC(int64(0x5068e6dc3e211a94), EConversationDebugInfo::Done);
                DC(int64(0x5068e6dc3e211a56), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x5068e6dc3e211a56), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Stone_112384 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0x5068e6dc3e211a6f);
            default Caption = LocText("TEXT_WIP_WPNNHIJ_20241126_141643_3984");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Stone_112384);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_WPNNHIJ_20241126_140712"), int64(0x5068e6dc3e211a6f));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5068e6dc3e211a70), EConversationDebugInfo::Executing);
                // What's in it for me?
                Hero.AI.Say(LocText("TEXT_WIP_WPNNHIJ_20241126_141643_3984"));
                DC(int64(0x5068e6dc3e211a70), EConversationDebugInfo::Done);
                DC(int64(0x5068e6dc3e211a8a), EConversationDebugInfo::Executing);
                
                // Knowledge about our craft should be rewardin' enough.
                Stone.AI.Say(LocText("TEXT_WIP_WPNNHIJ_20241126_142037"));
                DC(int64(0x5068e6dc3e211a8a), EConversationDebugInfo::Done);
                DC(int64(0x5068e6dc3e211a8b), EConversationDebugInfo::Executing);
                // But I could show you how to make somethin' that'll ...
                Stone.AI.Say(LocText("TEXT_WIP_WPNNHIJ_20241126_142039"));
                DC(int64(0x5068e6dc3e211a8b), EConversationDebugInfo::Done);
                DC(int64(0x5068e6dc3e211a98), EConversationDebugInfo::Executing);
                // Darrion's not the only one with an ace up his sleeve, ...
                Stone.AI.Say(LocText("TEXT_WIP_WPNNHIJ_20241126_143053"));
                DC(int64(0x5068e6dc3e211a98), EConversationDebugInfo::Done);
                DC(int64(0x5068e6dc3e211a72), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x5068e6dc3e211a72), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Stone_112854 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0x5068e6dc3e211ad9);
            default Caption = LocText("TEXT_WIP_WPNNHIJ_20241126_150539_2995");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Stone_112854);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5068e6dc3e211ada), EConversationDebugInfo::Executing);
                // I'll help you.
                Hero.AI.Say(LocText("TEXT_WIP_WPNNHIJ_20241126_150539_2995"));
                DC(int64(0x5068e6dc3e211ada), EConversationDebugInfo::Done);
                DC(int64(0x5068e6dc3e211ae1), EConversationDebugInfo::Executing);
                
                // Good luck, then! I hope you find the sword.
                Stone.AI.Say(LocText("TEXT_WIP_WPNNHIJ_20241126_150808"));
                DC(int64(0x5068e6dc3e211ae1), EConversationDebugInfo::Done);
                DC(int64(0x807d0bbb1200bd96), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1.StartQuest();
                DC(int64(0x807d0bbb1200bd96), EConversationDebugInfo::Done);
                DC(int64(0xc1a6dbb695197337), EConversationDebugInfo::Executing);
                if (ensure(IsValid(GorNaZar))) { GorNaZar.ExchangeDailyRoutineToClass(UDailyRoutine_OG_TPL_GorNaZar_1446_SharpWeapon); }
                DC(int64(0xc1a6dbb695197337), EConversationDebugInfo::Done);
                DC(int64(0x5068e6dc3e211aea), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x5068e6dc3e211aea), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Stone_112404 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0x5068e6dc3e211a76);
            default Caption = LocText("TEXT_WIP_WPNNHIJ_20241126_141645_1609");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Stone_112404);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5068e6dc3e211a77), EConversationDebugInfo::Executing);
                // I'm not interested.
                Hero.AI.Say(LocText("TEXT_WIP_WPNNHIJ_20241126_141645_1609"));
                DC(int64(0x5068e6dc3e211a77), EConversationDebugInfo::Done);
                DC(int64(0x5068e6dc3e211a8c), EConversationDebugInfo::Executing);
                
                // Think you're somethin' better, eh? Maybe Darrion's gonna ...
                Stone.AI.Say(LocText("TEXT_WIP_WPNNHIJ_20241126_142110"));
                DC(int64(0x5068e6dc3e211a8c), EConversationDebugInfo::Done);
                DC(int64(0x5068e6dc3e211a8d), EConversationDebugInfo::Executing);
                // Just don't expect to learn somehtin' useful from him.
                Stone.AI.Say(LocText("TEXT_WIP_WPNNHIJ_20241126_142122"));
                DC(int64(0x5068e6dc3e211a8d), EConversationDebugInfo::Done);
                DC(int64(0x5068e6dc3e211b04), EConversationDebugInfo::Executing);
                // Still, if you wanna learn proper smithin': me offer ...
                Stone.AI.Say(LocText("TEXT_WIP_WPNNHIJ_20241126_151135"));
                DC(int64(0x5068e6dc3e211b04), EConversationDebugInfo::Done);
                DC(int64(0x5068e6dc3e211af7), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x5068e6dc3e211af7), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceStone112921 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0x5068e6dc3e211b02);
            default Caption = LocText("TEXT_WIP_WPNNHIJ_20241126_151003");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Stone_112404);
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_WPNNHIJ_20241126_150808"), int64(0x5068e6dc3e211b02));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5068e6dc3e211afc), EConversationDebugInfo::Executing);
                // About that sword you're so keen on.
                Hero.AI.Say(LocText("TEXT_WIP_WPNNHIJ_20241126_151003"));
                DC(int64(0x5068e6dc3e211afc), EConversationDebugInfo::Done);
                DC(int64(0x5068e6dc3e211afd), EConversationDebugInfo::Executing);
                
                // Changed your mind?
                Stone.AI.Say(LocText("TEXT_WIP_WPNNHIJ_20241126_151003_3750"));
                DC(int64(0x5068e6dc3e211afd), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Stone_113045,
                    UTopic_Stone_113065
                );
            }
        }
        
        
        class UTopic_Stone_113045 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0x5068e6dc3e211b06);
            default Caption = LocText("TEXT_WIP_WPNNHIJ_20241126_150539_2995");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Stone_113045);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5068e6dc3e211b07), EConversationDebugInfo::Executing);
                // I'll help you.
                Hero.AI.Say(LocText("TEXT_WIP_WPNNHIJ_20241126_150539_2995"));
                DC(int64(0x5068e6dc3e211b07), EConversationDebugInfo::Done);
                DC(int64(0x5068e6dc3e211b28), EConversationDebugInfo::Executing);
                
                // Good luck, then! I hope you find the sword.
                Stone.AI.Say(LocText("TEXT_WIP_WPNNHIJ_20241126_150808"));
                DC(int64(0x5068e6dc3e211b28), EConversationDebugInfo::Done);
                DC(int64(0x6ce9557b654ad6b3), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1.StartQuest();
                DC(int64(0x6ce9557b654ad6b3), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Stone_113065 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0x5068e6dc3e211b0a);
            default Caption = LocText("TEXT_WIP_WPNNHIJ_20241126_141645_1609");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5068e6dc3e211b0b), EConversationDebugInfo::Executing);
                // I'm not interested.
                Hero.AI.Say(LocText("TEXT_WIP_WPNNHIJ_20241126_141645_1609"));
                DC(int64(0x5068e6dc3e211b0b), EConversationDebugInfo::Done);
                DC(int64(0x5068e6dc3e211b29), EConversationDebugInfo::Executing);
                
                // Still, if you wanna learn proper smithin': me offer ...
                Stone.AI.Say(LocText("TEXT_WIP_WPNNHIJ_20241126_151135"));
                DC(int64(0x5068e6dc3e211b29), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceStone113211 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0x6ce9557b654ad452);
            default Caption = LocText("TEXT_WIP_YPNNHIJ_20241128_110811");
            default PriorityRank = 3;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x63e0ed597bfd4958), Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1 != nullptr && Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1.IsRunning());
                }
                
                return Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1 != nullptr && Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6ce9557b654ad44c), EConversationDebugInfo::Executing);
                
                // About that sword ...
                Hero.AI.Say(LocText("TEXT_WIP_YPNNHIJ_20241128_110811"));
                DC(int64(0x6ce9557b654ad44c), EConversationDebugInfo::Done);
                DC(int64(0x6ce9557b654ad44d), EConversationDebugInfo::Executing);
                
                // News, I hope?
                Stone.AI.Say(LocText("TEXT_WIP_YPNNHIJ_20241128_110811_41"));
                DC(int64(0x6ce9557b654ad44d), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Stone_114315,
                    UTopic_Stone_113605,
                    UTopic_Stone_113625,
                    UTopic_Stone_115120,
                    UTopic_Stone_115380,
                    UTopic_Stone_114896
                );
            }
        }
        
        
        class UTopic_Stone_114315 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0x6ce9557b654ad4b8);
            default Caption = LocText("TEXT_WIP_YPNNHIJ_20241128_113830_3984");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Stone_114315);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_VKWAAOH_20241127_124159"), int64(0x6ce9557b654ad4b8));
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_YPNNHIJ_20241128_112311"), int64(0x6ce9557b654ad4b8));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x63e0ed597bfd4920), Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_CRAFT != nullptr && !Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_CRAFT.IsRunning());
                }
                
                return Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_CRAFT != nullptr && !Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_CRAFT.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6ce9557b654ad4b9), EConversationDebugInfo::Executing);
                // Darrion pointed me to the templar.
                Hero.AI.Say(LocText("TEXT_WIP_YPNNHIJ_20241128_113830_3984"));
                DC(int64(0x6ce9557b654ad4b9), EConversationDebugInfo::Done);
                DC(int64(0x6ce9557b654ad4df), EConversationDebugInfo::Executing);
                
                // Course he did. Probably bragged about it, too. Well?
                Stone.AI.Say(LocText("TEXT_WIP_YPNNHIJ_20241128_114335"));
                DC(int64(0x6ce9557b654ad4df), EConversationDebugInfo::Done);
                DB(int64(0x6ce9557b654ad4e9), Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_FINDSWORD != nullptr && Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_FINDSWORD.IsRunning());
                
                if (Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_FINDSWORD != nullptr && Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_FINDSWORD.IsRunning())
                {
                    DC(int64(0x6ce9557b654ad4ee), EConversationDebugInfo::Executing);
                    // Haven't spoken to the templar yet.
                    Hero.AI.Say(LocText("TEXT_WIP_YPNNHIJ_20241128_114735"));
                    DC(int64(0x6ce9557b654ad4ee), EConversationDebugInfo::Done);
                    DC(int64(0x6ce9557b654ad4ef), EConversationDebugInfo::Executing);
                    
                    // Then you're wastin' me time.
                    Stone.AI.Say(LocText("TEXT_WIP_YPNNHIJ_20241128_114735_1609"));
                    DC(int64(0x6ce9557b654ad4ef), EConversationDebugInfo::Done);
                    DC(int64(0x6ce9557b654ad4f4), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x6ce9557b654ad4f4), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0x6ce9557b654ad502), EConversationDebugInfo::Executing);
                    ReturnToLastSelection(1);
                    DC(int64(0x6ce9557b654ad502), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UTopic_Stone_113605 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0x6ce9557b654ad46e);
            default Caption = LocText("TEXT_WIP_YPNNHIJ_20241128_111955_1924");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Stone_113605);
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_YPNNHIJ_20241128_112311"), int64(0x6ce9557b654ad46e));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x6ce9557b654ad4b3), Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_TALKDARION != nullptr && !Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_TALKDARION.HasSucceeded());
                    DB(int64(0x63e0ed597bfd494d), Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_CRAFT != nullptr && !Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_CRAFT.IsRunning());
                }
                
                if (Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_TALKDARION != nullptr && Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_TALKDARION.HasSucceeded())
                    return false;
                
                if (Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_CRAFT != nullptr && Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_CRAFT.IsRunning())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6ce9557b654ad46f), EConversationDebugInfo::Executing);
                // I couldn't get close enough to study the blade.
                Hero.AI.Say(LocText("TEXT_WIP_YPNNHIJ_20241128_111955_1924"));
                DC(int64(0x6ce9557b654ad46f), EConversationDebugInfo::Done);
                DC(int64(0x6ce9557b654ad47a), EConversationDebugInfo::Executing);
                
                // There's ... other ways to examine the weapon. Though ...
                Stone.AI.Say(LocText("TEXT_WIP_YPNNHIJ_20241128_112004"));
                DC(int64(0x6ce9557b654ad47a), EConversationDebugInfo::Done);
                DC(int64(0x6ce9557b654ad68d), EConversationDebugInfo::Executing);
                // Or you could try speakin' with Darrion. He sure loves ...
                Stone.AI.Say(LocText("TEXT_WIP_YPNNHIJ_20241128_125450"));
                DC(int64(0x6ce9557b654ad68d), EConversationDebugInfo::Done);
                DC(int64(0xae41e45eb9ebb08a), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_TALKDARION.StartQuest();
                DC(int64(0xae41e45eb9ebb08a), EConversationDebugInfo::Done);
                DC(int64(0x6ce9557b654ad471), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x6ce9557b654ad471), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Stone_113625 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0x6ce9557b654ad472);
            default Caption = LocText("TEXT_WIP_YPNNHIJ_20241128_111955_3436");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Stone_113625);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x6ce9557b654ad518), Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_PROOF != nullptr && Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_PROOF.HasBeenStarted());
                    DB(int64(0x63e0ed597bfd4921), Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_CRAFT != nullptr && !Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_CRAFT.IsRunning());
                }
                
                if (Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_PROOF != nullptr && !Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_PROOF.HasBeenStarted())
                    return false;
                
                if (Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_CRAFT != nullptr && Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_CRAFT.IsRunning())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6ce9557b654ad473), EConversationDebugInfo::Executing);
                // Darrion can show me how to craft the weapon.
                Hero.AI.Say(LocText("TEXT_WIP_YPNNHIJ_20241128_111955_3436"));
                DC(int64(0x6ce9557b654ad473), EConversationDebugInfo::Done);
                DC(int64(0x6ce9557b654ad47b), EConversationDebugInfo::Executing);
                
                // That's way better than just takin' a peek.
                Stone.AI.Say(LocText("TEXT_WIP_YPNNHIJ_20241128_112106"));
                DC(int64(0x6ce9557b654ad47b), EConversationDebugInfo::Done);
                DC(int64(0x6ce9557b654ad698), EConversationDebugInfo::Executing);
                // He might be a twit, but he's a bloody skilled twit.
                Stone.AI.Say(LocText("TEXT_WIP_YPNNHIJ_20241128_135941"));
                DC(int64(0x6ce9557b654ad698), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Stone_113939,
                    UTopic_Stone_113919
                );
            }
        }
        
        
        class UTopic_Stone_115120 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0x63e0ed597bfd4902);
            default Caption = LocText("TEXT_WIP_HKWAAOH_20241129_155554_1037");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Stone_115120);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x6ce9557b654ad518), Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_PROOF != nullptr && Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_PROOF.HasSucceeded());
                    DB(int64(0x63e0ed597bfd4921), Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_CRAFT != nullptr && Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_CRAFT.IsRunning());
                }
                
                if (Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_PROOF != nullptr && !Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_PROOF.HasSucceeded())
                    return false;
                
                if (Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_CRAFT != nullptr && !Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_CRAFT.IsRunning())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x63e0ed597bfd4903), EConversationDebugInfo::Executing);
                // Darrion showed me how I can forge the weapon.
                Hero.AI.Say(LocText("TEXT_WIP_HKWAAOH_20241129_155554_1037"));
                DC(int64(0x63e0ed597bfd4903), EConversationDebugInfo::Done);
                DC(int64(0x63e0ed597bfd490a), EConversationDebugInfo::Executing);
                
                // And? Go on.
                Stone.AI.Say(LocText("TEXT_WIP_HKWAAOH_20241129_155618"));
                DC(int64(0x63e0ed597bfd490a), EConversationDebugInfo::Done);
                DC(int64(0x63e0ed597bfd490b), EConversationDebugInfo::Executing);
                
                // Well, there's this ... special way the fuller flows into ...
                Hero.AI.Say(LocText("TEXT_WIP_HKWAAOH_20241129_155654"));
                DC(int64(0x63e0ed597bfd490b), EConversationDebugInfo::Done);
                DC(int64(0x63e0ed597bfd490c), EConversationDebugInfo::Executing);
                
                // Uh, look, do both of us a favor and just forge the ...
                Stone.AI.Say(LocText("TEXT_WIP_HKWAAOH_20241129_155656"));
                DC(int64(0x63e0ed597bfd490c), EConversationDebugInfo::Done);
                DC(int64(0x63e0ed597bfd4916), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_CRAFT.StartQuest();
                DC(int64(0x63e0ed597bfd4916), EConversationDebugInfo::Done);
                DC(int64(0x63e0ed597bfd491b), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x63e0ed597bfd491b), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Stone_115380 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0x63e0ed597bfd494f);
            default Caption = LocText("TEXT_WIP_HKWAAOH_20241129_161040_3334");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x70b98c3088bc4e9), Hero != nullptr && Hero.HasItem(UItMw_1H_Sword_05, 1, 0));
                    DB(int64(0x70b98c3088bc4e9), Hero != nullptr && Hero.HasItem(UItMw_1H_Sword_05_Darrion, 1, 0));
                }
                
                if (Hero != nullptr && Hero.HasItem(UItMw_1H_Sword_05, 1, 0))
                    return true;
                
                if (Hero != nullptr && Hero.HasItem(UItMw_1H_Sword_05_Darrion, 1, 0))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x63e0ed597bfd4950), EConversationDebugInfo::Executing);
                // I have the sword.
                Hero.AI.Say(LocText("TEXT_WIP_HKWAAOH_20241129_161040_3334"));
                DC(int64(0x63e0ed597bfd4950), EConversationDebugInfo::Done);
                DC(int64(0x63e0ed597bfd495d), EConversationDebugInfo::Executing);
                
                // Let me see.
                Stone.AI.Say(LocText("TEXT_WIP_HKWAAOH_20241129_161514"));
                DC(int64(0x63e0ed597bfd495d), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Stone_115471,
                    UTopic_Stone_115491,
                    UTopic_Stone_115594,
                    UTopic_Stone_115614,
                    UTopic_Stone_115682
                );
                DC(int64(0xb0390184b1c21541), EConversationDebugInfo::Executing);
                // So this is enough?
                Hero.AI.Say(LocText("TEXT_WIP_KUNKPJ_20241201_231710"));
                DC(int64(0xb0390184b1c21541), EConversationDebugInfo::Done);
                DC(int64(0xb0390184b1c21542), EConversationDebugInfo::Executing);
                
                // Yeah. I hate to admit it, but the little rat knows his ...
                Stone.AI.Say(LocText("TEXT_WIP_KUNKPJ_20241201_231710_1924"));
                DC(int64(0xb0390184b1c21542), EConversationDebugInfo::Done);
                DC(int64(0xb0390184b1c21553), EConversationDebugInfo::Executing);
                // Yeah - I never understand what's goin' on in that head ...
                Stone.AI.Say(LocText("TEXT_WIP_KUNKPJ_20241201_231758"));
                DC(int64(0xb0390184b1c21553), EConversationDebugInfo::Done);
                DC(int64(0xb0390184b1c21556), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_DELIVER.SucceedQuest();
                DC(int64(0xb0390184b1c21556), EConversationDebugInfo::Done);
                DB(int64(0xf6512580bb1b2782), G1R.ForgedRivalries_StoneCraft != 0);
                DB(int64(0xf6512580bb1b27a2), G1R.ForgedRivalries_OwnCraftDishonest != 0);
                DB(int64(0xf6512580bb1b2782), G1R.ForgedRivalries_StoneCraft != 0);
                DB(int64(0xf6512580bb1b27a2), G1R.ForgedRivalries_DarrionCraftDishonest != 0);
                DB(int64(0xf6512580bb1b27a2), G1R.ForgedRivalries_DarrionCraftDishonest != 0);
                DB(int64(0xf6512580bb1b27a2), G1R.ForgedRivalries_OwnCraftDishonest != 0);
                
                if (((G1R.ForgedRivalries_StoneCraft != 0 && G1R.ForgedRivalries_OwnCraftDishonest != 0)) || ((G1R.ForgedRivalries_StoneCraft != 0 && G1R.ForgedRivalries_DarrionCraftDishonest != 0)))
                {
                    DC(int64(0xf6512580bb1b27eb), EConversationDebugInfo::Executing);
                    // Here's your payment.
                    Stone.AI.Say(LocText("TEXT_WIP_PTPTBXD_20241202_110519_41"));
                    DC(int64(0xf6512580bb1b27eb), EConversationDebugInfo::Done);
                    DC(int64(0xf6512580bb1b282f), EConversationDebugInfo::Executing);
                    // You could have earned more, but you're a lyin' wastrel.
                    Stone.AI.Say(LocText("TEXT_WIP_PTPTBXD_20241202_111029"));
                    DC(int64(0xf6512580bb1b282f), EConversationDebugInfo::Done);
                    DC(int64(0xea2bca374667d380), EConversationDebugInfo::Executing);
                    Stone.AddItemToInventory(UItMi_Orenugget, 30);
                    DC(int64(0xea2bca374667d380), EConversationDebugInfo::Done);
                    DC(int64(0xf6512580bb1b2798), EConversationDebugInfo::Executing);
                    Stone.AI.GiveItemTo(Hero, UItMi_Orenugget, 30);
                    DC(int64(0xf6512580bb1b2798), EConversationDebugInfo::Done);
                }
                else if ((G1R.ForgedRivalries_DarrionCraftDishonest != 0) || (G1R.ForgedRivalries_OwnCraftDishonest != 0))
                {
                    DC(int64(0xf6512580bb1b27f5), EConversationDebugInfo::Executing);
                    // Here's your payment.
                    Stone.AI.Say(LocText("TEXT_WIP_PTPTBXD_20241202_110519_41"));
                    DC(int64(0xf6512580bb1b27f5), EConversationDebugInfo::Done);
                    DC(int64(0xf6512580bb1b2830), EConversationDebugInfo::Executing);
                    // You did the work, but lie to me one more time ...
                    Stone.AI.Say(LocText("TEXT_WIP_PTPTBXD_20241202_111040"));
                    DC(int64(0xf6512580bb1b2830), EConversationDebugInfo::Done);
                    DC(int64(0xea2bca374667d380), EConversationDebugInfo::Executing);
                    Stone.AddItemToInventory(UItMi_Orenugget, 50);
                    DC(int64(0xea2bca374667d380), EConversationDebugInfo::Done);
                    DC(int64(0xf6512580bb1b2809), EConversationDebugInfo::Executing);
                    Stone.AI.GiveItemTo(Hero, UItMi_Orenugget, 50);
                    DC(int64(0xf6512580bb1b2809), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0xf6512580bb1b27fb), EConversationDebugInfo::Executing);
                    // Here's your payment.
                    Stone.AI.Say(LocText("TEXT_WIP_PTPTBXD_20241202_110519_41"));
                    DC(int64(0xf6512580bb1b27fb), EConversationDebugInfo::Done);
                    DC(int64(0xea2bca374667d380), EConversationDebugInfo::Executing);
                    Stone.AddItemToInventory(UItMi_Orenugget, 70);
                    DC(int64(0xea2bca374667d380), EConversationDebugInfo::Done);
                    DC(int64(0xf6512580bb1b281b), EConversationDebugInfo::Executing);
                    Stone.AI.GiveItemTo(Hero, UItMi_Orenugget, 70);
                    DC(int64(0xf6512580bb1b281b), EConversationDebugInfo::Done);
                }
                DC(int64(0xf6512580bb1b281d), EConversationDebugInfo::Executing);
                // Now get out - I've gotta concentrate on this.
                Stone.AI.Say(LocText("TEXT_WIP_PTPTBXD_20241202_110917_1924"));
                DC(int64(0xf6512580bb1b281d), EConversationDebugInfo::Done);
                DC(int64(0xf6512580bb1b282a), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xf6512580bb1b282a), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Stone_114896 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0x6ce9557b654ad51d);
            default Caption = LocText("TEXT_WIP_YPNNHIJ_20241128_115717_2801");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6ce9557b654ad51e), EConversationDebugInfo::Executing);
                // Not really.
                Hero.AI.Say(LocText("TEXT_WIP_YPNNHIJ_20241128_115717_2801"));
                DC(int64(0x6ce9557b654ad51e), EConversationDebugInfo::Done);
                DC(int64(0x6ce9557b654ad525), EConversationDebugInfo::Executing);
                
                // Then stop wastin' me time.
                Stone.AI.Say(LocText("TEXT_WIP_YPNNHIJ_20241128_115723"));
                DC(int64(0x6ce9557b654ad525), EConversationDebugInfo::Done);
                DC(int64(0x6ce9557b654ad52e), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x6ce9557b654ad52e), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Stone_113939 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0x6ce9557b654ad489);
            default Caption = LocText("TEXT_WIP_YPNNHIJ_20241128_112233_2386");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Stone_113939);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6ce9557b654ad48a), EConversationDebugInfo::Executing);
                // He definitely talks as if he was working for the king.
                Hero.AI.Say(LocText("TEXT_WIP_YPNNHIJ_20241128_112233_2386"));
                DC(int64(0x6ce9557b654ad48a), EConversationDebugInfo::Done);
                DC(int64(0x6ce9557b654ad49e), EConversationDebugInfo::Executing);
                
                // Right? Acts like a bloody courtier and probably thinks ...
                Stone.AI.Say(LocText("TEXT_WIP_YPNNHIJ_20241128_112558"));
                DC(int64(0x6ce9557b654ad49e), EConversationDebugInfo::Done);
                DC(int64(0x6ce9557b654ad49f), EConversationDebugInfo::Executing);
                // He knows his craft, I'll give him that, but ...
                Stone.AI.Say(LocText("TEXT_WIP_YPNNHIJ_20241128_112923"));
                DC(int64(0x6ce9557b654ad49f), EConversationDebugInfo::Done);
                DC(int64(0x6ce9557b654ad48c), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x6ce9557b654ad48c), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Stone_113919 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0x6ce9557b654ad485);
            default Caption = LocText("TEXT_WIP_YPNNHIJ_20241128_112233_3286");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Stone_113919);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6ce9557b654ad486), EConversationDebugInfo::Executing);
                // He wants me to forge a Light Two-Handed Sword.
                Hero.AI.Say(LocText("TEXT_WIP_YPNNHIJ_20241128_112233_3286"));
                DC(int64(0x6ce9557b654ad486), EConversationDebugInfo::Done);
                DC(int64(0x6ce9557b654ad491), EConversationDebugInfo::Executing);
                
                // O' course he can't just share his knowledge, and has to ...
                Stone.AI.Say(LocText("TEXT_WIP_YPNNHIJ_20241128_112311"));
                DC(int64(0x6ce9557b654ad491), EConversationDebugInfo::Done);
                DB(int64(0x6ce9557b654ad542), Hero != nullptr && Hero.HasItem(UItMw_2H_Sword_Light_01, 1, 0));
                DB(int64(0x63e0ed597bfd4938), Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_PROOF != nullptr && Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_PROOF.IsRunning());
                DB(int64(0x6ce9557b654ad5ac), Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_PROOF != nullptr && Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_PROOF.HasSucceeded());
                DB(int64(0x63e0ed597bfd4922), Hero != nullptr && Hero.HasItem(UItMw_1H_Sword_Lightguard_01, 1, 0));
                DB(int64(0xf1b2980e0808a8e3), Hero != nullptr && Hero.HasLearnedRecipe(UReMw_2H_Sword_Light_01));
                
                if (Hero != nullptr && Hero.HasItem(UItMw_2H_Sword_Light_01, 1, 0) && Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_PROOF != nullptr && Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_PROOF.IsRunning())
                {
                    DC(int64(0x6ce9557b654ad5ad), EConversationDebugInfo::Executing);
                    // Already forged it.
                    Hero.AI.Say(LocText("TEXT_WIP_YPNNHIJ_20241128_120806"));
                    DC(int64(0x6ce9557b654ad5ad), EConversationDebugInfo::Done);
                    DC(int64(0x6ce9557b654ad5ae), EConversationDebugInfo::Executing);
                    
                    // Then what are you waitin' for? Go show that bloke what ...
                    Stone.AI.Say(LocText("TEXT_WIP_YPNNHIJ_20241128_120806_731"));
                    DC(int64(0x6ce9557b654ad5ae), EConversationDebugInfo::Done);
                    DC(int64(0x6ce9557b654ad5b3), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x6ce9557b654ad5b3), EConversationDebugInfo::Done);
                    return;
                }
                else if (Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_PROOF != nullptr && Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_PROOF.HasSucceeded())
                {
                    DC(int64(0x63e0ed597bfd4941), EConversationDebugInfo::Executing);
                    // Done that already.
                    Hero.AI.Say(LocText("TEXT_WIP_HKWAAOH_20241129_160552"));
                    DC(int64(0x63e0ed597bfd4941), EConversationDebugInfo::Done);
                    DC(int64(0x63e0ed597bfd4942), EConversationDebugInfo::Executing);
                    
                    // Good. And did you learn anythin' useful?
                    Stone.AI.Say(LocText("TEXT_WIP_HKWAAOH_20241129_160552_2332"));
                    DC(int64(0x63e0ed597bfd4942), EConversationDebugInfo::Done);
                    DC(int64(0x63e0ed597bfd4947), EConversationDebugInfo::Executing);
                    ReturnToLastSelection(2);
                    DC(int64(0x63e0ed597bfd4947), EConversationDebugInfo::Done);
                }
                else if ((Hero != nullptr && Hero.HasItem(UItMw_1H_Sword_Lightguard_01, 1, 0)) || (Hero != nullptr && Hero.HasLearnedRecipe(UReMw_2H_Sword_Light_01)))
                {
                    DC(int64(0x6ce9557b654ad5a6), EConversationDebugInfo::Executing);
                    // He made me pay for the design first.
                    Hero.AI.Say(LocText("TEXT_WIP_YPNNHIJ_20241128_120605"));
                    DC(int64(0x6ce9557b654ad5a6), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x6ce9557b654ad5d8), EConversationDebugInfo::Executing);
                    // He wants me to pay for the design.
                    Hero.AI.Say(LocText("TEXT_WIP_YPNNHIJ_20241128_121051"));
                    DC(int64(0x6ce9557b654ad5d8), EConversationDebugInfo::Done);
                }
                DC(int64(0x6ce9557b654ad5a7), EConversationDebugInfo::Executing);
                // What a greedy bastard. Even the ore barons couldn't be ...
                Stone.AI.Say(LocText("TEXT_WIP_YPNNHIJ_20241128_120605_3750"));
                DC(int64(0x6ce9557b654ad5a7), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Stone_115471 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0x63e0ed597bfd4967);
            default Caption = LocText("TEXT_WIP_KUNKPJ_20241201_225941_2456");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Stone_115471);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x63e0ed597bfd4974), Hero != nullptr && Hero.HasItem(UItMw_1H_Sword_05_Darrion, 1, 0));
                }
                
                return Hero != nullptr && Hero.HasItem(UItMw_1H_Sword_05_Darrion, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x63e0ed597bfd4968), EConversationDebugInfo::Executing);
                
                // Here, I got the templar's sword.
                Hero.AI.Say(LocText("TEXT_WIP_HKWAAOH_20241129_161541_3511"));
                DC(int64(0x63e0ed597bfd4968), EConversationDebugInfo::Done);
                DC(int64(0xb0390184b1c214cc), EConversationDebugInfo::Executing);
                
                // Now that's ... unexpected. Let me see.
                Stone.AI.Say(LocText("TEXT_WIP_KUNKPJ_20241201_230406"));
                DC(int64(0xb0390184b1c214cc), EConversationDebugInfo::Done);
                DC(int64(0xb0390184b1c214c3), EConversationDebugInfo::Executing);
                Hero.AI.GiveItemTo(Stone, UItMw_1H_Sword_05_Darrion, 1);
                DC(int64(0xb0390184b1c214c3), EConversationDebugInfo::Done);
                DC(int64(0x63e0ed597bfd4a1b), EConversationDebugInfo::Executing);
                // By Beliar's crooked horns, that swamp rat actually ...
                Stone.AI.Say(LocText("TEXT_WIP_HKWAAOH_20241129_171627"));
                DC(int64(0x63e0ed597bfd4a1b), EConversationDebugInfo::Done);
                DC(int64(0x63e0ed597bfd4a20), EConversationDebugInfo::Executing);
                // The balance, the flow of the steel, even that red ...
                Stone.AI.Say(LocText("TEXT_WIP_HKWAAOH_20241129_171646"));
                DC(int64(0x63e0ed597bfd4a20), EConversationDebugInfo::Done);
                DC(int64(0xf6512580bb1b2736), EConversationDebugInfo::Executing);
                G1R.ForgedRivalries_DarrionCraftHonest = 1;
                DC(int64(0xf6512580bb1b2736), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Stone_115491 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0x63e0ed597bfd496b);
            default Caption = LocText("TEXT_WIP_KUNKPJ_20241201_225941_3912");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Stone_115491);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x63e0ed597bfd4974), Hero != nullptr && Hero.HasItem(UItMw_1H_Sword_05_Darrion, 1, 0));
                }
                
                return Hero != nullptr && Hero.HasItem(UItMw_1H_Sword_05_Darrion, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x63e0ed597bfd496c), EConversationDebugInfo::Executing);
                // Here - forged it myself.
                Hero.AI.Say(LocText("TEXT_WIP_HKWAAOH_20241129_161541_1246"));
                DC(int64(0x63e0ed597bfd496c), EConversationDebugInfo::Done);
                DC(int64(0xb0390184b1c21540), EConversationDebugInfo::Executing);
                
                // Let's see what we gotta clean up, then ...
                Stone.AI.Say(LocText("TEXT_WIP_KUNKPJ_20241201_231607"));
                DC(int64(0xb0390184b1c21540), EConversationDebugInfo::Done);
                DC(int64(0xb0390184b1c214c3), EConversationDebugInfo::Executing);
                Hero.AI.GiveItemTo(Stone, UItMw_1H_Sword_05_Darrion, 1);
                DC(int64(0xb0390184b1c214c3), EConversationDebugInfo::Done);
                DC(int64(0xb0390184b1c214eb), EConversationDebugInfo::Executing);
                // What - you think I'm some fresh-faced apprentice who ...
                Stone.AI.Say(LocText("TEXT_WIP_KUNKPJ_20241201_230653"));
                DC(int64(0xb0390184b1c214eb), EConversationDebugInfo::Done);
                DC(int64(0xb0390184b1c214f1), EConversationDebugInfo::Executing);
                // Next time you try passin' off stolen work as your own, ...
                Stone.AI.Say(LocText("TEXT_WIP_KUNKPJ_20241201_230656"));
                DC(int64(0xb0390184b1c214f1), EConversationDebugInfo::Done);
                DC(int64(0xb0390184b1c21503), EConversationDebugInfo::Executing);
                // By Beliar's crooked horns, that swamp rat actually ...
                Stone.AI.Say(LocText("TEXT_WIP_HKWAAOH_20241129_171627"));
                DC(int64(0xb0390184b1c21503), EConversationDebugInfo::Done);
                DC(int64(0xb0390184b1c21504), EConversationDebugInfo::Executing);
                // The balance, the flow of the steel, even that red ...
                Stone.AI.Say(LocText("TEXT_WIP_HKWAAOH_20241129_171646"));
                DC(int64(0xb0390184b1c21504), EConversationDebugInfo::Done);
                DC(int64(0xf6512580bb1b2736), EConversationDebugInfo::Executing);
                G1R.ForgedRivalries_DarrionCraftDishonest = 1;
                DC(int64(0xf6512580bb1b2736), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Stone_115594 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0x63e0ed597bfd4982);
            default Caption = LocText("TEXT_WIP_KUNKPJ_20241201_225941_3144");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Stone_115594);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x63e0ed597bfd4974), Hero != nullptr && Hero.HasItem(UItMw_1H_Sword_05, 1, 0));
                }
                
                return Hero != nullptr && Hero.HasItem(UItMw_1H_Sword_05, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x63e0ed597bfd4983), EConversationDebugInfo::Executing);
                // Here, I got the templar's sword.
                Hero.AI.Say(LocText("TEXT_WIP_HKWAAOH_20241129_161541_3511"));
                DC(int64(0x63e0ed597bfd4983), EConversationDebugInfo::Done);
                DC(int64(0xb0390184b1c2152c), EConversationDebugInfo::Executing);
                
                // Now that's ... unexpected. Let me see.
                Stone.AI.Say(LocText("TEXT_WIP_KUNKPJ_20241201_230406"));
                DC(int64(0xb0390184b1c2152c), EConversationDebugInfo::Done);
                DC(int64(0xb0390184b1c214c3), EConversationDebugInfo::Executing);
                Hero.AI.GiveItemTo(Stone, UItMw_1H_Sword_05, 1);
                DC(int64(0xb0390184b1c214c3), EConversationDebugInfo::Done);
                DC(int64(0xb0390184b1c21529), EConversationDebugInfo::Executing);
                // Really? Can't imagine Darrion clobberin' together such ...
                Stone.AI.Say(LocText("TEXT_WIP_KUNKPJ_20241201_231249"));
                DC(int64(0xb0390184b1c21529), EConversationDebugInfo::Done);
                DC(int64(0xb0390184b1c2152a), EConversationDebugInfo::Executing);
                // Look at that - rough, jagged. This ain't good work, even ...
                Stone.AI.Say(LocText("TEXT_WIP_KUNKPJ_20241201_231324"));
                DC(int64(0xb0390184b1c2152a), EConversationDebugInfo::Done);
                DC(int64(0xb0390184b1c2152b), EConversationDebugInfo::Executing);
                // Ah, well, now I see what he was goin' for. Your effort ...
                Stone.AI.Say(LocText("TEXT_WIP_KUNKPJ_20241201_231400"));
                DC(int64(0xb0390184b1c2152b), EConversationDebugInfo::Done);
                DC(int64(0xf6512580bb1b2730), EConversationDebugInfo::Executing);
                G1R.ForgedRivalries_OwnCraftDishonest = 1;
                DC(int64(0xf6512580bb1b2730), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Stone_115614 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0x63e0ed597bfd498a);
            default Caption = LocText("TEXT_WIP_KUNKPJ_20241201_225941_3517");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Stone_115614);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x63e0ed597bfd4974), Hero != nullptr && Hero.HasItem(UItMw_1H_Sword_05, 1, 0));
                }
                
                return Hero != nullptr && Hero.HasItem(UItMw_1H_Sword_05, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x63e0ed597bfd498b), EConversationDebugInfo::Executing);
                // Here - forged it myself.
                Hero.AI.Say(LocText("TEXT_WIP_HKWAAOH_20241129_161541_1246"));
                DC(int64(0x63e0ed597bfd498b), EConversationDebugInfo::Done);
                DC(int64(0xb0390184b1c2153f), EConversationDebugInfo::Executing);
                
                // Let's see what we gotta clean up, then ...
                Stone.AI.Say(LocText("TEXT_WIP_KUNKPJ_20241201_231607"));
                DC(int64(0xb0390184b1c2153f), EConversationDebugInfo::Done);
                DC(int64(0xb0390184b1c214c3), EConversationDebugInfo::Executing);
                Hero.AI.GiveItemTo(Stone, UItMw_1H_Sword_05, 1);
                DC(int64(0xb0390184b1c214c3), EConversationDebugInfo::Done);
                DC(int64(0xb0390184b1c21539), EConversationDebugInfo::Executing);
                // Huh. Pretty rough. Looks like it was hammered together ...
                Stone.AI.Say(LocText("TEXT_WIP_KUNKPJ_20241201_231530_2238"));
                DC(int64(0xb0390184b1c21539), EConversationDebugInfo::Done);
                DC(int64(0xb0390184b1c2153e), EConversationDebugInfo::Executing);
                // Ah, well, now I see what he was goin' for. Your effort ...
                Stone.AI.Say(LocText("TEXT_WIP_KUNKPJ_20241201_231400"));
                DC(int64(0xb0390184b1c2153e), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Stone_115682 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0x63e0ed597bfd49ba);
            default Caption = LocText("TEXT_WIP_YPNNHIJ_20241128_115717_2801");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x63e0ed597bfd49d3), EConversationDebugInfo::Executing);
                
                // Not really.
                Hero.AI.Say(LocText("TEXT_WIP_YPNNHIJ_20241128_115717_2801"));
                DC(int64(0x63e0ed597bfd49d3), EConversationDebugInfo::Done);
                DC(int64(0x63e0ed597bfd49d4), EConversationDebugInfo::Executing);
                
                // Then stop wastin' me time.
                Stone.AI.Say(LocText("TEXT_WIP_YPNNHIJ_20241128_115723"));
                DC(int64(0x63e0ed597bfd49d4), EConversationDebugInfo::Done);
                DC(int64(0x63e0ed597bfd49e5), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x63e0ed597bfd49e5), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceStone114964 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0x6ce9557b654ad53b);
            default Caption = LocText("TEXT_WIP_YPNNHIJ_20241128_120321");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Stone_113919);
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Stone_113919);
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_YPNNHIJ_20241128_120346_1769"), int64(0x6ce9557b654ad53b));
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_YPNNHIJ_20241128_120346_2995"), int64(0x6ce9557b654ad53b));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6ce9557b654ad553), EConversationDebugInfo::Executing);
                // Can you help me?
                Hero.AI.Say(LocText("TEXT_WIP_YPNNHIJ_20241128_120321"));
                DC(int64(0x6ce9557b654ad553), EConversationDebugInfo::Done);
                DC(int64(0x6ce9557b654ad554), EConversationDebugInfo::Executing);
                
                // What do you need?
                Stone.AI.Say(LocText("TEXT_WIP_YPNNHIJ_20241128_120321_443"));
                DC(int64(0x6ce9557b654ad554), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Stone_115044,
                    UTopic_Stone_115064,
                    UTopic_Stone_116908
                );
            }
        }
        
        
        class UTopic_Stone_115044 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0x6ce9557b654ad55a);
            default Caption = LocText("TEXT_WIP_YPNNHIJ_20241128_120346_1769");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x6ce9557b654ad5e7), Hero != nullptr && !Hero.HasLearnedRecipe(UReMw_2H_Sword_Light_01));
                }
                
                return Hero != nullptr && !Hero.HasLearnedRecipe(UReMw_2H_Sword_Light_01);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6ce9557b654ad55b), EConversationDebugInfo::Executing);
                // Show me how to forge a Light Two-Hander.
                Hero.AI.Say(LocText("TEXT_WIP_YPNNHIJ_20241128_120346_1769"));
                DC(int64(0x6ce9557b654ad55b), EConversationDebugInfo::Done);
                DC(int64(0x6ce9557b654ad5f0), EConversationDebugInfo::Executing);
                
                // Ah, now that I can help with. And you should take that ...
                Stone.AI.Say(LocText("TEXT_WIP_YPNNHIJ_20241128_121344"));
                DC(int64(0x6ce9557b654ad5f0), EConversationDebugInfo::Done);
                DC(int64(0x6ce9557b654ad5f9), EConversationDebugInfo::Executing);
                // Now, look - the Two-Hander's secret is in the double ...
                Stone.AI.Say(LocText("TEXT_WIP_YPNNHIJ_20241128_121929"));
                DC(int64(0x6ce9557b654ad5f9), EConversationDebugInfo::Done);
                DC(int64(0x6ce9557b654ad5fa), EConversationDebugInfo::Executing);
                // Soft leather for the crossguard, no decorations needed. ...
                Stone.AI.Say(LocText("TEXT_WIP_YPNNHIJ_20241128_121931"));
                DC(int64(0x6ce9557b654ad5fa), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_FORGEDRIVALRIES_1, Document::UDocumentSegment_CH2_FORGEDRIVALRIES_1_StoneHelpRecipe);
                DC(int64(0x6ce9557b654ad601), EConversationDebugInfo::Executing);
                Hero.LearnRecipe(UReMi_Smith_2H_Sword_Light_01);
                DC(int64(0x6ce9557b654ad601), EConversationDebugInfo::Done);
                DC(int64(0x9733703e835841b7), EConversationDebugInfo::Executing);
                Hero.LearnRecipe(UReMw_2H_Sword_Light_01);
                DC(int64(0x9733703e835841b7), EConversationDebugInfo::Done);
                DC(int64(0x9733703e835841b9), EConversationDebugInfo::Executing);
                Hero.LearnRecipe(UReMi_Smith_Blade_Great);
                DC(int64(0x9733703e835841b9), EConversationDebugInfo::Done);
                DC(int64(0xb6b59bfae2c43a79), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xb6b59bfae2c43a79), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Stone_115064 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0x6ce9557b654ad55e);
            default Caption = LocText("TEXT_WIP_YPNNHIJ_20241128_120346_2995");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6ce9557b654ad55f), EConversationDebugInfo::Executing);
                // Can you forge it for me?
                Hero.AI.Say(LocText("TEXT_WIP_YPNNHIJ_20241128_120346_2995"));
                DC(int64(0x6ce9557b654ad55f), EConversationDebugInfo::Done);
                DB(int64(0x6ce9557b654ad613), G1R.Stone_Teacher != 0);
                
                if (G1R.Stone_Teacher != 0)
                {
                    DC(int64(0x6ce9557b654ad620), EConversationDebugInfo::Executing);
                    // You're askin' your own master? What have I taught you ...
                    Stone.AI.Say(LocText("TEXT_WIP_YPNNHIJ_20241128_123051"));
                    DC(int64(0x6ce9557b654ad620), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x6ce9557b654ad665), EConversationDebugInfo::Executing);
                    // That's just like Darrion: teachin' his apprentice all ...
                    Stone.AI.Say(LocText("TEXT_WIP_YPNNHIJ_20241128_124822"));
                    DC(int64(0x6ce9557b654ad665), EConversationDebugInfo::Done);
                }
                DC(int64(0x6ce9557b654ad666), EConversationDebugInfo::Executing);
                // This is your chance to prove your worth. You should take ...
                Stone.AI.Say(LocText("TEXT_WIP_YPNNHIJ_20241128_124853"));
                DC(int64(0x6ce9557b654ad666), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Stone_115932,
                    UTopic_Stone_115952
                );
            }
        }
        
        
        class UTopic_Stone_116908 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0x6ce9557b654ad677);
            default Caption = LocText("TEXT_WIP_YPNNHIJ_20241128_125125_1037");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6ce9557b654ad678), EConversationDebugInfo::Executing);
                // Never mind. I'll handle it.
                Hero.AI.Say(LocText("TEXT_WIP_YPNNHIJ_20241128_125125_1037"));
                DC(int64(0x6ce9557b654ad678), EConversationDebugInfo::Done);
                DC(int64(0x6ce9557b654ad67f), EConversationDebugInfo::Executing);
                
                // Good. Back to work, then.
                Stone.AI.Say(LocText("TEXT_WIP_YPNNHIJ_20241128_125140"));
                DC(int64(0x6ce9557b654ad67f), EConversationDebugInfo::Done);
                DC(int64(0x6ce9557b654ad688), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x6ce9557b654ad688), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Stone_115932 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0x6ce9557b654ad628);
            default Caption = LocText("TEXT_WIP_YPNNHIJ_20241128_123156_2316");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Stone_115932);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6ce9557b654ad629), EConversationDebugInfo::Executing);
                // I really need that Two-Hander. Fast.
                Hero.AI.Say(LocText("TEXT_WIP_YPNNHIJ_20241128_123156_2316"));
                DC(int64(0x6ce9557b654ad629), EConversationDebugInfo::Done);
                DC(int64(0x6ce9557b654ad636), EConversationDebugInfo::Executing);
                
                // What a disgrace ... Fine. This one'll do - take it.
                Stone.AI.Say(LocText("TEXT_WIP_YPNNHIJ_20241128_123701"));
                DC(int64(0x6ce9557b654ad636), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_FORGEDRIVALRIES_1, Document::UDocumentSegment_CH2_FORGEDRIVALRIES_1_StoneHelpSword);
                DC(int64(0xea2bca374667d380), EConversationDebugInfo::Executing);
                Stone.AddItemToInventory(UItMw_2H_Sword_Light_01_Stone, 1);
                DC(int64(0xea2bca374667d380), EConversationDebugInfo::Done);
                DC(int64(0x6ce9557b654ad643), EConversationDebugInfo::Executing);
                Stone.AI.GiveItemTo(Hero, UItMw_2H_Sword_Light_01_Stone, 1);
                DC(int64(0x6ce9557b654ad643), EConversationDebugInfo::Done);
                DC(int64(0xf6512580bb1b274c), EConversationDebugInfo::Executing);
                G1R.ForgedRivalries_StoneCraft = 1;
                DC(int64(0xf6512580bb1b274c), EConversationDebugInfo::Done);
                DC(int64(0x6ce9557b654ad645), EConversationDebugInfo::Executing);
                // And now back to work.
                Stone.AI.Say(LocText("TEXT_WIP_YPNNHIJ_20241128_124127_292"));
                DC(int64(0x6ce9557b654ad645), EConversationDebugInfo::Done);
                DC(int64(0x6ce9557b654ad64a), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x6ce9557b654ad64a), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Stone_115952 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0x6ce9557b654ad62c);
            default Caption = LocText("TEXT_WIP_YPNNHIJ_20241128_123156_153");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Stone_115952);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6ce9557b654ad62d), EConversationDebugInfo::Executing);
                // No, you're right. I'll forge it myself.
                Hero.AI.Say(LocText("TEXT_WIP_YPNNHIJ_20241128_123156_153"));
                DC(int64(0x6ce9557b654ad62d), EConversationDebugInfo::Done);
                DC(int64(0x6ce9557b654ad634), EConversationDebugInfo::Executing);
                
                // Ah, there's hope for you yet. Show that swamp rat what ...
                Stone.AI.Say(LocText("TEXT_WIP_YPNNHIJ_20241128_123305"));
                DC(int64(0x6ce9557b654ad634), EConversationDebugInfo::Done);
                DC(int64(0xb6b59bfae2c43a86), EConversationDebugInfo::Executing);
                ReturnToLastSelection(2);
                DC(int64(0xb6b59bfae2c43a86), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceStone115775 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0x21bf47f8baf4c80c);
            default Caption = LocText("TEXT_WIP_OTPTBXD_20241203_144851");
            default PriorityRank = 3;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x253b1d61ddae1465), Quest::SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2_FORGEDRIVALRIES_2_OBJ_STEAL != nullptr && Quest::SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2_FORGEDRIVALRIES_2_OBJ_STEAL.IsRunning());
                }
                
                return Quest::SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2_FORGEDRIVALRIES_2_OBJ_STEAL != nullptr && Quest::SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2_FORGEDRIVALRIES_2_OBJ_STEAL.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x21bf47f8baf4c806), EConversationDebugInfo::Executing);
                // I learned about a new weapon design.
                Hero.AI.Say(LocText("TEXT_WIP_OTPTBXD_20241203_144851"));
                DC(int64(0x21bf47f8baf4c806), EConversationDebugInfo::Done);
                DC(int64(0x21bf47f8baf4c807), EConversationDebugInfo::Executing);
                
                // And? What's that got to do with me?
                Stone.AI.Say(LocText("TEXT_WIP_OTPTBXD_20241203_144851_3436"));
                DC(int64(0x21bf47f8baf4c807), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Stone_115823,
                    UTopic_Stone_115843,
                    UTopic_Stone_116044,
                    UTopic_Stone_116267
                );
            }
        }
        
        
        class UTopic_Stone_115823 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0xbf5f3a0e565b7adb);
            default Caption = LocText("TEXT_WIP_OTPTBXD_20241203_151527_41");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Stone_115823);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xbf5f3a0e565b7adc), EConversationDebugInfo::Executing);
                // Thought you might be interested.
                Hero.AI.Say(LocText("TEXT_WIP_OTPTBXD_20241203_151527_41"));
                DC(int64(0xbf5f3a0e565b7adc), EConversationDebugInfo::Done);
                DC(int64(0xbf5f3a0e565b7ae7), EConversationDebugInfo::Executing);
                
                // Get the design, then I'll take a look.
                Stone.AI.Say(LocText("TEXT_WIP_OTPTBXD_20241203_151529"));
                DC(int64(0xbf5f3a0e565b7ae7), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_FORGEDRIVALRIES_2, Document::UDocumentSegment_CH3_FORGEDRIVALRIES_2_StoneKnowsNothing);
                DC(int64(0xbf5f3a0e565b7ade), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xbf5f3a0e565b7ade), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Stone_115843 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0xbf5f3a0e565b7adf);
            default Caption = LocText("TEXT_WIP_OTPTBXD_20241203_151527_2238");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Stone_115843);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xbf5f3a0e565b7ae0), EConversationDebugInfo::Executing);
                // It's a mace design. Word is Gomez got it from the ...
                Hero.AI.Say(LocText("TEXT_WIP_OTPTBXD_20241203_151527_2238"));
                DC(int64(0xbf5f3a0e565b7ae0), EConversationDebugInfo::Done);
                DC(int64(0xbf5f3a0e565b7ae8), EConversationDebugInfo::Executing);
                
                // Ah, spent too much time by the fire, eh? The lads talk a ...
                Stone.AI.Say(LocText("TEXT_WIP_OTPTBXD_20241203_151658"));
                DC(int64(0xbf5f3a0e565b7ae8), EConversationDebugInfo::Done);
                DC(int64(0xc185e3efc45d4961), EConversationDebugInfo::Executing);
                // Regardless, I'd be careful where you wag that tongue. ...
                Stone.AI.Say(LocText("TEXT_WIP_HUNKPJ_20241204_161947"));
                DC(int64(0xc185e3efc45d4961), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_FORGEDRIVALRIES_2, Document::UDocumentSegment_CH3_FORGEDRIVALRIES_2_StoneKnowsGomezDesign);
                DC(int64(0xbf5f3a0e565b7b0e), EConversationDebugInfo::Executing);
                G1R.ForgedRivalries2_StoneKnowsDesignIsGomez = 1;
                DC(int64(0xbf5f3a0e565b7b0e), EConversationDebugInfo::Done);
                DC(int64(0xbf5f3a0e565b7ae2), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xbf5f3a0e565b7ae2), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Stone_116044 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0xbf5f3a0e565b7ae9);
            default Caption = LocText("TEXT_WIP_OTPTBXD_20241203_151844_1924");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Stone_116044);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xbf5f3a0e565b7aea), EConversationDebugInfo::Executing);
                // Darrion pointed me to it.
                Hero.AI.Say(LocText("TEXT_WIP_OTPTBXD_20241203_151844_1924"));
                DC(int64(0xbf5f3a0e565b7aea), EConversationDebugInfo::Done);
                DC(int64(0xbf5f3a0e565b7af1), EConversationDebugInfo::Executing);
                
                // What, that swamp rat? What's he stirrin' up now?
                Stone.AI.Say(LocText("TEXT_WIP_OTPTBXD_20241203_151856"));
                DC(int64(0xbf5f3a0e565b7af1), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Stone_116137,
                    UTopic_Stone_116157,
                    UTopic_Stone_116090
                );
            }
        }
        
        
        class UTopic_Stone_116267 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0x1ff6f3c40af43baa);
            default Caption = LocText("TEXT_WIP_OTPTBXD_20241203_154152_1924");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Stone_116267);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1ff6f3c40af43bab), EConversationDebugInfo::Executing);
                // I'll be going.
                Hero.AI.Say(LocText("TEXT_WIP_OTPTBXD_20241203_154152_1924"));
                DC(int64(0x1ff6f3c40af43bab), EConversationDebugInfo::Done);
                DC(int64(0x1ff6f3c40af43bb2), EConversationDebugInfo::Executing);
                
                // Yeah, you do that.
                Stone.AI.Say(LocText("TEXT_WIP_OTPTBXD_20241203_154208"));
                DC(int64(0x1ff6f3c40af43bb2), EConversationDebugInfo::Done);
                DC(int64(0x1ff6f3c40af43bb7), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x1ff6f3c40af43bb7), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Stone_116137 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0xbf5f3a0e565b7afb);
            default Caption = LocText("TEXT_WIP_OTPTBXD_20241203_152105_2785");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Stone_116137);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xbf5f3a0e565b7afc), EConversationDebugInfo::Executing);
                // He wants me to get the design.
                Hero.AI.Say(LocText("TEXT_WIP_OTPTBXD_20241203_152105_2785"));
                DC(int64(0xbf5f3a0e565b7afc), EConversationDebugInfo::Done);
                DC(int64(0xbf5f3a0e565b7b07), EConversationDebugInfo::Executing);
                
                // Does he now? Could be worth it after all, then.
                Stone.AI.Say(LocText("TEXT_WIP_OTPTBXD_20241203_152129"));
                DC(int64(0xbf5f3a0e565b7b07), EConversationDebugInfo::Done);
                DC(int64(0xbf5f3a0e565b7b08), EConversationDebugInfo::Executing);
                // Look, if you get those plans, you bring them to me, and ...
                Stone.AI.Say(LocText("TEXT_WIP_OTPTBXD_20241203_152300"));
                DC(int64(0xbf5f3a0e565b7b08), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_FORGEDRIVALRIES_2, Document::UDocumentSegment_CH3_FORGEDRIVALRIES_2_StoneKnowsNothing);
                DC(int64(0x1ff6f3c40af43b4f), EConversationDebugInfo::Executing);
                G1R.ForgedRivalries2_StoneKnowsDarrionPlanPartial = 1;
                DC(int64(0x1ff6f3c40af43b4f), EConversationDebugInfo::Done);
                DC(int64(0x1ff6f3c40af43b7c), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x1ff6f3c40af43b7c), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Stone_116157 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0xbf5f3a0e565b7aff);
            default Caption = LocText("TEXT_WIP_OTPTBXD_20241203_152105_3286");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Stone_116157);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xbf5f3a0e565b7b00), EConversationDebugInfo::Executing);
                // He wants me give the design to you.
                Hero.AI.Say(LocText("TEXT_WIP_OTPTBXD_20241203_152105_3286"));
                DC(int64(0xbf5f3a0e565b7b00), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_FORGEDRIVALRIES_2, Document::UDocumentSegment_CH3_FORGEDRIVALRIES_2_StoneKnowsDarrionPlan);
                DB(int64(0x1ff6f3c40af43b5d), G1R.ForgedRivalries2_StoneKnowsDesignIsGomez == 0);
                
                if (G1R.ForgedRivalries2_StoneKnowsDesignIsGomez == 0)
                {
                    DC(int64(0x1ff6f3c40af43b62), EConversationDebugInfo::Executing);
                    // Since when does the Master Artist share his precious ...
                    Stone.AI.Say(LocText("TEXT_WIP_OTPTBXD_20241203_153016"));
                    DC(int64(0x1ff6f3c40af43b62), EConversationDebugInfo::Done);
                    DC(int64(0x1ff6f3c40af43b63), EConversationDebugInfo::Executing);
                    
                    // It's a mace design. Word is Gomez got it from the ...
                    Hero.AI.Say(LocText("TEXT_WIP_OTPTBXD_20241203_151527_2238"));
                    DC(int64(0x1ff6f3c40af43b63), EConversationDebugInfo::Done);
                    DC(int64(0xbf5f3a0e565b7b0e), EConversationDebugInfo::Executing);
                    G1R.ForgedRivalries2_StoneKnowsDesignIsGomez = 1;
                    DC(int64(0xbf5f3a0e565b7b0e), EConversationDebugInfo::Done);
                }
                DC(int64(0x1ff6f3c40af43b68), EConversationDebugInfo::Executing);
                // Blimey and call me a molerat ... He thinks I'm gonna ...
                Stone.AI.Say(LocText("TEXT_WIP_OTPTBXD_20241203_153156"));
                DC(int64(0x1ff6f3c40af43b68), EConversationDebugInfo::Done);
                DC(int64(0x1ff6f3c40af43b72), EConversationDebugInfo::Executing);
                // Didn't think him THAT resentful.
                Stone.AI.Say(LocText("TEXT_WIP_OTPTBXD_20241203_153409"));
                DC(int64(0x1ff6f3c40af43b72), EConversationDebugInfo::Done);
                DC(int64(0x1ff6f3c40af43b81), EConversationDebugInfo::Executing);
                
                // Something like that yes.
                Hero.AI.Say(LocText("TEXT_WIP_OTPTBXD_20241203_153937"));
                DC(int64(0x1ff6f3c40af43b81), EConversationDebugInfo::Done);
                DC(int64(0x1ff6f3c40af43b82), EConversationDebugInfo::Executing);
                
                // Right, then. Bring me the design, and I'll forge the ...
                Stone.AI.Say(LocText("TEXT_WIP_OTPTBXD_20241203_153951"));
                DC(int64(0x1ff6f3c40af43b82), EConversationDebugInfo::Done);
                DC(int64(0x1ff6f3c40af43b4f), EConversationDebugInfo::Executing);
                G1R.ForgedRivalries2_StoneKnowsDarrionPlanFull = 1;
                DC(int64(0x1ff6f3c40af43b4f), EConversationDebugInfo::Done);
                DC(int64(0x1ff6f3c40af43ba5), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x1ff6f3c40af43ba5), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Stone_116090 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0x1ff6f3c40af43b73);
            default Caption = LocText("TEXT_WIP_OTPTBXD_20241203_153534_2238");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Stone_116090);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1ff6f3c40af43b74), EConversationDebugInfo::Executing);
                // Never mind.
                Hero.AI.Say(LocText("TEXT_WIP_OTPTBXD_20241203_153534_2238"));
                DC(int64(0x1ff6f3c40af43b74), EConversationDebugInfo::Done);
                DC(int64(0x1ff6f3c40af43b7b), EConversationDebugInfo::Executing);
                
                // Oy, you don't walk away after droppin' that name in me ...
                Stone.AI.Say(LocText("TEXT_WIP_OTPTBXD_20241203_153541"));
                DC(int64(0x1ff6f3c40af43b7b), EConversationDebugInfo::Done);
                DC(int64(0x1ff6f3c40af43b76), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x1ff6f3c40af43b76), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceStone116373 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0x1ff6f3c40af43bc2);
            default Caption = LocText("TEXT_WIP_OTPTBXD_20241203_160934");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceStone116373);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x1b323555ce015f61), Quest::SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2_FORGEDRIVALRIES_2_OBJ_GIVEDESIGNTOSTONE != nullptr && Quest::SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2_FORGEDRIVALRIES_2_OBJ_GIVEDESIGNTOSTONE.IsRunning());
                    DB(int64(0xaa5281900a4bf041), Hero != nullptr && Hero.HasItem(UItMs_Scroll_WeaponDesign, 1, 0));
                }
                
                if (Quest::SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2_FORGEDRIVALRIES_2_OBJ_GIVEDESIGNTOSTONE != nullptr && !Quest::SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2_FORGEDRIVALRIES_2_OBJ_GIVEDESIGNTOSTONE.IsRunning())
                    return false;
                
                if (Hero != nullptr && !Hero.HasItem(UItMs_Scroll_WeaponDesign, 1, 0))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1ff6f3c40af43bbc), EConversationDebugInfo::Executing);
                // I have a weapon design for you.
                Hero.AI.Say(LocText("TEXT_WIP_OTPTBXD_20241203_160934"));
                DC(int64(0x1ff6f3c40af43bbc), EConversationDebugInfo::Done);
                DC(int64(0x1b323555ce015f79), EConversationDebugInfo::Executing);
                Hero.AI.GiveItemTo(Stone, UItMs_Scroll_WeaponDesign, 1);
                DC(int64(0x1b323555ce015f79), EConversationDebugInfo::Done);
                DC(int64(0xd03551f16efaa4c1), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2_FORGEDRIVALRIES_2_OBJ_GIVEDESIGNTOSTONE.SucceedQuest();
                DC(int64(0xd03551f16efaa4c1), EConversationDebugInfo::Done);
                DC(int64(0xedb2776a2665f801), EConversationDebugInfo::Executing);
                // Now that ... that's what I call proper craftsmanship. ...
                Stone.AI.Say(LocText("TEXT_WIP_HUNKPJ_20241204_112234"));
                DC(int64(0xedb2776a2665f801), EConversationDebugInfo::Done);
                DC(int64(0x4f6fb39363d17876), EConversationDebugInfo::Executing);
                // Balanced death from both ends. Whoever drew these knew ...
                Stone.AI.Say(LocText("TEXT_WIP_KEQZAEL_20241220_213638"));
                DC(int64(0x4f6fb39363d17876), EConversationDebugInfo::Done);
                DB(int64(0x1b323555ce015f56), G1R.ForgedRivalries2_StoneKnowsDarrionPlanFull != 0);
                DB(int64(0x1b323555ce015f66), G1R.ForgedRivalries2_StoneKnowsDarrionPlanPartial != 0);
                DB(int64(0xedb2776a2665f831), G1R.ForgedRivalries2_StoneKnowsDesignIsGomez != 0);
                
                if (G1R.ForgedRivalries2_StoneKnowsDarrionPlanFull != 0)
                {
                    DC(int64(0xedb2776a2665f8c0), EConversationDebugInfo::Executing);
                    // What now?
                    Hero.AI.Say(LocText("TEXT_WIP_HUNKPJ_20241204_114421_3984"));
                    DC(int64(0xedb2776a2665f8c0), EConversationDebugInfo::Done);
                    DC(int64(0x1b323555ce015f6f), EConversationDebugInfo::Executing);
                    
                    // If you can keep your gob shut about it, I'm gonna forge ...
                    Stone.AI.Say(LocText("TEXT_WIP_HUNKPJ_20241204_114544"));
                    DC(int64(0x1b323555ce015f6f), EConversationDebugInfo::Done);
                    /* Skip invalid: UnlockDocumentSegment / */;
                    
                    Other.Remember(n"choice_stone_116373_exit_1");
                }
                else if (G1R.ForgedRivalries2_StoneKnowsDarrionPlanPartial != 0 && G1R.ForgedRivalries2_StoneKnowsDesignIsGomez != 0)
                {
                    DC(int64(0xedb2776a2665f9ac), EConversationDebugInfo::Executing);
                    // Thanks for that. But forgin' it for you is gonna cost ...
                    Stone.AI.Say(LocText("TEXT_WIP_HUNKPJ_20241204_124850_3569"));
                    DC(int64(0xedb2776a2665f9ac), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_stone_116373_exit_2");
                }
                else
                {
                    DC(int64(0x1b323555ce015f94), EConversationDebugInfo::Executing);
                    // It's got the royal mark ... WHERE in Innos' name did you ...
                    Stone.AI.Say(LocText("TEXT_WIP_OTPTBXD_20241203_174037_1924"));
                    DC(int64(0x1b323555ce015f94), EConversationDebugInfo::Done);
                    Subdialog(
                        UTopic_Stone_116670,
                        UTopic_Stone_116768,
                        UTopic_Stone_116690,
                        UTopic_Stone_116894
                    );
                }
            }
        }
        
        
        class UTopic_Stone_116670 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0xedb2776a2665f810);
            default Caption = LocText("TEXT_WIP_HUNKPJ_20241204_112337_2083");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Stone_116670);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xedb2776a2665f811), EConversationDebugInfo::Executing);
                // Does it matter?
                Hero.AI.Say(LocText("TEXT_WIP_HUNKPJ_20241204_112337_2083"));
                DC(int64(0xedb2776a2665f811), EConversationDebugInfo::Done);
                DC(int64(0xedb2776a2665f81f), EConversationDebugInfo::Executing);
                
                // With the mark of the king's own smith? Damn right it ...
                Stone.AI.Say(LocText("TEXT_WIP_HUNKPJ_20241204_112346"));
                DC(int64(0xedb2776a2665f81f), EConversationDebugInfo::Done);
                DC(int64(0xedb2776a2665f813), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xedb2776a2665f813), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Stone_116768 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0xedb2776a2665f844);
            default Caption = LocText("TEXT_WIP_HUNKPJ_20241204_112921_2785");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Stone_116768);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xedb2776a2665f845), EConversationDebugInfo::Executing);
                // Found it by some ruins.
                Hero.AI.Say(LocText("TEXT_WIP_HUNKPJ_20241204_112921_2785"));
                DC(int64(0xedb2776a2665f845), EConversationDebugInfo::Done);
                DC(int64(0xedb2776a2665f84e), EConversationDebugInfo::Executing);
                
                // Save your lies for some other twit. That design is good ...
                Stone.AI.Say(LocText("TEXT_WIP_HUNKPJ_20241204_112946"));
                DC(int64(0xedb2776a2665f84e), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Stone_116690 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0xedb2776a2665f814);
            default Caption = LocText("TEXT_WIP_HUNKPJ_20241204_112337_1924");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Stone_116690);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xedb2776a2665f815), EConversationDebugInfo::Executing);
                
                // From the ore barons' castle.
                Hero.AI.Say(LocText("TEXT_WIP_HUNKPJ_20241204_112337_1924"));
                DC(int64(0xedb2776a2665f815), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_FORGEDRIVALRIES_2, Document::UDocumentSegment_CH3_FORGEDRIVALRIES_2_DeliverGomez);
                DB(int64(0xedb2776a2665f883), G1R.ForgedRivalries2_StoneKnowsDarrionPlanPartial != 0);
                
                if (G1R.ForgedRivalries2_StoneKnowsDarrionPlanPartial != 0)
                {
                    DC(int64(0xedb2776a2665f891), EConversationDebugInfo::Executing);
                    // And when did you think would be the right time to tell ...
                    Stone.AI.Say(LocText("TEXT_WIP_HUNKPJ_20241204_113444"));
                    DC(int64(0xedb2776a2665f891), EConversationDebugInfo::Done);
                }
                DC(int64(0xedb2776a2665f820), EConversationDebugInfo::Executing);
                // You've got some nerve, bringin' a stolen design to me ...
                Stone.AI.Say(LocText("TEXT_WIP_HUNKPJ_20241204_112403"));
                DC(int64(0xedb2776a2665f820), EConversationDebugInfo::Done);
                DC(int64(0x4f6fb39363d17877), EConversationDebugInfo::Executing);
                // Though I gotta admit ... I'm sort of intrigued by that ...
                Stone.AI.Say(LocText("TEXT_WIP_KEQZAEL_20241220_214657"));
                DC(int64(0x4f6fb39363d17877), EConversationDebugInfo::Done);
                DC(int64(0xedb2776a2665f85c), EConversationDebugInfo::Executing);
                G1R.ForgedRivalries2_StoneKnowsDesignIsGomez = 1;
                DC(int64(0xedb2776a2665f85c), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Stone_116894 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0xedb2776a2665f863);
            default Caption = LocText("TEXT_WIP_HUNKPJ_20241204_113114_3436");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Stone_116894);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xedb2776a2665f86e), G1R.ForgedRivalries2_StoneKnowsDarrionPlanPartial == 0);
                }
                
                return G1R.ForgedRivalries2_StoneKnowsDarrionPlanPartial == 0;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xedb2776a2665f864), EConversationDebugInfo::Executing);
                // From ore barons' castle. It was Darrion's idea, ...
                Hero.AI.Say(LocText("TEXT_WIP_HUNKPJ_20241204_113114_3436"));
                DC(int64(0xedb2776a2665f864), EConversationDebugInfo::Done);
                DC(int64(0xedb2776a2665f8a0), EConversationDebugInfo::Executing);
                
                // Was it now? And why would that swamp rat send you here ...
                Stone.AI.Say(LocText("TEXT_WIP_HUNKPJ_20241204_114248"));
                DC(int64(0xedb2776a2665f8a0), EConversationDebugInfo::Done);
                DC(int64(0xedb2776a2665f8a1), EConversationDebugInfo::Executing);
                
                // He wants to trick you. You'll forge it and then Gomez ...
                Hero.AI.Say(LocText("TEXT_WIP_HUNKPJ_20241204_114306"));
                DC(int64(0xedb2776a2665f8a1), EConversationDebugInfo::Done);
                DC(int64(0xedb2776a2665f8a2), EConversationDebugInfo::Executing);
                
                // And come for me head. That sneaky little swamp rat. Hm ...
                Stone.AI.Say(LocText("TEXT_WIP_HUNKPJ_20241204_114329"));
                DC(int64(0xedb2776a2665f8a2), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Stone_117141,
                    UTopic_Stone_117161
                );
            }
        }
        
        
        class UTopic_Stone_117141 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0xedb2776a2665f8b0);
            default Caption = LocText("TEXT_WIP_HUNKPJ_20241204_114421_686");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Stone_117141);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xedb2776a2665f8b1), EConversationDebugInfo::Executing);
                // Well ... you did steal his work.
                Hero.AI.Say(LocText("TEXT_WIP_HUNKPJ_20241204_114421_686"));
                DC(int64(0xedb2776a2665f8b1), EConversationDebugInfo::Done);
                DC(int64(0xedb2776a2665f8be), EConversationDebugInfo::Executing);
                
                // Technically, it was YOU who stole it. And that said, he ...
                Stone.AI.Say(LocText("TEXT_WIP_HUNKPJ_20241204_114433"));
                DC(int64(0xedb2776a2665f8be), EConversationDebugInfo::Done);
                DC(int64(0xedb2776a2665f8b3), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xedb2776a2665f8b3), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Stone_117161 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0xedb2776a2665f8b4);
            default Caption = LocText("TEXT_WIP_HUNKPJ_20241204_114421_3984");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Stone_117161);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xedb2776a2665f8b5), EConversationDebugInfo::Executing);
                // What now?
                Hero.AI.Say(LocText("TEXT_WIP_HUNKPJ_20241204_114421_3984"));
                DC(int64(0xedb2776a2665f8b5), EConversationDebugInfo::Done);
                DC(int64(0xedb2776a2665f8bf), EConversationDebugInfo::Executing);
                
                // If you can keep your gob shut about it, I'm gonna forge ...
                Stone.AI.Say(LocText("TEXT_WIP_HUNKPJ_20241204_114544"));
                DC(int64(0xedb2776a2665f8bf), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_FORGEDRIVALRIES_2, Document::UDocumentSegment_CH3_FORGEDRIVALRIES_2_DeliverPlan);
            }
        }
        
        
        class UChoiceStone117061 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0xa9e336d1e56ae65e);
            default Caption = LocText("TEXT_WIP_HUNKPJ_20241204_142833");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceStone117629);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xc185e3efc45d47e9), Quest::SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2_FORGEDRIVALRIES_2_OBJ_GETMATERIALS != nullptr && Quest::SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2_FORGEDRIVALRIES_2_OBJ_GETMATERIALS.IsRunning());
                }
                
                return Quest::SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2_FORGEDRIVALRIES_2_OBJ_GETMATERIALS != nullptr && Quest::SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2_FORGEDRIVALRIES_2_OBJ_GETMATERIALS.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd03551f16efaa4af), EConversationDebugInfo::Executing);
                // About the materials ...
                Hero.AI.Say(LocText("TEXT_WIP_HUNKPJ_20241204_142833"));
                DC(int64(0xd03551f16efaa4af), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Stone_117865,
                    UTopic_Stone_117981,
                    UTopic_Stone_117885
                );
            }
        }
        
        
        class UTopic_Stone_117865 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0xedb2776a2665f9d8);
            default Caption = LocText("TEXT_WIP_HUNKPJ_20241204_125253_2801");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xedb2776a2665f9d9), EConversationDebugInfo::Executing);
                // I got all of it.
                Hero.AI.Say(LocText("TEXT_WIP_HUNKPJ_20241204_125253_2801"));
                DC(int64(0xedb2776a2665f9d9), EConversationDebugInfo::Done);
                DB(int64(0xedb2776a2665f9fd), Hero != nullptr && Hero.HasItem(UItMi_Smith_Steel, 5, 0));
                DB(int64(0xedb2776a2665fa0b), Hero != nullptr && Hero.HasItem(UItMi_Smith_Ironwood, 2, 0));
                DB(int64(0xedb2776a2665fa0c), Hero != nullptr && Hero.HasItem(UItMi_Smith_Iron, 2, 0));
                DB(int64(0xedb2776a2665fa0d), Hero != nullptr && Hero.HasItem(UItMi_Smith_Leatherstraps, 2, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItMi_Smith_Steel, 5, 0) && Hero != nullptr && Hero.HasItem(UItMi_Smith_Ironwood, 2, 0) && Hero != nullptr && Hero.HasItem(UItMi_Smith_Iron, 2, 0) && Hero != nullptr && Hero.HasItem(UItMi_Smith_Leatherstraps, 2, 0))
                {
                    DC(int64(0xedb2776a2665fa57), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Stone, UItMi_Smith_Steel, 5);
                    DC(int64(0xedb2776a2665fa57), EConversationDebugInfo::Done);
                    DC(int64(0x12f475b5917c70a1), EConversationDebugInfo::Executing);
                    Stone.AddItemToInventory(UItMi_Smith_Ironwood, 2);
                    DC(int64(0x12f475b5917c70a1), EConversationDebugInfo::Done);
                    DC(int64(0x12f475b5917c70a3), EConversationDebugInfo::Executing);
                    Stone.AddItemToInventory(UItMi_Smith_Iron, 2);
                    DC(int64(0x12f475b5917c70a3), EConversationDebugInfo::Done);
                    DC(int64(0x12f475b5917c70a5), EConversationDebugInfo::Executing);
                    Stone.AddItemToInventory(UItMi_Smith_Leatherstraps, 2);
                    DC(int64(0x12f475b5917c70a5), EConversationDebugInfo::Done);
                    DC(int64(0x12f475b5917c71c5), EConversationDebugInfo::Executing);
                    Hero.RemoveItemFromInventory(UItMi_Smith_Ironwood, 2, 0);
                    DC(int64(0x12f475b5917c71c5), EConversationDebugInfo::Done);
                    DC(int64(0x12f475b5917c71c7), EConversationDebugInfo::Executing);
                    Hero.RemoveItemFromInventory(UItMi_Smith_Iron, 2, 0);
                    DC(int64(0x12f475b5917c71c7), EConversationDebugInfo::Done);
                    DC(int64(0x12f475b5917c71c9), EConversationDebugInfo::Executing);
                    Hero.RemoveItemFromInventory(UItMi_Smith_Leatherstraps, 2, 0);
                    DC(int64(0x12f475b5917c71c9), EConversationDebugInfo::Done);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_FORGEDRIVALRIES_2, Document::UDocumentSegment_CH3_FORGEDRIVALRIES_2_CraftWithMaterials);
                    DC(int64(0xedb2776a2665fa65), EConversationDebugInfo::Executing);
                    // Good. I'll get to workin'. Come back tomorrow - should ...
                    Stone.AI.Say(LocText("TEXT_WIP_HUNKPJ_20241204_142204_731"));
                    DC(int64(0xedb2776a2665fa65), EConversationDebugInfo::Done);
                    DC(int64(0xedb2776a2665fa74), EConversationDebugInfo::Executing);
                    G1R.Stone_StartMaceCraft = FInGameTime::Now();
                    DC(int64(0xedb2776a2665fa74), EConversationDebugInfo::Done);
                    DC(int64(0xc185e3efc45d47e3), EConversationDebugInfo::Executing);
                    Quest::SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2_FORGEDRIVALRIES_2_OBJ_GETMATERIALS.SucceedQuest();
                    DC(int64(0xc185e3efc45d47e3), EConversationDebugInfo::Done);
                    DC(int64(0xc185e3efc45d47e6), EConversationDebugInfo::Executing);
                    Quest::SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2_FORGEDRIVALRIES_2_OBJ_WAITSTONECRAFT.StartQuest();
                    DC(int64(0xc185e3efc45d47e6), EConversationDebugInfo::Done);
                    DC(int64(0xd03551f16efaa4a8), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xd03551f16efaa4a8), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0xedb2776a2665fa0f), EConversationDebugInfo::Executing);
                    // Are you blind or just stupid? That's not all. Quit ...
                    Stone.AI.Say(LocText("TEXT_WIP_HUNKPJ_20241204_141113_2995"));
                    DC(int64(0xedb2776a2665fa0f), EConversationDebugInfo::Done);
                    DC(int64(0xedb2776a2665fa16), EConversationDebugInfo::Executing);
                    ReturnToLastSelection(1);
                    DC(int64(0xedb2776a2665fa16), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UTopic_Stone_117981 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0xedb2776a2665f9e6);
            default Caption = LocText("TEXT_WIP_HUNKPJ_20241204_125346_491");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xedb2776a2665f9e7), EConversationDebugInfo::Executing);
                // I'll pay you the thousand nuggets.
                Hero.AI.Say(LocText("TEXT_WIP_HUNKPJ_20241204_125346_491"));
                DC(int64(0xedb2776a2665f9e7), EConversationDebugInfo::Done);
                DB(int64(0xedb2776a2665fa2a), Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 1000, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 1000, 0))
                {
                    DC(int64(0xedb2776a2665fa4f), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Stone, UItMi_Orenugget, 1000);
                    DC(int64(0xedb2776a2665fa4f), EConversationDebugInfo::Done);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_FORGEDRIVALRIES_2, Document::UDocumentSegment_CH3_FORGEDRIVALRIES_2_CraftPayed);
                    DC(int64(0xedb2776a2665fa65), EConversationDebugInfo::Executing);
                    // Good. I'll get to workin'. Come back tomorrow - should ...
                    Stone.AI.Say(LocText("TEXT_WIP_HUNKPJ_20241204_142204_731"));
                    DC(int64(0xedb2776a2665fa65), EConversationDebugInfo::Done);
                    DC(int64(0xedb2776a2665fa74), EConversationDebugInfo::Executing);
                    G1R.Stone_StartMaceCraft = FInGameTime::Now();
                    DC(int64(0xedb2776a2665fa74), EConversationDebugInfo::Done);
                    DC(int64(0xc185e3efc45d47e3), EConversationDebugInfo::Executing);
                    Quest::SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2_FORGEDRIVALRIES_2_OBJ_PAY.SucceedQuest();
                    DC(int64(0xc185e3efc45d47e3), EConversationDebugInfo::Done);
                    DC(int64(0xc185e3efc45d47e6), EConversationDebugInfo::Executing);
                    Quest::SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2_FORGEDRIVALRIES_2_OBJ_WAITSTONECRAFT.StartQuest();
                    DC(int64(0xc185e3efc45d47e6), EConversationDebugInfo::Done);
                    DC(int64(0xd03551f16efaa4a8), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xd03551f16efaa4a8), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0xedb2776a2665fa31), EConversationDebugInfo::Executing);
                    // Will you? 'Cause that ain't nearly enough to cover me ...
                    Stone.AI.Say(LocText("TEXT_WIP_HUNKPJ_20241204_141256"));
                    DC(int64(0xedb2776a2665fa31), EConversationDebugInfo::Done);
                    DC(int64(0xedb2776a2665fa39), EConversationDebugInfo::Executing);
                    ReturnToLastSelection(1);
                    DC(int64(0xedb2776a2665fa39), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UTopic_Stone_117885 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0xedb2776a2665f9dc);
            default Caption = LocText("TEXT_WIP_HUNKPJ_20241204_125253_1769");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xedb2776a2665f9dd), EConversationDebugInfo::Executing);
                // I'll get you the stuff.
                Hero.AI.Say(LocText("TEXT_WIP_HUNKPJ_20241204_125253_1769"));
                DC(int64(0xedb2776a2665f9dd), EConversationDebugInfo::Done);
                DC(int64(0xedb2776a2665fa40), EConversationDebugInfo::Executing);
                
                // Good. Do that - then we'll talk.
                Stone.AI.Say(LocText("TEXT_WIP_HUNKPJ_20241204_141409"));
                DC(int64(0xedb2776a2665fa40), EConversationDebugInfo::Done);
                DC(int64(0xedb2776a2665fa47), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xedb2776a2665fa47), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceStone117385 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0xc185e3efc45d4878);
            default Caption = LocText("TEXT_WIP_HUNKPJ_20241204_152318");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Stone_117865);
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Stone_117981);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xc185e3efc45d4882), Quest::SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2_FORGEDRIVALRIES_2_OBJ_WAITSTONECRAFT != nullptr && Quest::SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2_FORGEDRIVALRIES_2_OBJ_WAITSTONECRAFT.IsRunning());
                }
                
                return Quest::SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2_FORGEDRIVALRIES_2_OBJ_WAITSTONECRAFT != nullptr && Quest::SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2_FORGEDRIVALRIES_2_OBJ_WAITSTONECRAFT.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc185e3efc45d4870), EConversationDebugInfo::Executing);
                // About the war hammer ...
                Hero.AI.Say(LocText("TEXT_WIP_HUNKPJ_20241204_152318"));
                DC(int64(0xc185e3efc45d4870), EConversationDebugInfo::Done);
                DB(int64(0xc185e3efc45d4890), G1R.Stone_StartMaceCraft.IsValid() && G1R.Stone_StartMaceCraft.IsLessThanXDaysAgo(1));
                
                if (G1R.Stone_StartMaceCraft.IsValid() && G1R.Stone_StartMaceCraft.IsLessThanXDaysAgo(1))
                {
                    DC(int64(0xc185e3efc45d4897), EConversationDebugInfo::Executing);
                    // What part of "I need a day" didn't you understand?
                    Stone.AI.Say(LocText("TEXT_WIP_HUNKPJ_20241204_152549"));
                    DC(int64(0xc185e3efc45d4897), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_stone_117385_exit_1");
                    DC(int64(0xc185e3efc45d489f), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xc185e3efc45d489f), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0xc185e3efc45d48a6), EConversationDebugInfo::Executing);
                    // Perfect timin'. There she is. No fancy shit, just solid ...
                    Stone.AI.Say(LocText("TEXT_WIP_HUNKPJ_20241204_153011"));
                    DC(int64(0xc185e3efc45d48a6), EConversationDebugInfo::Done);
                    DC(int64(0xea2bca374667d380), EConversationDebugInfo::Executing);
                    Stone.AddItemToInventory(UItMw_1H_Mace_Warhammer_02, 1);
                    DC(int64(0xea2bca374667d380), EConversationDebugInfo::Done);
                    DC(int64(0xc185e3efc45d4914), EConversationDebugInfo::Executing);
                    Quest::SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2_FORGEDRIVALRIES_2_OBJ_WAITSTONECRAFT.SucceedQuest();
                    DC(int64(0xc185e3efc45d4914), EConversationDebugInfo::Done);
                    DC(int64(0xa9e336d1e56ae678), EConversationDebugInfo::Executing);
                    Stone.AI.GiveItemTo(Hero, UItMw_1H_Mace_Warhammer_02, 1);
                    DC(int64(0xa9e336d1e56ae678), EConversationDebugInfo::Done);
                    DB(int64(0xc185e3efc45d48b1), G1R.ForgedRivalries2_StoneKnowsDarrionPlanFull != 0);
                    DB(int64(0xc185e3efc45d48b8), G1R.ForgedRivalries2_StoneKnowsDesignIsGomez != 0);
                    
                    if (G1R.ForgedRivalries2_StoneKnowsDarrionPlanFull != 0)
                    {
                        DC(int64(0xc185e3efc45d48ba), EConversationDebugInfo::Executing);
                        // And have that little swamp rat believe, I'm waggin' me ...
                        Stone.AI.Say(LocText("TEXT_WIP_HUNKPJ_20241204_153848_686"));
                        DC(int64(0xc185e3efc45d48ba), EConversationDebugInfo::Done);
                    }
                    else if (G1R.ForgedRivalries2_StoneKnowsDesignIsGomez != 0)
                    {
                        DC(int64(0xc185e3efc45d48de), EConversationDebugInfo::Executing);
                        // And remember: not a word, to nobody! Gomez finds out, ...
                        Stone.AI.Say(LocText("TEXT_WIP_HUNKPJ_20241204_154148_2386"));
                        DC(int64(0xc185e3efc45d48de), EConversationDebugInfo::Done);
                    }
                    else
                    {
                        DC(int64(0xc185e3efc45d48ea), EConversationDebugInfo::Executing);
                        // Wait 'til word gets around. I'd love to see Darrion's ...
                        Stone.AI.Say(LocText("TEXT_WIP_HUNKPJ_20241204_154555_3984"));
                        DC(int64(0xc185e3efc45d48ea), EConversationDebugInfo::Done);
                        DC(int64(0x9d6a42d3c185d5ae), EConversationDebugInfo::Executing);
                        G1R.ForgedRivalries2_StoneMarkedCraft = 1;
                        DC(int64(0x9d6a42d3c185d5ae), EConversationDebugInfo::Done);
                    }
                    Subdialog(
                        UTopic_Stone_117572,
                        UTopic_Stone_117592
                    );
                }
            }
        }
        
        
        class UTopic_Stone_117572 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0x693574e9cbbe41d8);
            default Caption = LocText("TEXT_WIP_HUNKPJ_20241204_175532_41");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Stone_117572);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x693574e9cbbe41d9), EConversationDebugInfo::Executing);
                // Could you teach me how to forge it?
                Hero.AI.Say(LocText("TEXT_WIP_HUNKPJ_20241204_175532_41"));
                DC(int64(0x693574e9cbbe41d9), EConversationDebugInfo::Done);
                DB(int64(0x693574e9cbbe4223), G1R.ForgedRivalries2_StoneKnowsDarrionPlanFull != 0);
                DB(int64(0x693574e9cbbe4259), G1R.ForgedRivalries2_StoneKnowsDesignIsGomez != 0);
                
                if (G1R.ForgedRivalries2_StoneKnowsDarrionPlanFull != 0)
                {
                    DC(int64(0x693574e9cbbe422b), EConversationDebugInfo::Executing);
                    // You did right by tellin' me about Darrion's scheme. ...
                    Stone.AI.Say(LocText("TEXT_WIP_HUNKPJ_20241204_175704"));
                    DC(int64(0x693574e9cbbe422b), EConversationDebugInfo::Done);
                    DC(int64(0x693574e9cbbe4234), EConversationDebugInfo::Executing);
                    // Look - see how the head here sweeps back into that ...
                    Stone.AI.Say(LocText("TEXT_WIP_HUNKPJ_20241204_175727"));
                    DC(int64(0x693574e9cbbe4234), EConversationDebugInfo::Done);
                    DC(int64(0x693574e9cbbe4235), EConversationDebugInfo::Executing);
                    // And these rivets ain't just for show - they're keepin' ...
                    Stone.AI.Say(LocText("TEXT_WIP_HUNKPJ_20241204_175728"));
                    DC(int64(0x693574e9cbbe4235), EConversationDebugInfo::Done);
                    DC(int64(0x693574e9cbbe4236), EConversationDebugInfo::Executing);
                    // But a simple cross-weave will do. No need for fancy ...
                    Stone.AI.Say(LocText("TEXT_WIP_HUNKPJ_20241204_175754"));
                    DC(int64(0x693574e9cbbe4236), EConversationDebugInfo::Done);
                    DC(int64(0x4f6fb39363d178a7), EConversationDebugInfo::Executing);
                    // It's a weapon made to kill. And that's what it'll do.
                    Stone.AI.Say(LocText("TEXT_WIP_KEQZAEL_20241220_220942"));
                    DC(int64(0x4f6fb39363d178a7), EConversationDebugInfo::Done);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_FORGEDRIVALRIES_2, Document::UDocumentSegment_CH3_FORGEDRIVALRIES_2_TeachRecipe);
                    DC(int64(0x9733703e83584239), EConversationDebugInfo::Executing);
                    Hero.LearnRecipe(UReMi_Smith_Head_Warhammer);
                    DC(int64(0x9733703e83584239), EConversationDebugInfo::Done);
                    DC(int64(0x9733703e8358423b), EConversationDebugInfo::Executing);
                    Hero.LearnRecipe(UReMi_Smith_1H_Mace_Warhammer_02);
                    DC(int64(0x9733703e8358423b), EConversationDebugInfo::Done);
                    DC(int64(0x9733703e8358423d), EConversationDebugInfo::Executing);
                    Hero.LearnRecipe(UReMw_1H_Mace_Warhammer_02);
                    DC(int64(0x9733703e8358423d), EConversationDebugInfo::Done);
                    DC(int64(0x693574e9cbbe4247), EConversationDebugInfo::Executing);
                    ReturnToLastSelection(1);
                    DC(int64(0x693574e9cbbe4247), EConversationDebugInfo::Done);
                }
                else if (G1R.ForgedRivalries2_StoneKnowsDesignIsGomez != 0)
                {
                    DC(int64(0x693574e9cbbe425a), EConversationDebugInfo::Executing);
                    // So you can make more? Sorry mate, not this time. Bad ...
                    Stone.AI.Say(LocText("TEXT_WIP_HUNKPJ_20241204_180823"));
                    DC(int64(0x693574e9cbbe425a), EConversationDebugInfo::Done);
                    DC(int64(0x693574e9cbbe4263), EConversationDebugInfo::Executing);
                    ReturnToLastSelection(1);
                    DC(int64(0x693574e9cbbe4263), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x693574e9cbbe424f), EConversationDebugInfo::Executing);
                    // Not this time. For once I've got somethin' special ...
                    Stone.AI.Say(LocText("TEXT_WIP_HUNKPJ_20241204_180339"));
                    DC(int64(0x693574e9cbbe424f), EConversationDebugInfo::Done);
                    DC(int64(0x693574e9cbbe4258), EConversationDebugInfo::Executing);
                    // Let the castle guards drool over it a while before I ...
                    Stone.AI.Say(LocText("TEXT_WIP_HUNKPJ_20241204_180512"));
                    DC(int64(0x693574e9cbbe4258), EConversationDebugInfo::Done);
                    DC(int64(0x693574e9cbbe426b), EConversationDebugInfo::Executing);
                    ReturnToLastSelection(1);
                    DC(int64(0x693574e9cbbe426b), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UTopic_Stone_117592 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0x693574e9cbbe41dc);
            default Caption = LocText("TEXT_WIP_HUNKPJ_20241204_154949");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Stone_117592);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc185e3efc45d48f5), EConversationDebugInfo::Executing);
                // Thanks for your work.
                Hero.AI.Say(LocText("TEXT_WIP_HUNKPJ_20241204_154949"));
                DC(int64(0xc185e3efc45d48f5), EConversationDebugInfo::Done);
                DC(int64(0xc185e3efc45d4912), EConversationDebugInfo::Executing);
                
                // Uh, sure. Just don't get yourself killed. Anyway - these ...
                Stone.AI.Say(LocText("TEXT_WIP_HUNKPJ_20241204_155023"));
                DC(int64(0xc185e3efc45d4912), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_FORGEDRIVALRIES_2, Document::UDocumentSegment_CH3_FORGEDRIVALRIES_2_ReturnDarrion);
                DC(int64(0xc185e3efc45d4916), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2_FORGEDRIVALRIES_2_OBJ_GIVECRAFTTODARRION.StartQuest();
                DC(int64(0xc185e3efc45d4916), EConversationDebugInfo::Done);
                DC(int64(0xc185e3efc45d491f), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xc185e3efc45d491f), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceStone117629 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0xedb2776a2665f8fc);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.AllowIfCharacterHasKnowledgeOfId(n"choice_stone_116373_exit_1");
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Stone_117161);
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceStone117769);
            default Rules.HideIfKnows(UChoiceStone117629);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xedb2776a2665f96b), EConversationDebugInfo::Executing);
                // This isn't some guard's practice stick. Proper work ...
                Stone.AI.Say(LocText("TEXT_WIP_HUNKPJ_20241204_124516"));
                DC(int64(0xedb2776a2665f96b), EConversationDebugInfo::Done);
                DC(int64(0xedb2776a2665f96e), EConversationDebugInfo::Executing);
                
                // What do you need?
                Hero.AI.Say(LocText("TEXT_WIP_HUNKPJ_20241204_124610"));
                DC(int64(0xedb2776a2665f96e), EConversationDebugInfo::Done);
                DC(int64(0xedb2776a2665f96d), EConversationDebugInfo::Executing);
                
                // Hmm, let's see ... Five steel bars, for a perfectly ...
                Stone.AI.Say(LocText("TEXT_WIP_HUNKPJ_20241204_124557"));
                DC(int64(0xedb2776a2665f96d), EConversationDebugInfo::Done);
                DC(int64(0x4f6fb39363d17879), EConversationDebugInfo::Executing);
                // And two iron bands and leather strips each, for the ...
                Stone.AI.Say(LocText("TEXT_WIP_KEQZAEL_20241220_214957"));
                DC(int64(0x4f6fb39363d17879), EConversationDebugInfo::Done);
                DC(int64(0xedb2776a2665f96f), EConversationDebugInfo::Executing);
                // Or you give me ... let's say, a thousand nuggs, and I'll ...
                Stone.AI.Say(LocText("TEXT_WIP_HUNKPJ_20241204_124634"));
                DC(int64(0xedb2776a2665f96f), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_FORGEDRIVALRIES_2, Document::UDocumentSegment_CH3_FORGEDRIVALRIES_2_Materials);
                DC(int64(0xc185e3efc45d477c), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2_FORGEDRIVALRIES_2_OBJ_GETMATERIALS.StartQuest();
                DC(int64(0xc185e3efc45d477c), EConversationDebugInfo::Done);
                DC(int64(0xaa5281900a4bf06b), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2_FORGEDRIVALRIES_2_OBJ_PAY.StartQuest();
                DC(int64(0xaa5281900a4bf06b), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceStone117769 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0xedb2776a2665f975);
            default Caption = FText::FromString("[Followup Topic]");;
            default bIsFollowupTopic = true;
            
            default Rules.AllowIfCharacterHasKnowledgeOfId(n"choice_stone_116373_exit_2");
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Stone_116690);
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Stone_116768);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xedb2776a2665f8c3), EConversationDebugInfo::Executing);
                // What do you want for it?
                Hero.AI.Say(LocText("TEXT_WIP_HUNKPJ_20241204_121220"));
                DC(int64(0xedb2776a2665f8c3), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceStone121565 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0xb75d79e3d48f972);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default PropertyTags.AddTag(GameplayTag::Conversation_Topic_KeepAnyInteraction);
            default ForceSettings.RangeType = EConversationForceRangeType::FarRange;
            
            default Rules.HideIfKnows(UChoiceStone121565);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xca9a761a184f97ca), Stone != nullptr && Stone.HasAssignedDailyRoutine(UDailyRoutine_OCR_GRD_Stone_219_Ot));
                }
                
                return Stone != nullptr && Stone.HasAssignedDailyRoutine(UDailyRoutine_OCR_GRD_Stone_219_Ot);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DB(int64(0xf10a76655659e321), G1R.KnowStone != 0);
                
                if (G1R.KnowStone != 0)
                {
                    DC(int64(0xf10a76655659e2e1), EConversationDebugInfo::Executing);
                    // Didn't expect visitors down here ... but I ain't ...
                    Stone.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_114140"));
                    DC(int64(0xf10a76655659e2e1), EConversationDebugInfo::Done);
                    DC(int64(0xb75d79e3d48f969), EConversationDebugInfo::Executing);
                    
                    // Stone?
                    Hero.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_114012"));
                    DC(int64(0xb75d79e3d48f969), EConversationDebugInfo::Done);
                    DB(int64(0x277328e2c56ed5c3), Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3 != nullptr && Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3.IsRunning());
                    
                    if (Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3 != nullptr && Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3.IsRunning())
                    {
                        DC(int64(0xb75d79e3d48fd80), EConversationDebugInfo::Executing);
                        Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_FINDSTONE.SucceedQuest();
                        DC(int64(0xb75d79e3d48fd80), EConversationDebugInfo::Done);
                    }
                }
                else
                {
                    DC(int64(0xf10a76655659e38b), EConversationDebugInfo::Executing);
                    // What do you want? You don't look like one of Gomez's ...
                    Stone.AI.Say(LocText("DIA_GRD_219_STONE_06_01"));
                    DC(int64(0xf10a76655659e38b), EConversationDebugInfo::Done);
                    DC(int64(0xf10a76655659e38a), EConversationDebugInfo::Executing);
                    
                    // I'm not. 
                    Hero.AI.Say(LocText("DIA_GRD_219_STONE1_15_01"));
                    DC(int64(0xf10a76655659e38a), EConversationDebugInfo::Done);
                }
                Subdialog(
                    UTopic_Stone_121599,
                    UTopic_Stone_121619
                );
            }
        }
        
        
        class UTopic_Stone_121599 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0xb75d79e3d48f97f);
            default Caption = LocText("TEXT_WIP_TRYREI_20241211_114203_2785");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Stone_121599);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb75d79e3d48f980), EConversationDebugInfo::Executing);
                // What happened?
                Hero.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_114203_2785"));
                DC(int64(0xb75d79e3d48f980), EConversationDebugInfo::Done);
                DC(int64(0xb75d79e3d48f98e), EConversationDebugInfo::Executing);
                
                // Ha! Gomez is what happened. Been a proper nutcase, ...
                Stone.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_114237"));
                DC(int64(0xb75d79e3d48f98e), EConversationDebugInfo::Done);
                DC(int64(0xb75d79e3d48fafc), EConversationDebugInfo::Executing);
                // I've spent years keepin' me hammer outta camp politics. ...
                Stone.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_121950"));
                DC(int64(0xb75d79e3d48fafc), EConversationDebugInfo::Done);
                DB(int64(0xb75d79e3d48f997), Quest::SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2_FORGEDRIVALRIES_2_OBJ_GIVEDESIGNTOSTONE != nullptr && Quest::SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2_FORGEDRIVALRIES_2_OBJ_GIVEDESIGNTOSTONE.HasSucceeded());
                
                if (Quest::SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2_FORGEDRIVALRIES_2_OBJ_GIVEDESIGNTOSTONE != nullptr && Quest::SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2_FORGEDRIVALRIES_2_OBJ_GIVEDESIGNTOSTONE.HasSucceeded())
                {
                    DC(int64(0xb75d79e3d48f9b1), EConversationDebugInfo::Executing);
                    // Guess that war hammer business hammered the final nail ...
                    Stone.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_114355_686"));
                    DC(int64(0xb75d79e3d48f9b1), EConversationDebugInfo::Done);
                    DB(int64(0xb75d79e3d48f9bb), Quest::SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2 != nullptr && Quest::SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2.HasSucceeded());
                    DB(int64(0x6d39c4a98cb04bbb), G1R.ForgedRivalries2_StoneKnowsDarrionPlanPartial != 0);
                    DB(int64(0xb75d79e3d48f9bb), Quest::SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2 != nullptr && Quest::SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2.HasSucceeded());
                    DB(int64(0x6d39c4a98cb04bbb), G1R.ForgedRivalries2_StoneKnowsDarrionPlanFull != 0);
                    DB(int64(0xb75d79e3d48f9cd), G1R.ForgedRivalries2_StoneKnowsDesignIsGomez == 0);
                    
                    if (((Quest::SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2 != nullptr && Quest::SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2.HasSucceeded() && G1R.ForgedRivalries2_StoneKnowsDarrionPlanPartial != 0)) || ((Quest::SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2 != nullptr && Quest::SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2.HasSucceeded() && G1R.ForgedRivalries2_StoneKnowsDarrionPlanFull != 0)))
                    {
                        DC(int64(0xb75d79e3d48f9c4), EConversationDebugInfo::Executing);
                        // Beliar's arse, we said we'd keep quiet about that.
                        Stone.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_114717_2386"));
                        DC(int64(0xb75d79e3d48f9c4), EConversationDebugInfo::Done);
                        DC(int64(0xb75d79e3d48f9cc), EConversationDebugInfo::Executing);
                        // But you didn't, did you? Hope you and that little swamp ...
                        Stone.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_114809"));
                        DC(int64(0xb75d79e3d48f9cc), EConversationDebugInfo::Done);
                    }
                    else if (G1R.ForgedRivalries2_StoneKnowsDesignIsGomez == 0)
                    {
                        DC(int64(0xb75d79e3d48fa47), EConversationDebugInfo::Executing);
                        // Should've known it was one of Gomez's designs ... ...
                        Stone.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_121006_491"));
                        DC(int64(0xb75d79e3d48fa47), EConversationDebugInfo::Done);
                    }
                    else
                    {
                        DC(int64(0xb75d79e3d48fafe), EConversationDebugInfo::Executing);
                        // Gomez found out his precious design was missin', and he ...
                        Stone.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_122120_1340"));
                        DC(int64(0xb75d79e3d48fafe), EConversationDebugInfo::Done);
                        DC(int64(0xb75d79e3d48fcf3), EConversationDebugInfo::Executing);
                        // Ain't even said anythin' - Gomez - just threw me ...
                        Stone.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_145654"));
                        DC(int64(0xb75d79e3d48fcf3), EConversationDebugInfo::Done);
                        DC(int64(0xb75d79e3d48fb5a), EConversationDebugInfo::Executing);
                        ReturnToLastSelection(1);
                        DC(int64(0xb75d79e3d48fb5a), EConversationDebugInfo::Done);
                    }
                    Subdialog(
                        UTopic_Stone_122023,
                        UTopic_Stone_122632,
                        UTopic_Stone_122043
                    );
                }
                else
                {
                    DC(int64(0x8ed75c01d98f0dad), EConversationDebugInfo::Executing);
                    ReturnToLastSelection(1);
                    DC(int64(0x8ed75c01d98f0dad), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UTopic_Stone_121619 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0xb75d79e3d48f983);
            default Caption = LocText("TEXT_WIP_TRYREI_20241211_114203_3286");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Stone_121619);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb75d79e3d48f984), EConversationDebugInfo::Executing);
                // Need help getting out?
                Hero.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_114203_3286"));
                DC(int64(0xb75d79e3d48f984), EConversationDebugInfo::Done);
                DB(int64(0xede499b67047e787), G1R != nullptr && !G1R.IsDoorOpen(n"OC_Prison_Dungeons_Cell_09_Door"));
                
                if (G1R != nullptr && !G1R.IsDoorOpen(n"OC_Prison_Dungeons_Cell_09_Door"))
                {
                    DC(int64(0xb75d79e3d48fb62), EConversationDebugInfo::Executing);
                    // Unless you've got Gomez's key or fingers blessed by the ...
                    Stone.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_122557"));
                    DC(int64(0xb75d79e3d48fb62), EConversationDebugInfo::Done);
                    DC(int64(0xb75d79e3d48fb63), EConversationDebugInfo::Executing);
                    // Well ... there might be ... (sighs) I know who could ...
                    Stone.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_122617"));
                    DC(int64(0xb75d79e3d48fb63), EConversationDebugInfo::Done);
                    DC(int64(0x9c79c95934083195), EConversationDebugInfo::Executing);
                    // Innos' balls, never thought I'd say this, but Darrion ...
                    Stone.AI.Say(LocText("TEXT_WIP_JNRIXBI_20250102_174705"));
                    DC(int64(0x9c79c95934083195), EConversationDebugInfo::Done);
                    DC(int64(0xb75d79e3d48fb64), EConversationDebugInfo::Executing);
                    
                    // How?
                    Hero.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_122658"));
                    DC(int64(0xb75d79e3d48fb64), EConversationDebugInfo::Done);
                    DC(int64(0xb75d79e3d48fb65), EConversationDebugInfo::Executing);
                    
                    // I'll draw you a sketch. I know those locks inside out. ...
                    Stone.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_122702"));
                    DC(int64(0xb75d79e3d48fb65), EConversationDebugInfo::Done);
                    DC(int64(0xb75d79e3d48fb69), EConversationDebugInfo::Executing);
                    
                    // And Darrion will forge the fitting key for you.
                    Hero.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_122907_3719"));
                    DC(int64(0xb75d79e3d48fb69), EConversationDebugInfo::Done);
                    DC(int64(0xb75d79e3d48fb73), EConversationDebugInfo::Executing);
                    
                    // Well, maybe I would've asked YOU, if you knew how to ...
                    Stone.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_122925"));
                    DC(int64(0xb75d79e3d48fb73), EConversationDebugInfo::Done);
                    DC(int64(0xb75d79e3d48fb74), EConversationDebugInfo::Executing);
                    // And tell him - tell him I'll work his forge in the ...
                    Stone.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_123325"));
                    DC(int64(0xb75d79e3d48fb74), EConversationDebugInfo::Done);
                    DC(int64(0xb75d79e3d48fcf4), EConversationDebugInfo::Executing);
                    // He'll love that for sure, and it's me best bet - if I ...
                    Stone.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_150002"));
                    DC(int64(0xb75d79e3d48fcf4), EConversationDebugInfo::Done);
                    Subdialog(
                        UTopic_Stone_123796,
                        UTopic_Stone_123966
                    );
                }
                else
                {
                    DC(int64(0xb75d79e3d48fd98), EConversationDebugInfo::Executing);
                    Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3.StartQuest();
                    DC(int64(0xb75d79e3d48fd98), EConversationDebugInfo::Done);
                    DC(int64(0xede499b67047e7cb), EConversationDebugInfo::Executing);
                    Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_OPENGATE.StartQuest();
                    DC(int64(0xede499b67047e7cb), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UTopic_Stone_122023 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0xb75d79e3d48f9df);
            default Caption = LocText("TEXT_WIP_TRYREI_20241211_115406_3984");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Stone_122023);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_TRYREI_20241211_114717_2386"), int64(0xb75d79e3d48f9df));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb75d79e3d48f9e0), EConversationDebugInfo::Executing);
                // I don't know what you're talking about, I sold the blade ...
                Hero.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_115406_3984"));
                DC(int64(0xb75d79e3d48f9e0), EConversationDebugInfo::Done);
                DB(int64(0xb75d79e3d48f9f6), Hero != nullptr && Hero.Inventory.HasEquippedItem(UItMw_1H_Mace_War_02));
                
                if (Hero != nullptr && Hero.Inventory.HasEquippedItem(UItMw_1H_Mace_War_02))
                {
                    DC(int64(0xb75d79e3d48f9fe), EConversationDebugInfo::Executing);
                    // You even got that bloody thing on you! Really makin' an ...
                    Stone.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_115544"));
                    DC(int64(0xb75d79e3d48f9fe), EConversationDebugInfo::Done);
                    DC(int64(0xb75d79e3d48fb2b), EConversationDebugInfo::Executing);
                    ReturnToLastSelection(1);
                    DC(int64(0xb75d79e3d48fb2b), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0xb75d79e3d48fa07), EConversationDebugInfo::Executing);
                    // Sure. And you got nothin' to do with any of it, of ...
                    Stone.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_115616"));
                    DC(int64(0xb75d79e3d48fa07), EConversationDebugInfo::Done);
                    DC(int64(0xb75d79e3d48fb23), EConversationDebugInfo::Executing);
                    ReturnToLastSelection(1);
                    DC(int64(0xb75d79e3d48fb23), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UTopic_Stone_122632 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0xb75d79e3d48fa5f);
            default Caption = LocText("TEXT_WIP_TRYREI_20241211_121317_2995");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Stone_122632);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_TRYREI_20241211_121006_491"), int64(0xb75d79e3d48fa5f));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb75d79e3d48fa60), EConversationDebugInfo::Executing);
                // I didn't know it was Gomez's.
                Hero.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_121317_2995"));
                DC(int64(0xb75d79e3d48fa60), EConversationDebugInfo::Done);
                DC(int64(0xb75d79e3d48fa71), EConversationDebugInfo::Executing);
                
                // You stole the design from right under the ore barons' ...
                Stone.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_121344"));
                DC(int64(0xb75d79e3d48fa71), EConversationDebugInfo::Done);
                DC(int64(0xb75d79e3d48fa72), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xb75d79e3d48fa72), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Stone_122043 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0xb75d79e3d48f9e3);
            default Caption = LocText("TEXT_WIP_TRYREI_20241211_115406_3569");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Stone_122043);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb75d79e3d48f9e4), EConversationDebugInfo::Executing);
                // Must've been Darrion, then.
                Hero.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_115406_3569"));
                DC(int64(0xb75d79e3d48f9e4), EConversationDebugInfo::Done);
                DC(int64(0xb75d79e3d48fa19), EConversationDebugInfo::Executing);
                
                // That peacock really thinks copyin' his precious design ...
                Stone.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_115944"));
                DC(int64(0xb75d79e3d48fa19), EConversationDebugInfo::Done);
                DB(int64(0xb75d79e3d48fa22), G1R.Stone_Teacher != 0);
                
                if (G1R.Stone_Teacher != 0)
                {
                    DC(int64(0xb75d79e3d48fa2b), EConversationDebugInfo::Executing);
                    // And it's me own apprentice that helped him do it.
                    Stone.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_120447_1769"));
                    DC(int64(0xb75d79e3d48fa2b), EConversationDebugInfo::Done);
                }
                DC(int64(0xb75d79e3d48fae5), EConversationDebugInfo::Executing);
                // You ending up in here was never part of the plan.
                Hero.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_121804"));
                DC(int64(0xb75d79e3d48fae5), EConversationDebugInfo::Done);
                DC(int64(0xb75d79e3d48fb4b), EConversationDebugInfo::Executing);
                
                // Well, doesn't matter now anyway, does it?
                Stone.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_122411"));
                DC(int64(0xb75d79e3d48fb4b), EConversationDebugInfo::Done);
                DC(int64(0xb75d79e3d48fb0d), EConversationDebugInfo::Executing);
                ReturnToLastSelection(2);
                DC(int64(0xb75d79e3d48fb0d), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Stone_123796 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0xb75d79e3d48fbf3);
            default Caption = LocText("TEXT_WIP_TRYREI_20241211_124014_3902");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Stone_123796);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb75d79e3d48fba2), EConversationDebugInfo::Executing);
                // I'll see what I can do.
                Hero.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_124014_3902"));
                DC(int64(0xb75d79e3d48fba2), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH5_FORGEDRIVALRIES_3, Document::UDocumentSegment_CH5_FORGEDRIVALRIES_3_Start);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH5_FORGEDRIVALRIES_3, Document::UDocumentSegment_CH5_FORGEDRIVALRIES_3_AskDarrion);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH5_FORGEDRIVALRIES_3, Document::UDocumentSegment_CH5_FORGEDRIVALRIES_3_GetGomezKey);
                DC(int64(0x889195695130fc69), EConversationDebugInfo::Executing);
                Stone.AI.RequestEndAnyOngoingInteractionNonBlocking();
                DC(int64(0x889195695130fc69), EConversationDebugInfo::Done);
                DC(int64(0xb75d79e3d48fbac), EConversationDebugInfo::Executing);
                // Here. Get that sketch to Darrion, he'll know what to do.
                Stone.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_124225"));
                DC(int64(0xb75d79e3d48fbac), EConversationDebugInfo::Done);
                DC(int64(0xea2bca374667d380), EConversationDebugInfo::Executing);
                Stone.AddItemToInventory(UItMs_StoneSketch, 1);
                DC(int64(0xea2bca374667d380), EConversationDebugInfo::Done);
                DC(int64(0x889195695130fc8f), EConversationDebugInfo::Executing);
                Stone.AI.WaitUntilNoLongerSpeaking();
                DC(int64(0x889195695130fc8f), EConversationDebugInfo::Done);
                DC(int64(0xb75d79e3d48fc48), EConversationDebugInfo::Executing);
                Stone.AI.GiveItemTo(Hero, UItMs_StoneSketch, 1);
                DC(int64(0xb75d79e3d48fc48), EConversationDebugInfo::Done);
                DC(int64(0xb75d79e3d48fd98), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3.StartQuest();
                DC(int64(0xb75d79e3d48fd98), EConversationDebugInfo::Done);
                DC(int64(0xb75d79e3d48fd9a), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_ASKDARRIONKEY.StartQuest();
                DC(int64(0xb75d79e3d48fd9a), EConversationDebugInfo::Done);
                DC(int64(0xb75d79e3d48fc3e), EConversationDebugInfo::Executing);
                // Listen, if that swamp peacock won't help, that key never ...
                Stone.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_124621_1037"));
                DC(int64(0xb75d79e3d48fc3e), EConversationDebugInfo::Done);
                DC(int64(0xb75d79e3d48fc46), EConversationDebugInfo::Executing);
                // Just sayin', you know. Take care.
                Stone.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_124628"));
                DC(int64(0xb75d79e3d48fc46), EConversationDebugInfo::Done);
                DC(int64(0x277328e2c56ed60e), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_GETGOMEZKEY.StartQuest();
                DC(int64(0x277328e2c56ed60e), EConversationDebugInfo::Done);
                DC(int64(0xb75d79e3d48fceb), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xb75d79e3d48fceb), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Stone_123966 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0xb75d79e3d48fc49);
            default Caption = LocText("TEXT_WIP_TRYREI_20241211_124809_2332");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Stone_123966);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb75d79e3d48fc4a), EConversationDebugInfo::Executing);
                // You're on your own.
                Hero.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_124809_2332"));
                DC(int64(0xb75d79e3d48fc4a), EConversationDebugInfo::Done);
                DC(int64(0xb75d79e3d48fc54), EConversationDebugInfo::Executing);
                
                // I see ... Should've known better than to hope for help ...
                Stone.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_124818"));
                DC(int64(0xb75d79e3d48fc54), EConversationDebugInfo::Done);
                DB(int64(0xb75d79e3d48fc5d), Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1 != nullptr && Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1.HasSucceeded());
                DB(int64(0xb75d79e3d48fc5d), Quest::SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2 != nullptr && Quest::SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2.HasSucceeded());
                DB(int64(0xb75d79e3d48fc86), G1R.Stone_Teacher != 0);
                
                if ((Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1 != nullptr && Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1.HasSucceeded()) || (Quest::SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2 != nullptr && Quest::SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2.HasSucceeded()))
                {
                    DC(int64(0xb75d79e3d48fc7e), EConversationDebugInfo::Executing);
                    // Uh, unless it was about Darrion's business. Or was that ...
                    Stone.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_125034_3334"));
                    DC(int64(0xb75d79e3d48fc7e), EConversationDebugInfo::Done);
                }
                else if (G1R.Stone_Teacher != 0)
                {
                    DC(int64(0xb75d79e3d48fc88), EConversationDebugInfo::Executing);
                    // I taught you everythin' I know and you're lettin' me ...
                    Stone.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_125106_3511"));
                    DC(int64(0xb75d79e3d48fc88), EConversationDebugInfo::Done);
                    DC(int64(0xf729a54bb9ea2e36), EConversationDebugInfo::Executing);
                    // Didn't take you for that sort o' bloke. But no good deed ...
                    Stone.AI.Say(LocText("TEXT_WIP_ENRIXBI_20250107_123932"));
                    DC(int64(0xf729a54bb9ea2e36), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x889195695130fc69), EConversationDebugInfo::Executing);
                    Stone.AI.RequestEndAnyOngoingInteractionNonBlocking();
                    DC(int64(0x889195695130fc69), EConversationDebugInfo::Done);
                    DC(int64(0xf10a76655659e285), EConversationDebugInfo::Executing);
                    // At least think about it ... I ain't keen on rottin' in ...
                    Stone.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_125234_1246"));
                    DC(int64(0xf10a76655659e285), EConversationDebugInfo::Done);
                    DC(int64(0xea2bca374667d380), EConversationDebugInfo::Executing);
                    Stone.AddItemToInventory(UItMs_StoneSketch, 1);
                    DC(int64(0xea2bca374667d380), EConversationDebugInfo::Done);
                    DC(int64(0x889195695130fc8f), EConversationDebugInfo::Executing);
                    Stone.AI.WaitUntilNoLongerSpeaking();
                    DC(int64(0x889195695130fc8f), EConversationDebugInfo::Done);
                    DC(int64(0xf10a76655659e2a3), EConversationDebugInfo::Executing);
                    Stone.AI.GiveItemTo(Hero, UItMs_StoneSketch, 1);
                    DC(int64(0xf10a76655659e2a3), EConversationDebugInfo::Done);
                    DC(int64(0xff4dcfacfe11b9c2), EConversationDebugInfo::Executing);
                    Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3.StartQuest();
                    DC(int64(0xff4dcfacfe11b9c2), EConversationDebugInfo::Done);
                    DC(int64(0xff4dcfacfe11b9c4), EConversationDebugInfo::Executing);
                    Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_ASKDARRIONKEY.StartQuest();
                    DC(int64(0xff4dcfacfe11b9c4), EConversationDebugInfo::Done);
                    DC(int64(0xf10a76655659e2c8), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xf10a76655659e2c8), EConversationDebugInfo::Done);
                    return;
                }
                DC(int64(0x889195695130fc69), EConversationDebugInfo::Executing);
                Stone.AI.RequestEndAnyOngoingInteractionNonBlocking();
                DC(int64(0x889195695130fc69), EConversationDebugInfo::Done);
                DC(int64(0xb75d79e3d48fca7), EConversationDebugInfo::Executing);
                // Here, take the sketch. Maybe you'll find your loyalty on ...
                Stone.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_125151"));
                DC(int64(0xb75d79e3d48fca7), EConversationDebugInfo::Done);
                DC(int64(0xea2bca374667d380), EConversationDebugInfo::Executing);
                Stone.AddItemToInventory(UItMs_StoneSketch, 1);
                DC(int64(0xea2bca374667d380), EConversationDebugInfo::Done);
                DC(int64(0x889195695130fc8f), EConversationDebugInfo::Executing);
                Stone.AI.WaitUntilNoLongerSpeaking();
                DC(int64(0x889195695130fc8f), EConversationDebugInfo::Done);
                DC(int64(0xb75d79e3d48fcc4), EConversationDebugInfo::Executing);
                Stone.AI.GiveItemTo(Hero, UItMs_StoneSketch, 1);
                DC(int64(0xb75d79e3d48fcc4), EConversationDebugInfo::Done);
                DC(int64(0xff4dcfacfe11ba88), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3.StartQuest();
                DC(int64(0xff4dcfacfe11ba88), EConversationDebugInfo::Done);
                DC(int64(0xff4dcfacfe11ba8a), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_ASKDARRIONKEY.StartQuest();
                DC(int64(0xff4dcfacfe11ba8a), EConversationDebugInfo::Done);
                DC(int64(0xb75d79e3d48fcaa), EConversationDebugInfo::Executing);
                // At least think about it ... I ain't keen on rottin' in ...
                Stone.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_125234_1246"));
                DC(int64(0xb75d79e3d48fcaa), EConversationDebugInfo::Done);
                DC(int64(0xb75d79e3d48fce3), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xb75d79e3d48fce3), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceStone122991 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0x3d41c45fd116df77);
            default Caption = LocText("TEXT_WIP_QVABRVD_20241212_113709");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceStone121565);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xff4dcfacfe11bc24), Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_OPENGATE != nullptr && !Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_OPENGATE.HasSucceeded());
                }
                
                return Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_OPENGATE != nullptr && !Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_OPENGATE.HasSucceeded();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3d41c45fd116df6e), EConversationDebugInfo::Executing);
                // About getting you out ...
                Hero.AI.Say(LocText("TEXT_WIP_QVABRVD_20241212_113709"));
                DC(int64(0x3d41c45fd116df6e), EConversationDebugInfo::Done);
                DC(int64(0x3d41c45fd116df6f), EConversationDebugInfo::Executing);
                
                // Hm?
                Stone.AI.Say(LocText("TEXT_WIP_QVABRVD_20241212_113709_2386"));
                DC(int64(0x3d41c45fd116df6f), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Stone_123397,
                    UTopic_Stone_123040,
                    UTopic_Stone_123018,
                    UTopic_Stone_122998,
                    UTopic_Stone_123060
                );
                DC(int64(0x3d41c45fd116dfd8), EConversationDebugInfo::Executing);
                // Just get me out of here.
                Stone.AI.Say(LocText("TEXT_WIP_QVABRVD_20241212_114353_491"));
                DC(int64(0x3d41c45fd116dfd8), EConversationDebugInfo::Done);
                DC(int64(0x3d41c45fd116dfe7), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x3d41c45fd116dfe7), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Stone_123397 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0x3d41c45fd116e012);
            default Caption = LocText("TEXT_WIP_QVABRVD_20241212_120744_2995");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Stone_123397);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x3d41c45fd116e08c), Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_ASKDARRIONKEY != nullptr && Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_ASKDARRIONKEY.HasFailed());
                }
                
                return Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_ASKDARRIONKEY != nullptr && Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_ASKDARRIONKEY.HasFailed();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3d41c45fd116e013), EConversationDebugInfo::Executing);
                // Darrion won't help.
                Hero.AI.Say(LocText("TEXT_WIP_QVABRVD_20241212_120744_2995"));
                DC(int64(0x3d41c45fd116e013), EConversationDebugInfo::Done);
                DC(int64(0x3d41c45fd116e01d), EConversationDebugInfo::Executing);
                
                // Godsdammit ... Even though I offered to work for him?
                Stone.AI.Say(LocText("TEXT_WIP_QVABRVD_20241212_120803"));
                DC(int64(0x3d41c45fd116e01d), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH5_FORGEDRIVALRIES_3, Document::UDocumentSegment_CH5_FORGEDRIVALRIES_3_GetGomezKey);
                DB(int64(0x3d41c45fd116e026), G1R.ForgedRivalries3_DarrionWillAcceptStone != 0);
                
                if (G1R.ForgedRivalries3_DarrionWillAcceptStone != 0)
                {
                    DC(int64(0x3d41c45fd116e03e), EConversationDebugInfo::Executing);
                    // He says he'll let you work for him if you make it out by ...
                    Hero.AI.Say(LocText("TEXT_WIP_QVABRVD_20241212_121017"));
                    DC(int64(0x3d41c45fd116e03e), EConversationDebugInfo::Done);
                    DC(int64(0x3d41c45fd116e047), EConversationDebugInfo::Executing);
                    
                    // Told you he's a bloody rat ... Knows full well I don't ...
                    Stone.AI.Say(LocText("TEXT_WIP_QVABRVD_20241212_121042"));
                    DC(int64(0x3d41c45fd116e047), EConversationDebugInfo::Done);
                    DC(int64(0x3d41c45fd116e33e), EConversationDebugInfo::Executing);
                    G1R.ForgedRivalries3_StoneKnowsDarrionAccept = 1;
                    DC(int64(0x3d41c45fd116e33e), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x3d41c45fd116e048), EConversationDebugInfo::Executing);
                    // He's still mad at you. Wouldn't even hear me out.
                    Hero.AI.Say(LocText("TEXT_WIP_QVABRVD_20241212_121119"));
                    DC(int64(0x3d41c45fd116e048), EConversationDebugInfo::Done);
                    DC(int64(0x3d41c45fd116e049), EConversationDebugInfo::Executing);
                    
                    // About that bloody war hammer still? By Beliar's ...
                    Stone.AI.Say(LocText("TEXT_WIP_QVABRVD_20241212_121119_731"));
                    DC(int64(0x3d41c45fd116e049), EConversationDebugInfo::Done);
                    DC(int64(0x3d41c45fd116e350), EConversationDebugInfo::Executing);
                    G1R.ForgedRivalries3_StoneKnowsDarrionReject = 1;
                    DC(int64(0x3d41c45fd116e350), EConversationDebugInfo::Done);
                }
                DC(int64(0x3d41c45fd116e09b), EConversationDebugInfo::Executing);
                // What's our next move?
                Hero.AI.Say(LocText("TEXT_WIP_QVABRVD_20241212_121853"));
                DC(int64(0x3d41c45fd116e09b), EConversationDebugInfo::Done);
                DC(int64(0x3d41c45fd116e052), EConversationDebugInfo::Executing);
                
                // There's only two options. Gomez keeps the key on him.
                Stone.AI.Say(LocText("TEXT_WIP_QVABRVD_20241212_121337_1340"));
                DC(int64(0x3d41c45fd116e052), EConversationDebugInfo::Done);
                DC(int64(0x3d41c45fd116e0de), EConversationDebugInfo::Executing);
                // Or you pick the lock. But even Fingers would be ...
                Stone.AI.Say(LocText("TEXT_WIP_QVABRVD_20241212_123204"));
                DC(int64(0x3d41c45fd116e0de), EConversationDebugInfo::Done);
                DC(int64(0x3d41c45fd116e09c), EConversationDebugInfo::Executing);
                // Whatever, just get me outta here - please!
                Stone.AI.Say(LocText("TEXT_WIP_QVABRVD_20241212_121911"));
                DC(int64(0x3d41c45fd116e09c), EConversationDebugInfo::Done);
                DC(int64(0x277328e2c56ed550), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_GETGOMEZKEY.StartQuest();
                DC(int64(0x277328e2c56ed550), EConversationDebugInfo::Done);
                DC(int64(0x3d41c45fd116e09e), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x3d41c45fd116e09e), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Stone_123040 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0x3d41c45fd116df89);
            default Caption = LocText("TEXT_WIP_QVABRVD_20241212_114002_443");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Stone_123040);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x3d41c45fd116e06b), Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_GETDARRIONKEY != nullptr && Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_GETDARRIONKEY.IsRunning());
                }
                
                return Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_GETDARRIONKEY != nullptr && Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_GETDARRIONKEY.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3d41c45fd116df8a), EConversationDebugInfo::Executing);
                // Darrion agreed to make the key.
                Hero.AI.Say(LocText("TEXT_WIP_QVABRVD_20241212_114002_443"));
                DC(int64(0x3d41c45fd116df8a), EConversationDebugInfo::Done);
                DC(int64(0x3d41c45fd116dfef), EConversationDebugInfo::Executing);
                
                // And? Do you have it?
                Stone.AI.Say(LocText("TEXT_WIP_QVABRVD_20241212_114445"));
                DC(int64(0x3d41c45fd116dfef), EConversationDebugInfo::Done);
                DC(int64(0x3d41c45fd116dff0), EConversationDebugInfo::Executing);
                
                // It's still being forged.
                Hero.AI.Say(LocText("TEXT_WIP_QVABRVD_20241212_114505"));
                DC(int64(0x3d41c45fd116dff0), EConversationDebugInfo::Done);
                DC(int64(0x3d41c45fd116dff1), EConversationDebugInfo::Executing);
                
                // Well, good things take time. And who knows that better ...
                Stone.AI.Say(LocText("TEXT_WIP_QVABRVD_20241212_114513"));
                DC(int64(0x3d41c45fd116dff1), EConversationDebugInfo::Done);
                DC(int64(0x3d41c45fd116e0df), EConversationDebugInfo::Executing);
                // Come back when you can open that bloody door.
                Stone.AI.Say(LocText("TEXT_WIP_QVABRVD_20241212_123253"));
                DC(int64(0x3d41c45fd116e0df), EConversationDebugInfo::Done);
                DC(int64(0x3d41c45fd116e00a), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x3d41c45fd116e00a), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Stone_123018 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0x3d41c45fd116df7e);
            default Caption = LocText("TEXT_WIP_QVABRVD_20241212_113809_2801");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Stone_123018);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x3d41c45fd116e062), Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_GETDARRIONKEY != nullptr && Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_GETDARRIONKEY.HasSucceeded());
                }
                
                return Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_GETDARRIONKEY != nullptr && Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_GETDARRIONKEY.HasSucceeded();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3d41c45fd116df7f), EConversationDebugInfo::Executing);
                // I have Darrion's key.
                Hero.AI.Say(LocText("TEXT_WIP_QVABRVD_20241212_113809_2801"));
                DC(int64(0x3d41c45fd116df7f), EConversationDebugInfo::Done);
                DC(int64(0x3d41c45fd116dfc8), EConversationDebugInfo::Executing);
                
                // Finally!
                Stone.AI.Say(LocText("TEXT_WIP_QVABRVD_20241212_114328"));
                DC(int64(0x3d41c45fd116dfc8), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Stone_122998 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0x3d41c45fd116df7a);
            default Caption = LocText("TEXT_WIP_QVABRVD_20241212_113809_1609");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Stone_122998);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x3d41c45fd116dfb0), Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_GETGOMEZKEY != nullptr && Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_GETGOMEZKEY.HasSucceeded());
                }
                
                return Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_GETGOMEZKEY != nullptr && Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_GETGOMEZKEY.HasSucceeded();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3d41c45fd116df7b), EConversationDebugInfo::Executing);
                
                // I have Gomez's key.
                Hero.AI.Say(LocText("TEXT_WIP_QVABRVD_20241212_113809_1609"));
                DC(int64(0x3d41c45fd116df7b), EConversationDebugInfo::Done);
                DC(int64(0x3d41c45fd116dfb8), EConversationDebugInfo::Executing);
                
                // You what?! Does that mean you- No, don't even tell me.
                Stone.AI.Say(LocText("TEXT_WIP_QVABRVD_20241212_114142"));
                DC(int64(0x3d41c45fd116dfb8), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Stone_123060 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0x3d41c45fd116df94);
            default Caption = LocText("TEXT_WIP_QVABRVD_20241212_114004_1769");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Stone_123060);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3d41c45fd116df95), EConversationDebugInfo::Executing);
                
                // Still working on it.
                Hero.AI.Say(LocText("TEXT_WIP_QVABRVD_20241212_114004_1769"));
                DC(int64(0x3d41c45fd116df95), EConversationDebugInfo::Done);
                DC(int64(0x3d41c45fd116df9f), EConversationDebugInfo::Executing);
                
                // Then work faster.
                Stone.AI.Say(LocText("TEXT_WIP_QVABRVD_20241212_114011"));
                DC(int64(0x3d41c45fd116df9f), EConversationDebugInfo::Done);
                DC(int64(0x3d41c45fd116dfa7), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x3d41c45fd116dfa7), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceStone124483 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0x3d41c45fd116e102);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceStone121565);
            default Rules.HideIfKnows(UChoiceStone124483);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x3d41c45fd116e22d), G1R != nullptr && G1R.IsDoorOpen(n"OC_Prison_Dungeons_Cell_09_Door"));
                }
                
                return G1R != nullptr && G1R.IsDoorOpen(n"OC_Prison_Dungeons_Cell_09_Door");
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3d41c45fd116e0fa), EConversationDebugInfo::Executing);
                // It's so damp down here, I can feel it in me bones ...
                Stone.AI.Say(LocText("TEXT_WIP_QVABRVD_20241212_124806_3719"));
                DC(int64(0x3d41c45fd116e0fa), EConversationDebugInfo::Done);
                DC(int64(0x277328e2c56ed584), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_OPENGATE.SucceedQuest();
                DC(int64(0x277328e2c56ed584), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Stone_124599,
                    UTopic_Stone_124619,
                    UTopic_Stone_124757
                );
            }
        }
        
        
        class UTopic_Stone_124599 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0x3d41c45fd116e115);
            default Caption = LocText("TEXT_WIP_QVABRVD_20241212_124958_3902");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Stone_124599);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3d41c45fd116e116), EConversationDebugInfo::Executing);
                // What's the plan?
                Hero.AI.Say(LocText("TEXT_WIP_QVABRVD_20241212_124958_3902"));
                DC(int64(0x3d41c45fd116e116), EConversationDebugInfo::Done);
                DC(int64(0x3d41c45fd116e124), EConversationDebugInfo::Executing);
                
                // You go ahead. Bastards left me with nothin' but the ...
                Stone.AI.Say(LocText("TEXT_WIP_QVABRVD_20241212_125007"));
                DC(int64(0x3d41c45fd116e124), EConversationDebugInfo::Done);
                DC(int64(0x3d41c45fd116e125), EConversationDebugInfo::Executing);
                // Just get me past the gates - I can handle the rest.
                Stone.AI.Say(LocText("TEXT_WIP_QVABRVD_20241212_125035"));
                DC(int64(0x3d41c45fd116e125), EConversationDebugInfo::Done);
                DC(int64(0x3d41c45fd116e118), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x3d41c45fd116e118), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Stone_124619 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0x3d41c45fd116e119);
            default Caption = LocText("TEXT_WIP_QVABRVD_20241212_124958_292");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Stone_124619);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xede499b67047e7cf), Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_ASKDARRIONKEY != nullptr && Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_ASKDARRIONKEY.HasBeenStarted());
                }
                
                return Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_ASKDARRIONKEY != nullptr && Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_ASKDARRIONKEY.HasBeenStarted();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3d41c45fd116e11a), EConversationDebugInfo::Executing);
                // About Darrion ...
                Hero.AI.Say(LocText("TEXT_WIP_QVABRVD_20241212_124958_292"));
                DC(int64(0x3d41c45fd116e11a), EConversationDebugInfo::Done);
                DC(int64(0x3d41c45fd116e126), EConversationDebugInfo::Executing);
                
                // Save it.
                Stone.AI.Say(LocText("TEXT_WIP_QVABRVD_20241212_125123"));
                DC(int64(0x3d41c45fd116e126), EConversationDebugInfo::Done);
                DC(int64(0x3d41c45fd116e11c), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x3d41c45fd116e11c), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Stone_124757 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0x3d41c45fd116e127);
            default Caption = LocText("TEXT_WIP_QVABRVD_20241212_125154_94");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Stone_124757);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3d41c45fd116e128), EConversationDebugInfo::Executing);
                // Stay close.
                Hero.AI.Say(LocText("TEXT_WIP_QVABRVD_20241212_125154_94"));
                DC(int64(0x3d41c45fd116e128), EConversationDebugInfo::Done);
                DC(int64(0x3d41c45fd116e132), EConversationDebugInfo::Executing);
                
                // Hm. I've known these blokes for years. Forged and fixed ...
                Stone.AI.Say(LocText("TEXT_WIP_QVABRVD_20241212_125215"));
                DC(int64(0x3d41c45fd116e132), EConversationDebugInfo::Done);
                DC(int64(0x3d41c45fd116e133), EConversationDebugInfo::Executing);
                // But if it's gonna be do or die, don't hesitate. They ...
                Stone.AI.Say(LocText("TEXT_WIP_QVABRVD_20241212_125224"));
                DC(int64(0x3d41c45fd116e133), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH5_FORGEDRIVALRIES_3, Document::UDocumentSegment_CH5_FORGEDRIVALRIES_3_Escort);
                DC(int64(0x3d41c45fd116e246), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_ESCORT.StartQuest();
                DC(int64(0x3d41c45fd116e246), EConversationDebugInfo::Done);
                DC(int64(0xa202d7f962cedb8f), EConversationDebugInfo::Executing);
                Stone.ExchangeDailyRoutineToClass(UDailyRoutine_OCR_GRD_Stone_219_FollowHero);
                DC(int64(0xa202d7f962cedb8f), EConversationDebugInfo::Done);
                DC(int64(0xa202d7f962cedb91), EConversationDebugInfo::Executing);
                Stone.SetTrueGuild(UGE_Guild_None);
                DC(int64(0xa202d7f962cedb91), EConversationDebugInfo::Done);
                DC(int64(0xa202d7f962cedb97), EConversationDebugInfo::Executing);
                Stone.JoinPartyOf(Hero);
                DC(int64(0xa202d7f962cedb97), EConversationDebugInfo::Done);
                DC(int64(0x3d41c45fd116e13b), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x3d41c45fd116e13b), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceStone124856 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0x3d41c45fd116e168);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceStone124483);
            default Rules.HideIfKnows(UChoiceStone124856);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x3d41c45fd116e236), Stone != nullptr && !Stone.IsCloseToWaypoint(n"FP_OC_STANDAROUND_13", 20000.0f));
                    DB(int64(0x7635b90f6fabbb46), Stone != nullptr && Stone.IsCloseToWaypoint(n"FP_OC_SCPAPE", 1000.0f));
                    DB(int64(0x7635b90f6fabbb46), Stone != nullptr && Stone.IsCloseToWaypoint(n"FP_OC_GUARDPASSAGE_28", 1000.0f));
                    DB(int64(0x7635b90f6fabbb46), Stone != nullptr && Stone.IsCloseToWaypoint(n"FP_OC_GUARD_03", 1000.0f));
                }
                
                if (Stone != nullptr && !Stone.IsCloseToWaypoint(n"FP_OC_STANDAROUND_13", 20000.0f))
                    return true;
                
                if (Stone != nullptr && Stone.IsCloseToWaypoint(n"FP_OC_SCPAPE", 1000.0f))
                    return true;
                
                if (Stone != nullptr && Stone.IsCloseToWaypoint(n"FP_OC_GUARDPASSAGE_28", 1000.0f))
                    return true;
                
                if (Stone != nullptr && Stone.IsCloseToWaypoint(n"FP_OC_GUARD_03", 1000.0f))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3d41c45fd116e160), EConversationDebugInfo::Executing);
                // Hmm, finally. Sweet, fresh air.
                Stone.AI.Say(LocText("TEXT_WIP_QVABRVD_20241212_134936_1037"));
                DC(int64(0x3d41c45fd116e160), EConversationDebugInfo::Done);
                DC(int64(0xd6eca3de9c717fe2), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_ESCORT.SucceedQuest();
                DC(int64(0xd6eca3de9c717fe2), EConversationDebugInfo::Done);
                DC(int64(0xd6eca3de9c717ffc), EConversationDebugInfo::Executing);
                Stone.ExchangeDailyRoutineToClass(UDailyRoutine_OCR_GRD_Stone_219_FollowHero);
                DC(int64(0xd6eca3de9c717ffc), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Stone_124882,
                    UTopic_Stone_124862,
                    UTopic_Stone_124191,
                    UTopic_Stone_124245,
                    UTopic_Stone_124265
                );
                DC(int64(0x5b382f0eb9de541c), EConversationDebugInfo::Executing);
                // Come find me when you've a mind. I've got somethin' to ...
                Stone.AI.Say(LocText("TEXT_WIP_QVABRVD_20241212_154503_443"));
                DC(int64(0x5b382f0eb9de541c), EConversationDebugInfo::Done);
                DC(int64(0x5b382f0eb9de5433), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_FREESTONE.SucceedQuest();
                DC(int64(0x5b382f0eb9de5433), EConversationDebugInfo::Done);
                DB(int64(0x8a1f86bb7cf2c4c2), G1R.ForgedRivalries3_StoneKnowsDarrionAccept != 0);
                
                if (G1R.ForgedRivalries3_StoneKnowsDarrionAccept != 0)
                {
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH5_FORGEDRIVALRIES_3, Document::UDocumentSegment_CH5_FORGEDRIVALRIES_3_FreeSC);
                    Print("Skipped Stone.ExchangeDailyRoutineToClass(UGoToAlongFreepoints_SC)");
                    DC(int64(0x8a1f86bb7cf2c4f9), EConversationDebugInfo::Executing);
                    if (ensure(IsValid(SC_NOV_NOVICE09_1316))) { SC_NOV_NOVICE09_1316.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Novice09_1316_ScNew); }
                    DC(int64(0x8a1f86bb7cf2c4f9), EConversationDebugInfo::Done);
                    DC(int64(0xa202d7f962cedb93), EConversationDebugInfo::Executing);
                    Stone.SetTrueGuild(UGE_Guild_Human_SwampCamp_Novice);
                    DC(int64(0xa202d7f962cedb93), EConversationDebugInfo::Done);
                    DC(int64(0xa202d7f962cedb99), EConversationDebugInfo::Executing);
                    Stone.LeavePartyOf(Hero);
                    DC(int64(0xa202d7f962cedb99), EConversationDebugInfo::Done);
                }
                else
                {
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH5_FORGEDRIVALRIES_3, Document::UDocumentSegment_CH5_FORGEDRIVALRIES_3_FreeNC);
                    Print("Skipped Stone.ExchangeDailyRoutineToClass(UGoToAlongFreepoints_NC)");
                    DC(int64(0xa202d7f962cedb95), EConversationDebugInfo::Executing);
                    Stone.SetTrueGuild(UGE_Guild_Human_NewCamp_Scraper);
                    DC(int64(0xa202d7f962cedb95), EConversationDebugInfo::Done);
                    DC(int64(0xa202d7f962cedb9b), EConversationDebugInfo::Executing);
                    Stone.LeavePartyOf(Hero);
                    DC(int64(0xa202d7f962cedb9b), EConversationDebugInfo::Done);
                }
                DC(int64(0x5b382f0eb9de543b), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x5b382f0eb9de543b), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Stone_124882 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0x3d41c45fd116e16f);
            default Caption = LocText("TEXT_WIP_QVABRVD_20241212_135351_1351");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Stone_124882);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3d41c45fd116e170), EConversationDebugInfo::Executing);
                // So, you're leaving the Old Camp?
                Hero.AI.Say(LocText("TEXT_WIP_QVABRVD_20241212_135351_1351"));
                DC(int64(0x3d41c45fd116e170), EConversationDebugInfo::Done);
                DC(int64(0x5b382f0eb9de53c7), EConversationDebugInfo::Executing);
                
                // Ain't got much of a choice, eh? Gomez ain't one to ...
                Stone.AI.Say(LocText("TEXT_WIP_QVABRVD_20241212_153859"));
                DC(int64(0x5b382f0eb9de53c7), EConversationDebugInfo::Done);
                DB(int64(0x5b382f0eb9de54c6), Gomez != nullptr && Gomez.IsEveryoneOfThisKindDead());
                
                if (Gomez != nullptr && Gomez.IsEveryoneOfThisKindDead())
                {
                    DC(int64(0x5b382f0eb9de54b3), EConversationDebugInfo::Executing);
                    // No need. Gomez is dead.
                    Hero.AI.Say(LocText("TEXT_WIP_QVABRVD_20241212_160441"));
                    DC(int64(0x5b382f0eb9de54b3), EConversationDebugInfo::Done);
                    DC(int64(0x5b382f0eb9de54b4), EConversationDebugInfo::Executing);
                    
                    // What- Did you really? No way! Really?! And the Camp - it ...
                    Stone.AI.Say(LocText("TEXT_WIP_QVABRVD_20241212_160441_1769"));
                    DC(int64(0x5b382f0eb9de54b4), EConversationDebugInfo::Done);
                    DC(int64(0x5b382f0eb9de54de), EConversationDebugInfo::Executing);
                    // Well, not that I care. Nothin' left for me here, just a ...
                    Stone.AI.Say(LocText("TEXT_WIP_QVABRVD_20241212_160610"));
                    DC(int64(0x5b382f0eb9de54de), EConversationDebugInfo::Done);
                    DC(int64(0x5b382f0eb9de54df), EConversationDebugInfo::Executing);
                    ReturnToLastSelection(1);
                    DC(int64(0x5b382f0eb9de54df), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x5b382f0eb9de54d6), EConversationDebugInfo::Executing);
                    ReturnToLastSelection(1);
                    DC(int64(0x5b382f0eb9de54d6), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UTopic_Stone_124862 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0x3d41c45fd116e16b);
            default Caption = LocText("TEXT_WIP_QVABRVD_20241212_135351_3334");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Stone_124862);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xede499b67047e7cf), Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_ASKDARRIONKEY != nullptr && Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_ASKDARRIONKEY.HasBeenStarted());
                }
                
                return Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_ASKDARRIONKEY != nullptr && Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_ASKDARRIONKEY.HasBeenStarted();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3d41c45fd116e16c), EConversationDebugInfo::Executing);
                // What's your plan now?
                Hero.AI.Say(LocText("TEXT_WIP_QVABRVD_20241212_135351_3334"));
                DC(int64(0x3d41c45fd116e16c), EConversationDebugInfo::Done);
                DB(int64(0x5b382f0eb9de51b7), G1R.ForgedRivalries3_StoneKnowsDarrionAccept != 0);
                DB(int64(0x5b382f0eb9de51bf), G1R.ForgedRivalries3_StoneKnowsDarrionReject != 0);
                
                if (G1R.ForgedRivalries3_StoneKnowsDarrionAccept != 0)
                {
                    DC(int64(0x5b382f0eb9de51e2), EConversationDebugInfo::Executing);
                    // Well, even sweepin' ash for Darrion probably beats ...
                    Stone.AI.Say(LocText("TEXT_WIP_QVABRVD_20241212_142826"));
                    DC(int64(0x5b382f0eb9de51e2), EConversationDebugInfo::Done);
                    DC(int64(0x5b382f0eb9de5214), EConversationDebugInfo::Executing);
                    ReturnToLastSelection(1);
                    DC(int64(0x5b382f0eb9de5214), EConversationDebugInfo::Done);
                }
                else if (G1R.ForgedRivalries3_StoneKnowsDarrionReject != 0)
                {
                    DC(int64(0x5b382f0eb9de51eb), EConversationDebugInfo::Executing);
                    // I bet they ain't even got a proper forge in the New ...
                    Stone.AI.Say(LocText("TEXT_WIP_QVABRVD_20241212_142831"));
                    DC(int64(0x5b382f0eb9de51eb), EConversationDebugInfo::Done);
                    DC(int64(0x5b382f0eb9de54e7), EConversationDebugInfo::Executing);
                    // Can't go anywhere else though, eh? It's me best bet now.
                    Stone.AI.Say(LocText("TEXT_WIP_QVABRVD_20241212_160747"));
                    DC(int64(0x5b382f0eb9de54e7), EConversationDebugInfo::Done);
                    DC(int64(0x5b382f0eb9de521c), EConversationDebugInfo::Executing);
                    ReturnToLastSelection(1);
                    DC(int64(0x5b382f0eb9de521c), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x5b382f0eb9de5264), EConversationDebugInfo::Executing);
                    // Darrion say anythin' about me offer?
                    Stone.AI.Say(LocText("TEXT_WIP_QVABRVD_20241212_143645_2785"));
                    DC(int64(0x5b382f0eb9de5264), EConversationDebugInfo::Done);
                    DB(int64(0x5b382f0eb9de52e9), Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_ASKDARRIONKEY != nullptr && Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_ASKDARRIONKEY.HasSucceeded());
                    DB(int64(0x5b382f0eb9de530d), G1R.ForgedRivalries3_DarrionWillAcceptStone != 0);
                    DB(int64(0x5b382f0eb9de52ea), Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_ASKDARRIONKEY != nullptr && Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_ASKDARRIONKEY.HasFailed());
                    
                    if ((Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_ASKDARRIONKEY != nullptr && Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_ASKDARRIONKEY.HasSucceeded()) || (G1R.ForgedRivalries3_DarrionWillAcceptStone != 0))
                    {
                        DC(int64(0x5b382f0eb9de5315), EConversationDebugInfo::Executing);
                        // If you do as he tells you, you're welcome to join him.
                        Hero.AI.Say(LocText("TEXT_WIP_QVABRVD_20241212_151131"));
                        DC(int64(0x5b382f0eb9de5315), EConversationDebugInfo::Done);
                        DC(int64(0x5b382f0eb9de5316), EConversationDebugInfo::Executing);
                        
                        // O' course. Bet that's what he dreamed of in his sleep.
                        Stone.AI.Say(LocText("TEXT_WIP_QVABRVD_20241212_151131_2386"));
                        DC(int64(0x5b382f0eb9de5316), EConversationDebugInfo::Done);
                        DC(int64(0x5b382f0eb9de53a0), EConversationDebugInfo::Executing);
                        // Well, even sweepin' ash for Darrion probably beats ...
                        Stone.AI.Say(LocText("TEXT_WIP_QVABRVD_20241212_142826"));
                        DC(int64(0x5b382f0eb9de53a0), EConversationDebugInfo::Done);
                        DC(int64(0x3d41c45fd116e33e), EConversationDebugInfo::Executing);
                        G1R.ForgedRivalries3_StoneKnowsDarrionAccept = 1;
                        DC(int64(0x3d41c45fd116e33e), EConversationDebugInfo::Done);
                        DC(int64(0x5b382f0eb9de53af), EConversationDebugInfo::Executing);
                        ReturnToLastSelection(1);
                        DC(int64(0x5b382f0eb9de53af), EConversationDebugInfo::Done);
                    }
                    else if (Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_ASKDARRIONKEY != nullptr && Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_ASKDARRIONKEY.HasFailed())
                    {
                        DC(int64(0x5b382f0eb9de531e), EConversationDebugInfo::Executing);
                        // He's still mad at you. Wouldn't even hear me out.
                        Hero.AI.Say(LocText("TEXT_WIP_QVABRVD_20241212_121119"));
                        DC(int64(0x5b382f0eb9de531e), EConversationDebugInfo::Done);
                        DC(int64(0x5b382f0eb9de531f), EConversationDebugInfo::Executing);
                        
                        // About that bloody war hammer still? By Beliar's ...
                        Stone.AI.Say(LocText("TEXT_WIP_QVABRVD_20241212_121119_731"));
                        DC(int64(0x5b382f0eb9de531f), EConversationDebugInfo::Done);
                        DC(int64(0x5b382f0eb9de539e), EConversationDebugInfo::Executing);
                        // I bet they ain't even got a proper forge in the New ...
                        Stone.AI.Say(LocText("TEXT_WIP_QVABRVD_20241212_142831"));
                        DC(int64(0x5b382f0eb9de539e), EConversationDebugInfo::Done);
                        DC(int64(0x5b382f0eb9de54e8), EConversationDebugInfo::Executing);
                        // Can't go anywhere else though, eh? It's me best bet now.
                        Stone.AI.Say(LocText("TEXT_WIP_QVABRVD_20241212_160747"));
                        DC(int64(0x5b382f0eb9de54e8), EConversationDebugInfo::Done);
                        DC(int64(0x3d41c45fd116e350), EConversationDebugInfo::Executing);
                        G1R.ForgedRivalries3_StoneKnowsDarrionReject = 1;
                        DC(int64(0x3d41c45fd116e350), EConversationDebugInfo::Done);
                        DC(int64(0x5b382f0eb9de53b7), EConversationDebugInfo::Executing);
                        ReturnToLastSelection(1);
                        DC(int64(0x5b382f0eb9de53b7), EConversationDebugInfo::Done);
                    }
                    else
                    {
                        DC(int64(0x5b382f0eb9de52fa), EConversationDebugInfo::Executing);
                        // I haven't spoken to him yet.
                        Hero.AI.Say(LocText("TEXT_WIP_QVABRVD_20241212_150907"));
                        DC(int64(0x5b382f0eb9de52fa), EConversationDebugInfo::Done);
                        DC(int64(0x5b382f0eb9de52fb), EConversationDebugInfo::Executing);
                        
                        // It's about time, then. I'm goin' over there. And I ain't ...
                        Stone.AI.Say(LocText("TEXT_WIP_QVABRVD_20241212_150907_686"));
                        DC(int64(0x5b382f0eb9de52fb), EConversationDebugInfo::Done);
                        DC(int64(0x3d41c45fd116e33e), EConversationDebugInfo::Executing);
                        G1R.ForgedRivalries3_StoneKnowsDarrionAccept = 1;
                        DC(int64(0x3d41c45fd116e33e), EConversationDebugInfo::Done);
                        DC(int64(0x5b382f0eb9de53bf), EConversationDebugInfo::Executing);
                        ReturnToLastSelection(1);
                        DC(int64(0x5b382f0eb9de53bf), EConversationDebugInfo::Done);
                    }
                }
            }
        }
        
        
        class UTopic_Stone_124191 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0x5b382f0eb9de53d6);
            default Caption = LocText("TEXT_WIP_QVABRVD_20241212_153935_1609");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Stone_124191);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5b382f0eb9de53d7), EConversationDebugInfo::Executing);
                // Will you be all right?
                Hero.AI.Say(LocText("TEXT_WIP_QVABRVD_20241212_153935_1609"));
                DC(int64(0x5b382f0eb9de53d7), EConversationDebugInfo::Done);
                DC(int64(0x5b382f0eb9de53e1), EConversationDebugInfo::Executing);
                
                // I've shaped steel when half the blokes in here were ...
                Stone.AI.Say(LocText("TEXT_WIP_QVABRVD_20241212_153944"));
                DC(int64(0x5b382f0eb9de53e1), EConversationDebugInfo::Done);
                DC(int64(0x5b382f0eb9de53d9), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x5b382f0eb9de53d9), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Stone_124245 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0x5b382f0eb9de53e2);
            default Caption = LocText("TEXT_WIP_QVABRVD_20241212_154056_3569");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Stone_124245);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xede499b67047e7cf), Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_ASKDARRIONKEY != nullptr && !Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_ASKDARRIONKEY.HasBeenStarted());
                    DB(int64(0x5b382f0eb9de53f9), Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_QVABRVD_20241212_135351_3334")));
                    DB(int64(0x5b382f0eb9de5401), Quest::SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2 != nullptr && !Quest::SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2.HasSucceeded());
                }
                
                if (Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_ASKDARRIONKEY != nullptr && !Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_ASKDARRIONKEY.HasBeenStarted())
                    return true;
                
                if (Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_QVABRVD_20241212_135351_3334")) && Quest::SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2 != nullptr && !Quest::SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2.HasSucceeded())
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5b382f0eb9de53e3), EConversationDebugInfo::Executing);
                // Watch yourself out there.
                Hero.AI.Say(LocText("TEXT_WIP_QVABRVD_20241212_154056_3569"));
                DC(int64(0x5b382f0eb9de53e3), EConversationDebugInfo::Done);
                DC(int64(0x5b382f0eb9de5403), EConversationDebugInfo::Executing);
                
                // You too. I won't forget that you saved me neck.
                Stone.AI.Say(LocText("TEXT_WIP_QVABRVD_20241212_154258"));
                DC(int64(0x5b382f0eb9de5403), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Stone_124265 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0x5b382f0eb9de53ed);
            default Caption = LocText("TEXT_WIP_QVABRVD_20241212_154104_2801");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Stone_124265);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_QVABRVD_20241212_135351_3334"), int64(0x5b382f0eb9de53ed));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x5b382f0eb9de5401), Quest::SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2 != nullptr && Quest::SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2.HasSucceeded());
                }
                
                return Quest::SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2 != nullptr && Quest::SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2.HasSucceeded();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5b382f0eb9de53ee), EConversationDebugInfo::Executing);
                
                // Don't start any quarrels.
                Hero.AI.Say(LocText("TEXT_WIP_QVABRVD_20241212_154104_2801"));
                DC(int64(0x5b382f0eb9de53ee), EConversationDebugInfo::Done);
                DC(int64(0x5b382f0eb9de5413), EConversationDebugInfo::Executing);
                
                // Ah, I think I've had me fill. Just survivin' is good ...
                Stone.AI.Say(LocText("TEXT_WIP_QVABRVD_20241212_154411"));
                DC(int64(0x5b382f0eb9de5413), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceStone129128 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0x901d3081e789a50b);
            default Caption = LocText("TEXT_WIP_RRYREI_20241213_155311");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceStone124856);
            default Rules.HideIfKnows(UChoiceStone129128);
            
            default Rules.RequireCharacterCloseToWaypoint(n"OCR_GRD_STONE_219", n"FP_SC_SMALLTALK_13", 2000.0f, int64(0x901d3081e789a50b));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x901d3081e789a6d3), Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3 != nullptr && Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3.HasSucceeded());
                }
                
                return Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3 != nullptr && Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3.HasSucceeded();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x901d3081e789a502), EConversationDebugInfo::Executing);
                
                // How is it?
                Hero.AI.Say(LocText("TEXT_WIP_RRYREI_20241213_155311"));
                DC(int64(0x901d3081e789a502), EConversationDebugInfo::Done);
                DC(int64(0x901d3081e789a503), EConversationDebugInfo::Executing);
                
                // Damp. Everything's bloody damp. You blink once and ...
                Stone.AI.Say(LocText("TEXT_WIP_RRYREI_20241213_155311_41"));
                DC(int64(0x901d3081e789a503), EConversationDebugInfo::Done);
                DC(int64(0xe45ba7b3e6f87ec), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_OC_FORGEDRIVALRIES3_STONESC);
                DC(int64(0xe45ba7b3e6f87ec), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Stone_129141,
                    UTopic_Stone_129161,
                    UTopic_Stone_129202,
                    UTopic_Stone_227414
                );
            }
        }
        
        
        class UTopic_Stone_129141 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0x901d3081e789a50e);
            default Caption = LocText("TEXT_WIP_RRYREI_20241213_155412_2238");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Stone_129141);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x901d3081e789a50f), EConversationDebugInfo::Executing);
                // Are you getting along with Darrion?
                Hero.AI.Say(LocText("TEXT_WIP_RRYREI_20241213_155412_2238"));
                DC(int64(0x901d3081e789a50f), EConversationDebugInfo::Done);
                DC(int64(0x901d3081e789a52d), EConversationDebugInfo::Executing);
                
                // Ehh, sort of. He designs, I forge - no questions asked.
                Stone.AI.Say(LocText("TEXT_WIP_RRYREI_20241213_155554"));
                DC(int64(0x901d3081e789a52d), EConversationDebugInfo::Done);
                DC(int64(0x901d3081e789a52e), EConversationDebugInfo::Executing);
                // And, if I'm gonna be honest, there ain't much to ask. He ...
                Stone.AI.Say(LocText("TEXT_WIP_RRYREI_20241213_155612"));
                DC(int64(0x901d3081e789a52e), EConversationDebugInfo::Done);
                DC(int64(0x901d3081e789a511), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x901d3081e789a511), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Stone_129161 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0x901d3081e789a512);
            default Caption = LocText("TEXT_WIP_RRYREI_20241213_155412_2785");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Stone_129161);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x901d3081e789a513), EConversationDebugInfo::Executing);
                // The Brotherhood trying to convert you?
                Hero.AI.Say(LocText("TEXT_WIP_RRYREI_20241213_155412_2785"));
                DC(int64(0x901d3081e789a513), EConversationDebugInfo::Done);
                DC(int64(0x901d3081e789a52f), EConversationDebugInfo::Executing);
                
                // Ugh, every morning. "The Sleeper guides your hammer" ...
                Stone.AI.Say(LocText("TEXT_WIP_RRYREI_20241213_155622"));
                DC(int64(0x901d3081e789a52f), EConversationDebugInfo::Done);
                DC(int64(0x901d3081e789a530), EConversationDebugInfo::Executing);
                // They can pray to whatever they want as long as they keep ...
                Stone.AI.Say(LocText("TEXT_WIP_RRYREI_20241213_155631"));
                DC(int64(0x901d3081e789a530), EConversationDebugInfo::Done);
                DC(int64(0x901d3081e789a515), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x901d3081e789a515), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Stone_129202 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0x901d3081e789a531);
            default Caption = LocText("TEXT_WIP_RRYREI_20241213_155703_3436");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Stone_129202);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x901d3081e789a532), EConversationDebugInfo::Executing);
                // Do you miss the Old Camp?
                Hero.AI.Say(LocText("TEXT_WIP_RRYREI_20241213_155703_3436"));
                DC(int64(0x901d3081e789a532), EConversationDebugInfo::Done);
                DC(int64(0x901d3081e789a53c), EConversationDebugInfo::Executing);
                
                // Me forge. No surprise there. But Gomez and his doctrine, ...
                Stone.AI.Say(LocText("TEXT_WIP_RRYREI_20241213_155709"));
                DC(int64(0x901d3081e789a53c), EConversationDebugInfo::Done);
                DC(int64(0x901d3081e789a53d), EConversationDebugInfo::Executing);
                // By the way, if you see Huno, tell him I'm still ...
                Stone.AI.Say(LocText("TEXT_WIP_RRYREI_20241213_155717"));
                DC(int64(0x901d3081e789a53d), EConversationDebugInfo::Done);
                DC(int64(0x901d3081e789a534), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x901d3081e789a534), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Stone_227414 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0x4ae97efd64eb2f22);
            default Caption = LocText("TEXT_WIP_RRYREI_20241213_155742_3286");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Stone_227414);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4ae97efd64eb2ef9), EConversationDebugInfo::Executing);
                // Good luck, then.
                Hero.AI.Say(LocText("TEXT_WIP_RRYREI_20241213_155742_3286"));
                DC(int64(0x4ae97efd64eb2ef9), EConversationDebugInfo::Done);
                DB(int64(0x4ae97efd64eb2ea8), Hero != nullptr && Hero.HasItem(UGrd_Armor, 1, 0));
                
                if (Hero != nullptr && Hero.HasItem(UGrd_Armor, 1, 0))
                {
                    DC(int64(0x901d3081e789a549), EConversationDebugInfo::Executing);
                    // Hold up. I still owe you - you saved me life after all.
                    Stone.AI.Say(LocText("TEXT_WIP_RRYREI_20241213_155807"));
                    DC(int64(0x901d3081e789a549), EConversationDebugInfo::Done);
                    DC(int64(0x901d3081e789a54a), EConversationDebugInfo::Executing);
                    // Been workin' on these between Darrion's commissions. You ...
                    Stone.AI.Say(LocText("TEXT_WIP_RRYREI_20241213_155844"));
                    DC(int64(0x901d3081e789a54a), EConversationDebugInfo::Done);
                    DC(int64(0x901d3081e789a54b), EConversationDebugInfo::Executing);
                    // I've got a Heavy Two-Hander, double-winged crossguard ...
                    Stone.AI.Say(LocText("TEXT_WIP_RRYREI_20241213_155932"));
                    DC(int64(0x901d3081e789a54b), EConversationDebugInfo::Done);
                    DC(int64(0x901d3081e789a54c), EConversationDebugInfo::Executing);
                    // Or I could add some tweaks to a warder armor if you've ...
                    Stone.AI.Say(LocText("TEXT_WIP_RRYREI_20241213_155943"));
                    DC(int64(0x901d3081e789a54c), EConversationDebugInfo::Done);
                    DC(int64(0xf10a76655659e3dd), EConversationDebugInfo::Executing);
                    // Maybe you prefer a ring or something like that...
                    Stone.AI.Say(LocText("TEXT_WIP_EOEJZZM_20250317_105918"));
                    DC(int64(0xf10a76655659e3dd), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x4ae97efd64eb2ec3), EConversationDebugInfo::Executing);
                    // Hold up. I still owe you - you saved me life after all.
                    Stone.AI.Say(LocText("TEXT_WIP_RRYREI_20241213_155807"));
                    DC(int64(0x4ae97efd64eb2ec3), EConversationDebugInfo::Done);
                    DC(int64(0x4ae97efd64eb2ed0), EConversationDebugInfo::Executing);
                    // Been workin' on these between Darrion's commissions. You ...
                    Stone.AI.Say(LocText("TEXT_WIP_RRYREI_20241213_155844"));
                    DC(int64(0x4ae97efd64eb2ed0), EConversationDebugInfo::Done);
                    DC(int64(0x4ae97efd64eb2ed1), EConversationDebugInfo::Executing);
                    // I've got a Heavy Two-Hander, double-winged crossguard ...
                    Stone.AI.Say(LocText("TEXT_WIP_RRYREI_20241213_155932"));
                    DC(int64(0x4ae97efd64eb2ed1), EConversationDebugInfo::Done);
                    DC(int64(0x4ae97efd64eb2ed2), EConversationDebugInfo::Executing);
                    // Maybe you prefer a ring or something like that...
                    Stone.AI.Say(LocText("TEXT_WIP_EOEJZZM_20250317_105918"));
                    DC(int64(0x4ae97efd64eb2ed2), EConversationDebugInfo::Done);
                }
                Subdialog(
                    UTopic_Stone_129485,
                    UTopic_Stone_129505,
                    UTopic_Stone_181783,
                    UTopic_Stone_181803,
                    UTopic_Stone_181823
                );
                DB(int64(0x901d3081e789a576), G1R.Stone_Teacher != 0);
                DB(int64(0x901d3081e789a596), G1R.ForgedRivalries2_StoneMarkedCraft == 0);
                DB(int64(0x901d3081e789a5b0), G1R.ForgedRivalries2_DarrionMarkedCraft == 0);
                
                if (G1R.Stone_Teacher != 0 && G1R.ForgedRivalries2_StoneMarkedCraft == 0 && G1R.ForgedRivalries2_DarrionMarkedCraft == 0)
                {
                    DC(int64(0x901d3081e789a586), EConversationDebugInfo::Executing);
                    // I usually ain't sayin' things like that, but ... well, ...
                    Stone.AI.Say(LocText("TEXT_WIP_RRYREI_20241213_160524_1609"));
                    DC(int64(0x901d3081e789a586), EConversationDebugInfo::Done);
                }
                DC(int64(0x901d3081e789a5b2), EConversationDebugInfo::Executing);
                // Now get goin'. You're distractin' me and Darrion gets ...
                Stone.AI.Say(LocText("TEXT_WIP_RRYREI_20241213_160830_3569"));
                DC(int64(0x901d3081e789a5b2), EConversationDebugInfo::Done);
                DC(int64(0x901d3081e789a6a5), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x901d3081e789a6a5), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Stone_129485 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0x901d3081e789a555);
            default Caption = LocText("TEXT_WIP_RRYREI_20241213_160227_686");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Stone_129485);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x901d3081e789a556), EConversationDebugInfo::Executing);
                // I'll take the weapon.
                Hero.AI.Say(LocText("TEXT_WIP_RRYREI_20241213_160227_686"));
                DC(int64(0x901d3081e789a556), EConversationDebugInfo::Done);
                DC(int64(0x901d3081e789a564), EConversationDebugInfo::Executing);
                
                // Ah, solid choice. Clean lines, perfect balance. She'll ...
                Stone.AI.Say(LocText("TEXT_WIP_RRYREI_20241213_160244"));
                DC(int64(0x901d3081e789a564), EConversationDebugInfo::Done);
                DC(int64(0x901d3081e789a565), EConversationDebugInfo::Executing);
                // And now she's yours. Try not to split any skulls who ...
                Stone.AI.Say(LocText("TEXT_WIP_RRYREI_20241213_160256"));
                DC(int64(0x901d3081e789a565), EConversationDebugInfo::Done);
                DC(int64(0xea2bca374667d380), EConversationDebugInfo::Executing);
                Stone.AddItemToInventory(UItMw_2H_Sword_Heavy_01, 1);
                DC(int64(0xea2bca374667d380), EConversationDebugInfo::Done);
                DC(int64(0x901d3081e789a645), EConversationDebugInfo::Executing);
                Stone.AI.GiveItemTo(Hero, UItMw_2H_Sword_Heavy_01, 1);
                DC(int64(0x901d3081e789a645), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Stone_129505 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0x901d3081e789a559);
            default Caption = LocText("TEXT_WIP_RRYREI_20241213_160227_3984");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Stone_129505);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4ae97efd64eb2ee0), Hero != nullptr && Hero.HasItem(UGrd_Armor, 1, 0));
                }
                
                return Hero != nullptr && Hero.HasItem(UGrd_Armor, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x901d3081e789a55a), EConversationDebugInfo::Executing);
                // Tweak the armor.
                Hero.AI.Say(LocText("TEXT_WIP_RRYREI_20241213_160227_3984"));
                DC(int64(0x901d3081e789a55a), EConversationDebugInfo::Done);
                DC(int64(0x901d3081e789a566), EConversationDebugInfo::Executing);
                
                // Ah, O' course. Got some properly fitted plates now - not ...
                Stone.AI.Say(LocText("TEXT_WIP_RRYREI_20241213_160331"));
                DC(int64(0x901d3081e789a566), EConversationDebugInfo::Done);
                DC(int64(0x901d3081e789a62e), EConversationDebugInfo::Executing);
                G1R.CanUpgradeGuardArmor = 1;
                DC(int64(0x901d3081e789a62e), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Stone_181783 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0xf10a76655659e3de);
            default Caption = LocText("DIA_GRD_219_STONE6_15_01");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Stone_181783);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf10a76655659e3df), EConversationDebugInfo::Executing);
                // Forge me a ring that will protect me. 
                Hero.AI.Say(LocText("DIA_GRD_219_STONE6_15_01"));
                DC(int64(0xf10a76655659e3df), EConversationDebugInfo::Done);
                DC(int64(0xf10a76655659e41f), EConversationDebugInfo::Executing);
                
                // Hmm ... yeah, I think I can help with that. I still got ...
                Stone.AI.Say(LocText("DIA_GRD_219_STONE7_06_02"));
                DC(int64(0xf10a76655659e41f), EConversationDebugInfo::Done);
                DC(int64(0xea2bca374667d380), EConversationDebugInfo::Executing);
                Stone.AddItemToInventory(UItAt_Ring_Total_01, 1);
                DC(int64(0xea2bca374667d380), EConversationDebugInfo::Done);
                DC(int64(0xf10a76655659e47d), EConversationDebugInfo::Executing);
                Stone.AI.GiveItemTo(Hero, UItAt_Ring_Total_01, 1);
                DC(int64(0xf10a76655659e47d), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Stone_181803 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0xf10a76655659e3ee);
            default Caption = LocText("DIA_GRD_219_STONE5_15_01");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Stone_181803);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf10a76655659e3ef), EConversationDebugInfo::Executing);
                // I want a ring that improves my vitality. 
                Hero.AI.Say(LocText("DIA_GRD_219_STONE5_15_01"));
                DC(int64(0xf10a76655659e3ef), EConversationDebugInfo::Done);
                DC(int64(0xf10a76655659e420), EConversationDebugInfo::Executing);
                
                // Hmm ... yeah, I think I can help with that. I still got ...
                Stone.AI.Say(LocText("DIA_GRD_219_STONE7_06_02"));
                DC(int64(0xf10a76655659e420), EConversationDebugInfo::Done);
                DC(int64(0xea2bca374667d380), EConversationDebugInfo::Executing);
                Stone.AddItemToInventory(UItAt_Ring_Life_02, 1);
                DC(int64(0xea2bca374667d380), EConversationDebugInfo::Done);
                DC(int64(0xf10a76655659e47f), EConversationDebugInfo::Executing);
                Stone.AI.GiveItemTo(Hero, UItAt_Ring_Life_02, 1);
                DC(int64(0xf10a76655659e47f), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Stone_181823 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0xf10a76655659e40f);
            default Caption = LocText("DIA_GRD_219_STONE7_15_01");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Stone_181823);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf10a76655659e410), EConversationDebugInfo::Executing);
                // I want something to strengthen my magic. 
                Hero.AI.Say(LocText("DIA_GRD_219_STONE7_15_01"));
                DC(int64(0xf10a76655659e410), EConversationDebugInfo::Done);
                DC(int64(0xf10a76655659e421), EConversationDebugInfo::Executing);
                
                // Hmm ... yeah, I think I can help with that. I still got ...
                Stone.AI.Say(LocText("DIA_GRD_219_STONE7_06_02"));
                DC(int64(0xf10a76655659e421), EConversationDebugInfo::Done);
                DC(int64(0xea2bca374667d380), EConversationDebugInfo::Executing);
                Stone.AddItemToInventory(UItAt_Amulet_Enlight, 1);
                DC(int64(0xea2bca374667d380), EConversationDebugInfo::Done);
                DC(int64(0xf10a76655659e481), EConversationDebugInfo::Executing);
                Stone.AI.GiveItemTo(Hero, UItAt_Amulet_Enlight, 1);
                DC(int64(0xf10a76655659e481), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceStone129952 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0x901d3081e789a5ca);
            default Caption = LocText("TEXT_WIP_RRYREI_20241213_160915");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceStone124856);
            default Rules.HideIfKnows(UChoiceStone129952);
            
            default Rules.RequireCharacterCloseToWaypoint(n"OCR_GRD_STONE_219", n"FP_NC_SWEEP", 2000.0f, int64(0x901d3081e789a5ca));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x901d3081e789a5ce), Stone != nullptr && Stone.HasAssignedDailyRoutine(UDailyRoutine_OCR_GRD_Stone_219_NcNew));
                }
                
                return Stone != nullptr && Stone.HasAssignedDailyRoutine(UDailyRoutine_OCR_GRD_Stone_219_NcNew);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x901d3081e789a5c1), EConversationDebugInfo::Executing);
                // There you are.
                Hero.AI.Say(LocText("TEXT_WIP_RRYREI_20241213_160915"));
                DC(int64(0x901d3081e789a5c1), EConversationDebugInfo::Done);
                DC(int64(0x901d3081e789a5c2), EConversationDebugInfo::Executing);
                
                // Where else should I've been? No forge here, so I'm ...
                Stone.AI.Say(LocText("TEXT_WIP_RRYREI_20241213_160915_2801"));
                DC(int64(0x901d3081e789a5c2), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Stone_130009,
                    UTopic_Stone_130029,
                    UTopic_Stone_130209
                );
            }
        }
        
        
        class UTopic_Stone_130009 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0x901d3081e789a5d7);
            default Caption = LocText("TEXT_WIP_RRYREI_20241213_162112_1769");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Stone_130009);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x901d3081e789a5d8), EConversationDebugInfo::Executing);
                // They're not letting you smith?
                Hero.AI.Say(LocText("TEXT_WIP_RRYREI_20241213_162112_1769"));
                DC(int64(0x901d3081e789a5d8), EConversationDebugInfo::Done);
                DC(int64(0x901d3081e789a5e6), EConversationDebugInfo::Executing);
                
                // Oh, that's not it. Ther just ain't a proper forge to ...
                Stone.AI.Say(LocText("TEXT_WIP_RRYREI_20241213_162120"));
                DC(int64(0x901d3081e789a5e6), EConversationDebugInfo::Done);
                DC(int64(0x901d3081e789a5e8), EConversationDebugInfo::Executing);
                // Lee promised to get me some proper tools, but they've ...
                Stone.AI.Say(LocText("TEXT_WIP_RRYREI_20241213_162240"));
                DC(int64(0x901d3081e789a5e8), EConversationDebugInfo::Done);
                DC(int64(0x901d3081e789a5e7), EConversationDebugInfo::Executing);
                // And, honestly, I can't even blame them. Still ... I'd ...
                Stone.AI.Say(LocText("TEXT_WIP_RRYREI_20241213_162136"));
                DC(int64(0x901d3081e789a5e7), EConversationDebugInfo::Done);
                DC(int64(0x901d3081e789a5da), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x901d3081e789a5da), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Stone_130029 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0x901d3081e789a5db);
            default Caption = LocText("TEXT_WIP_RRYREI_20241213_162112_2995");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Stone_130029);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x901d3081e789a5dc), EConversationDebugInfo::Executing);
                // Still better than the dungeon.
                Hero.AI.Say(LocText("TEXT_WIP_RRYREI_20241213_162112_2995"));
                DC(int64(0x901d3081e789a5dc), EConversationDebugInfo::Done);
                DC(int64(0x901d3081e789a5e9), EConversationDebugInfo::Executing);
                
                // Right you are, mate! And I owe that freedom to you.
                Stone.AI.Say(LocText("TEXT_WIP_RRYREI_20241213_162309"));
                DC(int64(0x901d3081e789a5e9), EConversationDebugInfo::Done);
                DC(int64(0x901d3081e789a5ea), EConversationDebugInfo::Executing);
                // By the way, if you see Huno, tell him I'm still ...
                Stone.AI.Say(LocText("TEXT_WIP_RRYREI_20241213_155717"));
                DC(int64(0x901d3081e789a5ea), EConversationDebugInfo::Done);
                DC(int64(0x901d3081e789a5de), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x901d3081e789a5de), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Stone_130209 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0x901d3081e789a5eb);
            default Caption = LocText("TEXT_WIP_RRYREI_20241213_162433_3750");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Stone_130209);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x901d3081e789a5ec), EConversationDebugInfo::Executing);
                // I wish you all the best.
                Hero.AI.Say(LocText("TEXT_WIP_RRYREI_20241213_162433_3750"));
                DC(int64(0x901d3081e789a5ec), EConversationDebugInfo::Done);
                DC(int64(0x901d3081e789a5f6), EConversationDebugInfo::Executing);
                
                // Uh, wait. Before you go ... I might not be able to forge ...
                Stone.AI.Say(LocText("TEXT_WIP_RRYREI_20241213_162459"));
                DC(int64(0x901d3081e789a5f6), EConversationDebugInfo::Done);
                DC(int64(0x901d3081e789a5f7), EConversationDebugInfo::Executing);
                // Take that design. It's for a Heavy Two-Hander. See that ...
                Stone.AI.Say(LocText("TEXT_WIP_RRYREI_20241213_162533"));
                DC(int64(0x901d3081e789a5f7), EConversationDebugInfo::Done);
                DC(int64(0x901d3081e789a5f8), EConversationDebugInfo::Executing);
                // You deserve it. 
                Stone.AI.Say(LocText("TEXT_WIP_RRYREI_20241213_162623"));
                DC(int64(0x901d3081e789a5f8), EConversationDebugInfo::Done);
                DC(int64(0x901d3081e789a62e), EConversationDebugInfo::Executing);
                Hero.LearnRecipe(UReMi_Smith_Blade_Flamberge);
                DC(int64(0x901d3081e789a62e), EConversationDebugInfo::Done);
                DC(int64(0x9733703e835842aa), EConversationDebugInfo::Executing);
                Hero.LearnRecipe(UReMi_Smith_2H_Sword_Heavy_01);
                DC(int64(0x9733703e835842aa), EConversationDebugInfo::Done);
                DC(int64(0x9733703e835842ac), EConversationDebugInfo::Executing);
                Hero.LearnRecipe(UReMw_2H_Sword_Heavy_01);
                DC(int64(0x9733703e835842ac), EConversationDebugInfo::Done);
                DC(int64(0xe45ba7b3e6f87de), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_OC_FORGEDRIVALRIES3_STONENC);
                DC(int64(0xe45ba7b3e6f87de), EConversationDebugInfo::Done);
                DC(int64(0x901d3081e789a670), EConversationDebugInfo::Executing);
                // And now go. So I can continue thinkin' about how steep ...
                Stone.AI.Say(LocText("TEXT_WIP_RRYREI_20241213_163123_731"));
                DC(int64(0x901d3081e789a670), EConversationDebugInfo::Done);
                DC(int64(0x901d3081e789a678), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x901d3081e789a678), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceStone182084 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0x764a0391c1ecbbce);
            default Caption = LocText("TEXT_WIP_AOEJZZM_20250313_143234");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceStone363258);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x71d246ca81cb0964), G1R.Stone_ImprovedOreArmor == 0);
                }
                
                return G1R.Stone_ImprovedOreArmor == 0;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x764a0391c1ecbbc3), EConversationDebugInfo::Executing);
                // About the ore armor.
                Hero.AI.Say(LocText("TEXT_WIP_AOEJZZM_20250313_143234"));
                DC(int64(0x764a0391c1ecbbc3), EConversationDebugInfo::Done);
                DB(int64(0x764a0391c1ecbbd1), G1R.Stone_OreArmor.IsValid() && G1R.Stone_OreArmor.IsAtLeastXDaysAgo(1));
                
                if (G1R.Stone_OreArmor.IsValid() && G1R.Stone_OreArmor.IsAtLeastXDaysAgo(1))
                {
                    DC(int64(0x764a0391c1ecbbdb), EConversationDebugInfo::Executing);
                    // Got that beauty all done. If she was a masterpiece ...
                    Stone.AI.Say(LocText("TEXT_WIP_AOEJZZM_20250313_143338"));
                    DC(int64(0x764a0391c1ecbbdb), EConversationDebugInfo::Done);
                    DC(int64(0x6540c1b346fbbfe7), EConversationDebugInfo::Executing);
                    // There ain't no better armor in all of Myrtana, if I do ...
                    Stone.AI.Say(LocText("TEXT_WIP_YIFVYDC_20250318_072902"));
                    DC(int64(0x6540c1b346fbbfe7), EConversationDebugInfo::Done);
                    DC(int64(0xea2bca374667d380), EConversationDebugInfo::Executing);
                    Stone.AddItemToInventory(UOre_Armor_H, 1);
                    DC(int64(0xea2bca374667d380), EConversationDebugInfo::Done);
                    DC(int64(0x764a0391c1ecbc05), EConversationDebugInfo::Executing);
                    Stone.AI.GiveItemTo(Hero, UOre_Armor_H, 1);
                    DC(int64(0x764a0391c1ecbc05), EConversationDebugInfo::Done);
                    DC(int64(0x71d246ca81cb0962), EConversationDebugInfo::Executing);
                    G1R.Stone_ImprovedOreArmor = 1;
                    DC(int64(0x71d246ca81cb0962), EConversationDebugInfo::Done);
                    DC(int64(0xb6b59bfae2c43abc), EConversationDebugInfo::Executing);
                    Stone.RemoveItemFromInventory(UOre_Armor_M, 1, 0);
                    DC(int64(0xb6b59bfae2c43abc), EConversationDebugInfo::Done);
                    DC(int64(0x764a0391c1ecbc06), EConversationDebugInfo::Executing);
                    // Thanks, Stone. 
                    Hero.AI.Say(LocText("TEXT_WIP_ADCKZPD_20241105_154926"));
                    DC(int64(0x764a0391c1ecbc06), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_stone_182084_exit_1");
                }
                else
                {
                    DC(int64(0x764a0391c1ecbcc9), EConversationDebugInfo::Executing);
                    // I said one day. Stop pestering me.
                    Stone.AI.Say(LocText("TEXT_WIP_AOEJZZM_20250313_144142"));
                    DC(int64(0x764a0391c1ecbcc9), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_stone_182084_exit_2");
                    DC(int64(0x764a0391c1ecbcd7), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x764a0391c1ecbcd7), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
        class UChoiceStone182159 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0x3e9d2f5631dc4694);
            default Caption = LocText("TEXT_WIP_PDTFPHF_20250312_125119");
            default PriorityRank = 3;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xe56af938a1ea415c), Stone != nullptr && Stone.HasAssignedDailyRoutine(UDailyRoutine_OCR_GRD_Stone_219_Start));
                    DB(int64(0xe56af938a1ea415c), Stone != nullptr && Stone.HasAssignedDailyRoutine(UDailyRoutine_OCR_GRD_Stone_219_OCHeroInsideForge));
                    DB(int64(0x901d3081e789a51e), Stone != nullptr && Stone.IsCloseToWaypoint(n"FP_SC_SMALLTALK_13", 2000.0f));
                    DB(int64(0x901d3081e789a6d3), Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3 != nullptr && Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3.HasSucceeded());
                }
                
                if (Stone != nullptr && Stone.HasAssignedDailyRoutine(UDailyRoutine_OCR_GRD_Stone_219_Start))
                    return true;
                
                if (Stone != nullptr && Stone.HasAssignedDailyRoutine(UDailyRoutine_OCR_GRD_Stone_219_OCHeroInsideForge))
                    return true;
                
                if (Stone != nullptr && Stone.IsCloseToWaypoint(n"FP_SC_SMALLTALK_13", 2000.0f) && Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3 != nullptr && Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3.HasSucceeded())
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3e9d2f5631dc468b), EConversationDebugInfo::Executing);
                // I'm looking for a better armor.
                Hero.AI.Say(LocText("TEXT_WIP_PDTFPHF_20250312_125119"));
                DC(int64(0x3e9d2f5631dc468b), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OCR_GRD_STONE, Document::UDocumentSegment_Glossary_OCR_GRD_STONE_GRDArmor);
                DB(int64(0x3e9d2f5631dc46c4), Stone != nullptr && Stone.IsAngryTowards(Hero));
                
                if (Stone != nullptr && Stone.IsAngryTowards(Hero))
                {
                    DC(int64(0x3e9d2f5631dc46fe), EConversationDebugInfo::Executing);
                    // Get lost!
                    Stone.AI.Say(LocText("TEXT_WIP_PDTFPHF_20250312_125524"));
                    DC(int64(0x3e9d2f5631dc46fe), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_stone_182159_exit_1");
                    DC(int64(0x3e9d2f5631dc471b), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x3e9d2f5631dc471b), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DB(int64(0xe56af938a1ea4186), Hero != nullptr && Hero.Inventory.HasEquippedItem(UGrd_Armor));
                    
                    if (Hero != nullptr && Hero.Inventory.HasEquippedItem(UGrd_Armor))
                    {
                        DC(int64(0x764a0391c1ecbc9c), EConversationDebugInfo::Executing);
                        // Sure, let's see what we can do for that armor.
                        Stone.AI.Say(LocText("TEXT_WIP_AOEJZZM_20250313_144020_3286"));
                        DC(int64(0x764a0391c1ecbc9c), EConversationDebugInfo::Done);
                        DC(int64(0x764a0391c1ecbcbe), EConversationDebugInfo::Executing);
                        Stone.AI.StartCustomizingArmorWith(Hero);
                        DC(int64(0x764a0391c1ecbcbe), EConversationDebugInfo::Done);
                        
                        Other.Remember(n"choice_stone_182159_exit_2");
                    }
                    else
                    {
                        DC(int64(0x764a0391c1ecbc5b), EConversationDebugInfo::Executing);
                        // First equip a warder armor. That is the only thing I ...
                        Stone.AI.Say(LocText("TEXT_WIP_AOEJZZM_20250313_143835_3436"));
                        DC(int64(0x764a0391c1ecbc5b), EConversationDebugInfo::Done);
                        
                        Other.Remember(n"choice_stone_182159_exit_3");
                    }
                }
            }
        }
        
        
        class UChoiceStone363258 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0xe56af938a1ea41ae);
            default Caption = LocText("TEXT_WIP_YIFVYDC_20250318_063943_2315");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceStone363258);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xe56af938a1ea415c), Stone != nullptr && Stone.HasAssignedDailyRoutine(UDailyRoutine_OCR_GRD_Stone_219_OCHeroInsideForge));
                    DB(int64(0xe56af938a1ea41df), Hero != nullptr && Hero.HasItem(UOre_Armor_M, 1, 0));
                    DB(int64(0xe56af938a1ea415c), Stone != nullptr && Stone.HasAssignedDailyRoutine(UDailyRoutine_OCR_GRD_Stone_219_Start));
                    DB(int64(0xe56af938a1ea41df), Hero != nullptr && Hero.HasItem(UOre_Armor_M, 1, 0));
                    DB(int64(0x901d3081e789a51e), Stone != nullptr && Stone.IsCloseToWaypoint(n"FP_SC_SMALLTALK_13", 2000.0f));
                    DB(int64(0x901d3081e789a6d3), Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3 != nullptr && Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3.HasSucceeded());
                    DB(int64(0xe56af938a1ea41de), Hero != nullptr && Hero.HasItem(UOre_Armor_M, 1, 0));
                }
                
                if (Stone != nullptr && Stone.HasAssignedDailyRoutine(UDailyRoutine_OCR_GRD_Stone_219_OCHeroInsideForge) && Hero != nullptr && Hero.HasItem(UOre_Armor_M, 1, 0))
                    return true;
                
                if (Stone != nullptr && Stone.HasAssignedDailyRoutine(UDailyRoutine_OCR_GRD_Stone_219_Start) && Hero != nullptr && Hero.HasItem(UOre_Armor_M, 1, 0))
                    return true;
                
                if (Stone != nullptr && Stone.IsCloseToWaypoint(n"FP_SC_SMALLTALK_13", 2000.0f) && Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3 != nullptr && Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3.HasSucceeded() && Hero != nullptr && Hero.HasItem(UOre_Armor_M, 1, 0))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe56af938a1ea4199), EConversationDebugInfo::Executing);
                // Could you take a look at my armor?
                Hero.AI.Say(LocText("DIA_GRD_219_STONE4_15_01"));
                DC(int64(0xe56af938a1ea4199), EConversationDebugInfo::Done);
                DC(int64(0xe56af938a1ea420f), EConversationDebugInfo::Executing);
                
                // What the-? That's ... Ain't that ...
                Stone.AI.Say(LocText("DIA_GRD_219_STONE4_06_02"));
                DC(int64(0xe56af938a1ea420f), EConversationDebugInfo::Done);
                DC(int64(0x6540c1b346fbbfd2), EConversationDebugInfo::Executing);
                
                // Yes. Can you make some improvements on it?
                Hero.AI.Say(LocText("TEXT_WIP_YIFVYDC_20250318_072338"));
                DC(int64(0x6540c1b346fbbfd2), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OCR_GRD_STONE, Document::UDocumentSegment_Glossary_OCR_GRD_STONE_OreArmor);
                DC(int64(0xe56af938a1ea4211), EConversationDebugInfo::Executing);
                Hero.Inventory.UnequipArmor();
                DC(int64(0xe56af938a1ea4211), EConversationDebugInfo::Done);
                DC(int64(0xe56af938a1ea421c), EConversationDebugInfo::Executing);
                Stone.RemoveItemFromInventory(UOre_Armor_M, 1, 0);
                DC(int64(0xe56af938a1ea421c), EConversationDebugInfo::Done);
                DC(int64(0x764a0391c1ecbbad), EConversationDebugInfo::Executing);
                G1R.Stone_OreArmor = FInGameTime::Now();
                DC(int64(0x764a0391c1ecbbad), EConversationDebugInfo::Done);
                DC(int64(0x3918d5cd3d7e1928), EConversationDebugInfo::Executing);
                Hero.AI.GiveItemTo(Stone, UOre_Armor_M, 1);
                DC(int64(0x3918d5cd3d7e1928), EConversationDebugInfo::Done);
                DC(int64(0x764a0391c1ecbbaf), EConversationDebugInfo::Executing);
                // That's a big bloody deal, mate. It's gonna take a while.
                Stone.AI.Say(LocText("TEXT_WIP_AOEJZZM_20250313_143150_41"));
                DC(int64(0x764a0391c1ecbbaf), EConversationDebugInfo::Done);
                DC(int64(0x6540c1b346fbbfe4), EConversationDebugInfo::Executing);
                
                // But can you do it?
                Hero.AI.Say(LocText("TEXT_WIP_YIFVYDC_20250318_072547"));
                DC(int64(0x6540c1b346fbbfe4), EConversationDebugInfo::Done);
                DC(int64(0x6540c1b346fbbfe5), EConversationDebugInfo::Executing);
                
                // Yeah ... yeah, of course! I'll start right now. Come ...
                Stone.AI.Say(LocText("TEXT_WIP_YIFVYDC_20250318_072554"));
                DC(int64(0x6540c1b346fbbfe5), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceStone448494 : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0xa7deef969d1dd740);
            default Caption = LocText("TEXT_WIP_DKSDKDL_20241217_101748_1482");
            default PriorityRank = 3;
            default PropertyTags.AddTag(GameplayTag::Skill_Crafting_Blacksmith_Master);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xcfd33f16f0d274fa), G1R != nullptr && G1R.HasReachedChapter(2));
                    DB(int64(0xcfd33f16f0d27502), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Crafting_Blacksmith_Master));
                    DB(int64(0xcfd33f16f0d27503), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Crafting_Blacksmith_Trained));
                    DB(int64(0x7635b90f6fabbb43), Stone != nullptr && !Stone.HasAssignedDailyRoutine(UDailyRoutine_OCR_GRD_Stone_219_Ot));
                    DB(int64(0x7635b90f6fabbb44), Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3 != nullptr && !Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3.IsRunning());
                }
                
                if (G1R != nullptr && !G1R.HasReachedChapter(2))
                    return false;
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Crafting_Blacksmith_Master))
                    return false;
                
                if (Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Crafting_Blacksmith_Trained))
                    return false;
                
                if (Stone != nullptr && Stone.HasAssignedDailyRoutine(UDailyRoutine_OCR_GRD_Stone_219_Ot))
                    return false;
                
                if (Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3 != nullptr && Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3.IsRunning())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa7deef969d1dd73e), EConversationDebugInfo::Executing);
                
                // Can you teach me how to smith?
                Hero.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_164023"));
                DC(int64(0xa7deef969d1dd73e), EConversationDebugInfo::Done);
                DC(int64(0xa7deef969d1dd73f), EConversationDebugInfo::Executing);
                
                // I ain't got the time to teach freshies - go ask Huno.
                Stone.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_164023_1549"));
                DC(int64(0xa7deef969d1dd73f), EConversationDebugInfo::Done);
                DC(int64(0xa7deef969d1dd742), EConversationDebugInfo::Executing);
                // But I would take the time to teach someone promisin'. ...
                Stone.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_164059"));
                DC(int64(0xa7deef969d1dd742), EConversationDebugInfo::Done);
                DC(int64(0xa7deef969d1dd743), EConversationDebugInfo::Executing);
                
                // I need someone to teach me.
                Hero.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_164126"));
                DC(int64(0xa7deef969d1dd743), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OCR_GRD_STONE, Document::UDocumentSegment_Glossary_OCR_GRD_STONE_Introduction);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OCR_GRD_STONE, Document::UDocumentSegment_Glossary_OCR_GRD_STONE_Teacher);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_VLK_HUNO, Document::UDocumentSegment_Glossary_OC_VLK_HUNO_Teacher);
                DB(int64(0xa7deef969d1dd746), Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Crafting_Blacksmith_Master));
                
                if (Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Crafting_Blacksmith_Master))
                {
                    DB(int64(0xcfd33f16f0d274b5), Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Crafting_Blacksmith_Master));
                    
                    if (Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Crafting_Blacksmith_Master))
                    {
                        DC(int64(0xa7deef969d1dd749), EConversationDebugInfo::Executing);
                        // All right, then.
                        Stone.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_164149"));
                        DC(int64(0xa7deef969d1dd749), EConversationDebugInfo::Done);
                        DC(int64(0xa7deef969d1dd753), EConversationDebugInfo::Executing);
                        // Uh, you know your way 'round a forge so we can directly ...
                        Stone.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_164241"));
                        DC(int64(0xa7deef969d1dd753), EConversationDebugInfo::Done);
                        DC(int64(0xa7deef969d1dd754), EConversationDebugInfo::Executing);
                        // I'm talkin' swords and axes that can deal some real ...
                        Stone.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_164241_1842"));
                        DC(int64(0xa7deef969d1dd754), EConversationDebugInfo::Done);
                        DC(int64(0xa7deef969d1dd771), EConversationDebugInfo::Executing);
                        // Same principle as the one-handers - but the you gotta be ...
                        Stone.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_164323"));
                        DC(int64(0xa7deef969d1dd771), EConversationDebugInfo::Done);
                        DC(int64(0xa7deef969d1dd779), EConversationDebugInfo::Executing);
                        // The balance point's lower - means it gives you better ...
                        Stone.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_164332"));
                        DC(int64(0xa7deef969d1dd779), EConversationDebugInfo::Done);
                        DC(int64(0xa7deef969d1dd781), EConversationDebugInfo::Executing);
                        // And you gotta temper 'em properly - different than what ...
                        Stone.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_164338"));
                        DC(int64(0xa7deef969d1dd781), EConversationDebugInfo::Done);
                        DC(int64(0xa7deef969d1dd795), EConversationDebugInfo::Executing);
                        // Most important thing is to keep your focus - eh, you'll ...
                        Stone.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_164359"));
                        DC(int64(0xa7deef969d1dd795), EConversationDebugInfo::Done);
                        DC(int64(0x63e0ed597bfd4578), EConversationDebugInfo::Executing);
                        Hero.LearnSkill(UGE_Skill_Crafting_Blacksmith_Master);
                        DC(int64(0x63e0ed597bfd4578), EConversationDebugInfo::Done);
                        DC(int64(0xedc84834f122c468), EConversationDebugInfo::Executing);
                        G1R.Stone_Teacher = 1;
                        DC(int64(0xedc84834f122c468), EConversationDebugInfo::Done);
                        DC(int64(0xf10a76655659e37d), EConversationDebugInfo::Executing);
                        G1R.KnowStone = 1;
                        DC(int64(0xf10a76655659e37d), EConversationDebugInfo::Done);
                        DC(int64(0x9733703e835841a3), EConversationDebugInfo::Executing);
                        Hero.LearnRecipe(UReMi_Smith_Blade_Singleedge);
                        DC(int64(0x9733703e835841a3), EConversationDebugInfo::Done);
                        DC(int64(0x9733703e835841a5), EConversationDebugInfo::Executing);
                        Hero.LearnRecipe(UReMi_Smith_Head_Battleaxe);
                        DC(int64(0x9733703e835841a5), EConversationDebugInfo::Done);
                        DC(int64(0x9733703e835841a7), EConversationDebugInfo::Executing);
                        Hero.LearnRecipe(UReMi_Smith_1H_Sword_03);
                        DC(int64(0x9733703e835841a7), EConversationDebugInfo::Done);
                        DC(int64(0x9733703e835841a9), EConversationDebugInfo::Executing);
                        Hero.LearnRecipe(UReMi_Smith_2H_Axe_Light_01);
                        DC(int64(0x9733703e835841a9), EConversationDebugInfo::Done);
                        DC(int64(0xb6b59bfae2c43a94), EConversationDebugInfo::Executing);
                        Hero.LearnRecipe(UReMw_1H_Sword_03);
                        DC(int64(0xb6b59bfae2c43a94), EConversationDebugInfo::Done);
                        DC(int64(0xb6b59bfae2c43a96), EConversationDebugInfo::Executing);
                        Hero.LearnRecipe(UReMw_2H_Axe_Light_01);
                        DC(int64(0xb6b59bfae2c43a96), EConversationDebugInfo::Done);
                        
                        Other.Remember(n"choice_stone_448494_exit_1");
                        DC(int64(0xcfd33f16f0d274cb), EConversationDebugInfo::Executing);
                        EndConversation();
                        DC(int64(0xcfd33f16f0d274cb), EConversationDebugInfo::Done);
                        return;
                    }
                    else
                    {
                        DC(int64(0xa7deef969d1dd74e), EConversationDebugInfo::Executing);
                        // Oh, you think I'll be doin' that for free? You bring the ...
                        Stone.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_164154"));
                        DC(int64(0xa7deef969d1dd74e), EConversationDebugInfo::Done);
                        
                        Other.Remember(n"choice_stone_448494_exit_2");
                    }
                }
                else
                {
                    DC(int64(0xa7deef969d1dd747), EConversationDebugInfo::Executing);
                    // Uh, get some more notches on your belt, then we'll talk.
                    Stone.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_164146"));
                    DC(int64(0xa7deef969d1dd747), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_stone_448494_exit_3");
                }
            }
        }
        
        
        class UChoiceStoneHello : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0xc97265bc682d83);
            default Caption = LocText("DIA_STONE_HELLO_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceStoneHello);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xc97265bc682d84), G1R != nullptr && !G1R.HasReachedChapter(4));
                }
                
                return G1R != nullptr && !G1R.HasReachedChapter(4);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc97265bc682d85), EConversationDebugInfo::Executing);
                // You're the blacksmith, aren't you? 
                Hero.AI.Say(LocText("DIA_STONE_HELLO_15_00"));
                DC(int64(0xc97265bc682d85), EConversationDebugInfo::Done);
                DC(int64(0xc97265bc682d86), EConversationDebugInfo::Executing);
                
                // That's right. 
                Stone.AI.Say(LocText("DIA_STONE_HELLO_06_01"));
                DC(int64(0xc97265bc682d86), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OCR_GRD_STONE, Document::UDocumentSegment_Glossary_OCR_GRD_STONE_Introduction);
            }
        }
        
        
        class UChoiceStoneNotselling : UTopic_Hero__OCR_GRD_STONE_219
        {
            default DebugId = int64(0xc97265bc682d87);
            default Caption = LocText("DIA_STONE_NOTSELLING_15_00");
            default PriorityRank = 1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xc97265bc682d88), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard));
                    DB(int64(0xc97265bc682d89), Stone != nullptr && Stone.HasAssignedDailyRoutine(UDailyRoutine_OCR_GRD_Stone_219_OCHeroInsideForge));
                    DB(int64(0xc97265bc682d88), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard));
                    DB(int64(0xc97265bc682d89), Stone != nullptr && Stone.HasAssignedDailyRoutine(UDailyRoutine_OCR_GRD_Stone_219_Start));
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard) && Stone != nullptr && Stone.HasAssignedDailyRoutine(UDailyRoutine_OCR_GRD_Stone_219_OCHeroInsideForge))
                    return true;
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard) && Stone != nullptr && Stone.HasAssignedDailyRoutine(UDailyRoutine_OCR_GRD_Stone_219_Start))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc97265bc682d8a), EConversationDebugInfo::Executing);
                // Can you sell me some gear? Armor and weapons? 
                Hero.AI.Say(LocText("DIA_STONE_NOTSELLING_15_00"));
                DC(int64(0xc97265bc682d8a), EConversationDebugInfo::Done);
                DC(int64(0xc97265bc682d8b), EConversationDebugInfo::Executing);
                
                // Skip sells the weapons and I handle the armor. 
                Stone.AI.Say(LocText("DIA_STONE_NOTSELLING_06_01"));
                DC(int64(0xc97265bc682d8b), EConversationDebugInfo::Done);
                DC(int64(0xc97265bc682d8d), EConversationDebugInfo::Executing);
                // That said, I only sell to warders, and you ain't one. ...
                Stone.AI.Say(LocText("DIA_STONE_NOTSELLING_06_03"));
                DC(int64(0xc97265bc682d8d), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OCR_GRD_SKIP, Document::UDocumentSegment_Glossary_OCR_GRD_SKIP_Dealer);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OCR_GRD_STONE, Document::UDocumentSegment_Glossary_OCR_GRD_STONE_Armor);
                DC(int64(0xc97265bc682d8e), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xc97265bc682d8e), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */