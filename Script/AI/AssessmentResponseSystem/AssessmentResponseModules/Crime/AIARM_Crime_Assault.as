class UAIARM_Crime_Human_Assault : UAIAssessmentResponseModule
{
    default SubModules.Add(UAIARM_Crime_Assault_Perception);
    default SubModules.Add(UAIARM_Crime_Assault_Responses);
    default SubModules.Add(UAIARM_Crime_PastAssault_Responses);
}

class UAIARM_Crime_Orc_Assault : UAIAssessmentResponseModule
{
    default SubModules.Add(UAIARM_Crime_Assault_Perception);
    default SubModules.Add(UAIARM_Crime_Assault_Responses);
    default SubModules.Add(UAIARM_Crime_PastAssault_Responses);
}

class UAIARM_Crime_Assault_Perception : UAIAssessmentResponseModule
{
    default BlockIfAssessedHasAnyOwnedTags.AddTag(GameplayTag::State_Perceptions_GetIgnored);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::State_Defeated);

    default SubModules.Add(UAIARM_Crime_Assault_Perception_OnSelf);
    default SubModules.Add(UAIARM_Crime_Assault_Perception_OnNonEnemy);
    default SubModules.Add(UAIARM_Crime_Assault_Perception_OnProtected);
    default SubModules.Add(UAIARM_Crime_Assault_Perception_CastSpell_HighThreat);
    default SubModules.Add(UAIARM_Crime_Assault_Perception_CastSpell_LowThreat);
}

class UAIARM_Crime_Assault_Perception_CastSpell_HighThreat : UAIAssessmentResponseModule
{
    default RequirePursueCrimesOnAssessedCharacter.AddTag(GameplayTag::Crime_Assault_Weapon_Magic_HighThreat);

    default Rules.Add(GameplayTag::AIEvent_Sensed_Hit_OnOther_Weapon_Magic_HighThreat)
        .RequireFalse(
            Assessed::IsInPartyWithSensedCharacter
        )
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_Assault_Weapon_Magic_HighThreat,
            EPerceptionCharacterType::Instigator,
            EPerceptionCharacterType::AffectedCharacter
        ));

    default Rules.Add(GameplayTag::AIEvent_Seen_CastSpell_HighThreat)
        .RequireFalse(
            Assessed::IsInPartyWithSensedCharacter
        )
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_Assault_Weapon_Magic_HighThreat,
            EPerceptionCharacterType::Instigator,
            EPerceptionCharacterType::AffectedCharacter
        ));
}

class UAIARM_Crime_Assault_Perception_CastSpell_LowThreat : UAIAssessmentResponseModule
{
    default RequirePursueCrimesOnAssessedCharacter.AddTag(GameplayTag::Crime_Assault_Weapon_Magic_LowThreat);
    
    default Rules.Add(GameplayTag::AIEvent_Sensed_Hit_OnOther_Weapon_Magic_LowThreat)
        .RequireFalse(
            Assessed::IsInPartyWithSensedCharacter
        )
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_Assault_Weapon_Magic_LowThreat,
            EPerceptionCharacterType::Instigator,
            EPerceptionCharacterType::AffectedCharacter
        ));

    default Rules.Add(GameplayTag::AIEvent_Seen_CastSpell_LowThreat)
        .RequireFalse(
            Assessed::IsInPartyWithSensedCharacter
        )
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_Assault_Weapon_Magic_LowThreat,
            EPerceptionCharacterType::Instigator,
            EPerceptionCharacterType::AffectedCharacter
        ));
}

class UAIARM_Crime_Assault_Perception_OnSelf : UAIAssessmentResponseModule
{
    default SubModules.Add(UAIARM_Crime_Assault_Perception_OnSelf_TransformedPartyMember);
    default SubModules.Add(UAIARM_Crime_Assault_Perception_OnSelf_Fists);
    default SubModules.Add(UAIARM_Crime_Assault_Perception_OnSelf_Melee);
    default SubModules.Add(UAIARM_Crime_Assault_Perception_OnSelf_Ranged);
    default SubModules.Add(UAIARM_Crime_Assault_Perception_OnSelf_Magic_HighThreat);
    default SubModules.Add(UAIARM_Crime_Assault_Perception_OnSelf_Magic_LowThreat);
}

class UAIARM_Crime_Assault_Perception_OnSelf_TransformedPartyMember : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::State_IgnoreCrimes_Party);
    
    default Rules.Add(GameplayTag::AIEvent_Sensed_Hit_OnSelf_Fist)
        .RequireTrue(
            Assessed::InstigatorIsTransformedAndSelfInPartyWithCaster |
            Assessed::InstigatorHasDamagedSelfBefore)
        .Then(UAIEventResponse_LeavePartyOfInstigatorCaster())
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator));

    default Rules.Add(GameplayTag::AIEvent_Sensed_Hit_OnSelf_Weapon_Melee)
        .RequireTrue(
            Assessed::InstigatorIsTransformedAndSelfInPartyWithCaster |
            Assessed::InstigatorHasDamagedSelfBefore)
        .Then(UAIEventResponse_LeavePartyOfInstigatorCaster())
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator));

    default Rules.Add(GameplayTag::AIEvent_Sensed_Hit_OnSelf_Weapon_Ranged)
        .RequireTrue(
            Assessed::InstigatorIsTransformedAndSelfInPartyWithCaster |
            Assessed::InstigatorHasDamagedSelfBefore)
        .Then(UAIEventResponse_LeavePartyOfInstigatorCaster())
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator));

    default Rules.Add(GameplayTag::AIEvent_Sensed_Hit_OnSelf_Weapon_Magic_HighThreat)
        .RequireTrue(
            Assessed::InstigatorIsTransformedAndSelfInPartyWithCaster |
            Assessed::InstigatorHasDamagedSelfBefore)
        .Then(UAIEventResponse_LeavePartyOfInstigatorCaster())
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator));

    default Rules.Add(GameplayTag::AIEvent_Sensed_Hit_OnSelf_Weapon_Magic_LowThreat)
        .RequireTrue(
            Assessed::InstigatorIsTransformedAndSelfInPartyWithCaster |
            Assessed::InstigatorHasDamagedSelfBefore)
        .Then(UAIEventResponse_LeavePartyOfInstigatorCaster())
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator));
}

class UAIARM_Crime_Assault_Perception_OnSelf_Fists : UAIAssessmentResponseModule
{    
    // Sensed too many unintentional hits on self with fists
    default Rules.Add(GameplayTag::AIEvent_Sensed_Hit_OnSelf_Fist)
        .RequireTrue(
            Assessed::IsTooManyUnintentionalHits |
            Assessed::AwareOfInstigator
        )
        .RequireFalse(
            Assessed::IsIntentionalAttack |
            Assessed::SelfIsTrainingWithInstigator |
            Assessed::IsPettyFight |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_Assault_Fists,
            EPerceptionCharacterType::Instigator,
            EPerceptionCharacterType::AffectedCharacter
        ));

    // Sensed intentional hit on self with fists
    default Rules.Add(GameplayTag::AIEvent_Sensed_Hit_OnSelf_Fist)
        .RequireTrue(
            Assessed::IsIntentionalAttack |
            Assessed::AwareOfInstigator
        )
        .RequireFalse(
            Assessed::SelfIsTrainingWithInstigator |
            Assessed::IsPettyFight |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_Assault_Fists,
            EPerceptionCharacterType::Instigator,
            EPerceptionCharacterType::AffectedCharacter
        ));
    
    // Seen attacker after too many unintentional attacks with weapon
    default Rules.Add(GameplayTag::AIEvent_Seen_Attacker)
        .EventHasTag(GameplayTag::AIEvent_Sensed_Hit_OnSelf_Fist)
        .RequireTrue(
            Assessed::IsTooManyUnintentionalHits
        )
        .RequireFalse(
            Assessed::IsIntentionalAttack |
            Assessed::SelfIsTrainingWithInstigator |
            Assessed::IsPettyFight |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_Assault_Fists,
            EPerceptionCharacterType::Instigator,
            EPerceptionCharacterType::AffectedCharacter
        ));

    // Seen attacker after intentional attack with weapon
    default Rules.Add(GameplayTag::AIEvent_Seen_Attacker)
        .EventHasTag(GameplayTag::AIEvent_Sensed_Hit_OnSelf_Fist)
        .RequireTrue(
            Assessed::IsIntentionalAttack
        )
        .RequireFalse(
            Assessed::SelfIsTrainingWithInstigator |
            Assessed::IsPettyFight |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_Assault_Fists,
            EPerceptionCharacterType::Instigator,
            EPerceptionCharacterType::AffectedCharacter
        ));
}

class UAIARM_Crime_Assault_Perception_OnSelf_Melee : UAIAssessmentResponseModule
{
    // PettyFight escalation: hit with real weapon while in fist fight, remove fist lock, register weapon assault (so NPC can switch to weapon)
    default Rules.Add(GameplayTag::AIEvent_Sensed_Hit_OnSelf_Weapon_Melee)
        .RequireTrue(Assessed::IsPettyFight)
        .Then(UAIEventResponse_RemoveUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_Assault_Weapon_Melee,
            EPerceptionCharacterType::Instigator,
            EPerceptionCharacterType::AffectedCharacter
        ));

    // Sensed too many unintentional hits on self with weapon
    default Rules.Add(GameplayTag::AIEvent_Sensed_Hit_OnSelf_Weapon_Melee)
        .RequireTrue(
            Assessed::IsTooManyUnintentionalHits |
            Assessed::AwareOfInstigator
        )
        .RequireFalse(
            Assessed::IsIntentionalAttack |
            Assessed::SelfIsTrainingWithInstigator |
            Assessed::IsPettyFight |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_Assault_Weapon_Melee,
            EPerceptionCharacterType::Instigator,
            EPerceptionCharacterType::AffectedCharacter
        ));

    // Sensed intentional hit on self with weapon
    default Rules.Add(GameplayTag::AIEvent_Sensed_Hit_OnSelf_Weapon_Melee)
        .RequireTrue(
            Assessed::IsIntentionalAttack |
            Assessed::AwareOfInstigator
        )
        .RequireFalse(
            Assessed::SelfIsTrainingWithInstigator |
            Assessed::IsPettyFight |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_Assault_Weapon_Melee,
            EPerceptionCharacterType::Instigator,
            EPerceptionCharacterType::AffectedCharacter
        ));
    
    // Seen attacker after too many unintentional attacks with weapon
    default Rules.Add(GameplayTag::AIEvent_Seen_Attacker)
        .EventHasTag(GameplayTag::AIEvent_Sensed_Hit_OnSelf_Weapon_Melee)
        .RequireTrue(
            Assessed::IsTooManyUnintentionalHits
        )
        .RequireFalse(
            Assessed::IsIntentionalAttack |
            Assessed::SelfIsTrainingWithInstigator |
            Assessed::IsPettyFight |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_Assault_Weapon_Melee,
            EPerceptionCharacterType::Instigator,
            EPerceptionCharacterType::AffectedCharacter
        ));

    // Seen attacker after intentional attack with weapon
    default Rules.Add(GameplayTag::AIEvent_Seen_Attacker)
        .EventHasTag(GameplayTag::AIEvent_Sensed_Hit_OnSelf_Weapon_Melee)
        .RequireTrue(
            Assessed::IsIntentionalAttack
        )
        .RequireFalse(
            Assessed::SelfIsTrainingWithInstigator |
            Assessed::IsPettyFight |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_Assault_Weapon_Melee,
            EPerceptionCharacterType::Instigator,
            EPerceptionCharacterType::AffectedCharacter
        ));
}

class UAIARM_Crime_Assault_Perception_OnSelf_Ranged : UAIAssessmentResponseModule
{
    // PettyFight escalation: hit with real weapon while in fist fight, remove fist lock, register weapon assault
    default Rules.Add(GameplayTag::AIEvent_Sensed_Hit_OnSelf_Weapon_Ranged)
        .RequireTrue(Assessed::IsPettyFight)
        .Then(UAIEventResponse_RemoveUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_Assault_Weapon_Ranged,
            EPerceptionCharacterType::Instigator,
            EPerceptionCharacterType::AffectedCharacter
        ));

    // Sensed too many unintentional hits on self with weapon
    default Rules.Add(GameplayTag::AIEvent_Sensed_Hit_OnSelf_Weapon_Ranged)
        .RequireTrue(
            Assessed::IsTooManyUnintentionalHits |
            Assessed::AwareOfInstigator
        )
        .RequireFalse(
            Assessed::IsIntentionalAttack |
            Assessed::SelfIsTrainingWithInstigator |
            Assessed::IsPettyFight |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_Assault_Weapon_Ranged,
            EPerceptionCharacterType::Instigator,
            EPerceptionCharacterType::AffectedCharacter
        ));

    // Sensed intentional hit on self with weapon
    default Rules.Add(GameplayTag::AIEvent_Sensed_Hit_OnSelf_Weapon_Ranged)
        .RequireTrue(
            Assessed::IsIntentionalAttack |
            Assessed::AwareOfInstigator
        )
        .RequireFalse(
            Assessed::SelfIsTrainingWithInstigator |
            Assessed::IsPettyFight |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_Assault_Weapon_Ranged,
            EPerceptionCharacterType::Instigator,
            EPerceptionCharacterType::AffectedCharacter
        ));
    
    // Seen attacker after too many unintentional attacks with weapon
    default Rules.Add(GameplayTag::AIEvent_Seen_Attacker)
        .EventHasTag(GameplayTag::AIEvent_Sensed_Hit_OnSelf_Weapon_Ranged)
        .RequireTrue(
            Assessed::IsTooManyUnintentionalHits
        )
        .RequireFalse(
            Assessed::IsIntentionalAttack |
            Assessed::SelfIsTrainingWithInstigator |
            Assessed::IsPettyFight |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_Assault_Weapon_Ranged,
            EPerceptionCharacterType::Instigator,
            EPerceptionCharacterType::AffectedCharacter
        ));

    // Seen attacker after intentional attack with weapon
    default Rules.Add(GameplayTag::AIEvent_Seen_Attacker)
        .EventHasTag(GameplayTag::AIEvent_Sensed_Hit_OnSelf_Weapon_Ranged)
        .RequireTrue(
            Assessed::IsIntentionalAttack
        )
        .RequireFalse(
            Assessed::SelfIsTrainingWithInstigator |
            Assessed::IsPettyFight |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_Assault_Weapon_Ranged,
            EPerceptionCharacterType::Instigator,
            EPerceptionCharacterType::AffectedCharacter
        ));
}

class UAIARM_Crime_Assault_Perception_OnSelf_Magic_HighThreat : UAIAssessmentResponseModule
{
    // PettyFight escalation: hit with real weapon while in fist fight, remove fist lock, register weapon assault
    default Rules.Add(GameplayTag::AIEvent_Sensed_Hit_OnSelf_Weapon_Magic_HighThreat)
        .RequireTrue(Assessed::IsPettyFight)
        .Then(UAIEventResponse_RemoveUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_Assault_Weapon_Magic_HighThreat,
            EPerceptionCharacterType::Instigator,
            EPerceptionCharacterType::AffectedCharacter
        ));

    // Sensed too many unintentional hits on self with weapon
    default Rules.Add(GameplayTag::AIEvent_Sensed_Hit_OnSelf_Weapon_Magic_HighThreat)
        .RequireTrue(
            Assessed::IsTooManyUnintentionalHits |
            Assessed::AwareOfInstigator
        )
        .RequireFalse(
            Assessed::IsIntentionalAttack |
            Assessed::SelfIsTrainingWithInstigator |
            Assessed::IsPettyFight |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_Assault_Weapon_Magic_HighThreat,
            EPerceptionCharacterType::Instigator,
            EPerceptionCharacterType::AffectedCharacter
        ));

    // Sensed intentional hit on self with weapon
    default Rules.Add(GameplayTag::AIEvent_Sensed_Hit_OnSelf_Weapon_Magic_HighThreat)
        .RequireTrue(
            Assessed::IsIntentionalAttack |
            Assessed::AwareOfInstigator
        )
        .RequireFalse(
            Assessed::SelfIsTrainingWithInstigator |
            Assessed::IsPettyFight |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_Assault_Weapon_Magic_HighThreat,
            EPerceptionCharacterType::Instigator,
            EPerceptionCharacterType::AffectedCharacter
        ));
    
    // Seen attacker after too many unintentional attacks with weapon
    default Rules.Add(GameplayTag::AIEvent_Seen_Attacker)
        .EventHasTag(GameplayTag::AIEvent_Sensed_Hit_OnSelf_Weapon_Magic_HighThreat)
        .RequireTrue(
            Assessed::IsTooManyUnintentionalHits
        )
        .RequireFalse(
            Assessed::IsIntentionalAttack |
            Assessed::SelfIsTrainingWithInstigator |
            Assessed::IsPettyFight |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_Assault_Weapon_Magic_HighThreat,
            EPerceptionCharacterType::Instigator,
            EPerceptionCharacterType::AffectedCharacter
        ));

    // Seen attacker after intentional attack with weapon
    default Rules.Add(GameplayTag::AIEvent_Seen_Attacker)
        .EventHasTag(GameplayTag::AIEvent_Sensed_Hit_OnSelf_Weapon_Magic_HighThreat)
        .RequireTrue(
            Assessed::IsIntentionalAttack
        )
        .RequireFalse(
            Assessed::SelfIsTrainingWithInstigator |
            Assessed::IsPettyFight |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_Assault_Weapon_Magic_HighThreat,
            EPerceptionCharacterType::Instigator,
            EPerceptionCharacterType::AffectedCharacter
        ));
}

class UAIARM_Crime_Assault_Perception_OnSelf_Magic_LowThreat : UAIAssessmentResponseModule
{
    // PettyFight escalation: hit with real weapon while in fist fight, remove fist lock, register weapon assault
    default Rules.Add(GameplayTag::AIEvent_Sensed_Hit_OnSelf_Weapon_Magic_LowThreat)
        .RequireTrue(Assessed::IsPettyFight)
        .Then(UAIEventResponse_RemoveUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_Assault_Weapon_Magic_LowThreat,
            EPerceptionCharacterType::Instigator,
            EPerceptionCharacterType::AffectedCharacter
        ));

    // Sensed too many unintentional hits on self with weapon
    default Rules.Add(GameplayTag::AIEvent_Sensed_Hit_OnSelf_Weapon_Magic_LowThreat)
        .RequireTrue(
            Assessed::IsTooManyUnintentionalHits |
            Assessed::AwareOfInstigator
        )
        .RequireFalse(
            Assessed::IsIntentionalAttack |
            Assessed::SelfIsTrainingWithInstigator |
            Assessed::IsPettyFight |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_Assault_Weapon_Magic_LowThreat,
            EPerceptionCharacterType::Instigator,
            EPerceptionCharacterType::AffectedCharacter
        ));

    // Sensed intentional hit on self with weapon
    default Rules.Add(GameplayTag::AIEvent_Sensed_Hit_OnSelf_Weapon_Magic_LowThreat)
        .RequireTrue(
            Assessed::IsIntentionalAttack |
            Assessed::AwareOfInstigator
        )
        .RequireFalse(
            Assessed::SelfIsTrainingWithInstigator |
            Assessed::IsPettyFight |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_Assault_Weapon_Magic_LowThreat,
            EPerceptionCharacterType::Instigator,
            EPerceptionCharacterType::AffectedCharacter
        ));
    
    // Seen attacker after too many unintentional attacks with weapon
    default Rules.Add(GameplayTag::AIEvent_Seen_Attacker)
        .EventHasTag(GameplayTag::AIEvent_Sensed_Hit_OnSelf_Weapon_Magic_LowThreat)
        .RequireTrue(
            Assessed::IsTooManyUnintentionalHits
        )
        .RequireFalse(
            Assessed::IsIntentionalAttack |
            Assessed::SelfIsTrainingWithInstigator |
            Assessed::IsPettyFight |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_Assault_Weapon_Magic_LowThreat,
            EPerceptionCharacterType::Instigator,
            EPerceptionCharacterType::AffectedCharacter
        ));

    // Seen attacker after intentional attack with weapon
    default Rules.Add(GameplayTag::AIEvent_Seen_Attacker)
        .EventHasTag(GameplayTag::AIEvent_Sensed_Hit_OnSelf_Weapon_Magic_LowThreat)
        .RequireTrue(
            Assessed::IsIntentionalAttack
        )
        .RequireFalse(
            Assessed::SelfIsTrainingWithInstigator |
            Assessed::IsPettyFight |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_Assault_Weapon_Magic_LowThreat,
            EPerceptionCharacterType::Instigator,
            EPerceptionCharacterType::AffectedCharacter
        ));
}

class UAIARM_Crime_Assault_Perception_OnNonEnemy : UAIAssessmentResponseModule
{
    default SubModules.Add(UAIARM_Crime_Assault_Perception_OnNonEnemy_Fists);
    default SubModules.Add(UAIARM_Crime_Assault_Perception_OnNonEnemy_Melee);
    default SubModules.Add(UAIARM_Crime_Assault_Perception_OnNonEnemy_Ranged);
    default SubModules.Add(UAIARM_Crime_Assault_Perception_OnNonEnemy_Magic_HighThreat);
    default SubModules.Add(UAIARM_Crime_Assault_Perception_OnNonEnemy_Magic_LowThreat);
}

class UAIARM_Crime_Assault_Perception_OnNonEnemy_Fists : UAIAssessmentResponseModule
{
    // Intentional Attack hit seen
    default Rules.Add(GameplayTag::AIEvent_Seen_AttackHit_OnOther_Fist)
        .RequireTrue(
            Assessed::AwareOfInstigator |
            Assessed::IsIntentionalAttack
        )
        .RequireFalse(
            Assessed::AffectedIsTrainingWithInstigator |
            Assessed::AffectedWasEnemy |
            Assessed::IsPettyFight |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_Assault_Fists,
            EPerceptionCharacterType::Instigator,
            EPerceptionCharacterType::AffectedCharacter
        ));

    // Too many unintentional attack hits seen
    default Rules.Add(GameplayTag::AIEvent_Seen_AttackHit_OnOther_Fist)
        .RequireTrue(
            Assessed::AwareOfInstigator |
            Assessed::IsTooManyUnintentionalHits
        )
        .RequireFalse(
            Assessed::IsIntentionalAttack |
            Assessed::AffectedIsTrainingWithInstigator |
            Assessed::AffectedWasEnemy |
            Assessed::IsPettyFight |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_Assault_Fists,
            EPerceptionCharacterType::Instigator,
            EPerceptionCharacterType::AffectedCharacter
        ));
    
    // Seen attacker after too many unintentional attacks with weapon
    default Rules.Add(GameplayTag::AIEvent_Seen_Attacker)
        .EventHasTag(GameplayTag::AIEvent_Seen_AttackHit_OnOther_Fist)
        .RequireTrue(
            Assessed::IsTooManyUnintentionalHits
        )
        .RequireFalse(
            Assessed::IsIntentionalAttack |
            Assessed::SelfIsTrainingWithInstigator |
            Assessed::AffectedWasEnemy |
            Assessed::IsPettyFight |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_Assault_Fists,
            EPerceptionCharacterType::Instigator,
            EPerceptionCharacterType::AffectedCharacter
        ));

    // Seen attacker after intentional attack with weapon
    default Rules.Add(GameplayTag::AIEvent_Seen_Attacker)
        .EventHasTag(GameplayTag::AIEvent_Seen_AttackHit_OnOther_Fist)
        .RequireTrue(
            Assessed::IsIntentionalAttack
        )
        .RequireFalse(
            Assessed::SelfIsTrainingWithInstigator |
            Assessed::AffectedWasEnemy |
            Assessed::IsPettyFight |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_Assault_Fists,
            EPerceptionCharacterType::Instigator,
            EPerceptionCharacterType::AffectedCharacter
        ));
}

class UAIARM_Crime_Assault_Perception_OnNonEnemy_Melee : UAIAssessmentResponseModule
{
    // Intentional Attack hit seen
    default Rules.Add(GameplayTag::AIEvent_Seen_AttackHit_OnOther_Weapon_Melee)
        .RequireTrue(
            Assessed::AwareOfInstigator |
            Assessed::IsIntentionalAttack
        )
        .RequireFalse(
            Assessed::AffectedIsTrainingWithInstigator |
            Assessed::AffectedWasEnemy |
            Assessed::IsPettyFight |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_Assault_Weapon_Melee,
            EPerceptionCharacterType::Instigator,
            EPerceptionCharacterType::AffectedCharacter
        ));

    // Too many unintentional attack hits seen
    default Rules.Add(GameplayTag::AIEvent_Seen_AttackHit_OnOther_Weapon_Melee)
        .RequireTrue(
            Assessed::AwareOfInstigator |
            Assessed::IsTooManyUnintentionalHits
        )
        .RequireFalse(
            Assessed::IsIntentionalAttack |
            Assessed::AffectedIsTrainingWithInstigator |
            Assessed::AffectedWasEnemy |
            Assessed::IsPettyFight |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_Assault_Weapon_Melee,
            EPerceptionCharacterType::Instigator,
            EPerceptionCharacterType::AffectedCharacter
        ));
    
    // Seen attacker after too many unintentional attacks with weapon
    default Rules.Add(GameplayTag::AIEvent_Seen_Attacker)
        .EventHasTag(GameplayTag::AIEvent_Seen_AttackHit_OnOther_Weapon_Melee)
        .RequireTrue(
            Assessed::IsTooManyUnintentionalHits
        )
        .RequireFalse(
            Assessed::IsIntentionalAttack |
            Assessed::SelfIsTrainingWithInstigator |
            Assessed::AffectedWasEnemy |
            Assessed::IsPettyFight |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_Assault_Weapon_Melee,
            EPerceptionCharacterType::Instigator,
            EPerceptionCharacterType::AffectedCharacter
        ));

    // Seen attacker after intentional attack with weapon
    default Rules.Add(GameplayTag::AIEvent_Seen_Attacker)
        .EventHasTag(GameplayTag::AIEvent_Seen_AttackHit_OnOther_Weapon_Melee)
        .RequireTrue(
            Assessed::IsIntentionalAttack
        )
        .RequireFalse(
            Assessed::SelfIsTrainingWithInstigator |
            Assessed::AffectedWasEnemy |
            Assessed::IsPettyFight |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_Assault_Weapon_Melee,
            EPerceptionCharacterType::Instigator,
            EPerceptionCharacterType::AffectedCharacter
        ));
}

class UAIARM_Crime_Assault_Perception_OnNonEnemy_Ranged : UAIAssessmentResponseModule
{
    // Intentional Attack hit seen
    default Rules.Add(GameplayTag::AIEvent_Seen_AttackHit_OnOther_Weapon_Ranged)
        .RequireTrue(
            Assessed::AwareOfInstigator |
            Assessed::IsIntentionalAttack
        )
        .RequireFalse(
            Assessed::AffectedIsTrainingWithInstigator |
            Assessed::AffectedWasEnemy |
            Assessed::IsPettyFight |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_Assault_Weapon_Ranged,
            EPerceptionCharacterType::Instigator,
            EPerceptionCharacterType::AffectedCharacter
        ));

    // Too many unintentional attack hits seen
    default Rules.Add(GameplayTag::AIEvent_Seen_AttackHit_OnOther_Weapon_Ranged)
        .RequireTrue(
            Assessed::AwareOfInstigator |
            Assessed::IsTooManyUnintentionalHits
        )
        .RequireFalse(
            Assessed::IsIntentionalAttack |
            Assessed::AffectedIsTrainingWithInstigator |
            Assessed::AffectedWasEnemy |
            Assessed::IsPettyFight |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_Assault_Weapon_Ranged,
            EPerceptionCharacterType::Instigator,
            EPerceptionCharacterType::AffectedCharacter
        ));
    
    // Seen attacker after too many unintentional attacks with weapon
    default Rules.Add(GameplayTag::AIEvent_Seen_Attacker)
        .EventHasTag(GameplayTag::AIEvent_Seen_AttackHit_OnOther_Weapon_Ranged)
        .RequireTrue(
            Assessed::IsTooManyUnintentionalHits
        )
        .RequireFalse(
            Assessed::IsIntentionalAttack |
            Assessed::SelfIsTrainingWithInstigator |
            Assessed::AffectedWasEnemy |
            Assessed::IsPettyFight |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_Assault_Weapon_Ranged,
            EPerceptionCharacterType::Instigator,
            EPerceptionCharacterType::AffectedCharacter
        ));

    // Seen attacker after intentional attack with weapon
    default Rules.Add(GameplayTag::AIEvent_Seen_Attacker)
        .EventHasTag(GameplayTag::AIEvent_Seen_AttackHit_OnOther_Weapon_Ranged)
        .RequireTrue(
            Assessed::IsIntentionalAttack
        )
        .RequireFalse(
            Assessed::SelfIsTrainingWithInstigator |
            Assessed::AffectedWasEnemy |
            Assessed::IsPettyFight |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_Assault_Weapon_Ranged,
            EPerceptionCharacterType::Instigator,
            EPerceptionCharacterType::AffectedCharacter
        ));
}

class UAIARM_Crime_Assault_Perception_OnNonEnemy_Magic_HighThreat : UAIAssessmentResponseModule
{
    // Intentional Attack hit seen
    default Rules.Add(GameplayTag::AIEvent_Seen_AttackHit_OnOther_Weapon_Magic_HighThreat)
        .RequireTrue(
            Assessed::AwareOfInstigator |
            Assessed::IsIntentionalAttack
        )
        .RequireFalse(
            Assessed::AffectedIsTrainingWithInstigator |
            Assessed::AffectedWasEnemy |
            Assessed::IsPettyFight |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_Assault_Weapon_Magic_HighThreat,
            EPerceptionCharacterType::Instigator,
            EPerceptionCharacterType::AffectedCharacter
        ));

    // Too many unintentional attack hits seen
    default Rules.Add(GameplayTag::AIEvent_Seen_AttackHit_OnOther_Weapon_Magic_HighThreat)
        .RequireTrue(
            Assessed::AwareOfInstigator |
            Assessed::IsTooManyUnintentionalHits
        )
        .RequireFalse(
            Assessed::IsIntentionalAttack |
            Assessed::AffectedIsTrainingWithInstigator |
            Assessed::AffectedWasEnemy |
            Assessed::IsPettyFight |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_Assault_Weapon_Magic_HighThreat,
            EPerceptionCharacterType::Instigator,
            EPerceptionCharacterType::AffectedCharacter
        ));
    
    // Seen attacker after too many unintentional attacks with weapon
    default Rules.Add(GameplayTag::AIEvent_Seen_Attacker)
        .EventHasTag(GameplayTag::AIEvent_Seen_AttackHit_OnOther_Weapon_Magic_HighThreat)
        .RequireTrue(
            Assessed::IsTooManyUnintentionalHits
        )
        .RequireFalse(
            Assessed::IsIntentionalAttack |
            Assessed::SelfIsTrainingWithInstigator |
            Assessed::AffectedWasEnemy |
            Assessed::IsPettyFight |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_Assault_Weapon_Magic_HighThreat,
            EPerceptionCharacterType::Instigator,
            EPerceptionCharacterType::AffectedCharacter
        ));

    // Seen attacker after intentional attack with weapon
    default Rules.Add(GameplayTag::AIEvent_Seen_Attacker)
        .EventHasTag(GameplayTag::AIEvent_Seen_AttackHit_OnOther_Weapon_Magic_HighThreat)
        .RequireTrue(
            Assessed::IsIntentionalAttack
        )
        .RequireFalse(
            Assessed::SelfIsTrainingWithInstigator |
            Assessed::AffectedWasEnemy |
            Assessed::IsPettyFight |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_Assault_Weapon_Magic_HighThreat,
            EPerceptionCharacterType::Instigator,
            EPerceptionCharacterType::AffectedCharacter
        ));
}

class UAIARM_Crime_Assault_Perception_OnNonEnemy_Magic_LowThreat : UAIAssessmentResponseModule
{
    // Intentional Attack hit seen
    default Rules.Add(GameplayTag::AIEvent_Seen_AttackHit_OnOther_Weapon_Magic_LowThreat)
        .RequireTrue(
            Assessed::AwareOfInstigator |
            Assessed::IsIntentionalAttack
        )
        .RequireFalse(
            Assessed::AffectedIsTrainingWithInstigator |
            Assessed::AffectedWasEnemy |
            Assessed::IsPettyFight |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_Assault_Weapon_Magic_LowThreat,
            EPerceptionCharacterType::Instigator,
            EPerceptionCharacterType::AffectedCharacter
        ));

    // Too many unintentional attack hits seen
    default Rules.Add(GameplayTag::AIEvent_Seen_AttackHit_OnOther_Weapon_Magic_LowThreat)
        .RequireTrue(
            Assessed::AwareOfInstigator |
            Assessed::IsTooManyUnintentionalHits
        )
        .RequireFalse(
            Assessed::IsIntentionalAttack |
            Assessed::AffectedIsTrainingWithInstigator |
            Assessed::AffectedWasEnemy |
            Assessed::IsPettyFight |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_Assault_Weapon_Magic_LowThreat,
            EPerceptionCharacterType::Instigator,
            EPerceptionCharacterType::AffectedCharacter
        ));
    
    // Seen attacker after too many unintentional attacks with weapon
    default Rules.Add(GameplayTag::AIEvent_Seen_Attacker)
        .EventHasTag(GameplayTag::AIEvent_Seen_AttackHit_OnOther_Weapon_Magic_LowThreat)
        .RequireTrue(
            Assessed::IsTooManyUnintentionalHits
        )
        .RequireFalse(
            Assessed::IsIntentionalAttack |
            Assessed::SelfIsTrainingWithInstigator |
            Assessed::AffectedWasEnemy |
            Assessed::IsPettyFight |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_Assault_Weapon_Magic_LowThreat,
            EPerceptionCharacterType::Instigator,
            EPerceptionCharacterType::AffectedCharacter
        ));

    // Seen attacker after intentional attack with weapon
    default Rules.Add(GameplayTag::AIEvent_Seen_Attacker)
        .EventHasTag(GameplayTag::AIEvent_Seen_AttackHit_OnOther_Weapon_Magic_LowThreat)
        .RequireTrue(
            Assessed::IsIntentionalAttack
        )
        .RequireFalse(
            Assessed::SelfIsTrainingWithInstigator |
            Assessed::AffectedWasEnemy |
            Assessed::IsPettyFight |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_Assault_Weapon_Magic_LowThreat,
            EPerceptionCharacterType::Instigator,
            EPerceptionCharacterType::AffectedCharacter
        ));
}


class UAIARM_Crime_Assault_Perception_OnProtected : UAIAssessmentResponseModule
{
    default SubModules.Add(UAIARM_Crime_Assault_Perception_OnProtected_Fists);
    default SubModules.Add(UAIARM_Crime_Assault_Perception_OnProtected_Melee);
    default SubModules.Add(UAIARM_Crime_Assault_Perception_OnProtected_Ranged);
    default SubModules.Add(UAIARM_Crime_Assault_Perception_OnProtected_Magic_HighThreat);
    default SubModules.Add(UAIARM_Crime_Assault_Perception_OnProtected_Magic_LowThreat);   
}

class UAIARM_Crime_Assault_Perception_OnProtected_Fists : UAIAssessmentResponseModule
{
    // Intentional Attack hit seen
    default Rules.Add(GameplayTag::AIEvent_Seen_AttackHit_OnOther_Fist)
        .RequireTrue(
            Assessed::AwareOfInstigator |
            Assessed::IsIntentionalAttack |
            Assessed::AffectedIsProtected
        )
        .RequireFalse(
            Assessed::AffectedIsTrainingWithInstigator |
            Assessed::IsPettyFight |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_Assault_Fists,
            EPerceptionCharacterType::Instigator,
            EPerceptionCharacterType::AffectedCharacter
        ));

    // Too many unintentional attack hits seen
    default Rules.Add(GameplayTag::AIEvent_Seen_AttackHit_OnOther_Fist)
        .RequireTrue(
            Assessed::AwareOfInstigator |
            Assessed::IsTooManyUnintentionalHits |
            Assessed::AffectedIsProtected
        )
        .RequireFalse(
            Assessed::IsIntentionalAttack |
            Assessed::AffectedIsTrainingWithInstigator |
            Assessed::IsPettyFight |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_Assault_Fists,
            EPerceptionCharacterType::Instigator,
            EPerceptionCharacterType::AffectedCharacter
        ));
    
    // Seen attacker after too many unintentional attacks
    default Rules.Add(GameplayTag::AIEvent_Seen_Attacker)
        .EventHasTag(GameplayTag::AIEvent_Seen_AttackHit_OnOther_Fist)
        .RequireTrue(
            Assessed::IsTooManyUnintentionalHits |
            Assessed::AffectedIsProtected
        )
        .RequireFalse(
            Assessed::IsIntentionalAttack |
            Assessed::SelfIsTrainingWithInstigator |
            Assessed::IsPettyFight |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_Assault_Fists,
            EPerceptionCharacterType::Instigator,
            EPerceptionCharacterType::AffectedCharacter
        ));

    // Seen attacker after intentional attack
    default Rules.Add(GameplayTag::AIEvent_Seen_Attacker)
        .EventHasTag(GameplayTag::AIEvent_Seen_AttackHit_OnOther_Fist)
        .RequireTrue(
            Assessed::IsIntentionalAttack |
            Assessed::AffectedIsProtected
        )
        .RequireFalse(
            Assessed::SelfIsTrainingWithInstigator |
            Assessed::IsPettyFight |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_Assault_Fists,
            EPerceptionCharacterType::Instigator,
            EPerceptionCharacterType::AffectedCharacter
        ));
}

class UAIARM_Crime_Assault_Perception_OnProtected_Melee : UAIAssessmentResponseModule
{
    // Intentional Attack hit seen
    default Rules.Add(GameplayTag::AIEvent_Seen_AttackHit_OnOther_Weapon_Melee)
        .RequireTrue(
            Assessed::AwareOfInstigator |
            Assessed::IsIntentionalAttack |
            Assessed::AffectedIsProtected
        )
        .RequireFalse(
            Assessed::AffectedIsTrainingWithInstigator |
            Assessed::IsPettyFight |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_Assault_Weapon_Melee,
            EPerceptionCharacterType::Instigator,
            EPerceptionCharacterType::AffectedCharacter
        ));

    // Too many unintentional attack hits seen
    default Rules.Add(GameplayTag::AIEvent_Seen_AttackHit_OnOther_Weapon_Melee)
        .RequireTrue(
            Assessed::AwareOfInstigator |
            Assessed::IsTooManyUnintentionalHits |
            Assessed::AffectedIsProtected
        )
        .RequireFalse(
            Assessed::IsIntentionalAttack |
            Assessed::AffectedIsTrainingWithInstigator |
            Assessed::IsPettyFight |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_Assault_Weapon_Melee,
            EPerceptionCharacterType::Instigator,
            EPerceptionCharacterType::AffectedCharacter
        ));
    
    // Seen attacker after too many unintentional attacks
    default Rules.Add(GameplayTag::AIEvent_Seen_Attacker)
        .EventHasTag(GameplayTag::AIEvent_Seen_AttackHit_OnOther_Weapon_Melee)
        .RequireTrue(
            Assessed::IsTooManyUnintentionalHits |
            Assessed::AffectedIsProtected
        )
        .RequireFalse(
            Assessed::IsIntentionalAttack |
            Assessed::SelfIsTrainingWithInstigator |
            Assessed::IsPettyFight |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_Assault_Weapon_Melee,
            EPerceptionCharacterType::Instigator,
            EPerceptionCharacterType::AffectedCharacter
        ));

    // Seen attacker after intentional attack
    default Rules.Add(GameplayTag::AIEvent_Seen_Attacker)
        .EventHasTag(GameplayTag::AIEvent_Seen_AttackHit_OnOther_Weapon_Melee)
        .RequireTrue(
            Assessed::IsIntentionalAttack |
            Assessed::AffectedIsProtected
        )
        .RequireFalse(
            Assessed::SelfIsTrainingWithInstigator |
            Assessed::IsPettyFight |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_Assault_Weapon_Melee,
            EPerceptionCharacterType::Instigator,
            EPerceptionCharacterType::AffectedCharacter
        ));
}

class UAIARM_Crime_Assault_Perception_OnProtected_Ranged : UAIAssessmentResponseModule
{
    // Intentional Attack hit seen
    default Rules.Add(GameplayTag::AIEvent_Seen_AttackHit_OnOther_Weapon_Ranged)
        .RequireTrue(
            Assessed::AwareOfInstigator |
            Assessed::IsIntentionalAttack |
            Assessed::AffectedIsProtected
        )
        .RequireFalse(
            Assessed::AffectedIsTrainingWithInstigator |
            Assessed::IsPettyFight |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_Assault_Weapon_Ranged,
            EPerceptionCharacterType::Instigator,
            EPerceptionCharacterType::AffectedCharacter
        ));

    // Too many unintentional attack hits seen
    default Rules.Add(GameplayTag::AIEvent_Seen_AttackHit_OnOther_Weapon_Ranged)
        .RequireTrue(
            Assessed::AwareOfInstigator |
            Assessed::IsTooManyUnintentionalHits |
            Assessed::AffectedIsProtected
        )
        .RequireFalse(
            Assessed::IsIntentionalAttack |
            Assessed::AffectedIsTrainingWithInstigator |
            Assessed::IsPettyFight |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_Assault_Weapon_Ranged,
            EPerceptionCharacterType::Instigator,
            EPerceptionCharacterType::AffectedCharacter
        ));

    // Seen attacker after too many unintentional attacks
    default Rules.Add(GameplayTag::AIEvent_Seen_Attacker)
        .EventHasTag(GameplayTag::AIEvent_Seen_AttackHit_OnOther_Weapon_Ranged)
        .RequireTrue(
            Assessed::IsTooManyUnintentionalHits |
            Assessed::AffectedIsProtected
        )
        .RequireFalse(
            Assessed::IsIntentionalAttack |
            Assessed::SelfIsTrainingWithInstigator |
            Assessed::IsPettyFight |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_Assault_Weapon_Ranged,
            EPerceptionCharacterType::Instigator,
            EPerceptionCharacterType::AffectedCharacter
        ));

    // Seen attacker after intentional attack
    default Rules.Add(GameplayTag::AIEvent_Seen_Attacker)
        .EventHasTag(GameplayTag::AIEvent_Seen_AttackHit_OnOther_Weapon_Ranged)
        .RequireTrue(
            Assessed::IsIntentionalAttack |
            Assessed::AffectedIsProtected
        )
        .RequireFalse(
            Assessed::SelfIsTrainingWithInstigator |
            Assessed::IsPettyFight |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_Assault_Weapon_Ranged,
            EPerceptionCharacterType::Instigator,
            EPerceptionCharacterType::AffectedCharacter
        ));
}

class UAIARM_Crime_Assault_Perception_OnProtected_Magic_HighThreat : UAIAssessmentResponseModule
{
    // Intentional Attack hit seen
    default Rules.Add(GameplayTag::AIEvent_Seen_AttackHit_OnOther_Weapon_Magic_HighThreat)
        .RequireTrue(
            Assessed::AwareOfInstigator |
            Assessed::IsIntentionalAttack |
            Assessed::AffectedIsProtected
        )
        .RequireFalse(
            Assessed::AffectedIsTrainingWithInstigator |
            Assessed::IsPettyFight |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_Assault_Weapon_Magic_HighThreat,
            EPerceptionCharacterType::Instigator,
            EPerceptionCharacterType::AffectedCharacter
        ));

    // Too many unintentional attack hits seen
    default Rules.Add(GameplayTag::AIEvent_Seen_AttackHit_OnOther_Weapon_Magic_HighThreat)
        .RequireTrue(
            Assessed::AwareOfInstigator |
            Assessed::IsTooManyUnintentionalHits |
            Assessed::AffectedIsProtected
        )
        .RequireFalse(
            Assessed::IsIntentionalAttack |
            Assessed::AffectedIsTrainingWithInstigator |
            Assessed::IsPettyFight |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_Assault_Weapon_Magic_HighThreat,
            EPerceptionCharacterType::Instigator,
            EPerceptionCharacterType::AffectedCharacter
        ));
    
    // Seen attacker after too many unintentional attacks
    default Rules.Add(GameplayTag::AIEvent_Seen_Attacker)
        .EventHasTag(GameplayTag::AIEvent_Seen_AttackHit_OnOther_Weapon_Magic_HighThreat)
        .RequireTrue(
            Assessed::IsTooManyUnintentionalHits |
            Assessed::AffectedIsProtected
        )
        .RequireFalse(
            Assessed::IsIntentionalAttack |
            Assessed::SelfIsTrainingWithInstigator |
            Assessed::IsPettyFight |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_Assault_Weapon_Magic_HighThreat,
            EPerceptionCharacterType::Instigator,
            EPerceptionCharacterType::AffectedCharacter
        ));

    // Seen attacker after intentional attack
    default Rules.Add(GameplayTag::AIEvent_Seen_Attacker)
        .EventHasTag(GameplayTag::AIEvent_Seen_AttackHit_OnOther_Weapon_Magic_HighThreat)
        .RequireTrue(
            Assessed::IsIntentionalAttack |
            Assessed::AffectedIsProtected
        )
        .RequireFalse(
            Assessed::SelfIsTrainingWithInstigator |
            Assessed::IsPettyFight |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_Assault_Weapon_Magic_HighThreat,
            EPerceptionCharacterType::Instigator,
            EPerceptionCharacterType::AffectedCharacter
        ));
}

class UAIARM_Crime_Assault_Perception_OnProtected_Magic_LowThreat : UAIAssessmentResponseModule
{
    // Intentional Attack hit seen
    default Rules.Add(GameplayTag::AIEvent_Seen_AttackHit_OnOther_Weapon_Magic_LowThreat)
        .RequireTrue(
            Assessed::AwareOfInstigator |
            Assessed::IsIntentionalAttack |
            Assessed::AffectedIsProtected
        )
        .RequireFalse(
            Assessed::AffectedIsTrainingWithInstigator |
            Assessed::IsPettyFight |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_Assault_Weapon_Magic_LowThreat,
            EPerceptionCharacterType::Instigator,
            EPerceptionCharacterType::AffectedCharacter
        ));

    // Too many unintentional attack hits seen
    default Rules.Add(GameplayTag::AIEvent_Seen_AttackHit_OnOther_Weapon_Magic_LowThreat)
        .RequireTrue(
            Assessed::AwareOfInstigator |
            Assessed::IsTooManyUnintentionalHits |
            Assessed::AffectedIsProtected
        )
        .RequireFalse(
            Assessed::IsIntentionalAttack |
            Assessed::AffectedIsTrainingWithInstigator |
            Assessed::IsPettyFight |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_Assault_Weapon_Magic_LowThreat,
            EPerceptionCharacterType::Instigator,
            EPerceptionCharacterType::AffectedCharacter
        ));

    // Seen attacker after too many unintentional attacks
    default Rules.Add(GameplayTag::AIEvent_Seen_Attacker)
        .EventHasTag(GameplayTag::AIEvent_Seen_AttackHit_OnOther_Weapon_Magic_LowThreat)
        .RequireTrue(
            Assessed::IsTooManyUnintentionalHits |
            Assessed::AffectedIsProtected
        )
        .RequireFalse(
            Assessed::IsIntentionalAttack |
            Assessed::SelfIsTrainingWithInstigator |
            Assessed::IsPettyFight |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_Assault_Weapon_Magic_LowThreat,
            EPerceptionCharacterType::Instigator,
            EPerceptionCharacterType::AffectedCharacter
        ));

    // Seen attacker after intentional attack
    default Rules.Add(GameplayTag::AIEvent_Seen_Attacker)
        .EventHasTag(GameplayTag::AIEvent_Seen_AttackHit_OnOther_Weapon_Magic_LowThreat)
        .RequireTrue(
            Assessed::IsIntentionalAttack |
            Assessed::AffectedIsProtected
        )
        .RequireFalse(
            Assessed::SelfIsTrainingWithInstigator |
            Assessed::IsPettyFight |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AssessCrime(
            GameplayTag::Crime_Assault_Weapon_Magic_LowThreat,
            EPerceptionCharacterType::Instigator,
            EPerceptionCharacterType::AffectedCharacter
        ));
}

class UAIARM_Crime_Assault_Responses : UAIAssessmentResponseModule
{
    default SubModules.Add(UAIARM_Crime_Assault_Responses_All);
    default SubModules.Add(UAIARM_Crime_Assault_Responses_FightOrFlight);
}

class UAIARM_Crime_Assault_Responses_All : UAIAssessmentResponseModule
{
    default SubModules.Add(UAIARM_Crime_Assault_Responses_ToDamagedSelf);
    default SubModules.Add(UAIARM_Crime_Assault_Responses_ModifiersOnly);
    default SubModules.Add(UAIARM_Crime_Assault_ToWatchFight);
    default SubModules.Add(UAIARM_Crime_Assault_ToWatchFight_FromGetGuard);   
}

class UAIARM_Crime_Assault_Responses_FightOrFlight : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Combat);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Debuff_Fear);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Fear);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Disengage);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee_GetGuardHelp);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Debuff_Defeated);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::State_Defeated);

    default SubModules.Add(UAIARM_Crime_Assault_Weapon_Responses_FightOrFlight);
    default SubModules.Add(UAIARM_Crime_Assault_Fists_Responses_FightOrFlight);
}

class UAIARM_Crime_Assault_ToWatchFight : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_WatchFight);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_DailyRoutine_WatchFight);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Combat);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_GoGetGuard);

    default SubModules.Add(UAIARM_Crime_Assault_ToWatchFight_WatchGuardFight);

    default Rules.Add(GameplayTag::Crime_Assault)
        .RequireTrue(
            Assessed::AffectedIsProtected |
            Assessed::InstigatorWasFriendly
        )
        .RequireFalse(
            Assessed::AffectedIsSelf |
            Assessed::IsCrimeSeverityHigh |
            Assessed::IsCrimeSeverityCritical
        )
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_WatchFight_Initial_TheresAFight, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchStateWithConflictType(GameplayTag::AIState_Conflict_WatchFight, EPerceptionCharacterType::None, EConflictType::None));
    
    default Rules.Add(GameplayTag::Crime_Assault)
        .RequireTrue(
            Assessed::AffectedWasFriendly |
            Assessed::InstigatorWasFriendly
        )
        .RequireFalse(
            Assessed::AffectedIsSelf |
            Assessed::IsCrimeSeverityHigh |
            Assessed::IsCrimeSeverityCritical
        )
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_WatchFight_Initial_TheresAFight, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchStateWithConflictType(GameplayTag::AIState_Conflict_WatchFight, EPerceptionCharacterType::None, EConflictType::None));

    default Rules.Add(GameplayTag::Crime_Assault)
        .RequireFalse(
            Assessed::AffectedIsProtected |
            Assessed::InstigatorWasFriendly |
            Assessed::AffectedIsSelf |
            Assessed::IsCrimeSeverityHigh |
            Assessed::IsCrimeSeverityCritical
        )
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_WatchFight_Initial_TheresAFight, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchStateWithConflictType(GameplayTag::AIState_Conflict_WatchFight, EPerceptionCharacterType::None, EConflictType::None));
    
    default Rules.Add(GameplayTag::Crime_Assault)
        .RequireTrue(
            Assessed::InstigatorWasFriendly |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .RequireFalse(
            Assessed::AffectedIsProtected |
            Assessed::AffectedWasFriendly |
            Assessed::IsCrimeSeverityHigh |
            Assessed::IsCrimeSeverityCritical
        )
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_WatchFight_Initial_TheresAFight, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchStateWithConflictType(GameplayTag::AIState_Conflict_WatchFight, EPerceptionCharacterType::None, EConflictType::None));

    default Rules.Add(GameplayTag::Crime_Assault)
        .RequireTrue(
            Assessed::AffectedWasFriendly |
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::IsInPartyWithAffected
        )
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_WatchFight_Initial_TheresAFight, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchStateWithConflictType(GameplayTag::AIState_Conflict_WatchFight, EPerceptionCharacterType::None, EConflictType::None));

    default Rules.Add(GameplayTag::Crime_Assault)
        .RequireTrue(
            Assessed::InstigatorWasFriendly |
            Assessed::AffectedWasEnemy |
            Assessed::AffectedIsStrongerThanSelf |
            Assessed::IsInPartyWithInstigator
        )
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_WatchFight_Initial_TheresAFight, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchStateWithConflictType(GameplayTag::AIState_Conflict_WatchFight, EPerceptionCharacterType::None, EConflictType::None));
}

class UAIARM_Crime_Assault_ToWatchFight_WatchGuardFight : UAIAssessmentResponseModule
{
    default RequireAssessedToHaveAnyOwnedTags.AddTag(GameplayTag::CampRole_Guard);

    default Rules.Add(GameplayTag::Crime_Assault)
        .RequireTrue(
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved |
            Assessed::AffectedWasFriendly |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .RequireFalse(
            Assessed::InstigatorWasFriendly |
            Assessed::AffectedIsProtected |
            Assessed::AffectedWasFriendly |
            Assessed::IsCrimeSeverityHigh |
            Assessed::IsCrimeSeverityCritical
        )
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_WatchFight_Initial_TheresAFight, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchStateWithConflictType(GameplayTag::AIState_Conflict_WatchFight, EPerceptionCharacterType::None, EConflictType::None));
}

class UAIARM_Crime_Assault_ToWatchFight_FromGetGuard : UAIAssessmentResponseModule
{
    default RequireAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_GoGetGuard);

    default SubModules.Add(UAIARM_Crime_Assault_ToWatchFight_FromGetGuard_WatchGuardFight);

    default Rules.Add(GameplayTag::Crime_Assault)
        .RequireFalse(
            Assessed::AffectedIsProtected |
            Assessed::InstigatorWasFriendly |
            Assessed::AffectedIsSelf |
            Assessed::IsCrimeSeverityHigh |
            Assessed::IsCrimeSeverityCritical
        )
        .Then(UAIEventResponse_SwitchStateWithConflictType(GameplayTag::AIState_Conflict_WatchFight, EPerceptionCharacterType::None, EConflictType::None));
    
    default Rules.Add(GameplayTag::Crime_Assault)
        .RequireTrue(
            Assessed::InstigatorWasFriendly |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .RequireFalse(
            Assessed::AffectedIsProtected |
            Assessed::AffectedWasFriendly |
            Assessed::IsCrimeSeverityHigh |
            Assessed::IsCrimeSeverityCritical
        )
        .Then(UAIEventResponse_SwitchStateWithConflictType(GameplayTag::AIState_Conflict_WatchFight, EPerceptionCharacterType::None, EConflictType::None));
}

class UAIARM_Crime_Assault_ToWatchFight_FromGetGuard_WatchGuardFight : UAIAssessmentResponseModule
{
    default RequireAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_GoGetGuard);

    default RequireAssessedToHaveAnyOwnedTags.AddTag(GameplayTag::CampRole_Guard);

    default Rules.Add(GameplayTag::Crime_Assault)
        .RequireTrue(
            Assessed::AffectedWasFriendly |
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .RequireFalse(
            Assessed::InstigatorWasFriendly |
            Assessed::AffectedIsProtected |
            Assessed::AffectedWasFriendly |
            Assessed::IsCrimeSeverityHigh |
            Assessed::IsCrimeSeverityCritical
        )
        .Then(UAIEventResponse_SwitchStateWithConflictType(GameplayTag::AIState_Conflict_WatchFight, EPerceptionCharacterType::None, EConflictType::None));
}

class UAIARM_Crime_Assault_Responses_ModifiersOnly: UAIAssessmentResponseModule
{
    default RequireAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Combat);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Fear);

    default SubModules.Add(UAIARM_Crime_Assault_Weapon_Responses_ModifiersOnly);
    default SubModules.Add(UAIARM_Crime_Assault_Fists_Responses_ModifiersOnly);
}

//// RULES
class UAIARM_Crime_Assault_Responses_ToDamagedSelf : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_ReactToTakingDamage);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Combat);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Disengage);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Fear);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Debuff_Fear);

    default SubModules.Add(UAIARM_Crime_Assault_Responses_ToDamagedSelf_LowThreatMagic);

    // Affected is self
    default Rules.Add(GameplayTag::Crime_Assault_Fists)
        .RequireTrue(
            Assessed::AffectedIsSelf
        )
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Noise_Damage, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchStateWithConflictType(GameplayTag::AIState_Conflict_ReactToTakingDamage, EPerceptionCharacterType::None, EConflictType::None));
    
    default Rules.Add(GameplayTag::Crime_Assault_Weapon_Magic_HighThreat)
        .RequireTrue(
            Assessed::AffectedIsSelf
        )
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Noise_Damage, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchStateWithConflictType(GameplayTag::AIState_Conflict_ReactToTakingDamage, EPerceptionCharacterType::None, EConflictType::None));

    default Rules.Add(GameplayTag::Crime_Assault_Weapon_Melee)
        .RequireTrue(
            Assessed::AffectedIsSelf
        )
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Noise_Damage, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchStateWithConflictType(GameplayTag::AIState_Conflict_ReactToTakingDamage, EPerceptionCharacterType::None, EConflictType::None));

    default Rules.Add(GameplayTag::Crime_Assault_Weapon_Ranged)
        .RequireTrue(
            Assessed::AffectedIsSelf
        )
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Noise_Damage, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchStateWithConflictType(GameplayTag::AIState_Conflict_ReactToTakingDamage, EPerceptionCharacterType::None, EConflictType::None));
}

class UAIARM_Crime_Assault_Responses_ToDamagedSelf_LowThreatMagic : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_MagicSleep);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Charmed);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Debuff_Sleep);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Debuff_Charm);

    default Rules.Add(GameplayTag::Crime_Assault_Weapon_Magic_LowThreat)
        .RequireTrue(
            Assessed::AffectedIsSelf
        )
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Noise_Damage, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchStateWithConflictType(GameplayTag::AIState_Conflict_ReactToTakingDamage, EPerceptionCharacterType::None, EConflictType::None));
}

class UAIARM_Crime_Assault_Weapon_Responses_ModifiersOnly : UAIAssessmentResponseModule
{
    // Affected is self
    default Rules.Add(GameplayTag::Crime_Assault_Weapon)
        .RequireTrue(
            Assessed::AffectedIsSelf |
            Assessed::IsPettyFight
        )
        .Then(UAIEventResponse_ForgiveLastCrimeOfTypeRelevantToSelf(EPerceptionCharacterType::Instigator, GameplayTag::Crime_Assault_Weapon));
    
    default Rules.Add(GameplayTag::Crime_Assault_Weapon)
        .RequireTrue(
            Assessed::AffectedIsSelf |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_ForgiveLastCrimeOfTypeRelevantToSelf(EPerceptionCharacterType::Instigator, GameplayTag::Crime_Assault_Weapon));

    default Rules.Add(GameplayTag::Crime_Assault_Weapon)
        .RequireTrue(
            Assessed::AffectedIsSelf
        )
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator));
    
    // Affected is protected
    default Rules.Add(GameplayTag::Crime_Assault_Weapon)
        .RequireTrue(
            Assessed::AffectedIsProtected
        )
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator));
    
    // Affected is friendly
    default Rules.Add(GameplayTag::Crime_Assault_Weapon)
        .RequireTrue(
            Assessed::AffectedWasFriendly
        )
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::AffectedIsProtected
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator));
}

class UAIARM_Crime_Assault_Weapon_Responses_FightOrFlight : UAIAssessmentResponseModule
{
    default SubModules.Add(UAIARM_Crime_Assault_Weapon_Responses_FightOrFlight_FromDamagedSelf);

    // Affected is protected
    default Rules.Add(GameplayTag::Crime_Assault_Weapon)
        .RequireTrue(
            Assessed::AffectedIsProtected
        )
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::Instigator)
            .AddContextTagToTarget(GameplayTag::VoicelineContext_AttackedCharge));
    
    // Affected is friendly
    default Rules.Add(GameplayTag::Crime_Assault_Weapon)
        .RequireTrue(
            Assessed::AffectedWasFriendly
        )
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::AffectedIsProtected |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::Instigator));

    // Instigator is stronger
    default Rules.Add(GameplayTag::Crime_Assault_Weapon)
        .RequireTrue(
            Assessed::AffectedWasFriendly |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved |
            Assessed::IsInPartyWithAffected
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Flee_GetGuardHelp, EPerceptionCharacterType::Instigator)
                .AddContextTag(GameplayTag::Action_Ambient_GetJumpscared));
    
    default Rules.Add(GameplayTag::Crime_Assault_Weapon)
        .RequireTrue(
            Assessed::AffectedIsProtected |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::AffectedWasFriendly |
            Assessed::IsInPartyWithAffected
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Flee_GetGuardHelp, EPerceptionCharacterType::Instigator)
                .AddContextTag(GameplayTag::Action_Ambient_GetJumpscared));
}

class UAIARM_Crime_Assault_Weapon_Responses_FightOrFlight_FromDamagedSelf : UAIAssessmentResponseModule
{
    default RequireAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_ReactToTakingDamage);

    // Affected is self
    default Rules.Add(GameplayTag::Crime_Assault_Weapon)
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::Instigator));

    // Instigator is stronger
    default Rules.Add(GameplayTag::Crime_Assault_Weapon)
        .RequireTrue(
            Assessed::InstigatorIsStrongerThanSelf
        )
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Flee_GetGuardHelp, EPerceptionCharacterType::Instigator));
    
    default Rules.Add(GameplayTag::Crime_Assault_Weapon)
        .RequireTrue(
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Flee, EPerceptionCharacterType::Instigator));
}

class UAIARM_Crime_Assault_Fists_Responses_ModifiersOnly : UAIAssessmentResponseModule
{
    default SubModules.Add(UAIARM_Crime_Assault_Fists_Responses_ModifiersOnly_GuardRole);
    default SubModules.Add(UAIARM_Crime_Assault_Fists_Responses_ModifiersOnly_NoGuardRole);

    default Rules.Add(GameplayTag::Crime_Assault_Weapon)
        .RequireTrue(
            Assessed::AffectedIsSelf |
            Assessed::IsPettyFight
        )
        .Then(UAIEventResponse_ForgiveLastCrimeOfTypeRelevantToSelf(EPerceptionCharacterType::Instigator, GameplayTag::Crime_Assault_Weapon));
    
    default Rules.Add(GameplayTag::Crime_Assault_Weapon)
        .RequireTrue(
            Assessed::AffectedIsSelf |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_ForgiveLastCrimeOfTypeRelevantToSelf(EPerceptionCharacterType::Instigator, GameplayTag::Crime_Assault_Weapon));
}

class UAIARM_Crime_Assault_Fists_Responses_FightOrFlight : UAIAssessmentResponseModule
{
    default SubModules.Add(UAIARM_Crime_Assault_Fists_Responses_FightOrFlight_GuardRole);
    default SubModules.Add(UAIARM_Crime_Assault_Fists_Responses_FightOrFlight_NoGuardRole);    
}

class UAIARM_Crime_Assault_Fists_Responses_ModifiersOnly_GuardRole : UAIARM_GuardOrLeaderRole
{
    default SubModules.Add(UAIARM_Crime_Assault_Fists_Responses_ModifiersOnly_GuardRole_FromDamagedSelf);

    // Affected is protected
    default Rules.Add(GameplayTag::Crime_Assault_Fists)
        .RequireTrue(
            Assessed::AffectedIsProtected
        )
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator));
    
    // Affected is friendly
    default Rules.Add(GameplayTag::Crime_Assault_Fists)
        .RequireTrue(
            Assessed::AffectedWasFriendly
        )
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::AffectedIsProtected
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator));
}

class UAIARM_Crime_Assault_Fists_Responses_ModifiersOnly_GuardRole_FromDamagedSelf : UAIAssessmentResponseModule
{
    default RequireAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_ReactToTakingDamage);

    default Rules.Add(GameplayTag::Crime_Assault_Fists)
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator));
}

class UAIARM_Crime_Assault_Fists_Responses_ModifiersOnly_NoGuardRole : UAIARM_NoGuardNorLeaderRole
{
    default SubModules.Add(UAIARM_Crime_Assault_Fists_Responses_ModifiersOnly_NoGuardRole_FromDamagedSelf);
    
    // Affected is protected
    default Rules.Add(GameplayTag::Crime_Assault_Fists)
        .RequireTrue(
            Assessed::AffectedIsProtected
        )
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator));
    
    // Affected is friendly
    default Rules.Add(GameplayTag::Crime_Assault_Fists)
        .RequireTrue(
            Assessed::AffectedWasFriendly
        )
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::AffectedIsProtected
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator));
}

class UAIARM_Crime_Assault_Fists_Responses_ModifiersOnly_NoGuardRole_FromDamagedSelf : UAIAssessmentResponseModule
{
    default RequireAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_ReactToTakingDamage);

    default Rules.Add(GameplayTag::Crime_Assault_Fists)
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator));
}

class UAIARM_Crime_Assault_Fists_Responses_FightOrFlight_GuardRole : UAIARM_GuardOrLeaderRole
{
    default SubModules.Add(UAIARM_Crime_Assault_Fists_Responses_FightOrFlight_GuardRole_FromDamagedSelf);

    // Affected is protected
    default Rules.Add(GameplayTag::Crime_Assault_Fists)
        .RequireTrue(
            Assessed::AffectedIsProtected
        )
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::Instigator)
            .AddContextTagToTarget(GameplayTag::VoicelineContext_AttackedCharge));
    
    // Affected is friendly
    default Rules.Add(GameplayTag::Crime_Assault_Fists)
        .RequireTrue(
            Assessed::AffectedWasFriendly
        )
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::AffectedIsProtected |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::Instigator));

    // Instigator is stronger
    default Rules.Add(GameplayTag::Crime_Assault_Fists)
        .RequireTrue(
            Assessed::AffectedWasFriendly |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved |
            Assessed::IsInPartyWithAffected
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Flee_GetGuardHelp, EPerceptionCharacterType::Instigator)
                .AddContextTag(GameplayTag::Action_Ambient_GetJumpscared));
    
    default Rules.Add(GameplayTag::Crime_Assault_Fists)
        .RequireTrue(
            Assessed::AffectedIsProtected |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::AffectedWasFriendly |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved |
            Assessed::IsInPartyWithAffected
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Flee_GetGuardHelp, EPerceptionCharacterType::Instigator)
                .AddContextTag(GameplayTag::Action_Ambient_GetJumpscared));
}

class UAIARM_Crime_Assault_Fists_Responses_FightOrFlight_GuardRole_FromDamagedSelf : UAIAssessmentResponseModule
{
    default RequireAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_ReactToTakingDamage);

    default Rules.Add(GameplayTag::Crime_Assault_Fists)
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::Instigator));

    default Rules.Add(GameplayTag::Crime_Assault_Fists)
        .RequireTrue(
            Assessed::InstigatorIsStrongerThanSelf
        )
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved |
            Assessed::IsInPartyWithAffected
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Flee_GetGuardHelp, EPerceptionCharacterType::Instigator));
    
    default Rules.Add(GameplayTag::Crime_Assault_Fists)
        .RequireTrue(
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::IsInPartyWithAffected
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Flee, EPerceptionCharacterType::Instigator));
}

class UAIARM_Crime_Assault_Fists_Responses_FightOrFlight_NoGuardRole : UAIARM_NoGuardNorLeaderRole
{
    default SubModules.Add(UAIARM_Crime_Assault_Fists_Responses_FightOrFlight_NoGuardRole_FromDamagedSelf);

    // Affected is protected
    default Rules.Add(GameplayTag::Crime_Assault_Fists)
        .RequireTrue(
            Assessed::AffectedIsProtected
        )
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::Instigator)
            .AddContextTagToTarget(GameplayTag::VoicelineContext_AttackedCharge));
    
    // Affected is friendly
    default Rules.Add(GameplayTag::Crime_Assault_Fists)
        .RequireTrue(
            Assessed::AffectedWasFriendly
        )
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::AffectedIsProtected |
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::Instigator));

    // Instigator is stronger
    default Rules.Add(GameplayTag::Crime_Assault_Fists)
        .RequireTrue(
            Assessed::AffectedWasFriendly |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved |
            Assessed::IsInPartyWithAffected
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Flee_GetGuardHelp, EPerceptionCharacterType::Instigator)
                .AddContextTag(GameplayTag::Action_Ambient_GetJumpscared));
    
    default Rules.Add(GameplayTag::Crime_Assault_Fists)
        .RequireTrue(
            Assessed::AffectedIsProtected |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::AffectedWasFriendly |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved |
            Assessed::IsInPartyWithAffected
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Flee_GetGuardHelp, EPerceptionCharacterType::Instigator)
                .AddContextTag(GameplayTag::Action_Ambient_GetJumpscared));
}

class UAIARM_Crime_Assault_Fists_Responses_FightOrFlight_NoGuardRole_FromDamagedSelf : UAIAssessmentResponseModule
{
    default RequireAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_ReactToTakingDamage);

    default Rules.Add(GameplayTag::Crime_Assault_Fists)
        .RequireTrue(
            Assessed::AffectedIsSelf
        )
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::Instigator));

    default Rules.Add(GameplayTag::Crime_Assault_Fists)
        .RequireTrue(
            Assessed::AffectedIsSelf |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Flee_GetGuardHelp, EPerceptionCharacterType::Instigator));
    
    default Rules.Add(GameplayTag::Crime_Assault_Fists)
        .RequireTrue(
            Assessed::AffectedIsSelf |
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Flee, EPerceptionCharacterType::Instigator));
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/// PAST CRIME  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class UAIARM_Crime_PastAssault_Responses : UAIAssessmentResponseModule
{
    default SubModules.Add(UAIARM_Crime_PastAssault_Responses_All);
    default SubModules.Add(UAIARM_Crime_PastAssault_Responses_FightOrFlight);    
}

class UAIARM_Crime_PastAssault_Responses_All : UAIAssessmentResponseModule
{
    default SubModules.Add(UAIARM_Crime_PastAssault_Responses_ModifiersOnly);  
}

class UAIARM_Crime_PastAssault_Responses_FightOrFlight : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Combat);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Debuff_Fear);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Disengage);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee_GetGuardHelp);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Debuff_Defeated);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::State_Defeated);

    default SubModules.Add(UAIARM_Crime_PastAssault_Weapon_Responses_FightOrFlight);
    default SubModules.Add(UAIARM_Crime_PastAssault_Fists_Responses_FightOrFlight);
}

class UAIARM_Crime_PastAssault_Responses_ModifiersOnly: UAIAssessmentResponseModule
{
    default RequiredOwnedTags.AddTag(GameplayTag::AIState_Conflict_Combat);
    default RequiredOwnedTags.AddTag(GameplayTag::AIState_Conflict_Disengage);
    default RequiredOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee);

    default SubModules.Add(UAIARM_Crime_PastAssault_Weapon_Responses_ModifiersOnly);
    default SubModules.Add(UAIARM_Crime_PastAssault_Fists_Responses_ModifiersOnly);
}

/// RULES

class UAIARM_Crime_PastAssault_Weapon_Responses_ModifiersOnly : UAIAssessmentResponseModule
{
    // Affected is self
    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Assault_Weapon)
        .RequireTrue(
            Assessed::AffectedIsSelf
        )
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator));
    
    // Affected is protected
    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Assault_Weapon)
        .RequireTrue(
            Assessed::AffectedIsProtected
        )
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator));
    
    // Affected is friendly
    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Assault_Weapon)
        .RequireTrue(
            Assessed::AffectedWasFriendly
        )
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::AffectedIsProtected
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator));
}

class UAIARM_Crime_PastAssault_Weapon_Responses_FightOrFlight : UAIAssessmentResponseModule
{
    // Affected is self
    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Assault_Weapon)
        .RequireTrue(
            Assessed::AffectedIsSelf
        )
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::Instigator));
    
    // Affected is protected
    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Assault_Weapon)
        .RequireTrue(
            Assessed::AffectedIsProtected
        )
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::Instigator)
            .AddContextTagToTarget(GameplayTag::VoicelineContext_AttackedCharge));
    
    // Affected is friendly
    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Assault_Weapon)
        .RequireTrue(
            Assessed::AffectedWasFriendly
        )
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::AffectedIsProtected |
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::Instigator));

    // Instigator is stronger
    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Assault_Weapon)
        .RequireTrue(
            Assessed::AffectedIsSelf |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Flee_GetGuardHelp, EPerceptionCharacterType::Instigator)
                .AddContextTag(GameplayTag::Action_Ambient_GetJumpscared));

    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Assault_Weapon)
        .RequireTrue(
            Assessed::AffectedIsSelf |
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Flee, EPerceptionCharacterType::Instigator)
                .AddContextTag(GameplayTag::Action_Ambient_GetJumpscared));

    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Assault_Weapon)
        .RequireTrue(
            Assessed::AffectedWasFriendly |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved |
            Assessed::IsInPartyWithAffected
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Flee_GetGuardHelp, EPerceptionCharacterType::Instigator)
                .AddContextTag(GameplayTag::Action_Ambient_GetJumpscared));
    
    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Assault_Weapon)
        .RequireTrue(
            Assessed::AffectedIsProtected |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::AffectedWasFriendly |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved |
            Assessed::IsInPartyWithAffected
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Flee_GetGuardHelp, EPerceptionCharacterType::Instigator)
                .AddContextTag(GameplayTag::Action_Ambient_GetJumpscared));
}

class UAIARM_Crime_PastAssault_Fists_Responses_ModifiersOnly : UAIAssessmentResponseModule
{
    default SubModules.Add(UAIARM_Crime_PastAssault_Fists_Responses_ModifiersOnly_GuardRole);
    default SubModules.Add(UAIARM_Crime_PastAssault_Fists_Responses_ModifiersOnly_NoGuardRole);
}

class UAIARM_Crime_PastAssault_Fists_Responses_FightOrFlight : UAIAssessmentResponseModule
{
    default SubModules.Add(UAIARM_Crime_PastAssault_Fists_Responses_FightOrFlight_GuardRole);
    default SubModules.Add(UAIARM_Crime_PastAssault_Fists_Responses_FightOrFlight_NoGuardRole);    
}

class UAIARM_Crime_PastAssault_Fists_Responses_ModifiersOnly_GuardRole : UAIARM_GuardOrLeaderRole
{
    // Affected is self
    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Assault_Fists)
        .RequireTrue(
            Assessed::AffectedIsSelf
        )
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator));
    
    // Affected is protected
    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Assault_Fists)
        .RequireTrue(
            Assessed::AffectedIsProtected
        )
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator));
    
    // Affected is friendly
    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Assault_Fists)
        .RequireTrue(
            Assessed::AffectedWasFriendly
        )
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::AffectedIsProtected
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator));
}

class UAIARM_Crime_PastAssault_Fists_Responses_ModifiersOnly_NoGuardRole : UAIARM_NoGuardNorLeaderRole
{
    // Affected is self
    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Assault_Fists)
        .RequireTrue(
            Assessed::AffectedIsSelf
        )
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator));
    
    // Affected is protected
    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Assault_Fists)
        .RequireTrue(
            Assessed::AffectedIsProtected
        )
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator));
    
    // Affected is friendly
    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Assault_Fists)
        .RequireTrue(
            Assessed::AffectedWasFriendly
        )
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::AffectedIsProtected
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator));
}

class UAIARM_Crime_PastAssault_Fists_Responses_FightOrFlight_GuardRole : UAIARM_GuardOrLeaderRole
{
    // Affected is self
    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Assault_Fists)
        .RequireTrue(
            Assessed::AffectedIsSelf
        )
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::Instigator));
    
    // Affected is protected
    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Assault_Fists)
        .RequireTrue(
            Assessed::AffectedIsProtected
        )
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::Instigator)
            .AddContextTagToTarget(GameplayTag::VoicelineContext_AttackedCharge));
    
    // Affected is friendly
    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Assault_Fists)
        .RequireTrue(
            Assessed::AffectedWasFriendly
        )
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::AffectedIsProtected |
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::Instigator));

    // Instigator is stronger
    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Assault_Fists)
        .RequireTrue(
            Assessed::AffectedIsSelf |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Flee_GetGuardHelp, EPerceptionCharacterType::Instigator)
                .AddContextTag(GameplayTag::Action_Ambient_GetJumpscared));
        
    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Assault_Fists)
        .RequireTrue(
            Assessed::AffectedIsSelf |
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Flee, EPerceptionCharacterType::Instigator)
                .AddContextTag(GameplayTag::Action_Ambient_GetJumpscared));

    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Assault_Fists)
        .RequireTrue(
            Assessed::AffectedWasFriendly |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved |
            Assessed::IsInPartyWithAffected
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Flee_GetGuardHelp, EPerceptionCharacterType::Instigator)
                .AddContextTag(GameplayTag::Action_Ambient_GetJumpscared));
    
    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Assault_Fists)
        .RequireTrue(
            Assessed::AffectedIsProtected |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::AffectedWasFriendly |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved |
            Assessed::IsInPartyWithAffected
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Flee_GetGuardHelp, EPerceptionCharacterType::Instigator)
                .AddContextTag(GameplayTag::Action_Ambient_GetJumpscared));
}

class UAIARM_Crime_PastAssault_Fists_Responses_FightOrFlight_NoGuardRole : UAIARM_NoGuardNorLeaderRole
{
    // Affected is self
    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Assault_Fists)
        .RequireTrue(
            Assessed::AffectedIsSelf
        )
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::Instigator));
    
    // Affected is protected
    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Assault_Fists)
        .RequireTrue(
            Assessed::AffectedIsProtected
        )
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::Instigator)
            .AddContextTagToTarget(GameplayTag::VoicelineContext_AttackedCharge));
    
    // Affected is friendly
    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Assault_Fists)
        .RequireTrue(
            Assessed::AffectedWasFriendly
        )
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::AffectedIsProtected |
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::Instigator));

    // Instigator is stronger
    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Assault_Fists)
        .RequireTrue(
            Assessed::AffectedIsSelf |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Flee_GetGuardHelp, EPerceptionCharacterType::Instigator)
                .AddContextTag(GameplayTag::Action_Ambient_GetJumpscared));
    
    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Assault_Fists)
        .RequireTrue(
            Assessed::AffectedIsSelf |
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .RequireTrue(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Flee, EPerceptionCharacterType::Instigator)
                .AddContextTag(GameplayTag::Action_Ambient_GetJumpscared));

    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Assault_Fists)
        .RequireTrue(
            Assessed::AffectedWasFriendly |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved |
            Assessed::IsInPartyWithAffected
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Flee_GetGuardHelp, EPerceptionCharacterType::Instigator)
                .AddContextTag(GameplayTag::Action_Ambient_GetJumpscared));
    
    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Assault_Fists)
        .RequireTrue(
            Assessed::AffectedIsProtected |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .RequireFalse(
            Assessed::IsCrimeSeverityLow |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::AffectedWasFriendly |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved |
            Assessed::IsInPartyWithAffected
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Flee_GetGuardHelp, EPerceptionCharacterType::Instigator)
                .AddContextTag(GameplayTag::Action_Ambient_GetJumpscared));
}