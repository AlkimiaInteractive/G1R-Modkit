#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_NC_SLD_MERCENARY01_702 : UConversationCharacterSettings
        {
            default ForCharacter = n"NC_SLD_MERCENARY01_702";
        }
        
        
        class UTopic_Hero__NC_SLD_MERCENARY01_702 : UG1RDialogTopic
        {
            default ForCharacter = n"NC_SLD_MERCENARY01_702";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetMercenary() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceSld702Exit : UTopic_Hero__NC_SLD_MERCENARY01_702
        {
            default DebugId = int64(0x3897c6b33fe598e3);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3897c6b33fe598e4), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x3897c6b33fe598e4), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceSld702First : UTopic_Hero__NC_SLD_MERCENARY01_702
        {
            default DebugId = int64(0x3897c6b33fe598e5);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceSld702First);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x3897c6b33fe598e6), Mercenary != nullptr && Mercenary.IsCloseToCharacter(Hero, 200.0f));
                }
                
                return Mercenary != nullptr && Mercenary.IsCloseToCharacter(Hero, 200.0f);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3897c6b33fe598e7), EConversationDebugInfo::Executing);
                // Stop right there. You know who's in there?
                Mercenary.AI.Say(LocText("DIA_SLD_702_FIRST_04_00"));
                DC(int64(0x3897c6b33fe598e7), EConversationDebugInfo::Done);
                DC(int64(0x3897c6b33fe598e8), EConversationDebugInfo::Executing);
                
                // I guess you're about to tell me.
                Hero.AI.Say(LocText("DIA_SLD_702_FIRST_15_01"));
                DC(int64(0x3897c6b33fe598e8), EConversationDebugInfo::Done);
                DC(int64(0x3897c6b33fe598e9), EConversationDebugInfo::Executing);
                
                // General Lee. He's our boss, so show him some respect. 
                Mercenary.AI.Say(LocText("DIA_SLD_702_FIRST_04_02"));
                DC(int64(0x3897c6b33fe598e9), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceSld702Perm : UTopic_Hero__NC_SLD_MERCENARY01_702
        {
            default DebugId = int64(0x3897c6b33fe598ea);
            default Caption = LocText("DIA_SLD_702_PERM_15_00");
            default PriorityRank = 1;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3897c6b33fe598eb), EConversationDebugInfo::Executing);
                
                // What do I have to do so you'll let me through?
                Hero.AI.Say(LocText("DIA_SLD_702_PERM_15_00"));
                DC(int64(0x3897c6b33fe598eb), EConversationDebugInfo::Done);
                DC(int64(0x3897c6b33fe598ec), EConversationDebugInfo::Executing);
                
                // Nothing. 
                Mercenary.AI.Say(LocText("DIA_SLD_702_PERM_04_01"));
                DC(int64(0x3897c6b33fe598ec), EConversationDebugInfo::Done);
                DC(int64(0x3897c6b33fe598ed), EConversationDebugInfo::Executing);
                // This ain't the Old Camp, and Lee ain't Gomez.
                Mercenary.AI.Say(LocText("DIA_SLD_702_PERM_04_02"));
                DC(int64(0x3897c6b33fe598ed), EConversationDebugInfo::Done);
                DC(int64(0x3897c6b33fe598ee), EConversationDebugInfo::Executing);
                // He doesn't need an army of goons to hide behind, because ...
                Mercenary.AI.Say(LocText("DIA_SLD_702_PERM_04_03"));
                DC(int64(0x3897c6b33fe598ee), EConversationDebugInfo::Done);
                DC(int64(0x3897c6b33fe598ef), EConversationDebugInfo::Executing);
                // We're here just in case. 
                Mercenary.AI.Say(LocText("DIA_SLD_702_PERM_04_04"));
                DC(int64(0x3897c6b33fe598ef), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */