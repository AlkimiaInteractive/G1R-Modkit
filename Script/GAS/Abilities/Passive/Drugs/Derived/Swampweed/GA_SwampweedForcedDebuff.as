class UGA_SwampweedForcedDebuff : UGA_DrugForcedBase
{
    default AbilityTags.AddTag(GameplayTag::Ability_Action_Debuff_Forced_Swampweed);
    default	BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Action_Debuff_Forced_Swampweed);
    default CancelAbilitiesWithTag.AddTag(GameplayTag::Ability_Action_Debuff_Forced_Swampweed);

    default m_ForceDrugLowTag = GameplayTag::State_Drugs_Forced_Swampweed_Low;
    default m_ForceDrugMidTag = GameplayTag::State_Drugs_Forced_Swampweed_Mid;
    default m_ForceDrugHighTag = GameplayTag::State_Drugs_Forced_Swampweed_High;
    

    default m_ForcedDrugLowGE = UGE_Forced_Swampweed_Insta_Low::StaticClass();
    default m_ForcedDrugMidGE = UGE_Forced_Swampweed_Insta_Mid::StaticClass();
    default m_ForcedDrugHighGE = UGE_Forced_Swampweed_Insta_High::StaticClass();
    default m_ResetForcedDrugGE = UGE_Reset_Swampweed_Attribute::StaticClass();

}