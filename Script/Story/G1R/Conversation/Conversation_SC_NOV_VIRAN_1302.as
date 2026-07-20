#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_SC_NOV_VIRAN_1302 : UConversationCharacterSettings
        {
            default ForCharacter = n"SC_NOV_VIRAN_1302";
        }
        
        
        class UTopic_Hero__SC_NOV_VIRAN_1302 : UG1RDialogTopic
        {
            default ForCharacter = n"SC_NOV_VIRAN_1302";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetViran() const property
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
            
            AGothicCharacterState GetTemplar26() const property
            {
                return GetCharacter(n"SC_TPL_TEMPLAR26_1443N");
            }
            
            AGothicCharacterState GetTemplar27() const property
            {
                return GetCharacter(n"SC_TPL_TEMPLAR27_1444N");
            }
            
            AGothicCharacterState GetVIRAN_BLOODFLY() const property
            {
                return GetCharacter(n"VIRAN_BLOODFLY");
            }
        }
        
        
        class UTopic_SC_NOV_JORU_1305__SC_NOV_VIRAN_1302 : UG1RDialogTopic
        {
            default ForCharacter = n"SC_NOV_VIRAN_1302";
            default WithCharacter = n"SC_NOV_JORU_1305";
            
            AGothicCharacterState GetViran() const property
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
            
            AGothicCharacterState GetTemplar26() const property
            {
                return GetCharacter(n"SC_TPL_TEMPLAR26_1443N");
            }
            
            AGothicCharacterState GetTemplar27() const property
            {
                return GetCharacter(n"SC_TPL_TEMPLAR27_1444N");
            }
            
            AGothicCharacterState GetVIRAN_BLOODFLY() const property
            {
                return GetCharacter(n"VIRAN_BLOODFLY");
            }
        }
        
        
        class UChoiceViran137143 : UTopic_Hero__SC_NOV_VIRAN_1302
        {
            default DebugId = int64(0xf2936aaa9d819d92);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            default ForceSettings.RangeType = EConversationForceRangeType::DefaultRange;
            
            default Rules.HideIfKnows(UChoiceViran137143);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x464d7f73ef6cd2e6), Viran != nullptr && Viran.HasAssignedDailyRoutine(UDailyRoutine_SC_NOV_Viran_1302_CampDivided));
                }
                
                return Viran != nullptr && Viran.HasAssignedDailyRoutine(UDailyRoutine_SC_NOV_Viran_1302_CampDivided);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf2936aaa9d819d91), EConversationDebugInfo::Executing);
                // Bloody hell. YOU?
                Viran.AI.Say(LocText("TEXT_WIP_LNPRNBE_20250113_152823_41"));
                DC(int64(0xf2936aaa9d819d91), EConversationDebugInfo::Done);
                DC(int64(0xed7a42cc53190cd7), EConversationDebugInfo::Executing);
                
                // You sound surprised. 
                Hero.AI.Say(LocText("TEXT_WIP_GPPCYMI_20250127_150230"));
                DC(int64(0xed7a42cc53190cd7), EConversationDebugInfo::Done);
                DC(int64(0xed7a42cc53190cd8), EConversationDebugInfo::Executing);
                
                // Damn right I am. Didn't Kalom tell you to stay the fuck ...
                Viran.AI.Say(LocText("TEXT_WIP_GPPCYMI_20250127_150236"));
                DC(int64(0xed7a42cc53190cd8), EConversationDebugInfo::Done);
                DC(int64(0xf2936aaa9d819e13), EConversationDebugInfo::Executing);
                
                // They didn't seem to be paying attention.
                Hero.AI.Say(LocText("TEXT_WIP_LNPRNBE_20250113_153337"));
                DC(int64(0xf2936aaa9d819e13), EConversationDebugInfo::Done);
                DC(int64(0xed7a42cc53190cd9), EConversationDebugInfo::Executing);
                
                // ... Uh-huh. Well, I sure as hell ain't complainin'. I ...
                Viran.AI.Say(LocText("TEXT_WIP_GPPCYMI_20250127_150813"));
                DC(int64(0xed7a42cc53190cd9), EConversationDebugInfo::Done);
                DC(int64(0xed7a42cc53190cda), EConversationDebugInfo::Executing);
                
                // What is it? 
                Hero.AI.Say(LocText("TEXT_WIP_GPPCYMI_20250127_151302"));
                DC(int64(0xed7a42cc53190cda), EConversationDebugInfo::Done);
                DC(int64(0xf2936aaa9d819e14), EConversationDebugInfo::Executing);
                
                // Kalom. He's lost his bloody marbles. 
                Viran.AI.Say(LocText("TEXT_WIP_LNPRNBE_20250113_153354"));
                DC(int64(0xf2936aaa9d819e14), EConversationDebugInfo::Done);
                DC(int64(0xf2936aaa9d819e15), EConversationDebugInfo::Executing);
                // He asked to see me and me mate last night, and he made ...
                Viran.AI.Say(LocText("TEXT_WIP_LNPRNBE_20250113_153426"));
                DC(int64(0xf2936aaa9d819e15), EConversationDebugInfo::Done);
                DC(int64(0xf2936aaa9d819e16), EConversationDebugInfo::Executing);
                // They ... they killed me mate, Tahrin. The potion, I ...
                Viran.AI.Say(LocText("TEXT_WIP_LNPRNBE_20250113_153450"));
                DC(int64(0xf2936aaa9d819e16), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_NOV_VIRAN, Document::UDocumentSegment_Glossary_SC_NOV_VIRAN_CampDivided);
                Subdialog(
                    UTopic_Viran_146610,
                    UTopic_Viran_146959,
                    UTopic_Viran_146630
                );
            }
        }
        
        
        class UTopic_Viran_146610 : UTopic_Hero__SC_NOV_VIRAN_1302
        {
            default DebugId = int64(0xefdf552ce8e13ff1);
            default Caption = LocText("TEXT_WIP_FPPCYMI_20250124_160002_2785");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Viran_146610);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xefdf552ce8e13ff2), EConversationDebugInfo::Executing);
                // Why did you join up with him in the first place?
                Hero.AI.Say(LocText("TEXT_WIP_FPPCYMI_20250124_160002_2785"));
                DC(int64(0xefdf552ce8e13ff2), EConversationDebugInfo::Done);
                DC(int64(0xefdf552ce8e13ff9), EConversationDebugInfo::Executing);
                
                // 'Cause I was an idiot. Okay? It's just ... I didn't want ...
                Viran.AI.Say(LocText("TEXT_WIP_FPPCYMI_20250124_160029"));
                DC(int64(0xefdf552ce8e13ff9), EConversationDebugInfo::Done);
                DC(int64(0xefdf552ce8e13ffa), EConversationDebugInfo::Executing);
                // And yeah, I know he's been actin' strange since that ...
                Viran.AI.Say(LocText("TEXT_WIP_FPPCYMI_20250124_160044"));
                DC(int64(0xefdf552ce8e13ffa), EConversationDebugInfo::Done);
                DC(int64(0xefdf552ce8e13ffb), EConversationDebugInfo::Executing);
                // I just ain't seen it comin'. 
                Viran.AI.Say(LocText("TEXT_WIP_FPPCYMI_20250124_160058"));
                DC(int64(0xefdf552ce8e13ffb), EConversationDebugInfo::Done);
                DC(int64(0xefdf552ce8e13ff4), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xefdf552ce8e13ff4), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Viran_146959 : UTopic_Hero__SC_NOV_VIRAN_1302
        {
            default DebugId = int64(0xefdf552ce8e13ffc);
            default Caption = LocText("TEXT_WIP_FPPCYMI_20250124_160133_686");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Viran_146959);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xefdf552ce8e13ffd), EConversationDebugInfo::Executing);
                // What exactly is this potion supposed to do?
                Hero.AI.Say(LocText("TEXT_WIP_FPPCYMI_20250124_160133_686"));
                DC(int64(0xefdf552ce8e13ffd), EConversationDebugInfo::Done);
                DC(int64(0xefdf552ce8e14000), EConversationDebugInfo::Executing);
                
                // I told you, it's supposed to put us in touch with the ...
                Viran.AI.Say(LocText("TEXT_WIP_FPPCYMI_20250124_160204"));
                DC(int64(0xefdf552ce8e14000), EConversationDebugInfo::Done);
                DC(int64(0xefdf552ce8e14001), EConversationDebugInfo::Executing);
                // He said some barmy nonense about stirrin' a "great gift" ...
                Viran.AI.Say(LocText("TEXT_WIP_FPPCYMI_20250124_160214"));
                DC(int64(0xefdf552ce8e14001), EConversationDebugInfo::Done);
                DC(int64(0xefdf552ce8e13fff), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xefdf552ce8e13fff), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Viran_146630 : UTopic_Hero__SC_NOV_VIRAN_1302
        {
            default DebugId = int64(0xefdf552ce8e13ff5);
            default Caption = LocText("TEXT_WIP_FPPCYMI_20250124_160002_3286");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Viran_146630);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xefdf552ce8e13ff6), EConversationDebugInfo::Executing);
                // What does that have to do with me? 
                Hero.AI.Say(LocText("TEXT_WIP_FPPCYMI_20250124_160002_3286"));
                DC(int64(0xefdf552ce8e13ff6), EConversationDebugInfo::Done);
                DC(int64(0xefdf552ce8e14002), EConversationDebugInfo::Executing);
                
                // You have to help us outta here. 
                Viran.AI.Say(LocText("TEXT_WIP_FPPCYMI_20250124_160352"));
                DC(int64(0xefdf552ce8e14002), EConversationDebugInfo::Done);
                DC(int64(0xefdf552ce8e14003), EConversationDebugInfo::Executing);
                // They let me go after Tahrin kicked the bucket, but they ...
                Viran.AI.Say(LocText("TEXT_WIP_FPPCYMI_20250124_160412"));
                DC(int64(0xefdf552ce8e14003), EConversationDebugInfo::Done);
                DC(int64(0xefdf552ce8e14004), EConversationDebugInfo::Executing);
                // We don't wanna die, not like that, but we can't leave ...
                Viran.AI.Say(LocText("TEXT_WIP_FPPCYMI_20250124_160458"));
                DC(int64(0xefdf552ce8e14004), EConversationDebugInfo::Done);
                DC(int64(0xefdf552ce8e14005), EConversationDebugInfo::Executing);
                // Maybe you could distract 'em or somethin'. Anythin' - ...
                Viran.AI.Say(LocText("TEXT_WIP_FPPCYMI_20250124_160532"));
                DC(int64(0xefdf552ce8e14005), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Viran_137391,
                    UTopic_Viran_137411
                );
            }
        }
        
        
        class UTopic_Viran_137391 : UTopic_Hero__SC_NOV_VIRAN_1302
        {
            default DebugId = int64(0xf2936aaa9d819e1c);
            default Caption = LocText("TEXT_WIP_LNPRNBE_20250113_153637_1924");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Viran_137391);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf2936aaa9d819e1d), EConversationDebugInfo::Executing);
                // All right, I'll think of something. 
                Hero.AI.Say(LocText("TEXT_WIP_LNPRNBE_20250113_153637_1924"));
                DC(int64(0xf2936aaa9d819e1d), EConversationDebugInfo::Done);
                DC(int64(0xf2936aaa9d819e2c), EConversationDebugInfo::Executing);
                
                // Really? Oh, thank the gods. I'll make it up to you, I ...
                Viran.AI.Say(LocText("TEXT_WIP_LNPRNBE_20250113_155453"));
                DC(int64(0xf2936aaa9d819e2c), EConversationDebugInfo::Done);
                DC(int64(0xefdf552ce8e14007), EConversationDebugInfo::Executing);
                
                // You said "we" - who else is leaving?
                Hero.AI.Say(LocText("TEXT_WIP_FPPCYMI_20250124_160722"));
                DC(int64(0xefdf552ce8e14007), EConversationDebugInfo::Done);
                DC(int64(0xefdf552ce8e14008), EConversationDebugInfo::Executing);
                
                // Joru and Balor - they should be around the camp. I'll ...
                Viran.AI.Say(LocText("TEXT_WIP_FPPCYMI_20250124_160727"));
                DC(int64(0xefdf552ce8e14008), EConversationDebugInfo::Done);
                DC(int64(0x2031e423e932b51), EConversationDebugInfo::Executing);
                // Tell them to join me, all right? And thanks again. I ...
                Viran.AI.Say(LocText("TEXT_WIP_TKHQRQD_20250115_113635"));
                DC(int64(0x2031e423e932b51), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_KALOMEXPERIMENTS, Document::UDocumentSegment_CH3_KALOMEXPERIMENTS_Start);
                DC(int64(0xf2936aaa9d819e2e), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER3_KALOMEXPERIMENTS.StartQuest();
                DC(int64(0xf2936aaa9d819e2e), EConversationDebugInfo::Done);
                DC(int64(0xf2936aaa9d819e30), EConversationDebugInfo::Executing);
                Viran.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Viran_1302_Wait);
                DC(int64(0xf2936aaa9d819e30), EConversationDebugInfo::Done);
                DC(int64(0xf2936aaa9d819e31), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xf2936aaa9d819e31), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Viran_137411 : UTopic_Hero__SC_NOV_VIRAN_1302
        {
            default DebugId = int64(0xf2936aaa9d819e20);
            default Caption = LocText("TEXT_WIP_LNPRNBE_20250113_153637_3436");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Viran_137411);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf2936aaa9d819e21), EConversationDebugInfo::Executing);
                // None of my business. Good luck. 
                Hero.AI.Say(LocText("TEXT_WIP_LNPRNBE_20250113_153637_3436"));
                DC(int64(0xf2936aaa9d819e21), EConversationDebugInfo::Done);
                DC(int64(0xefdf552ce8e14006), EConversationDebugInfo::Executing);
                
                // What? But- Oh, you fuckin' scoundrel!
                Viran.AI.Say(LocText("TEXT_WIP_FPPCYMI_20250124_160613"));
                DC(int64(0xefdf552ce8e14006), EConversationDebugInfo::Done);
                DC(int64(0xf2936aaa9d819e2a), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xf2936aaa9d819e2a), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceViran137484 : UTopic_Hero__SC_NOV_VIRAN_1302
        {
            default DebugId = int64(0xf2936aaa9d819e34);
            default Caption = LocText("TEXT_WIP_LNPRNBE_20250113_154933");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceViran137484);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_LNPRNBE_20250113_153637_3436"), int64(0xf2936aaa9d819e34));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf2936aaa9d819e24), EConversationDebugInfo::Executing);
                // I changed my mind. I'll help you get out of here.
                Hero.AI.Say(LocText("TEXT_WIP_LNPRNBE_20250113_154933"));
                DC(int64(0xf2936aaa9d819e24), EConversationDebugInfo::Done);
                DC(int64(0xf2936aaa9d819e33), EConversationDebugInfo::Executing);
                
                // Really? Oh, thank the gods. I'll make it up to you, I ...
                Viran.AI.Say(LocText("TEXT_WIP_LNPRNBE_20250113_155453"));
                DC(int64(0xf2936aaa9d819e33), EConversationDebugInfo::Done);
                DC(int64(0xefdf552ce8e14009), EConversationDebugInfo::Executing);
                // It ain't just me, though, Joru and Balor wanna leave ...
                Viran.AI.Say(LocText("TEXT_WIP_FPPCYMI_20250124_160809"));
                DC(int64(0xefdf552ce8e14009), EConversationDebugInfo::Done);
                DC(int64(0xefdf552ce8e1400a), EConversationDebugInfo::Executing);
                // I'll wait at the entrance, okay? Tell 'em to meet me ...
                Viran.AI.Say(LocText("TEXT_WIP_FPPCYMI_20250124_160836"));
                DC(int64(0xefdf552ce8e1400a), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_KALOMEXPERIMENTS, Document::UDocumentSegment_CH3_KALOMEXPERIMENTS_Start);
                DC(int64(0xf2936aaa9d819e36), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER3_KALOMEXPERIMENTS.StartQuest();
                DC(int64(0xf2936aaa9d819e36), EConversationDebugInfo::Done);
                DC(int64(0xf2936aaa9d819e38), EConversationDebugInfo::Executing);
                Viran.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Viran_1302_Wait);
                DC(int64(0xf2936aaa9d819e38), EConversationDebugInfo::Done);
                DC(int64(0xf2936aaa9d819e39), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xf2936aaa9d819e39), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceViran137921 : UTopic_Hero__SC_NOV_VIRAN_1302
        {
            default DebugId = int64(0xf2936aaa9d819e77);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::WalkToOther;
            
            default Rules.HideIfKnows(UChoiceViran137921);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x56a4a1bf16980ed0), Balor != nullptr && Balor.HasAssignedDailyRoutine(UDailyRoutine_SC_NOV_Balor_1304_Wait));
                    DB(int64(0x56a4a1bf16980ed5), Joru != nullptr && Joru.HasAssignedDailyRoutine(UDailyRoutine_SC_NOV_Joru_1305_Wait));
                }
                
                if (Balor != nullptr && !Balor.HasAssignedDailyRoutine(UDailyRoutine_SC_NOV_Balor_1304_Wait))
                    return false;
                
                if (Joru != nullptr && !Joru.HasAssignedDailyRoutine(UDailyRoutine_SC_NOV_Joru_1305_Wait))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf2936aaa9d819e76), EConversationDebugInfo::Executing);
                // You did it! All right, now for the distraction. Do you ...
                Viran.AI.Say(LocText("TEXT_WIP_LNPRNBE_20250113_163138_2801"));
                DC(int64(0xf2936aaa9d819e76), EConversationDebugInfo::Done);
                DC(int64(0xf2936aaa9d819e82), EConversationDebugInfo::Executing);
                
                // I'll talk to him. Just hang tight and be ready to sneak ...
                Hero.AI.Say(LocText("TEXT_WIP_LNPRNBE_20250113_165514"));
                DC(int64(0xf2936aaa9d819e82), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_KALOMEXPERIMENTS, Document::UDocumentSegment_CH3_KALOMEXPERIMENTS_MeetViran);
                DC(int64(0x8c29f1142629e1b1), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER3_KALOMEXPERIMENTS_KALOMEXPERIMENTS_OBJ_MEETVIRAN.SucceedQuest();
                DC(int64(0x8c29f1142629e1b1), EConversationDebugInfo::Done);
                DC(int64(0x2031e423e932b53), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x2031e423e932b53), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceViran139081 : UTopic_Hero__SC_NOV_VIRAN_1302
        {
            default DebugId = int64(0xbb03bf33cc7222d8);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceViran139081);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xbb03bf33cc7222db), G1R.GuardDistraction >= 3);
                }
                
                return G1R.GuardDistraction >= 3;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xbb03bf33cc7222d7), EConversationDebugInfo::Executing);
                // You did it! Can't believe that worked.
                Viran.AI.Say(LocText("TEXT_WIP_ENPRNBE_20250114_114847_2083"));
                DC(int64(0xbb03bf33cc7222d7), EConversationDebugInfo::Done);
                DC(int64(0xefdf552ce8e1400b), EConversationDebugInfo::Executing);
                
                // Let's get out of here. Follow me. 
                Hero.AI.Say(LocText("TEXT_WIP_FPPCYMI_20250124_161035"));
                DC(int64(0xefdf552ce8e1400b), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_KALOMEXPERIMENTS, Document::UDocumentSegment_CH3_KALOMEXPERIMENTS_Distract);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_KALOMEXPERIMENTS, Document::UDocumentSegment_CH3_KALOMEXPERIMENTS_Guide);
                DC(int64(0xbb03bf33cc7222dd), EConversationDebugInfo::Executing);
                Viran.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Viran_1302_Follow);
                DC(int64(0xbb03bf33cc7222dd), EConversationDebugInfo::Done);
                DC(int64(0xbb03bf33cc7222e0), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Balor))) { Balor.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Balor_1304_Follow); }
                DC(int64(0xbb03bf33cc7222e0), EConversationDebugInfo::Done);
                DC(int64(0xbb03bf33cc7222e2), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Joru))) { Joru.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Joru_1305_Follow); }
                DC(int64(0xbb03bf33cc7222e2), EConversationDebugInfo::Done);
                DC(int64(0x2031e423e932b5e), EConversationDebugInfo::Executing);
                Viran.JoinPartyOf(Hero);
                DC(int64(0x2031e423e932b5e), EConversationDebugInfo::Done);
                DC(int64(0x2031e423e932b60), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Balor))) { Balor.JoinPartyOf(Hero); }
                DC(int64(0x2031e423e932b60), EConversationDebugInfo::Done);
                DC(int64(0x2031e423e932b62), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Joru))) { Joru.JoinPartyOf(Hero); }
                DC(int64(0x2031e423e932b62), EConversationDebugInfo::Done);
                DC(int64(0x8c29f1142629e1b3), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER3_KALOMEXPERIMENTS_KALOMEXPERIMENTS_OBJ_DISTRACT.SucceedQuest();
                DC(int64(0x8c29f1142629e1b3), EConversationDebugInfo::Done);
                DC(int64(0x14efdc7c8b96db80), EConversationDebugInfo::Executing);
                Viran.SetTrueGuild(UGE_Guild_Human_SwampCamp_Novice);
                DC(int64(0x14efdc7c8b96db80), EConversationDebugInfo::Done);
                DC(int64(0x14efdc7c8b96db82), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Balor))) { Balor.SetTrueGuild(UGE_Guild_Human_SwampCamp_Novice); }
                DC(int64(0x14efdc7c8b96db82), EConversationDebugInfo::Done);
                DC(int64(0x14efdc7c8b96db84), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Joru))) { Joru.SetTrueGuild(UGE_Guild_Human_SwampCamp_Novice); }
                DC(int64(0x14efdc7c8b96db84), EConversationDebugInfo::Done);
                DC(int64(0xbb03bf33cc7222de), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xbb03bf33cc7222de), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceViran139217 : UTopic_SC_NOV_JORU_1305__SC_NOV_VIRAN_1302
        {
            default DebugId = int64(0x464d7f73ef6cd2d5);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceViran139217);
            
            default ExtraCharactersToInvite.Add(n"HERO");
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x464d7f73ef6cd2d8), Quest::SwampCamp_SCCHAPTER3_KALOMEXPERIMENTS != nullptr && Quest::SwampCamp_SCCHAPTER3_KALOMEXPERIMENTS.IsRunning());
                    DB(int64(0x83b76a8690b8a9f), IsCharacterInWorld(Templar27));
                    DB(int64(0x83b76a8690b8aa0), IsCharacterInWorld(Templar26));
                    DB(int64(0x83b76a8690b8aa1), Templar26 != nullptr && Templar26.IsEveryoneOfThisKindDead());
                    DB(int64(0x83b76a8690b8aa2), Templar27 != nullptr && Templar27.IsEveryoneOfThisKindDead());
                    DB(int64(0x464d7f73ef6cd2d8), Quest::SwampCamp_SCCHAPTER3_KALOMEXPERIMENTS != nullptr && Quest::SwampCamp_SCCHAPTER3_KALOMEXPERIMENTS.IsRunning());
                    DB(int64(0x83b76a8690c381c), G1R.NoviceSaved != 0);
                }
                
                if (Quest::SwampCamp_SCCHAPTER3_KALOMEXPERIMENTS != nullptr && Quest::SwampCamp_SCCHAPTER3_KALOMEXPERIMENTS.IsRunning() && IsCharacterInWorld(Templar27) && IsCharacterInWorld(Templar26) && Templar26 != nullptr && Templar26.IsEveryoneOfThisKindDead() && Templar27 != nullptr && Templar27.IsEveryoneOfThisKindDead())
                    return true;
                
                if (Quest::SwampCamp_SCCHAPTER3_KALOMEXPERIMENTS != nullptr && Quest::SwampCamp_SCCHAPTER3_KALOMEXPERIMENTS.IsRunning() && G1R.NoviceSaved != 0)
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x464d7f73ef6cd2d4), EConversationDebugInfo::Executing);
                // Fuckin' hell. We did it! YOU did it!
                Viran.AI.Say(LocText("TEXT_WIP_ENPRNBE_20250114_143530_41"));
                DC(int64(0x464d7f73ef6cd2d4), EConversationDebugInfo::Done);
                DC(int64(0xefdf552ce8e1400c), EConversationDebugInfo::Executing);
                
                // We owe you, friend. A lot. 
                Joru.AI.Say(LocText("TEXT_WIP_FPPCYMI_20250124_161315"));
                DC(int64(0xefdf552ce8e1400c), EConversationDebugInfo::Done);
                DC(int64(0xefdf552ce8e1400d), EConversationDebugInfo::Executing);
                
                // It's fine. What are you gonna do now?
                Hero.AI.Say(LocText("TEXT_WIP_FPPCYMI_20250124_161331"));
                DC(int64(0xefdf552ce8e1400d), EConversationDebugInfo::Done);
                DC(int64(0x464d7f73ef6cd2db), EConversationDebugInfo::Executing);
                
                // Good question. I'll probably go back to the Swamp Camp ...
                Joru.AI.Say(LocText("TEXT_WIP_ENPRNBE_20250114_143805"));
                DC(int64(0x464d7f73ef6cd2db), EConversationDebugInfo::Done);
                DC(int64(0xefdf552ce8e1400e), EConversationDebugInfo::Executing);
                // Maybe there'll be a point to all this in the end. 
                Joru.AI.Say(LocText("TEXT_WIP_FPPCYMI_20250124_161405"));
                DC(int64(0xefdf552ce8e1400e), EConversationDebugInfo::Done);
                DC(int64(0xefdf552ce8e1400f), EConversationDebugInfo::Executing);
                
                // I guess I'll tag along. Man, I still can't believe they ...
                Viran.AI.Say(LocText("TEXT_WIP_FPPCYMI_20250124_161416"));
                DC(int64(0xefdf552ce8e1400f), EConversationDebugInfo::Done);
                DC(int64(0xefdf552ce8e14010), EConversationDebugInfo::Executing);
                // Here - like I promised. 
                Viran.AI.Say(LocText("TEXT_WIP_FPPCYMI_20250124_161536"));
                DC(int64(0xefdf552ce8e14010), EConversationDebugInfo::Done);
                DC(int64(0x464d7f73ef6cd2da), EConversationDebugInfo::Executing);
                
                // Thanks. Try and stay alive. 
                Hero.AI.Say(LocText("TEXT_WIP_ENPRNBE_20250114_143738"));
                DC(int64(0x464d7f73ef6cd2da), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_NOV_JORU, Document::UDocumentSegment_Glossary_SC_NOV_JORU_ReturnToSC);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_NOV_BALOR, Document::UDocumentSegment_Glossary_SC_NOV_BALOR_ReturnToSC);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_NOV_VIRAN, Document::UDocumentSegment_Glossary_SC_NOV_VIRAN_ReturnToSC);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_KALOMEXPERIMENTS, Document::UDocumentSegment_CH3_KALOMEXPERIMENTS_Completed);
                DC(int64(0xcbe41b81f2725efd), EConversationDebugInfo::Executing);
                Viran.AddItemToInventory(UItMi_Orenugget, 30);
                DC(int64(0xcbe41b81f2725efd), EConversationDebugInfo::Done);
                DC(int64(0x464d7f73ef6cd2dd), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER3_KALOMEXPERIMENTS_KALOMEXPERIMENTS_OBJ_GUIDE.SucceedQuest();
                DC(int64(0x464d7f73ef6cd2dd), EConversationDebugInfo::Done);
                DC(int64(0x464d7f73ef6cd2df), EConversationDebugInfo::Executing);
                Viran.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Viran_1302_Start);
                DC(int64(0x464d7f73ef6cd2df), EConversationDebugInfo::Done);
                DC(int64(0x464d7f73ef6cd2e1), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Balor))) { Balor.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Balor_1304_Start); }
                DC(int64(0x464d7f73ef6cd2e1), EConversationDebugInfo::Done);
                DC(int64(0x464d7f73ef6cd2e3), EConversationDebugInfo::Executing);
                Joru.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Joru_1305_AfterTalking);
                DC(int64(0x464d7f73ef6cd2e3), EConversationDebugInfo::Done);
                DC(int64(0x2031e423e932b64), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Balor))) { Balor.LeavePartyOf(Hero); }
                DC(int64(0x2031e423e932b64), EConversationDebugInfo::Done);
                DC(int64(0x2031e423e932b66), EConversationDebugInfo::Executing);
                Viran.LeavePartyOf(Hero);
                DC(int64(0x2031e423e932b66), EConversationDebugInfo::Done);
                DC(int64(0x2031e423e932b68), EConversationDebugInfo::Executing);
                Joru.LeavePartyOf(Hero);
                DC(int64(0x2031e423e932b68), EConversationDebugInfo::Done);
                DC(int64(0x56529d3224c733ac), EConversationDebugInfo::Executing);
                Viran.AI.GiveItemTo(Hero, UItMi_Orenugget, 30);
                DC(int64(0x56529d3224c733ac), EConversationDebugInfo::Done);
                DC(int64(0x464d7f73ef6cd2e4), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x464d7f73ef6cd2e4), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceViranBloodflies : UTopic_Hero__SC_NOV_VIRAN_1302
        {
            default DebugId = int64(0x3d6ee368d98b9fb8);
            default Caption = LocText("DIA_VIRAN_BLOODFLIES_15_00");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceViranFetchweed);
            default Rules.HideIfKnows(UChoiceViranBloodflies);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x3d6ee368d98b9fb9), Quest::VIRAN_BLOODFLIES != nullptr && !Quest::VIRAN_BLOODFLIES.HasBeenStarted());
                }
                
                return Quest::VIRAN_BLOODFLIES != nullptr && !Quest::VIRAN_BLOODFLIES.HasBeenStarted();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3d6ee368d98b9fba), EConversationDebugInfo::Executing);
                // What favor?
                Hero.AI.Say(LocText("DIA_VIRAN_BLOODFLIES_15_00"));
                DC(int64(0x3d6ee368d98b9fba), EConversationDebugInfo::Done);
                DC(int64(0x3d6ee368d98b9fbb), EConversationDebugInfo::Executing);
                
                // Ah, nothin' big. You see, workin' all the way out here ...
                Viran.AI.Say(LocText("DIA_VIRAN_BLOODFLIES_07_01"));
                DC(int64(0x3d6ee368d98b9fbb), EConversationDebugInfo::Done);
                DC(int64(0x3d6ee368d98b9fbc), EConversationDebugInfo::Executing);
                // We could work SO MUCH faster if they were gone. Y'know ...
                Viran.AI.Say(LocText("DIA_VIRAN_BLOODFLIES_07_02"));
                DC(int64(0x3d6ee368d98b9fbc), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_DELIVERWEED, Document::UDocumentSegment_CH1_DELIVERWEED_ViranQuest);
                DC(int64(0x281bfa5ab8feb32), EConversationDebugInfo::Executing);
                Quest::VIRAN_BLOODFLIES.StartQuest();
                DC(int64(0x281bfa5ab8feb32), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceViranExit : UTopic_Hero__SC_NOV_VIRAN_1302
        {
            default DebugId = int64(0x3d6ee368d98b9fa2);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3d6ee368d98b9fa3), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x3d6ee368d98b9fa3), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceViranFetchweed : UTopic_Hero__SC_NOV_VIRAN_1302
        {
            default DebugId = int64(0x3d6ee368d98b9fab);
            default Caption = LocText("TEXT_WIP_DDCKZPD_20241106_154338");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceViranFetchweed);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x3d6ee368d98b9fac), Quest::SwampCamp_SCCHAPTER1_DELIVERWEED != nullptr && Quest::SwampCamp_SCCHAPTER1_DELIVERWEED.IsRunning());
                }
                
                return Quest::SwampCamp_SCCHAPTER1_DELIVERWEED != nullptr && Quest::SwampCamp_SCCHAPTER1_DELIVERWEED.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5dcd7126285f5b5), EConversationDebugInfo::Executing);
                // You're one of Kalom's herb pickers, right? Orun sent me ...
                Hero.AI.Say(LocText("TEXT_WIP_DDCKZPD_20241106_154338"));
                DC(int64(0x5dcd7126285f5b5), EConversationDebugInfo::Done);
                DC(int64(0x3d6ee368d98b9fae), EConversationDebugInfo::Executing);
                
                // You really think I'm that daft, don't you?
                Viran.AI.Say(LocText("DIA_VIRAN_FETCHWEED_07_01"));
                DC(int64(0x3d6ee368d98b9fae), EConversationDebugInfo::Done);
                DC(int64(0x3d6ee368d98b9faf), EConversationDebugInfo::Executing);
                // "Orun sent me to fetch the harvest" - and, poof, just ...
                Viran.AI.Say(LocText("DIA_VIRAN_FETCHWEED_07_02"));
                DC(int64(0x3d6ee368d98b9faf), EConversationDebugInfo::Done);
                DC(int64(0x2425a25d0c6a951e), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER1_DELIVERWEED_DELIVERWEED_OBJ_VIRAN.StartQuest();
                DC(int64(0x2425a25d0c6a951e), EConversationDebugInfo::Done);
                Subdialog(
                    UChoiceViranFetchweedGotohim,
                    UChoiceViranFetchweedReally
                );
            }
        }
        
        
        class UChoiceViranFetchweedGotohim : UTopic_Hero__SC_NOV_VIRAN_1302
        {
            default DebugId = int64(0xe8603e87342bfac9);
            default Caption = LocText("DIA_VIRAN_FETCHWEED_GOTOHIM_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3d6ee368d98b9fb2), EConversationDebugInfo::Executing);
                // Go ask him yourself if you don't believe me ... 
                Hero.AI.Say(LocText("DIA_VIRAN_FETCHWEED_GOTOHIM_15_00"));
                DC(int64(0x3d6ee368d98b9fb2), EConversationDebugInfo::Done);
                DC(int64(0x3d6ee368d98b9fb3), EConversationDebugInfo::Executing);
                
                // Nah, I got a better idea. How about YOU prove you ain't ...
                Viran.AI.Say(LocText("DIA_VIRAN_FETCHWEED_GOTOHIM_07_01"));
                DC(int64(0x3d6ee368d98b9fb3), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceViranFetchweedReally : UTopic_Hero__SC_NOV_VIRAN_1302
        {
            default DebugId = int64(0xe8603e87342bfacd);
            default Caption = LocText("DIA_VIRAN_FETCHWEED_REALLY_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3d6ee368d98b9fb5), EConversationDebugInfo::Executing);
                
                // But Orun really sent me. 
                Hero.AI.Say(LocText("DIA_VIRAN_FETCHWEED_REALLY_15_00"));
                DC(int64(0x3d6ee368d98b9fb5), EConversationDebugInfo::Done);
                DC(int64(0x3d6ee368d98b9fb6), EConversationDebugInfo::Executing);
                
                // Of course.
                Viran.AI.Say(LocText("DIA_VIRAN_FETCHWEED_REALLY_07_01"));
                DC(int64(0x3d6ee368d98b9fb6), EConversationDebugInfo::Done);
                DC(int64(0x3d6ee368d98b9fb7), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x3d6ee368d98b9fb7), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceViranPerm : UTopic_Hero__SC_NOV_VIRAN_1302
        {
            default DebugId = int64(0x3d6ee368d98b9fd1);
            default Caption = LocText("DIA_VIRAN_PERM_15_00");
            default PriorityRank = 1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x3d6ee368d98b9fd2), Quest::VIRAN_BLOODFLIES != nullptr && Quest::VIRAN_BLOODFLIES.HasSucceeded());
                    DB(int64(0x9e8ab53bf21a655c), G1R != nullptr && !G1R.HasReachedChapter(3));
                }
                
                if (Quest::VIRAN_BLOODFLIES != nullptr && !Quest::VIRAN_BLOODFLIES.HasSucceeded())
                    return false;
                
                if (G1R != nullptr && G1R.HasReachedChapter(3))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3d6ee368d98b9fd3), EConversationDebugInfo::Executing);
                // How's the harvesting going?
                Hero.AI.Say(LocText("DIA_VIRAN_PERM_15_00"));
                DC(int64(0x3d6ee368d98b9fd3), EConversationDebugInfo::Done);
                DC(int64(0x3d6ee368d98b9fd4), EConversationDebugInfo::Executing);
                
                // Yeah, yeah, have your laugh. I'm sure the gurus will ...
                Viran.AI.Say(LocText("DIA_VIRAN_PERM_07_01"));
                DC(int64(0x3d6ee368d98b9fd4), EConversationDebugInfo::Done);
                DC(int64(0x3d6ee368d98b9fd5), EConversationDebugInfo::Executing);
                // At least I don't have to get on my knees and cut ...
                Viran.AI.Say(LocText("DIA_VIRAN_PERM_07_02"));
                DC(int64(0x3d6ee368d98b9fd5), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceViranRipoff : UTopic_Hero__SC_NOV_VIRAN_1302
        {
            default DebugId = int64(0x3d6ee368d98b9fd6);
            default Caption = LocText("DIA_VIRAN_RIPOFF_15_00");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceViranRipoff);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x3d6ee368d98b9fd7), G1R.Viran_DeliveryDay.IsValid() && G1R.Viran_DeliveryDay.IsAtLeastXDaysAgo(2));
                    DB(int64(0x3d6ee368d98b9fd8), Quest::VIRAN_BLOODFLIES != nullptr && Quest::VIRAN_BLOODFLIES.HasSucceeded());
                    DB(int64(0x9e8ab53bf21a655d), G1R != nullptr && !G1R.HasReachedChapter(3));
                }
                
                if (G1R.Viran_DeliveryDay.IsValid() && !G1R.Viran_DeliveryDay.IsAtLeastXDaysAgo(2))
                    return false;
                
                if (Quest::VIRAN_BLOODFLIES != nullptr && !Quest::VIRAN_BLOODFLIES.HasSucceeded())
                    return false;
                
                if (G1R != nullptr && G1R.HasReachedChapter(3))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3d6ee368d98b9fd9), EConversationDebugInfo::Executing);
                
                // I'm here for the next harvest.
                Hero.AI.Say(LocText("DIA_VIRAN_RIPOFF_15_00"));
                DC(int64(0x3d6ee368d98b9fd9), EConversationDebugInfo::Done);
                DC(int64(0x3d6ee368d98b9fda), EConversationDebugInfo::Executing);
                
                // What, again?
                Viran.AI.Say(LocText("DIA_VIRAN_RIPOFF_07_01"));
                DC(int64(0x3d6ee368d98b9fda), EConversationDebugInfo::Done);
                DC(int64(0x3d6ee368d98b9fdb), EConversationDebugInfo::Executing);
                
                // Don't tell me you want me to kill the swamp sharks this ...
                Hero.AI.Say(LocText("DIA_VIRAN_RIPOFF_15_02"));
                DC(int64(0x3d6ee368d98b9fdb), EConversationDebugInfo::Done);
                DC(int64(0x3d6ee368d98b9fdc), EConversationDebugInfo::Executing);
                
                // All right, all right. Here, take the bloody herbs!
                Viran.AI.Say(LocText("DIA_VIRAN_RIPOFF_07_03"));
                DC(int64(0x3d6ee368d98b9fdc), EConversationDebugInfo::Done);
                DC(int64(0xcbe41b81f2725efd), EConversationDebugInfo::Executing);
                Viran.AddItemToInventory(UItMi_Plants_Swampherb_01, 50);
                DC(int64(0xcbe41b81f2725efd), EConversationDebugInfo::Done);
                DC(int64(0x281bfa5ab8feb52), EConversationDebugInfo::Executing);
                Viran.AI.GiveItemTo(Hero, UItMi_Plants_Swampherb_01, 50);
                DC(int64(0x281bfa5ab8feb52), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceViranRunning : UTopic_Hero__SC_NOV_VIRAN_1302
        {
            default DebugId = int64(0x3d6ee368d98b9fbe);
            default Caption = LocText("DIA_VIRAN_RUNNING_15_00");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceViranBloodflies);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x3d6ee368d98b9fbf), Quest::VIRAN_BLOODFLIES != nullptr && Quest::VIRAN_BLOODFLIES.IsRunning());
                }
                
                return Quest::VIRAN_BLOODFLIES != nullptr && Quest::VIRAN_BLOODFLIES.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3d6ee368d98b9fc0), EConversationDebugInfo::Executing);
                // I took care of the bloodflies.
                Hero.AI.Say(LocText("DIA_VIRAN_RUNNING_15_00"));
                DC(int64(0x3d6ee368d98b9fc0), EConversationDebugInfo::Done);
                DB(int64(0x9e6bb533e2a5b93e), Viran != nullptr && Viran.CanSenseAnyAliveCharacterOfKind(VIRAN_BLOODFLY, 500000.0f));
                
                if (Viran != nullptr && Viran.CanSenseAnyAliveCharacterOfKind(VIRAN_BLOODFLY, 500000.0f))
                {
                    DC(int64(0x3d6ee368d98b9fc5), EConversationDebugInfo::Executing);
                    // Then you better get yourself some optics. They're still ...
                    Viran.AI.Say(LocText("DIA_VIRAN_RUNNING_07_00"));
                    DC(int64(0x3d6ee368d98b9fc5), EConversationDebugInfo::Done);
                    DC(int64(0x3d6ee368d98b9fc6), EConversationDebugInfo::Executing);
                    // Kill all bloodflies within, say, twenty paces. Then ...
                    Viran.AI.Say(LocText("DIA_VIRAN_RUNNING_07_01"));
                    DC(int64(0x3d6ee368d98b9fc6), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x3d6ee368d98b9fc7), EConversationDebugInfo::Executing);
                    // You actually did. Not bad, mate, not bad.
                    Viran.AI.Say(LocText("DIA_VIRAN_RUNNING_07_02"));
                    DC(int64(0x3d6ee368d98b9fc7), EConversationDebugInfo::Done);
                    DC(int64(0x3d6ee368d98b9fc8), EConversationDebugInfo::Executing);
                    // Whoever would risk his life for this is either on our ...
                    Viran.AI.Say(LocText("DIA_VIRAN_RUNNING_07_03"));
                    DC(int64(0x3d6ee368d98b9fc8), EConversationDebugInfo::Done);
                    DC(int64(0x3d6ee368d98b9fc9), EConversationDebugInfo::Executing);
                    // And fools are too dumb to be grifters, ain't they? 
                    Viran.AI.Say(LocText("DIA_VIRAN_RUNNING_07_04"));
                    DC(int64(0x3d6ee368d98b9fc9), EConversationDebugInfo::Done);
                    DC(int64(0x3d6ee368d98b9fca), EConversationDebugInfo::Executing);
                    // Anyhow, here's the harvest. Best take it straight to ...
                    Viran.AI.Say(LocText("DIA_VIRAN_RUNNING_07_05"));
                    DC(int64(0x3d6ee368d98b9fca), EConversationDebugInfo::Done);
                    DC(int64(0x3d6ee368d98b9fcb), EConversationDebugInfo::Executing);
                    // Oh, and if he bleats about how it ain't enough again, ...
                    Viran.AI.Say(LocText("DIA_VIRAN_RUNNING_07_06"));
                    DC(int64(0x3d6ee368d98b9fcb), EConversationDebugInfo::Done);
                    DB(int64(0x56788585a6b9001), Quest::SwampCamp_SCCHAPTER1_DELIVERWEED_DELIVERWEED_OBJ_BALOR != nullptr && Quest::SwampCamp_SCCHAPTER1_DELIVERWEED_DELIVERWEED_OBJ_BALOR.HasSucceeded());
                    
                    if (Quest::SwampCamp_SCCHAPTER1_DELIVERWEED_DELIVERWEED_OBJ_BALOR != nullptr && Quest::SwampCamp_SCCHAPTER1_DELIVERWEED_DELIVERWEED_OBJ_BALOR.HasSucceeded())
                    {
                        GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_DELIVERWEED, Document::UDocumentSegment_CH1_DELIVERWEED_WholeHarvest);
                    }
                    else
                    {
                        GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_DELIVERWEED, Document::UDocumentSegment_CH1_DELIVERWEED_ViranHarvest);
                    }
                    DC(int64(0xcbe41b81f2725efd), EConversationDebugInfo::Executing);
                    Viran.AddItemToInventory(UItMi_Plants_Swampherb_01, 50);
                    DC(int64(0xcbe41b81f2725efd), EConversationDebugInfo::Done);
                    DC(int64(0x281bfa5ab8feb5f), EConversationDebugInfo::Executing);
                    Viran.AI.GiveItemTo(Hero, UItMi_Plants_Swampherb_01, 50);
                    DC(int64(0x281bfa5ab8feb5f), EConversationDebugInfo::Done);
                    DC(int64(0x281bfa5ab8feb63), EConversationDebugInfo::Executing);
                    Quest::VIRAN_BLOODFLIES.SucceedQuest();
                    DC(int64(0x281bfa5ab8feb63), EConversationDebugInfo::Done);
                    DC(int64(0x281bfa5ab8feb65), EConversationDebugInfo::Executing);
                    G1R.Viran_DeliveryDay = FInGameTime::Now();
                    DC(int64(0x281bfa5ab8feb65), EConversationDebugInfo::Done);
                    DC(int64(0x138d345a7dba54e2), EConversationDebugInfo::Executing);
                    Quest::SwampCamp_SCCHAPTER1_DELIVERWEED_DELIVERWEED_OBJ_VIRAN.SucceedQuest();
                    DC(int64(0x138d345a7dba54e2), EConversationDebugInfo::Done);
                }
                DC(int64(0x3d6ee368d98b9fd0), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x3d6ee368d98b9fd0), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceViranWhat : UTopic_Hero__SC_NOV_VIRAN_1302
        {
            default DebugId = int64(0x3d6ee368d98b9fa4);
            default Caption = LocText("DIA_VIRAN_WHAT_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceViranWhat);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x9e8ab53bf21a655b), G1R != nullptr && !G1R.HasReachedChapter(3));
                }
                
                return G1R != nullptr && !G1R.HasReachedChapter(3);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3d6ee368d98b9fa5), EConversationDebugInfo::Executing);
                // What are you guys doing out here?
                Hero.AI.Say(LocText("DIA_VIRAN_WHAT_15_00"));
                DC(int64(0x3d6ee368d98b9fa5), EConversationDebugInfo::Done);
                DC(int64(0x3d6ee368d98b9fa6), EConversationDebugInfo::Executing);
                
                // What's it look like? We're pickin' the herbs for the ...
                Viran.AI.Say(LocText("DIA_VIRAN_WHAT_07_01"));
                DC(int64(0x3d6ee368d98b9fa6), EConversationDebugInfo::Done);
                DC(int64(0x3d6ee368d98b9fa7), EConversationDebugInfo::Executing);
                // Pretty dangerous as you can imagine, but this swamp's ...
                Viran.AI.Say(LocText("DIA_VIRAN_WHAT_07_02"));
                DC(int64(0x3d6ee368d98b9fa7), EConversationDebugInfo::Done);
                DC(int64(0x3d6ee368d98b9fa8), EConversationDebugInfo::Executing);
                
                // How so?
                Hero.AI.Say(LocText("DIA_VIRAN_WHAT_15_03"));
                DC(int64(0x3d6ee368d98b9fa8), EConversationDebugInfo::Done);
                DC(int64(0x3d6ee368d98b9fa9), EConversationDebugInfo::Executing);
                
                // Cause that means the other camps can't get their paws on ...
                Viran.AI.Say(LocText("DIA_VIRAN_WHAT_07_04"));
                DC(int64(0x3d6ee368d98b9fa9), EConversationDebugInfo::Done);
                DC(int64(0x3d6ee368d98b9faa), EConversationDebugInfo::Executing);
                // We take what we need for ourselves, and trade the rest - ...
                Viran.AI.Say(LocText("DIA_VIRAN_WHAT_07_05"));
                DC(int64(0x3d6ee368d98b9faa), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_NOV_VIRAN, Document::UDocumentSegment_Glossary_SC_NOV_VIRAN_Introduction);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */