#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SleeperTemple_STCHAPTER6_SLEEPER_SLEEPER_OBJ_KILL : UG1RQuest
        {
            default InvolvedCharacters.Add(n"SLEEPER");
            default ParentQuestClass = UQuest_SleeperTemple_STCHAPTER6_SLEEPER;
            default bSucceedParent = true;
            default NameText = "QUEST-SLEEPERTEMPLE_STCHAPTER6_SLEEPER_SLEEPER_OBJ_KILL-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetSLEEPER() const property { return GetCharacter(n"SLEEPER"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return SLEEPER != nullptr && SLEEPER.IsEveryoneOfThisKindDead();
            }
        }
        
        
        UQuest_SleeperTemple_STCHAPTER6_SLEEPER_SLEEPER_OBJ_KILL GetSleeperTemple_STCHAPTER6_SLEEPER_SLEEPER_OBJ_KILL() property
        {
            return Cast<UQuest_SleeperTemple_STCHAPTER6_SLEEPER_SLEEPER_OBJ_KILL>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SleeperTemple_STCHAPTER6_SLEEPER_SLEEPER_OBJ_KILL::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */