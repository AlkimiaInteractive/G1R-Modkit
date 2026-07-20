#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OM_STT_IAN_301 : UConversationCharacterSettings
        {
            default ForCharacter = n"OM_STT_IAN_301";
        }
        
        
        class UTopic_Hero__OM_STT_IAN_301 : UG1RDialogTopic
        {
            default ForCharacter = n"OM_STT_IAN_301";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetIan() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetFM_OSL_ORCSLAVE01_6001() const property
            {
                return GetCharacter(n"FM_OSL_ORCSLAVE01_6001");
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
            
            AGothicCharacterState GetDiego() const property
            {
                return GetCharacter(n"OC_STT_DIEGO");
            }
            
            AGothicCharacterState GetOM_GRD_GUARD14_281N() const property
            {
                return GetCharacter(n"OM_GRD_GUARD14_281N");
            }
            
            AGothicCharacterState GetGorNaBar() const property
            {
                return GetCharacter(n"OM_TPL_GORNABAR_1400");
            }
            
            AGothicCharacterState GetGorNaKosh() const property
            {
                return GetCharacter(n"OM_TPL_GORNAKOSH_1401");
            }
            
            AGothicCharacterState GetGorNaVid() const property
            {
                return GetCharacter(n"OM_TPL_GORNAVID_1433");
            }
            
            AGothicCharacterState GetLester() const property
            {
                return GetCharacter(n"SC_NOV_LESTER");
            }
        }
        
        
        class UChoiceIan157854 : UTopic_Hero__OM_STT_IAN_301
        {
            default DebugId = int64(0x19498533fa3b351f);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceIan157854);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xdcba2e5afdadf7b7), Hero != nullptr && Hero.IsCloseToCharacter(Ian, 600.0f));
                    DB(int64(0xdcba2e5afdadf7b9), Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD != nullptr && Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD.HasBeenStarted());
                }
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Ian, 600.0f))
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD != nullptr && !Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD.HasBeenStarted())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x19498533fa3b351e), EConversationDebugInfo::Executing);
                // Well, look who it is. Heard that ritual of the swampies ...
                Ian.AI.Say(LocText("TEXT_WIP_HNXNLPG_20250217_121540_41"));
                DC(int64(0x19498533fa3b351e), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceIan157875_0 : UTopic_Hero__OM_STT_IAN_301
        {
            default DebugId = int64(0x19498533fa3b3535);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceIan157875);
            
            default Rules.HideIfKnows(UChoiceIan157875_0);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xdcba2e5afdadf7b7), Hero != nullptr && Hero.IsCloseToCharacter(Ian, 600.0f));
                    DB(int64(0xdcba2e5afdadf7b9), G1R != nullptr && G1R.IsInChapter(3));
                }
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Ian, 600.0f))
                    return false;
                
                if (G1R != nullptr && !G1R.IsInChapter(3))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x19498533fa3b3534), EConversationDebugInfo::Executing);
                // Yeah, well, I guess I'm stuck here for now. Time to fix ...
                Ian.AI.Say(LocText("TEXT_WIP_HNXNLPG_20250217_121806_2238"));
                DC(int64(0x19498533fa3b3534), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceIan157875 : UTopic_Hero__OM_STT_IAN_301
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceIan157875_0);
            default Rules.HideIfKnows(UChoiceIan157875);
            default DebugId = int64(0x19498533fa3b3535);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf5ca08c263c9a46), EConversationDebugInfo::Executing);
                Ian.ExchangeDailyRoutineToClass(UDailyRoutine_OM_STT_Ian_301_Repair);
                DC(int64(0xf5ca08c263c9a46), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceIan300926 : UTopic_Hero__OM_STT_IAN_301
        {
            default DebugId = int64(0x40fae098967ee0d);
            default Caption = LocText("TEXT_WIP_FXYXWWB_20250205_162450");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceIan300926);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xb61a837bcb79c46b), Hero != nullptr && Hero.HasSaid(LocText("TEXT_WIP_KOQECXC_20240429_195257")));
                    DB(int64(0xae34c5512d5ef92e), Ian != nullptr && !Ian.HasAssignedDailyRoutine(UDailyRoutine_OM_STT_Ian_301_Collapsed));
                }
                
                if (Hero != nullptr && !Hero.HasSaid(LocText("TEXT_WIP_KOQECXC_20240429_195257")))
                    return false;
                
                if (Ian != nullptr && Ian.HasAssignedDailyRoutine(UDailyRoutine_OM_STT_Ian_301_Collapsed))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x40fae098967ee0b), EConversationDebugInfo::Executing);
                // Why don't you light one up? It'll chill you out.
                Hero.AI.Say(LocText("TEXT_WIP_FXYXWWB_20250205_162450"));
                DC(int64(0x40fae098967ee0b), EConversationDebugInfo::Done);
                DC(int64(0x40fae098967ee0c), EConversationDebugInfo::Executing);
                
                // Yeah, sure. And what do you think is gonna happen to the ...
                Ian.AI.Say(LocText("TEXT_WIP_FXYXWWB_20250205_162450_41"));
                DC(int64(0x40fae098967ee0c), EConversationDebugInfo::Done);
                DC(int64(0x40fae098967ee0f), EConversationDebugInfo::Executing);
                // The blokes are gonna turn this whole place upside down, ...
                Ian.AI.Say(LocText("TEXT_WIP_FXYXWWB_20250205_162622"));
                DC(int64(0x40fae098967ee0f), EConversationDebugInfo::Done);
                DC(int64(0x40fae098967ee10), EConversationDebugInfo::Executing);
                // Forget it. I ain't touchin' those herbs.
                Ian.AI.Say(LocText("TEXT_WIP_FXYXWWB_20250205_162730"));
                DC(int64(0x40fae098967ee10), EConversationDebugInfo::Done);
                DC(int64(0x40fae098967ee11), EConversationDebugInfo::Executing);
                
                // Worth a try.
                Hero.AI.Say(LocText("TEXT_WIP_FXYXWWB_20250205_162746"));
                DC(int64(0x40fae098967ee11), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceStt301IanExit : UTopic_Hero__OM_STT_IAN_301
        {
            default DebugId = int64(0x148123483dce3349);
            default Caption = LocText("STT_301_IAN_EXIT_INFO_15_01");
            default PriorityRank = 5;
            default PropertyTags.AddTag(GameplayTag::Conversation_Topic_End);
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x148123483dce334a), EConversationDebugInfo::Executing);
                // I'll go take a look around.
                Hero.AI.Say(LocText("STT_301_IAN_EXIT_INFO_15_01"));
                DC(int64(0x148123483dce334a), EConversationDebugInfo::Done);
                DC(int64(0x148123483dce334b), EConversationDebugInfo::Executing);
                
                // Just don't make no trouble. 
                Ian.AI.Say(LocText("STT_301_IAN_EXIT_INFO_13_02"));
                DC(int64(0x148123483dce334b), EConversationDebugInfo::Done);
                DC(int64(0x148123483dce334c), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x148123483dce334c), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceStt301IanGearRun : UTopic_Hero__OM_STT_IAN_301
        {
            default DebugId = int64(0x148123483dce3379);
            default Caption = LocText("STT_301_IAN_GEAR_RUN_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceStt301IanNest);
            default Rules.HideIfKnows(UChoiceStt301IanGearRun);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x148123483dce337a), Quest::OldMine_OMCHAPTER2_IAN_GEARWHEEL != nullptr && Quest::OldMine_OMCHAPTER2_IAN_GEARWHEEL.IsRunning());
                    DB(int64(0x148123483dce337b), Hero != nullptr && !Hero.HasItem(UItMi_Stuff_Gearwheel_01, 1, 0));
                }
                
                if (Quest::OldMine_OMCHAPTER2_IAN_GEARWHEEL != nullptr && !Quest::OldMine_OMCHAPTER2_IAN_GEARWHEEL.IsRunning())
                    return false;
                
                if (Hero != nullptr && Hero.HasItem(UItMi_Stuff_Gearwheel_01, 1, 0))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x148123483dce337c), EConversationDebugInfo::Executing);
                // Where am I supposed to find a replacement gear? 
                Hero.AI.Say(LocText("STT_301_IAN_GEAR_RUN_INFO_15_01"));
                DC(int64(0x148123483dce337c), EConversationDebugInfo::Done);
                DC(int64(0x148123483dce337d), EConversationDebugInfo::Executing);
                
                // Figurin' that out is part o' the job. 
                Ian.AI.Say(LocText("STT_301_IAN_GEAR_RUN_INFO_13_02"));
                DC(int64(0x148123483dce337d), EConversationDebugInfo::Done);
                DC(int64(0x148123483dce337e), EConversationDebugInfo::Executing);
                // But there's an old crusher in a side tunnel, from before ...
                Ian.AI.Say(LocText("STT_301_IAN_GEAR_RUN_INFO_13_03"));
                DC(int64(0x148123483dce337e), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceStt301IanGearSuc : UTopic_Hero__OM_STT_IAN_301
        {
            default DebugId = int64(0x148123483dce337f);
            default Caption = LocText("STT_301_IAN_GEAR_SUC_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceStt301IanNest);
            default Rules.HideIfKnows(UChoiceStt301IanGearSuc);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x148123483dce3380), Hero != nullptr && Hero.HasItem(UItMi_Stuff_Gearwheel_01, 1, 0));
                    DB(int64(0x148123483dce3381), Quest::OldMine_OMCHAPTER2_IAN_GEARWHEEL != nullptr && Quest::OldMine_OMCHAPTER2_IAN_GEARWHEEL.IsRunning());
                }
                
                if (Hero != nullptr && !Hero.HasItem(UItMi_Stuff_Gearwheel_01, 1, 0))
                    return false;
                
                if (Quest::OldMine_OMCHAPTER2_IAN_GEARWHEEL != nullptr && !Quest::OldMine_OMCHAPTER2_IAN_GEARWHEEL.IsRunning())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe597da1fcb7b6103), EConversationDebugInfo::Executing);
                Hero.AI.GiveItemTo(Ian, UItMi_Stuff_Gearwheel_01, 1);
                DC(int64(0xe597da1fcb7b6103), EConversationDebugInfo::Done);
                DC(int64(0xe597da1fcb7b6105), EConversationDebugInfo::Executing);
                Ian.RemoveItemFromInventory(UItMi_Stuff_Gearwheel_01, 1, 0);
                DC(int64(0xe597da1fcb7b6105), EConversationDebugInfo::Done);
                DC(int64(0xe597da1fcb7b6107), EConversationDebugInfo::Executing);
                Quest::OldMine_OMCHAPTER2_IAN_GEARWHEEL_IAN_GEARWHEEL_OBJ_RETURN.SucceedQuest();
                DC(int64(0xe597da1fcb7b6107), EConversationDebugInfo::Done);
                DC(int64(0xe597da1fcb7b610b), EConversationDebugInfo::Executing);
                if (ensure(IsValid(FM_OSL_ORCSLAVE01_6001))) { FM_OSL_ORCSLAVE01_6001.ExchangeDailyRoutineToClass(UDailyRoutine_FM_OSL_OrcSlave01_6001_Stomper); }
                DC(int64(0xe597da1fcb7b610b), EConversationDebugInfo::Done);
                DC(int64(0x1dce4f30748f63d7), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_IAN.FailQuest();
                DC(int64(0x1dce4f30748f63d7), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OM_STT_IAN, Document::UDocumentSegment_Glossary_OM_STT_IAN_Lie);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_IAN_GEARWHEEL, Document::UDocumentSegment_CH2_IAN_GEARWHEEL_Completed);
                DB(int64(0x56788585a6b94a6), Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_GATHER != nullptr && !Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_GATHER.HasSucceeded());
                
                if (Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_GATHER != nullptr && !Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_GATHER.HasSucceeded())
                {
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_MCEGGS, Document::UDocumentSegment_CH2_MCEGGS_GatherLeft);
                }
                else
                {
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_MCEGGS, Document::UDocumentSegment_CH2_MCEGGS_IanCompleted);
                }
                DC(int64(0x148123483dce3387), EConversationDebugInfo::Executing);
                // I found that cog you wanted. 
                Hero.AI.Say(LocText("STT_301_IAN_GEAR_SUC_INFO_15_01"));
                DC(int64(0x148123483dce3387), EConversationDebugInfo::Done);
                DC(int64(0x148123483dce3388), EConversationDebugInfo::Executing);
                
                // Pff, I'll be damned, you did. Not bad. Here - for your ...
                Ian.AI.Say(LocText("STT_301_IAN_GEAR_SUC_INFO_13_02"));
                DC(int64(0x148123483dce3388), EConversationDebugInfo::Done);
                DC(int64(0x3399d06059b5acc7), EConversationDebugInfo::Executing);
                Ian.AddItemToInventory(UItMi_Orenugget, 25);
                DC(int64(0x3399d06059b5acc7), EConversationDebugInfo::Done);
                DC(int64(0xf5b9b345b8092537), EConversationDebugInfo::Executing);
                Ian.AI.GiveItemTo(Hero, UItMi_Orenugget, 25);
                DC(int64(0xf5b9b345b8092537), EConversationDebugInfo::Done);
                DC(int64(0xf5b9b345b8092538), EConversationDebugInfo::Executing);
                // And the collapsed tunnel? Can we clear it? 
                Hero.AI.Say(LocText("TEXT_WIP_PPQXWNL_20240408_110805"));
                DC(int64(0xf5b9b345b8092538), EConversationDebugInfo::Done);
                DC(int64(0xf5b9b345b8092539), EConversationDebugInfo::Executing);
                
                // Right, that. No. 
                Ian.AI.Say(LocText("TEXT_WIP_PPQXWNL_20240408_110805_41"));
                DC(int64(0xf5b9b345b8092539), EConversationDebugInfo::Done);
                DC(int64(0xf5b9b345b8092545), EConversationDebugInfo::Executing);
                
                // But you said if I found that gear for you-
                Hero.AI.Say(LocText("TEXT_WIP_PPQXWNL_20240408_112607"));
                DC(int64(0xf5b9b345b8092545), EConversationDebugInfo::Done);
                DC(int64(0xf5b9b345b8092546), EConversationDebugInfo::Executing);
                
                // I said, I'll think about it, and I did. 
                Ian.AI.Say(LocText("TEXT_WIP_PPQXWNL_20240408_112638"));
                DC(int64(0xf5b9b345b8092546), EConversationDebugInfo::Done);
                DB(int64(0x28f8ba30074eea51), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                DB(int64(0x28f8ba30074eea54), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp))
                {
                    DC(int64(0x28f8ba30074eea53), EConversationDebugInfo::Executing);
                    // I know you baldies are desperate for that crawler juice, ...
                    Ian.AI.Say(LocText("TEXT_WIP_OOQECXC_20240425_183830_3286"));
                    DC(int64(0x28f8ba30074eea53), EConversationDebugInfo::Done);
                }
                else if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp))
                {
                    DC(int64(0x28f8ba30074eea56), EConversationDebugInfo::Executing);
                    // No idea what one of Lares's cutthroats is doin' workin' ...
                    Ian.AI.Say(LocText("TEXT_WIP_OOQECXC_20240425_184029_686"));
                    DC(int64(0x28f8ba30074eea56), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x28f8ba30074eea5a), EConversationDebugInfo::Executing);
                    // No idea why a Shadow is runnin' erands for the baldies, ...
                    Ian.AI.Say(LocText("TEXT_WIP_OOQECXC_20240425_184036_2386"));
                    DC(int64(0x28f8ba30074eea5a), EConversationDebugInfo::Done);
                }
                DC(int64(0x28f8ba30074eea68), EConversationDebugInfo::Executing);
                // But-
                Hero.AI.Say(LocText("TEXT_WIP_OOQECXC_20240425_184348"));
                DC(int64(0x28f8ba30074eea68), EConversationDebugInfo::Done);
                DC(int64(0x28f8ba30074eea69), EConversationDebugInfo::Executing);
                
                // End of discussion. Now sod off, I got business topside. 
                Ian.AI.Say(LocText("TEXT_WIP_OOQECXC_20240425_184348_3984"));
                DC(int64(0x28f8ba30074eea69), EConversationDebugInfo::Done);
                DB(int64(0x524e105e16893c3b), G1R.GatheredTemplars == 3);
                
                if (G1R.GatheredTemplars == 3)
                {
                    DC(int64(0x524e105e16893c41), EConversationDebugInfo::Executing);
                    if (ensure(IsValid(Lester))) { Lester.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Lester_OutsideOldMine); }
                    DC(int64(0x524e105e16893c41), EConversationDebugInfo::Done);
                    DC(int64(0x524e105e16893c4d), EConversationDebugInfo::Executing);
                    if (ensure(IsValid(Milten))) { Milten.ExchangeDailyRoutineToClass(UDailyRoutine_OC_KDF_Milten_FourFriendsMeeting); }
                    DC(int64(0x524e105e16893c4d), EConversationDebugInfo::Done);
                    DC(int64(0x524e105e16893c4f), EConversationDebugInfo::Executing);
                    if (ensure(IsValid(Gorn))) { Gorn.ExchangeDailyRoutineToClass(UDailyRoutine_NC_SLD_Gorn_699_FourFriendsMeeting); }
                    DC(int64(0x524e105e16893c4f), EConversationDebugInfo::Done);
                    DC(int64(0x524e105e16893c51), EConversationDebugInfo::Executing);
                    if (ensure(IsValid(Diego))) { Diego.ExchangeDailyRoutineToClass(UDailyRoutine_OC_STT_Diego_FourFriendsMeeting); }
                    DC(int64(0x524e105e16893c51), EConversationDebugInfo::Done);
                }
                DC(int64(0xf5b9b345b809265d), EConversationDebugInfo::Executing);
                Ian.ExchangeDailyRoutineToClass(UDailyRoutine_OM_STT_Ian_301_SmallTalk);
                DC(int64(0xf5b9b345b809265d), EConversationDebugInfo::Done);
                DC(int64(0xf5b9b345b8092663), EConversationDebugInfo::Executing);
                if (ensure(IsValid(OM_GRD_GUARD14_281N))) { OM_GRD_GUARD14_281N.ExchangeDailyRoutineToClass(UDailyRoutine_OM_GRD_Guard14_281N_SmallTalk); }
                DC(int64(0xf5b9b345b8092663), EConversationDebugInfo::Done);
                DC(int64(0xf5b9b345b8092664), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xf5b9b345b8092664), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceStt301IanGetlist : UTopic_Hero__OM_STT_IAN_301
        {
            default DebugId = int64(0x148123483dce336b);
            default Caption = LocText("STT_301_IAN_GETLIST_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceStt301IanHi);
            default Rules.HideIfKnows(UChoiceStt301IanGetlist);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("INFO_DIEGO_BRINGLIST_OFFER_11_01"), int64(0x148123483dce336b));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x148123483dce336c), Quest::OldCamp_OCCHAPTER1_BRINGLIST != nullptr && Quest::OldCamp_OCCHAPTER1_BRINGLIST.IsRunning());
                    DB(int64(0xae34c5512d5ef926), Ian != nullptr && !Ian.HasAssignedDailyRoutine(UDailyRoutine_OM_STT_Ian_301_Collapsed));
                }
                
                if (Quest::OldCamp_OCCHAPTER1_BRINGLIST != nullptr && !Quest::OldCamp_OCCHAPTER1_BRINGLIST.IsRunning())
                    return false;
                
                if (Ian != nullptr && Ian.HasAssignedDailyRoutine(UDailyRoutine_OM_STT_Ian_301_Collapsed))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x148123483dce336d), EConversationDebugInfo::Executing);
                // "The crawlers look mighty hungry."
                Hero.AI.Say(LocText("STT_301_IAN_GETLIST_INFO_15_01"));
                DC(int64(0x148123483dce336d), EConversationDebugInfo::Done);
                DC(int64(0x148123483dce336e), EConversationDebugInfo::Executing);
                
                // Well, well ... a Shadow hopeful, are you? Sure, here's ...
                Ian.AI.Say(LocText("STT_301_IAN_GETLIST_INFO_13_02"));
                DC(int64(0x148123483dce336e), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_BRINGLIST, Document::UDocumentSegment_CH1_BRINGLIST_Ian);
                DC(int64(0x3399d06059b5acc7), EConversationDebugInfo::Executing);
                Ian.AddItemToInventory(UItWr_Scroll_List, 1);
                DC(int64(0x3399d06059b5acc7), EConversationDebugInfo::Done);
                DC(int64(0xe597da1fcb7b610f), EConversationDebugInfo::Executing);
                Ian.AI.GiveItemTo(Hero, UItWr_Scroll_List, 1);
                DC(int64(0xe597da1fcb7b610f), EConversationDebugInfo::Done);
                DC(int64(0x2102b91e10df67b1), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_BRINGLIST_BRINGLIST_OBJ_GETLIST.SucceedQuest();
                DC(int64(0x2102b91e10df67b1), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceStt301IanGomez : UTopic_Hero__OM_STT_IAN_301
        {
            default DebugId = int64(0x148123483dce3350);
            default Caption = LocText("STT_301_IAN_GOMEZ_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceStt301IanHi);
            default Rules.HideIfKnows(UChoiceStt301IanGomez);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xb8e8630604e99739), G1R != nullptr && !G1R.HasReachedChapter(3));
                }
                
                return G1R != nullptr && !G1R.HasReachedChapter(3);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x148123483dce3351), EConversationDebugInfo::Executing);
                // Doesn't this mine belong to Gomez? 
                Hero.AI.Say(LocText("STT_301_IAN_GOMEZ_INFO_15_01"));
                DC(int64(0x148123483dce3351), EConversationDebugInfo::Done);
                DC(int64(0x148123483dce3352), EConversationDebugInfo::Executing);
                
                // How funny. Yes, of course it belongs to Gomez - but as ...
                Ian.AI.Say(LocText("STT_301_IAN_GOMEZ_INFO_13_02"));
                DC(int64(0x148123483dce3352), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceStt301IanHi : UTopic_Hero__OM_STT_IAN_301
        {
            default DebugId = int64(0x148123483dce334d);
            default Caption = LocText("STT_301_IAN_HI_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceStt301IanHi);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xb8e8630604e99739), G1R != nullptr && !G1R.HasReachedChapter(3));
                }
                
                return G1R != nullptr && !G1R.HasReachedChapter(3);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x148123483dce334e), EConversationDebugInfo::Executing);
                
                // Are you Ian? 
                Hero.AI.Say(LocText("STT_301_IAN_HI_INFO_15_01"));
                DC(int64(0x148123483dce334e), EConversationDebugInfo::Done);
                DC(int64(0x148123483dce334f), EConversationDebugInfo::Executing);
                
                // That's right, I am. And this is MY mine - so don't you ...
                Ian.AI.Say(LocText("STT_301_IAN_HI_INFO_13_02"));
                DC(int64(0x148123483dce334f), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OM_STT_IAN, Document::UDocumentSegment_Glossary_OM_STT_IAN_Introduction);
            }
        }
        
        
        class UChoiceStt301IanMagic : UTopic_Hero__OM_STT_IAN_301
        {
            default DebugId = int64(0x148123483dce335b);
            default Caption = LocText("STT_301_IAN_MAGIC_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceStt301IanMore);
            default Rules.HideIfKnows(UChoiceStt301IanMagic);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xb8e8630604e99739), G1R != nullptr && !G1R.HasReachedChapter(3));
                }
                
                return G1R != nullptr && !G1R.HasReachedChapter(3);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x148123483dce335c), EConversationDebugInfo::Executing);
                // How do you forge it "properly?"
                Hero.AI.Say(LocText("STT_301_IAN_MAGIC_INFO_15_01"));
                DC(int64(0x148123483dce335c), EConversationDebugInfo::Done);
                DC(int64(0x148123483dce335d), EConversationDebugInfo::Executing);
                
                // If you're lookin' to expand into the business, forget ...
                Ian.AI.Say(LocText("STT_301_IAN_MAGIC_INFO_13_02"));
                DC(int64(0x148123483dce335d), EConversationDebugInfo::Done);
                DC(int64(0x148123483dce335e), EConversationDebugInfo::Executing);
                // You need a special forge for that, and the only ...
                Ian.AI.Say(LocText("STT_301_IAN_MAGIC_INFO_13_03"));
                DC(int64(0x148123483dce335e), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceStt301IanMine : UTopic_Hero__OM_STT_IAN_301
        {
            default DebugId = int64(0x148123483dce335f);
            default Caption = LocText("STT_301_IAN_MINE_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceStt301IanHi);
            default Rules.HideIfKnows(UChoiceStt301IanMine);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x148123483dce3360), G1R != nullptr && !G1R.HasReachedChapter(3));
                }
                
                return G1R != nullptr && !G1R.HasReachedChapter(3);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x148123483dce3361), EConversationDebugInfo::Executing);
                
                // Any advice you could give me about the mine?
                Hero.AI.Say(LocText("STT_301_IAN_MINE_INFO_15_01"));
                DC(int64(0x148123483dce3361), EConversationDebugInfo::Done);
                DC(int64(0x148123483dce3362), EConversationDebugInfo::Executing);
                
                // Just be careful, especially in the unmanned tunnels - ...
                Ian.AI.Say(LocText("STT_301_IAN_MINE_INFO_13_02"));
                DC(int64(0x148123483dce3362), EConversationDebugInfo::Done);
                DC(int64(0x148123483dce3363), EConversationDebugInfo::Executing);
                // Odds are you'll run into a couple of templars as well - ...
                Ian.AI.Say(LocText("STT_301_IAN_MINE_INFO_13_03"));
                DC(int64(0x148123483dce3363), EConversationDebugInfo::Done);
                DC(int64(0x148123483dce3364), EConversationDebugInfo::Executing);
                
                // Got it. Anything else?
                Hero.AI.Say(LocText("STT_301_IAN_MINE_INFO_15_04"));
                DC(int64(0x148123483dce3364), EConversationDebugInfo::Done);
                DC(int64(0x148123483dce3365), EConversationDebugInfo::Executing);
                
                // Yes: don't keep my lads from doing their work.
                Ian.AI.Say(LocText("STT_301_IAN_MINE_INFO_13_05"));
                DC(int64(0x148123483dce3365), EConversationDebugInfo::Done);
                DC(int64(0x148123483dce3366), EConversationDebugInfo::Executing);
                
                // I won't.
                Hero.AI.Say(LocText("STT_301_IAN_MINE_INFO_15_06"));
                DC(int64(0x148123483dce3366), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceStt301IanMore : UTopic_Hero__OM_STT_IAN_301
        {
            default DebugId = int64(0x148123483dce3357);
            default Caption = LocText("STT_301_IAN_MORE_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceStt301IanOre);
            default Rules.HideIfKnows(UChoiceStt301IanMore);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xb8e8630604e99739), G1R != nullptr && !G1R.HasReachedChapter(3));
                }
                
                return G1R != nullptr && !G1R.HasReachedChapter(3);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x148123483dce3358), EConversationDebugInfo::Executing);
                // This is ore isn't ordinary, though, is it? I heard it's ...
                Hero.AI.Say(LocText("STT_301_IAN_MORE_INFO_15_01"));
                DC(int64(0x148123483dce3358), EConversationDebugInfo::Done);
                DC(int64(0x148123483dce3359), EConversationDebugInfo::Executing);
                
                // I guess you could call it that - when you forge it ...
                Ian.AI.Say(LocText("STT_301_IAN_MORE_INFO_13_02"));
                DC(int64(0x148123483dce3359), EConversationDebugInfo::Done);
                DC(int64(0x148123483dce335a), EConversationDebugInfo::Executing);
                // Two qualities that, as you can imagine, any general ...
                Ian.AI.Say(LocText("STT_301_IAN_MORE_INFO_13_03"));
                DC(int64(0x148123483dce335a), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceStt301IanNest : UTopic_Hero__OM_STT_IAN_301
        {
            default DebugId = int64(0x148123483dce3370);
            default Caption = LocText("STT_301_IAN_NEST_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceStt301IanNest);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_PPQXWNL_20240408_111831"), int64(0x148123483dce3370));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x148123483dce3371), Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS != nullptr && Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS.IsRunning());
                }
                
                return Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS != nullptr && Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x148123483dce3372), EConversationDebugInfo::Executing);
                
                // Y'Berion sent me. We're looking for a minecrawler nest. 
                Hero.AI.Say(LocText("STT_301_IAN_NEST_INFO_15_01"));
                DC(int64(0x148123483dce3372), EConversationDebugInfo::Done);
                DC(int64(0x148123483dce3373), EConversationDebugInfo::Executing);
                
                // Why by Beliar's darkness would you want to do THAT?
                Ian.AI.Say(LocText("STT_301_IAN_NEST_INFO_13_02"));
                DC(int64(0x148123483dce3373), EConversationDebugInfo::Done);
                DC(int64(0x148123483dce3374), EConversationDebugInfo::Executing);
                
                // Long story. But the templars think it's somewhere in the ...
                Hero.AI.Say(LocText("STT_301_IAN_NEST_INFO_15_03"));
                DC(int64(0x148123483dce3374), EConversationDebugInfo::Done);
                DC(int64(0x28f8ba30074eea4d), EConversationDebugInfo::Executing);
                
                // Huh. Too bad.
                Ian.AI.Say(LocText("TEXT_WIP_OOQECXC_20240425_183211"));
                DC(int64(0x28f8ba30074eea4d), EConversationDebugInfo::Done);
                DC(int64(0x28f8ba30074eea4e), EConversationDebugInfo::Executing);
                
                // Any chance you could give us permission to clear it? 
                Hero.AI.Say(LocText("TEXT_WIP_OOQECXC_20240425_183213"));
                DC(int64(0x28f8ba30074eea4e), EConversationDebugInfo::Done);
                DC(int64(0x148123483dce3375), EConversationDebugInfo::Executing);
                
                // (long sigh) You're actually serious about this, ain't ...
                Ian.AI.Say(LocText("STT_301_IAN_NEST_INFO_13_04"));
                DC(int64(0x148123483dce3375), EConversationDebugInfo::Done);
                DC(int64(0x148123483dce3376), EConversationDebugInfo::Executing);
                // One of our ore crushers gave up the ghost the other day ...
                Ian.AI.Say(LocText("STT_301_IAN_NEST_INFO_13_05"));
                DC(int64(0x148123483dce3376), EConversationDebugInfo::Done);
                DC(int64(0x148123483dce3377), EConversationDebugInfo::Executing);
                // Get me a replacement for that, and I'll think about it. 
                Ian.AI.Say(LocText("STT_301_IAN_NEST_INFO_13_06"));
                DC(int64(0x148123483dce3377), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_IAN_GEARWHEEL, Document::UDocumentSegment_CH2_IAN_GEARWHEEL_Start);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_MCEGGS, Document::UDocumentSegment_CH2_MCEGGS_Ian);
                DC(int64(0xe597da1fcb7b6133), EConversationDebugInfo::Executing);
                Quest::OldMine_OMCHAPTER2_IAN_GEARWHEEL.StartQuest();
                DC(int64(0xe597da1fcb7b6133), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceStt301IanNotenough : UTopic_Hero__OM_STT_IAN_301
        {
            default DebugId = int64(0x148123483dce3397);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceStt301IanNotenough);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x65f4f79c338d2879), Hero != nullptr && Hero.IsInConversation());
                    DB(int64(0xae34c5512d5ef92f), Ian != nullptr && !Ian.HasAssignedDailyRoutine(UDailyRoutine_OM_STT_Ian_301_Collapsed));
                    DB(int64(0x68e71925ad6065bf), Hero != nullptr && Hero.HasItem(UItAt_Crawlerqueen, 1, 0));
                }
                
                if (Hero != nullptr && !Hero.IsInConversation())
                    return false;
                
                if (Ian != nullptr && Ian.HasAssignedDailyRoutine(UDailyRoutine_OM_STT_Ian_301_Collapsed))
                    return false;
                
                if (Hero != nullptr && !Hero.HasItem(UItAt_Crawlerqueen, 1, 0))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x28f8ba30074eea73), EConversationDebugInfo::Executing);
                // Didn't think I'd see you again. 
                Ian.AI.Say(LocText("TEXT_WIP_OOQECXC_20240425_184821"));
                DC(int64(0x28f8ba30074eea73), EConversationDebugInfo::Done);
                DC(int64(0x148123483dce339a), EConversationDebugInfo::Executing);
                
                // I cleared out that tunnel for you. 
                Hero.AI.Say(LocText("STT_301_IAN_NOTENOUGH_INFO_15_01"));
                DC(int64(0x148123483dce339a), EConversationDebugInfo::Done);
                DC(int64(0x148123483dce339b), EConversationDebugInfo::Executing);
                
                // So I heard. I have to hand it to you, I didn't see that ...
                Ian.AI.Say(LocText("STT_301_IAN_NOTENOUGH_INFO_13_02"));
                DC(int64(0x148123483dce339b), EConversationDebugInfo::Done);
                DC(int64(0x28f8ba30074eea74), EConversationDebugInfo::Executing);
                // Here - on the house. 
                Ian.AI.Say(LocText("TEXT_WIP_OOQECXC_20240425_185127"));
                DC(int64(0x28f8ba30074eea74), EConversationDebugInfo::Done);
                DC(int64(0x3399d06059b5acc7), EConversationDebugInfo::Executing);
                Ian.AddItemToInventory(UItFo_Potion_Strongbeer, 6);
                DC(int64(0x3399d06059b5acc7), EConversationDebugInfo::Done);
                DC(int64(0xe597da1fcb7b60ed), EConversationDebugInfo::Executing);
                Ian.AI.GiveItemTo(Hero, UItFo_Potion_Strongbeer, 6);
                DC(int64(0xe597da1fcb7b60ed), EConversationDebugInfo::Done);
                DC(int64(0x7858bf075764a1d3), EConversationDebugInfo::Executing);
                Ian.RemoveImmortality();
                DC(int64(0x7858bf075764a1d3), EConversationDebugInfo::Done);
                DC(int64(0x7858bf075764a1d5), EConversationDebugInfo::Executing);
                if (ensure(IsValid(GorNaBar))) { GorNaBar.RemoveImmortality(); }
                DC(int64(0x7858bf075764a1d5), EConversationDebugInfo::Done);
                DC(int64(0x7858bf075764a1d7), EConversationDebugInfo::Executing);
                if (ensure(IsValid(GorNaKosh))) { GorNaKosh.RemoveImmortality(); }
                DC(int64(0x7858bf075764a1d7), EConversationDebugInfo::Done);
                DC(int64(0x7858bf075764a1d9), EConversationDebugInfo::Executing);
                if (ensure(IsValid(GorNaVid))) { GorNaVid.RemoveImmortality(); }
                DC(int64(0x7858bf075764a1d9), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceStt301IanOre : UTopic_Hero__OM_STT_IAN_301
        {
            default DebugId = int64(0x148123483dce3353);
            default Caption = LocText("STT_301_IAN_ORE_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceStt301IanGomez);
            default Rules.HideIfKnows(UChoiceStt301IanOre);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xb8e8630604e99739), G1R != nullptr && !G1R.HasReachedChapter(3));
                }
                
                return G1R != nullptr && !G1R.HasReachedChapter(3);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x148123483dce3354), EConversationDebugInfo::Executing);
                // Can you tell me a thing or two about ore mining?
                Hero.AI.Say(LocText("STT_301_IAN_ORE_INFO_15_01"));
                DC(int64(0x148123483dce3354), EConversationDebugInfo::Done);
                DC(int64(0x148123483dce3355), EConversationDebugInfo::Executing);
                
                // There ain't much to tell: we mine the nuggets for the ...
                Ian.AI.Say(LocText("STT_301_IAN_ORE_INFO_13_02"));
                DC(int64(0x148123483dce3355), EConversationDebugInfo::Done);
                DC(int64(0x148123483dce3356), EConversationDebugInfo::Executing);
                // And the king uses it to supply his troops.
                Ian.AI.Say(LocText("STT_301_IAN_ORE_INFO_13_03"));
                DC(int64(0x148123483dce3356), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceStt301IanWantlist : UTopic_Hero__OM_STT_IAN_301
        {
            default DebugId = int64(0x148123483dce3367);
            default Caption = LocText("STT_301_IAN_WANTLIST_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceStt301IanHi);
            default Rules.HideIfKnows(UChoiceStt301IanWantlist);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x148123483dce3368), Quest::OldCamp_OCCHAPTER1_BRINGLIST != nullptr && Quest::OldCamp_OCCHAPTER1_BRINGLIST.IsRunning());
                    DB(int64(0xe597da1fcb7b7944), Hero != nullptr && !Hero.HasItem(UItWr_Scroll_List, 1, 0));
                    DB(int64(0xae34c5512d5ef927), Ian != nullptr && !Ian.HasAssignedDailyRoutine(UDailyRoutine_OM_STT_Ian_301_Collapsed));
                }
                
                if (Quest::OldCamp_OCCHAPTER1_BRINGLIST != nullptr && !Quest::OldCamp_OCCHAPTER1_BRINGLIST.IsRunning())
                    return false;
                
                if (Hero != nullptr && Hero.HasItem(UItWr_Scroll_List, 1, 0))
                    return false;
                
                if (Ian != nullptr && Ian.HasAssignedDailyRoutine(UDailyRoutine_OM_STT_Ian_301_Collapsed))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x148123483dce3369), EConversationDebugInfo::Executing);
                
                // I'm here for the supply list.
                Hero.AI.Say(LocText("STT_301_IAN_WANTLIST_INFO_15_01"));
                DC(int64(0x148123483dce3369), EConversationDebugInfo::Done);
                DC(int64(0x148123483dce336a), EConversationDebugInfo::Executing);
                
                // Nice try, freshie. Piss off.
                Ian.AI.Say(LocText("STT_301_IAN_WANTLIST_INFO_13_02"));
                DC(int64(0x148123483dce336a), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */