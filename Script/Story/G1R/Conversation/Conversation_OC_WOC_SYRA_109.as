#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OC_WOC_SYRA_109 : UConversationCharacterSettings
        {
            default ForCharacter = n"OC_WOC_SYRA_109";
        }
        
        
        class UTopic_Hero__OC_WOC_SYRA_109 : UG1RDialogTopic
        {
            default ForCharacter = n"OC_WOC_SYRA_109";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetSyra() const property
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
            
            AGothicCharacterState GetSeraphia() const property
            {
                return GetCharacter(n"OC_WOC_SERAPHIA_110");
            }
            
            AGothicCharacterState GetVelaya() const property
            {
                return GetCharacter(n"OC_WOC_VELAYA_108");
            }
            
            AGothicCharacterState GetBullit() const property
            {
                return GetCharacter(n"OCR_GRD_BULLIT_203");
            }
        }
        
        
        class UChoiceSyra134690 : UTopic_Hero__OC_WOC_SYRA_109
        {
            default DebugId = int64(0x57b48daa1d064fa7);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x57b48daa1d064fa6), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x57b48daa1d064fa6), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceSyra134706 : UTopic_Hero__OC_WOC_SYRA_109
        {
            default DebugId = int64(0x57b48daa1d064fab);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceSyra134706);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x1748b60c9b860619), Hero != nullptr && Hero.IsInConversation());
                }
                
                return Hero != nullptr && Hero.IsInConversation();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5744e9195446efc8), EConversationDebugInfo::Executing);
                // What is it? I'm busy. 
                Syra.AI.Say(LocText("TEXT_WIP_CSWYRII_20250114_143639"));
                DC(int64(0x5744e9195446efc8), EConversationDebugInfo::Done);
                DC(int64(0x57b48daa1d064fa9), EConversationDebugInfo::Executing);
                
                // Hey, I'm new here. Who are you?
                Hero.AI.Say(LocText("TEXT_WIP_UKEKYCE_20250109_114848_41"));
                DC(int64(0x57b48daa1d064fa9), EConversationDebugInfo::Done);
                DC(int64(0x57b48daa1d064fbd), EConversationDebugInfo::Executing);
                
                // (strained sigh) Is this one of his games again? Look, I ...
                Syra.AI.Say(LocText("TEXT_WIP_UKEKYCE_20250109_115824"));
                DC(int64(0x57b48daa1d064fbd), EConversationDebugInfo::Done);
                DC(int64(0x5744e9195446efcc), EConversationDebugInfo::Executing);
                
                // What are you talking about?
                Hero.AI.Say(LocText("TEXT_WIP_CSWYRII_20250114_144416"));
                DC(int64(0x5744e9195446efcc), EConversationDebugInfo::Done);
                DC(int64(0x5744e9195446efcd), EConversationDebugInfo::Executing);
                
                // You're not- Oh. I'm ... I'm sorry.
                Syra.AI.Say(LocText("TEXT_WIP_CSWYRII_20250114_144420"));
                DC(int64(0x5744e9195446efcd), EConversationDebugInfo::Done);
                DC(int64(0x5744e9195446efcb), EConversationDebugInfo::Executing);
                // My point stands though: I'm busy. Unless there's ...
                Syra.AI.Say(LocText("TEXT_WIP_CSWYRII_20250114_144203"));
                DC(int64(0x5744e9195446efcb), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_WOC_SYRA, Document::UDocumentSegment_Glossary_OC_WOC_SYRA_Introduction);
                Subdialog(
                    UTopic_Syra_141123,
                    UTopic_Syra_134812,
                    UTopic_Syra_134832
                );
            }
        }
        
        
        class UTopic_Syra_141123 : UTopic_Hero__OC_WOC_SYRA_109
        {
            default DebugId = int64(0x5744e9195446efce);
            default Caption = LocText("TEXT_WIP_CSWYRII_20250114_144523_41");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Syra_141123);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5744e9195446efcf), EConversationDebugInfo::Executing);
                // Any chance I could have some of that stew?
                Hero.AI.Say(LocText("TEXT_WIP_CSWYRII_20250114_144523_41"));
                DC(int64(0x5744e9195446efcf), EConversationDebugInfo::Done);
                DC(int64(0x5744e9195446efd2), EConversationDebugInfo::Executing);
                
                // I'm sorry, but no. This is for warders only. 
                Syra.AI.Say(LocText("TEXT_WIP_CSWYRII_20250114_144535"));
                DC(int64(0x5744e9195446efd2), EConversationDebugInfo::Done);
                DB(int64(0x5744e9195446efd4), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard));
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard))
                {
                    DC(int64(0x569e00905a44bb20), EConversationDebugInfo::Executing);
                    // I'm a warder.
                    Hero.AI.Say(LocText("TEXT_WIP_XHVTSEI_20250122_154109"));
                    DC(int64(0x569e00905a44bb20), EConversationDebugInfo::Done);
                    DC(int64(0x5744e9195446efd6), EConversationDebugInfo::Executing);
                    
                    // But you aren't on duty here in the castle. So no stew ...
                    Syra.AI.Say(LocText("TEXT_WIP_CSWYRII_20250114_144616_2083"));
                    DC(int64(0x5744e9195446efd6), EConversationDebugInfo::Done);
                    DC(int64(0x5744e9195446efe3), EConversationDebugInfo::Executing);
                    ReturnToLastSelection(1);
                    DC(int64(0x5744e9195446efe3), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x5744e9195446efd8), EConversationDebugInfo::Executing);
                    // Bartholo's orders. 
                    Syra.AI.Say(LocText("TEXT_WIP_CSWYRII_20250114_144737_2238"));
                    DC(int64(0x5744e9195446efd8), EConversationDebugInfo::Done);
                    DC(int64(0x5744e9195446efe2), EConversationDebugInfo::Executing);
                    ReturnToLastSelection(1);
                    DC(int64(0x5744e9195446efe2), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UTopic_Syra_134812 : UTopic_Hero__OC_WOC_SYRA_109
        {
            default DebugId = int64(0x57b48daa1d064fbf);
            default Caption = LocText("TEXT_WIP_UKEKYCE_20250109_115908_3984");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Syra_134812);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x57b48daa1d064fc0), EConversationDebugInfo::Executing);
                // Who do you think sent me?
                Hero.AI.Say(LocText("TEXT_WIP_UKEKYCE_20250109_115908_3984"));
                DC(int64(0x57b48daa1d064fc0), EConversationDebugInfo::Done);
                DC(int64(0x5744e9195446efca), EConversationDebugInfo::Executing);
                
                // It doesn't matter. Just go, okay? Please. 
                Syra.AI.Say(LocText("TEXT_WIP_CSWYRII_20250114_143835"));
                DC(int64(0x5744e9195446efca), EConversationDebugInfo::Done);
                DC(int64(0x57b48daa1d064fc2), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x57b48daa1d064fc2), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Syra_134832 : UTopic_Hero__OC_WOC_SYRA_109
        {
            default DebugId = int64(0x57b48daa1d064fc3);
            default Caption = LocText("TEXT_WIP_UKEKYCE_20250109_115908_3569");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Syra_134832);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x57b48daa1d064fc4), EConversationDebugInfo::Executing);
                // Are you sure there's nothing I can do for you?
                Hero.AI.Say(LocText("TEXT_WIP_UKEKYCE_20250109_115908_3569"));
                DC(int64(0x57b48daa1d064fc4), EConversationDebugInfo::Done);
                DC(int64(0x57b48daa1d064fca), EConversationDebugInfo::Executing);
                
                // You can LEAVE.
                Syra.AI.Say(LocText("TEXT_WIP_UKEKYCE_20250109_142103"));
                DC(int64(0x57b48daa1d064fca), EConversationDebugInfo::Done);
                DC(int64(0x57b48daa1d064fcb), EConversationDebugInfo::Executing);
                
                // All right, all right. I'm going. 
                Hero.AI.Say(LocText("TEXT_WIP_UKEKYCE_20250109_142110"));
                DC(int64(0x57b48daa1d064fcb), EConversationDebugInfo::Done);
                DC(int64(0x57b48daa1d064fcc), EConversationDebugInfo::Executing);
                
                // ... 
                Syra.AI.Say(LocText("TEXT_WIP_UKEKYCE_20250109_142112"));
                DC(int64(0x57b48daa1d064fcc), EConversationDebugInfo::Done);
                DC(int64(0x5744e9195446efe4), EConversationDebugInfo::Executing);
                // W-Wait.
                Syra.AI.Say(LocText("TEXT_WIP_CSWYRII_20250114_144952"));
                DC(int64(0x5744e9195446efe4), EConversationDebugInfo::Done);
                DC(int64(0x57b48daa1d064fcd), EConversationDebugInfo::Executing);
                
                // What is it? 
                Hero.AI.Say(LocText("TEXT_WIP_UKEKYCE_20250109_142121"));
                DC(int64(0x57b48daa1d064fcd), EConversationDebugInfo::Done);
                DC(int64(0x57b48daa1d064fce), EConversationDebugInfo::Executing);
                
                // You swear this isn't some kind of trick? You're not just ...
                Syra.AI.Say(LocText("TEXT_WIP_UKEKYCE_20250109_142501"));
                DC(int64(0x57b48daa1d064fce), EConversationDebugInfo::Done);
                DC(int64(0x5744e9195446efe5), EConversationDebugInfo::Executing);
                
                // I'm not. 
                Hero.AI.Say(LocText("TEXT_WIP_CSWYRII_20250114_145049"));
                DC(int64(0x5744e9195446efe5), EConversationDebugInfo::Done);
                DC(int64(0x57b48daa1d064fd0), EConversationDebugInfo::Executing);
                
                // (sighs) I actually believe you. Innos knows why, but I ...
                Syra.AI.Say(LocText("TEXT_WIP_UKEKYCE_20250109_142520"));
                DC(int64(0x57b48daa1d064fd0), EConversationDebugInfo::Done);
                DC(int64(0x5744e9195446efe6), EConversationDebugInfo::Executing);
                // Fine. It's Bullit. 
                Syra.AI.Say(LocText("TEXT_WIP_CSWYRII_20250114_145121"));
                DC(int64(0x5744e9195446efe6), EConversationDebugInfo::Done);
                DC(int64(0x57b48daa1d064fcf), EConversationDebugInfo::Executing);
                
                // ... The warder? 
                Hero.AI.Say(LocText("TEXT_WIP_UKEKYCE_20250109_142501_2801"));
                DC(int64(0x57b48daa1d064fcf), EConversationDebugInfo::Done);
                DC(int64(0x57b48daa1d064fd1), EConversationDebugInfo::Executing);
                
                // Yeah, one of Gomez's favorites. Do you know him? 
                Syra.AI.Say(LocText("TEXT_WIP_UKEKYCE_20250109_142558"));
                DC(int64(0x57b48daa1d064fd1), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_GRD_BULLIT, Document::UDocumentSegment_Glossary_OC_GRD_BULLIT_Bully);
                Subdialog(
                    UTopic_Syra_142259,
                    UTopic_Syra_142279
                );
                DC(int64(0x5744e9195446eff5), EConversationDebugInfo::Executing);
                // He's ... taken a shine to me, I guess you could say. Not ...
                Syra.AI.Say(LocText("TEXT_WIP_CSWYRII_20250114_145329"));
                DC(int64(0x5744e9195446eff5), EConversationDebugInfo::Done);
                DC(int64(0x57b48daa1d064fd3), EConversationDebugInfo::Executing);
                // Formally, I'm under the protection of Bartholo, so he's ...
                Syra.AI.Say(LocText("TEXT_WIP_UKEKYCE_20250109_142658"));
                DC(int64(0x57b48daa1d064fd3), EConversationDebugInfo::Done);
                DC(int64(0x57b48daa1d064fd7), EConversationDebugInfo::Executing);
                // Ah, I'll be honest, I don't know what to do anymore. I ...
                Syra.AI.Say(LocText("TEXT_WIP_UKEKYCE_20250109_142818"));
                DC(int64(0x57b48daa1d064fd7), EConversationDebugInfo::Done);
                DC(int64(0x5744e9195446eff7), EConversationDebugInfo::Executing);
                // I just ... (deep, overwhelmed sigh)
                Syra.AI.Say(LocText("TEXT_WIP_CSWYRII_20250114_145921"));
                DC(int64(0x5744e9195446eff7), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Syra_142259 : UTopic_Hero__OC_WOC_SYRA_109
        {
            default DebugId = int64(0x5744e9195446efe9);
            default Caption = LocText("TEXT_WIP_CSWYRII_20250114_145155_3286");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Syra_142259);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5744e9195446efea), EConversationDebugInfo::Executing);
                
                // He and his guys beat me just after I got thrown in. 
                Hero.AI.Say(LocText("TEXT_WIP_CSWYRII_20250114_145155_3286"));
                DC(int64(0x5744e9195446efea), EConversationDebugInfo::Done);
                DC(int64(0x5744e9195446eff1), EConversationDebugInfo::Executing);
                
                // (scoffs) Right. The "Cleansing" or whatever they call ...
                Syra.AI.Say(LocText("TEXT_WIP_CSWYRII_20250114_145219"));
                DC(int64(0x5744e9195446eff1), EConversationDebugInfo::Done);
                DC(int64(0x5744e9195446eff2), EConversationDebugInfo::Executing);
                // Sorry that happened to you. 
                Syra.AI.Say(LocText("TEXT_WIP_CSWYRII_20250114_145249"));
                DC(int64(0x5744e9195446eff2), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Syra_142279 : UTopic_Hero__OC_WOC_SYRA_109
        {
            default DebugId = int64(0x5744e9195446efed);
            default Caption = LocText("TEXT_WIP_CSWYRII_20250114_145155_2386");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Syra_142279);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5744e9195446efee), EConversationDebugInfo::Executing);
                
                // I heard about him. 
                Hero.AI.Say(LocText("TEXT_WIP_CSWYRII_20250114_145155_2386"));
                DC(int64(0x5744e9195446efee), EConversationDebugInfo::Done);
                DC(int64(0x5744e9195446eff3), EConversationDebugInfo::Executing);
                
                // Most have. 
                Syra.AI.Say(LocText("TEXT_WIP_CSWYRII_20250114_145311"));
                DC(int64(0x5744e9195446eff3), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceSyra135001 : UTopic_Hero__OC_WOC_SYRA_109
        {
            default DebugId = int64(0x57b48daa1d064fda);
            default Caption = LocText("TEXT_WIP_UKEKYCE_20250109_142847");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceSyra134706);
            default Rules.HideIfKnows(UChoiceSyra135001);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x57b48daa1d064fd8), EConversationDebugInfo::Executing);
                
                // I could take care of Bullit for you.
                Hero.AI.Say(LocText("TEXT_WIP_UKEKYCE_20250109_142847"));
                DC(int64(0x57b48daa1d064fd8), EConversationDebugInfo::Done);
                DC(int64(0x57b48daa1d064fd9), EConversationDebugInfo::Executing);
                
                // You mean ...?
                Syra.AI.Say(LocText("TEXT_WIP_UKEKYCE_20250109_142847_443"));
                DC(int64(0x57b48daa1d064fd9), EConversationDebugInfo::Done);
                DC(int64(0x57b48daa1d064fdc), EConversationDebugInfo::Executing);
                
                // Yes. 
                Hero.AI.Say(LocText("TEXT_WIP_UKEKYCE_20250109_142913"));
                DC(int64(0x57b48daa1d064fdc), EConversationDebugInfo::Done);
                DC(int64(0x5744e9195446f017), EConversationDebugInfo::Executing);
                
                // I ... I don't think you know what you're saying. He's a ...
                Syra.AI.Say(LocText("TEXT_WIP_CSWYRII_20250114_150714"));
                DC(int64(0x5744e9195446f017), EConversationDebugInfo::Done);
                DC(int64(0x57b48daa1d064fdd), EConversationDebugInfo::Executing);
                // If he wasn't such a stinking drunk, he'd have probably ...
                Syra.AI.Say(LocText("TEXT_WIP_UKEKYCE_20250109_142929"));
                DC(int64(0x57b48daa1d064fdd), EConversationDebugInfo::Done);
                DC(int64(0x5744e9195446f018), EConversationDebugInfo::Executing);
                
                // I can handle it. 
                Hero.AI.Say(LocText("TEXT_WIP_CSWYRII_20250114_150825"));
                DC(int64(0x5744e9195446f018), EConversationDebugInfo::Done);
                DC(int64(0x5744e9195446f019), EConversationDebugInfo::Executing);
                
                // Big words. Well, I'm not going turn away help, that's ...
                Syra.AI.Say(LocText("TEXT_WIP_CSWYRII_20250114_150832"));
                DC(int64(0x5744e9195446f019), EConversationDebugInfo::Done);
                DC(int64(0x5744e9195446f01a), EConversationDebugInfo::Executing);
                // You can't just take him on directly, though. Even if you ...
                Syra.AI.Say(LocText("TEXT_WIP_CSWYRII_20250114_150853"));
                DC(int64(0x5744e9195446f01a), EConversationDebugInfo::Done);
                DC(int64(0x5744e9195446f01b), EConversationDebugInfo::Executing);
                // That said, I know he goes on these long walks every ...
                Syra.AI.Say(LocText("TEXT_WIP_CSWYRII_20250114_150954"));
                DC(int64(0x5744e9195446f01b), EConversationDebugInfo::Done);
                DC(int64(0x57b48daa1d064fde), EConversationDebugInfo::Executing);
                // IF there's any chance for you to do this, then that's ...
                Syra.AI.Say(LocText("TEXT_WIP_UKEKYCE_20250109_142931"));
                DC(int64(0x57b48daa1d064fde), EConversationDebugInfo::Done);
                DC(int64(0x57b48daa1d064fdf), EConversationDebugInfo::Executing);
                
                // Got it. I'll be discreet. 
                Hero.AI.Say(LocText("TEXT_WIP_UKEKYCE_20250109_142945"));
                DC(int64(0x57b48daa1d064fdf), EConversationDebugInfo::Done);
                DC(int64(0x5744e9195446f023), EConversationDebugInfo::Executing);
                
                // ... You're either very courageous or very stupid. All ...
                Syra.AI.Say(LocText("TEXT_WIP_CSWYRII_20250114_151413"));
                DC(int64(0x5744e9195446f023), EConversationDebugInfo::Done);
                DC(int64(0x57b48daa1d064fe0), EConversationDebugInfo::Executing);
                // And ... thank you. 
                Syra.AI.Say(LocText("TEXT_WIP_UKEKYCE_20250109_142946"));
                DC(int64(0x57b48daa1d064fe0), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_BULLYFORBULLIT, Document::UDocumentSegment_CH2_BULLYFORBULLIT_Start);
                DC(int64(0x57b48daa1d06509d), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER2_BULLYFORBULLIT.StartQuest();
                DC(int64(0x57b48daa1d06509d), EConversationDebugInfo::Done);
                DC(int64(0xfe44f5292a7253b8), EConversationDebugInfo::Executing);
                G1R.DefeatBully = FInGameTime::Now();
                DC(int64(0xfe44f5292a7253b8), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceSyra135325 : UTopic_Hero__OC_WOC_SYRA_109
        {
            default DebugId = int64(0x57b48daa1d0650a0);
            default Caption = LocText("TEXT_WIP_UKEKYCE_20250109_144847");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceSyra135325);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x57b48daa1d0650a4), Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_DSWYRII_20250115_150309_41")));
                    DB(int64(0x57b48daa1d0650a5), Quest::OldCamp_OCCHAPTER2_BULLYFORBULLIT != nullptr && Quest::OldCamp_OCCHAPTER2_BULLYFORBULLIT.IsRunning());
                    DB(int64(0xfe44f5292a7253ba), Bullit != nullptr && Bullit.IsEveryoneOfThisKindDead());
                    DB(int64(0xfe44f5292a7253bd), Quest::OldCamp_OCCHAPTER2_BULLYFORBULLIT != nullptr && Quest::OldCamp_OCCHAPTER2_BULLYFORBULLIT.IsRunning());
                }
                
                if (Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_DSWYRII_20250115_150309_41")) && Quest::OldCamp_OCCHAPTER2_BULLYFORBULLIT != nullptr && Quest::OldCamp_OCCHAPTER2_BULLYFORBULLIT.IsRunning())
                    return true;
                
                if (Bullit != nullptr && Bullit.IsEveryoneOfThisKindDead() && Quest::OldCamp_OCCHAPTER2_BULLYFORBULLIT != nullptr && Quest::OldCamp_OCCHAPTER2_BULLYFORBULLIT.IsRunning())
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x57b48daa1d06509e), EConversationDebugInfo::Executing);
                // Bullit won't be a problem anymore.
                Hero.AI.Say(LocText("TEXT_WIP_UKEKYCE_20250109_144847"));
                DC(int64(0x57b48daa1d06509e), EConversationDebugInfo::Done);
                DC(int64(0x57b48daa1d06509f), EConversationDebugInfo::Executing);
                
                // You mean ...?
                Syra.AI.Say(LocText("TEXT_WIP_UKEKYCE_20250109_144847_2995"));
                DC(int64(0x57b48daa1d06509f), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_WOC_SYRA, Document::UDocumentSegment_Glossary_OC_WOC_SYRA_Trust);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_WOC_SYRA, Document::UDocumentSegment_Glossary_OC_WOC_SYRA_Escape);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_BULLYFORBULLIT, Document::UDocumentSegment_CH2_BULLYFORBULLIT_Completed);
                DB(int64(0xac7c76cc07d3673f), Bullit != nullptr && Bullit.IsEveryoneOfThisKindDead());
                
                if (Bullit != nullptr && Bullit.IsEveryoneOfThisKindDead())
                {
                    DC(int64(0xac7c76cc07d36740), EConversationDebugInfo::Executing);
                    // He won't bother anyone ever again. 
                    Hero.AI.Say(LocText("TEXT_WIP_DSWYRII_20250115_151729"));
                    DC(int64(0xac7c76cc07d36740), EConversationDebugInfo::Done);
                    DC(int64(0xac7c76cc07d36741), EConversationDebugInfo::Executing);
                    
                    // I ... I don't even know what to say. Thank you. Truly.
                    Syra.AI.Say(LocText("TEXT_WIP_DSWYRII_20250115_151729_2238"));
                    DC(int64(0xac7c76cc07d36741), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0xac7c76cc07d36742), EConversationDebugInfo::Executing);
                    
                    // I taught him a lesson and made him swear to never bother ...
                    Hero.AI.Say(LocText("TEXT_WIP_DSWYRII_20250115_151731"));
                    DC(int64(0xac7c76cc07d36742), EConversationDebugInfo::Done);
                    DC(int64(0xac7c76cc07d36743), EConversationDebugInfo::Executing);
                    
                    // I ... see. I hope that didn't just make it worse. But ...
                    Syra.AI.Say(LocText("TEXT_WIP_DSWYRII_20250115_151731_1924"));
                    DC(int64(0xac7c76cc07d36743), EConversationDebugInfo::Done);
                }
                DC(int64(0x57b48daa1d0650a7), EConversationDebugInfo::Executing);
                // I'm just ... (breaks off, sighs)
                Syra.AI.Say(LocText("TEXT_WIP_UKEKYCE_20250109_144957"));
                DC(int64(0x57b48daa1d0650a7), EConversationDebugInfo::Done);
                DC(int64(0x57b48daa1d0650a8), EConversationDebugInfo::Executing);
                
                // What is it?
                Hero.AI.Say(LocText("TEXT_WIP_UKEKYCE_20250109_145000"));
                DC(int64(0x57b48daa1d0650a8), EConversationDebugInfo::Done);
                DC(int64(0x5744e9195446f024), EConversationDebugInfo::Executing);
                
                // I don't know. I guess you could say this whole ordeal ...
                Syra.AI.Say(LocText("TEXT_WIP_CSWYRII_20250114_151551"));
                DC(int64(0x5744e9195446f024), EConversationDebugInfo::Done);
                DC(int64(0x57b48daa1d0650a9), EConversationDebugInfo::Executing);
                // Yesterday, it was Bullit. Tomorrow, it'll be someone ...
                Syra.AI.Say(LocText("TEXT_WIP_UKEKYCE_20250109_145016"));
                DC(int64(0x57b48daa1d0650a9), EConversationDebugInfo::Done);
                DB(int64(0x5744e9195446f026), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp));
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp))
                {
                    DC(int64(0x5744e9195446f028), EConversationDebugInfo::Executing);
                    // By Innos, why am I even telling you this. You're one of ...
                    Syra.AI.Say(LocText("TEXT_WIP_CSWYRII_20250114_151733_3719"));
                    DC(int64(0x5744e9195446f028), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x5744e9195446f02a), EConversationDebugInfo::Executing);
                    // By Innos, why am I even telling you this. You're just a ...
                    Syra.AI.Say(LocText("TEXT_WIP_CSWYRII_20250114_151735_2316"));
                    DC(int64(0x5744e9195446f02a), EConversationDebugInfo::Done);
                }
                DC(int64(0x5744e9195446f02d), EConversationDebugInfo::Executing);
                // You're thinking of escaping. 
                Hero.AI.Say(LocText("TEXT_WIP_CSWYRII_20250114_151811"));
                DC(int64(0x5744e9195446f02d), EConversationDebugInfo::Done);
                DC(int64(0x5744e9195446f031), EConversationDebugInfo::Executing);
                
                // Well, not from the Colony, obviously. But ... I heard ...
                Syra.AI.Say(LocText("TEXT_WIP_CSWYRII_20250114_151828"));
                DC(int64(0x5744e9195446f031), EConversationDebugInfo::Done);
                DC(int64(0x5744e9195446f032), EConversationDebugInfo::Executing);
                // There's a woman there too, apparently. And they don't ...
                Syra.AI.Say(LocText("TEXT_WIP_CSWYRII_20250114_151840"));
                DC(int64(0x5744e9195446f032), EConversationDebugInfo::Done);
                DC(int64(0x5744e9195446f033), EConversationDebugInfo::Executing);
                // The thing is, if I run, that's it. If they ever catch ...
                Syra.AI.Say(LocText("TEXT_WIP_CSWYRII_20250114_151916"));
                DC(int64(0x5744e9195446f033), EConversationDebugInfo::Done);
                DC(int64(0xac7c76cc07d3674b), EConversationDebugInfo::Executing);
                // I have to be sure this isn't just another pipe dream.
                Syra.AI.Say(LocText("TEXT_WIP_DSWYRII_20250115_152121"));
                DC(int64(0xac7c76cc07d3674b), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Syra_135360,
                    UTopic_Syra_135380
                );
                DC(int64(0x57b48daa1d0650b9), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER2_BULLYFORBULLIT_BULLYFORBULLIT_OBJ_INFORM.SucceedQuest();
                DC(int64(0x57b48daa1d0650b9), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Syra_135360 : UTopic_Hero__OC_WOC_SYRA_109
        {
            default DebugId = int64(0x57b48daa1d0650ae);
            default Caption = LocText("TEXT_WIP_UKEKYCE_20250109_145051_731");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Syra_135360);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x57b48daa1d0650af), EConversationDebugInfo::Executing);
                // I can take a look at the Swamp Camp for you. See if it's ...
                Hero.AI.Say(LocText("TEXT_WIP_UKEKYCE_20250109_145051_731"));
                DC(int64(0x57b48daa1d0650af), EConversationDebugInfo::Done);
                DC(int64(0x57b48daa1d0650b6), EConversationDebugInfo::Executing);
                
                // ... You know, I was hoping you'd say that.
                Syra.AI.Say(LocText("TEXT_WIP_UKEKYCE_20250109_145125"));
                DC(int64(0x57b48daa1d0650b6), EConversationDebugInfo::Done);
                DC(int64(0x5744e9195446f034), EConversationDebugInfo::Executing);
                // Thank you. I mean it. I'll be waiting here. 
                Syra.AI.Say(LocText("TEXT_WIP_CSWYRII_20250114_152036"));
                DC(int64(0x5744e9195446f034), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Syra_135380 : UTopic_Hero__OC_WOC_SYRA_109
        {
            default DebugId = int64(0x57b48daa1d0650b2);
            default Caption = LocText("TEXT_WIP_UKEKYCE_20250109_145051_3719");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Syra_135380);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x57b48daa1d0650b3), EConversationDebugInfo::Executing);
                
                // Hmm, now might not be the best time to leave.
                Hero.AI.Say(LocText("TEXT_WIP_UKEKYCE_20250109_145051_3719"));
                DC(int64(0x57b48daa1d0650b3), EConversationDebugInfo::Done);
                DC(int64(0x57b48daa1d0650b7), EConversationDebugInfo::Executing);
                
                // Probably not, no. But you get around a lot, don't you? ...
                Syra.AI.Say(LocText("TEXT_WIP_UKEKYCE_20250109_145134"));
                DC(int64(0x57b48daa1d0650b7), EConversationDebugInfo::Done);
                DC(int64(0x5744e9195446f035), EConversationDebugInfo::Executing);
                // I know you've already done a lot for me, but I need to ...
                Syra.AI.Say(LocText("TEXT_WIP_CSWYRII_20250114_152153"));
                DC(int64(0x5744e9195446f035), EConversationDebugInfo::Done);
                DC(int64(0x5744e9195446f036), EConversationDebugInfo::Executing);
                
                // All right. I'll let you know when an opportunity comes ...
                Hero.AI.Say(LocText("TEXT_WIP_CSWYRII_20250114_152206"));
                DC(int64(0x5744e9195446f036), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceSyra136349 : UTopic_Hero__OC_WOC_SYRA_109
        {
            default DebugId = int64(0xb11e587503ea67d7);
            default Caption = LocText("TEXT_WIP_WKHQRQD_20250110_104553");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceSyra136349);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xb11e587503ea67da), Quest::OldCamp_OCCHAPTER2_BULLYFORBULLIT != nullptr && Quest::OldCamp_OCCHAPTER2_BULLYFORBULLIT.HasSucceeded());
                    DB(int64(0xb11e587503ea67db), G1R != nullptr && G1R.IsInChapter(3));
                }
                
                if (Quest::OldCamp_OCCHAPTER2_BULLYFORBULLIT != nullptr && !Quest::OldCamp_OCCHAPTER2_BULLYFORBULLIT.HasSucceeded())
                    return false;
                
                if (G1R != nullptr && !G1R.IsInChapter(3))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb11e587503ea67d5), EConversationDebugInfo::Executing);
                // Hey, Syra. Do you have a moment?
                Hero.AI.Say(LocText("TEXT_WIP_WKHQRQD_20250110_104553"));
                DC(int64(0xb11e587503ea67d5), EConversationDebugInfo::Done);
                DC(int64(0xb11e587503ea67d6), EConversationDebugInfo::Executing);
                
                // I suppose. What is it?
                Syra.AI.Say(LocText("TEXT_WIP_WKHQRQD_20250110_104553_41"));
                DC(int64(0xb11e587503ea67d6), EConversationDebugInfo::Done);
                DC(int64(0xb11e587503ea67dc), EConversationDebugInfo::Executing);
                
                // About that thing with the Swamp Camp. This is your ...
                Hero.AI.Say(LocText("TEXT_WIP_WKHQRQD_20250110_112336"));
                DC(int64(0xb11e587503ea67dc), EConversationDebugInfo::Done);
                DC(int64(0xb11e587503ea67dd), EConversationDebugInfo::Executing);
                
                // Really? Last I heard, they've all gone seriously mad ...
                Syra.AI.Say(LocText("TEXT_WIP_WKHQRQD_20250110_112347"));
                DC(int64(0xb11e587503ea67dd), EConversationDebugInfo::Done);
                DC(int64(0xb11e587503ea67de), EConversationDebugInfo::Executing);
                
                // Not anymore. The mad ones have left. It's pretty ...
                Hero.AI.Say(LocText("TEXT_WIP_WKHQRQD_20250110_112354"));
                DC(int64(0xb11e587503ea67de), EConversationDebugInfo::Done);
                DC(int64(0xb11e587503ea67df), EConversationDebugInfo::Executing);
                
                // Huh. Maybe it is time. But if I go, I'm not leaving ...
                Syra.AI.Say(LocText("TEXT_WIP_WKHQRQD_20250110_112410"));
                DC(int64(0xb11e587503ea67df), EConversationDebugInfo::Done);
                DC(int64(0xb11e587503ea67e0), EConversationDebugInfo::Executing);
                // Can you talk to them? See what they think?
                Syra.AI.Say(LocText("TEXT_WIP_WKHQRQD_20250110_112424"));
                DC(int64(0xb11e587503ea67e0), EConversationDebugInfo::Done);
                DC(int64(0xb11e587503ea67e1), EConversationDebugInfo::Executing);
                
                // Sure, I'll handle it.
                Hero.AI.Say(LocText("TEXT_WIP_WKHQRQD_20250110_112444"));
                DC(int64(0xb11e587503ea67e1), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_DREAMEDLAND, Document::UDocumentSegment_CH3_DREAMEDLAND_Start);
                DC(int64(0xb11e587503ea67e3), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER3_DREAMEDLAND.StartQuest();
                DC(int64(0xb11e587503ea67e3), EConversationDebugInfo::Done);
                DC(int64(0xb11e587503ea68a5), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xb11e587503ea68a5), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceSyra136700 : UTopic_Hero__OC_WOC_SYRA_109
        {
            default DebugId = int64(0xb11e587503ea68ac);
            default Caption = LocText("TEXT_WIP_WKHQRQD_20250110_112755");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceSyra136700);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xb11e587503ea68b0), Quest::OldCamp_OCCHAPTER3_DREAMEDLAND != nullptr && Quest::OldCamp_OCCHAPTER3_DREAMEDLAND.IsRunning());
                    DB(int64(0xb11e587503ea68d0), Quest::OldCamp_OCCHAPTER3_DREAMEDLAND_DREAMEDLAND_OBJ_TALKSERAPHIA != nullptr && Quest::OldCamp_OCCHAPTER3_DREAMEDLAND_DREAMEDLAND_OBJ_TALKSERAPHIA.HasSucceeded());
                    DB(int64(0xb11e587503ea68d1), Quest::OldCamp_OCCHAPTER3_DREAMEDLAND_DREAMEDLAND_OBJ_TALKVELAYA != nullptr && Quest::OldCamp_OCCHAPTER3_DREAMEDLAND_DREAMEDLAND_OBJ_TALKVELAYA.HasSucceeded());
                }
                
                if (Quest::OldCamp_OCCHAPTER3_DREAMEDLAND != nullptr && !Quest::OldCamp_OCCHAPTER3_DREAMEDLAND.IsRunning())
                    return false;
                
                if (Quest::OldCamp_OCCHAPTER3_DREAMEDLAND_DREAMEDLAND_OBJ_TALKSERAPHIA != nullptr && !Quest::OldCamp_OCCHAPTER3_DREAMEDLAND_DREAMEDLAND_OBJ_TALKSERAPHIA.HasSucceeded())
                    return false;
                
                if (Quest::OldCamp_OCCHAPTER3_DREAMEDLAND_DREAMEDLAND_OBJ_TALKVELAYA != nullptr && !Quest::OldCamp_OCCHAPTER3_DREAMEDLAND_DREAMEDLAND_OBJ_TALKVELAYA.HasSucceeded())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb11e587503ea68aa), EConversationDebugInfo::Executing);
                // I talked to Velaya and Seraphia.
                Hero.AI.Say(LocText("TEXT_WIP_WKHQRQD_20250110_112755"));
                DC(int64(0xb11e587503ea68aa), EConversationDebugInfo::Done);
                DC(int64(0xb11e587503ea68ab), EConversationDebugInfo::Executing);
                
                // And?
                Syra.AI.Say(LocText("TEXT_WIP_WKHQRQD_20250110_112755_3436"));
                DC(int64(0xb11e587503ea68ab), EConversationDebugInfo::Done);
                DC(int64(0xb11e587503ea68d2), EConversationDebugInfo::Executing);
                
                // Velaya's in. She's ready to leave immediately.
                Hero.AI.Say(LocText("TEXT_WIP_WKHQRQD_20250110_114237"));
                DC(int64(0xb11e587503ea68d2), EConversationDebugInfo::Done);
                DC(int64(0xb11e587503ea68d3), EConversationDebugInfo::Executing);
                
                // I knew she'd be on board!
                Syra.AI.Say(LocText("TEXT_WIP_WKHQRQD_20250110_114251"));
                DC(int64(0xb11e587503ea68d3), EConversationDebugInfo::Done);
                DC(int64(0xb11e587503ea68d4), EConversationDebugInfo::Executing);
                
                // Seraphia's unsure, though. She seemed worried.
                Hero.AI.Say(LocText("TEXT_WIP_WKHQRQD_20250110_114303"));
                DC(int64(0xb11e587503ea68d4), EConversationDebugInfo::Done);
                DC(int64(0xb11e587503ea68d5), EConversationDebugInfo::Executing);
                
                // We're all worried - I'll talk to her.
                Syra.AI.Say(LocText("TEXT_WIP_WKHQRQD_20250110_114323"));
                DC(int64(0xb11e587503ea68d5), EConversationDebugInfo::Done);
                DC(int64(0xb11e587503ea68d6), EConversationDebugInfo::Executing);
                // Thanks for your help. Now it's waiting for the right ...
                Syra.AI.Say(LocText("TEXT_WIP_WKHQRQD_20250110_114357"));
                DC(int64(0xb11e587503ea68d6), EConversationDebugInfo::Done);
                DC(int64(0xb11e587503ea68d7), EConversationDebugInfo::Executing);
                // Until then, let's keep this between us. The last thing ...
                Syra.AI.Say(LocText("TEXT_WIP_WKHQRQD_20250110_114406"));
                DC(int64(0xb11e587503ea68d7), EConversationDebugInfo::Done);
                DC(int64(0x569e00905a44bb21), EConversationDebugInfo::Executing);
                
                // Of course.
                Hero.AI.Say(LocText("TEXT_WIP_XHVTSEI_20250122_172134"));
                DC(int64(0x569e00905a44bb21), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_DREAMEDLAND, Document::UDocumentSegment_CH3_DREAMEDLAND_Complete);
                DC(int64(0xb11e587503ea68d9), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER3_DREAMEDLAND_DREAMEDLAND_OBJ_INFORMSYRA.SucceedQuest();
                DC(int64(0xb11e587503ea68d9), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceSyra143080 : UTopic_Hero__OC_WOC_SYRA_109
        {
            default DebugId = int64(0x8400aaa0595fef1d);
            default Caption = LocText("TEXT_WIP_XOSFHOK_20250116_173501");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceSyra143080);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x81f98c56dfa2d556), Quest::OldCamp_OCCHAPTER2_SYRARECIPE_SYRARECIPE_OBJ_GETRECIPE != nullptr && Quest::OldCamp_OCCHAPTER2_SYRARECIPE_SYRARECIPE_OBJ_GETRECIPE.IsRunning());
                    DB(int64(0xf92e93f647daf9ea), Quest::OldCamp_OCCHAPTER2_BULLYFORBULLIT != nullptr && Quest::OldCamp_OCCHAPTER2_BULLYFORBULLIT.HasSucceeded());
                }
                
                if (Quest::OldCamp_OCCHAPTER2_SYRARECIPE_SYRARECIPE_OBJ_GETRECIPE != nullptr && !Quest::OldCamp_OCCHAPTER2_SYRARECIPE_SYRARECIPE_OBJ_GETRECIPE.IsRunning())
                    return false;
                
                if (Quest::OldCamp_OCCHAPTER2_BULLYFORBULLIT != nullptr && !Quest::OldCamp_OCCHAPTER2_BULLYFORBULLIT.HasSucceeded())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8400aaa0595fef1b), EConversationDebugInfo::Executing);
                // Word is you've been making some really good stew lately. ...
                Hero.AI.Say(LocText("TEXT_WIP_XOSFHOK_20250116_173501"));
                DC(int64(0x8400aaa0595fef1b), EConversationDebugInfo::Done);
                DC(int64(0x8400aaa0595fef1c), EConversationDebugInfo::Executing);
                
                // I can't. It's for Gomez's table only.
                Syra.AI.Say(LocText("TEXT_WIP_XOSFHOK_20250116_173501_2083"));
                DC(int64(0x8400aaa0595fef1c), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_SYRARECIPE, Document::UDocumentSegment_CH2_SYRARECIPE_SyraReward);
                Subdialog(
                    UTopic_Syra_143108,
                    UTopic_Syra_143128
                );
                DC(int64(0x805acc2e0c489bb), EConversationDebugInfo::Executing);
                Syra.AddItemToInventory(UItMs_Scroll_SyraRecipe, 1);
                DC(int64(0x805acc2e0c489bb), EConversationDebugInfo::Done);
                DC(int64(0x8400aaa0595fef32), EConversationDebugInfo::Executing);
                Syra.AI.GiveItemTo(Hero, UItMs_Scroll_SyraRecipe, 1);
                DC(int64(0x8400aaa0595fef32), EConversationDebugInfo::Done);
                DC(int64(0x8400aaa0595fef33), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x8400aaa0595fef33), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Syra_143108 : UTopic_Hero__OC_WOC_SYRA_109
        {
            default DebugId = int64(0x8400aaa0595fef20);
            default Caption = LocText("TEXT_WIP_XOSFHOK_20250116_173757_1924");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Syra_143108);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8400aaa0595fef21), EConversationDebugInfo::Executing);
                // You could make an exception.
                Hero.AI.Say(LocText("TEXT_WIP_XOSFHOK_20250116_173757_1924"));
                DC(int64(0x8400aaa0595fef21), EConversationDebugInfo::Done);
                DC(int64(0x8400aaa0595fef28), EConversationDebugInfo::Executing);
                
                // Hm. You DID help me earlier ... and fair's fair. 
                Syra.AI.Say(LocText("TEXT_WIP_XOSFHOK_20250116_173852"));
                DC(int64(0x8400aaa0595fef28), EConversationDebugInfo::Done);
                DC(int64(0x2031b3b4b8af319), EConversationDebugInfo::Executing);
                // Here you go. Don't make me regret it.
                Syra.AI.Say(LocText("TEXT_WIP_AOKPFJF_20250120_233935"));
                DC(int64(0x2031b3b4b8af319), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Syra_143128 : UTopic_Hero__OC_WOC_SYRA_109
        {
            default DebugId = int64(0x8400aaa0595fef24);
            default Caption = LocText("TEXT_WIP_XOSFHOK_20250116_173757_3436");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Syra_143128);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8400aaa0595fef25), EConversationDebugInfo::Executing);
                
                // All right, let's forget about it.
                Hero.AI.Say(LocText("TEXT_WIP_XOSFHOK_20250116_173757_3436"));
                DC(int64(0x8400aaa0595fef25), EConversationDebugInfo::Done);
                DC(int64(0x8400aaa0595fef30), EConversationDebugInfo::Executing);
                
                // Hm. You DID help me earlier - you kind of earned it. 
                Syra.AI.Say(LocText("TEXT_WIP_XOSFHOK_20250116_174031"));
                DC(int64(0x8400aaa0595fef30), EConversationDebugInfo::Done);
                DC(int64(0x2031b3b4b8af31a), EConversationDebugInfo::Executing);
                // Here you go. Don't make me regret it.
                Syra.AI.Say(LocText("TEXT_WIP_AOKPFJF_20250120_234009"));
                DC(int64(0x2031b3b4b8af31a), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceSyra143489 : UTopic_Hero__OC_WOC_SYRA_109
        {
            default DebugId = int64(0x5744e9195446effa);
            default Caption = LocText("TEXT_WIP_CSWYRII_20250114_145938");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceSyra134706);
            default Rules.HideIfKnows(UChoiceSyra143489);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5744e9195446eff8), EConversationDebugInfo::Executing);
                
                // I thought all women in the Old Camp are under Gomez's ...
                Hero.AI.Say(LocText("TEXT_WIP_CSWYRII_20250114_145938"));
                DC(int64(0x5744e9195446eff8), EConversationDebugInfo::Done);
                DC(int64(0x5744e9195446eff9), EConversationDebugInfo::Executing);
                
                // "Protection." That's a nice way of saying it.
                Syra.AI.Say(LocText("TEXT_WIP_CSWYRII_20250114_145938_3984"));
                DC(int64(0x5744e9195446eff9), EConversationDebugInfo::Done);
                DC(int64(0x5744e9195446effc), EConversationDebugInfo::Executing);
                // But yes, you're right in essence, most of us are. I ...
                Syra.AI.Say(LocText("TEXT_WIP_CSWYRII_20250114_150042"));
                DC(int64(0x5744e9195446effc), EConversationDebugInfo::Done);
                DC(int64(0x5744e9195446effd), EConversationDebugInfo::Executing);
                // Now it seems he has tired of me. 
                Syra.AI.Say(LocText("TEXT_WIP_CSWYRII_20250114_150145"));
                DC(int64(0x5744e9195446effd), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceSyra144108 : UTopic_Hero__OC_WOC_SYRA_109
        {
            default DebugId = int64(0x5744e9195446f000);
            default Caption = LocText("TEXT_WIP_CSWYRII_20250114_150252");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceSyra134706);
            default Rules.HideIfKnows(UChoiceSyra144108);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x6a22653c654bd5b9), Quest::OldCamp_OCCHAPTER2_BULLYFORBULLIT != nullptr && !Quest::OldCamp_OCCHAPTER2_BULLYFORBULLIT.HasSucceeded());
                }
                
                return Quest::OldCamp_OCCHAPTER2_BULLYFORBULLIT != nullptr && !Quest::OldCamp_OCCHAPTER2_BULLYFORBULLIT.HasSucceeded();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5744e9195446effe), EConversationDebugInfo::Executing);
                
                // What is Bullit doing to you? 
                Hero.AI.Say(LocText("TEXT_WIP_CSWYRII_20250114_150252"));
                DC(int64(0x5744e9195446effe), EConversationDebugInfo::Done);
                DC(int64(0x5744e9195446efff), EConversationDebugInfo::Executing);
                
                // Not what you're thinking. Yet. 
                Syra.AI.Say(LocText("TEXT_WIP_CSWYRII_20250114_150252_3569"));
                DC(int64(0x5744e9195446efff), EConversationDebugInfo::Done);
                DC(int64(0x5744e9195446f002), EConversationDebugInfo::Executing);
                // So far, he's just pushing me around, takes my ore and ...
                Syra.AI.Say(LocText("TEXT_WIP_CSWYRII_20250114_150355"));
                DC(int64(0x5744e9195446f002), EConversationDebugInfo::Done);
                DC(int64(0x5744e9195446f003), EConversationDebugInfo::Executing);
                // But now that he knows Bartholo isn't stopping him ... 
                Syra.AI.Say(LocText("TEXT_WIP_CSWYRII_20250114_150443"));
                DC(int64(0x5744e9195446f003), EConversationDebugInfo::Done);
                DC(int64(0x5744e9195446f004), EConversationDebugInfo::Executing);
                // I hate this man. I hate him so much. 
                Syra.AI.Say(LocText("TEXT_WIP_CSWYRII_20250114_150452"));
                DC(int64(0x5744e9195446f004), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceSyra144623 : UTopic_Hero__OC_WOC_SYRA_109
        {
            default DebugId = int64(0x5744e9195446f007);
            default Caption = LocText("TEXT_WIP_CSWYRII_20250114_150508");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceSyra134706);
            default Rules.HideIfKnows(UChoiceSyra144623);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5744e9195446f005), EConversationDebugInfo::Executing);
                
                // How did you end up here?
                Hero.AI.Say(LocText("TEXT_WIP_CSWYRII_20250114_150508"));
                DC(int64(0x5744e9195446f005), EConversationDebugInfo::Done);
                DC(int64(0x5744e9195446f006), EConversationDebugInfo::Executing);
                
                // What is it to you? 
                Syra.AI.Say(LocText("TEXT_WIP_CSWYRII_20250114_150508_443"));
                DC(int64(0x5744e9195446f006), EConversationDebugInfo::Done);
                DC(int64(0x5744e9195446f013), EConversationDebugInfo::Executing);
                
                // I'm just curious. There aren't many women around here. 
                Hero.AI.Say(LocText("TEXT_WIP_CSWYRII_20250114_150555"));
                DC(int64(0x5744e9195446f013), EConversationDebugInfo::Done);
                DC(int64(0x5744e9195446f014), EConversationDebugInfo::Executing);
                
                // Good for the women. 
                Syra.AI.Say(LocText("TEXT_WIP_CSWYRII_20250114_150602"));
                DC(int64(0x5744e9195446f014), EConversationDebugInfo::Done);
                DC(int64(0x5744e9195446f015), EConversationDebugInfo::Executing);
                // Look, you seem a decent guy, but I don't know anything ...
                Syra.AI.Say(LocText("TEXT_WIP_CSWYRII_20250114_150607"));
                DC(int64(0x5744e9195446f015), EConversationDebugInfo::Done);
                DC(int64(0x5744e9195446f016), EConversationDebugInfo::Executing);
                // Let's save that conversation for another time. Maybe. 
                Syra.AI.Say(LocText("TEXT_WIP_CSWYRII_20250114_150632"));
                DC(int64(0x5744e9195446f016), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceSyra145457 : UTopic_Hero__OC_WOC_SYRA_109
        {
            default DebugId = int64(0x38fe7afef8981705);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceSyra145457);
            
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
                    DB(int64(0x6c528962981d5b17), Quest::OldCamp_OCCHAPTER4_ESCAPEPLAN != nullptr && !Quest::OldCamp_OCCHAPTER4_ESCAPEPLAN.HasBeenStarted());
                    DB(int64(0x319978557233a25e), G1R.WomenSaved != 0);
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
                DC(int64(0x38fe7afef8981704), EConversationDebugInfo::Executing);
                // They're all dead. Was that you?
                Syra.AI.Say(LocText("TEXT_WIP_CIVTSEI_20250129_105220_41"));
                DC(int64(0x38fe7afef8981704), EConversationDebugInfo::Done);
                DC(int64(0x38fe7afef8981703), EConversationDebugInfo::Executing);
                
                // Well ... sort of. 
                Hero.AI.Say(LocText("TEXT_WIP_CIVTSEI_20250129_105220"));
                DC(int64(0x38fe7afef8981703), EConversationDebugInfo::Done);
                DC(int64(0x38fe7afef8981707), EConversationDebugInfo::Executing);
                
                // So we're safe now! Thank you!
                Syra.AI.Say(LocText("TEXT_WIP_CIVTSEI_20250129_120548"));
                DC(int64(0x38fe7afef8981707), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_WOC_SYRA, Document::UDocumentSegment_Glossary_OC_WOC_SYRA_Safe);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH4_ESCAPEPLAN, Document::UDocumentSegment_CH4_ESCAPEPLAN_GomezKo);
                DC(int64(0x319978557233a262), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Velaya))) { Velaya.ExchangeDailyRoutineToClass(UDailyRoutine_OC_WOC_Velaya_108_Saved); }
                DC(int64(0x319978557233a262), EConversationDebugInfo::Done);
                DC(int64(0x319978557233a266), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Seraphia))) { Seraphia.ExchangeDailyRoutineToClass(UDailyRoutine_OC_WOC_Seraphia_110_Saved); }
                DC(int64(0x319978557233a266), EConversationDebugInfo::Done);
                DC(int64(0x319978557233a268), EConversationDebugInfo::Executing);
                Syra.ExchangeDailyRoutineToClass(UDailyRoutine_OC_WOC_Syra_109_Saved);
                DC(int64(0x319978557233a268), EConversationDebugInfo::Done);
                DC(int64(0x319978557233a26a), EConversationDebugInfo::Executing);
                G1R.WomenSaved = 1;
                DC(int64(0x319978557233a26a), EConversationDebugInfo::Done);
                DB(int64(0xf0c9d4e4e04bf68d), Quest::OldCamp_OCCHAPTER4_ESCAPEPLAN != nullptr && !Quest::OldCamp_OCCHAPTER4_ESCAPEPLAN.HasSucceeded());
                
                if (Quest::OldCamp_OCCHAPTER4_ESCAPEPLAN != nullptr && !Quest::OldCamp_OCCHAPTER4_ESCAPEPLAN.HasSucceeded())
                {
                    DC(int64(0xf0c9d4e4e04bf676), EConversationDebugInfo::Executing);
                    Quest::OldCamp_OCCHAPTER4_ESCAPEPLAN.SucceedQuest();
                    DC(int64(0xf0c9d4e4e04bf676), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_syra_145457_exit_1");
                    DC(int64(0xf0c9d4e4e04bf699), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xf0c9d4e4e04bf699), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    
                    Other.Remember(n"choice_syra_145457_exit_2");
                    DC(int64(0xf0c9d4e4e04bf696), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xf0c9d4e4e04bf696), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
        class UChoiceSyra146114 : UTopic_Hero__OC_WOC_SYRA_109
        {
            default DebugId = int64(0x5744e9195446f01e);
            default Caption = LocText("TEXT_WIP_CSWYRII_20250114_151042");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceSyra134706);
            default Rules.HideIfKnows(UChoiceSyra146114);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x6a22653c654bd5b9), Quest::OldCamp_OCCHAPTER2_BULLYFORBULLIT != nullptr && !Quest::OldCamp_OCCHAPTER2_BULLYFORBULLIT.HasSucceeded());
                }
                
                return Quest::OldCamp_OCCHAPTER2_BULLYFORBULLIT != nullptr && !Quest::OldCamp_OCCHAPTER2_BULLYFORBULLIT.HasSucceeded();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5744e9195446f01c), EConversationDebugInfo::Executing);
                // Have you tried taking care of it yourself?
                Hero.AI.Say(LocText("TEXT_WIP_CSWYRII_20250114_151042"));
                DC(int64(0x5744e9195446f01c), EConversationDebugInfo::Done);
                DC(int64(0x5744e9195446f01d), EConversationDebugInfo::Executing);
                
                // How? By beating him to death with a soup ladle? Or ...
                Syra.AI.Say(LocText("TEXT_WIP_CSWYRII_20250114_151042_731"));
                DC(int64(0x5744e9195446f01d), EConversationDebugInfo::Done);
                DC(int64(0x5744e9195446f020), EConversationDebugInfo::Executing);
                // I hate myself for saying that, but I'm lucky I'm still ...
                Syra.AI.Say(LocText("TEXT_WIP_CSWYRII_20250114_151138"));
                DC(int64(0x5744e9195446f020), EConversationDebugInfo::Done);
                DC(int64(0xac7c76cc07d3673b), EConversationDebugInfo::Executing);
                // You try being one of the only women in here for just a ...
                Syra.AI.Say(LocText("TEXT_WIP_DSWYRII_20250115_151358"));
                DC(int64(0xac7c76cc07d3673b), EConversationDebugInfo::Done);
                DC(int64(0x5744e9195446f021), EConversationDebugInfo::Executing);
                // And even if I somehow managed to pull it off, they'll ...
                Syra.AI.Say(LocText("TEXT_WIP_CSWYRII_20250114_151238"));
                DC(int64(0x5744e9195446f021), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceSyra199568 : UTopic_Hero__OC_WOC_SYRA_109
        {
            default DebugId = int64(0xf92e93f647daf9e0);
            default Caption = LocText("TEXT_WIP_XOSFHOK_20250116_173217_41");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceSyra134706);
            default Rules.HideIfKnows(UChoiceSyra199568);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x8400aaa0595fef1a), Quest::OldCamp_OCCHAPTER2_SYRARECIPE_SYRARECIPE_OBJ_GETRECIPE != nullptr && Quest::OldCamp_OCCHAPTER2_SYRARECIPE_SYRARECIPE_OBJ_GETRECIPE.IsRunning());
                }
                
                return Quest::OldCamp_OCCHAPTER2_SYRARECIPE_SYRARECIPE_OBJ_GETRECIPE != nullptr && Quest::OldCamp_OCCHAPTER2_SYRARECIPE_SYRARECIPE_OBJ_GETRECIPE.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8400aaa0595fef14), EConversationDebugInfo::Executing);
                
                // Snaf sent me. About your cooking recipes.
                Hero.AI.Say(LocText("TEXT_WIP_XOSFHOK_20250116_173217_41"));
                DC(int64(0x8400aaa0595fef14), EConversationDebugInfo::Done);
                DC(int64(0x8400aaa0595fef18), EConversationDebugInfo::Executing);
                
                // That cook from the outer ring? These recipes are for ...
                Syra.AI.Say(LocText("TEXT_WIP_XOSFHOK_20250116_173258"));
                DC(int64(0x8400aaa0595fef18), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_SYRARECIPE, Document::UDocumentSegment_CH2_SYRARECIPE_SyraDenied);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */