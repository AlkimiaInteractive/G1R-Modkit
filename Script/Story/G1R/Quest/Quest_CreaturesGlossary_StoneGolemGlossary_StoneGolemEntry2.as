#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary_StoneGolemGlossary_StoneGolemEntry2 : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_CreaturesGlossary_StoneGolemGlossary;
            default bExternalStartTrigger = true;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasKilledCharactersOfSpecies(GameplayTag::Species_Creature_Golem_Stone, 1);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_StoneGolem, Document::UDocumentSegment_Glossary_StoneGolem_Entry2);
            }
        }
        
        
        UQuest_CreaturesGlossary_StoneGolemGlossary_StoneGolemEntry2 GetCreaturesGlossary_StoneGolemGlossary_StoneGolemEntry2() property
        {
            return Cast<UQuest_CreaturesGlossary_StoneGolemGlossary_StoneGolemEntry2>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary_StoneGolemGlossary_StoneGolemEntry2::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */