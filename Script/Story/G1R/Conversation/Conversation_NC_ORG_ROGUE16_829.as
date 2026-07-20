#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_NC_ORG_ROGUE16_829 : UConversationCharacterSettings
        {
            default ForCharacter = n"NC_ORG_ROGUE16_829";
        }
        
        
        class UTopic_Hero__NC_ORG_ROGUE16_829 : UG1RDialogTopic
        {
            default ForCharacter = n"NC_ORG_ROGUE16_829";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetRogue() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceOrg829Exit : UTopic_Hero__NC_ORG_ROGUE16_829
        {
            default DebugId = int64(0x8599a0b9096b48a3);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8599a0b9096b48a4), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x8599a0b9096b48a4), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceOrg829Hello : UTopic_Hero__NC_ORG_ROGUE16_829
        {
            default DebugId = int64(0x8599a0b9096b48a5);
            default Caption = LocText("INFO_ORG_829_HELLO_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceOrg829Hello);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8599a0b9096b48a6), EConversationDebugInfo::Executing);
                // How's it going?
                Hero.AI.Say(LocText("INFO_ORG_829_HELLO_15_00"));
                DC(int64(0x8599a0b9096b48a6), EConversationDebugInfo::Done);
                DC(int64(0x8599a0b9096b48a7), EConversationDebugInfo::Executing);
                
                // Been better. I'm dying for a smoke. 
                Rogue.AI.Say(LocText("INFO_ORG_829_HELLO_06_01"));
                DC(int64(0x8599a0b9096b48a7), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceOrg829Offerjoint : UTopic_Hero__NC_ORG_ROGUE16_829
        {
            default DebugId = int64(0x88bd79cd32077495);
            default Caption = LocText("INFO_ORG_829_OFFERJOINT_15_00");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceOrg829Hello);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x8a6bf8844b35e0d6), Hero != nullptr && !Hero.HasListenedTo(LocText("INFO_ORG_829_OFFERJOINT_06_01")));
                    DB(int64(0x3fad8d97598fa736), Hero != nullptr && Hero.HasItem(UItMi_Joint_03, 1, 0));
                    DB(int64(0x8a6bf8844b35e0d6), Hero != nullptr && !Hero.HasListenedTo(LocText("INFO_ORG_829_OFFERJOINT_06_01")));
                    DB(int64(0x3fad8d97598fa736), Hero != nullptr && Hero.HasItem(UItMi_Joint_02, 1, 0));
                    DB(int64(0x8a6bf8844b35e0d6), Hero != nullptr && !Hero.HasListenedTo(LocText("INFO_ORG_829_OFFERJOINT_06_01")));
                    DB(int64(0x3fad8d97598fa736), Hero != nullptr && Hero.HasItem(UItMi_Joint_01, 1, 0));
                }
                
                if (Hero != nullptr && !Hero.HasListenedTo(LocText("INFO_ORG_829_OFFERJOINT_06_01")) && Hero != nullptr && Hero.HasItem(UItMi_Joint_03, 1, 0))
                    return true;
                
                if (Hero != nullptr && !Hero.HasListenedTo(LocText("INFO_ORG_829_OFFERJOINT_06_01")) && Hero != nullptr && Hero.HasItem(UItMi_Joint_02, 1, 0))
                    return true;
                
                if (Hero != nullptr && !Hero.HasListenedTo(LocText("INFO_ORG_829_OFFERJOINT_06_01")) && Hero != nullptr && Hero.HasItem(UItMi_Joint_01, 1, 0))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8599a0b9096b48a9), EConversationDebugInfo::Executing);
                
                // I have something right here. You want some?
                Hero.AI.Say(LocText("INFO_ORG_829_OFFERJOINT_15_00"));
                DC(int64(0x8599a0b9096b48a9), EConversationDebugInfo::Done);
                DB(int64(0x7178cefec8b627a1), Hero != nullptr && Hero.HasItem(UItMi_Joint_02, 1, 0));
                DB(int64(0x7178cefec8b627a2), Hero != nullptr && Hero.HasItem(UItMi_Joint_03, 1, 0));
                DB(int64(0x7178cefec8b627a3), Hero != nullptr && Hero.HasItem(UItMi_Joint_01, 1, 0));
                
                if ((Hero != nullptr && Hero.HasItem(UItMi_Joint_02, 1, 0)) || (Hero != nullptr && Hero.HasItem(UItMi_Joint_03, 1, 0)) || (Hero != nullptr && Hero.HasItem(UItMi_Joint_01, 1, 0)))
                {
                    DB(int64(0x8599a0b9096b48ad), Hero != nullptr && Hero.HasItem(UItMi_Joint_01, 1, 0));
                    DB(int64(0x8599a0b9096b48af), Hero != nullptr && Hero.HasItem(UItMi_Joint_02, 1, 0));
                    DB(int64(0x8599a0b9096b48b1), Hero != nullptr && Hero.HasItem(UItMi_Joint_03, 1, 0));
                    
                    if (Hero != nullptr && Hero.HasItem(UItMi_Joint_01, 1, 0))
                    {
                        DC(int64(0x8a6bf8844b35a166), EConversationDebugInfo::Executing);
                        Hero.AI.GiveItemTo(Rogue, UItMi_Joint_01, 1);
                        DC(int64(0x8a6bf8844b35a166), EConversationDebugInfo::Done);
                    }
                    else if (Hero != nullptr && Hero.HasItem(UItMi_Joint_02, 1, 0))
                    {
                        DC(int64(0x8a6bf8844b35a169), EConversationDebugInfo::Executing);
                        Hero.AI.GiveItemTo(Rogue, UItMi_Joint_02, 1);
                        DC(int64(0x8a6bf8844b35a169), EConversationDebugInfo::Done);
                    }
                    else if (Hero != nullptr && Hero.HasItem(UItMi_Joint_03, 1, 0))
                    {
                        DC(int64(0x8a6bf8844b35a16c), EConversationDebugInfo::Executing);
                        Hero.AI.GiveItemTo(Rogue, UItMi_Joint_03, 1);
                        DC(int64(0x8a6bf8844b35a16c), EConversationDebugInfo::Done);
                    }
                    DC(int64(0x8599a0b9096b48b3), EConversationDebugInfo::Executing);
                    // You with the Loons, or what? Ah, fuck it, give me that. 
                    Rogue.AI.Say(LocText("INFO_ORG_829_OFFERJOINT_06_01"));
                    DC(int64(0x8599a0b9096b48b3), EConversationDebugInfo::Done);
                    DC(int64(0xc737f845657a8158), EConversationDebugInfo::Executing);
                    // Thanks, man. I owe you one. 
                    Rogue.AI.Say(LocText("TEXT_WIP_WUKFIKD_20241022_163918"));
                    DC(int64(0xc737f845657a8158), EConversationDebugInfo::Done);
                    DC(int64(0x8a6bf8844b35a161), EConversationDebugInfo::Executing);
                    G1R.NC_JointsDistributed += 1;
                    DC(int64(0x8a6bf8844b35a161), EConversationDebugInfo::Done);
                    DC(int64(0x8a6bf8844b35e0d8), EConversationDebugInfo::Executing);
                    G1R.Org_829_GotJoint = 1;
                    DC(int64(0x8a6bf8844b35e0d8), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_org_829_offerjoint_exit_1");
                }
                else
                {
                    DC(int64(0x8599a0b9096b48b5), EConversationDebugInfo::Executing);
                    // Very funny, arsehole. Piss off.
                    Rogue.AI.Say(LocText("INFO_ORG_829_OFFERJOINT_NO_JOINT_06_00"));
                    DC(int64(0x8599a0b9096b48b5), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_org_829_offerjoint_exit_2");
                    DC(int64(0x8a6bf8844b35e0d9), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x8a6bf8844b35e0d9), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
        class UChoiceOrg829Perm : UTopic_Hero__NC_ORG_ROGUE16_829
        {
            default DebugId = int64(0x8599a0b9096b48bc);
            default Caption = LocText("INFO_ORG_829_PERM_15_00");
            default PriorityRank = 1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x8599a0b9096b48bd), G1R.Org_829_GotJoint != 0);
                }
                
                return G1R.Org_829_GotJoint != 0;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8599a0b9096b48be), EConversationDebugInfo::Executing);
                // Can you tell me what's in there?
                Hero.AI.Say(LocText("INFO_ORG_829_PERM_15_00"));
                DC(int64(0x8599a0b9096b48be), EConversationDebugInfo::Done);
                DC(int64(0x8599a0b9096b48bf), EConversationDebugInfo::Executing);
                
                // Find out for yourself.
                Rogue.AI.Say(LocText("INFO_ORG_829_PERM_06_01"));
                DC(int64(0x8599a0b9096b48bf), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceOrg829Specialinfo : UTopic_Hero__NC_ORG_ROGUE16_829
        {
            default DebugId = int64(0x8599a0b9096b48b6);
            default Caption = LocText("INFO_ORG_829_SPECIALINFO_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceOrg829Specialinfo);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x8599a0b9096b48b7), G1R.Org_829_GotJoint != 0);
                }
                
                return G1R.Org_829_GotJoint != 0;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8599a0b9096b48b8), EConversationDebugInfo::Executing);
                
                // I'm new here. Can you give me some advice?
                Hero.AI.Say(LocText("INFO_ORG_829_SPECIALINFO_15_00"));
                DC(int64(0x8599a0b9096b48b8), EConversationDebugInfo::Done);
                DC(int64(0x8599a0b9096b48b9), EConversationDebugInfo::Executing);
                
                // Advice? Hm, yeah - when you're inside, go find Gorn, the ...
                Rogue.AI.Say(LocText("INFO_ORG_829_SPECIALINFO_06_01"));
                DC(int64(0x8599a0b9096b48b9), EConversationDebugInfo::Done);
                DC(int64(0x8599a0b9096b48ba), EConversationDebugInfo::Executing);
                
                // Your gang?
                Hero.AI.Say(LocText("INFO_ORG_829_SPECIALINFO_15_02"));
                DC(int64(0x8599a0b9096b48ba), EConversationDebugInfo::Done);
                DC(int64(0x8599a0b9096b48bb), EConversationDebugInfo::Executing);
                
                // Yeah. The "Let's-fuck-up-the-ore-barons"-gang. 
                Rogue.AI.Say(LocText("INFO_ORG_829_SPECIALINFO_06_03"));
                DC(int64(0x8599a0b9096b48bb), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */