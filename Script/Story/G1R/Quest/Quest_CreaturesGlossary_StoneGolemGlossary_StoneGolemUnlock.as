#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary_StoneGolemGlossary_StoneGolemUnlock : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_CreaturesGlossary_StoneGolemGlossary;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldStart() const
            {
                return G1R != nullptr && G1R.HasReachedChapter(1);
            }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasKilledCharactersOfSpecies(GameplayTag::Species_Creature_Golem_Stone, 1);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000068), EConversationDebugInfo::Executing);
                Quest::CreaturesGlossary_StoneGolemGlossary_StoneGolemEntry2.StartQuest();
                DC(int64(0x00000068), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_StoneGolem, Document::UDocumentSegment_Glossary_StoneGolem_Unlock);
            }
        }
        
        
        UQuest_CreaturesGlossary_StoneGolemGlossary_StoneGolemUnlock GetCreaturesGlossary_StoneGolemGlossary_StoneGolemUnlock() property
        {
            return Cast<UQuest_CreaturesGlossary_StoneGolemGlossary_StoneGolemUnlock>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary_StoneGolemGlossary_StoneGolemUnlock::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */