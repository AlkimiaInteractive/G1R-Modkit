#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OC_GRD_JACKAL_201 : UConversationCharacterSettings
        {
            default ForCharacter = n"OC_GRD_JACKAL_201";
        }
        
        
        class UTopic_Hero__OC_GRD_JACKAL_201 : UG1RDialogTopic
        {
            default ForCharacter = n"OC_GRD_JACKAL_201";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetJackal() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceGrd201JackalWelcome : UTopic_Hero__OC_GRD_JACKAL_201
        {
            default DebugId = int64(0xf7b8fc5a4ab1be35);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::WalkToOther;
            
            default Rules.HideIfKnows(UChoiceGrd201JackalWelcome);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf7b8fc5a4ab1be36), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard));
                    DB(int64(0xec5731847529d7a2), G1R.FMTaken == 0);
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard))
                    return false;
                
                if (G1R.FMTaken != 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf7b8fc5a4ab1be37), EConversationDebugInfo::Executing);
                // Well, well, look who's joined the ranks. Not bad, ...
                Jackal.AI.Say(LocText("GRD_201_JACKAL_WELCOME_INFO_07_01"));
                DC(int64(0xf7b8fc5a4ab1be37), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceJackalExit : UTopic_Hero__OC_GRD_JACKAL_201
        {
            default DebugId = int64(0xf7b8fc5a4ab1be04);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf7b8fc5a4ab1be05), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xf7b8fc5a4ab1be05), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceJackalHello : UTopic_Hero__OC_GRD_JACKAL_201
        {
            default DebugId = int64(0xf7b8fc5a4ab1be06);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::WalkToOther;
            
            default Rules.HideIfKnows(UChoiceJackalHello);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf7b8fc5a4ab1be07), G1R != nullptr && !G1R.HasReachedChapter(2));
                    DB(int64(0x685efd86042e394), G1R.FMTaken == 0);
                }
                
                if (G1R != nullptr && G1R.HasReachedChapter(2))
                    return false;
                
                if (G1R.FMTaken != 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf7b8fc5a4ab1be08), EConversationDebugInfo::Executing);
                // Well, well! A new face!
                Jackal.AI.Say(LocText("INFO_JACKAL_HELLO_07_00"));
                DC(int64(0xf7b8fc5a4ab1be08), EConversationDebugInfo::Done);
                DC(int64(0xf7b8fc5a4ab1be09), EConversationDebugInfo::Executing);
                
                // What do you want?
                Hero.AI.Say(LocText("INFO_JACKAL_HELLO_15_01"));
                DC(int64(0xf7b8fc5a4ab1be09), EConversationDebugInfo::Done);
                DC(int64(0xf7b8fc5a4ab1be0a), EConversationDebugInfo::Executing);
                
                // To offer you my help. You're new here, and new folks ...
                Jackal.AI.Say(LocText("INFO_JACKAL_HELLO_07_02"));
                DC(int64(0xf7b8fc5a4ab1be0a), EConversationDebugInfo::Done);
                DC(int64(0xf7b8fc5a4ab1be0b), EConversationDebugInfo::Executing);
                // And for just ten nuggets, you could be a member ...
                Jackal.AI.Say(LocText("INFO_JACKAL_HELLO_07_03"));
                DC(int64(0xf7b8fc5a4ab1be0b), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_GRD_JACKAL, Document::UDocumentSegment_Glossary_OC_GRD_JACKAL_Introduction);
                Subdialog(
                    UChoiceJackalHelloWhatdoiget,
                    UChoiceJackalHelloPay,
                    UChoiceJackalHelloWhatif,
                    UChoiceJackalHelloLater
                );
            }
        }
        
        
        class UChoiceJackalHelloWhatdoiget : UTopic_Hero__OC_GRD_JACKAL_201
        {
            default DebugId = int64(0xe8603e87342bd5e3);
            default Caption = LocText("INFO_JACKAL_HELLO_WHATDOIGET_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf7b8fc5a4ab1be18), EConversationDebugInfo::Executing);
                // And what does this membership get me?
                Hero.AI.Say(LocText("INFO_JACKAL_HELLO_WHATDOIGET_15_00"));
                DC(int64(0xf7b8fc5a4ab1be18), EConversationDebugInfo::Done);
                DC(int64(0xf7b8fc5a4ab1be19), EConversationDebugInfo::Executing);
                
                // Why, protection, of course! As long as you're in my ...
                Jackal.AI.Say(LocText("INFO_JACKAL_HELLO_WHATDOIGET_07_01"));
                DC(int64(0xf7b8fc5a4ab1be19), EConversationDebugInfo::Done);
                DC(int64(0xf7b8fc5a4ab1be1a), EConversationDebugInfo::Executing);
                // Suppose a New Camper harasses you, or a Loon gets angry ...
                Jackal.AI.Say(LocText("INFO_JACKAL_HELLO_WHATDOIGET_07_02"));
                DC(int64(0xf7b8fc5a4ab1be1a), EConversationDebugInfo::Done);
                DC(int64(0xf7b8fc5a4ab1be1b), EConversationDebugInfo::Executing);
                // And if you happen to start a fight with, say, a digger, ...
                Jackal.AI.Say(LocText("INFO_JACKAL_HELLO_WHATDOIGET_07_03"));
                DC(int64(0xf7b8fc5a4ab1be1b), EConversationDebugInfo::Done);
                DC(int64(0xf7b8fc5a4ab1be1c), EConversationDebugInfo::Executing);
                
                // What if it's two members fighting?
                Hero.AI.Say(LocText("INFO_JACKAL_HELLO_WHATDOIGET_15_04"));
                DC(int64(0xf7b8fc5a4ab1be1c), EConversationDebugInfo::Done);
                DC(int64(0xf7b8fc5a4ab1be1d), EConversationDebugInfo::Executing);
                
                // Then we'll pop open a beer and cheer you on. But that ...
                Jackal.AI.Say(LocText("INFO_JACKAL_HELLO_WHATDOIGET_07_05"));
                DC(int64(0xf7b8fc5a4ab1be1d), EConversationDebugInfo::Done);
                DC(int64(0xf7b8fc5a4ab1be1e), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xf7b8fc5a4ab1be1e), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceJackalHelloPay : UTopic_Hero__OC_GRD_JACKAL_201
        {
            default DebugId = int64(0xe8603e87342bd5ec);
            default Caption = LocText("INFO_JACKAL_HELLO_PAY_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf7b8fc5a4ab1be20), EConversationDebugInfo::Executing);
                // Here you go. Ten nuggets for your help. 
                Hero.AI.Say(LocText("INFO_JACKAL_HELLO_PAY_15_00"));
                DC(int64(0xf7b8fc5a4ab1be20), EConversationDebugInfo::Done);
                DB(int64(0xf7b8fc5a4ab1be22), Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 10, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 10, 0))
                {
                    DC(int64(0xf7b8fc5a4ab1be23), EConversationDebugInfo::Executing);
                    // Wonderful! You're an official a member of Jackal's ...
                    Jackal.AI.Say(LocText("INFO_JACKAL_HELLO_PAY_07_01"));
                    DC(int64(0xf7b8fc5a4ab1be23), EConversationDebugInfo::Done);
                    DC(int64(0xf7b8fc5a4ab1be24), EConversationDebugInfo::Executing);
                    // The rest of the Outer Ring is split up between Fletcher ...
                    Jackal.AI.Say(LocText("INFO_JACKAL_HELLO_PAY_07_02"));
                    DC(int64(0xf7b8fc5a4ab1be24), EConversationDebugInfo::Done);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_GRD_JACKAL, Document::UDocumentSegment_Glossary_OC_GRD_JACKAL_PayMoney);
                    DC(int64(0x6d7fe9c34d158348), EConversationDebugInfo::Executing);
                    G1R.Jackal_ProtectionPaid = 1;
                    DC(int64(0x6d7fe9c34d158348), EConversationDebugInfo::Done);
                    DC(int64(0x6d7fe9c34d15834a), EConversationDebugInfo::Executing);
                    Hero.GivePremiumProtectionByJackal();
                    DC(int64(0x6d7fe9c34d15834a), EConversationDebugInfo::Done);
                    DC(int64(0x6d7fe9c34d15834c), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Jackal, UItMi_Orenugget, 10);
                    DC(int64(0x6d7fe9c34d15834c), EConversationDebugInfo::Done);
                    DC(int64(0x685efd86042e38b), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x685efd86042e38b), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0xf7b8fc5a4ab1be27), EConversationDebugInfo::Executing);
                    // Is this a joke? I don't see any ore. Come back when ...
                    Jackal.AI.Say(LocText("INFO_JACKAL_SCHUTZ_NOORE_07_00"));
                    DC(int64(0xf7b8fc5a4ab1be27), EConversationDebugInfo::Done);
                    DC(int64(0x685efd86042e38d), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x685efd86042e38d), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
        class UChoiceJackalHelloWhatif : UTopic_Hero__OC_GRD_JACKAL_201
        {
            default DebugId = int64(0xe8603e87342bd5d7);
            default Caption = LocText("INFO_JACKAL_HELLO_WHATIF_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf7b8fc5a4ab1be0e), EConversationDebugInfo::Executing);
                // And what if I don't pay?
                Hero.AI.Say(LocText("INFO_JACKAL_HELLO_WHATIF_15_00"));
                DC(int64(0xf7b8fc5a4ab1be0e), EConversationDebugInfo::Done);
                DC(int64(0xf7b8fc5a4ab1be0f), EConversationDebugInfo::Executing);
                
                // Oh, don't you worry! You're new here and still learning ...
                Jackal.AI.Say(LocText("INFO_JACKAL_HELLO_WHATIF_07_01"));
                DC(int64(0xf7b8fc5a4ab1be0f), EConversationDebugInfo::Done);
                DC(int64(0xf7b8fc5a4ab1be10), EConversationDebugInfo::Executing);
                // There's no ultimatum. Simply be aware that my charity ...
                Jackal.AI.Say(LocText("INFO_JACKAL_HELLO_WHATIF_07_02"));
                DC(int64(0xf7b8fc5a4ab1be10), EConversationDebugInfo::Done);
                DC(int64(0xf7b8fc5a4ab1be11), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xf7b8fc5a4ab1be11), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceJackalHelloLater : UTopic_Hero__OC_GRD_JACKAL_201
        {
            default DebugId = int64(0xe8603e87342bd5dd);
            default Caption = LocText("INFO_JACKAL_HELLO_LATER_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf7b8fc5a4ab1be13), EConversationDebugInfo::Executing);
                // I'll see you around.
                Hero.AI.Say(LocText("INFO_JACKAL_HELLO_LATER_15_00"));
                DC(int64(0xf7b8fc5a4ab1be13), EConversationDebugInfo::Done);
                DC(int64(0xf7b8fc5a4ab1be14), EConversationDebugInfo::Executing);
                
                // Be careful out there.
                Jackal.AI.Say(LocText("INFO_JACKAL_HELLO_LATER_07_01"));
                DC(int64(0xf7b8fc5a4ab1be14), EConversationDebugInfo::Done);
                DC(int64(0x6d7fe9c34d158334), EConversationDebugInfo::Executing);
                G1R.Jackal_ProtectionPaid = 0;
                DC(int64(0x6d7fe9c34d158334), EConversationDebugInfo::Done);
                DC(int64(0x685efd86042e38c), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x685efd86042e38c), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceJackalPayday : UTopic_Hero__OC_GRD_JACKAL_201
        {
            default DebugId = int64(0xf7b8fc5a4ab1be38);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::WalkToOther;
            
            default Rules.HideIfKnows(UChoiceJackalPayday);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf7b8fc5a4ab1be39), G1R.FMTaken != 0);
                }
                
                return G1R.FMTaken != 0;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xff8bcf6e654fc30c), EConversationDebugInfo::Executing);
                // Well. Well. Look who it is. 
                Jackal.AI.Say(LocText("TEXT_WIP_GSMIFZI_20240627_181118"));
                DC(int64(0xff8bcf6e654fc30c), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_GRD_JACKAL, Document::UDocumentSegment_Glossary_OC_GRD_JACKAL_FreeMine);
                DB(int64(0xf7b8fc5a4ab1be3b), Quest::NewCamp_NCCHAPTER1_JOINNC != nullptr && Quest::NewCamp_NCCHAPTER1_JOINNC.HasSucceeded());
                DB(int64(0xb6c5309412971b74), Quest::OldCamp_OCCHAPTER1_JOINOC != nullptr && Quest::OldCamp_OCCHAPTER1_JOINOC.HasSucceeded());
                
                if (Quest::NewCamp_NCCHAPTER1_JOINNC != nullptr && Quest::NewCamp_NCCHAPTER1_JOINNC.HasSucceeded())
                {
                    DC(int64(0xf7b8fc5a4ab1be40), EConversationDebugInfo::Executing);
                    // Gotta say, I'm impressed you made it this far ... back ...
                    Jackal.AI.Say(LocText("INFO_JACKAL_PAYDAY_07_03"));
                    DC(int64(0xf7b8fc5a4ab1be40), EConversationDebugInfo::Done);
                    DC(int64(0xf7b8fc5a4ab1be41), EConversationDebugInfo::Executing);
                    // Shame you joined the wrong side.
                    Jackal.AI.Say(LocText("INFO_JACKAL_PAYDAY_07_04"));
                    DC(int64(0xf7b8fc5a4ab1be41), EConversationDebugInfo::Done);
                }
                else if (Quest::OldCamp_OCCHAPTER1_JOINOC != nullptr && Quest::OldCamp_OCCHAPTER1_JOINOC.HasSucceeded())
                {
                    DC(int64(0xf7b8fc5a4ab1be3e), EConversationDebugInfo::Executing);
                    // I'd like to say I'm surprised you turned coat, but I'm ...
                    Jackal.AI.Say(LocText("INFO_JACKAL_PAYDAY_07_01"));
                    DC(int64(0xf7b8fc5a4ab1be3e), EConversationDebugInfo::Done);
                    DC(int64(0xff8bcf6e654fc316), EConversationDebugInfo::Executing);
                    
                    // You kicked me out. 
                    Hero.AI.Say(LocText("TEXT_WIP_GSMIFZI_20240627_181454"));
                    DC(int64(0xff8bcf6e654fc316), EConversationDebugInfo::Done);
                    DC(int64(0xf7b8fc5a4ab1be3f), EConversationDebugInfo::Executing);
                    
                    // Guess we did. Still, I never liked you and that smug ...
                    Jackal.AI.Say(LocText("INFO_JACKAL_PAYDAY_07_02"));
                    DC(int64(0xf7b8fc5a4ab1be3f), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0xf7b8fc5a4ab1be42), EConversationDebugInfo::Executing);
                    // Gotta admit, I'm surprised to see you here ... word is ...
                    Jackal.AI.Say(LocText("INFO_JACKAL_PAYDAY_07_05"));
                    DC(int64(0xf7b8fc5a4ab1be42), EConversationDebugInfo::Done);
                    DC(int64(0xf7b8fc5a4ab1be43), EConversationDebugInfo::Executing);
                    // You teamed up with the rice-eaters now?
                    Jackal.AI.Say(LocText("INFO_JACKAL_PAYDAY_07_06"));
                    DC(int64(0xf7b8fc5a4ab1be43), EConversationDebugInfo::Done);
                    DC(int64(0xff8bcf6e654fc320), EConversationDebugInfo::Executing);
                    
                    // Long story.
                    Hero.AI.Say(LocText("TEXT_WIP_GSMIFZI_20240627_185219"));
                    DC(int64(0xff8bcf6e654fc320), EConversationDebugInfo::Done);
                    DC(int64(0xff8bcf6e654fc321), EConversationDebugInfo::Executing);
                    
                    // Ain't it always. 
                    Jackal.AI.Say(LocText("TEXT_WIP_GSMIFZI_20240627_185226"));
                    DC(int64(0xff8bcf6e654fc321), EConversationDebugInfo::Done);
                }
                DC(int64(0xff8bcf6e654fc331), EConversationDebugInfo::Executing);
                // Anyway ... seeing as you were dumb enough to show up ...
                Jackal.AI.Say(LocText("TEXT_WIP_GSMIFZI_20240627_185257_2083"));
                DC(int64(0xff8bcf6e654fc331), EConversationDebugInfo::Done);
                DB(int64(0xf7b8fc5a4ab1be45), G1R.Jackal_ProtectionPaid != 0);
                
                if (G1R.Jackal_ProtectionPaid != 0)
                {
                    DC(int64(0xf7b8fc5a4ab1be46), EConversationDebugInfo::Executing);
                    // And no, being a member of my charity sadly won't help ...
                    Jackal.AI.Say(LocText("INFO_JACKAL_PAYDAY_07_07"));
                    DC(int64(0xf7b8fc5a4ab1be46), EConversationDebugInfo::Done);
                }
                DC(int64(0xf7b8fc5a4ab1be48), EConversationDebugInfo::Executing);
                // Raiding the mine was a mistake. 
                Hero.AI.Say(LocText("INFO_JACKAL_PAYDAY_15_09"));
                DC(int64(0xf7b8fc5a4ab1be48), EConversationDebugInfo::Done);
                DC(int64(0xf7b8fc5a4ab1be49), EConversationDebugInfo::Executing);
                
                // Was it? Cause from where I'm standing, it looks like it ...
                Jackal.AI.Say(LocText("INFO_JACKAL_PAYDAY_07_10"));
                DC(int64(0xf7b8fc5a4ab1be49), EConversationDebugInfo::Done);
                DC(int64(0xf7b8fc5a4ab1be4a), EConversationDebugInfo::Executing);
                // Come on, guys. Let's finish this.
                Jackal.AI.Say(LocText("INFO_JACKAL_PAYDAY_07_11"));
                DC(int64(0xf7b8fc5a4ab1be4a), EConversationDebugInfo::Done);
                DC(int64(0x82f76fc4e4001d5b), EConversationDebugInfo::Executing);
                G1R.FreeMineJackal();
                DC(int64(0x82f76fc4e4001d5b), EConversationDebugInfo::Done);
                DC(int64(0xf7b8fc5a4ab1be51), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xf7b8fc5a4ab1be51), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceJackalPermpaid : UTopic_Hero__OC_GRD_JACKAL_201
        {
            default DebugId = int64(0xf7b8fc5a4ab1be31);
            default Caption = LocText("INFO_JACKAL_PERMPAID_15_00");
            default PriorityRank = 2;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf7b8fc5a4ab1be32), G1R.Jackal_ProtectionPaid != 0);
                }
                
                return G1R.Jackal_ProtectionPaid != 0;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf7b8fc5a4ab1be33), EConversationDebugInfo::Executing);
                // How's it going?
                Hero.AI.Say(LocText("INFO_JACKAL_PERMPAID_15_00"));
                DC(int64(0xf7b8fc5a4ab1be33), EConversationDebugInfo::Done);
                DC(int64(0xf7b8fc5a4ab1be34), EConversationDebugInfo::Executing);
                
                // Still got your back, freshie. 
                Jackal.AI.Say(LocText("INFO_JACKAL_PERMPAID_07_01"));
                DC(int64(0xf7b8fc5a4ab1be34), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceJackalSchutz : UTopic_Hero__OC_GRD_JACKAL_201
        {
            default DebugId = int64(0xf7b8fc5a4ab1be28);
            default Caption = LocText("INFO_JACKAL_SCHUTZ_15_00");
            default PriorityRank = 2;
            
            default Rules.HideIfKnows(UChoiceJackalSchutz);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf7b8fc5a4ab1be29), G1R.Jackal_ProtectionPaid == 0);
                    DB(int64(0x685efd86042e393), G1R.FMTaken == 0);
                    DB(int64(0x8603ca974799eecb), G1R != nullptr && !G1R.HasReachedChapter(2));
                }
                
                if (G1R.Jackal_ProtectionPaid != 0)
                    return false;
                
                if (G1R.FMTaken != 0)
                    return false;
                
                if (G1R != nullptr && G1R.HasReachedChapter(2))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DB(int64(0xf7b8fc5a4ab1be2b), Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 10, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 10, 0))
                {
                    DC(int64(0xf7b8fc5a4ab1be2c), EConversationDebugInfo::Executing);
                    // I've been thinking about your offer. Here's your ten ...
                    Hero.AI.Say(LocText("INFO_JACKAL_SCHUTZ_15_00"));
                    DC(int64(0xf7b8fc5a4ab1be2c), EConversationDebugInfo::Done);
                    DC(int64(0xf7b8fc5a4ab1be2d), EConversationDebugInfo::Executing);
                    
                    // Good choice, my friend. You're a member of Jackal's ...
                    Jackal.AI.Say(LocText("INFO_JACKAL_SCHUTZ_07_01"));
                    DC(int64(0xf7b8fc5a4ab1be2d), EConversationDebugInfo::Done);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_GRD_JACKAL, Document::UDocumentSegment_Glossary_OC_GRD_JACKAL_PayMoney);
                    DC(int64(0x6d7fe9c34d158389), EConversationDebugInfo::Executing);
                    G1R.Jackal_ProtectionPaid = 1;
                    DC(int64(0x6d7fe9c34d158389), EConversationDebugInfo::Done);
                    DC(int64(0x6d7fe9c34d15838b), EConversationDebugInfo::Executing);
                    Hero.GivePremiumProtectionByJackal();
                    DC(int64(0x6d7fe9c34d15838b), EConversationDebugInfo::Done);
                    DC(int64(0x6d7fe9c34d15838d), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Jackal, UItMi_Orenugget, 10);
                    DC(int64(0x6d7fe9c34d15838d), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_jackal_schutz_exit_1");
                    DC(int64(0x685efd86042e38e), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x685efd86042e38e), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0xf7b8fc5a4ab1be30), EConversationDebugInfo::Executing);
                    // Then where's the ore? Don't waste my time. 
                    Jackal.AI.Say(LocText("INFO_JACKAL_SCHUTZ_07_02"));
                    DC(int64(0xf7b8fc5a4ab1be30), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_jackal_schutz_exit_2");
                    DC(int64(0x685efd86042e38f), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x685efd86042e38f), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */