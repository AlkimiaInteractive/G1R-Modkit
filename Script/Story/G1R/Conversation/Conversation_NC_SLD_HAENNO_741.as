#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_NC_SLD_HAENNO_741 : UConversationCharacterSettings
        {
            default ForCharacter = n"NC_SLD_HAENNO_741";
        }
        
        
        class UTopic_Hero__NC_SLD_HAENNO_741 : UG1RDialogTopic
        {
            default ForCharacter = n"NC_SLD_HAENNO_741";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetHaenno() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceHaenno1377926 : UTopic_Hero__NC_SLD_HAENNO_741
        {
            default DebugId = int64(0x3083200e69179a33);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceHaenno1377926);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x3083200e6918247b), Hero != nullptr && Hero.IsInConversation());
                    DB(int64(0x5f4dbab997047e8d), G1R.Haenno_Bow_Knowledge != 0);
                }
                
                if (Hero != nullptr && !Hero.IsInConversation())
                    return false;
                
                if (G1R.Haenno_Bow_Knowledge == 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7871d5046cd8f12c), EConversationDebugInfo::Executing);
                // So, how do you knock your arrows?
                Haenno.AI.Say(LocText("TEXT_WIP_NXCRSLE_20250210_172144_3569"));
                DC(int64(0x7871d5046cd8f12c), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_BOWARTISAN, Document::UDocumentSegment_CH1_BOWARTISAN_Start);
                Subdialog(
                    UTopic_Haenno_463843,
                    UTopic_Haenno_463863
                );
                DC(int64(0x2c861faeb8cbad6e), EConversationDebugInfo::Executing);
                // But doesn't that depend on the bow?
                Hero.AI.Say(LocText("TEXT_WIP_MXCRSLE_20250211_083211"));
                DC(int64(0x2c861faeb8cbad6e), EConversationDebugInfo::Done);
                DC(int64(0x2c861faeb8cbad6f), EConversationDebugInfo::Executing);
                
                // Skill always depends on the archer, not the bow.
                Haenno.AI.Say(LocText("TEXT_WIP_MXCRSLE_20250211_083211_41"));
                DC(int64(0x2c861faeb8cbad6f), EConversationDebugInfo::Done);
                DC(int64(0x2c861faeb8cbad72), EConversationDebugInfo::Executing);
                // You know what, I'm gonna carve a bow for you.
                Haenno.AI.Say(LocText("TEXT_WIP_MXCRSLE_20250211_083335"));
                DC(int64(0x2c861faeb8cbad72), EConversationDebugInfo::Done);
                DC(int64(0x2c861faeb8cbad73), EConversationDebugInfo::Executing);
                // If you bring me your preferred type of wood.
                Haenno.AI.Say(LocText("TEXT_WIP_MXCRSLE_20250211_083407"));
                DC(int64(0x2c861faeb8cbad73), EConversationDebugInfo::Done);
                DC(int64(0x2c861faeb8cbad74), EConversationDebugInfo::Executing);
                
                // All the same to me.
                Hero.AI.Say(LocText("TEXT_WIP_MXCRSLE_20250211_083426"));
                DC(int64(0x2c861faeb8cbad74), EConversationDebugInfo::Done);
                DC(int64(0x2c861faeb8cbad75), EConversationDebugInfo::Executing);
                
                // Not for long, trust me! Willow's much more flexible than ...
                Haenno.AI.Say(LocText("TEXT_WIP_MXCRSLE_20250211_083432"));
                DC(int64(0x2c861faeb8cbad75), EConversationDebugInfo::Done);
                DC(int64(0x2c861faeb8cbad76), EConversationDebugInfo::Executing);
                
                // All right.
                Hero.AI.Say(LocText("TEXT_WIP_MXCRSLE_20250211_084057"));
                DC(int64(0x2c861faeb8cbad76), EConversationDebugInfo::Done);
                DC(int64(0x3bf83ff17a237c4b), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER1_BOWARTISAN.StartQuest();
                DC(int64(0x3bf83ff17a237c4b), EConversationDebugInfo::Done);
                DC(int64(0x84955110fa32850a), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER1_BOWARTISAN_BOWARTISAN_OBJ_MATERIAL.StartQuest();
                DC(int64(0x84955110fa32850a), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Haenno_463843 : UTopic_Hero__NC_SLD_HAENNO_741
        {
            default DebugId = int64(0x7871d5046cd8f130);
            default Caption = LocText("TEXT_WIP_NXCRSLE_20250210_172208_443");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Haenno_463843);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7871d5046cd8f131), EConversationDebugInfo::Executing);
                // The Varantian way.
                Hero.AI.Say(LocText("TEXT_WIP_NXCRSLE_20250210_172208_443"));
                DC(int64(0x7871d5046cd8f131), EConversationDebugInfo::Done);
                DC(int64(0x7871d5046cd8f13a), EConversationDebugInfo::Executing);
                
                // Hm ... all right. I like it more traditional, relying on ...
                Haenno.AI.Say(LocText("TEXT_WIP_NXCRSLE_20250210_172403"));
                DC(int64(0x7871d5046cd8f13a), EConversationDebugInfo::Done);
                DC(int64(0x7871d5046cd8f13b), EConversationDebugInfo::Executing);
                // You do what works best for you, even if it takes longer.
                Haenno.AI.Say(LocText("TEXT_WIP_NXCRSLE_20250210_172414"));
                DC(int64(0x7871d5046cd8f13b), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Haenno_463863 : UTopic_Hero__NC_SLD_HAENNO_741
        {
            default DebugId = int64(0x7871d5046cd8f134);
            default Caption = LocText("TEXT_WIP_NXCRSLE_20250210_172208_491");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Haenno_463863);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7871d5046cd8f135), EConversationDebugInfo::Executing);
                
                // The traditional way.
                Hero.AI.Say(LocText("TEXT_WIP_NXCRSLE_20250210_172208_491"));
                DC(int64(0x7871d5046cd8f135), EConversationDebugInfo::Done);
                DC(int64(0x7871d5046cd8f138), EConversationDebugInfo::Executing);
                
                // Good - I like the way you think. Forget about technique, ...
                Haenno.AI.Say(LocText("TEXT_WIP_NXCRSLE_20250210_172348"));
                DC(int64(0x7871d5046cd8f138), EConversationDebugInfo::Done);
                DC(int64(0x8392b2c0a7afa4bb), EConversationDebugInfo::Executing);
                // That'll give you a quick advantage.
                Haenno.AI.Say(LocText("TEXT_WIP_CVNQHYB_20250211_185831"));
                DC(int64(0x8392b2c0a7afa4bb), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceHaenno144003 : UTopic_Hero__NC_SLD_HAENNO_741
        {
            default DebugId = int64(0xf3d72cb61051d500);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf3d72cb61051d4ff), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xf3d72cb61051d4ff), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceHaenno144019 : UTopic_Hero__NC_SLD_HAENNO_741
        {
            default DebugId = int64(0xf3d72cb61051d504);
            default Caption = LocText("TEXT_WIP_WROXZYD_20250121_143822_41");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceHaenno144019);
            
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"FP_NC_PRACTICEBOW_HAENNO", 10000.0f, int64(0xf3d72cb61051d504));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf3d72cb61051d502), EConversationDebugInfo::Executing);
                // What can you tell me about this camp?
                Hero.AI.Say(LocText("TEXT_WIP_WROXZYD_20250121_143822_41"));
                DC(int64(0xf3d72cb61051d502), EConversationDebugInfo::Done);
                DC(int64(0xf3d72cb61051d503), EConversationDebugInfo::Executing);
                
                // It's the best out of all of them. I mean, if you're ...
                Haenno.AI.Say(LocText("TEXT_WIP_WROXZYD_20250121_143822_2083"));
                DC(int64(0xf3d72cb61051d503), EConversationDebugInfo::Done);
                DC(int64(0x7871d5046cd8f0e7), EConversationDebugInfo::Executing);
                // But at least there's no ore barons or gurus bossing us ...
                Haenno.AI.Say(LocText("TEXT_WIP_NXCRSLE_20250210_170542"));
                DC(int64(0x7871d5046cd8f0e7), EConversationDebugInfo::Done);
                DC(int64(0x8392b2c0a7afa4b8), EConversationDebugInfo::Executing);
                // The mages are working hard on their plan to free us and ...
                Haenno.AI.Say(LocText("TEXT_WIP_CVNQHYB_20250211_184128"));
                DC(int64(0x8392b2c0a7afa4b8), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_SLD_HAENNO, Document::UDocumentSegment_Glossary_NC_SLD_HAENNO_Introduction);
            }
        }
        
        
        class UChoiceHaenno153420 : UTopic_Hero__NC_SLD_HAENNO_741
        {
            default DebugId = int64(0x2c861faeb8cbad79);
            default Caption = LocText("TEXT_WIP_MXCRSLE_20250211_084122");
            default PriorityRank = 3;
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_MXCRSLE_20250211_093201"), int64(0x2c861faeb8cbad79));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x3bf83ff17a237c62), Quest::NewCamp_NCCHAPTER1_BOWARTISAN != nullptr && Quest::NewCamp_NCCHAPTER1_BOWARTISAN.IsRunning());
                }
                
                return Quest::NewCamp_NCCHAPTER1_BOWARTISAN != nullptr && Quest::NewCamp_NCCHAPTER1_BOWARTISAN.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2c861faeb8cbad77), EConversationDebugInfo::Executing);
                // I have wood for the bow.
                Hero.AI.Say(LocText("TEXT_WIP_MXCRSLE_20250211_084122"));
                DC(int64(0x2c861faeb8cbad77), EConversationDebugInfo::Done);
                DC(int64(0x2c861faeb8cbad78), EConversationDebugInfo::Executing);
                
                // Show me - which one did you go for?
                Haenno.AI.Say(LocText("TEXT_WIP_MXCRSLE_20250211_084122_2238"));
                DC(int64(0x2c861faeb8cbad78), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Haenno_153524,
                    UTopic_Haenno_153544,
                    UTopic_Haenno_153732,
                    UTopic_Haenno_153752
                );
            }
        }
        
        
        class UTopic_Haenno_153524 : UTopic_Hero__NC_SLD_HAENNO_741
        {
            default DebugId = int64(0x2c861faeb8cbad7c);
            default Caption = LocText("TEXT_WIP_MXCRSLE_20250211_084544_2785");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x2c861faeb8cbadc0), Hero != nullptr && Hero.HasItem(UItMi_Smith_Willow, 1, 0));
                }
                
                return Hero != nullptr && Hero.HasItem(UItMi_Smith_Willow, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2c861faeb8cbad7d), EConversationDebugInfo::Executing);
                // Willow.
                Hero.AI.Say(LocText("TEXT_WIP_MXCRSLE_20250211_084544_2785"));
                DC(int64(0x2c861faeb8cbad7d), EConversationDebugInfo::Done);
                DC(int64(0x2c861faeb8cbad96), EConversationDebugInfo::Executing);
                
                // Ah, yes. Very popular for its pliability.
                Haenno.AI.Say(LocText("TEXT_WIP_MXCRSLE_20250211_084918"));
                DC(int64(0x2c861faeb8cbad96), EConversationDebugInfo::Done);
                DC(int64(0x2c861faeb8cbad97), EConversationDebugInfo::Executing);
                // A willow bow might not hit that hard, but it'll give you ...
                Haenno.AI.Say(LocText("TEXT_WIP_MXCRSLE_20250211_085233"));
                DC(int64(0x2c861faeb8cbad97), EConversationDebugInfo::Done);
                DC(int64(0x2c861faeb8cbad98), EConversationDebugInfo::Executing);
                // Do you want me to use the willow wood, then?
                Haenno.AI.Say(LocText("TEXT_WIP_MXCRSLE_20250211_085518"));
                DC(int64(0x2c861faeb8cbad98), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Haenno_154042,
                    UTopic_Haenno_154062
                );
            }
        }
        
        
        class UTopic_Haenno_153544 : UTopic_Hero__NC_SLD_HAENNO_741
        {
            default DebugId = int64(0x2c861faeb8cbad80);
            default Caption = LocText("TEXT_WIP_MXCRSLE_20250211_084656_686");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x2c861faeb8cbadc0), Hero != nullptr && Hero.HasItem(UItMi_Smith_Oak, 1, 0));
                }
                
                return Hero != nullptr && Hero.HasItem(UItMi_Smith_Oak, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2c861faeb8cbad86), EConversationDebugInfo::Executing);
                // Oak.
                Hero.AI.Say(LocText("TEXT_WIP_MXCRSLE_20250211_084656_686"));
                DC(int64(0x2c861faeb8cbad86), EConversationDebugInfo::Done);
                DC(int64(0x2c861faeb8cbada3), EConversationDebugInfo::Executing);
                
                // All right. Oak's rather hard, not very flexible, but can ...
                Haenno.AI.Say(LocText("TEXT_WIP_MXCRSLE_20250211_091558"));
                DC(int64(0x2c861faeb8cbada3), EConversationDebugInfo::Done);
                DC(int64(0x2c861faeb8cbada4), EConversationDebugInfo::Executing);
                // Not the conventional bow wood, but it'll give it decent ...
                Haenno.AI.Say(LocText("TEXT_WIP_MXCRSLE_20250211_091703"));
                DC(int64(0x2c861faeb8cbada4), EConversationDebugInfo::Done);
                DC(int64(0x2c861faeb8cbada6), EConversationDebugInfo::Executing);
                // Should I use the oak wood, then?
                Haenno.AI.Say(LocText("TEXT_WIP_MXCRSLE_20250211_091902"));
                DC(int64(0x2c861faeb8cbada6), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Haenno_154471,
                    UTopic_Haenno_154491
                );
            }
        }
        
        
        class UTopic_Haenno_153732 : UTopic_Hero__NC_SLD_HAENNO_741
        {
            default DebugId = int64(0x2c861faeb8cbad85);
            default Caption = LocText("TEXT_WIP_MXCRSLE_20250211_084701_2386");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x2c861faeb8cbadc0), Hero != nullptr && Hero.HasItem(UItMi_Smith_Ironwood, 1, 0));
                }
                
                return Hero != nullptr && Hero.HasItem(UItMi_Smith_Ironwood, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2c861faeb8cbad8a), EConversationDebugInfo::Executing);
                // I've got this ironwood.
                Hero.AI.Say(LocText("TEXT_WIP_MXCRSLE_20250211_084701_2386"));
                DC(int64(0x2c861faeb8cbad8a), EConversationDebugInfo::Done);
                DC(int64(0x2c861faeb8cbadb1), EConversationDebugInfo::Executing);
                
                // Ironwood, huh?
                Haenno.AI.Say(LocText("TEXT_WIP_MXCRSLE_20250211_092214"));
                DC(int64(0x2c861faeb8cbadb1), EConversationDebugInfo::Done);
                DC(int64(0x2c861faeb8cbadb2), EConversationDebugInfo::Executing);
                // A classic - and very reliable, this one.
                Haenno.AI.Say(LocText("TEXT_WIP_MXCRSLE_20250211_092250"));
                DC(int64(0x2c861faeb8cbadb2), EConversationDebugInfo::Done);
                DC(int64(0x2c861faeb8cbadb3), EConversationDebugInfo::Executing);
                // It'll make for a fine bow that can deal heavy damage. 
                Haenno.AI.Say(LocText("TEXT_WIP_MXCRSLE_20250211_092330"));
                DC(int64(0x2c861faeb8cbadb3), EConversationDebugInfo::Done);
                DC(int64(0x2c861faeb8cbadb4), EConversationDebugInfo::Executing);
                // Is that what you want?
                Haenno.AI.Say(LocText("TEXT_WIP_MXCRSLE_20250211_092431"));
                DC(int64(0x2c861faeb8cbadb4), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Haenno_154754,
                    UTopic_Haenno_154774
                );
            }
        }
        
        
        class UTopic_Haenno_153752 : UTopic_Hero__NC_SLD_HAENNO_741
        {
            default DebugId = int64(0x2c861faeb8cbad89);
            default Caption = LocText("TEXT_WIP_MXCRSLE_20250211_084544_3286");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2c861faeb8cbad81), EConversationDebugInfo::Executing);
                // I'm still looking.
                Hero.AI.Say(LocText("TEXT_WIP_MXCRSLE_20250211_084544_3286"));
                DC(int64(0x2c861faeb8cbad81), EConversationDebugInfo::Done);
                DC(int64(0x2c861faeb8cbad84), EConversationDebugInfo::Executing);
                
                // Sure. Good luck.
                Haenno.AI.Say(LocText("TEXT_WIP_MXCRSLE_20250211_084610"));
                DC(int64(0x2c861faeb8cbad84), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Haenno_154042 : UTopic_Hero__NC_SLD_HAENNO_741
        {
            default DebugId = int64(0x2c861faeb8cbad9a);
            default Caption = LocText("TEXT_WIP_MXCRSLE_20250211_085819_3984");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Haenno_154042);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2c861faeb8cbad9b), EConversationDebugInfo::Executing);
                
                // Sure, do it.
                Hero.AI.Say(LocText("TEXT_WIP_MXCRSLE_20250211_085819_3984"));
                DC(int64(0x2c861faeb8cbad9b), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_BOWARTISAN, Document::UDocumentSegment_CH1_BOWARTISAN_Willow);
                DC(int64(0x2c861faeb8cbadc4), EConversationDebugInfo::Executing);
                Hero.AI.GiveItemTo(Haenno, UItMi_Smith_Willow, 1);
                DC(int64(0x2c861faeb8cbadc4), EConversationDebugInfo::Done);
                DC(int64(0x2c861faeb8cbadc5), EConversationDebugInfo::Executing);
                // All right. A good bow takes time, though, so you best ...
                Haenno.AI.Say(LocText("TEXT_WIP_MXCRSLE_20250211_093201"));
                DC(int64(0x2c861faeb8cbadc5), EConversationDebugInfo::Done);
                DC(int64(0x2c861faeb8cbaddb), EConversationDebugInfo::Executing);
                G1R.Bow_Artisan = FInGameTime::Now();
                DC(int64(0x2c861faeb8cbaddb), EConversationDebugInfo::Done);
                DC(int64(0x107fd53ec62df956), EConversationDebugInfo::Executing);
                Haenno.ExchangeDailyRoutineToClass(UDailyRoutine_NC_SLD_Haenno_741_Preparebow);
                DC(int64(0x107fd53ec62df956), EConversationDebugInfo::Done);
                DC(int64(0x84955110fa32850c), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER1_BOWARTISAN_BOWARTISAN_OBJ_BOW.StartQuest();
                DC(int64(0x84955110fa32850c), EConversationDebugInfo::Done);
                DC(int64(0x84955110fa32850e), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER1_BOWARTISAN_BOWARTISAN_OBJ_MATERIAL.SucceedQuest();
                DC(int64(0x84955110fa32850e), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Haenno_154062 : UTopic_Hero__NC_SLD_HAENNO_741
        {
            default DebugId = int64(0x2c861faeb8cbad9e);
            default Caption = LocText("TEXT_WIP_MXCRSLE_20250211_085819_3569");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2c861faeb8cbad9f), EConversationDebugInfo::Executing);
                // Let me think about it.
                Hero.AI.Say(LocText("TEXT_WIP_MXCRSLE_20250211_085819_3569"));
                DC(int64(0x2c861faeb8cbad9f), EConversationDebugInfo::Done);
                DC(int64(0x2c861faeb8cbada2), EConversationDebugInfo::Executing);
                
                // As you wish.
                Haenno.AI.Say(LocText("TEXT_WIP_MXCRSLE_20250211_085937"));
                DC(int64(0x2c861faeb8cbada2), EConversationDebugInfo::Done);
                DC(int64(0x2c861faeb8cbada1), EConversationDebugInfo::Executing);
                ReturnToLastSelection(2);
                DC(int64(0x2c861faeb8cbada1), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Haenno_154471 : UTopic_Hero__NC_SLD_HAENNO_741
        {
            default DebugId = int64(0x2c861faeb8cbada8);
            default Caption = LocText("TEXT_WIP_MXCRSLE_20250211_085819_3984");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Haenno_154471);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2c861faeb8cbada9), EConversationDebugInfo::Executing);
                // Sure, do it.
                Hero.AI.Say(LocText("TEXT_WIP_MXCRSLE_20250211_085819_3984"));
                DC(int64(0x2c861faeb8cbada9), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_BOWARTISAN, Document::UDocumentSegment_CH1_BOWARTISAN_OakWood);
                DC(int64(0x2c861faeb8cbadc4), EConversationDebugInfo::Executing);
                Hero.AI.GiveItemTo(Haenno, UItMi_Smith_Oak, 1);
                DC(int64(0x2c861faeb8cbadc4), EConversationDebugInfo::Done);
                DC(int64(0x2c861faeb8cbadcc), EConversationDebugInfo::Executing);
                // All right. A good bow takes time, though, so you best ...
                Haenno.AI.Say(LocText("TEXT_WIP_MXCRSLE_20250211_093201"));
                DC(int64(0x2c861faeb8cbadcc), EConversationDebugInfo::Done);
                DC(int64(0x2c861faeb8cbaddb), EConversationDebugInfo::Executing);
                G1R.Bow_Artisan = FInGameTime::Now();
                DC(int64(0x2c861faeb8cbaddb), EConversationDebugInfo::Done);
                DC(int64(0x107fd53ec62df958), EConversationDebugInfo::Executing);
                Haenno.ExchangeDailyRoutineToClass(UDailyRoutine_NC_SLD_Haenno_741_Preparebow);
                DC(int64(0x107fd53ec62df958), EConversationDebugInfo::Done);
                DC(int64(0x84955110fa328510), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER1_BOWARTISAN_BOWARTISAN_OBJ_MATERIAL.SucceedQuest();
                DC(int64(0x84955110fa328510), EConversationDebugInfo::Done);
                DC(int64(0x84955110fa328512), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER1_BOWARTISAN_BOWARTISAN_OBJ_BOW.StartQuest();
                DC(int64(0x84955110fa328512), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Haenno_154491 : UTopic_Hero__NC_SLD_HAENNO_741
        {
            default DebugId = int64(0x2c861faeb8cbadac);
            default Caption = LocText("TEXT_WIP_MXCRSLE_20250211_085819_3569");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2c861faeb8cbadad), EConversationDebugInfo::Executing);
                // Let me think about it.
                Hero.AI.Say(LocText("TEXT_WIP_MXCRSLE_20250211_085819_3569"));
                DC(int64(0x2c861faeb8cbadad), EConversationDebugInfo::Done);
                DC(int64(0x2c861faeb8cbadb0), EConversationDebugInfo::Executing);
                
                // As you wish.
                Haenno.AI.Say(LocText("TEXT_WIP_MXCRSLE_20250211_085937"));
                DC(int64(0x2c861faeb8cbadb0), EConversationDebugInfo::Done);
                DC(int64(0x2c861faeb8cbadaf), EConversationDebugInfo::Executing);
                ReturnToLastSelection(2);
                DC(int64(0x2c861faeb8cbadaf), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Haenno_154754 : UTopic_Hero__NC_SLD_HAENNO_741
        {
            default DebugId = int64(0x2c861faeb8cbadb6);
            default Caption = LocText("TEXT_WIP_MXCRSLE_20250211_085819_3984");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Haenno_154754);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2c861faeb8cbadb7), EConversationDebugInfo::Executing);
                // Sure, do it.
                Hero.AI.Say(LocText("TEXT_WIP_MXCRSLE_20250211_085819_3984"));
                DC(int64(0x2c861faeb8cbadb7), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_BOWARTISAN, Document::UDocumentSegment_CH1_BOWARTISAN_IronWood);
                DC(int64(0x2c861faeb8cbadc4), EConversationDebugInfo::Executing);
                Hero.AI.GiveItemTo(Haenno, UItMi_Smith_Ironwood, 1);
                DC(int64(0x2c861faeb8cbadc4), EConversationDebugInfo::Done);
                DC(int64(0x2c861faeb8cbadce), EConversationDebugInfo::Executing);
                // All right. A good bow takes time, though, so you best ...
                Haenno.AI.Say(LocText("TEXT_WIP_MXCRSLE_20250211_093201"));
                DC(int64(0x2c861faeb8cbadce), EConversationDebugInfo::Done);
                DC(int64(0x2c861faeb8cbaddb), EConversationDebugInfo::Executing);
                G1R.Bow_Artisan = FInGameTime::Now();
                DC(int64(0x2c861faeb8cbaddb), EConversationDebugInfo::Done);
                DC(int64(0x107fd53ec62df95a), EConversationDebugInfo::Executing);
                Haenno.ExchangeDailyRoutineToClass(UDailyRoutine_NC_SLD_Haenno_741_Preparebow);
                DC(int64(0x107fd53ec62df95a), EConversationDebugInfo::Done);
                DC(int64(0x84955110fa328514), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER1_BOWARTISAN_BOWARTISAN_OBJ_MATERIAL.SucceedQuest();
                DC(int64(0x84955110fa328514), EConversationDebugInfo::Done);
                DC(int64(0x84955110fa328516), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER1_BOWARTISAN_BOWARTISAN_OBJ_BOW.StartQuest();
                DC(int64(0x84955110fa328516), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Haenno_154774 : UTopic_Hero__NC_SLD_HAENNO_741
        {
            default DebugId = int64(0x2c861faeb8cbadba);
            default Caption = LocText("TEXT_WIP_MXCRSLE_20250211_085819_3569");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2c861faeb8cbadbb), EConversationDebugInfo::Executing);
                // Let me think about it.
                Hero.AI.Say(LocText("TEXT_WIP_MXCRSLE_20250211_085819_3569"));
                DC(int64(0x2c861faeb8cbadbb), EConversationDebugInfo::Done);
                DC(int64(0x2c861faeb8cbadbe), EConversationDebugInfo::Executing);
                
                // As you wish.
                Haenno.AI.Say(LocText("TEXT_WIP_MXCRSLE_20250211_085937"));
                DC(int64(0x2c861faeb8cbadbe), EConversationDebugInfo::Done);
                DC(int64(0x2c861faeb8cbadbd), EConversationDebugInfo::Executing);
                ReturnToLastSelection(2);
                DC(int64(0x2c861faeb8cbadbd), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceHaenno155239 : UTopic_Hero__NC_SLD_HAENNO_741
        {
            default DebugId = int64(0x2c861faeb8cbade2);
            default Caption = LocText("TEXT_WIP_MXCRSLE_20250211_094031");
            default PriorityRank = 3;
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_MXCRSLE_20250211_093201"), int64(0x2c861faeb8cbade2));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x3bf83ff17a237c66), Quest::NewCamp_NCCHAPTER1_BOWARTISAN_BOWARTISAN_OBJ_BOW != nullptr && Quest::NewCamp_NCCHAPTER1_BOWARTISAN_BOWARTISAN_OBJ_BOW.IsRunning());
                }
                
                return Quest::NewCamp_NCCHAPTER1_BOWARTISAN_BOWARTISAN_OBJ_BOW != nullptr && Quest::NewCamp_NCCHAPTER1_BOWARTISAN_BOWARTISAN_OBJ_BOW.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2c861faeb8cbade0), EConversationDebugInfo::Executing);
                // About my bow ...
                Hero.AI.Say(LocText("TEXT_WIP_MXCRSLE_20250211_094031"));
                DC(int64(0x2c861faeb8cbade0), EConversationDebugInfo::Done);
                DB(int64(0x2c861faeb8cbade6), G1R.Bow_Artisan.IsValid() && G1R.Bow_Artisan.IsAtLeastXDaysAgo(1));
                
                if (G1R.Bow_Artisan.IsValid() && G1R.Bow_Artisan.IsAtLeastXDaysAgo(1))
                {
                    DC(int64(0x2c861faeb8cbadea), EConversationDebugInfo::Executing);
                    // It's done. Here you go.
                    Haenno.AI.Say(LocText("TEXT_WIP_MXCRSLE_20250211_094224"));
                    DC(int64(0x2c861faeb8cbadea), EConversationDebugInfo::Done);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_BOWARTISAN, Document::UDocumentSegment_CH1_BOWARTISAN_Success);
                    DB(int64(0x2c861faeb8cbadfc), Haenno != nullptr && Haenno.HasItem(UItMi_Smith_Willow, 1, 0));
                    DB(int64(0x2c861faeb8cbadff), Haenno != nullptr && Haenno.HasItem(UItMi_Smith_Oak, 1, 0));
                    
                    if (Haenno != nullptr && Haenno.HasItem(UItMi_Smith_Willow, 1, 0))
                    {
                        DC(int64(0xcbe41b81f2725efd), EConversationDebugInfo::Executing);
                        Haenno.AddItemToInventory(UItRw_Bow_Long_10, 1);
                        DC(int64(0xcbe41b81f2725efd), EConversationDebugInfo::Done);
                        DC(int64(0x2c861faeb8cbadf0), EConversationDebugInfo::Executing);
                        Haenno.AI.GiveItemTo(Hero, UItRw_Bow_Long_10, 1);
                        DC(int64(0x2c861faeb8cbadf0), EConversationDebugInfo::Done);
                    }
                    else if (Haenno != nullptr && Haenno.HasItem(UItMi_Smith_Oak, 1, 0))
                    {
                        DC(int64(0xcbe41b81f2725efd), EConversationDebugInfo::Executing);
                        Haenno.AddItemToInventory(UItRw_Bow_Long_11, 1);
                        DC(int64(0xcbe41b81f2725efd), EConversationDebugInfo::Done);
                        DC(int64(0x2c861faeb8cbadf0), EConversationDebugInfo::Executing);
                        Haenno.AI.GiveItemTo(Hero, UItRw_Bow_Long_11, 1);
                        DC(int64(0x2c861faeb8cbadf0), EConversationDebugInfo::Done);
                    }
                    else
                    {
                        DC(int64(0xcbe41b81f2725efd), EConversationDebugInfo::Executing);
                        Haenno.AddItemToInventory(UItRw_Bow_Long_12, 1);
                        DC(int64(0xcbe41b81f2725efd), EConversationDebugInfo::Done);
                        DC(int64(0x2c861faeb8cbadf0), EConversationDebugInfo::Executing);
                        Haenno.AI.GiveItemTo(Hero, UItRw_Bow_Long_12, 1);
                        DC(int64(0x2c861faeb8cbadf0), EConversationDebugInfo::Done);
                    }
                    DC(int64(0x2c861faeb8cbadf4), EConversationDebugInfo::Executing);
                    // I gotta admit, I did it in a bit of a rush, but it came ...
                    Haenno.AI.Say(LocText("TEXT_WIP_MXCRSLE_20250211_094258_94"));
                    DC(int64(0x2c861faeb8cbadf4), EConversationDebugInfo::Done);
                    DC(int64(0x2c861faeb8cbadf8), EConversationDebugInfo::Executing);
                    // I'm sort of proud of it - and I hope you'll carry it ...
                    Haenno.AI.Say(LocText("TEXT_WIP_MXCRSLE_20250211_094353"));
                    DC(int64(0x2c861faeb8cbadf8), EConversationDebugInfo::Done);
                    DC(int64(0x2c861faeb8cbadf7), EConversationDebugInfo::Executing);
                    
                    // I will. Thanks.
                    Hero.AI.Say(LocText("TEXT_WIP_MXCRSLE_20250211_094334"));
                    DC(int64(0x2c861faeb8cbadf7), EConversationDebugInfo::Done);
                    DC(int64(0x2c861faeb8cbae0f), EConversationDebugInfo::Executing);
                    Quest::NewCamp_NCCHAPTER1_BOWARTISAN.SucceedQuest();
                    DC(int64(0x2c861faeb8cbae0f), EConversationDebugInfo::Done);
                    DC(int64(0x107fd53ec62df95c), EConversationDebugInfo::Executing);
                    Haenno.ExchangeDailyRoutineToClass(UDailyRoutine_NC_SLD_Haenno_741_Start);
                    DC(int64(0x107fd53ec62df95c), EConversationDebugInfo::Done);
                    DC(int64(0x84955110fa328518), EConversationDebugInfo::Executing);
                    Quest::NewCamp_NCCHAPTER1_BOWARTISAN_BOWARTISAN_OBJ_BOW.SucceedQuest();
                    DC(int64(0x84955110fa328518), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_haenno_155239_exit_1");
                }
                else
                {
                    DC(int64(0x2c861faeb8cbade7), EConversationDebugInfo::Executing);
                    // A little impatient, are you? Come back later.
                    Haenno.AI.Say(LocText("TEXT_WIP_MXCRSLE_20250211_094147"));
                    DC(int64(0x2c861faeb8cbade7), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_haenno_155239_exit_2");
                    DC(int64(0x2c861faeb8cbade9), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x2c861faeb8cbade9), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
        class UChoiceHaenno463456 : UTopic_Hero__NC_SLD_HAENNO_741
        {
            default DebugId = int64(0x7871d5046cd8f0ea);
            default Caption = LocText("TEXT_WIP_NXCRSLE_20250210_170601");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceHaenno463456);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7871d5046cd8f0e8), EConversationDebugInfo::Executing);
                // What's your job around here?
                Hero.AI.Say(LocText("TEXT_WIP_NXCRSLE_20250210_170601"));
                DC(int64(0x7871d5046cd8f0e8), EConversationDebugInfo::Done);
                DC(int64(0x7871d5046cd8f0e9), EConversationDebugInfo::Executing);
                
                // I'm a mercenary, so I keep busy most of the time. We ...
                Haenno.AI.Say(LocText("TEXT_WIP_NXCRSLE_20250210_170601_41"));
                DC(int64(0x7871d5046cd8f0e9), EConversationDebugInfo::Done);
                DC(int64(0x8392b2c0a7afa4b9), EConversationDebugInfo::Executing);
                // You're gonna want to get your hands on it, I'm telling ...
                Haenno.AI.Say(LocText("TEXT_WIP_CVNQHYB_20250211_184302"));
                DC(int64(0x8392b2c0a7afa4b9), EConversationDebugInfo::Done);
                DC(int64(0x8392b2c0a7afa4ba), EConversationDebugInfo::Executing);
                // But whenever I've got some time left for myself, I'm ...
                Haenno.AI.Say(LocText("TEXT_WIP_CVNQHYB_20250211_184355"));
                DC(int64(0x8392b2c0a7afa4ba), EConversationDebugInfo::Done);
                DC(int64(0x7871d5046cd8f0ed), EConversationDebugInfo::Executing);
                
                // You're crafting bows?
                Hero.AI.Say(LocText("TEXT_WIP_NXCRSLE_20250210_170622"));
                DC(int64(0x7871d5046cd8f0ed), EConversationDebugInfo::Done);
                DC(int64(0x7871d5046cd8f0ee), EConversationDebugInfo::Executing);
                
                // Yes. Terrific weapons, and not only for hunting, don't ...
                Haenno.AI.Say(LocText("TEXT_WIP_NXCRSLE_20250210_170635"));
                DC(int64(0x7871d5046cd8f0ee), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_SLD_HAENNO, Document::UDocumentSegment_Glossary_NC_SLD_HAENNO_Introduction);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_SLD_HAENNO, Document::UDocumentSegment_Glossary_NC_SLD_HAENNO_CraftBows);
                Subdialog(
                    UTopic_Haenno_463522,
                    UTopic_Haenno_463542
                );
            }
        }
        
        
        class UTopic_Haenno_463522 : UTopic_Hero__NC_SLD_HAENNO_741
        {
            default DebugId = int64(0x7871d5046cd8f0f0);
            default Caption = LocText("TEXT_WIP_NXCRSLE_20250210_170707_2238");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Haenno_463522);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7871d5046cd8f0f1), EConversationDebugInfo::Executing);
                // They can come in really handy.
                Hero.AI.Say(LocText("TEXT_WIP_NXCRSLE_20250210_170707_2238"));
                DC(int64(0x7871d5046cd8f0f1), EConversationDebugInfo::Done);
                DB(int64(0x3083200e6915fb9f), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Ranged_Bow_Master));
                DB(int64(0x3083200e6915fba8), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Ranged_Bow_Trained));
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Ranged_Bow_Master))
                {
                    DC(int64(0x7871d5046cd8f0fd), EConversationDebugInfo::Executing);
                    // You're a master bowman yourself?
                    Haenno.AI.Say(LocText("TEXT_WIP_NXCRSLE_20250210_170953_3436"));
                    DC(int64(0x7871d5046cd8f0fd), EConversationDebugInfo::Done);
                    DC(int64(0x3083200e69182471), EConversationDebugInfo::Executing);
                    G1R.Haenno_Bow_Knowledge = 1;
                    DC(int64(0x3083200e69182471), EConversationDebugInfo::Done);
                }
                else if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Ranged_Bow_Trained))
                {
                    DC(int64(0x7871d5046cd8f108), EConversationDebugInfo::Executing);
                    // Someone who knows what he's talking about.
                    Haenno.AI.Say(LocText("TEXT_WIP_NXCRSLE_20250210_171158_686"));
                    DC(int64(0x7871d5046cd8f108), EConversationDebugInfo::Done);
                    DC(int64(0x3083200e69182471), EConversationDebugInfo::Executing);
                    G1R.Haenno_Bow_Knowledge = 1;
                    DC(int64(0x3083200e69182471), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x7871d5046cd8f101), EConversationDebugInfo::Executing);
                    // If you mean it, you should have someone teach you.
                    Haenno.AI.Say(LocText("TEXT_WIP_NXCRSLE_20250210_171005"));
                    DC(int64(0x7871d5046cd8f101), EConversationDebugInfo::Done);
                    DC(int64(0x7871d5046cd8f103), EConversationDebugInfo::Executing);
                    // Wolf comes to mind.
                    Haenno.AI.Say(LocText("TEXT_WIP_NXCRSLE_20250210_171025"));
                    DC(int64(0x7871d5046cd8f103), EConversationDebugInfo::Done);
                    DC(int64(0x7871d5046cd8f104), EConversationDebugInfo::Executing);
                    // Once you got the gist of it, we can have another chat.
                    Haenno.AI.Say(LocText("TEXT_WIP_NXCRSLE_20250210_171035"));
                    DC(int64(0x7871d5046cd8f104), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UTopic_Haenno_463542 : UTopic_Hero__NC_SLD_HAENNO_741
        {
            default DebugId = int64(0x7871d5046cd8f0f4);
            default Caption = LocText("TEXT_WIP_NXCRSLE_20250210_170707_2785");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Haenno_463542);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7871d5046cd8f0f5), EConversationDebugInfo::Executing);
                // Bows are for cowards.
                Hero.AI.Say(LocText("TEXT_WIP_NXCRSLE_20250210_170707_2785"));
                DC(int64(0x7871d5046cd8f0f5), EConversationDebugInfo::Done);
                DC(int64(0x7871d5046cd8f0f8), EConversationDebugInfo::Executing);
                
                // All right. You're more of the hand-to-hand kind of guy, ...
                Haenno.AI.Say(LocText("TEXT_WIP_NXCRSLE_20250210_170741"));
                DC(int64(0x7871d5046cd8f0f8), EConversationDebugInfo::Done);
                DC(int64(0x107fd53ec62df946), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x107fd53ec62df946), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceHaenno463770 : UTopic_Hero__NC_SLD_HAENNO_741
        {
            default DebugId = int64(0x3083200e69134827);
            default Caption = LocText("TEXT_WIP_NXCRSLE_20250210_171916");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceHaenno463456);
            default Rules.HideIfKnows(UChoiceHaenno463770);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x7871d5046cd8f126), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Ranged_Bow_Trained));
                    DB(int64(0x3bf83ff17a237c4f), Quest::NewCamp_NCCHAPTER1_BOWARTISAN != nullptr && !Quest::NewCamp_NCCHAPTER1_BOWARTISAN.IsRunning());
                    DB(int64(0x7871d5046cd8f128), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Ranged_Bow_Master));
                    DB(int64(0x3bf83ff17a237c4e), Quest::NewCamp_NCCHAPTER1_BOWARTISAN != nullptr && !Quest::NewCamp_NCCHAPTER1_BOWARTISAN.IsRunning());
                }
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Ranged_Bow_Trained) && Quest::NewCamp_NCCHAPTER1_BOWARTISAN != nullptr && !Quest::NewCamp_NCCHAPTER1_BOWARTISAN.IsRunning())
                    return true;
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Ranged_Bow_Master) && Quest::NewCamp_NCCHAPTER1_BOWARTISAN != nullptr && !Quest::NewCamp_NCCHAPTER1_BOWARTISAN.IsRunning())
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7871d5046cd8f121), EConversationDebugInfo::Executing);
                // I've gotten pretty good with a bow.
                Hero.AI.Say(LocText("TEXT_WIP_NXCRSLE_20250210_171916"));
                DC(int64(0x7871d5046cd8f121), EConversationDebugInfo::Done);
                DC(int64(0x7871d5046cd8f122), EConversationDebugInfo::Executing);
                
                // Glad to hear that.
                Haenno.AI.Say(LocText("TEXT_WIP_NXCRSLE_20250210_171916_3984"));
                DC(int64(0x7871d5046cd8f122), EConversationDebugInfo::Done);
                DC(int64(0x3083200e69182471), EConversationDebugInfo::Executing);
                G1R.Haenno_Bow_Knowledge = 1;
                DC(int64(0x3083200e69182471), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */