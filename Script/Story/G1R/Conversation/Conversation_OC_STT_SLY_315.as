#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OC_STT_SLY_315 : UConversationCharacterSettings
        {
            default ForCharacter = n"OC_STT_SLY_315";
            default VoiceTypeSubsets.Add(FVoiceTypeSubset(GameplayTag::VoiceType_G1_Voice10));
        }
        
        
        class UTopic_Hero__OC_STT_SLY_315 : UG1RDialogTopic
        {
            default ForCharacter = n"OC_STT_SLY_315";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetSly() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceSly109616 : UTopic_Hero__OC_STT_SLY_315
        {
            default DebugId = int64(0x2c9c64b8ce3d0c84);
            default Caption = LocText("TEXT_WIP_CQCELXL_20240906_105124");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceSly109616);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("DIA_STT_315_LOSTNEKSUCCESS_NOPROOF_10_02"), int64(0x2c9c64b8ce3d0c84));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2c6ecb01f6f76fd3), EConversationDebugInfo::Executing);
                // I just remembered, Nek DID have an amulet on him. Here. 
                Hero.AI.Say(LocText("TEXT_WIP_WCCKZPD_20241101_150528"));
                DC(int64(0x2c6ecb01f6f76fd3), EConversationDebugInfo::Done);
                DC(int64(0x4c061229a020765c), EConversationDebugInfo::Executing);
                Hero.AI.GiveItemTo(Sly, UItAt_Amulet_Neks, 1);
                DC(int64(0x4c061229a020765c), EConversationDebugInfo::Done);
                DC(int64(0x2c6ecb01f6f76fd4), EConversationDebugInfo::Executing);
                // Ahh. Memory can be such a tricky thing, can't it? 
                Sly.AI.Say(LocText("TEXT_WIP_WCCKZPD_20241101_150529"));
                DC(int64(0x2c6ecb01f6f76fd4), EConversationDebugInfo::Done);
                DC(int64(0x2c6ecb01f6f76feb), EConversationDebugInfo::Executing);
                // You did the right thing. 
                Sly.AI.Say(LocText("TEXT_WIP_WCCKZPD_20241101_150656"));
                DC(int64(0x2c6ecb01f6f76feb), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceSly109644 : UTopic_Hero__OC_STT_SLY_315
        {
            default DebugId = int64(0x2c9c64b8ce3d0c9d);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceSly109616);
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceStt315LostneksuccessProof);
            default Rules.HideIfKnows(UChoiceSly109644);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_LOSTNEK, Document::UDocumentSegment_CH1_LOSTNEK_End);
                DC(int64(0x63819e13181085b3), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_LOSTNEK_LOSTNEK_OBJ_AMULET.SucceedQuest();
                DC(int64(0x63819e13181085b3), EConversationDebugInfo::Done);
                DC(int64(0xf7a5e7bd79dcc8c6), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_LOSTNEK.SucceedQuest();
                DC(int64(0xf7a5e7bd79dcc8c6), EConversationDebugInfo::Done);
                DB(int64(0xc39626f5e790f4f0), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None))
                {
                    DC(int64(0xc39626f5e790f4f2), EConversationDebugInfo::Executing);
                    // If Diego asks me, I'll tell him you're the best damn ...
                    Sly.AI.Say(LocText("DIA_STT_315_LOSTNEKSUCCESS_PROOF_10_03"));
                    DC(int64(0xc39626f5e790f4f2), EConversationDebugInfo::Done);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_STT_SLY, Document::UDocumentSegment_Glossary_OC_STT_SLY_AfterNek);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_BROWNIEPOINTS, Document::UDocumentSegment_CH1_BROWNIEPOINTS_SlyCompletedOC);
                    DC(int64(0x24e2378fdddc6cd5), EConversationDebugInfo::Executing);
                    Quest::OldCamp_OCCHAPTER1_BROWNIEPOINTS_BROWNIEPOINTS_OBJ_SLY.SucceedQuest();
                    DC(int64(0x24e2378fdddc6cd5), EConversationDebugInfo::Done);
                }
                else
                {
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_BROWNIEPOINTS, Document::UDocumentSegment_CH1_BROWNIEPOINTS_SlyCompletedLate);
                }
                DB(int64(0xc39626f5e790f4f8), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None))
                {
                    DC(int64(0x4c061229a0207658), EConversationDebugInfo::Executing);
                    Quest::OldCamp_OCCHAPTER1_JOINOC.StartQuest();
                    DC(int64(0x4c061229a0207658), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_sly_109644_exit_1");
                    DC(int64(0xc39626f5e790f4fb), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xc39626f5e790f4fb), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    
                    Other.Remember(n"choice_sly_109644_exit_2");
                }
            }
        }
        
        
        class UChoiceSly154803 : UTopic_Hero__OC_STT_SLY_315
        {
            default DebugId = int64(0x7d469894ddb3d99a);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceSly154803);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xc39626f5e790f4c1), Sly != nullptr && Sly.IsCloseToCharacter(Hero, G1R.ZivilAnquatschDist * 100.0f));
                    DB(int64(0x83eb32359b3b8a6e), G1R != nullptr && G1R.IsInChapter(1));
                }
                
                if (Sly != nullptr && !Sly.IsCloseToCharacter(Hero, G1R.ZivilAnquatschDist * 100.0f))
                    return false;
                
                if (G1R != nullptr && !G1R.IsInChapter(1))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc39626f5e790f4c4), EConversationDebugInfo::Executing);
                // New here, eh? Ain't seen your gob before. 
                Sly.AI.Say(LocText("DIA_STT_315_SLY_10_01"));
                DC(int64(0xc39626f5e790f4c4), EConversationDebugInfo::Done);
                DC(int64(0xc39626f5e790f4c5), EConversationDebugInfo::Executing);
                // I'm Sly. And I might have a job for you. 
                Sly.AI.Say(LocText("DIA_STT_315_SLY_10_02"));
                DC(int64(0xc39626f5e790f4c5), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_STT_SLY, Document::UDocumentSegment_Glossary_OC_STT_SLY_Introduction);
            }
        }
        
        
        class UChoiceStt315Lostnek : UTopic_Hero__OC_STT_SLY_315
        {
            default DebugId = int64(0xc39626f5e790f4c6);
            default Caption = LocText("DIA_STT_315_LOSTNEK_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceStt315Lostnek);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x83eb32359b3b8a70), G1R != nullptr && G1R.IsInChapter(1));
                }
                
                return G1R != nullptr && G1R.IsInChapter(1);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc39626f5e790f4c8), EConversationDebugInfo::Executing);
                // What's the job?
                Hero.AI.Say(LocText("DIA_STT_315_LOSTNEK_15_00"));
                DC(int64(0xc39626f5e790f4c8), EConversationDebugInfo::Done);
                DC(int64(0xc39626f5e790f4c9), EConversationDebugInfo::Executing);
                
                // One of me mates went missing - a warder, Nek. Word is he ...
                Sly.AI.Say(LocText("DIA_STT_315_LOSTNEK_10_01"));
                DC(int64(0xc39626f5e790f4c9), EConversationDebugInfo::Done);
                DC(int64(0xc39626f5e790f4ca), EConversationDebugInfo::Executing);
                // You're a freshie, and freshies get around a lot - why ...
                Sly.AI.Say(LocText("DIA_STT_315_LOSTNEK_10_02"));
                DC(int64(0xc39626f5e790f4ca), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_STT_SLY, Document::UDocumentSegment_Glossary_OC_STT_SLY_Nek);
                DB(int64(0xc39626f5e790f4cc), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None))
                {
                    DC(int64(0xc39626f5e790f4cd), EConversationDebugInfo::Executing);
                    // If you find him, I'll put in a good word for you.
                    Sly.AI.Say(LocText("DIA_STT_315_LOSTNEK_10_03"));
                    DC(int64(0xc39626f5e790f4cd), EConversationDebugInfo::Done);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_LOSTNEK, Document::UDocumentSegment_CH1_LOSTNEK_StartJoinOC);
                    DC(int64(0x24e2378fdddc6cbf), EConversationDebugInfo::Executing);
                    Quest::OldCamp_OCCHAPTER1_BROWNIEPOINTS_BROWNIEPOINTS_OBJ_SLY.StartQuest();
                    DC(int64(0x24e2378fdddc6cbf), EConversationDebugInfo::Done);
                }
                else
                {
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_LOSTNEK, Document::UDocumentSegment_CH1_LOSTNEK_Start);
                }
                Subdialog(
                    UChoiceStt315LostnekDoit,
                    UChoiceStt315LostnekWhy
                );
            }
        }
        
        
        class UChoiceStt315LostnekDoit : UTopic_Hero__OC_STT_SLY_315
        {
            default DebugId = int64(0xe8603e87342be238);
            default Caption = LocText("DIA_STT_315_LOSTNEK_DOIT_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UChoiceStt315LostnekDoit);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc39626f5e790f4d0), EConversationDebugInfo::Executing);
                // All right. I'll see what I can do.
                Hero.AI.Say(LocText("DIA_STT_315_LOSTNEK_DOIT_15_00"));
                DC(int64(0xc39626f5e790f4d0), EConversationDebugInfo::Done);
                DC(int64(0xc39626f5e790f4d1), EConversationDebugInfo::Executing);
                
                // Good. Maybe Fletcher can give you some hints. Him and ...
                Sly.AI.Say(LocText("DIA_STT_315_LOSTNEK_DOIT_10_01"));
                DC(int64(0xc39626f5e790f4d1), EConversationDebugInfo::Done);
                DC(int64(0xc39626f5e790f4d2), EConversationDebugInfo::Executing);
                
                // Which corner is that? 
                Hero.AI.Say(LocText("DIA_STT_315_LOSTNEK_DOIT_15_02"));
                DC(int64(0xc39626f5e790f4d2), EConversationDebugInfo::Done);
                DC(int64(0xc39626f5e790f4d3), EConversationDebugInfo::Executing);
                
                // The arena district. You'll find it.
                Sly.AI.Say(LocText("DIA_STT_315_LOSTNEK_DOIT_10_03"));
                DC(int64(0xc39626f5e790f4d3), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_BROWNIEPOINTS, Document::UDocumentSegment_CH1_BROWNIEPOINTS_SlyStart);
                DC(int64(0xf7a5e7bd79dcc7c4), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_LOSTNEK.StartQuest();
                DC(int64(0xf7a5e7bd79dcc7c4), EConversationDebugInfo::Done);
                DC(int64(0x63819e131810842e), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_LOSTNEK_LOSTNEK_OBJ_FLETCHER.StartQuest();
                DC(int64(0x63819e131810842e), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceStt315LostnekWhy : UTopic_Hero__OC_STT_SLY_315
        {
            default DebugId = int64(0xe8603e87342be246);
            default Caption = LocText("DIA_STT_315_LOSTNEK_WHY_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UChoiceStt315LostnekWhy);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x8e85d63dfa0679f3), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                }
                
                return Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc39626f5e790f4dc), EConversationDebugInfo::Executing);
                // Will a "good word" from you help me become a Shadow?
                Hero.AI.Say(LocText("DIA_STT_315_LOSTNEK_WHY_15_00"));
                DC(int64(0xc39626f5e790f4dc), EConversationDebugInfo::Done);
                DC(int64(0xc39626f5e790f4dd), EConversationDebugInfo::Executing);
                
                // Ha - ambitious, ain't ya? Sure can. 
                Sly.AI.Say(LocText("DIA_STT_315_LOSTNEK_WHY_10_01"));
                DC(int64(0xc39626f5e790f4dd), EConversationDebugInfo::Done);
                DC(int64(0xc39626f5e790f4de), EConversationDebugInfo::Executing);
                // But all in due time. First, you find Nek, then we talk ...
                Sly.AI.Say(LocText("DIA_STT_315_LOSTNEK_WHY_10_02"));
                DC(int64(0xc39626f5e790f4de), EConversationDebugInfo::Done);
                DC(int64(0x24e2378fdddc6cc8), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_BROWNIEPOINTS_BROWNIEPOINTS_OBJ_SLY.StartQuest();
                DC(int64(0x24e2378fdddc6cc8), EConversationDebugInfo::Done);
                DC(int64(0x24e2378fdddc6ccb), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x24e2378fdddc6ccb), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceStt315Lostneksuccess : UTopic_Hero__OC_STT_SLY_315
        {
            default DebugId = int64(0xc39626f5e790f4df);
            default Caption = LocText("DIA_STT_315_LOSTNEKSUCCESS_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceStt315Lostneksuccess);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xc39626f5e790f4e0), Quest::OldCamp_OCCHAPTER1_LOSTNEK != nullptr && Quest::OldCamp_OCCHAPTER1_LOSTNEK.IsRunning());
                    DB(int64(0xc39626f5e790f4e1), Hero != nullptr && Hero.HasItem(UItAt_Amulet_Neks, 1, 0));
                }
                
                if (Quest::OldCamp_OCCHAPTER1_LOSTNEK != nullptr && !Quest::OldCamp_OCCHAPTER1_LOSTNEK.IsRunning())
                    return false;
                
                if (Hero != nullptr && !Hero.HasItem(UItAt_Amulet_Neks, 1, 0))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc39626f5e790f4e2), EConversationDebugInfo::Executing);
                // I found him. He's dead.
                Hero.AI.Say(LocText("DIA_STT_315_LOSTNEKSUCCESS_15_00"));
                DC(int64(0xc39626f5e790f4e2), EConversationDebugInfo::Done);
                DC(int64(0xc39626f5e790f4e3), EConversationDebugInfo::Executing);
                
                // Bloody hell ... so I was right. Where was he? 
                Sly.AI.Say(LocText("DIA_STT_315_LOSTNEKSUCCESS_10_01"));
                DC(int64(0xc39626f5e790f4e3), EConversationDebugInfo::Done);
                DC(int64(0xf76c1248f3b95003), EConversationDebugInfo::Executing);
                
                // In a cave near the camp. The molerats got him.
                Hero.AI.Say(LocText("TEXT_NISEA_20231218_135127"));
                DC(int64(0xf76c1248f3b95003), EConversationDebugInfo::Done);
                DC(int64(0xf76c1248f3b95004), EConversationDebugInfo::Executing);
                
                // Molerats? Pft. Tough luck. So, you found anythin' on ...
                Sly.AI.Say(LocText("TEXT_NISEA_20231218_135150"));
                DC(int64(0xf76c1248f3b95004), EConversationDebugInfo::Done);
                DC(int64(0x63819e1318108598), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_LOSTNEK_LOSTNEK_OBJ_REPORTSLY.SucceedQuest();
                DC(int64(0x63819e1318108598), EConversationDebugInfo::Done);
                Subdialog(
                    UChoiceStt315LostneksuccessNoproof,
                    UChoiceStt315LostneksuccessProof
                );
            }
        }
        
        
        class UChoiceStt315LostneksuccessNoproof : UTopic_Hero__OC_STT_SLY_315
        {
            default DebugId = int64(0xe8603e87342be258);
            default Caption = LocText("DIA_STT_315_LOSTNEKSUCCESS_NOPROOF_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc39626f5e790f4e6), EConversationDebugInfo::Executing);
                // Afraid not.
                Hero.AI.Say(LocText("DIA_STT_315_LOSTNEKSUCCESS_NOPROOF_15_00"));
                DC(int64(0xc39626f5e790f4e6), EConversationDebugInfo::Done);
                DC(int64(0xc39626f5e790f4e7), EConversationDebugInfo::Executing);
                
                // No? That's a shame. Had you brought me somethin' more ...
                Sly.AI.Say(LocText("DIA_STT_315_LOSTNEKSUCCESS_NOPROOF_10_01"));
                DC(int64(0xc39626f5e790f4e7), EConversationDebugInfo::Done);
                DC(int64(0xc39626f5e790f4e8), EConversationDebugInfo::Executing);
                // Such as, I don't know, an AMULET. Maybe go take another ...
                Sly.AI.Say(LocText("DIA_STT_315_LOSTNEKSUCCESS_NOPROOF_10_02"));
                DC(int64(0xc39626f5e790f4e8), EConversationDebugInfo::Done);
                DC(int64(0xc39626f5e790f4e9), EConversationDebugInfo::Executing);
                
                // I'll see what I can do.
                Hero.AI.Say(LocText("DIA_STT_315_LOSTNEKSUCCESS_NOPROOF_15_03"));
                DC(int64(0xc39626f5e790f4e9), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_LOSTNEK, Document::UDocumentSegment_CH1_LOSTNEK_Amulet);
                DC(int64(0x63819e13181085a9), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_LOSTNEK_LOSTNEK_OBJ_AMULET.StartQuest();
                DC(int64(0x63819e13181085a9), EConversationDebugInfo::Done);
                DC(int64(0x63819e13181085ac), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x63819e13181085ac), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceStt315LostneksuccessProof : UTopic_Hero__OC_STT_SLY_315
        {
            default DebugId = int64(0xe8603e87342be25f);
            default Caption = LocText("DIA_STT_315_LOSTNEKSUCCESS_PROOF_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc39626f5e790f4ec), EConversationDebugInfo::Executing);
                // Yeah, an amulet. Here.
                Hero.AI.Say(LocText("DIA_STT_315_LOSTNEKSUCCESS_PROOF_15_00"));
                DC(int64(0xc39626f5e790f4ec), EConversationDebugInfo::Done);
                DC(int64(0x4c061229a020765c), EConversationDebugInfo::Executing);
                Hero.AI.GiveItemTo(Sly, UItAt_Amulet_Neks, 1);
                DC(int64(0x4c061229a020765c), EConversationDebugInfo::Done);
                DC(int64(0xc39626f5e790f4ed), EConversationDebugInfo::Executing);
                // Ain't that a beauty. Tragic ... good call bein' straight ...
                Sly.AI.Say(LocText("DIA_STT_315_LOSTNEKSUCCESS_PROOF_10_01"));
                DC(int64(0xc39626f5e790f4ed), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceStt315SlyAftersuccess : UTopic_Hero__OC_STT_SLY_315
        {
            default DebugId = int64(0xc39626f5e790f4fc);
            default Caption = LocText("DIA_STT_315_SLY_AFTERSUCCESS_15_00");
            default PriorityRank = 1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xc39626f5e790f4fd), G1R != nullptr && G1R.IsInChapter(1));
                    DB(int64(0xc39626f5e790f4fe), Quest::OldCamp_OCCHAPTER1_LOSTNEK != nullptr && Quest::OldCamp_OCCHAPTER1_LOSTNEK.HasSucceeded());
                    DB(int64(0xc39626f5e790f4ff), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                }
                
                if (G1R != nullptr && !G1R.IsInChapter(1))
                    return false;
                
                if (Quest::OldCamp_OCCHAPTER1_LOSTNEK != nullptr && !Quest::OldCamp_OCCHAPTER1_LOSTNEK.HasSucceeded())
                    return false;
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc39626f5e790f500), EConversationDebugInfo::Executing);
                
                // How's it going?
                Hero.AI.Say(LocText("DIA_STT_315_SLY_AFTERSUCCESS_15_00"));
                DC(int64(0xc39626f5e790f500), EConversationDebugInfo::Done);
                DC(int64(0xc39626f5e790f501), EConversationDebugInfo::Executing);
                
                // Couldn't be better. Don't worry about Diego. 
                Sly.AI.Say(LocText("DIA_STT_315_SLY_AFTERSUCCESS_10_01"));
                DC(int64(0xc39626f5e790f501), EConversationDebugInfo::Done);
                DC(int64(0xc39626f5e790f502), EConversationDebugInfo::Executing);
                
                // Nice amulet you got there.
                Hero.AI.Say(LocText("DIA_STT_315_SLY_AFTERSUCCESS_15_02"));
                DC(int64(0xc39626f5e790f502), EConversationDebugInfo::Done);
                DC(int64(0xc39626f5e790f503), EConversationDebugInfo::Executing);
                
                // Don't get any ideas.
                Sly.AI.Say(LocText("DIA_STT_315_SLY_AFTERSUCCESS_10_03"));
                DC(int64(0xc39626f5e790f503), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceStt315SlyExit : UTopic_Hero__OC_STT_SLY_315
        {
            default DebugId = int64(0xc39626f5e790f4be);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc39626f5e790f4bf), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xc39626f5e790f4bf), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */