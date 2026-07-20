#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SCATTY_CHARGEGORHANIS : UG1RQuest
        {
            default InvolvedCharacters.Add(n"SC_TPL_GORHANIS_1422");
            default InvolvedCharacters.Add(n"HERO");
            default bExternalStartTrigger = true;
            
            AGothicCharacterState GetGorHanis() const property { return GetCharacter(n"SC_TPL_GORHANIS_1422"); }
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return GorHanis != nullptr && GorHanis.WasDefeatedBy(Hero);
            }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldFail() const
            {
                return Hero != nullptr && Hero.WasDefeatedBy(GorHanis) && Quest::SCATTY_CHARGEGORHANIS != nullptr && Quest::SCATTY_CHARGEGORHANIS.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000009), EConversationDebugInfo::Executing);
                if (ensure(IsValid(G1R))) { G1R.OC_Test += 1; }
                DC(int64(0x00000009), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_SCATTY_CHARGEGORHANIS GetSCATTY_CHARGEGORHANIS() property
        {
            return Cast<UQuest_SCATTY_CHARGEGORHANIS>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SCATTY_CHARGEGORHANIS::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */