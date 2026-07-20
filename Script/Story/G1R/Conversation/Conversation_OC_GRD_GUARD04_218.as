#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OC_GRD_GUARD04_218 : UConversationCharacterSettings
        {
            default ForCharacter = n"OC_GRD_GUARD04_218";
        }
        
        
        class UTopic_Hero__OC_GRD_GUARD04_218 : UG1RDialogTopic
        {
            default ForCharacter = n"OC_GRD_GUARD04_218";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetGuard() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceGrd218Attack : UTopic_Hero__OC_GRD_GUARD04_218
        {
            default DebugId = int64(0x1249e7f8a18c0bee);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x73e4f9f810dec9fd), Hero != nullptr && Hero.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                    DB(int64(0x73e4f9f810dec9fe), Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.IsRunning());
                    DB(int64(0x73e4f9f810deca02), G1R.GuardPassageWarning_OC == 1);
                    DB(int64(0x79e2a3da875724bd), Hero != nullptr && Hero.IsCloseToWaypoint(n"WP_OC_GatePoint2", 200.0f));
                    DB(int64(0x79e2a3da875724be), Guard != nullptr && Guard.IsAtPreferredLocation(500.0f));
                    DB(int64(0x79e2a3da875724bf), G1R.Thorus_Permission_Interior == 0);
                    DB(int64(0x1249e7f8a18c0bef), G1R.GuardPassageWarning_OC == 1);
                    DB(int64(0x1249e7f8a18c0bf0), G1R.Thorus_Permission_Interior == 0);
                    DB(int64(0x1249e7f8a18c0bf1), Guard != nullptr && !Guard.IsFriendlyTowards(Hero));
                    DB(int64(0x1249e7f8a18c0bf2), Hero != nullptr && Hero.IsCloseToWaypoint(n"WP_OC_GatePoint2", 200.0f));
                    DB(int64(0x1249e7f8a18c0bf3), Guard != nullptr && Guard.IsAtPreferredLocation(500.0f));
                    DB(int64(0xb184f10cca916cd3), Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.IsRunning());
                    DB(int64(0x4c3b353c1aae11f4), Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.IsRunning());
                    DB(int64(0x4c3b353c1aae11f5), Hero != nullptr && Hero.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                    DB(int64(0x73e4f9f810deca03), G1R.GuardPassageWarning_OC == 1);
                    DB(int64(0x79e2a3da875724c0), Hero != nullptr && Hero.IsCloseToWaypoint(n"WP_OC_GatePoint2", 200.0f));
                    DB(int64(0x79e2a3da875724c1), Guard != nullptr && Guard.IsAtPreferredLocation(500.0f));
                    DB(int64(0x79e2a3da875724c2), G1R.Thorus_Permission_Interior == 0);
                }
                
                if (Hero != nullptr && Hero.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp) && Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.IsRunning() && G1R.GuardPassageWarning_OC == 1 && Hero != nullptr && Hero.IsCloseToWaypoint(n"WP_OC_GatePoint2", 200.0f) && Guard != nullptr && Guard.IsAtPreferredLocation(500.0f) && G1R.Thorus_Permission_Interior == 0)
                    return true;
                
                if (G1R.GuardPassageWarning_OC == 1 && G1R.Thorus_Permission_Interior == 0 && Guard != nullptr && !Guard.IsFriendlyTowards(Hero) && Hero != nullptr && Hero.IsCloseToWaypoint(n"WP_OC_GatePoint2", 200.0f) && Guard != nullptr && Guard.IsAtPreferredLocation(500.0f) && Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.IsRunning())
                    return true;
                
                if (Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.IsRunning() && Hero != nullptr && Hero.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && G1R.GuardPassageWarning_OC == 1 && Hero != nullptr && Hero.IsCloseToWaypoint(n"WP_OC_GatePoint2", 200.0f) && Guard != nullptr && Guard.IsAtPreferredLocation(500.0f) && G1R.Thorus_Permission_Interior == 0)
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                Print("Skipped Guard.AI.FullStop()");
                Print("Skipped Guard.AI.SignalIntruderAlert(Hero)");
                DC(int64(0x79929a2cd969cfc1), EConversationDebugInfo::Executing);
                Guard.AI.StartAttackingImmediatelyLootOnly(Hero);
                DC(int64(0x79929a2cd969cfc1), EConversationDebugInfo::Done);
                DC(int64(0x1249e7f8a18c0bf9), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x1249e7f8a18c0bf9), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGrd218Exit : UTopic_Hero__OC_GRD_GUARD04_218
        {
            default DebugId = int64(0x1249e7f8a18c0bd9);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1249e7f8a18c0bda), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x1249e7f8a18c0bda), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGrd218Firstin : UTopic_Hero__OC_GRD_GUARD04_218
        {
            default DebugId = int64(0x1249e7f8a18c0bdb);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::LetOtherWalk;
            
            default Rules.HideIfKnows(UChoiceGrd218Firstin);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4c3b353c1aae11cf), Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.IsRunning());
                    DB(int64(0x4c3b353c1aae11d0), G1R != nullptr && G1R.HasReachedChapter(2));
                    DB(int64(0x4c3b353c1aae11d1), Hero != nullptr && Hero.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp));
                    DB(int64(0x1249e7f8a18c0bdc), G1R.Thorus_Permission_Interior != 0);
                    DB(int64(0xb184f10cca916cd1), Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.IsRunning());
                }
                
                if (Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.IsRunning() && G1R != nullptr && G1R.HasReachedChapter(2) && Hero != nullptr && Hero.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp))
                    return true;
                
                if (G1R.Thorus_Permission_Interior != 0 && Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.IsRunning())
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1249e7f8a18c0bdd), EConversationDebugInfo::Executing);
                // Stop right there. What do you want?
                Guard.AI.Say(LocText("DIA_GRD_218_FIRSTIN_07_00"));
                DC(int64(0x1249e7f8a18c0bdd), EConversationDebugInfo::Done);
                DC(int64(0x1249e7f8a18c0bde), EConversationDebugInfo::Executing);
                
                // To go in there.
                Hero.AI.Say(LocText("DIA_GRD_218_FIRSTIN_15_01"));
                DC(int64(0x1249e7f8a18c0bde), EConversationDebugInfo::Done);
                DC(int64(0x1249e7f8a18c0bdf), EConversationDebugInfo::Executing);
                
                // Are you joking? 
                Guard.AI.Say(LocText("DIA_GRD_218_FIRSTIN_07_02"));
                DC(int64(0x1249e7f8a18c0bdf), EConversationDebugInfo::Done);
                DC(int64(0x1249e7f8a18c0be0), EConversationDebugInfo::Executing);
                
                // Ask Thorus.
                Hero.AI.Say(LocText("DIA_GRD_218_FIRSTIN_15_03"));
                DC(int64(0x1249e7f8a18c0be0), EConversationDebugInfo::Done);
                DC(int64(0x1249e7f8a18c0be1), EConversationDebugInfo::Executing);
                
                // Hmm... I will. If you lied, you're dead.
                Guard.AI.Say(LocText("DIA_GRD_218_FIRSTIN_07_04"));
                DC(int64(0x1249e7f8a18c0be1), EConversationDebugInfo::Done);
                DC(int64(0x1249e7f8a18c0be2), EConversationDebugInfo::Executing);
                
                // Does that mean I can go in?
                Hero.AI.Say(LocText("DIA_GRD_218_FIRSTIN_15_05"));
                DC(int64(0x1249e7f8a18c0be2), EConversationDebugInfo::Done);
                DC(int64(0x1249e7f8a18c0be3), EConversationDebugInfo::Executing);
                
                // (exhales in annoyance) Fine.
                Guard.AI.Say(LocText("DIA_GRD_218_FIRSTIN_07_06"));
                DC(int64(0x1249e7f8a18c0be3), EConversationDebugInfo::Done);
                DC(int64(0x73e4f9f810deca00), EConversationDebugInfo::Executing);
                G1R.Thorus_Permission_Interior = 1;
                DC(int64(0x73e4f9f810deca00), EConversationDebugInfo::Done);
                DC(int64(0xfad2b602c2465b10), EConversationDebugInfo::Executing);
                G1R.GuardPassageWarning_OC = 2;
                DC(int64(0xfad2b602c2465b10), EConversationDebugInfo::Done);
                DC(int64(0x73e4f9f810deca01), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x73e4f9f810deca01), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGrd218Firstwarn : UTopic_Hero__OC_GRD_GUARD04_218
        {
            default DebugId = int64(0x1249e7f8a18c0be5);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x73e4f9f810dec9fd), Hero != nullptr && Hero.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                    DB(int64(0x73e4f9f810dec9fe), Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.IsRunning());
                    DB(int64(0x73e4f9f810deca02), G1R.GuardPassageWarning_OC == 0);
                    DB(int64(0x1249e7f8a18c0be6), G1R.GuardPassageWarning_OC == 0);
                    DB(int64(0x1249e7f8a18c0be7), G1R.Thorus_Permission_Interior == 0);
                    DB(int64(0x1249e7f8a18c0be8), Guard != nullptr && !Guard.IsFriendlyTowards(Hero));
                    DB(int64(0x1249e7f8a18c0be9), Guard != nullptr && Guard.IsAtPreferredLocation(500.0f));
                    DB(int64(0xb184f10cca916cd2), Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.IsRunning());
                    DB(int64(0x4c3b353c1aae11f4), Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.IsRunning());
                    DB(int64(0x4c3b353c1aae11f5), Hero != nullptr && Hero.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                    DB(int64(0x73e4f9f810deca03), G1R.GuardPassageWarning_OC == 0);
                }
                
                if (Hero != nullptr && Hero.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp) && Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.IsRunning() && G1R.GuardPassageWarning_OC == 0)
                    return true;
                
                if (G1R.GuardPassageWarning_OC == 0 && G1R.Thorus_Permission_Interior == 0 && Guard != nullptr && !Guard.IsFriendlyTowards(Hero) && Guard != nullptr && Guard.IsAtPreferredLocation(500.0f) && Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.IsRunning())
                    return true;
                
                if (Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.IsRunning() && Hero != nullptr && Hero.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && G1R.GuardPassageWarning_OC == 0)
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1249e7f8a18c0bea), EConversationDebugInfo::Executing);
                // Stop it right there.
                Guard.AI.Say(LocText("INFO_GRD_218_FIRSTWARN_INFO_07_01"));
                DC(int64(0x1249e7f8a18c0bea), EConversationDebugInfo::Done);
                DC(int64(0x1249e7f8a18c0beb), EConversationDebugInfo::Executing);
                
                // Why?
                Hero.AI.Say(LocText("INFO_GRD_218_FIRSTWARN_INFO_15_02"));
                DC(int64(0x1249e7f8a18c0beb), EConversationDebugInfo::Done);
                DC(int64(0x1249e7f8a18c0bec), EConversationDebugInfo::Executing);
                
                // This is where the ore barons live. No entry for scum ...
                Guard.AI.Say(LocText("INFO_GRD_218_FIRSTWARN_INFO_07_03"));
                DC(int64(0x1249e7f8a18c0bec), EConversationDebugInfo::Done);
                DB(int64(0x73e4f9f810deca0b), Hero != nullptr && Hero.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                DB(int64(0x73e4f9f810deca0f), Hero != nullptr && Hero.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                
                if (Hero != nullptr && Hero.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp))
                {
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_DREAMEDLAND, Document::UDocumentSegment_CH3_DREAMEDLAND_AccessSC);
                }
                else if (Hero != nullptr && Hero.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp))
                {
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_DREAMEDLAND, Document::UDocumentSegment_CH3_DREAMEDLAND_AccessNC);
                }
                DC(int64(0x79929a2cd96a047b), EConversationDebugInfo::Executing);
                G1R.GuardPassageWarning_OC = 1;
                DC(int64(0x79929a2cd96a047b), EConversationDebugInfo::Done);
                DC(int64(0x1249e7f8a18c0bed), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x1249e7f8a18c0bed), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGuard97909 : UTopic_Hero__OC_GRD_GUARD04_218
        {
            default DebugId = int64(0x340f78eff0ad23e4);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceGuard97909);
            
            default Rules.RequireCharacterCloseToWaypoint(n"HERO", n"WP_OC_GatePoint2", 400.0f, int64(0x340f78eff0ad23e4));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x340f78eff0ad23e7), Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.IsRunning());
                }
                
                return Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x340f78eff0ad23e3), EConversationDebugInfo::Executing);
                // Now's a bad time. 
                Guard.AI.Say(LocText("TEXT_WIP_IXKHAXF_20240528_143300_2785"));
                DC(int64(0x340f78eff0ad23e3), EConversationDebugInfo::Done);
                DC(int64(0x6bf71ddc274f70ec), EConversationDebugInfo::Executing);
                
                // What's the matter?
                Hero.AI.Say(LocText("TEXT_WIP_APBBQAJ_20240612_182443"));
                DC(int64(0x6bf71ddc274f70ec), EConversationDebugInfo::Done);
                DC(int64(0x6bf71ddc274f70ed), EConversationDebugInfo::Executing);
                
                // None of your business. Keep moving. 
                Guard.AI.Say(LocText("TEXT_WIP_APBBQAJ_20240612_182446"));
                DC(int64(0x6bf71ddc274f70ed), EConversationDebugInfo::Done);
                DC(int64(0x340f78eff0ad23eb), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x340f78eff0ad23eb), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGuard97986 : UTopic_Hero__OC_GRD_GUARD04_218
        {
            default DebugId = int64(0x340f78eff0ad23ef);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceGuard97986);
            
            default Rules.RequireCharacterCloseToWaypoint(n"HERO", n"WP_OC_GatePoint2", 200.0f, int64(0x340f78eff0ad23ef));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x340f78eff0ad23f2), Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.IsRunning());
                }
                
                return Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf7e2eac22184917b), EConversationDebugInfo::Executing);
                Guard.SetRelationshipUntilDefeat(Hero, ERelationship::Enemy);
                DC(int64(0xf7e2eac22184917b), EConversationDebugInfo::Done);
                DC(int64(0xf7e2eac22184917d), EConversationDebugInfo::Executing);
                Guard.AI.StartAttackingImmediately(Hero);
                DC(int64(0xf7e2eac22184917d), EConversationDebugInfo::Done);
                DC(int64(0x340f78eff0ad23f6), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x340f78eff0ad23f6), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */