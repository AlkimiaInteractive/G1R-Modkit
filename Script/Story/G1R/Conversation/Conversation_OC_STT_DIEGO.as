#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OC_STT_DIEGO : UConversationCharacterSettings
        {
            default ForCharacter = n"OC_STT_DIEGO";
        }
        
        
        class UTopic_Hero__OC_STT_DIEGO : UG1RDialogTopic
        {
            default ForCharacter = n"OC_STT_DIEGO";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetDiego() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetGorn() const property
            {
                return GetCharacter(n"NC_SLD_GORN_699");
            }
            
            AGothicCharacterState GetMilten() const property
            {
                return GetCharacter(n"OC_KDF_MILTEN");
            }
            
            AGothicCharacterState GetRodriguez() const property
            {
                return GetCharacter(n"OC_KDF_RODRIGUEZ_400");
            }
            
            AGothicCharacterState GetDexter() const property
            {
                return GetCharacter(n"OC_STT_DEXTER_329");
            }
            
            AGothicCharacterState GetFingers() const property
            {
                return GetCharacter(n"OC_STT_FINGERS_331");
            }
            
            AGothicCharacterState GetFisk() const property
            {
                return GetCharacter(n"OC_STT_FISK_311");
            }
            
            AGothicCharacterState GetSly() const property
            {
                return GetCharacter(n"OC_STT_SLY_315");
            }
            
            AGothicCharacterState GetWhistler() const property
            {
                return GetCharacter(n"OC_STT_WHISTLER_309");
            }
            
            AGothicCharacterState GetGateGuard() const property
            {
                return GetCharacter(n"OCR_GRD_GATEGUARD04_215");
            }
            
            AGothicCharacterState GetIan() const property
            {
                return GetCharacter(n"OM_STT_Ian_301");
            }
            
            AGothicCharacterState GetLester() const property
            {
                return GetCharacter(n"SC_NOV_LESTER");
            }
            
            AGothicCharacterState GetSCAVENGERYOUNG() const property
            {
                return GetCharacter(n"SCAVENGERYOUNG");
            }
            
            AGothicCharacterState GetSH_ZOMBIE_01() const property
            {
                return GetCharacter(n"SH_ZOMBIE_01");
            }
        }
        
        
        class UTopic_OC_KDF_MILTEN__OC_STT_DIEGO : UG1RDialogTopic
        {
            default ForCharacter = n"OC_STT_DIEGO";
            default WithCharacter = n"OC_KDF_MILTEN";
            
            AGothicCharacterState GetDiego() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetGorn() const property
            {
                return GetCharacter(n"NC_SLD_GORN_699");
            }
            
            AGothicCharacterState GetMilten() const property
            {
                return GetCharacter(n"OC_KDF_MILTEN");
            }
            
            AGothicCharacterState GetRodriguez() const property
            {
                return GetCharacter(n"OC_KDF_RODRIGUEZ_400");
            }
            
            AGothicCharacterState GetDexter() const property
            {
                return GetCharacter(n"OC_STT_DEXTER_329");
            }
            
            AGothicCharacterState GetFingers() const property
            {
                return GetCharacter(n"OC_STT_FINGERS_331");
            }
            
            AGothicCharacterState GetFisk() const property
            {
                return GetCharacter(n"OC_STT_FISK_311");
            }
            
            AGothicCharacterState GetSly() const property
            {
                return GetCharacter(n"OC_STT_SLY_315");
            }
            
            AGothicCharacterState GetWhistler() const property
            {
                return GetCharacter(n"OC_STT_WHISTLER_309");
            }
            
            AGothicCharacterState GetGateGuard() const property
            {
                return GetCharacter(n"OCR_GRD_GATEGUARD04_215");
            }
            
            AGothicCharacterState GetIan() const property
            {
                return GetCharacter(n"OM_STT_Ian_301");
            }
            
            AGothicCharacterState GetLester() const property
            {
                return GetCharacter(n"SC_NOV_LESTER");
            }
            
            AGothicCharacterState GetSCAVENGERYOUNG() const property
            {
                return GetCharacter(n"SCAVENGERYOUNG");
            }
            
            AGothicCharacterState GetSH_ZOMBIE_01() const property
            {
                return GetCharacter(n"SH_ZOMBIE_01");
            }
        }
        
        
        class UChoiceDiego100828 : UTopic_Hero__OC_STT_DIEGO
        {
            default DebugId = int64(0xecfb6fe4d4cbbb7c);
            default Caption = LocText("TEXT_WIP_PKRDULC_20240503_130952");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceDiego93279);
            default Rules.HideIfKnows(UChoiceDiego100828);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xecfb6fe4d4cbbb6e), EConversationDebugInfo::Executing);
                // What do you think about what happened with the Old Mine?
                Hero.AI.Say(LocText("TEXT_WIP_PKRDULC_20240503_130952"));
                DC(int64(0xecfb6fe4d4cbbb6e), EConversationDebugInfo::Done);
                DC(int64(0xecfb6fe4d4cbbb6f), EConversationDebugInfo::Executing);
                
                // The flooding? It's a big mess. That's all there really ...
                Diego.AI.Say(LocText("TEXT_WIP_PKRDULC_20240503_130952_2386"));
                DC(int64(0xecfb6fe4d4cbbb6f), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDiego104160 : UTopic_Hero__OC_STT_DIEGO
        {
            default DebugId = int64(0xe14c05e090897a10);
            default Caption = LocText("TEXT_WIP_VACYRLF_20240725_170056");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceDiego104160);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xe14c05e090897a13), Quest::SleeperTemple_STCHAPTER5_URIZIEL != nullptr && Quest::SleeperTemple_STCHAPTER5_URIZIEL.IsRunning());
                }
                
                return Quest::SleeperTemple_STCHAPTER5_URIZIEL != nullptr && Quest::SleeperTemple_STCHAPTER5_URIZIEL.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe14c05e090897a02), EConversationDebugInfo::Executing);
                
                // Have you seen Milten? I need his help with something. 
                Hero.AI.Say(LocText("TEXT_WIP_VACYRLF_20240725_170056"));
                DC(int64(0xe14c05e090897a02), EConversationDebugInfo::Done);
                DC(int64(0xe0777e9560dc83fc), EConversationDebugInfo::Executing);
                
                // That "something" wouldn't happen to be connected to ...
                Diego.AI.Say(LocText("TEXT_WIP_XRDAKHC_20240813_182055"));
                DC(int64(0xe0777e9560dc83fc), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Diego_111283,
                    UTopic_Diego_111349,
                    UTopic_Diego_111303
                );
            }
        }
        
        
        class UTopic_Diego_111283 : UTopic_Hero__OC_STT_DIEGO
        {
            default DebugId = int64(0x8e70368ac0328c49);
            default Caption = LocText("TEXT_WIP_BGXCIAC_20240905_191615_1924");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Diego_111283);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8e70368ac0328c4a), EConversationDebugInfo::Executing);
                // You don't want to know. 
                Hero.AI.Say(LocText("TEXT_WIP_BGXCIAC_20240905_191615_1924"));
                DC(int64(0x8e70368ac0328c4a), EConversationDebugInfo::Done);
                DC(int64(0x8e70368ac0328c8b), EConversationDebugInfo::Executing);
                
                // You're right, I probably don't. It's all twists and ...
                Diego.AI.Say(LocText("TEXT_WIP_BGXCIAC_20240905_192049"));
                DC(int64(0x8e70368ac0328c8b), EConversationDebugInfo::Done);
                DC(int64(0x8e70368ac0328c8c), EConversationDebugInfo::Executing);
                // Stay alive, will you? 
                Diego.AI.Say(LocText("TEXT_WIP_BGXCIAC_20240905_192111"));
                DC(int64(0x8e70368ac0328c8c), EConversationDebugInfo::Done);
                DC(int64(0x8e70368ac0328cb2), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x8e70368ac0328cb2), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Diego_111349 : UTopic_Hero__OC_STT_DIEGO
        {
            default DebugId = int64(0x8e70368ac0328c5d);
            default Caption = LocText("TEXT_WIP_BGXCIAC_20240905_191643_3286");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Diego_111349);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8e70368ac0328c5e), EConversationDebugInfo::Executing);
                // I'll tell you some other time. 
                Hero.AI.Say(LocText("TEXT_WIP_BGXCIAC_20240905_191643_3286"));
                DC(int64(0x8e70368ac0328c5e), EConversationDebugInfo::Done);
                DC(int64(0x8e70368ac0328c8a), EConversationDebugInfo::Executing);
                
                // Probably better this way. Stay alive, will you? 
                Diego.AI.Say(LocText("TEXT_WIP_BGXCIAC_20240905_192040"));
                DC(int64(0x8e70368ac0328c8a), EConversationDebugInfo::Done);
                DC(int64(0x8e70368ac0328c99), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x8e70368ac0328c99), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Diego_111303 : UTopic_Hero__OC_STT_DIEGO
        {
            default DebugId = int64(0x8e70368ac0328c4d);
            default Caption = LocText("TEXT_WIP_BGXCIAC_20240905_191615_2785");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Diego_111303);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8e70368ac0328c4e), EConversationDebugInfo::Executing);
                // Well, sort of. I went into the temple of the Sleeper and ...
                Hero.AI.Say(LocText("TEXT_WIP_BGXCIAC_20240905_191615_3436"));
                DC(int64(0x8e70368ac0328c4e), EConversationDebugInfo::Done);
                DC(int64(0x8e70368ac0328c6d), EConversationDebugInfo::Executing);
                // Our only chance is the ore pile in the New Camp. Any ...
                Hero.AI.Say(LocText("TEXT_WIP_BGXCIAC_20240905_191733"));
                DC(int64(0x8e70368ac0328c6d), EConversationDebugInfo::Done);
                DC(int64(0x8e70368ac0328c6e), EConversationDebugInfo::Executing);
                
                // Godsdammit, kid. Is there such a thing as a normal day ...
                Diego.AI.Say(LocText("TEXT_WIP_BGXCIAC_20240905_191753"));
                DC(int64(0x8e70368ac0328c6e), EConversationDebugInfo::Done);
                DC(int64(0x8e70368ac0328c6f), EConversationDebugInfo::Executing);
                // But no, I don't think I can help with that. Milten is ...
                Diego.AI.Say(LocText("TEXT_WIP_BGXCIAC_20240905_191815"));
                DC(int64(0x8e70368ac0328c6f), EConversationDebugInfo::Done);
                DC(int64(0x8e70368ac0328c70), EConversationDebugInfo::Executing);
                // Whatever you do though, don't die, alright? 
                Diego.AI.Say(LocText("TEXT_WIP_BGXCIAC_20240905_192024"));
                DC(int64(0x8e70368ac0328c70), EConversationDebugInfo::Done);
                DC(int64(0x8e70368ac0328c71), EConversationDebugInfo::Executing);
                
                // Don't worry. 
                Hero.AI.Say(LocText("TEXT_WIP_BGXCIAC_20240905_192028"));
                DC(int64(0x8e70368ac0328c71), EConversationDebugInfo::Done);
                DC(int64(0xe14c05e090897a20), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xe14c05e090897a20), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceDiego105716 : UTopic_Hero__OC_STT_DIEGO
        {
            default DebugId = int64(0xfac94e848b31dd67);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceDiego105716);
            
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"WP_EZ_STORY_DIEGO_ABANDONEDMINE", 1500.0f, int64(0xfac94e848b31dd67));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa6782d202c632658), G1R != nullptr && !G1R.HasReachedChapter(2));
                }
                
                return G1R != nullptr && !G1R.HasReachedChapter(2);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xfac94e848b31dd5c), EConversationDebugInfo::Executing);
                // Might wanna check that mine up there for gears. Mind the ...
                Diego.AI.Say(LocText("TEXT_WIP_OACNPYL_20241021_113352_41"));
                DC(int64(0xfac94e848b31dd5c), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDiego105732 : UTopic_Hero__OC_STT_DIEGO
        {
            default DebugId = int64(0xa6782d202c6325af);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            default ForceSettings.bDoAmbientDuringCombat = true;
            
            default Rules.HideIfKnows(UChoiceDiego105732);
            
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"WP_EZ_STORY_DIEGO_HANGMAN", 1000.0f, int64(0xa6782d202c6325af));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa6782d202c632601), G1R != nullptr && !G1R.HasReachedChapter(2));
                }
                
                return G1R != nullptr && !G1R.HasReachedChapter(2);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa6782d202c6325a3), EConversationDebugInfo::Executing);
                
                // What did he do?
                Hero.AI.Say(LocText("TEXT_WIP_YNIYVHG_20241018_134354"));
                DC(int64(0xa6782d202c6325a3), EConversationDebugInfo::Done);
                DC(int64(0xa6782d202c6325a4), EConversationDebugInfo::Executing);
                
                // Who? Oh, right. Made the wrong enemies.
                Diego.AI.Say(LocText("TEXT_WIP_YNIYVHG_20241018_134354_2785"));
                DC(int64(0xa6782d202c6325a4), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDiego105737 : UTopic_Hero__OC_STT_DIEGO
        {
            default DebugId = int64(0xfac94e848b31dd8a);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            default ForceSettings.bDoAmbientDuringCombat = true;
            
            default Rules.HideIfKnows(UChoiceDiego105737);
            
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"WP_EZ_STORY_DIEGO_SCAVENGERS", 1000.0f, int64(0xfac94e848b31dd8a));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa6782d202c632658), G1R != nullptr && !G1R.HasReachedChapter(2));
                    DB(int64(0xfac94e848b31dda1), Diego != nullptr && Diego.CanSenseAnyAliveCharacterOfKind(SCAVENGERYOUNG, 3000.0f));
                }
                
                if (G1R != nullptr && G1R.HasReachedChapter(2))
                    return false;
                
                if (Diego != nullptr && !Diego.CanSenseAnyAliveCharacterOfKind(SCAVENGERYOUNG, 3000.0f))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xfac94e848b31dd7f), EConversationDebugInfo::Executing);
                // Damned birds. Breed like rabbits.
                Diego.AI.Say(LocText("TEXT_WIP_OACNPYL_20241021_114812_2238"));
                DC(int64(0xfac94e848b31dd7f), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDiego105780 : UTopic_Hero__OC_STT_DIEGO
        {
            default DebugId = int64(0xa6782d202c6326e4);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceDiego105780);
            
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"WP_EZ_STORY_DIEGO_OCSEE", 1000.0f, int64(0xa6782d202c6326e4));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa6782d202c632658), G1R != nullptr && !G1R.HasReachedChapter(2));
                }
                
                return G1R != nullptr && !G1R.HasReachedChapter(2);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa6782d202c63263f), EConversationDebugInfo::Executing);
                // There it is. The Old Camp.
                Diego.AI.Say(LocText("TEXT_WIP_YNIYVHG_20241018_154908_2386"));
                DC(int64(0xa6782d202c63263f), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDiego105788 : UTopic_Hero__OC_STT_DIEGO
        {
            default DebugId = int64(0xfac94e848b31ddd6);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceDiego105788);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa6782d202c63264d), Diego != nullptr && Diego.IsCloseToCharacter(GateGuard, 2500.0f));
                    DB(int64(0xa6782d202c632658), G1R != nullptr && !G1R.HasReachedChapter(2));
                }
                
                if (Diego != nullptr && !Diego.IsCloseToCharacter(GateGuard, 2500.0f))
                    return false;
                
                if (G1R != nullptr && G1R.HasReachedChapter(2))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xfac94e848b31ddcb), EConversationDebugInfo::Executing);
                // Here we are. You'll have to handle the guard yourself - ...
                Diego.AI.Say(LocText("TEXT_WIP_OACNPYL_20241021_124146_3286"));
                DC(int64(0xfac94e848b31ddcb), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDiego105817 : UTopic_Hero__OC_STT_DIEGO
        {
            default DebugId = int64(0xfac94e848b31de10);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceDiego105817);
            
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"WP_EZ_STORY_GENERIC_DIEGO", 1500.0f, int64(0xfac94e848b31de10));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa6782d202c632658), G1R != nullptr && !G1R.HasReachedChapter(2));
                }
                
                return G1R != nullptr && !G1R.HasReachedChapter(2);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xfac94e848b31de05), EConversationDebugInfo::Executing);
                // So, kid - what did they do you in for? Didn't want to ...
                Diego.AI.Say(LocText("TEXT_WIP_OACNPYL_20241021_133857_686"));
                DC(int64(0xfac94e848b31de05), EConversationDebugInfo::Done);
                DC(int64(0xfac94e848b31de3f), EConversationDebugInfo::Executing);
                
                // You don't wanna know.
                Hero.AI.Say(LocText("TEXT_WIP_OACNPYL_20241021_134927"));
                DC(int64(0xfac94e848b31de3f), EConversationDebugInfo::Done);
                DC(int64(0xfac94e848b31de40), EConversationDebugInfo::Executing);
                
                // You're right, probably not. Not like it matters anyway ...
                Diego.AI.Say(LocText("TEXT_WIP_OACNPYL_20241021_134938"));
                DC(int64(0xfac94e848b31de40), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDiego106066_0 : UTopic_Hero__OC_STT_DIEGO
        {
            default DebugId = int64(0x49ea5111455ba682);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceDiego106066);
            
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"WP_SH_STORY_DIEGO_NAMELESS", 1000.0f, int64(0x49ea5111455ba682));
            default Rules.HideIfKnows(UChoiceDiego106066_0);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x49ea5111455ba694), Quest::NewCamp_NCCHAPTER3_BRINGFOCI != nullptr && Quest::NewCamp_NCCHAPTER3_BRINGFOCI.IsRunning());
                }
                
                return Quest::NewCamp_NCCHAPTER3_BRINGFOCI != nullptr && Quest::NewCamp_NCCHAPTER3_BRINGFOCI.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x49ea5111455ba677), EConversationDebugInfo::Executing);
                // I've been wondering. If this plan of the mages works and ...
                Diego.AI.Say(LocText("TEXT_WIP_HJMJRKG_20241031_123917_41"));
                DC(int64(0x49ea5111455ba677), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDiego106066_1 : UTopic_Hero__OC_STT_DIEGO
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceDiego106066_0);
            default Rules.HideIfKnows(UChoiceDiego106066_1);
            default DebugId = int64(0x49ea5111455ba682);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x49ea5111455ba690), EConversationDebugInfo::Executing);
                
                // I guess I'll play it by ear.
                Hero.AI.Say(LocText("TEXT_WIP_HJMJRKG_20241031_131757"));
                DC(int64(0x49ea5111455ba690), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDiego106066_2 : UTopic_Hero__OC_STT_DIEGO
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceDiego106066_1);
            default Rules.HideIfKnows(UChoiceDiego106066_2);
            default DebugId = int64(0x49ea5111455ba682);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x49ea5111455ba691), EConversationDebugInfo::Executing);
                
                // What, no - no family to go back to, no revenge to take?
                Diego.AI.Say(LocText("TEXT_WIP_HJMJRKG_20241031_131758"));
                DC(int64(0x49ea5111455ba691), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDiego106066_3 : UTopic_Hero__OC_STT_DIEGO
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceDiego106066_2);
            default Rules.HideIfKnows(UChoiceDiego106066_3);
            default DebugId = int64(0x49ea5111455ba682);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x49ea5111455ba692), EConversationDebugInfo::Executing);
                
                // None I can think of. 
                Hero.AI.Say(LocText("TEXT_WIP_HJMJRKG_20241031_131808"));
                DC(int64(0x49ea5111455ba692), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDiego106066 : UTopic_Hero__OC_STT_DIEGO
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceDiego106066_3);
            default Rules.HideIfKnows(UChoiceDiego106066);
            default DebugId = int64(0x49ea5111455ba682);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x49ea5111455ba693), EConversationDebugInfo::Executing);
                
                //  You're a living mystery, my friend. 
                Diego.AI.Say(LocText("TEXT_WIP_HJMJRKG_20241031_131809"));
                DC(int64(0x49ea5111455ba693), EConversationDebugInfo::Done);
                DC(int64(0xb4d34737b412a05a), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xb4d34737b412a05a), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceDiego106113_0 : UTopic_OC_KDF_MILTEN__OC_STT_DIEGO
        {
            default DebugId = int64(0x369e3e569d23af54);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceDiego106113);
            
            default RequiredNearbyCharacters.Add(n"Hero");
            default ExtraCharactersToInvite.Add(n"NC_SLD_GORN_699");
            default Rules.RequireCharacterCloseToWaypoint(n"HERO", n"WP_LH_STORY_DISCUSSION4FRIENDS", 1000.0f, int64(0x369e3e569d23af54));
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"FP_OM_DIEGO_CAMP2", 500.0f, int64(0x369e3e569d23af54));
            default Rules.HideIfKnows(UChoiceDiego106113_0);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x369e3e569d23afe2), Quest::NewCamp_NCCHAPTER3_BRINGFOCI != nullptr && Quest::NewCamp_NCCHAPTER3_BRINGFOCI.IsRunning());
                }
                
                return Quest::NewCamp_NCCHAPTER3_BRINGFOCI != nullptr && Quest::NewCamp_NCCHAPTER3_BRINGFOCI.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x369e3e569d23af49), EConversationDebugInfo::Executing);
                // Just a hunch. I'd be careful.
                Diego.AI.Say(LocText("TEXT_WIP_HJMJRKG_20241031_120703_3436"));
                DC(int64(0x369e3e569d23af49), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDiego106113_1 : UTopic_OC_KDF_MILTEN__OC_STT_DIEGO
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceDiego106113_0);
            default Rules.HideIfKnows(UChoiceDiego106113_1);
            default DebugId = int64(0x369e3e569d23af54);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x369e3e569d23afe5), EConversationDebugInfo::Executing);
                
                // You think he'd go against the mages? 
                Milten.AI.Say(LocText("TEXT_WIP_HJMJRKG_20241031_121232"));
                DC(int64(0x369e3e569d23afe5), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDiego106113_2 : UTopic_OC_KDF_MILTEN__OC_STT_DIEGO
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceDiego106113_1);
            default Rules.HideIfKnows(UChoiceDiego106113_2);
            default DebugId = int64(0x369e3e569d23af54);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x369e3e569d23afe6), EConversationDebugInfo::Executing);
                
                // He ain't that stupid.
                Gorn.AI.Say(LocText("TEXT_WIP_HJMJRKG_20241031_121546"));
                DC(int64(0x369e3e569d23afe6), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDiego106113 : UTopic_OC_KDF_MILTEN__OC_STT_DIEGO
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceDiego106113_2);
            default Rules.HideIfKnows(UChoiceDiego106113);
            default DebugId = int64(0x369e3e569d23af54);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x369e3e569d23afe7), EConversationDebugInfo::Executing);
                
                // I agree. Still, we should lay low for a time. I don't ...
                Diego.AI.Say(LocText("TEXT_WIP_HJMJRKG_20241031_121555"));
                DC(int64(0x369e3e569d23afe7), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDiego106353_0 : UTopic_Hero__OC_STT_DIEGO
        {
            default DebugId = int64(0x99819550a64c0d7d);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceDiego106353);
            
            default Rules.RequireCharacterCloseToWaypoint(n"HERO", n"WP_ST_DIEGO_CHAMBER", 800.0f, int64(0x99819550a64c0d7d));
            default Rules.HideIfKnows(UChoiceDiego106353_0);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xd1de52aad05587d), SH_ZOMBIE_01 != nullptr && SH_ZOMBIE_01.IsEveryoneOfThisKindDead());
                }
                
                return SH_ZOMBIE_01 != nullptr && SH_ZOMBIE_01.IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x99819550a64c0d72), EConversationDebugInfo::Executing);
                // That was a tough bastard. All right, time to take that ...
                Diego.AI.Say(LocText("TEXT_WIP_QACNPYL_20241023_104351_2083"));
                DC(int64(0x99819550a64c0d72), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDiego106353 : UTopic_Hero__OC_STT_DIEGO
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceDiego106353_0);
            default Rules.HideIfKnows(UChoiceDiego106353);
            default DebugId = int64(0x99819550a64c0d7d);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x821de80fbbd7f0b8), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x821de80fbbd7f0b8), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceDiego107920 : UTopic_Hero__OC_STT_DIEGO
        {
            default DebugId = int64(0x353245ff5bf3e646);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceDiego107920);
            
            default ExtraCharactersToInvite.Add(n"OM_STT_IAN_301");
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x65f4f79c338d28fd), Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS != nullptr && Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS.IsRunning());
                    DB(int64(0x65f4f79c338d2912), Hero != nullptr && Hero.IsCloseToCharacter(Ian, 500.0f));
                    DB(int64(0x65f4f79c338d2913), Diego != nullptr && Diego.IsCloseToCharacter(Ian, 500.0f));
                }
                
                if (Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS != nullptr && !Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS.IsRunning())
                    return false;
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Ian, 500.0f))
                    return false;
                
                if (Diego != nullptr && !Diego.IsCloseToCharacter(Ian, 500.0f))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x353245ff5bf3e63f), EConversationDebugInfo::Executing);
                // Ian.
                Diego.AI.Say(LocText("TEXT_WIP_EETMBHG_20241011_133646_3286"), TargetCharacter = Ian.Character);
                DC(int64(0x353245ff5bf3e63f), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_MCEGGS, Document::UDocumentSegment_CH2_MCEGGS_IanPermission);
                DC(int64(0x65f4f79c338d289a), EConversationDebugInfo::Executing);
                Diego.AI.TurnToCharacter(Ian);
                DC(int64(0x65f4f79c338d289a), EConversationDebugInfo::Done);
                DC(int64(0x65f4f79c338d2892), EConversationDebugInfo::Executing);
                // Diego? What are you doing here?
                Ian.AI.Say(LocText("TEXT_WIP_EETMBHG_20241011_133719"), TargetCharacter = Diego.Character);
                DC(int64(0x65f4f79c338d2892), EConversationDebugInfo::Done);
                DC(int64(0x65f4f79c338d2893), EConversationDebugInfo::Executing);
                
                // Just passing by. You've met my friend?
                Diego.AI.Say(LocText("TEXT_WIP_EETMBHG_20241011_133808"), TargetCharacter = Ian.Character);
                DC(int64(0x65f4f79c338d2893), EConversationDebugInfo::Done);
                DC(int64(0x65f4f79c338d2894), EConversationDebugInfo::Executing);
                
                // Don't tell me it's about that tunnel.
                Ian.AI.Say(LocText("TEXT_WIP_EETMBHG_20241011_133818"), TargetCharacter = Diego.Character);
                DC(int64(0x65f4f79c338d2894), EConversationDebugInfo::Done);
                DC(int64(0x65f4f79c338d2895), EConversationDebugInfo::Executing);
                
                // Afraid so. It's time to return that favor.
                Diego.AI.Say(LocText("TEXT_WIP_EETMBHG_20241011_133841"), TargetCharacter = Ian.Character);
                DC(int64(0x65f4f79c338d2895), EConversationDebugInfo::Done);
                DC(int64(0x65f4f79c338d2896), EConversationDebugInfo::Executing);
                
                // That shaft's like a bloody minecrawler colony! 
                Ian.AI.Say(LocText("TEXT_WIP_EETMBHG_20241011_133850"), TargetCharacter = Diego.Character);
                DC(int64(0x65f4f79c338d2896), EConversationDebugInfo::Done);
                DC(int64(0x65f4f79c338d2897), EConversationDebugInfo::Executing);
                
                // He's got the templars to defend the entrance. It'll be ...
                Diego.AI.Say(LocText("TEXT_WIP_EETMBHG_20241011_133855"), TargetCharacter = Ian.Character);
                DC(int64(0x65f4f79c338d2897), EConversationDebugInfo::Done);
                DC(int64(0x65f4f79c338d2898), EConversationDebugInfo::Executing);
                
                // Oh, for fuck's sake! Fine. 
                Ian.AI.Say(LocText("TEXT_WIP_EETMBHG_20241011_133901"), TargetCharacter = Diego.Character);
                DC(int64(0x65f4f79c338d2898), EConversationDebugInfo::Done);
                DC(int64(0x65f4f79c338d289a), EConversationDebugInfo::Executing);
                Ian.AI.TurnToCharacter(Hero);
                DC(int64(0x65f4f79c338d289a), EConversationDebugInfo::Done);
                DC(int64(0x1dce4f30748f6647), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_IAN.SucceedQuest();
                DC(int64(0x1dce4f30748f6647), EConversationDebugInfo::Done);
                DC(int64(0x65f4f79c338d28c4), EConversationDebugInfo::Executing);
                // Bloody hell. You just had to have it your way, didn't ...
                Ian.AI.Say(LocText("TEXT_WIP_EETMBHG_20241011_134730"), TargetCharacter = Hero.Character);
                DC(int64(0x65f4f79c338d28c4), EConversationDebugInfo::Done);
                DC(int64(0x65f4f79c338d28c5), EConversationDebugInfo::Executing);
                // But mark me words, if any of these crawlers make it out, ...
                Ian.AI.Say(LocText("TEXT_WIP_EETMBHG_20241011_134733"), TargetCharacter = Hero.Character);
                DC(int64(0x65f4f79c338d28c5), EConversationDebugInfo::Done);
                DC(int64(0x65f4f79c338d28c6), EConversationDebugInfo::Executing);
                // Bloody lunatics, all of you ... 
                Ian.AI.Say(LocText("TEXT_WIP_EETMBHG_20241011_134734"), TargetCharacter = Hero.Character);
                DC(int64(0x65f4f79c338d28c6), EConversationDebugInfo::Done);
                DC(int64(0x65f4f79c338d28e5), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x65f4f79c338d28e5), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceDiego108947 : UTopic_Hero__OC_STT_DIEGO
        {
            default DebugId = int64(0x3232d7843c92b63f);
            default Caption = LocText("TEXT_WIP_UFXCIAC_20240902_204754");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceDiegoBullit);
            default Rules.HideIfKnows(UChoiceDiego108947);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x96db9efef60d8b6d), G1R.Diego_After_Gamestart == 0);
                }
                
                return G1R.Diego_After_Gamestart == 0;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3232d7843c92b631), EConversationDebugInfo::Executing);
                // Your guys just nearly beat me to death. Why would I join ...
                Hero.AI.Say(LocText("TEXT_WIP_UFXCIAC_20240902_204754"));
                DC(int64(0x3232d7843c92b631), EConversationDebugInfo::Done);
                DC(int64(0x3232d7843c92b632), EConversationDebugInfo::Executing);
                
                // Look, kid, I'm not gonna stand here and try to win you ...
                Diego.AI.Say(LocText("TEXT_WIP_UFXCIAC_20240902_204754_41"));
                DC(int64(0x3232d7843c92b632), EConversationDebugInfo::Done);
                DC(int64(0xc47cffa5a31f25b1), EConversationDebugInfo::Executing);
                // Yes, Bullit is a bastard, but in a way, what he and his ...
                Diego.AI.Say(LocText("TEXT_WIP_OGTRMXB_20240920_123012"));
                DC(int64(0xc47cffa5a31f25b1), EConversationDebugInfo::Done);
                DC(int64(0xc47cffa5a31f25b2), EConversationDebugInfo::Executing);
                // Strength and reputation - those will be your biggest ...
                Diego.AI.Say(LocText("TEXT_WIP_OGTRMXB_20240920_123047"));
                DC(int64(0xc47cffa5a31f25b2), EConversationDebugInfo::Done);
                DC(int64(0x3232d7843c92b64d), EConversationDebugInfo::Executing);
                // So, yeah, that's how it is. Just know I've been here a ...
                Diego.AI.Say(LocText("TEXT_WIP_UFXCIAC_20240902_204954"));
                DC(int64(0x3232d7843c92b64d), EConversationDebugInfo::Done);
                DC(int64(0x3232d7843c92b64e), EConversationDebugInfo::Executing);
                // Take it or leave it - it's all the same to me. 
                Diego.AI.Say(LocText("TEXT_WIP_UFXCIAC_20240902_205124"));
                DC(int64(0x3232d7843c92b64e), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDiego144472_0 : UTopic_Hero__OC_STT_DIEGO
        {
            default DebugId = int64(0x4b8d53517860c43a);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceDiego144472);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_KVDLGBG_20240513_153237_2083"), int64(0x4b8d53517860c43a));
            default Rules.HideIfKnows(UChoiceDiego144472_0);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4b8d53517860c43d), Diego != nullptr && Diego.HasAssignedDailyRoutine(UDailyRoutine_OC_STT_Diego_LightHouse));
                    DB(int64(0xc7a8be143f043fe0), Hero != nullptr && Hero.IsCloseToCharacter(Diego, 700.0f));
                    DB(int64(0xb4d34737b4129f30), G1R.FourFriendsFocus.IsValid() && G1R.FourFriendsFocus.IsAtLeastXMinutesAgo(20));
                }
                
                if (Diego != nullptr && !Diego.HasAssignedDailyRoutine(UDailyRoutine_OC_STT_Diego_LightHouse))
                    return false;
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Diego, 700.0f))
                    return false;
                
                if (G1R.FourFriendsFocus.IsValid() && !G1R.FourFriendsFocus.IsAtLeastXMinutesAgo(20))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4b8d53517860c42f), EConversationDebugInfo::Executing);
                // Good job in that crypt. 
                Diego.AI.Say(LocText("TEXT_WIP_PVXGRO_20250121_144610_41"));
                DC(int64(0x4b8d53517860c42f), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDiego144472 : UTopic_Hero__OC_STT_DIEGO
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceDiego144472_0);
            default Rules.HideIfKnows(UChoiceDiego144472);
            default DebugId = int64(0x4b8d53517860c43a);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb4d34737b4129f32), EConversationDebugInfo::Executing);
                G1R.FourFriendsFocus = FInGameTime::Now();
                DC(int64(0xb4d34737b4129f32), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDiego214558 : UTopic_Hero__OC_STT_DIEGO
        {
            default DebugId = int64(0xf72cbcc224ea0253);
            default Caption = LocText("INFO_DIEGO_WARUMGEHOLFEN_15_00");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceDiego214558);
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("INFO_DIEGO_WARUMGEHOLFEN_11_01"), int64(0xf72cbcc224ea0253));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x7fbf89a231441929), G1R.Diego_After_Gamestart != 0);
                    DB(int64(0x7fbf89a23144192a), G1R != nullptr && !G1R.HasReachedChapter(2));
                }
                
                if (G1R.Diego_After_Gamestart == 0)
                    return false;
                
                if (G1R != nullptr && G1R.HasReachedChapter(2))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf72cbcc224ea024b), EConversationDebugInfo::Executing);
                // Why did you help me? 
                Hero.AI.Say(LocText("INFO_DIEGO_WARUMGEHOLFEN_15_00"));
                DC(int64(0xf72cbcc224ea024b), EConversationDebugInfo::Done);
                DC(int64(0xf72cbcc224ea024c), EConversationDebugInfo::Executing);
                
                // Because you needed help. If I hadn't stepped in, there's ...
                Diego.AI.Say(LocText("INFO_DIEGO_WARUMGEHOLFEN_11_01"));
                DC(int64(0xf72cbcc224ea024c), EConversationDebugInfo::Done);
                DC(int64(0xf72cbcc224ea0255), EConversationDebugInfo::Executing);
                // If you wanna survive, you got to join one of the three ...
                Diego.AI.Say(LocText("INFO_DIEGO_WARUMGEHOLFEN_11_05"));
                DC(int64(0xf72cbcc224ea0255), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDiego93279 : UTopic_Hero__OC_STT_DIEGO
        {
            default DebugId = int64(0xa18ab10939953213);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceDiego93279);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa18ab10939953216), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp));
                    DB(int64(0xa18ab10939953231), Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD != nullptr && Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD.HasSucceeded());
                    DB(int64(0x50028f2ea692be19), Hero != nullptr && Hero.IsInConversation());
                    DB(int64(0xe5f0d12b37cd60a6), Quest::NewCamp_NCCHAPTER3_BRINGFOCI != nullptr && !Quest::NewCamp_NCCHAPTER3_BRINGFOCI.HasBeenStarted());
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp))
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD != nullptr && !Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD.HasSucceeded())
                    return false;
                
                if (Hero != nullptr && !Hero.IsInConversation())
                    return false;
                
                if (Quest::NewCamp_NCCHAPTER3_BRINGFOCI != nullptr && Quest::NewCamp_NCCHAPTER3_BRINGFOCI.HasBeenStarted())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xecfb6fe4d4cbb9c9), EConversationDebugInfo::Executing);
                // Ah, you. What came of that ritual? Heard it didn't go as ...
                Diego.AI.Say(LocText("TEXT_WIP_PKRDULC_20240503_123832"));
                DC(int64(0xecfb6fe4d4cbb9c9), EConversationDebugInfo::Done);
                DC(int64(0xecfb6fe4d4cbbae2), EConversationDebugInfo::Executing);
                // I'm guessing that "Sleeper" won't spring us out anytime ...
                Diego.AI.Say(LocText("TEXT_WIP_PKRDULC_20240503_130117"));
                DC(int64(0xecfb6fe4d4cbbae2), EConversationDebugInfo::Done);
                DC(int64(0xecfb6fe4d4cbbae0), EConversationDebugInfo::Executing);
                
                // Unlikely. 
                Hero.AI.Say(LocText("TEXT_WIP_PKRDULC_20240503_125955"));
                DC(int64(0xecfb6fe4d4cbbae0), EConversationDebugInfo::Done);
                DC(int64(0xecfb6fe4d4cbbae3), EConversationDebugInfo::Executing);
                
                // (sigh) For just a second, Lester had me hoping. 
                Diego.AI.Say(LocText("TEXT_WIP_PKRDULC_20240503_130142"));
                DC(int64(0xecfb6fe4d4cbbae3), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_STT_DIEGO, Document::UDocumentSegment_Glossary_OC_STT_DIEGO_FogTower);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_ESCAPEPLANNC, Document::UDocumentSegment_CH3_ESCAPEPLANNC_Diego);
                DB(int64(0xa18ab10939953273), Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_YPUISQL_20240425_110156_41")));
                
                if (Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_YPUISQL_20240425_110156_41")))
                {
                    DC(int64(0xa18ab10939953290), EConversationDebugInfo::Executing);
                    // Raven said you wanted to see me. 
                    Hero.AI.Say(LocText("TEXT_WIP_MPUISQL_20240429_130130"));
                    DC(int64(0xa18ab10939953290), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0xecfb6fe4d4cbbb0c), EConversationDebugInfo::Executing);
                    
                    // Anyway, I've been looking for you. 
                    Diego.AI.Say(LocText("TEXT_WIP_PKRDULC_20240503_130246"));
                    DC(int64(0xecfb6fe4d4cbbb0c), EConversationDebugInfo::Done);
                }
                DC(int64(0xa18ab10939953291), EConversationDebugInfo::Executing);
                // Saturas, the highest Water Mage, wants to see you. That ...
                Diego.AI.Say(LocText("TEXT_WIP_MPUISQL_20240429_130130_2801"));
                DC(int64(0xa18ab10939953291), EConversationDebugInfo::Done);
                DC(int64(0xecfb6fe4d4cbbb6b), EConversationDebugInfo::Executing);
                
                // What's this about? 
                Hero.AI.Say(LocText("TEXT_WIP_PKRDULC_20240503_130453"));
                DC(int64(0xecfb6fe4d4cbbb6b), EConversationDebugInfo::Done);
                DC(int64(0xa18ab109399532f6), EConversationDebugInfo::Executing);
                
                // He'll tell you that himself.
                Diego.AI.Say(LocText("TEXT_WIP_MPUISQL_20240429_130315"));
                DC(int64(0xa18ab109399532f6), EConversationDebugInfo::Done);
                DC(int64(0xa18ab109399532f7), EConversationDebugInfo::Executing);
                // And here, take this map and come meet us at the marked ...
                Diego.AI.Say(LocText("TEXT_WIP_MPUISQL_20240429_130321"));
                DC(int64(0xa18ab109399532f7), EConversationDebugInfo::Done);
                DC(int64(0xe87722ef5b6a460d), EConversationDebugInfo::Executing);
                Diego.AddItemToInventory(UItWr_Map_Lighthouse, 1);
                DC(int64(0xe87722ef5b6a460d), EConversationDebugInfo::Done);
                DC(int64(0xa9075e981a82a030), EConversationDebugInfo::Executing);
                Diego.AI.GiveItemTo(Hero, UItWr_Map_Lighthouse, 1);
                DC(int64(0xa9075e981a82a030), EConversationDebugInfo::Done);
                DC(int64(0xa326d2a684224b9f), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER3_BRINGFOCI_BRINGFOCI_MAP_LIGHTHOUSE.StartQuest();
                DC(int64(0xa326d2a684224b9f), EConversationDebugInfo::Done);
                DC(int64(0xbac18becb49fd62a), EConversationDebugInfo::Executing);
                G1R.LighthouseMeeting();
                DC(int64(0xbac18becb49fd62a), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Diego_99992,
                    UTopic_Diego_100012
                );
            }
        }
        
        
        class UTopic_Diego_99992 : UTopic_Hero__OC_STT_DIEGO
        {
            default DebugId = int64(0xecfb6fe4d4cbbb1b);
            default Caption = LocText("TEXT_WIP_PKRDULC_20240503_130432_3436");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Diego_99992);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xecfb6fe4d4cbbb1c), EConversationDebugInfo::Executing);
                // Will Gomez have a problem with that? 
                Hero.AI.Say(LocText("TEXT_WIP_PKRDULC_20240503_130432_3436"));
                DC(int64(0xecfb6fe4d4cbbb1c), EConversationDebugInfo::Done);
                DC(int64(0xecfb6fe4d4cbbb6c), EConversationDebugInfo::Executing);
                
                // No - the Water and the Fire Mages have always been ...
                Diego.AI.Say(LocText("TEXT_WIP_PKRDULC_20240503_130555"));
                DC(int64(0xecfb6fe4d4cbbb6c), EConversationDebugInfo::Done);
                DC(int64(0xecfb6fe4d4cbbb6d), EConversationDebugInfo::Executing);
                // Though he's been a bit on edge lately ... especially ...
                Diego.AI.Say(LocText("TEXT_WIP_PKRDULC_20240503_130933"));
                DC(int64(0xecfb6fe4d4cbbb6d), EConversationDebugInfo::Done);
                DC(int64(0xecfb6fe4d4cbbb1e), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xecfb6fe4d4cbbb1e), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Diego_100012 : UTopic_Hero__OC_STT_DIEGO
        {
            default DebugId = int64(0xecfb6fe4d4cbbb1f);
            default Caption = LocText("TEXT_WIP_PKRDULC_20240503_130432_686");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Diego_100012);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xecfb6fe4d4cbbb20), EConversationDebugInfo::Executing);
                // I'll take care of it.
                Hero.AI.Say(LocText("TEXT_WIP_PKRDULC_20240503_130432_686"));
                DC(int64(0xecfb6fe4d4cbbb20), EConversationDebugInfo::Done);
                DC(int64(0xa18ab109399532e7), EConversationDebugInfo::Executing);
                G1R.Friends_SendToNC = 1;
                DC(int64(0xa18ab109399532e7), EConversationDebugInfo::Done);
                DC(int64(0xa18ab10939953313), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER3_ESCAPEPLANNC.StartQuest();
                DC(int64(0xa18ab10939953313), EConversationDebugInfo::Done);
                DC(int64(0x50028f2ea692c105), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Milten))) { Milten.ExchangeDailyRoutineToClass(UDailyRoutine_OC_KDF_Milten_LightHouse); }
                DC(int64(0x50028f2ea692c105), EConversationDebugInfo::Done);
                DC(int64(0x50028f2ea692c107), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Gorn))) { Gorn.ExchangeDailyRoutineToClass(UDailyRoutine_NC_SLD_Gorn_699_LightHouse); }
                DC(int64(0x50028f2ea692c107), EConversationDebugInfo::Done);
                DC(int64(0x50028f2ea692c109), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Lester))) { Lester.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Lester_LightHouse); }
                DC(int64(0x50028f2ea692c109), EConversationDebugInfo::Done);
                DC(int64(0xb19fe5feff638e9), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Rodriguez))) { Rodriguez.ExchangeDailyRoutineToClass(UDailyRoutine_OC_KDF_Rodriguez_400_Door); }
                DC(int64(0xb19fe5feff638e9), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDiego93382 : UTopic_Hero__OC_STT_DIEGO
        {
            default DebugId = int64(0x50028f2ea692bfd4);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            default ForceSettings.RangeType = EConversationForceRangeType::DefaultRange;
            
            default Rules.HideIfKnows(UChoiceDiego93382);
            
            default ExtraCharactersToInvite.Add(n"NC_SLD_GORN_699");
            default ExtraCharactersToInvite.Add(n"OC_KDF_MILTEN");
            default ExtraCharactersToInvite.Add(n"SC_NOV_LESTER");
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x50028f2ea692bfd7), Quest::NewCamp_NCCHAPTER3_BRINGFOCI != nullptr && Quest::NewCamp_NCCHAPTER3_BRINGFOCI.IsRunning());
                }
                
                return Quest::NewCamp_NCCHAPTER3_BRINGFOCI != nullptr && Quest::NewCamp_NCCHAPTER3_BRINGFOCI.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xee33316245f78b5c), EConversationDebugInfo::Executing);
                // Ah, there you are. Welcome to our meeting place. 
                Diego.AI.Say(LocText("TEXT_WIP_PKRDULC_20240503_144344"), ForceCameraPreset = n"INDIVIDUAL MEDIUM", TargetCharacter = Hero.Character);
                DC(int64(0xee33316245f78b5c), EConversationDebugInfo::Done);
                DC(int64(0x2ba35c94202fe8fd), EConversationDebugInfo::Executing);
                Hero.AI.GotoWaypoint(n"FP_OG_LIGHTHOUSE_MEETING");
                DC(int64(0x2ba35c94202fe8fd), EConversationDebugInfo::Done);
                DC(int64(0x59a20ff4e618f766), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER3_BRINGFOCI_BRINGFOCI_OBJ_HELP.SucceedQuest();
                DC(int64(0x59a20ff4e618f766), EConversationDebugInfo::Done);
                DC(int64(0xa326d2a684224b52), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER3_BRINGFOCI_BRINGFOCI_MAP_LIGHTHOUSE.SucceedQuest();
                DC(int64(0xa326d2a684224b52), EConversationDebugInfo::Done);
                DC(int64(0x2ba35c94202fe8e2), EConversationDebugInfo::Executing);
                // The Water Mages want you to the find the focus stones. ...
                Diego.AI.Say(LocText("TEXT_WIP_ENNNSJG_20250416_123926"), ForceCameraPreset = n"PACK SHOT 1 4FRIENDS 2C", TargetCharacter = Hero.Character);
                DC(int64(0x2ba35c94202fe8e2), EConversationDebugInfo::Done);
                DC(int64(0x2ba35c94202fe8ee), EConversationDebugInfo::Executing);
                
                // Yes. 
                Hero.AI.Say(LocText("TEXT_WIP_PKRDULC_20240503_143728"), ForceCameraPreset = n"INDIVIDUAL MEDIUM", TargetCharacter = Diego.Character);
                DC(int64(0x2ba35c94202fe8ee), EConversationDebugInfo::Done);
                DC(int64(0x2ba35c94202fe8ef), EConversationDebugInfo::Executing);
                
                // Good. Unlike that Sleeper business, this might actually ...
                Diego.AI.Say(LocText("TEXT_WIP_PKRDULC_20240503_143746"), ForceCameraPreset = n"INDIVIDUAL MEDIUM DIEGO 4FRIENDS 2C", TargetCharacter = Hero.Character);
                DC(int64(0x2ba35c94202fe8ef), EConversationDebugInfo::Done);
                DC(int64(0x2ba35c94202fe8f0), EConversationDebugInfo::Executing);
                
                // I'll make it quick: amulet or not, it'll be a tough job ...
                Gorn.AI.Say(LocText("TEXT_WIP_EETMBHG_20241011_154332"), ForceCameraPreset = n"INDIVIDUAL MEDIUM GORN 4FRIENDS 2C", TargetCharacter = Hero.Character);
                DC(int64(0x2ba35c94202fe8f0), EConversationDebugInfo::Done);
                DC(int64(0x2ba35c94202fe8f1), EConversationDebugInfo::Executing);
                // We're gonna help you. 
                Gorn.AI.Say(LocText("TEXT_WIP_EETMBHG_20241011_154421"), ForceCameraPreset = n"INDIVIDUAL CLOSEUP GORN 4FRIENDS 2C", TargetCharacter = Hero.Character);
                DC(int64(0x2ba35c94202fe8f1), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Diego_106673,
                    UTopic_Diego_106693,
                    UTopic_Diego_106715,
                    UTopic_Diego_106735
                );
            }
        }
        
        
        class UTopic_Diego_106673 : UTopic_Hero__OC_STT_DIEGO
        {
            default DebugId = int64(0xe5e190809a550ba1);
            default Caption = LocText("TEXT_WIP_EETMBHG_20241011_154501_41");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Diego_106673);
            
            default ExtraCharactersToInvite.Add(n"NC_SLD_GORN_699");
            default ExtraCharactersToInvite.Add(n"OC_KDF_MILTEN");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe5e190809a550ba2), EConversationDebugInfo::Executing);
                // Do you guys meet out here often?
                Hero.AI.Say(LocText("TEXT_WIP_EETMBHG_20241011_154501_41"), ForceCameraPreset = n"INDIVIDUAL MEDIUM", TargetCharacter = Diego.Character);
                DC(int64(0xe5e190809a550ba2), EConversationDebugInfo::Done);
                DC(int64(0xe5e190809a550bdd), EConversationDebugInfo::Executing);
                
                // Every now and again, when we all need a break from our ...
                Gorn.AI.Say(LocText("TEXT_WIP_EETMBHG_20241011_154525"), ForceCameraPreset = n"INDIVIDUAL MEDIUM GORN 4FRIENDS 2C", TargetCharacter = Hero.Character);
                DC(int64(0xe5e190809a550bdd), EConversationDebugInfo::Done);
                DC(int64(0xe5e190809a550bfb), EConversationDebugInfo::Executing);
                
                // Exactly. That business in the Swamp Camp, now the mine ...
                Milten.AI.Say(LocText("TEXT_WIP_EETMBHG_20241011_154620"), ForceCameraPreset = n"INDIVIDUAL MEDIUM MILTEN 4FRIENDS 2C", TargetCharacter = Hero.Character);
                DC(int64(0xe5e190809a550bfb), EConversationDebugInfo::Done);
                DC(int64(0xe5e190809a550ba4), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xe5e190809a550ba4), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Diego_106693 : UTopic_Hero__OC_STT_DIEGO
        {
            default DebugId = int64(0xe5e190809a550ba5);
            default Caption = LocText("TEXT_WIP_EETMBHG_20241011_154501_2238");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Diego_106693);
            
            default ExtraCharactersToInvite.Add(n"NC_SLD_GORN_699");
            default ExtraCharactersToInvite.Add(n"SC_NOV_LESTER");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe5e190809a550ba6), EConversationDebugInfo::Executing);
                // What's in this for you? 
                Hero.AI.Say(LocText("TEXT_WIP_EETMBHG_20241011_154501_2238"), ForceCameraPreset = n"INDIVIDUAL MEDIUM", TargetCharacter = Diego.Character);
                DC(int64(0xe5e190809a550ba6), EConversationDebugInfo::Done);
                DC(int64(0xe5e190809a550c26), EConversationDebugInfo::Executing);
                
                // Diego just told you. We want outta this place just like ...
                Gorn.AI.Say(LocText("TEXT_WIP_EETMBHG_20241011_154759"), ForceCameraPreset = n"INDIVIDUAL CLOSEUP GORN 4FRIENDS 2C", TargetCharacter = Hero.Character);
                DC(int64(0xe5e190809a550c26), EConversationDebugInfo::Done);
                DC(int64(0xe5e190809a550c27), EConversationDebugInfo::Executing);
                
                // Though Gorn, Milten, and I do have something to take ...
                Lester.AI.Say(LocText("TEXT_WIP_EETMBHG_20241011_154803"), ForceCameraPreset = n"INDIVIDUAL MEDIUM LESTER 4FRIENDS 2C", TargetCharacter = Hero.Character);
                DC(int64(0xe5e190809a550c27), EConversationDebugInfo::Done);
                DC(int64(0xe5e190809a550ba8), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xe5e190809a550ba8), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Diego_106715 : UTopic_Hero__OC_STT_DIEGO
        {
            default DebugId = int64(0xe5e190809a550bb3);
            default Caption = LocText("TEXT_WIP_EETMBHG_20241011_154504_1924");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Diego_106715);
            
            default ExtraCharactersToInvite.Add(n"NC_SLD_GORN_699");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe5e190809a550bb4), EConversationDebugInfo::Executing);
                // How did you know Saturas would ask me about the focus ...
                Hero.AI.Say(LocText("TEXT_WIP_EETMBHG_20241011_154504_1924"), ForceCameraPreset = n"INDIVIDUAL MEDIUM", TargetCharacter = Lester.Character);
                DC(int64(0xe5e190809a550bb4), EConversationDebugInfo::Done);
                DC(int64(0xe5e190809a550c52), EConversationDebugInfo::Executing);
                
                // Oh, come on - you're the first guy to get his hands on a ...
                Gorn.AI.Say(LocText("TEXT_WIP_EETMBHG_20241011_154838"), ForceCameraPreset = n"INDIVIDUAL MEDIUM GORN 4FRIENDS 2C", TargetCharacter = Hero.Character);
                DC(int64(0xe5e190809a550c52), EConversationDebugInfo::Done);
                DC(int64(0xe5e190809a550c61), EConversationDebugInfo::Executing);
                
                // If you say it like that ... 
                Hero.AI.Say(LocText("TEXT_WIP_EETMBHG_20241011_154845"), ForceCameraPreset = n"INDIVIDUAL CLOSE UP", TargetCharacter = Lester.Character);
                DC(int64(0xe5e190809a550c61), EConversationDebugInfo::Done);
                DC(int64(0xe5e190809a550bb6), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xe5e190809a550bb6), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Diego_106735 : UTopic_Hero__OC_STT_DIEGO
        {
            default DebugId = int64(0xe5e190809a550bc1);
            default Caption = LocText("TEXT_WIP_EETMBHG_20241011_154506_2785");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Diego_106735);
            
            default ExtraCharactersToInvite.Add(n"OC_KDF_MILTEN");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe5e190809a550bc2), EConversationDebugInfo::Executing);
                // I'll take what help I can get. How are we doing this? 
                Hero.AI.Say(LocText("TEXT_WIP_EETMBHG_20241011_154506_2785"), ForceCameraPreset = n"INDIVIDUAL MEDIUM", TargetCharacter = Diego.Character);
                DC(int64(0xe5e190809a550bc2), EConversationDebugInfo::Done);
                DC(int64(0xe5e190809a550d0e), EConversationDebugInfo::Executing);
                
                // Minus the one you found for Y'Berion, there are four ...
                Milten.AI.Say(LocText("TEXT_WIP_EETMBHG_20241011_155115"), ForceCameraPreset = n"INDIVIDUAL MEDIUM MILTEN 4FRIENDS 2C", TargetCharacter = Hero.Character);
                DC(int64(0xe5e190809a550d0e), EConversationDebugInfo::Done);
                DC(int64(0xe5e190809a550d23), EConversationDebugInfo::Executing);
                // I, um, borrowed a map from the Fire Mage chapel that has ...
                Milten.AI.Say(LocText("TEXT_WIP_EETMBHG_20241011_155127"), ForceCameraPreset = n"INDIVIDUAL CLOSE UP", TargetCharacter = Hero.Character);
                DC(int64(0xe5e190809a550d23), EConversationDebugInfo::Done);
                DC(int64(0xe5e190809a550d34), EConversationDebugInfo::Executing);
                
                // Convenient. 
                Hero.AI.Say(LocText("TEXT_WIP_EETMBHG_20241011_155134"), ForceCameraPreset = n"INDIVIDUAL CLOSE UP", TargetCharacter = Milten.Character);
                DC(int64(0xe5e190809a550d34), EConversationDebugInfo::Done);
                DC(int64(0xe5e190809a550d45), EConversationDebugInfo::Executing);
                
                // Just thinking ahead. We already looked into these ...
                Milten.AI.Say(LocText("TEXT_WIP_EETMBHG_20241011_155140"), ForceCameraPreset = n"INDIVIDUAL CLOSE UP", TargetCharacter = Hero.Character);
                DC(int64(0xe5e190809a550d45), EConversationDebugInfo::Done);
                DC(int64(0xe5e190809a550d56), EConversationDebugInfo::Executing);
                // As soon as we're done here, we'll head out and prepare ...
                Milten.AI.Say(LocText("TEXT_WIP_EETMBHG_20241011_155148"), ForceCameraPreset = n"INDIVIDUAL MEDIUM MILTEN 4FRIENDS 2C", TargetCharacter = Hero.Character);
                DC(int64(0xe5e190809a550d56), EConversationDebugInfo::Done);
                DC(int64(0x2345a0fead7880b4), EConversationDebugInfo::Executing);
                
                // Here, this is the map. Don't lose it. 
                Diego.AI.Say(LocText("TEXT_WIP_KKRDULC_20240506_150018_3436"), ForceCameraPreset = n"PACK SHOT 1 4FRIENDS 2C", TargetCharacter = Hero.Character);
                DC(int64(0x2345a0fead7880b4), EConversationDebugInfo::Done);
                DC(int64(0xe87722ef5b6a460d), EConversationDebugInfo::Executing);
                Diego.AddItemToInventory(UItWr_Map_Focus, 1);
                DC(int64(0xe87722ef5b6a460d), EConversationDebugInfo::Done);
                DC(int64(0x668dc368d5f42f8b), EConversationDebugInfo::Executing);
                Diego.AI.GiveItemTo(Hero, UItWr_Map_Focus, 1);
                DC(int64(0x668dc368d5f42f8b), EConversationDebugInfo::Done);
                DC(int64(0xa326d2a684224b54), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER3_BRINGFOCI_BRINGFOCI_MAP.StartQuest();
                DC(int64(0xa326d2a684224b54), EConversationDebugInfo::Done);
                DC(int64(0x668dc368d5f42f97), EConversationDebugInfo::Executing);
                // Questions? 
                Diego.AI.Say(LocText("TEXT_WIP_KKRDULC_20240506_150412"), ForceCameraPreset = n"INDIVIDUAL MEDIUM");
                DC(int64(0x668dc368d5f42f97), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Diego_98646,
                    UTopic_Diego_99037,
                    UTopic_Diego_98666
                );
            }
        }
        
        
        class UTopic_Diego_98646 : UTopic_Hero__OC_STT_DIEGO
        {
            default DebugId = int64(0x2345a0fead788104);
            default Caption = LocText("TEXT_WIP_KKRDULC_20240506_150246_686");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Diego_98646);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2345a0fead788105), EConversationDebugInfo::Executing);
                // Where are the focus stones? 
                Hero.AI.Say(LocText("TEXT_WIP_KKRDULC_20240506_150246_686"), TargetCharacter = Diego.Character, ForceCameraPreset = n"INDIVIDUAL MEDIUM");
                DC(int64(0x2345a0fead788105), EConversationDebugInfo::Done);
                DC(int64(0x2345a0fead788153), EConversationDebugInfo::Executing);
                
                // You'll see. 
                Diego.AI.Say(LocText("TEXT_WIP_KKRDULC_20240506_150506"), TargetCharacter = Hero.Character, ForceCameraPreset = n"INDIVIDUAL CLOSEUP DIEGO 4FRIENDS 2C");
                DC(int64(0x2345a0fead788153), EConversationDebugInfo::Done);
                DC(int64(0x2345a0fead788107), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x2345a0fead788107), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Diego_99037 : UTopic_Hero__OC_STT_DIEGO
        {
            default DebugId = int64(0x2345a0fead788155);
            default Caption = LocText("TEXT_WIP_KKRDULC_20240506_150557_1609");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Diego_99037);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2345a0fead788156), EConversationDebugInfo::Executing);
                // Do you think the amulet will work on the other stones, ...
                Hero.AI.Say(LocText("TEXT_WIP_KKRDULC_20240506_150557_1609"), TargetCharacter = Diego.Character, ForceCameraPreset = n"INDIVIDUAL MEDIUM");
                DC(int64(0x2345a0fead788156), EConversationDebugInfo::Done);
                DC(int64(0x2345a0fead788165), EConversationDebugInfo::Executing);
                
                // My guess is as good as yours. But if Saturas seems to ...
                Diego.AI.Say(LocText("TEXT_WIP_KKRDULC_20240506_150638"), TargetCharacter = Hero.Character, ForceCameraPreset = n"INDIVIDUAL MEDIUM DIEGO 4FRIENDS 2C");
                DC(int64(0x2345a0fead788165), EConversationDebugInfo::Done);
                DC(int64(0x2345a0fead788158), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x2345a0fead788158), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Diego_98666 : UTopic_Hero__OC_STT_DIEGO
        {
            default DebugId = int64(0x2345a0fead788108);
            default Caption = LocText("TEXT_WIP_KKRDULC_20240506_150246_3984");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Diego_98666);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2345a0fead788109), EConversationDebugInfo::Executing);
                // I'll meet you there. 
                Hero.AI.Say(LocText("TEXT_WIP_KKRDULC_20240506_150246_3984"), ForceCameraPreset = n"INDIVIDUAL CLOSE UP", TargetCharacter = Diego.Character);
                DC(int64(0x2345a0fead788109), EConversationDebugInfo::Done);
                DC(int64(0x2345a0fead788118), EConversationDebugInfo::Executing);
                
                // Good. Try not to die. 
                Diego.AI.Say(LocText("TEXT_WIP_KKRDULC_20240506_150253"), TargetCharacter = Hero.Character, ForceCameraPreset = n"INDIVIDUAL MEDIUM");
                DC(int64(0x2345a0fead788118), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_BRINGFOCI, Document::UDocumentSegment_CH3_BRINGFOCI_FourFriends);
                DC(int64(0x2e6b0f87e82c5b25), EConversationDebugInfo::Executing);
                Diego.ExchangeDailyRoutineToClass(UDailyRoutine_OC_STT_Diego_PrepareFocus);
                DC(int64(0x2e6b0f87e82c5b25), EConversationDebugInfo::Done);
                DC(int64(0x2e6b0f87e82c5b3b), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Lester))) { Lester.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Lester_PrepareFocus); }
                DC(int64(0x2e6b0f87e82c5b3b), EConversationDebugInfo::Done);
                DC(int64(0x2e6b0f87e82c5b3d), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Milten))) { Milten.ExchangeDailyRoutineToClass(UDailyRoutine_OC_KDF_Milten_PrepareFocus); }
                DC(int64(0x2e6b0f87e82c5b3d), EConversationDebugInfo::Done);
                DC(int64(0x2e6b0f87e82c5b3f), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Gorn))) { Gorn.ExchangeDailyRoutineToClass(UDailyRoutine_NC_SLD_Gorn_699_PrepareFocus); }
                DC(int64(0x2e6b0f87e82c5b3f), EConversationDebugInfo::Done);
                DC(int64(0xf2ea4cdeb719ea3f), EConversationDebugInfo::Executing);
                G1R.HappyFriends = 1;
                DC(int64(0xf2ea4cdeb719ea3f), EConversationDebugInfo::Done);
                DC(int64(0x2662363e6b51a862), EConversationDebugInfo::Executing);
                UWorldPointManager::Get().CallGlobalEvent(n"OnFocusQuestStart");
                DC(int64(0x2662363e6b51a862), EConversationDebugInfo::Done);
                DC(int64(0x1a0c7e304e9b55d6), EConversationDebugInfo::Executing);
                G1R.WaterMaguesPermission = 1;
                DC(int64(0x1a0c7e304e9b55d6), EConversationDebugInfo::Done);
                DC(int64(0x2345a0fead788125), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x2345a0fead788125), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceDiego97162 : UTopic_Hero__OC_STT_DIEGO
        {
            default DebugId = int64(0x9022fc30d230019b);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceDiego97162);
            
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"FP_ST_DIEGO_FOCUS_START", 2000.0f, int64(0x9022fc30d230019b));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x9022fc30d230019e), Quest::NewCamp_NCCHAPTER3_BRINGFOCI != nullptr && Quest::NewCamp_NCCHAPTER3_BRINGFOCI.IsRunning());
                    DB(int64(0x9022fc30d23001b7), Hero != nullptr && Hero.IsInConversation());
                }
                
                if (Quest::NewCamp_NCCHAPTER3_BRINGFOCI != nullptr && !Quest::NewCamp_NCCHAPTER3_BRINGFOCI.IsRunning())
                    return false;
                
                if (Hero != nullptr && !Hero.IsInConversation())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xae2a1b80dd09b07c), EConversationDebugInfo::Executing);
                // Hey - was starting to think you were dead. 
                Diego.AI.Say(LocText("TEXT_WIP_KHGWENC_20240517_134804"));
                DC(int64(0xae2a1b80dd09b07c), EConversationDebugInfo::Done);
                DC(int64(0x9022fc30d230018d), EConversationDebugInfo::Executing);
                
                // I'm guessing the focus stone is down there?
                Hero.AI.Say(LocText("TEXT_WIP_KVDLGBG_20240513_091741"));
                DC(int64(0x9022fc30d230018d), EConversationDebugInfo::Done);
                DC(int64(0x9022fc30d230018e), EConversationDebugInfo::Executing);
                
                // Yeah. It's a crypt ... a pretty dangerous one at that.
                Diego.AI.Say(LocText("TEXT_WIP_KVDLGBG_20240513_091741_41"));
                DC(int64(0x9022fc30d230018e), EConversationDebugInfo::Done);
                DC(int64(0x9022fc30d23001b8), EConversationDebugInfo::Executing);
                // Milten said the mages never dared to look into this one, ...
                Diego.AI.Say(LocText("TEXT_WIP_KVDLGBG_20240513_092242"));
                DC(int64(0x9022fc30d23001b8), EConversationDebugInfo::Done);
                DC(int64(0xae2a1b80dd09b07d), EConversationDebugInfo::Executing);
                // In other words: this better be worth it.
                Diego.AI.Say(LocText("TEXT_WIP_KHGWENC_20240517_135109"));
                DC(int64(0xae2a1b80dd09b07d), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_STONEHENGE, Document::UDocumentSegment_CH3_STONEHENGE_Start);
                Subdialog(
                    UTopic_Diego_98419,
                    UTopic_Diego_98566,
                    UTopic_Diego_98439
                );
            }
        }
        
        
        class UTopic_Diego_98419 : UTopic_Hero__OC_STT_DIEGO
        {
            default DebugId = int64(0xae2a1b80dd09b08b);
            default Caption = LocText("TEXT_WIP_KHGWENC_20240517_135207_41");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Diego_98419);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xae2a1b80dd09b08c), EConversationDebugInfo::Executing);
                // Who's buried in there?
                Hero.AI.Say(LocText("TEXT_WIP_KHGWENC_20240517_135207_41"));
                DC(int64(0xae2a1b80dd09b08c), EConversationDebugInfo::Done);
                DC(int64(0xae2a1b80dd09b0c3), EConversationDebugInfo::Executing);
                
                // Do I look like an historian? I don't know.
                Diego.AI.Say(LocText("TEXT_WIP_KHGWENC_20240517_135251"));
                DC(int64(0xae2a1b80dd09b0c3), EConversationDebugInfo::Done);
                DC(int64(0xae2a1b80dd09b08e), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xae2a1b80dd09b08e), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Diego_98566 : UTopic_Hero__OC_STT_DIEGO
        {
            default DebugId = int64(0xae2a1b80dd09b0c4);
            default Caption = LocText("TEXT_WIP_KHGWENC_20240517_135303_1924");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Diego_98566);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xae2a1b80dd09b0c5), EConversationDebugInfo::Executing);
                // What's so dangerous about this crypt?
                Hero.AI.Say(LocText("TEXT_WIP_KHGWENC_20240517_135303_1924"));
                DC(int64(0xae2a1b80dd09b0c5), EConversationDebugInfo::Done);
                DC(int64(0xae2a1b80dd09b0d4), EConversationDebugInfo::Executing);
                
                // Well, thanks to the focus, it brimful with magic and ...
                Diego.AI.Say(LocText("TEXT_WIP_KHGWENC_20240517_135404"));
                DC(int64(0xae2a1b80dd09b0d4), EConversationDebugInfo::Done);
                DC(int64(0xae2a1b80dd09b0d6), EConversationDebugInfo::Executing);
                
                // Undead?
                Hero.AI.Say(LocText("TEXT_WIP_KHGWENC_20240517_135449"));
                DC(int64(0xae2a1b80dd09b0d6), EConversationDebugInfo::Done);
                DC(int64(0xae2a1b80dd09b0d7), EConversationDebugInfo::Executing);
                
                // Smart boy. 
                Diego.AI.Say(LocText("TEXT_WIP_KHGWENC_20240517_135453"));
                DC(int64(0xae2a1b80dd09b0d7), EConversationDebugInfo::Done);
                DC(int64(0xae2a1b80dd09b0c7), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xae2a1b80dd09b0c7), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Diego_98439 : UTopic_Hero__OC_STT_DIEGO
        {
            default DebugId = int64(0xae2a1b80dd09b08f);
            default Caption = LocText("TEXT_WIP_KHGWENC_20240517_135207_2238");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Diego_98439);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xae2a1b80dd09b090), EConversationDebugInfo::Executing);
                // How do we get in?
                Hero.AI.Say(LocText("TEXT_WIP_KHGWENC_20240517_135207_2238"));
                DC(int64(0xae2a1b80dd09b090), EConversationDebugInfo::Done);
                DC(int64(0xae2a1b80dd09b0d8), EConversationDebugInfo::Executing);
                
                // I have an idea. Follow me. 
                Diego.AI.Say(LocText("TEXT_WIP_KHGWENC_20240517_135918"));
                DC(int64(0xae2a1b80dd09b0d8), EConversationDebugInfo::Done);
                DC(int64(0x9022fc30d23001bb), EConversationDebugInfo::Executing);
                Diego.ExchangeDailyRoutineToClass(UDailyRoutine_OC_STT_Diego_GuideSh);
                DC(int64(0x9022fc30d23001bb), EConversationDebugInfo::Done);
                DC(int64(0x821de80fbbd7f0c8), EConversationDebugInfo::Executing);
                Diego.JoinPartyOf(Hero);
                DC(int64(0x821de80fbbd7f0c8), EConversationDebugInfo::Done);
                DC(int64(0x5cbc058327f749ea), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER3_STONEHENGE.StartQuest();
                DC(int64(0x5cbc058327f749ea), EConversationDebugInfo::Done);
                DC(int64(0x821de80fbbd7f07d), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x821de80fbbd7f07d), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceDiego97295 : UTopic_Hero__OC_STT_DIEGO
        {
            default DebugId = int64(0x821de80fbbd7f0d7);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceDiego97586);
            default Rules.HideIfKnows(UChoiceDiego97295);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x821de80fbbd7f0da), Hero != nullptr && Hero.HasItem(UItMs_Focus_05, 1, 0));
                }
                
                return Hero != nullptr && Hero.HasItem(UItMs_Focus_05, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xae2a1b80dd09b117), EConversationDebugInfo::Executing);
                // So that's how you do it, eh? Wonder how that thing ...
                Diego.AI.Say(LocText("TEXT_WIP_KHGWENC_20240517_145025"));
                DC(int64(0xae2a1b80dd09b117), EConversationDebugInfo::Done);
                DC(int64(0xae2a1b80dd09b119), EConversationDebugInfo::Executing);
                // Anyway, we got the focus, and we're still breathing - ...
                Diego.AI.Say(LocText("TEXT_WIP_KHGWENC_20240517_145114"));
                DC(int64(0xae2a1b80dd09b119), EConversationDebugInfo::Done);
                DC(int64(0x821de80fbbd7f0c9), EConversationDebugInfo::Executing);
                
                // Couldn't have done without your help.
                Hero.AI.Say(LocText("TEXT_WIP_KVDLGBG_20240513_153237"));
                DC(int64(0x821de80fbbd7f0c9), EConversationDebugInfo::Done);
                DC(int64(0x821de80fbbd7f0ca), EConversationDebugInfo::Executing);
                
                // Ah, don't get sentimental. I want out of here as much as ...
                Diego.AI.Say(LocText("TEXT_WIP_KVDLGBG_20240513_153237_2083"));
                DC(int64(0x821de80fbbd7f0ca), EConversationDebugInfo::Done);
                DC(int64(0xae2a1b80dd09b11a), EConversationDebugInfo::Executing);
                // If you need anything, I'll be staying at the lighthouse ...
                Diego.AI.Say(LocText("TEXT_WIP_KHGWENC_20240517_145209"));
                DC(int64(0xae2a1b80dd09b11a), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_STT_DIEGO, Document::UDocumentSegment_Glossary_OC_STT_DIEGO_Stonehenge);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_STONEHENGE, Document::UDocumentSegment_CH3_STONEHENGE_Guardian);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_STONEHENGE, Document::UDocumentSegment_CH3_STONEHENGE_Focus);
                Subdialog(
                    UTopic_Diego_100997,
                    UTopic_Diego_101017
                );
            }
        }
        
        
        class UTopic_Diego_100997 : UTopic_Hero__OC_STT_DIEGO
        {
            default DebugId = int64(0xae2a1b80dd09b129);
            default Caption = LocText("TEXT_WIP_KHGWENC_20240517_145948_2785");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Diego_100997);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xae2a1b80dd09b12a), EConversationDebugInfo::Executing);
                // Why's that?
                Hero.AI.Say(LocText("TEXT_WIP_KHGWENC_20240517_145948_2785"));
                DC(int64(0xae2a1b80dd09b12a), EConversationDebugInfo::Done);
                DC(int64(0xae2a1b80dd09b155), EConversationDebugInfo::Executing);
                
                // I think I mentioned it, but Gomez has been pretty tense ...
                Diego.AI.Say(LocText("TEXT_WIP_KHGWENC_20240517_150012"));
                DC(int64(0xae2a1b80dd09b155), EConversationDebugInfo::Done);
                DC(int64(0xae2a1b80dd09b17f), EConversationDebugInfo::Executing);
                // I've been trying to feel things out, but I'm getting the ...
                Diego.AI.Say(LocText("TEXT_WIP_KHGWENC_20240517_150627"));
                DC(int64(0xae2a1b80dd09b17f), EConversationDebugInfo::Done);
                DC(int64(0xae2a1b80dd09b19e), EConversationDebugInfo::Executing);
                // Come to think of it, if I were you, I'd probably also ...
                Diego.AI.Say(LocText("TEXT_WIP_KHGWENC_20240517_151359"));
                DC(int64(0xae2a1b80dd09b19e), EConversationDebugInfo::Done);
                DB(int64(0xae2a1b80dd09b164), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                DB(int64(0xae2a1b80dd09b180), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp))
                {
                    DC(int64(0xae2a1b80dd09b19d), EConversationDebugInfo::Executing);
                    // Apparently Gomez blamed your guys and that ritual for ...
                    Diego.AI.Say(LocText("TEXT_WIP_KHGWENC_20240517_151249"));
                    DC(int64(0xae2a1b80dd09b19d), EConversationDebugInfo::Done);
                }
                else if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp))
                {
                    DC(int64(0xae2a1b80dd09b190), EConversationDebugInfo::Executing);
                    // The New Camp had nothing to do with that flooding, but ...
                    Diego.AI.Say(LocText("TEXT_WIP_KHGWENC_20240517_151230_2386"));
                    DC(int64(0xae2a1b80dd09b190), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0xae2a1b80dd09b1ad), EConversationDebugInfo::Executing);
                    
                    // What do you mean? We're on the same side.
                    Hero.AI.Say(LocText("TEXT_WIP_KHGWENC_20240517_151445"));
                    DC(int64(0xae2a1b80dd09b1ad), EConversationDebugInfo::Done);
                    DC(int64(0xae2a1b80dd09b1a0), EConversationDebugInfo::Executing);
                    
                    // We are, but you've been doing a lot of work for the ...
                    Diego.AI.Say(LocText("TEXT_WIP_KHGWENC_20240517_151437_3984"));
                    DC(int64(0xae2a1b80dd09b1a0), EConversationDebugInfo::Done);
                    DC(int64(0xae2a1b80dd09b1ae), EConversationDebugInfo::Executing);
                    // Including this business here with the focus stones. Just ...
                    Diego.AI.Say(LocText("TEXT_WIP_KHGWENC_20240517_151506"));
                    DC(int64(0xae2a1b80dd09b1ae), EConversationDebugInfo::Done);
                }
                DC(int64(0xae2a1b80dd09b12c), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xae2a1b80dd09b12c), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Diego_101017 : UTopic_Hero__OC_STT_DIEGO
        {
            default DebugId = int64(0xae2a1b80dd09b12d);
            default Caption = LocText("TEXT_WIP_KHGWENC_20240517_145948_3286");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Diego_101017);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xae2a1b80dd09b12e), EConversationDebugInfo::Executing);
                // Time to get that focus stone to Saturas.
                Hero.AI.Say(LocText("TEXT_WIP_KHGWENC_20240517_145948_3286"));
                DC(int64(0xae2a1b80dd09b12e), EConversationDebugInfo::Done);
                DC(int64(0xae2a1b80dd09b1e1), EConversationDebugInfo::Executing);
                
                // Indeed. Give him my regards. 
                Diego.AI.Say(LocText("TEXT_WIP_KHGWENC_20240517_151607"));
                DC(int64(0xae2a1b80dd09b1e1), EConversationDebugInfo::Done);
                DC(int64(0x821de80fbbd7f101), EConversationDebugInfo::Executing);
                Diego.ExchangeDailyRoutineToClass(UDailyRoutine_OC_STT_Diego_LightHouse);
                DC(int64(0x821de80fbbd7f101), EConversationDebugInfo::Done);
                DC(int64(0x1a0c7e304e9b5605), EConversationDebugInfo::Executing);
                G1R.WaterMaguesPermission = 1;
                DC(int64(0x1a0c7e304e9b5605), EConversationDebugInfo::Done);
                DC(int64(0x821de80fbbd7f10e), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x821de80fbbd7f10e), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceDiego97383 : UTopic_Hero__OC_STT_DIEGO
        {
            default DebugId = int64(0x9022fc30d23001fa);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceDiego97162);
            default Rules.HideIfKnows(UChoiceDiego97383);
            
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"FP_ST_DIEGO_FOCUS_GATE", 200.0f, int64(0x9022fc30d23001fa));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9022fc30d23001ed), EConversationDebugInfo::Executing);
                // Here we are. You see those wall paintings? I think we ...
                Diego.AI.Say(LocText("TEXT_WIP_KVDLGBG_20240513_093503_2083"));
                DC(int64(0x9022fc30d23001ed), EConversationDebugInfo::Done);
                DC(int64(0xae2a1b80dd09b0d9), EConversationDebugInfo::Executing);
                // Come, let's give it a shot.
                Diego.AI.Say(LocText("TEXT_WIP_KHGWENC_20240517_140056"));
                DC(int64(0xae2a1b80dd09b0d9), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_STONEHENGE, Document::UDocumentSegment_CH3_STONEHENGE_DoorClosed);
                DC(int64(0x9022fc30d2300225), EConversationDebugInfo::Executing);
                Diego.ExchangeDailyRoutineToClass(UDailyRoutine_OC_STT_Diego_ShGate);
                DC(int64(0x9022fc30d2300225), EConversationDebugInfo::Done);
                DC(int64(0x39c4428f0c40fd7e), EConversationDebugInfo::Executing);
                G1R.ConversationWithDiegoAtStoneHenge = 1;
                DC(int64(0x39c4428f0c40fd7e), EConversationDebugInfo::Done);
                DC(int64(0x8a72e3c510423472), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER3_STONEHENGE_STONEHENGE_OBJ_DOOR.StartQuest();
                DC(int64(0x8a72e3c510423472), EConversationDebugInfo::Done);
                DC(int64(0x9022fc30d230020b), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x9022fc30d230020b), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceDiego97586 : UTopic_Hero__OC_STT_DIEGO
        {
            default DebugId = int64(0x9022fc30d230024c);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default ForceSettings.ApproachBy = EConversationForceWalk::WalkToOther;
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceDiego97383);
            default Rules.HideIfKnows(UChoiceDiego97586);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x9022fc30d230024f), G1R != nullptr && G1R.IsDoorOpen(n"Stonehenge_Entrance_Door"));
                }
                
                return G1R != nullptr && G1R.IsDoorOpen(n"Stonehenge_Entrance_Door");
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9022fc30d230023f), EConversationDebugInfo::Executing);
                // Godsdammit. Didn't waste any time to show up, did they? ...
                Diego.AI.Say(LocText("TEXT_WIP_KVDLGBG_20240513_104358_1924"));
                DC(int64(0x9022fc30d230023f), EConversationDebugInfo::Done);
                DC(int64(0xae2a1b80dd09b0da), EConversationDebugInfo::Executing);
                
                // All good. 
                Hero.AI.Say(LocText("TEXT_WIP_KHGWENC_20240517_140712"));
                DC(int64(0xae2a1b80dd09b0da), EConversationDebugInfo::Done);
                DC(int64(0x9022fc30d230025c), EConversationDebugInfo::Executing);
                
                // Gotta say, you know how to fight. Anyway, door's open. ...
                Diego.AI.Say(LocText("TEXT_WIP_KVDLGBG_20240513_105436"));
                DC(int64(0x9022fc30d230025c), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_STONEHENGE, Document::UDocumentSegment_CH3_STONEHENGE_DoorOpened);
                DC(int64(0x821de80fbbd7f057), EConversationDebugInfo::Executing);
                Diego.ExchangeDailyRoutineToClass(UDailyRoutine_OC_STT_Diego_FollowStoneHenge);
                DC(int64(0x821de80fbbd7f057), EConversationDebugInfo::Done);
                DC(int64(0x8a72e3c5104234bd), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER3_STONEHENGE_STONEHENGE_OBJ_DOOR.SucceedQuest();
                DC(int64(0x8a72e3c5104234bd), EConversationDebugInfo::Done);
                DC(int64(0x821de80fbbd7f064), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x821de80fbbd7f064), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceDiegoBrief : UTopic_Hero__OC_STT_DIEGO
        {
            default DebugId = int64(0x7fbf89a23144191e);
            default Caption = LocText("INFO_DIEGO_BRIEF_15_00");
            default PriorityRank = 4;
            
            default Rules.HideIfKnows(UChoiceDiegoBrief);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x7fbf89a23144191f), G1R != nullptr && !G1R.HasReachedChapter(2));
                }
                
                return G1R != nullptr && !G1R.HasReachedChapter(2);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7fbf89a231441920), EConversationDebugInfo::Executing);
                // I have a letter for the highest Fire Mage.
                Hero.AI.Say(LocText("INFO_DIEGO_BRIEF_15_00"));
                DC(int64(0x7fbf89a231441920), EConversationDebugInfo::Done);
                DC(int64(0x7fbf89a231441921), EConversationDebugInfo::Executing);
                
                // That so?
                Diego.AI.Say(LocText("INFO_DIEGO_BRIEF_11_01"));
                DC(int64(0x7fbf89a231441921), EConversationDebugInfo::Done);
                DC(int64(0x7fbf89a231441922), EConversationDebugInfo::Executing);
                
                // Yes. Some mage gave it to me before they threw me in.
                Hero.AI.Say(LocText("INFO_DIEGO_BRIEF_15_02"));
                DC(int64(0x7fbf89a231441922), EConversationDebugInfo::Done);
                DC(int64(0x7fbf89a231441923), EConversationDebugInfo::Executing);
                
                // Interesting. Consider yourself lucky that the mages and ...
                Diego.AI.Say(LocText("INFO_DIEGO_BRIEF_11_03"));
                DC(int64(0x7fbf89a231441923), EConversationDebugInfo::Done);
                DC(int64(0x7fbf89a231441924), EConversationDebugInfo::Executing);
                // Look, most folk in here are dirt poor, and the mages are ...
                Diego.AI.Say(LocText("INFO_DIEGO_BRIEF_11_04"));
                DC(int64(0x7fbf89a231441924), EConversationDebugInfo::Done);
                DC(int64(0x7fbf89a231441925), EConversationDebugInfo::Executing);
                // So do yourself a favor and keep your mouth shut about ...
                Diego.AI.Say(LocText("INFO_DIEGO_BRIEF_11_05"));
                DC(int64(0x7fbf89a231441925), EConversationDebugInfo::Done);
                DC(int64(0x7fbf89a231441926), EConversationDebugInfo::Executing);
                
                // Why not? 
                Hero.AI.Say(LocText("INFO_DIEGO_BRIEF_15_06"));
                DC(int64(0x7fbf89a231441926), EConversationDebugInfo::Done);
                DC(int64(0x7fbf89a231441927), EConversationDebugInfo::Executing);
                
                // The mages live in the Old Camp castle, and only Gomez's ...
                Diego.AI.Say(LocText("INFO_DIEGO_BRIEF_11_07"));
                DC(int64(0x7fbf89a231441927), EConversationDebugInfo::Done);
                DC(int64(0x99b76bf90cd601c1), EConversationDebugInfo::Executing);
                // But if you're lucky, you might run into Torrez in the ...
                Diego.AI.Say(LocText("TEXT_WIP_KXYXWWB_20250202_220538"));
                DC(int64(0x99b76bf90cd601c1), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_FIREMAGESLETTER, Document::UDocumentSegment_CH1_FIREMAGESLETTER_DiegoAdvice);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_FIREMAGESLETTER, Document::UDocumentSegment_CH1_FIREMAGESLETTER_Torrez);
            }
        }
        
        
        class UChoiceDiegoBringlistOffer : UTopic_Hero__OC_STT_DIEGO
        {
            default DebugId = int64(0x7fbf89a23144198f);
            default Caption = LocText("INFO_DIEGO_BRINGLIST_OFFER_15_00");
            default PriorityRank = 4;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceDiegoRules);
            default Rules.HideIfKnows(UChoiceDiegoBringlistOffer);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x7fbf89a231441990), Quest::OldCamp_OCCHAPTER1_BRINGLIST != nullptr && !Quest::OldCamp_OCCHAPTER1_BRINGLIST.HasBeenStarted());
                    DB(int64(0x9580b03b04f83184), G1R != nullptr && !G1R.HasReachedChapter(2));
                    DB(int64(0x8a78b1a789538219), G1R.OC_Test >= 3);
                }
                
                if (Quest::OldCamp_OCCHAPTER1_BRINGLIST != nullptr && Quest::OldCamp_OCCHAPTER1_BRINGLIST.HasBeenStarted())
                    return false;
                
                if (G1R != nullptr && G1R.HasReachedChapter(2))
                    return false;
                
                if (G1R.OC_Test < 3)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7fbf89a231441991), EConversationDebugInfo::Executing);
                // Am I ready for that test of yours?
                Hero.AI.Say(LocText("INFO_DIEGO_BRINGLIST_OFFER_15_00"));
                DC(int64(0x7fbf89a231441991), EConversationDebugInfo::Done);
                DC(int64(0x7fbf89a231441992), EConversationDebugInfo::Executing);
                
                // Yeah, I think so. It's simple, actually: head to the Old ...
                Diego.AI.Say(LocText("INFO_DIEGO_BRINGLIST_OFFER_11_01"));
                DC(int64(0x7fbf89a231441992), EConversationDebugInfo::Done);
                DC(int64(0x7fbf89a231441993), EConversationDebugInfo::Executing);
                // He'll give you a supply list - basically what our guys ...
                Diego.AI.Say(LocText("INFO_DIEGO_BRINGLIST_OFFER_11_02"));
                DC(int64(0x7fbf89a231441993), EConversationDebugInfo::Done);
                DC(int64(0x7fbf89a231441994), EConversationDebugInfo::Executing);
                // You bring it to me, then we bring them their stuff with ...
                Diego.AI.Say(LocText("INFO_DIEGO_BRINGLIST_OFFER_11_03"));
                DC(int64(0x7fbf89a231441994), EConversationDebugInfo::Done);
                DC(int64(0x7fbf89a231441995), EConversationDebugInfo::Executing);
                
                // Sounds simple enough.
                Hero.AI.Say(LocText("INFO_DIEGO_BRINGLIST_OFFER_15_04"));
                DC(int64(0x7fbf89a231441995), EConversationDebugInfo::Done);
                DC(int64(0x7fbf89a231441996), EConversationDebugInfo::Executing);
                
                // It is - as long as you make sure the New Campers don't ...
                Diego.AI.Say(LocText("INFO_DIEGO_BRINGLIST_OFFER_11_05"));
                DC(int64(0x7fbf89a231441996), EConversationDebugInfo::Done);
                DC(int64(0x7fbf89a231441997), EConversationDebugInfo::Executing);
                // Like I said, the list is important. If you do this ...
                Diego.AI.Say(LocText("INFO_DIEGO_BRINGLIST_OFFER_11_06"));
                DC(int64(0x7fbf89a231441997), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_BRINGLIST, Document::UDocumentSegment_CH1_BRINGLIST_Start);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_BRINGLIST, Document::UDocumentSegment_CH1_BRINGLIST_Password);
                DC(int64(0x3324a0310d75007c), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Ian))) { Ian.AddItemToInventory(UItWr_Scroll_List, 1); }
                DC(int64(0x3324a0310d75007c), EConversationDebugInfo::Done);
                DC(int64(0xd2dcebc57700d237), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_JOINOC_JOINOC_OBJ_TESTOFFAITH.StartQuest();
                DC(int64(0xd2dcebc57700d237), EConversationDebugInfo::Done);
                DC(int64(0xf4c881922ff2cf4e), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_BRINGLIST.StartQuest();
                DC(int64(0xf4c881922ff2cf4e), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDiegoBringlistSuccess : UTopic_Hero__OC_STT_DIEGO
        {
            default DebugId = int64(0x7fbf89a2314419a4);
            default Caption = LocText("INFO_DIEGO_BRINGLIST_SUCCESS_15_00");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceDiegoBringlistOffer);
            default Rules.HideIfKnows(UChoiceDiegoBringlistSuccess);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xc456dc2d6f89f654), Hero != nullptr && Hero.HasItem(UItWr_Scroll_Listnc, 1, 0));
                    DB(int64(0xc456dc2d6f89f655), Quest::OldCamp_OCCHAPTER1_BRINGLIST != nullptr && Quest::OldCamp_OCCHAPTER1_BRINGLIST.IsRunning());
                    DB(int64(0xc456dc2d6f89f656), Quest::OldCamp_OCCHAPTER1_BRINGLIST != nullptr && Quest::OldCamp_OCCHAPTER1_BRINGLIST.IsRunning());
                    DB(int64(0xc456dc2d6f89f657), Hero != nullptr && Hero.HasItem(UItWr_Scroll_List, 1, 0));
                }
                
                if (Hero != nullptr && Hero.HasItem(UItWr_Scroll_Listnc, 1, 0) && Quest::OldCamp_OCCHAPTER1_BRINGLIST != nullptr && Quest::OldCamp_OCCHAPTER1_BRINGLIST.IsRunning())
                    return true;
                
                if (Quest::OldCamp_OCCHAPTER1_BRINGLIST != nullptr && Quest::OldCamp_OCCHAPTER1_BRINGLIST.IsRunning() && Hero != nullptr && Hero.HasItem(UItWr_Scroll_List, 1, 0))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7fbf89a2314419a7), EConversationDebugInfo::Executing);
                // I have the supply list.
                Hero.AI.Say(LocText("INFO_DIEGO_BRINGLIST_SUCCESS_15_00"), ForceCameraPreset = n"INDIVIDUAL MEDIUM");
                DC(int64(0x7fbf89a2314419a7), EConversationDebugInfo::Done);
                DB(int64(0x7fbf89a2314419a9), Hero != nullptr && Hero.HasItem(UItWr_Scroll_List, 1, 0));
                DB(int64(0x7fbf89a2314419ab), Hero != nullptr && Hero.HasItem(UItWr_Scroll_Listnc, 1, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItWr_Scroll_List, 1, 0))
                {
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_BRINGLIST, Document::UDocumentSegment_CH1_BRINGLIST_CompletedOC);
                    DB(int64(0x123f53d08c63c8ce), Diego != nullptr && Diego.IsSitting());
                    
                    if (Diego != nullptr && Diego.IsSitting())
                    {
                        DC(int64(0x3324a0310d750093), EConversationDebugInfo::Executing);
                        Hero.AI.GiveItemTo(Diego, UItWr_Scroll_List, 1);
                        DC(int64(0x3324a0310d750093), EConversationDebugInfo::Done);
                        DC(int64(0x971243ef24ebbdd), EConversationDebugInfo::Executing);
                        RequestCameraReverseShot();
                        DC(int64(0x971243ef24ebbdd), EConversationDebugInfo::Done);
                        DC(int64(0x3324a0310d75008c), EConversationDebugInfo::Executing);
                        Diego.AI.TryInteractionWithoutSpot(GameplayTag::Action_Conversation_ReadScrollSeated, 4);
                        DC(int64(0x3324a0310d75008c), EConversationDebugInfo::Done);
                    }
                    else
                    {
                        DC(int64(0x3324a0310d750093), EConversationDebugInfo::Executing);
                        Hero.AI.GiveItemTo(Diego, UItWr_Scroll_List, 1);
                        DC(int64(0x3324a0310d750093), EConversationDebugInfo::Done);
                        DC(int64(0x971243ef24ebbdd), EConversationDebugInfo::Executing);
                        RequestCameraReverseShot();
                        DC(int64(0x971243ef24ebbdd), EConversationDebugInfo::Done);
                        DC(int64(0x3324a0310d75008c), EConversationDebugInfo::Executing);
                        Diego.AI.TryInteractionWithoutSpot(GameplayTag::Action_Conversation_ReadScroll, 4);
                        DC(int64(0x3324a0310d75008c), EConversationDebugInfo::Done);
                    }
                    DC(int64(0x7fbf89a2314419ae), EConversationDebugInfo::Executing);
                    // Well done. That'll earn you some points with us.
                    Diego.AI.Say(LocText("INFO_DIEGO_BRINGLIST_SUCCESS_11_01"));
                    DC(int64(0x7fbf89a2314419ae), EConversationDebugInfo::Done);
                }
                else if (Hero != nullptr && Hero.HasItem(UItWr_Scroll_Listnc, 1, 0))
                {
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_BRINGLIST, Document::UDocumentSegment_CH1_BRINGLIST_CompletedNC);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_LARES_BRINGLISTBACK, Document::UDocumentSegment_CH1_LARES_BRINGLISTBACK_GivenToDiego);
                    DB(int64(0x123f53d08c63c8fe), Diego != nullptr && Diego.IsSitting());
                    
                    if (Diego != nullptr && Diego.IsSitting())
                    {
                        DC(int64(0x3324a0310d750090), EConversationDebugInfo::Executing);
                        Hero.AI.GiveItemTo(Diego, UItWr_Scroll_Listnc, 1);
                        DC(int64(0x3324a0310d750090), EConversationDebugInfo::Done);
                        DC(int64(0x971243ef24ebbdd), EConversationDebugInfo::Executing);
                        RequestCameraReverseShot();
                        DC(int64(0x971243ef24ebbdd), EConversationDebugInfo::Done);
                        DC(int64(0x3324a0310d75008c), EConversationDebugInfo::Executing);
                        Diego.AI.TryInteractionWithoutSpot(GameplayTag::Action_Conversation_ReadScrollSeated, 4);
                        DC(int64(0x3324a0310d75008c), EConversationDebugInfo::Done);
                    }
                    else
                    {
                        DC(int64(0x3324a0310d750090), EConversationDebugInfo::Executing);
                        Hero.AI.GiveItemTo(Diego, UItWr_Scroll_Listnc, 1);
                        DC(int64(0x3324a0310d750090), EConversationDebugInfo::Done);
                        DC(int64(0x971243ef24ebbdd), EConversationDebugInfo::Executing);
                        RequestCameraReverseShot();
                        DC(int64(0x971243ef24ebbdd), EConversationDebugInfo::Done);
                        DC(int64(0x3324a0310d75008c), EConversationDebugInfo::Executing);
                        Diego.AI.TryInteractionWithoutSpot(GameplayTag::Action_Conversation_ReadScroll, 4);
                        DC(int64(0x3324a0310d75008c), EConversationDebugInfo::Done);
                    }
                    DC(int64(0x5ecf3af2abd4a558), EConversationDebugInfo::Executing);
                    // Well done, but you could have done it better.
                    Diego.AI.Say(LocText("TEXT_WIP_PFXTIYB_20260224_163951_41"));
                    DC(int64(0x5ecf3af2abd4a558), EConversationDebugInfo::Done);
                }
                DC(int64(0x3324a0310d750089), EConversationDebugInfo::Executing);
                G1R.Points_OC += 5;
                DC(int64(0x3324a0310d750089), EConversationDebugInfo::Done);
                DC(int64(0xd2dcebc57700d9c3), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_JOINOC_JOINOC_OBJ_TESTOFFAITH.SucceedQuest();
                DC(int64(0xd2dcebc57700d9c3), EConversationDebugInfo::Done);
                DC(int64(0xf4c881922ff2d02f), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_BRINGLIST_BRINGLIST_OBJ_RETURNLIST.SucceedQuest();
                DC(int64(0xf4c881922ff2d02f), EConversationDebugInfo::Done);
                DC(int64(0x2a5f90bbaadd43e2), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER1_LARES_BRINGLISTBACK_LARES_BIRNGLISTBACK_OBJ_GIVE.SucceedQuest();
                DC(int64(0x2a5f90bbaadd43e2), EConversationDebugInfo::Done);
                DC(int64(0xfaf1ac2de0146b), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER1_LARES_BRINGLISTBACK_LARES_BRINGLISTBACK_OBJ_REPORT.StartQuest();
                DC(int64(0xfaf1ac2de0146b), EConversationDebugInfo::Done);
                DC(int64(0x5af8348209a3b37a), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_BRINGLIST_BRINGLIST_MAP.SucceedQuest();
                DC(int64(0x5af8348209a3b37a), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDiegoBullit : UTopic_Hero__OC_STT_DIEGO
        {
            default DebugId = int64(0x7fbf89a231441932);
            default Caption = LocText("INFO_DIEGO_BULLIT_15_02");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceDiegoWarumgeholfen);
            default Rules.HideIfKnows(UChoiceDiegoBullit);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x7fbf89a231441933), G1R.Diego_After_Gamestart == 0);
                }
                
                return G1R.Diego_After_Gamestart == 0;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7fbf89a231441934), EConversationDebugInfo::Executing);
                // Where is this Bullit now?
                Hero.AI.Say(LocText("INFO_DIEGO_BULLIT_15_02"));
                DC(int64(0x7fbf89a231441934), EConversationDebugInfo::Done);
                DC(int64(0x7fbf89a231441935), EConversationDebugInfo::Executing);
                
                // Probably back in the Old Camp - he and his lads came ...
                Diego.AI.Say(LocText("INFO_DIEGO_BULLIT_11_03"));
                DC(int64(0x7fbf89a231441935), EConversationDebugInfo::Done);
                DC(int64(0x7fbf89a231441936), EConversationDebugInfo::Executing);
                // If you plan on taking him on, though, be careful. He's a ...
                Diego.AI.Say(LocText("INFO_DIEGO_BULLIT_11_04"));
                DC(int64(0x7fbf89a231441936), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDiegoCelebs : UTopic_Hero__OC_STT_DIEGO
        {
            default DebugId = int64(0x7fbf89a231441979);
            default Caption = LocText("INFO_DIEGO_CELEBS_15_00");
            default PriorityRank = 4;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceDiegoRules);
            default Rules.HideIfKnows(UChoiceDiegoCelebs);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa0b0c23ea1ca6732), Quest::OldCamp_OCCHAPTER1_JOINOC != nullptr && Quest::OldCamp_OCCHAPTER1_JOINOC.IsRunning());
                }
                
                return Quest::OldCamp_OCCHAPTER1_JOINOC != nullptr && Quest::OldCamp_OCCHAPTER1_JOINOC.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7fbf89a23144197a), EConversationDebugInfo::Executing);
                
                // Okay. Where do I find these "key figures?"
                Hero.AI.Say(LocText("INFO_DIEGO_CELEBS_15_00"));
                DC(int64(0x7fbf89a23144197a), EConversationDebugInfo::Done);
                DC(int64(0x7fbf89a23144197b), EConversationDebugInfo::Executing);
                
                // Well, you're looking at one. Thorus, too, but you ...
                Diego.AI.Say(LocText("INFO_DIEGO_CELEBS_11_01"));
                DC(int64(0x7fbf89a23144197b), EConversationDebugInfo::Done);
                DC(int64(0x7fbf89a23144197c), EConversationDebugInfo::Executing);
                // As far as the others go, you'll have to figure that out ...
                Diego.AI.Say(LocText("INFO_DIEGO_CELEBS_11_02"));
                DC(int64(0x7fbf89a23144197c), EConversationDebugInfo::Done);
                DC(int64(0x7fbf89a23144197d), EConversationDebugInfo::Executing);
                // Just take a stroll through the Outer Ring and talk to ...
                Diego.AI.Say(LocText("INFO_DIEGO_CELEBS_11_03"));
                DC(int64(0x7fbf89a23144197d), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDiegoExitGamestart : UTopic_Hero__OC_STT_DIEGO
        {
            default DebugId = int64(0x7fbf89a23144190d);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            default Rules.HideIfKnows(UChoiceDiegoExitGamestart);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7fbf89a23144190e), EConversationDebugInfo::Executing);
                
                // I'll be going. Thanks for the help. 
                Hero.AI.Say(LocText("INFO_DIEGO_EXIT_GAMESTART_15_00"));
                DC(int64(0x7fbf89a23144190e), EConversationDebugInfo::Done);
                DB(int64(0x7fbf89a231441910), Hero != nullptr && !Hero.HasListenedTo(LocText("INFO_DIEGO_KOLONIE_11_03")));
                
                if (Hero != nullptr && !Hero.HasListenedTo(LocText("INFO_DIEGO_KOLONIE_11_03")))
                {
                    DC(int64(0x7fbf89a231441911), EConversationDebugInfo::Executing);
                    // As you want. Was good knowing you.
                    Diego.AI.Say(LocText("INFO_DIEGO_EXIT_GAMESTART_11_01"));
                    DC(int64(0x7fbf89a231441911), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x7fbf89a231441912), EConversationDebugInfo::Executing);
                    // Don't mention it. Feel free to tag along if you want. 
                    Diego.AI.Say(LocText("INFO_DIEGO_EXIT_GAMESTART_11_02"));
                    DC(int64(0x7fbf89a231441912), EConversationDebugInfo::Done);
                    DC(int64(0x3232d7843c92b70c), EConversationDebugInfo::Executing);
                    // If not - see you in the Old Camp. 
                    Diego.AI.Say(LocText("TEXT_WIP_UFXCIAC_20240902_215658"));
                    DC(int64(0x3232d7843c92b70c), EConversationDebugInfo::Done);
                }
                DC(int64(0xddcf5240c3f20014), EConversationDebugInfo::Executing);
                // One more thing. You can read, can't you? Take these ...
                Diego.AI.Say(LocText("TEXT_WIP_JPLPJEN_20260119_154013_41"));
                DC(int64(0xddcf5240c3f20014), EConversationDebugInfo::Done);
                DC(int64(0x17ea838515987235), EConversationDebugInfo::Executing);
                Hero.AddItemToInventory(UItMs_Glossary, 1);
                DC(int64(0x17ea838515987235), EConversationDebugInfo::Done);
                DB(int64(0x7fbf89a231441914), G1R != nullptr && !G1R.HasReachedChapter(2));
                
                if (G1R != nullptr && !G1R.HasReachedChapter(2))
                {
                    DC(int64(0x3324a0310d7500ab), EConversationDebugInfo::Executing);
                    Diego.ExchangeDailyRoutineToClass(UDailyRoutine_OC_STT_Diego_OldCamp);
                    DC(int64(0x3324a0310d7500ab), EConversationDebugInfo::Done);
                }
                DC(int64(0x3324a0310d7500a7), EConversationDebugInfo::Executing);
                G1R.Diego_After_Gamestart = 1;
                DC(int64(0x3324a0310d7500a7), EConversationDebugInfo::Done);
                DC(int64(0xec39659e467f2e9f), EConversationDebugInfo::Executing);
                G1R.FirstXardasCrow();
                DC(int64(0xec39659e467f2e9f), EConversationDebugInfo::Done);
                DC(int64(0x7fbf89a231441917), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x7fbf89a231441917), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceDiegoExitLater : UTopic_Hero__OC_STT_DIEGO
        {
            default DebugId = int64(0x7fbf89a231441918);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            
            default JustOne.Add(n"End");
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceDiegoExitGamestart);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DB(int64(0x7fbf89a23144191a), Diego != nullptr && Diego.IsInPartyWith(Hero));
                
                if (Diego != nullptr && Diego.IsInPartyWith(Hero))
                {
                    DC(int64(0x7fbf89a23144191b), EConversationDebugInfo::Executing);
                    // Moving on.
                    Diego.AI.Say(LocText("INFO_DIEGO_EXIT_11_01"));
                    DC(int64(0x7fbf89a23144191b), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x7fbf89a23144191c), EConversationDebugInfo::Executing);
                    
                    // Take care.
                    Hero.AI.Say(LocText("INFO_DIEGO_EXIT_15_00"));
                    DC(int64(0x7fbf89a23144191c), EConversationDebugInfo::Done);
                }
                DC(int64(0x7fbf89a23144191d), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x7fbf89a23144191d), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceDiegoGamestart : UTopic_Hero__OC_STT_DIEGO
        {
            default DebugId = int64(0x7fbf89a231441906);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceDiegoGamestart);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x7fbf89a231441907), G1R != nullptr && !G1R.HasReachedChapter(2));
                }
                
                return G1R != nullptr && !G1R.HasReachedChapter(2);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7fbf89a231441908), EConversationDebugInfo::Executing);
                // Still alive? Good. I'm Diego.
                Diego.AI.Say(LocText("INFO_DIEGO_GAMESTART_11_00"));
                DC(int64(0x7fbf89a231441908), EConversationDebugInfo::Done);
                DC(int64(0x7fbf89a231441909), EConversationDebugInfo::Executing);
                
                // I'm-
                Hero.AI.Say(LocText("INFO_DIEGO_GAMESTART_15_01"));
                DC(int64(0x7fbf89a231441909), EConversationDebugInfo::Done);
                DC(int64(0x7fbf89a23144190a), EConversationDebugInfo::Executing);
                
                // I don't care who you are. You're a greenblood, and I'm ...
                Diego.AI.Say(LocText("INFO_DIEGO_GAMESTART_11_02"));
                DC(int64(0x7fbf89a23144190a), EConversationDebugInfo::Done);
                DC(int64(0x7fbf89a23144190b), EConversationDebugInfo::Executing);
                // Now, if you plan on staying alive in here, you should ...
                Diego.AI.Say(LocText("INFO_DIEGO_GAMESTART_11_03"));
                DC(int64(0x7fbf89a23144190b), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_STT_DIEGO, Document::UDocumentSegment_Glossary_OC_STT_DIEGO_Introduction);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_FIREMAGESLETTER, Document::UDocumentSegment_CH1_FIREMAGESLETTER_ContactHighMagician);
                DC(int64(0xd2dcebc57700d31e), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_FIREMAGESLETTER.StartQuest();
                DC(int64(0xd2dcebc57700d31e), EConversationDebugInfo::Done);
                DC(int64(0xf0b6d26a73399ae6), EConversationDebugInfo::Executing);
                G1R.InitialCharacterAssigment();
                DC(int64(0xf0b6d26a73399ae6), EConversationDebugInfo::Done);
                DC(int64(0x6259638677d672f7), EConversationDebugInfo::Executing);
                G1R.Diego_Welcome = FInGameTime::Now();
                DC(int64(0x6259638677d672f7), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDiegoIanpassword : UTopic_Hero__OC_STT_DIEGO
        {
            default DebugId = int64(0x7fbf89a23144199a);
            default Caption = LocText("INFO_DIEGO_IANPASSWORD_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceDiegoBringlistOffer);
            default Rules.HideIfKnows(UChoiceDiegoIanpassword);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x7fbf89a23144199b), Quest::OldCamp_OCCHAPTER1_BRINGLIST != nullptr && Quest::OldCamp_OCCHAPTER1_BRINGLIST.IsRunning());
                }
                
                return Quest::OldCamp_OCCHAPTER1_BRINGLIST != nullptr && Quest::OldCamp_OCCHAPTER1_BRINGLIST.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7fbf89a23144199c), EConversationDebugInfo::Executing);
                // What's this about "the crawlers look hungry?"
                Hero.AI.Say(LocText("INFO_DIEGO_IANPASSWORD_INFO_15_01"));
                DC(int64(0x7fbf89a23144199c), EConversationDebugInfo::Done);
                DC(int64(0x7fbf89a23144199d), EConversationDebugInfo::Executing);
                
                // Take your best guess.
                Diego.AI.Say(LocText("INFO_DIEGO_IANPASSWORD_INFO_11_02"));
                DC(int64(0x7fbf89a23144199d), EConversationDebugInfo::Done);
                DC(int64(0x7fbf89a23144199e), EConversationDebugInfo::Executing);
                
                // A countersign.
                Hero.AI.Say(LocText("INFO_DIEGO_IANPASSWORD_INFO_15_03"));
                DC(int64(0x7fbf89a23144199e), EConversationDebugInfo::Done);
                DC(int64(0xc118b368965f3188), EConversationDebugInfo::Executing);
                
                // You're smarter than you look.
                Diego.AI.Say(LocText("TEXT_NISEA_20240115_173738"));
                DC(int64(0xc118b368965f3188), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDiegoJoinanalyze : UTopic_Hero__OC_STT_DIEGO
        {
            default DebugId = int64(0x7fbf89a2314419b3);
            default Caption = LocText("INFO_DIEGO_JOINANALYZE_15_00");
            default PriorityRank = 4;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceDiegoRules);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x7fbf89a2314419b4), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                    DC(int64(0x7fbf89a2314419b5), EConversationDebugInfo::Unimplemented);
                    DB(int64(0x7fbf89a2314419b6), Quest::OldCamp_OCCHAPTER1_JOINOC != nullptr && Quest::OldCamp_OCCHAPTER1_JOINOC.IsRunning());
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None))
                    return false;
                
                if (/* Skip: is_equal_to */ false)
                    return false;
                
                if (Quest::OldCamp_OCCHAPTER1_JOINOC != nullptr && !Quest::OldCamp_OCCHAPTER1_JOINOC.IsRunning())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7fbf89a2314419b7), EConversationDebugInfo::Executing);
                
                // How is my reputation in the camp?
                Hero.AI.Say(LocText("INFO_DIEGO_JOINANALYZE_15_00"));
                DC(int64(0x7fbf89a2314419b7), EConversationDebugInfo::Done);
                DC(int64(0x7fbf89a2314419b8), EConversationDebugInfo::Executing);
                
                // Interesting you'd ask. I talked to some folk ...
                Diego.AI.Say(LocText("INFO_DIEGO_JOINANALYZE_11_01"));
                DC(int64(0x7fbf89a2314419b8), EConversationDebugInfo::Done);
                DC(int64(0x7fbf89a2314419b9), EConversationDebugInfo::Executing);
                
                // And?
                Hero.AI.Say(LocText("INFO_DIEGO_JOINANALYZE_15_02"));
                DC(int64(0x7fbf89a2314419b9), EConversationDebugInfo::Done);
                DC(int64(0x3324a0310d750154), EConversationDebugInfo::Executing);
                G1R.Points_OC = 0;
                DC(int64(0x3324a0310d750154), EConversationDebugInfo::Done);
                DB(int64(0x7fbf89a2314419bc), Quest::SCATTY_CHARGEKIRGO != nullptr && Quest::SCATTY_CHARGEKIRGO.HasSucceeded());
                DB(int64(0x7fbf89a2314419bf), Quest::SCATTY_CHARGEKIRGO != nullptr && Quest::SCATTY_CHARGEKIRGO.HasFailed());
                DB(int64(0x7fbf89a2314419c2), Quest::SCATTY_CHARGEKIRGO != nullptr && Quest::SCATTY_CHARGEKIRGO.IsRunning());
                
                if (Quest::SCATTY_CHARGEKIRGO != nullptr && Quest::SCATTY_CHARGEKIRGO.HasSucceeded())
                {
                    DC(int64(0x7fbf89a2314419bd), EConversationDebugInfo::Executing);
                    // Scatty told me you beat Kirgo.
                    Diego.AI.Say(LocText("INFO_DIEGO_JOINANALYZE_SCATTY_11_01"));
                    DC(int64(0x7fbf89a2314419bd), EConversationDebugInfo::Done);
                    DC(int64(0x3324a0310d750147), EConversationDebugInfo::Executing);
                    G1R.Points_OC += 2;
                    DC(int64(0x3324a0310d750147), EConversationDebugInfo::Done);
                }
                else if (Quest::SCATTY_CHARGEKIRGO != nullptr && Quest::SCATTY_CHARGEKIRGO.HasFailed())
                {
                    DC(int64(0x7fbf89a2314419c0), EConversationDebugInfo::Executing);
                    // Scatty told me you challenged Kirgo and lost. Didn't ...
                    Diego.AI.Say(LocText("INFO_DIEGO_JOINANALYZE_SCATTY_11_02"));
                    DC(int64(0x7fbf89a2314419c0), EConversationDebugInfo::Done);
                    DC(int64(0x3324a0310d75014b), EConversationDebugInfo::Executing);
                    G1R.Points_OC -= 1;
                    DC(int64(0x3324a0310d75014b), EConversationDebugInfo::Done);
                }
                else if (Quest::SCATTY_CHARGEKIRGO != nullptr && Quest::SCATTY_CHARGEKIRGO.IsRunning())
                {
                    DC(int64(0x7fbf89a2314419c3), EConversationDebugInfo::Executing);
                    // Scatty said you challenged Kirgo, and that he's curious ...
                    Diego.AI.Say(LocText("INFO_DIEGO_JOINANALYZE_SCATTY_11_03"));
                    DC(int64(0x7fbf89a2314419c3), EConversationDebugInfo::Done);
                }
                DB(int64(0x7fbf89a2314419c5), Quest::SCATTY_CHARGEKHARIM != nullptr && Quest::SCATTY_CHARGEKHARIM.HasFailed());
                DB(int64(0x7fbf89a2314419c8), Quest::SCATTY_CHARGEKHARIM != nullptr && Quest::SCATTY_CHARGEKHARIM.HasSucceeded());
                DB(int64(0x7fbf89a2314419cb), Quest::SCATTY_CHARGEKHARIM != nullptr && Quest::SCATTY_CHARGEKHARIM.IsRunning());
                
                if (Quest::SCATTY_CHARGEKHARIM != nullptr && Quest::SCATTY_CHARGEKHARIM.HasFailed())
                {
                    DC(int64(0x7fbf89a2314419c6), EConversationDebugInfo::Executing);
                    // That you had the balls to take on Kharim impressed him - ...
                    Diego.AI.Say(LocText("INFO_DIEGO_JOINANALYZE_SCATTY_11_04"));
                    DC(int64(0x7fbf89a2314419c6), EConversationDebugInfo::Done);
                    DC(int64(0x3324a0310d750138), EConversationDebugInfo::Executing);
                    G1R.Points_OC += 2;
                    DC(int64(0x3324a0310d750138), EConversationDebugInfo::Done);
                }
                else if (Quest::SCATTY_CHARGEKHARIM != nullptr && Quest::SCATTY_CHARGEKHARIM.HasSucceeded())
                {
                    DC(int64(0x7fbf89a2314419c9), EConversationDebugInfo::Executing);
                    // That you took down Kharim completely blew his mind - he ...
                    Diego.AI.Say(LocText("INFO_DIEGO_JOINANALYZE_SCATTY_11_05"));
                    DC(int64(0x7fbf89a2314419c9), EConversationDebugInfo::Done);
                    DC(int64(0x3324a0310d75013c), EConversationDebugInfo::Executing);
                    G1R.Points_OC += 5;
                    DC(int64(0x3324a0310d75013c), EConversationDebugInfo::Done);
                }
                else if (Quest::SCATTY_CHARGEKHARIM != nullptr && Quest::SCATTY_CHARGEKHARIM.IsRunning())
                {
                    DC(int64(0x7fbf89a2314419cc), EConversationDebugInfo::Executing);
                    // And he said he was curious to see if you'd challenge ...
                    Diego.AI.Say(LocText("INFO_DIEGO_JOINANALYZE_SCATTY_11_06"));
                    DC(int64(0x7fbf89a2314419cc), EConversationDebugInfo::Done);
                }
                DB(int64(0x7fbf89a2314419ce), Quest::OldCamp_OCCHAPTER1_WHISTLER_BUYMYSWORD != nullptr && Quest::OldCamp_OCCHAPTER1_WHISTLER_BUYMYSWORD.HasSucceeded());
                DB(int64(0xc456dc2d6f89f683), Quest::OldCamp_OCCHAPTER1_WHISTLER_BUYMYSWORD != nullptr && Quest::OldCamp_OCCHAPTER1_WHISTLER_BUYMYSWORD.IsRunning());
                DB(int64(0xc456dc2d6f89f684), G1R.Whistler_BuyMySword_Day <= G1R.Calendar_TwoDaysAgo);
                DB(int64(0xc456dc2d6f89f682), Quest::OldCamp_OCCHAPTER1_WHISTLER_BUYMYSWORD != nullptr && Quest::OldCamp_OCCHAPTER1_WHISTLER_BUYMYSWORD.HasFailed());
                DB(int64(0xf0e0d5efbb3c0a2), G1R.Whistler_BuyMySword == 0);
                DB(int64(0x7fbf89a2314419d5), Quest::OldCamp_OCCHAPTER1_WHISTLER_BUYMYSWORD != nullptr && Quest::OldCamp_OCCHAPTER1_WHISTLER_BUYMYSWORD.IsRunning());
                
                if (Quest::OldCamp_OCCHAPTER1_WHISTLER_BUYMYSWORD != nullptr && Quest::OldCamp_OCCHAPTER1_WHISTLER_BUYMYSWORD.HasSucceeded())
                {
                    DC(int64(0x7fbf89a2314419cf), EConversationDebugInfo::Executing);
                    // Whistler told me about the thing with Fisk ... I don't ...
                    Diego.AI.Say(LocText("INFO_DIEGO_JOINANALYZE_WHISTLER_11_01"));
                    DC(int64(0x7fbf89a2314419cf), EConversationDebugInfo::Done);
                    DC(int64(0x3324a0310d750125), EConversationDebugInfo::Executing);
                    G1R.Points_OC += 3;
                    DC(int64(0x3324a0310d750125), EConversationDebugInfo::Done);
                }
                else if (((Quest::OldCamp_OCCHAPTER1_WHISTLER_BUYMYSWORD != nullptr && Quest::OldCamp_OCCHAPTER1_WHISTLER_BUYMYSWORD.IsRunning() && G1R.Whistler_BuyMySword_Day <= G1R.Calendar_TwoDaysAgo)) || ((Quest::OldCamp_OCCHAPTER1_WHISTLER_BUYMYSWORD != nullptr && Quest::OldCamp_OCCHAPTER1_WHISTLER_BUYMYSWORD.HasFailed() && G1R.Whistler_BuyMySword == 0)))
                {
                    DC(int64(0x7fbf89a2314419d3), EConversationDebugInfo::Executing);
                    // I've had a chat with Whistler, and he said you just took ...
                    Diego.AI.Say(LocText("INFO_DIEGO_JOINANALYZE_WHISTLER_11_02"));
                    DC(int64(0x7fbf89a2314419d3), EConversationDebugInfo::Done);
                    DC(int64(0x3324a0310d75012d), EConversationDebugInfo::Executing);
                    G1R.Points_OC += 2;
                    DC(int64(0x3324a0310d75012d), EConversationDebugInfo::Done);
                }
                else if (Quest::OldCamp_OCCHAPTER1_WHISTLER_BUYMYSWORD != nullptr && Quest::OldCamp_OCCHAPTER1_WHISTLER_BUYMYSWORD.IsRunning())
                {
                    DC(int64(0x7fbf89a2314419d6), EConversationDebugInfo::Executing);
                    // Whistler says he's still waiting for you to bring him ...
                    Diego.AI.Say(LocText("INFO_DIEGO_JOINANALYZE_WHISTLER_11_03"));
                    DC(int64(0x7fbf89a2314419d6), EConversationDebugInfo::Done);
                }
                DB(int64(0x7fbf89a2314419d8), Quest::OldCamp_OCCHAPTER1_LOSTNEK != nullptr && Quest::OldCamp_OCCHAPTER1_LOSTNEK.HasSucceeded());
                DB(int64(0x7fbf89a2314419db), Quest::OldCamp_OCCHAPTER1_LOSTNEK != nullptr && Quest::OldCamp_OCCHAPTER1_LOSTNEK.IsRunning());
                
                if (Quest::OldCamp_OCCHAPTER1_LOSTNEK != nullptr && Quest::OldCamp_OCCHAPTER1_LOSTNEK.HasSucceeded())
                {
                    DC(int64(0x7fbf89a2314419d9), EConversationDebugInfo::Executing);
                    // Sly said you found Nek, and he seemed pretty happy about ...
                    Diego.AI.Say(LocText("INFO_DIEGO_JOINANALYZE_SLY_11_01"));
                    DC(int64(0x7fbf89a2314419d9), EConversationDebugInfo::Done);
                    DC(int64(0x3324a0310d75011b), EConversationDebugInfo::Executing);
                    G1R.Points_OC += 4;
                    DC(int64(0x3324a0310d75011b), EConversationDebugInfo::Done);
                }
                else if (Quest::OldCamp_OCCHAPTER1_LOSTNEK != nullptr && Quest::OldCamp_OCCHAPTER1_LOSTNEK.IsRunning())
                {
                    DC(int64(0x7fbf89a2314419dc), EConversationDebugInfo::Executing);
                    // As for Sly, I think he's wrong about Nek - that man ...
                    Diego.AI.Say(LocText("INFO_DIEGO_JOINANALYZE_SLY_11_02"));
                    DC(int64(0x7fbf89a2314419dc), EConversationDebugInfo::Done);
                }
                DB(int64(0x7fbf89a2314419de), Quest::OldCamp_OCCHAPTER1_FINGERS_RING != nullptr && Quest::OldCamp_OCCHAPTER1_FINGERS_RING.IsRunning());
                DB(int64(0x7fbf89a2314419e0), Quest::OldCamp_OCCHAPTER1_FINGERS_RING != nullptr && Quest::OldCamp_OCCHAPTER1_FINGERS_RING.HasSucceeded());
                
                if (Quest::OldCamp_OCCHAPTER1_FINGERS_RING != nullptr && Quest::OldCamp_OCCHAPTER1_FINGERS_RING.IsRunning())
                {
                    DC(int64(0x7fbf89a2314419df), EConversationDebugInfo::Executing);
                    // I already told you about Fingers, right? He's our best ...
                    Diego.AI.Say(LocText("INFO_DIEGO_JOINANALYZE_FINGERS_11_01"));
                    DC(int64(0x7fbf89a2314419df), EConversationDebugInfo::Done);
                }
                else if (Quest::OldCamp_OCCHAPTER1_FINGERS_RING != nullptr && Quest::OldCamp_OCCHAPTER1_FINGERS_RING.HasSucceeded())
                {
                    DC(int64(0x7fbf89a2314419e1), EConversationDebugInfo::Executing);
                    // Fingers said you're useful, which usually means you've ...
                    Diego.AI.Say(LocText("INFO_DIEGO_JOINANALYZE_FINGERS_11_02"));
                    DC(int64(0x7fbf89a2314419e1), EConversationDebugInfo::Done);
                    DC(int64(0x3324a0310d750113), EConversationDebugInfo::Executing);
                    G1R.Points_OC += 3;
                    DC(int64(0x3324a0310d750113), EConversationDebugInfo::Done);
                }
                DB(int64(0x7fbf89a2314419e4), Quest::OldCamp_OCCHAPTER1_KALOMSRECIPE != nullptr && Quest::OldCamp_OCCHAPTER1_KALOMSRECIPE.IsRunning());
                DB(int64(0x7fbf89a2314419e7), Quest::OldCamp_OCCHAPTER1_KALOMSRECIPE != nullptr && Quest::OldCamp_OCCHAPTER1_KALOMSRECIPE.HasSucceeded());
                
                if (Quest::OldCamp_OCCHAPTER1_KALOMSRECIPE != nullptr && Quest::OldCamp_OCCHAPTER1_KALOMSRECIPE.IsRunning())
                {
                    DC(int64(0x7fbf89a2314419e5), EConversationDebugInfo::Executing);
                    // As for Dexter, I'll have to have a word with him soon. ...
                    Diego.AI.Say(LocText("INFO_DIEGO_JOINANALYZE_DEXTER_11_01"));
                    DC(int64(0x7fbf89a2314419e5), EConversationDebugInfo::Done);
                    DC(int64(0x7fbf89a2314419e6), EConversationDebugInfo::Executing);
                    // Then again, it's not like there's rules. If you manage ...
                    Diego.AI.Say(LocText("INFO_DIEGO_JOINANALYZE_DEXTER_11_02"));
                    DC(int64(0x7fbf89a2314419e6), EConversationDebugInfo::Done);
                }
                else if (Quest::OldCamp_OCCHAPTER1_KALOMSRECIPE != nullptr && Quest::OldCamp_OCCHAPTER1_KALOMSRECIPE.HasSucceeded())
                {
                    DC(int64(0x7fbf89a2314419e8), EConversationDebugInfo::Executing);
                    // As for Dexter, he was over the moon because you managed ...
                    Diego.AI.Say(LocText("INFO_DIEGO_JOINANALYZE_DEXTER_11_03"));
                    DC(int64(0x7fbf89a2314419e8), EConversationDebugInfo::Done);
                    DC(int64(0x3324a0310d750109), EConversationDebugInfo::Executing);
                    G1R.Points_OC += 5;
                    DC(int64(0x3324a0310d750109), EConversationDebugInfo::Done);
                }
                DB(int64(0x7fbf89a2314419eb), Quest::OldCamp_OCCHAPTER1_MORDRAGKO != nullptr && Quest::OldCamp_OCCHAPTER1_MORDRAGKO.IsRunning());
                DB(int64(0x7fbf89a2314419ed), Quest::OldCamp_OCCHAPTER1_MORDRAGKO != nullptr && Quest::OldCamp_OCCHAPTER1_MORDRAGKO.HasSucceeded());
                
                if (Quest::OldCamp_OCCHAPTER1_MORDRAGKO != nullptr && Quest::OldCamp_OCCHAPTER1_MORDRAGKO.IsRunning())
                {
                    DC(int64(0x7fbf89a2314419ec), EConversationDebugInfo::Executing);
                    // About the Mordrag business. I hope you know what you're ...
                    Diego.AI.Say(LocText("INFO_DIEGO_JOINANALYZE_THORUS_11_01"));
                    DC(int64(0x7fbf89a2314419ec), EConversationDebugInfo::Done);
                }
                else if (Quest::OldCamp_OCCHAPTER1_MORDRAGKO != nullptr && Quest::OldCamp_OCCHAPTER1_MORDRAGKO.HasSucceeded())
                {
                    DC(int64(0x7fbf89a2314419ee), EConversationDebugInfo::Executing);
                    // About Thorus. He said we could use a man like you - let ...
                    Diego.AI.Say(LocText("INFO_DIEGO_JOINANALYZE_THORUS_11_02"));
                    DC(int64(0x7fbf89a2314419ee), EConversationDebugInfo::Done);
                    DC(int64(0x3324a0310d7500ea), EConversationDebugInfo::Executing);
                    G1R.Points_OC += 5;
                    DC(int64(0x3324a0310d7500ea), EConversationDebugInfo::Done);
                }
                else
                {
                    DB(int64(0x7fbf89a2314419f1), Quest::OldCamp_OCCHAPTER1_MORDRAGKO != nullptr && Quest::OldCamp_OCCHAPTER1_MORDRAGKO.HasFailed());
                    
                    if (Quest::OldCamp_OCCHAPTER1_MORDRAGKO != nullptr && Quest::OldCamp_OCCHAPTER1_MORDRAGKO.HasFailed())
                    {
                        DC(int64(0x7fbf89a2314419f2), EConversationDebugInfo::Executing);
                        // Thorus almost lost his mind about that Mordrag business ...
                        Diego.AI.Say(LocText("INFO_DIEGO_JOINANALYZE_THORUS_11_03"));
                        DC(int64(0x7fbf89a2314419f2), EConversationDebugInfo::Done);
                        DC(int64(0x3324a0310d7500fc), EConversationDebugInfo::Executing);
                        G1R.Points_OC -= 5;
                        DC(int64(0x3324a0310d7500fc), EConversationDebugInfo::Done);
                    }
                    DB(int64(0x7fbf89a2314419f5), Quest::OldCamp_OCCHAPTER1_FISKNEWDEALER != nullptr && Quest::OldCamp_OCCHAPTER1_FISKNEWDEALER.HasSucceeded());
                    DB(int64(0xc456dc2d6f89f6ab), G1R.MordragKO_StayAtNC != 0);
                    DB(int64(0xc456dc2d6f89f6aa), G1R.MordragKO_Exiled != 0);
                    
                    if (Quest::OldCamp_OCCHAPTER1_FISKNEWDEALER != nullptr && Quest::OldCamp_OCCHAPTER1_FISKNEWDEALER.HasSucceeded())
                    {
                        DC(int64(0x7fbf89a2314419f6), EConversationDebugInfo::Executing);
                        // Last but not least, Fisk said you "surprised him," and ...
                        Diego.AI.Say(LocText("INFO_DIEGO_JOINANALYZE_FISK_11_01"));
                        DC(int64(0x7fbf89a2314419f6), EConversationDebugInfo::Done);
                        DC(int64(0x3324a0310d7500ef), EConversationDebugInfo::Executing);
                        G1R.Points_OC += 5;
                        DC(int64(0x3324a0310d7500ef), EConversationDebugInfo::Done);
                    }
                    else if ((G1R.MordragKO_StayAtNC != 0) || (G1R.MordragKO_Exiled != 0))
                    {
                        DC(int64(0x7fbf89a2314419f9), EConversationDebugInfo::Executing);
                        // Last but not least, Fisk said you're an idiot. I'm ...
                        Diego.AI.Say(LocText("INFO_DIEGO_JOINANALYZE_FISK_11_02"));
                        DC(int64(0x7fbf89a2314419f9), EConversationDebugInfo::Done);
                    }
                }
                DB(int64(0x7fbf89a2314419fb), G1R.Points_OC > 15);
                DB(int64(0x7fbf89a231441a05), G1R.Points_OC > 10);
                DB(int64(0x7fbf89a231441a07), G1R.Points_OC >= 0);
                
                if (G1R.Points_OC > 15)
                {
                    DC(int64(0x7fbf89a2314419fc), EConversationDebugInfo::Executing);
                    // All in all, good job. You left a lasting impression.
                    Diego.AI.Say(LocText("INFO_DIEGO_POINTS_11_00"));
                    DC(int64(0x7fbf89a2314419fc), EConversationDebugInfo::Done);
                    DC(int64(0xd2dcebc57700d795), EConversationDebugInfo::Executing);
                    Quest::OldCamp_OCCHAPTER1_BROWNIEPOINTS_BROWNIEPOINTS_OBJ_START.SucceedQuest();
                    DC(int64(0xd2dcebc57700d795), EConversationDebugInfo::Done);
                    DC(int64(0xd2dcebc57700d7b1), EConversationDebugInfo::Executing);
                    Quest::OldCamp_OCCHAPTER1_JOINOC_JOINOC_OBJ_BROWNIEPOINTS.SucceedQuest();
                    DC(int64(0xd2dcebc57700d7b1), EConversationDebugInfo::Done);
                    DB(int64(0x7fbf89a2314419fe), Hero.GetLevelAttribute() >= 5);
                    
                    if (Hero.GetLevelAttribute() >= 5)
                    {
                        DC(int64(0xd2dcebc57700d9de), EConversationDebugInfo::Executing);
                        Quest::OldCamp_OCCHAPTER1_JOINOC_JOINOC_OBJ_IMPROVESKILLS.SucceedQuest();
                        DC(int64(0xd2dcebc57700d9de), EConversationDebugInfo::Done);
                        DB(int64(0x7fbf89a231441a00), Quest::OldCamp_OCCHAPTER1_BRINGLIST != nullptr && Quest::OldCamp_OCCHAPTER1_BRINGLIST.HasSucceeded());
                        
                        if (Quest::OldCamp_OCCHAPTER1_BRINGLIST != nullptr && Quest::OldCamp_OCCHAPTER1_BRINGLIST.HasSucceeded())
                        {
                            DC(int64(0x7fbf89a231441a01), EConversationDebugInfo::Executing);
                            // Seeing as you also passed MY test, that's enough for me. ...
                            Diego.AI.Say(LocText("INFO_DIEGO_POINTS_11_01"));
                            DC(int64(0x7fbf89a231441a01), EConversationDebugInfo::Done);
                            GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_JOINOC, Document::UDocumentSegment_CH1_JOINOC_TestCompleted);
                            DC(int64(0x3324a0310d7500d4), EConversationDebugInfo::Executing);
                            G1R.Diego_GomezAudience = 1;
                            DC(int64(0x3324a0310d7500d4), EConversationDebugInfo::Done);
                            DC(int64(0xa0c47c1e219584ba), EConversationDebugInfo::Executing);
                            Quest::OldCamp_OCCHAPTER1_JOINOC_JOINOC_OBJ_THORUS.StartQuest();
                            DC(int64(0xa0c47c1e219584ba), EConversationDebugInfo::Done);
                            DC(int64(0xb6fdc1a34e3fbd97), EConversationDebugInfo::Executing);
                            if (ensure(IsValid(Dexter))) { Dexter.RemoveImmortality(); }
                            DC(int64(0xb6fdc1a34e3fbd97), EConversationDebugInfo::Done);
                            DC(int64(0xb6fdc1a34e3fbd99), EConversationDebugInfo::Executing);
                            if (ensure(IsValid(Fisk))) { Fisk.RemoveImmortality(); }
                            DC(int64(0xb6fdc1a34e3fbd99), EConversationDebugInfo::Done);
                            DC(int64(0xb6fdc1a34e3fbd9b), EConversationDebugInfo::Executing);
                            if (ensure(IsValid(Fingers))) { Fingers.RemoveImmortality(); }
                            DC(int64(0xb6fdc1a34e3fbd9b), EConversationDebugInfo::Done);
                            DC(int64(0xb6fdc1a34e3fbd9d), EConversationDebugInfo::Executing);
                            if (ensure(IsValid(Sly))) { Sly.RemoveImmortality(); }
                            DC(int64(0xb6fdc1a34e3fbd9d), EConversationDebugInfo::Done);
                            DC(int64(0xb6fdc1a34e3fbd9f), EConversationDebugInfo::Executing);
                            if (ensure(IsValid(Whistler))) { Whistler.RemoveImmortality(); }
                            DC(int64(0xb6fdc1a34e3fbd9f), EConversationDebugInfo::Done);
                            
                            Other.Remember(n"choice_diego_joinanalyze_exit_1");
                            DC(int64(0x6066189395a592bc), EConversationDebugInfo::Executing);
                            EndConversation();
                            DC(int64(0x6066189395a592bc), EConversationDebugInfo::Done);
                            return;
                        }
                        else
                        {
                            DC(int64(0x7fbf89a231441a04), EConversationDebugInfo::Executing);
                            // You have yet to pass my own little trial of trust, ...
                            Diego.AI.Say(LocText("INFO_DIEGO_POINTS_11_02"));
                            DC(int64(0x7fbf89a231441a04), EConversationDebugInfo::Done);
                            DC(int64(0xa4063e7d28ef58e0), EConversationDebugInfo::Executing);
                            // Take care of that. Then we'll talk further.
                            Diego.AI.Say(LocText("TEXT_WIP_ODMVSBC_20240917_184922"));
                            DC(int64(0xa4063e7d28ef58e0), EConversationDebugInfo::Done);
                            
                            Other.Remember(n"choice_diego_joinanalyze_exit_2");
                        }
                    }
                    else
                    {
                        DC(int64(0x854186345996251a), EConversationDebugInfo::Executing);
                        // That said, you're still a bit green behind the ears to ...
                        Diego.AI.Say(LocText("TEXT_DDIAZ_20221122_171752_41"));
                        DC(int64(0x854186345996251a), EConversationDebugInfo::Done);
                        DC(int64(0x8e70368ac0328c34), EConversationDebugInfo::Executing);
                        
                        // How do I fix that? 
                        Hero.AI.Say(LocText("TEXT_WIP_BGXCIAC_20240905_191312"));
                        DC(int64(0x8e70368ac0328c34), EConversationDebugInfo::Done);
                        DC(int64(0x8e70368ac0328c33), EConversationDebugInfo::Executing);
                        
                        // What do you think? By getting some more experience. Go ...
                        Diego.AI.Say(LocText("TEXT_WIP_BGXCIAC_20240905_191234"));
                        DC(int64(0x8e70368ac0328c33), EConversationDebugInfo::Done);
                        DC(int64(0x8e70368ac0328c35), EConversationDebugInfo::Executing);
                        // Then we'll talk. 
                        Diego.AI.Say(LocText("TEXT_WIP_BGXCIAC_20240905_191330"));
                        DC(int64(0x8e70368ac0328c35), EConversationDebugInfo::Done);
                        DC(int64(0xd2dcebc57700d9ce), EConversationDebugInfo::Executing);
                        Quest::OldCamp_OCCHAPTER1_JOINOC_JOINOC_OBJ_IMPROVESKILLS.StartQuest();
                        DC(int64(0xd2dcebc57700d9ce), EConversationDebugInfo::Done);
                        
                        Other.Remember(n"choice_diego_joinanalyze_exit_3");
                    }
                }
                else if (G1R.Points_OC > 10)
                {
                    DC(int64(0x7fbf89a231441a06), EConversationDebugInfo::Executing);
                    // All in all, not bad for a freshie. But you'll need more.
                    Diego.AI.Say(LocText("INFO_DIEGO_POINTS_11_10"));
                    DC(int64(0x7fbf89a231441a06), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_diego_joinanalyze_exit_4");
                }
                else if (G1R.Points_OC >= 0)
                {
                    DC(int64(0x7fbf89a231441a08), EConversationDebugInfo::Executing);
                    // That's it, I think. Keep at it: you'll have to try ...
                    Diego.AI.Say(LocText("INFO_DIEGO_POINTS_11_20"));
                    DC(int64(0x7fbf89a231441a08), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_diego_joinanalyze_exit_5");
                }
                else
                {
                    
                    Other.Remember(n"choice_diego_joinanalyze_exit_6");
                }
            }
        }
        
        
        class UChoiceDiegoJoinoldcamp : UTopic_Hero__OC_STT_DIEGO
        {
            default DebugId = int64(0x7fbf89a23144195a);
            default Caption = LocText("INFO_DIEGO_JOINOLDCAMP_15_00");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceDiegoWhosgomez);
            default Rules.HideIfKnows(UChoiceDiegoJoinoldcamp);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x7fbf89a23144195c), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                }
                
                return Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7fbf89a23144195e), EConversationDebugInfo::Executing);
                // Say I want to join Gomez and his guys. What do I do?
                Hero.AI.Say(LocText("INFO_DIEGO_JOINOLDCAMP_15_00"));
                DC(int64(0x7fbf89a23144195e), EConversationDebugInfo::Done);
                DC(int64(0x7fbf89a23144195f), EConversationDebugInfo::Executing);
                
                // Talk to the warder at the castle entrance - Thorus, ...
                Diego.AI.Say(LocText("INFO_DIEGO_JOINOLDCAMP_11_01"));
                DC(int64(0x7fbf89a23144195f), EConversationDebugInfo::Done);
                DC(int64(0x3232d7843c92b65c), EConversationDebugInfo::Executing);
                
                // And then what? 
                Hero.AI.Say(LocText("TEXT_WIP_UFXCIAC_20240902_205306"));
                DC(int64(0x3232d7843c92b65c), EConversationDebugInfo::Done);
                DC(int64(0x3232d7843c92b65d), EConversationDebugInfo::Executing);
                
                // You'll figure it out. 
                Diego.AI.Say(LocText("TEXT_WIP_UFXCIAC_20240902_205309"));
                DC(int64(0x3232d7843c92b65d), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_JOINOC, Document::UDocumentSegment_CH1_JOINOC_VisitThorus);
                DC(int64(0x3de4b50cc6c61f11), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_JOINOC.StartQuest();
                DC(int64(0x3de4b50cc6c61f11), EConversationDebugInfo::Done);
                DC(int64(0xd2dcebc57700d2fb), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_JOINOC_JOINOC_OBJ_HOWTOACCESS.StartQuest();
                DC(int64(0xd2dcebc57700d2fb), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDiegoKolonie : UTopic_Hero__OC_STT_DIEGO
        {
            default DebugId = int64(0x7fbf89a231441937);
            default Caption = LocText("INFO_DIEGO_KOLONIE_15_00");
            default PriorityRank = 1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x7fbf89a231441938), G1R != nullptr && !G1R.HasReachedChapter(2));
                    DB(int64(0x8acd7a0e1fe8c497), Hero != nullptr && !Hero.HasSaid(LocText("INFO_DIEGO_OTHERCAMPS_15_00")));
                    DB(int64(0x7fbf89a231441938), G1R != nullptr && !G1R.HasReachedChapter(2));
                    DB(int64(0x8acd7a0e1fe8c497), Hero != nullptr && !Hero.HasSaid(LocText("INFO_DIEGO_BARRIERE_15_00")));
                    DB(int64(0x7fbf89a231441938), G1R != nullptr && !G1R.HasReachedChapter(2));
                    DB(int64(0x8acd7a0e1fe8c497), Hero != nullptr && !Hero.HasSaid(LocText("INFO_DIEGO_OLDCAMP_15_00")));
                }
                
                if (G1R != nullptr && !G1R.HasReachedChapter(2) && Hero != nullptr && !Hero.HasSaid(LocText("INFO_DIEGO_OTHERCAMPS_15_00")))
                    return true;
                
                if (G1R != nullptr && !G1R.HasReachedChapter(2) && Hero != nullptr && !Hero.HasSaid(LocText("INFO_DIEGO_BARRIERE_15_00")))
                    return true;
                
                if (G1R != nullptr && !G1R.HasReachedChapter(2) && Hero != nullptr && !Hero.HasSaid(LocText("INFO_DIEGO_OLDCAMP_15_00")))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7fbf89a231441939), EConversationDebugInfo::Executing);
                // What do I need to know about this place?
                Hero.AI.Say(LocText("INFO_DIEGO_KOLONIE_15_00"));
                DC(int64(0x7fbf89a231441939), EConversationDebugInfo::Done);
                DB(int64(0x96db9efef60ceb8b), Hero != nullptr && !Hero.HasListenedTo(LocText("INFO_DIEGO_KOLONIE_11_01")));
                
                if (Hero != nullptr && !Hero.HasListenedTo(LocText("INFO_DIEGO_KOLONIE_11_01")))
                {
                    DC(int64(0x7fbf89a23144193a), EConversationDebugInfo::Executing);
                    // We call it the Colony. We mine ore for King Rhobar, but ...
                    Diego.AI.Say(LocText("INFO_DIEGO_KOLONIE_11_01"));
                    DC(int64(0x7fbf89a23144193a), EConversationDebugInfo::Done);
                    DC(int64(0x7fbf89a23144193b), EConversationDebugInfo::Executing);
                    // Well, at least us from the Old Camp do.
                    Diego.AI.Say(LocText("INFO_DIEGO_KOLONIE_11_02"));
                    DC(int64(0x7fbf89a23144193b), EConversationDebugInfo::Done);
                    DC(int64(0xd09622315c8780a1), EConversationDebugInfo::Executing);
                    
                    // "Old Camp?"
                    Hero.AI.Say(LocText("TEXT_WIP_UFXCIAC_20240902_101900"));
                    DC(int64(0xd09622315c8780a1), EConversationDebugInfo::Done);
                    DC(int64(0x7fbf89a23144193c), EConversationDebugInfo::Executing);
                    
                    // Yes. There are three camps inside the barrier: the old ...
                    Diego.AI.Say(LocText("INFO_DIEGO_KOLONIE_11_03"));
                    DC(int64(0x7fbf89a23144193c), EConversationDebugInfo::Done);
                }
                Subdialog(
                    UTopic_Diego_209799,
                    UTopic_Diego_209819,
                    UTopic_Diego_209887,
                    UTopic_Diego_420206
                );
            }
        }
        
        
        class UTopic_Diego_209799 : UTopic_Hero__OC_STT_DIEGO
        {
            default DebugId = int64(0x96db9efef60ceb9f);
            default Caption = LocText("INFO_DIEGO_OTHERCAMPS_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Diego_209799);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x7fbf89a231441947), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                }
                
                return Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7fbf89a231441948), EConversationDebugInfo::Executing);
                // Tell me about the other camps. 
                Hero.AI.Say(LocText("INFO_DIEGO_OTHERCAMPS_15_00"));
                DC(int64(0x7fbf89a231441948), EConversationDebugInfo::Done);
                DC(int64(0x7fbf89a231441949), EConversationDebugInfo::Executing);
                
                // They split from the Old Camp to pursue their stupid ...
                Diego.AI.Say(LocText("INFO_DIEGO_OTHERCAMPS_11_01"));
                DC(int64(0x7fbf89a231441949), EConversationDebugInfo::Done);
                DC(int64(0x7fbf89a23144194a), EConversationDebugInfo::Executing);
                // The New Campers, for example, work with the Water Mages ...
                Diego.AI.Say(LocText("INFO_DIEGO_OTHERCAMPS_11_02"));
                DC(int64(0x7fbf89a23144194a), EConversationDebugInfo::Done);
                DC(int64(0xd09622315c8780ba), EConversationDebugInfo::Executing);
                
                // And that other camp?
                Hero.AI.Say(LocText("TEXT_WIP_UFXCIAC_20240902_102739"));
                DC(int64(0xd09622315c8780ba), EConversationDebugInfo::Done);
                DC(int64(0x7fbf89a23144194b), EConversationDebugInfo::Executing);
                
                // That would be the Swamp Camp. We call them the "Loons" ...
                Diego.AI.Say(LocText("INFO_DIEGO_OTHERCAMPS_11_03"));
                DC(int64(0x7fbf89a23144194b), EConversationDebugInfo::Done);
                DC(int64(0x7fbf89a23144194c), EConversationDebugInfo::Executing);
                // So far, he's been rather quiet.
                Diego.AI.Say(LocText("INFO_DIEGO_OTHERCAMPS_11_04"));
                DC(int64(0x7fbf89a23144194c), EConversationDebugInfo::Done);
                DC(int64(0x7fbf89a23144194d), EConversationDebugInfo::Executing);
                // Honestly, don't waste your time with these fools. The ...
                Diego.AI.Say(LocText("INFO_DIEGO_OTHERCAMPS_11_05"));
                DC(int64(0x7fbf89a23144194d), EConversationDebugInfo::Done);
                DC(int64(0x96db9efef60ced0c), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x96db9efef60ced0c), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Diego_209819 : UTopic_Hero__OC_STT_DIEGO
        {
            default DebugId = int64(0x96db9efef60ceba3);
            default Caption = LocText("INFO_DIEGO_BARRIERE_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Diego_209819);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7fbf89a23144193f), EConversationDebugInfo::Executing);
                // What can you tell me about the Barrier? 
                Hero.AI.Say(LocText("INFO_DIEGO_BARRIERE_15_00"));
                DC(int64(0x7fbf89a23144193f), EConversationDebugInfo::Done);
                DC(int64(0x7fbf89a231441940), EConversationDebugInfo::Executing);
                
                // Other than that there's no getting through? Not much.
                Diego.AI.Say(LocText("INFO_DIEGO_BARRIERE_11_01"));
                DC(int64(0x7fbf89a231441940), EConversationDebugInfo::Done);
                DC(int64(0x7fbf89a231441941), EConversationDebugInfo::Executing);
                
                // What would happen if I tried to walk out of here? 
                Hero.AI.Say(LocText("INFO_DIEGO_BARRIERE_15_02"));
                DC(int64(0x7fbf89a231441941), EConversationDebugInfo::Done);
                DC(int64(0x7fbf89a231441942), EConversationDebugInfo::Executing);
                
                // The same that happened to the last fool who had that ...
                Diego.AI.Say(LocText("INFO_DIEGO_BARRIERE_11_03"));
                DC(int64(0x7fbf89a231441942), EConversationDebugInfo::Done);
                DC(int64(0xd09622315c8780bb), EConversationDebugInfo::Executing);
                // Everything gets in, but nothing that lives goes out ...
                Diego.AI.Say(LocText("TEXT_WIP_UFXCIAC_20240902_105226"));
                DC(int64(0xd09622315c8780bb), EConversationDebugInfo::Done);
                DC(int64(0x7fbf89a231441943), EConversationDebugInfo::Executing);
                
                // If there's a way out of here, I'll find it.
                Hero.AI.Say(LocText("INFO_DIEGO_BARRIERE_15_04"));
                DC(int64(0x7fbf89a231441943), EConversationDebugInfo::Done);
                DC(int64(0x7fbf89a231441944), EConversationDebugInfo::Executing);
                
                // So eager to get out of here, huh? And you only just got ...
                Diego.AI.Say(LocText("INFO_DIEGO_BARRIERE_11_05"));
                DC(int64(0x7fbf89a231441944), EConversationDebugInfo::Done);
                DC(int64(0x96db9efef60ced13), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x96db9efef60ced13), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Diego_209887 : UTopic_Hero__OC_STT_DIEGO
        {
            default DebugId = int64(0x96db9efef60cec70);
            default Caption = LocText("INFO_DIEGO_OLDCAMP_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Diego_209887);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7fbf89a231441950), EConversationDebugInfo::Executing);
                // Tell me more about the Old Camp. 
                Hero.AI.Say(LocText("INFO_DIEGO_OLDCAMP_15_00"));
                DC(int64(0x7fbf89a231441950), EConversationDebugInfo::Done);
                DC(int64(0x7fbf89a231441951), EConversationDebugInfo::Executing);
                
                // We control the biggest mine in the valley.
                Diego.AI.Say(LocText("INFO_DIEGO_OLDCAMP_11_01"));
                DC(int64(0x7fbf89a231441951), EConversationDebugInfo::Done);
                DC(int64(0xd09622315c8780bc), EConversationDebugInfo::Executing);
                // That makes us, or rather, our leader Gomez, the biggest ...
                Diego.AI.Say(LocText("TEXT_WIP_UFXCIAC_20240902_105744"));
                DC(int64(0xd09622315c8780bc), EConversationDebugInfo::Done);
                DC(int64(0x7fbf89a231441952), EConversationDebugInfo::Executing);
                // Once a month, we send the king a big fat shipment, and ...
                Diego.AI.Say(LocText("INFO_DIEGO_OLDCAMP_11_02"));
                DC(int64(0x7fbf89a231441952), EConversationDebugInfo::Done);
                DC(int64(0xd09622315c8780bd), EConversationDebugInfo::Executing);
                
                // And he's okay with that?
                Hero.AI.Say(LocText("TEXT_WIP_UFXCIAC_20240902_105933"));
                DC(int64(0xd09622315c8780bd), EConversationDebugInfo::Done);
                DC(int64(0xd09622315c8780be), EConversationDebugInfo::Executing);
                
                // What's he gonna do, send his army into a dome it would ...
                Diego.AI.Say(LocText("TEXT_WIP_UFXCIAC_20240902_105951"));
                DC(int64(0xd09622315c8780be), EConversationDebugInfo::Done);
                DC(int64(0xd09622315c8780bf), EConversationDebugInfo::Executing);
                // We have him by the balls, and he knows it. 
                Diego.AI.Say(LocText("TEXT_WIP_UFXCIAC_20240902_110230"));
                DC(int64(0xd09622315c8780bf), EConversationDebugInfo::Done);
                DB(int64(0x7fbf89a231441955), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None))
                {
                    DC(int64(0x7fbf89a231441956), EConversationDebugInfo::Executing);
                    // You can get your piece of the cake, too. All you have to ...
                    Diego.AI.Say(LocText("INFO_DIEGO_OLDCAMP_11_04"));
                    DC(int64(0x7fbf89a231441956), EConversationDebugInfo::Done);
                    DC(int64(0x96db9efef60ced27), EConversationDebugInfo::Executing);
                    ReturnToLastSelection(1);
                    DC(int64(0x96db9efef60ced27), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x96db9efef60ced20), EConversationDebugInfo::Executing);
                    ReturnToLastSelection(1);
                    DC(int64(0x96db9efef60ced20), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UTopic_Diego_420206 : UTopic_Hero__OC_STT_DIEGO
        {
            default DebugId = int64(0xbe4f972d26e9f061);
            default Caption = LocText("TEXT_BACK");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                
            }
        }
        
        
        class UChoiceDiegoMaptooldmine : UTopic_Hero__OC_STT_DIEGO
        {
            default DebugId = int64(0x7fbf89a23144199f);
            default Caption = LocText("INFO_DIEGO_MAPTOOLDMINE_INFO_15_00");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceDiegoBringlistOffer);
            default Rules.HideIfKnows(UChoiceDiegoMaptooldmine);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x7fbf89a2314419a0), Quest::OldCamp_OCCHAPTER1_BRINGLIST != nullptr && Quest::OldCamp_OCCHAPTER1_BRINGLIST.IsRunning());
                }
                
                return Quest::OldCamp_OCCHAPTER1_BRINGLIST != nullptr && Quest::OldCamp_OCCHAPTER1_BRINGLIST.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7fbf89a2314419a1), EConversationDebugInfo::Executing);
                // How do I get to the Old Mine?
                Hero.AI.Say(LocText("INFO_DIEGO_MAPTOOLDMINE_INFO_15_00"));
                DC(int64(0x7fbf89a2314419a1), EConversationDebugInfo::Done);
                DC(int64(0x7fbf89a2314419a2), EConversationDebugInfo::Executing);
                
                // It's not far. Go find Graham, our cartographer, and tell ...
                Diego.AI.Say(LocText("INFO_DIEGO_MAPTOOLDMINE_INFO_11_01"));
                DC(int64(0x7fbf89a2314419a2), EConversationDebugInfo::Done);
                DC(int64(0x7fbf89a2314419a3), EConversationDebugInfo::Executing);
                // His shack is right beside the north gate.
                Diego.AI.Say(LocText("INFO_DIEGO_MAPTOOLDMINE_INFO_11_02"));
                DC(int64(0x7fbf89a2314419a3), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_VLK_GRAHAM, Document::UDocumentSegment_Glossary_OC_VLK_GRAHAM_MapMaker);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_BRINGLIST, Document::UDocumentSegment_CH1_BRINGLIST_Map);
                DC(int64(0xf4c881922ff2d112), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_BRINGLIST_BRINGLIST_OBJ_MAP.StartQuest();
                DC(int64(0xf4c881922ff2d112), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDiegoRules : UTopic_Hero__OC_STT_DIEGO
        {
            default DebugId = int64(0x7fbf89a231441972);
            default Caption = LocText("INFO_DIEGO_RULES_15_00");
            default PriorityRank = 4;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceDiegoThorussays);
            default Rules.HideIfKnows(UChoiceDiegoRules);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x7fbf89a231441973), Quest::OldCamp_OCCHAPTER1_JOINOC != nullptr && Quest::OldCamp_OCCHAPTER1_JOINOC.IsRunning());
                }
                
                return Quest::OldCamp_OCCHAPTER1_JOINOC != nullptr && Quest::OldCamp_OCCHAPTER1_JOINOC.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7fbf89a231441974), EConversationDebugInfo::Executing);
                // Give me the rundown. How do I convince you?
                Hero.AI.Say(LocText("INFO_DIEGO_RULES_15_00"));
                DC(int64(0x7fbf89a231441974), EConversationDebugInfo::Done);
                DC(int64(0x7fbf89a231441975), EConversationDebugInfo::Executing);
                
                // Easy: you have to prove that you're worth your salt.
                Diego.AI.Say(LocText("INFO_DIEGO_RULES_11_01"));
                DC(int64(0x7fbf89a231441975), EConversationDebugInfo::Done);
                DC(int64(0x7fbf89a231441976), EConversationDebugInfo::Executing);
                // There are some key figures here in the Outer Ring - most ...
                Diego.AI.Say(LocText("INFO_DIEGO_RULES_11_02"));
                DC(int64(0x7fbf89a231441976), EConversationDebugInfo::Done);
                DC(int64(0x7fbf89a231441977), EConversationDebugInfo::Executing);
                // Once you've done that, I have my own test for you.
                Diego.AI.Say(LocText("INFO_DIEGO_RULES_11_03"));
                DC(int64(0x7fbf89a231441977), EConversationDebugInfo::Done);
                DC(int64(0x7fbf89a231441978), EConversationDebugInfo::Executing);
                // Oh, and lastly: learn some skills. The more you know, ...
                Diego.AI.Say(LocText("INFO_DIEGO_RULES_11_04"));
                DC(int64(0x7fbf89a231441978), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_JOINOC, Document::UDocumentSegment_CH1_JOINOC_BrowniePoints);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_BROWNIEPOINTS, Document::UDocumentSegment_CH1_BROWNIEPOINTS_Introduction);
                DC(int64(0xd2dcebc57700d744), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_JOINOC_JOINOC_OBJ_HOWTOACCESS.SucceedQuest();
                DC(int64(0xd2dcebc57700d744), EConversationDebugInfo::Done);
                DC(int64(0xd2dcebc57700d239), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_JOINOC_JOINOC_OBJ_BROWNIEPOINTS.StartQuest();
                DC(int64(0xd2dcebc57700d239), EConversationDebugInfo::Done);
                DC(int64(0xd2dcebc57700d783), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_BROWNIEPOINTS.StartQuest();
                DC(int64(0xd2dcebc57700d783), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDiegoTeach : UTopic_Hero__OC_STT_DIEGO
        {
            default DebugId = int64(0x7fbf89a231441986);
            default Caption = LocText("INFO_DIEGO_TEACH_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x5d0578fa0ab2ee39), Hero != nullptr && Hero.HasListenedTo(LocText("INFO_DIEGO_TEACHERS_11_01")));
                    DB(int64(0x5d0578fa0ab2ee4f), G1R != nullptr && G1R.HasReachedChapter(2));
                }
                
                if (Hero != nullptr && Hero.HasListenedTo(LocText("INFO_DIEGO_TEACHERS_11_01")))
                    return true;
                
                if (G1R != nullptr && G1R.HasReachedChapter(2))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_STT_DIEGO, Document::UDocumentSegment_Glossary_OC_STT_DIEGO_Teacher);
                DB(int64(0x7fbf89a231441989), G1R.LogDiegotrain == 0);
                
                if (G1R.LogDiegotrain == 0)
                {
                    DC(int64(0x3324a0310d750246), EConversationDebugInfo::Executing);
                    G1R.LogDiegotrain = 1;
                    DC(int64(0x3324a0310d750246), EConversationDebugInfo::Done);
                }
                DC(int64(0x7fbf89a23144198b), EConversationDebugInfo::Executing);
                // Can YOU teach me something?
                Hero.AI.Say(LocText("INFO_DIEGO_TEACH_15_00"));
                DC(int64(0x7fbf89a23144198b), EConversationDebugInfo::Done);
                DC(int64(0x7fbf89a23144198c), EConversationDebugInfo::Executing);
                
                // Hmm ... sure, why not. I could help you improve your ...
                Diego.AI.Say(LocText("INFO_DIEGO_TEACH_11_01"));
                DC(int64(0x7fbf89a23144198c), EConversationDebugInfo::Done);
                DC(int64(0x2a2b6e49b3261997), EConversationDebugInfo::Executing);
                Hero.AI.RememberCurrentStatsForTeachingConversation(Diego);
                DC(int64(0x2a2b6e49b3261997), EConversationDebugInfo::Done);
                Subdialog(
                    UChoiceDiegoTeachStr1,
                    UChoiceDiegoTeachStr5,
                    UChoiceDiegoTeachDex1,
                    UChoiceDiegoTeachDex5,
                    UChoiceDiegoTeachBack
                );
            }
        }
        
        
        class UChoiceDiegoTeachStr1 : UTopic_Hero__OC_STT_DIEGO
        {
            default DebugId = int64(0x48d84e3b3a327004);
            default Caption = LocText("TEXT_CHOICE_DIEGO_TEACH_STR_1");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            default PropertyTags.AddTag(GameplayTag::Skill_BuyAttribute_Strength_1);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3324a0310d750233), EConversationDebugInfo::Executing);
                Hero.AI.BuyStrengthAttributePoints(Diego, 1);
                DC(int64(0x3324a0310d750233), EConversationDebugInfo::Done);
                DC(int64(0x7c6efa62cc10666b), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x7c6efa62cc10666b), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDiegoTeachStr5 : UTopic_Hero__OC_STT_DIEGO
        {
            default DebugId = int64(0x48d84e3b3a327001);
            default Caption = LocText("TEXT_CHOICE_DIEGO_TEACH_STR_5");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            default PropertyTags.AddTag(GameplayTag::Skill_BuyAttribute_Strength_5);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3324a0310d75022f), EConversationDebugInfo::Executing);
                Hero.AI.BuyStrengthAttributePoints(Diego, 5);
                DC(int64(0x3324a0310d75022f), EConversationDebugInfo::Done);
                DC(int64(0x7c6efa62cc106676), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x7c6efa62cc106676), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDiegoTeachDex1 : UTopic_Hero__OC_STT_DIEGO
        {
            default DebugId = int64(0x48d84e3b3a32700a);
            default Caption = LocText("TEXT_CHOICE_DIEGO_TEACH_DEX_1");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            default PropertyTags.AddTag(GameplayTag::Skill_BuyAttribute_Dexterity_1);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3324a0310d75023b), EConversationDebugInfo::Executing);
                Hero.AI.BuyDexterityAttributePoints(Diego, 1);
                DC(int64(0x3324a0310d75023b), EConversationDebugInfo::Done);
                DC(int64(0x7c6efa62cc106681), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x7c6efa62cc106681), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDiegoTeachDex5 : UTopic_Hero__OC_STT_DIEGO
        {
            default DebugId = int64(0x48d84e3b3a327007);
            default Caption = LocText("TEXT_CHOICE_DIEGO_TEACH_DEX_5");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            default PropertyTags.AddTag(GameplayTag::Skill_BuyAttribute_Dexterity_5);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3324a0310d750237), EConversationDebugInfo::Executing);
                Hero.AI.BuyDexterityAttributePoints(Diego, 5);
                DC(int64(0x3324a0310d750237), EConversationDebugInfo::Done);
                DC(int64(0x7c6efa62cc10668c), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x7c6efa62cc10668c), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDiegoTeachBack : UTopic_Hero__OC_STT_DIEGO
        {
            default DebugId = int64(0x48d84e3b3a326ff9);
            default Caption = LocText("TEXT_BACK");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2a2b6e49b32619bd), EConversationDebugInfo::Executing);
                Hero.AI.ActTeacherReactionLines(Diego);
                DC(int64(0x2a2b6e49b32619bd), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDiegoTeachers : UTopic_Hero__OC_STT_DIEGO
        {
            default DebugId = int64(0x7fbf89a23144197e);
            default Caption = LocText("INFO_DIEGO_TEACHERS_15_00");
            default PriorityRank = 4;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceDiegoRules);
            default Rules.HideIfKnows(UChoiceDiegoTeachers);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x5d0578fa0ab2ee56), Diego != nullptr && Diego.HasAssignedDailyRoutine(UDailyRoutine_OC_STT_Diego_OldCamp));
                }
                
                return Diego != nullptr && Diego.HasAssignedDailyRoutine(UDailyRoutine_OC_STT_Diego_OldCamp);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7fbf89a231441980), EConversationDebugInfo::Executing);
                // Who can teach me some skills around here?
                Hero.AI.Say(LocText("INFO_DIEGO_TEACHERS_15_00"));
                DC(int64(0x7fbf89a231441980), EConversationDebugInfo::Done);
                DC(int64(0x7fbf89a231441981), EConversationDebugInfo::Executing);
                
                // For starters, stick to Fingers. He's got the swiftest ...
                Diego.AI.Say(LocText("INFO_DIEGO_TEACHERS_11_01"));
                DC(int64(0x7fbf89a231441981), EConversationDebugInfo::Done);
                DC(int64(0x7fbf89a231441982), EConversationDebugInfo::Executing);
                // Besides him, just ask around - you'll find people ...
                Diego.AI.Say(LocText("INFO_DIEGO_TEACHERS_11_02"));
                DC(int64(0x7fbf89a231441982), EConversationDebugInfo::Done);
                DC(int64(0x7fbf89a231441983), EConversationDebugInfo::Executing);
                
                // Where do I find this "Fingers?"
                Hero.AI.Say(LocText("INFO_DIEGO_TEACHERS_15_03"));
                DC(int64(0x7fbf89a231441983), EConversationDebugInfo::Done);
                DC(int64(0x7fbf89a231441984), EConversationDebugInfo::Executing);
                
                // He lives just a few shacks over, right by the castle ...
                Diego.AI.Say(LocText("INFO_DIEGO_TEACHERS_11_04"));
                DC(int64(0x7fbf89a231441984), EConversationDebugInfo::Done);
                DC(int64(0x7fbf89a231441985), EConversationDebugInfo::Executing);
                // When you're in front of the castle gate, just head left ...
                Diego.AI.Say(LocText("INFO_DIEGO_TEACHERS_11_05"));
                DC(int64(0x7fbf89a231441985), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_STT_FINGERS, Document::UDocumentSegment_Glossary_OC_STT_FINGERS_Teacher);
            }
        }
        
        
        class UChoiceDiegoThorussays : UTopic_Hero__OC_STT_DIEGO
        {
            default DebugId = int64(0x7fbf89a23144196b);
            default Caption = LocText("INFO_DIEGO_THORUSSAYS_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceDiegoThorussays);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("INFO_THORUS_DIEGOSENTME_09_01"), int64(0x7fbf89a23144196b));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x9580b03b04f83183), G1R != nullptr && !G1R.HasReachedChapter(2));
                }
                
                return G1R != nullptr && !G1R.HasReachedChapter(2);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7fbf89a23144196c), EConversationDebugInfo::Executing);
                // I spoke to Thorus.
                Hero.AI.Say(LocText("INFO_DIEGO_THORUSSAYS_15_00"));
                DC(int64(0x7fbf89a23144196c), EConversationDebugInfo::Done);
                DC(int64(0x7fbf89a23144196d), EConversationDebugInfo::Executing);
                
                // And? What did he say? 
                Diego.AI.Say(LocText("INFO_DIEGO_THORUSSAYS_11_01"));
                DC(int64(0x7fbf89a23144196d), EConversationDebugInfo::Done);
                DC(int64(0x7fbf89a23144196e), EConversationDebugInfo::Executing);
                
                // That he'll let me see Gomez as soon as YOU think I'm ...
                Hero.AI.Say(LocText("INFO_DIEGO_THORUSSAYS_15_02"));
                DC(int64(0x7fbf89a23144196e), EConversationDebugInfo::Done);
                DC(int64(0x7fbf89a23144196f), EConversationDebugInfo::Executing);
                
                // Looks like I got a new job, then.
                Diego.AI.Say(LocText("INFO_DIEGO_THORUSSAYS_11_03"));
                DC(int64(0x7fbf89a23144196f), EConversationDebugInfo::Done);
                DC(int64(0x7fbf89a231441970), EConversationDebugInfo::Executing);
                
                // You knew this, didn't you? Why didn't you say?
                Hero.AI.Say(LocText("INFO_DIEGO_THORUSSAYS_15_04"));
                DC(int64(0x7fbf89a231441970), EConversationDebugInfo::Done);
                DC(int64(0x7fbf89a231441971), EConversationDebugInfo::Executing);
                
                // Because I want you to figure out things for yourself. ...
                Diego.AI.Say(LocText("INFO_DIEGO_THORUSSAYS_11_05"));
                DC(int64(0x7fbf89a231441971), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDiegoWarumgeholfen : UTopic_Hero__OC_STT_DIEGO
        {
            default DebugId = int64(0x7fbf89a231441928);
            default Caption = LocText("INFO_DIEGO_WARUMGEHOLFEN_15_00");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceDiegoKolonie);
            default Rules.HideIfKnows(UChoiceDiegoWarumgeholfen);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x7fbf89a231441929), G1R.Diego_After_Gamestart == 0);
                    DB(int64(0x7fbf89a23144192a), G1R != nullptr && !G1R.HasReachedChapter(2));
                }
                
                if (G1R.Diego_After_Gamestart != 0)
                    return false;
                
                if (G1R != nullptr && G1R.HasReachedChapter(2))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7fbf89a23144192b), EConversationDebugInfo::Executing);
                
                // Why did you help me? 
                Hero.AI.Say(LocText("INFO_DIEGO_WARUMGEHOLFEN_15_00"));
                DC(int64(0x7fbf89a23144192b), EConversationDebugInfo::Done);
                DC(int64(0x7fbf89a23144192c), EConversationDebugInfo::Executing);
                
                // Because you needed help. If I hadn't stepped in, there's ...
                Diego.AI.Say(LocText("INFO_DIEGO_WARUMGEHOLFEN_11_01"));
                DC(int64(0x7fbf89a23144192c), EConversationDebugInfo::Done);
                DC(int64(0x7fbf89a23144192d), EConversationDebugInfo::Executing);
                // That said, I also want to make you an offer.  
                Diego.AI.Say(LocText("INFO_DIEGO_WARUMGEHOLFEN_11_02"));
                DC(int64(0x7fbf89a23144192d), EConversationDebugInfo::Done);
                DC(int64(0x7fbf89a23144192e), EConversationDebugInfo::Executing);
                
                // I'm listening. 
                Hero.AI.Say(LocText("INFO_DIEGO_WARUMGEHOLFEN_15_03"));
                DC(int64(0x7fbf89a23144192e), EConversationDebugInfo::Done);
                DC(int64(0x7fbf89a23144192f), EConversationDebugInfo::Executing);
                
                // Yes. Your little run-in with Bullit and his lads ...
                Diego.AI.Say(LocText("INFO_DIEGO_WARUMGEHOLFEN_11_04"));
                DC(int64(0x7fbf89a23144192f), EConversationDebugInfo::Done);
                DC(int64(0x7fbf89a231441930), EConversationDebugInfo::Executing);
                // If you wanna survive, you got to join one of the three ...
                Diego.AI.Say(LocText("INFO_DIEGO_WARUMGEHOLFEN_11_05"));
                DC(int64(0x7fbf89a231441930), EConversationDebugInfo::Done);
                DC(int64(0x7fbf89a231441931), EConversationDebugInfo::Executing);
                // I'm here to tell you that the Old Camp is your best bet.
                Diego.AI.Say(LocText("INFO_DIEGO_WARUMGEHOLFEN_11_06"));
                DC(int64(0x7fbf89a231441931), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDiegoWaytooldcamp : UTopic_Hero__OC_STT_DIEGO
        {
            default DebugId = int64(0x96db9efef60cee24);
            default Caption = LocText("INFO_DIEGO_WAYTOOLDCAMP_15_00");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceDiegoWarumgeholfen);
            default Rules.HideIfKnows(UChoiceDiegoWaytooldcamp);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x7fbf89a231441962), G1R.Diego_After_Gamestart == 0);
                }
                
                return G1R.Diego_After_Gamestart == 0;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7fbf89a231441963), EConversationDebugInfo::Executing);
                
                // How do I get to the Old Camp?
                Hero.AI.Say(LocText("INFO_DIEGO_WAYTOOLDCAMP_15_00"));
                DC(int64(0x7fbf89a231441963), EConversationDebugInfo::Done);
                DC(int64(0x7fbf89a231441964), EConversationDebugInfo::Executing);
                
                // Oh, that's simple. Just follow the road down the canyon, ...
                Diego.AI.Say(LocText("INFO_DIEGO_WAYTOOLDCAMP_11_01"));
                DC(int64(0x7fbf89a231441964), EConversationDebugInfo::Done);
                DC(int64(0x7fbf89a231441965), EConversationDebugInfo::Executing);
                // Find yourself a weapon first, though - the thoroughfares ...
                Diego.AI.Say(LocText("INFO_DIEGO_WAYTOOLDCAMP_11_02"));
                DC(int64(0x7fbf89a231441965), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDiegoWhattosaytogomez : UTopic_Hero__OC_STT_DIEGO
        {
            default DebugId = int64(0x7fbf89a231441a09);
            default Caption = LocText("INFO_DIEGO_WHATTOSAYTOGOMEZ_INFO_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceDiegoWhattosaytogomez);
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("DIA_GOMEZ_DABEI_11_02"), int64(0x7fbf89a231441a09));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x7fbf89a231441a0a), G1R.Diego_GomezAudience != 0);
                }
                
                return G1R.Diego_GomezAudience != 0;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7fbf89a231441a0b), EConversationDebugInfo::Executing);
                
                // Any advice for meeting Gomez?
                Hero.AI.Say(LocText("INFO_DIEGO_WHATTOSAYTOGOMEZ_INFO_15_00"));
                DC(int64(0x7fbf89a231441a0b), EConversationDebugInfo::Done);
                DC(int64(0x7fbf89a231441a0c), EConversationDebugInfo::Executing);
                
                // Just be upfront. Gomez puts a lot of stock in his gut, ...
                Diego.AI.Say(LocText("INFO_DIEGO_WHATTOSAYTOGOMEZ_INFO_11_01"));
                DC(int64(0x7fbf89a231441a0c), EConversationDebugInfo::Done);
                DC(int64(0x7fbf89a231441a0d), EConversationDebugInfo::Executing);
                // You're on your own now - good luck. 
                Diego.AI.Say(LocText("INFO_DIEGO_WHATTOSAYTOGOMEZ_INFO_11_02"));
                DC(int64(0x7fbf89a231441a0d), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDiegoWhosgomez : UTopic_Hero__OC_STT_DIEGO
        {
            default DebugId = int64(0x7fbf89a231441957);
            default Caption = LocText("INFO_DIEGO_WHOSGOMEZ_15_00");
            default PriorityRank = 2;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceDiegoKolonie);
            default Rules.HideIfKnows(UChoiceDiegoWhosgomez);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x7fbf89a23144191f), G1R != nullptr && !G1R.HasReachedChapter(2));
                    DB(int64(0xf72cbcc224ea02c1), Hero != nullptr && Hero.HasListenedTo(LocText("INFO_DIEGO_BRIEF_11_07")));
                    DB(int64(0x7fbf89a23144191f), G1R != nullptr && !G1R.HasReachedChapter(2));
                    DB(int64(0xf72cbcc224ea02c1), Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_UFXCIAC_20240902_105744")));
                }
                
                if (G1R != nullptr && !G1R.HasReachedChapter(2) && Hero != nullptr && Hero.HasListenedTo(LocText("INFO_DIEGO_BRIEF_11_07")))
                    return true;
                
                if (G1R != nullptr && !G1R.HasReachedChapter(2) && Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_UFXCIAC_20240902_105744")))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7fbf89a231441958), EConversationDebugInfo::Executing);
                
                // Tell me about this Gomez.
                Hero.AI.Say(LocText("INFO_DIEGO_WHOSGOMEZ_15_00"));
                DC(int64(0x7fbf89a231441958), EConversationDebugInfo::Done);
                DC(int64(0x7fbf89a231441959), EConversationDebugInfo::Executing);
                
                // What's there to tell? He's the biggest ore baron, the ...
                Diego.AI.Say(LocText("INFO_DIEGO_WHOSGOMEZ_11_01"));
                DC(int64(0x7fbf89a231441959), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDiegoWowaffe : UTopic_Hero__OC_STT_DIEGO
        {
            default DebugId = int64(0x96db9efef60cee74);
            default Caption = LocText("INFO_DIEGO_WOWAFFE_15_00");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceDiegoWaytooldcamp);
            default Rules.HideIfKnows(UChoiceDiegoWowaffe);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x7fbf89a231441967), G1R.Diego_After_Gamestart == 0);
                }
                
                return G1R.Diego_After_Gamestart == 0;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7fbf89a231441968), EConversationDebugInfo::Executing);
                
                // Where do I get a weapon?
                Hero.AI.Say(LocText("INFO_DIEGO_WOWAFFE_15_00"));
                DC(int64(0x7fbf89a231441968), EConversationDebugInfo::Done);
                DC(int64(0x7fbf89a231441969), EConversationDebugInfo::Executing);
                
                // Well, you can't take it from the trading post - this is ...
                Diego.AI.Say(LocText("INFO_DIEGO_WOWAFFE_11_01"));
                DC(int64(0x7fbf89a231441969), EConversationDebugInfo::Done);
                DC(int64(0x7fbf89a23144196a), EConversationDebugInfo::Executing);
                // There's bound to be something. 
                Diego.AI.Say(LocText("INFO_DIEGO_WOWAFFE_11_02"));
                DC(int64(0x7fbf89a23144196a), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */