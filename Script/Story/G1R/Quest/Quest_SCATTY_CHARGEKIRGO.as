#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SCATTY_CHARGEKIRGO : UG1RQuest
        {
            default InvolvedCharacters.Add(n"OC_GRD_KIRGO_251");
            default InvolvedCharacters.Add(n"HERO");
            default bExternalStartTrigger = true;
            
            AGothicCharacterState GetKirgo() const property { return GetCharacter(n"OC_GRD_KIRGO_251"); }
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Kirgo != nullptr && Kirgo.WasDefeatedBy(Hero);
            }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldFail() const
            {
                return Hero != nullptr && Hero.WasDefeatedBy(Kirgo) && Quest::SCATTY_CHARGEKIRGO != nullptr && Quest::SCATTY_CHARGEKIRGO.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000010), EConversationDebugInfo::Executing);
                if (ensure(IsValid(G1R))) { G1R.OC_Test += 1; }
                DC(int64(0x00000010), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_SCATTY_CHARGEKIRGO GetSCATTY_CHARGEKIRGO() property
        {
            return Cast<UQuest_SCATTY_CHARGEKIRGO>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SCATTY_CHARGEKIRGO::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */