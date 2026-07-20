#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SCATTY_CHARGEKHARIM : UG1RQuest
        {
            default InvolvedCharacters.Add(n"OC_SLD_KHARIM_729");
            default InvolvedCharacters.Add(n"HERO");
            default bExternalStartTrigger = true;
            
            AGothicCharacterState GetKharim() const property { return GetCharacter(n"OC_SLD_KHARIM_729"); }
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Kharim != nullptr && Kharim.WasDefeatedBy(Hero);
            }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldFail() const
            {
                return Hero != nullptr && Hero.WasDefeatedBy(Kharim) && Quest::SCATTY_CHARGEKHARIM != nullptr && Quest::SCATTY_CHARGEKHARIM.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000004), EConversationDebugInfo::Executing);
                if (ensure(IsValid(G1R))) { G1R.OC_Test += 1; }
                DC(int64(0x00000004), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_SCATTY_CHARGEKHARIM GetSCATTY_CHARGEKHARIM() property
        {
            return Cast<UQuest_SCATTY_CHARGEKHARIM>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SCATTY_CHARGEKHARIM::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */