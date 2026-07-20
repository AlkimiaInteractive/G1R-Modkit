#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Tut_MC_DodgeRoll_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Tut_MC_DodgeRoll;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_123944"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_123956"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_124003"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_124008"));
            }
        }
        
        
        class UDocument_Tut_MC_DodgeRoll : UGlossaryTutorialsDocument
        {
            default AddedSegments.Add(UDocumentSegment_Tut_MC_DodgeRoll_Initial);
            default Title = "TEXT_WIP_FBBFEBC_20260204_123925";
            default m_SortOrder = 405;
            default Metadata.Add(n"SortOrder", "405");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Tut_MC_DodgeRoll : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Tut_MC_DodgeRoll;
        }
    }
}
#endif /* WITH_STORY_G1R */