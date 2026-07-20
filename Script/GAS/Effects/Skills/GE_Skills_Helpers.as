
namespace USkills_Helper
{
    UFUNCTION()
    bool ApplyTo(UAbilitySystemComponent Abcomp, AGothicCharacter Character, UClass Skill)
    {
        UGE_Skill_Generic SkillToUse =  Cast<UGE_Skill_Generic>(Skill.GetDefaultObject());
        FGameplayEffectContextHandle Context = Abcomp.MakeEffectContext();
        UAngelscriptAbilitySystemComponent AbcompAs = Cast<UAngelscriptAbilitySystemComponent>(Abcomp);
        //check sp
        float SPAsFloat = AbcompAs.GetAttributeBaseValue(UAttributeSet_LevelProgression::StaticClass(), n"Skillpoints");
        if(SkillToUse.GetSPCost() > SPAsFloat)
        {
            return false;
        }

        //check ore
        float TotalOre = UTraderManager::GetCharacterOre(Character);
        if(SkillToUse.OreCost > TotalOre)
        {
            return false;
        }
        //add the skill
        FGameplayEffectSpecHandle EffectSkill = AbcompAs.MakeOutgoingSpec(Skill, 1.0f, Context);
        auto ResultSkill = AbcompAs.ApplyGameplayEffectSpecToSelf(EffectSkill);
   
        if(!GothicGAS::IsActiveGameplayEffectHandleValid(ResultSkill))
        {
            return false;
        }

        //spend sp
        FGameplayEffectSpecHandle EffectPaySp = AbcompAs.MakeOutgoingSpec(UGE_SkillPay_SP::StaticClass(), 1.0f, Context);
        EffectPaySp.GetSpec().SetByCallerMagnitude(GameplayTag::GE_Param_Skillpoints, -SkillToUse.GetSPCost());
        AbcompAs.ApplyGameplayEffectSpecToSelf(EffectPaySp);

        //spend ore
        UTraderManager::RemoveCharacterOre(Character, SkillToUse.OreCost);

        AGothicPlayerState PlayerState = Cast<AGothicPlayerState>(AGothicCharacterState::TryGetCharacterStateFromActor(Character));
        if (PlayerState != nullptr)
        {
            UTelemetryHelper::OnSkillPointSpent(PlayerState, SkillToUse);
        }

        return true;
    }
}

class UGE_SkillPay_SP : UScriptGameplayEffect
{
    default DurationPolicy = EGameplayEffectDurationType::Instant;
    FGameplayModifierInfo modifier;
    default modifier.ModifierMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::SetByCaller;
    default modifier.ModifierMagnitude.SetByCallerMagnitude.DataTag = GameplayTag::GE_Param_Skillpoints;
    default modifier.ModifierOp = EGameplayModOp::Additive;
	default modifier.Attribute = GetAttribute(UAttributeSet_LevelProgression::StaticClass(), n"Skillpoints");
	default Modifiers.Add(modifier);
}

mixin FGameplayEffectSpecHandle MakeEffectSpecWithParam(UAbilitySystemComponent ASC, TSubclassOf<UScriptGameplayEffect> Effect, FGameplayTag Param, float Value)
{
    auto Handle = ASC.MakeOutgoingSpec(Effect, 0.0f, ASC.MakeEffectContext());

    Handle.Spec.SetByCallerMagnitude(Param, Value);

    return Handle;
}

