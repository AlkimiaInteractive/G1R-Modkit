#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OC_STT_WHISTLER_309 : UConversationCharacterSettings
        {
            default ForCharacter = n"OC_STT_WHISTLER_309";
            default VoiceTypeSubsets.Add(FVoiceTypeSubset(GameplayTag::VoiceType_G1_Voice11));
        }
        
        
        class UTopic_Hero__OC_STT_WHISTLER_309 : UG1RDialogTopic
        {
            default ForCharacter = n"OC_STT_WHISTLER_309";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetWhistler() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceWhistlerExit : UTopic_Hero__OC_STT_WHISTLER_309
        {
            default DebugId = int64(0xdad04a9e7fa4f2cb);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xdad04a9e7fa4f2cc), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xdad04a9e7fa4f2cc), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceWhistlerFavour : UTopic_Hero__OC_STT_WHISTLER_309
        {
            default DebugId = int64(0xdad04a9e7fa4f2d4);
            default Caption = LocText("DIA_WHISTLER_FAVOUR_15_00");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceWhistlerIamnew);
            default Rules.HideIfKnows(UChoiceWhistlerFavour);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xdad04a9e7fa4f2d5), Quest::OldCamp_OCCHAPTER1_WHISTLER_BUYMYSWORD != nullptr && !Quest::OldCamp_OCCHAPTER1_WHISTLER_BUYMYSWORD.HasBeenStarted());
                }
                
                return Quest::OldCamp_OCCHAPTER1_WHISTLER_BUYMYSWORD != nullptr && !Quest::OldCamp_OCCHAPTER1_WHISTLER_BUYMYSWORD.HasBeenStarted();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xdad04a9e7fa4f2d6), EConversationDebugInfo::Executing);
                // What kind of favor? 
                Hero.AI.Say(LocText("DIA_WHISTLER_FAVOUR_15_00"));
                DC(int64(0xdad04a9e7fa4f2d6), EConversationDebugInfo::Done);
                DC(int64(0xdad04a9e7fa4f2d7), EConversationDebugInfo::Executing);
                
                // Nothin' dramatic - I wanna buy a weapon from Fisk, he's ...
                Whistler.AI.Say(LocText("DIA_WHISTLER_FAVOUR_11_01"));
                DC(int64(0xdad04a9e7fa4f2d7), EConversationDebugInfo::Done);
                DC(int64(0xdad04a9e7fa4f2d8), EConversationDebugInfo::Executing);
                // Thing is, he won't sell it to me. It's a broadsword, ...
                Whistler.AI.Say(LocText("DIA_WHISTLER_FAVOUR_11_02"));
                DC(int64(0xdad04a9e7fa4f2d8), EConversationDebugInfo::Done);
                DC(int64(0xdad04a9e7fa4f2d9), EConversationDebugInfo::Executing);
                // I can give you a hundred nuggs, then you go fetch that ...
                Whistler.AI.Say(LocText("DIA_WHISTLER_FAVOUR_11_03"));
                DC(int64(0xdad04a9e7fa4f2d9), EConversationDebugInfo::Done);
                DC(int64(0x2c6ecb01f6f76ff6), EConversationDebugInfo::Executing);
                // In return, I'm gonna tell Diego you're the dog's ...
                Whistler.AI.Say(LocText("TEXT_WIP_WCCKZPD_20241101_151243"));
                DC(int64(0x2c6ecb01f6f76ff6), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_STT_Whistler, Document::UDocumentSegment_Glossary_OC_STT_Whistler_Quest);
                Subdialog(
                    UChoiceWhistlerFavourOk,
                    UChoiceWhistlerFavourOreaway,
                    UChoiceWhistlerFavourWhynotsell
                );
            }
        }
        
        
        class UChoiceWhistlerFavourOk : UTopic_Hero__OC_STT_WHISTLER_309
        {
            default DebugId = int64(0xe8603e87342be29a);
            default Caption = LocText("DIA_WHISTLER_FAVOUR_OK_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UChoiceWhistlerFavourOk);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xdad04a9e7fa4f2dc), EConversationDebugInfo::Executing);
                // Okay, give me that ore. I'll fetch the sword for you. 
                Hero.AI.Say(LocText("DIA_WHISTLER_FAVOUR_OK_15_00"));
                DC(int64(0xdad04a9e7fa4f2dc), EConversationDebugInfo::Done);
                DC(int64(0xdad04a9e7fa4f2dd), EConversationDebugInfo::Executing);
                
                // Good. Here you are - come right back once you have it.
                Whistler.AI.Say(LocText("DIA_WHISTLER_FAVOUR_OK_11_01"));
                DC(int64(0xdad04a9e7fa4f2dd), EConversationDebugInfo::Done);
                DB(int64(0xdad04a9e7fa4f2e0), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None))
                {
                    DC(int64(0x1e3f7a355ee394d0), EConversationDebugInfo::Executing);
                    Quest::OldCamp_OCCHAPTER1_JOINOC.StartQuest();
                    DC(int64(0x1e3f7a355ee394d0), EConversationDebugInfo::Done);
                }
                DC(int64(0x3399d06059b5acc7), EConversationDebugInfo::Executing);
                Whistler.AddItemToInventory(UItMi_Orenugget, 100);
                DC(int64(0x3399d06059b5acc7), EConversationDebugInfo::Done);
                DC(int64(0x1e3f7a355ee394ca), EConversationDebugInfo::Executing);
                Whistler.AI.GiveItemTo(Hero, UItMi_Orenugget, 100);
                DC(int64(0x1e3f7a355ee394ca), EConversationDebugInfo::Done);
                DC(int64(0x1e3f7a355ee394cc), EConversationDebugInfo::Executing);
                G1R.Whistler_BuyMySword_Day = G1R.Calendar_Today;
                DC(int64(0x1e3f7a355ee394cc), EConversationDebugInfo::Done);
                DC(int64(0x24e2378fdddc6eac), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_WHISTLER_BUYMYSWORD.StartQuest();
                DC(int64(0x24e2378fdddc6eac), EConversationDebugInfo::Done);
                DC(int64(0xec03f9eb9723d68e), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xec03f9eb9723d68e), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceWhistlerFavourOreaway : UTopic_Hero__OC_STT_WHISTLER_309
        {
            default DebugId = int64(0xe8603e87342be2a7);
            default Caption = LocText("DIA_WHISTLER_FAVOUR_OREAWAY_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UChoiceWhistlerFavourOreaway);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xdad04a9e7fa4f2e6), EConversationDebugInfo::Executing);
                // Aren't you worried I'm just gonna take those nuggets and ...
                Hero.AI.Say(LocText("DIA_WHISTLER_FAVOUR_OREAWAY_15_00"));
                DC(int64(0xdad04a9e7fa4f2e6), EConversationDebugInfo::Done);
                DC(int64(0xdad04a9e7fa4f2e7), EConversationDebugInfo::Executing);
                
                // Sure, you could do that. Just keep in mind the Colony is ...
                Whistler.AI.Say(LocText("DIA_WHISTLER_FAVOUR_OREAWAY_11_01"));
                DC(int64(0xdad04a9e7fa4f2e7), EConversationDebugInfo::Done);
                DC(int64(0xdad04a9e7fa4f2e8), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xdad04a9e7fa4f2e8), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceWhistlerFavourWhynotsell : UTopic_Hero__OC_STT_WHISTLER_309
        {
            default DebugId = int64(0xe8603e87342be2ac);
            default Caption = LocText("DIA_WHISTLER_FAVOUR_WHYNOTSELL_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UChoiceWhistlerFavourWhynotsell);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xdad04a9e7fa4f2ea), EConversationDebugInfo::Executing);
                // Why won't he sell you that sword?
                Hero.AI.Say(LocText("DIA_WHISTLER_FAVOUR_WHYNOTSELL_15_00"));
                DC(int64(0xdad04a9e7fa4f2ea), EConversationDebugInfo::Done);
                DC(int64(0xdad04a9e7fa4f2eb), EConversationDebugInfo::Executing);
                
                // Uh, we've had a little ... argument.
                Whistler.AI.Say(LocText("DIA_WHISTLER_FAVOUR_WHYNOTSELL_11_01"));
                DC(int64(0xdad04a9e7fa4f2eb), EConversationDebugInfo::Done);
                DC(int64(0xdad04a9e7fa4f2ec), EConversationDebugInfo::Executing);
                
                // About what? 
                Hero.AI.Say(LocText("DIA_WHISTLER_FAVOUR_WHYNOTSELL_15_02"));
                DC(int64(0xdad04a9e7fa4f2ec), EConversationDebugInfo::Done);
                DC(int64(0xdad04a9e7fa4f2ed), EConversationDebugInfo::Executing);
                
                // None of your business.
                Whistler.AI.Say(LocText("DIA_WHISTLER_FAVOUR_WHYNOTSELL_11_03"));
                DC(int64(0xdad04a9e7fa4f2ed), EConversationDebugInfo::Done);
                DC(int64(0xdad04a9e7fa4f2ee), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xdad04a9e7fa4f2ee), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceWhistlerIamnew : UTopic_Hero__OC_STT_WHISTLER_309
        {
            default DebugId = int64(0xdad04a9e7fa4f2cd);
            default Caption = LocText("DIA_WHISTLER_IAMNEW_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceWhistlerIamnew);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xdad04a9e7fa4f2ce), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                }
                
                return Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xdad04a9e7fa4f2cf), EConversationDebugInfo::Executing);
                // Hey. I'm new here.
                Hero.AI.Say(LocText("DIA_WHISTLER_IAMNEW_15_00"));
                DC(int64(0xdad04a9e7fa4f2cf), EConversationDebugInfo::Done);
                DC(int64(0xdad04a9e7fa4f2d0), EConversationDebugInfo::Executing);
                
                // What d'you want?
                Whistler.AI.Say(LocText("DIA_WHISTLER_IAMNEW_11_01"));
                DC(int64(0xdad04a9e7fa4f2d0), EConversationDebugInfo::Done);
                DC(int64(0xdad04a9e7fa4f2d1), EConversationDebugInfo::Executing);
                
                // Just checking who around here could use a hand. 
                Hero.AI.Say(LocText("DIA_WHISTLER_IAMNEW_15_02"));
                DC(int64(0xdad04a9e7fa4f2d1), EConversationDebugInfo::Done);
                DC(int64(0xdad04a9e7fa4f2d2), EConversationDebugInfo::Executing);
                
                // Meanin', you wanna join up with us and are tryin' to ...
                Whistler.AI.Say(LocText("DIA_WHISTLER_IAMNEW_11_03"));
                DC(int64(0xdad04a9e7fa4f2d2), EConversationDebugInfo::Done);
                DC(int64(0xefd96d4c14dc8774), EConversationDebugInfo::Executing);
                
                // Well. Yes.
                Hero.AI.Say(LocText("TEXT_NISEA_20231227_142546"));
                DC(int64(0xefd96d4c14dc8774), EConversationDebugInfo::Done);
                DC(int64(0xefd96d4c14dc8775), EConversationDebugInfo::Executing);
                
                // Nothin' wrong with that. I could put in a good word for ...
                Whistler.AI.Say(LocText("TEXT_NISEA_20231227_142630"));
                DC(int64(0xefd96d4c14dc8775), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_STT_Whistler, Document::UDocumentSegment_Glossary_OC_STT_Whistler_Introduction);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_WHISTLER_BUYMYSWORD, Document::UDocumentSegment_CH1_WHISTLER_BUYMYSWORD_QuestStart);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_BROWNIEPOINTS, Document::UDocumentSegment_CH1_BROWNIEPOINTS_WhistlerStart);
                DC(int64(0x24e2378fdddc6dac), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_BROWNIEPOINTS_BROWNIEPOINTS_OBJ_WHISTLER.StartQuest();
                DC(int64(0x24e2378fdddc6dac), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceWhistlerMyswordSuccess : UTopic_Hero__OC_STT_WHISTLER_309
        {
            default DebugId = int64(0xdad04a9e7fa4f30c);
            default Caption = LocText("DIA_WHISTLER_MYSWORD_SUCCESS_15_00");
            default PriorityRank = 3;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xdad04a9e7fa4f30d), Quest::OldCamp_OCCHAPTER1_WHISTLER_BUYMYSWORD != nullptr && Quest::OldCamp_OCCHAPTER1_WHISTLER_BUYMYSWORD.IsRunning());
                    DB(int64(0xdad04a9e7fa4f30f), Hero != nullptr && Hero.HasItem(UItMw_1H_Sword_Whistler, 1, 0));
                    DB(int64(0xdad04a9e7fa4f30d), Quest::OldCamp_OCCHAPTER1_WHISTLER_BUYMYSWORD != nullptr && Quest::OldCamp_OCCHAPTER1_WHISTLER_BUYMYSWORD.IsRunning());
                    DB(int64(0xdad04a9e7fa4f30e), G1R.Whistler_BuyMySword_Day > G1R.Calendar_TwoDaysAgo);
                    DB(int64(0xdad04a9e7fa4f30f), Hero != nullptr && Hero.HasItem(UItMw_1H_Sword_Whistler, 1, 0));
                }
                
                if (Quest::OldCamp_OCCHAPTER1_WHISTLER_BUYMYSWORD != nullptr && Quest::OldCamp_OCCHAPTER1_WHISTLER_BUYMYSWORD.IsRunning() && Hero != nullptr && Hero.HasItem(UItMw_1H_Sword_Whistler, 1, 0))
                    return true;
                
                if (Quest::OldCamp_OCCHAPTER1_WHISTLER_BUYMYSWORD != nullptr && Quest::OldCamp_OCCHAPTER1_WHISTLER_BUYMYSWORD.IsRunning() && G1R.Whistler_BuyMySword_Day > G1R.Calendar_TwoDaysAgo && Hero != nullptr && Hero.HasItem(UItMw_1H_Sword_Whistler, 1, 0))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xdad04a9e7fa4f310), EConversationDebugInfo::Executing);
                // I got your sword.
                Hero.AI.Say(LocText("DIA_WHISTLER_MYSWORD_SUCCESS_15_00"));
                DC(int64(0xdad04a9e7fa4f310), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_STT_Whistler, Document::UDocumentSegment_Glossary_OC_STT_Whistler_AfterQuest);
                DB(int64(0xa1bd4e1ee72d1d23), Whistler != nullptr && Whistler.IsSitting());
                
                if (Whistler != nullptr && Whistler.IsSitting())
                {
                    DC(int64(0x1e3f7a355ee394fa), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Whistler, UItMw_1H_Sword_Whistler, 1);
                    DC(int64(0x1e3f7a355ee394fa), EConversationDebugInfo::Done);
                    DC(int64(0x7917decfead25141), EConversationDebugInfo::Executing);
                    Whistler.Inventory.EquipMeleeWeaponOfClass(UItMw_1H_Sword_Whistler);
                    DC(int64(0x7917decfead25141), EConversationDebugInfo::Done);
                    DC(int64(0xa1bd4e1ee72d1d2b), EConversationDebugInfo::Executing);
                    Whistler.AI.BeginInteractionWithoutSpot(GameplayTag::Action_Conversation_InspectSwordSeated);
                    DC(int64(0xa1bd4e1ee72d1d2b), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x123f53d08c63cc40), EConversationDebugInfo::Executing);
                    RequestCameraReverseShot();
                    DC(int64(0x123f53d08c63cc40), EConversationDebugInfo::Done);
                    DC(int64(0x1e3f7a355ee394fa), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Whistler, UItMw_1H_Sword_Whistler, 1);
                    DC(int64(0x1e3f7a355ee394fa), EConversationDebugInfo::Done);
                    DC(int64(0x7917decfead25141), EConversationDebugInfo::Executing);
                    Whistler.Inventory.EquipMeleeWeaponOfClass(UItMw_1H_Sword_Whistler);
                    DC(int64(0x7917decfead25141), EConversationDebugInfo::Done);
                    DC(int64(0xa1bd4e1ee72d1d2b), EConversationDebugInfo::Executing);
                    Whistler.AI.BeginInteractionWithoutSpot(GameplayTag::Action_Conversation_InspectSword);
                    DC(int64(0xa1bd4e1ee72d1d2b), EConversationDebugInfo::Done);
                }
                DC(int64(0xdad04a9e7fa4f312), EConversationDebugInfo::Executing);
                // Eh, wasn't too hard, was it? Anyway, one hand washes the ...
                Whistler.AI.Say(LocText("DIA_WHISTLER_MYSWORD_SUCCESS_11_01"), ForceCameraPreset = n"TWO SHOT COWBOY");
                DC(int64(0xdad04a9e7fa4f312), EConversationDebugInfo::Done);
                DB(int64(0xdad04a9e7fa4f314), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None))
                {
                    DC(int64(0xdad04a9e7fa4f315), EConversationDebugInfo::Executing);
                    // If Diego asks what I think about you, you got me vote. ...
                    Whistler.AI.Say(LocText("DIA_WHISTLER_MYSWORD_SUCCESS_11_02"));
                    DC(int64(0xdad04a9e7fa4f315), EConversationDebugInfo::Done);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_WHISTLER_BUYMYSWORD, Document::UDocumentSegment_CH1_WHISTLER_BUYMYSWORD_CompleteJOINOC);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_BROWNIEPOINTS, Document::UDocumentSegment_CH1_BROWNIEPOINTS_WhistlerCompleted);
                }
                else
                {
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_WHISTLER_BUYMYSWORD, Document::UDocumentSegment_CH1_WHISTLER_BUYMYSWORD_CompleteOtherCamp);
                }
                DC(int64(0x1e3f7a355ee394f2), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_WHISTLER_BUYMYSWORD_WHISTLER_BUYSWORD_OBJ_RETURN.SucceedQuest();
                DC(int64(0x1e3f7a355ee394f2), EConversationDebugInfo::Done);
                DC(int64(0x24e2378fdddc6db5), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_BROWNIEPOINTS_BROWNIEPOINTS_OBJ_WHISTLER.SucceedQuest();
                DC(int64(0x24e2378fdddc6db5), EConversationDebugInfo::Done);
                DC(int64(0x98679385be7ac5e3), EConversationDebugInfo::Executing);
                Whistler.ExchangeDailyRoutineToClass(UDailyRoutine_OC_STT_Whistler_309_InspectSword);
                DC(int64(0x98679385be7ac5e3), EConversationDebugInfo::Done);
                DC(int64(0xdad04a9e7fa4f318), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xdad04a9e7fa4f318), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceWhistlerMyswordToolate : UTopic_Hero__OC_STT_WHISTLER_309
        {
            default DebugId = int64(0xdad04a9e7fa4f303);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceWhistlerMyswordToolate);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xdad04a9e7fa4f304), Quest::OldCamp_OCCHAPTER1_WHISTLER_BUYMYSWORD != nullptr && Quest::OldCamp_OCCHAPTER1_WHISTLER_BUYMYSWORD.IsRunning());
                    DB(int64(0xdad04a9e7fa4f305), G1R.Whistler_BuyMySword_Day <= G1R.Calendar_TwoDaysAgo);
                }
                
                if (Quest::OldCamp_OCCHAPTER1_WHISTLER_BUYMYSWORD != nullptr && !Quest::OldCamp_OCCHAPTER1_WHISTLER_BUYMYSWORD.IsRunning())
                    return false;
                
                if (G1R.Whistler_BuyMySword_Day > G1R.Calendar_TwoDaysAgo)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xdad04a9e7fa4f306), EConversationDebugInfo::Executing);
                // Hmph. Look who's come. Thought you could just take me ...
                Whistler.AI.Say(LocText("DIA_WHISTLER_MYSWORD_TOOLATE_11_00"));
                DC(int64(0xdad04a9e7fa4f306), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_WHISTLER_BUYMYSWORD, Document::UDocumentSegment_CH1_WHISTLER_BUYMYSWORD_FailOtherCamp);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_BROWNIEPOINTS, Document::UDocumentSegment_CH1_BROWNIEPOINTS_WhistlerIgnore);
                DC(int64(0x24e2378fdddc6dcc), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_WHISTLER_BUYMYSWORD.FailQuest();
                DC(int64(0x24e2378fdddc6dcc), EConversationDebugInfo::Done);
                DC(int64(0x24e2378fdddc6dd2), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_BROWNIEPOINTS_BROWNIEPOINTS_OBJ_WHISTLER.FailQuest();
                DC(int64(0x24e2378fdddc6dd2), EConversationDebugInfo::Done);
                DC(int64(0x1e3f7a355ee39500), EConversationDebugInfo::Executing);
                Whistler.SetRelationshipTowards(Hero, ERelationship::Angry);
                DC(int64(0x1e3f7a355ee39500), EConversationDebugInfo::Done);
                DC(int64(0x1e3f7a355ee39502), EConversationDebugInfo::Executing);
                Whistler.AI.StartAttackingImmediatelyLootOnly(Hero);
                DC(int64(0x1e3f7a355ee39502), EConversationDebugInfo::Done);
                DC(int64(0xdad04a9e7fa4f30b), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xdad04a9e7fa4f30b), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceWhistlerRunning110 : UTopic_Hero__OC_STT_WHISTLER_309
        {
            default DebugId = int64(0xdad04a9e7fa4f2ef);
            default Caption = LocText("DIA_WHISTLER_RUNNING110_15_00");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceWhistlerRunning110);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xdad04a9e7fa4f2f0), Quest::OldCamp_OCCHAPTER1_WHISTLER_BUYMYSWORD != nullptr && Quest::OldCamp_OCCHAPTER1_WHISTLER_BUYMYSWORD.IsRunning());
                    DB(int64(0xdad04a9e7fa4f2f1), G1R.Fisk_SellSword110 != 0);
                }
                
                if (Quest::OldCamp_OCCHAPTER1_WHISTLER_BUYMYSWORD != nullptr && !Quest::OldCamp_OCCHAPTER1_WHISTLER_BUYMYSWORD.IsRunning())
                    return false;
                
                if (G1R.Fisk_SellSword110 == 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xdad04a9e7fa4f2f2), EConversationDebugInfo::Executing);
                // Fisk will sell me the sword, but he now wants a hundred ...
                Hero.AI.Say(LocText("DIA_WHISTLER_RUNNING110_15_00"));
                DC(int64(0xdad04a9e7fa4f2f2), EConversationDebugInfo::Done);
                DC(int64(0xdad04a9e7fa4f2f3), EConversationDebugInfo::Executing);
                
                // Oh, And now you want another ten nuggets ...
                Whistler.AI.Say(LocText("DIA_WHISTLER_RUNNING110_11_01"));
                DC(int64(0xdad04a9e7fa4f2f3), EConversationDebugInfo::Done);
                DC(int64(0xdad04a9e7fa4f2f4), EConversationDebugInfo::Executing);
                
                // Do you want the sword or not?
                Hero.AI.Say(LocText("DIA_WHISTLER_RUNNING110_15_02"));
                DC(int64(0xdad04a9e7fa4f2f4), EConversationDebugInfo::Done);
                DC(int64(0xdad04a9e7fa4f2f5), EConversationDebugInfo::Executing);
                
                // Fine, here. Now make it snappy. 
                Whistler.AI.Say(LocText("DIA_WHISTLER_RUNNING110_11_03"));
                DC(int64(0xdad04a9e7fa4f2f5), EConversationDebugInfo::Done);
                DC(int64(0x3399d06059b5acc7), EConversationDebugInfo::Executing);
                Whistler.AddItemToInventory(UItMi_Orenugget, 10);
                DC(int64(0x3399d06059b5acc7), EConversationDebugInfo::Done);
                DC(int64(0x1e3f7a355ee39509), EConversationDebugInfo::Executing);
                Whistler.AI.GiveItemTo(Hero, UItMi_Orenugget, 10);
                DC(int64(0x1e3f7a355ee39509), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceWhistlerRunningpayback : UTopic_Hero__OC_STT_WHISTLER_309
        {
            default DebugId = int64(0xdad04a9e7fa4f2f8);
            default Caption = LocText("DIA_WHISTLER_RUNNINGPAYBACK_15_00");
            default PriorityRank = 3;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xdad04a9e7fa4f2f9), Quest::OldCamp_OCCHAPTER1_WHISTLER_BUYMYSWORD != nullptr && Quest::OldCamp_OCCHAPTER1_WHISTLER_BUYMYSWORD.IsRunning());
                }
                
                return Quest::OldCamp_OCCHAPTER1_WHISTLER_BUYMYSWORD != nullptr && Quest::OldCamp_OCCHAPTER1_WHISTLER_BUYMYSWORD.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xdad04a9e7fa4f2fa), EConversationDebugInfo::Executing);
                // Fisk won't sell me that sword. Here are your nuggets.
                Hero.AI.Say(LocText("DIA_WHISTLER_RUNNINGPAYBACK_15_00"));
                DC(int64(0xdad04a9e7fa4f2fa), EConversationDebugInfo::Done);
                DB(int64(0x996512229f472c18), Hero != nullptr && !Hero.HasListenedTo(LocText("DIA_WHISTLER_RUNNING110_15_00")));
                
                if (Hero != nullptr && !Hero.HasListenedTo(LocText("DIA_WHISTLER_RUNNING110_15_00")))
                {
                    DB(int64(0xdad04a9e7fa4f2fc), Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 100, 0));
                    
                    if (Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 100, 0))
                    {
                        DC(int64(0xdad04a9e7fa4f2fd), EConversationDebugInfo::Executing);
                        // Bloody idiot ... we got no use for a fool like you. Sod ...
                        Whistler.AI.Say(LocText("DIA_WHISTLER_RUNNINGPAYBACK_11_01"));
                        DC(int64(0xdad04a9e7fa4f2fd), EConversationDebugInfo::Done);
                        GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_WHISTLER_BUYMYSWORD, Document::UDocumentSegment_CH1_WHISTLER_BUYMYSWORD_FailJOINOC);
                        GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_BROWNIEPOINTS, Document::UDocumentSegment_CH1_BROWNIEPOINTS_WhistlerFailed);
                        DC(int64(0x24e2378fdddc6dbe), EConversationDebugInfo::Executing);
                        Quest::OldCamp_OCCHAPTER1_WHISTLER_BUYMYSWORD.FailQuest();
                        DC(int64(0x24e2378fdddc6dbe), EConversationDebugInfo::Done);
                        DC(int64(0x24e2378fdddc6dc4), EConversationDebugInfo::Executing);
                        Quest::OldCamp_OCCHAPTER1_BROWNIEPOINTS_BROWNIEPOINTS_OBJ_WHISTLER.FailQuest();
                        DC(int64(0x24e2378fdddc6dc4), EConversationDebugInfo::Done);
                        DC(int64(0x1e3f7a355ee39514), EConversationDebugInfo::Executing);
                        Hero.AI.GiveItemTo(Whistler, UItMi_Orenugget, 100);
                        DC(int64(0x1e3f7a355ee39514), EConversationDebugInfo::Done);
                        DC(int64(0x1e3f7a355ee39516), EConversationDebugInfo::Executing);
                        G1R.Whistler_BuyMySword = 1;
                        DC(int64(0x1e3f7a355ee39516), EConversationDebugInfo::Done);
                        
                        Other.Remember(n"choice_whistler_runningpayback_exit_1");
                        DC(int64(0xdad04a9e7fa4f300), EConversationDebugInfo::Executing);
                        EndConversation();
                        DC(int64(0xdad04a9e7fa4f300), EConversationDebugInfo::Done);
                        return;
                    }
                    else
                    {
                        DC(int64(0xdad04a9e7fa4f301), EConversationDebugInfo::Executing);
                        // Where exactly are me nuggs? 'Cause I ain't seein' none. ...
                        Whistler.AI.Say(LocText("DIA_WHISTLER_RUNNINGPAYBACK_11_02"));
                        DC(int64(0xdad04a9e7fa4f301), EConversationDebugInfo::Done);
                        
                        Other.Remember(n"choice_whistler_runningpayback_exit_2");
                        DC(int64(0xdad04a9e7fa4f302), EConversationDebugInfo::Executing);
                        EndConversation();
                        DC(int64(0xdad04a9e7fa4f302), EConversationDebugInfo::Done);
                        return;
                    }
                }
                else
                {
                    DB(int64(0x996512229f472c1c), Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 110, 0));
                    
                    if (Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 110, 0))
                    {
                        DC(int64(0x996512229f472c22), EConversationDebugInfo::Executing);
                        // Bloody idiot ... we got no use for a fool like you. Sod ...
                        Whistler.AI.Say(LocText("DIA_WHISTLER_RUNNINGPAYBACK_11_01"));
                        DC(int64(0x996512229f472c22), EConversationDebugInfo::Done);
                        GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_WHISTLER_BUYMYSWORD, Document::UDocumentSegment_CH1_WHISTLER_BUYMYSWORD_FailJOINOC);
                        GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_BROWNIEPOINTS, Document::UDocumentSegment_CH1_BROWNIEPOINTS_WhistlerFailed);
                        DC(int64(0x24e2378fdddc6dbe), EConversationDebugInfo::Executing);
                        Quest::OldCamp_OCCHAPTER1_WHISTLER_BUYMYSWORD.FailQuest();
                        DC(int64(0x24e2378fdddc6dbe), EConversationDebugInfo::Done);
                        DC(int64(0x24e2378fdddc6dc4), EConversationDebugInfo::Executing);
                        Quest::OldCamp_OCCHAPTER1_BROWNIEPOINTS_BROWNIEPOINTS_OBJ_WHISTLER.FailQuest();
                        DC(int64(0x24e2378fdddc6dc4), EConversationDebugInfo::Done);
                        DC(int64(0x1e3f7a355ee39514), EConversationDebugInfo::Executing);
                        Hero.AI.GiveItemTo(Whistler, UItMi_Orenugget, 110);
                        DC(int64(0x1e3f7a355ee39514), EConversationDebugInfo::Done);
                        DC(int64(0x1e3f7a355ee39516), EConversationDebugInfo::Executing);
                        G1R.Whistler_BuyMySword = 1;
                        DC(int64(0x1e3f7a355ee39516), EConversationDebugInfo::Done);
                        
                        Other.Remember(n"choice_whistler_runningpayback_exit_3");
                        DC(int64(0x996512229f472c3b), EConversationDebugInfo::Executing);
                        EndConversation();
                        DC(int64(0x996512229f472c3b), EConversationDebugInfo::Done);
                        return;
                    }
                    else
                    {
                        DC(int64(0x996512229f472c35), EConversationDebugInfo::Executing);
                        // Where exactly are me nuggs? 'Cause I ain't seein' none. ...
                        Whistler.AI.Say(LocText("DIA_WHISTLER_RUNNINGPAYBACK_11_02"));
                        DC(int64(0x996512229f472c35), EConversationDebugInfo::Done);
                        
                        Other.Remember(n"choice_whistler_runningpayback_exit_4");
                        DC(int64(0x996512229f472c36), EConversationDebugInfo::Executing);
                        EndConversation();
                        DC(int64(0x996512229f472c36), EConversationDebugInfo::Done);
                        return;
                    }
                }
            }
        }
        
        
        class UChoiceWhistlerStandardkap1 : UTopic_Hero__OC_STT_WHISTLER_309
        {
            default DebugId = int64(0xdad04a9e7fa4f319);
            default Caption = LocText("DIA_WHISTLER_STANDARDKAP1_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xdad04a9e7fa4f31a), Quest::OldCamp_OCCHAPTER1_WHISTLER_BUYMYSWORD != nullptr && Quest::OldCamp_OCCHAPTER1_WHISTLER_BUYMYSWORD.HasSucceeded());
                }
                
                return Quest::OldCamp_OCCHAPTER1_WHISTLER_BUYMYSWORD != nullptr && Quest::OldCamp_OCCHAPTER1_WHISTLER_BUYMYSWORD.HasSucceeded();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xdad04a9e7fa4f31b), EConversationDebugInfo::Executing);
                // How's it going?
                Hero.AI.Say(LocText("DIA_WHISTLER_STANDARDKAP1_15_00"));
                DC(int64(0xdad04a9e7fa4f31b), EConversationDebugInfo::Done);
                DC(int64(0xdad04a9e7fa4f31c), EConversationDebugInfo::Executing);
                
                // Good. Like I said, one hand washes the other - Diego ...
                Whistler.AI.Say(LocText("DIA_WHISTLER_STANDARDKAP1_11_01"));
                DC(int64(0xdad04a9e7fa4f31c), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */