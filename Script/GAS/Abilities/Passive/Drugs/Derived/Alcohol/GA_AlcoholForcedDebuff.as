class UGA_AlcoholForcedDebuff : UGA_DrugForcedBase
{
    default AbilityTags.AddTag(GameplayTag::Ability_Action_Debuff_Forced_Alcohol);
    default	BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Action_Debuff_Forced_Alcohol);
    default CancelAbilitiesWithTag.AddTag(GameplayTag::Ability_Action_Debuff_Forced_Alcohol);

    default m_ForceDrugLowTag = GameplayTag::State_Drugs_Forced_Alcohol_Low;
    default m_ForceDrugMidTag = GameplayTag::State_Drugs_Forced_Alcohol_Mid;
    default m_ForceDrugHighTag = GameplayTag::State_Drugs_Forced_Alcohol_High;
    

    default m_ForcedDrugLowGE = UGE_Forced_Alcohol_Insta_Low::StaticClass();
    default m_ForcedDrugMidGE = UGE_Forced_Alcohol_Insta_Mid::StaticClass();
    default m_ForcedDrugHighGE = UGE_Forced_Alcohol_Insta_High::StaticClass();
    default m_ResetForcedDrugGE = UGE_Reset_Alcohol_Attribute::StaticClass();

}