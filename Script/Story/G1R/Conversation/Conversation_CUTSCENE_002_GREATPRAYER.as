#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_CUTSCENE_002_GREATPRAYER : UConversationCharacterSettings
        {
            default ForCharacter = n"CUTSCENE_002_GREATPRAYER";
        }
        
        
        class UTopic_Hero__CUTSCENE_002_GREATPRAYER : UG1RDialogTopic
        {
            default ForCharacter = n"CUTSCENE_002_GREATPRAYER";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetCutsceneGreatPrayer() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetBaalLukor() const property
            {
                return GetCharacter(n"OG_GUR_BAALLUKOR_1211");
            }
            
            AGothicCharacterState GetCorAngar() const property
            {
                return GetCharacter(n"SC_GUR_CORANGAR_1202");
            }
            
            AGothicCharacterState GetCorKalom() const property
            {
                return GetCharacter(n"SC_GUR_CORKALOM_1201");
            }
            
            AGothicCharacterState GetYBerion() const property
            {
                return GetCharacter(n"SC_GUR_YBERION_1200");
            }
            
            AGothicCharacterState GetLester() const property
            {
                return GetCharacter(n"SC_NOV_LESTER");
            }
            
            AGothicCharacterState GetSC_NOV_NOVICE01_1306() const property
            {
                return GetCharacter(n"SC_NOV_NOVICE01_1306");
            }
        }
        
        
        class UChoiceCutscenegreatprayer274825 : UTopic_Hero__CUTSCENE_002_GREATPRAYER
        {
            default DebugId = int64(0xd9e737aeb8960db8);
            default Caption = LocText("TEXT_WIP_POQECXC_20240424_154008");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceCutscenegreatprayer95592);
            default Rules.HideIfKnows(UChoiceCutscenegreatprayer274825);
            
            default ExtraCharactersToInvite.Add(n"SC_GUR_CORKALOM_1201");
            default ExtraCharactersToInvite.Add(n"SC_GUR_CORANGAR_1202");
            default ExtraCharactersToInvite.Add(n"SC_NOV_NOVICE01_1306");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd9e737aeb8960dbb), EConversationDebugInfo::Executing);
                // What are you waiting for?! Go after him!
                CorKalom.AI.Say(LocText("TEXT_WIP_POQECXC_20240424_154008"));
                DC(int64(0xd9e737aeb8960dbb), EConversationDebugInfo::Done);
                DC(int64(0xd9e737aeb8960dba), EConversationDebugInfo::Executing);
                
                // SILENCE!
                CorAngar.AI.Say(LocText("TEXT_WIP_POQECXC_20240424_153953"));
                DC(int64(0xd9e737aeb8960dba), EConversationDebugInfo::Done);
                DC(int64(0x5b00fe0ae4f9137), EConversationDebugInfo::Executing);
                // (The confusion goes down)
                CorAngar.AI.Say(LocText("TEXT_WIP_QEQTZYF_20240423_132312"));
                DC(int64(0x5b00fe0ae4f9137), EConversationDebugInfo::Done);
                DC(int64(0x5b00fe0ae4f9138), EConversationDebugInfo::Executing);
                // Calm your minds, brothers. The Sleeper showed us what he ...
                CorAngar.AI.Say(LocText("TEXT_WIP_QEQTZYF_20240423_132315"));
                DC(int64(0x5b00fe0ae4f9138), EConversationDebugInfo::Done);
                DC(int64(0xd9e737aeb8960dbc), EConversationDebugInfo::Executing);
                
                // What happened to Master Y'Berion? 
                SC_NOV_NOVICE01_1306.AI.Say(LocText("TEXT_WIP_POQECXC_20240424_154226"));
                DC(int64(0xd9e737aeb8960dbc), EConversationDebugInfo::Done);
                DC(int64(0x5b00fe0ae4f9139), EConversationDebugInfo::Executing);
                
                // We don't know yet, but we will take care of him.
                CorAngar.AI.Say(LocText("TEXT_WIP_QEQTZYF_20240423_132316"));
                DC(int64(0x5b00fe0ae4f9139), EConversationDebugInfo::Done);
                DC(int64(0x5b00fe0ae4f913c), EConversationDebugInfo::Executing);
                // Go back to your huts for now. Pray, mediate, and rest. ...
                CorAngar.AI.Say(LocText("TEXT_WIP_QEQTZYF_20240423_132352"));
                DC(int64(0x5b00fe0ae4f913c), EConversationDebugInfo::Done);
                DC(int64(0x5b00fe0ae4f9141), EConversationDebugInfo::Executing);
                // Sleeper awaken.
                CorAngar.AI.Say(LocText("TEXT_WIP_QEQTZYF_20240423_132507"));
                DC(int64(0x5b00fe0ae4f9141), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceCutscenegreatprayer274918 : UTopic_Hero__CUTSCENE_002_GREATPRAYER
        {
            default DebugId = int64(0x5b00fe0ae4f9144);
            default Caption = LocText("TEXT_WIP_POQECXC_20240424_154514");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceCutscenegreatprayer274825);
            default Rules.HideIfKnows(UChoiceCutscenegreatprayer274918);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd9e737aeb8960dbd), EConversationDebugInfo::Executing);
                
                // Well. Shit. 
                Hero.AI.Say(LocText("TEXT_WIP_POQECXC_20240424_154514"));
                DC(int64(0xd9e737aeb8960dbd), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceCutscenegreatprayer95072 : UTopic_Hero__CUTSCENE_002_GREATPRAYER
        {
            default DebugId = int64(0x28f8ba30074eea21);
            default Caption = LocText("TEXT_WIP_OOQECXC_20240425_175523");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceTest183347);
            default Rules.HideIfKnows(UChoiceCutscenegreatprayer95072);
            
            default ExtraCharactersToInvite.Add(n"SC_GUR_YBERION_1200");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x28f8ba30074eea23), EConversationDebugInfo::Executing);
                
                // SLEEPER AWAKEN!
                YBerion.AI.Say(LocText("TEXT_WIP_OOQECXC_20240425_175523"));
                DC(int64(0x28f8ba30074eea23), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceCutscenegreatprayer95592 : UTopic_Hero__CUTSCENE_002_GREATPRAYER
        {
            default DebugId = int64(0xd9e737aeb8960db6);
            default Caption = LocText("TEXT_WIP_QEQTZYF_20240423_132049");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceCutscenegreatprayer95072);
            default Rules.HideIfKnows(UChoiceCutscenegreatprayer95592);
            
            default ExtraCharactersToInvite.Add(n"SC_GUR_CORANGAR_1202");
            default ExtraCharactersToInvite.Add(n"OG_GUR_BAALLUKOR_1211");
            default ExtraCharactersToInvite.Add(n"SC_GUR_CORKALOM_1201");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5b00fe0ae4f9131), EConversationDebugInfo::Executing);
                
                // (as Y'Berion collapses) MASTER! Master, what's wrong? ...
                CorAngar.AI.Say(LocText("TEXT_WIP_QEQTZYF_20240423_132049"));
                DC(int64(0x5b00fe0ae4f9131), EConversationDebugInfo::Done);
                DC(int64(0xd9e737aeb8960db4), EConversationDebugInfo::Executing);
                
                // ... I saw it. 
                BaalLukor.AI.Say(LocText("TEXT_WIP_POQECXC_20240424_153059"));
                DC(int64(0xd9e737aeb8960db4), EConversationDebugInfo::Done);
                DC(int64(0x5b00fe0ae4f9133), EConversationDebugInfo::Executing);
                
                // Don't just stand there, Lukor, help us!
                CorKalom.AI.Say(LocText("TEXT_WIP_QEQTZYF_20240423_132140"));
                DC(int64(0x5b00fe0ae4f9133), EConversationDebugInfo::Done);
                DC(int64(0xd9e737aeb8960db5), EConversationDebugInfo::Executing);
                
                // I SAW IT!
                BaalLukor.AI.Say(LocText("TEXT_WIP_POQECXC_20240424_153537"));
                DC(int64(0xd9e737aeb8960db5), EConversationDebugInfo::Done);
                DC(int64(0xd9e737aeb8960db9), EConversationDebugInfo::Executing);
                
                // Lukor!
                CorKalom.AI.Say(LocText("TEXT_WIP_POQECXC_20240424_153715"));
                DC(int64(0xd9e737aeb8960db9), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceTest183347 : UTopic_Hero__CUTSCENE_002_GREATPRAYER
        {
            default DebugId = int64(0x5b00fe0ae4f3abc);
            default Caption = LocText("TEXT_WIP_QEQTZYF_20240423_131650");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceTest183347);
            
            default ExtraCharactersToInvite.Add(n"SC_GUR_YBERION_1200");
            default ExtraCharactersToInvite.Add(n"SC_NOV_LESTER");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5b00fe0ae4f9123), EConversationDebugInfo::Executing);
                
                // Brothers! The time is finally here.
                YBerion.AI.Say(LocText("TEXT_WIP_QEQTZYF_20240423_131650"));
                DC(int64(0x5b00fe0ae4f9123), EConversationDebugInfo::Done);
                DC(int64(0x5b00fe0ae4f9124), EConversationDebugInfo::Executing);
                // All these years the unbelievers mocked you for your ...
                YBerion.AI.Say(LocText("TEXT_WIP_QEQTZYF_20240423_131720"));
                DC(int64(0x5b00fe0ae4f9124), EConversationDebugInfo::Done);
                DC(int64(0xdbe591605dc83e25), EConversationDebugInfo::Executing);
                
                // Hey! ... Come over here
                Lester.AI.Say(LocText("TEXT_WIP_JEIRYVC_20250207_022142"));
                DC(int64(0xdbe591605dc83e25), EConversationDebugInfo::Done);
                DC(int64(0xd9e737aeb8960daf), EConversationDebugInfo::Executing);
                
                // Confused and desperate for hope in a place where there ...
                YBerion.AI.Say(LocText("TEXT_WIP_POQECXC_20240424_144936"));
                DC(int64(0xd9e737aeb8960daf), EConversationDebugInfo::Done);
                DC(int64(0xdbe591605dc83e28), EConversationDebugInfo::Executing);
                
                // (CHEERING FROM THE CULTISTS)
                CutsceneGreatPrayer.AI.Say(LocText("TEXT_WIP_JEIRYVC_20250207_022801"));
                DC(int64(0xdbe591605dc83e28), EConversationDebugInfo::Done);
                DC(int64(0xd9e737aeb8960dae), EConversationDebugInfo::Executing);
                
                // Tonight, we shall show everyone how wrong they were
                YBerion.AI.Say(LocText("TEXT_WIP_POQECXC_20240424_144653"));
                DC(int64(0xd9e737aeb8960dae), EConversationDebugInfo::Done);
                DC(int64(0x5b00fe0ae4f9126), EConversationDebugInfo::Executing);
                // So he may AWAKEN at last!
                YBerion.AI.Say(LocText("TEXT_WIP_QEQTZYF_20240423_131730"));
                DC(int64(0x5b00fe0ae4f9126), EConversationDebugInfo::Done);
                DC(int64(0xdbe591605dc83e26), EConversationDebugInfo::Executing);
                
                // Look up, he is going to show us the path to freedom
                Lester.AI.Say(LocText("TEXT_WIP_JEIRYVC_20250207_022459"));
                DC(int64(0xdbe591605dc83e26), EConversationDebugInfo::Done);
                DC(int64(0xdbe591605dc83e27), EConversationDebugInfo::Executing);
                
                // (FANATICAL CHEERING from the Cultists)
                CutsceneGreatPrayer.AI.Say(LocText("TEXT_WIP_JEIRYVC_20250207_022727"));
                DC(int64(0xdbe591605dc83e27), EConversationDebugInfo::Done);
                DC(int64(0xd9e737aeb8960db2), EConversationDebugInfo::Executing);
                
                // Drink the elixir!
                YBerion.AI.Say(LocText("TEXT_WIP_POQECXC_20240424_150702"));
                DC(int64(0xd9e737aeb8960db2), EConversationDebugInfo::Done);
                DC(int64(0x920c6d2c3c1e732a), EConversationDebugInfo::Executing);
                // I know it's been difficult.
                YBerion.AI.Say(LocText("TEXT_WIP_KSNHEKD_20250507_014958"));
                DC(int64(0x920c6d2c3c1e732a), EConversationDebugInfo::Done);
                DC(int64(0x920c6d2c3c1e732b), EConversationDebugInfo::Executing);
                // But do you know what I see? I see strength
                YBerion.AI.Say(LocText("TEXT_WIP_KSNHEKD_20250507_015011"));
                DC(int64(0x920c6d2c3c1e732b), EConversationDebugInfo::Done);
                DC(int64(0x920c6d2c3c1e732c), EConversationDebugInfo::Executing);
                // I see men who live for a higher purpose, men who, like ...
                YBerion.AI.Say(LocText("TEXT_WIP_KSNHEKD_20250507_015121"));
                DC(int64(0x920c6d2c3c1e732c), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */