#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_Locations_MountainFortressGlossary_MountainFortressEntry2 : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_Locations_MountainFortressGlossary;
            default bExternalStartTrigger = true;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasEverEnteredArea(GameplayTag::Area_MountainFortress_Keep_Interior_Hall);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_MountainFortress, Document::UDocumentSegment_Glossary_MountainFortress_Entry2);
            }
        }
        
        
        UQuest_Locations_MountainFortressGlossary_MountainFortressEntry2 GetLocations_MountainFortressGlossary_MountainFortressEntry2() property
        {
            return Cast<UQuest_Locations_MountainFortressGlossary_MountainFortressEntry2>(UQuestSubsystem::Get().GetQuestByClass(UQuest_Locations_MountainFortressGlossary_MountainFortressEntry2::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */