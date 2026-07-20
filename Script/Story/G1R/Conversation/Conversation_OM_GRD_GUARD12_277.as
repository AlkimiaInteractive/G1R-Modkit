#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OM_GRD_GUARD12_277 : UConversationCharacterSettings
        {
            default ForCharacter = n"OM_GRD_GUARD12_277";
        }
        
        
        class UTopic_Hero__OM_GRD_GUARD12_277 : UG1RDialogTopic
        {
            default ForCharacter = n"OM_GRD_GUARD12_277";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetGuard() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceGrd277GardistSittingork : UTopic_Hero__OM_GRD_GUARD12_277
        {
            default DebugId = int64(0x644fef4c6a8cde9f);
            default Caption = LocText("GRD_277_GARDIST_SITTINGORK_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceGrd277GardistSittingork);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x644fef4c6a8cdea0), Quest::OldMine_OMCHAPTER2_IAN_GEARWHEEL != nullptr && !Quest::OldMine_OMCHAPTER2_IAN_GEARWHEEL.HasSucceeded());
                }
                
                return Quest::OldMine_OMCHAPTER2_IAN_GEARWHEEL != nullptr && !Quest::OldMine_OMCHAPTER2_IAN_GEARWHEEL.HasSucceeded();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x644fef4c6a8cdea1), EConversationDebugInfo::Executing);
                // What's the deal with that orc over there?
                Hero.AI.Say(LocText("GRD_277_GARDIST_SITTINGORK_INFO_15_01"));
                DC(int64(0x644fef4c6a8cdea1), EConversationDebugInfo::Done);
                DC(int64(0x644fef4c6a8cdea2), EConversationDebugInfo::Executing);
                
                // What? Oh, right, him. He's our prisoner. The crusher ...
                Guard.AI.Say(LocText("GRD_277_GARDIST_SITTINGORK_INFO_06_02"));
                DC(int64(0x644fef4c6a8cdea2), EConversationDebugInfo::Done);
                DC(int64(0x644fef4c6a8cdea3), EConversationDebugInfo::Executing);
                // Once it's fixed, we'll make him do some extra shifts. ...
                Guard.AI.Say(LocText("GRD_277_GARDIST_SITTINGORK_INFO_06_03"));
                DC(int64(0x644fef4c6a8cdea3), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceGrd277GardistWorkingork : UTopic_Hero__OM_GRD_GUARD12_277
        {
            default DebugId = int64(0x644fef4c6a8cdea4);
            default Caption = LocText("GRD_277_GARDIST_WORKINGORK_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceGrd277GardistWorkingork);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x644fef4c6a8cdea5), Quest::OldMine_OMCHAPTER2_IAN_GEARWHEEL != nullptr && Quest::OldMine_OMCHAPTER2_IAN_GEARWHEEL.HasSucceeded());
                }
                
                return Quest::OldMine_OMCHAPTER2_IAN_GEARWHEEL != nullptr && Quest::OldMine_OMCHAPTER2_IAN_GEARWHEEL.HasSucceeded();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x644fef4c6a8cdea6), EConversationDebugInfo::Executing);
                
                // Ah - you already fixed the crusher. 
                Hero.AI.Say(LocText("GRD_277_GARDIST_WORKINGORK_INFO_15_01"));
                DC(int64(0x644fef4c6a8cdea6), EConversationDebugInfo::Done);
                DC(int64(0x644fef4c6a8cdea7), EConversationDebugInfo::Executing);
                
                // Course we did. Gotta keep the place runnin' somehow ...
                Guard.AI.Say(LocText("GRD_277_GARDIST_WORKINGORK_INFO_06_02"));
                DC(int64(0x644fef4c6a8cdea7), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */