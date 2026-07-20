#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OM_GRD_DRAKE_260 : UConversationCharacterSettings
        {
            default ForCharacter = n"OM_GRD_DRAKE_260";
        }
        
        
        class UTopic_Hero__OM_GRD_DRAKE_260 : UG1RDialogTopic
        {
            default ForCharacter = n"OM_GRD_DRAKE_260";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetDrake() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceDrake105762 : UTopic_Hero__OM_GRD_DRAKE_260
        {
            default DebugId = int64(0x9be750cb04bceea6);
            default Caption = LocText("GRD_260_DRAKE_GEFAHR_INFO_15_04");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceGrd260DrakeGefahr);
            default Rules.HideIfKnows(UChoiceDrake105762);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xae34c5512d5ef8ff), Drake != nullptr && !Drake.HasAssignedDailyRoutine(UDailyRoutine_OM_GRD_Drake_260_AfterCollapsed));
                }
                
                return Drake != nullptr && !Drake.HasAssignedDailyRoutine(UDailyRoutine_OM_GRD_Drake_260_AfterCollapsed);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb1cf225af1a9328a), EConversationDebugInfo::Executing);
                // Can you tell me more about the crawlers? 
                Hero.AI.Say(LocText("GRD_260_DRAKE_GEFAHR_INFO_15_04"));
                DC(int64(0xb1cf225af1a9328a), EConversationDebugInfo::Done);
                DC(int64(0xb1cf225af1a9328b), EConversationDebugInfo::Executing);
                
                // Guess I could. I'm a bit thirsty, though.
                Drake.AI.Say(LocText("GRD_260_DRAKE_GEFAHR_INFO_11_05"));
                DC(int64(0xb1cf225af1a9328b), EConversationDebugInfo::Done);
                DC(int64(0xb1cf225af1a9328c), EConversationDebugInfo::Executing);
                // How's this? You get me a beer, and I'll tell you what ...
                Drake.AI.Say(LocText("GRD_260_DRAKE_GEFAHR_INFO_11_06"));
                DC(int64(0xb1cf225af1a9328c), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OM_GRD_DRAKE, Document::UDocumentSegment_Glossary_OM_GRD_DRAKE_Beer);
            }
        }
        
        
        class UChoiceDrake110339 : UTopic_Hero__OM_GRD_DRAKE_260
        {
            default DebugId = int64(0xad5299688cb81891);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceDrake92777);
            
            default Rules.RequireCharacterCloseToWaypoint(n"HERO", n"WP_OM_BRIDGE", 200.0f, int64(0xad5299688cb81891));
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_KOQECXC_20240429_145848_3436"), int64(0xad5299688cb81891));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x49b3710aa1b6c3e3), Hero != nullptr && !Hero.HasDefeated(Drake));
                }
                
                return Hero != nullptr && !Hero.HasDefeated(Drake);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xad5299688cb8188e), EConversationDebugInfo::Executing);
                // You just don't listen, do you? All right. Have it your ...
                Drake.AI.Say(LocText("TEXT_WIP_DXQFBSL_20240916_142919_2386"));
                DC(int64(0xad5299688cb8188e), EConversationDebugInfo::Done);
                DC(int64(0xad5299688cb81898), EConversationDebugInfo::Executing);
                Drake.AI.StartAttackingImmediatelyLootOnly(Hero);
                DC(int64(0xad5299688cb81898), EConversationDebugInfo::Done);
                DC(int64(0xad5299688cb8189b), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xad5299688cb8189b), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceDrake92777 : UTopic_Hero__OM_GRD_DRAKE_260
        {
            default DebugId = int64(0x480c50accf6e8e77);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::WalkToOther;
            default ForceSettings.RangeType = EConversationForceRangeType::FarRange;
            
            default Rules.HideIfKnows(UChoiceDrake92777);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x480c50accf6e8e7d), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                    DB(int64(0xbb5d62dd68b52893), Drake != nullptr && !Drake.HasAssignedDailyRoutine(UDailyRoutine_OM_GRD_Drake_260_AfterCollapsed));
                    DB(int64(0x49b3710aa1b6c3e5), Hero != nullptr && !Hero.HasDefeated(Drake));
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp))
                    return false;
                
                if (Drake != nullptr && Drake.HasAssignedDailyRoutine(UDailyRoutine_OM_GRD_Drake_260_AfterCollapsed))
                    return false;
                
                if (Hero != nullptr && Hero.HasDefeated(Drake))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x480c50accf6e8e74), EConversationDebugInfo::Executing);
                // Well, Innos blind my eyes with light.
                Drake.AI.Say(LocText("TEXT_WIP_MPUISQL_20240429_102117_41"));
                DC(int64(0x480c50accf6e8e74), EConversationDebugInfo::Done);
                DC(int64(0xf67f5e4e95d2c1a1), EConversationDebugInfo::Executing);
                // This has gotta be the first time one of Lares's guys ...
                Drake.AI.Say(LocText("TEXT_WIP_KOQECXC_20240429_144535"));
                DC(int64(0xf67f5e4e95d2c1a1), EConversationDebugInfo::Done);
                DC(int64(0x162ad6fd32a9da34), EConversationDebugInfo::Executing);
                // Guessing you have a reason to be here? 
                Drake.AI.Say(LocText("TEXT_WIP_AGXCIAC_20240904_164122"));
                DC(int64(0x162ad6fd32a9da34), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OM_GRD_DRAKE, Document::UDocumentSegment_Glossary_OM_GRD_DRAKE_Introduction);
                Subdialog(
                    UTopic_Drake_109710,
                    UTopic_Drake_109756,
                    UTopic_Drake_109794,
                    UTopic_Drake_109730
                );
                DC(int64(0x162ad6fd32a9da7e), EConversationDebugInfo::Executing);
                // How much?
                Hero.AI.Say(LocText("TEXT_WIP_AGXCIAC_20240904_164755"));
                DC(int64(0x162ad6fd32a9da7e), EConversationDebugInfo::Done);
                DC(int64(0x162ad6fd32a9da7f), EConversationDebugInfo::Executing);
                
                // One hundred nuggets. That'll do. 
                Drake.AI.Say(LocText("TEXT_WIP_AGXCIAC_20240904_164755_3436"));
                DC(int64(0x162ad6fd32a9da7f), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Drake_109909,
                    UTopic_Drake_109929,
                    UTopic_Drake_110049
                );
            }
        }
        
        
        class UTopic_Drake_109710 : UTopic_Hero__OM_GRD_DRAKE_260
        {
            default DebugId = int64(0x162ad6fd32a9da51);
            default Caption = LocText("TEXT_WIP_KOQECXC_20240429_144614_41");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Drake_109710);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xbb5d62dd68b52890), Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS != nullptr && Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS.IsRunning());
                }
                
                return Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS != nullptr && Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf67f5e4e95d2c1a4), EConversationDebugInfo::Executing);
                // I'm working for Y'Berion.
                Hero.AI.Say(LocText("TEXT_WIP_KOQECXC_20240429_144614_41"));
                DC(int64(0xf67f5e4e95d2c1a4), EConversationDebugInfo::Done);
                DC(int64(0xf67f5e4e95d2c1b3), EConversationDebugInfo::Executing);
                
                // Are you, now? 
                Drake.AI.Say(LocText("TEXT_WIP_KOQECXC_20240429_144651"));
                DC(int64(0xf67f5e4e95d2c1b3), EConversationDebugInfo::Done);
                DC(int64(0x162ad6fd32a9dab9), EConversationDebugInfo::Executing);
                // As much as I'd love to know the details of this unholy ...
                Drake.AI.Say(LocText("TEXT_WIP_AGXCIAC_20240904_165232"));
                DC(int64(0x162ad6fd32a9dab9), EConversationDebugInfo::Done);
                DC(int64(0x162ad6fd32a9daba), EConversationDebugInfo::Executing);
                // Unless ... 
                Drake.AI.Say(LocText("TEXT_WIP_AGXCIAC_20240904_165153"));
                DC(int64(0x162ad6fd32a9daba), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Drake_109756 : UTopic_Hero__OM_GRD_DRAKE_260
        {
            default DebugId = int64(0x162ad6fd32a9da69);
            default Caption = LocText("TEXT_WIP_KOQECXC_20240429_144614_2238");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Drake_109756);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf67f5e4e95d2c1a8), EConversationDebugInfo::Executing);
                
                // I'm not here to make trouble.
                Hero.AI.Say(LocText("TEXT_WIP_KOQECXC_20240429_144614_2238"));
                DC(int64(0xf67f5e4e95d2c1a8), EConversationDebugInfo::Done);
                DC(int64(0xf67f5e4e95d2c1b4), EConversationDebugInfo::Executing);
                
                // Why, isn't that reassuring. 
                Drake.AI.Say(LocText("TEXT_WIP_KOQECXC_20240429_145109"));
                DC(int64(0xf67f5e4e95d2c1b4), EConversationDebugInfo::Done);
                DC(int64(0x162ad6fd32a9dab6), EConversationDebugInfo::Executing);
                // But you have to be realistic: even if you're saying the ...
                Drake.AI.Say(LocText("TEXT_WIP_AGXCIAC_20240904_165202"));
                DC(int64(0x162ad6fd32a9dab6), EConversationDebugInfo::Done);
                DC(int64(0x162ad6fd32a9dab7), EConversationDebugInfo::Executing);
                // Unless ... 
                Drake.AI.Say(LocText("TEXT_WIP_AGXCIAC_20240904_165153"));
                DC(int64(0x162ad6fd32a9dab7), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Drake_109794 : UTopic_Hero__OM_GRD_DRAKE_260
        {
            default DebugId = int64(0x162ad6fd32a9da82);
            default Caption = LocText("TEXT_WIP_AGXCIAC_20240904_164805_3286");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Drake_109794);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x162ad6fd32a9da83), EConversationDebugInfo::Executing);
                
                // Get out of my way. 
                Hero.AI.Say(LocText("TEXT_WIP_AGXCIAC_20240904_164805_3286"));
                DC(int64(0x162ad6fd32a9da83), EConversationDebugInfo::Done);
                DC(int64(0x162ad6fd32a9da88), EConversationDebugInfo::Executing);
                
                // Oh, come on, now. If you attack me here, in the Old ...
                Drake.AI.Say(LocText("TEXT_WIP_AGXCIAC_20240904_164816"));
                DC(int64(0x162ad6fd32a9da88), EConversationDebugInfo::Done);
                DC(int64(0x162ad6fd32a9da89), EConversationDebugInfo::Executing);
                // Let's be sensible about this. Even if you're not here to ...
                Drake.AI.Say(LocText("TEXT_WIP_AGXCIAC_20240904_164849"));
                DC(int64(0x162ad6fd32a9da89), EConversationDebugInfo::Done);
                DC(int64(0x162ad6fd32a9dab5), EConversationDebugInfo::Executing);
                // Unless ... 
                Drake.AI.Say(LocText("TEXT_WIP_AGXCIAC_20240904_165153"));
                DC(int64(0x162ad6fd32a9dab5), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Drake_109730 : UTopic_Hero__OM_GRD_DRAKE_260
        {
            default DebugId = int64(0x162ad6fd32a9da55);
            default Caption = LocText("TEXT_WIP_KOQECXC_20240429_144618_1924");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Drake_109730);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf67f5e4e95d2c1ae), EConversationDebugInfo::Executing);
                
                // Is this the part where you ask for a bribe?
                Hero.AI.Say(LocText("TEXT_WIP_KOQECXC_20240429_144618_1924"));
                DC(int64(0xf67f5e4e95d2c1ae), EConversationDebugInfo::Done);
                DC(int64(0xf67f5e4e95d2c1b5), EConversationDebugInfo::Executing);
                
                // Me?! You wound me.
                Drake.AI.Say(LocText("TEXT_WIP_KOQECXC_20240429_145138"));
                DC(int64(0xf67f5e4e95d2c1b5), EConversationDebugInfo::Done);
                DC(int64(0xf67f5e4e95d2c1bc), EConversationDebugInfo::Executing);
                // But ... well ... 
                Drake.AI.Say(LocText("TEXT_WIP_KOQECXC_20240429_145212"));
                DC(int64(0xf67f5e4e95d2c1bc), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Drake_109909 : UTopic_Hero__OM_GRD_DRAKE_260
        {
            default DebugId = int64(0xad5299688cb81826);
            default Caption = LocText("TEXT_WIP_DXQFBSL_20240916_134531_41");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Drake_109909);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xad5299688cb81831), Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 100, 0));
                }
                
                return Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 100, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xad5299688cb81827), EConversationDebugInfo::Executing);
                
                // Here you go. 
                Hero.AI.Say(LocText("TEXT_WIP_DXQFBSL_20240916_134531_41"));
                DC(int64(0xad5299688cb81827), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OM_GRD_DRAKE, Document::UDocumentSegment_Glossary_OM_GRD_DRAKE_NewCamper);
                DC(int64(0xad5299688cb81841), EConversationDebugInfo::Executing);
                Hero.AI.GiveItemTo(Drake, UItMi_Orenugget, 100);
                DC(int64(0xad5299688cb81841), EConversationDebugInfo::Done);
                DC(int64(0xf67f5e4e95d2c1c7), EConversationDebugInfo::Executing);
                // Wonderful. Glad we could come to an agreement. 
                Drake.AI.Say(LocText("TEXT_WIP_KOQECXC_20240429_145848_3436"));
                DC(int64(0xf67f5e4e95d2c1c7), EConversationDebugInfo::Done);
                DC(int64(0xf67f5e4e95d2c1ec), EConversationDebugInfo::Executing);
                // Now, that doesn't mean you can just do whatever you ...
                Drake.AI.Say(LocText("TEXT_WIP_KOQECXC_20240429_150421"));
                DC(int64(0xf67f5e4e95d2c1ec), EConversationDebugInfo::Done);
                DC(int64(0xf67f5e4e95d2c1ed), EConversationDebugInfo::Executing);
                // The moment you stir up any shit, I'll be the first to ...
                Drake.AI.Say(LocText("TEXT_WIP_KOQECXC_20240429_150454"));
                DC(int64(0xf67f5e4e95d2c1ed), EConversationDebugInfo::Done);
                DC(int64(0x162ad6fd32a9dabb), EConversationDebugInfo::Executing);
                
                // Not going to happen. 
                Hero.AI.Say(LocText("TEXT_WIP_AGXCIAC_20240904_165416"));
                DC(int64(0x162ad6fd32a9dabb), EConversationDebugInfo::Done);
                DC(int64(0xad5299688cb81848), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xad5299688cb81848), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Drake_109929 : UTopic_Hero__OM_GRD_DRAKE_260
        {
            default DebugId = int64(0xad5299688cb8182a);
            default Caption = LocText("TEXT_WIP_DXQFBSL_20240916_134531_2238");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Drake_109929);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xad5299688cb81835), Hero != nullptr && !Hero.HasItem(UItMi_Orenugget, 100, 0));
                }
                
                return Hero != nullptr && !Hero.HasItem(UItMi_Orenugget, 100, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xad5299688cb8182b), EConversationDebugInfo::Executing);
                // I don't have that much on me.
                Hero.AI.Say(LocText("TEXT_WIP_DXQFBSL_20240916_134531_2238"));
                DC(int64(0xad5299688cb8182b), EConversationDebugInfo::Done);
                DC(int64(0xad5299688cb8184b), EConversationDebugInfo::Executing);
                
                // Why, how sad. Then come back when you do. 
                Drake.AI.Say(LocText("TEXT_WIP_DXQFBSL_20240916_134858"));
                DC(int64(0xad5299688cb8184b), EConversationDebugInfo::Done);
                DC(int64(0xad5299688cb81855), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xad5299688cb81855), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Drake_110049 : UTopic_Hero__OM_GRD_DRAKE_260
        {
            default DebugId = int64(0xad5299688cb81838);
            default Caption = LocText("TEXT_WIP_DXQFBSL_20240916_134701_1924");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Drake_110049);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xad5299688cb81839), EConversationDebugInfo::Executing);
                // Forget about it. 
                Hero.AI.Say(LocText("TEXT_WIP_DXQFBSL_20240916_134701_1924"));
                DC(int64(0xad5299688cb81839), EConversationDebugInfo::Done);
                DC(int64(0x6139e0791ac5f4ed), EConversationDebugInfo::Executing);
                
                // Well, then YOU forget about setting a foot into that ...
                Drake.AI.Say(LocText("TEXT_WIP_ODMVSBC_20240917_175640"));
                DC(int64(0x6139e0791ac5f4ed), EConversationDebugInfo::Done);
                DC(int64(0xad5299688cb81858), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xad5299688cb81858), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceDrake95481 : UTopic_Hero__OM_GRD_DRAKE_260
        {
            default DebugId = int64(0xf67f5e4e95d2c1d2);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Drake_109929);
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Drake_110049);
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_KOQECXC_20240429_145848_3436"), int64(0xf67f5e4e95d2c1d2));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xad5299688cb81818), Hero != nullptr && Hero.IsInConversation());
                    DB(int64(0xae34c5512d5ef919), Drake != nullptr && !Drake.HasAssignedDailyRoutine(UDailyRoutine_OM_GRD_Drake_260_AfterCollapsed));
                    DB(int64(0x49b3710aa1b6c3e4), Hero != nullptr && !Hero.HasDefeated(Drake));
                }
                
                if (Hero != nullptr && !Hero.IsInConversation())
                    return false;
                
                if (Drake != nullptr && Drake.HasAssignedDailyRoutine(UDailyRoutine_OM_GRD_Drake_260_AfterCollapsed))
                    return false;
                
                if (Hero != nullptr && Hero.HasDefeated(Drake))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf67f5e4e95d2c1cf), EConversationDebugInfo::Executing);
                // Got those nuggets? 
                Drake.AI.Say(LocText("TEXT_WIP_KOQECXC_20240429_150036_686"));
                DC(int64(0xf67f5e4e95d2c1cf), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Drake_110182,
                    UTopic_Drake_110202
                );
            }
        }
        
        
        class UTopic_Drake_110182 : UTopic_Hero__OM_GRD_DRAKE_260
        {
            default DebugId = int64(0xad5299688cb8185c);
            default Caption = LocText("TEXT_WIP_DXQFBSL_20240916_140555_2785");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xad5299688cb8185d), EConversationDebugInfo::Executing);
                // I don't. 
                Hero.AI.Say(LocText("TEXT_WIP_DXQFBSL_20240916_140555_2785"));
                DC(int64(0xad5299688cb8185d), EConversationDebugInfo::Done);
                DC(int64(0xad5299688cb8186b), EConversationDebugInfo::Executing);
                
                // Why, how sad. Then come back when you do. 
                Drake.AI.Say(LocText("TEXT_WIP_DXQFBSL_20240916_134858"));
                DC(int64(0xad5299688cb8186b), EConversationDebugInfo::Done);
                DC(int64(0xad5299688cb81868), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xad5299688cb81868), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Drake_110202 : UTopic_Hero__OM_GRD_DRAKE_260
        {
            default DebugId = int64(0xad5299688cb81860);
            default Caption = LocText("TEXT_WIP_DXQFBSL_20240916_134531_41");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Drake_110202);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xad5299688cb8186d), Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 100, 0));
                }
                
                return Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 100, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xad5299688cb81861), EConversationDebugInfo::Executing);
                // Here you go. 
                Hero.AI.Say(LocText("TEXT_WIP_DXQFBSL_20240916_134531_41"));
                DC(int64(0xad5299688cb81861), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OM_GRD_DRAKE, Document::UDocumentSegment_Glossary_OM_GRD_DRAKE_NewCamper);
                DC(int64(0xad5299688cb8187b), EConversationDebugInfo::Executing);
                Hero.AI.GiveItemTo(Drake, UItMi_Orenugget, 100);
                DC(int64(0xad5299688cb8187b), EConversationDebugInfo::Done);
                DC(int64(0xad5299688cb81882), EConversationDebugInfo::Executing);
                // Here you go. 
                Hero.AI.Say(LocText("TEXT_WIP_KOQECXC_20240429_145848"));
                DC(int64(0xad5299688cb81882), EConversationDebugInfo::Done);
                DC(int64(0xad5299688cb8187e), EConversationDebugInfo::Executing);
                
                // Wonderful. Glad we could come to an agreement. 
                Drake.AI.Say(LocText("TEXT_WIP_KOQECXC_20240429_145848_3436"));
                DC(int64(0xad5299688cb8187e), EConversationDebugInfo::Done);
                DC(int64(0xad5299688cb81883), EConversationDebugInfo::Executing);
                // Now, that doesn't mean you can just do whatever you ...
                Drake.AI.Say(LocText("TEXT_WIP_KOQECXC_20240429_150421"));
                DC(int64(0xad5299688cb81883), EConversationDebugInfo::Done);
                DC(int64(0xad5299688cb81884), EConversationDebugInfo::Executing);
                // The moment you stir up any shit, I'll be the first to ...
                Drake.AI.Say(LocText("TEXT_WIP_KOQECXC_20240429_150454"));
                DC(int64(0xad5299688cb81884), EConversationDebugInfo::Done);
                DC(int64(0xad5299688cb8187f), EConversationDebugInfo::Executing);
                
                // Not going to happen. 
                Hero.AI.Say(LocText("TEXT_WIP_AGXCIAC_20240904_165416"));
                DC(int64(0xad5299688cb8187f), EConversationDebugInfo::Done);
                DC(int64(0xad5299688cb81885), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xad5299688cb81885), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGrd260DrakeCrawlerOkay : UTopic_Hero__OM_GRD_DRAKE_260
        {
            default DebugId = int64(0xb1cf225af1a9328d);
            default Caption = LocText("TEXT_CHOICE_GRD_260_DRAKE_CRAWLER_OKAY");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceDrake105762);
            default Rules.HideIfKnows(UChoiceGrd260DrakeCrawlerOkay);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa4610215cd29e06d), Hero != nullptr && Hero.HasItem(UItFo_Potion_Beer, 1, 0));
                    DB(int64(0xae34c5512d5ef918), Drake != nullptr && !Drake.HasAssignedDailyRoutine(UDailyRoutine_OM_GRD_Drake_260_AfterCollapsed));
                }
                
                if (Hero != nullptr && !Hero.HasItem(UItFo_Potion_Beer, 1, 0))
                    return false;
                
                if (Drake != nullptr && Drake.HasAssignedDailyRoutine(UDailyRoutine_OM_GRD_Drake_260_AfterCollapsed))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DB(int64(0xb1cf225af1a9328f), Hero != nullptr && Hero.HasItem(UItFo_Potion_Beer, 1, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItFo_Potion_Beer, 1, 0))
                {
                    DC(int64(0xb1cf225af1a93290), EConversationDebugInfo::Executing);
                    // Here's your beer. Cheers.
                    Hero.AI.Say(LocText("GRD_260_DRAKE_CRAWLER_OKAY_15_01"));
                    DC(int64(0xb1cf225af1a93290), EConversationDebugInfo::Done);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OM_GRD_DRAKE, Document::UDocumentSegment_Glossary_OM_GRD_DRAKE_Info);
                    DC(int64(0xa4610215cd29c660), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Drake, UItFo_Potion_Beer, 1);
                    DC(int64(0xa4610215cd29c660), EConversationDebugInfo::Done);
                    DB(int64(0xb1cf225af1a93293), Drake != nullptr && Drake.IsSitting());
                    
                    if (Drake != nullptr && Drake.IsSitting())
                    {
                        DC(int64(0x123f53d08c63c832), EConversationDebugInfo::Executing);
                        Drake.AI.TryInteractionWithoutSpot(GameplayTag::Action_Conversation_DrinkSeated, 7);
                        DC(int64(0x123f53d08c63c832), EConversationDebugInfo::Done);
                    }
                    else
                    {
                        DC(int64(0x1a51915304e8a78d), EConversationDebugInfo::Executing);
                        RequestCameraReverseShot();
                        DC(int64(0x1a51915304e8a78d), EConversationDebugInfo::Done);
                        DC(int64(0x123f53d08c63c830), EConversationDebugInfo::Executing);
                        Drake.AI.TryInteractionWithoutSpot(GameplayTag::Action_Conversation_Drink, 7);
                        DC(int64(0x123f53d08c63c830), EConversationDebugInfo::Done);
                    }
                    DC(int64(0xfaadadd2b4e39665), EConversationDebugInfo::Executing);
                    Drake.RemoveItemFromInventory(UItFo_Potion_Beer, 1, 0);
                    DC(int64(0xfaadadd2b4e39665), EConversationDebugInfo::Done);
                    DC(int64(0xb1cf225af1a93297), EConversationDebugInfo::Executing);
                    // Thanks. All right, let's see ... most crawlers are in ...
                    Drake.AI.Say(LocText("GRD_260_DRAKE_CRAWLER_OKAY_11_02"));
                    DC(int64(0xb1cf225af1a93297), EConversationDebugInfo::Done);
                    DC(int64(0xb1cf225af1a93298), EConversationDebugInfo::Executing);
                    // They steer clear of the main shaft, so as long as you're ...
                    Drake.AI.Say(LocText("GRD_260_DRAKE_CRAWLER_OKAY_11_03"));
                    DC(int64(0xb1cf225af1a93298), EConversationDebugInfo::Done);
                    DC(int64(0xb1cf225af1a93299), EConversationDebugInfo::Executing);
                    // And if you have to fight, find a corner to make sure ...
                    Drake.AI.Say(LocText("GRD_260_DRAKE_CRAWLER_OKAY_11_04"));
                    DC(int64(0xb1cf225af1a93299), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_grd_260_drake_crawler_okay_exit_1");
                }
                else
                {
                    DC(int64(0xb1cf225af1a9329a), EConversationDebugInfo::Executing);
                    // You're kidding? Come back when you have one.
                    Drake.AI.Say(LocText("GRD_260_DRAKE_CRAWLER_OKAY_11_06"));
                    DC(int64(0xb1cf225af1a9329a), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_grd_260_drake_crawler_okay_exit_2");
                    DC(int64(0xa4610215cd29e06e), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xa4610215cd29e06e), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
        class UChoiceGrd260DrakeExit : UTopic_Hero__OM_GRD_DRAKE_260
        {
            default DebugId = int64(0xb1cf225af1a93283);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb1cf225af1a93284), EConversationDebugInfo::Executing);
                // I'll see you around.
                Hero.AI.Say(LocText("INFO_EXIT_INFO_15_01"));
                DC(int64(0xb1cf225af1a93284), EConversationDebugInfo::Done);
                DC(int64(0xb1cf225af1a93285), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xb1cf225af1a93285), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGrd260DrakeGardeaufnahme : UTopic_Hero__OM_GRD_DRAKE_260
        {
            default DebugId = int64(0xb1cf225af1a932ab);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceGrd260DrakeGardeaufnahme);
            default Rules.HideIfKnows(UChoiceGrd264GardistGardeaufnahme);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xb1cf225af1a932ac), Hero != nullptr && Hero.HasItem(UItAt_Crawlerqueen, 1, 0));
                    DB(int64(0xb1cf225af1a932ad), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow));
                    DB(int64(0xae34c5512d5ef91a), Drake != nullptr && !Drake.HasAssignedDailyRoutine(UDailyRoutine_OM_GRD_Drake_260_AfterCollapsed));
                }
                
                if (Hero != nullptr && !Hero.HasItem(UItAt_Crawlerqueen, 1, 0))
                    return false;
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow))
                    return false;
                
                if (Drake != nullptr && Drake.HasAssignedDailyRoutine(UDailyRoutine_OM_GRD_Drake_260_AfterCollapsed))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb1cf225af1a932ae), EConversationDebugInfo::Executing);
                // Is it true you went into that bloody minecrawler tunnel?
                Drake.AI.Say(LocText("GRD_260_DRAKE_GARDEAUFNAHME_INFO_11_01"));
                DC(int64(0xb1cf225af1a932ae), EConversationDebugInfo::Done);
                DC(int64(0x6139e0791ac5f4ee), EConversationDebugInfo::Executing);
                
                // It's just a tunnel now. 
                Hero.AI.Say(LocText("TEXT_WIP_ODMVSBC_20240917_175739"));
                DC(int64(0x6139e0791ac5f4ee), EConversationDebugInfo::Done);
                DC(int64(0xb1cf225af1a932af), EConversationDebugInfo::Executing);
                
                // Ha! I like you. Not bad. 
                Drake.AI.Say(LocText("GRD_260_DRAKE_GARDEAUFNAHME_INFO_11_02"));
                DC(int64(0xb1cf225af1a932af), EConversationDebugInfo::Done);
                DC(int64(0x6139e0791ac5f4ef), EConversationDebugInfo::Executing);
                // I'll make sure Thorus hears about this. Who knows, you ...
                Drake.AI.Say(LocText("TEXT_WIP_ODMVSBC_20240917_175756"));
                DC(int64(0x6139e0791ac5f4ef), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OM_GRD_DRAKE, Document::UDocumentSegment_Glossary_OM_GRD_DRAKE_Impress);
            }
        }
        
        
        class UChoiceGrd260DrakeGefahr : UTopic_Hero__OM_GRD_DRAKE_260
        {
            default DebugId = int64(0xb1cf225af1a93286);
            default Caption = LocText("GRD_260_DRAKE_GEFAHR_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceGrd260DrakeMine);
            default Rules.HideIfKnows(UChoiceGrd260DrakeGefahr);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xae34c5512d5ef8ff), Drake != nullptr && !Drake.HasAssignedDailyRoutine(UDailyRoutine_OM_GRD_Drake_260_AfterCollapsed));
                }
                
                return Drake != nullptr && !Drake.HasAssignedDailyRoutine(UDailyRoutine_OM_GRD_Drake_260_AfterCollapsed);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb1cf225af1a93287), EConversationDebugInfo::Executing);
                // Any other dangers I should be aware of?
                Hero.AI.Say(LocText("GRD_260_DRAKE_GEFAHR_INFO_15_01"));
                DC(int64(0xb1cf225af1a93287), EConversationDebugInfo::Done);
                DC(int64(0xb1cf225af1a93288), EConversationDebugInfo::Executing);
                
                // Well, don't slip. The humidity down here can be a bitch. 
                Drake.AI.Say(LocText("GRD_260_DRAKE_GEFAHR_INFO_11_02"));
                DC(int64(0xb1cf225af1a93288), EConversationDebugInfo::Done);
                DC(int64(0xb1cf225af1a93289), EConversationDebugInfo::Executing);
                // Other than that, I can only repeat what I said: look out ...
                Drake.AI.Say(LocText("GRD_260_DRAKE_GEFAHR_INFO_11_03"));
                DC(int64(0xb1cf225af1a93289), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceGrd260DrakeIan : UTopic_Hero__OM_GRD_DRAKE_260
        {
            default DebugId = int64(0xb1cf225af1a932a5);
            default Caption = LocText("GRD_260_DRAKE_IAN_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceGrd260DrakeMineMehr);
            default Rules.HideIfKnows(UChoiceGrd260DrakeIan);
            default Rules.HideIfKnows(UChoiceStt301IanHi);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xae34c5512d5ef8ff), Drake != nullptr && !Drake.HasAssignedDailyRoutine(UDailyRoutine_OM_GRD_Drake_260_AfterCollapsed));
                }
                
                return Drake != nullptr && !Drake.HasAssignedDailyRoutine(UDailyRoutine_OM_GRD_Drake_260_AfterCollapsed);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb1cf225af1a932a6), EConversationDebugInfo::Executing);
                
                // Where can I find Ian?
                Hero.AI.Say(LocText("GRD_260_DRAKE_IAN_INFO_15_01"));
                DC(int64(0xb1cf225af1a932a6), EConversationDebugInfo::Done);
                DC(int64(0xb1cf225af1a932a7), EConversationDebugInfo::Executing);
                
                // Halfway down the main shaft, at the storage. 
                Drake.AI.Say(LocText("GRD_260_DRAKE_IAN_INFO_11_02"));
                DC(int64(0xb1cf225af1a932a7), EConversationDebugInfo::Done);
                DC(int64(0xb1cf225af1a932a8), EConversationDebugInfo::Executing);
                // Word of warning, though, don't talk to him expecting him ...
                Drake.AI.Say(LocText("GRD_260_DRAKE_IAN_INFO_11_03"));
                DC(int64(0xb1cf225af1a932a8), EConversationDebugInfo::Done);
                DC(int64(0xb1cf225af1a932a9), EConversationDebugInfo::Executing);
                // This is Ian's mine, and he's calling the shots here.
                Drake.AI.Say(LocText("GRD_260_DRAKE_IAN_INFO_11_04"));
                DC(int64(0xb1cf225af1a932a9), EConversationDebugInfo::Done);
                DC(int64(0xb1cf225af1a932aa), EConversationDebugInfo::Executing);
                // Cross him and you cross all of us.
                Drake.AI.Say(LocText("GRD_260_DRAKE_IAN_INFO_11_05"));
                DC(int64(0xb1cf225af1a932aa), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OM_STT_IAN, Document::UDocumentSegment_Glossary_OM_STT_IAN_Advice);
            }
        }
        
        
        class UChoiceGrd260DrakeMine : UTopic_Hero__OM_GRD_DRAKE_260
        {
            default DebugId = int64(0xb1cf225af1a9329c);
            default Caption = LocText("GRD_260_DRAKE_MINE_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceGrd260DrakeMine);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xae34c5512d5ef8ff), Drake != nullptr && !Drake.HasAssignedDailyRoutine(UDailyRoutine_OM_GRD_Drake_260_AfterCollapsed));
                }
                
                return Drake != nullptr && !Drake.HasAssignedDailyRoutine(UDailyRoutine_OM_GRD_Drake_260_AfterCollapsed);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb1cf225af1a9329d), EConversationDebugInfo::Executing);
                // Can you tell me something about the mine? 
                Hero.AI.Say(LocText("GRD_260_DRAKE_MINE_INFO_15_01"));
                DC(int64(0xb1cf225af1a9329d), EConversationDebugInfo::Done);
                DC(int64(0x9d1cf82c343234e7), EConversationDebugInfo::Executing);
                
                // Like what? That it's dark and full of slimy and ugly ...
                Drake.AI.Say(LocText("TEXT_WIP_ADCKZPD_20241105_161845"));
                DC(int64(0x9d1cf82c343234e7), EConversationDebugInfo::Done);
                DC(int64(0x9d1cf82c343234e8), EConversationDebugInfo::Executing);
                
                // You know what I mean. 
                Hero.AI.Say(LocText("TEXT_WIP_ADCKZPD_20241105_161905"));
                DC(int64(0x9d1cf82c343234e8), EConversationDebugInfo::Done);
                DC(int64(0xb1cf225af1a9329e), EConversationDebugInfo::Executing);
                
                // Huh, guess I do. Let's see: this cave right here is the ...
                Drake.AI.Say(LocText("GRD_260_DRAKE_MINE_INFO_11_02"));
                DC(int64(0xb1cf225af1a9329e), EConversationDebugInfo::Done);
                DC(int64(0xb1cf225af1a9329f), EConversationDebugInfo::Executing);
                // Everything's connected through plankways, top to bottom. ...
                Drake.AI.Say(LocText("GRD_260_DRAKE_MINE_INFO_11_03"));
                DC(int64(0xb1cf225af1a9329f), EConversationDebugInfo::Done);
                DC(int64(0xb1cf225af1a932a0), EConversationDebugInfo::Executing);
                // There's plenty of uncharted tunnels, but they're ...
                Drake.AI.Say(LocText("GRD_260_DRAKE_MINE_INFO_11_04"));
                DC(int64(0xb1cf225af1a932a0), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OM_GRD_DRAKE, Document::UDocumentSegment_Glossary_OM_GRD_DRAKE_Introduction);
            }
        }
        
        
        class UChoiceGrd260DrakeMineMehr : UTopic_Hero__OM_GRD_DRAKE_260
        {
            default DebugId = int64(0xb1cf225af1a932a1);
            default Caption = LocText("GRD_260_DRAKE_MINE_MEHR_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceGrd260DrakeMine);
            default Rules.HideIfKnows(UChoiceGrd260DrakeMineMehr);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xae34c5512d5ef8ff), Drake != nullptr && !Drake.HasAssignedDailyRoutine(UDailyRoutine_OM_GRD_Drake_260_AfterCollapsed));
                }
                
                return Drake != nullptr && !Drake.HasAssignedDailyRoutine(UDailyRoutine_OM_GRD_Drake_260_AfterCollapsed);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb1cf225af1a932a2), EConversationDebugInfo::Executing);
                // Where do you smelt your ore?
                Hero.AI.Say(LocText("GRD_260_DRAKE_MINE_MEHR_INFO_15_01"));
                DC(int64(0xb1cf225af1a932a2), EConversationDebugInfo::Done);
                DC(int64(0xb1cf225af1a932a3), EConversationDebugInfo::Executing);
                
                // Down at the bottom. You can talk to Viper, our smelter. 
                Drake.AI.Say(LocText("GRD_260_DRAKE_MINE_MEHR_INFO_11_02"));
                DC(int64(0xb1cf225af1a932a3), EConversationDebugInfo::Done);
                DC(int64(0xb1cf225af1a932a4), EConversationDebugInfo::Executing);
                // Don't get any ideas, though. If anyone sees you ...
                Drake.AI.Say(LocText("GRD_260_DRAKE_MINE_MEHR_INFO_11_03"));
                DC(int64(0xb1cf225af1a932a4), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */