#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OC_VLK_SNAF_581 : UConversationCharacterSettings
        {
            default ForCharacter = n"OC_VLK_SNAF_581";
        }
        
        
        class UTopic_Hero__OC_VLK_SNAF_581 : UG1RDialogTopic
        {
            default ForCharacter = n"OC_VLK_SNAF_581";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetSnaf() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceSnaf107580 : UTopic_Hero__OC_VLK_SNAF_581
        {
            default DebugId = int64(0x7846da8cd7b7c460);
            default Caption = LocText("TEXT_WIP_RNGRNMJ_20241118_172639");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceSnaf107580);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x72b17fe1b2301456), Quest::OldCamp_OCCHAPTER1_FORGOTEN_RECIPE != nullptr && Quest::OldCamp_OCCHAPTER1_FORGOTEN_RECIPE.IsRunning());
                }
                
                return Quest::OldCamp_OCCHAPTER1_FORGOTEN_RECIPE != nullptr && Quest::OldCamp_OCCHAPTER1_FORGOTEN_RECIPE.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7846da8cd7b7c45a), EConversationDebugInfo::Executing);
                // I found this recipe. Take a look. 
                Hero.AI.Say(LocText("TEXT_WIP_RNGRNMJ_20241118_172639"));
                DC(int64(0x7846da8cd7b7c45a), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_FORGOTENRECIPE, Document::UDocumentSegment_CH1_FORGOTENRECIPE_Entry2);
                DC(int64(0x7846da8cd7b7c463), EConversationDebugInfo::Executing);
                Hero.AI.GiveItemTo(Snaf, UItMs_Scroll_OldRecipe, 1);
                DC(int64(0x7846da8cd7b7c463), EConversationDebugInfo::Done);
                DC(int64(0x7846da8cd7b7c468), EConversationDebugInfo::Executing);
                // Recipe? Lemme see ... 
                Snaf.AI.Say(LocText("TEXT_WIP_RNGRNMJ_20241118_172819"), Posture = GameplayTag::Posture_Standing_Forced_ReadRecipe);
                DC(int64(0x7846da8cd7b7c468), EConversationDebugInfo::Done);
                DC(int64(0x7846da8cd7b7c46e), EConversationDebugInfo::Executing);
                // Well, put a spear up me arse and call me a bloodfly. ...
                Snaf.AI.Say(LocText("TEXT_WIP_RNGRNMJ_20241118_172836"), Posture = GameplayTag::Posture_Standing_Neutral);
                DC(int64(0x7846da8cd7b7c46e), EConversationDebugInfo::Done);
                DC(int64(0x2e6552b90d2b80df), EConversationDebugInfo::Executing);
                
                // Who's Old Brock? 
                Hero.AI.Say(LocText("TEXT_WIP_NIYYDND_20241120_131935"));
                DC(int64(0x2e6552b90d2b80df), EConversationDebugInfo::Done);
                DC(int64(0x38515711ea67a88a), EConversationDebugInfo::Executing);
                
                // He used to cook for the warders - and didn't have to pay ...
                Snaf.AI.Say(LocText("TEXT_WIP_TXJCZWK_20241119_174242"));
                DC(int64(0x38515711ea67a88a), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Snaf_107853,
                    UTopic_Snaf_107873,
                    UTopic_Snaf_108023
                );
            }
        }
        
        
        class UTopic_Snaf_107853 : UTopic_Hero__OC_VLK_SNAF_581
        {
            default DebugId = int64(0x7846da8cd7b7c47b);
            default Caption = LocText("TEXT_WIP_RNGRNMJ_20241118_173052_1924");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Snaf_107853);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7846da8cd7b7c47c), EConversationDebugInfo::Executing);
                // Where did Brock go? 
                Hero.AI.Say(LocText("TEXT_WIP_RNGRNMJ_20241118_173052_1924"));
                DC(int64(0x7846da8cd7b7c47c), EConversationDebugInfo::Done);
                DC(int64(0x7846da8cd7b7c487), EConversationDebugInfo::Executing);
                
                // Tried to get out, as all the old fools do at some point. 
                Snaf.AI.Say(LocText("TEXT_WIP_RNGRNMJ_20241118_173138"));
                DC(int64(0x7846da8cd7b7c487), EConversationDebugInfo::Done);
                DC(int64(0x2e6552b90d2b80f4), EConversationDebugInfo::Executing);
                // He said he'd found a way to get through the Barrier, but ...
                Snaf.AI.Say(LocText("TEXT_WIP_NIYYDND_20241120_132326"));
                DC(int64(0x2e6552b90d2b80f4), EConversationDebugInfo::Done);
                DC(int64(0x7846da8cd7b7c47e), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x7846da8cd7b7c47e), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Snaf_107873 : UTopic_Hero__OC_VLK_SNAF_581
        {
            default DebugId = int64(0x7846da8cd7b7c47f);
            default Caption = LocText("TEXT_WIP_RNGRNMJ_20241118_173052_3436");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Snaf_107873);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x7846da8cd7b7c48b), Hero != nullptr && Hero.HasSaid(LocText("TEXT_WIP_RNGRNMJ_20241118_173052_1924")));
                }
                
                return Hero != nullptr && Hero.HasSaid(LocText("TEXT_WIP_RNGRNMJ_20241118_173052_1924"));
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7846da8cd7b7c480), EConversationDebugInfo::Executing);
                // Did you know him well? 
                Hero.AI.Say(LocText("TEXT_WIP_RNGRNMJ_20241118_173052_3436"));
                DC(int64(0x7846da8cd7b7c480), EConversationDebugInfo::Done);
                DC(int64(0x7846da8cd7b7c488), EConversationDebugInfo::Executing);
                
                // Ah, as well as any of the poor sods in here. Was an all ...
                Snaf.AI.Say(LocText("TEXT_WIP_RNGRNMJ_20241118_173219"));
                DC(int64(0x7846da8cd7b7c488), EConversationDebugInfo::Done);
                DC(int64(0x7846da8cd7b7c482), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x7846da8cd7b7c482), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Snaf_108023 : UTopic_Hero__OC_VLK_SNAF_581
        {
            default DebugId = int64(0x7846da8cd7b7c490);
            default Caption = LocText("TEXT_WIP_RNGRNMJ_20241118_173623_3286");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Snaf_108023);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7846da8cd7b7c491), EConversationDebugInfo::Executing);
                // Some of the ingredients on the recipe are smudged. Do ...
                Hero.AI.Say(LocText("TEXT_WIP_RNGRNMJ_20241118_173623_3286"));
                DC(int64(0x7846da8cd7b7c491), EConversationDebugInfo::Done);
                DC(int64(0x7846da8cd7b7c498), EConversationDebugInfo::Executing);
                
                // Not really ... but this should be enough for me to guess ...
                Snaf.AI.Say(LocText("TEXT_WIP_RNGRNMJ_20241118_173732"));
                DC(int64(0x7846da8cd7b7c498), EConversationDebugInfo::Done);
                DC(int64(0x7846da8cd7b7c499), EConversationDebugInfo::Executing);
                // How's this: you get me the stuff for the stew, and I'll ...
                Snaf.AI.Say(LocText("TEXT_WIP_RNGRNMJ_20241118_173813"));
                DC(int64(0x7846da8cd7b7c499), EConversationDebugInfo::Done);
                DC(int64(0x2e6552b90d2b80f5), EConversationDebugInfo::Executing);
                // But I want a ladle meself. Been dyin' to try it, but he ...
                Snaf.AI.Say(LocText("TEXT_WIP_NIYYDND_20241120_133105"));
                DC(int64(0x2e6552b90d2b80f5), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Snaf_108203,
                    UTopic_Snaf_108223
                );
            }
        }
        
        
        class UTopic_Snaf_108203 : UTopic_Hero__OC_VLK_SNAF_581
        {
            default DebugId = int64(0x7846da8cd7b7c4a0);
            default Caption = LocText("TEXT_WIP_RNGRNMJ_20241118_174024_686");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Snaf_108203);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7846da8cd7b7c4a1), EConversationDebugInfo::Executing);
                // Sounds good.
                Hero.AI.Say(LocText("TEXT_WIP_RNGRNMJ_20241118_174024_686"));
                DC(int64(0x7846da8cd7b7c4a1), EConversationDebugInfo::Done);
                DC(int64(0x7846da8cd7b7c4ad), EConversationDebugInfo::Executing);
                
                // That's what I wanted to hear. So, you'll need scavenger ...
                Snaf.AI.Say(LocText("TEXT_WIP_RNGRNMJ_20241118_175440"));
                DC(int64(0x7846da8cd7b7c4ad), EConversationDebugInfo::Done);
                DC(int64(0x7846da8cd7b7c4ae), EConversationDebugInfo::Executing);
                // And obviously, solanaceae. It's a rare herb that grows ...
                Snaf.AI.Say(LocText("TEXT_WIP_RNGRNMJ_20241118_175459"));
                DC(int64(0x7846da8cd7b7c4ae), EConversationDebugInfo::Done);
                DC(int64(0x2e6552b90d2b80f7), EConversationDebugInfo::Executing);
                
                // Meat, onions, carrot, potatoes, and solanaceae. Got it. 
                Hero.AI.Say(LocText("TEXT_WIP_NIYYDND_20241120_133440"));
                DC(int64(0x2e6552b90d2b80f7), EConversationDebugInfo::Done);
                DC(int64(0x72b17fe1b2301311), EConversationDebugInfo::Executing);
                
                // I reckon Brock used wine, but I think water will do the ...
                Snaf.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_101635"));
                DC(int64(0x72b17fe1b2301311), EConversationDebugInfo::Done);
                DC(int64(0x72b17fe1b2301312), EConversationDebugInfo::Executing);
                // Get double o' everythin' - I'll need me own bits if I'm ...
                Snaf.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_101658"));
                DC(int64(0x72b17fe1b2301312), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_FORGOTENRECIPE, Document::UDocumentSegment_CH1_FORGOTENRECIPE_Entry3);
                DC(int64(0x72b17fe1b230157e), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_FORGOTEN_RECIPE_FORGOTEN_RECIPE_OBJ_INGREDIENTS.StartQuest();
                DC(int64(0x72b17fe1b230157e), EConversationDebugInfo::Done);
                DC(int64(0x72b17fe1b230131b), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x72b17fe1b230131b), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Snaf_108223 : UTopic_Hero__OC_VLK_SNAF_581
        {
            default DebugId = int64(0x7846da8cd7b7c4a4);
            default Caption = LocText("TEXT_WIP_RNGRNMJ_20241118_174024_3984");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Snaf_108223);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7846da8cd7b7c4a5), EConversationDebugInfo::Executing);
                // Not interested.
                Hero.AI.Say(LocText("TEXT_WIP_RNGRNMJ_20241118_174024_3984"));
                DC(int64(0x7846da8cd7b7c4a5), EConversationDebugInfo::Done);
                DC(int64(0x7846da8cd7b7c4ac), EConversationDebugInfo::Executing);
                
                // Suit yourself. Though I'd think twice about throwin' ...
                Snaf.AI.Say(LocText("TEXT_WIP_RNGRNMJ_20241118_174212"));
                DC(int64(0x7846da8cd7b7c4ac), EConversationDebugInfo::Done);
                DC(int64(0x7846da8cd7b7c4b7), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x7846da8cd7b7c4b7), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceSnaf107977 : UTopic_Hero__OC_VLK_SNAF_581
        {
            default DebugId = int64(0x72b17fe1b2301326);
            default Caption = LocText("TEXT_WIP_QNGRNMJ_20241119_102156");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Snaf_108203);
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Snaf_1082032);
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_QNGRNMJ_20241119_102811_1924"), int64(0x72b17fe1b2301326));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x72b17fe1b230140b), Quest::OldCamp_OCCHAPTER1_FORGOTEN_RECIPE != nullptr && Quest::OldCamp_OCCHAPTER1_FORGOTEN_RECIPE.IsRunning());
                }
                
                return Quest::OldCamp_OCCHAPTER1_FORGOTEN_RECIPE != nullptr && Quest::OldCamp_OCCHAPTER1_FORGOTEN_RECIPE.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x72b17fe1b2301320), EConversationDebugInfo::Executing);
                // I got the ingredients for Brock's stew. 
                Hero.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_102156"));
                DC(int64(0x72b17fe1b2301320), EConversationDebugInfo::Done);
                DB(int64(0x72b17fe1b2301329), Hero != nullptr && Hero.HasItem(UItFo_Whitemeat, 2, 0));
                DB(int64(0x72b17fe1b2301334), Hero != nullptr && Hero.HasItem(UItFo_Carrot, 2, 0));
                DB(int64(0x72b17fe1b2301335), Hero != nullptr && Hero.HasItem(UItFo_Onion, 2, 0));
                DB(int64(0x72b17fe1b2301336), Hero != nullptr && Hero.HasItem(UItFo_Potato, 2, 0));
                DB(int64(0x72b17fe1b2301337), Hero != nullptr && Hero.HasItem(UItFo_Potion_Water_01, 2, 0));
                DB(int64(0x72b17fe1b2301338), Hero != nullptr && Hero.HasItem(UItFo_Plants_Nightshadow_01, 2, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItFo_Whitemeat, 2, 0) && Hero != nullptr && Hero.HasItem(UItFo_Carrot, 2, 0) && Hero != nullptr && Hero.HasItem(UItFo_Onion, 2, 0) && Hero != nullptr && Hero.HasItem(UItFo_Potato, 2, 0) && Hero != nullptr && Hero.HasItem(UItFo_Potion_Water_01, 2, 0) && Hero != nullptr && Hero.HasItem(UItFo_Plants_Nightshadow_01, 2, 0))
                {
                    DC(int64(0x7a46dbca127c4c8b), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Snaf, UItFo_Whitemeat, 1);
                    DC(int64(0x7a46dbca127c4c8b), EConversationDebugInfo::Done);
                    DC(int64(0x139d8f01c6e61e49), EConversationDebugInfo::Executing);
                    Hero.RemoveItemFromInventory(UItFo_Carrot, 1, 0);
                    DC(int64(0x139d8f01c6e61e49), EConversationDebugInfo::Done);
                    DC(int64(0x139d8f01c6e61e4b), EConversationDebugInfo::Executing);
                    Hero.RemoveItemFromInventory(UItFo_Onion, 1, 0);
                    DC(int64(0x139d8f01c6e61e4b), EConversationDebugInfo::Done);
                    DC(int64(0x139d8f01c6e61e4d), EConversationDebugInfo::Executing);
                    Hero.RemoveItemFromInventory(UItFo_Potato, 1, 0);
                    DC(int64(0x139d8f01c6e61e4d), EConversationDebugInfo::Done);
                    DC(int64(0x139d8f01c6e61e4f), EConversationDebugInfo::Executing);
                    Hero.RemoveItemFromInventory(UItFo_Potion_Water_01, 1, 0);
                    DC(int64(0x139d8f01c6e61e4f), EConversationDebugInfo::Done);
                    DC(int64(0x139d8f01c6e61e51), EConversationDebugInfo::Executing);
                    Hero.RemoveItemFromInventory(UItFo_Plants_Nightshadow_01, 1, 0);
                    DC(int64(0x139d8f01c6e61e51), EConversationDebugInfo::Done);
                    DC(int64(0x139d8f01c6e61e53), EConversationDebugInfo::Executing);
                    Snaf.AddItemToInventory(UItFo_Carrot, 1);
                    DC(int64(0x139d8f01c6e61e53), EConversationDebugInfo::Done);
                    DC(int64(0x139d8f01c6e61e55), EConversationDebugInfo::Executing);
                    Snaf.AddItemToInventory(UItFo_Onion, 1);
                    DC(int64(0x139d8f01c6e61e55), EConversationDebugInfo::Done);
                    DC(int64(0x139d8f01c6e61e57), EConversationDebugInfo::Executing);
                    Snaf.AddItemToInventory(UItFo_Potato, 1);
                    DC(int64(0x139d8f01c6e61e57), EConversationDebugInfo::Done);
                    DC(int64(0x139d8f01c6e61e59), EConversationDebugInfo::Executing);
                    Snaf.AddItemToInventory(UItFo_Potion_Water_01, 1);
                    DC(int64(0x139d8f01c6e61e59), EConversationDebugInfo::Done);
                    DC(int64(0x139d8f01c6e61e5b), EConversationDebugInfo::Executing);
                    Snaf.AddItemToInventory(UItFo_Plants_Nightshadow_01, 1);
                    DC(int64(0x139d8f01c6e61e5b), EConversationDebugInfo::Done);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_FORGOTENRECIPE, Document::UDocumentSegment_CH1_FORGOTENRECIPE_Entry4);
                    DC(int64(0x72b17fe1b230134d), EConversationDebugInfo::Executing);
                    // Ahh. Good job. All right then, watch and learn. 
                    Snaf.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_102811_1924"));
                    DC(int64(0x72b17fe1b230134d), EConversationDebugInfo::Done);
                    DC(int64(0x72b17fe1b2301354), EConversationDebugInfo::Executing);
                    // First off, you've gotta sear the scavenger meat 'til ...
                    Snaf.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_102817"));
                    DC(int64(0x72b17fe1b2301354), EConversationDebugInfo::Done);
                    DC(int64(0x72b17fe1b2301355), EConversationDebugInfo::Executing);
                    // Next, you chuck in the onions, the potatoes, and the ...
                    Snaf.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_102826"));
                    DC(int64(0x72b17fe1b2301355), EConversationDebugInfo::Done);
                    DC(int64(0x72b17fe1b2301356), EConversationDebugInfo::Executing);
                    // Brock always said it helps the aromas unfold, and he ...
                    Snaf.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_102847"));
                    DC(int64(0x72b17fe1b2301356), EConversationDebugInfo::Done);
                    DC(int64(0x72b17fe1b2301357), EConversationDebugInfo::Executing);
                    // Finally, add the water and let it all simmer 'til the ...
                    Snaf.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_102918"));
                    DC(int64(0x72b17fe1b2301357), EConversationDebugInfo::Done);
                    DC(int64(0x72b17fe1b2301358), EConversationDebugInfo::Executing);
                    // I'm tellin' you, that stew is hearty enough to keep you ...
                    Snaf.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_102936"));
                    DC(int64(0x72b17fe1b2301358), EConversationDebugInfo::Done);
                    DC(int64(0x38515711ea67a88d), EConversationDebugInfo::Executing);
                    // Mmh, tasty. You can take a whiff - but this bowl's just ...
                    Snaf.AI.Say(LocText("TEXT_WIP_TXJCZWK_20241119_192053"));
                    DC(int64(0x38515711ea67a88d), EConversationDebugInfo::Done);
                    DC(int64(0x38515711ea67a88e), EConversationDebugInfo::Executing);
                    
                    // All right.
                    Hero.AI.Say(LocText("TEXT_WIP_TXJCZWK_20241119_192213"));
                    DC(int64(0x38515711ea67a88e), EConversationDebugInfo::Done);
                    DC(int64(0x38515711ea67a88f), EConversationDebugInfo::Executing);
                    
                    // Now that you know how it's done you can cook 'til you've ...
                    Snaf.AI.Say(LocText("TEXT_WIP_TXJCZWK_20241119_192223"));
                    DC(int64(0x38515711ea67a88f), EConversationDebugInfo::Done);
                    DC(int64(0x72b17fe1b23015f6), EConversationDebugInfo::Executing);
                    Quest::OldCamp_OCCHAPTER1_FORGOTEN_RECIPE_FORGOTEN_RECIPE_OBJ_INGREDIENTS.SucceedQuest();
                    DC(int64(0x72b17fe1b23015f6), EConversationDebugInfo::Done);
                    DC(int64(0x9733703e835840f9), EConversationDebugInfo::Executing);
                    Hero.LearnRecipe(UReFo_Ottostew);
                    DC(int64(0x9733703e835840f9), EConversationDebugInfo::Done);
                    Subdialog(
                        UTopic_Snaf_108073,
                        UTopic_Snaf_108093
                    );
                }
                else
                {
                    DC(int64(0x72b17fe1b230133a), EConversationDebugInfo::Executing);
                    // Got 'em where? Don't play games with me, lad. 
                    Snaf.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_102708_2238"));
                    DC(int64(0x72b17fe1b230133a), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UTopic_Snaf_108073 : UTopic_Hero__OC_VLK_SNAF_581
        {
            default DebugId = int64(0x72b17fe1b230135a);
            default Caption = LocText("TEXT_WIP_QNGRNMJ_20241119_103122_2785");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Snaf_108073);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x72b17fe1b230135b), EConversationDebugInfo::Executing);
                // You call adding herbs to a stew "real magic"?
                Hero.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_103122_2785"));
                DC(int64(0x72b17fe1b230135b), EConversationDebugInfo::Done);
                DC(int64(0x72b17fe1b2301366), EConversationDebugInfo::Executing);
                
                // That's right. I might not be wearin' a robe and readin' ...
                Snaf.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_103355"));
                DC(int64(0x72b17fe1b2301366), EConversationDebugInfo::Done);
                DC(int64(0x72b17fe1b2301367), EConversationDebugInfo::Executing);
                // Most ingredients do have their own magic to them - it's ...
                Snaf.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_103435"));
                DC(int64(0x72b17fe1b2301367), EConversationDebugInfo::Done);
                DC(int64(0x72b17fe1b2301368), EConversationDebugInfo::Executing);
                // A good stew might not put you back on your feet as fast ...
                Snaf.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_103808"));
                DC(int64(0x72b17fe1b2301368), EConversationDebugInfo::Done);
                DC(int64(0x72b17fe1b230135d), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x72b17fe1b230135d), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Snaf_108093 : UTopic_Hero__OC_VLK_SNAF_581
        {
            default DebugId = int64(0x72b17fe1b230135e);
            default Caption = LocText("TEXT_WIP_QNGRNMJ_20241119_103122_3286");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Snaf_108093);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x72b17fe1b230135f), EConversationDebugInfo::Executing);
                // I'll get right to it.
                Hero.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_103122_3286"));
                DC(int64(0x72b17fe1b230135f), EConversationDebugInfo::Done);
                DC(int64(0x72b17fe1b230137f), EConversationDebugInfo::Executing);
                
                // Remember - crush the herbs fresh. Makes all the ...
                Snaf.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_104042"));
                DC(int64(0x72b17fe1b230137f), EConversationDebugInfo::Done);
                DC(int64(0x72b17fe1b230161b), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_FORGOTEN_RECIPE_FORGOTEN_RECIPE_OBJ_CRAFT.StartQuest();
                DC(int64(0x72b17fe1b230161b), EConversationDebugInfo::Done);
                DC(int64(0x72b17fe1b2301371), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x72b17fe1b2301371), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceSnaf108526 : UTopic_Hero__OC_VLK_SNAF_581
        {
            default DebugId = int64(0x72b17fe1b230137c);
            default Caption = LocText("TEXT_WIP_QNGRNMJ_20241119_103850");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Snaf_108093);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x72b17fe1b230146c), Quest::OldCamp_OCCHAPTER1_FORGOTEN_RECIPE != nullptr && Quest::OldCamp_OCCHAPTER1_FORGOTEN_RECIPE.IsRunning());
                }
                
                return Quest::OldCamp_OCCHAPTER1_FORGOTEN_RECIPE != nullptr && Quest::OldCamp_OCCHAPTER1_FORGOTEN_RECIPE.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x72b17fe1b2301376), EConversationDebugInfo::Executing);
                // Here you go.
                Hero.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_103850"));
                DC(int64(0x72b17fe1b2301376), EConversationDebugInfo::Done);
                DB(int64(0x72b17fe1b23013d4), Hero != nullptr && Hero.HasItem(UItFo_Ottostew, 1, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItFo_Ottostew, 1, 0))
                {
                    DC(int64(0x72b17fe1b2301417), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Snaf, UItFo_Ottostew, 1);
                    DC(int64(0x72b17fe1b2301417), EConversationDebugInfo::Done);
                    DC(int64(0x72b17fe1b230141f), EConversationDebugInfo::Executing);
                    // Well, damn ...
                    Snaf.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_110859_1609"));
                    DC(int64(0x72b17fe1b230141f), EConversationDebugInfo::Done);
                    DC(int64(0x72b17fe1b2301427), EConversationDebugInfo::Executing);
                    // Good to know someone else in here who knows his way ...
                    Snaf.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_110958"));
                    DC(int64(0x72b17fe1b2301427), EConversationDebugInfo::Done);
                    DC(int64(0x72b17fe1b2301428), EConversationDebugInfo::Executing);
                    // Why don't you drop by more often? You'll even get two ...
                    Snaf.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_111004"));
                    DC(int64(0x72b17fe1b2301428), EConversationDebugInfo::Done);
                    Subdialog(
                        UTopic_Snaf_108830,
                        UTopic_Snaf_108850
                    );
                }
                else
                {
                    DC(int64(0x72b17fe1b23013dd), EConversationDebugInfo::Executing);
                    // Are you havin' me on? I don't see any stew.
                    Snaf.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_104805"));
                    DC(int64(0x72b17fe1b23013dd), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UTopic_Snaf_108830 : UTopic_Hero__OC_VLK_SNAF_581
        {
            default DebugId = int64(0x72b17fe1b230142a);
            default Caption = LocText("TEXT_WIP_QNGRNMJ_20241119_111212_3569");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Snaf_108830);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x72b17fe1b230142b), EConversationDebugInfo::Executing);
                // You like Brock's recipe better than your own, don't you?
                Hero.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_111212_3569"));
                DC(int64(0x72b17fe1b230142b), EConversationDebugInfo::Done);
                DC(int64(0x72b17fe1b2301436), EConversationDebugInfo::Executing);
                
                // Kind of. But mine's cheaper. 
                Snaf.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_111234"));
                DC(int64(0x72b17fe1b2301436), EConversationDebugInfo::Done);
                DC(int64(0x72b17fe1b230142d), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x72b17fe1b230142d), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Snaf_108850 : UTopic_Hero__OC_VLK_SNAF_581
        {
            default DebugId = int64(0x72b17fe1b230142e);
            default Caption = LocText("TEXT_WIP_QNGRNMJ_20241119_111212_443");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Snaf_108850);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x72b17fe1b230142f), EConversationDebugInfo::Executing);
                // I'll see you around.
                Hero.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_111212_443"));
                DC(int64(0x72b17fe1b230142f), EConversationDebugInfo::Done);
                DC(int64(0x72b17fe1b2301437), EConversationDebugInfo::Executing);
                
                // I sure hope so.
                Snaf.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_111312"));
                DC(int64(0x72b17fe1b2301437), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_FORGOTENRECIPE, Document::UDocumentSegment_CH1_FORGOTENRECIPE_Entry5);
                DC(int64(0x72b17fe1b2301625), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_FORGOTEN_RECIPE_FORGOTEN_RECIPE_OBJ_RETURN.SucceedQuest();
                DC(int64(0x72b17fe1b2301625), EConversationDebugInfo::Done);
                DC(int64(0x72b17fe1b230144b), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x72b17fe1b230144b), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceSnaf109305 : UTopic_Hero__OC_VLK_SNAF_581
        {
            default DebugId = int64(0x72b17fe1b2301538);
            default Caption = LocText("TEXT_WIP_QNGRNMJ_20241119_122142");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Snaf_108203);
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Snaf_1082032);
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_QNGRNMJ_20241119_102811_1924"), int64(0x72b17fe1b2301538));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x72b17fe1b2301540), Quest::OldCamp_OCCHAPTER1_FORGOTEN_RECIPE != nullptr && Quest::OldCamp_OCCHAPTER1_FORGOTEN_RECIPE.IsRunning());
                }
                
                return Quest::OldCamp_OCCHAPTER1_FORGOTEN_RECIPE != nullptr && Quest::OldCamp_OCCHAPTER1_FORGOTEN_RECIPE.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x72b17fe1b2301532), EConversationDebugInfo::Executing);
                // Remind me: what do you need for Brock's stew?
                Hero.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_122142"));
                DC(int64(0x72b17fe1b2301532), EConversationDebugInfo::Done);
                DC(int64(0x72b17fe1b2301533), EConversationDebugInfo::Executing);
                
                // Water, scavenger meat, onions, carrots, potatos.
                Snaf.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_122142_3719"));
                DC(int64(0x72b17fe1b2301533), EConversationDebugInfo::Done);
                DC(int64(0x72b17fe1b2301546), EConversationDebugInfo::Executing);
                // And last but not least, solanaceae. Grows in and around ...
                Snaf.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_122441"));
                DC(int64(0x72b17fe1b2301546), EConversationDebugInfo::Done);
                DC(int64(0x72b17fe1b2301547), EConversationDebugInfo::Executing);
                // I need at least two of each.
                Snaf.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_122509"));
                DC(int64(0x72b17fe1b2301547), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceSnaf109648 : UTopic_Hero__OC_VLK_SNAF_581
        {
            default DebugId = int64(0x72b17fe1b23016b0);
            default Caption = LocText("TEXT_WIP_QNGRNMJ_20241119_125359");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Snaf_108223);
            default Rules.HideIfKnows(UChoiceSnaf109648);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x72b17fe1b23016aa), EConversationDebugInfo::Executing);
                
                // About that recipe ...
                Hero.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_125359"));
                DC(int64(0x72b17fe1b23016aa), EConversationDebugInfo::Done);
                DC(int64(0x72b17fe1b23016b6), EConversationDebugInfo::Executing);
                
                // You know the deal: you get the ingredients, I'll show ...
                Snaf.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_125500"));
                DC(int64(0x72b17fe1b23016b6), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Snaf_1082032,
                    UTopic_Snaf_1082232
                );
            }
        }
        
        
        class UTopic_Snaf_1082032 : UTopic_Hero__OC_VLK_SNAF_581
        {
            default DebugId = int64(0x7846da8cd7b7c4a0);
            default Caption = LocText("TEXT_WIP_RNGRNMJ_20241118_174024_686");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Snaf_1082032);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7846da8cd7b7c4a1), EConversationDebugInfo::Executing);
                // Sounds good.
                Hero.AI.Say(LocText("TEXT_WIP_RNGRNMJ_20241118_174024_686"));
                DC(int64(0x7846da8cd7b7c4a1), EConversationDebugInfo::Done);
                DC(int64(0x7846da8cd7b7c4ad), EConversationDebugInfo::Executing);
                
                // That's what I wanted to hear. So, you'll need scavenger ...
                Snaf.AI.Say(LocText("TEXT_WIP_RNGRNMJ_20241118_175440"));
                DC(int64(0x7846da8cd7b7c4ad), EConversationDebugInfo::Done);
                DC(int64(0x7846da8cd7b7c4ae), EConversationDebugInfo::Executing);
                // And obviously, solanaceae. It's a rare herb that grows ...
                Snaf.AI.Say(LocText("TEXT_WIP_RNGRNMJ_20241118_175459"));
                DC(int64(0x7846da8cd7b7c4ae), EConversationDebugInfo::Done);
                DC(int64(0x72b17fe1b2301311), EConversationDebugInfo::Executing);
                // I reckon Brock used wine, but I think water will do the ...
                Snaf.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_101635"));
                DC(int64(0x72b17fe1b2301311), EConversationDebugInfo::Done);
                DC(int64(0x72b17fe1b2301312), EConversationDebugInfo::Executing);
                // Get double o' everythin' - I'll need me own bits if I'm ...
                Snaf.AI.Say(LocText("TEXT_WIP_QNGRNMJ_20241119_101658"));
                DC(int64(0x72b17fe1b2301312), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_FORGOTENRECIPE, Document::UDocumentSegment_CH1_FORGOTENRECIPE_Entry3);
                DC(int64(0x72b17fe1b230157e), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_FORGOTEN_RECIPE_FORGOTEN_RECIPE_OBJ_INGREDIENTS.StartQuest();
                DC(int64(0x72b17fe1b230157e), EConversationDebugInfo::Done);
                DC(int64(0x72b17fe1b230131b), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x72b17fe1b230131b), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Snaf_1082232 : UTopic_Hero__OC_VLK_SNAF_581
        {
            default DebugId = int64(0x7846da8cd7b7c4a4);
            default Caption = LocText("TEXT_WIP_RNGRNMJ_20241118_174024_3984");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Snaf_1082232);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7846da8cd7b7c4a5), EConversationDebugInfo::Executing);
                // Not interested.
                Hero.AI.Say(LocText("TEXT_WIP_RNGRNMJ_20241118_174024_3984"));
                DC(int64(0x7846da8cd7b7c4a5), EConversationDebugInfo::Done);
                DC(int64(0x7846da8cd7b7c4ac), EConversationDebugInfo::Executing);
                
                // Suit yourself. Though I'd think twice about throwin' ...
                Snaf.AI.Say(LocText("TEXT_WIP_RNGRNMJ_20241118_174212"));
                DC(int64(0x7846da8cd7b7c4ac), EConversationDebugInfo::Done);
                DC(int64(0x7846da8cd7b7c4b7), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x7846da8cd7b7c4b7), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceSnaf141307 : UTopic_Hero__OC_VLK_SNAF_581
        {
            default DebugId = int64(0x7f41962335fc837d);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceSnaf141307);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x7f41962335fc8380), G1R != nullptr && G1R.IsInChapter(2));
                    DB(int64(0x7f41962335fc8386), Quest::OldCamp_OCCHAPTER1_FORGOTEN_RECIPE != nullptr && Quest::OldCamp_OCCHAPTER1_FORGOTEN_RECIPE.HasSucceeded());
                    DB(int64(0x7f41962335fc8380), G1R != nullptr && G1R.IsInChapter(2));
                    DB(int64(0x7f41962335fc8386), Quest::OldCamp_OCCHAPTER1_SNAFSRECIPE != nullptr && Quest::OldCamp_OCCHAPTER1_SNAFSRECIPE.HasSucceeded());
                }
                
                if (G1R != nullptr && G1R.IsInChapter(2) && Quest::OldCamp_OCCHAPTER1_FORGOTEN_RECIPE != nullptr && Quest::OldCamp_OCCHAPTER1_FORGOTEN_RECIPE.HasSucceeded())
                    return true;
                
                if (G1R != nullptr && G1R.IsInChapter(2) && Quest::OldCamp_OCCHAPTER1_SNAFSRECIPE != nullptr && Quest::OldCamp_OCCHAPTER1_SNAFSRECIPE.HasSucceeded())
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7f41962335fc8378), EConversationDebugInfo::Executing);
                // I've been thinkin' - because you've got a knack for ...
                Snaf.AI.Say(LocText("TEXT_WIP_YOSFHOK_20250115_154139_41"));
                DC(int64(0x7f41962335fc8378), EConversationDebugInfo::Done);
                DC(int64(0x7f41962335fc83ac), EConversationDebugInfo::Executing);
                
                // What about it?
                Hero.AI.Say(LocText("TEXT_WIP_YOSFHOK_20250115_162312"));
                DC(int64(0x7f41962335fc83ac), EConversationDebugInfo::Done);
                DC(int64(0x7f41962335fc83ad), EConversationDebugInfo::Executing);
                
                // That woman Syra, up in the castle kitchen. The warders ...
                Snaf.AI.Say(LocText("TEXT_WIP_YOSFHOK_20250115_162326"));
                DC(int64(0x7f41962335fc83ad), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_SYRARECIPE, Document::UDocumentSegment_CH2_SYRARECIPE_Start);
                Subdialog(
                    UTopic_Snaf_141404,
                    UTopic_Snaf_141457,
                    UTopic_Snaf_141483,
                    UTopic_Snaf_141503
                );
                DC(int64(0x7f41962335fc843a), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER2_SYRARECIPE.StartQuest();
                DC(int64(0x7f41962335fc843a), EConversationDebugInfo::Done);
                DC(int64(0x7f41962335fc84d4), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x7f41962335fc84d4), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Snaf_141404 : UTopic_Hero__OC_VLK_SNAF_581
        {
            default DebugId = int64(0x7f41962335fc83b3);
            default Caption = LocText("TEXT_WIP_YOSFHOK_20250115_162344_3436");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Snaf_141404);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7f41962335fc83b4), EConversationDebugInfo::Executing);
                // Hmm, what's that got to do with me?
                Hero.AI.Say(LocText("TEXT_WIP_YOSFHOK_20250115_162344_3436"));
                DC(int64(0x7f41962335fc83b4), EConversationDebugInfo::Done);
                DC(int64(0x7f41962335fc83c0), EConversationDebugInfo::Executing);
                
                // Well, from one cook to another: we could make some good ...
                Snaf.AI.Say(LocText("TEXT_WIP_YOSFHOK_20250115_162602"));
                DC(int64(0x7f41962335fc83c0), EConversationDebugInfo::Done);
                DC(int64(0x7f41962335fc83c1), EConversationDebugInfo::Executing);
                // But I can't just go in there. You on the other hand ...
                Snaf.AI.Say(LocText("TEXT_WIP_YOSFHOK_20250115_162605"));
                DC(int64(0x7f41962335fc83c1), EConversationDebugInfo::Done);
                DC(int64(0x7f41962335fc83b6), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x7f41962335fc83b6), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Snaf_141457 : UTopic_Hero__OC_VLK_SNAF_581
        {
            default DebugId = int64(0x7f41962335fc83c2);
            default Caption = LocText("TEXT_WIP_YOSFHOK_20250115_162625_3286");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Snaf_141457);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7f41962335fc83c3), EConversationDebugInfo::Executing);
                // You want me to get her recipe?
                Hero.AI.Say(LocText("TEXT_WIP_YOSFHOK_20250115_162625_3286"));
                DC(int64(0x7f41962335fc83c3), EConversationDebugInfo::Done);
                DC(int64(0x7f41962335fc83ca), EConversationDebugInfo::Executing);
                
                // That's right. Maybe she'll share it with a fellow cook.
                Snaf.AI.Say(LocText("TEXT_WIP_YOSFHOK_20250115_162656"));
                DC(int64(0x7f41962335fc83ca), EConversationDebugInfo::Done);
                DC(int64(0x7f41962335fc83b2), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x7f41962335fc83b2), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Snaf_141483 : UTopic_Hero__OC_VLK_SNAF_581
        {
            default DebugId = int64(0x7f41962335fc83d3);
            default Caption = LocText("TEXT_WIP_YOSFHOK_20250115_162859_686");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Snaf_141483);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7f41962335fc83d4), EConversationDebugInfo::Executing);
                // I'll see what I can do.
                Hero.AI.Say(LocText("TEXT_WIP_YOSFHOK_20250115_162859_686"));
                DC(int64(0x7f41962335fc83d4), EConversationDebugInfo::Done);
                DC(int64(0x7f41962335fc83e3), EConversationDebugInfo::Executing);
                
                // Find out what's goin' in that stew - but watch yourself. ...
                Snaf.AI.Say(LocText("TEXT_WIP_YOSFHOK_20250115_162910"));
                DC(int64(0x7f41962335fc83e3), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Snaf_141503 : UTopic_Hero__OC_VLK_SNAF_581
        {
            default DebugId = int64(0x7f41962335fc83db);
            default Caption = LocText("TEXT_WIP_YOSFHOK_20250115_162901_2386");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Snaf_141503);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7f41962335fc83dc), EConversationDebugInfo::Executing);
                
                // I got to think about it.
                Hero.AI.Say(LocText("TEXT_WIP_YOSFHOK_20250115_162901_2386"));
                DC(int64(0x7f41962335fc83dc), EConversationDebugInfo::Done);
                DC(int64(0x7f41962335fc83e4), EConversationDebugInfo::Executing);
                
                // I just need to know what's goin' in that stew. Think ...
                Snaf.AI.Say(LocText("TEXT_WIP_YOSFHOK_20250115_162932"));
                DC(int64(0x7f41962335fc83e4), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceSnaf141988 : UTopic_Hero__OC_VLK_SNAF_581
        {
            default DebugId = int64(0x7f41962335fc84df);
            default Caption = LocText("TEXT_WIP_YOSFHOK_20250115_172713");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceSnaf141307);
            default Rules.HideIfKnows(UChoiceSnaf141988);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_XOSFHOK_20250116_173258"), int64(0x7f41962335fc84df));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x81f98c56dfa2d708), Quest::OldCamp_OCCHAPTER2_SYRARECIPE_SYRARECIPE_OBJ_GETRECIPE != nullptr && !Quest::OldCamp_OCCHAPTER2_SYRARECIPE_SYRARECIPE_OBJ_GETRECIPE.HasSucceeded());
                }
                
                return Quest::OldCamp_OCCHAPTER2_SYRARECIPE_SYRARECIPE_OBJ_GETRECIPE != nullptr && !Quest::OldCamp_OCCHAPTER2_SYRARECIPE_SYRARECIPE_OBJ_GETRECIPE.HasSucceeded();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7f41962335fc84d9), EConversationDebugInfo::Executing);
                
                // Syra didn't want to share the recipe.
                Hero.AI.Say(LocText("TEXT_WIP_YOSFHOK_20250115_172713"));
                DC(int64(0x7f41962335fc84d9), EConversationDebugInfo::Done);
                DC(int64(0x7f41962335fc84da), EConversationDebugInfo::Executing);
                
                // Yeah ... can't even put it past her, to be frank.
                Snaf.AI.Say(LocText("TEXT_WIP_YOSFHOK_20250115_172713_2801"));
                DC(int64(0x7f41962335fc84da), EConversationDebugInfo::Done);
                DC(int64(0x7f41962335fc84e1), EConversationDebugInfo::Executing);
                // But she's probably got it noted down somewhere.
                Snaf.AI.Say(LocText("TEXT_WIP_YOSFHOK_20250115_172755"));
                DC(int64(0x7f41962335fc84e1), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_SYRARECIPE, Document::UDocumentSegment_CH2_SYRARECIPE_Steal);
                Subdialog(
                    UTopic_Snaf_142004,
                    UTopic_Snaf_142024
                );
            }
        }
        
        
        class UTopic_Snaf_142004 : UTopic_Hero__OC_VLK_SNAF_581
        {
            default DebugId = int64(0x7f41962335fc84e3);
            default Caption = LocText("TEXT_WIP_YOSFHOK_20250115_172823_443");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Snaf_142004);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7f41962335fc84e4), EConversationDebugInfo::Executing);
                // I could steal it?
                Hero.AI.Say(LocText("TEXT_WIP_YOSFHOK_20250115_172823_443"));
                DC(int64(0x7f41962335fc84e4), EConversationDebugInfo::Done);
                DC(int64(0x7f41962335fc84ef), EConversationDebugInfo::Executing);
                
                // Steal it? Nobody's stealin' anythin'. But I wouldn't say ...
                Snaf.AI.Say(LocText("TEXT_WIP_YOSFHOK_20250115_172831"));
                DC(int64(0x7f41962335fc84ef), EConversationDebugInfo::Done);
                DC(int64(0x7f41962335fc84e6), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x7f41962335fc84e6), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Snaf_142024 : UTopic_Hero__OC_VLK_SNAF_581
        {
            default DebugId = int64(0x7f41962335fc84e7);
            default Caption = LocText("TEXT_WIP_YOSFHOK_20250115_172823_491");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Snaf_142024);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7f41962335fc84e8), EConversationDebugInfo::Executing);
                // I'll figure something out.
                Hero.AI.Say(LocText("TEXT_WIP_YOSFHOK_20250115_172823_491"));
                DC(int64(0x7f41962335fc84e8), EConversationDebugInfo::Done);
                DC(int64(0x7f41962335fc84f4), EConversationDebugInfo::Executing);
                
                // Don't get caught snoopin' around.
                Snaf.AI.Say(LocText("TEXT_WIP_YOSFHOK_20250115_173754"));
                DC(int64(0x7f41962335fc84f4), EConversationDebugInfo::Done);
                DC(int64(0x7f41962335fc8509), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x7f41962335fc8509), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceSnaf142111 : UTopic_Hero__OC_VLK_SNAF_581
        {
            default DebugId = int64(0x7f41962335fc8514);
            default Caption = LocText("TEXT_WIP_YOSFHOK_20250115_173832");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceSnaf141307);
            default Rules.HideIfKnows(UChoiceSnaf142111);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x81f98c56dfa2d6fe), Hero != nullptr && Hero.HasItem(UItMs_Scroll_SyraRecipe, 1, 0));
                }
                
                return Hero != nullptr && Hero.HasItem(UItMs_Scroll_SyraRecipe, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7f41962335fc850e), EConversationDebugInfo::Executing);
                // I got Syra's recipe.
                Hero.AI.Say(LocText("TEXT_WIP_YOSFHOK_20250115_173832"));
                DC(int64(0x7f41962335fc850e), EConversationDebugInfo::Done);
                DC(int64(0x7f41962335fc850f), EConversationDebugInfo::Executing);
                
                // Let me see!
                Snaf.AI.Say(LocText("TEXT_WIP_YOSFHOK_20250115_173832_2995"));
                DC(int64(0x7f41962335fc850f), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_SYRARECIPE, Document::UDocumentSegment_CH2_SYRARECIPE_Ingredients);
                DC(int64(0x7f41962335fc8517), EConversationDebugInfo::Executing);
                Hero.AI.GiveItemTo(Snaf, UItMs_Scroll_SyraRecipe, 1);
                DC(int64(0x7f41962335fc8517), EConversationDebugInfo::Done);
                DC(int64(0x8470c206a90a1722), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER2_SYRARECIPE_SYRARECIPE_OBJ_BRINGRECIPE.SucceedQuest();
                DC(int64(0x8470c206a90a1722), EConversationDebugInfo::Done);
                DC(int64(0x7f41962335fc851d), EConversationDebugInfo::Executing);
                // Ah, sod it. I should've known these ingredients won't ...
                Snaf.AI.Say(LocText("TEXT_WIP_YOSFHOK_20250115_174129_731"));
                DC(int64(0x7f41962335fc851d), EConversationDebugInfo::Done);
                DC(int64(0x7f41962335fc8522), EConversationDebugInfo::Executing);
                
                // Too hard to get? 
                Hero.AI.Say(LocText("TEXT_WIP_YOSFHOK_20250115_174226"));
                DC(int64(0x7f41962335fc8522), EConversationDebugInfo::Done);
                DC(int64(0x7f41962335fc8536), EConversationDebugInfo::Executing);
                
                // Hm. I could just ... If I replaced this with ... Yeah, ...
                Snaf.AI.Say(LocText("TEXT_WIP_YOSFHOK_20250115_175347"));
                DC(int64(0x7f41962335fc8536), EConversationDebugInfo::Done);
                DC(int64(0x7f41962335fc8524), EConversationDebugInfo::Executing);
                // You could help me get some things while I figure out the ...
                Snaf.AI.Say(LocText("TEXT_WIP_YOSFHOK_20250115_174540"));
                DC(int64(0x7f41962335fc8524), EConversationDebugInfo::Done);
                DC(int64(0x7f41962335fc8525), EConversationDebugInfo::Executing);
                // Mistcap Mushrooms. They grow by rivers and in caverns - ...
                Snaf.AI.Say(LocText("TEXT_WIP_YOSFHOK_20250115_174736"));
                DC(int64(0x7f41962335fc8525), EConversationDebugInfo::Done);
                DC(int64(0x7f41962335fc8526), EConversationDebugInfo::Executing);
                // And Cavern Dewleaf - sticks to wet cave walls. Nasty to ...
                Snaf.AI.Say(LocText("TEXT_WIP_YOSFHOK_20250115_174817"));
                DC(int64(0x7f41962335fc8526), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Snaf_142691,
                    UTopic_Snaf_142711,
                    UTopic_Snaf_141906
                );
            }
        }
        
        
        class UTopic_Snaf_142691 : UTopic_Hero__OC_VLK_SNAF_581
        {
            default DebugId = int64(0x7f41962335fc8528);
            default Caption = LocText("TEXT_WIP_YOSFHOK_20250115_174916_1340");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Snaf_142691);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7f41962335fc8529), EConversationDebugInfo::Executing);
                // That's quite a list.
                Hero.AI.Say(LocText("TEXT_WIP_YOSFHOK_20250115_174916_1340"));
                DC(int64(0x7f41962335fc8529), EConversationDebugInfo::Done);
                DC(int64(0x7f41962335fc8534), EConversationDebugInfo::Executing);
                
                // Only the best for the ore barons, right?
                Snaf.AI.Say(LocText("TEXT_WIP_YOSFHOK_20250115_174919"));
                DC(int64(0x7f41962335fc8534), EConversationDebugInfo::Done);
                DC(int64(0x7f41962335fc852b), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x7f41962335fc852b), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Snaf_142711 : UTopic_Hero__OC_VLK_SNAF_581
        {
            default DebugId = int64(0x7f41962335fc852c);
            default Caption = LocText("TEXT_WIP_YOSFHOK_20250115_174916_2316");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Snaf_142711);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7f41962335fc852d), EConversationDebugInfo::Executing);
                // I'm gonna need more than a bowl of stew for that.
                Hero.AI.Say(LocText("TEXT_WIP_YOSFHOK_20250115_174916_2316"));
                DC(int64(0x7f41962335fc852d), EConversationDebugInfo::Done);
                DC(int64(0x7f41962335fc8535), EConversationDebugInfo::Executing);
                
                // What do you mean? I'm gonna teach you how to MAKE it, o' ...
                Snaf.AI.Say(LocText("TEXT_WIP_YOSFHOK_20250115_175007"));
                DC(int64(0x7f41962335fc8535), EConversationDebugInfo::Done);
                DC(int64(0x8470c206a90a16d9), EConversationDebugInfo::Executing);
                // And when times get rough, it won't be the ore that feeds ...
                Snaf.AI.Say(LocText("TEXT_WIP_VPWRGKF_20250116_104050"));
                DC(int64(0x8470c206a90a16d9), EConversationDebugInfo::Done);
                DC(int64(0x7f41962335fc852f), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x7f41962335fc852f), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Snaf_141906 : UTopic_Hero__OC_VLK_SNAF_581
        {
            default DebugId = int64(0x8470c206a90a1714);
            default Caption = LocText("TEXT_WIP_VPWRGKF_20250116_112457_41");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Snaf_141906);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8470c206a90a1715), EConversationDebugInfo::Executing);
                // I'll get you those things.
                Hero.AI.Say(LocText("TEXT_WIP_VPWRGKF_20250116_112457_41"));
                DC(int64(0x8470c206a90a1715), EConversationDebugInfo::Done);
                DC(int64(0x8470c206a90a171c), EConversationDebugInfo::Executing);
                
                // You're gonna be in for a treat, mate.
                Snaf.AI.Say(LocText("TEXT_WIP_VPWRGKF_20250116_112503"));
                DC(int64(0x8470c206a90a171c), EConversationDebugInfo::Done);
                DC(int64(0x8470c206a90a1724), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER2_SYRARECIPE_SYRARECIPE_OBJ_INGREDIENTS.StartQuest();
                DC(int64(0x8470c206a90a1724), EConversationDebugInfo::Done);
                DC(int64(0x8470c206a90a1729), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x8470c206a90a1729), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceSnaf142204 : UTopic_Hero__OC_VLK_SNAF_581
        {
            default DebugId = int64(0xf022cf84718743a2);
            default Caption = LocText("TEXT_WIP_VPWRGKF_20250116_113938");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceSnaf142111);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf022cf84718743aa), Quest::OldCamp_OCCHAPTER2_SYRARECIPE_SYRARECIPE_OBJ_INGREDIENTS != nullptr && Quest::OldCamp_OCCHAPTER2_SYRARECIPE_SYRARECIPE_OBJ_INGREDIENTS.IsRunning());
                }
                
                return Quest::OldCamp_OCCHAPTER2_SYRARECIPE_SYRARECIPE_OBJ_INGREDIENTS != nullptr && Quest::OldCamp_OCCHAPTER2_SYRARECIPE_SYRARECIPE_OBJ_INGREDIENTS.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf022cf847187439c), EConversationDebugInfo::Executing);
                // Here's everything you needed.
                Hero.AI.Say(LocText("TEXT_WIP_VPWRGKF_20250116_113938"));
                DC(int64(0xf022cf847187439c), EConversationDebugInfo::Done);
                DB(int64(0xf022cf84718743b0), Hero != nullptr && Hero.HasItem(UItFo_Plants_Mistcap, 1, 0));
                DB(int64(0xf022cf84718743ba), Hero != nullptr && Hero.HasItem(UItFo_Plants_Dewleaf, 1, 0));
                DB(int64(0xf022cf84718743bb), Hero != nullptr && Hero.HasItem(UItFo_Carrot, 1, 0));
                DB(int64(0xf022cf84718743bc), Hero != nullptr && Hero.HasItem(UItFo_Muttonraw, 1, 0));
                DB(int64(0xf022cf84718743bd), Hero != nullptr && Hero.HasItem(UItFo_Potion_Strongbeer, 1, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItFo_Plants_Mistcap, 1, 0) && Hero != nullptr && Hero.HasItem(UItFo_Plants_Dewleaf, 1, 0) && Hero != nullptr && Hero.HasItem(UItFo_Carrot, 1, 0) && Hero != nullptr && Hero.HasItem(UItFo_Muttonraw, 1, 0) && Hero != nullptr && Hero.HasItem(UItFo_Potion_Strongbeer, 1, 0))
                {
                    DC(int64(0xf022cf84718743d1), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Snaf, UItFo_Potion_Strongbeer, 1);
                    DC(int64(0xf022cf84718743d1), EConversationDebugInfo::Done);
                    DC(int64(0x12f475b5917c7041), EConversationDebugInfo::Executing);
                    Snaf.AddItemToInventory(UItFo_Plants_Mistcap, 1);
                    DC(int64(0x12f475b5917c7041), EConversationDebugInfo::Done);
                    DC(int64(0x12f475b5917c7043), EConversationDebugInfo::Executing);
                    Snaf.AddItemToInventory(UItFo_Plants_Dewleaf, 1);
                    DC(int64(0x12f475b5917c7043), EConversationDebugInfo::Done);
                    DC(int64(0x12f475b5917c7045), EConversationDebugInfo::Executing);
                    Snaf.AddItemToInventory(UItFo_Carrot, 1);
                    DC(int64(0x12f475b5917c7045), EConversationDebugInfo::Done);
                    DC(int64(0x12f475b5917c7047), EConversationDebugInfo::Executing);
                    Snaf.AddItemToInventory(UItFo_Muttonraw, 1);
                    DC(int64(0x12f475b5917c7047), EConversationDebugInfo::Done);
                    DC(int64(0x12f475b5917c7179), EConversationDebugInfo::Executing);
                    Hero.RemoveItemFromInventory(UItFo_Plants_Mistcap, 1, 0);
                    DC(int64(0x12f475b5917c7179), EConversationDebugInfo::Done);
                    DC(int64(0x12f475b5917c717b), EConversationDebugInfo::Executing);
                    Hero.RemoveItemFromInventory(UItFo_Plants_Dewleaf, 1, 0);
                    DC(int64(0x12f475b5917c717b), EConversationDebugInfo::Done);
                    DC(int64(0x12f475b5917c717d), EConversationDebugInfo::Executing);
                    Hero.RemoveItemFromInventory(UItFo_Carrot, 1, 0);
                    DC(int64(0x12f475b5917c717d), EConversationDebugInfo::Done);
                    DC(int64(0x12f475b5917c717f), EConversationDebugInfo::Executing);
                    Hero.RemoveItemFromInventory(UItFo_Muttonraw, 1, 0);
                    DC(int64(0x12f475b5917c717f), EConversationDebugInfo::Done);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_SYRARECIPE, Document::UDocumentSegment_CH2_SYRARECIPE_Wait);
                    DC(int64(0xf022cf84718743e2), EConversationDebugInfo::Executing);
                    // Right. Give me a couple o' hours to cook all this up.
                    Snaf.AI.Say(LocText("TEXT_WIP_VPWRGKF_20250116_120639_2785"));
                    DC(int64(0xf022cf84718743e2), EConversationDebugInfo::Done);
                    DC(int64(0xf022cf84718743f3), EConversationDebugInfo::Executing);
                    // It'll be worth the troubles, I could tell you that much.
                    Snaf.AI.Say(LocText("TEXT_WIP_VPWRGKF_20250116_120836"));
                    DC(int64(0xf022cf84718743f3), EConversationDebugInfo::Done);
                    DC(int64(0x1e8e31ae0985a9e), EConversationDebugInfo::Executing);
                    G1R.Snaf_SyraRecipe = FInGameTime::Now();
                    DC(int64(0x1e8e31ae0985a9e), EConversationDebugInfo::Done);
                    DC(int64(0x1e8e31ae0985ab3), EConversationDebugInfo::Executing);
                    Quest::OldCamp_OCCHAPTER2_SYRARECIPE_SYRARECIPE_OBJ_INGREDIENTS.SucceedQuest();
                    DC(int64(0x1e8e31ae0985ab3), EConversationDebugInfo::Done);
                    DC(int64(0x1e8e31ae0985bf0), EConversationDebugInfo::Executing);
                    Quest::OldCamp_OCCHAPTER2_SYRARECIPE_SYRARECIPE_OBJ_WAITSNAF.StartQuest();
                    DC(int64(0x1e8e31ae0985bf0), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_snaf_142204_exit_1");
                    DC(int64(0x1e8e31ae0985aa5), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x1e8e31ae0985aa5), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0xf022cf84718743d3), EConversationDebugInfo::Executing);
                    // Huh ... looks like something's missin'. Come back when ...
                    Snaf.AI.Say(LocText("TEXT_WIP_VPWRGKF_20250116_115244_1924"));
                    DC(int64(0xf022cf84718743d3), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_snaf_142204_exit_2");
                    DC(int64(0xf022cf84718743da), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xf022cf84718743da), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
        class UChoiceSnaf142425 : UTopic_Hero__OC_VLK_SNAF_581
        {
            default DebugId = int64(0xf022cf8471874403);
            default Caption = LocText("TEXT_WIP_VPWRGKF_20250116_120954");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOfId(n"choice_snaf_142204_exit_1");
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x1e8e31ae0985abc), Quest::OldCamp_OCCHAPTER2_SYRARECIPE_SYRARECIPE_OBJ_WAITSNAF != nullptr && Quest::OldCamp_OCCHAPTER2_SYRARECIPE_SYRARECIPE_OBJ_WAITSNAF.IsRunning());
                }
                
                return Quest::OldCamp_OCCHAPTER2_SYRARECIPE_SYRARECIPE_OBJ_WAITSNAF != nullptr && Quest::OldCamp_OCCHAPTER2_SYRARECIPE_SYRARECIPE_OBJ_WAITSNAF.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf022cf84718743fb), EConversationDebugInfo::Executing);
                // Smells really good. 
                Hero.AI.Say(LocText("TEXT_WIP_VPWRGKF_20250116_120954"));
                DC(int64(0xf022cf84718743fb), EConversationDebugInfo::Done);
                DB(int64(0x1e8e31ae0985ac5), G1R.Snaf_SyraRecipe.IsValid() && G1R.Snaf_SyraRecipe.IsAtLeastXMinutesAgo(120));
                
                if (G1R.Snaf_SyraRecipe.IsValid() && G1R.Snaf_SyraRecipe.IsAtLeastXMinutesAgo(120))
                {
                    DC(int64(0x1e8e31ae0985adc), EConversationDebugInfo::Executing);
                    // And tastes amazing, too. 
                    Snaf.AI.Say(LocText("TEXT_WIP_VPWRGKF_20250116_121838"));
                    DC(int64(0x1e8e31ae0985adc), EConversationDebugInfo::Done);
                    DC(int64(0x1e8e31ae0985ae6), EConversationDebugInfo::Executing);
                    // Fiddly stuff, though. You're off by one pinch o' spice ...
                    Snaf.AI.Say(LocText("TEXT_WIP_VPWRGKF_20250116_121910"));
                    DC(int64(0x1e8e31ae0985ae6), EConversationDebugInfo::Done);
                    DC(int64(0x1e8e31ae0985ae7), EConversationDebugInfo::Executing);
                    
                    // So how did you make it?
                    Hero.AI.Say(LocText("TEXT_WIP_VPWRGKF_20250116_121931"));
                    DC(int64(0x1e8e31ae0985ae7), EConversationDebugInfo::Done);
                    DC(int64(0x1e8e31ae0985ae8), EConversationDebugInfo::Executing);
                    
                    // Right, so you start with the meat and beer. Let it ...
                    Snaf.AI.Say(LocText("TEXT_WIP_VPWRGKF_20250116_121935"));
                    DC(int64(0x1e8e31ae0985ae8), EConversationDebugInfo::Done);
                    DC(int64(0x1e8e31ae0985ae9), EConversationDebugInfo::Executing);
                    // Then the Mistcaps. But your timing's gotta be on point - ...
                    Snaf.AI.Say(LocText("TEXT_WIP_VPWRGKF_20250116_122002"));
                    DC(int64(0x1e8e31ae0985ae9), EConversationDebugInfo::Done);
                    DC(int64(0x1e8e31ae0985aeb), EConversationDebugInfo::Executing);
                    // Here, have some. You sure earned it.
                    Snaf.AI.Say(LocText("TEXT_WIP_VPWRGKF_20250116_122047"));
                    DC(int64(0x1e8e31ae0985aeb), EConversationDebugInfo::Done);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_SYRARECIPE, Document::UDocumentSegment_CH2_SYRARECIPE_Completed);
                    DC(int64(0xea2bca374667d380), EConversationDebugInfo::Executing);
                    Snaf.AddItemToInventory(UItFo_SyraRecipe, 1);
                    DC(int64(0xea2bca374667d380), EConversationDebugInfo::Done);
                    DC(int64(0x1e8e31ae0985aed), EConversationDebugInfo::Executing);
                    Snaf.AI.GiveItemTo(Hero, UItFo_SyraRecipe, 1);
                    DC(int64(0x1e8e31ae0985aed), EConversationDebugInfo::Done);
                    DC(int64(0x1e8e31ae0985bee), EConversationDebugInfo::Executing);
                    Quest::OldCamp_OCCHAPTER2_SYRARECIPE_SYRARECIPE_OBJ_WAITSNAF.SucceedQuest();
                    DC(int64(0x1e8e31ae0985bee), EConversationDebugInfo::Done);
                    DC(int64(0x9733703e835840fb), EConversationDebugInfo::Executing);
                    Hero.LearnRecipe(UReFo_SyraRecipe);
                    DC(int64(0x9733703e835840fb), EConversationDebugInfo::Done);
                    DC(int64(0x1e8e31ae0985af7), EConversationDebugInfo::Executing);
                    // One more thing, though: If you're gonna cook it yourself ...
                    Snaf.AI.Say(LocText("TEXT_WIP_VPWRGKF_20250116_122103_2238"));
                    DC(int64(0x1e8e31ae0985af7), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_snaf_142425_exit_1");
                    DC(int64(0x1e8e31ae0985b00), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x1e8e31ae0985b00), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0x1e8e31ae0985ad4), EConversationDebugInfo::Executing);
                    // Right? But it's not done yet.
                    Snaf.AI.Say(LocText("TEXT_WIP_VPWRGKF_20250116_121434"));
                    DC(int64(0x1e8e31ae0985ad4), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_snaf_142425_exit_2");
                    DC(int64(0x1e8e31ae0985ad5), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x1e8e31ae0985ad5), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
        class UChoiceSnafAftersuccess : UTopic_Hero__OC_VLK_SNAF_581
        {
            default DebugId = int64(0xe269c527f7ecfad9);
            default Caption = LocText("DIA_SNAF_AFTERSUCCESS_15_00");
            default PriorityRank = 2;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xe269c527f7ecfada), Quest::OldCamp_OCCHAPTER1_SNAFSRECIPE != nullptr && Quest::OldCamp_OCCHAPTER1_SNAFSRECIPE.HasSucceeded());
                    DB(int64(0xe269c527f7ecfadb), G1R.Snaf_FreeMBRagout != 0);
                }
                
                if (Quest::OldCamp_OCCHAPTER1_SNAFSRECIPE != nullptr && !Quest::OldCamp_OCCHAPTER1_SNAFSRECIPE.HasSucceeded())
                    return false;
                
                if (G1R.Snaf_FreeMBRagout == 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe269c527f7ecfadc), EConversationDebugInfo::Executing);
                // You said I can have as much stew as I want, right?
                Hero.AI.Say(LocText("DIA_SNAF_AFTERSUCCESS_15_00"));
                DC(int64(0xe269c527f7ecfadc), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_VLK_SNAF, Document::UDocumentSegment_Glossary_OC_VLK_SNAF_DailyMeal);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_SNAFSRECIPE, Document::UDocumentSegment_CH1_SNAFSRECIPE_DailyRagout);
                DB(int64(0xe269c527f7ecfade), G1R.Snaf_RagoutDay.IsValid() && G1R.Snaf_RagoutDay.IsAtLeastXDaysAgo(1));
                
                if (G1R.Snaf_RagoutDay.IsValid() && G1R.Snaf_RagoutDay.IsAtLeastXDaysAgo(1))
                {
                    DB(int64(0x6ba7494a232d5eaf), Quest::OldCamp_OCCHAPTER1_FORGOTEN_RECIPE != nullptr && Quest::OldCamp_OCCHAPTER1_FORGOTEN_RECIPE.HasSucceeded());
                    
                    if (Quest::OldCamp_OCCHAPTER1_FORGOTEN_RECIPE != nullptr && Quest::OldCamp_OCCHAPTER1_FORGOTEN_RECIPE.HasSucceeded())
                    {
                        DC(int64(0xea2bca374667d380), EConversationDebugInfo::Executing);
                        Snaf.AddItemToInventory(UItFo_Meatbugragout, 6);
                        DC(int64(0xea2bca374667d380), EConversationDebugInfo::Done);
                        DC(int64(0x66a8afbd7d5b1752), EConversationDebugInfo::Executing);
                        Snaf.AI.GiveItemTo(Hero, UItFo_Meatbugragout, 6);
                        DC(int64(0x66a8afbd7d5b1752), EConversationDebugInfo::Done);
                        DC(int64(0x66a8afbd7d5b1754), EConversationDebugInfo::Executing);
                        G1R.Snaf_RagoutDay = FInGameTime::Now();
                        DC(int64(0x66a8afbd7d5b1754), EConversationDebugInfo::Done);
                        
                        Other.Remember(n"choice_snaf_aftersuccess_exit_1");
                    }
                    else
                    {
                        DC(int64(0xe269c527f7ecfadf), EConversationDebugInfo::Executing);
                        // Sure did. Here, have another one. Or three!
                        Snaf.AI.Say(LocText("DIA_SNAF_AFTERSUCCESS_01_01"));
                        DC(int64(0xe269c527f7ecfadf), EConversationDebugInfo::Done);
                        DC(int64(0xea2bca374667d380), EConversationDebugInfo::Executing);
                        Snaf.AddItemToInventory(UItFo_Meatbugragout, 3);
                        DC(int64(0xea2bca374667d380), EConversationDebugInfo::Done);
                        DC(int64(0x66a8afbd7d5b1752), EConversationDebugInfo::Executing);
                        Snaf.AI.GiveItemTo(Hero, UItFo_Meatbugragout, 3);
                        DC(int64(0x66a8afbd7d5b1752), EConversationDebugInfo::Done);
                        DC(int64(0x66a8afbd7d5b1754), EConversationDebugInfo::Executing);
                        G1R.Snaf_RagoutDay = FInGameTime::Now();
                        DC(int64(0x66a8afbd7d5b1754), EConversationDebugInfo::Done);
                        
                        Other.Remember(n"choice_snaf_aftersuccess_exit_2");
                    }
                }
                else
                {
                    DC(int64(0xe269c527f7ecfae3), EConversationDebugInfo::Executing);
                    // I did, but I'm out for today. Come back tomorrow. 
                    Snaf.AI.Say(LocText("DIA_SNAF_AFTERSUCCESS_01_02"));
                    DC(int64(0xe269c527f7ecfae3), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_snaf_aftersuccess_exit_3");
                }
            }
        }
        
        
        class UChoiceSnafExit : UTopic_Hero__OC_VLK_SNAF_581
        {
            default DebugId = int64(0xe269c527f7ecfaad);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe269c527f7ecfaae), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xe269c527f7ecfaae), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceSnafHello : UTopic_Hero__OC_VLK_SNAF_581
        {
            default DebugId = int64(0xe269c527f7ecfaaf);
            default Caption = LocText("DIA_SNAF_HELLO_15_00");
            default PriorityRank = 2;
            
            default Rules.HideIfKnows(UChoiceSnafHello);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe269c527f7ecfab0), EConversationDebugInfo::Executing);
                // How's it going?
                Hero.AI.Say(LocText("DIA_SNAF_HELLO_15_00"));
                DC(int64(0xe269c527f7ecfab0), EConversationDebugInfo::Done);
                DC(int64(0xe269c527f7ecfab1), EConversationDebugInfo::Executing);
                
                // Not bad. You're new here, ain't ya? 
                Snaf.AI.Say(LocText("DIA_SNAF_HELLO_01_01"));
                DC(int64(0xe269c527f7ecfab1), EConversationDebugInfo::Done);
                DC(int64(0xea4b1a4f94a1722c), EConversationDebugInfo::Executing);
                
                // Mhh, just got in.
                Hero.AI.Say(LocText("TEXT_NISEA_20231218_152906"));
                DC(int64(0xea4b1a4f94a1722c), EConversationDebugInfo::Done);
                DC(int64(0xea4b1a4f94a1722e), EConversationDebugInfo::Executing);
                
                // Yeah, got that look about you. Here, have some rice ...
                Snaf.AI.Say(LocText("TEXT_NISEA_20231218_152925"));
                DC(int64(0xea4b1a4f94a1722e), EConversationDebugInfo::Done);
                DC(int64(0xea4b1a4f94a1722f), EConversationDebugInfo::Executing);
                // Also, I got somethin' that needs doin' if you're ...
                Snaf.AI.Say(LocText("TEXT_NISEA_20231218_153023"));
                DC(int64(0xea4b1a4f94a1722f), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_VLK_SNAF, Document::UDocumentSegment_Glossary_OC_VLK_SNAF_Introduction);
                DC(int64(0xea2bca374667d380), EConversationDebugInfo::Executing);
                Snaf.AddItemToInventory(UItFo_Rice, 1);
                DC(int64(0xea2bca374667d380), EConversationDebugInfo::Done);
                DC(int64(0x66a8afbd7d5b1762), EConversationDebugInfo::Executing);
                Snaf.AI.GiveItemTo(Hero, UItFo_Rice, 1);
                DC(int64(0x66a8afbd7d5b1762), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceSnafWheremeatbugs : UTopic_Hero__OC_VLK_SNAF_581
        {
            default DebugId = int64(0xe269c527f7ecfae4);
            default Caption = LocText("DIA_SNAF_WHEREMEATBUGS_15_00");
            default PriorityRank = 2;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceSnafZutaten);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xe269c527f7ecfae5), Quest::OldCamp_OCCHAPTER1_SNAFSRECIPE != nullptr && Quest::OldCamp_OCCHAPTER1_SNAFSRECIPE.IsRunning());
                    DB(int64(0xe156b8f86ffbc77), Hero != nullptr && !Hero.HasItem(UItAt_Meatbug_01, 3, 0));
                }
                
                if (Quest::OldCamp_OCCHAPTER1_SNAFSRECIPE != nullptr && !Quest::OldCamp_OCCHAPTER1_SNAFSRECIPE.IsRunning())
                    return false;
                
                if (Hero != nullptr && Hero.HasItem(UItAt_Meatbug_01, 3, 0))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe269c527f7ecfae6), EConversationDebugInfo::Executing);
                // Where can I find meatbugs?
                Hero.AI.Say(LocText("DIA_SNAF_WHEREMEATBUGS_15_00"));
                DC(int64(0xe269c527f7ecfae6), EConversationDebugInfo::Done);
                DC(int64(0xe269c527f7ecfae7), EConversationDebugInfo::Executing);
                
                // Wherever there's rubbish. There's some empty huts by the ...
                Snaf.AI.Say(LocText("DIA_SNAF_WHEREMEATBUGS_01_01"));
                DC(int64(0xe269c527f7ecfae7), EConversationDebugInfo::Done);
                DC(int64(0xe269c527f7ecfae8), EConversationDebugInfo::Executing);
                // And don't judge 'em by their looks. They taste all right ...
                Snaf.AI.Say(LocText("DIA_SNAF_WHEREMEATBUGS_01_02"));
                DC(int64(0xe269c527f7ecfae8), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_SNAFSRECIPE, Document::UDocumentSegment_CH1_SNAFSRECIPE_MeatbugsLocation);
            }
        }
        
        
        class UChoiceSnafWheremushrooms : UTopic_Hero__OC_VLK_SNAF_581
        {
            default DebugId = int64(0xe269c527f7ecfae9);
            default Caption = LocText("DIA_SNAF_WHEREMUSHROOMS_15_00");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceSnafZutaten);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xe269c527f7ecfaea), Quest::OldCamp_OCCHAPTER1_SNAFSRECIPE != nullptr && Quest::OldCamp_OCCHAPTER1_SNAFSRECIPE.IsRunning());
                    DB(int64(0xe156b8f86ffbc78), Hero != nullptr && !Hero.HasItem(UItFo_Plants_Mushroom_01, 5, 0));
                }
                
                if (Quest::OldCamp_OCCHAPTER1_SNAFSRECIPE != nullptr && !Quest::OldCamp_OCCHAPTER1_SNAFSRECIPE.IsRunning())
                    return false;
                
                if (Hero != nullptr && Hero.HasItem(UItFo_Plants_Mushroom_01, 5, 0))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe269c527f7ecfaeb), EConversationDebugInfo::Executing);
                // Where can I find hellcaps around here?
                Hero.AI.Say(LocText("DIA_SNAF_WHEREMUSHROOMS_15_00"));
                DC(int64(0xe269c527f7ecfaeb), EConversationDebugInfo::Done);
                DC(int64(0xe269c527f7ecfaec), EConversationDebugInfo::Executing);
                
                // You could try the area right outside the south gate, ...
                Snaf.AI.Say(LocText("DIA_SNAF_WHEREMUSHROOMS_01_01"));
                DC(int64(0xe269c527f7ecfaec), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_SNAFSRECIPE, Document::UDocumentSegment_CH1_SNAFSRECIPE_MushroomsLocation);
            }
        }
        
        
        class UChoiceSnafWherenek : UTopic_Hero__OC_VLK_SNAF_581
        {
            default DebugId = int64(0xe269c527f7ecfaed);
            default Caption = LocText("DIA_SNAF_WHERENEK_15_00");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceSnafZutaten);
            default Rules.HideIfKnows(UChoiceSnafWherenek);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xe269c527f7ecfaee), Quest::OldCamp_OCCHAPTER1_SNAFSRECIPE != nullptr && Quest::OldCamp_OCCHAPTER1_SNAFSRECIPE.IsRunning());
                }
                
                return Quest::OldCamp_OCCHAPTER1_SNAFSRECIPE != nullptr && Quest::OldCamp_OCCHAPTER1_SNAFSRECIPE.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe269c527f7ecfaef), EConversationDebugInfo::Executing);
                // Who was that other guy you sent? 
                Hero.AI.Say(LocText("DIA_SNAF_WHERENEK_15_00"));
                DC(int64(0xe269c527f7ecfaef), EConversationDebugInfo::Done);
                DC(int64(0xe269c527f7ecfaf0), EConversationDebugInfo::Executing);
                
                // Oh, that was Nek. A warder.
                Snaf.AI.Say(LocText("DIA_SNAF_WHERENEK_01_01"));
                DC(int64(0xe269c527f7ecfaf0), EConversationDebugInfo::Done);
                DC(int64(0xe269c527f7ecfaf1), EConversationDebugInfo::Executing);
                // As I said, I think he turned coat. Never looked too ...
                Snaf.AI.Say(LocText("DIA_SNAF_WHERENEK_01_02"));
                DC(int64(0xe269c527f7ecfaf1), EConversationDebugInfo::Done);
                DC(int64(0xab0b30e1eefb7f60), EConversationDebugInfo::Executing);
                // But I'm just guessin'. All I know is he went out the ...
                Snaf.AI.Say(LocText("TEXT_MATTES_20231220_175013"));
                DC(int64(0xab0b30e1eefb7f60), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_LOSTNEK, Document::UDocumentSegment_CH1_LOSTNEK_Snaf);
                DC(int64(0x63819e1318108476), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_LOSTNEK_LOSTNEK_OBJ_SNAF.SucceedQuest();
                DC(int64(0x63819e1318108476), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceSnafZutaten : UTopic_Hero__OC_VLK_SNAF_581
        {
            default DebugId = int64(0xe269c527f7ecfab7);
            default Caption = LocText("DIA_SNAF_ZUTATEN_15_00");
            default PriorityRank = 2;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceSnafHello);
            default Rules.HideIfKnows(UChoiceSnafZutaten);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xe269c527f7ecfab8), Quest::OldCamp_OCCHAPTER1_SNAFSRECIPE != nullptr && !Quest::OldCamp_OCCHAPTER1_SNAFSRECIPE.HasBeenStarted());
                }
                
                return Quest::OldCamp_OCCHAPTER1_SNAFSRECIPE != nullptr && !Quest::OldCamp_OCCHAPTER1_SNAFSRECIPE.HasBeenStarted();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe269c527f7ecfab9), EConversationDebugInfo::Executing);
                // What can I do for you? 
                Hero.AI.Say(LocText("DIA_SNAF_ZUTATEN_15_00"));
                DC(int64(0xe269c527f7ecfab9), EConversationDebugInfo::Done);
                DC(int64(0xe269c527f7ecfaba), EConversationDebugInfo::Executing);
                
                // I got a new recipe, meatbug ragout à la Snaf. With rice ...
                Snaf.AI.Say(LocText("DIA_SNAF_ZUTATEN_01_01"));
                DC(int64(0xe269c527f7ecfaba), EConversationDebugInfo::Done);
                DC(int64(0xe269c527f7ecfabb), EConversationDebugInfo::Executing);
                // Thing is, I'm lacking the ingredients. Three more meat ...
                Snaf.AI.Say(LocText("DIA_SNAF_ZUTATEN_01_02"));
                DC(int64(0xe269c527f7ecfabb), EConversationDebugInfo::Done);
                Subdialog(
                    UChoiceSnafZutatenKotz,
                    UChoiceSnafZutatenDoit
                );
                DC(int64(0x66a8afbd7d5b178a), EConversationDebugInfo::Executing);
                G1R.Snaf_FreeMBRagout = 1;
                DC(int64(0x66a8afbd7d5b178a), EConversationDebugInfo::Done);
                DC(int64(0x66a8afbd7d5b1781), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_SNAFSRECIPE.StartQuest();
                DC(int64(0x66a8afbd7d5b1781), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceSnafZutatenKotz : UTopic_Hero__OC_VLK_SNAF_581
        {
            default DebugId = int64(0xe8603e87342be813);
            default Caption = LocText("DIA_SNAF_ZUTATEN_KOTZ_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe269c527f7ecfabe), EConversationDebugInfo::Executing);
                // That sounds ... nice.
                Hero.AI.Say(LocText("DIA_SNAF_ZUTATEN_KOTZ_15_00"));
                DC(int64(0xe269c527f7ecfabe), EConversationDebugInfo::Done);
                DC(int64(0xe269c527f7ecfabf), EConversationDebugInfo::Executing);
                
                // Like hell it does. But this is the Colony, so get used ...
                Snaf.AI.Say(LocText("DIA_SNAF_ZUTATEN_KOTZ_01_01"));
                DC(int64(0xe269c527f7ecfabf), EConversationDebugInfo::Done);
                DC(int64(0xe269c527f7ecfac0), EConversationDebugInfo::Executing);
                // I sent someone else to get the ingredients a week ago, ...
                Snaf.AI.Say(LocText("DIA_SNAF_ZUTATEN_KOTZ_01_02"));
                DC(int64(0xe269c527f7ecfac0), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_SNAFSRECIPE, Document::UDocumentSegment_CH1_SNAFSRECIPE_Start);
            }
        }
        
        
        class UChoiceSnafZutatenDoit : UTopic_Hero__OC_VLK_SNAF_581
        {
            default DebugId = int64(0xe8603e87342be81a);
            default Caption = LocText("DIA_SNAF_ZUTATEN_DOIT_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe269c527f7ecfac4), EConversationDebugInfo::Executing);
                // I can do that.
                Hero.AI.Say(LocText("DIA_SNAF_ZUTATEN_DOIT_15_00"));
                DC(int64(0xe269c527f7ecfac4), EConversationDebugInfo::Done);
                DC(int64(0xe269c527f7ecfac5), EConversationDebugInfo::Executing);
                
                // Good. 
                Snaf.AI.Say(LocText("DIA_SNAF_ZUTATEN_DOIT_01_01"));
                DC(int64(0xe269c527f7ecfac5), EConversationDebugInfo::Done);
                DC(int64(0xe269c527f7ecfac6), EConversationDebugInfo::Executing);
                // I sent someone else to get the ingredients a week ago, ...
                Snaf.AI.Say(LocText("DIA_SNAF_ZUTATEN_KOTZ_01_02"));
                DC(int64(0xe269c527f7ecfac6), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_SNAFSRECIPE, Document::UDocumentSegment_CH1_SNAFSRECIPE_Start);
            }
        }
        
        
        class UChoiceSnafZutatensuccess : UTopic_Hero__OC_VLK_SNAF_581
        {
            default DebugId = int64(0xe269c527f7ecfaca);
            default Caption = LocText("DIA_SNAF_ZUTATENSUCCESS_15_00");
            default PriorityRank = 2;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceSnafZutaten);
            default Rules.HideIfKnows(UChoiceSnafZutatensuccess);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xe269c527f7ecfacb), Quest::OldCamp_OCCHAPTER1_SNAFSRECIPE != nullptr && Quest::OldCamp_OCCHAPTER1_SNAFSRECIPE.IsRunning());
                    DB(int64(0xe269c527f7ecfacc), Hero != nullptr && Hero.HasItem(UItFo_Plants_Mushroom_01, 5, 0));
                    DB(int64(0xe269c527f7ecfacd), Hero != nullptr && Hero.HasItem(UItAt_Meatbug_01, 3, 0));
                }
                
                if (Quest::OldCamp_OCCHAPTER1_SNAFSRECIPE != nullptr && !Quest::OldCamp_OCCHAPTER1_SNAFSRECIPE.IsRunning())
                    return false;
                
                if (Hero != nullptr && !Hero.HasItem(UItFo_Plants_Mushroom_01, 5, 0))
                    return false;
                
                if (Hero != nullptr && !Hero.HasItem(UItAt_Meatbug_01, 3, 0))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe269c527f7ecface), EConversationDebugInfo::Executing);
                // I got your ingredients.
                Hero.AI.Say(LocText("DIA_SNAF_ZUTATENSUCCESS_15_00"));
                DC(int64(0xe269c527f7ecface), EConversationDebugInfo::Done);
                DC(int64(0xe269c527f7ecfacf), EConversationDebugInfo::Executing);
                
                // Great! Just a moment and the stew'll be ready.
                Snaf.AI.Say(LocText("DIA_SNAF_ZUTATENSUCCESS_01_01"));
                DC(int64(0xe269c527f7ecfacf), EConversationDebugInfo::Done);
                DC(int64(0xea4b1a4f94a17232), EConversationDebugInfo::Executing);
                // Here you go. Trust me, it tastes better than it looks.
                Snaf.AI.Say(LocText("TEXT_NISEA_20231218_154142"));
                DC(int64(0xea4b1a4f94a17232), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_SNAFSRECIPE, Document::UDocumentSegment_CH1_SNAFSRECIPE_Completed);
                DC(int64(0x66a8afbd7d5b1796), EConversationDebugInfo::Executing);
                Hero.AI.GiveItemTo(Snaf, UItAt_Meatbug_01, 3);
                DC(int64(0x66a8afbd7d5b1796), EConversationDebugInfo::Done);
                DC(int64(0x66a8afbd7d5b179a), EConversationDebugInfo::Executing);
                Snaf.RemoveItemFromInventory(UItAt_Meatbug_01, 3, 0);
                DC(int64(0x66a8afbd7d5b179a), EConversationDebugInfo::Done);
                DC(int64(0x12f475b5917c704f), EConversationDebugInfo::Executing);
                Snaf.RemoveItemFromInventory(UItFo_Plants_Mushroom_01, 5, 0);
                DC(int64(0x12f475b5917c704f), EConversationDebugInfo::Done);
                DC(int64(0x12f475b5917c7051), EConversationDebugInfo::Executing);
                Hero.AddItemToInventory(UItFo_Meatbugragout, 1);
                DC(int64(0x12f475b5917c7051), EConversationDebugInfo::Done);
                DC(int64(0x12f475b5917c7053), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_SNAFSRECIPE_SNAFRECIPE_OBJ_RETURN.SucceedQuest();
                DC(int64(0x12f475b5917c7053), EConversationDebugInfo::Done);
                DC(int64(0xdf0e4149dbcefa7e), EConversationDebugInfo::Executing);
                Hero.RemoveItemFromInventory(UItFo_Plants_Mushroom_01, 5, 0);
                DC(int64(0xdf0e4149dbcefa7e), EConversationDebugInfo::Done);
                DC(int64(0xf1eea1bc79505ea4), EConversationDebugInfo::Executing);
                G1R.Snaf_RagoutDay = FInGameTime::Now();
                DC(int64(0xf1eea1bc79505ea4), EConversationDebugInfo::Done);
                DC(int64(0x9733703e835840fd), EConversationDebugInfo::Executing);
                Hero.LearnRecipe(UReFo_Meatbugragout);
                DC(int64(0x9733703e835840fd), EConversationDebugInfo::Done);
                DC(int64(0xe269c527f7ecfad8), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xe269c527f7ecfad8), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */