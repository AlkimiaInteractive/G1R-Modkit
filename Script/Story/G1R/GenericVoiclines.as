#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace GenericVoiceline
    {
        /** I want to address someone from afar or from behind. */
        class UGVL_Address_Call : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Address_Call;
            default ExampleText = "Hey you!";
        }
        
        
        /** Greet a friendly. */
        class UGVL_Address_Greeting_Friendly : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Address_Greeting_Friendly;
            default ExampleText = "Hello";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return Me != nullptr && Me.IsFriendlyTowards(Other);
            }
        }
        
        
        /** Mage greeting. */
        class UGVL_Address_Greeting_Mage : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Address_Greeting_Mage;
            default ExampleText = "For the honor of Magic!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage);
            }
        }
        
        
        /** Old camp greeting */
        class UGVL_Address_Greeting_OC : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Address_Greeting_OC;
            default ExampleText = "For Gomez!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp);
            }
        }
        
        
        /** Swamp camp greeting. */
        class UGVL_Address_Greeting_Sect : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Address_Greeting_Sect;
            default ExampleText = "Awaken!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp);
            }
        }
        
        
        /** I indicate where another character is. */
        class UGVL_Address_PointOutCharacter : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Address_PointOutCharacter;
            default ExampleText = "He's over there.";
        }
        
        
        /**
         * Character calls angrily at someone. Meant to be used following or followed by other voicelines
         * related to crime and combat. Generic for any listener and speaker without specific guilds. No
         * pronouns.
         */
        
        class UGVL_Address_Vocative_Angry : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Address_Vocative_Angry;
            default ExampleText = "[ANGRY] Man!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return Me != nullptr && !Me.IsFriendlyTowards(Other) && Me != nullptr && !Me.IsNeutralTowards(Other);
            }
        }
        
        
        class UGVL_Address_Vocative_Angry_BC : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Address_Vocative_Angry_BC;
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && !Me.IsFriendlyTowards(Other) && Me != nullptr && !Me.IsNeutralTowards(Other)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_Bandit) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_Bandit)))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * Bandit calls angrily at a Bandit. Meant to be used following or followed by other voicelines
         * related to crime and combat.
         */
        
        class UGVL_Address_Vocative_Angry_BC_ToBAN : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Address_Vocative_Angry_BC_ToBAN;
            default ExampleText = "[ANGRY] Mate!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && !Me.IsFriendlyTowards(Other) && Me != nullptr && !Me.IsNeutralTowards(Other)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_Bandit) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_Bandit)))
                    return false;
                
                if (!((Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_Bandit)) || (Other != nullptr && Other.IsTrulyPartOfGuild(GameplayTag::Guild_Human_Bandit))))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * Bandit calls angrily at a New Camper. Meant to be used following or followed by other voicelines
         * related to crime and combat.
         */
        
        class UGVL_Address_Vocative_Angry_BC_ToNC : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Address_Vocative_Angry_BC_ToNC;
            default ExampleText = "[ANGRY] New Camper!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && !Me.IsFriendlyTowards(Other) && Me != nullptr && !Me.IsNeutralTowards(Other)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_Bandit) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_Bandit)))
                    return false;
                
                if (!(Other != nullptr && !Other.IsTrulyPartOfGuild(GameplayTag::Guild_Human_Bandit) && Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * Bandit calls angrily at a Old Camper. Meant to be used following or followed by other voicelines
         * related to crime and combat.
         */
        
        class UGVL_Address_Vocative_Angry_BC_ToOC : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Address_Vocative_Angry_BC_ToOC;
            default ExampleText = "[ANGRY] Old Camper!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && !Me.IsFriendlyTowards(Other) && Me != nullptr && !Me.IsNeutralTowards(Other)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_Bandit) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_Bandit)))
                    return false;
                
                if (!(Other != nullptr && !Other.IsTrulyPartOfGuild(GameplayTag::Guild_Human_Bandit) && Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * Bandit calls angrily at a Swamp Camper. Meant to be used following or followed by other
         * voicelines related to crime and combat.
         */
        
        class UGVL_Address_Vocative_Angry_BC_ToSC : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Address_Vocative_Angry_BC_ToSC;
            default ExampleText = "[ANGRY] Numbnuts!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && !Me.IsFriendlyTowards(Other) && Me != nullptr && !Me.IsNeutralTowards(Other)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_Bandit) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_Bandit)))
                    return false;
                
                if (!(Other != nullptr && !Other.IsTrulyPartOfGuild(GameplayTag::Guild_Human_Bandit) && Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp)))
                    return false;
                
                return true;
            }
        }
        
        
        class UGVL_Address_Vocative_Angry_NC : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Address_Vocative_Angry_NC;
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && !Me.IsFriendlyTowards(Other) && Me != nullptr && !Me.IsNeutralTowards(Other)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * New Camper calls angrily at a Bandit. Meant to be used following or followed by other voicelines
         * related to crime and combat.
         */
        
        class UGVL_Address_Vocative_Angry_NC_toBAN : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Address_Vocative_Angry_NC_toBAN;
            default ExampleText = "[ANGRY] Outlaw!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && !Me.IsFriendlyTowards(Other) && Me != nullptr && !Me.IsNeutralTowards(Other)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                if (!(Other != nullptr && !Other.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_Bandit)))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * New Camper that is NOT a Peasant (SLD, KDW, ORG, SFB) calls angrily at a Peasant. Meant to be
         * used following or followed by other voicelines related to crime and combat.
         */
        
        class UGVL_Address_Vocative_Angry_NC_toBAU : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Address_Vocative_Angry_NC_toBAU;
            default ExampleText = "[ANGRY] Farmhand!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && !Me.IsFriendlyTowards(Other) && Me != nullptr && !Me.IsNeutralTowards(Other)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                if (!(Me != nullptr && !Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Peasant) && Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Peasant)))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * New Camper that is NOT a mage (ORG, SLD, BAU, SFB) calls angrily at a Mage. Meant to be used
         * following or followed by other voicelines related to crime and combat.
         */
        
        class UGVL_Address_Vocative_Angry_NC_toKDW : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Address_Vocative_Angry_NC_toKDW;
            default ExampleText = "[ANGRY] Sorcerer!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && !Me.IsFriendlyTowards(Other) && Me != nullptr && !Me.IsNeutralTowards(Other)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                if (!(Me != nullptr && !Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage) && Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage)))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * New Camper calls angrily at a Old Camper. Meant to be used following or followed by other
         * voicelines related to crime and combat.
         */
        
        class UGVL_Address_Vocative_Angry_NC_toOC : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Address_Vocative_Angry_NC_toOC;
            default ExampleText = "[ANGRY] Oldcamper!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && !Me.IsFriendlyTowards(Other) && Me != nullptr && !Me.IsNeutralTowards(Other)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                if (!(Other != nullptr && !Other.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * New Camper that is NOT a Rogue (SLD, KDF, BAU, SFB) calls angrily at a Rogue. Meant to be used
         * following or followed by other voicelines related to crime and combat.
         */
        
        class UGVL_Address_Vocative_Angry_NC_toORG : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Address_Vocative_Angry_NC_toORG;
            default ExampleText = "[ANGRY] Rogue!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && !Me.IsFriendlyTowards(Other) && Me != nullptr && !Me.IsNeutralTowards(Other)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                if (!(Me != nullptr && !Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Rogue) && Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Rogue)))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * New Camper calls angrily at a Swamp Camper. Meant to be used following or followed by other
         * voicelines related to crime and combat.
         */
        
        class UGVL_Address_Vocative_Angry_NC_toSC : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Address_Vocative_Angry_NC_toSC;
            default ExampleText = "[ANGRY] Pothead!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && !Me.IsFriendlyTowards(Other) && Me != nullptr && !Me.IsNeutralTowards(Other)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                if (!(Other != nullptr && !Other.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp)))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * New Camper that is NOT a Scrapper (SLD, KDF, ORG, BAU) calls angrily at a Scrapper. Meant to be
         * used following or followed by other voicelines related to crime and combat.
         */
        
        class UGVL_Address_Vocative_Angry_NC_toSFB : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Address_Vocative_Angry_NC_toSFB;
            default ExampleText = "[ANGRY] Worker!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && !Me.IsFriendlyTowards(Other) && Me != nullptr && !Me.IsNeutralTowards(Other)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                if (!(Me != nullptr && !Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Scraper) && Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Scraper)))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * New Camper that is NOT a Mercenary (ORG, KDF, BAU, SFB) calls angrily at a Mercenary. Meant to be
         * used following or followed by other voicelines related to crime and combat.
         */
        
        class UGVL_Address_Vocative_Angry_NC_toSLD : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Address_Vocative_Angry_NC_toSLD;
            default ExampleText = "[ANGRY] Sellsword!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && !Me.IsFriendlyTowards(Other) && Me != nullptr && !Me.IsNeutralTowards(Other)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                if (!(Me != nullptr && !Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Mercenary) && Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Mercenary)))
                    return false;
                
                return true;
            }
        }
        
        
        class UGVL_Address_Vocative_Angry_OC : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Address_Vocative_Angry_OC;
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && !Me.IsFriendlyTowards(Other) && Me != nullptr && !Me.IsNeutralTowards(Other)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * Old Camper calls angrily at a Bandit. Meant to be used following or followed by other voicelines
         * related to crime and combat.
         */
        
        class UGVL_Address_Vocative_Angry_OC_toBAN : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Address_Vocative_Angry_OC_toBAN;
            default ExampleText = "[ANGRY] Brigand!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && !Me.IsFriendlyTowards(Other) && Me != nullptr && !Me.IsNeutralTowards(Other)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                if (!(Other != nullptr && !Other.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_Bandit)))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * Old Camper that is NOT a guard (EBR, VLK, KDF, STT) calls angrily at a Guard. Meant to be used
         * following or followed by other voicelines related to crime and combat.
         */
        
        class UGVL_Address_Vocative_Angry_OC_toGRD : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Address_Vocative_Angry_OC_toGRD;
            default ExampleText = "[ANGRY] Watchman!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && !Me.IsFriendlyTowards(Other) && Me != nullptr && !Me.IsNeutralTowards(Other)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                if (!(Me != nullptr && !Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard) && Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard)))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * Old Camper that is NOT a mage (EBR, VLK, STT, GRD) calls angrily at a Mage. Meant to be used
         * following or followed by other voicelines related to crime and combat.
         */
        
        class UGVL_Address_Vocative_Angry_OC_toKDF : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Address_Vocative_Angry_OC_toKDF;
            default ExampleText = "[ANGRY] Sorcerer!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && !Me.IsFriendlyTowards(Other) && Me != nullptr && !Me.IsNeutralTowards(Other)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                if (!(Me != nullptr && !Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage) && Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage)))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * Old Camper calls angrily at a New Camper. Meant to be used following or followed by other
         * voicelines related to crime and combat.
         */
        
        class UGVL_Address_Vocative_Angry_OC_toNC : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Address_Vocative_Angry_OC_toNC;
            default ExampleText = "[ANGRY] Newcamper!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && !Me.IsFriendlyTowards(Other) && Me != nullptr && !Me.IsNeutralTowards(Other)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                if (!(Other != nullptr && !Other.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * Old Camper calls angrily at a Swamp Camper. Meant to be used following or followed by other
         * voicelines related to crime and combat.
         */
        
        class UGVL_Address_Vocative_Angry_OC_toSC : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Address_Vocative_Angry_OC_toSC;
            default ExampleText = "[ANGRY] Looney!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && !Me.IsFriendlyTowards(Other) && Me != nullptr && !Me.IsNeutralTowards(Other)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                if (!(Other != nullptr && !Other.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp)))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * Old Camper that is NOT a shadow (EBR, VLK, KDF, GRD) calls angrily at a Shadow. Meant to be used
         * following or followed by other voicelines related to crime and combat.
         */
        
        class UGVL_Address_Vocative_Angry_OC_toSTT : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Address_Vocative_Angry_OC_toSTT;
            default ExampleText = "[ANGRY] Shadow!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && !Me.IsFriendlyTowards(Other) && Me != nullptr && !Me.IsNeutralTowards(Other)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                if (!(Me != nullptr && !Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow) && Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow)))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * Old Camper that is NOT a digger (EBR, GRD, KDF, STT) calls angrily at a Digger. Meant to be used
         * following or followed by other voicelines related to crime and combat.
         */
        
        class UGVL_Address_Vocative_Angry_OC_toVLK : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Address_Vocative_Angry_OC_toVLK;
            default ExampleText = "[ANGRY] Dirthands!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && !Me.IsFriendlyTowards(Other) && Me != nullptr && !Me.IsNeutralTowards(Other)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                if (!(Me != nullptr && !Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Digger) && Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Digger)))
                    return false;
                
                return true;
            }
        }
        
        
        class UGVL_Address_Vocative_Angry_SC : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Address_Vocative_Angry_SC;
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && !Me.IsFriendlyTowards(Other) && Me != nullptr && !Me.IsNeutralTowards(Other)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp)))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * Swamp Camper calls angrily at a Bandit. Meant to be used following or followed by other
         * voicelines related to crime and combat.
         */
        
        class UGVL_Address_Vocative_Angry_SC_toBAN : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Address_Vocative_Angry_SC_toBAN;
            default ExampleText = "[ANGRY] Robber!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && !Me.IsFriendlyTowards(Other) && Me != nullptr && !Me.IsNeutralTowards(Other)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp)))
                    return false;
                
                if (!(Other != nullptr && !Other.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp) && Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_Bandit)))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * Swamp Camper calls angrily at a New Camper. Meant to be used following or followed by other
         * voicelines related to crime and combat.
         */
        
        class UGVL_Address_Vocative_Angry_SC_toNC : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Address_Vocative_Angry_SC_toNC;
            default ExampleText = "[ANGRY] New Camper!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && !Me.IsFriendlyTowards(Other) && Me != nullptr && !Me.IsNeutralTowards(Other)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp)))
                    return false;
                
                if (!(Other != nullptr && !Other.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp) && Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * Swamp Camper that is NOT a Novice (GUR, TPL) calls angrily at a Novice. Meant to be used
         * following or followed by other voicelines related to crime and combat.
         */
        
        class UGVL_Address_Vocative_Angry_SC_toNOV : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Address_Vocative_Angry_SC_toNOV;
            default ExampleText = "[ANGRY] Initiate!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && !Me.IsFriendlyTowards(Other) && Me != nullptr && !Me.IsNeutralTowards(Other)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp)))
                    return false;
                
                if (!(((Me != nullptr && !Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Novice) && Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Novice))) || ((Me != nullptr && !Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Novice) && Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Novice)))))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * Swamp Camper calls angrily at an Old Camper. Meant to be used following or followed by other
         * voicelines related to crime and combat.
         */
        
        class UGVL_Address_Vocative_Angry_SC_toOC : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Address_Vocative_Angry_SC_toOC;
            default ExampleText = "[ANGRY] Old Camper!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && !Me.IsFriendlyTowards(Other) && Me != nullptr && !Me.IsNeutralTowards(Other)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp)))
                    return false;
                
                if (!(Other != nullptr && !Other.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp) && Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * Swamp Camper that is NOT a Templar (GUR, NOV) calls angrily at a Tamplar. Meant to be used
         * following or followed by other voicelines related to crime and combat.
         */
        
        class UGVL_Address_Vocative_Angry_SC_toTPL : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Address_Vocative_Angry_SC_toTPL;
            default ExampleText = "[ANGRY] Templar!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && !Me.IsFriendlyTowards(Other) && Me != nullptr && !Me.IsNeutralTowards(Other)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp)))
                    return false;
                
                if (!(((Me != nullptr && !Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Templar) && Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Templar))) || ((Me != nullptr && !Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Templar) && Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Templar)))))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * Character calls angrily at player with no guild. Meant to be used following or followed by other
         * voicelines related to crime and combat.
         */
        
        class UGVL_Address_Vocative_Angry_toPlayerNoGuild : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Address_Vocative_Angry_toPlayerNoGuild;
            default ExampleText = "[ANGRY] Newcomer!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && !Me.IsFriendlyTowards(Other) && Me != nullptr && !Me.IsNeutralTowards(Other)))
                    return false;
                
                if (!(Other != nullptr && Other.IsHero() && Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_None) && Other != nullptr && Other.IsTrulyPartOfGuild(GameplayTag::Guild_None)))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * Character calls calmly at someone. Meant to be used following or followed by other voicelines
         * related to crime and combat. Generic for any listener and speaker without specific guilds. No
         * pronouns.
         */
        
        class UGVL_Address_Vocative_Calm : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Address_Vocative_Calm;
            default ExampleText = "[CALM] Man.";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return (Me != nullptr && Me.IsNeutralTowards(Other)) || (Me != nullptr && Me.IsFriendlyTowards(Other));
            }
        }
        
        
        class UGVL_Address_Vocative_Calm_BC : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Address_Vocative_Calm_BC;
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!((Me != nullptr && Me.IsNeutralTowards(Other)) || (Me != nullptr && Me.IsFriendlyTowards(Other))))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_Bandit) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_Bandit)))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * Bandit calls calmly at a Bandit. Meant to be used following or followed by other voicelines
         * related to crime and combat.
         */
        
        class UGVL_Address_Vocative_Calm_BC_ToBAN : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Address_Vocative_Calm_BC_ToBAN;
            default ExampleText = "[CALM] Mate.";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!((Me != nullptr && Me.IsNeutralTowards(Other)) || (Me != nullptr && Me.IsFriendlyTowards(Other))))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_Bandit) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_Bandit)))
                    return false;
                
                if (!((Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_Bandit)) || (Other != nullptr && Other.IsTrulyPartOfGuild(GameplayTag::Guild_Human_Bandit))))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * Bandit calls calmly at a New Camper. Meant to be used following or followed by other voicelines
         * related to crime and combat.
         */
        
        class UGVL_Address_Vocative_Calm_BC_ToNC : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Address_Vocative_Calm_BC_ToNC;
            default ExampleText = "[CALM] New Camper.";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!((Me != nullptr && Me.IsNeutralTowards(Other)) || (Me != nullptr && Me.IsFriendlyTowards(Other))))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_Bandit) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_Bandit)))
                    return false;
                
                if (!(Other != nullptr && !Other.IsTrulyPartOfGuild(GameplayTag::Guild_Human_Bandit) && Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * Bandit calls calmly at a Old Camper. Meant to be used following or followed by other voicelines
         * related to crime and combat.
         */
        
        class UGVL_Address_Vocative_Calm_BC_ToOC : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Address_Vocative_Calm_BC_ToOC;
            default ExampleText = "[CALM] Old Camper.";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!((Me != nullptr && Me.IsNeutralTowards(Other)) || (Me != nullptr && Me.IsFriendlyTowards(Other))))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_Bandit) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_Bandit)))
                    return false;
                
                if (!(Other != nullptr && !Other.IsTrulyPartOfGuild(GameplayTag::Guild_Human_Bandit) && Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * Bandit calls calmly at a Swamp Camper. Meant to be used following or followed by other voicelines
         * related to crime and combat.
         */
        
        class UGVL_Address_Vocative_Calm_BC_ToSC : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Address_Vocative_Calm_BC_ToSC;
            default ExampleText = "[CALM] Dreamer.";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!((Me != nullptr && Me.IsNeutralTowards(Other)) || (Me != nullptr && Me.IsFriendlyTowards(Other))))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_Bandit) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_Bandit)))
                    return false;
                
                if (!(Other != nullptr && !Other.IsTrulyPartOfGuild(GameplayTag::Guild_Human_Bandit) && Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp)))
                    return false;
                
                return true;
            }
        }
        
        
        class UGVL_Address_Vocative_Calm_NC : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Address_Vocative_Calm_NC;
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!((Me != nullptr && Me.IsNeutralTowards(Other)) || (Me != nullptr && Me.IsFriendlyTowards(Other))))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * New Camper calls calmly at a Bandit. Meant to be used following or followed by other voicelines
         * related to crime and combat.
         */
        
        class UGVL_Address_Vocative_Calm_NC_toBAN : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Address_Vocative_Calm_NC_toBAN;
            default ExampleText = "[CALM] Outlaw.";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!((Me != nullptr && Me.IsNeutralTowards(Other)) || (Me != nullptr && Me.IsFriendlyTowards(Other))))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                if (!(Other != nullptr && !Other.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_Bandit)))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * New Camper that is NOT a Peasant (SLD, KDF, ORG, SFB) calls calmly at a Peasant. Meant to be used
         * following or followed by other voicelines related to crime and combat.
         */
        
        class UGVL_Address_Vocative_Calm_NC_toBAU : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Address_Vocative_Calm_NC_toBAU;
            default ExampleText = "[CALM] Peasant.";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!((Me != nullptr && Me.IsNeutralTowards(Other)) || (Me != nullptr && Me.IsFriendlyTowards(Other))))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                if (!(Me != nullptr && !Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Peasant) && Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Peasant)))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * New Camper that is NOT a mage (ORG, SLD, BAU, SFB) calls calmly at a Mage. Meant to be used
         * following or followed by other voicelines related to crime and combat.
         */
        
        class UGVL_Address_Vocative_Calm_NC_toKDW : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Address_Vocative_Calm_NC_toKDW;
            default ExampleText = "[CALM] Mage.";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!((Me != nullptr && Me.IsNeutralTowards(Other)) || (Me != nullptr && Me.IsFriendlyTowards(Other))))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                if (!(Me != nullptr && !Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage) && Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage)))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * New Camper calls calmly at a Old Camper. Meant to be used following or followed by other
         * voicelines related to crime and combat.
         */
        
        class UGVL_Address_Vocative_Calm_NC_toOC : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Address_Vocative_Calm_NC_toOC;
            default ExampleText = "[CALM] Oldcamper.";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!((Me != nullptr && Me.IsNeutralTowards(Other)) || (Me != nullptr && Me.IsFriendlyTowards(Other))))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                if (!(Other != nullptr && !Other.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * New Camper that is NOT a Rogue (SLD, KDF, BAU, SFB) calls calmly at a Rogue. Meant to be used
         * following or followed by other voicelines related to crime and combat.
         */
        
        class UGVL_Address_Vocative_Calm_NC_toORG : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Address_Vocative_Calm_NC_toORG;
            default ExampleText = "[CALM] Rogue.";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!((Me != nullptr && Me.IsNeutralTowards(Other)) || (Me != nullptr && Me.IsFriendlyTowards(Other))))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                if (!(Me != nullptr && !Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Rogue) && Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Rogue)))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * New Camper calls calmly at a Swamp Camper. Meant to be used following or followed by other
         * voicelines related to crime and combat.
         */
        
        class UGVL_Address_Vocative_Calm_NC_toSC : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Address_Vocative_Calm_NC_toSC;
            default ExampleText = "[CALM] Swamper.";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!((Me != nullptr && Me.IsNeutralTowards(Other)) || (Me != nullptr && Me.IsFriendlyTowards(Other))))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                if (!(Other != nullptr && !Other.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp)))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * New Camper that is NOT a Scrapper (SLD, KDF, ORG, BAU) calls calmly at a Scrapper. Meant to be
         * used following or followed by other voicelines related to crime and combat.
         */
        
        class UGVL_Address_Vocative_Calm_NC_toSFB : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Address_Vocative_Calm_NC_toSFB;
            default ExampleText = "[CALM] Scrapper.";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!((Me != nullptr && Me.IsNeutralTowards(Other)) || (Me != nullptr && Me.IsFriendlyTowards(Other))))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                if (!(Me != nullptr && !Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Scraper) && Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Scraper)))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * New Camper that is NOT a Mercenary (ORG, KDF, BAU, SFB) calls calmly at a Mercenary. Meant to be
         * used following or followed by other voicelines related to crime and combat.
         */
        
        class UGVL_Address_Vocative_Calm_NC_toSLD : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Address_Vocative_Calm_NC_toSLD;
            default ExampleText = "[CALM] Mercenary.";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!((Me != nullptr && Me.IsNeutralTowards(Other)) || (Me != nullptr && Me.IsFriendlyTowards(Other))))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                if (!(Me != nullptr && !Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Mercenary) && Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Mercenary)))
                    return false;
                
                return true;
            }
        }
        
        
        class UGVL_Address_Vocative_Calm_OC : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Address_Vocative_Calm_OC;
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!((Me != nullptr && Me.IsNeutralTowards(Other)) || (Me != nullptr && Me.IsFriendlyTowards(Other))))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * Old Camper calls calmly at a Bandit. Meant to be used following or followed by other voicelines
         * related to crime and combat.
         */
        
        class UGVL_Address_Vocative_Calm_OC_toBAN : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Address_Vocative_Calm_OC_toBAN;
            default ExampleText = "[CALM] Brigand.";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!((Me != nullptr && Me.IsNeutralTowards(Other)) || (Me != nullptr && Me.IsFriendlyTowards(Other))))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                if (!(Other != nullptr && !Other.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_Bandit)))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * Old Camper that is NOT a guard (EBR, VLK, KDF, STT) calls calmly at a Guard. Meant to be used
         * following or followed by other voicelines related to crime and combat.
         */
        
        class UGVL_Address_Vocative_Calm_OC_toGRD : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Address_Vocative_Calm_OC_toGRD;
            default ExampleText = "[CALM] Guard.";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!((Me != nullptr && Me.IsNeutralTowards(Other)) || (Me != nullptr && Me.IsFriendlyTowards(Other))))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                if (!(Me != nullptr && !Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard) && Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard)))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * Old Camper that is NOT a mage (EBR, VLK, STT, GRD) calls calmly at a Mage. Meant to be used
         * following or followed by other voicelines related to crime and combat.
         */
        
        class UGVL_Address_Vocative_Calm_OC_toKDF : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Address_Vocative_Calm_OC_toKDF;
            default ExampleText = "[CALM] Mage.";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!((Me != nullptr && Me.IsNeutralTowards(Other)) || (Me != nullptr && Me.IsFriendlyTowards(Other))))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                if (!(Me != nullptr && !Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage) && Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage)))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * Old Camper calls calmly at a New Camper. Meant to be used following or followed by other
         * voicelines related to crime and combat.
         */
        
        class UGVL_Address_Vocative_Calm_OC_toNC : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Address_Vocative_Calm_OC_toNC;
            default ExampleText = "[CALM] Newcamper.";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!((Me != nullptr && Me.IsNeutralTowards(Other)) || (Me != nullptr && Me.IsFriendlyTowards(Other))))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                if (!(Other != nullptr && !Other.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * Old Camper calls calmly at a Swamp Camper. Meant to be used following or followed by other
         * voicelines related to crime and combat.
         */
        
        class UGVL_Address_Vocative_Calm_OC_toSC : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Address_Vocative_Calm_OC_toSC;
            default ExampleText = "[CALM] Looney.";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!((Me != nullptr && Me.IsNeutralTowards(Other)) || (Me != nullptr && Me.IsFriendlyTowards(Other))))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                if (!(Other != nullptr && !Other.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp)))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * Old Camper that is NOT a shadow (EBR, VLK, KDF, GRD) calls calmly at a Shadow. Meant to be used
         * following or followed by other voicelines related to crime and combat.
         */
        
        class UGVL_Address_Vocative_Calm_OC_toSTT : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Address_Vocative_Calm_OC_toSTT;
            default ExampleText = "[CALM] Shadow.";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!((Me != nullptr && Me.IsNeutralTowards(Other)) || (Me != nullptr && Me.IsFriendlyTowards(Other))))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                if (!(Me != nullptr && !Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow) && Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow)))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * Old Camper that is NOT a digger (EBR, GRD, KDF, STT) calls calmly at a Digger. Meant to be used
         * following or followed by other voicelines related to crime and combat.
         */
        
        class UGVL_Address_Vocative_Calm_OC_toVLK : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Address_Vocative_Calm_OC_toVLK;
            default ExampleText = "[CALM] Digger.";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!((Me != nullptr && Me.IsNeutralTowards(Other)) || (Me != nullptr && Me.IsFriendlyTowards(Other))))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                if (!(Me != nullptr && !Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Digger) && Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Digger)))
                    return false;
                
                return true;
            }
        }
        
        
        class UGVL_Address_Vocative_Calm_SC : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Address_Vocative_Calm_SC;
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!((Me != nullptr && Me.IsNeutralTowards(Other)) || (Me != nullptr && Me.IsFriendlyTowards(Other))))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp)))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * Swamp Camper calls calmly at a Bandit. Meant to be used following or followed by other voicelines
         * related to crime and combat.
         */
        
        class UGVL_Address_Vocative_Calm_SC_toBAN : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Address_Vocative_Calm_SC_toBAN;
            default ExampleText = "[CALM] Robber.";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!((Me != nullptr && Me.IsNeutralTowards(Other)) || (Me != nullptr && Me.IsFriendlyTowards(Other))))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp)))
                    return false;
                
                if (!(Other != nullptr && !Other.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp) && Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_Bandit)))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * Swamp Camper calls calmly at a New Camper. Meant to be used following or followed by other
         * voicelines related to crime and combat.
         */
        
        class UGVL_Address_Vocative_Calm_SC_toNC : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Address_Vocative_Calm_SC_toNC;
            default ExampleText = "[CALM] New Camper.";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!((Me != nullptr && Me.IsNeutralTowards(Other)) || (Me != nullptr && Me.IsFriendlyTowards(Other))))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp)))
                    return false;
                
                if (!(Other != nullptr && !Other.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp) && Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * Swamp Camper that is NOT a Novice (GUR, TPL) calls calmly at a Novice. Meant to be used following
         * or followed by other voicelines related to crime and combat.
         */
        
        class UGVL_Address_Vocative_Calm_SC_toNOV : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Address_Vocative_Calm_SC_toNOV;
            default ExampleText = "[CALM] Novice.";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!((Me != nullptr && Me.IsNeutralTowards(Other)) || (Me != nullptr && Me.IsFriendlyTowards(Other))))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp)))
                    return false;
                
                if (!(((Me != nullptr && !Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Novice) && Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Novice))) || ((Me != nullptr && !Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Novice) && Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Novice)))))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * Swamp Camper calls calmly at an Old Camper. Meant to be used following or followed by other
         * voicelines related to crime and combat.
         */
        
        class UGVL_Address_Vocative_Calm_SC_toOC : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Address_Vocative_Calm_SC_toOC;
            default ExampleText = "[CALM] Old Camper.";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!((Me != nullptr && Me.IsNeutralTowards(Other)) || (Me != nullptr && Me.IsFriendlyTowards(Other))))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp)))
                    return false;
                
                if (!(Other != nullptr && !Other.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp) && Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * Swamp Camper that is NOT a Templar (GUR, NOV) calls calmly at a Tamplar. Meant to be used
         * following or followed by other voicelines related to crime and combat.
         */
        
        class UGVL_Address_Vocative_Calm_SC_toTPL : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Address_Vocative_Calm_SC_toTPL;
            default ExampleText = "[CALM] Templar.";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!((Me != nullptr && Me.IsNeutralTowards(Other)) || (Me != nullptr && Me.IsFriendlyTowards(Other))))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp)))
                    return false;
                
                if (!(((Me != nullptr && !Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Templar) && Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Templar))) || ((Me != nullptr && !Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Templar) && Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Templar)))))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * Character calls calmly at player with no guild. Meant to be used following or followed by other
         * voicelines related to crime and combat.
         */
        
        class UGVL_Address_Vocative_Calm_toPlayerNoGuild : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Address_Vocative_Calm_toPlayerNoGuild;
            default ExampleText = "[CALM] Newcomer.";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!((Me != nullptr && Me.IsNeutralTowards(Other)) || (Me != nullptr && Me.IsFriendlyTowards(Other))))
                    return false;
                
                if (!(Other != nullptr && Other.IsHero() && Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_None) && Other != nullptr && Other.IsTrulyPartOfGuild(GameplayTag::Guild_None)))
                    return false;
                
                return true;
            }
        }
        
        
        /** Shouting for the novices after the ritual */
        class UGVL_Conversation_DailyRoutine_AfterRitual_Shouting : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_DailyRoutine_AfterRitual_Shouting;
            default ExampleText = "\"We belived in the wrong god\"";
        }
        
        
        /** Complaints to self during the Carry Object routine. */
        class UGVL_Conversation_DailyRoutine_Complaint_CarryObject : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_DailyRoutine_Complaint_CarryObject;
            default ExampleText = "Ugh... this is heavier than I thought...";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return Me != nullptr && Me.IsCarryingObject();
            }
        }
        
        
        /** Complaints or remarks made when consuming drinks. */
        class UGVL_Conversation_DailyRoutine_Consume_Drink : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_DailyRoutine_Consume_Drink;
            default GlobalCooldownSeconds = 10.0f;
            default ExampleText = "Ahhh...
            Okay *Burp* it's like warm piss. Another!
            ";
        }
        
        
        /** Complaints or remarks made when consuming food. */
        class UGVL_Conversation_DailyRoutine_Consume_Food : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_DailyRoutine_Consume_Food;
            default GlobalCooldownSeconds = 10.0f;
            default ExampleText = "Oh my god I was so hungry!
            It's a bit bland but I can't complain...
            ";
        }
        
        
        /** Orc celebrating while is dancing */
        class UGVL_Conversation_DailyRoutine_Dancing : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_DailyRoutine_Dancing;
            default ExampleText = "Yeeeah! (dances)";
        }
        
        
        /** Remarks made during ore escort routine. */
        class UGVL_Conversation_DailyRoutine_EscortOre : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_DailyRoutine_EscortOre;
            default ExampleText = "Stay alert!";
        }
        
        
        /** Character tells another character to wait or not go so fast. */
        class UGVL_Conversation_DailyRoutine_Follow_Wait : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_DailyRoutine_Follow_Wait;
            default GlobalCooldownSeconds = 15.0f;
            default ExampleText = "Wait up!";
        }
        
        
        /** Salesman comments directed to passers-by. Generic to any stall. */
        class UGVL_Conversation_DailyRoutine_MarketStall : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_DailyRoutine_MarketStall;
            default ExampleText = "Anything catch your eye?
            I have exactly what you need! Take a look!
            ";
        }
        
        
        /** Salesman comments directed to passers-by. Specific for potion or alchemy ingredient stalls. */
        class UGVL_Conversation_DailyRoutine_MarketStall_Alchemy : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_DailyRoutine_MarketStall_Alchemy;
            default ExampleText = "Need alchemy ingredients? These will help you brew something powerful
            If you're brewing, you'll want these. The're perfect for making mixtures!
            ";
        }
        
        
        /** Salesman comments directed to passers-by. Specific for armor stalls. */
        class UGVL_Conversation_DailyRoutine_MarketStall_Armor : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_DailyRoutine_MarketStall_Armor;
            default ExampleText = "The colony is full of dangers! These could save your life!
            You wanna look tougher?
            ";
        }
        
        
        /** Salesman comments directed to passers-by. Specific for food stalls. */
        class UGVL_Conversation_DailyRoutine_MarketStall_Food : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_DailyRoutine_MarketStall_Food;
            default ExampleText = "Fresh meat straight from the hunt. It'll keep your strength in batlle
            Running out of supplies? Grab some food while you're here
            ";
        }
        
        
        /** Salesman comments directed to passers-by. Specific for weapon stalls. */
        class UGVL_Conversation_DailyRoutine_MarketStall_Weapons : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_DailyRoutine_MarketStall_Weapons;
            default ExampleText = "Do you need something pointy to get rid of someone annoying?
            Sharp, blunt, anything you need!
            ";
        }
        
        
        /** Commands and pointers of a master to their trainees, generic to any camp. */
        class UGVL_Conversation_DailyRoutine_MartialTraining : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_DailyRoutine_MartialTraining;
            default ExampleText = "Watch your footwork! Do not loose balance!
            Pay attention to your blades' alignment!
            Strike, parry, riposte!
            ";
        }
        
        
        /** Commands and pointers of a master to their trainees, NC specific. */
        class UGVL_Conversation_DailyRoutine_MartialTraining_NC : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_DailyRoutine_MartialTraining_NC;
            default ExampleText = "Come on! If you won't give your all you can go back to the Old Camp!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp);
            }
        }
        
        
        /** Commands and pointers of a master to their trainees, OC specific. */
        class UGVL_Conversation_DailyRoutine_MartialTraining_OC : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_DailyRoutine_MartialTraining_OC;
            default ExampleText = "Gomez expects more of you than this!
            Come on! Like you would in the arena!
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp);
            }
        }
        
        
        /** Commands and pointers of a master to their trainees, SC specific. */
        class UGVL_Conversation_DailyRoutine_MartialTraining_SC : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_DailyRoutine_MartialTraining_SC;
            default ExampleText = "Focus on your breathing! The Sleeper will guide your blades!
            Smoothly, with a single motion!
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp);
            }
        }
        
        
        /** Meditating sounds. */
        class UGVL_Conversation_DailyRoutine_Meditation : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_DailyRoutine_Meditation;
            default ExampleText = "Ooommmmmmm...";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return AGothicCharacterState::FindByUniqueName(n"AITESTCHARACTER") != nullptr && AGothicCharacterState::FindByUniqueName(n"AITESTCHARACTER").IsDoingMeditationInteraction();
            }
        }
        
        
        /** Remarks made when performing alchemy or cooking. */
        class UGVL_Conversation_DailyRoutine_Mixing : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_DailyRoutine_Mixing;
            default ExampleText = "Some of this here, and some of this and... this? Yeah.
            oh! It smells
            so good!
            Ugh... it doesn't smell great...
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return (Me != nullptr && Me.IsDoingAlchemyInteraction()) || (Me != nullptr && Me.IsDoingCookingInteraction());
            }
        }
        
        
        /** Remarks made when performing alchemy. */
        class UGVL_Conversation_DailyRoutine_Mixing_Alchemy : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_DailyRoutine_Mixing_Alchemy;
            default ExampleText = "Was it seraphis or flame thorn now... damn, do I have to start over?";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!((Me != nullptr && Me.IsDoingAlchemyInteraction()) || (Me != nullptr && Me.IsDoingCookingInteraction())))
                    return false;
                
                if (!(Me != nullptr && Me.IsDoingAlchemyInteraction()))
                    return false;
                
                return true;
            }
        }
        
        
        /** Remarks made when cooking. */
        class UGVL_Conversation_DailyRoutine_Mixing_Cooking : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_DailyRoutine_Mixing_Cooking;
            default ExampleText = "Okay I think this will taste great.
            I wish I could add some cheese to this...
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!((Me != nullptr && Me.IsDoingAlchemyInteraction()) || (Me != nullptr && Me.IsDoingCookingInteraction())))
                    return false;
                
                if (!(Me != nullptr && Me.IsDoingCookingInteraction()))
                    return false;
                
                return true;
            }
        }
        
        
        /** First daily routine starts after waking up. */
        class UGVL_Conversation_DailyRoutine_MorningStart : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_DailyRoutine_MorningStart;
            default ExampleText = "New day, same routine.";
        }
        
        
        /** Remarks that fit generally in any daily routine.
        Variation per guild
         */
        class UGVL_Conversation_DailyRoutine_Mumble : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_DailyRoutine_Mumble;
            default ExampleText = "*whistling*";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return Me != nullptr && !Me.IsDoingMiningInteraction() && Me != nullptr && !Me.IsCarryingObject() && Me != nullptr && !Me.IsDoingMusicListeningInteraction() && Me != nullptr && !Me.IsDoingListeningInteraction();
            }
        }
        
        
        /** Remarks that fit generally in any daily routine. Bandit camp variations. */
        class UGVL_Conversation_DailyRoutine_Mumble_BC : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_DailyRoutine_Mumble_BC;
            default ExampleText = "bandit mumble";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && !Me.IsDoingMiningInteraction() && Me != nullptr && !Me.IsCarryingObject() && Me != nullptr && !Me.IsDoingMusicListeningInteraction() && Me != nullptr && !Me.IsDoingListeningInteraction()))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_Bandit) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_Bandit)))
                    return false;
                
                return true;
            }
        }
        
        
        class UGVL_Conversation_DailyRoutine_Mumble_NC : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_DailyRoutine_Mumble_NC;
            default ExampleText = "newcamper mumble";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && !Me.IsDoingMiningInteraction() && Me != nullptr && !Me.IsCarryingObject() && Me != nullptr && !Me.IsDoingMusicListeningInteraction() && Me != nullptr && !Me.IsDoingListeningInteraction()))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                return true;
            }
        }
        
        
        /** Remarks that fit generally in any daily routine. Mercenary variations. */
        class UGVL_Conversation_DailyRoutine_Mumble_NC_Mercenary : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_DailyRoutine_Mumble_NC_Mercenary;
            default ExampleText = "mercenary mumble";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && !Me.IsDoingMiningInteraction() && Me != nullptr && !Me.IsCarryingObject() && Me != nullptr && !Me.IsDoingMusicListeningInteraction() && Me != nullptr && !Me.IsDoingListeningInteraction()))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Mercenary)))
                    return false;
                
                return true;
            }
        }
        
        
        /** Remarks that fit generally in any daily routine. Peasant variations. */
        class UGVL_Conversation_DailyRoutine_Mumble_NC_Peasant : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_DailyRoutine_Mumble_NC_Peasant;
            default ExampleText = "peasant mumble";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && !Me.IsDoingMiningInteraction() && Me != nullptr && !Me.IsCarryingObject() && Me != nullptr && !Me.IsDoingMusicListeningInteraction() && Me != nullptr && !Me.IsDoingListeningInteraction()))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Peasant)))
                    return false;
                
                return true;
            }
        }
        
        
        /** Remarks that fit generally in any daily routine. Rogue variations. */
        class UGVL_Conversation_DailyRoutine_Mumble_NC_Rogue : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_DailyRoutine_Mumble_NC_Rogue;
            default ExampleText = "rogue mumble";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && !Me.IsDoingMiningInteraction() && Me != nullptr && !Me.IsCarryingObject() && Me != nullptr && !Me.IsDoingMusicListeningInteraction() && Me != nullptr && !Me.IsDoingListeningInteraction()))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Rogue)))
                    return false;
                
                return true;
            }
        }
        
        
        /** Remarks that fit generally in any daily routine. Scraper variations. */
        class UGVL_Conversation_DailyRoutine_Mumble_NC_Scraper : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_DailyRoutine_Mumble_NC_Scraper;
            default ExampleText = "scraper mumble";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && !Me.IsDoingMiningInteraction() && Me != nullptr && !Me.IsCarryingObject() && Me != nullptr && !Me.IsDoingMusicListeningInteraction() && Me != nullptr && !Me.IsDoingListeningInteraction()))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Scraper)))
                    return false;
                
                return true;
            }
        }
        
        
        /** Remarks that fit generally in any daily routine. Water Mage variations. */
        class UGVL_Conversation_DailyRoutine_Mumble_NC_WaterMage : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_DailyRoutine_Mumble_NC_WaterMage;
            default ExampleText = "water mage mumble";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && !Me.IsDoingMiningInteraction() && Me != nullptr && !Me.IsCarryingObject() && Me != nullptr && !Me.IsDoingMusicListeningInteraction() && Me != nullptr && !Me.IsDoingListeningInteraction()))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage)))
                    return false;
                
                return true;
            }
        }
        
        
        class UGVL_Conversation_DailyRoutine_Mumble_OC : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_DailyRoutine_Mumble_OC;
            default ExampleText = "oldcamper mumble";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && !Me.IsDoingMiningInteraction() && Me != nullptr && !Me.IsCarryingObject() && Me != nullptr && !Me.IsDoingMusicListeningInteraction() && Me != nullptr && !Me.IsDoingListeningInteraction()))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                return true;
            }
        }
        
        
        /** Remarks that fit generally in any daily routine. Digger variations. */
        class UGVL_Conversation_DailyRoutine_Mumble_OC_Digger : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_DailyRoutine_Mumble_OC_Digger;
            default ExampleText = "Always the same situation... they take all the food and we get the left overs...";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && !Me.IsDoingMiningInteraction() && Me != nullptr && !Me.IsCarryingObject() && Me != nullptr && !Me.IsDoingMusicListeningInteraction() && Me != nullptr && !Me.IsDoingListeningInteraction()))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Digger)))
                    return false;
                
                return true;
            }
        }
        
        
        /** Remarks that fit generally in any daily routine. Fire Mage variations. */
        class UGVL_Conversation_DailyRoutine_Mumble_OC_FireMage : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_DailyRoutine_Mumble_OC_FireMage;
            default ExampleText = "Innos will take care of us all.";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && !Me.IsDoingMiningInteraction() && Me != nullptr && !Me.IsCarryingObject() && Me != nullptr && !Me.IsDoingMusicListeningInteraction() && Me != nullptr && !Me.IsDoingListeningInteraction()))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage)))
                    return false;
                
                return true;
            }
        }
        
        
        /** Remarks that fit generally in any daily routine. Guard variations. */
        class UGVL_Conversation_DailyRoutine_Mumble_OC_Guard : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_DailyRoutine_Mumble_OC_Guard;
            default ExampleText = "Ugh... I can't with this smell... bloody Diggers...";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && !Me.IsDoingMiningInteraction() && Me != nullptr && !Me.IsCarryingObject() && Me != nullptr && !Me.IsDoingMusicListeningInteraction() && Me != nullptr && !Me.IsDoingListeningInteraction()))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard)))
                    return false;
                
                return true;
            }
        }
        
        
        /** Remarks that fit generally in any daily routine. Ore Baron variations. */
        class UGVL_Conversation_DailyRoutine_Mumble_OC_OreBaron : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_DailyRoutine_Mumble_OC_OreBaron;
            default ExampleText = "Life is good in the colony.";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && !Me.IsDoingMiningInteraction() && Me != nullptr && !Me.IsCarryingObject() && Me != nullptr && !Me.IsDoingMusicListeningInteraction() && Me != nullptr && !Me.IsDoingListeningInteraction()))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp_OreBaron)))
                    return false;
                
                return true;
            }
        }
        
        
        /** Remarks that fit generally in any daily routine. Shadow variations. */
        class UGVL_Conversation_DailyRoutine_Mumble_OC_Shadow : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_DailyRoutine_Mumble_OC_Shadow;
            default ExampleText = "Ugh... I can't with this smell... bloody Diggers...";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && !Me.IsDoingMiningInteraction() && Me != nullptr && !Me.IsCarryingObject() && Me != nullptr && !Me.IsDoingMusicListeningInteraction() && Me != nullptr && !Me.IsDoingListeningInteraction()))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow)))
                    return false;
                
                return true;
            }
        }
        
        
        class UGVL_Conversation_DailyRoutine_Mumble_SC : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_DailyRoutine_Mumble_SC;
            default ExampleText = "swampcamper mumble";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && !Me.IsDoingMiningInteraction() && Me != nullptr && !Me.IsCarryingObject() && Me != nullptr && !Me.IsDoingMusicListeningInteraction() && Me != nullptr && !Me.IsDoingListeningInteraction()))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp)))
                    return false;
                
                return true;
            }
        }
        
        
        /** Remarks that fit generally in any daily routine. Guru variations. */
        class UGVL_Conversation_DailyRoutine_Mumble_SC_Guru : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_DailyRoutine_Mumble_SC_Guru;
            default ExampleText = "guru mumble";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && !Me.IsDoingMiningInteraction() && Me != nullptr && !Me.IsCarryingObject() && Me != nullptr && !Me.IsDoingMusicListeningInteraction() && Me != nullptr && !Me.IsDoingListeningInteraction()))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Guru)))
                    return false;
                
                return true;
            }
        }
        
        
        /** Remarks that fit generally in any daily routine. Novice variations. */
        class UGVL_Conversation_DailyRoutine_Mumble_SC_Novice : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_DailyRoutine_Mumble_SC_Novice;
            default ExampleText = "novice mumble";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && !Me.IsDoingMiningInteraction() && Me != nullptr && !Me.IsCarryingObject() && Me != nullptr && !Me.IsDoingMusicListeningInteraction() && Me != nullptr && !Me.IsDoingListeningInteraction()))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Novice)))
                    return false;
                
                return true;
            }
        }
        
        
        /** Remarks that fit generally in any daily routine. Templar variations. */
        class UGVL_Conversation_DailyRoutine_Mumble_SC_Templar : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_DailyRoutine_Mumble_SC_Templar;
            default ExampleText = "templar mumble";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && !Me.IsDoingMiningInteraction() && Me != nullptr && !Me.IsCarryingObject() && Me != nullptr && !Me.IsDoingMusicListeningInteraction() && Me != nullptr && !Me.IsDoingListeningInteraction()))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Templar)))
                    return false;
                
                return true;
            }
        }
        
        
        /** Remarks made during listening to music event. */
        class UGVL_Conversation_DailyRoutine_Music_Duration : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_DailyRoutine_Music_Duration;
            default ExampleText = "*humming* ... it sounds nice ...
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return Me != nullptr && Me.IsDoingMusicListeningInteraction();
            }
        }
        
        
        /** Remarks made when first hearing music. */
        class UGVL_Conversation_DailyRoutine_Music_Start : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_DailyRoutine_Music_Start;
            default ExampleText = "Music!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return Me != nullptr && Me.IsDoingMusicListeningInteraction();
            }
        }
        
        
        /** Remarks made during patrol daily routine. */
        class UGVL_Conversation_DailyRoutine_Patrol : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_DailyRoutine_Patrol;
            default ExampleText = "1.. 2.. 3.. 4.. 5..
            *whistling*
            Is this the easiest job or the hardest one?
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return Me != nullptr && Me.IsDoingPatrollingInteraction();
            }
        }
        
        
        /** Orc praying to the sleeper */
        class UGVL_Conversation_DailyRoutine_Praying : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_DailyRoutine_Praying;
            default ExampleText = "Awaken!";
        }
        
        
        /** Mumbles while the NPC is in the jail */
        class UGVL_Conversation_DailyRoutine_Prisoner : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_DailyRoutine_Prisoner;
            default ExampleText = "Let me out!";
        }
        
        
        /** Complaints / remarks to self when waiting in a queue. */
        class UGVL_Conversation_DailyRoutine_Queue : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_DailyRoutine_Queue;
            default ExampleText = "Come on, I won't have any time left...
            ";
        }
        
        
        /** Remarks made when done repairing. */
        class UGVL_Conversation_DailyRoutine_Repair_End : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_DailyRoutine_Repair_End;
            default ExampleText = "Okay, fixed. Like new!
            ";
        }
        
        
        /** Remarks made when first starting repair routine. */
        class UGVL_Conversation_DailyRoutine_Repair_Start : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_DailyRoutine_Repair_Start;
            default ExampleText = "What happened here?
            Again?
            Ugh... this doesn't look good...
            ";
        }
        
        
        /** Attempting to attract and recruit people to the Swamp Camp. */
        class UGVL_Conversation_DailyRoutine_SwampPropaganda : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_DailyRoutine_SwampPropaganda;
            default ExampleText = "Listen! Open your soul! Awaken!
            Pay attention and the Sleeper will reach out!
            ";
        }
        
        
        /**
         * Attempting to attract and recruit people to the Swamp Camp. Sentences more specific to the NC.
         */
        
        class UGVL_Conversation_DailyRoutine_SwampPropaganda_NC : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_DailyRoutine_SwampPropaganda_NC;
            default ExampleText = "This is no true freedom, you're just doing the same things for different masters!
            Do you not feel a humm when you lay your hands on some ore?? Do
            you not yearn to understand it?
            ";
        }
        
        
        /**
         * Attempting to attract and recruit people to the Swamp Camp. Sentences more specific to the OC.
         */
        
        class UGVL_Conversation_DailyRoutine_SwampPropaganda_OC : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_DailyRoutine_SwampPropaganda_OC;
            default ExampleText = "Day by day doing the same, without no true purpose!
            Loyalty and strenght? That's exactly what the Sleeper expects from us!
            ";
        }
        
        
        /** Weather observation to self. */
        class UGVL_Conversation_DailyRoutine_Weather : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_DailyRoutine_Weather;
            default ExampleText = "Hmm.. does it look like rain?
            Damn, it's raining cats and dogs...
            ";
        }
        
        
        /** Complaints / remarks made during farming daily routines. */
        class UGVL_Conversation_DailyRoutine_Work_Farming : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_DailyRoutine_Work_Farming;
            default ExampleText = "Ah.. did something just bite me?
            *Barf* ... I won't get used to the smell ...
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return Me != nullptr && Me.IsDoingFarmingInteraction();
            }
        }
        
        
        /** Complaints / remarks made during mining daily routines. */
        class UGVL_Conversation_DailyRoutine_Work_Mining : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_DailyRoutine_Work_Mining;
            default ExampleText = "Ooff.. My back is sore already..
            *Coughing*
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return Me != nullptr && Me.IsDoingMiningInteraction();
            }
        }
        
        
        /**
         * Character passes by another character and says something to them. Generic for everyone, could
         * refference the weather or something like that. For use with characters outside camps or in the
         * bandit camp. Preferrably multiple variations per character.
         */
        
        class UGVL_Conversation_PassBy : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy;
            default GlobalCooldownSeconds = 15.0f;
            default ExampleText = "Hey, stay sharp out there.
            Keep an eye on your back.
            Another long day, huh?
            Stay out of trouble.";
        }
        
        
        /**
         * Bandit passes by another character and says something to them. Bandit camp generic. Preferrably
         * multiple variations per character.
         */
        
        class UGVL_Conversation_PassBy_BC : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy_BC;
            default ExampleText = "Hey! You owe me for last raid!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_Bandit) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_Bandit);
            }
        }
        
        
        /**
         * Character passes by another character they consider a close friend. Generic for everyone, could
         * refference the weather or something like that. For use with characters outside camps or in the
         * bandit camp. Preferrably multiple variations per character.
         */
        
        class UGVL_Conversation_PassBy_Friend : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy_Friend;
            default ExampleText = "Hey! Nice seeing you!";
        }
        
        
        /**
         * New Camper passes by another character and says something to them. New Camp generic. Preferrably
         * multiple variations per character.
         */
        
        class UGVL_Conversation_PassBy_NC : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy_NC;
            default ExampleText = "We make our own luck in this place.
            Anything new from the mines?
            Keep your head down
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp);
            }
        }
        
        
        /**
         * Peasant passes by another character and says something to them. Preferrably multiple variations
         * per character.
         */
        
        class UGVL_Conversation_PassBy_NC_BAU : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy_NC_BAU;
            default ExampleText = "It's hard work just to get by these days. 
            Every bit of effort counts in this place.
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Peasant) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Peasant)))
                    return false;
                
                return true;
            }
        }
        
        
        /** Peasant passes by a Peasant and says something to him */
        class UGVL_Conversation_PassBy_NC_BAU_toBAU : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy_NC_BAU_toBAU;
            default ExampleText = "Have you heard any news from the camp? 
            Let's hope for better days ahead. 
            How's your rice growing?
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Peasant) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Peasant)))
                    return false;
                
                if (!(Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Peasant)))
                    return false;
                
                return true;
            }
        }
        
        
        /** Peasant passes by a Water Mage and says something to him */
        class UGVL_Conversation_PassBy_NC_BAU_toKDW : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy_NC_BAU_toKDW;
            default ExampleText = "Your magic must help with the crops 
            Got some ore left?
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Peasant) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Peasant)))
                    return false;
                
                if (!(Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage)))
                    return false;
                
                return true;
            }
        }
        
        
        /** Peasant passes by a Rogue and says something to him */
        class UGVL_Conversation_PassBy_NC_BAU_toORG : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy_NC_BAU_toORG;
            default ExampleText = "I hear you know how to find things... 
            Just don't bring any trouble our way.
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Peasant) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Peasant)))
                    return false;
                
                if (!(Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Rogue)))
                    return false;
                
                return true;
            }
        }
        
        
        /** Peasant passes by a character from the Swamp Camp and says something to him */
        class UGVL_Conversation_PassBy_NC_BAU_toSC : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy_NC_BAU_toSC;
            default ExampleText = "What brings you to the New Camp?
            It's a long way. 
            Do you have any tales from the swamp?
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Peasant) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Peasant)))
                    return false;
                
                if (!(Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp)))
                    return false;
                
                return true;
            }
        }
        
        
        /** Peasant passes by a Scraper and says something to him */
        class UGVL_Conversation_PassBy_NC_BAU_toSFB : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy_NC_BAU_toSFB;
            default ExampleText = "Hope you're finding enough supplies.
            We need all the help we can get.
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Peasant) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Peasant)))
                    return false;
                
                if (!(Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Scraper)))
                    return false;
                
                return true;
            }
        }
        
        
        /** Peasant passes by a Mercenary and says something to him */
        class UGVL_Conversation_PassBy_NC_BAU_toSLD : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy_NC_BAU_toSLD;
            default ExampleText = "Your sword looks sharp 
            I wish I had your strength
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Peasant) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Peasant)))
                    return false;
                
                if (!(Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Mercenary)))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * Water mage passes by another character and says something to them. Preferrably multiple
         * variations per character.
         */
        
        class UGVL_Conversation_PassBy_NC_KDW : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy_NC_KDW;
            default ExampleText = "Stay focused 
            Water holds many secrets
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage)))
                    return false;
                
                return true;
            }
        }
        
        
        /** Water mage passes by a Peasant and says something to him */
        class UGVL_Conversation_PassBy_NC_KDW_toBAU : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy_NC_KDW_toBAU;
            default ExampleText = "I hope you're finding enough to eat around here. 
            Patience is key in both work and life.
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage)))
                    return false;
                
                if (!(Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Peasant)))
                    return false;
                
                return true;
            }
        }
        
        
        /** Water mage passes by a Water mage and says something to him */
        class UGVL_Conversation_PassBy_NC_KDW_toKDW : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy_NC_KDW_toKDW;
            default ExampleText = "The waters are restless today 
            Keep your focus
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage)))
                    return false;
                
                if (!(Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage)))
                    return false;
                
                return true;
            }
        }
        
        
        /** Water mage passes by a Rogue and says something to him */
        class UGVL_Conversation_PassBy_NC_KDW_toORG : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy_NC_KDW_toORG;
            default ExampleText = "Keep your eyes peeled.
            Don't underestimate the power of knowledge
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage)))
                    return false;
                
                if (!(Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Rogue)))
                    return false;
                
                return true;
            }
        }
        
        
        /** Water mage passes by a Scrapers and says something to him */
        class UGVL_Conversation_PassBy_NC_KDW_toSFB : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy_NC_KDW_toSFB;
            default ExampleText = "Keep your work steady.
            I hope you're finding what you need.
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage)))
                    return false;
                
                if (!(Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Scraper)))
                    return false;
                
                return true;
            }
        }
        
        
        /** Water mage passes by a Mercenary and says something to him */
        class UGVL_Conversation_PassBy_NC_KDW_toSLD : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy_NC_KDW_toSLD;
            default ExampleText = "Keep your sword sharp 
            We need more than strength to survive.
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage)))
                    return false;
                
                if (!(Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Mercenary)))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * Rogue passes by another character and says something to them. Preferrably multiple variations per
         * character."
         */
        
        class UGVL_Conversation_PassBy_NC_ORG : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy_NC_ORG;
            default ExampleText = "You never know who's listening. 
            Stay out of my way.
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Rogue) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Rogue)))
                    return false;
                
                return true;
            }
        }
        
        
        /** Rogue passes by a Peasant and says something to him */
        class UGVL_Conversation_PassBy_NC_ORG_toBAU : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy_NC_ORG_toBAU;
            default ExampleText = "Watch your pockets.
            Life's tough.
            If you hear any whispers, keep them to yourself.
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Rogue) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Rogue)))
                    return false;
                
                if (!(Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Peasant)))
                    return false;
                
                return true;
            }
        }
        
        
        /** Rogue passes by a Water Mage and says something to him */
        class UGVL_Conversation_PassBy_NC_ORG_toKDW : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy_NC_ORG_toKDW;
            default ExampleText = "Your magic won't save you from a quick blade. 
            What do you need all that water for, anyway?\"
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Rogue) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Rogue)))
                    return false;
                
                if (!(Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage)))
                    return false;
                
                return true;
            }
        }
        
        
        /** Rogue passes by a Rogue and says something to him */
        class UGVL_Conversation_PassBy_NC_ORG_toORG : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy_NC_ORG_toORG;
            default ExampleText = "Any good rumors lately? 
            Good work. 
            Trust no one
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Rogue) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Rogue)))
                    return false;
                
                if (!(Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Rogue)))
                    return false;
                
                return true;
            }
        }
        
        
        /** Rogue passes by a character from the Swamp Camp and says something to him */
        class UGVL_Conversation_PassBy_NC_ORG_toSC : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy_NC_ORG_toSC;
            default ExampleText = "Looking for something? 
            Care to share any secrets?
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Rogue) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Rogue)))
                    return false;
                
                if (!(Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp)))
                    return false;
                
                return true;
            }
        }
        
        
        /** Rogue passes by a Scraper and says something to him */
        class UGVL_Conversation_PassBy_NC_ORG_toSFB : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy_NC_ORG_toSFB;
            default ExampleText = "Keep your heads up.
            You better stay out of sight.
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Rogue) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Rogue)))
                    return false;
                
                if (!(Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Scraper)))
                    return false;
                
                return true;
            }
        }
        
        
        /** Rogue passes by a Mercenary and says something to him */
        class UGVL_Conversation_PassBy_NC_ORG_toSLD : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy_NC_ORG_toSLD;
            default ExampleText = "I could show you a trick or two
            Not everything is about the ore...      
            Don't worry, I won't steal your glory...
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Rogue) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Rogue)))
                    return false;
                
                if (!(Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Mercenary)))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * Scraper passes by another character and says something to them. Preferrably multiple variations
         * per character.
         */
        
        class UGVL_Conversation_PassBy_NC_SFB : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy_NC_SFB;
            default ExampleText = "We're all in this together. 
            Hope you're keeping busy.
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Scraper) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Scraper)))
                    return false;
                
                return true;
            }
        }
        
        
        /** Scraper passes by a Peasant and says something to him */
        class UGVL_Conversation_PassBy_NC_SFB_toBAU : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy_NC_SFB_toBAU;
            default ExampleText = "Hope you're finding enough food.
            Watch yourself out there!
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Scraper) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Scraper)))
                    return false;
                
                if (!(Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Peasant)))
                    return false;
                
                return true;
            }
        }
        
        
        /** Scraper passes by a Water Mage and says something to him */
        class UGVL_Conversation_PassBy_NC_SFB_toKDW : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy_NC_SFB_toKDW;
            default ExampleText = "Stay close.
            Keep an eye out!
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Scraper) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Scraper)))
                    return false;
                
                if (!(Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage)))
                    return false;
                
                return true;
            }
        }
        
        
        /** Scraper passes by a Rogue and says something to him */
        class UGVL_Conversation_PassBy_NC_SFB_toORG : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy_NC_SFB_toORG;
            default ExampleText = "Stay away from my tools! 
            I see you lurking; what's your plan?
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Scraper) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Scraper)))
                    return false;
                
                if (!(Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Rogue)))
                    return false;
                
                return true;
            }
        }
        
        
        /** Scraper passes by a character from the Swamp Camp and says something to him */
        class UGVL_Conversation_PassBy_NC_SFB_toSC : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy_NC_SFB_toSC;
            default ExampleText = "I hope the Sleeper is watching over you. 
            You should be careful here.
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Scraper) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Scraper)))
                    return false;
                
                if (!(Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp)))
                    return false;
                
                return true;
            }
        }
        
        
        /** Scraper passes by a Scraper and says something to him */
        class UGVL_Conversation_PassBy_NC_SFB_toSFB : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy_NC_SFB_toSFB;
            default ExampleText = "Have you found anything good today?
            Don't push too hard; Let's take a break soon.
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Scraper) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Scraper)))
                    return false;
                
                if (!(Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Scraper)))
                    return false;
                
                return true;
            }
        }
        
        
        /** Scraper passes by a Mercenary and says something to him */
        class UGVL_Conversation_PassBy_NC_SFB_toSLD : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy_NC_SFB_toSLD;
            default ExampleText = "Hope you're ready for anything out there. 
            We need your sword.
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Scraper) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Scraper)))
                    return false;
                
                if (!(Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Mercenary)))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * Mercenary passes by another character and says something to them. Preferrably multiple variations
         * per character."
         */
        
        class UGVL_Conversation_PassBy_NC_SLD : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy_NC_SLD;
            default ExampleText = "Trouble can come from anywhere. 
            Watch each other's backs.
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Mercenary) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Mercenary)))
                    return false;
                
                return true;
            }
        }
        
        
        /** Mercenary passes by a Peasant and says something to him */
        class UGVL_Conversation_PassBy_NC_SLD_toBAU : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy_NC_SLD_toBAU;
            default ExampleText = "Stay out of the way.
            Hope you're finding enough to get by. 
            Find cover and stay safe.
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Mercenary) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Mercenary)))
                    return false;
                
                if (!(Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Peasant)))
                    return false;
                
                return true;
            }
        }
        
        
        /** Mercenary passes by a Water Mage and says something to him */
        class UGVL_Conversation_PassBy_NC_SLD_toKDW : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy_NC_SLD_toKDW;
            default ExampleText = "The water won't protect us in a fight. 
            Trouble is always lurking.
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Mercenary) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Mercenary)))
                    return false;
                
                if (!(Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage)))
                    return false;
                
                return true;
            }
        }
        
        
        /** Mercenary passes by a Rogue and says something to him */
        class UGVL_Conversation_PassBy_NC_SLD_toORG : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy_NC_SLD_toORG;
            default ExampleText = "We're not here to play games. 
            Just don't bring trouble.
            This camp has eyes everywhere.
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Mercenary) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Mercenary)))
                    return false;
                
                if (!(Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Rogue)))
                    return false;
                
                return true;
            }
        }
        
        
        /** Mercenary passes by a character from the Swamp Camp and says something to him */
        class UGVL_Conversation_PassBy_NC_SLD_toSC : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy_NC_SLD_toSC;
            default ExampleText = "Don't make trouble here Looney! 
            Didin't the Sleeper tell you you are not welcomed here?
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Mercenary) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Mercenary)))
                    return false;
                
                if (!(Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp)))
                    return false;
                
                return true;
            }
        }
        
        
        /** Mercenary passes by a Scraper and says something to him */
        class UGVL_Conversation_PassBy_NC_SLD_toSFB : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy_NC_SLD_toSFB;
            default ExampleText = "Keep up the work.
            Keep it steady.
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Mercenary) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Mercenary)))
                    return false;
                
                if (!(Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Scraper)))
                    return false;
                
                return true;
            }
        }
        
        
        /** Mercenary passes by a Mercenary and says something to him */
        class UGVL_Conversation_PassBy_NC_SLD_toSLD : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy_NC_SLD_toSLD;
            default ExampleText = "Let's stick together.
            You cover my flank. 
            Keep your gear in check.
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Mercenary) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Mercenary)))
                    return false;
                
                if (!(Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Mercenary)))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * Old Camper passes by another character and says something to them. Old Camp generic. Preferrably
         * multiple variations per character.
         */
        
        class UGVL_Conversation_PassBy_OC : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy_OC;
            default ExampleText = "Don't get into Gomez' way.
            Eyes are always watching.
            Stay sharp.\"
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp);
            }
        }
        
        
        /**
         * Ore Baron passes by another character and says something to them. Preferrably multiple variations
         * per character.
         */
        
        class UGVL_Conversation_PassBy_OC_EBR : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy_OC_EBR;
            default ExampleText = "Watch your step.
            Make way.
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_OreBaron) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp_OreBaron)))
                    return false;
                
                return true;
            }
        }
        
        
        /** Ore Baron passes by another Ore Baron and says something to them.
        Not very common.
         */
        class UGVL_Conversation_PassBy_OC_EBR_toEBR : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy_OC_EBR_toEBR;
            default ExampleText = "Good day.
            We should discuss the next ore distribution soon.
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_OreBaron) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp_OreBaron)))
                    return false;
                
                if (!(Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp_OreBaron)))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * Ore Baron passes by a Guard and says something to them. Not very common. (Could be
         * interchangeable with EBR.toSTT)
         */
        
        class UGVL_Conversation_PassBy_OC_EBR_toGRD : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy_OC_EBR_toGRD;
            default ExampleText = "Keep your eyes open. 
            We can't afford any slip-ups, understand?
            Make sure the ore is properly secured.
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_OreBaron) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp_OreBaron)))
                    return false;
                
                if (!(Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard)))
                    return false;
                
                return true;
            }
        }
        
        
        /** Ore Baron passes by a Fire Mage and says something to them.
        Not very common.
         */
        class UGVL_Conversation_PassBy_OC_EBR_toKDF : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy_OC_EBR_toKDF;
            default ExampleText = "You mages always seem to have your own agenda. 
            I hope Gomez gets his share of what you're working on.
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_OreBaron) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp_OreBaron)))
                    return false;
                
                if (!(Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage)))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * Ore Baron passes by a Shadow and says something to them. (Could be interchangeable with
         * EBR.toGRD) Not very common.
         */
        
        class UGVL_Conversation_PassBy_OC_EBR_toSTT : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy_OC_EBR_toSTT;
            default ExampleText = "Keep your eyes open.
            We can't afford any slip-ups, understand?
            Make sure the ore is properly secured.
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_OreBaron) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp_OreBaron)))
                    return false;
                
                if (!(Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow)))
                    return false;
                
                return true;
            }
        }
        
        
        /** Ore Baron passes by a Digger (Castle Servant) and says something to them.
        Not very common.
         */
        class UGVL_Conversation_PassBy_OC_EBR_toVLK : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy_OC_EBR_toVLK;
            default ExampleText = "You missed a spot.
            Haven't you got anything else to do?
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_OreBaron) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp_OreBaron)))
                    return false;
                
                if (!(Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Digger)))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * Guard passes by another character and says something to them. Preferrably multiple variations per
         * character.
         */
        
        class UGVL_Conversation_PassBy_OC_GRD : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy_OC_GRD;
            default ExampleText = "Stay alert; trouble can strike at any moment. 
            Move along!
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard)))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * Guard passes by an Ore Baron and says something to him. (Could be interchangeable with STT.toEBR)
         * Not very common
         */
        
        class UGVL_Conversation_PassBy_OC_GRD_toEBR : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy_OC_GRD_toEBR;
            default ExampleText = "All's quiet.
            Nothing to report, sir.
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard)))
                    return false;
                
                if (!(Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp_OreBaron)))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * Guard passes by another Guard and says something to him. (Could be interchangeable with
         * STT.toSTT, GRD.toSTT or STT.toGRD)
         */
        
        class UGVL_Conversation_PassBy_OC_GRD_toGRD : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy_OC_GRD_toGRD;
            default ExampleText = "Hey, how is the watch going?
            Don't let your guard down.
            I'll take the east side; you cover the west. 
            Keep an eye on the newcomers.
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard)))
                    return false;
                
                if (!(Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard)))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * Guard passes by a Fire Mage and says something to him. (Could be interchangeable with STT.toKDF)
         */
        
        class UGVL_Conversation_PassBy_OC_GRD_toKDF : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy_OC_GRD_toKDF;
            default ExampleText = "Keep that fire under control.
            I'll be around.
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard)))
                    return false;
                
                if (!(Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage)))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * Guard passes by a character from the New Camp and says something to him. (Could be
         * interchangeable with STT.toNC)
         */
        
        class UGVL_Conversation_PassBy_OC_GRD_toNC : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy_OC_GRD_toNC;
            default ExampleText = "I'll be watching you Newcamper! 
            Tensions are rising between camps.
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard)))
                    return false;
                
                if (!(Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * Guard passes by a character from the Swamp Camp and says something to him. (Could be
         * interchangeable with STT.toSC)
         */
        
        class UGVL_Conversation_PassBy_OC_GRD_toSC : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy_OC_GRD_toSC;
            default ExampleText = "Don't do anything weird here... 
            What brings you to the Old Camp today?
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard)))
                    return false;
                
                if (!(Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp)))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * Guard passes by a Shadow and says something to him. (Could be interchangeable with STT.toSTT,
         * GRD.toGRD or STT.toGRD)
         */
        
        class UGVL_Conversation_PassBy_OC_GRD_toSTT : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy_OC_GRD_toSTT;
            default ExampleText = "Hey, how is the watch going? 
            Don't let your guard down
            I'll take the east side; you cover the west. 
            Keep an eye on the newcomers.
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard)))
                    return false;
                
                if (!(Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow)))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * Guard passes by a Digger and says something to him. (Could be interchangeable with STT.toVLK)
         */
        
        class UGVL_Conversation_PassBy_OC_GRD_toVLK : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy_OC_GRD_toVLK;
            default ExampleText = "Ugh... you reek! 
            I'm watching you. 
            No slacking!
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard)))
                    return false;
                
                if (!(Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Digger)))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * Fire Mage passes by another character and says something to them. Preferrably multiple variations
         * per character.
         */
        
        class UGVL_Conversation_PassBy_OC_KDF : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy_OC_KDF;
            default ExampleText = "Magic isn't just for show.
            The heat of the flames can teach more than you think.
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage)))
                    return false;
                
                return true;
            }
        }
        
        
        /** Fire Mage passes by an Ore Baron and says something to them.
        Not very common
         */
        class UGVL_Conversation_PassBy_OC_KDF_toEBR : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy_OC_KDF_toEBR;
            default ExampleText = "Don't underestimate the power of magic. 
            I trust your miners are working efficiently.
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage)))
                    return false;
                
                if (!(Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp_OreBaron)))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * Fire Mage passes by a Guard and says something to them. (Could be interchangeable with KDF.toSTT)
         */
        
        class UGVL_Conversation_PassBy_OC_KDF_toGRD : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy_OC_KDF_toGRD;
            default ExampleText = "My flames can be unpredictable.
            I hope you're watching the perimeter
            Magic is as dangerous as any blade.
            Let us know if you see anything unusual
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage)))
                    return false;
                
                if (!(Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard)))
                    return false;
                
                return true;
            }
        }
        
        
        /** Fire Mage passes by another Fire Mage and says something to them. */
        class UGVL_Conversation_PassBy_OC_KDF_toKDF : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy_OC_KDF_toKDF;
            default ExampleText = "Something's brewing.
            Stay safe out there; the flames can be unpredictable.
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage)))
                    return false;
                
                if (!(Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage)))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * Fire Mage passes by a Shadow and says something to them. (Could be interchangeable with
         * KDF.toGRD)
         */
        
        class UGVL_Conversation_PassBy_OC_KDF_toSTT : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy_OC_KDF_toSTT;
            default ExampleText = "My flames can be unpredictable.
            I hope you're watching the perimeter.
            Magic is as dangerous as any blade. 
            Let us know if you see anything unusual.
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage)))
                    return false;
                
                if (!(Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow)))
                    return false;
                
                return true;
            }
        }
        
        
        /** Fire Mage passes by a Digger (Castle Servant) and says something to them. */
        class UGVL_Conversation_PassBy_OC_KDF_toVLK : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy_OC_KDF_toVLK;
            default ExampleText = "The art of fire isnt' for everyone.
            Let me know if you find anything interesting.
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage)))
                    return false;
                
                if (!(Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Digger)))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * Shadow passes by another character and says something to them. Preferrably multiple variations
         * per character.
         */
        
        class UGVL_Conversation_PassBy_OC_STT : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy_OC_STT;
            default ExampleText = "Trouble can strike at any moment. 
            Move along!
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow)))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * Shadow passes by an Ore Baron and says something to him. (Could be interchangeable with
         * GRD.toEBR) Not very common
         */
        
        class UGVL_Conversation_PassBy_OC_STT_toEBR : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy_OC_STT_toEBR;
            default ExampleText = "Lord. 
            All's quiet. 
            Nothing to report, sir.
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow)))
                    return false;
                
                if (!(Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp_OreBaron)))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * Shadow passes by a Guard and says something to him. (Could be interchangeable with STT.toSTT,
         * GRD.toGRD or GRD.toSTT)
         */
        
        class UGVL_Conversation_PassBy_OC_STT_toGRD : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy_OC_STT_toGRD;
            default ExampleText = "Hey, how is the watch going? 
            Don't let your guard down.
            I'll take the east side; you cover the west. 
            Keep an eye on the newcomers\"
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow)))
                    return false;
                
                if (!(Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard)))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * Shadow passes by a Fire Mage and says something to him. (Could be interchangeable with GRD.toKDF)
         */
        
        class UGVL_Conversation_PassBy_OC_STT_toKDF : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy_OC_STT_toKDF;
            default ExampleText = "Keep that fire under control 
            I'll be around.
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow)))
                    return false;
                
                if (!(Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage)))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * Shadow passes by a character from the New Camp and says something to him. (Could be
         * interchangeable with GRD.toNC)
         */
        
        class UGVL_Conversation_PassBy_OC_STT_toNC : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy_OC_STT_toNC;
            default ExampleText = "I'll be watching you Newcomer! 
            Tensions are rising between camps.
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow)))
                    return false;
                
                if (!(Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * Shadow passes by a character from the Swamp Camp and says something to him. (Could be
         * interchangeable with GRD.toSC)
         */
        
        class UGVL_Conversation_PassBy_OC_STT_toSC : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy_OC_STT_toSC;
            default ExampleText = "Don't do anything weird here... 
            What brings you to the Old Camp today?
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow)))
                    return false;
                
                if (!(Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp)))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * Shadow passes by a Shadow and says something to him. (Could be interchangeable with GRD.toGRD,
         * STT.toGRD or GRD.toSTT)
         */
        
        class UGVL_Conversation_PassBy_OC_STT_toSTT : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy_OC_STT_toSTT;
            default ExampleText = "Hey, how is the watch going? 
            Don't let your guard down.
            I'll take the east side; you cover the west. 
            Keep an eye on the newcomers\"
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow)))
                    return false;
                
                if (!(Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow)))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * Shadow passes by a Digger and says something to him. (Could be interchangeable with GRD.toVLK)
         */
        
        class UGVL_Conversation_PassBy_OC_STT_toVLK : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy_OC_STT_toVLK;
            default ExampleText = "Ugh... you reek! 
            I'm watching you. 
            No slacking!
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow)))
                    return false;
                
                if (!(Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Digger)))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * Digger passes by another character and says something to them. Preferrably multiple variations
         * per character.
         */
        
        class UGVL_Conversation_PassBy_OC_VLK : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy_OC_VLK;
            default ExampleText = "Got any news from the mines? 
            Got anything to eat?
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Digger) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Digger)))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * Digger passes by a Guard and says something to him. (Could be interchangeable with VLK.toSTT)
         */
        
        class UGVL_Conversation_PassBy_OC_VLK_toGRD : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy_OC_VLK_toGRD;
            default ExampleText = "Hope everything's quiet on your end.
            Don't let Gomez forget us! 
            We're working hard here!
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Digger) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Digger)))
                    return false;
                
                if (!(Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard)))
                    return false;
                
                return true;
            }
        }
        
        
        /** Digger passes by a character from the New Camp and says something to him */
        class UGVL_Conversation_PassBy_OC_VLK_toNC : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy_OC_VLK_toNC;
            default ExampleText = "The wilds aren't forgiving. 
            What brings here?
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Digger) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Digger)))
                    return false;
                
                if (!(Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                return true;
            }
        }
        
        
        /** Digger passes by a character from the Swamp Camp and says something to him */
        class UGVL_Conversation_PassBy_OC_VLK_toSC : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy_OC_VLK_toSC;
            default ExampleText = "What a looney!
            Got any weed on you?
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Digger) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Digger)))
                    return false;
                
                if (!(Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp)))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * Digger passes by a Shadow and says something to him. (Could be interchangeable with VLK.toGRD)
         */
        
        class UGVL_Conversation_PassBy_OC_VLK_toSTT : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy_OC_VLK_toSTT;
            default ExampleText = "Hope everything's quiet on your end.
            Don't let Gomez forget us! 
            We're working hard here! 
            Keep the noise down.
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Digger) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Digger)))
                    return false;
                
                if (!(Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow)))
                    return false;
                
                return true;
            }
        }
        
        
        /** Digger passes by a Digger and says something to him */
        class UGVL_Conversation_PassBy_OC_VLK_toVLK : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy_OC_VLK_toVLK;
            default ExampleText = "Hey! How are your hands? 
            How's it going in the mines?
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Digger) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Digger)))
                    return false;
                
                if (!(Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Digger)))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * Swamp Camper passes by another character and says something to them. Swamp Camp generic.
         * Preferrably multiple variations per character.
         */
        
        class UGVL_Conversation_PassBy_SC : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy_SC;
            default ExampleText = "May the Sleeper be with you.
            The Sleeper watches over us all.
            The path to enlightenment isn't easy.
            Another day in service to the Sleeper.
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp);
            }
        }
        
        
        /**
         * Guru passes by another character and says something to them. Preferrably multiple variations per
         * character.
         */
        
        class UGVL_Conversation_PassBy_SC_GUR : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy_SC_GUR;
            default ExampleText = "Wisdom flows like water; seek it with patience.
            Find peace in the Sleeper.
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp)))
                    return false;
                
                if (!(((Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Guru) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Guru))) || ((Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Guru) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Guru)))))
                    return false;
                
                return true;
            }
        }
        
        
        /** Guru passes by a Guru and says something to him */
        class UGVL_Conversation_PassBy_SC_GUR_toGUR : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy_SC_GUR_toGUR;
            default ExampleText = "Have you felt the whispers of the Sleeper today? 
            May the Sleeper enlighten you.
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp)))
                    return false;
                
                if (!(((Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Guru) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Guru))) || ((Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Guru) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Guru)))))
                    return false;
                
                if (!(Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Guru)))
                    return false;
                
                return true;
            }
        }
        
        
        /** Guru passes by a Novice and says something to him */
        class UGVL_Conversation_PassBy_SC_GUR_toNOV : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy_SC_GUR_toNOV;
            default ExampleText = "Listen to the Sleeper.
            Embrace your journey.
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp)))
                    return false;
                
                if (!(((Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Guru) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Guru))) || ((Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Guru) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Guru)))))
                    return false;
                
                if (!(Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Novice)))
                    return false;
                
                return true;
            }
        }
        
        
        /** Guru passes by a Templar and says something to him */
        class UGVL_Conversation_PassBy_SC_GUR_toTPL : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy_SC_GUR_toTPL;
            default ExampleText = "Let the Sleeper guide your sword. 
            The Swamp's secrets are yours to protect.
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp)))
                    return false;
                
                if (!(((Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Guru) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Guru))) || ((Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Guru) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Guru)))))
                    return false;
                
                if (!(Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Templar)))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * Novice passes by another character and says something to them. Preferrably multiple variations
         * per character.
         */
        
        class UGVL_Conversation_PassBy_SC_NOV : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy_SC_NOV;
            default ExampleText = "May the Sleeper guide you.
            Do you think the Sleeper listens to us?
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp)))
                    return false;
                
                if (!(((Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Novice) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Novice))) || ((Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Novice) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Novice)))))
                    return false;
                
                return true;
            }
        }
        
        
        /** Novice passes by a Guru and says something to him */
        class UGVL_Conversation_PassBy_SC_NOV_toGUR : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy_SC_NOV_toGUR;
            default ExampleText = "Can you share a lesson 
            How can I understand the path of the Sleeper?
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp)))
                    return false;
                
                if (!(((Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Novice) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Novice))) || ((Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Novice) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Novice)))))
                    return false;
                
                if (!(Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Guru)))
                    return false;
                
                return true;
            }
        }
        
        
        /** Novice passes by a Novice and says something to him */
        class UGVL_Conversation_PassBy_SC_NOV_toNOV : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy_SC_NOV_toNOV;
            default ExampleText = "Have you heard the latest tales from the Swamp? 
            Have you heard the Baals today? 
            Will we ever understand the Sleeper?
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp)))
                    return false;
                
                if (!(((Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Novice) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Novice))) || ((Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Novice) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Novice)))))
                    return false;
                
                if (!(Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Novice)))
                    return false;
                
                return true;
            }
        }
        
        
        /** Novice passes by a Templar and says something to him */
        class UGVL_Conversation_PassBy_SC_NOV_toTPL : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy_SC_NOV_toTPL;
            default ExampleText = "May the Sleeper make you confident.
            I hope the Sleeper considers me worthy.
            ";
        }
        
        
        /**
         * Templar passes by another character and says something to them. Preferrably multiple variations
         * per character.
         */
        
        class UGVL_Conversation_PassBy_SC_TPL : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy_SC_TPL;
            default ExampleText = "The sleeper protects us.";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp)))
                    return false;
                
                if (!(((Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Templar) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Templar))) || ((Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Templar) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Templar)))))
                    return false;
                
                return true;
            }
        }
        
        
        /** Templar passes by a Guru and says something to him */
        class UGVL_Conversation_PassBy_SC_TPL_toGUR : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy_SC_TPL_toGUR;
            default ExampleText = "We need your guidance.
            Got any more swamp weed on you?
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp)))
                    return false;
                
                if (!(((Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Templar) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Templar))) || ((Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Templar) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Templar)))))
                    return false;
                
                if (!(Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Guru)))
                    return false;
                
                return true;
            }
        }
        
        
        /** Templar passes by a Novice and says something to him */
        class UGVL_Conversation_PassBy_SC_TPL_toNOV : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy_SC_TPL_toNOV;
            default ExampleText = "Our faith will be tested.
            Every trial you face will make you stronger.
            Sleeper is here to guide us.
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp)))
                    return false;
                
                if (!(((Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Templar) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Templar))) || ((Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Templar) && Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Templar)))))
                    return false;
                
                if (!(Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Novice)))
                    return false;
                
                return true;
            }
        }
        
        
        /** Templar passes by a Templar and says something to him */
        class UGVL_Conversation_PassBy_SC_TPL_toTPL : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_PassBy_SC_TPL_toTPL;
            default ExampleText = "Stay vigilant; the darkness is always near. 
            Let's watch each other's backs. 
            Together, we uphold the will of the Sleeper.
            ";
        }
        
        
        /**
         * Character makes banter with another character. Meant to be ambiguously connectable as a
         * believable conversation. Variation per speaker guild, generics at camp level.
         */
        
        class UGVL_Conversation_SmallTalk : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk;
            default ExampleText = "... if you say so ...
            ... could be ...
            ... wasn't too clever ...
            ... I'd rather stay out of this ...
            ... that's not my problem ...
            ... told you it was gonna cause trouble ...
            ... but keep that to yourself, I don't need everyone to know ...
            ... won't happen to me again ...
            ... there's gotta be some truth to that story ...
            ... well, you gotta watch what you're saying and who you're saying it to ...
            ... as long as I'm staying out of it ...
            ... you can't believe everything you're hearing ...
            ... still wouldn't wanna be in his shoes ...
            ... same old story ...
            ... some folks just never learn ...
            ... this would've gone over very different back in the day ...
            ... they just never shut up ...
            ... I don't listen to all that rambling anymore ...
            ... you lean on somebody and they'll leave you hanging, that's just how it is ...
            ... nothing's gonna change, I'm telling you ...
            ... yeah, you're probably right ...
            ... wait and see. Things are never as bad as they seem ...
            ... ah, I thought that's been sorted ages ago ...
            ... let's just talk about something else ...";
        }
        
        
        /** Character makes banter with another character from the same camp (Bandit Camp) */
        class UGVL_Conversation_SmallTalk_BC : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_BC;
            default ExampleText = "Around here, you take what you can, or someone else will.
            You've got to be sharp in this camp, or you won't last long.
            The stronger you are, the better your cut. Simple as that.
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_Bandit);
            }
        }
        
        
        /** Character makes banter with another character from the same guild (Bandit) */
        class UGVL_Conversation_SmallTalk_BC_BAN : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_BC_BAN;
            default ExampleText = "As long as we stick together, nothing can bring us down. We're a family!
            Every heist is a chance to turn our fortunes around. Let's make it count!
            Life here can be rough, but there's a certain freedom in living by our own rules.
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_Bandit)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_Bandit) && Other != nullptr && Other.IsTrulyPartOfGuild(GameplayTag::Guild_Human_Bandit)))
                    return false;
                
                return true;
            }
        }
        
        
        class UGVL_Conversation_SmallTalk_BC_BAN_Chapter1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_BC_BAN_Chapter1;
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_Bandit)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_Bandit) && Other != nullptr && Other.IsTrulyPartOfGuild(GameplayTag::Guild_Human_Bandit)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_Bandit)))
                    return false;
                
                return true;
            }
        }
        
        
        class UGVL_Conversation_SmallTalk_BC_BAN_Chapter2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_BC_BAN_Chapter2;
        }
        
        
        class UGVL_Conversation_SmallTalk_BC_BAN_Chapter3 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_BC_BAN_Chapter3;
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_Bandit)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_Bandit) && Other != nullptr && Other.IsTrulyPartOfGuild(GameplayTag::Guild_Human_Bandit)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_Bandit) && G1R::UStoryG1R::Get() != nullptr && G1R::UStoryG1R::Get().HasReachedChapter(3)))
                    return false;
                
                return true;
            }
        }
        
        
        class UGVL_Conversation_SmallTalk_BC_BAN_Chapter4 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_BC_BAN_Chapter4;
        }
        
        
        class UGVL_Conversation_SmallTalk_BC_BAN_Chapter5 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_BC_BAN_Chapter5;
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_Bandit)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_Bandit) && Other != nullptr && Other.IsTrulyPartOfGuild(GameplayTag::Guild_Human_Bandit)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_Bandit) && G1R::UStoryG1R::Get() != nullptr && G1R::UStoryG1R::Get().HasReachedChapter(5)))
                    return false;
                
                return true;
            }
        }
        
        
        class UGVL_Conversation_SmallTalk_BC_BAN_Chapter6 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_BC_BAN_Chapter6;
        }
        
        
        class UGVL_Conversation_SmallTalk_BC_Chapter1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_BC_Chapter1;
        }
        
        
        class UGVL_Conversation_SmallTalk_BC_Chapter2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_BC_Chapter2;
        }
        
        
        class UGVL_Conversation_SmallTalk_BC_Chapter3 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_BC_Chapter3;
        }
        
        
        class UGVL_Conversation_SmallTalk_BC_Chapter4 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_BC_Chapter4;
        }
        
        
        class UGVL_Conversation_SmallTalk_BC_Chapter5 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_BC_Chapter5;
        }
        
        
        class UGVL_Conversation_SmallTalk_BC_Chapter6 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_BC_Chapter6;
        }
        
        
        class UGVL_Conversation_SmallTalk_Chapter1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_Chapter1;
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return G1R::UStoryG1R::Get() != nullptr && G1R::UStoryG1R::Get().IsInChapter(1);
            }
        }
        
        
        class UGVL_Conversation_SmallTalk_Chapter2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_Chapter2;
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return G1R::UStoryG1R::Get() != nullptr && G1R::UStoryG1R::Get().HasReachedChapter(2);
            }
        }
        
        
        class UGVL_Conversation_SmallTalk_Chapter3 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_Chapter3;
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return G1R::UStoryG1R::Get() != nullptr && G1R::UStoryG1R::Get().HasReachedChapter(3);
            }
        }
        
        
        class UGVL_Conversation_SmallTalk_Chapter4 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_Chapter4;
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return G1R::UStoryG1R::Get() != nullptr && G1R::UStoryG1R::Get().HasReachedChapter(4);
            }
        }
        
        
        class UGVL_Conversation_SmallTalk_Chapter5 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_Chapter5;
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return G1R::UStoryG1R::Get() != nullptr && G1R::UStoryG1R::Get().HasReachedChapter(5);
            }
        }
        
        
        class UGVL_Conversation_SmallTalk_Chapter6 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_Chapter6;
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return G1R::UStoryG1R::Get() != nullptr && G1R::UStoryG1R::Get().HasReachedChapter(6);
            }
        }
        
        
        /** Character makes banter with another character from the same camp (New Camp) */
        class UGVL_Conversation_SmallTalk_NC : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_NC;
            default ExampleText = "New Camp's the future, if you've got the guts to survive it.
            Hard life out here, but at least it's our life.
            No king, no orders. Just us, and that's how I like it.
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp);
            }
        }
        
        
        /** Character makes banter with another character from the same guild (Peasant) */
        class UGVL_Conversation_SmallTalk_NC_BAU : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_NC_BAU;
            default ExampleText = "I heard there's a chance of rain soon. That could help our rice grow!
            Every grain counts, but sometimes it feels like we're fighting a losing battle.
            We toil under the sun, but sometimes I wonder if it's all worth it in the end.
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Peasant) && Other != nullptr && Other.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Peasant)))
                    return false;
                
                return true;
            }
        }
        
        
        class UGVL_Conversation_SmallTalk_NC_BAU_Chapter1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_NC_BAU_Chapter1;
        }
        
        
        class UGVL_Conversation_SmallTalk_NC_BAU_Chapter2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_NC_BAU_Chapter2;
        }
        
        
        class UGVL_Conversation_SmallTalk_NC_BAU_Chapter3 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_NC_BAU_Chapter3;
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Peasant) && Other != nullptr && Other.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Peasant)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Peasant) && G1R::UStoryG1R::Get() != nullptr && G1R::UStoryG1R::Get().IsInChapter(3)))
                    return false;
                
                return true;
            }
        }
        
        
        class UGVL_Conversation_SmallTalk_NC_BAU_Chapter4 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_NC_BAU_Chapter4;
        }
        
        
        class UGVL_Conversation_SmallTalk_NC_BAU_Chapter5 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_NC_BAU_Chapter5;
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Peasant) && Other != nullptr && Other.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Peasant)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Peasant) && G1R::UStoryG1R::Get() != nullptr && G1R::UStoryG1R::Get().HasReachedChapter(5)))
                    return false;
                
                return true;
            }
        }
        
        
        class UGVL_Conversation_SmallTalk_NC_BAU_Chapter6 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_NC_BAU_Chapter6;
        }
        
        
        class UGVL_Conversation_SmallTalk_NC_Chapter1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_NC_Chapter1;
        }
        
        
        class UGVL_Conversation_SmallTalk_NC_Chapter2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_NC_Chapter2;
        }
        
        
        class UGVL_Conversation_SmallTalk_NC_Chapter3 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_NC_Chapter3;
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && G1R::UStoryG1R::Get() != nullptr && G1R::UStoryG1R::Get().IsInChapter(3)))
                    return false;
                
                return true;
            }
        }
        
        
        class UGVL_Conversation_SmallTalk_NC_Chapter4 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_NC_Chapter4;
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && G1R::UStoryG1R::Get() != nullptr && G1R::UStoryG1R::Get().IsInChapter(4)))
                    return false;
                
                return true;
            }
        }
        
        
        class UGVL_Conversation_SmallTalk_NC_Chapter5 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_NC_Chapter5;
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && G1R::UStoryG1R::Get() != nullptr && G1R::UStoryG1R::Get().HasReachedChapter(5)))
                    return false;
                
                return true;
            }
        }
        
        
        class UGVL_Conversation_SmallTalk_NC_Chapter6 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_NC_Chapter6;
        }
        
        
        /** Character makes banter with another character from the same guild (Water Mages) */
        class UGVL_Conversation_SmallTalk_NC_KDW : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_NC_KDW;
            default ExampleText = "I heard the Old Camp is having a rough time. Their mages could learn a thing or two from us!
            Let's hope the next rain brings not just water but inspiration for our spells!
            Can't we get ore quicker?
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage) && Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage)))
                    return false;
                
                return true;
            }
        }
        
        
        class UGVL_Conversation_SmallTalk_NC_KDW_Chapter1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_NC_KDW_Chapter1;
        }
        
        
        class UGVL_Conversation_SmallTalk_NC_KDW_Chapter2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_NC_KDW_Chapter2;
        }
        
        
        class UGVL_Conversation_SmallTalk_NC_KDW_Chapter3 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_NC_KDW_Chapter3;
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage) && Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage) && G1R::UStoryG1R::Get() != nullptr && G1R::UStoryG1R::Get().IsInChapter(3)))
                    return false;
                
                return true;
            }
        }
        
        
        class UGVL_Conversation_SmallTalk_NC_KDW_Chapter4 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_NC_KDW_Chapter4;
        }
        
        
        class UGVL_Conversation_SmallTalk_NC_KDW_Chapter5 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_NC_KDW_Chapter5;
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage) && Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage) && G1R::UStoryG1R::Get() != nullptr && G1R::UStoryG1R::Get().HasReachedChapter(5)))
                    return false;
                
                return true;
            }
        }
        
        
        class UGVL_Conversation_SmallTalk_NC_KDW_Chapter6 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_NC_KDW_Chapter6;
        }
        
        
        /** Character makes banter with another character from the same guild (Rogue) */
        class UGVL_Conversation_SmallTalk_NC_ORG : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_NC_ORG;
            default ExampleText = "Stealth is key, but a little charm never hurts. Let's head to the tavern later!
            It's always good to have a backup plan. Especially when things go sideways.
            I wonder what the mges are hiding up there
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Rogue) && Other != nullptr && Other.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Rogue)))
                    return false;
                
                return true;
            }
        }
        
        
        class UGVL_Conversation_SmallTalk_NC_ORG_Chapter1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_NC_ORG_Chapter1;
        }
        
        
        class UGVL_Conversation_SmallTalk_NC_ORG_Chapter2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_NC_ORG_Chapter2;
        }
        
        
        class UGVL_Conversation_SmallTalk_NC_ORG_Chapter3 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_NC_ORG_Chapter3;
        }
        
        
        class UGVL_Conversation_SmallTalk_NC_ORG_Chapter4 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_NC_ORG_Chapter4;
        }
        
        
        class UGVL_Conversation_SmallTalk_NC_ORG_Chapter5 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_NC_ORG_Chapter5;
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Rogue) && Other != nullptr && Other.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Rogue)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Rogue) && G1R::UStoryG1R::Get() != nullptr && G1R::UStoryG1R::Get().HasReachedChapter(5)))
                    return false;
                
                return true;
            }
        }
        
        
        class UGVL_Conversation_SmallTalk_NC_ORG_Chapter6 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_NC_ORG_Chapter6;
        }
        
        
        /** Character makes banter with another character from the same guild (Scraper) */
        class UGVL_Conversation_SmallTalk_NC_SFB : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_NC_SFB;
            default ExampleText = "It's hard work, but I dream of the day when we'll finally strike it rich.
            We scrape and toil, but it's hard to shake the feeling that we're just chasing shadows.
            Sometimes I feel like we're digging our own graves instead of finding treasure.
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Scraper) && Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Scraper)))
                    return false;
                
                return true;
            }
        }
        
        
        class UGVL_Conversation_SmallTalk_NC_SFB_Chapter1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_NC_SFB_Chapter1;
        }
        
        
        class UGVL_Conversation_SmallTalk_NC_SFB_Chapter2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_NC_SFB_Chapter2;
        }
        
        
        class UGVL_Conversation_SmallTalk_NC_SFB_Chapter3 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_NC_SFB_Chapter3;
        }
        
        
        class UGVL_Conversation_SmallTalk_NC_SFB_Chapter4 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_NC_SFB_Chapter4;
        }
        
        
        class UGVL_Conversation_SmallTalk_NC_SFB_Chapter5 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_NC_SFB_Chapter5;
        }
        
        
        class UGVL_Conversation_SmallTalk_NC_SFB_Chapter6 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_NC_SFB_Chapter6;
        }
        
        
        /** Character makes banter with another character from the same guild (Mercenary) */
        class UGVL_Conversation_SmallTalk_NC_SLD : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_NC_SLD;
            default ExampleText = "After a long day, nothing beats a drink at the tavern. You coming?
            It's nice to be part of a crew that knows how to handle themselves in a scrap.
            You think the Old Camp's ready for us if we ever decide to pay them a visit?
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Mercenary) && Other != nullptr && Other.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Mercenary)))
                    return false;
                
                return true;
            }
        }
        
        
        class UGVL_Conversation_SmallTalk_NC_SLD_Chapter1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_NC_SLD_Chapter1;
        }
        
        
        class UGVL_Conversation_SmallTalk_NC_SLD_Chapter2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_NC_SLD_Chapter2;
        }
        
        
        class UGVL_Conversation_SmallTalk_NC_SLD_Chapter3 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_NC_SLD_Chapter3;
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Mercenary) && Other != nullptr && Other.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Mercenary)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Mercenary) && G1R::UStoryG1R::Get() != nullptr && G1R::UStoryG1R::Get().IsInChapter(3)))
                    return false;
                
                return true;
            }
        }
        
        
        class UGVL_Conversation_SmallTalk_NC_SLD_Chapter4 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_NC_SLD_Chapter4;
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Mercenary) && Other != nullptr && Other.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Mercenary)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Mercenary) && G1R::UStoryG1R::Get() != nullptr && G1R::UStoryG1R::Get().IsInChapter(4)))
                    return false;
                
                return true;
            }
        }
        
        
        class UGVL_Conversation_SmallTalk_NC_SLD_Chapter5 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_NC_SLD_Chapter5;
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Mercenary) && Other != nullptr && Other.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Mercenary)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Mercenary) && G1R::UStoryG1R::Get() != nullptr && G1R::UStoryG1R::Get().IsInChapter(5)))
                    return false;
                
                return true;
            }
        }
        
        
        class UGVL_Conversation_SmallTalk_NC_SLD_Chapter6 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_NC_SLD_Chapter6;
        }
        
        
        /** Character makes banter with another character from the same camp (Old Camp) */
        class UGVL_Conversation_SmallTalk_OC : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_OC;
            default ExampleText = "Better stick close to the camp. The wilds aren't forgiving.
            As long as Gomez is in charge, we're in good hands.
            Keep your head down, and you'll get by just fine.
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp);
            }
        }
        
        
        class UGVL_Conversation_SmallTalk_OC_Chapter1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_OC_Chapter1;
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && G1R::UStoryG1R::Get() != nullptr && !G1R::UStoryG1R::Get().HasReachedChapter(2)))
                    return false;
                
                return true;
            }
        }
        
        
        class UGVL_Conversation_SmallTalk_OC_Chapter2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_OC_Chapter2;
        }
        
        
        class UGVL_Conversation_SmallTalk_OC_Chapter3 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_OC_Chapter3;
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && G1R::UStoryG1R::Get() != nullptr && G1R::UStoryG1R::Get().IsInChapter(3)))
                    return false;
                
                return true;
            }
        }
        
        
        class UGVL_Conversation_SmallTalk_OC_Chapter4 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_OC_Chapter4;
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && G1R::UStoryG1R::Get() != nullptr && G1R::UStoryG1R::Get().IsInChapter(4)))
                    return false;
                
                return true;
            }
        }
        
        
        class UGVL_Conversation_SmallTalk_OC_Chapter5 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_OC_Chapter5;
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && G1R::UStoryG1R::Get() != nullptr && G1R::UStoryG1R::Get().HasReachedChapter(5)))
                    return false;
                
                return true;
            }
        }
        
        
        class UGVL_Conversation_SmallTalk_OC_Chapter6 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_OC_Chapter6;
        }
        
        
        class UGVL_Conversation_SmallTalk_OC_EBR : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_OC_EBR;
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_OreBaron)))
                    return false;
                
                return true;
            }
        }
        
        
        /** Story is in Chapter 2 */
        class UGVL_Conversation_SmallTalk_OC_EBR_Chapter2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_OC_EBR_Chapter2;
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_OreBaron)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_OreBaron) && G1R::UStoryG1R::Get() != nullptr && G1R::UStoryG1R::Get().IsInChapter(2)))
                    return false;
                
                return true;
            }
        }
        
        
        /** Story is in Chapter 3 */
        class UGVL_Conversation_SmallTalk_OC_EBR_Chapter3 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_OC_EBR_Chapter3;
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_OreBaron)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_OreBaron) && G1R::UStoryG1R::Get() != nullptr && G1R::UStoryG1R::Get().IsInChapter(3)))
                    return false;
                
                return true;
            }
        }
        
        
        /** Sroty is in Chapter 4 and beyond */
        class UGVL_Conversation_SmallTalk_OC_EBR_Chapter4 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_OC_EBR_Chapter4;
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_OreBaron)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_OreBaron) && G1R::UStoryG1R::Get() != nullptr && G1R::UStoryG1R::Get().HasReachedChapter(4)))
                    return false;
                
                return true;
            }
        }
        
        
        /** Character makes banter with another character from the same guild (Guard) */
        class UGVL_Conversation_SmallTalk_OC_GRD : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_OC_GRD;
            default ExampleText = "You think Gomez will give us a break if things stay calm?
            Can't believe how many new faces have come through the camp.
            Always best to keep your eyes open. You never know what might happen.
            Seems like everyone's on edge lately. Must be the weather.
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard) && Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard)))
                    return false;
                
                return true;
            }
        }
        
        
        class UGVL_Conversation_SmallTalk_OC_GRD_Chapter1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_OC_GRD_Chapter1;
        }
        
        
        class UGVL_Conversation_SmallTalk_OC_GRD_Chapter2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_OC_GRD_Chapter2;
        }
        
        
        class UGVL_Conversation_SmallTalk_OC_GRD_Chapter3 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_OC_GRD_Chapter3;
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard) && Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard) && G1R::UStoryG1R::Get() != nullptr && G1R::UStoryG1R::Get().IsInChapter(3)))
                    return false;
                
                return true;
            }
        }
        
        
        class UGVL_Conversation_SmallTalk_OC_GRD_Chapter4 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_OC_GRD_Chapter4;
        }
        
        
        class UGVL_Conversation_SmallTalk_OC_GRD_Chapter5 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_OC_GRD_Chapter5;
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard) && Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard) && G1R::UStoryG1R::Get() != nullptr && G1R::UStoryG1R::Get().HasReachedChapter(5)))
                    return false;
                
                return true;
            }
        }
        
        
        class UGVL_Conversation_SmallTalk_OC_GRD_Chapter6 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_OC_GRD_Chapter6;
        }
        
        
        /** InExtremo small talk between them after the concert */
        class UGVL_Conversation_SmallTalk_OC_IE : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_OC_IE;
            default ExampleText = "... the concert was pretty good...
            ... we should fire our agent...";
        }
        
        
        /** Character makes banter with another character from the same guild (Fire Mage) */
        class UGVL_Conversation_SmallTalk_OC_KDF : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_OC_KDF;
            default ExampleText = "I swear, every time I practice, I feel like I'm getting closer to mastering the flames!
            I heard Gomez is planning something big. Hope it doesn't involve too much paperwork!
            If only we could harness this heat for cooking; we'd never run out of food!
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage) && Other != nullptr && Other.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage)))
                    return false;
                
                return true;
            }
        }
        
        
        class UGVL_Conversation_SmallTalk_OC_KDF_Chapter1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_OC_KDF_Chapter1;
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage) && Other != nullptr && Other.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage) && G1R::UStoryG1R::Get() != nullptr && G1R::UStoryG1R::Get().IsInChapter(1)))
                    return false;
                
                return true;
            }
        }
        
        
        class UGVL_Conversation_SmallTalk_OC_KDF_Chapter2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_OC_KDF_Chapter2;
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage) && Other != nullptr && Other.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage) && G1R::UStoryG1R::Get() != nullptr && G1R::UStoryG1R::Get().IsInChapter(2)))
                    return false;
                
                return true;
            }
        }
        
        
        class UGVL_Conversation_SmallTalk_OC_KDF_Chapter3 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_OC_KDF_Chapter3;
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage) && Other != nullptr && Other.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage) && G1R::UStoryG1R::Get() != nullptr && G1R::UStoryG1R::Get().IsInChapter(3)))
                    return false;
                
                return true;
            }
        }
        
        
        class UGVL_Conversation_SmallTalk_OC_KDF_Chapter4 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_OC_KDF_Chapter4;
        }
        
        
        class UGVL_Conversation_SmallTalk_OC_KDF_Chapter5 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_OC_KDF_Chapter5;
        }
        
        
        class UGVL_Conversation_SmallTalk_OC_KDF_Chapter6 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_OC_KDF_Chapter6;
        }
        
        
        /** Character makes banter with another character from the same guild (Shadows) */
        class UGVL_Conversation_SmallTalk_OC_STT : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_OC_STT;
            default ExampleText = "I've heard the Old Camp is buzzing with rumors. Best we keep our ears open.
            With the way things are going, I wouldn't be surprised if Gomez gives us a new assignment soon.
            They say the best way to keep the peace is to know when to strike.
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow) && Other != nullptr && Other.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow)))
                    return false;
                
                return true;
            }
        }
        
        
        class UGVL_Conversation_SmallTalk_OC_STT_Chapter1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_OC_STT_Chapter1;
        }
        
        
        class UGVL_Conversation_SmallTalk_OC_STT_Chapter2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_OC_STT_Chapter2;
        }
        
        
        class UGVL_Conversation_SmallTalk_OC_STT_Chapter3 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_OC_STT_Chapter3;
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow) && Other != nullptr && Other.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow) && G1R::UStoryG1R::Get() != nullptr && G1R::UStoryG1R::Get().HasReachedChapter(3)))
                    return false;
                
                return true;
            }
        }
        
        
        class UGVL_Conversation_SmallTalk_OC_STT_Chapter4 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_OC_STT_Chapter4;
        }
        
        
        class UGVL_Conversation_SmallTalk_OC_STT_Chapter5 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_OC_STT_Chapter5;
        }
        
        
        class UGVL_Conversation_SmallTalk_OC_STT_Chapter6 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_OC_STT_Chapter6;
        }
        
        
        /** Character makes banter with another character from the same guild (Digger) */
        class UGVL_Conversation_SmallTalk_OC_VLK : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_OC_VLK;
            default ExampleText = "Another day, another shovel full of dirt.
            Sometimes I think we're just chasing shadows.
            Did you hear about the last shipment? Rumor has it there's some good stuff coming.
            I've seen some of the guards slacking off lately. It's good to be busy!
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Digger) && Other != nullptr && Other.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Digger)))
                    return false;
                
                return true;
            }
        }
        
        
        class UGVL_Conversation_SmallTalk_OC_VLK_Chapter1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_OC_VLK_Chapter1;
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Digger) && Other != nullptr && Other.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Digger)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Digger) && G1R::UStoryG1R::Get() != nullptr && G1R::UStoryG1R::Get().IsInChapter(1)))
                    return false;
                
                return true;
            }
        }
        
        
        class UGVL_Conversation_SmallTalk_OC_VLK_Chapter2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_OC_VLK_Chapter2;
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Digger) && Other != nullptr && Other.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Digger)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Digger) && G1R::UStoryG1R::Get() != nullptr && G1R::UStoryG1R::Get().IsInChapter(2)))
                    return false;
                
                return true;
            }
        }
        
        
        class UGVL_Conversation_SmallTalk_OC_VLK_Chapter3 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_OC_VLK_Chapter3;
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Digger) && Other != nullptr && Other.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Digger)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Digger) && G1R::UStoryG1R::Get() != nullptr && G1R::UStoryG1R::Get().HasReachedChapter(3)))
                    return false;
                
                return true;
            }
        }
        
        
        class UGVL_Conversation_SmallTalk_OC_VLK_Chapter4 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_OC_VLK_Chapter4;
        }
        
        
        class UGVL_Conversation_SmallTalk_OC_VLK_Chapter5 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_OC_VLK_Chapter5;
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Digger) && Other != nullptr && Other.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Digger)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Digger) && G1R::UStoryG1R::Get() != nullptr && G1R::UStoryG1R::Get().HasReachedChapter(5)))
                    return false;
                
                return true;
            }
        }
        
        
        class UGVL_Conversation_SmallTalk_OC_VLK_Chapter6 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_OC_VLK_Chapter6;
        }
        
        
        /** Character makes banter with another character from the same camp (Swamp Camp) */
        class UGVL_Conversation_SmallTalk_SC : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_SC;
            default ExampleText = "Peace, brother. The Sleeper has a plan for all of us.
            Everything is clearer after a puff of swampweed.
            There's more to life than ore and gold. The Sleeper teaches us that.
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp);
            }
        }
        
        
        class UGVL_Conversation_SmallTalk_SC_Chapter1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_SC_Chapter1;
        }
        
        
        class UGVL_Conversation_SmallTalk_SC_Chapter2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_SC_Chapter2;
        }
        
        
        class UGVL_Conversation_SmallTalk_SC_Chapter3 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_SC_Chapter3;
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp) && G1R::UStoryG1R::Get() != nullptr && G1R::UStoryG1R::Get().HasReachedChapter(3) && G1R::UStoryG1R::Get() != nullptr && !G1R::UStoryG1R::Get().HasReachedChapter(5) && Me != nullptr && !Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Guru) && Me != nullptr && !Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Novice) && Me != nullptr && !Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Templar)))
                    return false;
                
                return true;
            }
        }
        
        
        class UGVL_Conversation_SmallTalk_SC_Chapter4 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_SC_Chapter4;
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp)))
                    return false;
                
                if (!(G1R::UStoryG1R::Get() != nullptr && G1R::UStoryG1R::Get().HasReachedChapter(4) && Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp)))
                    return false;
                
                return true;
            }
        }
        
        
        class UGVL_Conversation_SmallTalk_SC_Chapter5 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_SC_Chapter5;
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp) && G1R::UStoryG1R::Get() != nullptr && G1R::UStoryG1R::Get().HasReachedChapter(5)))
                    return false;
                
                return true;
            }
        }
        
        
        class UGVL_Conversation_SmallTalk_SC_Chapter6 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_SC_Chapter6;
        }
        
        
        /** Character makes banter with another character from the same guild (Gurus) */
        class UGVL_Conversation_SmallTalk_SC_GUR : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_SC_GUR;
            default ExampleText = "The spirits of the swamp guide us, but their whispers can be so lonely.
            There's beauty in the chaos of the swamp. We just need to open our eyes to see it.
            May the Sleeper enlighten your way.
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Guru) && Other != nullptr && Other.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Guru)))
                    return false;
                
                return true;
            }
        }
        
        
        class UGVL_Conversation_SmallTalk_SC_GUR_Chapter1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_SC_GUR_Chapter1;
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Guru) && Other != nullptr && Other.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Guru)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Guru) && G1R::UStoryG1R::Get() != nullptr && G1R::UStoryG1R::Get().IsInChapter(1)))
                    return false;
                
                return true;
            }
        }
        
        
        class UGVL_Conversation_SmallTalk_SC_GUR_Chapter2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_SC_GUR_Chapter2;
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Guru) && Other != nullptr && Other.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Guru)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Guru) && G1R::UStoryG1R::Get() != nullptr && G1R::UStoryG1R::Get().IsInChapter(2)))
                    return false;
                
                return true;
            }
        }
        
        
        class UGVL_Conversation_SmallTalk_SC_GUR_Chapter3 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_SC_GUR_Chapter3;
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Guru) && Other != nullptr && Other.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Guru)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Guru) && G1R::UStoryG1R::Get() != nullptr && G1R::UStoryG1R::Get().HasReachedChapter(3) && G1R::UStoryG1R::Get() != nullptr && !G1R::UStoryG1R::Get().HasReachedChapter(5)))
                    return false;
                
                return true;
            }
        }
        
        
        class UGVL_Conversation_SmallTalk_SC_GUR_Chapter4 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_SC_GUR_Chapter4;
        }
        
        
        class UGVL_Conversation_SmallTalk_SC_GUR_Chapter5 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_SC_GUR_Chapter5;
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Guru) && Other != nullptr && Other.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Guru)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Guru) && G1R::UStoryG1R::Get() != nullptr && G1R::UStoryG1R::Get().HasReachedChapter(5)))
                    return false;
                
                return true;
            }
        }
        
        
        class UGVL_Conversation_SmallTalk_SC_GUR_Chapter6 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_SC_GUR_Chapter6;
        }
        
        
        /** Character makes banter with another character from the same guild (Novice) */
        class UGVL_Conversation_SmallTalk_SC_NOV : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_SC_NOV;
            default ExampleText = "The Sleeper guides us through the dark times. I hope we're worthy of its blessings.
            Every day brings us closer to understanding The Sleeper's true power.
            The swamp can be a lonely place, but I find solace in The Sleeper's whispers.
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Novice) && Other != nullptr && Other.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Novice)))
                    return false;
                
                return true;
            }
        }
        
        
        class UGVL_Conversation_SmallTalk_SC_NOV_Chapter1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_SC_NOV_Chapter1;
        }
        
        
        class UGVL_Conversation_SmallTalk_SC_NOV_Chapter2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_SC_NOV_Chapter2;
        }
        
        
        class UGVL_Conversation_SmallTalk_SC_NOV_Chapter3 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_SC_NOV_Chapter3;
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Novice) && Other != nullptr && Other.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Novice)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Novice) && G1R::UStoryG1R::Get() != nullptr && G1R::UStoryG1R::Get().HasReachedChapter(3) && G1R::UStoryG1R::Get() != nullptr && !G1R::UStoryG1R::Get().HasReachedChapter(5)))
                    return false;
                
                return true;
            }
        }
        
        
        class UGVL_Conversation_SmallTalk_SC_NOV_Chapter4 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_SC_NOV_Chapter4;
        }
        
        
        class UGVL_Conversation_SmallTalk_SC_NOV_Chapter5 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_SC_NOV_Chapter5;
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Novice) && Other != nullptr && Other.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Novice)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Novice) && G1R::UStoryG1R::Get() != nullptr && G1R::UStoryG1R::Get().HasReachedChapter(5)))
                    return false;
                
                return true;
            }
        }
        
        
        class UGVL_Conversation_SmallTalk_SC_NOV_Chapter6 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_SC_NOV_Chapter6;
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Novice) && Other != nullptr && Other.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Novice)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Novice) && G1R::UStoryG1R::Get() != nullptr && G1R::UStoryG1R::Get().IsInChapter(6)))
                    return false;
                
                return true;
            }
        }
        
        
        /** Character makes banter with another character from the same guild (Templar) */
        class UGVL_Conversation_SmallTalk_SC_TPL : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_SC_TPL;
            default ExampleText = "Every battle we fight brings us closer to our true purpose in this world.
            I trust that The Sleeper has a plan, but it's hard not to doubt on the toughest days.
            Some nights, the weight of our duties feels heavier than the swamp itself.
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Templar) && Other != nullptr && Other.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Templar)))
                    return false;
                
                return true;
            }
        }
        
        
        class UGVL_Conversation_SmallTalk_SC_TPL_Chapter1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_SC_TPL_Chapter1;
        }
        
        
        class UGVL_Conversation_SmallTalk_SC_TPL_Chapter2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_SC_TPL_Chapter2;
        }
        
        
        class UGVL_Conversation_SmallTalk_SC_TPL_Chapter3 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_SC_TPL_Chapter3;
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Templar) && Other != nullptr && Other.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Templar)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Templar) && G1R::UStoryG1R::Get() != nullptr && G1R::UStoryG1R::Get().HasReachedChapter(3) && G1R::UStoryG1R::Get() != nullptr && !G1R::UStoryG1R::Get().HasReachedChapter(5)))
                    return false;
                
                return true;
            }
        }
        
        
        class UGVL_Conversation_SmallTalk_SC_TPL_Chapter4 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_SC_TPL_Chapter4;
        }
        
        
        class UGVL_Conversation_SmallTalk_SC_TPL_Chapter5 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_SC_TPL_Chapter5;
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Templar) && Other != nullptr && Other.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Templar)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Templar) && G1R::UStoryG1R::Get() != nullptr && G1R::UStoryG1R::Get().HasReachedChapter(5)))
                    return false;
                
                return true;
            }
        }
        
        
        class UGVL_Conversation_SmallTalk_SC_TPL_Chapter6 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_SC_TPL_Chapter6;
        }
        
        
        /** Small talk around a fire sharing food and goods */
        class UGVL_Conversation_SmallTalk_Sharing : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_Sharing;
            default ExampleText = "Let me have some too...";
        }
        
        
        /** Small talk around a fire sharing joints */
        class UGVL_Conversation_SmallTalk_Sharing_SC : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_SmallTalk_Sharing_SC;
            default ExampleText = "Share one of those";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return AGothicCharacterState::FindByUniqueName(n"AITESTCHARACTER") != nullptr && AGothicCharacterState::FindByUniqueName(n"AITESTCHARACTER").IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp);
            }
        }
        
        
        class UGVL_Example_Voiceline_Name : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Example_Voiceline_Name;
        }
        
        
        /** Player wants to talk to someone, but they're facing the wrong direction */
        class UGVL_Player_Conversation_Request_HeyTurnAround : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Player_Conversation_Request_HeyTurnAround;
            default ExampleText = "Hey, you!";
        }
        
        
        /** Player wants to talk to someone who is walking */
        class UGVL_Player_Conversation_Request_HeyWaitASecond : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Player_Conversation_Request_HeyWaitASecond;
            default ExampleText = "Just wait!";
        }
        
        
        /** Player tried to pick up something, but inventory is full */
        class UGVL_Player_Interaction_Item_InventoryFull : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Player_Interaction_Item_InventoryFull;
            default ExampleText = "I can't carry any more than that.";
        }
        
        
        /** Player picked up something, crossing the last encumbrance threshold */
        class UGVL_Player_Interaction_Item_InventoryFull_High : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Player_Interaction_Item_InventoryFull_High;
        }
        
        
        /** Player picked up something, crossing the first encumbrance threshold */
        class UGVL_Player_Interaction_Item_InventoryFull_Low : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Player_Interaction_Item_InventoryFull_Low;
        }
        
        
        /** Player picked up something, crossing the middle encumbrance threshold */
        class UGVL_Player_Interaction_Item_InventoryFull_Medium : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Player_Interaction_Item_InventoryFull_Medium;
        }
        
        
        /** Player tried to open a locked door/chest, but he doesn't have the key for it */
        class UGVL_Player_Interaction_Lock_NeedKey : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Player_Interaction_Lock_NeedKey;
            default ExampleText = "I need a key for that ...";
        }
        
        
        /** Player interacted with a locked door/chest, but he doesn't have any lockpick */
        class UGVL_Player_Interaction_Lock_NoMorePicks : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Player_Interaction_Lock_NoMorePicks;
            default ExampleText = "No more skeleton keys ...";
        }
        
        
        /** Player was trying to pick a lock but the lockpick broke */
        class UGVL_Player_Interaction_Lock_PickBroke : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Player_Interaction_Lock_PickBroke;
            default ExampleText = "Hm, broken.";
        }
        
        
        /** Player tried to interact with something, but that failed */
        class UGVL_Player_Interaction_Object_DoesntWork : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Player_Interaction_Object_DoesntWork;
            default ExampleText = "Doesn't work.";
        }
        
        
        /** Player pets the dog */
        class UGVL_Player_Pet_Dog : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Player_Pet_Dog;
            default ExampleText = "Good Boy!";
        }
        
        
        /** The hero is riding the Scavenger and pushing it to keep moving */
        class UGVL_Player_RidingScavenger_Accelerate : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Player_RidingScavenger_Accelerate;
            default GlobalCooldownSeconds = 7.0f;
            default ExampleText = "Yeah!Yeah!";
        }
        
        
        /** The hero order the scavenger to stop */
        class UGVL_Player_RidingScavenger_Break : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Player_RidingScavenger_Break;
            default GlobalCooldownSeconds = 15.0f;
            default ExampleText = "Woo";
        }
        
        
        /** Player sleep ended normally. */
        class UGVL_Player_Sleep_Awake : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Player_Sleep_Awake;
            default ExampleText = "*Yawn*";
        }
        
        
        /** Insist that a respectable character moves out of my way. */
        class UGVL_Reaction_Blocking_InsistMakeWay : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Blocking_InsistMakeWay;
            default ExampleText = "I said make way!";
        }
        
        
        /** Insist that a weak character moves out of my way. */
        class UGVL_Reaction_Blocking_InsistOutOfMyWay : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Blocking_InsistOutOfMyWay;
            default ExampleText = "Are you deaf? MOVE IT!!";
        }
        
        
        /** Respectable character is standing in my way. */
        class UGVL_Reaction_Blocking_MakeWay : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Blocking_MakeWay;
            default ExampleText = "Let me pass!";
        }
        
        
        /** Weak character is standing in my way. */
        class UGVL_Reaction_Blocking_OutOfMyWay : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Blocking_OutOfMyWay;
            default ExampleText = "Get out of the way, man!";
        }
        
        
        class UGVL_Reaction_Chatter : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Chatter;
            default GlobalCooldownSeconds = 300.0f;
        }
        
        
        /** See someone that you remember stole from the Mages */
        class UGVL_Reaction_Chatter_StoleFromMage : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Chatter_StoleFromMage;
            default GlobalCooldownSeconds = 600.0f;
            default ExampleText = "You have stolen from the magicians! What a really stupid idea!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return AGothicCharacterState::FindByUniqueName(n"HERO") != nullptr && AGothicCharacterState::FindByUniqueName(n"HERO").HasChatterMemoryEvent(GameplayTag::Memory_Chatter_Stole_FromWaterMage) && Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Me != nullptr && !Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage) && Other != nullptr && Other.IsCharacter(AGothicCharacterState::FindByUniqueName(n"HERO"));
            }
        }
        
        
        /** I see someone that I don't like and that defeated (or killed) a Peasant in the past. */
        class UGVL_Reaction_Chatter_SuckerDefeatedBau : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Chatter_SuckerDefeatedBau;
            default GlobalCooldownSeconds = 600.0f;
            default ExampleText = "It was terrible what you did to that peasant...";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && AGothicCharacterState::FindByUniqueName(n"HERO") != nullptr && AGothicCharacterState::FindByUniqueName(n"HERO").HasChatterForDefeatedGuild(GameplayTag::Guild_Human_NewCamp_Peasant) && Other != nullptr && Other.IsCharacter(AGothicCharacterState::FindByUniqueName(n"HERO"));
            }
        }
        
        
        /**
         * As a Mercenary, I see someone that I don't like and that defeated (or killed) a Peasant in the
         * past.
         */
        
        class UGVL_Reaction_Chatter_SuckerDefeatedBau_GuardRole : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Chatter_SuckerDefeatedBau_GuardRole;
            default Weight = 2.0f;
            default GlobalCooldownSeconds = 600.0f;
            default ExampleText = "You'll pick rice if you keep harming our Peasants you fool!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && AGothicCharacterState::FindByUniqueName(n"HERO") != nullptr && AGothicCharacterState::FindByUniqueName(n"HERO").HasChatterForDefeatedGuild(GameplayTag::Guild_Human_NewCamp_Peasant) && Other != nullptr && Other.IsCharacter(AGothicCharacterState::FindByUniqueName(n"HERO"))))
                    return false;
                
                if (!((Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Rogue)) || (Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Mercenary))))
                    return false;
                
                return true;
            }
        }
        
        
        /** See someone that I don't like and that defeated an Ore Baron in the past. */
        class UGVL_Reaction_Chatter_SuckerDefeatedEBr : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Chatter_SuckerDefeatedEBr;
            default Weight = 2.0f;
            default GlobalCooldownSeconds = 600.0f;
            default ExampleText = "You've knocked down an Ore Baron! He's really mad at you!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && Me != nullptr && !Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_OreBaron) && AGothicCharacterState::FindByUniqueName(n"HERO") != nullptr && AGothicCharacterState::FindByUniqueName(n"HERO").HasChatterForDefeatedGuild(GameplayTag::Guild_Human_OldCamp_OreBaron) && Other != nullptr && Other.IsCharacter(AGothicCharacterState::FindByUniqueName(n"HERO"));
            }
        }
        
        
        /** See someone that I don't like and that defeated a Guru in the past. */
        class UGVL_Reaction_Chatter_SuckerDefeatedGur : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Chatter_SuckerDefeatedGur;
            default Weight = 2.0f;
            default GlobalCooldownSeconds = 600.0f;
            default ExampleText = "You've knocked down a Guru. Somehow you seem to attract trouble like a magnet!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp) && Me != nullptr && !Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Guru) && AGothicCharacterState::FindByUniqueName(n"HERO") != nullptr && AGothicCharacterState::FindByUniqueName(n"HERO").HasChatterForDefeatedGuild(GameplayTag::Guild_Human_SwampCamp_Guru) && Other != nullptr && Other.IsCharacter(AGothicCharacterState::FindByUniqueName(n"HERO"));
            }
        }
        
        
        /** See someone that I don't like and that defeated a Mage in the past. */
        class UGVL_Reaction_Chatter_SuckerDefeatedMage : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Chatter_SuckerDefeatedMage;
            default Weight = 2.0f;
            default GlobalCooldownSeconds = 600.0f;
            default ExampleText = "To win against a magician is a really rotten idea!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && G1R::UStoryG1R::Get().FireMagesDead == 0 && AGothicCharacterState::FindByUniqueName(n"HERO") != nullptr && AGothicCharacterState::FindByUniqueName(n"HERO").HasChatterForDefeatedGuild(GameplayTag::Guild_Human_OldCamp_FireMage) && Other != nullptr && Other.IsCharacter(AGothicCharacterState::FindByUniqueName(n"HERO"));
            }
        }
        
        
        /** I see someone that I don't like and that defeated (or killed) a Novice in the past. */
        class UGVL_Reaction_Chatter_SuckerDefeatedNov : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Chatter_SuckerDefeatedNov;
            default GlobalCooldownSeconds = 600.0f;
            default ExampleText = "What you did to that novice... the Sleeper will punish you sooner or later.";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp) && Me != nullptr && !Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Novice) && AGothicCharacterState::FindByUniqueName(n"HERO") != nullptr && AGothicCharacterState::FindByUniqueName(n"HERO").HasChatterForDefeatedGuild(GameplayTag::Guild_Human_SwampCamp_Novice) && Other != nullptr && Other.IsCharacter(AGothicCharacterState::FindByUniqueName(n"HERO"));
            }
        }
        
        
        /**
         * Templar / Guru, I see someone that I don't like and that defeated (or killed) a Novice in the
         * past.
         */
        
        class UGVL_Reaction_Chatter_SuckerDefeatedNov_GuardRole : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Chatter_SuckerDefeatedNov_GuardRole;
            default Weight = 2.0f;
            default GlobalCooldownSeconds = 600.0f;
            default ExampleText = "If you even lay a hand on a novice again we'll feed you to the swampsharks.";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp) && Me != nullptr && !Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Novice) && AGothicCharacterState::FindByUniqueName(n"HERO") != nullptr && AGothicCharacterState::FindByUniqueName(n"HERO").HasChatterForDefeatedGuild(GameplayTag::Guild_Human_SwampCamp_Novice) && Other != nullptr && Other.IsCharacter(AGothicCharacterState::FindByUniqueName(n"HERO"))))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Templar)))
                    return false;
                
                return true;
            }
        }
        
        
        /** I see someone that I don't like and that defeated (or killed) a Digger in the past. */
        class UGVL_Reaction_Chatter_SuckerDefeatedVlk : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Chatter_SuckerDefeatedVlk;
            default GlobalCooldownSeconds = 600.0f;
            default ExampleText = "Diggers are miserable enough, now you're going around terrorizing them...";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && Me != nullptr && !Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Digger) && AGothicCharacterState::FindByUniqueName(n"HERO") != nullptr && AGothicCharacterState::FindByUniqueName(n"HERO").HasChatterForDefeatedGuild(GameplayTag::Guild_Human_OldCamp_Digger) && Other != nullptr && Other.IsCharacter(AGothicCharacterState::FindByUniqueName(n"HERO"));
            }
        }
        
        
        /**
         * As a Guard, I see someone that I don't like and that defeated (or killed) a Digger in the past.
         */
        
        class UGVL_Reaction_Chatter_SuckerDefeatedVlk_GuardRole : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Chatter_SuckerDefeatedVlk_GuardRole;
            default Weight = 2.0f;
            default GlobalCooldownSeconds = 600.0f;
            default ExampleText = "Well, don't lay a finger on the Diggers again or I'll personally cut it off...";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && Me != nullptr && !Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Digger) && AGothicCharacterState::FindByUniqueName(n"HERO") != nullptr && AGothicCharacterState::FindByUniqueName(n"HERO").HasChatterForDefeatedGuild(GameplayTag::Guild_Human_OldCamp_Digger) && Other != nullptr && Other.IsCharacter(AGothicCharacterState::FindByUniqueName(n"HERO"))))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard)))
                    return false;
                
                return true;
            }
        }
        
        
        /** See someone that I don't like and that was beaten by someone in the past. */
        class UGVL_Reaction_Chatter_SuckerGotSome : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Chatter_SuckerGotSome;
            default GlobalCooldownSeconds = 600.0f;
            default ExampleText = "Did you get a thrashing? Serves you right!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return ((Me != nullptr && Me.IsAngryTowards(AGothicCharacterState::FindByUniqueName(n"HERO")) && AGothicCharacterState::FindByUniqueName(n"HERO") != nullptr && AGothicCharacterState::FindByUniqueName(n"HERO").HasBeenDefeatedByCharactersOfGuild(GameplayTag::Guild_Human_OldCamp, 1) && Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && Other != nullptr && Other.IsCharacter(AGothicCharacterState::FindByUniqueName(n"HERO")))) || ((Me != nullptr && Me.IsAngryTowards(AGothicCharacterState::FindByUniqueName(n"HERO")) && Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && AGothicCharacterState::FindByUniqueName(n"HERO") != nullptr && AGothicCharacterState::FindByUniqueName(n"HERO").HasBeenDefeatedByCharactersOfGuild(GameplayTag::Guild_Human_NewCamp, 1) && Other != nullptr && Other.IsCharacter(AGothicCharacterState::FindByUniqueName(n"HERO"))));
            }
        }
        
        
        /** See someone from my guild and remember someone from our guild was killed in the past. */
        class UGVL_Reaction_Chatter_TheyKilledMyFriend : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Chatter_TheyKilledMyFriend;
            default GlobalCooldownSeconds = 600.0f;
            default ExampleText = "They got one of our guys. If I get that swine ...";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return ((AGothicCharacterState::FindByUniqueName(n"HERO") != nullptr && AGothicCharacterState::FindByUniqueName(n"HERO").HasChatterMemoryEvent(GameplayTag::Memory_Chatter_Killed_OldCamper) && Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && Other != nullptr && !Other.IsCharacter(AGothicCharacterState::FindByUniqueName(n"")))) || ((AGothicCharacterState::FindByUniqueName(n"HERO") != nullptr && AGothicCharacterState::FindByUniqueName(n"HERO").HasChatterMemoryEvent(GameplayTag::Memory_Chatter_Killed_NewCamper) && Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Other != nullptr && !Other.IsCharacter(AGothicCharacterState::FindByUniqueName(n"HERO")))) || ((AGothicCharacterState::FindByUniqueName(n"HERO") != nullptr && AGothicCharacterState::FindByUniqueName(n"HERO").HasChatterMemoryEvent(GameplayTag::Memory_Chatter_Killed_SwampCamper) && Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp) && Other != nullptr && !Other.IsCharacter(AGothicCharacterState::FindByUniqueName(n"HERO"))));
            }
        }
        
        
        /** I see someone that defeated (or killed) a Peasant in the past. */
        class UGVL_Reaction_Chatter_YouDefeatedBau : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Chatter_YouDefeatedBau;
            default GlobalCooldownSeconds = 600.0f;
            default ExampleText = "I guess that's a way to mess things up at the New Camp...";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Me != nullptr && !Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Peasant) && Me != nullptr && Me.IsFriendlyTowards(AGothicCharacterState::FindByUniqueName(n"HERO")) && AGothicCharacterState::FindByUniqueName(n"HERO") != nullptr && AGothicCharacterState::FindByUniqueName(n"HERO").HasChatterForDefeatedGuild(GameplayTag::Guild_Human_NewCamp_Peasant) && Other != nullptr && Other.IsCharacter(AGothicCharacterState::FindByUniqueName(n"HERO"));
            }
        }
        
        
        /** As a TPL/GUR or GRD, I see someone that defeated (or killed) a Peasant in the past. */
        class UGVL_Reaction_Chatter_YouDefeatedBau_GuardRole : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Chatter_YouDefeatedBau_GuardRole;
            default GlobalCooldownSeconds = 600.0f;
            default ExampleText = "Impressive skills, beating up someone too busy to fight back!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Me != nullptr && !Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Peasant) && Me != nullptr && Me.IsFriendlyTowards(AGothicCharacterState::FindByUniqueName(n"HERO")) && AGothicCharacterState::FindByUniqueName(n"HERO") != nullptr && AGothicCharacterState::FindByUniqueName(n"HERO").HasChatterForDefeatedGuild(GameplayTag::Guild_Human_NewCamp_Peasant) && Other != nullptr && Other.IsCharacter(AGothicCharacterState::FindByUniqueName(n"HERO"))))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Mercenary)))
                    return false;
                
                return true;
            }
        }
        
        
        /** See someone that you remember defeated you in the past. */
        class UGVL_Reaction_Chatter_YouDefeatedMeWell : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Chatter_YouDefeatedMeWell;
            default Weight = 5.0f;
            default GlobalCooldownSeconds = 600.0f;
            default ExampleText = "It was a fair fight! You really polished my gob, man!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return AGothicCharacterState::FindByUniqueName(n"HERO") != nullptr && AGothicCharacterState::FindByUniqueName(n"HERO").HasDefeatedInChatterTimeframe(Me) && Other != nullptr && Other.IsCharacter(AGothicCharacterState::FindByUniqueName(n"HERO"));
            }
        }
        
        
        /** I see someone that I don't like and that defeated someone from my guild in the past. */
        class UGVL_Reaction_Chatter_YouDefeatedMyComrade : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Chatter_YouDefeatedMyComrade;
            default Weight = 5.0f;
            default GlobalCooldownSeconds = 600.0f;
            default ExampleText = "You've knocked down my mate ...";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return AGothicCharacterState::FindByUniqueName(n"HERO") != nullptr && AGothicCharacterState::FindByUniqueName(n"HERO").HasDefeatedInChatterTimeframe(AGothicCharacterState::FindByUniqueName(n"1")) && Me != nullptr && !Me.IsFriendlyTowards(AGothicCharacterState::FindByUniqueName(n"HERO")) && Other != nullptr && Other.IsCharacter(AGothicCharacterState::FindByUniqueName(n"HERO"));
            }
        }
        
        
        /** I see someone that defeated (or killed) a Novice in the past. */
        class UGVL_Reaction_Chatter_YouDefeatedNOV : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Chatter_YouDefeatedNOV;
            default GlobalCooldownSeconds = 600.0f;
            default ExampleText = "You're the one that goes around beating new swamcampers? Way to teach them a lesson...";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp) && Me != nullptr && !Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Novice) && Me != nullptr && Me.IsFriendlyTowards(AGothicCharacterState::FindByUniqueName(n"HERO")) && AGothicCharacterState::FindByUniqueName(n"AITESTCHARACTER") != nullptr && AGothicCharacterState::FindByUniqueName(n"AITESTCHARACTER").HasChatterForDefeatedGuild(GameplayTag::Guild_Human_SwampCamp_Novice) && Other != nullptr && Other.IsCharacter(AGothicCharacterState::FindByUniqueName(n"HERO"));
            }
        }
        
        
        /** As a SLD or GRD, I see someone that defeated (or killed) a Novice in the past. */
        class UGVL_Reaction_Chatter_YouDefeatedNOV_GuardRole : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Chatter_YouDefeatedNOV_GuardRole;
            default GlobalCooldownSeconds = 600.0f;
            default ExampleText = "You're the one that's getting rid of the loonies! Could have been a stronger one but oh well...";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp) && Me != nullptr && !Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Novice) && Me != nullptr && Me.IsFriendlyTowards(AGothicCharacterState::FindByUniqueName(n"HERO")) && AGothicCharacterState::FindByUniqueName(n"AITESTCHARACTER") != nullptr && AGothicCharacterState::FindByUniqueName(n"AITESTCHARACTER").HasChatterForDefeatedGuild(GameplayTag::Guild_Human_SwampCamp_Novice) && Other != nullptr && Other.IsCharacter(AGothicCharacterState::FindByUniqueName(n"HERO"))))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Templar)))
                    return false;
                
                return true;
            }
        }
        
        
        /** I see someone that defeated (or killed) a Digger in the past. */
        class UGVL_Reaction_Chatter_YouDefeatedVLK : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Chatter_YouDefeatedVLK;
            default GlobalCooldownSeconds = 600.0f;
            default ExampleText = "Why won't you direct your anger towards guards instead of diggers? ...";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && Me != nullptr && !Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Digger) && Me != nullptr && Me.IsFriendlyTowards(AGothicCharacterState::FindByUniqueName(n"HERO")) && AGothicCharacterState::FindByUniqueName(n"HERO") != nullptr && AGothicCharacterState::FindByUniqueName(n"HERO").HasChatterForDefeatedGuild(GameplayTag::Guild_Human_OldCamp_Digger);
            }
        }
        
        
        /** As a TPL or SLD, I see someone that defeated (or killed) a Digger in the past. */
        class UGVL_Reaction_Chatter_YouDefeatedVLK_GuardRole : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Chatter_YouDefeatedVLK_GuardRole;
            default GlobalCooldownSeconds = 600.0f;
            default ExampleText = "I don't think going after diggers is the best way to harm the Old Camp, but it's better than nothing...";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && Me != nullptr && !Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Digger) && Me != nullptr && Me.IsFriendlyTowards(AGothicCharacterState::FindByUniqueName(n"HERO")) && AGothicCharacterState::FindByUniqueName(n"HERO") != nullptr && AGothicCharacterState::FindByUniqueName(n"HERO").HasChatterForDefeatedGuild(GameplayTag::Guild_Human_OldCamp_Digger)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard)))
                    return false;
                
                return true;
            }
        }
        
        
        /** See someone that you remember killed an Ore Baron */
        class UGVL_Reaction_Chatter_YouKilledEBr : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Chatter_YouKilledEBr;
            default Weight = 5.0f;
            default GlobalCooldownSeconds = 600.0f;
            default ExampleText = "You killed an Ore Baron! Man, are you completely nuts!?";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return AGothicCharacterState::FindByUniqueName(n"HERO") != nullptr && AGothicCharacterState::FindByUniqueName(n"HERO").HasChatterMemoryEvent(GameplayTag::Memory_Chatter_Killed_OreBaron) && Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && Me != nullptr && !Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_OreBaron) && Other != nullptr && Other.IsCharacter(AGothicCharacterState::FindByUniqueName(n"HERO"));
            }
        }
        
        
        /** See someone that you remember killed a Guru */
        class UGVL_Reaction_Chatter_YouKilledGur : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Chatter_YouKilledGur;
            default Weight = 5.0f;
            default GlobalCooldownSeconds = 600.0f;
            default ExampleText = "You killed a Guru! Boy, I don't believe it!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return AGothicCharacterState::FindByUniqueName(n"HERO") != nullptr && AGothicCharacterState::FindByUniqueName(n"HERO").HasChatterMemoryEvent(GameplayTag::Memory_Chatter_Killed_Guru) && Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp) && Me != nullptr && !Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Guru) && Other != nullptr && Other.IsCharacter(AGothicCharacterState::FindByUniqueName(n"HERO"));
            }
        }
        
        
        /** See someone that you remember killed a Mage */
        class UGVL_Reaction_Chatter_YouKilledMage : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Chatter_YouKilledMage;
            default Weight = 5.0f;
            default GlobalCooldownSeconds = 600.0f;
            default ExampleText = "You've killed a magician! How do you ever plan to justify that?";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return ((AGothicCharacterState::FindByUniqueName(n"HERO") != nullptr && AGothicCharacterState::FindByUniqueName(n"HERO").HasKilledCharactersOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage, 1) && Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && Other != nullptr && Other.IsCharacter(AGothicCharacterState::FindByUniqueName(n"HERO")) && G1R::UStoryG1R::Get().FireMagesDead == 0)) || ((AGothicCharacterState::FindByUniqueName(n"HERO") != nullptr && AGothicCharacterState::FindByUniqueName(n"HERO").HasChatterMemoryEvent(GameplayTag::Memory_Chatter_Killed_WaterMage) && Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Me != nullptr && !Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage) && Other != nullptr && Other.IsCharacter(AGothicCharacterState::FindByUniqueName(n"HERO"))));
            }
        }
        
        
        /** See someone that you remember killed a member of your guild in the past */
        class UGVL_Reaction_Chatter_YouKilledMyFriend : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Chatter_YouKilledMyFriend;
            default Weight = 5.0f;
            default GlobalCooldownSeconds = 600.0f;
            default ExampleText = "One of our people has died and you had something to do with it! Make the slightest mistake and you are done with!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return ((Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && AGothicCharacterState::FindByUniqueName(n"HERO") != nullptr && AGothicCharacterState::FindByUniqueName(n"HERO").HasChatterMemoryEvent(GameplayTag::Memory_Chatter_Killed_OldCamper) && Me != nullptr && !Me.IsFriendlyTowards(AGothicCharacterState::FindByUniqueName(n"HERO")) && Other != nullptr && Other.IsCharacter(AGothicCharacterState::FindByUniqueName(n"HERO")))) || ((Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && AGothicCharacterState::FindByUniqueName(n"HERO") != nullptr && AGothicCharacterState::FindByUniqueName(n"HERO").HasChatterMemoryEvent(GameplayTag::Memory_Chatter_Killed_NewCamper) && Me != nullptr && !Me.IsFriendlyTowards(AGothicCharacterState::FindByUniqueName(n"HERO")) && Other != nullptr && Other.IsCharacter(AGothicCharacterState::FindByUniqueName(n"HERO"))));
            }
        }
        
        
        /** Generic. See someone that you remember killed a member of the New Camp in the past. */
        class UGVL_Reaction_Chatter_YouKilledNCfolk : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Chatter_YouKilledNCfolk;
            default Weight = 5.0f;
            default GlobalCooldownSeconds = 600.0f;
            default ExampleText = "The New Camp has suffered a tragic loss, and it appears you're involved!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && AGothicCharacterState::FindByUniqueName(n"HERO") != nullptr && AGothicCharacterState::FindByUniqueName(n"HERO").HasChatterMemoryEvent(GameplayTag::Memory_Chatter_Killed_NewCamper) && G1R::UStoryG1R::Get() != nullptr && !G1R::UStoryG1R::Get().HasReachedChapter(5) && Other != nullptr && Other.IsCharacter(AGothicCharacterState::FindByUniqueName(n"HERO"));
            }
        }
        
        
        /** Generic. See someone that you remember killed a member of the Old Camp in the past. */
        class UGVL_Reaction_Chatter_YouKilledOCfolk : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Chatter_YouKilledOCfolk;
            default Weight = 5.0f;
            default GlobalCooldownSeconds = 600.0f;
            default ExampleText = "A member of the Old Camp is dead, and your name was mentioned in connection with his death ...";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && AGothicCharacterState::FindByUniqueName(n"HERO") != nullptr && AGothicCharacterState::FindByUniqueName(n"HERO").HasChatterMemoryEvent(GameplayTag::Memory_Chatter_Killed_OldCamper) && Other != nullptr && Other.IsCharacter(AGothicCharacterState::FindByUniqueName(n"HERO"));
            }
        }
        
        
        /** Generic. See someone that you remember killed a member of the Swamp Camp in the past. */
        class UGVL_Reaction_Chatter_YouKilledPSIfolk : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Chatter_YouKilledPSIfolk;
            default Weight = 5.0f;
            default GlobalCooldownSeconds = 600.0f;
            default ExampleText = "The brotherhood counts one believer less, and you got him on your conscience!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp) && AGothicCharacterState::FindByUniqueName(n"HERO") != nullptr && AGothicCharacterState::FindByUniqueName(n"HERO").HasChatterMemoryEvent(GameplayTag::Memory_Chatter_Killed_SwampCamper) && Other != nullptr && Other.IsCharacter(AGothicCharacterState::FindByUniqueName(n"HERO"));
            }
        }
        
        
        /** See someone that you remember stole from the Ore Barons */
        class UGVL_Reaction_Chatter_YouStoleFromEBr : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Chatter_YouStoleFromEBr;
            default GlobalCooldownSeconds = 600.0f;
            default ExampleText = "You've stolen from the Ore Barons! What the hell was that for?";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return AGothicCharacterState::FindByUniqueName(n"HERO") != nullptr && AGothicCharacterState::FindByUniqueName(n"HERO").HasChatterMemoryEvent(GameplayTag::Memory_Chatter_Stole_FromOreBaron) && Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && Me != nullptr && !Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_OreBaron) && Other != nullptr && Other.IsCharacter(AGothicCharacterState::FindByUniqueName(n"HERO"));
            }
        }
        
        
        /** See someone that you remember stole from the Gurus */
        class UGVL_Reaction_Chatter_YouStoleFromGur : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Chatter_YouStoleFromGur;
            default ExampleText = "You stole from the Gurus? What a pity they found you out.";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return AGothicCharacterState::FindByUniqueName(n"HERO") != nullptr && AGothicCharacterState::FindByUniqueName(n"HERO").HasChatterMemoryEvent(GameplayTag::Memory_Chatter_Stole_FromGuru) && Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp) && Me != nullptr && !Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Guru) && Other != nullptr && Other.IsCharacter(AGothicCharacterState::FindByUniqueName(n"HERO"));
            }
        }
        
        
        /** See someone that you remember stole from you in the past. */
        class UGVL_Reaction_Chatter_YouStoleFromMe : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Chatter_YouStoleFromMe;
            default ExampleText = "You've stolen from me, you arsehole! Don't try that again!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return G1R::UStoryG1R::Get().PlaceholderCondition == 1;
            }
        }
        
        
        /** See someone that you remember stole property of your guild in the past. */
        class UGVL_Reaction_Chatter_YouStoleFromUs : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Chatter_YouStoleFromUs;
            default ExampleText = "We want our things back! Give us 'em!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return ((AGothicCharacterState::FindByUniqueName(n"HERO") != nullptr && AGothicCharacterState::FindByUniqueName(n"HERO").HasChatterMemoryEvent(GameplayTag::Memory_Chatter_Stole_FromNewCamper) && Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Me != nullptr && !Me.IsFriendlyTowards(AGothicCharacterState::FindByUniqueName(n"HERO")) && Other != nullptr && Other.IsCharacter(AGothicCharacterState::FindByUniqueName(n"HERO")))) || ((AGothicCharacterState::FindByUniqueName(n"HERO") != nullptr && AGothicCharacterState::FindByUniqueName(n"HERO").HasChatterMemoryEvent(GameplayTag::Memory_Chatter_Stole_FromOldCamper) && Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && Me != nullptr && !Me.IsFriendlyTowards(AGothicCharacterState::FindByUniqueName(n"HERO")) && Other != nullptr && Other.IsCharacter(AGothicCharacterState::FindByUniqueName(n"HERO")))) || ((AGothicCharacterState::FindByUniqueName(n"HERO") != nullptr && AGothicCharacterState::FindByUniqueName(n"HERO").HasChatterMemoryEvent(GameplayTag::Memory_Chatter_Stole_FromSwampCamper) && Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp) && Me != nullptr && !Me.IsFriendlyTowards(AGothicCharacterState::FindByUniqueName(n"HERO")) && Other != nullptr && Other.IsCharacter(AGothicCharacterState::FindByUniqueName(n"HERO"))));
            }
        }
        
        
        /** The victim stands up after being beaten by a stronger attacker. */
        class UGVL_Reaction_Combat_Beaten_YesYes : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Combat_Beaten_YesYes;
            default ExampleText = "Don't panic! You've won!";
        }
        
        
        /** The victim stands up after being beaten by an equal or weaker attacker. */
        class UGVL_Reaction_Combat_Beaten_YoullBeSorryForThis : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Combat_Beaten_YoullBeSorryForThis;
            default ExampleText = "You'll be sorry for that!";
        }
        
        
        /**
         * NPC gets damaged by a friendly under the effects of the control spell and they saw the spell cast
         */
        
        class UGVL_Reaction_Combat_Damage_ControlledFriendly : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Combat_Damage_ControlledFriendly;
            default ExampleText = "Come to your senses!";
        }
        
        
        /** NPC gets damaged intentionally.
        Remark to be made after any damage noise. */
        class UGVL_Reaction_Combat_Damage_Intentional : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Combat_Damage_Intentional;
            default ExampleText = "Not bad... but you'll need more than that!";
        }
        
        
        /** NPC gets damaged unintentionally */
        class UGVL_Reaction_Combat_Damage_Unintentional : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Combat_Damage_Unintentional;
            default ExampleText = "Don't hit me!";
        }
        
        
        /** NPC damages their target.
        Remark to be made after any attack noise. */
        class UGVL_Reaction_Combat_DamageDealt : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Combat_DamageDealt;
            default ExampleText = "Not as smart as you look!";
        }
        
        
        class UGVL_Reaction_Combat_End_Death : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Combat_End_Death;
            default Weight = 0.1f;
            default GlobalCooldownSeconds = 3.0f;
        }
        
        
        class UGVL_Reaction_Combat_End_Death_Creature : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Combat_End_Death_Creature;
        }
        
        
        class UGVL_Reaction_Combat_End_Death_Creature_Bloodfly : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Combat_End_Death_Creature_Bloodfly;
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return Other != nullptr && Other.IsOfSpecies(GameplayTag::Species_Creature_Bloodfly);
            }
        }
        
        
        class UGVL_Reaction_Combat_End_Death_Creature_Golem : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Combat_End_Death_Creature_Golem;
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return Other != nullptr && Other.IsOfSpecies(GameplayTag::Species_Creature_Golem);
            }
        }
        
        
        class UGVL_Reaction_Combat_End_Death_Creature_Harpy : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Combat_End_Death_Creature_Harpy;
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return Other != nullptr && Other.IsOfSpecies(GameplayTag::Species_Creature_Harpy);
            }
        }
        
        
        class UGVL_Reaction_Combat_End_Death_Creature_Large : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Combat_End_Death_Creature_Large;
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return (Other != nullptr && Other.IsOfSpecies(GameplayTag::Species_Creature_Swampshark)) || (Other != nullptr && Other.IsOfSpecies(GameplayTag::Species_Creature_Bloodhound)) || (Other != nullptr && Other.IsOfSpecies(GameplayTag::Species_Creature_Troll)) || (Other != nullptr && Other.IsOfSpecies(GameplayTag::Species_Creature_Shadowbeast));
            }
        }
        
        
        class UGVL_Reaction_Combat_End_Death_Creature_Orc : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Combat_End_Death_Creature_Orc;
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return Other != nullptr && Other.IsOfSpecies(GameplayTag::Species_Orc);
            }
        }
        
        
        class UGVL_Reaction_Combat_End_Death_Creature_Troll : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Combat_End_Death_Creature_Troll;
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return Other != nullptr && Other.IsOfSpecies(GameplayTag::Species_Creature_Troll);
            }
        }
        
        
        class UGVL_Reaction_Combat_End_Death_Creature_Undead_Skeleton : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Combat_End_Death_Creature_Undead_Skeleton;
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return Other != nullptr && Other.IsOfSpecies(GameplayTag::Species_Creature_Undead_Skeleton);
            }
        }
        
        
        /** I warn a beaten aggressor not to commit the same transgression again. */
        class UGVL_Reaction_Combat_End_ForgiveThisTime : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Combat_End_ForgiveThisTime;
            default GlobalCooldownSeconds = 3.0f;
            default ExampleText = "I won't be so merciful next time.";
        }
        
        
        /** I warn a beaten friendly aggressor after a fight. */
        class UGVL_Reaction_Combat_End_LetsForgetOurLittleFight : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Combat_End_LetsForgetOurLittleFight;
            default GlobalCooldownSeconds = 3.0f;
            default ExampleText = "Let's forget about this little fight, okay?";
        }
        
        
        /** NPC sees during combat that combatant runs from the fight */
        class UGVL_Reaction_Combat_End_RunCoward : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Combat_End_RunCoward;
            default GlobalCooldownSeconds = 3.0f;
            default ExampleText = "Fleeing already? Shame on you!";
        }
        
        
        /**
         * I spot a combatant attempting to hide. (Second person or ambiguous, the speaker could be alone.)
         */
        
        class UGVL_Reaction_Combat_PointOutCharacter : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Combat_PointOutCharacter;
            default ExampleText = "There! // You won't get away so easily!";
        }
        
        
        /** generic, I start fighting a character. */
        class UGVL_Reaction_Combat_Start : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Combat_Start;
            default Weight = 0.1f;
            default GlobalCooldownSeconds = 3.0f;
            default ExampleText = "Now you'll get one in your mug ...";
        }
        
        
        /**
         * Someone was caught in a place he shouldn't be, got a warning and didin't move so now he will be
         * attacked
         */
        
        class UGVL_Reaction_Combat_Start_Intruder : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Combat_Start_Intruder;
            default ExampleText = "You don't want to leave? I'll make you.";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return Context.TagsOther.HasTag(GameplayTag::VoicelineContext_Intruder);
            }
        }
        
        
        /** I start fighting a creature. */
        class UGVL_Reaction_Combat_Start_Monster : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Combat_Start_Monster;
            default ExampleText = "Come here, beast!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return Other != nullptr && !Other.IsOfSpecies(GameplayTag::Species_Human);
            }
        }
        
        
        class UGVL_Reaction_Combat_Start_Monster_Bloodfly : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Combat_Start_Monster_Bloodfly;
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Other != nullptr && !Other.IsOfSpecies(GameplayTag::Species_Human)))
                    return false;
                
                if (!(Other != nullptr && Other.IsOfSpecies(GameplayTag::Species_Creature_Bloodfly)))
                    return false;
                
                return true;
            }
        }
        
        
        class UGVL_Reaction_Combat_Start_Monster_Demon : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Combat_Start_Monster_Demon;
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Other != nullptr && !Other.IsOfSpecies(GameplayTag::Species_Human)))
                    return false;
                
                if (!(Other != nullptr && Other.IsOfSpecies(GameplayTag::Species_Creature_Demon)))
                    return false;
                
                return true;
            }
        }
        
        
        /** I start fighting a goblin. */
        class UGVL_Reaction_Combat_Start_Monster_Goblin : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Combat_Start_Monster_Goblin;
            default ExampleText = "You little greenskin!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Other != nullptr && !Other.IsOfSpecies(GameplayTag::Species_Human)))
                    return false;
                
                if (!(Other != nullptr && Other.IsOfSpecies(GameplayTag::Species_Creature_Goblin)))
                    return false;
                
                return true;
            }
        }
        
        
        class UGVL_Reaction_Combat_Start_Monster_Golem : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Combat_Start_Monster_Golem;
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Other != nullptr && !Other.IsOfSpecies(GameplayTag::Species_Human)))
                    return false;
                
                if (!(Other != nullptr && Other.IsOfSpecies(GameplayTag::Species_Creature_Golem)))
                    return false;
                
                return true;
            }
        }
        
        
        class UGVL_Reaction_Combat_Start_Monster_Harpy : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Combat_Start_Monster_Harpy;
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Other != nullptr && !Other.IsOfSpecies(GameplayTag::Species_Human)))
                    return false;
                
                if (!(Other != nullptr && Other.IsOfSpecies(GameplayTag::Species_Creature_Harpy)))
                    return false;
                
                return true;
            }
        }
        
        
        class UGVL_Reaction_Combat_Start_Monster_Large : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Combat_Start_Monster_Large;
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Other != nullptr && !Other.IsOfSpecies(GameplayTag::Species_Human)))
                    return false;
                
                if (!((Other != nullptr && Other.IsOfSpecies(GameplayTag::Species_Creature_Swampshark)) || (Other != nullptr && Other.IsOfSpecies(GameplayTag::Species_Creature_Bloodhound)) || (Other != nullptr && Other.IsOfSpecies(GameplayTag::Species_Creature_Troll)) || (Other != nullptr && Other.IsOfSpecies(GameplayTag::Species_Creature_Shadowbeast))))
                    return false;
                
                return true;
            }
        }
        
        
        class UGVL_Reaction_Combat_Start_Monster_Minecrawler : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Combat_Start_Monster_Minecrawler;
            default ExampleText = "Minecrawler!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Other != nullptr && !Other.IsOfSpecies(GameplayTag::Species_Human)))
                    return false;
                
                if (!(Other != nullptr && Other.IsOfSpecies(GameplayTag::Species_Creature_Minecrawler)))
                    return false;
                
                return true;
            }
        }
        
        
        class UGVL_Reaction_Combat_Start_Monster_Orc : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Combat_Start_Monster_Orc;
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Other != nullptr && !Other.IsOfSpecies(GameplayTag::Species_Human)))
                    return false;
                
                if (!(Other != nullptr && Other.IsOfSpecies(GameplayTag::Species_Orc)))
                    return false;
                
                return true;
            }
        }
        
        
        /** I start fighting a scavenger. */
        class UGVL_Reaction_Combat_Start_Monster_Scavenger : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Combat_Start_Monster_Scavenger;
            default ExampleText = "I will roast you on a stick, birdie!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Other != nullptr && !Other.IsOfSpecies(GameplayTag::Species_Human)))
                    return false;
                
                if (!(Other != nullptr && Other.IsOfSpecies(GameplayTag::Species_Creature_Scavenger)))
                    return false;
                
                return true;
            }
        }
        
        
        class UGVL_Reaction_Combat_Start_Monster_Troll : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Combat_Start_Monster_Troll;
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Other != nullptr && !Other.IsOfSpecies(GameplayTag::Species_Human)))
                    return false;
                
                if (!(Other != nullptr && Other.IsOfSpecies(GameplayTag::Species_Creature_Troll)))
                    return false;
                
                return true;
            }
        }
        
        
        class UGVL_Reaction_Combat_Start_Monster_Undead : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Combat_Start_Monster_Undead;
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Other != nullptr && !Other.IsOfSpecies(GameplayTag::Species_Human)))
                    return false;
                
                if (!(Other != nullptr && Other.IsOfSpecies(GameplayTag::Species_Creature_Undead)))
                    return false;
                
                return true;
            }
        }
        
        
        class UGVL_Reaction_Combat_Start_Monster_Undead_Skeleton : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Combat_Start_Monster_Undead_Skeleton;
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Other != nullptr && !Other.IsOfSpecies(GameplayTag::Species_Human)))
                    return false;
                
                if (!(Other != nullptr && Other.IsOfSpecies(GameplayTag::Species_Creature_Undead)))
                    return false;
                
                if (!(Other != nullptr && Other.IsOfSpecies(GameplayTag::Species_Creature_Undead_Skeleton)))
                    return false;
                
                return true;
            }
        }
        
        
        /** I start fighting a sworn enemy. */
        class UGVL_Reaction_Combat_Start_MortalEnemy : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Combat_Start_MortalEnemy;
            default ExampleText = "You're done for!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return Me != nullptr && Me.HasPermanentRelationshipTowards(Other, ERelationship::Enemy);
            }
        }
        
        
        /** generic, I start fighting a character. For NC characters. */
        class UGVL_Reaction_Combat_Start_NC : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Combat_Start_NC;
            default ExampleText = "For Gorn!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp);
            }
        }
        
        
        /** A Water mage start a fight */
        class UGVL_Reaction_Combat_Start_NC_KDW : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Combat_Start_NC_KDW;
            default ExampleText = "You have a lot to learn.";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage)))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * generic, I start fighting a character. For NC characters fighting against other NC guild
         * characters.
         */
        
        class UGVL_Reaction_Combat_Start_NC_toNC : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Combat_Start_NC_toNC;
            default ExampleText = "Gorn will be disappointed I had to beat you up!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                if (!((Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp)) || (Other != nullptr && Other.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp))))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * generic, I start fighting a character. For NC characters fighting against OC guild characters.
         */
        
        class UGVL_Reaction_Combat_Start_NC_toOC : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Combat_Start_NC_toOC;
            default ExampleText = "I'll have your head sent back to Gomez!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                if (!(Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && Other != nullptr && !Other.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * generic, I start fighting a character. For NC characters fighting against SC guild characters.
         */
        
        class UGVL_Reaction_Combat_Start_NC_toSC : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Combat_Start_NC_toSC;
            default ExampleText = "I'll just help the smoke exit your head!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                if (!(Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp) && Other != nullptr && !Other.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                return true;
            }
        }
        
        
        /** generic, I start fighting a character. For OC characters. */
        class UGVL_Reaction_Combat_Start_OC : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Combat_Start_OC;
            default ExampleText = "For Gomez!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp);
            }
        }
        
        
        /** An  ore baron starts a fight. */
        class UGVL_Reaction_Combat_Start_OC_EBR : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Combat_Start_OC_EBR;
            default ExampleText = "You regret to come here to disturb us!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_OreBaron)))
                    return false;
                
                return true;
            }
        }
        
        
        /** A Fire mage starts a fight */
        class UGVL_Reaction_Combat_Start_OC_KDF : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Combat_Start_OC_KDF;
            default ExampleText = "The rage of Innos will punish you.";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage)))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * generic, I start fighting a character. For OC characters fighting against NC guild characters.
         */
        
        class UGVL_Reaction_Combat_Start_OC_toNC : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Combat_Start_OC_toNC;
            default ExampleText = "I'll have them bury you in your cave!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                if (!(Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Other != nullptr && !Other.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * generic, I start fighting a character. For OC characters fighting against other OC guild
         * characters.
         */
        
        class UGVL_Reaction_Combat_Start_OC_toOC : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Combat_Start_OC_toOC;
            default ExampleText = "Bloody traitor! You're dead!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                if (!((Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp)) || (Other != nullptr && Other.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp))))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * generic, I start fighting a character. For OC characters fighting against SC guild characters.
         */
        
        class UGVL_Reaction_Combat_Start_OC_toSC : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Combat_Start_OC_toSC;
            default ExampleText = "I'll send you back to your cult in a bag!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                if (!(Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp) && Other != nullptr && !Other.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp)))
                    return false;
                
                return true;
            }
        }
        
        
        /** generic, I start fighting a character. For SC characters. */
        class UGVL_Reaction_Combat_Start_SC : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Combat_Start_SC;
            default ExampleText = "For Beliar!
            Breathe in! It might be the last time!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp);
            }
        }
        
        
        /** Kalomnist Swamp Camp templar to player when "Kalom Experiments" is success */
        class UGVL_Reaction_Combat_Start_SC_KalomExpSuccess : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Combat_Start_SC_KalomExpSuccess;
            default ExampleText = "Hey! You bastard. You conned me!
            You're really think we're letting you waltz in here after what you pulled? Piss off!
            Okay, that's it, I'm fed up with your bullshit!
            Have you lost your bloody mind?!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp)))
                    return false;
                
                if (!(Other != nullptr && Other.IsHero() && Quest::SwampCamp_SCCHAPTER3_KALOMEXPERIMENTS != nullptr && Quest::SwampCamp_SCCHAPTER3_KALOMEXPERIMENTS.HasSucceeded() && Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Kalomnist)))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * generic, I start fighting a character. For SC characters fighting against NC guild characters.
         */
        
        class UGVL_Reaction_Combat_Start_SC_toNC : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Combat_Start_SC_toNC;
            default ExampleText = "Let me show you the outside of the cavern!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp)))
                    return false;
                
                if (!(Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Other != nullptr && !Other.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp)))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * generic, I start fighting a character. For SC characters fighting against OC guild characters.
         */
        
        class UGVL_Reaction_Combat_Start_SC_toOC : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Combat_Start_SC_toOC;
            default ExampleText = "Let me help you see the truth!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp)))
                    return false;
                
                if (!(Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && Other != nullptr && !Other.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp)))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * generic, I start fighting a character. For SC characters fighting against other SC guild
         * characters.
         */
        
        class UGVL_Reaction_Combat_Start_SC_toSC : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Combat_Start_SC_toSC;
            default ExampleText = "You have chosen not to see, I will shut your eyes for good!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp)))
                    return false;
                
                if (!((Other != nullptr && Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp)) || (Other != nullptr && Other.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp))))
                    return false;
                
                return true;
            }
        }
        
        
        /** Someone was seen stealing and now will be attacked for it */
        class UGVL_Reaction_Combat_Start_Thief : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Combat_Start_Thief;
            default ExampleText = "I'll finish you off, you thief!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return Context.TagsOther.HasTag(GameplayTag::VoicelineContext_Thief);
            }
        }
        
        
        /** Me, guard, start attacking thief that ignored warnings by me or someone else. */
        class UGVL_Reaction_Combat_Start_Thief_Guard : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Combat_Start_Thief_Guard;
            default ExampleText = "Now I'll teach you to respect private property!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Context.TagsOther.HasTag(GameplayTag::VoicelineContext_Thief)))
                    return false;
                
                if (!((Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard)) || (Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Mercenary)) || (Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Templar)) || (Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Templar))))
                    return false;
                
                return true;
            }
        }
        
        
        /** Seen thief that stole from me and ignored warnings */
        class UGVL_Reaction_Combat_Start_Thief_MyStuff : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Combat_Start_Thief_MyStuff;
            default ExampleText = "I've warned you before to keep your hands off my stuff!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Context.TagsOther.HasTag(GameplayTag::VoicelineContext_Thief)))
                    return false;
                
                if (!(Context.TagsMe.HasTag(GameplayTag::VoicelineContext_Victim_Theft)))
                    return false;
                
                return true;
            }
        }
        
        
        /** Someone who was warnned about something didin't stop doing that so now it will be attacked */
        class UGVL_Reaction_Combat_Start_YouAskedForIt : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Combat_Start_YouAskedForIt;
            default ExampleText = "You were asking for it!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return Context.TagsOther.HasTag(GameplayTag::VoicelineContext_AskedForIt);
            }
        }
        
        
        /** Someone who was warnned about something didin't stop doing that so now it will be attacked */
        class UGVL_Reaction_Combat_Start_YouAskedForIt_OC_EBR : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Combat_Start_YouAskedForIt_OC_EBR;
            default ExampleText = "You need to learn a lesson.";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Context.TagsOther.HasTag(GameplayTag::VoicelineContext_AskedForIt)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_OreBaron)))
                    return false;
                
                return true;
            }
        }
        
        
        /** NPC sees someone under his charge being attacked and will join the fight */
        class UGVL_Reaction_Combat_Start_YouAttackedMyCharge : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Combat_Start_YouAttackedMyCharge;
            default ExampleText = "Nobody messes with my pals!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return Context.TagsOther.HasTag(GameplayTag::VoicelineContext_AttackedCharge);
            }
        }
        
        
        /** NPC sees someone killing someone from their group and will join the fight */
        class UGVL_Reaction_Combat_Start_YouKilledOneOfUs : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Combat_Start_YouKilledOneOfUs;
            default ExampleText = "You have knocked down one of us. Now I'll knock YOU down!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return Context.TagsOther.HasTag(GameplayTag::VoicelineContext_KilledOneOfUs);
            }
        }
        
        
        /** Character who lost a fight before tries again */
        class UGVL_Reaction_Combat_Start_YouStillNotHaveEnough : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Combat_Start_YouStillNotHaveEnough;
            default ExampleText = "Looks like you want some in your mug!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return Context.TagsOther.HasTag(GameplayTag::VoicelineContext_NotHadEnough);
            }
        }
        
        
        /** Character is taunting an opponent during combat. */
        class UGVL_Reaction_Combat_Taunt : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Combat_Taunt;
            default GlobalCooldownSeconds = 3.0f;
            default ExampleText = "Come here!";
        }
        
        
        /** Character is taunting an opponent during a combat to death. */
        class UGVL_Reaction_Combat_Taunt_ToDeath : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Combat_Taunt_ToDeath;
            default ExampleText = "You are so dead!
            I will skin you alive!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return Context.TagsOther.HasTag(GameplayTag::VoicelineContext_Death);
            }
        }
        
        
        /** Character is taunting an opponent during a combat to death.
        Target's health is over 50% */
        class UGVL_Reaction_Combat_Taunt_ToDeath_OtherHealth_High : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Combat_Taunt_ToDeath_OtherHealth_High;
        }
        
        
        /** Character is taunting an opponent during a combat to death.
        Target's health is below 25% */
        class UGVL_Reaction_Combat_Taunt_ToDeath_OtherHealth_Low : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Combat_Taunt_ToDeath_OtherHealth_Low;
        }
        
        
        /**
         * Character is taunting an opponent during a combat to death. Target's health is between 25% and
         * 50%
         */
        
        class UGVL_Reaction_Combat_Taunt_ToDeath_OtherHealth_Medium : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Combat_Taunt_ToDeath_OtherHealth_Medium;
        }
        
        
        /** Character is taunting an opponent during a combat to death.
        Character's health is over 50% */
        class UGVL_Reaction_Combat_Taunt_ToDeath_SelfHealth_High : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Combat_Taunt_ToDeath_SelfHealth_High;
        }
        
        
        /** Character is taunting an opponent during a combat to death.
        Character's health is below 25% */
        class UGVL_Reaction_Combat_Taunt_ToDeath_SelfHealth_Low : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Combat_Taunt_ToDeath_SelfHealth_Low;
        }
        
        
        /**
         * Character is taunting an opponent during a combat to death. Character's health is between 25% and
         * 50%
         */
        
        class UGVL_Reaction_Combat_Taunt_ToDeath_SelfHealth_Medium : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Combat_Taunt_ToDeath_SelfHealth_Medium;
        }
        
        
        /** Character is taunting an opponent during a sparring fight. */
        class UGVL_Reaction_Combat_Taunt_TrainingFight : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Combat_Taunt_TrainingFight;
            default ExampleText = "Show me what you're made of!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return Context.TagsOther.HasTag(GameplayTag::VoicelineContext_Training);
            }
        }
        
        
        /** Enjoying the concert */
        class UGVL_Reaction_Concert_Appreciate : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Concert_Appreciate;
            default ExampleText = "Holy shit, they are AWESOME.";
        }
        
        
        /** More energetic enjoyer */
        class UGVL_Reaction_Concert_Brawl : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Concert_Brawl;
            default ExampleText = "Hell, yeah!";
        }
        
        
        /** Singing the song */
        class UGVL_Reaction_Concert_RoarAlong : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Concert_RoarAlong;
            default ExampleText = "\"Herr Mannelig...\" (sings part of lyrics)";
        }
        
        
        /** NPC has seen any sort of crime and calls for guards if they're around */
        class UGVL_Reaction_Crime_Alarm_CallGuards : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Crime_Alarm_CallGuards;
            default ExampleText = "Guards! Over here!";
        }
        
        
        /**
         * NPC has seen character in an area they're not supposed to be in and guards are around (NPC is
         * weaker than intruder)
         */
        
        class UGVL_Reaction_Crime_Alarm_CallGuards_IntruderAlert : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Crime_Alarm_CallGuards_IntruderAlert;
            default ExampleText = "ALERT!!! INTRUDER!!!";
        }
        
        
        /** A Water Mage has seen a crime and calls for help */
        class UGVL_Reaction_Crime_Alarm_CallGuards_NC_KDW : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Crime_Alarm_CallGuards_NC_KDW;
            default ExampleText = "Brothers! I need your help!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage);
            }
        }
        
        
        /** A Ore Baron has seen a crime and calls for guards */
        class UGVL_Reaction_Crime_Alarm_CallGuards_OC_EBR : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Crime_Alarm_CallGuards_OC_EBR;
            default ExampleText = "Guards, kill him!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_OreBaron);
            }
        }
        
        
        /** A Fire Mage has seen a crime and calls for help */
        class UGVL_Reaction_Crime_Alarm_CallGuards_OC_KDF : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Crime_Alarm_CallGuards_OC_KDF;
            default ExampleText = "Brothers! I need your help!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage);
            }
        }
        
        
        /** I hear someone alert me about something. */
        class UGVL_Reaction_Crime_Alerted : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Crime_Alerted;
            default ExampleText = "What?";
        }
        
        
        /** I hear someone alert me about a pickpocket stealing from me. */
        class UGVL_Reaction_Crime_Alerted_Pickpocket : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Crime_Alerted_Pickpocket;
            default ExampleText = "No! My stuff!";
        }
        
        
        /**
         * Keep questioning an intruder in my home, I don't want to fight and there's no guards nearby but I
         * would like them to leave. (add a few variations per voice)
         */
        
        class UGVL_Reaction_Crime_Intruder_InsistWhatDoYouWant : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Crime_Intruder_InsistWhatDoYouWant;
            default ExampleText = "Why are you in here? Please go away...";
        }
        
        
        /** On first seeing an intruder in my home, I don't want to fight and there's no guards nearby. */
        class UGVL_Reaction_Crime_Intruder_WhatDoYouWant : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Crime_Intruder_WhatDoYouWant;
            default ExampleText = "Woah, what are you doing in here?";
        }
        
        
        /**
         * I, guard, see a character that has beaten me in the past commiting a minor criminal action like
         * theft, pickpocketing or lockpicking.
         */
        
        class UGVL_Reaction_Crime_LookAway : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Crime_LookAway;
            default ExampleText = "I didn't see ANYTHING! I'm not even here!
            *whistling*
            Nope...
            ";
        }
        
        
        /** NPC sees a pickpocket attempting to steal from a character. */
        class UGVL_Reaction_Crime_Pickpocketing_BehindYou : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Crime_Pickpocketing_BehindYou;
            default ExampleText = "Behind you! Thief!";
        }
        
        
        /** Another character attempted to pickpocket me and failed the interaction. */
        class UGVL_Reaction_Crime_Pickpocketing_Failed : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Crime_Pickpocketing_Failed;
            default ExampleText = "Hey! You trying to steal from me?? Sod off!";
        }
        
        
        /** I hear someone attempting to pickpocket me from behind. */
        class UGVL_Reaction_Crime_Pickpocketing_Heard : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Crime_Pickpocketing_Heard;
            default ExampleText = "Huh? What are you doing?";
        }
        
        
        /** I indicate where a criminal is to a guard that came to my aid. */
        class UGVL_Reaction_Crime_PointOutCharacter : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Crime_PointOutCharacter;
            default ExampleText = "That's him!";
        }
        
        
        /** I see someone sneaking. */
        class UGVL_Reaction_Crime_Suspect : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Crime_Suspect;
            default ExampleText = "Hey, you! What are you creeping around here for?";
        }
        
        
        /**
         * I see someone steal something from someone else I don't care about or steal something mine that I
         * don't care about.
         */
        
        class UGVL_Reaction_Crime_Thief_DontCare : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Crime_Thief_DontCare;
            default ExampleText = "You can keep that...";
        }
        
        
        /** I see a thief that stole from me get away. */
        class UGVL_Reaction_Crime_Thief_GetsAway : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Crime_Thief_GetsAway;
            default ExampleText = "Just keep it then! I don't need it anyway!";
        }
        
        
        /** Seen a character interact with a chest they don't own, not stolen anything yet. */
        class UGVL_Reaction_Crime_Thief_HandsOff : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Crime_Thief_HandsOff;
            default ExampleText = "You better not take anything from in there...";
        }
        
        
        /** Seen a character attempting to lockpick a chest or door they are not allowed to. */
        class UGVL_Reaction_Crime_Thief_Lockpicking : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Crime_Thief_Lockpicking;
            default ExampleText = "Hey! That's locked for a reason!";
        }
        
        
        /** Lost perception of thief and thief escaped */
        class UGVL_Reaction_Crime_Thief_LostPerception : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Crime_Thief_LostPerception;
            default ExampleText = "What? Where did that scoundrel go?";
        }
        
        
        /**
         * I have demanded a thief to return what they've stolen and they draw a weapon on me, I don't want
         * to fight them.
         */
        
        class UGVL_Reaction_Crime_Thief_OkayKeepIt : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Crime_Thief_OkayKeepIt;
            default ExampleText = "Okay, okay, keep it!";
        }
        
        
        /**
         * I have demanded a thief to return what they've stolen and they've dropped something equally
         * valuable to me.
         */
        
        class UGVL_Reaction_Crime_Thief_OkayToo : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Crime_Thief_OkayToo;
            default ExampleText = "I guess we're trading then.";
        }
        
        
        /** I see a character carrying a weapon they stole from me. */
        class UGVL_Reaction_Crime_Thief_ThatsMyWeapon : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Crime_Thief_ThatsMyWeapon;
            default ExampleText = "You're running around with MY weapon!";
        }
        
        
        /** I see someone exit an area they were not allowed to be in and go investigate. */
        class UGVL_Reaction_Crime_Thief_WhatDidYouInThere : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Crime_Thief_WhatDidYouInThere;
            default ExampleText = "Hey! What did you do in there?";
        }
        
        
        /**
         * A thief has stolen something from you and gives back a different item you don't want after you
         * demand your stuff back.
         */
        
        class UGVL_Reaction_Crime_Thief_YouWannaFoolMe : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Crime_Thief_YouWannaFoolMe;
            default ExampleText = "What's this? Are you trying to scam me?";
        }
        
        
        /** Someone obeyed my warnings. */
        class UGVL_Reaction_Crime_WiseMove : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Crime_WiseMove;
            default ExampleText = "Smart decision!";
        }
        
        
        /** Character obeys what the water mage is asking. */
        class UGVL_Reaction_Crime_WiseMove_NC_KDW : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Crime_WiseMove_NC_KDW;
            default ExampleText = "This was your first lesson.";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage);
            }
        }
        
        
        /** Character obeys wgat the Ore baron is asking. */
        class UGVL_Reaction_Crime_WiseMove_OC_EBR : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Crime_WiseMove_OC_EBR;
            default ExampleText = "You're a obedient dog";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_OreBaron);
            }
        }
        
        
        /** Character obeys what the fire mage is asking. */
        class UGVL_Reaction_Crime_WiseMove_OC_KDF : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Crime_WiseMove_OC_KDF;
            default ExampleText = "This was your first lesson.";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage);
            }
        }
        
        
        /** Someone obeyed my warnings to put their weapon down. */
        class UGVL_Reaction_Crime_WiseMove_WeaponDown : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Crime_WiseMove_WeaponDown;
            default ExampleText = "Good. Keep that thing down.";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return Context.TagsOther.HasTag(GameplayTag::VoicelineContext_Weapon);
            }
        }
        
        
        /** Character sees another character they are terrified of and decides to run away. */
        class UGVL_Reaction_Flee : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Flee;
            default ExampleText = "Oh shit! Oh shit!";
        }
        
        
        /** Character sees an enemy creature much stronger than them and decides to run away. */
        class UGVL_Reaction_Flee_Creature : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Flee_Creature;
            default ExampleText = "Ah! Monster!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return Other != nullptr && Other.IsOfSpecies(GameplayTag::Species_Creature);
            }
        }
        
        
        /** Character sees an enemy human much stronger than them and decides to run away. */
        class UGVL_Reaction_Flee_Human : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Flee_Human;
            default ExampleText = "Please don't kill me!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return Other != nullptr && Other.IsOfSpecies(GameplayTag::Species_Human);
            }
        }
        
        
        /** Character sees the caster of the Fear spell affecting them and decides to run away. */
        class UGVL_Reaction_Flee_MagicalFear : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Flee_MagicalFear;
            default ExampleText = "Wait! Nononononono! We're all dead!!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return Context.TagsMe.HasTag(GameplayTag::VoicelineContext_MagicFear);
            }
        }
        
        
        /** Character sees an enemy orc much stronger than them and decides to run away. */
        class UGVL_Reaction_Flee_Orc : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Flee_Orc;
            default ExampleText = "Shit! Savage!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return Other != nullptr && Other.IsOfSpecies(GameplayTag::Species_Orc);
            }
        }
        
        
        /** I can't speak right now. */
        class UGVL_Reaction_General_NotNow : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_General_NotNow;
            default ExampleText = "Not now.";
        }
        
        
        /** I can't speak right now. (Bandits only)  */
        class UGVL_Reaction_General_NotNow_BAN : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_General_NotNow_BAN;
            default ExampleText = "Not now.";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_Bandit) && Me != nullptr && !Me.IsCharacter(AGothicCharacterState::FindByUniqueName(n"BC_BAN_QUENTIN_858")) && Me != nullptr && !Me.IsCharacter(AGothicCharacterState::FindByUniqueName(n"BC_BAN_ARLIN_852"));
            }
        }
        
        
        /**
         * NPC sees a character sleep out of schedule, under the effects of sleep or unconscious due to
         * casting the control spell
         */
        
        class UGVL_Reaction_General_StrangeSleep : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_General_StrangeSleep;
            default ExampleText = "Is he alright? ...";
        }
        
        
        /** React to something surprising. */
        class UGVL_Reaction_General_Surprise : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_General_Surprise;
        }
        
        
        /** React to something surprising, like a sound somewhere unexpected, in a non-frightened way.. */
        class UGVL_Reaction_General_Surprise_Generic : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_General_Surprise_Generic;
            default ExampleText = "What was that?
            Huh?";
        }
        
        
        /** React to a character using surprising magic. */
        class UGVL_Reaction_General_Surprise_Magic : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_General_Surprise_Magic;
            default ExampleText = "Woah! Sorcery!";
        }
        
        
        /** React to an enemy character casting powerful magic. */
        class UGVL_Reaction_General_Surprise_Magic_Enemy : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_General_Surprise_Magic_Enemy;
            default ExampleText = "Shit! Damn sorcerers!";
        }
        
        
        /** React to a friendly character casting powerful magic. */
        class UGVL_Reaction_General_Surprise_Magic_Friendly : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_General_Surprise_Magic_Friendly;
            default ExampleText = "Wow! Nice magic!";
        }
        
        
        /** A water mage saws the player using mage. */
        class UGVL_Reaction_General_Surprise_Magic_NC_KDW : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_General_Surprise_Magic_NC_KDW;
            default ExampleText = "Keep studing and Adanos will bless you";
        }
        
        
        /**
         * React to a character using magic to try and fool the NPC, unsuccessfully. Like using a transform
         * spell into a neutral creature during combat.
         */
        
        class UGVL_Reaction_General_Surprise_Magic_NotFooled : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_General_Surprise_Magic_NotFooled;
            default ExampleText = "You think these tricks will fool me?";
        }
        
        
        /** A fire  mage saws the player using mage. */
        class UGVL_Reaction_General_Surprise_Magic_OC_KDF : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_General_Surprise_Magic_OC_KDF;
            default ExampleText = "Keep studing and Innos will bless you";
        }
        
        
        /**
         * React to a friendly or neutral character using magic for non combat. (Using a light spell or
         * transforming into a meatbug)
         */
        
        class UGVL_Reaction_General_Surprise_Magic_Useful : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_General_Surprise_Magic_Useful;
            default ExampleText = "Nice trick!";
        }
        
        
        /**
         * Non verbal sound to express the NPC is Angry toward other NPC For example combat and crime
         * warnings.
         */
        
        class UGVL_Reaction_Interjection_Angry : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Interjection_Angry;
            default ExampleText = "(Snort)";
        }
        
        
        /**
         * Non verbal sound to express the NPC stops doing the task and goes back to they routine. For
         * example, when a watchfight ends.
         */
        
        class UGVL_Reaction_Interjection_Disappointment : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Interjection_Disappointment;
            default ExampleText = "(Sigh)";
        }
        
        
        /**
         * No verbal sound to express happines from the NPC. For example the NPC finds a valuable item and
         * pick it
         */
        
        class UGVL_Reaction_Interjection_Happy : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Interjection_Happy;
            default ExampleText = "Yay!";
        }
        
        
        /**
         * Non verbal sound to express the NPC is surprised. For example a situation they doesnt expect
         * (find a dead body)
         */
        
        class UGVL_Reaction_Interjection_Surprise : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Interjection_Surprise;
            default ExampleText = "(Gasp)";
        }
        
        
        /**
         * Non verbal sound to express the NPC starts to percieve something. For example the NPC has heard
         * something and goes to the place.
         */
        
        class UGVL_Reaction_Interjection_Suspect : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Interjection_Suspect;
            default ExampleText = "(Hummm)";
        }
        
        
        /** Character loots something from a defeated character 
        (generic)
         */
        class UGVL_Reaction_Loot_Item : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Loot_Item;
            default Weight = 0.1f;
            default ExampleText = "Oh, I don't think you'll be needing this anymore.";
        }
        
        
        /** Character loots ore from a defeated character. */
        class UGVL_Reaction_Loot_Item_Ore : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Loot_Item_Ore;
            default Weight = 100.0f;
            default ExampleText = "Oh! What have we here? Thanks for the ore!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return Context.TagsMe.HasTag(GameplayTag::VoicelineContext_Loot_Ore);
            }
        }
        
        
        /** Character loots a weapon from a defeated character. */
        class UGVL_Reaction_Loot_Item_Weapon : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Loot_Item_Weapon;
            default ExampleText = "I'll take that, wouldn't want you to get hurt accidentally.";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return (Context.TagsMe.HasTag(GameplayTag::VoicelineContext_Loot_Weapon)) || (Context.TagsMe.HasTag(GameplayTag::VoicelineContext_Loot_Weapon_Melee)) || (Context.TagsMe.HasTag(GameplayTag::VoicelineContext_Loot_Weapon_Ranged)) || (Context.TagsMe.HasTag(GameplayTag::VoicelineContext_Loot_Weapon_Magic));
            }
        }
        
        
        /** Character loots a magic weapon from a defeated character. */
        class UGVL_Reaction_Loot_Item_Weapon_Magic : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Loot_Item_Weapon_Magic;
            default ExampleText = "This might fetch a good price from the mages.";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!((Context.TagsMe.HasTag(GameplayTag::VoicelineContext_Loot_Weapon)) || (Context.TagsMe.HasTag(GameplayTag::VoicelineContext_Loot_Weapon_Melee)) || (Context.TagsMe.HasTag(GameplayTag::VoicelineContext_Loot_Weapon_Ranged)) || (Context.TagsMe.HasTag(GameplayTag::VoicelineContext_Loot_Weapon_Magic))))
                    return false;
                
                if (!(Context.TagsMe.HasTag(GameplayTag::VoicelineContext_Loot_Weapon_Magic)))
                    return false;
                
                return true;
            }
        }
        
        
        /** Character loots a magic weapon from a defeated character.
        (Variation specific to mages)
         */
        class UGVL_Reaction_Loot_Item_Weapon_Magic_Mage : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Loot_Item_Weapon_Magic_Mage;
            default Weight = 100.0f;
            default ExampleText = "Interesting, I haven't tried this spell yet.";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!((Context.TagsMe.HasTag(GameplayTag::VoicelineContext_Loot_Weapon)) || (Context.TagsMe.HasTag(GameplayTag::VoicelineContext_Loot_Weapon_Melee)) || (Context.TagsMe.HasTag(GameplayTag::VoicelineContext_Loot_Weapon_Ranged)) || (Context.TagsMe.HasTag(GameplayTag::VoicelineContext_Loot_Weapon_Magic))))
                    return false;
                
                if (!(Context.TagsMe.HasTag(GameplayTag::VoicelineContext_Loot_Weapon_Magic)))
                    return false;
                
                if (!(Me != nullptr && Me.HasLearnedSkill(UGE_Skill_Mage_Circle_1)))
                    return false;
                
                return true;
            }
        }
        
        
        /** Character loots a melee weapon from a defeated character. */
        class UGVL_Reaction_Loot_Item_Weapon_Melee : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Loot_Item_Weapon_Melee;
            default Weight = 100.0f;
            default ExampleText = "This thing looks heavy! Let me help you carry it.";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!((Context.TagsMe.HasTag(GameplayTag::VoicelineContext_Loot_Weapon)) || (Context.TagsMe.HasTag(GameplayTag::VoicelineContext_Loot_Weapon_Melee)) || (Context.TagsMe.HasTag(GameplayTag::VoicelineContext_Loot_Weapon_Ranged)) || (Context.TagsMe.HasTag(GameplayTag::VoicelineContext_Loot_Weapon_Magic))))
                    return false;
                
                if (!(Context.TagsMe.HasTag(GameplayTag::VoicelineContext_Loot_Weapon_Melee)))
                    return false;
                
                return true;
            }
        }
        
        
        /** Character loots a ranged weapon from a defeated character. */
        class UGVL_Reaction_Loot_Item_Weapon_Ranged : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Loot_Item_Weapon_Ranged;
            default Weight = 100.0f;
            default ExampleText = "Oh I just wanted to go hunt later, this will help.";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!((Context.TagsMe.HasTag(GameplayTag::VoicelineContext_Loot_Weapon)) || (Context.TagsMe.HasTag(GameplayTag::VoicelineContext_Loot_Weapon_Melee)) || (Context.TagsMe.HasTag(GameplayTag::VoicelineContext_Loot_Weapon_Ranged)) || (Context.TagsMe.HasTag(GameplayTag::VoicelineContext_Loot_Weapon_Magic))))
                    return false;
                
                if (!(Context.TagsMe.HasTag(GameplayTag::VoicelineContext_Loot_Weapon_Ranged)))
                    return false;
                
                return true;
            }
        }
        
        
        /** Character attempts to loot other character but finds nothing valuable. */
        class UGVL_Reaction_Loot_Nothing : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Loot_Nothing;
            default Weight = 100.0f;
            default ExampleText = "Seriously? No loot?";
        }
        
        
        /** Enjoying relax music */
        class UGVL_Reaction_Music_Appreciate : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Music_Appreciate;
            default ExampleText = "How lovely, brother.";
        }
        
        
        /** Strong enjoying the concert */
        class UGVL_Reaction_Music_Brawl : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Music_Brawl;
            default ExampleText = "Wooohooo!";
        }
        
        
        /** Humming sound */
        class UGVL_Reaction_Music_Humm : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Music_Humm;
            default ExampleText = "(Humming)";
        }
        
        
        class UGVL_Reaction_Noise_AttackGrunt : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Noise_AttackGrunt;
        }
        
        
        /** Sound of taking damage */
        class UGVL_Reaction_Noise_Damage : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Noise_Damage;
            default ExampleText = "Aargh";
        }
        
        
        /** Sound of taking damage and still having high health. */
        class UGVL_Reaction_Noise_Damage_Health_High : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Noise_Damage_Health_High;
        }
        
        
        /** Sound of taking damage and being low health. */
        class UGVL_Reaction_Noise_Damage_Health_Low : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Noise_Damage_Health_Low;
        }
        
        
        /** Sound of taking damage and being around half health. */
        class UGVL_Reaction_Noise_Damage_Health_Medium : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Noise_Damage_Health_Medium;
        }
        
        
        /** Sound of taking damage resulting in a (super armor break), knocking the character back.  */
        class UGVL_Reaction_Noise_Damage_SuperArmor_Break : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Noise_Damage_SuperArmor_Break;
        }
        
        
        /** Sound of dying */
        class UGVL_Reaction_Noise_Dying : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Noise_Dying;
            default ExampleText = "Aaaaaargl!";
        }
        
        
        class UGVL_Reaction_Noise_GoingDefeated : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Noise_GoingDefeated;
            default ExampleText = "Ugh...";
        }
        
        
        /** On sleep ended normally */
        class UGVL_Reaction_Sleep_Awake : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Sleep_Awake;
            default ExampleText = "'*Yawn*'
            Damn, I slept too much.
            ";
        }
        
        
        /** Someone disturbed my sleep by talking to me. */
        class UGVL_Reaction_Sleep_Disturbed_Interaction : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Sleep_Disturbed_Interaction;
            default ExampleText = "Fuck... let me sleep! What do you want?";
        }
        
        
        /** An intruder in the room made enough noise to wake me up. */
        class UGVL_Reaction_Sleep_Disturbed_Intruder : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Sleep_Disturbed_Intruder;
            default ExampleText = "Huh? What the fuck? What are you doing in here?";
        }
        
        
        /** A strange noise in the room woke me up. */
        class UGVL_Reaction_Sleep_Disturbed_Sound : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Sleep_Disturbed_Sound;
            default ExampleText = "Huh? What was that? Did I just dream that?";
        }
        
        
        /** The sound of combat wakes me up. */
        class UGVL_Reaction_Sleep_Disturbed_Sound_Combat : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Sleep_Disturbed_Sound_Combat;
            default ExampleText = "What the hell is going on??";
        }
        
        
        /** boss fight, 4th reaction, on first successful "lightning strike" */
        class UGVL_Reaction_Story_Diego_FocusStone_Again : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Story_Diego_FocusStone_Again;
            default ExampleText = "Yes! Again!";
        }
        
        
        /** boss fight, 2nd reaction, more concrete */
        class UGVL_Reaction_Story_Diego_FocusStone_SeeThoseGlowingSlates : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Story_Diego_FocusStone_SeeThoseGlowingSlates;
            default ExampleText = "Wait, you see those glowings lates up there? Maybe we can use them!";
        }
        
        
        /** boss fight, 3rd reaction, even more concrete */
        class UGVL_Reaction_Story_Diego_FocusStone_TryShootingThem : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Story_Diego_FocusStone_TryShootingThem;
            default ExampleText = "Try shooting it! Maybe that magic will overload!";
        }
        
        
        /** boss fight, 1st reaction, After realizing they can't damage the zombie */
        class UGVL_Reaction_Story_Diego_FocusStone_ZombieCantBeDamaged : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Story_Diego_FocusStone_ZombieCantBeDamaged;
            default ExampleText = "This isn't working, we aren't doing any damage! There has to be another way!";
        }
        
        
        /** New Camper remarks upon hearing swamp camp propaganda. */
        class UGVL_Reaction_SwampPropaganda_NC : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_SwampPropaganda_NC;
            default ExampleText = "Why would I give up true freedom for a joint?
            Mad, just mad...
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return Me != nullptr && Me.IsDoingListeningInteraction() && Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp);
            }
        }
        
        
        /** Peasant remarks upon hearing swamp camp propaganda. */
        class UGVL_Reaction_SwampPropaganda_NC_BAU : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_SwampPropaganda_NC_BAU;
            default ExampleText = "Pff yeah, stop farming here to start farming there...
            That's surely the weeds talking.
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsDoingListeningInteraction() && Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Peasant)))
                    return false;
                
                return true;
            }
        }
        
        
        /** Rogue remarks upon hearing swamp camp propaganda. */
        class UGVL_Reaction_SwampPropaganda_NC_ORG : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_SwampPropaganda_NC_ORG;
            default ExampleText = "Maybe someone should keep them quiet...
            None of it makes any sense...
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsDoingListeningInteraction() && Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Rogue)))
                    return false;
                
                return true;
            }
        }
        
        
        /** Scrapper remarks upon hearing swamp camp propaganda. */
        class UGVL_Reaction_SwampPropaganda_NC_SFB : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_SwampPropaganda_NC_SFB;
            default ExampleText = "They are totally nuts.
            I won't leave a real way out for a dream...
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsDoingListeningInteraction() && Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Scraper)))
                    return false;
                
                return true;
            }
        }
        
        
        /** Mercenary remarks upon hearing swamp camp propaganda. */
        class UGVL_Reaction_SwampPropaganda_NC_SLD : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_SwampPropaganda_NC_SLD;
            default ExampleText = "Well does it pay to be a Templar? Yeah I figured...
            Wait, do they trade in weed??
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsDoingListeningInteraction() && Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp)))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Mercenary)))
                    return false;
                
                return true;
            }
        }
        
        
        /** Old Camper remarks upon hearing swamp camp propaganda. */
        class UGVL_Reaction_SwampPropaganda_OC : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_SwampPropaganda_OC;
            default ExampleText = "Bunch of looneys...";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && Me != nullptr && Me.IsDoingListeningInteraction();
            }
        }
        
        
        /** Guard remarks upon hearing swamp camp propaganda. */
        class UGVL_Reaction_SwampPropaganda_OC_GRD : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_SwampPropaganda_OC_GRD;
            default ExampleText = "I don't understand why the Barons tolerate these guys...
            The Templars sure sound tough...
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && Me != nullptr && Me.IsDoingListeningInteraction()))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard)))
                    return false;
                
                return true;
            }
        }
        
        
        /** Shadow remarks upon hearing swamp camp propaganda. */
        class UGVL_Reaction_SwampPropaganda_OC_STT : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_SwampPropaganda_OC_STT;
            default ExampleText = "What a load of bullshit...
            Could there be some truth to it?
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && Me != nullptr && Me.IsDoingListeningInteraction()))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow)))
                    return false;
                
                return true;
            }
        }
        
        
        /** Digger remarks upon hearing swamp camp propaganda. */
        class UGVL_Reaction_SwampPropaganda_OC_VLK : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_SwampPropaganda_OC_VLK;
            default ExampleText = "I'd surely get a beating if I said those things...
            I can't believe it, I can't...
            ";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && Me != nullptr && Me.IsDoingListeningInteraction()))
                    return false;
                
                if (!(Me != nullptr && Me.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Digger)))
                    return false;
                
                return true;
            }
        }
        
        
        /** I, teacher, teaches NH how to improve his Dexterity */
        class UGVL_Reaction_Teacher_Learn_Dexterity : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Teacher_Learn_Dexterity;
            default ExampleText = "Quick hands are a result of a calm mind. Steady yourself first
            The key to dexterity is control. Master it, and speed will follow.
            Practice turns hesitation into instinct. Trust your training.";
        }
        
        
        /** I, teacher, teaches NH how to improve his Dexterity (Level 60+) */
        class UGVL_Reaction_Teacher_Learn_Dexterity_High : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Teacher_Learn_Dexterity_High;
        }
        
        
        /** I, teacher, teaches NH how to improve his Dexterity (Level 0 to 30) */
        class UGVL_Reaction_Teacher_Learn_Dexterity_Low : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Teacher_Learn_Dexterity_Low;
        }
        
        
        /** I, teacher, teaches NH how to improve his Dexterity (Level 31 to 60) */
        class UGVL_Reaction_Teacher_Learn_Dexterity_Medium : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Teacher_Learn_Dexterity_Medium;
        }
        
        
        /** I, teacher, teaches NH how to increase his Mana Pool */
        class UGVL_Reaction_Teacher_Learn_Mana : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Teacher_Learn_Mana;
            default ExampleText = "Mana flows like a river within you. Learn to widen its banks.
            Expand your spirit; only then will your mana grow boundless.
            The mind is the vessel of mana. Sharpen it, and your power will overflow.";
        }
        
        
        /** I, teacher, teaches NH how to increase his Mana Pool (Level 60+) */
        class UGVL_Reaction_Teacher_Learn_Mana_High : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Teacher_Learn_Mana_High;
        }
        
        
        /** I, teacher, teaches NH how to increase his Mana Pool (Level 0 to 30) */
        class UGVL_Reaction_Teacher_Learn_Mana_Low : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Teacher_Learn_Mana_Low;
        }
        
        
        /** I, teacher, teaches NH how to increase his Mana Pool (Level 31 to 60) */
        class UGVL_Reaction_Teacher_Learn_Mana_Medium : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Teacher_Learn_Mana_Medium;
        }
        
        
        /** I, teacher, teaches NH how to improve his Strenght */
        class UGVL_Reaction_Teacher_Learn_Strenght : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Teacher_Learn_Strenght;
            default ExampleText = "Strength isn't just in your muscles. It's in your mind. Focus and conquer!
            A strong foundation builds unshakable strength. Start small, aim high.
            Feel the burn? That's your body growing stronger. Embrace it!";
        }
        
        
        /** I, teacher, teaches NH how to improve his Strenght (Level 60+) */
        class UGVL_Reaction_Teacher_Learn_Strenght_High : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Teacher_Learn_Strenght_High;
        }
        
        
        /** I, teacher, teaches NH how to improve his Strenght (Level 0 to 30) */
        class UGVL_Reaction_Teacher_Learn_Strenght_Low : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Teacher_Learn_Strenght_Low;
        }
        
        
        /** I, teacher, teaches NH how to improve his Strenght (Level 31 to 60) */
        class UGVL_Reaction_Teacher_Learn_Strenght_Medium : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Teacher_Learn_Strenght_Medium;
        }
        
        
        /** I, teacher, tell my student he doesn't have enough experience to learn my lesson. */
        class UGVL_Reaction_Teacher_NoLearn_NoPoints : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Teacher_NoLearn_NoPoints;
            default ExampleText = "Come back as soon as you have more experience.";
        }
        
        
        /** I, teacher, tell my student there's nothing more I can teach them about the specific subject. */
        class UGVL_Reaction_Teacher_NoLearn_OverMax : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Teacher_NoLearn_OverMax;
            default ExampleText = "You're at the end of your possibilities. You should learn something different.";
        }
        
        
        /** I, teacher, tell my student they've already learned the specific subject. */
        class UGVL_Reaction_Teacher_NoLearn_YouAlreadyKnow : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Teacher_NoLearn_YouAlreadyKnow;
            default ExampleText = "You've already been taught that.";
        }
        
        
        /**
         * I, teacher, tell my student they don't have the required skills to learn the specific subject.
         */
        
        class UGVL_Reaction_Teacher_NoLearn_YouDontKnowEnough : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Teacher_NoLearn_YouDontKnowEnough;
            default ExampleText = "You need to become advanced before you can become a master!";
        }
        
        
        /** I, teacher, tell my student they are already better than the specific subject. */
        class UGVL_Reaction_Teacher_NoLearn_YoureBetter : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Teacher_NoLearn_YoureBetter;
            default ExampleText = "You're already better now!";
        }
        
        
        /** [Warning] Generic warning */
        class UGVL_Reaction_Warning : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Warning;
            default ExampleText = "Hey! Don't do that!";
        }
        
        
        /** [Threat] Insist that an intruder leaves an area they are not allowed to be in. */
        class UGVL_Reaction_Warning_InsistIntruder : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Warning_InsistIntruder;
            default Weight = 100.0f;
            default ExampleText = "Leave! Now!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return Context.TagsOther.HasTag(GameplayTag::VoicelineContext_Intruder);
            }
        }
        
        
        /** I insist that an intruder I don't want to fight leaves. */
        class UGVL_Reaction_Warning_InsistIntruder_Weak : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Warning_InsistIntruder_Weak;
            default Weight = 100.0f;
            default ExampleText = "If you don't leave, I'll call the guards!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Context.TagsOther.HasTag(GameplayTag::VoicelineContext_Intruder)))
                    return false;
                
                if (!(Context.TagsMe.HasTag(GameplayTag::VoicelineContext_Weak)))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * Enforcer insists at criminal they're not welcome unless they pay up for the crimes committed in
         * the past
         */
        
        class UGVL_Reaction_Warning_InsistPayUpForCrimes : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Warning_InsistPayUpForCrimes;
            default Weight = 100.0f;
            default ExampleText = "\"Did you hear me? Pay or sod off!\"";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return Context.TagsOther.HasTag(GameplayTag::VoicelineContext_Pay);
            }
        }
        
        
        /** Variations of InsistPayUpForCrimes to be spoken by New Camp mercenaries */
        class UGVL_Reaction_Warning_InsistPayUpForCrimes_NC : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Warning_InsistPayUpForCrimes_NC;
            default ExampleText = "\"Did you hear me? Pay or sod off! (NC version)\"";
        }
        
        
        /** Variations of InsistPayUpForCrimes to be spoken by Old Camp guards. */
        class UGVL_Reaction_Warning_InsistPayUpForCrimes_OC : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Warning_InsistPayUpForCrimes_OC;
            default ExampleText = "\"Did you hear me? Pay or sod off! (OC version)\"";
        }
        
        
        /** Variations of InsistPayUpForCrimes to be spoken by Swamp Camp templars. */
        class UGVL_Reaction_Warning_InsistPayUpForCrimes_SC : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Warning_InsistPayUpForCrimes_SC;
            default ExampleText = "\"Did you hear me? Pay or sod off! (SC version)\"";
        }
        
        
        /**
         * '[Threat] Insist that a potentially hostile character to puts away their unspecified weapon.
         * (Generic)
         */
        
        class UGVL_Reaction_Warning_InsistWeaponDown : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Warning_InsistWeaponDown;
            default Weight = 10.0f;
            default ExampleText = "Did you hear me? I said put that thing away!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return Context.TagsOther.HasTag(GameplayTag::VoicelineContext_Weapon);
            }
        }
        
        
        /** [Threat] Insist that a potentially hostile character lowers their fists. */
        class UGVL_Reaction_Warning_InsistWeaponDown_Fists : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Warning_InsistWeaponDown_Fists;
            default Weight = 100.0f;
            default ExampleText = "Did you hear me? If you keep at it I'll have to beat you up!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Context.TagsOther.HasTag(GameplayTag::VoicelineContext_Weapon)))
                    return false;
                
                if (!(Other != nullptr && Other.Character.HasDrawnFists()))
                    return false;
                
                return true;
            }
        }
        
        
        /** [Threat] Insist that a potentially hostile character to puts away their magic rune. */
        class UGVL_Reaction_Warning_InsistWeaponDown_Magic_Rune : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Warning_InsistWeaponDown_Magic_Rune;
            default Weight = 100.0f;
            default ExampleText = "I said put the rune down, sorcerer!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Context.TagsOther.HasTag(GameplayTag::VoicelineContext_Weapon)))
                    return false;
                
                if (!(Other != nullptr && Other.Character.HasDrawnRune()))
                    return false;
                
                return true;
            }
        }
        
        
        /** [Threat] Insist that a potentially hostile character to puts away their magic scroll. */
        class UGVL_Reaction_Warning_InsistWeaponDown_Magic_Scroll : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Warning_InsistWeaponDown_Magic_Scroll;
            default Weight = 100.0f;
            default ExampleText = "Put that scroll away!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Context.TagsOther.HasTag(GameplayTag::VoicelineContext_Weapon)))
                    return false;
                
                if (!(Other != nullptr && Other.Character.HasDrawnScroll()))
                    return false;
                
                return true;
            }
        }
        
        
        /** [Threat] Insist that a potentially hostile character to puts away their melee weapon. */
        class UGVL_Reaction_Warning_InsistWeaponDown_Melee : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Warning_InsistWeaponDown_Melee;
            default Weight = 100.0f;
            default ExampleText = "I said put that weapon down!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Context.TagsOther.HasTag(GameplayTag::VoicelineContext_Weapon)))
                    return false;
                
                if (!(Other != nullptr && Other.Character.HasDrawnMeleeWeapon() && Other != nullptr && !Other.Character.HasDrawnFists()))
                    return false;
                
                return true;
            }
        }
        
        
        /** [Threat] Insist that a potentially hostile character puts away their bow. */
        class UGVL_Reaction_Warning_InsistWeaponDown_Ranged_Bow : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Warning_InsistWeaponDown_Ranged_Bow;
            default Weight = 100.0f;
            default ExampleText = "Put away your bow, or else!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Context.TagsOther.HasTag(GameplayTag::VoicelineContext_Weapon)))
                    return false;
                
                if (!(Other != nullptr && Other.Character.HasDrawnBow()))
                    return false;
                
                return true;
            }
        }
        
        
        /** [Threat] Insist that a potentially hostile character puts away their bow. */
        class UGVL_Reaction_Warning_InsistWeaponDown_Ranged_Crossbow : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Warning_InsistWeaponDown_Ranged_Crossbow;
            default Weight = 100.0f;
            default ExampleText = "Put away your crossbow, or else!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Context.TagsOther.HasTag(GameplayTag::VoicelineContext_Weapon)))
                    return false;
                
                if (!(Other != nullptr && Other.Character.HasDrawnCrossbow()))
                    return false;
                
                return true;
            }
        }
        
        
        /** [Warning] Tell an intruder to leave an area they are not allowed to be in. */
        class UGVL_Reaction_Warning_Intruder : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Warning_Intruder;
            default Weight = 100.0f;
            default ExampleText = "Hey! You can't be here!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return Context.TagsOther.HasTag(GameplayTag::VoicelineContext_Intruder);
            }
        }
        
        
        /** I see an intruder I don't want to fight and try to make them leave. */
        class UGVL_Reaction_Warning_Intruder_Weak : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Warning_Intruder_Weak;
            default Weight = 100.0f;
            default ExampleText = "Hey, why are you in here?";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Context.TagsOther.HasTag(GameplayTag::VoicelineContext_Intruder)))
                    return false;
                
                if (!(Context.TagsMe.HasTag(GameplayTag::VoicelineContext_Weak)))
                    return false;
                
                return true;
            }
        }
        
        
        /** I see a character that has been trouble before doing something I will warn them for. */
        class UGVL_Reaction_Warning_LookingForTroubleAgain : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Warning_LookingForTroubleAgain;
            default ExampleText = "You looking for trouble with me again?";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return !Context.TagsOther.HasTag(GameplayTag::VoicelineContext_NotHadEnough);
            }
        }
        
        
        /**
         * Enforcer tells criminal they're not welcome unless they pay up for the crimes committed in the
         * past
         */
        
        class UGVL_Reaction_Warning_PayUpForCrimes : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Warning_PayUpForCrimes;
            default ExampleText = "\"You criminal! Pay up or leave!\"";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return Context.TagsOther.HasTag(GameplayTag::VoicelineContext_Pay);
            }
        }
        
        
        /** Variations of PayUpForCrimes to be spoken by New Camp mercenaries. */
        class UGVL_Reaction_Warning_PayUpForCrimes_NC : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Warning_PayUpForCrimes_NC;
            default ExampleText = "\"You criminal! Pay up or leave! (NC Vesion)\"";
        }
        
        
        /** Variations of PayUpForCrimes to be spoken by Old Camp guards. */
        class UGVL_Reaction_Warning_PayUpForCrimes_OC : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Warning_PayUpForCrimes_OC;
            default ExampleText = "\"You criminal! Pay up or leave! (OC Vesion)\"";
        }
        
        
        /** Variations of PayUpForCrimes to be spoken by Swamp Camp templars. */
        class UGVL_Reaction_Warning_PayUpForCrimes_SC : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Warning_PayUpForCrimes_SC;
            default ExampleText = "\"You criminal! Pay up or leave! (SC Vesion)\"";
        }
        
        
        /** [Warning] Tell a thief to return the object they stole from me. */
        class UGVL_Reaction_Warning_Thief_GiveBack : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Warning_Thief_GiveBack;
            default Weight = 100.0f;
            default ExampleText = "Give it back!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return Context.TagsOther.HasTag(GameplayTag::VoicelineContext_Thief);
            }
        }
        
        
        /** [Warning] Tell a thief to return the weapon they stole from me. */
        class UGVL_Reaction_Warning_Thief_GiveBack_Weapon : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Warning_Thief_GiveBack_Weapon;
            default Weight = 100.0f;
            default ExampleText = "Give me my weapon back!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Context.TagsOther.HasTag(GameplayTag::VoicelineContext_Thief)))
                    return false;
                
                if (!(Context.TagsMe.HasTag(GameplayTag::VoicelineContext_Theft_Weapon)))
                    return false;
                
                return true;
            }
        }
        
        
        /** [Threat] Insist that a thief returns the object they stole from me. */
        class UGVL_Reaction_Warning_Thief_InsistGiveBack : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Warning_Thief_InsistGiveBack;
            default Weight = 100.0f;
            default ExampleText = "I said give it back!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return Context.TagsOther.HasTag(GameplayTag::VoicelineContext_Thief);
            }
        }
        
        
        /** [Threat] Insist that a thief returns the weapon they stole from me. */
        class UGVL_Reaction_Warning_Thief_InsistGiveBack_Weapon : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Warning_Thief_InsistGiveBack_Weapon;
            default Weight = 100.0f;
            default ExampleText = "I said give me my weapon back!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Context.TagsOther.HasTag(GameplayTag::VoicelineContext_Thief)))
                    return false;
                
                if (!(Context.TagsMe.HasTag(GameplayTag::VoicelineContext_Theft_Weapon)))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * '[Warning] Tell a potentially hostile character to put away their unspecified weapon.' (Generic)
         */
        
        class UGVL_Reaction_Warning_WeaponDown : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Warning_WeaponDown;
            default Weight = 100.0f;
            default ExampleText = "Put that thing away.";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                return Context.TagsOther.HasTag(GameplayTag::VoicelineContext_Weapon);
            }
        }
        
        
        /** [Warning] Tell a potentially hostile character to lower their fists */
        class UGVL_Reaction_Warning_WeaponDown_Fists : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Warning_WeaponDown_Fists;
            default Weight = 100.0f;
            default ExampleText = "Lower your fists! Are you looking for a fight or what?";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Context.TagsOther.HasTag(GameplayTag::VoicelineContext_Weapon)))
                    return false;
                
                if (!(Other != nullptr && Other.Character.HasDrawnFists()))
                    return false;
                
                return true;
            }
        }
        
        
        /** [Warning] Tell a potentially hostile character to put away their magic rune. */
        class UGVL_Reaction_Warning_WeaponDown_Magic_Rune : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Warning_WeaponDown_Magic_Rune;
            default Weight = 100.0f;
            default ExampleText = "Put that rune down!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Context.TagsOther.HasTag(GameplayTag::VoicelineContext_Weapon)))
                    return false;
                
                if (!(Other != nullptr && Other.Character.HasDrawnRune()))
                    return false;
                
                return true;
            }
        }
        
        
        /** [Warning] Tell a potentially hostile character to put away their magic scroll. */
        class UGVL_Reaction_Warning_WeaponDown_Magic_Scroll : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Warning_WeaponDown_Magic_Scroll;
            default Weight = 100.0f;
            default ExampleText = "Keep that scroll on your belt.";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Context.TagsOther.HasTag(GameplayTag::VoicelineContext_Weapon)))
                    return false;
                
                if (!(Other != nullptr && Other.Character.HasDrawnScroll()))
                    return false;
                
                return true;
            }
        }
        
        
        /** [Warning] Tell a potentially hostile character to put away their melee weapon. */
        class UGVL_Reaction_Warning_WeaponDown_Melee : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Warning_WeaponDown_Melee;
            default Weight = 100.0f;
            default ExampleText = "Sheathe your weapon!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Context.TagsOther.HasTag(GameplayTag::VoicelineContext_Weapon)))
                    return false;
                
                if (!(Other != nullptr && Other.Character.HasDrawnMeleeWeapon() && Other != nullptr && !Other.Character.HasDrawnFists()))
                    return false;
                
                return true;
            }
        }
        
        
        /** [Warning] Tell a potentially hostile character to put away their bow. */
        class UGVL_Reaction_Warning_WeaponDown_Ranged_Bow : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Warning_WeaponDown_Ranged_Bow;
            default Weight = 100.0f;
            default ExampleText = "Keep your bow on your back!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Context.TagsOther.HasTag(GameplayTag::VoicelineContext_Weapon)))
                    return false;
                
                if (!(Other != nullptr && Other.Character.HasDrawnBow()))
                    return false;
                
                return true;
            }
        }
        
        
        /** [Warning] Tell a potentially hostile character to put away their bow. */
        class UGVL_Reaction_Warning_WeaponDown_Ranged_Crossbow : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_Warning_WeaponDown_Ranged_Crossbow;
            default Weight = 100.0f;
            default ExampleText = "Keep your crossbow on your back!";
            
            UFUNCTION(BlueprintOverride)
            bool CanBeSaidNow(const AGothicCharacterState Me, const AGothicCharacterState Other, FGenericVoicelineRequestContext Context) const
            {
                if (!(Context.TagsOther.HasTag(GameplayTag::VoicelineContext_Weapon)))
                    return false;
                
                if (!(Other != nullptr && Other.Character.HasDrawnCrossbow()))
                    return false;
                
                return true;
            }
        }
        
        
        /**
         * Character watching a fight sees fighter attack other fighter and is friendly to both or to
         * neither.
         */
        
        class UGVL_Reaction_WatchFight_Cheer_CheerFight : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_WatchFight_Cheer_CheerFight;
            default GlobalCooldownSeconds = 1.0f;
            default ExampleText = "You're fighthing like women!";
        }
        
        
        /** Character watching a fight sees a friendly character hit an enemy in combat */
        class UGVL_Reaction_WatchFight_Cheer_CheerFriend : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_WatchFight_Cheer_CheerFriend;
            default GlobalCooldownSeconds = 1.0f;
            default ExampleText = "Finish him off!!";
        }
        
        
        /** Character watching a fight sees a friendly character get killed */
        class UGVL_Reaction_WatchFight_Cheer_Death_Bad : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_WatchFight_Cheer_Death_Bad;
            default GlobalCooldownSeconds = 1.0f;
            default ExampleText = "NOO!";
        }
        
        
        /**
         * Character watching a fight sees an enemy or hostile character get killed, or sees a neutral
         * character get killed by a friendly/neutral,
         */
        
        class UGVL_Reaction_WatchFight_Cheer_Death_Good : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_WatchFight_Cheer_Death_Good;
            default GlobalCooldownSeconds = 1.0f;
            default ExampleText = "[Disgusted but excited] *ushhhh*";
        }
        
        
        /**
         * Orc uses it when sees a non friendly human or any creature that is not an orcdog get killed in
         * combat
         */
        
        class UGVL_Reaction_WatchFight_Cheer_Death_Orc : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_WatchFight_Cheer_Death_Orc;
            default GlobalCooldownSeconds = 1.0f;
            default ExampleText = "[In orcish?] Less filth on the battlefield!";
        }
        
        
        /**
         * Generic cheer to be used every so often when NPC watches a fight and no other cheers are being
         * used
         */
        
        class UGVL_Reaction_WatchFight_Cheer_HeyHeyHey : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_WatchFight_Cheer_HeyHeyHey;
            default GlobalCooldownSeconds = 1.0f;
            default ExampleText = "Harder!";
        }
        
        
        /** Character watching a fight sees a friendly character get hit in combat */
        class UGVL_Reaction_WatchFight_Cheer_Ooh : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_WatchFight_Cheer_Ooh;
            default GlobalCooldownSeconds = 1.0f;
            default ExampleText = "Just strike back!";
        }
        
        
        /** Character watching a fight sees hostile/angry/enemy character get killed */
        class UGVL_Reaction_WatchFight_Cheer_YeahWellDone : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_WatchFight_Cheer_YeahWellDone;
            default GlobalCooldownSeconds = 1.0f;
            default ExampleText = "Give it to him!";
        }
        
        
        /**
         * Character watches fight end with friendly/neutral character defeated and attacker is not friendly
         */
        
        class UGVL_Reaction_WatchFight_End_Defeated_Mercy : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_WatchFight_End_Defeated_Mercy;
            default GlobalCooldownSeconds = 1.0f;
            default ExampleText = "He's had enough!
            Let him live!
            '[Worried] *ghasp*'
            ";
        }
        
        
        /** Character watches fight end with non friendly character defeated. */
        class UGVL_Reaction_WatchFight_End_Defeated_Victory : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_WatchFight_End_Defeated_Victory;
            default GlobalCooldownSeconds = 1.0f;
            default ExampleText = "Serves him right!
            Yeah!
            ";
        }
        
        
        /**
         * Character watches fight end with someone defeated while all combatants are friendly or neutral
         */
        
        class UGVL_Reaction_WatchFight_End_GoodFight : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_WatchFight_End_GoodFight;
            default GlobalCooldownSeconds = 1.0f;
            default ExampleText = "Nice fighting!";
        }
        
        
        /** Character watches fight end with someone killing a friendly */
        class UGVL_Reaction_WatchFight_End_Killed_Bad : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_WatchFight_End_Killed_Bad;
            default GlobalCooldownSeconds = 1.0f;
            default ExampleText = "Why did you kill him? You're as good as dead!";
        }
        
        
        /** Character watches fight end with someone killing a non friendly */
        class UGVL_Reaction_WatchFight_End_Killed_Good : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_WatchFight_End_Killed_Good;
            default GlobalCooldownSeconds = 1.0f;
            default ExampleText = "'[Excited] Damn! That was gruesome!'
            He won't be missed!
            ";
        }
        
        
        /** Character watches fight end with combatant running away */
        class UGVL_Reaction_WatchFight_End_RunCoward : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_WatchFight_End_RunCoward;
            default GlobalCooldownSeconds = 1.0f;
            default ExampleText = "Come back, you pussy!";
        }
        
        
        /** Character first sees two other characters fight. */
        class UGVL_Reaction_WatchFight_Initial_TheresAFight : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_WatchFight_Initial_TheresAFight;
            default GlobalCooldownSeconds = 1.0f;
            default ExampleText = "Ah, a fight!";
        }
        
        
        /** Character sees someone kill themselves during a fight or by accident. */
        class UGVL_Reaction_WatchFight_Suicide : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Reaction_WatchFight_Suicide;
            default GlobalCooldownSeconds = 1.0f;
            default ExampleText = "Oh, what the hell!
            Wait! Are you serious?";
        }
        
        
        class UGVL_Smalltalk_OG : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Smalltalk_OG;
        }
        
        
        /** Type2
        Everything all right with you? */
        class UGVL_Conversation_Generic_AboutCamp_FM_ORG_FMORGAreyouok_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_ORG_FMORGAreyouok_Reply1;
            default ExampleText = "No worse than yesterday.";
        }
        
        
        /** Type1
        How are you? */
        class UGVL_Conversation_Generic_AboutCamp_FM_ORG_FMORGHoware_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_ORG_FMORGHoware_Reply1;
            default ExampleText = "Mate, do me a favor and piss off, aye?";
        }
        
        
        /** Type2
        Why don't you tell me more about this place? */
        class UGVL_Conversation_Generic_AboutCamp_FM_ORG_FMORGSomething_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_ORG_FMORGSomething_Reply1;
            default ExampleText = "You mean the Cauldron. Well, it ain't too bad here. The diggers mine the ore, the mercs keep an eye on things, and us bandits, we keep everythin' in check.";
        }
        
        
        /** Type1
        Tell me something about this camp. */
        class UGVL_Conversation_Generic_AboutCamp_FM_ORG_FMORGTellme_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_ORG_FMORGTellme_Reply1;
            default ExampleText = "The camp? You mean the Hollow. It ain't so bad, really. The scrapers collect ore, the mercenaries stand on guard, and we rogues keep 'em all under control.";
        }
        
        
        /**
         * Type3 1.The mine? (scoffs) The blokes in there keep to themselves. No one goes in, no one comes
         * out.
         */
        
        class UGVL_Conversation_Generic_AboutCamp_FM_ORG_FMORGWhatgoes_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_ORG_FMORGWhatgoes_Reply1;
            default ExampleText = "The mine? (scoffs) The blokes in there keep to themselves. No one goes in, no one comes out.";
        }
        
        
        /**
         * Type3 2.The mine? (scoffs) The blokes in there keep to themselves. No one goes in, no one comes
         * out.
         */
        
        class UGVL_Conversation_Generic_AboutCamp_FM_ORG_FMORGWhatgoes_Reply2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_ORG_FMORGWhatgoes_Reply2;
            default ExampleText = "I'm tellin' you: we're lucky we're out here and not down there.";
        }
        
        
        /** Type3
        Who gives orders around here? */
        class UGVL_Conversation_Generic_AboutCamp_FM_ORG_FMORGWhogives_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_ORG_FMORGWhogives_Reply1;
            default ExampleText = "Well, no one's tellin' ME what to do, but you gotta know how to work the system.";
        }
        
        
        /** Type3
        How did you "work the system," then? */
        class UGVL_Conversation_Generic_AboutCamp_FM_ORG_FMORGWhogives_Reply2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_ORG_FMORGWhogives_Reply2;
            default ExampleText = "Trade secret! But between the two o' us - bein' a bandit ain't exactly tough.";
        }
        
        
        /** Type1
        1.Who's in charge here then? */
        class UGVL_Conversation_Generic_AboutCamp_FM_ORG_FMORGWhoscharge_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_ORG_FMORGWhoscharge_Reply1;
            default ExampleText = "That depends on who you take your orders from.";
        }
        
        
        /** Type1
        2.Who's in charge here then? */
        class UGVL_Conversation_Generic_AboutCamp_FM_ORG_FMORGWhoscharge_Reply2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_ORG_FMORGWhoscharge_Reply2;
            default ExampleText = "Whatever, if Okyl wants something, you'll do well not to object. He can get pretty ugly when he's pissed off.";
        }
        
        
        /** Type2
        1.Who's giving orders around here? */
        class UGVL_Conversation_Generic_AboutCamp_FM_ORG_FMORGWhostheboss_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_ORG_FMORGWhostheboss_Reply1;
            default ExampleText = "Okyl. He's the one callin' the shots.";
        }
        
        
        /** Type2
        2.Who's giving orders around here? */
        class UGVL_Conversation_Generic_AboutCamp_FM_ORG_FMORGWhostheboss_Reply2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_ORG_FMORGWhostheboss_Reply2;
            default ExampleText = " But he mostly leaves us bandits alone.";
        }
        
        
        /** Type3
        You don't look like you're working too hard. */
        class UGVL_Conversation_Generic_AboutCamp_FM_ORG_FMORGYoudont_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_ORG_FMORGYoudont_Reply1;
            default ExampleText = "Workin'? Me? If I were workin', I wouldn't be under the dome here, if you catch me drift.";
        }
        
        
        /** Type1
        1.How do I join the diggers? */
        class UGVL_Conversation_Generic_AboutCamp_FM_SFB_FMSFBHowdo_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SFB_FMSFBHowdo_Reply1;
            default ExampleText = "Join us? Don't go thinkin' you won't be workin' just 'cause no one's crackin' the whip.";
        }
        
        
        /** Type1
        2.How do I join the diggers? */
        class UGVL_Conversation_Generic_AboutCamp_FM_SFB_FMSFBHowdo_Reply2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SFB_FMSFBHowdo_Reply2;
            default ExampleText = "If you reckon you can just sit on your arse here, you got another thing comin', mate.";
        }
        
        
        /** Type1
        3.How do I join the diggers? */
        class UGVL_Conversation_Generic_AboutCamp_FM_SFB_FMSFBHowdo_Reply3 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SFB_FMSFBHowdo_Reply3;
            default ExampleText = "Now, if you still think you're in the right place, go have a word with Swiney. You'll recognise him - he's the one standin' around and smokin' all day.";
        }
        
        
        /** Type1
        1.How's it going? */
        class UGVL_Conversation_Generic_AboutCamp_FM_SFB_FMSFBHowsit_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SFB_FMSFBHowsit_Reply1;
            default ExampleText = " What d'you think? Same shit, different day. Never enough to eat, always somethin' to do.";
        }
        
        
        /** Type1
        2.How's it going? */
        class UGVL_Conversation_Generic_AboutCamp_FM_SFB_FMSFBHowsit_Reply2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SFB_FMSFBHowsit_Reply2;
            default ExampleText = "The only one who ain't too busy is Swiney. Okyl made him our mouthpiece - so now he's just standin' around all day makin' sure he won't get blisters on his hands.";
        }
        
        
        /** Type1
        3.How's it going? */
        class UGVL_Conversation_Generic_AboutCamp_FM_SFB_FMSFBHowsit_Reply3 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SFB_FMSFBHowsit_Reply3;
            default ExampleText = "So, if that's all, you best bugger off now. I don't wanna get in trouble.";
        }
        
        
        /** Type2
        I wanna know more about this Camp. */
        class UGVL_Conversation_Generic_AboutCamp_FM_SFB_FMSFBIwannaknow_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SFB_FMSFBIwannaknow_Reply1;
            default ExampleText = "Dunno if I can help you with that. Best talk to Swiney or one of the mercs.";
        }
        
        
        /** Type3
        What does this Camp have to offer? */
        class UGVL_Conversation_Generic_AboutCamp_FM_SFB_FMSFBWhatcamp_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SFB_FMSFBWhatcamp_Reply1;
            default ExampleText = "Depends what you make of it. For some, it's just a lot o' graft. For others, it's quite a good time.";
        }
        
        
        /** Type2
        What do I have to do if I wanna join you? */
        class UGVL_Conversation_Generic_AboutCamp_FM_SFB_FMSFBWhatdo_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SFB_FMSFBWhatdo_Reply1;
            default ExampleText = "Can't help you there, mate. It's a big pond and I'm a small fish. Best talk to Swiney.";
        }
        
        
        /** Type3
        What if I wanna join you? */
        class UGVL_Conversation_Generic_AboutCamp_FM_SFB_FMSFBWhatif_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SFB_FMSFBWhatif_Reply1;
            default ExampleText = "Join us? As what - a water carrier?";
        }
        
        
        /** Type3
        1. No, as a digger. */
        class UGVL_Conversation_Generic_AboutCamp_FM_SFB_FMSFBWhatif_Reply2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SFB_FMSFBWhatif_Reply2;
            default ExampleText = "Listen here, mate, let me tell you somethin': No one CHOOSES to be a digger.";
        }
        
        
        /** Type3
        2 No, as a digger. */
        class UGVL_Conversation_Generic_AboutCamp_FM_SFB_FMSFBWhatif_Reply3 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SFB_FMSFBWhatif_Reply3;
            default ExampleText = "But if that's what you want, I ain't gonna stop you. Go see Swiney - bet he's got a spare pickaxe he'll be glad to part with.";
        }
        
        
        /** Type1
        1. What is this place? */
        class UGVL_Conversation_Generic_AboutCamp_FM_SFB_FMSFBWhatisthis_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SFB_FMSFBWhatisthis_Reply1;
            default ExampleText = "What's it look like? The king's castle?";
        }
        
        
        /** Type1
        2. What is this place? */
        class UGVL_Conversation_Generic_AboutCamp_FM_SFB_FMSFBWhatisthis_Reply2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SFB_FMSFBWhatisthis_Reply2;
            default ExampleText = "If you really wanna work in the Free Mine, though, we always need folk here in the Cauldron - but you gotta prove you're worth keepin' around first.";
        }
        
        
        /** Type3
        1.What's life like here? */
        class UGVL_Conversation_Generic_AboutCamp_FM_SFB_FMSFBWhatslife_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SFB_FMSFBWhatslife_Reply1;
            default ExampleText = "Brilliant!";
        }
        
        
        /** Type3
        2.What's life like here? */
        class UGVL_Conversation_Generic_AboutCamp_FM_SFB_FMSFBWhatslife_Reply2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SFB_FMSFBWhatslife_Reply2;
            default ExampleText = "And since we're all just lovin' it here, we're doin' our best to bugger off as quick as we can.";
        }
        
        
        /** Type3
        3.What's life like here? */
        class UGVL_Conversation_Generic_AboutCamp_FM_SFB_FMSFBWhatslife_Reply3 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SFB_FMSFBWhatslife_Reply3;
            default ExampleText = "What d'you think? This is a bloody prison - no one likes bein' in prison.";
        }
        
        
        /** Type2
        1. What's life like here? */
        class UGVL_Conversation_Generic_AboutCamp_FM_SFB_FMSFBWhatslifehe_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SFB_FMSFBWhatslifehe_Reply1;
            default ExampleText = "We all gotta muck in, but you won't find ME complainin'.";
        }
        
        
        /** Type2
        2. What's life like here? */
        class UGVL_Conversation_Generic_AboutCamp_FM_SFB_FMSFBWhatslifehe_Reply2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SFB_FMSFBWhatslifehe_Reply2;
            default ExampleText = "Still better than the Old Camp, at least.";
        }
        
        
        /** Type2
        3. What's life like here? */
        class UGVL_Conversation_Generic_AboutCamp_FM_SFB_FMSFBWhatslifehe_Reply3 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SFB_FMSFBWhatslifehe_Reply3;
            default ExampleText = "Are you? From the Old Camp I mean?";
        }
        
        
        /** Type2
        4. What's life like here? */
        class UGVL_Conversation_Generic_AboutCamp_FM_SFB_FMSFBWhatslifehe_Reply4 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SFB_FMSFBWhatslifehe_Reply4;
            default ExampleText = "If you are, I don't want any trouble!";
        }
        
        
        /** Type1
        Who's in charge around here? */
        class UGVL_Conversation_Generic_AboutCamp_FM_SFB_FMSFBWhoaround_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SFB_FMSFBWhoaround_Reply1;
            default ExampleText = "Who's in charge, he asks. Have a look around, mate. It sure ain't the poor sods sweatin' all day diggin' for ore.";
        }
        
        
        /** Type2
        1. Who's in charge here? */
        class UGVL_Conversation_Generic_AboutCamp_FM_SFB_FMSFBWhoscharge_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SFB_FMSFBWhoscharge_Reply1;
            default ExampleText = "Here in the Cauldron, it's the mercs - over in the New Camp ... things look a bit different.";
        }
        
        
        /** Type2
        2. Who's in charge here? */
        class UGVL_Conversation_Generic_AboutCamp_FM_SFB_FMSFBWhoscharge_Reply2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SFB_FMSFBWhoscharge_Reply2;
            default ExampleText = "So be careful who you're gonna piss off.";
        }
        
        
        /** Type3
        1.Who's important here? */
        class UGVL_Conversation_Generic_AboutCamp_FM_SFB_FMSFBWhosimport_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SFB_FMSFBWhosimport_Reply1;
            default ExampleText = "Who's important here, he asks. I am!";
        }
        
        
        /** Type3
        2.Who's important here? */
        class UGVL_Conversation_Generic_AboutCamp_FM_SFB_FMSFBWhosimport_Reply2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SFB_FMSFBWhosimport_Reply2;
            default ExampleText = "But I reckon you wanna know who's in charge, right?";
        }
        
        
        /** Type3
        3.Who's important here? */
        class UGVL_Conversation_Generic_AboutCamp_FM_SFB_FMSFBWhosimport_Reply3 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SFB_FMSFBWhosimport_Reply3;
            default ExampleText = "Well, you should go talk to the mercs or bandits. You won't be gettin' near the Water Mages.";
        }
        
        
        /** Type3
        4.Who's important here? */
        class UGVL_Conversation_Generic_AboutCamp_FM_SFB_FMSFBWhosimport_Reply4 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SFB_FMSFBWhosimport_Reply4;
            default ExampleText = "And that puffed-up git, Swiney, ain't as important as he thinks. All he really does is hand out pickaxes and does what Okyl tells him.";
        }
        
        
        /** Type2
        All good? */
        class UGVL_Conversation_Generic_AboutCamp_FM_SLD_FMSLDAllgood_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SLD_FMSLDAllgood_Reply1;
            default ExampleText = "What kind o' question is that? But, yeah, we've got things under control.";
        }
        
        
        /** Type2
        1.How can I join this crew here? */
        class UGVL_Conversation_Generic_AboutCamp_FM_SLD_FMSLDHowcan_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SLD_FMSLDHowcan_Reply1;
            default ExampleText = "You wanna graft here in the Cauldron, prove yourself in the New Camp first. ";
        }
        
        
        /** Type2
        2.How can I join this crew here? */
        class UGVL_Conversation_Generic_AboutCamp_FM_SLD_FMSLDHowcan_Reply2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SLD_FMSLDHowcan_Reply2;
            default ExampleText = "Go ask around there.";
        }
        
        
        /** Type1
        How's it going? */
        class UGVL_Conversation_Generic_AboutCamp_FM_SLD_FMSLDHowits_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SLD_FMSLDHowits_Reply1;
            default ExampleText = "Quiet. A bit too quiet for me likin'.";
        }
        
        
        /** Type1
        1.How can I join you? */
        class UGVL_Conversation_Generic_AboutCamp_FM_SLD_FMSLDHowjoin_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SLD_FMSLDHowjoin_Reply1;
            default ExampleText = "If you wanna be part of us, you gotta make a name for yourself.";
        }
        
        
        /** Type1
        2.How can I join you? */
        class UGVL_Conversation_Generic_AboutCamp_FM_SLD_FMSLDHowjoin_Reply2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SLD_FMSLDHowjoin_Reply2;
            default ExampleText = "Prove yourself somewhere else first, then you might earn a shot here in the Cauldron.";
        }
        
        
        /** Type1
        1.Is there anything special going on here? */
        class UGVL_Conversation_Generic_AboutCamp_FM_SLD_FMSLDIsthere_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SLD_FMSLDIsthere_Reply1;
            default ExampleText = "Not much, except a whole lot o' trouble if you get on our bad side.";
        }
        
        
        /** Type1
        2.Is there anything special going on here? */
        class UGVL_Conversation_Generic_AboutCamp_FM_SLD_FMSLDIsthere_Reply2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SLD_FMSLDIsthere_Reply2;
            default ExampleText = "Oh, and anyone tryin' to sneak into the mine or the gatehouse without permission will be in real deep shit.";
        }
        
        
        /** Type2
        1.What's the deal here? */
        class UGVL_Conversation_Generic_AboutCamp_FM_SLD_FMSLDWhatsdeal_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SLD_FMSLDWhatsdeal_Reply1;
            default ExampleText = "We're guardin' the entrance to the mine.";
        }
        
        
        /** Type2
        2.What's the deal here? */
        class UGVL_Conversation_Generic_AboutCamp_FM_SLD_FMSLDWhatsdeal_Reply2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SLD_FMSLDWhatsdeal_Reply2;
            default ExampleText = "No one gets in except our lot.";
        }
        
        
        /** Type1
        1.Who's giving orders around here? */
        class UGVL_Conversation_Generic_AboutCamp_FM_SLD_FMSLDWhorules_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SLD_FMSLDWhorules_Reply1;
            default ExampleText = "Everythin' in the Cauldron goes through Okyl. He's the one with the ties to the top dogs in the Camp.";
        }
        
        
        /** Type1
        2.Who's giving orders around here? */
        class UGVL_Conversation_Generic_AboutCamp_FM_SLD_FMSLDWhorules_Reply2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SLD_FMSLDWhorules_Reply2;
            default ExampleText = "So if you botch anythin' up, the Water Mages over at the New Camp'll hear about it too.";
        }
        
        
        /** Type2
        1.Who's in charge here? */
        class UGVL_Conversation_Generic_AboutCamp_FM_SLD_FMSLDWhosthebsss_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SLD_FMSLDWhosthebsss_Reply1;
            default ExampleText = "Okyl runs things here in the Cauldron, but over at the Camp, it's Lee.";
        }
        
        
        /** Type2
        2.Who's in charge here? */
        class UGVL_Conversation_Generic_AboutCamp_FM_SLD_FMSLDWhosthebsss_Reply2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SLD_FMSLDWhosthebsss_Reply2;
            default ExampleText = "Best have a word with those two.";
        }
        
        
        /** Type2
        Are you all right? */
        class UGVL_Conversation_Generic_AboutCamp_NC_BAU_NCBAUAreyou_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_BAU_NCBAUAreyou_Reply1;
            default ExampleText = "What d'you want? Did the Rice Lord send you? I'm already workin' every bloody day!";
        }
        
        
        class UGVL_Conversation_Generic_AboutCamp_NC_BAU_NCBAUBadtime_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_BAU_NCBAUBadtime_Reply1;
            default ExampleText = "You picked a bad time to come visit. They took the bloody mine ... ";
        }
        
        
        class UGVL_Conversation_Generic_AboutCamp_NC_BAU_NCBAUBeliar_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_BAU_NCBAUBeliar_Reply1;
            default ExampleText = "What by Beliar– Oh. It's you.";
        }
        
        
        class UGVL_Conversation_Generic_AboutCamp_NC_BAU_NCBAUBelieve_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_BAU_NCBAUBelieve_Reply1;
            default ExampleText = "I can't believe this is happening ...";
        }
        
        
        /** Type1
        How's it going? */
        class UGVL_Conversation_Generic_AboutCamp_NC_BAU_NCBAUHowsitgo_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_BAU_NCBAUHowsitgo_Reply1;
            default ExampleText = "Plenty to do. We need a ton o' rice to keep all those people fed.";
        }
        
        
        /** Type3
        How are things? */
        class UGVL_Conversation_Generic_AboutCamp_NC_BAU_NCBAUHowthings_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_BAU_NCBAUHowthings_Reply1;
            default ExampleText = "We're workin' our arses off so everyone here's got somethin' to eat!";
        }
        
        
        /** Type1
        1.Do you have a leader? */
        class UGVL_Conversation_Generic_AboutCamp_NC_BAU_NCBAULeader_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_BAU_NCBAULeader_Reply1;
            default ExampleText = "The Rice Lord ... I guess. But most folk only work 'cause they're scared o' him and his goons.";
        }
        
        
        /** Type1
        2.Do you have a leader? */
        class UGVL_Conversation_Generic_AboutCamp_NC_BAU_NCBAULeader_Reply2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_BAU_NCBAULeader_Reply2;
            default ExampleText = "Me, though? Different story. I'm gettin' too old to be messin' with the bandits back at the camp ... The rice fields suit me just fine.";
        }
        
        
        /** Type3
        1.Who makes sure things run smoothly out here on the fields? */
        class UGVL_Conversation_Generic_AboutCamp_NC_BAU_NCBAUSurethings_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_BAU_NCBAUSurethings_Reply1;
            default ExampleText = "All of us, o' course! The Rice Lord keeps an eye on things, but I reckon he really just sits in his hovel all day countin' sacks.";
        }
        
        
        /** Type3
        2.Who makes sure things run smoothly out here on the fields? */
        class UGVL_Conversation_Generic_AboutCamp_NC_BAU_NCBAUSurethings_Reply2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_BAU_NCBAUSurethings_Reply2;
            default ExampleText = "Well, it was him and Homer built this whole place up, so ...";
        }
        
        
        /** Type3
        1.Tell me about this Camp. */
        class UGVL_Conversation_Generic_AboutCamp_NC_BAU_NCBAUTellmecamp_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_BAU_NCBAUTellmecamp_Reply1;
            default ExampleText = "The place is full o' arseholes. If it were up to me, the mercs would just give those bandits the boot.";
        }
        
        
        /** Type3
        2.Tell me about this Camp. */
        class UGVL_Conversation_Generic_AboutCamp_NC_BAU_NCBAUTellmecamp_Reply2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_BAU_NCBAUTellmecamp_Reply2;
            default ExampleText = "They do fuck all for us. Just cause trouble.";
        }
        
        
        /** Type1
        Lefty sent me. I got some water for you. */
        class UGVL_Conversation_Generic_AboutCamp_NC_BAU_NCBAUWater_ReplyNO : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_BAU_NCBAUWater_ReplyNO;
            default ExampleText = "Oh, but you ain't got none left. No worries, lad. I'll ask the others.";
        }
        
        
        /** Type1
        Lefty sent me. I got some water for you. */
        class UGVL_Conversation_Generic_AboutCamp_NC_BAU_NCBAUWater_ReplyYES : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_BAU_NCBAUWater_ReplyYES;
            default ExampleText = "Thanks, lad! Just what I needed!";
        }
        
        
        /** Type3
        Lefty sent me. I got some water for you. */
        class UGVL_Conversation_Generic_AboutCamp_NC_BAU_NCBAUWaterfromL_ReplyNO : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_BAU_NCBAUWaterfromL_ReplyNO;
            default ExampleText = "You're out? Well, guess I'll get some off the others.";
        }
        
        
        /** Type3
        Lefty sent me. I got some water for you. */
        class UGVL_Conversation_Generic_AboutCamp_NC_BAU_NCBAUWaterfromL_ReplyYES : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_BAU_NCBAUWaterfromL_ReplyYES;
            default ExampleText = "Cheers, mate! I was about ready to start drinkin' the mud.";
        }
        
        
        /** Type2
        Lefty sent me. I got some water for you. */
        class UGVL_Conversation_Generic_AboutCamp_NC_BAU_NCBAUWaterLefty_ReplyNO : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_BAU_NCBAUWaterLefty_ReplyNO;
            default ExampleText = "Water! ... Oi, mate! You ain't got none left. So everyone else got theirs except me again?";
        }
        
        
        /** Type2
        Lefty sent me. I got some water for you. */
        class UGVL_Conversation_Generic_AboutCamp_NC_BAU_NCBAUWaterLefty_ReplyYES : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_BAU_NCBAUWaterLefty_ReplyYES;
            default ExampleText = "Thanks, mate. I'm dyin' of thirst.";
        }
        
        
        /** Type2
        What can you tell me about the camp? */
        class UGVL_Conversation_Generic_AboutCamp_NC_BAU_NCBAUWhatcan_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_BAU_NCBAUWhatcan_Reply1;
            default ExampleText = "Dodgy characters, them. Well, Lee's mercs and the Mages ain't too bad - but you best watch yourself around the bandits!";
        }
        
        
        /** Type1
        What should I know about this place? */
        class UGVL_Conversation_Generic_AboutCamp_NC_BAU_NCBAUWhatshould_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_BAU_NCBAUWhatshould_Reply1;
            default ExampleText = "Be careful when you head into the Camp, lad! Plenty o' cutthroats here who'd love to wring a freshie's neck.";
        }
        
        
        /** Type2
        You work on the rice fields by choice? */
        class UGVL_Conversation_Generic_AboutCamp_NC_BAU_NCBAUYouwork_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_BAU_NCBAUYouwork_Reply1;
            default ExampleText = "What d'you want? Did the Rice Lord send you? I'm already workin' every bloody day!";
        }
        
        
        class UGVL_Conversation_Generic_AboutCamp_NC_ORG_NCORGBackMine_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGBackMine_Reply1;
            default ExampleText = "Why aren't we taking back the mine?";
        }
        
        
        class UGVL_Conversation_Generic_AboutCamp_NC_ORG_NCORGBrother_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGBrother_Reply1;
            default ExampleText = "It's all going to shit, brother.";
        }
        
        
        /** Type2
        Can I interest you in a herb roll? */
        class UGVL_Conversation_Generic_AboutCamp_NC_ORG_NCORGCanIherb_ReplyNO : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGCanIherb_ReplyNO;
            default ExampleText = "Yeah. But you ain't got none.";
        }
        
        
        /** Type2
        Can I interest you in a herb roll? */
        class UGVL_Conversation_Generic_AboutCamp_NC_ORG_NCORGCanIherb_ReplyYES : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGCanIherb_ReplyYES;
            default ExampleText = "Sure. I'll give you ten for it - here.";
        }
        
        
        /** Type2
        Can I interest you in a herb roll? */
        class UGVL_Conversation_Generic_AboutCamp_NC_ORG_NCORGCanIherb_ReplyYES2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGCanIherb_ReplyYES2;
            default ExampleText = "If you ever gotta shift more, come find me.";
        }
        
        
        class UGVL_Conversation_Generic_AboutCamp_NC_ORG_NCORGDontcare_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGDontcare_Reply1;
            default ExampleText = "The mages have to get us out of here! I don't care how!";
        }
        
        
        class UGVL_Conversation_Generic_AboutCamp_NC_ORG_NCORGGod_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGGod_Reply1;
            default ExampleText = "Tired of your god? Hehehe ...";
        }
        
        
        /** Type1
        1.How are things? */
        class UGVL_Conversation_Generic_AboutCamp_NC_ORG_NCORGHowarething_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGHowarething_Reply1;
            default ExampleText = "What's it look like, mate? Eatin' rice all bloody day and waitin' for a chance to get our hands on some ore.";
        }
        
        
        /** Type1
        2.How are things? */
        class UGVL_Conversation_Generic_AboutCamp_NC_ORG_NCORGHowarething_Reply2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGHowarething_Reply2;
            default ExampleText = "And then gettin' proper pissed on rice schnapps over at the tavern!";
        }
        
        
        /** Type3
        How's it going? */
        class UGVL_Conversation_Generic_AboutCamp_NC_ORG_NCORGHowits_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGHowits_Reply1;
            default ExampleText = "What do YOU want from me?";
        }
        
        
        /** Type2
        What do I have to do to join this Camp? */
        class UGVL_Conversation_Generic_AboutCamp_NC_ORG_NCORGIhavetojoin_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGIhavetojoin_Reply1;
            default ExampleText = "If you wanna join our gang, you'll have to prove you're against Gomez.";
        }
        
        
        /** Type2
        And how am I supposed to do that? */
        class UGVL_Conversation_Generic_AboutCamp_NC_ORG_NCORGIhavetojoin_Reply2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGIhavetojoin_Reply2;
            default ExampleText = "If I were you, I'd bring Lares somethin' important from the Old Camp or the Old Mine.";
        }
        
        
        class UGVL_Conversation_Generic_AboutCamp_NC_ORG_NCORGIwannajoin_Reply0 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGIwannajoin_Reply0;
            default ExampleText = "Lares decides who gets into the gang.";
        }
        
        
        /** Type1
        1.I wanna join your crew! */
        class UGVL_Conversation_Generic_AboutCamp_NC_ORG_NCORGIwannajoin_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGIwannajoin_Reply1;
            default ExampleText = "But if you wanna see him, you're gonna need a damn good reason.";
        }
        
        
        /** Type1
        2.I wanna join your crew! */
        class UGVL_Conversation_Generic_AboutCamp_NC_ORG_NCORGIwannajoin_Reply2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGIwannajoin_Reply2;
            default ExampleText = "Like someone sending you to him.";
        }
        
        
        /** Type3
        I wanna know more about this Camp. */
        class UGVL_Conversation_Generic_AboutCamp_NC_ORG_NCORGIwannaknow_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGIwannaknow_Reply1;
            default ExampleText = "Then go and have a look around. As long as you're not one of Gomez's lot, no one's gonna stop you.";
        }
        
        
        class UGVL_Conversation_Generic_AboutCamp_NC_ORG_NCORGMages_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGMages_Reply1;
            default ExampleText = "Mages got you runnin' errands now, eh? Guess that counts as a promotion ...";
        }
        
        
        class UGVL_Conversation_Generic_AboutCamp_NC_ORG_NCORGOldCamp_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGOldCamp_Reply1;
            default ExampleText = "Mages got you runnin' errands now, eh? Guess that counts as a promotion ...";
        }
        
        
        class UGVL_Conversation_Generic_AboutCamp_NC_ORG_NCORGReds_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGReds_Reply1;
            default ExampleText = "What's your business here? This is no place for Reds.";
        }
        
        
        /** Type1
        I've got some smoke rolls. You want one? */
        class UGVL_Conversation_Generic_AboutCamp_NC_ORG_NCORGSmokerolls_ReplyNO : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGSmokerolls_ReplyNO;
            default ExampleText = "Where? I ain't seein' any.";
        }
        
        
        /** Type1
        I've got some smoke rolls. You want one? */
        class UGVL_Conversation_Generic_AboutCamp_NC_ORG_NCORGSmokerolls_ReplyYES1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGSmokerolls_ReplyYES1;
            default ExampleText = "Sure. Here are ten ore. Give it to me.";
        }
        
        
        /** Type1
        I've got some smoke rolls. You want one? */
        class UGVL_Conversation_Generic_AboutCamp_NC_ORG_NCORGSmokerolls_ReplyYES2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGSmokerolls_ReplyYES2;
            default ExampleText = "You can drop by more often if you got some herb.";
        }
        
        
        class UGVL_Conversation_Generic_AboutCamp_NC_ORG_NCORGTellme_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGTellme_Reply1;
            default ExampleText = "It's more of a ... mutual arrangement. Everyone's mindin' their own business, but there's enough of us that Gomez can't just wipe us out.";
        }
        
        
        class UGVL_Conversation_Generic_AboutCamp_NC_ORG_NCORGTellme_Reply2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGTellme_Reply2;
            default ExampleText = "Not that he wouldn't love to.";
        }
        
        
        class UGVL_Conversation_Generic_AboutCamp_NC_ORG_NCORGTellme_Reply3 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGTellme_Reply3;
            default ExampleText = "Well, we nick his stuff!";
        }
        
        
        class UGVL_Conversation_Generic_AboutCamp_NC_ORG_NCORGTheypay_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGTheypay_Reply1;
            default ExampleText = "Can't believe those fuckers beat us. They'll pay for that. They'll pay.";
        }
        
        
        /** Type3
        What do I have to do to join the Camp? */
        class UGVL_Conversation_Generic_AboutCamp_NC_ORG_NCORGWhatdoIhave_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGWhatdoIhave_Reply1;
            default ExampleText = "Get yourself down to the fields and help the farmers pick rice.";
        }
        
        
        /** Type1
        1.What should I know about this place? */
        class UGVL_Conversation_Generic_AboutCamp_NC_ORG_NCORGWhatIknow_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGWhatIknow_Reply1;
            default ExampleText = "There's a massive pit full with ore right in the middle of the cave. If you're thinkin' about tryin' to nick some - forget it!";
        }
        
        
        /** Type1
        2.What should I know about this place? */
        class UGVL_Conversation_Generic_AboutCamp_NC_ORG_NCORGWhatIknow_Reply2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGWhatIknow_Reply2;
            default ExampleText = "Tried it meself once - but the mercs guard it day and night.";
        }
        
        
        /** Type3
        Who's calling the shots around here? */
        class UGVL_Conversation_Generic_AboutCamp_NC_ORG_NCORGWhoscalling_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGWhoscalling_Reply1;
            default ExampleText = "Lee's the one leadin' the mercs, if THAT'S what you wanted to know. But I ain't a merc, and I sure as shit ain't takin' orders from those dossers!";
        }
        
        
        /** Type1
        1.Who's in charge here? */
        class UGVL_Conversation_Generic_AboutCamp_NC_ORG_NCORGWhosin_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGWhosin_Reply1;
            default ExampleText = "Fresh outta the Old Camp, eh?";
        }
        
        
        /** Type1
        2.Who's in charge here? */
        class UGVL_Conversation_Generic_AboutCamp_NC_ORG_NCORGWhosin_Reply2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGWhosin_Reply2;
            default ExampleText = "No one's \"in charge\" here. That bloody twit, Lee, likes to think he's got us on a leash, but we do what we want.";
        }
        
        
        /** Type1
        3.Who's in charge here? */
        class UGVL_Conversation_Generic_AboutCamp_NC_ORG_NCORGWhosin_Reply3 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGWhosin_Reply3;
            default ExampleText = "If there's anyone in charge here, it's Lares. But he's smart enough not to meddle with other folk's business.";
        }
        
        
        /** Type2
        1.Who's your leader? */
        class UGVL_Conversation_Generic_AboutCamp_NC_ORG_NCORGWhosleader_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGWhosleader_Reply1;
            default ExampleText = "Lares is the gang's head. Most of the lads respect him.";
        }
        
        
        /** Type2
        2.Who's your leader? */
        class UGVL_Conversation_Generic_AboutCamp_NC_ORG_NCORGWhosleader_Reply2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGWhosleader_Reply2;
            default ExampleText = "But he doesn't tell us what to do.";
        }
        
        
        /** Type2
        1.How do things work around here? */
        class UGVL_Conversation_Generic_AboutCamp_NC_ORG_NCORGWorkaround_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGWorkaround_Reply1;
            default ExampleText = "Freshie, aren't you?";
        }
        
        
        /** Type2
        2..How do things work around here? */
        class UGVL_Conversation_Generic_AboutCamp_NC_ORG_NCORGWorkaround_Reply2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGWorkaround_Reply2;
            default ExampleText = "Well, the Mages have been preppin' to blow up that ore pile for years now. Word is, the big day ain't far off.";
        }
        
        
        /** Type2
        3.How do things work around here? */
        class UGVL_Conversation_Generic_AboutCamp_NC_ORG_NCORGWorkaround_Reply3 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGWorkaround_Reply3;
            default ExampleText = "At least, that's what you'd think seein' that massive ore pile the diggers have been scrapin' up.";
        }
        
        
        /** Type3
        You look like you could do with some swampweed. */
        class UGVL_Conversation_Generic_AboutCamp_NC_ORG_NCORGYoulook_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGYoulook_Reply1;
            default ExampleText = "You got anything? I'll take a roll for ten ore.";
        }
        
        
        /** Type3
        You look like you could do with some swampweed. */
        class UGVL_Conversation_Generic_AboutCamp_NC_ORG_NCORGYoulook_ReplyNO : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGYoulook_ReplyNO;
            default ExampleText = "But you ain't got none. You don't wanna mess around with me, you got that?";
        }
        
        
        /** Type3
        You look like you could do with some swampweed. */
        class UGVL_Conversation_Generic_AboutCamp_NC_ORG_NCORGYoulook_ReplyYES : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGYoulook_ReplyYES;
            default ExampleText = "You can come back anytime, brother.";
        }
        
        
        class UGVL_Conversation_Generic_AboutCamp_NC_SLD_NCSLDAgainstus_Ambient1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDAgainstus_Ambient1;
            default ExampleText = "If you aren't with us, you're against us.";
        }
        
        
        /** Type2
        1.I wanna become a mercenary for the Mages. */
        class UGVL_Conversation_Generic_AboutCamp_NC_SLD_NCSLDBecomemerc_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDBecomemerc_Reply1;
            default ExampleText = "That ain't too hard. If you wanna fight our corner, Lee'll take you on.";
        }
        
        
        /** Type2
        2.I wanna become a mercenary for the Mages. */
        class UGVL_Conversation_Generic_AboutCamp_NC_SLD_NCSLDBecomemerc_Reply2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDBecomemerc_Reply2;
            default ExampleText = "But he takes only those who know how to handle a sword. Do you?";
        }
        
        
        /** Type2
        1.Well... */
        class UGVL_Conversation_Generic_AboutCamp_NC_SLD_NCSLDBecomemerc_Reply3 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDBecomemerc_Reply3;
            default ExampleText = "Thought so. Look, if you're serious, have a word with Gorn. He's trained freshies before.";
        }
        
        
        /** Type2
        1.Well... */
        class UGVL_Conversation_Generic_AboutCamp_NC_SLD_NCSLDBecomemerc_Reply4 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDBecomemerc_Reply4;
            default ExampleText = "Maybe you'll get lucky and he'll bother with you too.";
        }
        
        
        class UGVL_Conversation_Generic_AboutCamp_NC_SLD_NCSLDBlue_Ambient1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDBlue_Ambient1;
            default ExampleText = "Already got the blue? Man, Lares has gotten soft ... ";
        }
        
        
        class UGVL_Conversation_Generic_AboutCamp_NC_SLD_NCSLDDosomething_Ambient1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDDosomething_Ambient1;
            default ExampleText = "Lee has gotta do something about that.";
        }
        
        
        /** Type1
        1.Do you need another good man? */
        class UGVL_Conversation_Generic_AboutCamp_NC_SLD_NCSLDDoyouneed_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDDoyouneed_Reply1;
            default ExampleText = "Lee won't be lettin' you join the mercs - not if you ain't been here a while and know how the cat jumps.";
        }
        
        
        /** Type1
        2.Do you need another good man? */
        class UGVL_Conversation_Generic_AboutCamp_NC_SLD_NCSLDDoyouneed_Reply2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDDoyouneed_Reply2;
            default ExampleText = "So, if you wanna stay here, you'll have to get chummy with the bandits first.";
        }
        
        
        /** Type2
        Is everything all right? */
        class UGVL_Conversation_Generic_AboutCamp_NC_SLD_NCSLDEverything_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDEverything_Reply1;
            default ExampleText = "All quiet ... for now.";
        }
        
        
        /** Type2
        1.For now? */
        class UGVL_Conversation_Generic_AboutCamp_NC_SLD_NCSLDEverything_Reply2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDEverything_Reply2;
            default ExampleText = "If the bandits keep goin' for Gomez's convoys, one o' these days he's gonna turn up at our front gate with his whole army.";
        }
        
        
        /** Type2
        2.For now? */
        class UGVL_Conversation_Generic_AboutCamp_NC_SLD_NCSLDEverything_Reply3 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDEverything_Reply3;
            default ExampleText = "And that sure ain't gonna be pretty.";
        }
        
        
        class UGVL_Conversation_Generic_AboutCamp_NC_SLD_NCSLDFunny_Ambient1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDFunny_Ambient1;
            default ExampleText = "So you're working for the mages now, eh? Don't try anything funny. You'll regret it.";
        }
        
        
        /** Type1
        How are things? */
        class UGVL_Conversation_Generic_AboutCamp_NC_SLD_NCSLDHoware_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDHoware_Reply1;
            default ExampleText = "Same as always - we make sure no one gets too close to the Mages or the ore.";
        }
        
        
        /** Type2
        Interested in some herb rolls? */
        class UGVL_Conversation_Generic_AboutCamp_NC_SLD_NCSLDInterested_ReplyNO : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDInterested_ReplyNO;
            default ExampleText = "Get some first, then we'll talk.";
        }
        
        
        /** Type2
        Interested in some herb rolls? */
        class UGVL_Conversation_Generic_AboutCamp_NC_SLD_NCSLDInterested_ReplyYES : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDInterested_ReplyYES;
            default ExampleText = "Sure am. Here you go - ten ore.";
        }
        
        
        /** Type2
        Interested in some herb rolls? */
        class UGVL_Conversation_Generic_AboutCamp_NC_SLD_NCSLDInterested_ReplyYES2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDInterested_ReplyYES2;
            default ExampleText = "If you got more, you know where to find me ...";
        }
        
        
        class UGVL_Conversation_Generic_AboutCamp_NC_SLD_NCSLDLast_Ambient1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDLast_Ambient1;
            default ExampleText = "So, you're one of us now? Let's see how long you last ...";
        }
        
        
        class UGVL_Conversation_Generic_AboutCamp_NC_SLD_NCSLDNotime_Ambient1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDNotime_Ambient1;
            default ExampleText = "No time. We got a situation ...";
        }
        
        
        /** Type1
        I've got smoke rolls - do you want one? */
        class UGVL_Conversation_Generic_AboutCamp_NC_SLD_NCSLDSmokerolls_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDSmokerolls_Reply1;
            default ExampleText = "Why not. Give me whatever ten ore can buy.";
        }
        
        
        /** Type1
        I've got smoke rolls - do you want one? */
        class UGVL_Conversation_Generic_AboutCamp_NC_SLD_NCSLDSmokerolls_ReplyNO : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDSmokerolls_ReplyNO;
            default ExampleText = "Ain't seeing any... Are you joking with me bud?";
        }
        
        
        /** Type1
        1.I've got smoke rolls - do you want one? */
        class UGVL_Conversation_Generic_AboutCamp_NC_SLD_NCSLDSmokerolls_ReplyYES1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDSmokerolls_ReplyYES1;
            default ExampleText = "Here it is! Ten ore should be a good price. ";
        }
        
        
        /** Type1
        2.I've got smoke rolls - do you want one? */
        class UGVL_Conversation_Generic_AboutCamp_NC_SLD_NCSLDSmokerolls_ReplyYES2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDSmokerolls_ReplyYES2;
            default ExampleText = "I will not move far away. If you got more, you know where to find me...";
        }
        
        
        class UGVL_Conversation_Generic_AboutCamp_NC_SLD_NCSLDThemages_Ambient1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDThemages_Ambient1;
            default ExampleText = "The mages have to get us out of here ...";
        }
        
        
        class UGVL_Conversation_Generic_AboutCamp_NC_SLD_NCSLDThetime_Ambient1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDThetime_Ambient1;
            default ExampleText = "Now's not the time.";
        }
        
        
        /** Type2
        Is there any trouble in the Camp? */
        class UGVL_Conversation_Generic_AboutCamp_NC_SLD_NCSLDTroubleCamp_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDTroubleCamp_Reply1;
            default ExampleText = "Mate, there's always trouble here. The bandits do whatever they bloody well like, and us mercs are busy watchin' the Mages' backs and keepin' up the Camp's defenses.";
        }
        
        
        class UGVL_Conversation_Generic_AboutCamp_NC_SLD_NCSLDWelcome_Ambient1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDWelcome_Ambient1;
            default ExampleText = "New to the crew, eh? Welcome. ";
        }
        
        
        /** Type1
        1.What can you tell me about this Camp? */
        class UGVL_Conversation_Generic_AboutCamp_NC_SLD_NCSLDWhatcan_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDWhatcan_Reply1;
            default ExampleText = "Watch your back while you're here. Plenty of cutthroats in this place.";
        }
        
        
        /** Type1
        2.What can you tell me about this Camp? */
        class UGVL_Conversation_Generic_AboutCamp_NC_SLD_NCSLDWhatcan_Reply2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDWhatcan_Reply2;
            default ExampleText = "There's quite a bunch o' unspoken rules. First: only the mercs can go into the Mages' area.";
        }
        
        
        /** Type1
        3.What can you tell me about this Camp? */
        class UGVL_Conversation_Generic_AboutCamp_NC_SLD_NCSLDWhatcan_Reply3 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDWhatcan_Reply3;
            default ExampleText = "Second: anyone tryin' to get to the ore pile is a dead man. Third: I wouldn't go in the tavern on the lake.";
        }
        
        
        /** Type1
        
        4.What can you tell me about this Camp? */
        class UGVL_Conversation_Generic_AboutCamp_NC_SLD_NCSLDWhatcan_Reply4 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDWhatcan_Reply4;
            default ExampleText = "It's the bandits' spot, and they don't like it when green-bloods like you show up there.";
        }
        
        
        /** Type2
        1.Who's in charge here? */
        class UGVL_Conversation_Generic_AboutCamp_NC_SLD_NCSLDWhoischarge_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDWhoischarge_Reply1;
            default ExampleText = "We do what the Mages tell us. But most of the time, they aren't even sayin' anything. They just hang around the ore pile, and brood over their books.";
        }
        
        
        /** Type2
        2.Who's in charge here? */
        class UGVL_Conversation_Generic_AboutCamp_NC_SLD_NCSLDWhoischarge_Reply2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDWhoischarge_Reply2;
            default ExampleText = "If you ask me, it's Lee keepin' everythin' sorted. He's the one in charge.";
        }
        
        
        /** Type1
        Who's calling the shots in here? */
        class UGVL_Conversation_Generic_AboutCamp_NC_SLD_NCSLDWhoscalling_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDWhoscalling_Reply1;
            default ExampleText = "Us mercs all follow Lee. He struck the deal with the Mages - we protect them, and they get us outta here.";
        }
        
        
        /** Type1
        1.So it's really the Mages who are in charge. */
        class UGVL_Conversation_Generic_AboutCamp_NC_SLD_NCSLDWhoscalling_Reply2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDWhoscalling_Reply2;
            default ExampleText = "Nah, no one's \"in charge.\" Most here are just the blokes that either couldn't or wouldn't stay in the Old Camp.";
        }
        
        
        /** Type1
        2.So it's really the Mages who are in charge. */
        class UGVL_Conversation_Generic_AboutCamp_NC_SLD_NCSLDWhoscalling_Reply3 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDWhoscalling_Reply3;
            default ExampleText = "Everyone's out for themselves here. But there's one thing we all agree on: better to shovel the whole soddin' ore one pile and blow it to bits than shovel it down the king's throat!";
        }
        
        
        /** Type1//Original Voicetype 6
        1.Could you do with more capable people? */
        class UGVL_Conversation_Generic_AboutCamp_OC_GRD_Couldyoudowith_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_Couldyoudowith_Reply1;
            default ExampleText = "Green-blood, aye? If you're after a Camp to take you in, try the Loonies over at the swamp. They'll take anyone.";
        }
        
        
        /** Type1//Original Voicetype 6
        2.Could you do with more capable people? */
        class UGVL_Conversation_Generic_AboutCamp_OC_GRD_Couldyoudowith_Reply2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_Couldyoudowith_Reply2;
            default ExampleText = "It ain't that easy with us, though. Unless you fancy the rest of your days diggin' in the Old Mine.";
        }
        
        
        /** Type2//Original Voicetype 7
        1.Does everyone here work for Gomez? */
        class UGVL_Conversation_Generic_AboutCamp_OC_GRD_Everyoneworks_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_Everyoneworks_Reply1;
            default ExampleText = "No. Most here are just diggers.";
        }
        
        
        /** Type2//Original Voicetype 7
        4.What do the Shadows do? */
        class UGVL_Conversation_Generic_AboutCamp_OC_GRD_Everyoneworks_Reply10 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_Everyoneworks_Reply10;
            default ExampleText = "Once you're one o' Gomez's men, ain't no one in the whole Colony that can get to you, lad!";
        }
        
        
        /** Type2//Original Voicetype 7
        1.What do the warders do? */
        class UGVL_Conversation_Generic_AboutCamp_OC_GRD_Everyoneworks_Reply11 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_Everyoneworks_Reply11;
            default ExampleText = "We guard the Camp and protect the diggers.";
        }
        
        
        /** Type2//Original Voicetype 7
        2.What do the warders do? */
        class UGVL_Conversation_Generic_AboutCamp_OC_GRD_Everyoneworks_Reply12 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_Everyoneworks_Reply12;
            default ExampleText = "With Gomez's pay and the protection money from the diggers, I reckon we do all right for ourselves.";
        }
        
        
        /** Type2//Original Voicetype 7
        2.Does everyone here work for Gomez? */
        class UGVL_Conversation_Generic_AboutCamp_OC_GRD_Everyoneworks_Reply2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_Everyoneworks_Reply2;
            default ExampleText = "Only us warders and Shadows work for him.";
        }
        
        
        /** Type2//Original Voicetype 7
        1.What do the diggers do? */
        class UGVL_Conversation_Generic_AboutCamp_OC_GRD_Everyoneworks_Reply3 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_Everyoneworks_Reply3;
            default ExampleText = "Good question! We shouldn't even let those dirt-grubbers out the mine.";
        }
        
        
        /** Type2//Original Voicetype 7
        2.What do the diggers do? */
        class UGVL_Conversation_Generic_AboutCamp_OC_GRD_Everyoneworks_Reply4 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_Everyoneworks_Reply4;
            default ExampleText = "They stay in there all the bloody time and only come out to get their cut.";
        }
        
        
        /** Type2//Original Voicetype 7
        3.What do the diggers do? */
        class UGVL_Conversation_Generic_AboutCamp_OC_GRD_Everyoneworks_Reply5 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_Everyoneworks_Reply5;
            default ExampleText = "And when they've blown all of it, it's back down into the mine. That's what most folk in here do anyway.";
        }
        
        
        /** Type2//Original Voicetype 7
        4.What do the diggers do? */
        class UGVL_Conversation_Generic_AboutCamp_OC_GRD_Everyoneworks_Reply6 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_Everyoneworks_Reply6;
            default ExampleText = "But you look like you got more in you than swingin' a pick. Maybe have a word with Thorus if you didn't already.";
        }
        
        
        /** Type2//Original Voicetype 7
        1.What do the Shadows do? */
        class UGVL_Conversation_Generic_AboutCamp_OC_GRD_Everyoneworks_Reply7 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_Everyoneworks_Reply7;
            default ExampleText = "They make sure everyone keeps in line with what Gomez says.";
        }
        
        
        /** Type2//Original Voicetype 7
        2.What do the Shadows do? */
        class UGVL_Conversation_Generic_AboutCamp_OC_GRD_Everyoneworks_Reply8 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_Everyoneworks_Reply8;
            default ExampleText = "Most of them are bootlickers tryin' to work their way up, but if you wanna get anywhere in here, that's sort of the only way.";
        }
        
        
        /** Type2//Original Voicetype 7
        3.What do the Shadows do? */
        class UGVL_Conversation_Generic_AboutCamp_OC_GRD_Everyoneworks_Reply9 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_Everyoneworks_Reply9;
            default ExampleText = "Do your job long enough without screwin' up, and you might get an honest shot joinin' us.";
        }
        
        
        /** Type1//Original Voicetype 6
        How's it going? */
        class UGVL_Conversation_Generic_AboutCamp_OC_GRD_Howarethings_Reply : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_Howarethings_Reply;
            default ExampleText = "You lookin' to start somethin'?";
        }
        
        
        /** Type3//Original Voicetype 13
        How do I get into the castle? */
        class UGVL_Conversation_Generic_AboutCamp_OC_GRD_HowdoIgetin_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_HowdoIgetin_Reply1;
            default ExampleText = "You don't. Only Gomez's men do.";
        }
        
        
        /** Type3//Original Voicetype 13
        1.And if I wanna talk to Gomez? */
        class UGVL_Conversation_Generic_AboutCamp_OC_GRD_HowdoIgetin_Reply2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_HowdoIgetin_Reply2;
            default ExampleText = "Gomez doesn't give a toss about some freshie who ain't even proved himself.";
        }
        
        
        /** Type3//Original Voicetype 13
        2.And if I wanna talk to Gomez? */
        class UGVL_Conversation_Generic_AboutCamp_OC_GRD_HowdoIgetin_Reply3 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_HowdoIgetin_Reply3;
            default ExampleText = "But if you're serious, talk to Thorus.";
        }
        
        
        /** Type3//Original Voicetype 13
        1.And if I bribe the guards? */
        class UGVL_Conversation_Generic_AboutCamp_OC_GRD_HowdoIgetin_Reply4 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_HowdoIgetin_Reply4;
            default ExampleText = "You got some nerve, lad. Well, guess the right amount o' ore could convince the guards to look the other way.";
        }
        
        
        /** Type3//Original Voicetype 13
        2.And if I bribe the guards? */
        class UGVL_Conversation_Generic_AboutCamp_OC_GRD_HowdoIgetin_Reply5 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_HowdoIgetin_Reply5;
            default ExampleText = "But if Gomez finds out they just let some freshie waltz into his castle, he'll throw them in the dungeon.";
        }
        
        
        /** Type3//Original Voicetype 13
        3.And if I bribe the guards? */
        class UGVL_Conversation_Generic_AboutCamp_OC_GRD_HowdoIgetin_Reply6 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_HowdoIgetin_Reply6;
            default ExampleText = "So, naturally, that bumps up the price.";
        }
        
        
        /** Type3//Original Voicetype 13
        4.And if I bribe the guards? */
        class UGVL_Conversation_Generic_AboutCamp_OC_GRD_HowdoIgetin_Reply7 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_HowdoIgetin_Reply7;
            default ExampleText = "But even if you get in, what are you gonna do? Every corner o' that place is bein' guarded.";
        }
        
        
        /** Type3//Original Voicetype 13
        I wanna join the warders. */
        class UGVL_Conversation_Generic_AboutCamp_OC_GRD_HowdoIgetin_Reply8 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_HowdoIgetin_Reply8;
            default ExampleText = "Then you got a long road ahead o' you, lad!";
        }
        
        
        /**
         * Type2//Original Voicetype 7 // Player knows abouts warders 1.What do I have to do to become one
         * of Gomez's warders?
         */
        
        class UGVL_Conversation_Generic_AboutCamp_OC_GRD_HowIJoin_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_HowIJoin_Reply1;
            default ExampleText = "You?! Ha! You're a funny one. You think you can climb straight to the top before even takin' your first step, huh?";
        }
        
        
        /** Type2//Original Voicetype 7
        2.What do I have to do to become one of Gomez's warders? */
        class UGVL_Conversation_Generic_AboutCamp_OC_GRD_HowIJoin_Reply2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_HowIJoin_Reply2;
            default ExampleText = "Gomez picks only the best o'his men as warders.";
        }
        
        
        /** Type2//Original Voicetype 7
        3.What do I have to do to become one of Gomez's warders? */
        class UGVL_Conversation_Generic_AboutCamp_OC_GRD_HowIJoin_Reply3 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_HowIJoin_Reply3;
            default ExampleText = "You're gona have to start like the rest of us and prove your loyalty with the Shadows.";
        }
        
        
        /** Original Voicetype 7// Player doesnt have guild */
        class UGVL_Conversation_Generic_AboutCamp_OC_GRD_Howsitgoing_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_Howsitgoing_Reply1;
            default ExampleText = "How's it going?";
        }
        
        
        /** Type1//Original Voicetype 6
        1.I'm new here. */
        class UGVL_Conversation_Generic_AboutCamp_OC_GRD_Imnewhere_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_Imnewhere_Reply1;
            default ExampleText = "I can see that.";
        }
        
        
        /** Type1//Original Voicetype 6
        What's the word, then? */
        class UGVL_Conversation_Generic_AboutCamp_OC_GRD_Imnewhere_Reply2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_Imnewhere_Reply2;
            default ExampleText = "Cause any sort o' trouble and you'll get a proper pastin'.";
        }
        
        
        /** Type1//Original Voicetype 6
        1.What do you mean by trouble? */
        class UGVL_Conversation_Generic_AboutCamp_OC_GRD_Imnewhere_Reply3 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_Imnewhere_Reply3;
            default ExampleText = "Most diggers pay us to keep them safe.";
        }
        
        
        /** Type1//Original Voicetype 6
        2.What do you mean by trouble? */
        class UGVL_Conversation_Generic_AboutCamp_OC_GRD_Imnewhere_Reply4 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_Imnewhere_Reply4;
            default ExampleText = "
            You mess with one o' them, you'll get to know us proper.";
        }
        
        
        /** Type1//Original Voicetype 6
        3.What do you mean by trouble? */
        class UGVL_Conversation_Generic_AboutCamp_OC_GRD_Imnewhere_Reply5 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_Imnewhere_Reply5;
            default ExampleText = "We catch you pokin' around in someone else's hut ...";
        }
        
        
        /** Type3//Original Voicetype 13
        1.Is everything all right? */
        class UGVL_Conversation_Generic_AboutCamp_OC_GRD_Iseverything_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_Iseverything_Reply1;
            default ExampleText = "It's quiet. We got a bit o' trouble now and then with the New Camp or a few o' those Loonies.";
        }
        
        
        /** Type3//Original Voicetype 13
        2.Is everything all right? */
        class UGVL_Conversation_Generic_AboutCamp_OC_GRD_Iseverything_Reply2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_Iseverything_Reply2;
            default ExampleText = "Nothin' to worry about when you're as new, but once you pick a side, you're in deep - just like the rest of us.";
        }
        
        
        class UGVL_Conversation_Generic_AboutCamp_OC_GRD_OCGRDAskme_Ambient1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_OCGRDAskme_Ambient1;
            default ExampleText = "Well, if you ask me, things ain't so grim. The Swamp Camp is drowning in chaos, the Water Mages messed up their plan, and we run the Free Mine now ...";
        }
        
        
        class UGVL_Conversation_Generic_AboutCamp_OC_GRD_OCGRDCameBack_Ambient1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_OCGRDCameBack_Ambient1;
            default ExampleText = "Huh. So you came back. You're lucky Gomez didn't kill you.";
        }
        
        
        class UGVL_Conversation_Generic_AboutCamp_OC_GRD_OCGRDLoonswork_Ambient1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_OCGRDLoonswork_Ambient1;
            default ExampleText = "Careful now. This is a bad time to piss off the wrong guy.";
        }
        
        
        class UGVL_Conversation_Generic_AboutCamp_OC_GRD_OCGRDMercs_Ambient1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_OCGRDMercs_Ambient1;
            default ExampleText = "Told you the mercs ain't that tough. Ain't done nothin' but sit on their arses and drink schnapps those past years. I say we take the whole camp, including that huge pile of ore.";
        }
        
        
        class UGVL_Conversation_Generic_AboutCamp_OC_GRD_OCGRDUpstart_Ambient1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_OCGRDUpstart_Ambient1;
            default ExampleText = "Well, well. If it ain't the upstart ...";
        }
        
        
        class UGVL_Conversation_Generic_AboutCamp_OC_GRD_OCGRDWrongguy_Ambient1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_OCGRDWrongguy_Ambient1;
            default ExampleText = "Careful now. This is a bad time to piss off the wrong guy.";
        }
        
        
        /** Type1//Original Voicetype 6
        Who gives orders around here? */
        class UGVL_Conversation_Generic_AboutCamp_OC_GRD_Whogivesorders_Reply : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_Whogivesorders_Reply;
            default ExampleText = "Thorus. He keeps things runnin' here. Gomez put him in charge.";
        }
        
        
        /** Type3//Original Voicetype 13
        Who has the say around here? */
        class UGVL_Conversation_Generic_AboutCamp_OC_GRD_whohasthesay_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_whohasthesay_Reply1;
            default ExampleText = "I have the say around here. And I say: be careful what you say, lad!";
        }
        
        
        /** Type2//Original Voicetype 7
        1. Who calls the shots around here? */
        class UGVL_Conversation_Generic_AboutCamp_OC_GRD_Whostheboss_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_Whostheboss_Reply1;
            default ExampleText = "Thorus. He keeps an eye on everythin'. Diego's his right-hand man.";
        }
        
        
        /** Type2//Original Voicetype 7
        2. Who calls the shots around here? */
        class UGVL_Conversation_Generic_AboutCamp_OC_GRD_Whostheboss_Reply2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_GRD_Whostheboss_Reply2;
            default ExampleText = "If you want in, they're the ones to talk to.";
        }
        
        
        /** Type 1
        Answer to "Hi!" */
        class UGVL_Conversation_Generic_AboutCamp_OC_STT_Hi_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_STT_Hi_Reply1;
            default ExampleText = "Hi!";
        }
        
        
        /** Type 1
        Answer to "I wanna be a Shadow.!" */
        class UGVL_Conversation_Generic_AboutCamp_OC_STT_Hi_Reply2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_STT_Hi_Reply2;
            default ExampleText = "Oh yeah? You had a word with Diego yet?";
        }
        
        
        /** Type 1
        Answer to "I meet Diego" */
        class UGVL_Conversation_Generic_AboutCamp_OC_STT_Hi_Reply3 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_STT_Hi_Reply3;
            default ExampleText = "Yeah, I did.";
        }
        
        
        /** Type 1
        1 Answer to: What can you tell me about the Camp? */
        class UGVL_Conversation_Generic_AboutCamp_OC_STT_Hi_Reply4 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_STT_Hi_Reply4;
            default ExampleText = "1.What can you tell me about the Camp?";
        }
        
        
        /** Type 1
        2 Answer to: What can you tell me about the Camp? */
        class UGVL_Conversation_Generic_AboutCamp_OC_STT_Hi_Reply5 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_STT_Hi_Reply5;
            default ExampleText = "2.What can you tell me about the Camp?";
        }
        
        
        /** Type 1
        Answer to: Who should I know around here? */
        class UGVL_Conversation_Generic_AboutCamp_OC_STT_Hi_Reply6 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_STT_Hi_Reply6;
            default ExampleText = "Who should I know around here?";
        }
        
        
        /** Type 1
        Answer to "I didnt' meet Diego" */
        class UGVL_Conversation_Generic_AboutCamp_OC_STT_Hi_Reply7 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_STT_Hi_Reply7;
            default ExampleText = "Not yet";
        }
        
        
        /** Type 2
        Answer to: So, how are things? */
        class UGVL_Conversation_Generic_AboutCamp_OC_STT_HowareSTT_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_STT_HowareSTT_Reply1;
            default ExampleText = "What exactly do you want from me?";
        }
        
        
        /** Type 2
        Answer to: I just wanna know what's going on around the Camp. */
        class UGVL_Conversation_Generic_AboutCamp_OC_STT_HowareSTT_Reply2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_STT_HowareSTT_Reply2;
            default ExampleText = "Best ask the diggers, then. Ain't like they've got much else to do all day.";
        }
        
        
        /** Type 2
        1st answer to I'd like to join the Shadows. */
        class UGVL_Conversation_Generic_AboutCamp_OC_STT_HowareSTT_Reply3 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_STT_HowareSTT_Reply3;
            default ExampleText = "That so? Then you should know Gomez doesn't take kindly to failure. If you wanna be one of us, you gotta go through hell and high water for him!";
        }
        
        
        /** Type 2
        2ndt answer to I'd like to join the Shadows. */
        class UGVL_Conversation_Generic_AboutCamp_OC_STT_HowareSTT_Reply4 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_STT_HowareSTT_Reply4;
            default ExampleText = "Only half of those that tried made it in.";
        }
        
        
        /** Type 2
        Answer to "What happened to the rest?" */
        class UGVL_Conversation_Generic_AboutCamp_OC_STT_HowareSTT_Reply5 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_STT_HowareSTT_Reply5;
            default ExampleText = "They're probably sittin' at the New Camp, nibblin' on rice. Heh heh heh.";
        }
        
        
        class UGVL_Conversation_Generic_AboutCamp_OC_STT_OCSTTBye_Ambient1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_STT_OCSTTBye_Ambient1;
            default ExampleText = "Maybe.";
        }
        
        
        class UGVL_Conversation_Generic_AboutCamp_OC_STT_OCSTTGuy_Ambient1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_STT_OCSTTGuy_Ambient1;
            default ExampleText = "Ain't you that guy?";
        }
        
        
        class UGVL_Conversation_Generic_AboutCamp_OC_STT_OCSTTNerve_Ambient1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_STT_OCSTTNerve_Ambient1;
            default ExampleText = "You got some nerve showin' up here ...";
        }
        
        
        class UGVL_Conversation_Generic_AboutCamp_OC_STT_OCSTTWait_Ambient1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_STT_OCSTTWait_Ambient1;
            default ExampleText = "Wait, who- Oh, right. You're that freshie. Gotta say, didn't think you had it in you.";
        }
        
        
        class UGVL_Conversation_Generic_AboutCamp_OC_STT_OCSTTWelcome_Ambient1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_STT_OCSTTWelcome_Ambient1;
            default ExampleText = "You - oh, godsdammit. I bet a mate ten nuggs Gomez would kill you. Welcome to the Shadows, I guess ...";
        }
        
        
        class UGVL_Conversation_Generic_AboutCamp_OC_STT_OCSTTYou_Ambient1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_STT_OCSTTYou_Ambient1;
            default ExampleText = "Wait ... you?";
        }
        
        
        /** Type 2
        Answer to "Who runs this place?" */
        class UGVL_Conversation_Generic_AboutCamp_OC_STT_Whoruns_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_STT_Whoruns_Reply1;
            default ExampleText = "Diego's sort o' the leader of the Shadows. But Thorus is the one who decides who gets to see Gomez.";
        }
        
        
        /** Type4
        All good? */
        class UGVL_Conversation_Generic_AboutCamp_OC_VLK_Allgood_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_Allgood_Reply1;
            default ExampleText = "Just as good as it was ten years ago. Ain't much changed since then.";
        }
        
        
        /** Type 3
        1.How are things? */
        class UGVL_Conversation_Generic_AboutCamp_OC_VLK_Howarethingshe_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_Howarethingshe_Reply1;
            default ExampleText = "You're gonna find out soon enough. Always keep your guard up. Especially at night.";
        }
        
        
        /** Type 3
        2.How are things? */
        class UGVL_Conversation_Generic_AboutCamp_OC_VLK_Howarethingshe_Reply2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_Howarethingshe_Reply2;
            default ExampleText = "I ain't had a proper sleep in days. And here in the Colony, not sleepin' means servin' double time.";
        }
        
        
        /** Type 1
        Answer 1 to :How can I get accepted into the Camp? */
        class UGVL_Conversation_Generic_AboutCamp_OC_VLK_HowcanIget_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_HowcanIget_Reply1;
            default ExampleText = "Simple. You grab a pickaxe and start diggin'. About half your ore goes on protection money, and the other half just barely keeps you fed.";
        }
        
        
        /** Type 1
        Answer 2 to :How can I get accepted into the Camp? */
        class UGVL_Conversation_Generic_AboutCamp_OC_VLK_HowcanIget_Reply2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_HowcanIget_Reply2;
            default ExampleText = "Gomez charges a bleedin' fortune for his supplies. Still, better than eatin' rice all day like in the New Camp.";
        }
        
        
        /** Type 3
        How can I join this Camp? */
        class UGVL_Conversation_Generic_AboutCamp_OC_VLK_HowCanIJoin_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_HowCanIJoin_Reply1;
            default ExampleText = "Hey, don't ask ME - I'm just a digger. We don't get no say in anything. You wanna talk, go to the warders or the Shadows.";
        }
        
        
        /** Type 1
        Answer to: How's it going? */
        class UGVL_Conversation_Generic_AboutCamp_OC_VLK_Howsitgoinghe_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_Howsitgoinghe_Reply1;
            default ExampleText = "I've been toilin' in the Mine for two weeks straight. All I want is some peace and quiet. So piss off.";
        }
        
        
        /** Type 4
        1.What are the important places here? */
        class UGVL_Conversation_Generic_AboutCamp_OC_VLK_Importantplaces_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_Importantplaces_Reply1;
            default ExampleText = "If you don't fancy breakin' your back workin' in the Mines, best keep around the entrance between the north gate and the castle gate.";
        }
        
        
        /** Type 4
        2.What are the important places here? */
        class UGVL_Conversation_Generic_AboutCamp_OC_VLK_Importantplaces_Reply2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_Importantplaces_Reply2;
            default ExampleText = "If you're lucky, Thorus or Diego might give you somethin' to do - that's your chance to prove yourself. And I bet you could do much worse than bein' one of Gomez's lot.";
        }
        
        
        /** Type 4
        3.What are the important places here? */
        class UGVL_Conversation_Generic_AboutCamp_OC_VLK_Importantplaces_Reply3 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_Importantplaces_Reply3;
            default ExampleText = "Or maybe you're lucky enough to run into a Mage. They're sendin' us on errands sometimes. Always pay well, too.";
        }
        
        
        /** Type 4
        So they leave the castle? When? */
        class UGVL_Conversation_Generic_AboutCamp_OC_VLK_Importantplaces_Reply4 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_Importantplaces_Reply4;
            default ExampleText = "What do I know. Ask the folks that live there.";
        }
        
        
        /** Type 1
        1 Answer to: Is there something more interesting here than a bunch of shacks? */
        class UGVL_Conversation_Generic_AboutCamp_OC_VLK_Issomething_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_Issomething_Reply1;
            default ExampleText = "In the evenings, you can watch the warders knock the daylights outta each other in the Arena.";
        }
        
        
        /** Type 1
        2Answer to: Is there something more interesting here than a bunch of shacks? */
        class UGVL_Conversation_Generic_AboutCamp_OC_VLK_Issomething_Reply2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_Issomething_Reply2;
            default ExampleText = "That alone's worth the entrance fee.";
        }
        
        
        /** Type 4
        1.Is there anyone here I should know? */
        class UGVL_Conversation_Generic_AboutCamp_OC_VLK_Isthereanyone_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_Isthereanyone_Reply1;
            default ExampleText = "As a freshie, best not get on Gravo's bad side. He might be just a digger, but he's got mates all the way up to the ore barons.";
        }
        
        
        /** Type 4
        2.Is there anyone here I should know? */
        class UGVL_Conversation_Generic_AboutCamp_OC_VLK_Isthereanyone_Reply2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_Isthereanyone_Reply2;
            default ExampleText = "If you ever get in trouble with Gomez's lot, he can help buy you out.";
        }
        
        
        /** Type 2
        Answer to: I wanna join you guys. */
        class UGVL_Conversation_Generic_AboutCamp_OC_VLK_Iwannajoin_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_Iwannajoin_Reply1;
            default ExampleText = "You wanna slave away in the mines by choice? Nah, mate. Someone like you - you're gonna live in the castle sooner rather than later.";
        }
        
        
        /** Type 2
        Answer to: I wanna know more about this Camp. */
        class UGVL_Conversation_Generic_AboutCamp_OC_VLK_Iwannaknow_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_Iwannaknow_Reply1;
            default ExampleText = "Then you'd best talk to the Shadows. If anyone can tell you what you wanna know, it's them. But be careful - most of them you can't trust.";
        }
        
        
        class UGVL_Conversation_Generic_AboutCamp_OC_VLK_OCVLKDonttalk_Ambient1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_OCVLKDonttalk_Ambient1;
            default ExampleText = "Just ... just don't talk to me, okay?";
        }
        
        
        class UGVL_Conversation_Generic_AboutCamp_OC_VLK_OCVLKFalling_Ambient1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_OCVLKFalling_Ambient1;
            default ExampleText = "It's all falling apart. I'm telling you.";
        }
        
        
        class UGVL_Conversation_Generic_AboutCamp_OC_VLK_OCVLKMug_Ambient1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_OCVLKMug_Ambient1;
            default ExampleText = "I've seen your mug before ...";
        }
        
        
        class UGVL_Conversation_Generic_AboutCamp_OC_VLK_OCVLKWhat_Ambient1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_OCVLKWhat_Ambient1;
            default ExampleText = "What? What do you want?";
        }
        
        
        /** Type4
        1.What do I have to do to join this Camp? */
        class UGVL_Conversation_Generic_AboutCamp_OC_VLK_WhatdoIhave_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_WhatdoIhave_Reply1;
            default ExampleText = "As a Shadow or a warder, you mean? That ain't gonna be easy, lad. You'll have to work your way up before ol' Thorus even thinks about takin' you to Gomez.";
        }
        
        
        /** Type4
        2.What do I have to do to join this Camp? */
        class UGVL_Conversation_Generic_AboutCamp_OC_VLK_WhatdoIhave_Reply2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_WhatdoIhave_Reply2;
            default ExampleText = "And make sure you stay in folks' good books. No one's gonna take you serious till you're part of a Camp.";
        }
        
        
        /** Type4
        3.What do I have to do to join this Camp? */
        class UGVL_Conversation_Generic_AboutCamp_OC_VLK_WhatdoIhave_Reply3 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_WhatdoIhave_Reply3;
            default ExampleText = "If I were you, I'd ask around with the Shadows. They're your best bet for findin' someone to help you. But it'll cost ya, o' course.";
        }
        
        
        /** Type4
        Thanks. Take care. */
        class UGVL_Conversation_Generic_AboutCamp_OC_VLK_WhatdoIhave_Reply4 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_WhatdoIhave_Reply4;
            default ExampleText = "Keep your chin up, lad.";
        }
        
        
        /** Type 2
        1. Answer to: What's life like here? */
        class UGVL_Conversation_Generic_AboutCamp_OC_VLK_Whatslife_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_Whatslife_Reply1;
            default ExampleText = "If the ore barons sent you, tell them I don't want no trouble. I ain't got nothin' to say to no one.";
        }
        
        
        /** Type 2
        2. Answer to: What's life like here? */
        class UGVL_Conversation_Generic_AboutCamp_OC_VLK_Whatslife_Reply2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_Whatslife_Reply2;
            default ExampleText = "I'm satisfied with what they give us.";
        }
        
        
        /** Type 2
        Answer to No one sent me. I'm new here. */
        class UGVL_Conversation_Generic_AboutCamp_OC_VLK_Whatslife_Reply3 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_Whatslife_Reply3;
            default ExampleText = "A green-blood, huh ... You lot always find trouble fast. Well, you better not drag me into it, all right?";
        }
        
        
        /** Type 3
        1.What are the important places here? */
        class UGVL_Conversation_Generic_AboutCamp_OC_VLK_Whereareplaces_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_Whereareplaces_Reply1;
            default ExampleText = "Well, if you're lookin' to gamble, go to the Arena in the evenings. If you wanna buy stuff, your best bet's the marketplace.";
        }
        
        
        /** Type 3
        2.What are the important places here? */
        class UGVL_Conversation_Generic_AboutCamp_OC_VLK_Whereareplaces_Reply2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_Whereareplaces_Reply2;
            default ExampleText = "You'll find just about anything there. Except maps. If you want maps, you go to Graham. His hut's just across from the castle gate.";
        }
        
        
        /** Type 2
        1. Answer to Who's in charge here? */
        class UGVL_Conversation_Generic_AboutCamp_OC_VLK_Whoischarge_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_Whoischarge_Reply1;
            default ExampleText = "Here in the Outer Ring it's Fletcher, Bloodwyn, and Jackal collectin' the protection money. Each of them runs an area.";
        }
        
        
        /** Type 2
        1. Answer to Who's in charge here? */
        class UGVL_Conversation_Generic_AboutCamp_OC_VLK_Whoischarge_Reply2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_Whoischarge_Reply2;
            default ExampleText = "Stay on their good side and you'll be fine.";
        }
        
        
        /** Type 1
        Answer to: Who runs this place? */
        class UGVL_Conversation_Generic_AboutCamp_OC_VLK_Whorunsthis_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_Whorunsthis_Reply1;
            default ExampleText = "The ore barons. They handle the ore trade with the king. The higher up you are, the more you get.";
        }
        
        
        /** Type 3
        1.Who's the boss here? */
        class UGVL_Conversation_Generic_AboutCamp_OC_VLK_Whostheboss_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_Whostheboss_Reply1;
            default ExampleText = "Gomez. He lives in the castle. But us diggers only ever got to do with his warders.";
        }
        
        
        /** Type 3
        2.Who's the boss here? */
        class UGVL_Conversation_Generic_AboutCamp_OC_VLK_Whostheboss_Reply2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_VLK_Whostheboss_Reply2;
            default ExampleText = "Better they don't notice you at all. Once you stand out, you've got nothin' but trouble.";
        }
        
        
        /** Type 3
        Can you tell me who's in charge here? */
        class UGVL_Conversation_Generic_AboutCamp_OM_GRD_OMGRDCanyou_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_GRD_OMGRDCanyou_Reply1;
            default ExampleText = "Ian and Asghan. If you want somethin', talk to them.";
        }
        
        
        /** Type 3
        Do you know anything about the crawlers? */
        class UGVL_Conversation_Generic_AboutCamp_OM_GRD_OMGRDDoyou_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_GRD_OMGRDDoyou_Reply1;
            default ExampleText = "We oughta wipe the whole lot of them out!";
        }
        
        
        /** Type 1
        How's it going? */
        class UGVL_Conversation_Generic_AboutCamp_OM_GRD_OMGRDHowsit_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_GRD_OMGRDHowsit_Reply1;
            default ExampleText = "I ain't had a proper brawl in ages!";
        }
        
        
        /** Type 3
        Is everything all right? */
        class UGVL_Conversation_Generic_AboutCamp_OM_GRD_OMGRDIsevery_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_GRD_OMGRDIsevery_Reply1;
            default ExampleText = "Get off me back, man!";
        }
        
        
        /** Type 2
        Tell me about the crawlers. */
        class UGVL_Conversation_Generic_AboutCamp_OM_GRD_OMGRDTellme_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_GRD_OMGRDTellme_Reply1;
            default ExampleText = "Those filthy beasts are really givin' us a hard time. Dunno what's more of a pain, them or the diggers.";
        }
        
        
        /** Type 3
        Tell me about the Mine. */
        class UGVL_Conversation_Generic_AboutCamp_OM_GRD_OMGRDTellmine_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_GRD_OMGRDTellmine_Reply1;
            default ExampleText = "The diggers mine the ore, and we keep them safe from the crawlers.";
        }
        
        
        /** Type 1
        What can you tell me about the crawlers? */
        class UGVL_Conversation_Generic_AboutCamp_OM_GRD_OMGRDWhatcan_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_GRD_OMGRDWhatcan_Reply1;
            default ExampleText = "The Brotherhood pays the Old Camp with swampweed - in return, they get to hunt the crawlers down here.";
        }
        
        
        /** Type 2
        What's going on in the Mine? */
        class UGVL_Conversation_Generic_AboutCamp_OM_GRD_OMGRDWhatsgoing_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_GRD_OMGRDWhatsgoing_Reply1;
            default ExampleText = "The diggers mine the ore, and if they ain't, they're gettin' a smack in the gob!";
        }
        
        
        /** Type 1
        What's the deal with the Mine? */
        class UGVL_Conversation_Generic_AboutCamp_OM_GRD_OMGRDWhatsthe_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_GRD_OMGRDWhatsthe_Reply1;
            default ExampleText = "The Mine's the heart of the Old Camp. No mine, no ore. No ore, no goods. Got it?  ";
        }
        
        
        /** Type1 and 2
        What's the word? */
        class UGVL_Conversation_Generic_AboutCamp_OM_GRD_OMGRDWhatword_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_GRD_OMGRDWhatword_Reply1;
            default ExampleText = "Well, what d'you reckon?";
        }
        
        
        /** Type 1
        Who calls the shots around here? */
        class UGVL_Conversation_Generic_AboutCamp_OM_GRD_OMGRDWhocalls_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_GRD_OMGRDWhocalls_Reply1;
            default ExampleText = "That'd be Asghan. But don't go botherin' him, eh? Ian's the one dealin' with blokes like you.";
        }
        
        
        /** Type 2
        Who's got the say in here? */
        class UGVL_Conversation_Generic_AboutCamp_OM_GRD_OMGRDWhosgot_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_GRD_OMGRDWhosgot_Reply1;
            default ExampleText = "Asghan's in charge, Ian handles all the housekeepin' - the ore and diggers, that is.";
        }
        
        
        /** Type4
        What do you know about minecrawlers? */
        class UGVL_Conversation_Generic_AboutCamp_OM_VLK_OMVLKAboutMC_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_VLK_OMVLKAboutMC_Reply1;
            default ExampleText = "If you see one of them crawler scum, whack it between the eyes with your pickaxe. But you have to take good aim, you won't get no second chance.";
        }
        
        
        /** Type4
        1.Tell me about the mine. */
        class UGVL_Conversation_Generic_AboutCamp_OM_VLK_OMVLKAboutMine_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_VLK_OMVLKAboutMine_Reply1;
            default ExampleText = "Pickaxes and sweat. That's what you get in here. You come, you go.";
        }
        
        
        /** Type4
        2.Tell me about the mine. */
        class UGVL_Conversation_Generic_AboutCamp_OM_VLK_OMVLKAboutMine_Reply2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_VLK_OMVLKAboutMine_Reply2;
            default ExampleText = "But, when you're long gone, I'll still be here, hewing the ore from the rock. That's my job, and my life.";
        }
        
        
        /** Type4
        How are you? */
        class UGVL_Conversation_Generic_AboutCamp_OM_VLK_OMVLKHowareyou_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_VLK_OMVLKHowareyou_Reply1;
            default ExampleText = "I've been better.";
        }
        
        
        /** Type 2
        How are you? */
        class UGVL_Conversation_Generic_AboutCamp_OM_VLK_OMVLKHowdigger_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_VLK_OMVLKHowdigger_Reply1;
            default ExampleText = "I have to work. If the guards catch me standing around talking, they'll cut my rations.";
        }
        
        
        /** Type3
        1. How's it going? */
        class UGVL_Conversation_Generic_AboutCamp_OM_VLK_OMVLKHowsit_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_VLK_OMVLKHowsit_Reply1;
            default ExampleText = "Well, my back aches, my arms feel like they're gonna drop off, my tongue's bone dry and I'm dead tired.";
        }
        
        
        /** Type3
        2. How's it going? */
        class UGVL_Conversation_Generic_AboutCamp_OM_VLK_OMVLKHowsit_Reply2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_VLK_OMVLKHowsit_Reply2;
            default ExampleText = "And the constant hammering of the pickaxes is slowly driving me round the bend.";
        }
        
        
        /** Type1
        How's it going? */
        class UGVL_Conversation_Generic_AboutCamp_OM_VLK_OMVLKHowsitgoing_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_VLK_OMVLKHowsitgoing_Reply1;
            default ExampleText = "A lot of work, not much rest. So be quick with your questions. I have work to do.";
        }
        
        
        /** Type1
        1.Tell me about the mine. */
        class UGVL_Conversation_Generic_AboutCamp_OM_VLK_OMVLKTell_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_VLK_OMVLKTell_Reply1;
            default ExampleText = "Mushrooms and herbs grow in caves. That stuff's easy to digest, but it don't fill you up as good as a nice, decent chunk of meat.";
        }
        
        
        /** Type1
        2.Tell me about the mine. */
        class UGVL_Conversation_Generic_AboutCamp_OM_VLK_OMVLKTell_Reply2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_VLK_OMVLKTell_Reply2;
            default ExampleText = "The crawler's don't taste too good either. What a shithole.";
        }
        
        
        /** Type3 
        Tell me about the mine. */
        class UGVL_Conversation_Generic_AboutCamp_OM_VLK_OMVLKTellmeabout_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_VLK_OMVLKTellmeabout_Reply1;
            default ExampleText = "We all have to work hard for weeks on end, we never get to see the light of day. There is no escape. The only way out is death.";
        }
        
        
        /** Type 2
        1.Tell me about the mine. */
        class UGVL_Conversation_Generic_AboutCamp_OM_VLK_OMVLKTellmecaves_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_VLK_OMVLKTellmecaves_Reply1;
            default ExampleText = "There's a lot of caves where there's still some ore left. But the crawlers just make it impossible to work in them.";
        }
        
        
        /** Type 2
        2.Tell me about the mine. */
        class UGVL_Conversation_Generic_AboutCamp_OM_VLK_OMVLKTellmecaves_Reply2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_VLK_OMVLKTellmecaves_Reply2;
            default ExampleText = "Too many attacks, too many losses.";
        }
        
        
        class UGVL_Conversation_Generic_AboutCamp_OM_VLK_OMVLKTemplar_Ambient1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_VLK_OMVLKTemplar_Ambient1;
            default ExampleText = "What are you doing down here? You don't look like one of 'em templars...";
        }
        
        
        /** Type 2
        1.What do you know about minecrawlers? */
        class UGVL_Conversation_Generic_AboutCamp_OM_VLK_OMVLKWhatdo_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_VLK_OMVLKWhatdo_Reply1;
            default ExampleText = "We had to close down the big pit at the bottom. It's overrun with minecrawlers.";
        }
        
        
        /** Type 2
        2.What do you know about minecrawlers? */
        class UGVL_Conversation_Generic_AboutCamp_OM_VLK_OMVLKWhatdo_Reply2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_VLK_OMVLKWhatdo_Reply2;
            default ExampleText = "There are minecrawlers all over the place. Can't you hear 'em? I sure can!";
        }
        
        
        /** Type3
        1.What do you know about minecrawlers? */
        class UGVL_Conversation_Generic_AboutCamp_OM_VLK_OMVLKWhatdoyou_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_VLK_OMVLKWhatdoyou_Reply1;
            default ExampleText = "You mean what's the best way of dealin' with crawlers? Run. Run as fast as your legs will carry you.";
        }
        
        
        /** Type3
        2.What do you know about minecrawlers? */
        class UGVL_Conversation_Generic_AboutCamp_OM_VLK_OMVLKWhatdoyou_Reply2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_VLK_OMVLKWhatdoyou_Reply2;
            default ExampleText = "If you go missing, it's too late. Not that anyone's likely to miss you.";
        }
        
        
        /** Type1
        What do you know about minecrawlers? */
        class UGVL_Conversation_Generic_AboutCamp_OM_VLK_OMVLKWhatmine_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_VLK_OMVLKWhatmine_Reply1;
            default ExampleText = "The templars made a deal with Gomez. They kill the crawlers, they get to keep the beasts' mandibles.";
        }
        
        
        /** Type3
        Who calls the shots around here? */
        class UGVL_Conversation_Generic_AboutCamp_OM_VLK_OMVLKWhocalls_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_VLK_OMVLKWhocalls_Reply1;
            default ExampleText = "Ian's the boss of the mine. Asghan's in charge of the guards.";
        }
        
        
        /** Type1
        Who's in charge here? */
        class UGVL_Conversation_Generic_AboutCamp_OM_VLK_OMVLKWhocharge_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_VLK_OMVLKWhocharge_Reply1;
            default ExampleText = "Ian's the boss of the mine. He organizes the workforce and the exchange of goods with the Camp. If you want anything, you'd better talk to him.";
        }
        
        
        /** Type 2
        Who has the say round here?
         */
        class UGVL_Conversation_Generic_AboutCamp_OM_VLK_OMVLKWhohas_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_VLK_OMVLKWhohas_Reply1;
            default ExampleText = "Viper's the smelter. He knows all about the oven, he has a body like iron. He don't mind the heat. He spends all day melting the ore.";
        }
        
        
        /** Type4
        Who's in charge here? */
        class UGVL_Conversation_Generic_AboutCamp_OM_VLK_OMVLKWhorules_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_VLK_OMVLKWhorules_Reply1;
            default ExampleText = "Santino and Alberto swap goods for the ore that we dig. They give us our daily rations.";
        }
        
        
        class UGVL_Conversation_Generic_AboutCamp_OM_VLK_OMVLKWrong_Ambient1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_VLK_OMVLKWrong_Ambient1;
            default ExampleText = "What is it? I ain't done nothin' wrong...";
        }
        
        
        class UGVL_Conversation_Generic_AboutCamp_OM_VLK_OMVLKYOU_Ambient1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_VLK_OMVLKYOU_Ambient1;
            default ExampleText = "What the - What are YOU doing down here?";
        }
        
        
        class UGVL_Conversation_OW_OWORCAxe_Ambient1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_OW_OWORCAxe_Ambient1;
            default GlobalCooldownSeconds = 60.0f;
            default ExampleText = "One more step, and you'll feel my axe.";
        }
        
        
        class UGVL_Conversation_OW_OWORCDontspeak_Ambient1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_OW_OWORCDontspeak_Ambient1;
            default GlobalCooldownSeconds = 60.0f;
            default ExampleText = "Don't speak to me.";
        }
        
        
        class UGVL_Conversation_OW_OWORCDontyou_Ambient1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_OW_OWORCDontyou_Ambient1;
            default GlobalCooldownSeconds = 60.0f;
            default ExampleText = "(spits) I don't speak to you.";
        }
        
        
        class UGVL_Conversation_OW_OWORCGrowl_Ambient1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_OW_OWORCGrowl_Ambient1;
            default GlobalCooldownSeconds = 60.0f;
            default ExampleText = "(low growl)";
        }
        
        
        class UGVL_Conversation_OW_OWORCMorra_Ambient1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_OW_OWORCMorra_Ambient1;
            default GlobalCooldownSeconds = 60.0f;
            default ExampleText = "We're watching you, morra.";
        }
        
        
        class UGVL_Conversation_OW_OWORCTricked_Ambient1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_OW_OWORCTricked_Ambient1;
            default GlobalCooldownSeconds = 60.0f;
            default ExampleText = "You tricked Grazrak. He would not lose to a brittle-bone like you.";
        }
        
        
        class UGVL_Conversation_OW_OWORCWhat_Ambient1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_OW_OWORCWhat_Ambient1;
            default GlobalCooldownSeconds = 60.0f;
            default ExampleText = "What?";
        }
        
        
        class UGVL_Conversation_Generic_AboutCamp_SC_NOV_generic_aboutcamp_sc_nov_212579 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_generic_aboutcamp_sc_nov_212579;
        }
        
        
        /** Farewell upon the guide's arrival at their destination. */
        class UGVL_Conversation_Generic_AboutCamp_SC_NOV_Info_SCNOVEndGuide_WeArrived : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_Info_SCNOVEndGuide_WeArrived;
            default ExampleText = "We have arrived. May the Sleeper guide you.";
        }
        
        
        /** Answer from a novice when the nameless hero ask for a guide. */
        class UGVL_Conversation_Generic_AboutCamp_SC_NOV_Info_SCNOVGuide_FollowMe : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_Info_SCNOVGuide_FollowMe;
            default ExampleText = "Follow me.";
        }
        
        
        class UGVL_Conversation_Generic_AboutCamp_SC_NOV_SCNOVCaine_Ambient1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_SCNOVCaine_Ambient1;
            default ExampleText = "Wait. You're that man who found Caine, aren't you? I can't believe he's dead ...";
        }
        
        
        /** Type1
        1. What can you tell me about this camp? */
        class UGVL_Conversation_Generic_AboutCamp_SC_NOV_SCNOVCantell_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_SCNOVCantell_Reply1;
            default ExampleText = "It's the best place to be in the entire goddam colony.";
        }
        
        
        /** Type1
        2. What can you tell me about this camp? */
        class UGVL_Conversation_Generic_AboutCamp_SC_NOV_SCNOVCantell_Reply2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_SCNOVCantell_Reply2;
            default ExampleText = "Even if you don't believe in the Sleeper's teachings, at least you get your daily ration of food and swampweed. All you have to do is talk to Fortuno.";
        }
        
        
        /** Type1
        Where can I find him? */
        class UGVL_Conversation_Generic_AboutCamp_SC_NOV_SCNOVCantell_Reply3 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_SCNOVCantell_Reply3;
            default ExampleText = "Down at Cor Kalom's lab, near the big temple courtyard.";
        }
        
        
        class UGVL_Conversation_Generic_AboutCamp_SC_NOV_SCNOVDisturb_Ambient1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_SCNOVDisturb_Ambient1;
            default ExampleText = "Don't disturb me, stranger. I'm searching for the Sleeper. The vision was clear.";
        }
        
        
        class UGVL_Conversation_Generic_AboutCamp_SC_NOV_SCNOVDonttalk_Ambient1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_SCNOVDonttalk_Ambient1;
            default ExampleText = "Don't talk to me.";
        }
        
        
        /** Type3
        How are you? */
        class UGVL_Conversation_Generic_AboutCamp_SC_NOV_SCNOVHowareyou_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_SCNOVHowareyou_Reply1;
            default ExampleText = "I'm real high, man!";
        }
        
        
        /** Type1
        1.How can I join this camp? */
        class UGVL_Conversation_Generic_AboutCamp_SC_NOV_SCNOVHowcancamp_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_SCNOVHowcancamp_Reply1;
            default ExampleText = "There's nothing simpler. Just talk to a couple of the junior Gurus. They'll help you.";
        }
        
        
        /** Type1
        2.How can I join this camp? */
        class UGVL_Conversation_Generic_AboutCamp_SC_NOV_SCNOVHowcancamp_Reply2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_SCNOVHowcancamp_Reply2;
            default ExampleText = "You'll come to like it here, you'll see.";
        }
        
        
        /** Type3
        1. How can I join this camp? */
        class UGVL_Conversation_Generic_AboutCamp_SC_NOV_SCNOVHowcani_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_SCNOVHowcani_Reply1;
            default ExampleText = "It's simple. Just let go, man.";
        }
        
        
        /** Type3
        2. How can I join this camp? */
        class UGVL_Conversation_Generic_AboutCamp_SC_NOV_SCNOVHowcani_Reply2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_SCNOVHowcani_Reply2;
            default ExampleText = "Talk to the Gurus, they will guide you!";
        }
        
        
        /** Type2
        How's it going? */
        class UGVL_Conversation_Generic_AboutCamp_SC_NOV_SCNOVHowsitgo_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_SCNOVHowsitgo_Reply1;
            default ExampleText = "I don't have much time. I have jobs to perform.";
        }
        
        
        /** Type1
        How are things? */
        class UGVL_Conversation_Generic_AboutCamp_SC_NOV_SCNOVHowthings_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_SCNOVHowthings_Reply1;
            default ExampleText = "I can't complain. Say, are you new around here?";
        }
        
        
        /** Type3
        1.Is there anywhere important here where I should go? */
        class UGVL_Conversation_Generic_AboutCamp_SC_NOV_SCNOVIsthere_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_SCNOVIsthere_Reply1;
            default ExampleText = "There's Fortuno. He gives free swampweed to all the followers of the sect.";
        }
        
        
        /** Type3
        2.Is there anywhere important here where I should go? */
        class UGVL_Conversation_Generic_AboutCamp_SC_NOV_SCNOVIsthere_Reply2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_SCNOVIsthere_Reply2;
            default ExampleText = "You'll find him under Cor Kalom's alchemy lab.";
        }
        
        
        /** Type 2
        1.I want to join you. */
        class UGVL_Conversation_Generic_AboutCamp_SC_NOV_SCNOVIwantto_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_SCNOVIwantto_Reply1;
            default ExampleText = "You mean you've decided to serve the Sleeper? A path of happiness and good fortune lies ahead of you.";
        }
        
        
        /** Type 2
        2.I want to join you. */
        class UGVL_Conversation_Generic_AboutCamp_SC_NOV_SCNOVIwantto_Reply2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_SCNOVIwantto_Reply2;
            default ExampleText = "Go and talk to Cor Kalom. He'll decide what job you're most suited for.";
        }
        
        
        class UGVL_Conversation_Generic_AboutCamp_SC_NOV_SCNOVNewbrother_Ambient1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_SCNOVNewbrother_Ambient1;
            default ExampleText = "A new brother. Welcome! I'm glad the Sleeper found you.";
        }
        
        
        class UGVL_Conversation_Generic_AboutCamp_SC_NOV_SCNOVTattoos_Ambient1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_SCNOVTattoos_Ambient1;
            default ExampleText = "Brother. When are you getting your tattoos? ";
        }
        
        
        class UGVL_Conversation_Generic_AboutCamp_SC_NOV_SCNOVTimesmoke_Ambient1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_SCNOVTimesmoke_Ambient1;
            default ExampleText = "Orcs, Y'Berion, Kalom ... I can't keep up with all this. Time for a smoke.";
        }
        
        
        class UGVL_Conversation_Generic_AboutCamp_SC_NOV_SCNOVWhatdoyou_Ambient1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_SCNOVWhatdoyou_Ambient1;
            default ExampleText = "What do you want? You've done enough. ";
        }
        
        
        /** Type2
        1.What should I know about this place? */
        class UGVL_Conversation_Generic_AboutCamp_SC_NOV_SCNOVWhatshould_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_SCNOVWhatshould_Reply1;
            default ExampleText = "It is a place of faith, brother. We do not have much, but what we do have we share with all who are willing to listen to the Sleeper's teachings.";
        }
        
        
        /** Type2
        1.What should I know about this place? */
        class UGVL_Conversation_Generic_AboutCamp_SC_NOV_SCNOVWhatshould_Reply2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_SCNOVWhatshould_Reply2;
            default ExampleText = "Speak to one of the Gurus, and your soul will be enriched.";
        }
        
        
        /** Type1
        Who calls the shots around here? */
        class UGVL_Conversation_Generic_AboutCamp_SC_NOV_SCNOVWhocalls_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_SCNOVWhocalls_Reply1;
            default ExampleText = "The Gurus have everything under control. But if you don't draw attention to yourself, they'll leave you alone.";
        }
        
        
        /** Type2
        1.Who are your leaders? */
        class UGVL_Conversation_Generic_AboutCamp_SC_NOV_SCNOVWholeader_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_SCNOVWholeader_Reply1;
            default ExampleText = "Y'Berion, Cor Kalom and Cor Angar are our mentors.";
        }
        
        
        /** Type2
        2.Who are your leaders? */
        class UGVL_Conversation_Generic_AboutCamp_SC_NOV_SCNOVWholeader_Reply2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_SCNOVWholeader_Reply2;
            default ExampleText = "They are our link to the Sleeper. During the invocations, they are the ones who make contact with the Sleeper.";
        }
        
        
        /** Type3
        1.Who's the boss round here? */
        class UGVL_Conversation_Generic_AboutCamp_SC_NOV_SCNOVWhostheboss_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_SCNOVWhostheboss_Reply1;
            default ExampleText = "Y'Berion! The Sleeper be praised! He brought us to this glorious place.";
        }
        
        
        /** Type3
        2.Who's the boss round here? */
        class UGVL_Conversation_Generic_AboutCamp_SC_NOV_SCNOVWhostheboss_Reply2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_NOV_SCNOVWhostheboss_Reply2;
            default ExampleText = "All this was created through his visions.";
        }
        
        
        /** Type1
        1.What can you tell me about your Camp? */
        class UGVL_Conversation_Generic_AboutCamp_SC_TPL_SCTPLEAboutcamp_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_TPL_SCTPLEAboutcamp_Reply1;
            default ExampleText = "A green-blood like you may go almost anywhere. But as an infidel, you are not permitted to enter the Temple of the Sleeper.";
        }
        
        
        /** Type1
        2.What can you tell me about your Camp? */
        class UGVL_Conversation_Generic_AboutCamp_SC_TPL_SCTPLEAboutcamp_Reply2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_TPL_SCTPLEAboutcamp_Reply2;
            default ExampleText = "So stay where you're allowed to. And do not disturb our masters during their meditations.";
        }
        
        
        /** Type2
        1. I want to become a templar - just like you. */
        class UGVL_Conversation_Generic_AboutCamp_SC_TPL_SCTPLEBecometpl_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_TPL_SCTPLEBecometpl_Reply1;
            default ExampleText = "Do you have any idea how many sacrifices I've had to make to serve as a temple guard for the Chosen of the Sleeper?";
        }
        
        
        /** Type2
        2. I want to become a templar - just like you. */
        class UGVL_Conversation_Generic_AboutCamp_SC_TPL_SCTPLEBecometpl_Reply2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_TPL_SCTPLEBecometpl_Reply2;
            default ExampleText = "And you think you can just walk in here and get the highest of honors handed to you on a silver platter.";
        }
        
        
        /** Type2
        3. I want to become a templar - just like you. */
        class UGVL_Conversation_Generic_AboutCamp_SC_TPL_SCTPLEBecometpl_Reply3 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_TPL_SCTPLEBecometpl_Reply3;
            default ExampleText = "Before you even consider it, you should familiarize yourself with the teachings of the Sleeper.";
        }
        
        
        /** Type2
        4. I want to become a templar - just like you. */
        class UGVL_Conversation_Generic_AboutCamp_SC_TPL_SCTPLEBecometpl_Reply4 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_TPL_SCTPLEBecometpl_Reply4;
            default ExampleText = "It'll take some time, and it'll probably knock your fancy ideas out of your mind.";
        }
        
        
        /** Type1
        1.Could you use another capable man? */
        class UGVL_Conversation_Generic_AboutCamp_SC_TPL_SCTPLECouldyou_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_TPL_SCTPLECouldyou_Reply1;
            default ExampleText = "We're always looking for capable men. But you'll have to work hard. Only an experienced novice may become a templar.";
        }
        
        
        /** Type1
        2.Could you use another capable man? */
        class UGVL_Conversation_Generic_AboutCamp_SC_TPL_SCTPLECouldyou_Reply2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_TPL_SCTPLECouldyou_Reply2;
            default ExampleText = "After all, it's the highest honor for a disciple of the Brotherhood of the Sleeper.";
        }
        
        
        /** Type2
        How's it going? */
        class UGVL_Conversation_Generic_AboutCamp_SC_TPL_SCTPLEHowisgoing_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_TPL_SCTPLEHowisgoing_Reply1;
            default ExampleText = "Ever since I've become a Chosen Protector of the Faith, I've been feeling better than ever before.";
        }
        
        
        /** Type2
        Sounds meaningful ... */
        class UGVL_Conversation_Generic_AboutCamp_SC_TPL_SCTPLEHowisgoing_Reply2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_TPL_SCTPLEHowisgoing_Reply2;
            default ExampleText = "You're an infidel. You wouldn't understand.";
        }
        
        
        /** Type2
        I'd like to take a look around inside the Sleeper Temple some time ... */
        class UGVL_Conversation_Generic_AboutCamp_SC_TPL_SCTPLETakealook_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_TPL_SCTPLETakealook_Reply1;
            default ExampleText = "Unthinkable! An infidel in the Temple! Until you've placed yourself in the service of the Sleeper, you will be denied entry!";
        }
        
        
        /** Type1
        1.Can you tell me who's in charge here? */
        class UGVL_Conversation_Generic_AboutCamp_SC_TPL_SCTPLETellme_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_TPL_SCTPLETellme_Reply1;
            default ExampleText = "We do everything the gurus tell us. It is our duty to serve them.";
        }
        
        
        /** Type1
        2.Who are your gurus? */
        class UGVL_Conversation_Generic_AboutCamp_SC_TPL_SCTPLETellme_Reply2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_TPL_SCTPLETellme_Reply2;
            default ExampleText = "Y'Berion the Enlightened is the head guru. Right after are Cor Kalom, Cor Angar, and a few others.";
        }
        
        
        /** Type1
        1.Everything all right with you? */
        class UGVL_Conversation_Generic_AboutCamp_SC_TPL_SCTPLEverything_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_TPL_SCTPLEverything_Reply1;
            default ExampleText = "I'm warning you. Show some respect. You're talking to a Chosen Protector of the Prophets.";
        }
        
        
        /** Type 2
        Who's in charge here? */
        class UGVL_Conversation_Generic_AboutCamp_SC_TPL_SCTPLEWhocharge_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_TPL_SCTPLEWhocharge_Reply1;
            default ExampleText = "Our gurus are the Chosen Ones of the Sleeper! The Sleeper determines our fate, and the gurus reveal it to us.";
        }
        
        
        class UGVL_Conversation_Generic_AboutCamp_SC_TPL_SCTPLInfidel_Ambient1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_TPL_SCTPLInfidel_Ambient1;
            default ExampleText = "Move along, infidel.";
        }
        
        
        class UGVL_Conversation_Generic_AboutCamp_SC_TPL_SCTPLNevercome_Ambient1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_TPL_SCTPLNevercome_Ambient1;
            default ExampleText = "It'd been better had you never come along ...";
        }
        
        
        class UGVL_Conversation_Generic_AboutCamp_SC_TPL_SCTPLSleeper_Ambient1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_TPL_SCTPLSleeper_Ambient1;
            default ExampleText = "The Sleeper smiles upon you, stranger. Well done.";
        }
        
        
        class UGVL_Conversation_Generic_FindNPC_FindCorAngar_LocationCorAngar : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_FindNPC_FindCorAngar_LocationCorAngar;
            default ExampleText = "The templars' training ground is on the second level. He's usually there during the day.";
        }
        
        
        class UGVL_Conversation_Generic_FindNPC_FindCorKalom_LocationCorKalom : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_FindNPC_FindCorKalom_LocationCorKalom;
            default ExampleText = "The alchemy lab's on the second level, close to the temple hill. He works there day and night.";
        }
        
        
        class UGVL_Conversation_Generic_FindNPC_FindDiego_LocationDiego : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_FindNPC_FindDiego_LocationDiego;
            default ExampleText = "During the day he's usually at the castle entrance with Thorus.";
        }
        
        
        class UGVL_Conversation_Generic_FindNPC_FindGorn_LocationGorn : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_FindNPC_FindGorn_LocationGorn;
            default ExampleText = "His hut is in the big cave, close at the entrance on the right side.";
        }
        
        
        class UGVL_Conversation_Generic_FindNPC_FindLares_LocationLares : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_FindNPC_FindLares_LocationLares;
            default ExampleText = "In the cave at the far back left. You can't miss it, once his guys stop you, you're in the right place.";
        }
        
        
        class UGVL_Conversation_Generic_FindNPC_FindLee_LocationLee : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_FindNPC_FindLee_LocationLee;
            default ExampleText = "Go into the big cave, keep to your right and go right up to the top.";
        }
        
        
        class UGVL_Conversation_Generic_FindNPC_FindNCMage_LocationNCMage : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_FindNPC_FindNCMage_LocationNCMage;
            default ExampleText = "They've made their home in the back of the cave, continuing their research protected by the mercanaries.";
        }
        
        
        class UGVL_Conversation_Generic_FindNPC_FindThorus_LocationThorus : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_FindNPC_FindThorus_LocationThorus;
            default ExampleText = "He usually stands at the castle entrance.";
        }
        
        
        class UGVL_Conversation_Generic_FindNPC_FindYBerion_LocationYberion : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_FindNPC_FindYBerion_LocationYberion;
            default ExampleText = "The Enlightened One lives in seclusion under cover of the temple hill. He only comes out on special occasions.";
        }
        
        
        class UGVL_Conversation_Quest_QuestDreamLand_Reply1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Quest_QuestDreamLand_Reply1;
            default ExampleText = "Ever since Cor Kalom left with his followers, it's been like a whole new camp.";
        }
        
        
        class UGVL_Conversation_Quest_QuestDreamLand_Reply2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Quest_QuestDreamLand_Reply2;
            default ExampleText = "No more madness, no more tension. Just peace. It's a good place to live now.";
        }
        
        
        class UGVL_Conversation_Quest_OCRankUp_Answer11 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer11;
            default ExampleText = "I've already done me shift for the day. Sorry, that ain't how it works. ";
        }
        
        
        class UGVL_Conversation_Quest_OCRankUp_Answer12 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer12;
            default ExampleText = "I've been toilin' meself to the bone and ain't even got enough nuggets for a beer.";
        }
        
        
        class UGVL_Conversation_Quest_OCRankUp_Answer13 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer13;
            default ExampleText = "Then how am I gonna carry that shipment, all beaten up and bruised?";
        }
        
        
        class UGVL_Conversation_Quest_OCRankUp_Answer14 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer14;
            default ExampleText = "Sorry, mate. I know me place, but I ain't your dog. ";
        }
        
        
        class UGVL_Conversation_Quest_OCRankUp_Answer15 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer15;
            default ExampleText = "Hmm ... enough for a few beer. All right, fuck it. I'm comin'. ";
        }
        
        
        class UGVL_Conversation_Quest_OCRankUp_Answer16 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer16;
            default ExampleText = "Lemme see ... hm, all right. Guess that'll do. ";
        }
        
        
        class UGVL_Conversation_Quest_OCRankUp_Answer17 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer17;
            default ExampleText = "Lead the way. ";
        }
        
        
        class UGVL_Conversation_Quest_OCRankUp_Answer18 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer18;
            default ExampleText = "Eh? That so?";
        }
        
        
        class UGVL_Conversation_Quest_OCRankUp_Answer19 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer19;
            default ExampleText = "I don't trust easy, but fine. You better not be pullin' my leg, mate.";
        }
        
        
        class UGVL_Conversation_Quest_OCRankUp_Answer21 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer21;
            default ExampleText = "So ... ?";
        }
        
        
        class UGVL_Conversation_Quest_OCRankUp_Answer22 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer22;
            default ExampleText = "Please do. ";
        }
        
        
        class UGVL_Conversation_Quest_OCRankUp_Answer23 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer23;
            default ExampleText = "Is that so?";
        }
        
        
        class UGVL_Conversation_Quest_OCRankUp_Answer24 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer24;
            default ExampleText = "You- I didn't!";
        }
        
        
        class UGVL_Conversation_Quest_OCRankUp_Answer25 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer25;
            default ExampleText = "... Fine. ";
        }
        
        
        class UGVL_Conversation_Quest_OCRankUp_Answer26 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer26;
            default ExampleText = "Bloody cutthroat. You'll fit right in with the lot. Lead the way";
        }
        
        
        class UGVL_Conversation_Quest_OCRankUp_Answer27 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer27;
            default ExampleText = "You ... you're bluffin', you are.";
        }
        
        
        class UGVL_Conversation_Quest_OCRankUp_Answer28 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer28;
            default ExampleText = "Oh, come on. Flattery? You tryin' to woo me, or what?";
        }
        
        
        class UGVL_Conversation_Quest_OCRankUp_Answer31 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer31;
            default ExampleText = "Why me, though? I ain't no carrier!";
        }
        
        
        class UGVL_Conversation_Quest_OCRankUp_Answer32 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer32;
            default ExampleText = "Ha-ha. ";
        }
        
        
        class UGVL_Conversation_Quest_OCRankUp_Answer33 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer33;
            default ExampleText = "... You'd do that? ";
        }
        
        
        class UGVL_Conversation_Quest_OCRankUp_Answer34 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer34;
            default ExampleText = "Mmm ... all right, why the hell not. Lead the way. This better be worth it. ";
        }
        
        
        class UGVL_Conversation_Quest_OCRankUp_Answer35 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer35;
            default ExampleText = "Sure, you could do that. Wouldn't be the first time. ";
        }
        
        
        class UGVL_Conversation_Quest_OCRankUp_Answer36 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer36;
            default ExampleText = "There's rules, man. I toil me hands bloody every day to scrape up riches for the ore barons. ";
        }
        
        
        class UGVL_Conversation_Quest_OCRankUp_Answer37 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer37;
            default ExampleText = "There's got to be a limit. ";
        }
        
        
        class UGVL_Conversation_Quest_OCRankUp_Answer41 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer41;
            default ExampleText = "I'd love to join you, but I can't. Me adventurin' days are over. ";
        }
        
        
        class UGVL_Conversation_Quest_OCRankUp_Answer42 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer42;
            default ExampleText = "I got near eaten by a crawler the other day. The lads stitched me up, sent me hobblin' back to the Camp, and if that weren't bad enough, fuckin' wolves went and attacked me on the way!";
        }
        
        
        class UGVL_Conversation_Quest_OCRankUp_Answer43 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer43;
            default ExampleText = "So they had to stitch me up AGAIN at the Camp.";
        }
        
        
        class UGVL_Conversation_Quest_OCRankUp_Answer44 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer44;
            default ExampleText = "Hang on, I was told I get to rest for some time. And that time ain't up yet.";
        }
        
        
        class UGVL_Conversation_Quest_OCRankUp_Answer45 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Answer45;
            default ExampleText = "It'll be a good while before I'm swingin' a pick again. Gotta find someone else for that job. ";
        }
        
        
        class UGVL_Conversation_Quest_OCRankUp_Intro : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Intro;
            default ExampleText = "What do you need?";
        }
        
        
        class UGVL_Conversation_Quest_OCRankUp_Outro : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Quest_OCRankUp_Outro;
            default ExampleText = "I don't care. Sorry, I'm not going anywhere.";
        }
        
        
        /** The hero cancel the payment. */
        class UGVL_Conversation_Generic_PayFine_generic_payfine_BadResolution : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_PayFine_generic_payfine_BadResolution;
            default ExampleText = "We'll have to teach you a lesson.";
        }
        
        
        /** The hero said he is going to pay but dont have enough money */
        class UGVL_Conversation_Generic_PayFine_generic_payfine_FoolResolution1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_PayFine_generic_payfine_FoolResolution1;
            default ExampleText = "Don't try to fool me! You'll see!";
        }
        
        
        /** The hero pays the fine */
        class UGVL_Conversation_Generic_PayFine_generic_payfine_GoodResolution1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_Generic_PayFine_generic_payfine_GoodResolution1;
            default ExampleText = "You're welcome back, but don't go back to your old ways.";
        }
        
        
        class UGVL_Conversation_NOV_SleeperAfterHarpies_Ambient1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_NOV_SleeperAfterHarpies_Ambient1;
            default ExampleText = "For we shall enter his worlds within his many worlds!";
        }
        
        
        class UGVL_Conversation_NOV_SleeperAfterHarpies_Ambient2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_NOV_SleeperAfterHarpies_Ambient2;
            default ExampleText = "Accept our offering, o great Sleeper!!";
        }
        
        
        class UGVL_Conversation_NOV_SleeperAfterHarpies_Ambient3 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_NOV_SleeperAfterHarpies_Ambient3;
            default ExampleText = "The truth is revealed to us through your eyes!";
        }
        
        
        class UGVL_Conversation_NOV_SleeperAfterHarpies_Ambient4 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_NOV_SleeperAfterHarpies_Ambient4;
            default ExampleText = "Rejoice, for the Sleeper has chosen to deliver us with his dream!!";
        }
        
        
        class UGVL_Conversation_NOV_SleeperAfterHarpies_Ambient5 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_NOV_SleeperAfterHarpies_Ambient5;
            default ExampleText = "Rejoice at its uncomparable and incomprehensible beauty!!";
        }
        
        
        class UGVL_Conversation_NOV_SleeperAfterOrcs_Ambient1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_NOV_SleeperAfterOrcs_Ambient1;
            default ExampleText = "Our eyes ... they shall no longer be, for he casts everything in eternal darkness!!";
        }
        
        
        class UGVL_Conversation_NOV_SleeperAfterOrcs_Ambient2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_NOV_SleeperAfterOrcs_Ambient2;
            default ExampleText = "The gates within us are flung wide!!";
        }
        
        
        class UGVL_Conversation_NOV_SleeperAfterOrcs_Ambient3 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_NOV_SleeperAfterOrcs_Ambient3;
            default ExampleText = "It is your voice that shall devour all!!";
        }
        
        
        class UGVL_Conversation_NOV_SleeperAfterOrcs_Ambient4 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_NOV_SleeperAfterOrcs_Ambient4;
            default ExampleText = "It is the barrier within us that shall tear us apart!!";
        }
        
        
        class UGVL_Conversation_NOV_SleeperAfterOrcs_Ambient5 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_NOV_SleeperAfterOrcs_Ambient5;
            default ExampleText = "It is the void that speaks our name ... TAKE US!!";
        }
        
        
        class UGVL_Conversation_NOV_SleeperFound_Ambient1 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_NOV_SleeperFound_Ambient1;
            default ExampleText = "Awaken!";
        }
        
        
        class UGVL_Conversation_NOV_SleeperFound_Ambient2 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_NOV_SleeperFound_Ambient2;
            default ExampleText = "Your dreams shall become reality....";
        }
        
        
        class UGVL_Conversation_NOV_SleeperFound_Ambient3 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_NOV_SleeperFound_Ambient3;
            default ExampleText = "By your will, our chains shall break ...";
        }
        
        
        class UGVL_Conversation_NOV_SleeperFound_Ambient4 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_NOV_SleeperFound_Ambient4;
            default ExampleText = "Your dream guides us ...";
        }
        
        
        class UGVL_Conversation_NOV_SleeperFound_Ambient5 : UGenericVoicelineDefinition
        {
            default VoicelineTag = GameplayTag::Sound_Voice_Conversation_NOV_SleeperFound_Ambient5;
            default ExampleText = "We cast unto you our mind, so you may reveal the truth to us!!";
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */