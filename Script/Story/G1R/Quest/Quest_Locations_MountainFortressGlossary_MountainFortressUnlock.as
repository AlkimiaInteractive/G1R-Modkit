#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_Locations_MountainFortressGlossary_MountainFortressUnlock : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_Locations_MountainFortressGlossary;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldStart() const
            {
                return G1R != nullptr && G1R.HasReachedChapter(1);
            }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasEverEnteredArea(GameplayTag::Area_MountainFortress_Keep_Interior);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x0000006a), EConversationDebugInfo::Executing);
                Quest::Locations_MountainFortressGlossary_MountainFortressEntry2.StartQuest();
                DC(int64(0x0000006a), EConversationDebugInfo::Done);
                DC(int64(0x0000006b), EConversationDebugInfo::Executing);
                Quest::Locations_MountainFortressGlossary_MountainFortressEntry3.StartQuest();
                DC(int64(0x0000006b), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_MountainFortress, Document::UDocumentSegment_Glossary_MountainFortress_Unlock);
            }
        }
        
        
        UQuest_Locations_MountainFortressGlossary_MountainFortressUnlock GetLocations_MountainFortressGlossary_MountainFortressUnlock() property
        {
            return Cast<UQuest_Locations_MountainFortressGlossary_MountainFortressUnlock>(UQuestSubsystem::Get().GetQuestByClass(UQuest_Locations_MountainFortressGlossary_MountainFortressUnlock::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */