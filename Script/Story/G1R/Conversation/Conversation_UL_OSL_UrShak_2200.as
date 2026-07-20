#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_UL_OSL_URSHAK_2200 : UConversationCharacterSettings
        {
            default ForCharacter = n"UL_OSL_URSHAK_2200";
        }
        
        
        class UTopic_Hero__UL_OSL_URSHAK_2200 : UG1RDialogTopic
        {
            default ForCharacter = n"UL_OSL_URSHAK_2200";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetUrShak() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetMalon() const property
            {
                return GetCharacter(n"NC_BAU_MALON_930");
            }
            
            AGothicCharacterState GetPeasant19() const property
            {
                return GetCharacter(n"NC_BAU_PEASANT19_929");
            }
            
            AGothicCharacterState GetRiordian() const property
            {
                return GetCharacter(n"NC_KDW_RIORDIAN_605");
            }
            
            AGothicCharacterState GetUrNazkrog() const property
            {
                return GetCharacter(n"OW_OSM_URNAZKROG_2401");
            }
            
            AGothicCharacterState GetGrazkrak() const property
            {
                return GetCharacter(n"OW_OWR_GRAZKRAK_2400");
            }
            
            AGothicCharacterState GetToChurnagg() const property
            {
                return GetCharacter(n"OW_OWR_TOCHURNAGG_2403");
            }
            
            AGothicCharacterState GetXardas() const property
            {
                return GetCharacter(n"XT_DMB_XARDAS_404");
            }
        }
        
        
        class UChoiceOrcshamanExit : UTopic_Hero__UL_OSL_URSHAK_2200
        {
            default DebugId = int64(0x2a33aa8f22a4cc94);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc0b44b76c24ecc01), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xc0b44b76c24ecc01), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceOrcshamanFriendlyhello : UTopic_Hero__UL_OSL_URSHAK_2200
        {
            default DebugId = int64(0x2a33aa8f22a4cd04);
            default Caption = LocText("INFO_ORCSHAMAN_FRIENDLYHELLO_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceOrcshamanUlumulu);
            default Rules.HideIfKnows(UChoiceOrcshamanFriendlyhello);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_JYRXZUK_20240703_113332_41"), int64(0x2a33aa8f22a4cd04));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc0b44b76c24ecc50), EConversationDebugInfo::Executing);
                // How are you doing?
                Hero.AI.Say(LocText("INFO_ORCSHAMAN_FRIENDLYHELLO_15_01"));
                DC(int64(0xc0b44b76c24ecc50), EConversationDebugInfo::Done);
                DC(int64(0xc0b44b76c24ecc51), EConversationDebugInfo::Executing);
                
                // As long as Krushak is not dead, I will never rest easy.
                UrShak.AI.Say(LocText("INFO_ORCSHAMAN_FRIENDLYHELLO_17_02"));
                DC(int64(0xc0b44b76c24ecc51), EConversationDebugInfo::Done);
                DC(int64(0xc0b44b76c24ecc52), EConversationDebugInfo::Executing);
                // You must kill him. 
                UrShak.AI.Say(LocText("INFO_ORCSHAMAN_FRIENDLYHELLO_17_03"));
                DC(int64(0xc0b44b76c24ecc52), EConversationDebugInfo::Done);
                DC(int64(0xc0b44b76c24ecc55), EConversationDebugInfo::Executing);
                
                // I'm on it. 
                Hero.AI.Say(LocText("INFO_ORCSHAMAN_FRIENDLYHELLO_15_06"));
                DC(int64(0xc0b44b76c24ecc55), EConversationDebugInfo::Done);
                DC(int64(0xc0b44b76c24ecc56), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xc0b44b76c24ecc56), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceOrcshamanIntemple : UTopic_Hero__UL_OSL_URSHAK_2200
        {
            default DebugId = int64(0x2a33aa8f22a4ccc7);
            default Caption = LocText("TEXT_WIP_MEVDOTI_20240702_203853");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceOrcshamanWhy);
            default Rules.HideIfKnows(UChoiceOrcshamanIntemple);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7c53d50729308a6f), EConversationDebugInfo::Executing);
                // So - can you help us get into the temple? Xardas says ...
                Hero.AI.Say(LocText("TEXT_WIP_MEVDOTI_20240702_203853"));
                DC(int64(0x7c53d50729308a6f), EConversationDebugInfo::Done);
                DC(int64(0x2e9b24c8048766e3), EConversationDebugInfo::Executing);
                
                // (long sigh) I fear it won't be this simple. 
                UrShak.AI.Say(LocText("TEXT_WIP_WQNYMZK_20240426_002405"));
                DC(int64(0x2e9b24c8048766e3), EConversationDebugInfo::Done);
                DC(int64(0x7c53d50729308a70), EConversationDebugInfo::Executing);
                // I can help you get into the ordôkh - our enclave - but ...
                UrShak.AI.Say(LocText("TEXT_WIP_MEVDOTI_20240702_204134"));
                DC(int64(0x7c53d50729308a70), EConversationDebugInfo::Done);
                DC(int64(0x7c53d50729308a71), EConversationDebugInfo::Executing);
                // My brothers and sisters have been trying to get through ...
                UrShak.AI.Say(LocText("TEXT_WIP_MEVDOTI_20240702_204322"));
                DC(int64(0x7c53d50729308a71), EConversationDebugInfo::Done);
                DC(int64(0x7c53d50729308a8c), EConversationDebugInfo::Executing);
                // Every orc is in turmoil - they believe that Krushak ...
                UrShak.AI.Say(LocText("TEXT_WIP_MEVDOTI_20240702_204949"));
                DC(int64(0x7c53d50729308a8c), EConversationDebugInfo::Done);
                Subdialog(
                    UUrShak_95170,
                    UUrShak_95212,
                    UUrShak_95190,
                    UUrShak_101555
                );
            }
        }
        
        
        class UUrShak_95170 : UTopic_Hero__UL_OSL_URSHAK_2200
        {
            default DebugId = int64(0x2e9b24c8048766e8);
            default Caption = LocText("TEXT_WIP_WQNYMZK_20240426_005507_491");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UUrShak_95170);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2e9b24c8048766e9), EConversationDebugInfo::Executing);
                // What kind of magic? 
                Hero.AI.Say(LocText("TEXT_WIP_WQNYMZK_20240426_005507_491"));
                DC(int64(0x2e9b24c8048766e9), EConversationDebugInfo::Done);
                DC(int64(0x2e9b24c8048766fc), EConversationDebugInfo::Executing);
                
                // I forgot the word. Like this above. 
                UrShak.AI.Say(LocText("TEXT_WIP_WQNYMZK_20240426_005633"));
                DC(int64(0x2e9b24c8048766fc), EConversationDebugInfo::Done);
                DC(int64(0x7c53d50729308a82), EConversationDebugInfo::Executing);
                
                // ... A barrier. 
                Hero.AI.Say(LocText("TEXT_WIP_MEVDOTI_20240702_204659"));
                DC(int64(0x7c53d50729308a82), EConversationDebugInfo::Done);
                DC(int64(0x7c53d50729308a83), EConversationDebugInfo::Executing);
                
                // Yes. 
                UrShak.AI.Say(LocText("TEXT_WIP_MEVDOTI_20240702_204703"));
                DC(int64(0x7c53d50729308a83), EConversationDebugInfo::Done);
                DC(int64(0x2e9b24c8048766eb), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x2e9b24c8048766eb), EConversationDebugInfo::Done);
            }
        }
        
        
        class UUrShak_95212 : UTopic_Hero__UL_OSL_URSHAK_2200
        {
            default DebugId = int64(0x2e9b24c8048766f4);
            default Caption = LocText("TEXT_WIP_WQNYMZK_20240426_005554_731");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UUrShak_95212);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2e9b24c8048766f5), EConversationDebugInfo::Executing);
                // I don't understand. Your ancestors summoned the Sleeper.
                Hero.AI.Say(LocText("TEXT_WIP_WQNYMZK_20240426_005554_731"));
                DC(int64(0x2e9b24c8048766f5), EConversationDebugInfo::Done);
                DC(int64(0x12a5c413b879ea2b), EConversationDebugInfo::Executing);
                // Why would they seal it with magic that locked your ...
                Hero.AI.Say(LocText("TEXT_WIP_DEVDOTI_20240709_141442"));
                DC(int64(0x12a5c413b879ea2b), EConversationDebugInfo::Done);
                DC(int64(0x2e9b24c8048766fe), EConversationDebugInfo::Executing);
                
                // Protection. The shamans knew it would be a thousand ...
                UrShak.AI.Say(LocText("TEXT_WIP_WQNYMZK_20240426_005700"));
                DC(int64(0x2e9b24c8048766fe), EConversationDebugInfo::Done);
                DC(int64(0x12a5c413b879ea2c), EConversationDebugInfo::Executing);
                // A lot can happen in a thousand years.
                UrShak.AI.Say(LocText("TEXT_WIP_DEVDOTI_20240709_141455"));
                DC(int64(0x12a5c413b879ea2c), EConversationDebugInfo::Done);
                DC(int64(0x2e9b24c8048766ef), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x2e9b24c8048766ef), EConversationDebugInfo::Done);
            }
        }
        
        
        class UUrShak_95190 : UTopic_Hero__UL_OSL_URSHAK_2200
        {
            default DebugId = int64(0x2e9b24c8048766ec);
            default Caption = LocText("TEXT_WIP_WQNYMZK_20240426_005507_3750");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UUrShak_95190);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2e9b24c8048766ed), EConversationDebugInfo::Executing);
                // Hold on. The Sleeper won't awaken without this "final ...
                Hero.AI.Say(LocText("TEXT_WIP_WQNYMZK_20240426_005507_3750"));
                DC(int64(0x2e9b24c8048766ed), EConversationDebugInfo::Done);
                DC(int64(0x2e9b24c8048766fd), EConversationDebugInfo::Executing);
                
                // Yes.
                UrShak.AI.Say(LocText("TEXT_WIP_WQNYMZK_20240426_005638"));
                DC(int64(0x2e9b24c8048766fd), EConversationDebugInfo::Done);
                DC(int64(0x12a5c413b879ea30), EConversationDebugInfo::Executing);
                
                // And your kin can't get into the temple?
                Hero.AI.Say(LocText("TEXT_WIP_DEVDOTI_20240709_141531"));
                DC(int64(0x12a5c413b879ea30), EConversationDebugInfo::Done);
                DC(int64(0x12a5c413b879ea31), EConversationDebugInfo::Executing);
                
                // Yes. But if your question is if this means Krushak is no ...
                UrShak.AI.Say(LocText("TEXT_WIP_DEVDOTI_20240709_141535"));
                DC(int64(0x12a5c413b879ea31), EConversationDebugInfo::Done);
                DC(int64(0x12a5c413b879ea32), EConversationDebugInfo::Executing);
                // Krushak is powerful, as powerful as Balyar. I believe ...
                UrShak.AI.Say(LocText("TEXT_WIP_DEVDOTI_20240709_141539"));
                DC(int64(0x12a5c413b879ea32), EConversationDebugInfo::Done);
                DC(int64(0x12a5c413b879ea33), EConversationDebugInfo::Executing);
                // And even if it is so, I fear my kin will find a way ...
                UrShak.AI.Say(LocText("TEXT_WIP_DEVDOTI_20240709_141543"));
                DC(int64(0x12a5c413b879ea33), EConversationDebugInfo::Done);
                DC(int64(0x12a5c413b879ea50), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x12a5c413b879ea50), EConversationDebugInfo::Done);
            }
        }
        
        
        class UUrShak_101555 : UTopic_Hero__UL_OSL_URSHAK_2200
        {
            default DebugId = int64(0x12a5c413b879ea23);
            default Caption = LocText("TEXT_WIP_DEVDOTI_20240709_141418_2238");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UUrShak_101555);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x12a5c413b879ea24), EConversationDebugInfo::Executing);
                // There must be a way in. I just need to get close enough ...
                Hero.AI.Say(LocText("TEXT_WIP_DEVDOTI_20240709_141418_2238"));
                DC(int64(0x12a5c413b879ea24), EConversationDebugInfo::Done);
                DC(int64(0x12a5c413b879ea34), EConversationDebugInfo::Executing);
                
                // Again, you speak "chu khal." I like it. Very well. I can ...
                UrShak.AI.Say(LocText("TEXT_WIP_DEVDOTI_20240709_141557"));
                DC(int64(0x12a5c413b879ea34), EConversationDebugInfo::Done);
                DC(int64(0x12a5c413b879ea35), EConversationDebugInfo::Executing);
                // But there is only one way for a morra to enter these ...
                UrShak.AI.Say(LocText("TEXT_WIP_DEVDOTI_20240709_141609"));
                DC(int64(0x12a5c413b879ea35), EConversationDebugInfo::Done);
                DC(int64(0x12a5c413b879ea36), EConversationDebugInfo::Executing);
                // The Ulu-Mulu.
                UrShak.AI.Say(LocText("TEXT_WIP_DEVDOTI_20240709_141613"));
                DC(int64(0x12a5c413b879ea36), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceOrcshamanKrushak : UTopic_Hero__UL_OSL_URSHAK_2200
        {
            default DebugId = int64(0x2a33aa8f22a4ccab);
            default Caption = LocText("INFO_ORCSHAMAN_KRUSHAK_15_01");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceOrcshamanKrushak);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_CHKWYUI_20240711_121211"), int64(0x2a33aa8f22a4ccab));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc0b44b76c24ecc11), EConversationDebugInfo::Executing);
                
                // Is "Krushak" your name for the Sleeper?
                Hero.AI.Say(LocText("INFO_ORCSHAMAN_KRUSHAK_15_01"));
                DC(int64(0xc0b44b76c24ecc11), EConversationDebugInfo::Done);
                DC(int64(0xc0b44b76c24ecc12), EConversationDebugInfo::Executing);
                
                // Yes. Krush-ak. Destroy-biggest. The greatest destroyer. 
                UrShak.AI.Say(LocText("INFO_ORCSHAMAN_KRUSHAK_17_02"));
                DC(int64(0xc0b44b76c24ecc12), EConversationDebugInfo::Done);
                DC(int64(0xc0b44b76c24ecc14), EConversationDebugInfo::Executing);
                // That is what my kin believe Krushak does. If only they ...
                UrShak.AI.Say(LocText("INFO_ORCSHAMAN_KRUSHAK_17_04"));
                DC(int64(0xc0b44b76c24ecc14), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceOrcshamanOrccity : UTopic_Hero__UL_OSL_URSHAK_2200
        {
            default DebugId = int64(0x2a33aa8f22a4cd0d);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::LetOtherWalk;
            
            default Rules.RequireCharacterCloseToWaypoint(n"hero", n"FP_OTOWN_URSHAK_EXTERIOR", 1000.0f, int64(0x2a33aa8f22a4cd0d));
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("INFO_ORCSHAMAN_ORCCITY_17_02"), int64(0x2a33aa8f22a4cd0d));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x244fe8de2651fc26), Hero != nullptr && Hero.IsInConversation());
                }
                
                return Hero != nullptr && Hero.IsInConversation();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc9af0e7ca9004470), EConversationDebugInfo::Executing);
                Quest::ValleyOfMines_VoMCHAPTER4_PATHTOORCENCLAVE_PATHTOORCENCLAVE_OBJ_MEETURSHAK.SucceedQuest();
                DC(int64(0xc9af0e7ca9004470), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH4_PATHTOORCENCLAVE, Document::UDocumentSegment_CH4_PATHTOORCENCLAVE_End);
                DC(int64(0xc0b44b76c24ecc57), EConversationDebugInfo::Executing);
                // You are back. 
                UrShak.AI.Say(LocText("INFO_ORCSHAMAN_ORCCITY_17_01"));
                DC(int64(0xc0b44b76c24ecc57), EConversationDebugInfo::Done);
                DB(int64(0x2a33aa8f22a4cd13), Hero != nullptr && Hero.HasItem(UItMw_2H_Staff_Ulumulu, 1, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItMw_2H_Staff_Ulumulu, 1, 0))
                {
                    DC(int64(0xc0b44b76c24ecc59), EConversationDebugInfo::Executing);
                    // And you have it. Well done - you are a true warrior.
                    UrShak.AI.Say(LocText("INFO_ORCSHAMAN_ORCCITY_17_02"));
                    DC(int64(0xc0b44b76c24ecc59), EConversationDebugInfo::Done);
                    DC(int64(0xc0b44b76c24ecc5a), EConversationDebugInfo::Executing);
                    // But Tarrok ... 
                    UrShak.AI.Say(LocText("INFO_ORCSHAMAN_ORCCITY_17_03"));
                    DC(int64(0xc0b44b76c24ecc5a), EConversationDebugInfo::Done);
                    Subdialog(
                        UUrShak_106200,
                        UUrShak_106220
                    );
                    DC(int64(0xa25af48ce7a3d492), EConversationDebugInfo::Executing);
                    // He insisted on dueling me. His "zarr" completed the ...
                    Hero.AI.Say(LocText("TEXT_WIP_OSZXZLE_20240826_141644"));
                    DC(int64(0xa25af48ce7a3d492), EConversationDebugInfo::Done);
                    DC(int64(0x2e9b24c804876781), EConversationDebugInfo::Executing);
                    
                    // Hmm. I should be glad to know Tarrok died with honor, ...
                    UrShak.AI.Say(LocText("TEXT_WIP_WQNYMZK_20240426_033700"));
                    DC(int64(0x2e9b24c804876781), EConversationDebugInfo::Done);
                    DC(int64(0x2e9b24c804876782), EConversationDebugInfo::Executing);
                    // But these are words for another day. You found the ...
                    UrShak.AI.Say(LocText("TEXT_WIP_WQNYMZK_20240426_033819"));
                    DC(int64(0x2e9b24c804876782), EConversationDebugInfo::Done);
                    DC(int64(0x12a5c413b879ea8a), EConversationDebugInfo::Executing);
                    
                    // What now?
                    Hero.AI.Say(LocText("TEXT_WIP_NTJBDPJ_20260611_130014"));
                    DC(int64(0x12a5c413b879ea8a), EConversationDebugInfo::Done);
                    DC(int64(0x12a5c413b879ea8c), EConversationDebugInfo::Executing);
                    
                    // Now you show it to my kin. Walk to the gate, and hold ...
                    UrShak.AI.Say(LocText("TEXT_WIP_DEVDOTI_20240709_143308"));
                    DC(int64(0x12a5c413b879ea8c), EConversationDebugInfo::Done);
                    DC(int64(0x12a5c413b879ea8d), EConversationDebugInfo::Executing);
                    // They will honor the tradition and let you in. 
                    UrShak.AI.Say(LocText("TEXT_WIP_DEVDOTI_20240709_143629"));
                    DC(int64(0x12a5c413b879ea8d), EConversationDebugInfo::Done);
                    Subdialog(
                        UUrShak_102154,
                        UUrShak_102174,
                        UUrShak_212664,
                        UUrShak_103323
                    );
                }
                else
                {
                    DC(int64(0xc0b44b76c24ecc5b), EConversationDebugInfo::Executing);
                    // What of the Ulu-Mulu? Have you spoken with Tarrok yet?
                    UrShak.AI.Say(LocText("INFO_ORCSHAMAN_ORCCITY_17_04"));
                    DC(int64(0xc0b44b76c24ecc5b), EConversationDebugInfo::Done);
                    DC(int64(0x12a5c413b879ea8b), EConversationDebugInfo::Executing);
                    
                    // I'm on it.
                    Hero.AI.Say(LocText("TEXT_WIP_DEVDOTI_20240709_143250"));
                    DC(int64(0x12a5c413b879ea8b), EConversationDebugInfo::Done);
                    DC(int64(0xc0b44b76c24ecc5c), EConversationDebugInfo::Executing);
                    
                    // Be swift. 
                    UrShak.AI.Say(LocText("INFO_ORCSHAMAN_ORCCITY_17_05"));
                    DC(int64(0xc0b44b76c24ecc5c), EConversationDebugInfo::Done);
                    DC(int64(0xa83227a61029d777), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xa83227a61029d777), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
        class UUrShak_106200 : UTopic_Hero__UL_OSL_URSHAK_2200
        {
            default DebugId = int64(0xa25af48ce7a3d466);
            default Caption = LocText("TEXT_WIP_OSZXZLE_20240826_134750_41");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UUrShak_106200);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa25af48ce7a3d467), EConversationDebugInfo::Executing);
                // He's fine.
                Hero.AI.Say(LocText("TEXT_WIP_OSZXZLE_20240826_134750_41"));
                DC(int64(0xa25af48ce7a3d467), EConversationDebugInfo::Done);
                DC(int64(0xa25af48ce7a3d470), EConversationDebugInfo::Executing);
                
                // Hm. It is kind of you to want to spare me the pain, but ...
                UrShak.AI.Say(LocText("TEXT_WIP_OSZXZLE_20240826_134847"));
                DC(int64(0xa25af48ce7a3d470), EConversationDebugInfo::Done);
                DC(int64(0x3f54d6b55bfe858), EConversationDebugInfo::Executing);
                // Tell me the truth.
                UrShak.AI.Say(LocText("TEXT_WIP_LGTRMXB_20240925_155713"));
                DC(int64(0x3f54d6b55bfe858), EConversationDebugInfo::Done);
                DC(int64(0x3f54d6b55bfe859), EConversationDebugInfo::Executing);
                
                // Fine. 
                Hero.AI.Say(LocText("TEXT_WIP_LGTRMXB_20240925_155716"));
                DC(int64(0x3f54d6b55bfe859), EConversationDebugInfo::Done);
            }
        }
        
        
        class UUrShak_106220 : UTopic_Hero__UL_OSL_URSHAK_2200
        {
            default DebugId = int64(0xa25af48ce7a3d46a);
            default Caption = LocText("TEXT_WIP_OSZXZLE_20240826_141644");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UUrShak_106220);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                
            }
        }
        
        
        class UUrShak_102154 : UTopic_Hero__UL_OSL_URSHAK_2200
        {
            default DebugId = int64(0x12a5c413b879ea95);
            default Caption = LocText("TEXT_WIP_DEVDOTI_20240709_143644_3984");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UUrShak_102154);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x12a5c413b879ea96), EConversationDebugInfo::Executing);
                // Are you sure they'll let me through? 
                Hero.AI.Say(LocText("TEXT_WIP_DEVDOTI_20240709_143644_3984"));
                DC(int64(0x12a5c413b879ea96), EConversationDebugInfo::Done);
                DC(int64(0x12a5c413b879eaa2), EConversationDebugInfo::Executing);
                
                // I am sure. At least ... mostly. 
                UrShak.AI.Say(LocText("TEXT_WIP_DEVDOTI_20240709_143707"));
                DC(int64(0x12a5c413b879eaa2), EConversationDebugInfo::Done);
                DC(int64(0x12a5c413b879eaa3), EConversationDebugInfo::Executing);
                
                // That's not what I wanted to hear. 
                Hero.AI.Say(LocText("TEXT_WIP_DEVDOTI_20240709_143717"));
                DC(int64(0x12a5c413b879eaa3), EConversationDebugInfo::Done);
                DC(int64(0x12a5c413b879eaa4), EConversationDebugInfo::Executing);
                
                // It's the truth. The ordôkh has two leaders - Ur-Nazkrog ...
                UrShak.AI.Say(LocText("TEXT_WIP_DEVDOTI_20240709_143731"));
                DC(int64(0x12a5c413b879eaa4), EConversationDebugInfo::Done);
                DC(int64(0x12a5c413b879eaa5), EConversationDebugInfo::Executing);
                // Ur-Nazkrok respects tradition. To-Churnagg only cares ...
                UrShak.AI.Say(LocText("TEXT_WIP_DEVDOTI_20240709_143906"));
                DC(int64(0x12a5c413b879eaa5), EConversationDebugInfo::Done);
                DC(int64(0x12a5c413b879eaa6), EConversationDebugInfo::Executing);
                // But it WILL work. They will open the gates. They must. 
                UrShak.AI.Say(LocText("TEXT_WIP_DEVDOTI_20240709_143928"));
                DC(int64(0x12a5c413b879eaa6), EConversationDebugInfo::Done);
                DC(int64(0x12a5c413b879ea98), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x12a5c413b879ea98), EConversationDebugInfo::Done);
            }
        }
        
        
        class UUrShak_102174 : UTopic_Hero__UL_OSL_URSHAK_2200
        {
            default DebugId = int64(0x12a5c413b879ea99);
            default Caption = LocText("TEXT_WIP_DEVDOTI_20240709_143644_3569");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UUrShak_102174);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x12a5c413b879ea9a), EConversationDebugInfo::Executing);
                // And then what? Will they just let me explore their camp?
                Hero.AI.Say(LocText("TEXT_WIP_DEVDOTI_20240709_143644_3569"));
                DC(int64(0x12a5c413b879ea9a), EConversationDebugInfo::Done);
                DC(int64(0x12a5c413b879eaa7), EConversationDebugInfo::Executing);
                
                // There may be another trial - impossible to say. It has ...
                UrShak.AI.Say(LocText("TEXT_WIP_DEVDOTI_20240709_144008"));
                DC(int64(0x12a5c413b879eaa7), EConversationDebugInfo::Done);
                DC(int64(0x12a5c413b879eaa8), EConversationDebugInfo::Executing);
                // But yes, once you are inside, my kin will not harm you, ...
                UrShak.AI.Say(LocText("TEXT_WIP_DEVDOTI_20240709_144017"));
                DC(int64(0x12a5c413b879eaa8), EConversationDebugInfo::Done);
                DC(int64(0x12a5c413b879eaa9), EConversationDebugInfo::Executing);
                // That does not mean they won't watch you. 
                UrShak.AI.Say(LocText("TEXT_WIP_DEVDOTI_20240709_144104"));
                DC(int64(0x12a5c413b879eaa9), EConversationDebugInfo::Done);
                DC(int64(0x12a5c413b879eaaa), EConversationDebugInfo::Executing);
                
                // I figured. 
                Hero.AI.Say(LocText("TEXT_WIP_DEVDOTI_20240709_144114"));
                DC(int64(0x12a5c413b879eaaa), EConversationDebugInfo::Done);
                DC(int64(0x12a5c413b879ea9c), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x12a5c413b879ea9c), EConversationDebugInfo::Done);
            }
        }
        
        
        class UUrShak_212664 : UTopic_Hero__UL_OSL_URSHAK_2200
        {
            default DebugId = int64(0xa25af48ce7a4356d);
            default Caption = LocText("TEXT_WIP_OSZXZLE_20240826_153501_3436");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UUrShak_212664);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_OSZXZLE_20240826_134847"), int64(0xa25af48ce7a4356d));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa25af48ce7a4356e), EConversationDebugInfo::Executing);
                // How did you "feel" Tarrok's death?
                Hero.AI.Say(LocText("TEXT_WIP_OSZXZLE_20240826_153501_3436"));
                DC(int64(0xa25af48ce7a4356e), EConversationDebugInfo::Done);
                DC(int64(0xa25af48ce7a43573), EConversationDebugInfo::Executing);
                
                // When a warrior spills blood, his zarr shifts, but it ...
                UrShak.AI.Say(LocText("TEXT_WIP_OSZXZLE_20240826_153606"));
                DC(int64(0xa25af48ce7a43573), EConversationDebugInfo::Done);
                DC(int64(0xa25af48ce7a43574), EConversationDebugInfo::Executing);
                // Shamans need raw zarr to shape magic from it, and we can ...
                UrShak.AI.Say(LocText("TEXT_WIP_OSZXZLE_20240826_153615"));
                DC(int64(0xa25af48ce7a43574), EConversationDebugInfo::Done);
                DC(int64(0xa25af48ce7a43575), EConversationDebugInfo::Executing);
                
                // And you felt Tarrok's zarr shift.
                Hero.AI.Say(LocText("TEXT_WIP_OSZXZLE_20240826_153620"));
                DC(int64(0xa25af48ce7a43575), EConversationDebugInfo::Done);
                DC(int64(0xa25af48ce7a43576), EConversationDebugInfo::Executing);
                
                // Something like that, yes.
                UrShak.AI.Say(LocText("TEXT_WIP_OSZXZLE_20240826_153631"));
                DC(int64(0xa25af48ce7a43576), EConversationDebugInfo::Done);
                DC(int64(0xa25af48ce7a43570), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xa25af48ce7a43570), EConversationDebugInfo::Done);
            }
        }
        
        
        class UUrShak_103323 : UTopic_Hero__UL_OSL_URSHAK_2200
        {
            default DebugId = int64(0x12a5c413b879eaab);
            default Caption = LocText("TEXT_WIP_DEVDOTI_20240709_144120_2801");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UUrShak_103323);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x12a5c413b879eaac), EConversationDebugInfo::Executing);
                // All right. Let's get this over with. 
                Hero.AI.Say(LocText("TEXT_WIP_DEVDOTI_20240709_144120_2801"));
                DC(int64(0x12a5c413b879eaac), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_UL_OLS_URSHAK, Document::UDocumentSegment_Glossary_UL_OLS_URSHAK_OrcEnclaveEntrance);
                DB(int64(0xce183aa31042c89b), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Master));
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Master))
                {
                    
                }
                else
                {
                    DC(int64(0x12a5c413b879eab3), EConversationDebugInfo::Executing);
                    // One more thing.
                    UrShak.AI.Say(LocText("TEXT_WIP_DEVDOTI_20240709_144129"));
                    DC(int64(0x12a5c413b879eab3), EConversationDebugInfo::Done);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_UL_OLS_URSHAK, Document::UDocumentSegment_Glossary_UL_OLS_URSHAK_LearnOrcish);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH5_ACCESSSLEEPERTEMPLE, Document::UDocumentSegment_CH5_ACCESSSLEEPERTEMPLE_Orcish);
                    DB(int64(0x9ca7fe2b2bebff5b), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Skilled));
                    
                    if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Skilled))
                    {
                        DC(int64(0x9ca7fe2b2bebff65), EConversationDebugInfo::Executing);
                        // You already speak our tongue, but in there, it may help ...
                        UrShak.AI.Say(LocText("TEXT_WIP_DHKWYUI_20240710_092753_41"));
                        DC(int64(0x9ca7fe2b2bebff65), EConversationDebugInfo::Done);
                    }
                    else
                    {
                        DC(int64(0x9ca7fe2b2bebff6b), EConversationDebugInfo::Executing);
                        // It may be difficult for a morra's soft throat, but ...
                        UrShak.AI.Say(LocText("TEXT_WIP_DHKWYUI_20240710_092757_2083"));
                        DC(int64(0x9ca7fe2b2bebff6b), EConversationDebugInfo::Done);
                    }
                    DC(int64(0x9ca7fe2b2bebff71), EConversationDebugInfo::Executing);
                    // I'm not planning to have a debate with them.
                    Hero.AI.Say(LocText("TEXT_WIP_DHKWYUI_20240710_092847"));
                    DC(int64(0x9ca7fe2b2bebff71), EConversationDebugInfo::Done);
                    DC(int64(0x9ca7fe2b2bebff7c), EConversationDebugInfo::Executing);
                    
                    // No, but you must find a way into the sanctum - and ...
                    UrShak.AI.Say(LocText("TEXT_WIP_DHKWYUI_20240710_093830"));
                    DC(int64(0x9ca7fe2b2bebff7c), EConversationDebugInfo::Done);
                    DC(int64(0x9ca7fe2b2bebff7d), EConversationDebugInfo::Executing);
                    // "Pakk mosh huhuk sho krush.," as we say. "The wise ...
                    UrShak.AI.Say(LocText("TEXT_WIP_DHKWYUI_20240710_093857"));
                    DC(int64(0x9ca7fe2b2bebff7d), EConversationDebugInfo::Done);
                    DC(int64(0x9ca7fe2b2bebff72), EConversationDebugInfo::Executing);
                    // But let us speak more about this once you are inside the ...
                    UrShak.AI.Say(LocText("TEXT_WIP_DHKWYUI_20240710_092928"));
                    DC(int64(0x9ca7fe2b2bebff72), EConversationDebugInfo::Done);
                }
                DC(int64(0xb643ac31c20478b9), EConversationDebugInfo::Executing);
                Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE.StartQuest();
                DC(int64(0xb643ac31c20478b9), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceOrcshamanOtherway : UTopic_Hero__UL_OSL_URSHAK_2200
        {
            default DebugId = int64(0x2a33aa8f22a4ccdc);
            default Caption = LocText("INFO_ORCSHAMAN_OTHERWAY_15_01");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceOrcshamanOtherway);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_DEVDOTI_20240709_141613"), int64(0x2a33aa8f22a4ccdc));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc0b44b76c24ecc36), EConversationDebugInfo::Executing);
                // Ulu-what?
                Hero.AI.Say(LocText("INFO_ORCSHAMAN_OTHERWAY_15_01"));
                DC(int64(0xc0b44b76c24ecc36), EConversationDebugInfo::Done);
                DC(int64(0xc0b44b76c24ecc37), EConversationDebugInfo::Executing);
                
                // Ulu-Mulu. The banner of banners that shows the wielder ...
                UrShak.AI.Say(LocText("INFO_ORCSHAMAN_OTHERWAY_17_02"));
                DC(int64(0xc0b44b76c24ecc37), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceOrcshamanThx : UTopic_Hero__UL_OSL_URSHAK_2200
        {
            default DebugId = int64(0x2a33aa8f22a4cc96);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceOrcshamanThx);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x2a33aa8f22a4cc97), G1R != nullptr && G1R.IsInChapter(4));
                }
                
                return G1R != nullptr && G1R.IsInChapter(4);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc0b44b76c24ecc02), EConversationDebugInfo::Executing);
                // You fight well, morra. 
                UrShak.AI.Say(LocText("INFO_ORCSHAMAN_THX_17_01"));
                DC(int64(0xc0b44b76c24ecc02), EConversationDebugInfo::Done);
                DC(int64(0x962243a4707fa2b9), EConversationDebugInfo::Executing);
                // I would thank you, but I feel this meeting is no ...
                UrShak.AI.Say(LocText("TEXT_WIP_LEVDOTI_20240701_111914"));
                DC(int64(0x962243a4707fa2b9), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_UL_OLS_URSHAK, Document::UDocumentSegment_Glossary_UL_OLS_URSHAK_Introduction_Teacher);
                DC(int64(0xe20dca2bae08e070), EConversationDebugInfo::Executing);
                Quest::ValleyOfMines_VoMCHAPTER4_FINDORCSHAMAN_FINDORCSHAMAN_OBJ_FIND.SucceedQuest();
                DC(int64(0xe20dca2bae08e070), EConversationDebugInfo::Done);
                DC(int64(0x3e0d5ae5ed9a0ef6), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Xardas))) { Xardas.ExchangeDailyRoutineToClass(UDailyRoutine_XT_DMB_Xardas_404_Study); }
                DC(int64(0x3e0d5ae5ed9a0ef6), EConversationDebugInfo::Done);
                Subdialog(
                    UUrShak_99787,
                    UUrShak_99807
                );
                DC(int64(0x962243a4707fa2be), EConversationDebugInfo::Executing);
                // Why did you seek me out?
                UrShak.AI.Say(LocText("TEXT_WIP_LEVDOTI_20240701_112600"));
                DC(int64(0x962243a4707fa2be), EConversationDebugInfo::Done);
            }
        }
        
        
        class UUrShak_99787 : UTopic_Hero__UL_OSL_URSHAK_2200
        {
            default DebugId = int64(0x962243a4707fa29e);
            default Caption = LocText("TEXT_WIP_LEVDOTI_20240701_105956_41");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UUrShak_99787);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x962243a4707fa29f), EConversationDebugInfo::Executing);
                
                // You're right, I was looking for you. A mage named Xardas ...
                Hero.AI.Say(LocText("TEXT_WIP_LEVDOTI_20240701_105956_41"));
                DC(int64(0x962243a4707fa29f), EConversationDebugInfo::Done);
                DC(int64(0x58dd47ffed4f799f), EConversationDebugInfo::Executing);
                
                // Xardas ... the demon summoner. I don't like him, but YOU ...
                UrShak.AI.Say(LocText("TEXT_WIP_RDMVSBC_20240910_145829"));
                DC(int64(0x58dd47ffed4f799f), EConversationDebugInfo::Done);
            }
        }
        
        
        class UUrShak_99807 : UTopic_Hero__UL_OSL_URSHAK_2200
        {
            default DebugId = int64(0x962243a4707fa2a2);
            default Caption = LocText("TEXT_WIP_LEVDOTI_20240701_105956_2238");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UUrShak_99807);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x962243a4707fa2aa), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Skilled));
                }
                
                return Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Skilled);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x962243a4707fa2a3), EConversationDebugInfo::Executing);
                
                // Greetings, Shaman Ur-Shak. You're right, I've been ...
                Hero.AI.Say(LocText("TEXT_WIP_LEVDOTI_20240701_105956_2238"));
                DC(int64(0x962243a4707fa2a3), EConversationDebugInfo::Done);
                DC(int64(0x962243a4707fa2bb), EConversationDebugInfo::Executing);
                
                // You speak our tongue.
                UrShak.AI.Say(LocText("TEXT_WIP_LEVDOTI_20240701_112437"));
                DC(int64(0x962243a4707fa2bb), EConversationDebugInfo::Done);
                DC(int64(0x962243a4707fa2bc), EConversationDebugInfo::Executing);
                
                // A little. A mage named Xardas sent me. He thinks you ...
                Hero.AI.Say(LocText("TEXT_WIP_LEVDOTI_20240701_112457"));
                DC(int64(0x962243a4707fa2bc), EConversationDebugInfo::Done);
                DC(int64(0x58dd47ffed4f79a0), EConversationDebugInfo::Executing);
                
                // Xardas ... the demon summoner. I don't like him, but YOU ...
                UrShak.AI.Say(LocText("TEXT_WIP_RDMVSBC_20240910_145829"));
                DC(int64(0x58dd47ffed4f79a0), EConversationDebugInfo::Done);
                DC(int64(0x58dd47ffed4f79a1), EConversationDebugInfo::Executing);
                // But let us continue in the common tongue. Easier for ...
                UrShak.AI.Say(LocText("TEXT_WIP_RDMVSBC_20240910_145928"));
                DC(int64(0x58dd47ffed4f79a1), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceOrcshamanTongue : UTopic_Hero__UL_OSL_URSHAK_2200
        {
            default DebugId = int64(0x2a33aa8f22a4cc9f);
            default Caption = LocText("TEXT_CHOICE_ORCSHAMAN_TONGUE");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceOrcshamanThx);
            default Rules.HideIfKnows(UChoiceOrcshamanTongue);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc0b44b76c24ecc08), EConversationDebugInfo::Executing);
                
                // How come you speak our language?
                Hero.AI.Say(LocText("INFO_ORCSHAMAN_TONGUE_15_01"));
                DC(int64(0xc0b44b76c24ecc08), EConversationDebugInfo::Done);
                DC(int64(0xc0b44b76c24ecc09), EConversationDebugInfo::Executing);
                
                // I know it because I studied it. 
                UrShak.AI.Say(LocText("INFO_ORCSHAMAN_TONGUE_17_02"));
                DC(int64(0xc0b44b76c24ecc09), EConversationDebugInfo::Done);
                DC(int64(0xc0b44b76c24ecc0a), EConversationDebugInfo::Executing);
                // Orcs hate morra and morra hate orcs ... that is how it ...
                UrShak.AI.Say(LocText("INFO_ORCSHAMAN_TONGUE_17_03"));
                DC(int64(0xc0b44b76c24ecc0a), EConversationDebugInfo::Done);
                DC(int64(0x962243a4707fa327), EConversationDebugInfo::Executing);
                // I want to see a day when it is different. And to do ...
                UrShak.AI.Say(LocText("TEXT_WIP_LEVDOTI_20240701_121209"));
                DC(int64(0x962243a4707fa327), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceOrcshamanUlumulu : UTopic_Hero__UL_OSL_URSHAK_2200
        {
            default DebugId = int64(0x2a33aa8f22a4cce2);
            default Caption = LocText("INFO_ORCSHAMAN_ULUMULU_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceOrcshamanOtherway);
            default Rules.HideIfKnows(UChoiceOrcshamanUlumulu);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x2a33aa8f22a4cce3), Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU.HasBeenStarted());
                }
                
                return Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU.HasBeenStarted();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc0b44b76c24ecc3b), EConversationDebugInfo::Executing);
                
                // Sounds like just the thing I need. Where do I get an ...
                Hero.AI.Say(LocText("INFO_ORCSHAMAN_ULUMULU_15_01"));
                DC(int64(0xc0b44b76c24ecc3b), EConversationDebugInfo::Done);
                DC(int64(0xc0b44b76c24ecc3c), EConversationDebugInfo::Executing);
                
                // It is not "gotten." It is MADE, by a "shar-ulû", a maker ...
                UrShak.AI.Say(LocText("INFO_ORCSHAMAN_ULUMULU_17_02"));
                DC(int64(0xc0b44b76c24ecc3c), EConversationDebugInfo::Done);
                DC(int64(0xc0b44b76c24ecc3d), EConversationDebugInfo::Executing);
                // Tarrok is his name, and he will help you if you invoke ...
                UrShak.AI.Say(LocText("INFO_ORCSHAMAN_ULUMULU_17_03"));
                DC(int64(0xc0b44b76c24ecc3d), EConversationDebugInfo::Done);
                DC(int64(0xc87c3218623cefeb), EConversationDebugInfo::Executing);
                
                // Where can I find him?
                Hero.AI.Say(LocText("TEXT_WIP_NSZXZLE_20240821_155545"));
                DC(int64(0xc87c3218623cefeb), EConversationDebugInfo::Done);
                DC(int64(0x12a5c413b879ea6e), EConversationDebugInfo::Executing);
                
                // The mine ... the one you call "free." The morra made him ...
                UrShak.AI.Say(LocText("TEXT_WIP_DEVDOTI_20240709_142258"));
                DC(int64(0x12a5c413b879ea6e), EConversationDebugInfo::Done);
                DC(int64(0x12a5c413b879ea6f), EConversationDebugInfo::Executing);
                // You will need the horn of a great shadowbeast, the tusk ...
                UrShak.AI.Say(LocText("TEXT_WIP_DEVDOTI_20240709_142305"));
                DC(int64(0x12a5c413b879ea6f), EConversationDebugInfo::Done);
                DC(int64(0x12a5c413b879ea70), EConversationDebugInfo::Executing);
                // Bring these to Tarrok, and he will make you an Ulu-Mulu. ...
                UrShak.AI.Say(LocText("TEXT_WIP_DEVDOTI_20240709_142322"));
                DC(int64(0x12a5c413b879ea70), EConversationDebugInfo::Done);
                DC(int64(0x7d7ac538046c05df), EConversationDebugInfo::Executing);
                // I'll mark the location on your map.
                UrShak.AI.Say(LocText("TEXT_WIP_BFISXFB_20250403_150808"));
                DC(int64(0x7d7ac538046c05df), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH4_FINDORCSHAMAN, Document::UDocumentSegment_CH4_FINDORCSHAMAN_UrshakFound);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH4_ULUMULU, Document::UDocumentSegment_CH4_ULUMULU_Start);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH4_ULUMULU, Document::UDocumentSegment_CH4_ULUMULU_Lizard);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH4_ULUMULU, Document::UDocumentSegment_CH4_ULUMULU_Shadowbeast);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH4_ULUMULU, Document::UDocumentSegment_CH4_ULUMULU_Swampshark);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH4_ULUMULU, Document::UDocumentSegment_CH4_ULUMULU_Troll);
                DC(int64(0x2a33aa8f22a4cce9), EConversationDebugInfo::Executing);
                Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU.StartQuest();
                DC(int64(0x2a33aa8f22a4cce9), EConversationDebugInfo::Done);
                DC(int64(0x2a33aa8f22a4cceb), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Riordian))) { Riordian.ExchangeDailyRoutineToClass(UDailyRoutine_NC_KDW_Riordian_605_Foundurshak); }
                DC(int64(0x2a33aa8f22a4cceb), EConversationDebugInfo::Done);
                DC(int64(0x2a33aa8f22a4ccec), EConversationDebugInfo::Executing);
                G1R.UrShak_SpokeOfUluMulu = 1;
                DC(int64(0x2a33aa8f22a4ccec), EConversationDebugInfo::Done);
                DC(int64(0x1181499eaf2287ff), EConversationDebugInfo::Executing);
                Hero.LearnSkill(UGE_Skill_Hunting_UluMulu_Trained);
                DC(int64(0x1181499eaf2287ff), EConversationDebugInfo::Done);
                DC(int64(0xf9317a6ed9c2db0a), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Riordian))) { Riordian.ExchangeDailyRoutineToClass(UDailyRoutine_NC_KDW_Riordian_605_Foundurshak); }
                DC(int64(0xf9317a6ed9c2db0a), EConversationDebugInfo::Done);
                DC(int64(0x36d532d724ac18b3), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Peasant19))) { Peasant19.ExchangeDailyRoutineToClass(UDailyRoutine_NC_BAU_Peasant19_929_FMRaid); }
                DC(int64(0x36d532d724ac18b3), EConversationDebugInfo::Done);
                DC(int64(0x36d532d724ac18b5), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Malon))) { Malon.ExchangeDailyRoutineToClass(UDailyRoutine_NC_BAU_Malon_930_FMRaid); }
                DC(int64(0x36d532d724ac18b5), EConversationDebugInfo::Done);
                DC(int64(0xe20dca2bae08e085), EConversationDebugInfo::Executing);
                Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU_ULUMULU_OBJ_LIZARD.StartQuest();
                DC(int64(0xe20dca2bae08e085), EConversationDebugInfo::Done);
                DC(int64(0xe20dca2bae08e087), EConversationDebugInfo::Executing);
                Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU_ULUMULU_OBJ_SHADOWBEAST.StartQuest();
                DC(int64(0xe20dca2bae08e087), EConversationDebugInfo::Done);
                DC(int64(0xe20dca2bae08e089), EConversationDebugInfo::Executing);
                Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU_ULUMULU_OBJ_TROLL.StartQuest();
                DC(int64(0xe20dca2bae08e089), EConversationDebugInfo::Done);
                DC(int64(0xe20dca2bae08e08b), EConversationDebugInfo::Executing);
                Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU_ULUMULU_OBJ_SWAMPSHARK.StartQuest();
                DC(int64(0xe20dca2bae08e08b), EConversationDebugInfo::Done);
                DC(int64(0xa84ccdf55e8199da), EConversationDebugInfo::Executing);
                UWorldPointManager::Get().CallGlobalEvent(n"SpawnMonstersAfterFM");
                DC(int64(0xa84ccdf55e8199da), EConversationDebugInfo::Done);
                DC(int64(0xb0e963ca04e98b04), EConversationDebugInfo::Executing);
                Hero.AddItemToInventory(UItWr_Map_WorldComplete, 1);
                DC(int64(0xb0e963ca04e98b04), EConversationDebugInfo::Done);
                DC(int64(0x24cdcdda2260fc43), EConversationDebugInfo::Executing);
                G1R.ActivateStoryDataLayer("PrimeMonsters_DecorationForItems");
                DC(int64(0x24cdcdda2260fc43), EConversationDebugInfo::Done);
                Subdialog(
                    UChoiceOrcshamanUlumuluFm,
                    UChoiceOrcshamanUlumuluVm,
                    UChoiceOrcshamanUlumuluAm
                );
            }
        }
        
        
        class UChoiceOrcshamanUlumuluFm : UTopic_Hero__UL_OSL_URSHAK_2200
        {
            default DebugId = int64(0xe8603e87342bfd19);
            default Caption = LocText("INFO_ORCSHAMAN_ULUMULU_15_12");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc0b44b76c24ecc41), EConversationDebugInfo::Executing);
                // And your kin won't harm me as long as I carry this ...
                Hero.AI.Say(LocText("INFO_ORCSHAMAN_ULUMULU_15_12"));
                DC(int64(0xc0b44b76c24ecc41), EConversationDebugInfo::Done);
                DC(int64(0x12a5c413b879ea79), EConversationDebugInfo::Executing);
                
                // You won't need to carry it. It will be enough if you ...
                UrShak.AI.Say(LocText("TEXT_WIP_DEVDOTI_20240709_142524"));
                DC(int64(0x12a5c413b879ea79), EConversationDebugInfo::Done);
                DC(int64(0x12a5c413b879ea7a), EConversationDebugInfo::Executing);
                // I will be there.
                UrShak.AI.Say(LocText("TEXT_WIP_DEVDOTI_20240709_142533"));
                DC(int64(0x12a5c413b879ea7a), EConversationDebugInfo::Done);
                DC(int64(0x2e9b24c80487674a), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x2e9b24c80487674a), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceOrcshamanUlumuluVm : UTopic_Hero__UL_OSL_URSHAK_2200
        {
            default DebugId = int64(0xe8603e87342bfd1e);
            default Caption = LocText("INFO_ORCSHAMAN_ULUMULU_15_08");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc0b44b76c24ecc44), EConversationDebugInfo::Executing);
                // Will the Ulu-Mulu be enough for them to let me into the ...
                Hero.AI.Say(LocText("INFO_ORCSHAMAN_ULUMULU_15_08"));
                DC(int64(0xc0b44b76c24ecc44), EConversationDebugInfo::Done);
                DC(int64(0x2e9b24c804876747), EConversationDebugInfo::Executing);
                
                // I doubt it. The temple is sacred ground, even for my ...
                UrShak.AI.Say(LocText("TEXT_WIP_WQNYMZK_20240426_022348"));
                DC(int64(0x2e9b24c804876747), EConversationDebugInfo::Done);
                DC(int64(0x12a5c413b879ea7b), EConversationDebugInfo::Executing);
                // But "nakh to ôshar kraz yush." Slowly moves the skilled ...
                UrShak.AI.Say(LocText("TEXT_WIP_DEVDOTI_20240709_142550"));
                DC(int64(0x12a5c413b879ea7b), EConversationDebugInfo::Done);
                DC(int64(0x12a5c413b879ea7c), EConversationDebugInfo::Executing);
                // First, you and Tarrok make the Ulu-Mulu and I get you ...
                UrShak.AI.Say(LocText("TEXT_WIP_DEVDOTI_20240709_142556"));
                DC(int64(0x12a5c413b879ea7c), EConversationDebugInfo::Done);
                DC(int64(0x12a5c413b879ea7d), EConversationDebugInfo::Executing);
                // Then the next steps will be decided.
                UrShak.AI.Say(LocText("TEXT_WIP_DEVDOTI_20240709_142604"));
                DC(int64(0x12a5c413b879ea7d), EConversationDebugInfo::Done);
                DC(int64(0xc0b44b76c24ecc46), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xc0b44b76c24ecc46), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceOrcshamanUlumuluAm : UTopic_Hero__UL_OSL_URSHAK_2200
        {
            default DebugId = int64(0xe8603e87342bfd23);
            default Caption = LocText("INFO_ORCSHAMAN_ULUMULU_15_10");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc0b44b76c24ecc47), EConversationDebugInfo::Executing);
                // All right. How will Tarrok know you sent me?
                Hero.AI.Say(LocText("INFO_ORCSHAMAN_ULUMULU_15_10"));
                DC(int64(0xc0b44b76c24ecc47), EConversationDebugInfo::Done);
                DC(int64(0xc0b44b76c24ecc48), EConversationDebugInfo::Executing);
                
                // Tell him: "Kurg kuzûk yor mukh." It is something Tarrok ...
                UrShak.AI.Say(LocText("INFO_ORCSHAMAN_ULUMULU_17_11"));
                DC(int64(0xc0b44b76c24ecc48), EConversationDebugInfo::Done);
                DC(int64(0x12a5c413b879ea7e), EConversationDebugInfo::Executing);
                // Here. This will protect you in the battles to come.
                UrShak.AI.Say(LocText("TEXT_WIP_DEVDOTI_20240709_142650"));
                DC(int64(0x12a5c413b879ea7e), EConversationDebugInfo::Done);
                DC(int64(0x12a5c413b879ea80), EConversationDebugInfo::Executing);
                
                // Thank you.
                Hero.AI.Say(LocText("TEXT_WIP_DEVDOTI_20240709_142711"));
                DC(int64(0x12a5c413b879ea80), EConversationDebugInfo::Done);
                DC(int64(0x12a5c413b879ea7f), EConversationDebugInfo::Executing);
                
                // (grunts) Now go and be fast. I will wait, but Krushak ...
                UrShak.AI.Say(LocText("TEXT_WIP_DEVDOTI_20240709_142700"));
                DC(int64(0x12a5c413b879ea7f), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_UL_OLS_URSHAK, Document::UDocumentSegment_Glossary_UL_OLS_URSHAK_FindUlumulu);
                DC(int64(0x2a33aa8f22a4cd00), EConversationDebugInfo::Executing);
                Hero.AddItemToInventory(UItAt_Amulet_Orc, 1);
                DC(int64(0x2a33aa8f22a4cd00), EConversationDebugInfo::Done);
                DC(int64(0x2a33aa8f22a4cd01), EConversationDebugInfo::Executing);
                G1R.Urshak_name_0 = G1R.UrShak;
                DC(int64(0x2a33aa8f22a4cd01), EConversationDebugInfo::Done);
                DC(int64(0x2a33aa8f22a4cd02), EConversationDebugInfo::Executing);
                G1R.FriendOfUrShak = 1;
                DC(int64(0x2a33aa8f22a4cd02), EConversationDebugInfo::Done);
                DC(int64(0xc0b44b76c24ecc4f), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xc0b44b76c24ecc4f), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceOrcshamanWhy : UTopic_Hero__UL_OSL_URSHAK_2200
        {
            default DebugId = int64(0x2a33aa8f22a4cca6);
            default Caption = LocText("INFO_ORCSHAMAN_WHY_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceOrcshamanThx);
            default Rules.HideIfKnows(UChoiceOrcshamanWhy);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc0b44b76c24ecc0d), EConversationDebugInfo::Executing);
                // I want to kill the Sleeper before he awakens. And Xardas ...
                Hero.AI.Say(LocText("INFO_ORCSHAMAN_WHY_15_01"));
                DC(int64(0xc0b44b76c24ecc0d), EConversationDebugInfo::Done);
                DC(int64(0x962243a4707fa2cf), EConversationDebugInfo::Executing);
                
                // (snorts) And you say this to an orc? Ha. You are "chu ...
                UrShak.AI.Say(LocText("TEXT_WIP_LEVDOTI_20240701_114350"));
                DC(int64(0x962243a4707fa2cf), EConversationDebugInfo::Done);
                DC(int64(0x962243a4707fa2d0), EConversationDebugInfo::Executing);
                // But yes, the demon summoner speaks the truth. Krushak ...
                UrShak.AI.Say(LocText("TEXT_WIP_LEVDOTI_20240701_114520"));
                DC(int64(0x962243a4707fa2d0), EConversationDebugInfo::Done);
                DB(int64(0x118ac50a41c1e55e), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Master));
                DB(int64(0x962243a4707fa2f5), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Skilled));
                
                if ((Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Master)) || (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Skilled)))
                {
                    DC(int64(0x2e9b24c804876618), EConversationDebugInfo::Executing);
                    // "Chu khal" ... Bold?
                    Hero.AI.Say(LocText("TEXT_WIP_ZQNYMZK_20240425_231002_2238"));
                    DC(int64(0x2e9b24c804876618), EConversationDebugInfo::Done);
                    DC(int64(0x962243a4707fa2d5), EConversationDebugInfo::Executing);
                    
                    // Bold and clear. Speaking words that are like a strong ...
                    UrShak.AI.Say(LocText("TEXT_WIP_LEVDOTI_20240701_115246"));
                    DC(int64(0x962243a4707fa2d5), EConversationDebugInfo::Done);
                    DC(int64(0x2e9b24c80487669b), EConversationDebugInfo::Executing);
                    // I admit, your Orcish impresses me. The demon summoner ...
                    UrShak.AI.Say(LocText("TEXT_WIP_ZQNYMZK_20240425_234903"));
                    DC(int64(0x2e9b24c80487669b), EConversationDebugInfo::Done);
                    DC(int64(0x962243a4707fa2d6), EConversationDebugInfo::Executing);
                    
                    // He did. 
                    Hero.AI.Say(LocText("TEXT_WIP_LEVDOTI_20240701_115421"));
                    DC(int64(0x962243a4707fa2d6), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_orcshaman_why_exit_1");
                }
                else
                {
                    DC(int64(0x962243a4707fa2d8), EConversationDebugInfo::Executing);
                    // I'm "Chu khal"?
                    Hero.AI.Say(LocText("TEXT_WIP_LEVDOTI_20240701_115431_2785"));
                    DC(int64(0x962243a4707fa2d8), EConversationDebugInfo::Done);
                    DC(int64(0x962243a4707fa2e3), EConversationDebugInfo::Executing);
                    
                    // Bold and clear. Speaking words that are like a strong ...
                    UrShak.AI.Say(LocText("TEXT_WIP_LEVDOTI_20240701_115550"));
                    DC(int64(0x962243a4707fa2e3), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_orcshaman_why_exit_2");
                }
            }
        }
        
        
        class UChoiceUrshak100006 : UTopic_Hero__UL_OSL_URSHAK_2200
        {
            default DebugId = int64(0x9d5bf4c6fa761aa6);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::WalkToOther;
            
            default Rules.HideIfKnows(UChoiceUrshak100006);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x9d5bf4c6fa761aa9), Grazkrak != nullptr && Grazkrak.IsEveryoneOfThisKindDead());
                }
                
                return Grazkrak != nullptr && Grazkrak.IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9d5bf4c6fa761aa1), EConversationDebugInfo::Executing);
                // Well done. 
                UrShak.AI.Say(LocText("TEXT_WIP_JYRXZUK_20240703_113332_41"));
                DC(int64(0x9d5bf4c6fa761aa1), EConversationDebugInfo::Done);
                DC(int64(0x9ca7fe2b2bebff7f), EConversationDebugInfo::Executing);
                
                // You didn't say there'd be another fight.
                Hero.AI.Say(LocText("TEXT_WIP_DHKWYUI_20240710_094712"));
                DC(int64(0x9ca7fe2b2bebff7f), EConversationDebugInfo::Done);
                DC(int64(0x9ca7fe2b2bebff80), EConversationDebugInfo::Executing);
                
                // I did not say because I did not know. This was the ...
                UrShak.AI.Say(LocText("TEXT_WIP_DHKWYUI_20240710_094717"));
                DC(int64(0x9ca7fe2b2bebff80), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH5_ACCESSSLEEPERTEMPLE, Document::UDocumentSegment_CH5_ACCESSSLEEPERTEMPLE_Explore);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_UL_OLS_URSHAK, Document::UDocumentSegment_Glossary_UL_OLS_URSHAK_Helper);
                DB(int64(0x9ca7fe2b2bebff86), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Master));
                DB(int64(0x9ca7fe2b2bebff8b), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Skilled));
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Master))
                {
                    DC(int64(0x9ca7fe2b2bebff90), EConversationDebugInfo::Executing);
                    // Yes, I heard what they said. He wanted proof I didn't ...
                    Hero.AI.Say(LocText("TEXT_WIP_DHKWYUI_20240710_094917"));
                    DC(int64(0x9ca7fe2b2bebff90), EConversationDebugInfo::Done);
                    DC(int64(0x9ca7fe2b2bebff91), EConversationDebugInfo::Executing);
                    
                    // That, he did. Already, your skill of our tongue has ...
                    UrShak.AI.Say(LocText("TEXT_WIP_DHKWYUI_20240710_094917_2238"));
                    DC(int64(0x9ca7fe2b2bebff91), EConversationDebugInfo::Done);
                }
                else if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Skilled))
                {
                    DC(int64(0x9ca7fe2b2bebffa0), EConversationDebugInfo::Executing);
                    
                    // Yeah, I heard them argue, but I didn't catch everything. ...
                    Hero.AI.Say(LocText("TEXT_WIP_DHKWYUI_20240710_094938"));
                    DC(int64(0x9ca7fe2b2bebffa0), EConversationDebugInfo::Done);
                    DC(int64(0x9ca7fe2b2bebffa1), EConversationDebugInfo::Executing);
                    
                    // Yes - To-Churnagg wanted proof of your strength. He said ...
                    UrShak.AI.Say(LocText("TEXT_WIP_DHKWYUI_20240710_094938_2785"));
                    DC(int64(0x9ca7fe2b2bebffa1), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x9ca7fe2b2bebffa9), EConversationDebugInfo::Executing);
                    // He wanted proof of your strength, that you didn't simply ...
                    UrShak.AI.Say(LocText("TEXT_WIP_DHKWYUI_20240710_094944_3436"));
                    DC(int64(0x9ca7fe2b2bebffa9), EConversationDebugInfo::Done);
                    DC(int64(0x9ca7fe2b2bebffbc), EConversationDebugInfo::Executing);
                    // I doubt he is convinced, even now. 
                    UrShak.AI.Say(LocText("TEXT_WIP_DHKWYUI_20240710_095429"));
                    DC(int64(0x9ca7fe2b2bebffbc), EConversationDebugInfo::Done);
                }
                DC(int64(0x9ca7fe2b2bebff96), EConversationDebugInfo::Executing);
                // Will that warchief be a problem?
                Hero.AI.Say(LocText("TEXT_WIP_DHKWYUI_20240710_094925"));
                DC(int64(0x9ca7fe2b2bebff96), EConversationDebugInfo::Done);
                DC(int64(0x9ca7fe2b2bebff97), EConversationDebugInfo::Executing);
                
                // It remains to be seen. I suggest you explore the ordôkh ...
                UrShak.AI.Say(LocText("TEXT_WIP_DHKWYUI_20240710_094925_1924"));
                DC(int64(0x9ca7fe2b2bebff97), EConversationDebugInfo::Done);
                DC(int64(0x9ca7fe2b2bebffbd), EConversationDebugInfo::Executing);
                // The temple is straight ahead, but, as I said, the temple ...
                UrShak.AI.Say(LocText("TEXT_WIP_DHKWYUI_20240710_095628"));
                DC(int64(0x9ca7fe2b2bebffbd), EConversationDebugInfo::Done);
                DC(int64(0x3c813583eddf5e3d), EConversationDebugInfo::Executing);
                
                // What do you suggest I do?
                Hero.AI.Say(LocText("TEXT_WIP_CHKWYUI_20240711_121051"));
                DC(int64(0x3c813583eddf5e3d), EConversationDebugInfo::Done);
                DC(int64(0x9ca7fe2b2bebffbf), EConversationDebugInfo::Executing);
                
                // Look around ... explore. Use your mind. I will stay ...
                UrShak.AI.Say(LocText("TEXT_WIP_DHKWYUI_20240710_095642"));
                DC(int64(0x9ca7fe2b2bebffbf), EConversationDebugInfo::Done);
                DC(int64(0x118ac50a41c1e572), EConversationDebugInfo::Executing);
                UrShak.ExchangeDailyRoutineToClass(UDailyRoutine_UL_OSL_UrShak_2200_AfterFight);
                DC(int64(0x118ac50a41c1e572), EConversationDebugInfo::Done);
                DC(int64(0x3c813583eddf5e2c), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x3c813583eddf5e2c), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceUrshak100352 : UTopic_Hero__UL_OSL_URSHAK_2200
        {
            default DebugId = int64(0x9d5bf4c6fa761ab6);
            default Caption = LocText("TEXT_WIP_JYRXZUK_20240703_114717");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceUrshak100352);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_DHKWYUI_20240710_195522"), int64(0x9d5bf4c6fa761ab6));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x9d5bf4c6fa761b06), Quest::ORCENCLAVE_MUKINCURSION != nullptr && Quest::ORCENCLAVE_MUKINCURSION.IsRunning());
                }
                
                return Quest::ORCENCLAVE_MUKINCURSION != nullptr && Quest::ORCENCLAVE_MUKINCURSION.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9d5bf4c6fa761ab0), EConversationDebugInfo::Executing);
                // There's this orc who follows me everywhere. Can you help ...
                Hero.AI.Say(LocText("TEXT_WIP_JYRXZUK_20240703_114717"));
                DC(int64(0x9d5bf4c6fa761ab0), EConversationDebugInfo::Done);
                DC(int64(0x9d5bf4c6fa761ab1), EConversationDebugInfo::Executing);
                
                // Umakhal, yes. To-Churnagg must have put him up to this.
                UrShak.AI.Say(LocText("TEXT_WIP_JYRXZUK_20240703_114717_2238"));
                DC(int64(0x9d5bf4c6fa761ab1), EConversationDebugInfo::Done);
                DC(int64(0xdc8880586be910a5), EConversationDebugInfo::Executing);
                // But no, I can't help ... I am a shaman, but they ...
                UrShak.AI.Say(LocText("TEXT_WIP_RDZOJWI_20240723_081015"));
                DC(int64(0xdc8880586be910a5), EConversationDebugInfo::Done);
                DC(int64(0x9d5bf4c6fa761ac2), EConversationDebugInfo::Executing);
                // That said, Umakhal is only a warrior, so some caves in ...
                UrShak.AI.Say(LocText("TEXT_WIP_JYRXZUK_20240703_120542"));
                DC(int64(0x9d5bf4c6fa761ac2), EConversationDebugInfo::Done);
                DC(int64(0xdc8880586be910e0), EConversationDebugInfo::Executing);
                
                // Hmm ...
                Hero.AI.Say(LocText("TEXT_WIP_RDZOJWI_20240723_082028"));
                DC(int64(0xdc8880586be910e0), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH5_ACCESSSLEEPERTEMPLE, Document::UDocumentSegment_CH5_ACCESSSLEEPERTEMPLE_UmakhalTip);
            }
        }
        
        
        class UChoiceUrshak100917 : UTopic_Hero__UL_OSL_URSHAK_2200
        {
            default DebugId = int64(0x9d5bf4c6fa761b0d);
            default Caption = LocText("TEXT_WIP_JYRXZUK_20240703_122757");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceUrshak100917);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xef0d4b2c8353b7ac), Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE != nullptr && Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE.IsRunning());
                    DB(int64(0x229e9e10b3ddfba3), UrShak != nullptr && UrShak.HasAssignedDailyRoutine(UDailyRoutine_UL_OSL_UrShak_2200_AfterFight));
                }
                
                if (Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE != nullptr && !Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE.IsRunning())
                    return false;
                
                if (UrShak != nullptr && !UrShak.HasAssignedDailyRoutine(UDailyRoutine_UL_OSL_UrShak_2200_AfterFight))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9d5bf4c6fa761b07), EConversationDebugInfo::Executing);
                // How do I get past the temple guards?
                Hero.AI.Say(LocText("TEXT_WIP_JYRXZUK_20240703_122757"));
                DC(int64(0x9d5bf4c6fa761b07), EConversationDebugInfo::Done);
                DC(int64(0x9d5bf4c6fa761b08), EConversationDebugInfo::Executing);
                
                // I told you - this is our hurdle. But ... hmm. Yes.
                UrShak.AI.Say(LocText("TEXT_WIP_JYRXZUK_20240703_122757_2995"));
                DC(int64(0x9d5bf4c6fa761b08), EConversationDebugInfo::Done);
                DC(int64(0xdc8880586be910fe), EConversationDebugInfo::Executing);
                
                // What?
                Hero.AI.Say(LocText("TEXT_WIP_RDZOJWI_20240723_082546"));
                DC(int64(0xdc8880586be910fe), EConversationDebugInfo::Done);
                DC(int64(0xefbd15f58135183e), EConversationDebugInfo::Executing);
                
                // Perhaps you could try and speak to Ur-Nazkrog. She is ...
                UrShak.AI.Say(LocText("TEXT_WIP_OAYMWIF_20240704_160810"));
                DC(int64(0xefbd15f58135183e), EConversationDebugInfo::Done);
                DC(int64(0xdc8880586be910ff), EConversationDebugInfo::Executing);
                
                // Why would a SHAMAN let me into the temple?
                Hero.AI.Say(LocText("TEXT_WIP_RDZOJWI_20240723_082620"));
                DC(int64(0xdc8880586be910ff), EConversationDebugInfo::Done);
                DC(int64(0xdc8880586be91100), EConversationDebugInfo::Executing);
                
                // I am not saying she will. I am saying it is worth a try. 
                UrShak.AI.Say(LocText("TEXT_WIP_RDZOJWI_20240723_082710"));
                DC(int64(0xdc8880586be91100), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH5_ACCESSSLEEPERTEMPLE, Document::UDocumentSegment_CH5_ACCESSSLEEPERTEMPLE_Urnazkrog);
                DC(int64(0xca96020447c26ee3), EConversationDebugInfo::Executing);
                Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_OBJ_URNAZKROG.StartQuest();
                DC(int64(0xca96020447c26ee3), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceUrshak101497 : UTopic_Hero__UL_OSL_URSHAK_2200
        {
            default DebugId = int64(0x12a5c413b879ea15);
            default Caption = LocText("TEXT_WIP_DEVDOTI_20240709_141121_2083");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceOrcshamanWhy);
            default Rules.HideIfKnows(UChoiceUrshak101497);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x12a5c413b879ea0f), EConversationDebugInfo::Executing);
                // How is it that you want the Sleeper dead, when your kin ...
                Hero.AI.Say(LocText("TEXT_WIP_DEVDOTI_20240709_141121"));
                DC(int64(0x12a5c413b879ea0f), EConversationDebugInfo::Done);
                DC(int64(0x12a5c413b879ea10), EConversationDebugInfo::Executing);
                
                // (long sigh) Die. Crush. Kill! Is that what you want to ...
                UrShak.AI.Say(LocText("TEXT_WIP_DEVDOTI_20240709_141121_41"));
                DC(int64(0x12a5c413b879ea10), EConversationDebugInfo::Done);
                Subdialog(
                    UUrShak_104640,
                    UUrShak_104660,
                    UUrShak_104682
                );
                DC(int64(0xc87c3218623cf00d), EConversationDebugInfo::Executing);
                // I want morra and orcs to exist together, in peace.
                UrShak.AI.Say(LocText("TEXT_WIP_NSZXZLE_20240821_160632_2785"));
                DC(int64(0xc87c3218623cf00d), EConversationDebugInfo::Done);
                DC(int64(0xc87c3218623cf03e), EConversationDebugInfo::Executing);
                // But it is not even about that. Krushak must die because ...
                UrShak.AI.Say(LocText("TEXT_WIP_NSZXZLE_20240821_160840"));
                DC(int64(0xc87c3218623cf03e), EConversationDebugInfo::Done);
                DC(int64(0xc87c3218623cf03f), EConversationDebugInfo::Executing);
                // But, no, they were too proud to see it - thought they ...
                UrShak.AI.Say(LocText("TEXT_WIP_NSZXZLE_20240821_160900"));
                DC(int64(0xc87c3218623cf03f), EConversationDebugInfo::Done);
                DC(int64(0xc87c3218623cf040), EConversationDebugInfo::Executing);
                // It burns it all down.
                UrShak.AI.Say(LocText("TEXT_WIP_NSZXZLE_20240821_160952"));
                DC(int64(0xc87c3218623cf040), EConversationDebugInfo::Done);
                DC(int64(0xc87c3218623cf041), EConversationDebugInfo::Executing);
                
                // ... Like Xardas said.
                Hero.AI.Say(LocText("TEXT_WIP_NSZXZLE_20240821_161012"));
                DC(int64(0xc87c3218623cf041), EConversationDebugInfo::Done);
                DC(int64(0xc87c3218623cf042), EConversationDebugInfo::Executing);
                
                // Then he is wiser than most. 
                UrShak.AI.Say(LocText("TEXT_WIP_NSZXZLE_20240821_161026"));
                DC(int64(0xc87c3218623cf042), EConversationDebugInfo::Done);
            }
        }
        
        
        class UUrShak_104640 : UTopic_Hero__UL_OSL_URSHAK_2200
        {
            default DebugId = int64(0xc87c3218623ceff7);
            default Caption = LocText("TEXT_WIP_NSZXZLE_20240821_160451_41");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UUrShak_104640);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc87c3218623ceff8), EConversationDebugInfo::Executing);
                
                // Do you?
                Hero.AI.Say(LocText("TEXT_WIP_NSZXZLE_20240821_160451_41"));
                DC(int64(0xc87c3218623ceff8), EConversationDebugInfo::Done);
                DC(int64(0xc87c3218623cf009), EConversationDebugInfo::Executing);
                
                // Look at us, dodging each other's questions. No, I do not ...
                UrShak.AI.Say(LocText("TEXT_WIP_NSZXZLE_20240821_160532"));
                DC(int64(0xc87c3218623cf009), EConversationDebugInfo::Done);
            }
        }
        
        
        class UUrShak_104660 : UTopic_Hero__UL_OSL_URSHAK_2200
        {
            default DebugId = int64(0xc87c3218623ceffb);
            default Caption = LocText("TEXT_WIP_NSZXZLE_20240821_160451_2238");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UUrShak_104660);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc87c3218623ceffc), EConversationDebugInfo::Executing);
                
                // And if I did?
                Hero.AI.Say(LocText("TEXT_WIP_NSZXZLE_20240821_160451_2238"));
                DC(int64(0xc87c3218623ceffc), EConversationDebugInfo::Done);
                DC(int64(0xc87c3218623cf047), EConversationDebugInfo::Executing);
                
                // Then my intuition would have failed me - but it rarely ...
                UrShak.AI.Say(LocText("TEXT_WIP_NSZXZLE_20240821_161202"));
                DC(int64(0xc87c3218623cf047), EConversationDebugInfo::Done);
            }
        }
        
        
        class UUrShak_104682 : UTopic_Hero__UL_OSL_URSHAK_2200
        {
            default DebugId = int64(0xc87c3218623cf001);
            default Caption = LocText("TEXT_WIP_NSZXZLE_20240821_160504_1924");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UUrShak_104682);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc87c3218623cf002), EConversationDebugInfo::Executing);
                
                // No, I don't.
                Hero.AI.Say(LocText("TEXT_WIP_NSZXZLE_20240821_160504_1924"));
                DC(int64(0xc87c3218623cf002), EConversationDebugInfo::Done);
                DC(int64(0xc87c3218623cf048), EConversationDebugInfo::Executing);
                
                // Good. Neither do I want the morra to die.
                UrShak.AI.Say(LocText("TEXT_WIP_NSZXZLE_20240821_161235"));
                DC(int64(0xc87c3218623cf048), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceUrshak102094 : UTopic_Hero__UL_OSL_URSHAK_2200
        {
            default DebugId = int64(0x118ac50a41c1e56d);
            default Caption = LocText("TEXT_WIP_EYMFHKF_20240711_154615");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceUrshak102094);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x118ac50a41c1e57b), Quest::ORCENCLAVE_THECHAMPIONBURIAL != nullptr && Quest::ORCENCLAVE_THECHAMPIONBURIAL.IsRunning());
                }
                
                return Quest::ORCENCLAVE_THECHAMPIONBURIAL != nullptr && Quest::ORCENCLAVE_THECHAMPIONBURIAL.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x118ac50a41c1e569), EConversationDebugInfo::Executing);
                
                // I had a chat with Ur-Nazkrog.
                Hero.AI.Say(LocText("TEXT_WIP_EYMFHKF_20240711_154615"));
                DC(int64(0x118ac50a41c1e569), EConversationDebugInfo::Done);
                DC(int64(0xdc8880586be91103), EConversationDebugInfo::Executing);
                
                // What did she say?
                UrShak.AI.Say(LocText("TEXT_WIP_RDZOJWI_20240723_082806"));
                DC(int64(0xdc8880586be91103), EConversationDebugInfo::Done);
                DC(int64(0x118ac50a41c1e579), EConversationDebugInfo::Executing);
                
                // That she thinks she saw me in a dream and that, ...
                Hero.AI.Say(LocText("TEXT_WIP_EYMFHKF_20240711_154942"));
                DC(int64(0x118ac50a41c1e579), EConversationDebugInfo::Done);
                DC(int64(0xdc8880586be91104), EConversationDebugInfo::Executing);
                // She said if I manage to "shape life from death," it'll ...
                Hero.AI.Say(LocText("TEXT_WIP_RDZOJWI_20240723_082938"));
                DC(int64(0xdc8880586be91104), EConversationDebugInfo::Done);
                DC(int64(0xdc8880586be91105), EConversationDebugInfo::Executing);
                
                // Ha. Yes, that sounds like something she would say.
                UrShak.AI.Say(LocText("TEXT_WIP_RDZOJWI_20240723_083339"));
                DC(int64(0xdc8880586be91105), EConversationDebugInfo::Done);
                DC(int64(0x118ac50a41c1e56a), EConversationDebugInfo::Executing);
                // It seems she wants you to perform the burial rites on ...
                UrShak.AI.Say(LocText("TEXT_WIP_EYMFHKF_20240711_154615_2083"));
                DC(int64(0x118ac50a41c1e56a), EConversationDebugInfo::Done);
                DC(int64(0xdc8880586be91106), EConversationDebugInfo::Executing);
                // If an orc dies in an honorable duel, it's the duty of ...
                UrShak.AI.Say(LocText("TEXT_WIP_RDZOJWI_20240723_083532"));
                DC(int64(0xdc8880586be91106), EConversationDebugInfo::Done);
                DC(int64(0xdc8880586be91107), EConversationDebugInfo::Executing);
                
                // Simple words, please. 
                Hero.AI.Say(LocText("TEXT_WIP_RDZOJWI_20240723_083917"));
                DC(int64(0xdc8880586be91107), EConversationDebugInfo::Done);
                DC(int64(0xdc8880586be91108), EConversationDebugInfo::Executing);
                
                // I would tell you, but Ur-Nazkrog's eyes are watching, ...
                UrShak.AI.Say(LocText("TEXT_WIP_RDZOJWI_20240723_084035"));
                DC(int64(0xdc8880586be91108), EConversationDebugInfo::Done);
                DC(int64(0x118ac50a41c1e581), EConversationDebugInfo::Executing);
                // There are pillars of lore near the fighting grounds. Go ...
                UrShak.AI.Say(LocText("TEXT_WIP_EYMFHKF_20240711_155225"));
                DC(int64(0x118ac50a41c1e581), EConversationDebugInfo::Done);
                DC(int64(0xdc8880586be91109), EConversationDebugInfo::Executing);
                
                // All right. 
                Hero.AI.Say(LocText("TEXT_WIP_RDZOJWI_20240723_084624"));
                DC(int64(0xdc8880586be91109), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH5_THECHAMPIONBURIAL, Document::UDocumentSegment_CH5_THECHAMPIONBURIAL_BurialTip);
            }
        }
        
        
        class UChoiceUrshak102212 : UTopic_Hero__UL_OSL_URSHAK_2200
        {
            default DebugId = int64(0x3c813583eddf5e37);
            default Caption = LocText("TEXT_WIP_CHKWYUI_20240711_120947");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceUrshak100006);
            default Rules.HideIfKnows(UChoiceUrshak102212);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3c813583eddf5e31), EConversationDebugInfo::Executing);
                // I could just fight my way in ... 
                Hero.AI.Say(LocText("TEXT_WIP_CHKWYUI_20240711_120947"));
                DC(int64(0x3c813583eddf5e31), EConversationDebugInfo::Done);
                DC(int64(0x3c813583eddf5e32), EConversationDebugInfo::Executing);
                
                // If you do that, then you will have to fight everyone. 
                UrShak.AI.Say(LocText("TEXT_WIP_CHKWYUI_20240711_120947_41"));
                DC(int64(0x3c813583eddf5e32), EConversationDebugInfo::Done);
                DC(int64(0x3c813583eddf5e3f), EConversationDebugInfo::Executing);
                
                // Even you? 
                Hero.AI.Say(LocText("TEXT_WIP_CHKWYUI_20240711_121202"));
                DC(int64(0x3c813583eddf5e3f), EConversationDebugInfo::Done);
                DC(int64(0x3c813583eddf5e40), EConversationDebugInfo::Executing);
                
                // We should not even speak of these things! It makes me ...
                UrShak.AI.Say(LocText("TEXT_WIP_CHKWYUI_20240711_121205"));
                DC(int64(0x3c813583eddf5e40), EConversationDebugInfo::Done);
                DC(int64(0x3c813583eddf5e41), EConversationDebugInfo::Executing);
                // Krushak must be stopped, but there must be another way ...
                UrShak.AI.Say(LocText("TEXT_WIP_CHKWYUI_20240711_121211"));
                DC(int64(0x3c813583eddf5e41), EConversationDebugInfo::Done);
                DC(int64(0xdc8880586be91154), EConversationDebugInfo::Executing);
                // Search, and you WILL find it. 
                UrShak.AI.Say(LocText("TEXT_WIP_RDZOJWI_20240723_112658"));
                DC(int64(0xdc8880586be91154), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceUrshak102393 : UTopic_Hero__UL_OSL_URSHAK_2200
        {
            default DebugId = int64(0x118ac50a41c1e587);
            default Caption = LocText("TEXT_WIP_EYMFHKF_20240711_155649");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceUrshak102094);
            default Rules.HideIfKnows(UChoiceUrshak102393);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x118ac50a41c1e583), EConversationDebugInfo::Executing);
                
                // Where are the fighting grounds?
                Hero.AI.Say(LocText("TEXT_WIP_EYMFHKF_20240711_155649"));
                DC(int64(0x118ac50a41c1e583), EConversationDebugInfo::Done);
                DC(int64(0x118ac50a41c1e584), EConversationDebugInfo::Executing);
                
                // There's a tunnel in the ordôkh that will lead you there. 
                UrShak.AI.Say(LocText("TEXT_WIP_EYMFHKF_20240711_155649_1924"));
                DC(int64(0x118ac50a41c1e584), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH5_THECHAMPIONBURIAL, Document::UDocumentSegment_CH5_THECHAMPIONBURIAL_BurialLocation);
            }
        }
        
        
        class UChoiceUrshak104486 : UTopic_Hero__UL_OSL_URSHAK_2200
        {
            default DebugId = int64(0x9184f316751c8896);
            default Caption = LocText("TEXT_WIP_RDZOJWI_20240723_120721");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceUrshak104486);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xef0d4b2c8353b7b2), Quest::SleeperTemple_STCHAPTER5_URIZIEL != nullptr && Quest::SleeperTemple_STCHAPTER5_URIZIEL.HasSucceeded());
                }
                
                return Quest::SleeperTemple_STCHAPTER5_URIZIEL != nullptr && Quest::SleeperTemple_STCHAPTER5_URIZIEL.HasSucceeded();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9184f316751c8892), EConversationDebugInfo::Executing);
                // How did Cor Kalom and his men enter the enclave?
                Hero.AI.Say(LocText("TEXT_WIP_RDZOJWI_20240723_120721"));
                DC(int64(0x9184f316751c8892), EConversationDebugInfo::Done);
                DC(int64(0x9184f316751c8893), EConversationDebugInfo::Executing);
                
                // Because Kalom spoke in Krushak's tongue ... Ur-Nazkrog ...
                UrShak.AI.Say(LocText("TEXT_WIP_RDZOJWI_20240723_120721_2785"));
                DC(int64(0x9184f316751c8893), EConversationDebugInfo::Done);
                DC(int64(0xb1cbdc36aaec689e), EConversationDebugInfo::Executing);
                
                // What - just like that? No Ulu-Mulu? 
                Hero.AI.Say(LocText("TEXT_WIP_XDZOJWI_20240725_150310"));
                DC(int64(0xb1cbdc36aaec689e), EConversationDebugInfo::Done);
                DC(int64(0xb1cbdc36aaec689f), EConversationDebugInfo::Executing);
                
                // No. I told you, Krushak has claimed their minds. If I ...
                UrShak.AI.Say(LocText("TEXT_WIP_XDZOJWI_20240725_150314"));
                DC(int64(0xb1cbdc36aaec689f), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceUrshak104761 : UTopic_Hero__UL_OSL_URSHAK_2200
        {
            default DebugId = int64(0xdc8880586be910ed);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceUrshak104761);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x48495da8d6762919), UrNazkrog != nullptr && UrNazkrog.IsEveryoneOfThisKindDead());
                    DB(int64(0x48495da8d6762920), Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE != nullptr && Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE.IsRunning());
                    DB(int64(0x48495da8d6762911), ToChurnagg != nullptr && ToChurnagg.IsEveryoneOfThisKindDead());
                    DB(int64(0x48495da8d6762921), Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE != nullptr && Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE.IsRunning());
                }
                
                if (UrNazkrog != nullptr && UrNazkrog.IsEveryoneOfThisKindDead() && Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE != nullptr && Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE.IsRunning())
                    return true;
                
                if (ToChurnagg != nullptr && ToChurnagg.IsEveryoneOfThisKindDead() && Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE != nullptr && Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE.IsRunning())
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xdc8880586be910ea), EConversationDebugInfo::Executing);
                // No ... what did you do? What did you DO?!
                UrShak.AI.Say(LocText("TEXT_WIP_RDZOJWI_20240723_082246_2238"));
                DC(int64(0xdc8880586be910ea), EConversationDebugInfo::Done);
                Subdialog(
                    UUrShak_107855,
                    UUrShak_107875,
                    UUrShak_108186
                );
                DC(int64(0xdc8880586be91128), EConversationDebugInfo::Executing);
                // (long exhale) Well. It is over now. Go into the temple, ...
                UrShak.AI.Say(LocText("TEXT_WIP_RDZOJWI_20240723_111526_686"));
                DC(int64(0xdc8880586be91128), EConversationDebugInfo::Done);
                DC(int64(0xdc8880586be9112f), EConversationDebugInfo::Executing);
                // Unless you never planned to stop Krushak to begin with?
                UrShak.AI.Say(LocText("TEXT_WIP_RDZOJWI_20240723_111737"));
                DC(int64(0xdc8880586be9112f), EConversationDebugInfo::Done);
                DC(int64(0xdc8880586be91130), EConversationDebugInfo::Executing);
                
                // I'll take care of it. 
                Hero.AI.Say(LocText("TEXT_WIP_RDZOJWI_20240723_111914"));
                DC(int64(0xdc8880586be91130), EConversationDebugInfo::Done);
                DC(int64(0xdc8880586be91131), EConversationDebugInfo::Executing);
                
                // Then I pray you succeed ... and that I will never have ...
                UrShak.AI.Say(LocText("TEXT_WIP_RDZOJWI_20240723_111941"));
                DC(int64(0xdc8880586be91131), EConversationDebugInfo::Done);
                DC(int64(0xdc8880586be91132), EConversationDebugInfo::Executing);
                // Good luck, morra. The world rests on your shoulders now. 
                UrShak.AI.Say(LocText("TEXT_WIP_RDZOJWI_20240723_112024"));
                DC(int64(0xdc8880586be91132), EConversationDebugInfo::Done);
            }
        }
        
        
        class UUrShak_107855 : UTopic_Hero__UL_OSL_URSHAK_2200
        {
            default DebugId = int64(0xdc8880586be9110d);
            default Caption = LocText("TEXT_WIP_RDZOJWI_20240723_110410_1924");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UUrShak_107855);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xdc8880586be9110e), EConversationDebugInfo::Executing);
                
                // I had no choice.
                Hero.AI.Say(LocText("TEXT_WIP_RDZOJWI_20240723_110410_1924"));
                DC(int64(0xdc8880586be9110e), EConversationDebugInfo::Done);
                DC(int64(0xdc8880586be91117), EConversationDebugInfo::Executing);
                
                // There is ALWAYS a choice. 
                UrShak.AI.Say(LocText("TEXT_WIP_RDZOJWI_20240723_110416"));
                DC(int64(0xdc8880586be91117), EConversationDebugInfo::Done);
            }
        }
        
        
        class UUrShak_107875 : UTopic_Hero__UL_OSL_URSHAK_2200
        {
            default DebugId = int64(0xdc8880586be91111);
            default Caption = LocText("TEXT_WIP_RDZOJWI_20240723_110410_3436");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UUrShak_107875);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xdc8880586be91112), EConversationDebugInfo::Executing);
                
                // This was taking too long.
                Hero.AI.Say(LocText("TEXT_WIP_RDZOJWI_20240723_110410_3436"));
                DC(int64(0xdc8880586be91112), EConversationDebugInfo::Done);
                DC(int64(0xdc8880586be91119), EConversationDebugInfo::Executing);
                
                // Spoken like a madman!
                UrShak.AI.Say(LocText("TEXT_WIP_RDZOJWI_20240723_110525"));
                DC(int64(0xdc8880586be91119), EConversationDebugInfo::Done);
            }
        }
        
        
        class UUrShak_108186 : UTopic_Hero__UL_OSL_URSHAK_2200
        {
            default DebugId = int64(0xdc8880586be9111a);
            default Caption = LocText("TEXT_WIP_RDZOJWI_20240723_110542_3286");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UUrShak_108186);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xdc8880586be9111b), EConversationDebugInfo::Executing);
                
                // I'm sorry. I didn't mean to do this.
                Hero.AI.Say(LocText("TEXT_WIP_RDZOJWI_20240723_110542_3286"));
                DC(int64(0xdc8880586be9111b), EConversationDebugInfo::Done);
                DC(int64(0xdc8880586be91120), EConversationDebugInfo::Executing);
                
                // But you did!
                UrShak.AI.Say(LocText("TEXT_WIP_RDZOJWI_20240723_110546"));
                DC(int64(0xdc8880586be91120), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceUrshak109625 : UTopic_Hero__UL_OSL_URSHAK_2200
        {
            default DebugId = int64(0xdc8880586be91137);
            default Caption = FText::FromString("[Fallback Topic]");;
            default bIsFallbackTopic = true;
            
            default Rules.HideIfKnows(UChoiceUrshak109625);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_RDZOJWI_20240723_111941"), int64(0xdc8880586be91137));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xdc8880586be91134), EConversationDebugInfo::Executing);
                // Do not speak to me. Slay Krushak, then go away. 
                UrShak.AI.Say(LocText("TEXT_WIP_RDZOJWI_20240723_112107_2386"));
                DC(int64(0xdc8880586be91134), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceUrshak109714 : UTopic_Hero__UL_OSL_URSHAK_2200
        {
            default DebugId = int64(0xdc8880586be91144);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceUrshak109714);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xef0d4b2c8353b7a0), G1R != nullptr && G1R.IsInChapter(6));
                }
                
                return G1R != nullptr && G1R.IsInChapter(6);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xdc8880586be91169), EConversationDebugInfo::Executing);
                // You are back!
                UrShak.AI.Say(LocText("TEXT_WIP_RDZOJWI_20240723_112841"));
                DC(int64(0xdc8880586be91169), EConversationDebugInfo::Done);
                DC(int64(0x9184f316751c8876), EConversationDebugInfo::Executing);
                
                // Are you all right? 
                Hero.AI.Say(LocText("TEXT_WIP_RDZOJWI_20240723_120531"));
                DC(int64(0x9184f316751c8876), EConversationDebugInfo::Done);
                DC(int64(0x9184f316751c8886), EConversationDebugInfo::Executing);
                
                // Yes. The morra with the mad eyes didn't harm anyone, but ...
                UrShak.AI.Say(LocText("TEXT_WIP_RDZOJWI_20240723_120624"));
                DC(int64(0x9184f316751c8886), EConversationDebugInfo::Done);
                DC(int64(0x9184f316751c8887), EConversationDebugInfo::Executing);
                // These men ... Krushak possessed them, I can feel it. ...
                UrShak.AI.Say(LocText("TEXT_WIP_RDZOJWI_20240723_120630"));
                DC(int64(0x9184f316751c8887), EConversationDebugInfo::Done);
                DC(int64(0x9184f316751c8877), EConversationDebugInfo::Executing);
                // But I must know: how did you get into the temple? 
                UrShak.AI.Say(LocText("TEXT_WIP_RDZOJWI_20240723_120531_41"));
                DC(int64(0x9184f316751c8877), EConversationDebugInfo::Done);
                DB(int64(0xdc8880586be91158), Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_STEALTHPATH != nullptr && Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_STEALTHPATH.HasSucceeded());
                DB(int64(0x4238634516983611), Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_INTELLIGENCEPATH != nullptr && Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_INTELLIGENCEPATH.HasSucceeded());
                
                if (Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_STEALTHPATH != nullptr && Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_STEALTHPATH.HasSucceeded())
                {
                    DC(int64(0xdc8880586be9116a), EConversationDebugInfo::Executing);
                    // One moment, he saw you, the next, there was word of ...
                    UrShak.AI.Say(LocText("TEXT_WIP_RDZOJWI_20240723_112936"));
                    DC(int64(0xdc8880586be9116a), EConversationDebugInfo::Done);
                    DC(int64(0xdc8880586be9116b), EConversationDebugInfo::Executing);
                    
                    // There was a secret way in. Another orc showed me. 
                    Hero.AI.Say(LocText("TEXT_WIP_RDZOJWI_20240723_112939"));
                    DC(int64(0xdc8880586be9116b), EConversationDebugInfo::Done);
                    DC(int64(0xdc8880586be9116c), EConversationDebugInfo::Executing);
                    
                    // I see. Well done ... "Mun-sa pakk shab ârtakh ra madâ." ...
                    UrShak.AI.Say(LocText("TEXT_WIP_RDZOJWI_20240723_113001"));
                    DC(int64(0xdc8880586be9116c), EConversationDebugInfo::Done);
                }
                else if (Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_INTELLIGENCEPATH != nullptr && Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_INTELLIGENCEPATH.HasSucceeded())
                {
                    DC(int64(0xdc8880586be91160), EConversationDebugInfo::Executing);
                    // So - Ur-Nazkrog let you in? And she commanded ...
                    UrShak.AI.Say(LocText("TEXT_WIP_RDZOJWI_20240723_112836_443"));
                    DC(int64(0xdc8880586be91160), EConversationDebugInfo::Done);
                    DC(int64(0xdc8880586be91173), EConversationDebugInfo::Executing);
                    
                    // Yes. She thinks the Sleeper works through me. 
                    Hero.AI.Say(LocText("TEXT_WIP_RDZOJWI_20240723_113707"));
                    DC(int64(0xdc8880586be91173), EConversationDebugInfo::Done);
                    DC(int64(0xdc8880586be91174), EConversationDebugInfo::Executing);
                    
                    // I see. Either way, you did well. Not a single one of my ...
                    UrShak.AI.Say(LocText("TEXT_WIP_RDZOJWI_20240723_113719"));
                    DC(int64(0xdc8880586be91174), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x4238634516983638), EConversationDebugInfo::Executing);
                    
                    // I have my ways. 
                    Hero.AI.Say(LocText("TEXT_WIP_UGKWYUI_20240719_163404"));
                    DC(int64(0x4238634516983638), EConversationDebugInfo::Done);
                    DC(int64(0x4238634516983639), EConversationDebugInfo::Executing);
                    
                    // I see. 
                    UrShak.AI.Say(LocText("TEXT_WIP_RDZOJWI_20240723_114540"));
                    DC(int64(0x4238634516983639), EConversationDebugInfo::Done);
                }
                DC(int64(0xdc8880586be91176), EConversationDebugInfo::Executing);
                // So? What did you find inside? 
                UrShak.AI.Say(LocText("TEXT_WIP_RDZOJWI_20240723_113733_1769"));
                DC(int64(0xdc8880586be91176), EConversationDebugInfo::Done);
                DC(int64(0xdc8880586be9117d), EConversationDebugInfo::Executing);
                
                // A lot of undead. There was another seal, but I think I ...
                Hero.AI.Say(LocText("TEXT_WIP_RDZOJWI_20240723_113930"));
                DC(int64(0xdc8880586be9117d), EConversationDebugInfo::Done);
                DC(int64(0xdc8880586be91189), EConversationDebugInfo::Executing);
                
                // What is it? 
                UrShak.AI.Say(LocText("TEXT_WIP_RDZOJWI_20240723_114055"));
                DC(int64(0xdc8880586be91189), EConversationDebugInfo::Done);
                DC(int64(0xdc8880586be91190), EConversationDebugInfo::Executing);
                
                // A sword. 
                Hero.AI.Say(LocText("TEXT_WIP_RDZOJWI_20240723_114145"));
                DC(int64(0xdc8880586be91190), EConversationDebugInfo::Done);
                DB(int64(0xdc8880586be9117f), Hero != nullptr && Hero.HasItem(UItMw_2H_Sword_Uriziel_03, 1, 0));
                DB(int64(0xa6b0b27c1e9acb1f), Hero != nullptr && Hero.HasItem(UItAr_Rune_UrizielWaveOfDeath, 1, 0));
                DB(int64(0xdc8880586be91191), Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_JKFZPFD_20240731_205018")));
                
                if ((Hero != nullptr && Hero.HasItem(UItMw_2H_Sword_Uriziel_03, 1, 0)) || (Hero != nullptr && Hero.HasItem(UItAr_Rune_UrizielWaveOfDeath, 1, 0)))
                {
                    DC(int64(0xdc8880586be9118a), EConversationDebugInfo::Executing);
                    // It had lost its magic, but I found a way to charge it. 
                    Hero.AI.Say(LocText("TEXT_WIP_RDZOJWI_20240723_114138"));
                    DC(int64(0xdc8880586be9118a), EConversationDebugInfo::Done);
                    DC(int64(0xdc8880586be911a5), EConversationDebugInfo::Executing);
                    
                    // I see. 
                    UrShak.AI.Say(LocText("TEXT_WIP_RDZOJWI_20240723_114540"));
                    DC(int64(0xdc8880586be911a5), EConversationDebugInfo::Done);
                }
                else if (Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_JKFZPFD_20240731_205018")))
                {
                    DC(int64(0xdc8880586be91185), EConversationDebugInfo::Executing);
                    
                    // It has lost its magic, but Xardas told me a way to ...
                    Hero.AI.Say(LocText("TEXT_WIP_RDZOJWI_20240723_114030_491"));
                    DC(int64(0xdc8880586be91185), EConversationDebugInfo::Done);
                    DC(int64(0xdc8880586be911a3), EConversationDebugInfo::Executing);
                    
                    // Then that is what you should do. I still don't trust the ...
                    UrShak.AI.Say(LocText("TEXT_WIP_RDZOJWI_20240723_114518"));
                    DC(int64(0xdc8880586be911a3), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0xdc8880586be9119b), EConversationDebugInfo::Executing);
                    
                    // It has lost its power, but maybe I can find a way to ...
                    Hero.AI.Say(LocText("TEXT_WIP_RDZOJWI_20240723_114409_3750"));
                    DC(int64(0xdc8880586be9119b), EConversationDebugInfo::Done);
                    DC(int64(0xdc8880586be911a1), EConversationDebugInfo::Executing);
                    
                    // Interesting. You should speak to the demon summoner, ...
                    UrShak.AI.Say(LocText("TEXT_WIP_RDZOJWI_20240723_114451"));
                    DC(int64(0xdc8880586be911a1), EConversationDebugInfo::Done);
                    DC(int64(0xdc8880586be911a2), EConversationDebugInfo::Executing);
                    // I still don't trust him, but his knowledge goes deep. 
                    UrShak.AI.Say(LocText("TEXT_WIP_RDZOJWI_20240723_114505"));
                    DC(int64(0xdc8880586be911a2), EConversationDebugInfo::Done);
                }
                DC(int64(0xdc8880586be911bc), EConversationDebugInfo::Executing);
                // Be fast now, and fight well. I can feel Krushak tossing ...
                UrShak.AI.Say(LocText("TEXT_WIP_RDZOJWI_20240723_115711_1340"));
                DC(int64(0xdc8880586be911bc), EConversationDebugInfo::Done);
                DC(int64(0xdc8880586be911c8), EConversationDebugInfo::Executing);
                // We must stop him and the madmen before it's too late. 
                UrShak.AI.Say(LocText("TEXT_WIP_RDZOJWI_20240723_115821"));
                DC(int64(0xdc8880586be911c8), EConversationDebugInfo::Done);
                DC(int64(0xdc8880586be911c9), EConversationDebugInfo::Executing);
                
                // I'll do what I can. 
                Hero.AI.Say(LocText("TEXT_WIP_RDZOJWI_20240723_115826"));
                DC(int64(0xdc8880586be911c9), EConversationDebugInfo::Done);
                DC(int64(0xdc8880586be911ca), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xdc8880586be911ca), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceUrshak109741 : UTopic_Hero__UL_OSL_URSHAK_2200
        {
            default DebugId = int64(0x8d13f80aba3c9be5);
            default Caption = LocText("TEXT_WIP_QDMVSBC_20240911_105250");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceUrshak109741);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_MEVDOTI_20240702_204134"), int64(0x8d13f80aba3c9be5));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8d13f80aba3c9be1), EConversationDebugInfo::Executing);
                // Remind me - what's an "ordôkh"?
                Hero.AI.Say(LocText("TEXT_WIP_QDMVSBC_20240911_105250"));
                DC(int64(0x8d13f80aba3c9be1), EConversationDebugInfo::Done);
                DC(int64(0x8d13f80aba3c9be2), EConversationDebugInfo::Executing);
                
                // A settlement of the orcs. A place of power. This is what ...
                UrShak.AI.Say(LocText("TEXT_WIP_QDMVSBC_20240911_105250_41"));
                DC(int64(0x8d13f80aba3c9be2), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceUrshak188841 : UTopic_Hero__UL_OSL_URSHAK_2200
        {
            default DebugId = int64(0x24c01a6367b756f2);
            default Caption = LocText("TEXT_WIP_OHOYLVC_20250228_093427");
            default PriorityRank = 3;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x24c01a6367b75746), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Orcish_Master));
                }
                
                return Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Orcish_Master);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x24c01a6367b756ee), EConversationDebugInfo::Executing);
                
                // Teach me Orcish.
                Hero.AI.Say(LocText("TEXT_WIP_OHOYLVC_20250228_093427"));
                DC(int64(0x24c01a6367b756ee), EConversationDebugInfo::Done);
                DB(int64(0x24c01a6367b7575a), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Skilled));
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Skilled))
                {
                    DB(int64(0x24c01a6367b7577f), Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Orcish_Master));
                    
                    if (Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Orcish_Master))
                    {
                        DC(int64(0x24c01a6367b757a3), EConversationDebugInfo::Executing);
                        // Here, take this tome. I used it to learn the speak of ...
                        UrShak.AI.Say(LocText("TEXT_WIP_DHKWYUI_20240710_092945"));
                        DC(int64(0x24c01a6367b757a3), EConversationDebugInfo::Done);
                        Print("Skipped Hero.AI.PlayAnimation(Read)");
                        DC(int64(0x24c01a6367b7581a), EConversationDebugInfo::Executing);
                        Hero.LearnSkill(UGE_Skill_Orcish_Master);
                        DC(int64(0x24c01a6367b7581a), EConversationDebugInfo::Done);
                        
                        Other.Remember(n"choice_urshak_188841_exit_1");
                    }
                    else
                    {
                        DC(int64(0x24c01a6367b757a7), EConversationDebugInfo::Executing);
                        // I will - ONCE you are actually ready to learn. Come back ...
                        UrShak.AI.Say(LocText("TEXT_WIP_OHOYLVC_20250228_093848_1924"));
                        DC(int64(0x24c01a6367b757a7), EConversationDebugInfo::Done);
                        
                        Other.Remember(n"choice_urshak_188841_exit_2");
                    }
                }
                else
                {
                    DB(int64(0x24c01a6367b757ad), Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Orcish_Skilled));
                    
                    if (Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Orcish_Skilled))
                    {
                        DC(int64(0x24c01a6367b757b3), EConversationDebugInfo::Executing);
                        // Here, take these tomes - Ur-Shak used them to learn the ...
                        UrShak.AI.Say(LocText("TEXT_WIP_DHKWYUI_20240710_094430"));
                        DC(int64(0x24c01a6367b757b3), EConversationDebugInfo::Done);
                        Print("Skipped Hero.AI.PlayAnimation(Read)");
                        DC(int64(0x24c01a6367b7584c), EConversationDebugInfo::Executing);
                        Hero.LearnSkill(UGE_Skill_Orcish_Skilled);
                        DC(int64(0x24c01a6367b7584c), EConversationDebugInfo::Done);
                        
                        Other.Remember(n"choice_urshak_188841_exit_3");
                    }
                    else
                    {
                        DC(int64(0x24c01a6367b757ba), EConversationDebugInfo::Executing);
                        // I will - ONCE you are actually ready to learn. Come back ...
                        UrShak.AI.Say(LocText("TEXT_WIP_OHOYLVC_20250228_093848_1924"));
                        DC(int64(0x24c01a6367b757ba), EConversationDebugInfo::Done);
                        
                        Other.Remember(n"choice_urshak_188841_exit_4");
                    }
                }
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */