#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_SC_NOV_THERON_1372N : UConversationCharacterSettings
        {
            default ForCharacter = n"SC_NOV_THERON_1372N";
        }
        
        
        class UTopic_Hero__SC_NOV_THERON_1372N : UG1RDialogTopic
        {
            default ForCharacter = n"SC_NOV_THERON_1372N";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetTheron() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceTheron105690 : UTopic_Hero__SC_NOV_THERON_1372N
        {
            default DebugId = int64(0x2ba398f203661e46);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2ba398f203661e45), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x2ba398f203661e45), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceTheron105706 : UTopic_Hero__SC_NOV_THERON_1372N
        {
            default DebugId = int64(0xcb6efa8d2649481);
            default Caption = LocText("TEXT_WIP_FZOWPVD_20251128_114727_2456");
            default PriorityRank = 3;
            default PropertyTags.AddTag(GameplayTag::Skill_WallClimbing_Trained);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_MTDQKAE_20250116_155343"), int64(0xcb6efa8d2649481));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x860ab569f75018e4), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Wallclimbing));
                }
                
                return Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Wallclimbing);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2ba398f203661e48), EConversationDebugInfo::Executing);
                // I'm ready. Teach me how to climb.
                Hero.AI.Say(LocText("TEXT_WIP_BQZJDOG_20241106_095749_41"));
                DC(int64(0x2ba398f203661e48), EConversationDebugInfo::Done);
                DB(int64(0xa7deef969d1cb655), Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Wallclimbing));
                
                if (Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Wallclimbing))
                {
                    DC(int64(0xa7deef969d1cb65f), EConversationDebugInfo::Executing);
                    // All right, here we go. First, and most important: know ...
                    Theron.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_160351"));
                    DC(int64(0xa7deef969d1cb65f), EConversationDebugInfo::Done);
                    DC(int64(0xa7deef969d1cb664), EConversationDebugInfo::Executing);
                    // Not every rockface can be climbed, and in time, you'll ...
                    Theron.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_160411"));
                    DC(int64(0xa7deef969d1cb664), EConversationDebugInfo::Done);
                    DC(int64(0xa7deef969d1cb665), EConversationDebugInfo::Executing);
                    // Now, once you're up there, mind your footing. Rookies ...
                    Theron.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_160537"));
                    DC(int64(0xa7deef969d1cb665), EConversationDebugInfo::Done);
                    DC(int64(0xa7deef969d1cb666), EConversationDebugInfo::Executing);
                    // And last but not least, keep your body really close to ...
                    Theron.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_160609"));
                    DC(int64(0xa7deef969d1cb666), EConversationDebugInfo::Done);
                    DC(int64(0xa7deef969d1cb667), EConversationDebugInfo::Executing);
                    // And yeah, that's it. Ready to hit that cliff? 
                    Theron.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_160657"));
                    DC(int64(0xa7deef969d1cb667), EConversationDebugInfo::Done);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_CLIMBINGCLIFFS, Document::UDocumentSegment_CH1_CLIMBINGCLIFFS_TeachCompleted);
                    DC(int64(0xcb6efa8d264947f), EConversationDebugInfo::Executing);
                    Hero.LearnSkill(UGE_Skill_Wallclimbing);
                    DC(int64(0xcb6efa8d264947f), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0xa7deef969d1cb657), EConversationDebugInfo::Executing);
                    // Eager students are the best kind. But you'll need some ...
                    Theron.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_160235"));
                    DC(int64(0xa7deef969d1cb657), EConversationDebugInfo::Done);
                    DC(int64(0xa7deef969d1cb65d), EConversationDebugInfo::Executing);
                    // Go out and get some - I'll be waiting. In a way.
                    Theron.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_160302"));
                    DC(int64(0xa7deef969d1cb65d), EConversationDebugInfo::Done);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_CLIMBINGCLIFFS, Document::UDocumentSegment_CH1_CLIMBINGCLIFFS_TeachMissPoints);
                    DC(int64(0xcb6efa8d264947d), EConversationDebugInfo::Executing);
                    ReturnToLastSelection(1);
                    DC(int64(0xcb6efa8d264947d), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UChoiceTheron142259 : UTopic_Hero__SC_NOV_THERON_1372N
        {
            default DebugId = int64(0x97808c64d1440df);
            default Caption = LocText("TEXT_WIP_MTDQKAE_20250116_150413");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceTheron142259);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x97808c64d1440dd), EConversationDebugInfo::Executing);
                // Hey! I'm new here. 
                Hero.AI.Say(LocText("TEXT_WIP_MTDQKAE_20250116_150413"));
                DC(int64(0x97808c64d1440dd), EConversationDebugInfo::Done);
                DC(int64(0x8e7c9b8fe465bcff), EConversationDebugInfo::Executing);
                
                // I can tell. 
                Theron.AI.Say(LocText("TEXT_WIP_DPPCYMI_20250122_144528"));
                DC(int64(0x8e7c9b8fe465bcff), EConversationDebugInfo::Done);
                DC(int64(0x8e7c9b8fe465bd00), EConversationDebugInfo::Executing);
                
                // Why's that? 
                Hero.AI.Say(LocText("TEXT_WIP_DPPCYMI_20250122_144538"));
                DC(int64(0x8e7c9b8fe465bd00), EConversationDebugInfo::Done);
                DC(int64(0x97808c64d1440de), EConversationDebugInfo::Executing);
                
                // Cause only a freshie would go around shaking hands. They ...
                Theron.AI.Say(LocText("TEXT_WIP_MTDQKAE_20250116_150413_41"));
                DC(int64(0x97808c64d1440de), EConversationDebugInfo::Done);
                DC(int64(0x8e7c9b8fe465bd01), EConversationDebugInfo::Executing);
                // Though you look like you can handle yourself. 
                Theron.AI.Say(LocText("TEXT_WIP_DPPCYMI_20250122_144624"));
                DC(int64(0x8e7c9b8fe465bd01), EConversationDebugInfo::Done);
                DC(int64(0x8e7c9b8fe465bd02), EConversationDebugInfo::Executing);
                // I'm Theron. Loyal follower of the holy Sleeper - or ...
                Theron.AI.Say(LocText("TEXT_WIP_DPPCYMI_20250122_144634"));
                DC(int64(0x8e7c9b8fe465bd02), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_NOV_THERON, Document::UDocumentSegment_Glossary_SC_NOV_THERON_Introduction);
            }
        }
        
        
        class UChoiceTheron142289 : UTopic_Hero__SC_NOV_THERON_1372N
        {
            default DebugId = int64(0x97808c64d1440e5);
            default Caption = LocText("TEXT_WIP_MTDQKAE_20250116_150558");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceTheron142289);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_MTDQKAE_20250116_153440"), int64(0x97808c64d1440e5));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x97808c64d1440e3), EConversationDebugInfo::Executing);
                // Where's that other spot?
                Hero.AI.Say(LocText("TEXT_WIP_MTDQKAE_20250116_150558"));
                DC(int64(0x97808c64d1440e3), EConversationDebugInfo::Done);
                DC(int64(0x8e7c9b8fe465bd29), EConversationDebugInfo::Executing);
                
                // Up the cliff. I could show you, but it's a bit of a ...
                Theron.AI.Say(LocText("TEXT_WIP_DPPCYMI_20250122_150011"));
                DC(int64(0x8e7c9b8fe465bd29), EConversationDebugInfo::Done);
                DC(int64(0x8e7c9b8fe465bd2a), EConversationDebugInfo::Executing);
                // Hmm ... you know what? Why don't you bring me some fresh ...
                Theron.AI.Say(LocText("TEXT_WIP_DPPCYMI_20250122_150103"));
                DC(int64(0x8e7c9b8fe465bd2a), EConversationDebugInfo::Done);
                DC(int64(0x97808c64d1440e8), EConversationDebugInfo::Executing);
                // A free climbing lesson, basically. Will come in useful ...
                Theron.AI.Say(LocText("TEXT_WIP_MTDQKAE_20250116_150647"));
                DC(int64(0x97808c64d1440e8), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_NOV_THERON, Document::UDocumentSegment_Glossary_SC_NOV_THERON_Teacher);
                Subdialog(
                    UTopic_Theron_142392,
                    UTopic_Theron_142412
                );
            }
        }
        
        
        class UTopic_Theron_142392 : UTopic_Hero__SC_NOV_THERON_1372N
        {
            default DebugId = int64(0x97808c64d1440f2);
            default Caption = LocText("TEXT_WIP_MTDQKAE_20250116_153106_2386");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Theron_142392);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x97808c64d1440f3), EConversationDebugInfo::Executing);
                // Why don't you get the rolls yourself?
                Hero.AI.Say(LocText("TEXT_WIP_MTDQKAE_20250116_153106_2386"));
                DC(int64(0x97808c64d1440f3), EConversationDebugInfo::Done);
                DC(int64(0x97808c64d1440fa), EConversationDebugInfo::Executing);
                
                // Cause Fortuno already gave me my daily fix. Plus, a ...
                Theron.AI.Say(LocText("TEXT_WIP_MTDQKAE_20250116_153244"));
                DC(int64(0x97808c64d1440fa), EConversationDebugInfo::Done);
                DC(int64(0x8e7c9b8fe465bd2b), EConversationDebugInfo::Executing);
                // Like I said, I can teach you how to climb and take you ...
                Theron.AI.Say(LocText("TEXT_WIP_DPPCYMI_20250122_150406"));
                DC(int64(0x8e7c9b8fe465bd2b), EConversationDebugInfo::Done);
                DC(int64(0x8e7c9b8fe465bd2c), EConversationDebugInfo::Executing);
                // It'll be worth it. 
                Theron.AI.Say(LocText("TEXT_WIP_DPPCYMI_20250122_150425"));
                DC(int64(0x8e7c9b8fe465bd2c), EConversationDebugInfo::Done);
                DC(int64(0x97808c64d1440f5), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x97808c64d1440f5), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Theron_142412 : UTopic_Hero__SC_NOV_THERON_1372N
        {
            default DebugId = int64(0x97808c64d1440f6);
            default Caption = LocText("TEXT_WIP_MTDQKAE_20250116_153106_1609");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Theron_142412);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x97808c64d1440f7), EConversationDebugInfo::Executing);
                // What kind of rolls do you want?
                Hero.AI.Say(LocText("TEXT_WIP_MTDQKAE_20250116_153106_1609"));
                DC(int64(0x97808c64d1440f7), EConversationDebugInfo::Done);
                DC(int64(0x97808c64d144102), EConversationDebugInfo::Executing);
                
                // Ohh, let's say, half a dozen of "Northern Dark".
                Theron.AI.Say(LocText("TEXT_WIP_MTDQKAE_20250116_153937"));
                DC(int64(0x97808c64d144102), EConversationDebugInfo::Done);
                DC(int64(0x8e7c9b8fe465bd2d), EConversationDebugInfo::Executing);
                
                // M'kay. I'll see what I can do.
                Hero.AI.Say(LocText("TEXT_WIP_DPPCYMI_20250122_150459"));
                DC(int64(0x8e7c9b8fe465bd2d), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_CLIMBINGCLIFFS, Document::UDocumentSegment_CH1_CLIMBINGCLIFFS_Start);
                DC(int64(0x97808c64d144105), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER1_CLIMBINGCLIFFS.StartQuest();
                DC(int64(0x97808c64d144105), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceTheron142600 : UTopic_Hero__SC_NOV_THERON_1372N
        {
            default DebugId = int64(0x97808c64d144108);
            default Caption = LocText("TEXT_WIP_MTDQKAE_20250116_154349");
            default PriorityRank = 3;
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_MTDQKAE_20250116_155316"), int64(0x97808c64d144108));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x97808c64d144118), Quest::SwampCamp_SCCHAPTER1_CLIMBINGCLIFFS != nullptr && Quest::SwampCamp_SCCHAPTER1_CLIMBINGCLIFFS.IsRunning());
                }
                
                return Quest::SwampCamp_SCCHAPTER1_CLIMBINGCLIFFS != nullptr && Quest::SwampCamp_SCCHAPTER1_CLIMBINGCLIFFS.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x97808c64d144106), EConversationDebugInfo::Executing);
                // About those smoke rolls you wanted ...
                Hero.AI.Say(LocText("TEXT_WIP_MTDQKAE_20250116_154349"));
                DC(int64(0x97808c64d144106), EConversationDebugInfo::Done);
                DC(int64(0x97808c64d144107), EConversationDebugInfo::Executing);
                
                // Yes?
                Theron.AI.Say(LocText("TEXT_WIP_MTDQKAE_20250116_154349_3569"));
                DC(int64(0x97808c64d144107), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Theron_142649,
                    UTopic_Theron_142669
                );
            }
        }
        
        
        class UTopic_Theron_142649 : UTopic_Hero__SC_NOV_THERON_1372N
        {
            default DebugId = int64(0x97808c64d14410c);
            default Caption = LocText("TEXT_WIP_MTDQKAE_20250116_154520_443");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Theron_142649);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x97808c64d144116), Hero != nullptr && Hero.HasItem(UItMi_Joint_02, 6, 0));
                }
                
                return Hero != nullptr && Hero.HasItem(UItMi_Joint_02, 6, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x97808c64d14410d), EConversationDebugInfo::Executing);
                // Here you go. 
                Hero.AI.Say(LocText("TEXT_WIP_MTDQKAE_20250116_154520_443"));
                DC(int64(0x97808c64d14410d), EConversationDebugInfo::Done);
                DC(int64(0x97808c64d14411a), EConversationDebugInfo::Executing);
                Hero.AI.GiveItemTo(Theron, UItMi_Joint_02, 6);
                DC(int64(0x97808c64d14411a), EConversationDebugInfo::Done);
                DC(int64(0x97808c64d14411b), EConversationDebugInfo::Executing);
                // Ahh. Nice and green. 
                Theron.AI.Say(LocText("TEXT_WIP_MTDQKAE_20250116_155144"));
                DC(int64(0x97808c64d14411b), EConversationDebugInfo::Done);
                DC(int64(0x97808c64d14411f), EConversationDebugInfo::Executing);
                // All right, time for my end of the bargain. I'll show you ...
                Theron.AI.Say(LocText("TEXT_WIP_MTDQKAE_20250116_155316"));
                DC(int64(0x97808c64d14411f), EConversationDebugInfo::Done);
                DC(int64(0x97808c64d144120), EConversationDebugInfo::Executing);
                // Let me know when you are ready.
                Theron.AI.Say(LocText("TEXT_WIP_MTDQKAE_20250116_155343"));
                DC(int64(0x97808c64d144120), EConversationDebugInfo::Done);
                DC(int64(0x138d345a7dba5168), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER1_CLIMBINGCLIFFS_CLIMBCLIFFS_OBJ_RETURN.SucceedQuest();
                DC(int64(0x138d345a7dba5168), EConversationDebugInfo::Done);
                DC(int64(0x138d345a7dba516b), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER1_CLIMBINGCLIFFS_CLIMBCLIFFS_OBJ_CLIMB.StartQuest();
                DC(int64(0x138d345a7dba516b), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Theron_142669 : UTopic_Hero__SC_NOV_THERON_1372N
        {
            default DebugId = int64(0x97808c64d144110);
            default Caption = LocText("TEXT_WIP_MTDQKAE_20250116_154520_491");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x97808c64d144111), EConversationDebugInfo::Executing);
                // I'm on it.
                Hero.AI.Say(LocText("TEXT_WIP_MTDQKAE_20250116_154520_491"));
                DC(int64(0x97808c64d144111), EConversationDebugInfo::Done);
                DC(int64(0x97808c64d144114), EConversationDebugInfo::Executing);
                
                // Good to know. 
                Theron.AI.Say(LocText("TEXT_WIP_MTDQKAE_20250116_154640"));
                DC(int64(0x97808c64d144114), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceTheron143057 : UTopic_Hero__SC_NOV_THERON_1372N
        {
            default DebugId = int64(0x97808c64d144127);
            default Caption = LocText("TEXT_WIP_MTDQKAE_20250116_160640");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceTheron143057);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x97808c64d14412a), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Wallclimbing));
                    DB(int64(0x97808c64d14412b), Quest::SwampCamp_SCCHAPTER1_CLIMBINGCLIFFS != nullptr && Quest::SwampCamp_SCCHAPTER1_CLIMBINGCLIFFS.IsRunning());
                }
                
                if (Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Wallclimbing))
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER1_CLIMBINGCLIFFS != nullptr && !Quest::SwampCamp_SCCHAPTER1_CLIMBINGCLIFFS.IsRunning())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x97808c64d144125), EConversationDebugInfo::Executing);
                
                // Let's go. 
                Hero.AI.Say(LocText("TEXT_WIP_MTDQKAE_20250116_160640"));
                DC(int64(0x97808c64d144125), EConversationDebugInfo::Done);
                DC(int64(0x97808c64d144126), EConversationDebugInfo::Executing);
                
                // Great. Follow me. 
                Theron.AI.Say(LocText("TEXT_WIP_MTDQKAE_20250116_160640_3750"));
                DC(int64(0x97808c64d144126), EConversationDebugInfo::Done);
                DC(int64(0x97808c64d14412d), EConversationDebugInfo::Executing);
                Theron.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Theron_1372N_VistaPoint);
                DC(int64(0x97808c64d14412d), EConversationDebugInfo::Done);
                DC(int64(0x97808c64d14412e), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x97808c64d14412e), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceTheron143136 : UTopic_Hero__SC_NOV_THERON_1372N
        {
            default DebugId = int64(0x97808c64d144131);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceTheron143136);
            
            default Rules.RequireCharacterCloseToWaypoint(n"HERO", n"FP_SC_SIT_GROUND2", 600.0f, int64(0x97808c64d144131));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x97808c64d144136), Quest::SwampCamp_SCCHAPTER1_CLIMBINGCLIFFS != nullptr && Quest::SwampCamp_SCCHAPTER1_CLIMBINGCLIFFS.IsRunning());
                }
                
                return Quest::SwampCamp_SCCHAPTER1_CLIMBINGCLIFFS != nullptr && Quest::SwampCamp_SCCHAPTER1_CLIMBINGCLIFFS.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x97808c64d144130), EConversationDebugInfo::Executing);
                // Ahh ... not too shabby, is it? I love this spot. 
                Theron.AI.Say(LocText("TEXT_WIP_MTDQKAE_20250116_161222_1340"));
                DC(int64(0x97808c64d144130), EConversationDebugInfo::Done);
                DC(int64(0x8e7c9b8fe465bd2e), EConversationDebugInfo::Executing);
                // Makes me forget I'll probably spend the rest of my days ...
                Theron.AI.Say(LocText("TEXT_WIP_DPPCYMI_20250122_150922"));
                DC(int64(0x8e7c9b8fe465bd2e), EConversationDebugInfo::Done);
                DC(int64(0x97808c64d144134), EConversationDebugInfo::Executing);
                // Here - have one. 
                Theron.AI.Say(LocText("TEXT_WIP_MTDQKAE_20250116_161704"));
                DC(int64(0x97808c64d144134), EConversationDebugInfo::Done);
                DC(int64(0x8e7c9b8fe465bd33), EConversationDebugInfo::Executing);
                
                // Thanks. 
                Hero.AI.Say(LocText("TEXT_WIP_DPPCYMI_20250122_151044"));
                DC(int64(0x8e7c9b8fe465bd33), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_NOV_THERON, Document::UDocumentSegment_Glossary_SC_NOV_THERON_Extra);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_CLIMBINGCLIFFS, Document::UDocumentSegment_CH1_CLIMBINGCLIFFS_ClimbCompleted);
                DC(int64(0x3399d06059b5acc7), EConversationDebugInfo::Executing);
                Theron.AddItemToInventory(UItMi_Joint_02, 1);
                DC(int64(0x3399d06059b5acc7), EConversationDebugInfo::Done);
                DC(int64(0x97808c64d144140), EConversationDebugInfo::Executing);
                Theron.AI.GiveItemTo(Hero, UItMi_Joint_02, 1);
                DC(int64(0x97808c64d144140), EConversationDebugInfo::Done);
                DC(int64(0x8e7c9b8fe465bd31), EConversationDebugInfo::Executing);
                // You really think you're stuck here? For good?
                Hero.AI.Say(LocText("TEXT_WIP_DPPCYMI_20250122_151016"));
                DC(int64(0x8e7c9b8fe465bd31), EConversationDebugInfo::Done);
                DC(int64(0x8e7c9b8fe465bd32), EConversationDebugInfo::Executing);
                
                // Don't you?
                Theron.AI.Say(LocText("TEXT_WIP_DPPCYMI_20250122_151016_3984"));
                DC(int64(0x8e7c9b8fe465bd32), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Theron_149868,
                    UTopic_Theron_149888,
                    UTopic_Theron_149910,
                    UTopic_Theron_150590
                );
                DC(int64(0x97808c64d14413a), EConversationDebugInfo::Executing);
                // But, you know, it ain't that bad once you get used to ...
                Theron.AI.Say(LocText("TEXT_WIP_MTDQKAE_20250116_162136_2316"));
                DC(int64(0x97808c64d14413a), EConversationDebugInfo::Done);
                DC(int64(0x174844111e9a745b), EConversationDebugInfo::Executing);
                
                // And if you got some swampweed.
                Hero.AI.Say(LocText("TEXT_WIP_WHVTSEI_20250123_082719"));
                DC(int64(0x174844111e9a745b), EConversationDebugInfo::Done);
                DC(int64(0x174844111e9a745c), EConversationDebugInfo::Executing);
                
                // That!
                Theron.AI.Say(LocText("TEXT_WIP_WHVTSEI_20250123_082728"));
                DC(int64(0x174844111e9a745c), EConversationDebugInfo::Done);
                DC(int64(0x8e7c9b8fe465bd4f), EConversationDebugInfo::Executing);
                // But hey, at least they didn't send us to the front to ...
                Theron.AI.Say(LocText("TEXT_WIP_DPPCYMI_20250122_151736"));
                DC(int64(0x8e7c9b8fe465bd4f), EConversationDebugInfo::Done);
                DC(int64(0x97808c64d14413b), EConversationDebugInfo::Executing);
                // Anyway, enough of the rambling. Do me a favor and keep ...
                Theron.AI.Say(LocText("TEXT_WIP_MTDQKAE_20250116_162229"));
                DC(int64(0x97808c64d14413b), EConversationDebugInfo::Done);
                DC(int64(0x8e7c9b8fe465bd50), EConversationDebugInfo::Executing);
                // Don't want this cliff to become the new Temple Square. 
                Theron.AI.Say(LocText("TEXT_WIP_DPPCYMI_20250122_151855"));
                DC(int64(0x8e7c9b8fe465bd50), EConversationDebugInfo::Done);
                DC(int64(0x8e7c9b8fe465bd51), EConversationDebugInfo::Executing);
                // I'll hang around some more and enjoy the view. 
                Theron.AI.Say(LocText("TEXT_WIP_DPPCYMI_20250122_151907"));
                DC(int64(0x8e7c9b8fe465bd51), EConversationDebugInfo::Done);
                DC(int64(0x97808c64d14413d), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER1_CLIMBINGCLIFFS_CLIMBCLIFFS_OBJ_CLIMB.SucceedQuest();
                DC(int64(0x97808c64d14413d), EConversationDebugInfo::Done);
                DC(int64(0x97808c64d14413e), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x97808c64d14413e), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Theron_149868 : UTopic_Hero__SC_NOV_THERON_1372N
        {
            default DebugId = int64(0x8e7c9b8fe465bd35);
            default Caption = LocText("TEXT_WIP_DPPCYMI_20250122_151135_1609");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Theron_149868);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8e7c9b8fe465bd36), EConversationDebugInfo::Executing);
                // No. I'll get out of here, one way or the other. 
                Hero.AI.Say(LocText("TEXT_WIP_DPPCYMI_20250122_151135_1609"));
                DC(int64(0x8e7c9b8fe465bd36), EConversationDebugInfo::Done);
                DC(int64(0x8e7c9b8fe465bd43), EConversationDebugInfo::Executing);
                
                // Hm. Maybe it's the herb speaking, but I actually believe ...
                Theron.AI.Say(LocText("TEXT_WIP_DPPCYMI_20250122_151230"));
                DC(int64(0x8e7c9b8fe465bd43), EConversationDebugInfo::Done);
                DC(int64(0x8e7c9b8fe465bd44), EConversationDebugInfo::Executing);
                // Remember me when you do, will you?
                Theron.AI.Say(LocText("TEXT_WIP_DPPCYMI_20250122_151251"));
                DC(int64(0x8e7c9b8fe465bd44), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Theron_149888 : UTopic_Hero__SC_NOV_THERON_1372N
        {
            default DebugId = int64(0x8e7c9b8fe465bd39);
            default Caption = LocText("TEXT_WIP_DPPCYMI_20250122_151135_2801");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Theron_149888);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8e7c9b8fe465bd3a), EConversationDebugInfo::Executing);
                
                // We'll see. For now, I'm just trying to survive. 
                Hero.AI.Say(LocText("TEXT_WIP_DPPCYMI_20250122_151135_2801"));
                DC(int64(0x8e7c9b8fe465bd3a), EConversationDebugInfo::Done);
                DC(int64(0x8e7c9b8fe465bd45), EConversationDebugInfo::Executing);
                
                // That sounds like a plan. People die like flies in this ...
                Theron.AI.Say(LocText("TEXT_WIP_DPPCYMI_20250122_151318"));
                DC(int64(0x8e7c9b8fe465bd45), EConversationDebugInfo::Done);
                DC(int64(0x8e7c9b8fe465bd46), EConversationDebugInfo::Executing);
                // Lost a good friend a year ago ... ah, well. Let's not go ...
                Theron.AI.Say(LocText("TEXT_WIP_DPPCYMI_20250122_151334"));
                DC(int64(0x8e7c9b8fe465bd46), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Theron_149910 : UTopic_Hero__SC_NOV_THERON_1372N
        {
            default DebugId = int64(0x8e7c9b8fe465bd3d);
            default Caption = LocText("TEXT_WIP_DPPCYMI_20250122_151141_443");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Theron_149910);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x8e7c9b8fe465bd42), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                }
                
                return Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8e7c9b8fe465bd3e), EConversationDebugInfo::Executing);
                
                // No. The Sleeper will save us. 
                Hero.AI.Say(LocText("TEXT_WIP_DPPCYMI_20250122_151141_443"));
                DC(int64(0x8e7c9b8fe465bd3e), EConversationDebugInfo::Done);
                DC(int64(0x8e7c9b8fe465bd47), EConversationDebugInfo::Executing);
                
                // Right. That's why we joined the "Loons," isn't it? 
                Theron.AI.Say(LocText("TEXT_WIP_DPPCYMI_20250122_151400"));
                DC(int64(0x8e7c9b8fe465bd47), EConversationDebugInfo::Done);
                DC(int64(0x8e7c9b8fe465bd48), EConversationDebugInfo::Executing);
                // I just wish he'd hurry up some. 
                Theron.AI.Say(LocText("TEXT_WIP_DPPCYMI_20250122_151424"));
                DC(int64(0x8e7c9b8fe465bd48), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Theron_150590 : UTopic_Hero__SC_NOV_THERON_1372N
        {
            default DebugId = int64(0x8e7c9b8fe465bd49);
            default Caption = LocText("TEXT_WIP_DPPCYMI_20250122_151436_1769");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Theron_150590);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8e7c9b8fe465bd4a), EConversationDebugInfo::Executing);
                
                // Maybe. 
                Hero.AI.Say(LocText("TEXT_WIP_DPPCYMI_20250122_151436_1769"));
                DC(int64(0x8e7c9b8fe465bd4a), EConversationDebugInfo::Done);
                DC(int64(0x8e7c9b8fe465bd4d), EConversationDebugInfo::Executing);
                
                // Yeah, that's what I told myself too when I first got ...
                Theron.AI.Say(LocText("TEXT_WIP_DPPCYMI_20250122_151510"));
                DC(int64(0x8e7c9b8fe465bd4d), EConversationDebugInfo::Done);
                DC(int64(0x8e7c9b8fe465bd4e), EConversationDebugInfo::Executing);
                // Place's got a habit of killing those "maybes" though. 
                Theron.AI.Say(LocText("TEXT_WIP_DPPCYMI_20250122_151527"));
                DC(int64(0x8e7c9b8fe465bd4e), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceTheron145855 : UTopic_Hero__SC_NOV_THERON_1372N
        {
            default DebugId = int64(0x8e7c9b8fe465bd03);
            default Caption = LocText("TEXT_WIP_MTDQKAE_20250116_150459");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceTheron142259);
            default Rules.HideIfKnows(UChoiceTheron145855);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x97808c64d1440e1), EConversationDebugInfo::Executing);
                
                // What are you doing all the way out here?
                Hero.AI.Say(LocText("TEXT_WIP_MTDQKAE_20250116_150459"));
                DC(int64(0x97808c64d1440e1), EConversationDebugInfo::Done);
                DC(int64(0x97808c64d1440e2), EConversationDebugInfo::Executing);
                
                // Taking a breather. I'm off duty for a bit, and this is ...
                Theron.AI.Say(LocText("TEXT_WIP_MTDQKAE_20250116_150501"));
                DC(int64(0x97808c64d1440e2), EConversationDebugInfo::Done);
                DC(int64(0x97808c64d1440fb), EConversationDebugInfo::Executing);
                // Or rather, my second favorite. There's another one ...
                Theron.AI.Say(LocText("TEXT_WIP_MTDQKAE_20250116_153440"));
                DC(int64(0x97808c64d1440fb), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceTheron145873 : UTopic_Hero__SC_NOV_THERON_1372N
        {
            default DebugId = int64(0x8e7c9b8fe465bd07);
            default Caption = LocText("TEXT_WIP_DPPCYMI_20250122_144851");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceTheron142259);
            default Rules.HideIfKnows(UChoiceTheron145873);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8e7c9b8fe465bd05), EConversationDebugInfo::Executing);
                
                // You don't sound too convinced of that whole Sleeper ...
                Hero.AI.Say(LocText("TEXT_WIP_DPPCYMI_20250122_144851"));
                DC(int64(0x8e7c9b8fe465bd05), EConversationDebugInfo::Done);
                DC(int64(0x8e7c9b8fe465bd06), EConversationDebugInfo::Executing);
                
                // Oh, but I am. I was just a lowly digger trying to get ...
                Theron.AI.Say(LocText("TEXT_WIP_DPPCYMI_20250122_144851_41"));
                DC(int64(0x8e7c9b8fe465bd06), EConversationDebugInfo::Done);
                DC(int64(0x8e7c9b8fe465bd09), EConversationDebugInfo::Executing);
                // Go to the Swamp Camp, he said. Follow Y'Berion, shave ...
                Theron.AI.Say(LocText("TEXT_WIP_DPPCYMI_20250122_145111"));
                DC(int64(0x8e7c9b8fe465bd09), EConversationDebugInfo::Done);
                DC(int64(0x8e7c9b8fe465bd0a), EConversationDebugInfo::Executing);
                
                // He said that? "Get some tattoos?"
                Hero.AI.Say(LocText("TEXT_WIP_DPPCYMI_20250122_145152"));
                DC(int64(0x8e7c9b8fe465bd0a), EConversationDebugInfo::Done);
                DC(int64(0x8e7c9b8fe465bd0b), EConversationDebugInfo::Executing);
                
                // Well he made it sound a bit more poetic, but yeah. ...
                Theron.AI.Say(LocText("TEXT_WIP_DPPCYMI_20250122_145200"));
                DC(int64(0x8e7c9b8fe465bd0b), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceTheron146878 : UTopic_Hero__SC_NOV_THERON_1372N
        {
            default DebugId = int64(0x8e7c9b8fe465bd0e);
            default Caption = LocText("TEXT_WIP_DPPCYMI_20250122_145311");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceTheron142259);
            default Rules.HideIfKnows(UChoiceTheron146878);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8e7c9b8fe465bd0c), EConversationDebugInfo::Executing);
                
                // How did you end up here? 
                Hero.AI.Say(LocText("TEXT_WIP_DPPCYMI_20250122_145311"));
                DC(int64(0x8e7c9b8fe465bd0c), EConversationDebugInfo::Done);
                DC(int64(0x8e7c9b8fe465bd0d), EConversationDebugInfo::Executing);
                
                // You mean in the Colony?
                Theron.AI.Say(LocText("TEXT_WIP_DPPCYMI_20250122_145311_2238"));
                DC(int64(0x8e7c9b8fe465bd0d), EConversationDebugInfo::Done);
                DC(int64(0x8e7c9b8fe465bd10), EConversationDebugInfo::Executing);
                
                // Yeah. 
                Hero.AI.Say(LocText("TEXT_WIP_DPPCYMI_20250122_145325"));
                DC(int64(0x8e7c9b8fe465bd10), EConversationDebugInfo::Done);
                DC(int64(0x8e7c9b8fe465bd11), EConversationDebugInfo::Executing);
                
                // Oh, nothing to write home about. Stole from a merchant, ...
                Theron.AI.Say(LocText("TEXT_WIP_DPPCYMI_20250122_145327"));
                DC(int64(0x8e7c9b8fe465bd11), EConversationDebugInfo::Done);
                DC(int64(0x8e7c9b8fe465bd13), EConversationDebugInfo::Executing);
                // You? 
                Theron.AI.Say(LocText("TEXT_WIP_DPPCYMI_20250122_145408"));
                DC(int64(0x8e7c9b8fe465bd13), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Theron_147093,
                    UTopic_Theron_147113,
                    UTopic_Theron_147162,
                    UTopic_Theron_147243
                );
            }
        }
        
        
        class UTopic_Theron_147093 : UTopic_Hero__SC_NOV_THERON_1372N
        {
            default DebugId = int64(0x8e7c9b8fe465bd15);
            default Caption = LocText("TEXT_WIP_DPPCYMI_20250122_145414_2785");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Theron_147093);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8e7c9b8fe465bd16), EConversationDebugInfo::Executing);
                // I killed someone. 
                Hero.AI.Say(LocText("TEXT_WIP_DPPCYMI_20250122_145414_2785"));
                DC(int64(0x8e7c9b8fe465bd16), EConversationDebugInfo::Done);
                DC(int64(0x8e7c9b8fe465bd28), EConversationDebugInfo::Executing);
                
                // Really? Didn't peg you for the type. Well, you're in ...
                Theron.AI.Say(LocText("TEXT_WIP_DPPCYMI_20250122_145539"));
                DC(int64(0x8e7c9b8fe465bd28), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Theron_147113 : UTopic_Hero__SC_NOV_THERON_1372N
        {
            default DebugId = int64(0x8e7c9b8fe465bd19);
            default Caption = LocText("TEXT_WIP_DPPCYMI_20250122_145414_3286");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Theron_147113);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8e7c9b8fe465bd1a), EConversationDebugInfo::Executing);
                
                // I pissed off the wrong people. 
                Hero.AI.Say(LocText("TEXT_WIP_DPPCYMI_20250122_145414_3286"));
                DC(int64(0x8e7c9b8fe465bd1a), EConversationDebugInfo::Done);
                DC(int64(0x8e7c9b8fe465bd27), EConversationDebugInfo::Executing);
                
                // Happens so fast, doesn't it? Ah, well. It is what it is. 
                Theron.AI.Say(LocText("TEXT_WIP_DPPCYMI_20250122_145525"));
                DC(int64(0x8e7c9b8fe465bd27), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Theron_147162 : UTopic_Hero__SC_NOV_THERON_1372N
        {
            default DebugId = int64(0x8e7c9b8fe465bd1d);
            default Caption = LocText("TEXT_WIP_DPPCYMI_20250122_145424_686");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Theron_147162);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8e7c9b8fe465bd1e), EConversationDebugInfo::Executing);
                
                // I slept with the wrong woman. 
                Hero.AI.Say(LocText("TEXT_WIP_DPPCYMI_20250122_145424_686"));
                DC(int64(0x8e7c9b8fe465bd1e), EConversationDebugInfo::Done);
                DC(int64(0x8e7c9b8fe465bd26), EConversationDebugInfo::Executing);
                
                // Yeah? Well, good thing I never cared for them.
                Theron.AI.Say(LocText("TEXT_WIP_DPPCYMI_20250122_145507"));
                DC(int64(0x8e7c9b8fe465bd26), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Theron_147243 : UTopic_Hero__SC_NOV_THERON_1372N
        {
            default DebugId = int64(0x8e7c9b8fe465bd21);
            default Caption = LocText("TEXT_WIP_DPPCYMI_20250122_145443_2386");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Theron_147243);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8e7c9b8fe465bd22), EConversationDebugInfo::Executing);
                
                // Let's not go there. 
                Hero.AI.Say(LocText("TEXT_WIP_DPPCYMI_20250122_145443_2386"));
                DC(int64(0x8e7c9b8fe465bd22), EConversationDebugInfo::Done);
                DC(int64(0x8e7c9b8fe465bd25), EConversationDebugInfo::Executing);
                
                // Sure. 
                Theron.AI.Say(LocText("TEXT_WIP_DPPCYMI_20250122_145503"));
                DC(int64(0x8e7c9b8fe465bd25), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceTheron157335 : UTopic_Hero__SC_NOV_THERON_1372N
        {
            default DebugId = int64(0xed4abbb5972f50b5);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceTheron157335);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xdcba2e5afdadf7b7), Hero != nullptr && Hero.IsCloseToCharacter(Theron, 600.0f));
                    DB(int64(0xdcba2e5afdadf7b9), G1R != nullptr && G1R.IsInChapter(3));
                }
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Theron, 600.0f))
                    return false;
                
                if (G1R != nullptr && !G1R.IsInChapter(3))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xed4abbb5972f50b4), EConversationDebugInfo::Executing);
                // It's all such a mess ... I'll just stay out here for a ...
                Theron.AI.Say(LocText("TEXT_WIP_WSLLGEC_20250214_100236_2801"));
                DC(int64(0xed4abbb5972f50b4), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */