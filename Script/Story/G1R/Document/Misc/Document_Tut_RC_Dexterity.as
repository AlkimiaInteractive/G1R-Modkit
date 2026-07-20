#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Tut_RC_Dexterity_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Tut_RC_Dexterity;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_141147"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_141401"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_141408"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_141449"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_141504"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_141513"));
            }
        }
        
        
        class UDocument_Tut_RC_Dexterity : UGlossaryTutorialsDocument
        {
            default AddedSegments.Add(UDocumentSegment_Tut_RC_Dexterity_Initial);
            default Title = "TEXT_WIP_FBBFEBC_20260204_141127";
            default m_SortOrder = 501;
            default Metadata.Add(n"SortOrder", "501");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Tut_RC_Dexterity : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Tut_RC_Dexterity;
        }
    }
}
#endif /* WITH_STORY_G1R */