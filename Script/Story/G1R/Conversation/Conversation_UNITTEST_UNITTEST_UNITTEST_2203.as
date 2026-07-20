#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_UNITTEST_UNITTEST_UNITTEST_2203 : UConversationCharacterSettings
        {
            default ForCharacter = n"UNITTEST_UNITTEST_UNITTEST_2203";
        }
        
        
        class UTopic_Hero__UNITTEST_UNITTEST_UNITTEST_2203 : UG1RDialogTopic
        {
            default ForCharacter = n"UNITTEST_UNITTEST_UNITTEST_2203";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetUnitTest() const property
            {
                return Self;
            }
        }
        
        
        class UChoiceUnittest00101DoesSettingVari58887 : UTopic_Hero__UNITTEST_UNITTEST_UNITTEST_2203
        {
            default DebugId = int64(0xe3d9f648302ee3f2);
            default Caption = LocText("TEXT_ANDRE_20220118_102549_2083");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceUnittest001Logic58888);
            default Rules.HideIfKnows(UChoiceUnittest00101DoesSettingVari58887);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe3d9f648302ee3f4), EConversationDebugInfo::Executing);
                G1R.UNITTEST_SUCCESS = 1;
                DC(int64(0xe3d9f648302ee3f4), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceUnittest00102DoesSimpleIfels58889 : UTopic_Hero__UNITTEST_UNITTEST_UNITTEST_2203
        {
            default DebugId = int64(0xaa343b85389915d5);
            default Caption = LocText("TEXT_ANDRE_20220118_102752_2083");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceUnittest001Logic58888);
            default Rules.HideIfKnows(UChoiceUnittest00102DoesSimpleIfels58889);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                Print("Skipped G1R.UNITTEST_X = 5");
                DC(int64(0xe9e5da196d1bae1d), EConversationDebugInfo::Unimplemented);
                
                if (/* Skip: is_equal_to */ false)
                {
                    DC(int64(0xe3d9f648302ee3f4), EConversationDebugInfo::Executing);
                    G1R.UNITTEST_SUCCESS = 1;
                    DC(int64(0xe3d9f648302ee3f4), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_unittest__001_02_does_simple_ifels58889_exit_1");
                }
                else
                {
                    
                    Other.Remember(n"choice_unittest__001_02_does_simple_ifels58889_exit_2");
                }
            }
        }
        
        
        class UChoiceUnittest00103DoesSimpleIfels58890 : UTopic_Hero__UNITTEST_UNITTEST_UNITTEST_2203
        {
            default DebugId = int64(0xe9e5da196d1bae20);
            default Caption = LocText("TEXT_ANDRE_20220118_103125_2083");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceUnittest001Logic58888);
            default Rules.HideIfKnows(UChoiceUnittest00103DoesSimpleIfels58890);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                Print("Skipped G1R.UNITTEST_X = 5");
                DC(int64(0xe9e5da196d1bae25), EConversationDebugInfo::Unimplemented);
                
                if (/* Skip: is_equal_to */ false)
                {
                    
                }
                else
                {
                    DC(int64(0xe3d9f648302ee3f4), EConversationDebugInfo::Executing);
                    G1R.UNITTEST_SUCCESS = 1;
                    DC(int64(0xe3d9f648302ee3f4), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UChoiceUnittest00104DoesNegationWor58895 : UTopic_Hero__UNITTEST_UNITTEST_UNITTEST_2203
        {
            default DebugId = int64(0xe9e5da196d1bae2d);
            default Caption = LocText("TEXT_ANDRE_20220118_103633_3436");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceUnittest001Logic58888);
            default Rules.HideIfKnows(UChoiceUnittest00104DoesNegationWor58895);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                Print("Skipped G1R.UNITTEST_X = 5");
                DC(int64(0xe9e5da196d1bae34), EConversationDebugInfo::Unimplemented);
                
                if (/* Skip: is_equal_to */ false)
                {
                    
                }
                else
                {
                    DC(int64(0xe3d9f648302ee3f4), EConversationDebugInfo::Executing);
                    G1R.UNITTEST_SUCCESS = 1;
                    DC(int64(0xe3d9f648302ee3f4), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UChoiceUnittest00105DoesIfelseifelse58897 : UTopic_Hero__UNITTEST_UNITTEST_UNITTEST_2203
        {
            default DebugId = int64(0xe9e5da196d1bae38);
            default Caption = LocText("TEXT_ANDRE_20220118_103936_686");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceUnittest001Logic58888);
            default Rules.HideIfKnows(UChoiceUnittest00105DoesIfelseifelse58897);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                Print("Skipped G1R.UNITTEST_X = 5");
                DC(int64(0xe9e5da196d1bae3e), EConversationDebugInfo::Unimplemented);
                DC(int64(0xe9e5da196d1bae3c), EConversationDebugInfo::Unimplemented);
                DC(int64(0xe9e5da196d1bae3f), EConversationDebugInfo::Unimplemented);
                
                if (/* Skip: is_equal_to */ false)
                {
                    
                }
                else if (/* Skip: is_equal_to */ false)
                {
                    DC(int64(0xe3d9f648302ee3f4), EConversationDebugInfo::Executing);
                    G1R.UNITTEST_SUCCESS = 1;
                    DC(int64(0xe3d9f648302ee3f4), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_unittest__001_05_does_ifelseifelse58897_exit_1");
                }
                else if (/* Skip: is_equal_to */ false)
                {
                    
                }
                else
                {
                    
                    Other.Remember(n"choice_unittest__001_05_does_ifelseifelse58897_exit_2");
                }
            }
        }
        
        
        class UChoiceUnittest00106DoesIfWithOrW58899 : UTopic_Hero__UNITTEST_UNITTEST_UNITTEST_2203
        {
            default DebugId = int64(0xe9e5da196d1bae43);
            default Caption = LocText("TEXT_ANDRE_20220118_104307_3984");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceUnittest001Logic58888);
            default Rules.HideIfKnows(UChoiceUnittest00106DoesIfWithOrW58899);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                Print("Skipped G1R.UNITTEST_X = 5");
                Print("Skipped G1R.UNITTEST_Y = 99");
                DC(int64(0xe9e5da196d1bae48), EConversationDebugInfo::Unimplemented);
                DC(int64(0x47b13b541518c9e6), EConversationDebugInfo::Unimplemented);
                DC(int64(0xe9e5da196d1bae48), EConversationDebugInfo::Unimplemented);
                DC(int64(0x47b13b541518c9e8), EConversationDebugInfo::Unimplemented);
                
                if (((/* Skip: is_equal_to */ false && /* Skip: is_equal_to */ false)) || ((/* Skip: is_equal_to */ false && /* Skip: is_equal_to */ false)))
                {
                    DC(int64(0xe3d9f648302ee3f4), EConversationDebugInfo::Executing);
                    G1R.UNITTEST_SUCCESS = 1;
                    DC(int64(0xe3d9f648302ee3f4), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_unittest__001_06_does_if_with_or_w58899_exit_1");
                }
                else
                {
                    
                    Other.Remember(n"choice_unittest__001_06_does_if_with_or_w58899_exit_2");
                }
            }
        }
        
        
        class UChoiceUnittest00107DoesIfWithAnd58898 : UTopic_Hero__UNITTEST_UNITTEST_UNITTEST_2203
        {
            default DebugId = int64(0x47b13b541518ca33);
            default Caption = LocText("TEXT_ANDRE_20220118_110232_1924");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceUnittest001Logic58888);
            default Rules.HideIfKnows(UChoiceUnittest00107DoesIfWithAnd58898);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                Print("Skipped G1R.UNITTEST_X = 5");
                Print("Skipped G1R.UNITTEST_Y = 99");
                DC(int64(0xe9e5da196d1bae48), EConversationDebugInfo::Unimplemented);
                DC(int64(0x47b13b541518c9e4), EConversationDebugInfo::Unimplemented);
                DC(int64(0xaac87f84bcd228c0), EConversationDebugInfo::Unimplemented);
                DC(int64(0xaac87f84bcd228c2), EConversationDebugInfo::Unimplemented);
                
                if (/* Skip: is_equal_to */ false && /* Skip: is_equal_to */ false)
                {
                    DC(int64(0xe3d9f648302ee3f4), EConversationDebugInfo::Executing);
                    G1R.UNITTEST_SUCCESS = 2;
                    DC(int64(0xe3d9f648302ee3f4), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_unittest__001_07_does_if_with_and_58898_exit_1");
                }
                else if (/* Skip: is_equal_to */ false && /* Skip: is_equal_to */ false)
                {
                    DC(int64(0xe3d9f648302ee3f4), EConversationDebugInfo::Executing);
                    G1R.UNITTEST_SUCCESS = 1;
                    DC(int64(0xe3d9f648302ee3f4), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_unittest__001_07_does_if_with_and_58898_exit_2");
                }
                else
                {
                    DC(int64(0xe3d9f648302ee3f4), EConversationDebugInfo::Executing);
                    G1R.UNITTEST_SUCCESS = 3;
                    DC(int64(0xe3d9f648302ee3f4), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_unittest__001_07_does_if_with_and_58898_exit_3");
                }
            }
        }
        
        
        class UChoiceUnittest00107DoesIfWithAnd58900 : UTopic_Hero__UNITTEST_UNITTEST_UNITTEST_2203
        {
            default DebugId = int64(0x47b13b541518ca3e);
            default Caption = LocText("TEXT_ANDRE_20220118_110339_3436");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceUnittest001Logic58888);
            default Rules.HideIfKnows(UChoiceUnittest00107DoesIfWithAnd58900);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                Print("Skipped G1R.UNITTEST_X = 7");
                Print("Skipped G1R.UNITTEST_Y = 99");
                DC(int64(0x47b13b541518ca44), EConversationDebugInfo::Unimplemented);
                DC(int64(0x47b13b541518ca46), EConversationDebugInfo::Unimplemented);
                
                if (/* Skip: is_equal_to */ false && /* Skip: is_equal_to */ false)
                {
                    
                }
                else
                {
                    DC(int64(0xe3d9f648302ee3f4), EConversationDebugInfo::Executing);
                    G1R.UNITTEST_SUCCESS = 1;
                    DC(int64(0xe3d9f648302ee3f4), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UChoiceUnittest00107DoesIfWithOrW58893 : UTopic_Hero__UNITTEST_UNITTEST_UNITTEST_2203
        {
            default DebugId = int64(0x47b13b541518c9d8);
            default Caption = LocText("TEXT_ANDRE_20220118_105827_2083");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceUnittest001Logic58888);
            default Rules.HideIfKnows(UChoiceUnittest00107DoesIfWithOrW58893);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                Print("Skipped G1R.UNITTEST_X = 5");
                Print("Skipped G1R.UNITTEST_Y = 99");
                DC(int64(0xe9e5da196d1bae48), EConversationDebugInfo::Unimplemented);
                DC(int64(0x47b13b541518c9e4), EConversationDebugInfo::Unimplemented);
                DC(int64(0xe9e5da196d1bae48), EConversationDebugInfo::Unimplemented);
                DC(int64(0x47b13b541518c9e5), EConversationDebugInfo::Unimplemented);
                
                if (((/* Skip: is_equal_to */ false && /* Skip: is_equal_to */ false)) || ((/* Skip: is_equal_to */ false && /* Skip: is_equal_to */ false)))
                {
                    
                }
                else
                {
                    DC(int64(0xe3d9f648302ee3f4), EConversationDebugInfo::Executing);
                    G1R.UNITTEST_SUCCESS = 1;
                    DC(int64(0xe3d9f648302ee3f4), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UChoiceUnittest001Logic58888 : UTopic_Hero__UNITTEST_UNITTEST_UNITTEST_2203
        {
            default DebugId = int64(0xe9e5da196d1bae29);
            default Caption = LocText("TEXT_ANDRE_20220118_103401_1924");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceUnittest001Logic58888);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                
            }
        }
        
        
        class UChoiceUnittest00201DoesForceEndCo58892 : UTopic_Hero__UNITTEST_UNITTEST_UNITTEST_2203
        {
            default DebugId = int64(0x29f374458c5b29db);
            default Caption = LocText("TEXT_ANDRE_20220118_145545_2083");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceUnittest002ForceEndConversati58891);
            default Rules.HideIfKnows(UChoiceUnittest00201DoesForceEndCo58892);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x63a90daab8466e12), EConversationDebugInfo::Executing);
                G1R.UNITTEST_EXPECT_CONVERSATION_ENDED = 1;
                DC(int64(0x63a90daab8466e12), EConversationDebugInfo::Done);
                DC(int64(0x29f374458c5b29d8), EConversationDebugInfo::Executing);
                G1R.UNITTEST_SUCCESS = 1;
                DC(int64(0x29f374458c5b29d8), EConversationDebugInfo::Done);
                Print("Skipped G1R.UNITTEST_X = 0");
                DC(int64(0x29f374458c5b29e0), EConversationDebugInfo::Unimplemented);
                
                if (/* Skip: is_equal_to */ false)
                {
                    
                    Other.Remember(n"choice_unittest__002_01_does_force_end_co58892_exit_1");
                    DC(int64(0x29f374458c5b29e1), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x29f374458c5b29e1), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    
                    Other.Remember(n"choice_unittest__002_01_does_force_end_co58892_exit_2");
                }
            }
        }
        
        
        class UChoiceUnittest00203DoesForceEndCo58896 : UTopic_Hero__UNITTEST_UNITTEST_UNITTEST_2203
        {
            default DebugId = int64(0x63a90daab8466e0f);
            default Caption = LocText("TEXT_ANDRE_20220118_145144_1924");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceUnittest002ForceEndConversati58891);
            default Rules.HideIfKnows(UChoiceUnittest00203DoesForceEndCo58896);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x63a90daab8466e12), EConversationDebugInfo::Executing);
                G1R.UNITTEST_EXPECT_CONVERSATION_ENDED = 1;
                DC(int64(0x63a90daab8466e12), EConversationDebugInfo::Done);
                DC(int64(0x29f374458c5b29d8), EConversationDebugInfo::Executing);
                G1R.UNITTEST_SUCCESS = 1;
                DC(int64(0x29f374458c5b29d8), EConversationDebugInfo::Done);
                DC(int64(0x29f374458c5b29d7), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x29f374458c5b29d7), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceUnittest00203DoesForceEndCoSubd58896 : UTopic_Hero__UNITTEST_UNITTEST_UNITTEST_2203
        {
            default DebugId = int64(0x29f374458c5b29e4);
            default Caption = LocText("TEXT_ANDRE_20220118_145644_1924");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceUnittest00203DoesForceEndCoSubd58896);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x63a90daab8466e12), EConversationDebugInfo::Executing);
                G1R.UNITTEST_EXPECT_CONVERSATION_ENDED = 1;
                DC(int64(0x63a90daab8466e12), EConversationDebugInfo::Done);
                DC(int64(0x29f374458c5b29d8), EConversationDebugInfo::Executing);
                G1R.UNITTEST_SUCCESS = 1;
                DC(int64(0x29f374458c5b29d8), EConversationDebugInfo::Done);
                Subdialog(
                    UChoice62749
                );
                DC(int64(0xaac87f84bcd22736), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xaac87f84bcd22736), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoice62749 : UTopic_Hero__UNITTEST_UNITTEST_UNITTEST_2203
        {
            default DebugId = int64(0xaac87f84bcd22733);
            default Caption = LocText("TEXT_ANDRE_20220118_145939");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UChoice62749);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                
            }
        }
        
        
        class UChoiceUnittest00204DoesForceEndCo58894 : UTopic_Hero__UNITTEST_UNITTEST_UNITTEST_2203
        {
            default DebugId = int64(0xaac87f84bcd2273a);
            default Caption = LocText("TEXT_ANDRE_20220118_151357_2238");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceUnittest002ForceEndConversati58891);
            default Rules.HideIfKnows(UChoiceUnittest00204DoesForceEndCo58894);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x63a90daab8466e12), EConversationDebugInfo::Executing);
                G1R.UNITTEST_EXPECT_CONVERSATION_ENDED = 1;
                DC(int64(0x63a90daab8466e12), EConversationDebugInfo::Done);
                DC(int64(0x29f374458c5b29d8), EConversationDebugInfo::Executing);
                G1R.UNITTEST_SUCCESS = 1;
                DC(int64(0x29f374458c5b29d8), EConversationDebugInfo::Done);
                Subdialog(
                    UChoice63019,
                    UChoice63035
                );
                DC(int64(0xaac87f84bcd22747), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xaac87f84bcd22747), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoice63019 : UTopic_Hero__UNITTEST_UNITTEST_UNITTEST_2203
        {
            default DebugId = int64(0xaac87f84bcd22741);
            default Caption = LocText("TEXT_ANDRE_20220118_152127");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                
            }
        }
        
        
        class UChoice63035 : UTopic_Hero__UNITTEST_UNITTEST_UNITTEST_2203
        {
            default DebugId = int64(0xaac87f84bcd22744);
            default Caption = LocText("TEXT_ANDRE_20220118_152127_2785");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                
            }
        }
        
        
        class UChoiceUnittest002ForceEndConversati58891 : UTopic_Hero__UNITTEST_UNITTEST_UNITTEST_2203
        {
            default DebugId = int64(0x63a90daab8466e0b);
            default Caption = LocText("TEXT_ANDRE_20220118_145127_2083");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceUnittest002ForceEndConversati58891);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                
            }
        }
        
        
        class UChoiceUnittest00301DoesSubdialogWo58903 : UTopic_Hero__UNITTEST_UNITTEST_UNITTEST_2203
        {
            default DebugId = int64(0xaac87f84bcd229d5);
            default Caption = LocText("TEXT_ANDRE_20220118_164335_2316");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceUnittest003Subdialogs58902);
            default Rules.HideIfKnows(UChoiceUnittest00301DoesSubdialogWo58903);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xaac87f84bcd229e4), EConversationDebugInfo::Executing);
                G1R.UNITTEST_SELECT_SUBDIALOG_INDEX = 1;
                DC(int64(0xaac87f84bcd229e4), EConversationDebugInfo::Done);
                Subdialog(
                    UChoice66956,
                    UChoice66972
                );
            }
        }
        
        
        class UChoice66956 : UTopic_Hero__UNITTEST_UNITTEST_UNITTEST_2203
        {
            default DebugId = int64(0xaac87f84bcd229d8);
            default Caption = LocText("TEXT_ANDRE_20220118_164403");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                
            }
        }
        
        
        class UChoice66972 : UTopic_Hero__UNITTEST_UNITTEST_UNITTEST_2203
        {
            default DebugId = int64(0xaac87f84bcd229db);
            default Caption = LocText("TEXT_ANDRE_20220118_164403_153");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe3d9f648302ee3f4), EConversationDebugInfo::Executing);
                G1R.UNITTEST_SUCCESS = 1;
                DC(int64(0xe3d9f648302ee3f4), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceUnittest00302DoSubdialogCond58904 : UTopic_Hero__UNITTEST_UNITTEST_UNITTEST_2203
        {
            default DebugId = int64(0xaac87f84bcd229f0);
            default Caption = LocText("TEXT_ANDRE_20220118_164507_2332");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceUnittest003Subdialogs58902);
            default Rules.HideIfKnows(UChoiceUnittest00302DoSubdialogCond58904);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xaac87f84bcd229e4), EConversationDebugInfo::Executing);
                G1R.UNITTEST_SELECT_SUBDIALOG_INDEX = 1;
                DC(int64(0xaac87f84bcd229e4), EConversationDebugInfo::Done);
                Print("Skipped G1R.UNITTEST_X = 42");
                Subdialog(
                    UChoice67313,
                    UChoice67329,
                    UChoice67373
                );
            }
        }
        
        
        class UChoice67313 : UTopic_Hero__UNITTEST_UNITTEST_UNITTEST_2203
        {
            default DebugId = int64(0xaac87f84bcd229f4);
            default Caption = LocText("TEXT_ANDRE_20220118_164534");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe3d9f648302ee3f4), EConversationDebugInfo::Executing);
                G1R.UNITTEST_SUCCESS = 3;
                DC(int64(0xe3d9f648302ee3f4), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoice67329 : UTopic_Hero__UNITTEST_UNITTEST_UNITTEST_2203
        {
            default DebugId = int64(0xaac87f84bcd229f7);
            default Caption = LocText("TEXT_ANDRE_20220118_164534_3511");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DC(int64(0xaac87f84bcd229fd), EConversationDebugInfo::Unimplemented);
                }
                
                return /* Skip: is_equal_to */ false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe3d9f648302ee3f4), EConversationDebugInfo::Executing);
                G1R.UNITTEST_SUCCESS = 2;
                DC(int64(0xe3d9f648302ee3f4), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoice67373 : UTopic_Hero__UNITTEST_UNITTEST_UNITTEST_2203
        {
            default DebugId = int64(0xaac87f84bcd229fe);
            default Caption = LocText("TEXT_ANDRE_20220118_164618");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe3d9f648302ee3f4), EConversationDebugInfo::Executing);
                G1R.UNITTEST_SUCCESS = 1;
                DC(int64(0xe3d9f648302ee3f4), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceUnittest00303DoesReturnToLa58905 : UTopic_Hero__UNITTEST_UNITTEST_UNITTEST_2203
        {
            default DebugId = int64(0xaac87f84bcd22a09);
            default Caption = LocText("TEXT_ANDRE_20220118_165401_3346");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceUnittest003Subdialogs58902);
            default Rules.HideIfKnows(UChoiceUnittest00303DoesReturnToLa58905);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xaac87f84bcd229e4), EConversationDebugInfo::Executing);
                G1R.UNITTEST_SELECT_SUBDIALOG_INDEX = 0;
                DC(int64(0xaac87f84bcd229e4), EConversationDebugInfo::Done);
                Subdialog(
                    UChoice67718,
                    UChoice67734
                );
            }
        }
        
        
        class UChoice67718 : UTopic_Hero__UNITTEST_UNITTEST_UNITTEST_2203
        {
            default DebugId = int64(0xaac87f84bcd22a0d);
            default Caption = LocText("TEXT_ANDRE_20220118_165440");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe3d9f648302ee3f4), EConversationDebugInfo::Executing);
                G1R.UNITTEST_SUCCESS = 2;
                DC(int64(0xe3d9f648302ee3f4), EConversationDebugInfo::Done);
                DC(int64(0xaac87f84bcd22a15), EConversationDebugInfo::Executing);
                G1R.UNITTEST_SELECT_SUBDIALOG_INDEX = 1;
                DC(int64(0xaac87f84bcd22a15), EConversationDebugInfo::Done);
                DC(int64(0xaac87f84bcd22a18), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xaac87f84bcd22a18), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoice67734 : UTopic_Hero__UNITTEST_UNITTEST_UNITTEST_2203
        {
            default DebugId = int64(0xaac87f84bcd22a10);
            default Caption = LocText("TEXT_ANDRE_20220118_165440_3528");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe3d9f648302ee3f4), EConversationDebugInfo::Executing);
                G1R.UNITTEST_SUCCESS = 1;
                DC(int64(0xe3d9f648302ee3f4), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceUnittest003Subdialogs58902 : UTopic_Hero__UNITTEST_UNITTEST_UNITTEST_2203
        {
            default DebugId = int64(0xaac87f84bcd22949);
            default Caption = LocText("TEXT_ANDRE_20220118_164246_3750");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceUnittest003Subdialogs58902);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                
            }
        }
        
        
        class UChoiceUnittestPermanentDummy58901 : UTopic_Hero__UNITTEST_UNITTEST_UNITTEST_2203
        {
            default DebugId = int64(0xaac87f84bcd228bd);
            default Caption = LocText("TEXT_ANDRE_20220118_160745_443");
            default PriorityRank = 3;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */