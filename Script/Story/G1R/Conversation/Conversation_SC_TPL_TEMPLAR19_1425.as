#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_SC_TPL_TEMPLAR19_1425 : UConversationCharacterSettings
        {
            default ForCharacter = n"SC_TPL_TEMPLAR19_1425";
        }
        
        
        class UTopic_Hero__SC_TPL_TEMPLAR19_1425 : UG1RDialogTopic
        {
            default ForCharacter = n"SC_TPL_TEMPLAR19_1425";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetTemplar19() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetBalor() const property
            {
                return GetCharacter(n"SC_NOV_BALOR_1304");
            }
            
            AGothicCharacterState GetJoru() const property
            {
                return GetCharacter(n"SC_NOV_JORU_1305");
            }
            
            AGothicCharacterState GetViran() const property
            {
                return GetCharacter(n"SC_NOV_VIRAN_1302");
            }
        }
        
        
        class UChoiceTemplar19138859 : UTopic_Hero__SC_TPL_TEMPLAR19_1425
        {
            default DebugId = int64(0xc12f5e6a17d0acd6);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc12f5e6a17d0acd5), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xc12f5e6a17d0acd5), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceTemplar19138875 : UTopic_Hero__SC_TPL_TEMPLAR19_1425
        {
            default DebugId = int64(0xc12f5e6a17d0acda);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceTemplar19138875);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xc12f5e6a17d0acde), Hero != nullptr && Hero.IsInConversation());
                    DB(int64(0xc12f5e6a17d0acf7), Quest::SwampCamp_SCCHAPTER3_KALOMEXPERIMENTS != nullptr && Quest::SwampCamp_SCCHAPTER3_KALOMEXPERIMENTS.IsRunning());
                    DB(int64(0x56a4a1bf16980ed8), Quest::SwampCamp_SCCHAPTER3_KALOMEXPERIMENTS_KALOMEXPERIMENTS_OBJ_MEETVIRAN != nullptr && Quest::SwampCamp_SCCHAPTER3_KALOMEXPERIMENTS_KALOMEXPERIMENTS_OBJ_MEETVIRAN.HasSucceeded());
                }
                
                if (Hero != nullptr && !Hero.IsInConversation())
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER3_KALOMEXPERIMENTS != nullptr && !Quest::SwampCamp_SCCHAPTER3_KALOMEXPERIMENTS.IsRunning())
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER3_KALOMEXPERIMENTS_KALOMEXPERIMENTS_OBJ_MEETVIRAN != nullptr && !Quest::SwampCamp_SCCHAPTER3_KALOMEXPERIMENTS_KALOMEXPERIMENTS_OBJ_MEETVIRAN.HasSucceeded())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc12f5e6a17d0acd9), EConversationDebugInfo::Executing);
                // What do you- Wait. You're the imposter!
                Templar19.AI.Say(LocText("TEXT_WIP_ENPRNBE_20250114_110807_2083"));
                DC(int64(0xc12f5e6a17d0acd9), EConversationDebugInfo::Done);
                DC(int64(0xc12f5e6a17d0acdf), EConversationDebugInfo::Executing);
                
                // You see it too? Don't you?
                Hero.AI.Say(LocText("TEXT_WIP_ENPRNBE_20250114_111227"));
                DC(int64(0xc12f5e6a17d0acdf), EConversationDebugInfo::Done);
                DC(int64(0xc12f5e6a17d0ace0), EConversationDebugInfo::Executing);
                
                // See what? What are you on about?
                Templar19.AI.Say(LocText("TEXT_WIP_ENPRNBE_20250114_111230"));
                DC(int64(0xc12f5e6a17d0ace0), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Templar19_138900,
                    UTopic_Templar19_138920,
                    UTopic_Templar19_138955,
                    UTopic_Templar19_138975
                );
            }
        }
        
        
        class UTopic_Templar19_138900 : UTopic_Hero__SC_TPL_TEMPLAR19_1425
        {
            default DebugId = int64(0xc12f5e6a17d0ace2);
            default Caption = LocText("TEXT_WIP_ENPRNBE_20250114_111624_1924");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Templar19_138900);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc12f5e6a17d0ace3), EConversationDebugInfo::Executing);
                // Cor Kalom is a catastrophe waiting to happen. 
                Hero.AI.Say(LocText("TEXT_WIP_ENPRNBE_20250114_111624_1924"));
                DC(int64(0xc12f5e6a17d0ace3), EConversationDebugInfo::Done);
                DC(int64(0xc12f5e6a17d0acea), EConversationDebugInfo::Executing);
                
                // ... He's the Sleeper's chosen. Y'Berion was too weak, ...
                Templar19.AI.Say(LocText("TEXT_WIP_ENPRNBE_20250114_111656"));
                DC(int64(0xc12f5e6a17d0acea), EConversationDebugInfo::Done);
                DC(int64(0xed7a42cc531a1888), EConversationDebugInfo::Executing);
                
                // Do you actually believe that? 
                Hero.AI.Say(LocText("TEXT_WIP_GPPCYMI_20250127_154049"));
                DC(int64(0xed7a42cc531a1888), EConversationDebugInfo::Done);
                DC(int64(0xed7a42cc531a1889), EConversationDebugInfo::Executing);
                
                // I do. What's the meaning of this, anyway? Why are you ...
                Templar19.AI.Say(LocText("TEXT_WIP_GPPCYMI_20250127_154116"));
                DC(int64(0xed7a42cc531a1889), EConversationDebugInfo::Done);
                DC(int64(0xbb03bf33cc7222c5), EConversationDebugInfo::Executing);
                G1R.GuardDistraction += 1;
                DC(int64(0xbb03bf33cc7222c5), EConversationDebugInfo::Done);
                DB(int64(0xbb03bf33cc7222c7), G1R.GuardDistraction == 1);
                DB(int64(0xbb03bf33cc7222cc), G1R.GuardDistraction == 3);
                
                if (G1R.GuardDistraction == 1)
                {
                    DC(int64(0xed7a42cc531a188a), EConversationDebugInfo::Executing);
                    // They need more time ...
                    Hero.AI.Say(LocText("TEXT_WIP_GPPCYMI_20250127_154153"));
                    DC(int64(0xed7a42cc531a188a), EConversationDebugInfo::Done);
                    DC(int64(0xed7a42cc531a188b), EConversationDebugInfo::Executing);
                    
                    // What?
                    Templar19.AI.Say(LocText("TEXT_WIP_GPPCYMI_20250127_154204"));
                    DC(int64(0xed7a42cc531a188b), EConversationDebugInfo::Done);
                    DC(int64(0xbb03bf33cc7222c8), EConversationDebugInfo::Executing);
                    
                    // Nothing. As I was saying ... 
                    Hero.AI.Say(LocText("TEXT_WIP_ENPRNBE_20250114_113534"));
                    DC(int64(0xbb03bf33cc7222c8), EConversationDebugInfo::Done);
                    DC(int64(0xbb03bf33cc7222d0), EConversationDebugInfo::Executing);
                    if (ensure(IsValid(Balor))) { Balor.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Balor_1304_Escape); }
                    DC(int64(0xbb03bf33cc7222d0), EConversationDebugInfo::Done);
                    DC(int64(0xbb03bf33cc7222d2), EConversationDebugInfo::Executing);
                    if (ensure(IsValid(Viran))) { Viran.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Viran_1302_Escape); }
                    DC(int64(0xbb03bf33cc7222d2), EConversationDebugInfo::Done);
                    DC(int64(0xbb03bf33cc7222d4), EConversationDebugInfo::Executing);
                    if (ensure(IsValid(Joru))) { Joru.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Joru_1305_Escape); }
                    DC(int64(0xbb03bf33cc7222d4), EConversationDebugInfo::Done);
                    DC(int64(0xbb03bf33cc7222e4), EConversationDebugInfo::Executing);
                    UWorldPointManager::Get().CallGlobalEvent(n"OnKalomExperimentsEscape");
                    DC(int64(0xbb03bf33cc7222e4), EConversationDebugInfo::Done);
                    DC(int64(0xbb03bf33cc7222d5), EConversationDebugInfo::Executing);
                    ReturnToLastSelection(1);
                    DC(int64(0xbb03bf33cc7222d5), EConversationDebugInfo::Done);
                }
                else if (G1R.GuardDistraction == 3)
                {
                    DC(int64(0xed7a42cc531a9e5f), EConversationDebugInfo::Executing);
                    // That should do the trick.
                    Hero.AI.Say(LocText("TEXT_WIP_GPPCYMI_20250127_154526"));
                    DC(int64(0xed7a42cc531a9e5f), EConversationDebugInfo::Done);
                    DC(int64(0xed7a42cc531a9e60), EConversationDebugInfo::Executing);
                    
                    // Trick for what?
                    Templar19.AI.Say(LocText("TEXT_WIP_GPPCYMI_20250127_154526_3984"));
                    DC(int64(0xed7a42cc531a9e60), EConversationDebugInfo::Done);
                    DC(int64(0xed7a42cc531a9e61), EConversationDebugInfo::Executing);
                    
                    // Nothing. Good talking to you. 
                    Hero.AI.Say(LocText("TEXT_WIP_GPPCYMI_20250127_154550"));
                    DC(int64(0xed7a42cc531a9e61), EConversationDebugInfo::Done);
                    DC(int64(0xed7a42cc531a9e62), EConversationDebugInfo::Executing);
                    
                    // ... Bloody lunatic. You should be glad I didn't cut you ...
                    Templar19.AI.Say(LocText("TEXT_WIP_GPPCYMI_20250127_154556"));
                    DC(int64(0xed7a42cc531a9e62), EConversationDebugInfo::Done);
                    DC(int64(0xbb03bf33cc7222cb), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xbb03bf33cc7222cb), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0xbb03bf33cc7222ca), EConversationDebugInfo::Executing);
                    ReturnToLastSelection(1);
                    DC(int64(0xbb03bf33cc7222ca), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UTopic_Templar19_138920 : UTopic_Hero__SC_TPL_TEMPLAR19_1425
        {
            default DebugId = int64(0xc12f5e6a17d0ace6);
            default Caption = LocText("TEXT_WIP_ENPRNBE_20250114_111624_3436");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Templar19_138920);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc12f5e6a17d0ace7), EConversationDebugInfo::Executing);
                // You feel that you've gone too far. Those rumors about ...
                Hero.AI.Say(LocText("TEXT_WIP_ENPRNBE_20250114_111624_3436"));
                DC(int64(0xc12f5e6a17d0ace7), EConversationDebugInfo::Done);
                DC(int64(0xed7a42cc531a9e5a), EConversationDebugInfo::Executing);
                // This isn't the Brotherhood you joined anymore. 
                Hero.AI.Say(LocText("TEXT_WIP_GPPCYMI_20250127_154336"));
                DC(int64(0xed7a42cc531a9e5a), EConversationDebugInfo::Done);
                DC(int64(0xc12f5e6a17d0acf3), EConversationDebugInfo::Executing);
                
                // He's doing what's necessary. Not to mention that it's an ...
                Templar19.AI.Say(LocText("TEXT_WIP_ENPRNBE_20250114_111935"));
                DC(int64(0xc12f5e6a17d0acf3), EConversationDebugInfo::Done);
                DC(int64(0xed7a42cc531a9e5b), EConversationDebugInfo::Executing);
                // He will make us more than human. I can feel it in my ...
                Templar19.AI.Say(LocText("TEXT_WIP_GPPCYMI_20250127_154418"));
                DC(int64(0xed7a42cc531a9e5b), EConversationDebugInfo::Done);
                DC(int64(0x2031e423e932b15), EConversationDebugInfo::Executing);
                G1R.GuardDistraction += 1;
                DC(int64(0x2031e423e932b15), EConversationDebugInfo::Done);
                DB(int64(0x2031e423e932b1b), G1R.GuardDistraction == 1);
                DB(int64(0x2031e423e932b20), G1R.GuardDistraction == 3);
                
                if (G1R.GuardDistraction == 1)
                {
                    DC(int64(0xed7a42cc531a9e63), EConversationDebugInfo::Executing);
                    // Gotta buy them more time ...
                    Hero.AI.Say(LocText("TEXT_WIP_GPPCYMI_20250127_154631"));
                    DC(int64(0xed7a42cc531a9e63), EConversationDebugInfo::Done);
                    DC(int64(0xed7a42cc531a9e64), EConversationDebugInfo::Executing);
                    
                    // Are you speaking to yourself? What's wrong with you, ...
                    Templar19.AI.Say(LocText("TEXT_WIP_GPPCYMI_20250127_154631_1609"));
                    DC(int64(0xed7a42cc531a9e64), EConversationDebugInfo::Done);
                    DC(int64(0xed7a42cc531a9e65), EConversationDebugInfo::Executing);
                    
                    // Just thinking out loud. I have more to tell you. 
                    Hero.AI.Say(LocText("TEXT_WIP_GPPCYMI_20250127_154707"));
                    DC(int64(0xed7a42cc531a9e65), EConversationDebugInfo::Done);
                    DC(int64(0x2031e423e932b22), EConversationDebugInfo::Executing);
                    if (ensure(IsValid(Balor))) { Balor.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Balor_1304_Escape); }
                    DC(int64(0x2031e423e932b22), EConversationDebugInfo::Done);
                    DC(int64(0x2031e423e932b30), EConversationDebugInfo::Executing);
                    if (ensure(IsValid(Viran))) { Viran.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Viran_1302_Escape); }
                    DC(int64(0x2031e423e932b30), EConversationDebugInfo::Done);
                    DC(int64(0x2031e423e932b32), EConversationDebugInfo::Executing);
                    if (ensure(IsValid(Joru))) { Joru.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Joru_1305_Escape); }
                    DC(int64(0x2031e423e932b32), EConversationDebugInfo::Done);
                    DC(int64(0x2031e423e932b34), EConversationDebugInfo::Executing);
                    UWorldPointManager::Get().CallGlobalEvent(n"OnKalomExperimentsEscape");
                    DC(int64(0x2031e423e932b34), EConversationDebugInfo::Done);
                    DC(int64(0x2031e423e932b28), EConversationDebugInfo::Executing);
                    ReturnToLastSelection(1);
                    DC(int64(0x2031e423e932b28), EConversationDebugInfo::Done);
                }
                else if (G1R.GuardDistraction == 3)
                {
                    DC(int64(0x2031e423e932b41), EConversationDebugInfo::Executing);
                    // That should do the trick.
                    Hero.AI.Say(LocText("TEXT_WIP_GPPCYMI_20250127_154526"));
                    DC(int64(0x2031e423e932b41), EConversationDebugInfo::Done);
                    DC(int64(0x2031e423e932b42), EConversationDebugInfo::Executing);
                    
                    // Trick for what?
                    Templar19.AI.Say(LocText("TEXT_WIP_GPPCYMI_20250127_154526_3984"));
                    DC(int64(0x2031e423e932b42), EConversationDebugInfo::Done);
                    DC(int64(0x8bcc06647a5cce36), EConversationDebugInfo::Executing);
                    
                    // Nothing. Good talking to you. 
                    Hero.AI.Say(LocText("TEXT_WIP_GPPCYMI_20250127_154550"));
                    DC(int64(0x8bcc06647a5cce36), EConversationDebugInfo::Done);
                    DC(int64(0x8bcc06647a5cce37), EConversationDebugInfo::Executing);
                    
                    // ... Bloody lunatic. You should be glad I didn't cut you ...
                    Templar19.AI.Say(LocText("TEXT_WIP_GPPCYMI_20250127_154556"));
                    DC(int64(0x8bcc06647a5cce37), EConversationDebugInfo::Done);
                    DC(int64(0x2031e423e932b5b), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x2031e423e932b5b), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0x2031e423e932b23), EConversationDebugInfo::Executing);
                    ReturnToLastSelection(1);
                    DC(int64(0x2031e423e932b23), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UTopic_Templar19_138955 : UTopic_Hero__SC_TPL_TEMPLAR19_1425
        {
            default DebugId = int64(0xc12f5e6a17d0aceb);
            default Caption = LocText("TEXT_WIP_ENPRNBE_20250114_111835_3286");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Templar19_138955);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc12f5e6a17d0acec), EConversationDebugInfo::Executing);
                // What if Cor Angar is right? Y'Berion saw the Sleeper, ...
                Hero.AI.Say(LocText("TEXT_WIP_ENPRNBE_20250114_111835_3286"));
                DC(int64(0xc12f5e6a17d0acec), EConversationDebugInfo::Done);
                DC(int64(0xc12f5e6a17d0acf4), EConversationDebugInfo::Executing);
                
                // ... Thin ice, stranger. Thin ice. 
                Templar19.AI.Say(LocText("TEXT_WIP_ENPRNBE_20250114_112004"));
                DC(int64(0xc12f5e6a17d0acf4), EConversationDebugInfo::Done);
                DC(int64(0x2031e423e932b17), EConversationDebugInfo::Executing);
                G1R.GuardDistraction += 1;
                DC(int64(0x2031e423e932b17), EConversationDebugInfo::Done);
                DB(int64(0x2031e423e932b1d), G1R.GuardDistraction == 1);
                DB(int64(0x2031e423e932b24), G1R.GuardDistraction == 3);
                
                if (G1R.GuardDistraction == 1)
                {
                    DC(int64(0x8bcc06647a5cce33), EConversationDebugInfo::Executing);
                    // ... More ... 
                    Hero.AI.Say(LocText("TEXT_WIP_GPPCYMI_20250127_155132"));
                    DC(int64(0x8bcc06647a5cce33), EConversationDebugInfo::Done);
                    DC(int64(0x8bcc06647a5cce34), EConversationDebugInfo::Executing);
                    
                    // What's it with the mumbling? Speak like a man, or don't ...
                    Templar19.AI.Say(LocText("TEXT_WIP_GPPCYMI_20250127_155132_41"));
                    DC(int64(0x8bcc06647a5cce34), EConversationDebugInfo::Done);
                    DC(int64(0x8bcc06647a5cce35), EConversationDebugInfo::Executing);
                    
                    // Sure. Listen, though ... 
                    Hero.AI.Say(LocText("TEXT_WIP_GPPCYMI_20250127_155210"));
                    DC(int64(0x8bcc06647a5cce35), EConversationDebugInfo::Done);
                    DC(int64(0x2031e423e932b27), EConversationDebugInfo::Executing);
                    if (ensure(IsValid(Viran))) { Viran.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Viran_1302_Escape); }
                    DC(int64(0x2031e423e932b27), EConversationDebugInfo::Done);
                    DC(int64(0x2031e423e932b36), EConversationDebugInfo::Executing);
                    if (ensure(IsValid(Balor))) { Balor.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Balor_1304_Escape); }
                    DC(int64(0x2031e423e932b36), EConversationDebugInfo::Done);
                    DC(int64(0x2031e423e932b38), EConversationDebugInfo::Executing);
                    if (ensure(IsValid(Joru))) { Joru.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Joru_1305_Escape); }
                    DC(int64(0x2031e423e932b38), EConversationDebugInfo::Done);
                    DC(int64(0x2031e423e932b3a), EConversationDebugInfo::Executing);
                    UWorldPointManager::Get().CallGlobalEvent(n"OnKalomExperimentsEscape");
                    DC(int64(0x2031e423e932b3a), EConversationDebugInfo::Done);
                    DC(int64(0x2031e423e932b29), EConversationDebugInfo::Executing);
                    ReturnToLastSelection(1);
                    DC(int64(0x2031e423e932b29), EConversationDebugInfo::Done);
                }
                else if (G1R.GuardDistraction == 3)
                {
                    DC(int64(0x2031e423e932b43), EConversationDebugInfo::Executing);
                    // That should do the trick.
                    Hero.AI.Say(LocText("TEXT_WIP_GPPCYMI_20250127_154526"));
                    DC(int64(0x2031e423e932b43), EConversationDebugInfo::Done);
                    DC(int64(0x2031e423e932b44), EConversationDebugInfo::Executing);
                    
                    // Trick for what?
                    Templar19.AI.Say(LocText("TEXT_WIP_GPPCYMI_20250127_154526_3984"));
                    DC(int64(0x2031e423e932b44), EConversationDebugInfo::Done);
                    DC(int64(0x8bcc06647a5cce38), EConversationDebugInfo::Executing);
                    
                    // Nothing. Good talking to you. 
                    Hero.AI.Say(LocText("TEXT_WIP_GPPCYMI_20250127_154550"));
                    DC(int64(0x8bcc06647a5cce38), EConversationDebugInfo::Done);
                    DC(int64(0x8bcc06647a5cce39), EConversationDebugInfo::Executing);
                    
                    // ... Bloody lunatic. You should be glad I didn't cut you ...
                    Templar19.AI.Say(LocText("TEXT_WIP_GPPCYMI_20250127_154556"));
                    DC(int64(0x8bcc06647a5cce39), EConversationDebugInfo::Done);
                    DC(int64(0x2031e423e932b5a), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x2031e423e932b5a), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0x2031e423e932b25), EConversationDebugInfo::Executing);
                    ReturnToLastSelection(1);
                    DC(int64(0x2031e423e932b25), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UTopic_Templar19_138975 : UTopic_Hero__SC_TPL_TEMPLAR19_1425
        {
            default DebugId = int64(0xc12f5e6a17d0acef);
            default Caption = LocText("TEXT_WIP_ENPRNBE_20250114_111836_686");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Templar19_138975);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc12f5e6a17d0acf0), EConversationDebugInfo::Executing);
                // What if the Sleeper isn't real at all? 
                Hero.AI.Say(LocText("TEXT_WIP_ENPRNBE_20250114_111836_686"));
                DC(int64(0xc12f5e6a17d0acf0), EConversationDebugInfo::Done);
                DC(int64(0x8bcc06647a5cce3a), EConversationDebugInfo::Executing);
                
                // I'm sorry? 
                Templar19.AI.Say(LocText("TEXT_WIP_GPPCYMI_20250127_155458"));
                DC(int64(0x8bcc06647a5cce3a), EConversationDebugInfo::Done);
                DC(int64(0x8bcc06647a5cce3b), EConversationDebugInfo::Executing);
                
                // Well, all that swampweed, all those potions ... what if ...
                Hero.AI.Say(LocText("TEXT_WIP_GPPCYMI_20250127_155500"));
                DC(int64(0x8bcc06647a5cce3b), EConversationDebugInfo::Done);
                DC(int64(0xc12f5e6a17d0acf5), EConversationDebugInfo::Executing);
                
                // You're either very brave or very stupid to say this to ...
                Templar19.AI.Say(LocText("TEXT_WIP_ENPRNBE_20250114_112050"));
                DC(int64(0xc12f5e6a17d0acf5), EConversationDebugInfo::Done);
                DC(int64(0x8bcc06647a5cce3c), EConversationDebugInfo::Executing);
                // Just because something isn't there doesn't mean it isn't ...
                Templar19.AI.Say(LocText("TEXT_WIP_GPPCYMI_20250127_155625"));
                DC(int64(0x8bcc06647a5cce3c), EConversationDebugInfo::Done);
                DC(int64(0x2031e423e932b19), EConversationDebugInfo::Executing);
                G1R.GuardDistraction += 1;
                DC(int64(0x2031e423e932b19), EConversationDebugInfo::Done);
                DB(int64(0x2031e423e932b1f), G1R.GuardDistraction == 1);
                DB(int64(0x2031e423e932b2a), G1R.GuardDistraction == 3);
                
                if (G1R.GuardDistraction == 1)
                {
                    DC(int64(0xdf75a9f74dbb7e3e), EConversationDebugInfo::Executing);
                    // Just a little longer ...
                    Hero.AI.Say(LocText("TEXT_WIP_GPPCYMI_20250127_155801"));
                    DC(int64(0xdf75a9f74dbb7e3e), EConversationDebugInfo::Done);
                    DC(int64(0xdf75a9f74dbb7e3f), EConversationDebugInfo::Executing);
                    
                    // How about you quit babbling like a drugged madman and ...
                    Templar19.AI.Say(LocText("TEXT_WIP_GPPCYMI_20250127_155801_41"));
                    DC(int64(0xdf75a9f74dbb7e3f), EConversationDebugInfo::Done);
                    DC(int64(0xdf75a9f74dbb7e40), EConversationDebugInfo::Executing);
                    
                    // I'm about to do just that. 
                    Hero.AI.Say(LocText("TEXT_WIP_GPPCYMI_20250127_155844"));
                    DC(int64(0xdf75a9f74dbb7e40), EConversationDebugInfo::Done);
                    DC(int64(0x2031e423e932b2c), EConversationDebugInfo::Executing);
                    if (ensure(IsValid(Viran))) { Viran.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Viran_1302_Escape); }
                    DC(int64(0x2031e423e932b2c), EConversationDebugInfo::Done);
                    DC(int64(0x2031e423e932b3c), EConversationDebugInfo::Executing);
                    if (ensure(IsValid(Balor))) { Balor.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Balor_1304_Escape); }
                    DC(int64(0x2031e423e932b3c), EConversationDebugInfo::Done);
                    DC(int64(0x2031e423e932b3e), EConversationDebugInfo::Executing);
                    if (ensure(IsValid(Joru))) { Joru.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Joru_1305_Escape); }
                    DC(int64(0x2031e423e932b3e), EConversationDebugInfo::Done);
                    DC(int64(0x2031e423e932b40), EConversationDebugInfo::Executing);
                    UWorldPointManager::Get().CallGlobalEvent(n"OnKalomExperimentsEscape");
                    DC(int64(0x2031e423e932b40), EConversationDebugInfo::Done);
                    DC(int64(0x2031e423e932b2e), EConversationDebugInfo::Executing);
                    ReturnToLastSelection(1);
                    DC(int64(0x2031e423e932b2e), EConversationDebugInfo::Done);
                }
                else if (G1R.GuardDistraction == 3)
                {
                    DC(int64(0x2031e423e932b45), EConversationDebugInfo::Executing);
                    // That should do the trick.
                    Hero.AI.Say(LocText("TEXT_WIP_GPPCYMI_20250127_154526"));
                    DC(int64(0x2031e423e932b45), EConversationDebugInfo::Done);
                    DC(int64(0x2031e423e932b46), EConversationDebugInfo::Executing);
                    
                    // Trick for what?
                    Templar19.AI.Say(LocText("TEXT_WIP_GPPCYMI_20250127_154526_3984"));
                    DC(int64(0x2031e423e932b46), EConversationDebugInfo::Done);
                    DC(int64(0xdf75a9f74dbb7e41), EConversationDebugInfo::Executing);
                    
                    // Nothing. Good talking to you. 
                    Hero.AI.Say(LocText("TEXT_WIP_GPPCYMI_20250127_154550"));
                    DC(int64(0xdf75a9f74dbb7e41), EConversationDebugInfo::Done);
                    DC(int64(0xdf75a9f74dbb7e43), EConversationDebugInfo::Executing);
                    
                    // ... Bloody lunatic. You should be glad I didn't cut you ...
                    Templar19.AI.Say(LocText("TEXT_WIP_GPPCYMI_20250127_154556"));
                    DC(int64(0xdf75a9f74dbb7e43), EConversationDebugInfo::Done);
                    DC(int64(0x2031e423e932b5c), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x2031e423e932b5c), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0x2031e423e932b2d), EConversationDebugInfo::Executing);
                    ReturnToLastSelection(1);
                    DC(int64(0x2031e423e932b2d), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UChoiceTemplar19152916 : UTopic_Hero__SC_TPL_TEMPLAR19_1425
        {
            default DebugId = int64(0xb8469cae0ce9bfb1);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceTemplar19152916);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xb8469cae0ce9bfb4), Quest::SwampCamp_SCCHAPTER3_KALOMEXPERIMENTS != nullptr && Quest::SwampCamp_SCCHAPTER3_KALOMEXPERIMENTS.IsRunning());
                    DB(int64(0xb8469cae0ce9bfb5), Hero != nullptr && Hero.IsCloseToCharacter(Templar19, 700.0f));
                }
                
                if (Quest::SwampCamp_SCCHAPTER3_KALOMEXPERIMENTS != nullptr && !Quest::SwampCamp_SCCHAPTER3_KALOMEXPERIMENTS.IsRunning())
                    return false;
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Templar19, 700.0f))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb8469cae0ce9bfb0), EConversationDebugInfo::Executing);
                // Hey! What's THAT guy doing here?
                Templar19.AI.Say(LocText("TEXT_WIP_JNXNLPG_20250211_151345_41"));
                DC(int64(0xb8469cae0ce9bfb0), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */