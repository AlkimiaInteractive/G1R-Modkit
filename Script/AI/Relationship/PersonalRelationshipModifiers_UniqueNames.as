#ifdef WITH_STORY_G1R
class URelationshipModifier_OW_OWR_Grazkrak_2400 : UPersonalRelationshipModifier
{
    default ApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::Guild_Orc);
    default ApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::Species_Creature_Biter);
    default ApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::Species_Creature_Orcdog);
    default Weight = 3.0f;

    default RelationshipTowardsOther = ERelationship::Neutral;

    UFUNCTION(BlueprintOverride)
    bool IsApplicableFor(const AGothicCharacterState Me, const AGothicCharacterState Other) const
    {        
        if (!IsValid(Other) || Other.CharacterUniqueName != n"OW_OWR_Grazkrak_2400")
            return false;

        return true;
    }
}

class URelationshipModifier_OA_BiterLizard_ToOrcs : UPersonalRelationshipModifier
{
    default ApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::Species_Creature_Biter);
    default ApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::Species_Creature_Lizard_Fire);
    default ApplicableWhenOtherHasAnyOf.AddTag(GameplayTag::Species_Orc);
    default Weight = 16.0f;

    default RelationshipTowardsOther = ERelationship::Neutral;

    UFUNCTION(BlueprintOverride)
    bool IsApplicableFor(const AGothicCharacterState Me, const AGothicCharacterState Other) const
    {
        if (!IsValid(Me))
            return false;

        if (Me.CharacterUniqueName != "OA_Lizard_Fire_01" && Me.CharacterUniqueName != "OA_Biter_Arena_01")
            return false;

        return true;
    }
}

class URelationshipModifier_OA_Orcs_ToBiterLizard : UPersonalRelationshipModifier
{
    default ApplicableWhenOtherHasAnyOf.AddTag(GameplayTag::Species_Creature_Biter);
    default ApplicableWhenOtherHasAnyOf.AddTag(GameplayTag::Species_Creature_Lizard_Fire);
    default ApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::Species_Orc);
    default Weight = 16.0f;

    default RelationshipTowardsOther = ERelationship::Neutral;

    UFUNCTION(BlueprintOverride)
    bool IsApplicableFor(const AGothicCharacterState Me, const AGothicCharacterState Other) const
    {
        if (!IsValid(Other))
            return false;

        if (Other.CharacterUniqueName != "OA_Lizard_Fire_01" && Other.CharacterUniqueName != "OA_Biter_Arena_01")
            return false;

        return true;
    }
}

class URelationshipModifier_OC_Guards_ToGladiators : UPersonalRelationshipModifier
{
    default ApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::Guild_Human_OldCamp_Guard);
    default ApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::Guild_Human_OldCamp_Shadow);
    default Weight = 3.0f;

    default RelationshipTowardsOther = ERelationship::Friend;

    UFUNCTION(BlueprintOverride)
    bool IsApplicableFor(const AGothicCharacterState Me, const AGothicCharacterState Other) const
    {
        if (Me.CharacterUniqueName != n"OCR_GRD_Scatty_210")
            return false;

        if (!IsValid(Other))
            return false;

        if (Other.CharacterUniqueName == n"SC_TPL_GorHanis_1422" || Other.CharacterUniqueName == n"OC_SLD_Kharim_729")
            return true;

        return false;
    }
}

class URelationshipModifier_BC_BAN_Quentin_858 : UPersonalRelationshipModifier
{
    default ApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::Guild_Human_Bandit);
    default Weight = 3.0f;

    default RelationshipTowardsOther = ERelationship::Enemy;
    default HostilityTowardsOther = ERelationshipHostility::AttackOnSight;

    UFUNCTION(BlueprintOverride)
    bool IsApplicableFor(const AGothicCharacterState Me, const AGothicCharacterState Other) const
    {        
        if (!IsValid(Me) || Me.CharacterUniqueName != n"BC_BAN_Quentin_858")
            return false;

        if (!IsValid(Other))
            return false;

        if (Other.IsTrulyPartOfGuild(GameplayTag::Guild_Human_Bandit))
            return false;

        if (Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage))
            return true;

        if (Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage))
            return true;

        if (Other.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_DemonSummoner))
            return true;

        return false;
    }
}

class URelationshipModifier_UL_OSL_UrShak_2200 : UPersonalRelationshipModifier
{
    default ApplicableWhenOtherHasAnyOf.AddTag(GameplayTag::Species_Human);
    default Weight = 3.0f;

    default RelationshipTowardsOther = ERelationship::Neutral;

    UFUNCTION(BlueprintOverride)
    bool IsApplicableFor(const AGothicCharacterState Me, const AGothicCharacterState Other) const
    {        
        if (!IsValid(Me) || Me.CharacterUniqueName != n"UL_OSL_UrShak_2200")
            return false;

        return true;
    }
}

class URelationshipModifier_UL_STT_Cohsel_337 : UPersonalRelationshipModifier
{
    default ApplicableWhenOtherHasAnyOf.AddTag(GameplayTag::Species_Creature_Wolf_Cohsel);
    default ApplicableWhenOtherHasAnyOf.AddTag(GameplayTag::Species_Creature_Scavenger_Adult_Cohsel);
    default Weight = 20.0f;

    default RelationshipTowardsOther = ERelationship::Friend;

    UFUNCTION(BlueprintOverride)
    bool IsApplicableFor(const AGothicCharacterState Me, const AGothicCharacterState Other) const
    {        
        if (!IsValid(Me) || Me.CharacterUniqueName != n"UL_STT_Cohsel_337")
            return false;

        return true;
    }
}

class URelationshipModifier_Cohsel_Pets : UPersonalRelationshipModifier
{
    default ApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::Species_Creature_Wolf_Cohsel);
    default ApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::Species_Creature_Scavenger_Adult_Cohsel);

    default ApplicableWhenOtherHasAnyOf.AddTag(GameplayTag::Species_Human);
    default Weight = 5.0f;

    UFUNCTION(BlueprintOverride)
    ERelationship HowMuchDoILike(const AGothicCharacterState Me, const AGothicCharacterState Other) const
    {
        if (Other.CharacterUniqueName == n"UL_STT_Cohsel_337")
            return ERelationship::Friend;
        
        auto Cohsel = FCharacterUniqueName(n"UL_STT_Cohsel_337").NPCState;
        if (!IsValid(Cohsel))
            return ERelationship::Neutral;

        return Cohsel.Relationship.GetRelationshipTowards(Other);
    }

    UFUNCTION(BlueprintOverride)
    ERelationshipHostility HowHostileAmIAgainst(const AGothicCharacterState Me,
                                                const AGothicCharacterState Other) const
    {
        if (Other.CharacterUniqueName == n"UL_STT_Cohsel_337")
            return ERelationshipHostility::ProtectFromNonFriendly;

        auto Cohsel = FCharacterUniqueName(n"UL_STT_Cohsel_337").NPCState;
        if (!IsValid(Cohsel))
            return ERelationshipHostility::None;

        return Cohsel.Relationship.GetHostilityTowards(Other);
    }
}

class URelationshipModifier_Cohsel_DandyToScavenger : UPersonalRelationshipModifier
{
    default ApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::Species_Creature_Wolf_Cohsel);
    default ApplicableWhenOtherHasAnyOf.AddTag(GameplayTag::Species_Creature_Scavenger_Adult_Cohsel);
    default Weight = 5.0f;

    default RelationshipTowardsOther = ERelationship::Friend;
    default HostilityTowardsOther = ERelationshipHostility::ProtectFromNonFriendly;
}

class URelationshipModifier_Cohsel_ScavengerToDandy : UPersonalRelationshipModifier
{
    default ApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::Species_Creature_Scavenger_Adult_Cohsel);
    default ApplicableWhenOtherHasAnyOf.AddTag(GameplayTag::Species_Creature_Wolf_Cohsel);
    default Weight = 5.0f;

    default RelationshipTowardsOther = ERelationship::Friend;
    default HostilityTowardsOther = ERelationshipHostility::Help;
}

class URelationshipModifier_Human_ToBridgeGolem_Combat : UPersonalRelationshipModifier
{
    default ApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::Species_Human);
    default ApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::Species_Orc);
    default ApplicableWhenOtherHasAnyOf.AddTag(GameplayTag::Species_Creature_Golem_Stone);
    default Weight = 3000.0f;

    default RelationshipTowardsOther = ERelationship::Neutral;

    UFUNCTION(BlueprintOverride)
    bool IsApplicableFor(const AGothicCharacterState Me, const AGothicCharacterState Other) const
    {
        if (!IsValid(Other))
            return false;

        if (G1R::Quest::NewCamp_NCCHAPTER3_BRINGFOCI == nullptr || !G1R::Quest::NewCamp_NCCHAPTER3_BRINGFOCI.IsRunning())
            return false;

        if (G1R::UStoryG1R::Get().BridgeGolemCombatActive == 0)
            return false;

        return Other.CharacterUniqueName == n"Golem_Stone_Bridge";
    }
}

//// ONLY UNCOMMENT IF YOU LIKE TZEENTCH
// class URelationshipModifier_Goblin_ShrinkedTroll : UPersonalRelationshipModifier
// {
//     default ApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::Species_Creature_Goblin);
//     default ApplicableWhenOtherHasAllOf.AddTag(GameplayTag::Species_Creature_Troll);
//     default ApplicableWhenOtherHasAllOf.AddTag(GameplayTag::Debuff_Shrink);
//     default Weight = 15.5f;

//     default RelationshipTowardsOther = ERelationship::Enemy;
// }

// class URelationshipModifier_ShrinkedTroll_Goblins : UPersonalRelationshipModifier
// {
//     default ApplicableWhenSelfHasAllOf.AddTag(GameplayTag::Species_Creature_Troll);
//     default ApplicableWhenSelfHasAllOf.AddTag(GameplayTag::Debuff_Shrink);
//     default ApplicableWhenOtherHasAnyOf.AddTag(GameplayTag::Species_Creature_Goblin);
//     default Weight = 15.5f;

//     default RelationshipTowardsOther = ERelationship::Enemy;
// }

class URelationshipModifier_GorNaBar_NeutralToMinecrawlerQuest_Minecrawler : UPersonalRelationshipModifier
{
    default Weight = 10.5f;
    
    default ApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::Species_Human);
    default ApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::Guild_Human_SwampCamp_Templar);

    default ApplicableWhenOtherHasAnyOf.AddTag(GameplayTag::Species_Creature_Minecrawler);

    default RelationshipTowardsOther = ERelationship::Neutral;

    UFUNCTION(BlueprintOverride)
    bool IsApplicableFor(const AGothicCharacterState Me, const AGothicCharacterState Other) const
    {
        if (Me.CharacterUniqueName != n"OM_SC_TPL_Templar03_1436" && Me.CharacterUniqueName != n"OM_TPL_GorNaBar_1400")
            return false;

        auto AI = Other.Character.GetGothicAI();
        if (!IsValid(AI))
            return false;
        
        UGothicCharacterAIState ScheduledAIState = Cast<UGothicCharacterAIState>(AI.ScheduledDailyRoutineAIStateTemplate);

        if (IsValid(ScheduledAIState) && !ScheduledAIState.IsA(UAIState_Smalltalk))
            return false;

        return true;
    }
}

class URelationshipModifier_TrollAndGoblins_NeutralToMilten : UPersonalRelationshipModifier
{
    default Weight = 10.5f;

    default ApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::Species_Creature_Troll);
    default ApplicableWhenOtherHasAnyOf.AddTag(GameplayTag::Species_Human);

    default RelationshipTowardsOther = ERelationship::Neutral;

    UFUNCTION(BlueprintOverride)
    bool IsApplicableFor(const AGothicCharacterState Me, const AGothicCharacterState Other) const
    {
        if (Other.CharacterUniqueName != n"OC_KDF_Milten")
            return false;

        return true;
    }
}

class URelationshipModifier_Milten_NeutralToTroll : UPersonalRelationshipModifier
{
    default Weight = 10.5f;

    default ApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::Species_Human);
    default ApplicableWhenOtherHasAnyOf.AddTag(GameplayTag::Species_Creature_Troll);

    default RelationshipTowardsOther = ERelationship::Neutral;

    UFUNCTION(BlueprintOverride)
    bool IsApplicableFor(const AGothicCharacterState Me, const AGothicCharacterState Other) const
    {
        if (Other.CharacterUniqueName != n"OC_KDF_Milten")
            return false;

        return true;
    }
}

class URelationshipModifier_GoblinAndGoblins_NeutralToMilten : UPersonalRelationshipModifier
{
    default Weight = 10.5f;

    default ApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::Species_Creature_Goblin);
    default ApplicableWhenOtherHasAnyOf.AddTag(GameplayTag::Species_Human);

    default RelationshipTowardsOther = ERelationship::Neutral;

    UFUNCTION(BlueprintOverride)
    bool IsApplicableFor(const AGothicCharacterState Me, const AGothicCharacterState Other) const
    {
        if (Other.CharacterUniqueName != n"OC_KDF_Milten")
            return false;

        return true;
    }
}

class URelationshipModifier_Milten_NeutralToGoblin : UPersonalRelationshipModifier
{
    default Weight = 10.5f;

    default ApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::Species_Human);
    default ApplicableWhenOtherHasAnyOf.AddTag(GameplayTag::Species_Creature_Goblin);

    default RelationshipTowardsOther = ERelationship::Neutral;

    UFUNCTION(BlueprintOverride)
    bool IsApplicableFor(const AGothicCharacterState Me, const AGothicCharacterState Other) const
    {
        if (Me.CharacterUniqueName != n"OC_KDF_Milten")
            return false;

        return true;
    }
}

class URelationshipModifier_Santino_NeutralToOC : UPersonalRelationshipModifier
{
    default Weight = 10.5f;

    default ApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::Species_Human);
    default ApplicableWhenOtherHasAnyOf.AddTag(GameplayTag::Guild_Human_OldCamp);

    default RelationshipTowardsOther = ERelationship::Neutral;
    default bApplicableWhenOtherIsPlayer = false;
    default bApplicableWhenOtherIsNPC = true;

    UFUNCTION(BlueprintOverride)
    bool IsApplicableFor(const AGothicCharacterState Me, const AGothicCharacterState Other) const
    {
        if (Me.CharacterUniqueName != n"OM_STT_Santino_335")
            return false;

        return true;
    }
}

/// Protection payments
// Bloodwyn
class URelationshipModifier_Bloodwyn_Protection_Jurisdiction : UPersonalRelationshipModifier
{
    default Weight = 10.0f;

    default ApplicableWhenSelfHasAllOf.AddTag(GameplayTag::Species_Human);
    default ApplicableWhenSelfHasAllOf.AddTag(GameplayTag::Guild_Human_OldCamp);
    default ApplicableWhenSelfHasAllOf.AddTag(GameplayTag::Role_Guard_OC_Bloodwyn);

    default ApplicableWhenOtherHasAllOf.AddTag(GameplayTag::State_OldCampProtection_Jurisdiction_Bloodwyn);

    default HostilityTowardsOther = ERelationshipHostility::ProtectFromDifferentGuild_Jurisdiction;
}

class URelationshipModifier_Bloodwyn_Protection_Premium : UPersonalRelationshipModifier
{
    default Weight = 10.5f;

    default ApplicableWhenSelfHasAllOf.AddTag(GameplayTag::Species_Human);
    default ApplicableWhenSelfHasAllOf.AddTag(GameplayTag::Guild_Human_OldCamp);
    default ApplicableWhenSelfHasAllOf.AddTag(GameplayTag::Role_Guard_OC_Bloodwyn);

    default ApplicableWhenOtherHasAllOf.AddTag(GameplayTag::State_OldCampProtection_Premium_Bloodwyn);

    default ApplicableWhenOtherHasAnyOf.AddTag(GameplayTag::Guild_Human_OldCamp_Digger);
    default ApplicableWhenOtherHasAnyOf.AddTag(GameplayTag::Guild_None);

    default HostilityTowardsOther = ERelationshipHostility::ProtectFromDifferentGuild_Premium;
}

// Fletcher
class URelationshipModifier_Fletcher_Protection_Jurisdiction : UPersonalRelationshipModifier
{
    default Weight = 10.0f;

    default ApplicableWhenSelfHasAllOf.AddTag(GameplayTag::Species_Human);
    default ApplicableWhenSelfHasAllOf.AddTag(GameplayTag::Guild_Human_OldCamp);
    default ApplicableWhenSelfHasAllOf.AddTag(GameplayTag::Role_Guard_OC_Fletcher);

    default ApplicableWhenOtherHasAllOf.AddTag(GameplayTag::State_OldCampProtection_Jurisdiction_Fletcher);

    default HostilityTowardsOther = ERelationshipHostility::ProtectFromDifferentGuild_Jurisdiction;
}

class URelationshipModifier_Fletcher_Protection_Premium : UPersonalRelationshipModifier
{
    default Weight = 10.5f;

    default ApplicableWhenSelfHasAllOf.AddTag(GameplayTag::Species_Human);
    default ApplicableWhenSelfHasAllOf.AddTag(GameplayTag::Guild_Human_OldCamp);
    default ApplicableWhenSelfHasAllOf.AddTag(GameplayTag::Role_Guard_OC_Fletcher);

    default ApplicableWhenOtherHasAllOf.AddTag(GameplayTag::State_OldCampProtection_Premium_Fletcher);

    default ApplicableWhenOtherHasAnyOf.AddTag(GameplayTag::Guild_Human_OldCamp_Digger);
    default ApplicableWhenOtherHasAnyOf.AddTag(GameplayTag::Guild_None);

    default HostilityTowardsOther = ERelationshipHostility::ProtectFromDifferentGuild_Premium;
}

// Jackal
class URelationshipModifier_Jackal_Protection_Jurisdiction : UPersonalRelationshipModifier
{
    default Weight = 10.0f;

    default ApplicableWhenSelfHasAllOf.AddTag(GameplayTag::Species_Human);
    default ApplicableWhenSelfHasAllOf.AddTag(GameplayTag::Guild_Human_OldCamp);
    default ApplicableWhenSelfHasAllOf.AddTag(GameplayTag::Role_Guard_OC_Jackal);

    default ApplicableWhenOtherHasAllOf.AddTag(GameplayTag::State_OldCampProtection_Jurisdiction_Jackal);

    default HostilityTowardsOther = ERelationshipHostility::ProtectFromDifferentGuild_Jurisdiction;
}

class URelationshipModifier_Jackal_Protection_Premium : UPersonalRelationshipModifier
{
    default Weight = 10.5f;

    default ApplicableWhenSelfHasAllOf.AddTag(GameplayTag::Species_Human);
    default ApplicableWhenSelfHasAllOf.AddTag(GameplayTag::Guild_Human_OldCamp);
    default ApplicableWhenSelfHasAllOf.AddTag(GameplayTag::Role_Guard_OC_Jackal);

    default ApplicableWhenOtherHasAllOf.AddTag(GameplayTag::State_OldCampProtection_Premium_Jackal);

    default ApplicableWhenOtherHasAnyOf.AddTag(GameplayTag::Guild_Human_OldCamp_Digger);
    default ApplicableWhenOtherHasAnyOf.AddTag(GameplayTag::Guild_None);

    default HostilityTowardsOther = ERelationshipHostility::ProtectFromDifferentGuild_Premium;
}

class URelationshipModifier_Gomez_GomezFightNeutrality : UPersonalRelationshipModifier
{
    default ApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::Species_Human);
    default ApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::Guild_Human_OldCamp);
    default bApplicableWhenOtherIsPlayer = true;

    default Weight = 10.0f;

    default RelationshipTowardsOther = ERelationship::Neutral;

    UFUNCTION(BlueprintOverride)
    bool IsApplicableFor(const AGothicCharacterState Me, const AGothicCharacterState Other) const
    {
        if (G1R::UStoryG1R::Get().FireMagesDead == 0)
            return false;
        
        if (Me.CharacterUniqueName != n"OC_EBR_Gomez_100" && Other.CharacterUniqueName != n"OC_EBR_Gomez_100")
            return false;

        return true;
    }
}

class URelationshipModifier_Stone_EnemyToGuardsWhileFollowing : UPersonalRelationshipModifier
{
    default ApplicableWhenOtherHasAnyOf.AddTag(GameplayTag::Guild_Human_OldCamp_Guard);
    default ApplicableWhenOtherHasAnyOf.AddTag(GameplayTag::Guild_Human_OldCamp_OreBaron);
    default ApplicableWhenOtherHasAnyOf.AddTag(GameplayTag::Guild_Human_OldCamp_Shadow);
    default ApplicableWhenOtherHasAnyOf.AddTag(GameplayTag::Guild_Human_OldCamp_FireMage);
    default bApplicableWhenOtherIsNPC = true;
    default bApplicableWhenOtherIsPlayer = false;

    default RelationshipTowardsOther = ERelationship::Enemy;
    default HostilityTowardsOther = ERelationshipHostility::AttackWithinReason;

    default Weight = 100.0f;

    UFUNCTION(BlueprintOverride)
    bool IsApplicableFor(const AGothicCharacterState Me, const AGothicCharacterState Other) const
    {
        if (!IsValid(Me))
            return false;

        if (Me.CharacterUniqueName != n"OCR_GRD_Stone_219")
            return false;

        auto PlayerCharacter = Cast<AGothicCharacter>(Gameplay::GetPlayerCharacter(0));
        if (!IsValid(PlayerCharacter))
            return false;

        if (!Me.IsInPartyWith(PlayerCharacter.CharacterState))
            return false;

        if (G1R::Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_ESCORT == nullptr || 
            !G1R::Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_ESCORT.IsRunning())
            return false;

        return true;
    }
}

class URelationshipModifier_Stone_GuardsAttack : UPersonalRelationshipModifier
{
    default ApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::Guild_Human_OldCamp_Guard);
    default ApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::Guild_Human_OldCamp_OreBaron);
    default ApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::Guild_Human_OldCamp_Shadow);
    default ApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::Guild_Human_OldCamp_FireMage);
    default bApplicableWhenOtherIsNPC = true;
    default bApplicableWhenOtherIsPlayer = true;

    default RelationshipTowardsOther = ERelationship::Enemy;
    default HostilityTowardsOther = ERelationshipHostility::AttackOnSight;

    default Weight = 100.0f;

    UFUNCTION(BlueprintOverride)
    bool IsApplicableFor(const AGothicCharacterState Me, const AGothicCharacterState Other) const
    {
        if (!IsValid(Other))
            return false;

        if (Other.CharacterUniqueName != n"OCR_GRD_Stone_219" && !Other.IsPlayerCharacter())
            return false;

        auto PlayerCharacter = Cast<AGothicCharacter>(Gameplay::GetPlayerCharacter(0));
        if (!IsValid(PlayerCharacter))
            return false;

        if (!Other.IsPlayerCharacter() && !Other.IsPlayerControlled() && !Other.IsInPartyWith(PlayerCharacter.CharacterState))
            return false;

        if (G1R::Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_ESCORT == nullptr || 
            !G1R::Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_ESCORT.IsRunning())
            return false;

        return true;
    }
}

class URelationshipModifier_Stone_DiggersDontCare : UPersonalRelationshipModifier
{
    default ApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::Guild_Human_OldCamp);
    default bApplicableWhenOtherIsNPC = true;
    default bApplicableWhenOtherIsPlayer = true;

    default RelationshipTowardsOther = ERelationship::Neutral;
    default HostilityTowardsOther = ERelationshipHostility::None;

    default Weight = 90.0f;

    UFUNCTION(BlueprintOverride)
    bool IsApplicableFor(const AGothicCharacterState Me, const AGothicCharacterState Other) const
    {
        if (!IsValid(Other))
            return false;

        if (Other.CharacterUniqueName != n"OCR_GRD_Stone_219" && !Other.IsPlayerCharacter())
            return false;

        auto PlayerCharacter = Cast<AGothicCharacter>(Gameplay::GetPlayerCharacter(0));
        if (!IsValid(PlayerCharacter))
            return false;

        if (!Other.IsInPartyWith(PlayerCharacter.CharacterState))
            return false;

        if (G1R::Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_ESCORT == nullptr || 
            !G1R::Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_ESCORT.IsRunning())
            return false;

        return true;
    }
}

class URelationshipModifier_NyrasOutcastAfterFocus : UPersonalRelationshipModifier
{
    default ApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::Guild_Human_SwampCamp);
    default ApplicableWhenOtherHasAnyOf.AddTag(GameplayTag::Guild_Human_SwampCamp);

    default bApplicableWhenOtherIsNPC = true;
    default bApplicableWhenOtherIsPlayer = false;

    default RelationshipTowardsOther = ERelationship::Neutral;
    default HostilityTowardsOther = ERelationshipHostility::None;

    default Weight = 10.0f;

    UFUNCTION(BlueprintOverride)
    bool IsApplicableFor(const AGothicCharacterState Me, const AGothicCharacterState Other) const
    {
        if (!IsValid(Me) || !IsValid(Other))
            return false;

        if (Other.CharacterUniqueName != n"SC_NOV_Nyras_1303")
            return false;

        if (!G1R::Quest::SwampCamp_SCCHAPTER2_FOCUS_FOCUS_MAP.HasSucceeded())
            return false;

        return true;
    }
}

class URelationshipModifier_LukorAfterCrazy : UPersonalRelationshipModifier
{
    default ApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::Guild_Human_SwampCamp);
    default ApplicableWhenOtherHasAnyOf.AddTag(GameplayTag::Guild_Human_SwampCamp);

    default bApplicableWhenOtherIsNPC = true;
    default bApplicableWhenOtherIsPlayer = false;

    default RelationshipTowardsOther = ERelationship::Neutral;
    default HostilityTowardsOther = ERelationshipHostility::None;

    default Weight = 10.0f;

    UFUNCTION(BlueprintOverride)
    bool IsApplicableFor(const AGothicCharacterState Me, const AGothicCharacterState Other) const
    {
        if (!IsValid(Me) || !IsValid(Other))
            return false;

        if (Other.CharacterUniqueName != n"OG_GUR_BaalLukor_1211")
            return false;

        if (!G1R::Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD_ORCGRAVEYARD_OBJ_DISCOVER.HasSucceeded())
            return false;

        return true;
    }
}

class URelationshipModifier_RoguesAfterBanditAttack : UPersonalRelationshipModifier
{
    default ApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::Guild_Human_NewCamp);
    default ApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::Guild_Human_Convoy_NewCamp);
    default ApplicableWhenOtherHasAnyOf.AddTag(GameplayTag::Guild_Human_NewCamp);
    default ApplicableWhenOtherHasAnyOf.AddTag(GameplayTag::Guild_Human_Convoy_NewCamp);

    default bApplicableWhenOtherIsNPC = true;
    default bApplicableWhenOtherIsPlayer = false;

    default RelationshipTowardsOther = ERelationship::Neutral;
    default HostilityTowardsOther = ERelationshipHostility::None;

    default Weight = 10.0f;

    TSet<FName> BanditNames;
    default BanditNames.Add(n"NC_ORG_Rogue01_800");
    default BanditNames.Add(n"NC_ORG_Rogue12_822");
    default BanditNames.Add(n"NC_ORG_Rogue33_882N");
    default BanditNames.Add(n"NC_ORG_Rogue34_883N");
    default BanditNames.Add(n"NC_ORG_Rogue35_884N");
    default BanditNames.Add(n"NC_ORG_Rogue36_885N");
    default BanditNames.Add(n"NC_ORG_Rogue37_886N");

    UFUNCTION(BlueprintOverride)
    bool IsApplicableFor(const AGothicCharacterState Me, const AGothicCharacterState Other) const
    {
        if (!IsValid(Me) || !IsValid(Other))
            return false;

        if (BanditNames.Contains(Me.CharacterUniqueName))
            return false;

        if (!BanditNames.Contains(Other.CharacterUniqueName))
            return false;

        if (!G1R::Quest::OldCamp_OCCHAPTER3_RANKUPGUARD.HasBeenStarted())
            return false;

        return true;
    }
}

class URelationshipModifier_BridgeGolem_PreCombat : UPersonalRelationshipModifier
{
    default ApplicableWhenSelfHasAllOf.AddTag(GameplayTag::Species_Creature_Golem_Stone);

    default Weight = 3000.0f;
    default RelationshipTowardsOther = ERelationship::Neutral;

    UFUNCTION(BlueprintOverride)
    bool IsApplicableFor(const AGothicCharacterState Me, const AGothicCharacterState Other) const
    {
        if (!IsValid(Me))
            return false;

        if (G1R::Quest::NewCamp_NCCHAPTER3_BRINGFOCI == nullptr || !G1R::Quest::NewCamp_NCCHAPTER3_BRINGFOCI.IsRunning())
            return false;

        if (G1R::UStoryG1R::Get().BridgeGolemCombatActive != 0)
            return false;

        return Me.CharacterUniqueName == n"Golem_Stone_Bridge";
    }
}

class URelationshipModifier_BridgeGolem_Combat : UPersonalRelationshipModifier
{
    default ApplicableWhenSelfHasAllOf.AddTag(GameplayTag::Species_Creature_Golem_Stone);

    default Weight = 3001.0f;
    default RelationshipTowardsOther = ERelationship::Enemy;
    default HostilityTowardsOther = ERelationshipHostility::AttackOnSight;

    default bApplicableWhenOtherIsNPC = false;
    default bApplicableWhenOtherIsPlayer = true;

    UFUNCTION(BlueprintOverride)
    bool IsApplicableFor(const AGothicCharacterState Me, const AGothicCharacterState Other) const
    {
        if (!IsValid(Me))
            return false;

        if (G1R::Quest::NewCamp_NCCHAPTER3_BRINGFOCI == nullptr || !G1R::Quest::NewCamp_NCCHAPTER3_BRINGFOCI.IsRunning())
            return false;

        if (G1R::UStoryG1R::Get().BridgeGolemCombatActive == 0)
            return false;

        return Me.CharacterUniqueName == n"Golem_Stone_Bridge";
    }
}

class URelationshipModifier_ProtectPartyMemberFromCreaturesOnly_UniqueNames : URelationshipModifier_FriendlyToPartyMember
{
    default Weight = 10001.0f;

    default RelationshipTowardsOther = ERelationship::Neutral;
    default HostilityTowardsOther = ERelationshipHostility::ProtectFromCreature;

    default bApplicableWhenOtherIsNPC = false;
    default bApplicableWhenOtherIsPlayer = true;

    UFUNCTION(BlueprintOverride)
    bool IsApplicableFor(const AGothicCharacterState Me, const AGothicCharacterState Other) const
    {
        if (!Super::IsApplicableFor(Me, Other))
            return false;

        return Me.CharacterUniqueName == "OC_ORG_Mordrag_826"
            || Me.CharacterUniqueName == "OC_NOV_BaalParvez_1330"
            || Me.CharacterUniqueName == "NC_ORG_Drax_819";
    }
}

UCLASS()
class URelationshipModifier_FingersRing : UPersonalRelationshipModifier
{
    default Weight = 10001.0f;

    default bApplicableWhenOtherIsNPC = true;
    default bApplicableWhenOtherIsPlayer = false;

    default RelationshipTowardsOther = ERelationship::Neutral;
    
    UFUNCTION(BlueprintOverride)
    bool IsApplicableFor(const AGothicCharacterState Me, const AGothicCharacterState Other) const
    {
        if (!G1R::Quest::OldCamp_OCCHAPTER1_FINGERS_RING.IsRunning())
            return false;

        if (Me.CharacterUniqueName != "OC_STT_Fingers_331")
            return false;

        if (Other.CharacterUniqueName != "OCR_GRD_Scatty_210")
            return false;
        
        return true;
    }
}

UCLASS()
class URelationshipModifier_UrizielBridgeMerc : UPersonalRelationshipModifier
{
    default Weight = 10001.0f;

    default bApplicableWhenOtherIsNPC = true;
    default bApplicableWhenOtherIsPlayer = false;

    default RelationshipTowardsOther = ERelationship::Neutral;
    
    UFUNCTION(BlueprintOverride)
    bool IsApplicableFor(const AGothicCharacterState Me, const AGothicCharacterState Other) const
    {
        if (!G1R::Quest::SleeperTemple_STCHAPTER5_URIZIEL.IsRunning())
            return false;

        if (Me.CharacterUniqueName != "OC_KDF_Milten")
            return false;

        if (Other.CharacterUniqueName != "NC_SLD_Mercenary11_726")
            return false;
        
        return true;
    }
}

UCLASS()
class URelationshipModifier_KalomDemon_EnemyToPlayer : UPersonalRelationshipModifier
{
    default ApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::Species_Creature_Demon);
    default Weight = 5.0f;

    default RelationshipTowardsOther = ERelationship::Enemy;
    default HostilityTowardsOther = ERelationshipHostility::AttackOnSight;

    UFUNCTION(BlueprintOverride)
    bool IsApplicableFor(const AGothicCharacterState Me, const AGothicCharacterState Other) const
    {        
        if (!IsValid(Me) || Me.CharacterUniqueName != n"CorKalomDemon")
            return false;

        if (!IsValid(Other))
            return false;

        if (Other.IsPlayerCharacter() || Other.IsPlayerControlled())
            return true;

        return false;
    }
}
#endif

class URelationshipModifier_PlayerToNPCs : UPersonalRelationshipModifier
{
    default ApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::Character_Player);
    default Weight = 5.0f;

    default RelationshipTowardsOther = ERelationship::Neutral;
}