#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OC_WOC_SERAPHIA_110 : UConversationCharacterSettings
        {
            default ForCharacter = n"OC_WOC_SERAPHIA_110";
        }
        
        
        class UTopic_Hero__OC_WOC_SERAPHIA_110 : UG1RDialogTopic
        {
            default ForCharacter = n"OC_WOC_SERAPHIA_110";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetSeraphia() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetArto() const property
            {
                return GetCharacter(n"OC_EBR_ARTO_102");
            }
            
            AGothicCharacterState GetBartholo() const property
            {
                return GetCharacter(n"OC_EBR_BARTHOLO_106");
            }
            
            AGothicCharacterState GetGomez() const property
            {
                return GetCharacter(n"OC_EBR_GOMEZ_100");
            }
            
            AGothicCharacterState GetRaven() const property
            {
                return GetCharacter(n"OC_EBR_RAVEN_105");
            }
            
            AGothicCharacterState GetScar() const property
            {
                return GetCharacter(n"OC_EBR_SCAR_101");
            }
            
            AGothicCharacterState GetOC_GRD_GUARD04_218() const property
            {
                return GetCharacter(n"OC_GRD_GUARD04_218");
            }
            
            AGothicCharacterState GetOC_GRD_GUARD08_223() const property
            {
                return GetCharacter(n"OC_GRD_GUARD08_223");
            }
            
            AGothicCharacterState GetOC_GRD_GUARD25_245() const property
            {
                return GetCharacter(n"OC_GRD_GUARD25_245");
            }
            
            AGothicCharacterState GetSyra() const property
            {
                return GetCharacter(n"OC_WOC_SYRA_109");
            }
            
            AGothicCharacterState GetVelaya() const property
            {
                return GetCharacter(n"OC_WOC_VELAYA_108");
            }
        }
        
        
        class UChoiceSeraphia134768 : UTopic_Hero__OC_WOC_SERAPHIA_110
        {
            default DebugId = int64(0x57b48daa1d064fb5);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x57b48daa1d064fb4), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x57b48daa1d064fb4), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceSeraphia134784 : UTopic_Hero__OC_WOC_SERAPHIA_110
        {
            default DebugId = int64(0x57b48daa1d064fb9);
            default Caption = LocText("TEXT_WIP_UKEKYCE_20250109_114946_3286");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceSeraphia134784);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x81f98c56dfa2d52f), Quest::OldCamp_OCCHAPTER3_DREAMEDLAND != nullptr && Quest::OldCamp_OCCHAPTER3_DREAMEDLAND.IsRunning());
                }
                
                return Quest::OldCamp_OCCHAPTER3_DREAMEDLAND != nullptr && Quest::OldCamp_OCCHAPTER3_DREAMEDLAND.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x57b48daa1d064fb7), EConversationDebugInfo::Executing);
                // We have to talk.
                Hero.AI.Say(LocText("TEXT_WIP_UKEKYCE_20250109_114946_3286"));
                DC(int64(0x57b48daa1d064fb7), EConversationDebugInfo::Done);
                DC(int64(0x57b48daa1d064fb8), EConversationDebugInfo::Executing);
                
                // What is it?
                Seraphia.AI.Say(LocText("TEXT_WIP_UKEKYCE_20250109_114946_686"));
                DC(int64(0x57b48daa1d064fb8), EConversationDebugInfo::Done);
                DC(int64(0xb11e587503ea68ba), EConversationDebugInfo::Executing);
                
                // Syra's thinking of making a run for it. She wants to go ...
                Hero.AI.Say(LocText("TEXT_WIP_WKHQRQD_20250110_113352"));
                DC(int64(0xb11e587503ea68ba), EConversationDebugInfo::Done);
                DC(int64(0xb11e587503ea68bb), EConversationDebugInfo::Executing);
                
                // Seriously? She wants to run away?
                Seraphia.AI.Say(LocText("TEXT_WIP_WKHQRQD_20250110_113400"));
                DC(int64(0xb11e587503ea68bb), EConversationDebugInfo::Done);
                DC(int64(0xb11e587503ea68bc), EConversationDebugInfo::Executing);
                // Do you know what they'd do to us?
                Seraphia.AI.Say(LocText("TEXT_WIP_WKHQRQD_20250110_113413"));
                DC(int64(0xb11e587503ea68bc), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_WOC_SERAPHIA, Document::UDocumentSegment_Glossary_OC_WOC_SERAPHIA_Introduction);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_DREAMEDLAND, Document::UDocumentSegment_CH3_DREAMEDLAND_Seraphia);
                Subdialog(
                    UTopic_Seraphia_136773,
                    UTopic_Seraphia_136793
                );
                DC(int64(0xb11e587503ea68cd), EConversationDebugInfo::Executing);
                // I don't know ... Maybe ... I need time to think about ...
                Seraphia.AI.Say(LocText("TEXT_WIP_WKHQRQD_20250110_113928_1609"));
                DC(int64(0xb11e587503ea68cd), EConversationDebugInfo::Done);
                DC(int64(0x821db0237f618636), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER3_DREAMEDLAND_DREAMEDLAND_OBJ_TALKSERAPHIA.SucceedQuest();
                DC(int64(0x821db0237f618636), EConversationDebugInfo::Done);
                DC(int64(0xb11e587503ea68cf), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xb11e587503ea68cf), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Seraphia_136773 : UTopic_Hero__OC_WOC_SERAPHIA_110
        {
            default DebugId = int64(0xb11e587503ea68bf);
            default Caption = LocText("TEXT_WIP_WKHQRQD_20250110_113440_686");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Seraphia_136773);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb11e587503ea68c0), EConversationDebugInfo::Executing);
                // I get it, but things are different in the Swamp Camp. ...
                Hero.AI.Say(LocText("TEXT_WIP_WKHQRQD_20250110_113440_686"));
                DC(int64(0xb11e587503ea68c0), EConversationDebugInfo::Done);
                DC(int64(0xb11e587503ea68c7), EConversationDebugInfo::Executing);
                
                // Safe? Nowhere here is safe. And they'll catch us before ...
                Seraphia.AI.Say(LocText("TEXT_WIP_WKHQRQD_20250110_113515"));
                DC(int64(0xb11e587503ea68c7), EConversationDebugInfo::Done);
                DC(int64(0xb11e587503ea68c8), EConversationDebugInfo::Executing);
                
                // We'll wait for the right moment. It's not impossible.
                Hero.AI.Say(LocText("TEXT_WIP_WKHQRQD_20250110_113527"));
                DC(int64(0xb11e587503ea68c8), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Seraphia_136793 : UTopic_Hero__OC_WOC_SERAPHIA_110
        {
            default DebugId = int64(0xb11e587503ea68c3);
            default Caption = LocText("TEXT_WIP_WKHQRQD_20250110_113440_3984");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Seraphia_136793);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb11e587503ea68c4), EConversationDebugInfo::Executing);
                // You can stay here, it's you choice. But it's an ...
                Hero.AI.Say(LocText("TEXT_WIP_WKHQRQD_20250110_113440_3984"));
                DC(int64(0xb11e587503ea68c4), EConversationDebugInfo::Done);
                DC(int64(0xb11e587503ea68ca), EConversationDebugInfo::Executing);
                
                // Of course I'll stay. I don't want to be executed, and ...
                Seraphia.AI.Say(LocText("TEXT_WIP_WKHQRQD_20250110_113843"));
                DC(int64(0xb11e587503ea68ca), EConversationDebugInfo::Done);
                DC(int64(0x80395ec2725d8a91), EConversationDebugInfo::Executing);
                // And here I at least know what to watch out for - as long ...
                Seraphia.AI.Say(LocText("TEXT_WIP_TNKPFJF_20250129_180738"));
                DC(int64(0x80395ec2725d8a91), EConversationDebugInfo::Done);
                DC(int64(0xb11e587503ea68ce), EConversationDebugInfo::Executing);
                
                // Just think about it.
                Hero.AI.Say(LocText("TEXT_WIP_WKHQRQD_20250110_113958"));
                DC(int64(0xb11e587503ea68ce), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceSeraphia137011 : UTopic_Hero__OC_WOC_SERAPHIA_110
        {
            default DebugId = int64(0xb11e587503ea68e5);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceSeraphia137011);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xb11e587503ea68e8), Quest::OldCamp_OCCHAPTER3_DREAMEDLAND != nullptr && Quest::OldCamp_OCCHAPTER3_DREAMEDLAND.HasSucceeded());
                    DB(int64(0xb11e587503ea68e9), Quest::OldCamp_OCCHAPTER4_ESCAPEPLAN != nullptr && !Quest::OldCamp_OCCHAPTER4_ESCAPEPLAN.HasBeenStarted());
                    DB(int64(0xb11e587503ea68ea), Hero != nullptr && Hero.IsInConversation());
                    DB(int64(0x319978557233a286), Gomez != nullptr && !Gomez.IsEveryoneOfThisKindDead());
                }
                
                if (Quest::OldCamp_OCCHAPTER3_DREAMEDLAND != nullptr && !Quest::OldCamp_OCCHAPTER3_DREAMEDLAND.HasSucceeded())
                    return false;
                
                if (Quest::OldCamp_OCCHAPTER4_ESCAPEPLAN != nullptr && Quest::OldCamp_OCCHAPTER4_ESCAPEPLAN.HasBeenStarted())
                    return false;
                
                if (Hero != nullptr && !Hero.IsInConversation())
                    return false;
                
                if (Gomez != nullptr && Gomez.IsEveryoneOfThisKindDead())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb11e587503ea68e4), EConversationDebugInfo::Executing);
                
                // I've been thinking ... and maybe leaving wouldn't be so ...
                Seraphia.AI.Say(LocText("TEXT_WIP_WKHQRQD_20250110_120126_443"));
                DC(int64(0xb11e587503ea68e4), EConversationDebugInfo::Done);
                DC(int64(0xb11e587503ea68eb), EConversationDebugInfo::Executing);
                
                // I will.
                Hero.AI.Say(LocText("TEXT_WIP_WKHQRQD_20250110_120531"));
                DC(int64(0xb11e587503ea68eb), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_WOC_SERAPHIA, Document::UDocumentSegment_Glossary_OC_WOC_SERAPHIA_ChangeOpinion);
            }
        }
        
        
        class UChoiceSeraphia145801 : UTopic_Hero__OC_WOC_SERAPHIA_110
        {
            default DebugId = int64(0x38fe7afef898170a);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceSeraphia145801);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf0c9d4e4e04bf669), OC_GRD_GUARD04_218 != nullptr && OC_GRD_GUARD04_218.IsEveryoneOfThisKindDead());
                    DB(int64(0xf0c9d4e4e04bf66a), OC_GRD_GUARD08_223 != nullptr && OC_GRD_GUARD08_223.IsEveryoneOfThisKindDead());
                    DB(int64(0xf0c9d4e4e04bf66b), OC_GRD_GUARD25_245 != nullptr && OC_GRD_GUARD25_245.IsEveryoneOfThisKindDead());
                    DB(int64(0xf0c9d4e4e04bf66d), Arto != nullptr && Arto.IsEveryoneOfThisKindDead());
                    DB(int64(0xf0c9d4e4e04bf66e), Bartholo != nullptr && Bartholo.IsEveryoneOfThisKindDead());
                    DB(int64(0xf0c9d4e4e04bf66f), Gomez != nullptr && Gomez.IsEveryoneOfThisKindDead());
                    DB(int64(0xf0c9d4e4e04bf670), Raven != nullptr && Raven.IsEveryoneOfThisKindDead());
                    DB(int64(0xf0c9d4e4e04bf671), Scar != nullptr && Scar.IsEveryoneOfThisKindDead());
                    DB(int64(0xf0c9d4e4e04bf683), Hero != nullptr && Hero.IsInConversation());
                    DB(int64(0x6c528962981d5b12), Quest::OldCamp_OCCHAPTER4_ESCAPEPLAN != nullptr && !Quest::OldCamp_OCCHAPTER4_ESCAPEPLAN.HasBeenStarted());
                    DB(int64(0x319978557233a273), G1R.WomenSaved != 0);
                }
                
                if (OC_GRD_GUARD04_218 != nullptr && OC_GRD_GUARD04_218.IsEveryoneOfThisKindDead() && OC_GRD_GUARD08_223 != nullptr && OC_GRD_GUARD08_223.IsEveryoneOfThisKindDead() && OC_GRD_GUARD25_245 != nullptr && OC_GRD_GUARD25_245.IsEveryoneOfThisKindDead() && Arto != nullptr && Arto.IsEveryoneOfThisKindDead() && Bartholo != nullptr && Bartholo.IsEveryoneOfThisKindDead() && Gomez != nullptr && Gomez.IsEveryoneOfThisKindDead() && Raven != nullptr && Raven.IsEveryoneOfThisKindDead() && Scar != nullptr && Scar.IsEveryoneOfThisKindDead() && Hero != nullptr && Hero.IsInConversation() && Quest::OldCamp_OCCHAPTER4_ESCAPEPLAN != nullptr && !Quest::OldCamp_OCCHAPTER4_ESCAPEPLAN.HasBeenStarted())
                    return true;
                
                if (G1R.WomenSaved != 0)
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x38fe7afef8981709), EConversationDebugInfo::Executing);
                // What did you do? Who will guard us now? Did you think ...
                Seraphia.AI.Say(LocText("TEXT_WIP_CIVTSEI_20250129_120903_2238"));
                DC(int64(0x38fe7afef8981709), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_WOC_SERAPHIA, Document::UDocumentSegment_Glossary_OC_WOC_SERAPHIA_Safe);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH4_ESCAPEPLAN, Document::UDocumentSegment_CH4_ESCAPEPLAN_GomezKo);
                DC(int64(0x319978557233a277), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Velaya))) { Velaya.ExchangeDailyRoutineToClass(UDailyRoutine_OC_WOC_Velaya_108_Saved); }
                DC(int64(0x319978557233a277), EConversationDebugInfo::Done);
                DC(int64(0x319978557233a27b), EConversationDebugInfo::Executing);
                Seraphia.ExchangeDailyRoutineToClass(UDailyRoutine_OC_WOC_Seraphia_110_Saved);
                DC(int64(0x319978557233a27b), EConversationDebugInfo::Done);
                DC(int64(0x319978557233a27d), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Syra))) { Syra.ExchangeDailyRoutineToClass(UDailyRoutine_OC_WOC_Syra_109_Saved); }
                DC(int64(0x319978557233a27d), EConversationDebugInfo::Done);
                DC(int64(0x319978557233a27f), EConversationDebugInfo::Executing);
                G1R.WomenSaved = 1;
                DC(int64(0x319978557233a27f), EConversationDebugInfo::Done);
                DB(int64(0xf0c9d4e4e04bf674), Quest::OldCamp_OCCHAPTER4_ESCAPEPLAN != nullptr && !Quest::OldCamp_OCCHAPTER4_ESCAPEPLAN.HasSucceeded());
                
                if (Quest::OldCamp_OCCHAPTER4_ESCAPEPLAN != nullptr && !Quest::OldCamp_OCCHAPTER4_ESCAPEPLAN.HasSucceeded())
                {
                    DC(int64(0xf0c9d4e4e04bf676), EConversationDebugInfo::Executing);
                    Quest::OldCamp_OCCHAPTER4_ESCAPEPLAN.SucceedQuest();
                    DC(int64(0xf0c9d4e4e04bf676), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_seraphia_145801_exit_1");
                    DC(int64(0xf0c9d4e4e04bf680), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xf0c9d4e4e04bf680), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    
                    Other.Remember(n"choice_seraphia_145801_exit_2");
                    DC(int64(0xf0c9d4e4e04bf677), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xf0c9d4e4e04bf677), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */