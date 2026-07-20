#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER1_CONVOY : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default InvolvedCharacters.Add(n"NC_ORG_WEDGE_850");
            default InvolvedCharacters.Add(n"NC_ORG_BUTCH_851");
            default InvolvedCharacters.Add(n"NC_ORG_LARES_801");
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER1;
            default bExternalStartTrigger = true;
            default bExternalFailTrigger = true;
            default DescriptionText = "QUEST-NEWCAMP_NCCHAPTER1_CONVOY-DESCRIPTION";
            default NameText = "QUEST-NEWCAMP_NCCHAPTER1_CONVOY-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH1_CONVOY;
            default QuestKind = EQuestKind::Main;
            default QuestGiverCharacterUniqueName = n"NC_ORG_LARES_801";
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            AGothicCharacterState GetWedge() const property { return GetCharacter(n"NC_ORG_WEDGE_850"); }
            AGothicCharacterState GetButch() const property { return GetCharacter(n"NC_ORG_BUTCH_851"); }
            AGothicCharacterState GetLares() const property { return GetCharacter(n"NC_ORG_LARES_801"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000018), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_NC_CONVOY_COMPLETE);
                DC(int64(0x00000018), EConversationDebugInfo::Done);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestFailed() 
            {
                DC(int64(0x00000019), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Wedge))) { Wedge.SetRelationshipTowards(Hero, ERelationship::Angry); }
                DC(int64(0x00000019), EConversationDebugInfo::Done);
                DC(int64(0x0000001a), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Butch))) { Butch.SetRelationshipTowards(Hero, ERelationship::Angry); }
                DC(int64(0x0000001a), EConversationDebugInfo::Done);
                DC(int64(0x0000001b), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Lares))) { Lares.SetRelationshipTowards(Hero, ERelationship::Angry); }
                DC(int64(0x0000001b), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_NewCamp_NCCHAPTER1_CONVOY GetNewCamp_NCCHAPTER1_CONVOY() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER1_CONVOY>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER1_CONVOY::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */