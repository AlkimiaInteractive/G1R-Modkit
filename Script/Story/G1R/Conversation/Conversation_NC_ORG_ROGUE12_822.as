#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_NC_ORG_ROGUE12_822 : UConversationCharacterSettings
        {
            default ForCharacter = n"NC_ORG_ROGUE12_822";
        }
        
        
        class UTopic_Hero__NC_ORG_ROGUE12_822 : UG1RDialogTopic
        {
            default ForCharacter = n"NC_ORG_ROGUE12_822";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetRogue12() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetNC_ORG_ROGUE01_800() const property
            {
                return GetCharacter(n"NC_ORG_ROGUE01_800");
            }
            
            AGothicCharacterState GetNC_ORG_ROGUE37_886N() const property
            {
                return GetCharacter(n"NC_ORG_ROGUE37_886N");
            }
        }
        
        
        class UChoiceRogue12225721 : UTopic_Hero__NC_ORG_ROGUE12_822
        {
            default DebugId = int64(0xbb5717416cff582f);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xbb5717416cff582e), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xbb5717416cff582e), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Rogue12_ShipmentAttack_0 : UTopic_Hero__NC_ORG_ROGUE12_822
        {
            default DebugId = int64(0xbb5717416cff5834);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::FarRange;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            default ForceSettings.bDoAmbientDuringCombat = true;
            
            default Rules.HideIfKnows(UTopic_Rogue12_ShipmentAttack);
            
            default Rules.HideIfKnows(UTopic_Rogue12_ShipmentAttack_0);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xbb5717416cff5837), Rogue12 != nullptr && Rogue12.HasAssignedDailyRoutine(UDailyRoutine_NC_ORG_Rogue12_822_Shipment));
                }
                
                return Rogue12 != nullptr && Rogue12.HasAssignedDailyRoutine(UDailyRoutine_NC_ORG_Rogue12_822_Shipment);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xbb5717416cff588e), EConversationDebugInfo::Executing);
                // Where do you think you're going, eh? Don't even think ...
                Rogue12.AI.Say(LocText("TEXT_WIP_RHHWUEL_20241204_154945_1609"));
                DC(int64(0xbb5717416cff588e), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Rogue12_ShipmentAttack : UTopic_Hero__NC_ORG_ROGUE12_822
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Rogue12_ShipmentAttack_0);
            default Rules.HideIfKnows(UTopic_Rogue12_ShipmentAttack);
            default DebugId = int64(0xbb5717416cff5834);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xbb5717416cff5839), EConversationDebugInfo::Executing);
                Rogue12.AI.StartFightCustomWithWeapon(Hero, GameplayTag::AIConflict_FightType_Real, GameplayTag::AIConflict_FightGoal_Kill, GameplayTag::AIConflict_Duration_Permanent);
                DC(int64(0xbb5717416cff5839), EConversationDebugInfo::Done);
                DC(int64(0xbb5717416cff583b), EConversationDebugInfo::Executing);
                if (ensure(IsValid(NC_ORG_ROGUE01_800)) && ensure(IsValid(NC_ORG_ROGUE01_800.AI))) { NC_ORG_ROGUE01_800.AI.StartFightCustomWithWeapon(Hero, GameplayTag::AIConflict_FightType_Real, GameplayTag::AIConflict_FightGoal_Kill, GameplayTag::AIConflict_Duration_Permanent); }
                DC(int64(0xbb5717416cff583b), EConversationDebugInfo::Done);
                DC(int64(0xbb5717416cff583d), EConversationDebugInfo::Executing);
                if (ensure(IsValid(NC_ORG_ROGUE37_886N)) && ensure(IsValid(NC_ORG_ROGUE37_886N.AI))) { NC_ORG_ROGUE37_886N.AI.StartFightCustomWithWeapon(Hero, GameplayTag::AIConflict_FightType_Real, GameplayTag::AIConflict_FightGoal_Kill, GameplayTag::AIConflict_Duration_Permanent); }
                DC(int64(0xbb5717416cff583d), EConversationDebugInfo::Done);
                DC(int64(0xbb5717416cff5888), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xbb5717416cff5888), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */