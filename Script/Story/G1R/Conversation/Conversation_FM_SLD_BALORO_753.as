#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_FM_SLD_BALORO_753 : UConversationCharacterSettings
        {
            default ForCharacter = n"FM_SLD_BALORO_753";
        }
        
        
        class UTopic_Hero__FM_SLD_BALORO_753 : UG1RDialogTopic
        {
            default ForCharacter = n"FM_SLD_BALORO_753";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetBaloro() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceSld753Baloro : UTopic_Hero__FM_SLD_BALORO_753
        {
            default DebugId = int64(0x6a46c7e465baad0f);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::WalkToOther;
            
            default Rules.HideIfKnows(UChoiceSld753Baloro);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9c0dc3a43e493330), EConversationDebugInfo::Executing);
                // Hey, you there! What's the matter with you?
                Baloro.AI.Say(LocText("DIA_SLD_753_BALORO_INTRO_08_01"));
                DC(int64(0x9c0dc3a43e493330), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_FM_SLD_BALORO, Document::UDocumentSegment_Glossary_FM_SLD_BALORO_Introduction);
            }
        }
        
        
        class UChoiceSld753BaloroAngebotdochannehmen : UTopic_Hero__FM_SLD_BALORO_753
        {
            default DebugId = int64(0x9c0dc3a43e4933a6);
            default Caption = LocText("DIA_SLD_753_BALORO_ANGEBOTDOCHANNEHMEN_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceSld753BaloroAngebotdochannehmen);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x9c0dc3a43e4933a7), G1R.Baloro_SC_choice == 1);
                }
                
                return G1R.Baloro_SC_choice == 1;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9c0dc3a43e4933a8), EConversationDebugInfo::Executing);
                // I gave it some thought - I'm interested in that weapon.
                Hero.AI.Say(LocText("DIA_SLD_753_BALORO_ANGEBOTDOCHANNEHMEN_INFO_15_01"));
                DC(int64(0x9c0dc3a43e4933a8), EConversationDebugInfo::Done);
                DC(int64(0x9c0dc3a43e4933a9), EConversationDebugInfo::Executing);
                
                // Too late! You had your chance.
                Baloro.AI.Say(LocText("DIA_SLD_753_BALORO_ANGEBOTDOCHANNEHMEN_INFO_08_01"));
                DC(int64(0x9c0dc3a43e4933a9), EConversationDebugInfo::Done);
                DC(int64(0x9c0dc3a43e4933aa), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x9c0dc3a43e4933aa), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceSld753BaloroHabsdabei : UTopic_Hero__FM_SLD_BALORO_753
        {
            default DebugId = int64(0x9c0dc3a43e493369);
            default Caption = LocText("DIA_SLD_753_BALORO_HABSDABEI_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceSld753BaloroWorumgehts);
            default Rules.HideIfKnows(UChoiceSld753BaloroHabsdabei);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x9c0dc3a43e49336a), Quest::FreeMine_BALOROS_WAFFE != nullptr && Quest::FreeMine_BALOROS_WAFFE.IsRunning());
                    DB(int64(0x9c0dc3a43e49336b), G1R.Baloro_SC_choice == 0);
                    DB(int64(0x9c0dc3a43e49336c), Hero != nullptr && Hero.HasItem(UItFo_Apple, 5, 0));
                    DB(int64(0x9c0dc3a43e49336d), Hero != nullptr && Hero.HasItem(UItFo_Potion_Booze, 2, 0));
                    DB(int64(0x9c0dc3a43e49336e), Hero != nullptr && Hero.HasItem(UItFo_Potion_Beer, 5, 0));
                    DB(int64(0x9c0dc3a43e49336f), Hero != nullptr && Hero.HasItem(UItFo_Loaf, 3, 0));
                    DB(int64(0x9c0dc3a43e493370), Hero != nullptr && Hero.HasItem(UItFo_Cheese, 2, 0));
                    DB(int64(0x9c0dc3a43e493371), Hero != nullptr && Hero.HasItem(UItFo_Wineberrys_01, 2, 0));
                }
                
                if (Quest::FreeMine_BALOROS_WAFFE != nullptr && !Quest::FreeMine_BALOROS_WAFFE.IsRunning())
                    return false;
                
                if (G1R.Baloro_SC_choice != 0)
                    return false;
                
                if (Hero != nullptr && !Hero.HasItem(UItFo_Apple, 5, 0))
                    return false;
                
                if (Hero != nullptr && !Hero.HasItem(UItFo_Potion_Booze, 2, 0))
                    return false;
                
                if (Hero != nullptr && !Hero.HasItem(UItFo_Potion_Beer, 5, 0))
                    return false;
                
                if (Hero != nullptr && !Hero.HasItem(UItFo_Loaf, 3, 0))
                    return false;
                
                if (Hero != nullptr && !Hero.HasItem(UItFo_Cheese, 2, 0))
                    return false;
                
                if (Hero != nullptr && !Hero.HasItem(UItFo_Wineberrys_01, 2, 0))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9c0dc3a43e493372), EConversationDebugInfo::Executing);
                // I got your stuff. 
                Hero.AI.Say(LocText("DIA_SLD_753_BALORO_HABSDABEI_INFO_15_01"));
                DC(int64(0x9c0dc3a43e493372), EConversationDebugInfo::Done);
                DC(int64(0x9c0dc3a43e493373), EConversationDebugInfo::Executing);
                
                // Show me. 
                Baloro.AI.Say(LocText("DIA_SLD_753_BALORO_HABSDABEI_INFO_08_01"));
                DC(int64(0x9c0dc3a43e493373), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_FM_SLD_BALORO, Document::UDocumentSegment_Glossary_FM_SLD_BALORO_Lie);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_BALOROS_WAFFE, Document::UDocumentSegment_CH1_BALOROS_WAFFE_Completed);
                DC(int64(0x9c0dc3a43e493375), EConversationDebugInfo::Executing);
                Hero.AI.GiveItemTo(Baloro, UItFo_Apple, 5);
                DC(int64(0x9c0dc3a43e493375), EConversationDebugInfo::Done);
                DC(int64(0x9c0dc3a43e493376), EConversationDebugInfo::Executing);
                Hero.RemoveItemFromInventory(UItFo_Potion_Booze, 2, 0);
                DC(int64(0x9c0dc3a43e493376), EConversationDebugInfo::Done);
                DC(int64(0x9c0dc3a43e493377), EConversationDebugInfo::Executing);
                Hero.RemoveItemFromInventory(UItFo_Potion_Beer, 5, 0);
                DC(int64(0x9c0dc3a43e493377), EConversationDebugInfo::Done);
                DC(int64(0x9c0dc3a43e493378), EConversationDebugInfo::Executing);
                Hero.RemoveItemFromInventory(UItFo_Loaf, 3, 0);
                DC(int64(0x9c0dc3a43e493378), EConversationDebugInfo::Done);
                DC(int64(0x9c0dc3a43e493379), EConversationDebugInfo::Executing);
                Hero.RemoveItemFromInventory(UItFo_Cheese, 2, 0);
                DC(int64(0x9c0dc3a43e493379), EConversationDebugInfo::Done);
                DC(int64(0x9c0dc3a43e49337a), EConversationDebugInfo::Executing);
                Hero.RemoveItemFromInventory(UItFo_Wineberrys_01, 2, 0);
                DC(int64(0x9c0dc3a43e49337a), EConversationDebugInfo::Done);
                DC(int64(0x9c0dc3a43e49337b), EConversationDebugInfo::Executing);
                Baloro.AddItemToInventory(UItFo_Apple, 5);
                DC(int64(0x9c0dc3a43e49337b), EConversationDebugInfo::Done);
                DC(int64(0x9c0dc3a43e49337c), EConversationDebugInfo::Executing);
                Baloro.AddItemToInventory(UItFo_Potion_Booze, 2);
                DC(int64(0x9c0dc3a43e49337c), EConversationDebugInfo::Done);
                DC(int64(0x9c0dc3a43e49337d), EConversationDebugInfo::Executing);
                Baloro.AddItemToInventory(UItFo_Potion_Beer, 5);
                DC(int64(0x9c0dc3a43e49337d), EConversationDebugInfo::Done);
                DC(int64(0x9c0dc3a43e49337e), EConversationDebugInfo::Executing);
                Baloro.AddItemToInventory(UItFo_Loaf, 3);
                DC(int64(0x9c0dc3a43e49337e), EConversationDebugInfo::Done);
                DC(int64(0x9c0dc3a43e49337f), EConversationDebugInfo::Executing);
                Baloro.AddItemToInventory(UItFo_Cheese, 2);
                DC(int64(0x9c0dc3a43e49337f), EConversationDebugInfo::Done);
                DC(int64(0x9c0dc3a43e493380), EConversationDebugInfo::Executing);
                Baloro.AddItemToInventory(UItFo_Wineberrys_01, 2);
                DC(int64(0x9c0dc3a43e493380), EConversationDebugInfo::Done);
                DC(int64(0x9c0dc3a43e493381), EConversationDebugInfo::Executing);
                // Here. 
                Hero.AI.Say(LocText("DIA_SLD_753_BALORO_HABSDABEI_INFO_15_02"));
                DC(int64(0x9c0dc3a43e493381), EConversationDebugInfo::Done);
                DC(int64(0x9c0dc3a43e493382), EConversationDebugInfo::Executing);
                
                // Thanks. Mm, yeah ... yeah, that looks good.
                Baloro.AI.Say(LocText("DIA_SLD_753_BALORO_HABSDABEI_INFO_08_02"));
                DC(int64(0x9c0dc3a43e493382), EConversationDebugInfo::Done);
                DC(int64(0x9c0dc3a43e493383), EConversationDebugInfo::Executing);
                
                // Your turn. Give me that weapon.
                Hero.AI.Say(LocText("DIA_SLD_753_BALORO_HABSDABEI_INFO_15_03"));
                DC(int64(0x9c0dc3a43e493383), EConversationDebugInfo::Done);
                DC(int64(0x9c0dc3a43e493384), EConversationDebugInfo::Executing);
                
                // No. 
                Baloro.AI.Say(LocText("DIA_SLD_753_BALORO_HABSDABEI_INFO_08_03"));
                DC(int64(0x9c0dc3a43e493384), EConversationDebugInfo::Done);
                DC(int64(0x9c0dc3a43e493385), EConversationDebugInfo::Executing);
                
                // What?
                Hero.AI.Say(LocText("DIA_SLD_753_BALORO_HABSDABEI_INFO_15_04"));
                DC(int64(0x9c0dc3a43e493385), EConversationDebugInfo::Done);
                DC(int64(0x9c0dc3a43e493386), EConversationDebugInfo::Executing);
                
                // Come on, mate, you really didn't see that comin'? ...
                Baloro.AI.Say(LocText("DIA_SLD_753_BALORO_HABSDABEI_INFO_08_04"));
                DC(int64(0x9c0dc3a43e493386), EConversationDebugInfo::Done);
                DC(int64(0x9c0dc3a43e493387), EConversationDebugInfo::Executing);
                // Honestly, I'm surprised you're still alive. Let me tell ...
                Baloro.AI.Say(LocText("DIA_SLD_753_BALORO_HABSDABEI_INFO_08_05"));
                DC(int64(0x9c0dc3a43e493387), EConversationDebugInfo::Done);
                DC(int64(0x9c0dc3a43e493388), EConversationDebugInfo::Executing);
                // But, hey, don't be so glum - you brought me and me lads ...
                Baloro.AI.Say(LocText("DIA_SLD_753_BALORO_HABSDABEI_INFO_08_06"));
                DC(int64(0x9c0dc3a43e493388), EConversationDebugInfo::Done);
                DC(int64(0x9c0dc3a43e493389), EConversationDebugInfo::Executing);
                Quest::FreeMine_BALOROS_WAFFE_BALOROS_WAFFE_OBJ_DELIVER.SucceedQuest();
                DC(int64(0x9c0dc3a43e493389), EConversationDebugInfo::Done);
                DC(int64(0x9c0dc3a43e49338c), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x9c0dc3a43e49338c), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceSld753BaloroHabsnichtdabei : UTopic_Hero__FM_SLD_BALORO_753
        {
            default DebugId = int64(0x9c0dc3a43e493362);
            default Caption = LocText("DIA_SLD_753_BALORO_HABSNICHTDABEI_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceSld753BaloroWorumgehts);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x9c0dc3a43e493363), Quest::FreeMine_BALOROS_WAFFE != nullptr && Quest::FreeMine_BALOROS_WAFFE.IsRunning());
                }
                
                return Quest::FreeMine_BALOROS_WAFFE != nullptr && Quest::FreeMine_BALOROS_WAFFE.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9c0dc3a43e493364), EConversationDebugInfo::Executing);
                // I couldn't get your stuff. Remind me, what did you need? 
                Hero.AI.Say(LocText("DIA_SLD_753_BALORO_HABSNICHTDABEI_INFO_15_01"));
                DC(int64(0x9c0dc3a43e493364), EConversationDebugInfo::Done);
                DC(int64(0x9c0dc3a43e493365), EConversationDebugInfo::Executing);
                
                // Ahh, can you write? Maybe jot it down.
                Baloro.AI.Say(LocText("DIA_SLD_753_BALORO_HABSNICHTDABEI_INFO_08_01"));
                DC(int64(0x9c0dc3a43e493365), EConversationDebugInfo::Done);
                DC(int64(0x9c0dc3a43e493366), EConversationDebugInfo::Executing);
                // I need five apples, two bottles of rice brandy, five ...
                Baloro.AI.Say(LocText("DIA_SLD_753_BALORO_HABSNICHTDABEI_INFO_08_02"));
                DC(int64(0x9c0dc3a43e493366), EConversationDebugInfo::Done);
                DC(int64(0x9c0dc3a43e493367), EConversationDebugInfo::Executing);
                
                // Yeah. I'll be back. 
                Hero.AI.Say(LocText("DIA_SLD_753_BALORO_HABSNICHTDABEI_INFO_15_02"));
                DC(int64(0x9c0dc3a43e493367), EConversationDebugInfo::Done);
                DC(int64(0x9c0dc3a43e493368), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x9c0dc3a43e493368), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceSld753BaloroLetztesWort : UTopic_Hero__FM_SLD_BALORO_753
        {
            default DebugId = int64(0x9c0dc3a43e49338d);
            default Caption = LocText("DIA_SLD_753_BALORO_LETZTES_WORT_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceSld753BaloroLetztesWort);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x9c0dc3a43e49338e), Quest::FreeMine_BALOROS_WAFFE != nullptr && Quest::FreeMine_BALOROS_WAFFE.HasSucceeded());
                }
                
                return Quest::FreeMine_BALOROS_WAFFE != nullptr && Quest::FreeMine_BALOROS_WAFFE.HasSucceeded();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9c0dc3a43e49338f), EConversationDebugInfo::Executing);
                // Come on, man, you can't do that.
                Hero.AI.Say(LocText("DIA_SLD_753_BALORO_LETZTES_WORT_INFO_15_01"));
                DC(int64(0x9c0dc3a43e49338f), EConversationDebugInfo::Done);
                DC(int64(0x9c0dc3a43e493390), EConversationDebugInfo::Executing);
                
                // I just did. Now piss off and go whine to someone else, ...
                Baloro.AI.Say(LocText("DIA_SLD_753_BALORO_LETZTES_WORT_INFO_08_01"));
                DC(int64(0x9c0dc3a43e493390), EConversationDebugInfo::Done);
                DC(int64(0x9c0dc3a43e493391), EConversationDebugInfo::Executing);
                G1R.Baloro_SC_wantsToKnow = 1;
                DC(int64(0x9c0dc3a43e493391), EConversationDebugInfo::Done);
                DC(int64(0x9c0dc3a43e493392), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x9c0dc3a43e493392), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceSld753BaloroScWillsWissen : UTopic_Hero__FM_SLD_BALORO_753
        {
            default DebugId = int64(0x9c0dc3a43e493393);
            default Caption = LocText("DIA_SLD_753_BALORO_SC_WILLS_WISSEN_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceSld753BaloroScWillsWissen);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xc9872fab972fbcb2), G1R.Baloro_SC_wantsToKnow == 1);
                }
                
                return G1R.Baloro_SC_wantsToKnow == 1;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9c0dc3a43e493395), EConversationDebugInfo::Executing);
                // Time I wipe that stupid grin off your face. 
                Hero.AI.Say(LocText("DIA_SLD_753_BALORO_SC_WILLS_WISSEN_INFO_15_01"));
                DC(int64(0x9c0dc3a43e493395), EConversationDebugInfo::Done);
                DC(int64(0x9c0dc3a43e493396), EConversationDebugInfo::Executing);
                
                // Careful, green blood. Thin ice. 
                Baloro.AI.Say(LocText("DIA_SLD_753_BALORO_SC_WILLS_WISSEN_INFO_08_01"));
                DC(int64(0x9c0dc3a43e493396), EConversationDebugInfo::Done);
                DC(int64(0x9c0dc3a43e493397), EConversationDebugInfo::Executing);
                
                // Did I scare you?
                Hero.AI.Say(LocText("DIA_SLD_753_BALORO_SC_WILLS_WISSEN_INFO_15_02"));
                DC(int64(0x9c0dc3a43e493397), EConversationDebugInfo::Done);
                DC(int64(0x9c0dc3a43e493398), EConversationDebugInfo::Executing);
                
                // ... All right. You asked for it. 
                Baloro.AI.Say(LocText("DIA_SLD_753_BALORO_SC_WILLS_WISSEN_INFO_08_02"));
                DC(int64(0x9c0dc3a43e493398), EConversationDebugInfo::Done);
                DC(int64(0x9c0dc3a43e493399), EConversationDebugInfo::Executing);
                Baloro.AI.StartAttackingImmediatelyLootOnly(Hero);
                DC(int64(0x9c0dc3a43e493399), EConversationDebugInfo::Done);
                DC(int64(0x4a4bf1626ad6386c), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x4a4bf1626ad6386c), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceSld753BaloroWasmeinstdu : UTopic_Hero__FM_SLD_BALORO_753
        {
            default DebugId = int64(0x9c0dc3a43e493331);
            default Caption = LocText("DIA_SLD_753_BALORO_WASMEINSTDU_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceSld753Baloro);
            default Rules.HideIfKnows(UChoiceSld753BaloroWasmeinstdu);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9c0dc3a43e493332), EConversationDebugInfo::Executing);
                // What do you mean?
                Hero.AI.Say(LocText("DIA_SLD_753_BALORO_WASMEINSTDU_INFO_15_01"));
                DC(int64(0x9c0dc3a43e493332), EConversationDebugInfo::Done);
                DC(int64(0x9c0dc3a43e493333), EConversationDebugInfo::Executing);
                
                // You seem like you're lookin' for somethin'. Am I right?
                Baloro.AI.Say(LocText("DIA_SLD_753_BALORO_WASMEINSTDU_INFO_08_02"));
                DC(int64(0x9c0dc3a43e493333), EConversationDebugInfo::Done);
                DC(int64(0x9c0dc3a43e493334), EConversationDebugInfo::Executing);
                
                // Depends. Why?
                Hero.AI.Say(LocText("DIA_SLD_753_BALORO_WASMEINSTDU_INFO_15_03"));
                DC(int64(0x9c0dc3a43e493334), EConversationDebugInfo::Done);
                DC(int64(0x9c0dc3a43e493335), EConversationDebugInfo::Executing);
                
                // Well, as it happens, I'm peddlin' some stuff down here. ...
                Baloro.AI.Say(LocText("DIA_SLD_753_BALORO_WASMEINSTDU_INFO_08_04"));
                DC(int64(0x9c0dc3a43e493335), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceSld753BaloroWorumgehts : UTopic_Hero__FM_SLD_BALORO_753
        {
            default DebugId = int64(0x9c0dc3a43e493336);
            default Caption = LocText("DIA_SLD_753_BALORO_WORUMGEHTS_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceSld753BaloroWasmeinstdu);
            default Rules.HideIfKnows(UChoiceSld753BaloroWorumgehts);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x9c0dc3a43e493337), G1R.Baloro_SC_choice == 0);
                    DB(int64(0x9c0dc3a43e493338), Quest::FreeMine_BALOROS_WAFFE != nullptr && !Quest::FreeMine_BALOROS_WAFFE.HasBeenStarted());
                }
                
                if (G1R.Baloro_SC_choice != 0)
                    return false;
                
                if (Quest::FreeMine_BALOROS_WAFFE != nullptr && Quest::FreeMine_BALOROS_WAFFE.HasBeenStarted())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9c0dc3a43e493339), EConversationDebugInfo::Executing);
                
                // What sort of "stuff" are we talking about?
                Hero.AI.Say(LocText("DIA_SLD_753_BALORO_WORUMGEHTS_INFO_15_01"));
                DC(int64(0x9c0dc3a43e493339), EConversationDebugInfo::Done);
                DC(int64(0x9c0dc3a43e49333a), EConversationDebugInfo::Executing);
                
                // Depends. What do you NEED?
                Baloro.AI.Say(LocText("DIA_SLD_753_BALORO_WORUMGEHTS_INFO_08_01"));
                DC(int64(0x9c0dc3a43e49333a), EConversationDebugInfo::Done);
                DC(int64(0x9c0dc3a43e49333b), EConversationDebugInfo::Executing);
                
                // How about a good sword, a sturdy armor, or access to the ...
                Hero.AI.Say(LocText("DIA_SLD_753_BALORO_WORUMGEHTS_INFO_15_02"));
                DC(int64(0x9c0dc3a43e49333b), EConversationDebugInfo::Done);
                DC(int64(0x9c0dc3a43e49333c), EConversationDebugInfo::Executing);
                
                // Aw, come on, man, is that all? You gotta think bigger!
                Baloro.AI.Say(LocText("DIA_SLD_753_BALORO_WORUMGEHTS_INFO_08_02"));
                DC(int64(0x9c0dc3a43e49333c), EConversationDebugInfo::Done);
                DC(int64(0x9c0dc3a43e49333d), EConversationDebugInfo::Executing);
                // I have somethin' in me stock that even Innos would kneel ...
                Baloro.AI.Say(LocText("DIA_SLD_753_BALORO_WORUMGEHTS_INFO_08_03"));
                DC(int64(0x9c0dc3a43e49333d), EConversationDebugInfo::Done);
                DC(int64(0x9c0dc3a43e49333e), EConversationDebugInfo::Executing);
                // And all I want in return is a teeny, tiny favor.
                Baloro.AI.Say(LocText("DIA_SLD_753_BALORO_WORUMGEHTS_INFO_08_04"));
                DC(int64(0x9c0dc3a43e49333e), EConversationDebugInfo::Done);
                Subdialog(
                    UChoiceSld753BaloroWorumgehtsJa,
                    UTopic_Baloro_78345
                );
                DB(int64(0x818ca5c6391e8cc7), G1R.Baloro_SC_choice == 0);
                
                if (G1R.Baloro_SC_choice == 0)
                {
                    DC(int64(0x9c0dc3a43e493352), EConversationDebugInfo::Executing);
                    // Nah, sorry. Not interested.
                    Hero.AI.Say(LocText("DIA_SLD_753_BALORO_EXIT_INFO_15_01"));
                    DC(int64(0x9c0dc3a43e493352), EConversationDebugInfo::Done);
                    DC(int64(0x9c0dc3a43e493353), EConversationDebugInfo::Executing);
                    
                    // Your loss. You had your chance.
                    Baloro.AI.Say(LocText("DIA_SLD_753_BALORO_EXIT_INFO_08_02"));
                    DC(int64(0x9c0dc3a43e493353), EConversationDebugInfo::Done);
                    DC(int64(0x9c0dc3a43e493354), EConversationDebugInfo::Executing);
                    G1R.Baloro_SC_choice = 1;
                    DC(int64(0x9c0dc3a43e493354), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x9c0dc3a43e493355), EConversationDebugInfo::Executing);
                    // Sorry, I don't have time for this.
                    Hero.AI.Say(LocText("DIA_SLD_753_BALORO_EXIT_INFO_15_03"));
                    DC(int64(0x9c0dc3a43e493355), EConversationDebugInfo::Done);
                    DC(int64(0x9c0dc3a43e493356), EConversationDebugInfo::Executing);
                    
                    // Busy bloodfly, are ya? All right then, your loss.
                    Baloro.AI.Say(LocText("DIA_SLD_753_BALORO_EXIT_INFO_08_04"));
                    DC(int64(0x9c0dc3a43e493356), EConversationDebugInfo::Done);
                }
                DC(int64(0x9c0dc3a43e493357), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x9c0dc3a43e493357), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceSld753BaloroWorumgehtsJa : UTopic_Hero__FM_SLD_BALORO_753
        {
            default DebugId = int64(0xe8603e87342bc0e8);
            default Caption = LocText("DIA_SLD_753_BALORO_WORUMGEHTS_JA_15_05");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9c0dc3a43e493341), EConversationDebugInfo::Executing);
                // How "tiny" are we talking?
                Hero.AI.Say(LocText("DIA_SLD_753_BALORO_WORUMGEHTS_JA_15_05"));
                DC(int64(0x9c0dc3a43e493341), EConversationDebugInfo::Done);
                DC(int64(0x9c0dc3a43e493342), EConversationDebugInfo::Executing);
                
                // Simple, mate.
                Baloro.AI.Say(LocText("DIA_SLD_753_BALORO_WORUMGEHTS_JA_08_03"));
                DC(int64(0x9c0dc3a43e493342), EConversationDebugInfo::Done);
                DC(int64(0x9c0dc3a43e493343), EConversationDebugInfo::Executing);
                // You bring me five apples, two bottles of rice schnapps, ...
                Baloro.AI.Say(LocText("DIA_SLD_753_BALORO_WORUMGEHTS_JA_08_04"));
                DC(int64(0x9c0dc3a43e493343), EConversationDebugInfo::Done);
                DC(int64(0x9c0dc3a43e493344), EConversationDebugInfo::Executing);
                // Trust me, you ain't gonna regret it. As I said, that ...
                Baloro.AI.Say(LocText("DIA_SLD_753_BALORO_WORUMGEHTS_JA_08_05"));
                DC(int64(0x9c0dc3a43e493344), EConversationDebugInfo::Done);
                Subdialog(
                    UChoiceSld753BaloroWorumgehtsJaklar,
                    UChoiceSld753BaloroExitInfo,
                    UChoiceSld753BaloroExitInfo1
                );
            }
        }
        
        
        class UTopic_Baloro_78345 : UTopic_Hero__FM_SLD_BALORO_753
        {
            default DebugId = int64(0x818ca5c6391e8cc0);
            default Caption = LocText("TEXT_GROMEU_20240122_142431");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Baloro_78345);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                
            }
        }
        
        
        class UChoiceSld753BaloroWorumgehtsJaklar : UTopic_Hero__FM_SLD_BALORO_753
        {
            default DebugId = int64(0xe8603e87342bc0ea);
            default Caption = LocText("DIA_SLD_753_BALORO_WORUMGEHTS_JA_15_06");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9c0dc3a43e493347), EConversationDebugInfo::Executing);
                // Okay. I'll see what I can do.
                Hero.AI.Say(LocText("DIA_SLD_753_BALORO_WORUMGEHTS_JA_15_06"));
                DC(int64(0x9c0dc3a43e493347), EConversationDebugInfo::Done);
                DC(int64(0x9c0dc3a43e493348), EConversationDebugInfo::Executing);
                
                // Music to me ears! Then best get to it.
                Baloro.AI.Say(LocText("DIA_SLD_753_BALORO_WORUMGEHTS_JA_08_06"));
                DC(int64(0x9c0dc3a43e493348), EConversationDebugInfo::Done);
                DC(int64(0x9c0dc3a43e493349), EConversationDebugInfo::Executing);
                // Remember: five apples, two bottles of rice brandy, five ...
                Baloro.AI.Say(LocText("DIA_SLD_753_BALORO_WORUMGEHTS_JA_08_07"));
                DC(int64(0x9c0dc3a43e493349), EConversationDebugInfo::Done);
                DC(int64(0x9c0dc3a43e49334a), EConversationDebugInfo::Executing);
                
                // Got it. 
                Hero.AI.Say(LocText("DIA_SLD_753_BALORO_WORUMGEHTS_JA_15_07"));
                DC(int64(0x9c0dc3a43e49334a), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_BALOROS_WAFFE, Document::UDocumentSegment_CH1_BALOROS_WAFFE_Start);
                DC(int64(0x9c0dc3a43e49334c), EConversationDebugInfo::Executing);
                Quest::FreeMine_BALOROS_WAFFE.StartQuest();
                DC(int64(0x9c0dc3a43e49334c), EConversationDebugInfo::Done);
                DC(int64(0x9c0dc3a43e49334d), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x9c0dc3a43e49334d), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceSld753BaloroExitInfo : UTopic_Hero__FM_SLD_BALORO_753
        {
            default DebugId = int64(0xe8603e87342bc0f3);
            default Caption = LocText("TEXT_CHOICE_SLD_753_BALORO_EXIT_INFO");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                
            }
        }
        
        
        class UChoiceSld753BaloroExitInfo1 : UTopic_Hero__FM_SLD_BALORO_753
        {
            default DebugId = int64(0xe8603e87342bc100);
            default Caption = LocText("TEXT_CHOICE_SLD_753_BALORO_EXIT_INFO_1");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */