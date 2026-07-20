#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OC_VLK_GRIM_580 : UConversationCharacterSettings
        {
            default ForCharacter = n"OC_VLK_GRIM_580";
        }
        
        
        class UTopic_Hero__OC_VLK_GRIM_580 : UG1RDialogTopic
        {
            default ForCharacter = n"OC_VLK_GRIM_580";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetGrim() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetOC_VLK_DIGGER18_520() const property
            {
                return GetCharacter(n"OC_VLK_DIGGER18_520");
            }
            
            AGothicCharacterState GetOC_VLK_DIGGER29_534() const property
            {
                return GetCharacter(n"OC_VLK_DIGGER29_534");
            }
        }
        
        
        class UChoiceGrimAtocdraussen : UTopic_Hero__OC_VLK_GRIM_580
        {
            default DebugId = int64(0xf325dca8ec466c05);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceGrimReadytogo);
            default Rules.HideIfKnows(UChoiceGrimAtocdraussen);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x3199785572345124), Grim != nullptr && Grim.HasAssignedDailyRoutine(UDailyRoutine_OC_VLK_Grim_580_WaitGuide));
                    DB(int64(0xf325dca8ec466c06), Grim != nullptr && Grim.IsCloseToWaypoint(n"FP_GRIM_GUIDING_GOAL", 300.0f));
                }
                
                if (Grim != nullptr && Grim.HasAssignedDailyRoutine(UDailyRoutine_OC_VLK_Grim_580_WaitGuide))
                    return true;
                
                if (Grim != nullptr && Grim.IsCloseToWaypoint(n"FP_GRIM_GUIDING_GOAL", 300.0f))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf325dca8ec466c07), EConversationDebugInfo::Executing);
                // And here we are. Far out, where Diego can't hear you. 
                Grim.AI.Say(LocText("DIA_GRIM_ATOCDRAUSSEN_06_00"));
                DC(int64(0xf325dca8ec466c07), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_VLK_GRIM, Document::UDocumentSegment_Glossary_OC_VLK_GRIM_Bully);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_LOSTAMULET, Document::UDocumentSegment_CH1_LOSTAMULET_Ambush);
                DB(int64(0x2534e7d64e3d7d3e), OC_VLK_DIGGER29_534 != nullptr && !OC_VLK_DIGGER29_534.IsEveryoneOfThisKindDead());
                DB(int64(0x2534e7d64e3d7d3f), Grim != nullptr && Grim.IsCloseToCharacter(OC_VLK_DIGGER29_534, 1000.0f));
                DB(int64(0x2534e7d64e3d7d40), OC_VLK_DIGGER18_520 != nullptr && !OC_VLK_DIGGER18_520.IsEveryoneOfThisKindDead());
                DB(int64(0x2534e7d64e3d7d41), Grim != nullptr && Grim.IsCloseToCharacter(OC_VLK_DIGGER18_520, 1000.0f));
                
                if (((OC_VLK_DIGGER29_534 != nullptr && !OC_VLK_DIGGER29_534.IsEveryoneOfThisKindDead() && Grim != nullptr && Grim.IsCloseToCharacter(OC_VLK_DIGGER29_534, 1000.0f))) || ((OC_VLK_DIGGER18_520 != nullptr && !OC_VLK_DIGGER18_520.IsEveryoneOfThisKindDead() && Grim != nullptr && Grim.IsCloseToCharacter(OC_VLK_DIGGER18_520, 1000.0f))))
                {
                    DC(int64(0xf325dca8ec466c0c), EConversationDebugInfo::Executing);
                    // Bloodwyn sends his regards.
                    Grim.AI.Say(LocText("DIA_GRIM_ATOCDRAUSSEN_06_01"));
                    DC(int64(0xf325dca8ec466c0c), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0xf325dca8ec466c0d), EConversationDebugInfo::Executing);
                    // Bloodwyn sends his regards.
                    Grim.AI.Say(LocText("DIA_GRIM_ATOCDRAUSSEN_06_01"));
                    DC(int64(0xf325dca8ec466c0d), EConversationDebugInfo::Done);
                }
                DC(int64(0xa84ccdf55e80ffb7), EConversationDebugInfo::Executing);
                Grim.AI.StartAttackingImmediatelyLootOnly(Hero);
                DC(int64(0xa84ccdf55e80ffb7), EConversationDebugInfo::Done);
                DC(int64(0xa84ccdf55e80ffc1), EConversationDebugInfo::Executing);
                if (ensure(IsValid(OC_VLK_DIGGER18_520)) && ensure(IsValid(OC_VLK_DIGGER18_520.AI))) { OC_VLK_DIGGER18_520.AI.StartAttackingImmediatelyLootOnly(Hero); }
                DC(int64(0xa84ccdf55e80ffc1), EConversationDebugInfo::Done);
                DC(int64(0xa84ccdf55e80ffc3), EConversationDebugInfo::Executing);
                if (ensure(IsValid(OC_VLK_DIGGER29_534)) && ensure(IsValid(OC_VLK_DIGGER29_534.AI))) { OC_VLK_DIGGER29_534.AI.StartAttackingImmediatelyLootOnly(Hero); }
                DC(int64(0xa84ccdf55e80ffc3), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceGrimAufnahme : UTopic_Hero__OC_VLK_GRIM_580
        {
            default DebugId = int64(0xf325dca8ec466c36);
            default Caption = LocText("DIA_GRIM_AUFNAHME_15_00");
            default PriorityRank = 2;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceGrimHallo);
            default Rules.HideIfKnows(UChoiceGrimAufnahme);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf1394757aa29f667), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                }
                
                return Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf325dca8ec466c37), EConversationDebugInfo::Executing);
                // How do I get accepted into the camp? 
                Hero.AI.Say(LocText("DIA_GRIM_AUFNAHME_15_00"));
                DC(int64(0xf325dca8ec466c37), EConversationDebugInfo::Done);
                DC(int64(0xf325dca8ec466c38), EConversationDebugInfo::Executing);
                
                // I take it you ain't interested in digging. In that case ...
                Grim.AI.Say(LocText("DIA_GRIM_AUFNAHME_06_01"));
                DC(int64(0xf325dca8ec466c38), EConversationDebugInfo::Done);
                DC(int64(0xf325dca8ec466c39), EConversationDebugInfo::Executing);
                // You should stick with Diego - I did, too. He's all ...
                Grim.AI.Say(LocText("DIA_GRIM_AUFNAHME_06_02"));
                DC(int64(0xf325dca8ec466c39), EConversationDebugInfo::Done);
                DC(int64(0xf325dca8ec466c3a), EConversationDebugInfo::Executing);
                // Later on, your mentor is gonna give you a test of his ...
                Grim.AI.Say(LocText("DIA_GRIM_AUFNAHME_06_03"));
                DC(int64(0xf325dca8ec466c3a), EConversationDebugInfo::Done);
                DC(int64(0xf325dca8ec466c3b), EConversationDebugInfo::Executing);
                // Once you've passed that, they'll let you see Gomez. Then ...
                Grim.AI.Say(LocText("DIA_GRIM_AUFNAHME_06_04"));
                DC(int64(0xf325dca8ec466c3b), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_VLK_GRIM, Document::UDocumentSegment_Glossary_OC_VLK_GRIM_Extended);
            }
        }
        
        
        class UChoiceGrimExit : UTopic_Hero__OC_VLK_GRIM_580
        {
            default DebugId = int64(0xf325dca8ec466be3);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf325dca8ec466be4), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xf325dca8ec466be4), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGrimFalle : UTopic_Hero__OC_VLK_GRIM_580
        {
            default DebugId = int64(0xf325dca8ec466be5);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceGrimFalle);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf325dca8ec466be6), G1R.Grim_ProtectionBully != 0);
                    DB(int64(0xf325dca8ec466be7), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                    DB(int64(0x5646286433625e17), G1R.Bloodwyn_PayDay.IsValid() && G1R.Bloodwyn_PayDay.IsAtLeastXMinutesAgo(300));
                }
                
                if (G1R.Grim_ProtectionBully == 0)
                    return false;
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None))
                    return false;
                
                if (G1R.Bloodwyn_PayDay.IsValid() && !G1R.Bloodwyn_PayDay.IsAtLeastXMinutesAgo(300))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf325dca8ec466be8), EConversationDebugInfo::Executing);
                // Hey, you! You must be the freshie who's been trying to ...
                Grim.AI.Say(LocText("DIA_GRIM_FALLE_06_00"));
                DC(int64(0xf325dca8ec466be8), EConversationDebugInfo::Done);
                DC(int64(0xf325dca8ec466be9), EConversationDebugInfo::Executing);
                
                // And if I am?
                Hero.AI.Say(LocText("DIA_GRIM_FALLE_15_01"));
                DC(int64(0xf325dca8ec466be9), EConversationDebugInfo::Done);
                DC(int64(0xf325dca8ec466bea), EConversationDebugInfo::Executing);
                
                // Well. I could help you ... 
                Grim.AI.Say(LocText("DIA_GRIM_FALLE_06_02"));
                DC(int64(0xf325dca8ec466bea), EConversationDebugInfo::Done);
                DC(int64(0xf325dca8ec466beb), EConversationDebugInfo::Executing);
                
                // How? 
                Hero.AI.Say(LocText("DIA_GRIM_FALLE_15_03"));
                DC(int64(0xf325dca8ec466beb), EConversationDebugInfo::Done);
                DC(int64(0xf325dca8ec466bec), EConversationDebugInfo::Executing);
                
                // I saw a guy right outside the camp, bragging about how ...
                Grim.AI.Say(LocText("DIA_GRIM_FALLE_06_04"));
                DC(int64(0xf325dca8ec466bec), EConversationDebugInfo::Done);
                DC(int64(0xf325dca8ec466bed), EConversationDebugInfo::Executing);
                // He probably still has it on him. If we take him and his ...
                Grim.AI.Say(LocText("DIA_GRIM_FALLE_06_05"));
                DC(int64(0xf325dca8ec466bed), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_VLK_GRIM, Document::UDocumentSegment_Glossary_OC_VLK_GRIM_Introduction);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_LOSTAMULET, Document::UDocumentSegment_CH1_LOSTAMULET_Start);
                Subdialog(
                    UChoiceGrimFalleDeny,
                    UChoiceGrimFalleHowshare
                );
            }
        }
        
        
        class UChoiceGrimFalleDeny : UTopic_Hero__OC_VLK_GRIM_580
        {
            default DebugId = int64(0xe8603e87342be557);
            default Caption = LocText("DIA_GRIM_FALLE_DENY_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf325dca8ec466bf0), EConversationDebugInfo::Executing);
                // Not interested. Go find someone else.
                Hero.AI.Say(LocText("DIA_GRIM_FALLE_DENY_15_00"));
                DC(int64(0xf325dca8ec466bf0), EConversationDebugInfo::Done);
                DC(int64(0xf325dca8ec466bf1), EConversationDebugInfo::Executing);
                
                // Really? You're not gonna make it far like this. Let me ...
                Grim.AI.Say(LocText("DIA_GRIM_FALLE_DENY_06_01"));
                DC(int64(0xf325dca8ec466bf1), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceGrimFalleHowshare : UTopic_Hero__OC_VLK_GRIM_580
        {
            default DebugId = int64(0xe8603e87342be55b);
            default Caption = LocText("DIA_GRIM_FALLE_HOWSHARE_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf325dca8ec466bf3), EConversationDebugInfo::Executing);
                
                // What do we do with that amulet?
                Hero.AI.Say(LocText("DIA_GRIM_FALLE_HOWSHARE_15_00"));
                DC(int64(0xf325dca8ec466bf3), EConversationDebugInfo::Done);
                DC(int64(0xf325dca8ec466bf4), EConversationDebugInfo::Executing);
                
                // What do you think? I'll take it back to the barons and ...
                Grim.AI.Say(LocText("DIA_GRIM_FALLE_HOWSHARE_06_01"));
                DC(int64(0xf325dca8ec466bf4), EConversationDebugInfo::Done);
                Subdialog(
                    UChoiceGrimFalleHalfhalf,
                    UChoiceGrimFalleAccepr
                );
            }
        }
        
        
        class UChoiceGrimFalleHalfhalf : UTopic_Hero__OC_VLK_GRIM_580
        {
            default DebugId = int64(0xe8603e87342be55d);
            default Caption = LocText("DIA_GRIM_FALLE_HALFHALF_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UChoiceGrimFalleHalfhalf);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf325dca8ec466bf7), EConversationDebugInfo::Executing);
                // Ahh, forget about it. We go halves, or you can beat up ...
                Hero.AI.Say(LocText("DIA_GRIM_FALLE_HALFHALF_15_00"));
                DC(int64(0xf325dca8ec466bf7), EConversationDebugInfo::Done);
                DC(int64(0xf325dca8ec466bf8), EConversationDebugInfo::Executing);
                
                // All right, all right, halves it is. Guess it'll be ...
                Grim.AI.Say(LocText("DIA_GRIM_FALLE_HALFHALF_06_01"));
                DC(int64(0xf325dca8ec466bf8), EConversationDebugInfo::Done);
                DC(int64(0x1a22b4e2fa8a123f), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x1a22b4e2fa8a123f), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceGrimFalleAccepr : UTopic_Hero__OC_VLK_GRIM_580
        {
            default DebugId = int64(0x1a22b4e2fa8a1240);
            default Caption = LocText("DIA_GRIM_FALLE_ACCEPR_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UChoiceGrimFalleAccepr);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf325dca8ec466bfb), EConversationDebugInfo::Executing);
                // I'm in.
                Hero.AI.Say(LocText("DIA_GRIM_FALLE_ACCEPR_15_00"));
                DC(int64(0xf325dca8ec466bfb), EConversationDebugInfo::Done);
                DC(int64(0xf325dca8ec466bfc), EConversationDebugInfo::Executing);
                
                // Great! Tell me when you're ready.
                Grim.AI.Say(LocText("DIA_GRIM_FALLE_ACCEPR_06_01"));
                DC(int64(0xf325dca8ec466bfc), EConversationDebugInfo::Done);
                DC(int64(0xa84ccdf55e80ff93), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_LOSTAMULET.StartQuest();
                DC(int64(0xa84ccdf55e80ff93), EConversationDebugInfo::Done);
                DC(int64(0xa84ccdf55e80ffa1), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_LOSTAMULET_LOSTAMULET_OBJ_JOIN.StartQuest();
                DC(int64(0xa84ccdf55e80ffa1), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceGrimHallo : UTopic_Hero__OC_VLK_GRIM_580
        {
            default DebugId = int64(0xf325dca8ec466c2f);
            default Caption = LocText("DIA_GRIM_HALLO_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceGrimHallo);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf40842f578ba7e4a), Hero != nullptr && !Hero.HasListenedTo(LocText("DIA_GRIM_INEXTREMO_06_01")));
                    DB(int64(0xf40842f578ba7e4c), Hero != nullptr && !Hero.HasListenedTo(LocText("DIA_GRIM_AUFNAHME_06_01")));
                    DB(int64(0xf40842f578ba7e4e), Hero != nullptr && !Hero.HasListenedTo(LocText("DIA_GRIM_FALLE_06_00")));
                }
                
                if (Hero != nullptr && !Hero.HasListenedTo(LocText("DIA_GRIM_INEXTREMO_06_01")))
                    return true;
                
                if (Hero != nullptr && !Hero.HasListenedTo(LocText("DIA_GRIM_AUFNAHME_06_01")))
                    return true;
                
                if (Hero != nullptr && !Hero.HasListenedTo(LocText("DIA_GRIM_FALLE_06_00")))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf325dca8ec466c31), EConversationDebugInfo::Executing);
                // Hey. I'm new here. 
                Hero.AI.Say(LocText("DIA_GRIM_HALLO_15_00"));
                DC(int64(0xf325dca8ec466c31), EConversationDebugInfo::Done);
                DC(int64(0xf325dca8ec466c32), EConversationDebugInfo::Executing);
                
                // Fresh in, are you? I'm Grim - only just got here myself. ...
                Grim.AI.Say(LocText("DIA_GRIM_HALLO_06_01"));
                DC(int64(0xf325dca8ec466c32), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_VLK_GRIM, Document::UDocumentSegment_Glossary_OC_VLK_GRIM_Introduction);
            }
        }
        
        
        class UChoiceGrimHowfarareyou : UTopic_Hero__OC_VLK_GRIM_580
        {
            default DebugId = int64(0xf325dca8ec466c3c);
            default Caption = LocText("DIA_GRIM_HOWFARAREYOU_15_00");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceGrimYourpdv);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf325dca8ec466c3d), Quest::OldCamp_OCCHAPTER1_JOINOC != nullptr && Quest::OldCamp_OCCHAPTER1_JOINOC.IsRunning());
                    DB(int64(0x91d92469945fba06), Quest::OldCamp_OCCHAPTER1_BROWNIEPOINTS != nullptr && Quest::OldCamp_OCCHAPTER1_BROWNIEPOINTS.IsRunning());
                }
                
                if (Quest::OldCamp_OCCHAPTER1_JOINOC != nullptr && !Quest::OldCamp_OCCHAPTER1_JOINOC.IsRunning())
                    return false;
                
                if (Quest::OldCamp_OCCHAPTER1_BROWNIEPOINTS != nullptr && !Quest::OldCamp_OCCHAPTER1_BROWNIEPOINTS.IsRunning())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf325dca8ec466c3e), EConversationDebugInfo::Executing);
                // How's your progress with the Shadows? 
                Hero.AI.Say(LocText("DIA_GRIM_HOWFARAREYOU_15_00"));
                DC(int64(0xf325dca8ec466c3e), EConversationDebugInfo::Done);
                DC(int64(0xf325dca8ec466c3f), EConversationDebugInfo::Executing);
                
                // So far, I convinced Dexter, Sly, and Fingers. They're ...
                Grim.AI.Say(LocText("DIA_GRIM_HOWFARAREYOU_06_01"));
                DC(int64(0xf325dca8ec466c3f), EConversationDebugInfo::Done);
                DB(int64(0xf325dca8ec466c41), G1R.Grim_Tests == 0);
                
                if (G1R.Grim_Tests == 0)
                {
                    DC(int64(0x4adba253335671f9), EConversationDebugInfo::Executing);
                    G1R.Grim_Tests = 1;
                    DC(int64(0x4adba253335671f9), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_grim_howfarareyou_exit_1");
                }
                else
                {
                    
                    Other.Remember(n"choice_grim_howfarareyou_exit_2");
                }
            }
        }
        
        
        class UChoiceGrimLeben : UTopic_Hero__OC_VLK_GRIM_580
        {
            default DebugId = int64(0xf325dca8ec466c33);
            default Caption = LocText("DIA_GRIM_LEBEN_15_00");
            default PriorityRank = 2;
            
            default Rules.HideIfKnows(UChoiceGrimLeben);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf325dca8ec466c34), EConversationDebugInfo::Executing);
                // What's it like living here?
                Hero.AI.Say(LocText("DIA_GRIM_LEBEN_15_00"));
                DC(int64(0xf325dca8ec466c34), EConversationDebugInfo::Done);
                DC(int64(0xf325dca8ec466c35), EConversationDebugInfo::Executing);
                
                // It's fine. So long as you pay the warders ... 
                Grim.AI.Say(LocText("DIA_GRIM_LEBEN_06_01"));
                DC(int64(0xf325dca8ec466c35), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceGrimNachfalle : UTopic_Hero__OC_VLK_GRIM_580
        {
            default DebugId = int64(0xf325dca8ec466c1c);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceGrimAtocdraussen);
            default Rules.HideIfKnows(UChoiceGrimNachfalle);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa84ccdf55e81013c), Hero != nullptr && Hero.WasDefeatedBy(Grim));
                    DB(int64(0xa84ccdf55e80ffc4), Grim != nullptr && Grim.WasDefeatedBy(Hero));
                }
                
                if (Hero != nullptr && Hero.WasDefeatedBy(Grim))
                    return true;
                
                if (Grim != nullptr && Grim.WasDefeatedBy(Hero))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf325dca8ec466c1e), EConversationDebugInfo::Executing);
                
                // Asshole. 
                Hero.AI.Say(LocText("DIA_GRIM_NACHFALLE_15_01"));
                DC(int64(0xf325dca8ec466c1e), EConversationDebugInfo::Done);
                DC(int64(0xf325dca8ec466c1f), EConversationDebugInfo::Executing);
                
                // Oh, come on - we're both playing the same game, aren't ...
                Grim.AI.Say(LocText("DIA_GRIM_NACHFALLE_06_02"));
                DC(int64(0xf325dca8ec466c1f), EConversationDebugInfo::Done);
                DC(int64(0xf325dca8ec466c20), EConversationDebugInfo::Executing);
                // That's why I'll just do what the warders tell me. It's ...
                Grim.AI.Say(LocText("DIA_GRIM_NACHFALLE_06_03"));
                DC(int64(0xf325dca8ec466c20), EConversationDebugInfo::Done);
                DC(int64(0x423c311dbf8d0df7), EConversationDebugInfo::Executing);
                
                // So Bloodwyn put you up to this? 
                Hero.AI.Say(LocText("TEXT_WIP_BDCKZPD_20241104_162227"));
                DC(int64(0x423c311dbf8d0df7), EConversationDebugInfo::Done);
                DC(int64(0xf325dca8ec466c21), EConversationDebugInfo::Executing);
                
                // Take your best guess. Never cross a warder, man - that's ...
                Grim.AI.Say(LocText("DIA_GRIM_NACHFALLE_06_04"));
                DC(int64(0xf325dca8ec466c21), EConversationDebugInfo::Done);
                DB(int64(0xe25b71e97d3b831), Hero != nullptr && Hero.WasDefeatedBy(Grim));
                
                if (Hero != nullptr && Hero.WasDefeatedBy(Grim))
                {
                    DC(int64(0xf325dca8ec466c22), EConversationDebugInfo::Executing);
                    // It's nothing personal. So - are we good? Or do you want ...
                    Grim.AI.Say(LocText("DIA_GRIM_NACHFALLE_06_05"));
                    DC(int64(0xf325dca8ec466c22), EConversationDebugInfo::Done);
                }
                DC(int64(0xa84ccdf55e810142), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_LOSTAMULET_LOSTAMULET_OBJ_FIND.FailQuest();
                DC(int64(0xa84ccdf55e810142), EConversationDebugInfo::Done);
                DC(int64(0x6bca3c95cd23121b), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_LOSTAMULET.SucceedQuest();
                DC(int64(0x6bca3c95cd23121b), EConversationDebugInfo::Done);
                Subdialog(
                    UChoiceGrimNachfalleWeiterpruegeln,
                    UChoiceGrimNachfalleFrieden
                );
            }
        }
        
        
        class UChoiceGrimNachfalleWeiterpruegeln : UTopic_Hero__OC_VLK_GRIM_580
        {
            default DebugId = int64(0xe8603e87342be599);
            default Caption = LocText("DIA_GRIM_NACHFALLE_WEITERPRUEGELN_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf325dca8ec466c25), EConversationDebugInfo::Executing);
                // Shut up and fight.
                Hero.AI.Say(LocText("DIA_GRIM_NACHFALLE_WEITERPRUEGELN_15_00"));
                DC(int64(0xf325dca8ec466c25), EConversationDebugInfo::Done);
                DC(int64(0xf325dca8ec466c26), EConversationDebugInfo::Executing);
                
                // Oh, come on, man ... 
                Grim.AI.Say(LocText("DIA_GRIM_NACHFALLE_WEITERPRUEGELN_06_01"));
                DC(int64(0xf325dca8ec466c26), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_LOSTAMULET, Document::UDocumentSegment_CH1_LOSTAMULET_Dead);
                DC(int64(0x4adba253335671be), EConversationDebugInfo::Executing);
                Grim.AI.StartAttackingImmediately(Hero);
                DC(int64(0x4adba253335671be), EConversationDebugInfo::Done);
                DB(int64(0x2534e7d64e3d7d48), OC_VLK_DIGGER18_520 != nullptr && !OC_VLK_DIGGER18_520.IsEveryoneOfThisKindDead());
                DB(int64(0x2534e7d64e3d7d49), Grim != nullptr && Grim.IsCloseToCharacter(OC_VLK_DIGGER18_520, 1000.0f));
                
                if (OC_VLK_DIGGER18_520 != nullptr && !OC_VLK_DIGGER18_520.IsEveryoneOfThisKindDead() && Grim != nullptr && Grim.IsCloseToCharacter(OC_VLK_DIGGER18_520, 1000.0f))
                {
                    DC(int64(0x4adba253335671b8), EConversationDebugInfo::Executing);
                    if (ensure(IsValid(OC_VLK_DIGGER18_520)) && ensure(IsValid(OC_VLK_DIGGER18_520.AI))) { OC_VLK_DIGGER18_520.AI.StartAttackingImmediately(Hero); }
                    DC(int64(0x4adba253335671b8), EConversationDebugInfo::Done);
                }
                DB(int64(0x2534e7d64e3d7d4d), OC_VLK_DIGGER29_534 != nullptr && !OC_VLK_DIGGER29_534.IsEveryoneOfThisKindDead());
                DB(int64(0x2534e7d64e3d7d4e), Grim != nullptr && Grim.IsCloseToCharacter(OC_VLK_DIGGER29_534, 1000.0f));
                
                if (OC_VLK_DIGGER29_534 != nullptr && !OC_VLK_DIGGER29_534.IsEveryoneOfThisKindDead() && Grim != nullptr && Grim.IsCloseToCharacter(OC_VLK_DIGGER29_534, 1000.0f))
                {
                    DC(int64(0x4adba253335671b1), EConversationDebugInfo::Executing);
                    if (ensure(IsValid(OC_VLK_DIGGER29_534)) && ensure(IsValid(OC_VLK_DIGGER29_534.AI))) { OC_VLK_DIGGER29_534.AI.StartAttackingImmediately(Hero); }
                    DC(int64(0x4adba253335671b1), EConversationDebugInfo::Done);
                }
                DC(int64(0xf325dca8ec466c1b), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xf325dca8ec466c1b), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGrimNachfalleFrieden : UTopic_Hero__OC_VLK_GRIM_580
        {
            default DebugId = int64(0xe8603e87342be5a0);
            default Caption = LocText("DIA_GRIM_NACHFALLE_FRIEDEN_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf325dca8ec466c2b), EConversationDebugInfo::Executing);
                // Let's the bury the hatchet. 
                Hero.AI.Say(LocText("DIA_GRIM_NACHFALLE_FRIEDEN_15_00"));
                DC(int64(0xf325dca8ec466c2b), EConversationDebugInfo::Done);
                DC(int64(0xf325dca8ec466c2c), EConversationDebugInfo::Executing);
                
                // Never was one as far as I'm concerned. Glad you could ...
                Grim.AI.Say(LocText("DIA_GRIM_NACHFALLE_FRIEDEN_06_01"));
                DC(int64(0xf325dca8ec466c2c), EConversationDebugInfo::Done);
                DC(int64(0xf325dca8ec466c2d), EConversationDebugInfo::Executing);
                // If you ever need someone to give you backup, let me ...
                Grim.AI.Say(LocText("DIA_GRIM_NACHFALLE_FRIEDEN_06_02"));
                DC(int64(0xf325dca8ec466c2d), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_LOSTAMULET, Document::UDocumentSegment_CH1_LOSTAMULET_Forgive);
                DC(int64(0x4adba2533356721b), EConversationDebugInfo::Executing);
                Grim.SetRelationshipTowards(Hero, ERelationship::Friend);
                DC(int64(0x4adba2533356721b), EConversationDebugInfo::Done);
                DC(int64(0x921e899f1d81838c), EConversationDebugInfo::Executing);
                Grim.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Grim_580_Start);
                DC(int64(0x921e899f1d81838c), EConversationDebugInfo::Done);
                DC(int64(0x1b22e1b16270e045), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x1b22e1b16270e045), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGrimReadytogo : UTopic_Hero__OC_VLK_GRIM_580
        {
            default DebugId = int64(0xf325dca8ec466c00);
            default Caption = LocText("DIA_GRIM_READYTOGO_15_00");
            default PriorityRank = 2;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceGrimFalle);
            default Rules.HideIfKnows(UChoiceGrimReadytogo);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf325dca8ec466c01), EConversationDebugInfo::Executing);
                // Let's go get that amulet. 
                Hero.AI.Say(LocText("DIA_GRIM_READYTOGO_15_00"));
                DC(int64(0xf325dca8ec466c01), EConversationDebugInfo::Done);
                DC(int64(0xf325dca8ec466c02), EConversationDebugInfo::Executing);
                
                // Music to my ears. 
                Grim.AI.Say(LocText("DIA_GRIM_READYTOGO_06_01"));
                DC(int64(0xf325dca8ec466c02), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_LOSTAMULET, Document::UDocumentSegment_CH1_LOSTAMULET_Join);
                DC(int64(0x4adba25333567229), EConversationDebugInfo::Executing);
                Grim.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Grim_580_Guide);
                DC(int64(0x4adba25333567229), EConversationDebugInfo::Done);
                DC(int64(0xa84ccdf55e80ff99), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_LOSTAMULET.StartQuest();
                DC(int64(0xa84ccdf55e80ff99), EConversationDebugInfo::Done);
                DC(int64(0xa84ccdf55e80ffa3), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_LOSTAMULET_LOSTAMULET_OBJ_JOIN.SucceedQuest();
                DC(int64(0xa84ccdf55e80ffa3), EConversationDebugInfo::Done);
                DC(int64(0xf325dca8ec466c04), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xf325dca8ec466c04), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGrimYourpdv : UTopic_Hero__OC_VLK_GRIM_580
        {
            default DebugId = int64(0xf325dca8ec466c43);
            default Caption = LocText("DIA_GRIM_YOURPDV_15_00");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceGrimAufnahme);
            default Rules.HideIfKnows(UChoiceGrimYourpdv);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf325dca8ec466c44), EConversationDebugInfo::Executing);
                // What was YOUR test? 
                Hero.AI.Say(LocText("DIA_GRIM_YOURPDV_15_00"));
                DC(int64(0xf325dca8ec466c44), EConversationDebugInfo::Done);
                DC(int64(0xf325dca8ec466c45), EConversationDebugInfo::Executing);
                
                // I can't tell you that, man. It's confidential. 
                Grim.AI.Say(LocText("DIA_GRIM_YOURPDV_06_01"));
                DC(int64(0xf325dca8ec466c45), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */