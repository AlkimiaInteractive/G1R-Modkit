class UCrimeProcessingSubsystem_Human : UCrimeProcessingSubsystem
{
    // Crime
    default CrimeSeverityAdditiveModifiers.Add(UCrimeSeverityModifier_Add_CrimeDirectness());
    default CrimeSeverityAdditiveModifiers.Add(UCrimeSeverityModifier_Add_RelationshipTowardsCriminal());
    default CrimeSeverityAdditiveModifiers.Add(UCrimeSeverityModifier_Add_RelationshipTowardsVictim_Good());
    default CrimeSeverityAdditiveModifiers.Add(UCrimeSeverityModifier_Add_Protect());
    default CrimeSeverityAdditiveModifiers.Add(UCrimeSeverityModifier_Add_RelativeRankTowardsCriminal());
    default CrimeSeverityAdditiveModifiers.Add(UCrimeSeverityModifier_Add_RelativeRankTowardsVictim());
    default CrimeSeverityAdditiveModifiers.Add(UCrimeSeverityModifier_Add_VictimIsSelfPersonally());

    default CrimeSeverityMultiplicativeModifiers.Add(UCrimeSeverityModifier_Mult_RelationshipTowardsVictim_Reverse());
    default CrimeSeverityMultiplicativeModifiers.Add(UCrimeSeverityModifier_Mult_RelationshipTowardsVictim_NullifyOnNonFriendlyNonProtected());
    default CrimeSeverityMultiplicativeModifiers.Add(UCrimeSeverityModifier_Mult_CriminalIsFriendly_Nullify());
    default CrimeSeverityMultiplicativeModifiers.Add(UCrimeSeverityModifier_Mult_CriminalIsFriendlySameRank_Nullify());
    default CrimeSeverityMultiplicativeModifiers.Add(UCrimeSeverityModifier_Mult_CriminalIsPartyMember_Nullify());
    default CrimeSeverityMultiplicativeModifiers.Add(UCrimeSeverityModifier_Mult_CriminalOutranksWitness_Nullify());
    default CrimeSeverityMultiplicativeModifiers.Add(UCrimeSeverityModifier_Mult_Forgiven());
    default CrimeSeverityMultiplicativeModifiers.Add(UCrimeSeverityModifier_Mult_Suppressed());
    default CrimeSeverityMultiplicativeModifiers.Add(UCrimeSeverityModifier_Mult_ItemValue());

    default TheftTuning = UCrimeTuningConfig_Theft_Human();
    default PickpocketTuning = UCrimeTuningConfig_Pickpocket_Human();
    default CreepingTuning = UCrimeTuningConfig_Creeping_Human();
}