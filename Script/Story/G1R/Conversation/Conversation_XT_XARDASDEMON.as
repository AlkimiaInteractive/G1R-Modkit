#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_XT_XARDASDEMON : UConversationCharacterSettings
        {
            default ForCharacter = n"XT_XARDASDEMON";
        }
        
        
        class UTopic_Hero__XT_XARDASDEMON : UG1RDialogTopic
        {
            default ForCharacter = n"XT_XARDASDEMON";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetXardasDemon() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetXardas() const property
            {
                return GetCharacter(n"XT_DMB_XARDAS_404");
            }
        }
        
        
        class UChoiceXardasdemon105037 : UTopic_Hero__XT_XARDASDEMON
        {
            default DebugId = int64(0x233794188ff4b810);
            default Caption = LocText("TEXT_WIP_ISMIFZI_20240625_184533");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceXardasdemonIntro);
            default Rules.HideIfKnows(UChoiceXardasdemon105037);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x233794188ff4b80a), EConversationDebugInfo::Executing);
                // What sort of demon are you?
                Hero.AI.Say(LocText("TEXT_WIP_ISMIFZI_20240625_184533"), ForceCameraPreset = n"INDIVIDUAL MEDIUM DEMON NH");
                DC(int64(0x233794188ff4b80a), EConversationDebugInfo::Done);
                DC(int64(0x233794188ff4b80b), EConversationDebugInfo::Executing);
                
                // The sort that hates pointless questions. 
                XardasDemon.AI.Say(LocText("TEXT_WIP_ISMIFZI_20240625_184533_2238"), ForceCameraPreset = n"OVER THE SHOULDER MEDIUM DEMON");
                DC(int64(0x233794188ff4b80b), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceXardasdemon99664 : UTopic_Hero__XT_XARDASDEMON
        {
            default DebugId = int64(0x9fd660402597aad9);
            default Caption = FText::FromString("[Followup Topic]");;
            default bIsFollowupTopic = true;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceXardasdemonFireheart);
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceXardasdemonIceheart);
            default Rules.AllowIfCharacterHasKnowledgeOfId(n"choice_xardasdemon_masterhow_exit_1");
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceXardasdemonStoneheart);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DB(int64(0x9fd660402597aadc), G1R.FindGolemHearts == 2);
                DB(int64(0x9fd660402597aae2), G1R.FindGolemHearts == 3);
                DB(int64(0x9fd660402597aaec), G1R.FindGolemHearts == 4);
                
                if (G1R.FindGolemHearts == 2)
                {
                    DC(int64(0x9fd660402597aade), EConversationDebugInfo::Executing);
                    // But that's just the first one. Bring me the rest. 
                    XardasDemon.AI.Say(LocText("TEXT_WIP_JMEKYPF_20240611_160437_2238"), ForceCameraPreset = n"OVER THE SHOULDER MEDIUM DEMON");
                    DC(int64(0x9fd660402597aade), EConversationDebugInfo::Done);
                    DC(int64(0x427fd42d1dee2b4c), EConversationDebugInfo::Executing);
                    ReturnToLastSelection(1);
                    DC(int64(0x427fd42d1dee2b4c), EConversationDebugInfo::Done);
                }
                else if (G1R.FindGolemHearts == 3)
                {
                    DC(int64(0xa1699a727a3598b9), EConversationDebugInfo::Executing);
                    // Hmm.. One more to go. I must say, I wasn't expecting to ...
                    XardasDemon.AI.Say(LocText("TEXT_WIP_HSMIFZI_20240626_193151"), ForceCameraPreset = n"INDIVIDUAL MEDIUM DEMON");
                    DC(int64(0xa1699a727a3598b9), EConversationDebugInfo::Done);
                    DC(int64(0xa1699a727a3598be), EConversationDebugInfo::Executing);
                    
                    // I'm tenacious ... 
                    Hero.AI.Say(LocText("TEXT_WIP_HSMIFZI_20240626_193339"), ForceCameraPreset = n"INDIVIDUAL MEDIUM DEMON NH");
                    DC(int64(0xa1699a727a3598be), EConversationDebugInfo::Done);
                    DC(int64(0xa1699a727a3598bd), EConversationDebugInfo::Executing);
                    
                    // (grunts in displeasure) That's the worst sort. All those ...
                    XardasDemon.AI.Say(LocText("TEXT_WIP_HSMIFZI_20240626_193323"), ForceCameraPreset = n"OVER THE SHOULDER MEDIUM DEMON");
                    DC(int64(0xa1699a727a3598bd), EConversationDebugInfo::Done);
                    DC(int64(0xa7deef969d1cb3f6), EConversationDebugInfo::Executing);
                    // Aaaanyway. One more to go. 
                    XardasDemon.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_133924"));
                    DC(int64(0xa7deef969d1cb3f6), EConversationDebugInfo::Done);
                    DC(int64(0x427fd42d1dee2b52), EConversationDebugInfo::Executing);
                    ReturnToLastSelection(1);
                    DC(int64(0x427fd42d1dee2b52), EConversationDebugInfo::Done);
                }
                else if (G1R.FindGolemHearts == 4)
                {
                    DC(int64(0xa1699a727a3598c3), EConversationDebugInfo::Executing);
                    // (deep sigh) Well, all right then, you passed my test. ...
                    XardasDemon.AI.Say(LocText("TEXT_WIP_HSMIFZI_20240626_193944"), ForceCameraPreset = n"OVER THE SHOULDER MEDIUM DEMON");
                    DC(int64(0xa1699a727a3598c3), EConversationDebugInfo::Done);
                    DC(int64(0x9fd660402597aaf2), EConversationDebugInfo::Executing);
                    
                    // Can I see Xardas now or not? 
                    Hero.AI.Say(LocText("TEXT_WIP_JMEKYPF_20240611_160704"), ForceCameraPreset = n"INDIVIDUAL MEDIUM DEMON NH");
                    DC(int64(0x9fd660402597aaf2), EConversationDebugInfo::Done);
                    DC(int64(0xa1699a727a3598c4), EConversationDebugInfo::Executing);
                    
                    // Yes, yes, don't get your knickers in a twist. Here. This ...
                    XardasDemon.AI.Say(LocText("TEXT_WIP_HSMIFZI_20240626_194057"), ForceCameraPreset = n"INDIVIDUAL MEDIUM DEMON");
                    DC(int64(0xa1699a727a3598c4), EConversationDebugInfo::Done);
                    DC(int64(0xa1699a727a3598c5), EConversationDebugInfo::Executing);
                    // He'll know I let you through. Good luck up there, ...
                    XardasDemon.AI.Say(LocText("TEXT_WIP_HSMIFZI_20240626_194159"), ForceCameraPreset = n"OVER THE SHOULDER MEDIUM DEMON");
                    DC(int64(0xa1699a727a3598c5), EConversationDebugInfo::Done);
                    DC(int64(0xb4aa8f8f32bf1253), EConversationDebugInfo::Executing);
                    Hero.AddItemToInventory(UItAr_Rune_TeleportToNecromancer, 1);
                    DC(int64(0xb4aa8f8f32bf1253), EConversationDebugInfo::Done);
                    DC(int64(0x7f47097acc18c62d), EConversationDebugInfo::Executing);
                    G1R.OpenXardasTowerDoor();
                    DC(int64(0x7f47097acc18c62d), EConversationDebugInfo::Done);
                    DC(int64(0xe61ad584b339451b), EConversationDebugInfo::Executing);
                    Quest::NewCamp_NCCHAPTER4_FINDXARDAS_FINDXARDAS_OBJ_HEARTS.SucceedQuest();
                    DC(int64(0xe61ad584b339451b), EConversationDebugInfo::Done);
                    DC(int64(0x679bfa6041e69e5f), EConversationDebugInfo::Executing);
                    if (ensure(IsValid(Xardas))) { Xardas.ExchangeDailyRoutineToClass(UDailyRoutine_XT_DMB_Xardas_404_FirstMet); }
                    DC(int64(0x679bfa6041e69e5f), EConversationDebugInfo::Done);
                    DC(int64(0x7858bf075764a202), EConversationDebugInfo::Executing);
                    XardasDemon.RemoveImmortality();
                    DC(int64(0x7858bf075764a202), EConversationDebugInfo::Done);
                    DC(int64(0xe8fb270472e296d5), EConversationDebugInfo::Executing);
                    Hero.RemoveItemFromInventory(UItAt_Firegolem_01, 1, 0);
                    DC(int64(0xe8fb270472e296d5), EConversationDebugInfo::Done);
                    DC(int64(0xe8fb270472e296d7), EConversationDebugInfo::Executing);
                    Hero.RemoveItemFromInventory(UItAt_Icegolem_01, 1, 0);
                    DC(int64(0xe8fb270472e296d7), EConversationDebugInfo::Done);
                    DC(int64(0xe8fb270472e296d9), EConversationDebugInfo::Executing);
                    Hero.RemoveItemFromInventory(UItAt_Stonegolem_01, 1, 0);
                    DC(int64(0xe8fb270472e296d9), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_xardasdemon_99664_exit_1");
                    DC(int64(0x9fd660402597aaf6), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x9fd660402597aaf6), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    
                    Other.Remember(n"choice_xardasdemon_99664_exit_2");
                }
            }
        }
        
        
        class UChoiceXardasdemonExit : UTopic_Hero__XT_XARDASDEMON
        {
            default DebugId = int64(0x1f230b9e6bcad4f8);
            default Caption = LocText("TEXT_WIP_HSMIFZI_20240626_194536");
            default PriorityRank = 5;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa1699a727a3598cc), EConversationDebugInfo::Executing);
                // I'll be going.
                Hero.AI.Say(LocText("TEXT_WIP_HSMIFZI_20240626_194536"), ForceCameraPreset = n"INDIVIDUAL MEDIUM DEMON NH");
                DC(int64(0xa1699a727a3598cc), EConversationDebugInfo::Done);
                DC(int64(0xa1699a727a3598cb), EConversationDebugInfo::Executing);
                
                // No need to inform me. 
                XardasDemon.AI.Say(LocText("TEXT_WIP_HSMIFZI_20240626_194500"), ForceCameraPreset = n"INDIVIDUAL MEDIUM DEMON");
                DC(int64(0xa1699a727a3598cb), EConversationDebugInfo::Done);
                DC(int64(0x1f230b9e6bcad4fb), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x1f230b9e6bcad4fb), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceXardasdemonFireheart : UTopic_Hero__XT_XARDASDEMON
        {
            default DebugId = int64(0x1f230b9e6bcad528);
            default Caption = LocText("INFO_XARDASDEMON_FIREHEART_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOfId(n"choice_xardasdemon_masterhow_exit_2");
            default Rules.HideIfKnows(UChoiceXardasdemonFireheart);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x1f230b9e6bcad529), Hero != nullptr && Hero.HasItem(UItAt_Firegolem_01, 1, 0));
                }
                
                return Hero != nullptr && Hero.HasItem(UItAt_Firegolem_01, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1f230b9e6bcad52a), EConversationDebugInfo::Executing);
                // How about this? The heart of a fire golem.
                Hero.AI.Say(LocText("INFO_XARDASDEMON_FIREHEART_15_01"), ForceCameraPreset = n"INDIVIDUAL MEDIUM DEMON NH");
                DC(int64(0x1f230b9e6bcad52a), EConversationDebugInfo::Done);
                DC(int64(0xa1699a727a3598b8), EConversationDebugInfo::Executing);
                
                // Ugh I can see that just fine, thank you.
                XardasDemon.AI.Say(LocText("TEXT_WIP_HSMIFZI_20240626_193013"), ForceCameraPreset = n"INDIVIDUAL MEDIUM DEMON");
                DC(int64(0xa1699a727a3598b8), EConversationDebugInfo::Done);
                DC(int64(0x1f230b9e6bcad52b), EConversationDebugInfo::Executing);
                Hero.RemoveItemFromInventory(UItAt_Firegolem_01, 1, 0);
                DC(int64(0x1f230b9e6bcad52b), EConversationDebugInfo::Done);
                DC(int64(0x53c571b55fb33bb6), EConversationDebugInfo::Executing);
                G1R.FindGolemHearts += 1;
                DC(int64(0x53c571b55fb33bb6), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceXardasdemonIceheart : UTopic_Hero__XT_XARDASDEMON
        {
            default DebugId = int64(0x1f230b9e6bcad524);
            default Caption = LocText("INFO_XARDASDEMON_ICEHEART_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOfId(n"choice_xardasdemon_masterhow_exit_2");
            default Rules.HideIfKnows(UChoiceXardasdemonIceheart);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x1f230b9e6bcad525), Hero != nullptr && Hero.HasItem(UItAt_Icegolem_01, 1, 0));
                }
                
                return Hero != nullptr && Hero.HasItem(UItAt_Icegolem_01, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1f230b9e6bcad526), EConversationDebugInfo::Executing);
                // Here. The heart of an ice golem. 
                Hero.AI.Say(LocText("INFO_XARDASDEMON_ICEHEART_15_01"), ForceCameraPreset = n"INDIVIDUAL MEDIUM DEMON NH");
                DC(int64(0x1f230b9e6bcad526), EConversationDebugInfo::Done);
                DC(int64(0xa1699a727a3598ba), EConversationDebugInfo::Executing);
                
                // Mm. And you didn't just loot it off a dead one? 
                XardasDemon.AI.Say(LocText("TEXT_WIP_HSMIFZI_20240626_193214"), ForceCameraPreset = n"OVER THE SHOULDER MEDIUM DEMON");
                DC(int64(0xa1699a727a3598ba), EConversationDebugInfo::Done);
                DC(int64(0xa1699a727a3598bb), EConversationDebugInfo::Executing);
                
                // No. 
                Hero.AI.Say(LocText("TEXT_WIP_HSMIFZI_20240626_193245"), ForceCameraPreset = n"INDIVIDUAL CLOSE UP DEMON NH");
                DC(int64(0xa1699a727a3598bb), EConversationDebugInfo::Done);
                DC(int64(0xa1699a727a3598bc), EConversationDebugInfo::Executing);
                
                // Wouldn't be the first who tried that trick. Ah, well. ...
                XardasDemon.AI.Say(LocText("TEXT_WIP_HSMIFZI_20240626_193247"), ForceCameraPreset = n"INDIVIDUAL MEDIUM DEMON");
                DC(int64(0xa1699a727a3598bc), EConversationDebugInfo::Done);
                DC(int64(0x53c571b55fb33bb8), EConversationDebugInfo::Executing);
                G1R.FindGolemHearts += 1;
                DC(int64(0x53c571b55fb33bb8), EConversationDebugInfo::Done);
                DC(int64(0xa0487c26f1e0dee9), EConversationDebugInfo::Executing);
                Hero.RemoveItemFromInventory(UItAt_Icegolem_01, 1, 0);
                DC(int64(0xa0487c26f1e0dee9), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceXardasdemonIntro : UTopic_Hero__XT_XARDASDEMON
        {
            default DebugId = int64(0x1f230b9e6bcad4fc);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceXardasdemonIntro);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x1f230b9e6bcad4fd), Quest::NewCamp_NCCHAPTER4_FINDXARDAS != nullptr && Quest::NewCamp_NCCHAPTER4_FINDXARDAS.HasBeenStarted());
                }
                
                return Quest::NewCamp_NCCHAPTER4_FINDXARDAS != nullptr && Quest::NewCamp_NCCHAPTER4_FINDXARDAS.HasBeenStarted();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4989ca8d055ccfb5), EConversationDebugInfo::Executing);
                // (deep, bored sigh) Yes. I can speak. 
                XardasDemon.AI.Say(LocText("TEXT_WIP_ISMIFZI_20240625_184028"), ForceCameraPreset = n"INDIVIDUAL MEDIUM DEMON");
                DC(int64(0x4989ca8d055ccfb5), EConversationDebugInfo::Done);
                DC(int64(0xa57ccdc3c7144e44), EConversationDebugInfo::Executing);
                Quest::CreaturesGlossary_DemonGlossary_DemonUnlock.SucceedQuest();
                DC(int64(0xa57ccdc3c7144e44), EConversationDebugInfo::Done);
                DC(int64(0x1f230b9e6bcad4ff), EConversationDebugInfo::Executing);
                // What ...?
                Hero.AI.Say(LocText("INFO_XARDASDEMON_INTRO_15_01"), ForceCameraPreset = n"INDIVIDUAL MEDIUM DEMON NH");
                DC(int64(0x1f230b9e6bcad4ff), EConversationDebugInfo::Done);
                DC(int64(0x233794188ff4b7f4), EConversationDebugInfo::Executing);
                
                // It's what you were going to ask, isn't it? YES, I'm a ...
                XardasDemon.AI.Say(LocText("TEXT_WIP_ISMIFZI_20240625_184059"), ForceCameraPreset = n"INDIVIDUAL MEDIUM DEMON");
                DC(int64(0x233794188ff4b7f4), EConversationDebugInfo::Done);
                DC(int64(0x233794188ff4b7f5), EConversationDebugInfo::Executing);
                // Which is so mind-numbingly boring I sometimes wish my ...
                XardasDemon.AI.Say(LocText("TEXT_WIP_ISMIFZI_20240625_184204"), ForceCameraPreset = n"OVER THE SHOULDER MEDIUM DEMON");
                DC(int64(0x233794188ff4b7f5), EConversationDebugInfo::Done);
                DC(int64(0x233794188ff4b816), EConversationDebugInfo::Executing);
                // Anyway, "it is what it is," as you mortals say when ...
                XardasDemon.AI.Say(LocText("TEXT_WIP_ISMIFZI_20240625_184612"), ForceCameraPreset = n"INDIVIDUAL CLOSE UP DEMON");
                DC(int64(0x233794188ff4b816), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceXardasdemonMasterhow : UTopic_Hero__XT_XARDASDEMON
        {
            default DebugId = int64(0x1f230b9e6bcad50c);
            default Caption = LocText("INFO_XARDASDEMON_MASTERHOW_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceXardasdemonIntro);
            default Rules.HideIfKnows(UChoiceXardasdemonMasterhow);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1f230b9e6bcad50e), EConversationDebugInfo::Executing);
                
                // I need to talk to Xardas. The Water Mages need his help.
                Hero.AI.Say(LocText("INFO_XARDASDEMON_MASTERHOW_15_01"), ForceCameraPreset = n"INDIVIDUAL MEDIUM DEMON NH");
                DC(int64(0x1f230b9e6bcad50e), EConversationDebugInfo::Done);
                DC(int64(0x233794188ff4b826), EConversationDebugInfo::Executing);
                
                // The Water Mages, huh? Interesting ... very well, I'm in ...
                XardasDemon.AI.Say(LocText("TEXT_WIP_ISMIFZI_20240625_185543"), ForceCameraPreset = n"OVER THE SHOULDER MEDIUM DEMON");
                DC(int64(0x233794188ff4b826), EConversationDebugInfo::Done);
                DC(int64(0x233794188ff4b82a), EConversationDebugInfo::Executing);
                // IF you prove yourself worthy. 
                XardasDemon.AI.Say(LocText("TEXT_WIP_ISMIFZI_20240625_185709"), ForceCameraPreset = n"INDIVIDUAL CLOSE UP DEMON");
                DC(int64(0x233794188ff4b82a), EConversationDebugInfo::Done);
                DC(int64(0x233794188ff4b82b), EConversationDebugInfo::Executing);
                
                // A test?
                Hero.AI.Say(LocText("TEXT_WIP_ISMIFZI_20240625_185721"), ForceCameraPreset = n"INDIVIDUAL CLOSE UP DEMON NH");
                DC(int64(0x233794188ff4b82b), EConversationDebugInfo::Done);
                DC(int64(0x233794188ff4b827), EConversationDebugInfo::Executing);
                
                // Yes. Now, I could wax on about "victory over the ...
                XardasDemon.AI.Say(LocText("TEXT_WIP_ISMIFZI_20240625_185610"), ForceCameraPreset = n"OVER THE SHOULDER MEDIUM DEMON");
                DC(int64(0x233794188ff4b827), EConversationDebugInfo::Done);
                DC(int64(0x233794188ff4b82c), EConversationDebugInfo::Executing);
                // -OR I could just tell you to destroy a stone, an ice, ...
                XardasDemon.AI.Say(LocText("TEXT_WIP_ISMIFZI_20240625_185749"), ForceCameraPreset = n"INDIVIDUAL MEDIUM DEMON");
                DC(int64(0x233794188ff4b82c), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH4_FINDXARDAS, Document::UDocumentSegment_CH4_FINDXARDAS_Demon);
                DC(int64(0xe61ad584b3394513), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER4_FINDXARDAS_FINDXARDAS_OBJ_HEARTS.StartQuest();
                DC(int64(0xe61ad584b3394513), EConversationDebugInfo::Done);
                DB(int64(0xa0487c26f1e0df13), Hero != nullptr && Hero.HasItem(UItAt_Firegolem_01, 1, 0));
                DB(int64(0xa0487c26f1e0df4d), Hero != nullptr && Hero.HasItem(UItAt_Icegolem_01, 1, 0));
                DB(int64(0xa0487c26f1e0df4e), Hero != nullptr && Hero.HasItem(UItAt_Stonegolem_01, 1, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItAt_Firegolem_01, 1, 0) && Hero != nullptr && Hero.HasItem(UItAt_Icegolem_01, 1, 0) && Hero != nullptr && Hero.HasItem(UItAt_Stonegolem_01, 1, 0))
                {
                    DC(int64(0x4ff6b7288743d929), EConversationDebugInfo::Executing);
                    // That's convenient. I already have them.
                    Hero.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_202227"), ForceCameraPreset = n"INDIVIDUAL MEDIUM DEMON NH");
                    DC(int64(0x4ff6b7288743d929), EConversationDebugInfo::Done);
                    DC(int64(0x4ff6b7288743d92a), EConversationDebugInfo::Executing);
                    
                    // What?! Show me. 
                    XardasDemon.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_202227_41"), ForceCameraPreset = n"INDIVIDUAL CLOSE UP DEMON");
                    DC(int64(0x4ff6b7288743d92a), EConversationDebugInfo::Done);
                    DC(int64(0x427fd42d1ded9f76), EConversationDebugInfo::Executing);
                    G1R.FindGolemHearts = 4;
                    DC(int64(0x427fd42d1ded9f76), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_xardasdemon_masterhow_exit_1");
                }
                else
                {
                    DC(int64(0x233794188ff4b829), EConversationDebugInfo::Executing);
                    // ... I'll get you those hearts. 
                    Hero.AI.Say(LocText("TEXT_WIP_ISMIFZI_20240625_185643"), ForceCameraPreset = n"INDIVIDUAL MEDIUM DEMON NH");
                    DC(int64(0x233794188ff4b829), EConversationDebugInfo::Done);
                    DC(int64(0x233794188ff4b82d), EConversationDebugInfo::Executing);
                    
                    // And just like that, we saved ourselves a lot of time. ...
                    XardasDemon.AI.Say(LocText("TEXT_WIP_ISMIFZI_20240625_185908"), ForceCameraPreset = n"OVER THE SHOULDER MEDIUM DEMON");
                    DC(int64(0x233794188ff4b82d), EConversationDebugInfo::Done);
                    DC(int64(0x1f230b9e6bcad515), EConversationDebugInfo::Executing);
                    G1R.FindGolemHearts = 1;
                    DC(int64(0x1f230b9e6bcad515), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_xardasdemon_masterhow_exit_2");
                }
            }
        }
        
        
        class UChoiceXardasdemonMasterwho : UTopic_Hero__XT_XARDASDEMON
        {
            default DebugId = int64(0x1f230b9e6bcad507);
            default Caption = LocText("INFO_XARDASDEMON_MASTERWHO_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceXardasdemonIntro);
            default Rules.HideIfKnows(UChoiceXardasdemonMasterwho);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1f230b9e6bcad508), EConversationDebugInfo::Executing);
                // So ... your master is Xardas? 
                Hero.AI.Say(LocText("INFO_XARDASDEMON_MASTERWHO_15_01"), ForceCameraPreset = n"INDIVIDUAL MEDIUM DEMON NH");
                DC(int64(0x1f230b9e6bcad508), EConversationDebugInfo::Done);
                DC(int64(0x233794188ff4b825), EConversationDebugInfo::Executing);
                
                // That is what I just said, yes. 
                XardasDemon.AI.Say(LocText("TEXT_WIP_ISMIFZI_20240625_185508"), ForceCameraPreset = n"INDIVIDUAL MEDIUM DEMON");
                DC(int64(0x233794188ff4b825), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceXardasdemonNoheart : UTopic_Hero__XT_XARDASDEMON
        {
            default DebugId = int64(0x1f230b9e6bcad516);
            default Caption = LocText("INFO_XARDASDEMON_NOHEART_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOfId(n"choice_xardasdemon_masterhow_exit_2");
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x1f230b9e6bcad51a), G1R.FindGolemHearts < 4);
                }
                
                return G1R.FindGolemHearts < 4;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1f230b9e6bcad51b), EConversationDebugInfo::Executing);
                
                // What is it you need me to do again?
                Hero.AI.Say(LocText("INFO_XARDASDEMON_NOHEART_15_01"), ForceCameraPreset = n"INDIVIDUAL MEDIUM DEMON NH");
                DC(int64(0x1f230b9e6bcad51b), EConversationDebugInfo::Done);
                DC(int64(0xa1699a727a3598c6), EConversationDebugInfo::Executing);
                
                // Are you joking? I just told you. 
                XardasDemon.AI.Say(LocText("TEXT_WIP_HSMIFZI_20240626_194322"), ForceCameraPreset = n"INDIVIDUAL MEDIUM DEMON");
                DC(int64(0xa1699a727a3598c6), EConversationDebugInfo::Done);
                DC(int64(0xa1699a727a3598c7), EConversationDebugInfo::Executing);
                
                // Well ... 
                Hero.AI.Say(LocText("TEXT_WIP_HSMIFZI_20240626_194338"), ForceCameraPreset = n"INDIVIDUAL CLOSE UP DEMON NH");
                DC(int64(0xa1699a727a3598c7), EConversationDebugInfo::Done);
                DC(int64(0xa1699a727a3598c8), EConversationDebugInfo::Executing);
                
                // Three golem hearts, ice, fire, and stone, fresh from ...
                XardasDemon.AI.Say(LocText("TEXT_WIP_HSMIFZI_20240626_194340"), ForceCameraPreset = n"OVER THE SHOULDER MEDIUM DEMON");
                DC(int64(0xa1699a727a3598c8), EConversationDebugInfo::Done);
                DC(int64(0xa1699a727a3598c9), EConversationDebugInfo::Executing);
                // That good enough, or do you need me to write it down for ...
                XardasDemon.AI.Say(LocText("TEXT_WIP_HSMIFZI_20240626_194357"), ForceCameraPreset = n"INDIVIDUAL CLOSE UP DEMON");
                DC(int64(0xa1699a727a3598c9), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceXardasdemonStoneheart : UTopic_Hero__XT_XARDASDEMON
        {
            default DebugId = int64(0x1f230b9e6bcad51f);
            default Caption = LocText("INFO_XARDASDEMON_STONEHEART_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOfId(n"choice_xardasdemon_masterhow_exit_2");
            default Rules.HideIfKnows(UChoiceXardasdemonStoneheart);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x1f230b9e6bcad520), Hero != nullptr && Hero.HasItem(UItAt_Stonegolem_01, 1, 0));
                }
                
                return Hero != nullptr && Hero.HasItem(UItAt_Stonegolem_01, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1f230b9e6bcad521), EConversationDebugInfo::Executing);
                
                // Here. The heart of a stone golem. 
                Hero.AI.Say(LocText("INFO_XARDASDEMON_STONEHEART_15_01"), ForceCameraPreset = n"INDIVIDUAL MEDIUM DEMON NH");
                DC(int64(0x1f230b9e6bcad521), EConversationDebugInfo::Done);
                DC(int64(0xa1699a727a3598c1), EConversationDebugInfo::Executing);
                
                // I don't believe it. Show me that. 
                XardasDemon.AI.Say(LocText("TEXT_WIP_HSMIFZI_20240626_193834"), ForceCameraPreset = n"OVER THE SHOULDER MEDIUM DEMON");
                DC(int64(0xa1699a727a3598c1), EConversationDebugInfo::Done);
                DC(int64(0xa1699a727a3598c2), EConversationDebugInfo::Executing);
                // Hmm ... fine. For a second, I thought that was just an ...
                XardasDemon.AI.Say(LocText("TEXT_WIP_HSMIFZI_20240626_193906"), ForceCameraPreset = n"INDIVIDUAL CLOSE UP DEMON");
                DC(int64(0xa1699a727a3598c2), EConversationDebugInfo::Done);
                DC(int64(0x53c571b55fb33bb4), EConversationDebugInfo::Executing);
                G1R.FindGolemHearts += 1;
                DC(int64(0x53c571b55fb33bb4), EConversationDebugInfo::Done);
                DC(int64(0xa0487c26f1e0deeb), EConversationDebugInfo::Executing);
                Hero.RemoveItemFromInventory(UItAt_Stonegolem_01, 1, 0);
                DC(int64(0xa0487c26f1e0deeb), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */