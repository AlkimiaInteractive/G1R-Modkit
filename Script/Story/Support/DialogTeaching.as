UFUNCTION()
mixin bool TryLearnSkill(UGameplayAbility_AI AI, TSubclassOf<UGE_Skill_Generic> SkillClass, AGothicCharacterState Teacher)
{
    check (AI != nullptr);

    if (!AI.CharacterState.HasEnoughSkillpointsToLearnSkill(SkillClass))
    {
        Teacher.AI.Say(GameplayTag::Sound_Voice_Reaction_Teacher_NoLearn_NoPoints);
        return false;
    }

    if (!AI.CharacterState.HasEnoughOreToLearnSkill(SkillClass))
    {
        // FIXME: Use Ore-related reaction
        Teacher.AI.Say(GameplayTag::Sound_Voice_Reaction_Teacher_NoLearn_NoPoints);
        return false;
    }

    if (AI.CharacterState.HasLearnedSkill(SkillClass))
    {
        Teacher.AI.Say(GameplayTag::Sound_Voice_Reaction_Teacher_NoLearn_YouAlreadyKnow);
        return false;
    }

    // if (/*TODO !AI.CharacterState.(SkillClass)*/ false)
    // {
    //     Teacher.AI.Say(GameplayTag::Sound_Voice_Reaction_Teacher_NoLearnYoureBetter);
    //     return false;
    // }

    return AI.CharacterState.LearnSkill(SkillClass);
}

/** How high an attribute can be increased by buying. */
const float ATTRIBUTE_BUY_MAX = 100.0f;

UFUNCTION()
mixin bool BuyStrengthAttributePoints(UGameplayAbility_AI AI, AGothicCharacterState Teacher, int NumPoints)
{
    int totalCost = GetCostStrengthAttributePoints(AI.Character.CharacterState, NumPoints);
    if (AI.Character.CharacterState.GetSkillpointsAttribute() < totalCost)
    {
        Teacher.AI.Say(GameplayTag::Sound_Voice_Reaction_Teacher_NoLearn_NoPoints);
        return false;
    }

    if (AI.Character.CharacterState.GetStrengthAttributeBaseValue() + NumPoints > ATTRIBUTE_BUY_MAX)
    {
        Teacher.AI.Say(GameplayTag::Sound_Voice_Reaction_Teacher_NoLearn_OverMax);
        return false;
    }

    auto ASC = AI.AbilitySystemComponentFromActorInfo;

    if (ASC == nullptr)
        return false;

    TSubclassOf<UGE_Skill_BuyAttribute> SkillClass = nullptr;

    if (NumPoints == 1)
    {
        SkillClass = UGE_Skill_BuyAttribute_Strength_1;
    }
    else if (NumPoints == 5)
    {
        SkillClass = UGE_Skill_BuyAttribute_Strength_5;
    }
    else
    {
        return false;
    }

    ASC.ApplyGameplayEffectSpecToSelf(ASC.MakeOutgoingSpec(SkillClass, 0.0f, ASC.MakeEffectContext()));

    //spend sp
    FGameplayEffectSpecHandle EffectPaySp = ASC.MakeOutgoingSpec(UGE_SkillPay_SP, 1.0f, ASC.MakeEffectContext());
    EffectPaySp.GetSpec().SetByCallerMagnitude(GameplayTag::GE_Param_Skillpoints, -totalCost);
    ASC.ApplyGameplayEffectSpecToSelf(EffectPaySp);

    SaveStrengthAttributePoints(Teacher, NumPoints);

    AGothicPlayerState PlayerState = Cast<AGothicPlayerState>(AGothicCharacterState::TryGetCharacterStateFromActor(ASC.Owner));
    if (PlayerState != nullptr)
    {
        UTelemetryHelper::OnSkillPointSpent(PlayerState, SkillClass.GetDefaultObject());
    }
    return true;
}

UFUNCTION()
int GetCostStrengthAttributePoints(const AGothicCharacterState Learner, float NumPoints)
{
    return MagicScript::GetCostAttributePoints(n"StrengthAttributePoints", Learner, NumPoints);
}

UFUNCTION()
int GetCostDexterityAttributePoints(const AGothicCharacterState Learner, float NumPoints)
{
    return MagicScript::GetCostAttributePoints(n"DexterityAttributePoints", Learner, NumPoints);
}

UFUNCTION()
void SaveStrengthAttributePoints(AGothicCharacterState Teacher, float NumPoints)
{
    SaveAttributePoints(n"StrengthAttributePoints", Teacher, NumPoints);
}

UFUNCTION()
void SaveDexterityAttributePoints(AGothicCharacterState Teacher, float NumPoints)
{
    SaveAttributePoints(n"DexterityAttributePoints", Teacher, NumPoints);
}

UFUNCTION()
void SaveAttributePoints(FName Attribute, AGothicCharacterState Teacher, float NumPoints)
{
    float32 currentAttributePoints = 0.0f;
    bool bLoaded = AG1RGameState::GetWorldFloatData(Teacher.GetWorld(), Attribute, currentAttributePoints);
    AG1RGameState::SaveWorldFloatData(Teacher.GetWorld(), Attribute, currentAttributePoints + NumPoints);
}

UFUNCTION()
mixin bool BuyDexterityAttributePoints(UGameplayAbility_AI AI, AGothicCharacterState Teacher, float NumPoints)
{
    int totalCost = GetCostDexterityAttributePoints(AI.Character.CharacterState, NumPoints);
    if (AI.Character.CharacterState.GetSkillpointsAttribute() < totalCost)
    {
        Teacher.AI.Say(GameplayTag::Sound_Voice_Reaction_Teacher_NoLearn_NoPoints);
        return false;
    }

    if (AI.Character.CharacterState.GetDexterityAttributeBaseValue() + NumPoints > ATTRIBUTE_BUY_MAX)
    {
        Teacher.AI.Say(GameplayTag::Sound_Voice_Reaction_Teacher_NoLearn_OverMax);
        return false;
    }

    auto ASC = AI.AbilitySystemComponentFromActorInfo;

    if (ASC == nullptr)
        return false;

    TSubclassOf<UGE_Skill_BuyAttribute> SkillClass = nullptr;

    if (NumPoints == 1)
    {
        SkillClass = UGE_Skill_BuyAttribute_Dexterity_1;
    }
    else if (NumPoints == 5)
    {
        SkillClass = UGE_Skill_BuyAttribute_Dexterity_5;
    }
    else
    {
        return false;
    }

    ASC.ApplyGameplayEffectSpecToSelf(ASC.MakeOutgoingSpec(SkillClass, 0.0f, ASC.MakeEffectContext()));

    //spend sp
    FGameplayEffectSpecHandle EffectPaySp = ASC.MakeOutgoingSpec(UGE_SkillPay_SP, 1.0f, ASC.MakeEffectContext());
    EffectPaySp.GetSpec().SetByCallerMagnitude(GameplayTag::GE_Param_Skillpoints, -totalCost);
    ASC.ApplyGameplayEffectSpecToSelf(EffectPaySp);

    SaveDexterityAttributePoints(Teacher, NumPoints);    

    AGothicPlayerState PlayerState = Cast<AGothicPlayerState>(AGothicCharacterState::TryGetCharacterStateFromActor(ASC.Owner));
    if (PlayerState != nullptr)
    {
        UTelemetryHelper::OnSkillPointSpent(PlayerState, SkillClass.GetDefaultObject());
    }
    return true;
}

UFUNCTION()
mixin bool BuyMaxManaAttributePoints(UGameplayAbility_AI AI, AGothicCharacterState Teacher, float NumPoints)
{
    if (AI.Character.CharacterState.GetSkillpointsAttribute() < NumPoints)
    {
        Teacher.AI.Say(GameplayTag::Sound_Voice_Reaction_Teacher_NoLearn_NoPoints);
        return false;
    }

    if (AI.Character.CharacterState.GetMaxManaAttributeBaseValue() + NumPoints > ATTRIBUTE_BUY_MAX)
    {
        Teacher.AI.Say(GameplayTag::Sound_Voice_Reaction_Teacher_NoLearn_OverMax);
        return false;
    }

    auto ASC = AI.AbilitySystemComponentFromActorInfo;

    if (ASC == nullptr)
        return false;

    TSubclassOf<UGE_Skill_BuyAttribute> SkillClass = nullptr;

    if (NumPoints == 1)
    {
        SkillClass = UGE_Skill_BuyAttribute_MaxMana_1;
    }
    else if (NumPoints == 5)
    {
        SkillClass = UGE_Skill_BuyAttribute_MaxMana_5;
    }
    else
    {
        return false;
    }

    ASC.ApplyGameplayEffectSpecToSelf(ASC.MakeOutgoingSpec(SkillClass, 0.0f, ASC.MakeEffectContext()));

    //spend sp
    FGameplayEffectSpecHandle EffectPaySp = ASC.MakeOutgoingSpec(UGE_SkillPay_SP, 1.0f, ASC.MakeEffectContext());
    EffectPaySp.GetSpec().SetByCallerMagnitude(GameplayTag::GE_Param_Skillpoints, -SkillClass.DefaultObject.GetSPCost());
    ASC.ApplyGameplayEffectSpecToSelf(EffectPaySp);

    AGothicPlayerState PlayerState = Cast<AGothicPlayerState>(AGothicCharacterState::TryGetCharacterStateFromActor(ASC.Owner));
    if (PlayerState != nullptr)
    {
        UTelemetryHelper::OnSkillPointSpent(PlayerState, SkillClass.GetDefaultObject());
    }
    return true;
}

UCLASS()
class UAIValueSet_ConverstionTeacherAttributes : UAIValueSet
{
    float32 LastStrengthValue;
    float32 LastDexterityValue;
    float32 LastMaxManaValue;
}

/** 
    Remembers current Strength, Dex and MaxMana 
    Call This BEFORE teaching Subdialogue
*/
UFUNCTION()
mixin void RememberCurrentStatsForTeachingConversation(UGameplayAbility_AI AI, AGothicCharacterState Teacher)
{
    UGameplayAbility_CharacterAI_Gothic TeacherGothicAI = Cast<UGameplayAbility_CharacterAI_Gothic>(Teacher.AI);

    if(!ensure(IsValid(TeacherGothicAI)))
        return;

    auto LastStatsValueSet = TeacherGothicAI.SpawnedStorage(UAIValueSet_ConverstionTeacherAttributes);

    LastStatsValueSet.LastStrengthValue = AI.CharacterState.GetStrengthAttributeBaseValue();
    LastStatsValueSet.LastDexterityValue = AI.CharacterState.GetDexterityAttributeBaseValue();
    LastStatsValueSet.LastMaxManaValue = AI.CharacterState.GetMaxManaAttributeBaseValue();
}

/** 
    Compares current stats to the stats remembered before and say generic voiceline if they improved 
    Call This AFTER teaching Subdialogue
*/
UFUNCTION()
mixin void ActTeacherReactionLines(UGameplayAbility_AI AI, AGothicCharacterState Teacher)
{
    UGameplayAbility_CharacterAI_Gothic GothicAI = Cast<UGameplayAbility_CharacterAI_Gothic>(Teacher.AI);

    if (!ensure(IsValid(GothicAI)))
        return;

    auto OldStatsValueSet = GothicAI.SpawnedStorage(UAIValueSet_ConverstionTeacherAttributes);

    float32 CurrentStrength = AI.CharacterState.GetStrengthAttributeBaseValue();
    float32 CurrentDexterity = AI.CharacterState.GetDexterityAttributeBaseValue();
    float32 CurrentMaxMana = AI.CharacterState.GetMaxManaAttributeBaseValue();

    float32 StrengthDifference = CurrentStrength - OldStatsValueSet.LastStrengthValue;
    float32 DexterityDifference = CurrentDexterity - OldStatsValueSet.LastDexterityValue;
    float32 MaxManaDifference = CurrentMaxMana - OldStatsValueSet.LastMaxManaValue;

    float32 HighestDifferenceValue = Math::Max(StrengthDifference, DexterityDifference);
    HighestDifferenceValue = Math::Max(MaxManaDifference, HighestDifferenceValue);

    if (OldStatsValueSet.LastStrengthValue > 0 && CurrentStrength > OldStatsValueSet.LastStrengthValue && StrengthDifference == HighestDifferenceValue)
    {
        // Strength
        if (CurrentStrength < 30 )
        {
            Teacher.AI.Say(GameplayTag::Sound_Voice_Reaction_Teacher_Learn_Strenght_Low);
        }
        else if (CurrentStrength < 60 )
        {
            Teacher.AI.Say(GameplayTag::Sound_Voice_Reaction_Teacher_Learn_Strenght_Medium);
        }
        else
        {
            Teacher.AI.Say(GameplayTag::Sound_Voice_Reaction_Teacher_Learn_Strenght_High);
        }
    }
    else if (OldStatsValueSet.LastDexterityValue > 0 && CurrentDexterity > OldStatsValueSet.LastDexterityValue && DexterityDifference == HighestDifferenceValue)
    {
        // Dex
        if (CurrentDexterity < 30 )
        {
            Teacher.AI.Say(GameplayTag::Sound_Voice_Reaction_Teacher_Learn_Dexterity_Low);
        }
        else if (CurrentDexterity < 60 )
        {
            Teacher.AI.Say(GameplayTag::Sound_Voice_Reaction_Teacher_Learn_Dexterity_Medium);
        }
        else
        {
            Teacher.AI.Say(GameplayTag::Sound_Voice_Reaction_Teacher_Learn_Dexterity_High);
        }
    }
    else if (OldStatsValueSet.LastMaxManaValue > 0 && CurrentMaxMana > OldStatsValueSet.LastMaxManaValue && MaxManaDifference == HighestDifferenceValue)
    {
        // Max Mana
        if (CurrentMaxMana < 30 )
        {
            Teacher.AI.Say(GameplayTag::Sound_Voice_Reaction_Teacher_Learn_Mana_Low);
        }
        else if (CurrentMaxMana < 60 )
        {
            Teacher.AI.Say(GameplayTag::Sound_Voice_Reaction_Teacher_Learn_Mana_Medium);
        }
        else
        {
            Teacher.AI.Say(GameplayTag::Sound_Voice_Reaction_Teacher_Learn_Mana_High);
        }
    }
}