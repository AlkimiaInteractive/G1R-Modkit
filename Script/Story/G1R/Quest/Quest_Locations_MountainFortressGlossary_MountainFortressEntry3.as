#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_Locations_MountainFortressGlossary_MountainFortressEntry3 : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_Locations_MountainFortressGlossary;
            default bExternalStartTrigger = true;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasEverEnteredArea(GameplayTag::Area_MountainFortress_Keep_Interior_FirstFloor_Chambers_SecretRoom);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_MountainFortress, Document::UDocumentSegment_Glossary_MountainFortress_Entry3);
            }
        }
        
        
        UQuest_Locations_MountainFortressGlossary_MountainFortressEntry3 GetLocations_MountainFortressGlossary_MountainFortressEntry3() property
        {
            return Cast<UQuest_Locations_MountainFortressGlossary_MountainFortressEntry3>(UQuestSubsystem::Get().GetQuestByClass(UQuest_Locations_MountainFortressGlossary_MountainFortressEntry3::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */