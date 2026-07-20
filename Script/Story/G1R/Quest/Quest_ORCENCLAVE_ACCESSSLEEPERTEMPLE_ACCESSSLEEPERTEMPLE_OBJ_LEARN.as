#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_OBJ_LEARN : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_ORCENCLAVE_ACCESSSLEEPERTEMPLE;
            default bIsOptional = true;
            default NameText = "QUEST-ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_OBJ_LEARN-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Master);
            }
        }
        
        
        UQuest_ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_OBJ_LEARN GetORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_OBJ_LEARN() property
        {
            return Cast<UQuest_ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_OBJ_LEARN>(UQuestSubsystem::Get().GetQuestByClass(UQuest_ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_OBJ_LEARN::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */