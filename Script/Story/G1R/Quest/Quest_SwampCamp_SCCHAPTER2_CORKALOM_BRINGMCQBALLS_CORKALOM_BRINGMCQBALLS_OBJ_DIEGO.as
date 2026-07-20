#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_DIEGO : UG1RQuest
        {
            default ParentQuestClass = UQuest_SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-SWAMPCAMP_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_DIEGO-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_DIEGO GetSwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_DIEGO() property
        {
            return Cast<UQuest_SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_DIEGO>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_DIEGO::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */