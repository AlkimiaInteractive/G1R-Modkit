class UGE_HealBy : UScriptGameplayEffect
{
  default DurationPolicy = EGameplayEffectDurationType::Instant;

  default AddCallerValueToAttribute(UAttributeSet_Health::StaticClass(), n"Health", GameplayTag::GE_Param_Heal);
}

mixin FGameplayEffectSpecHandle GE_HealBy(UAbilitySystemComponent ASC, float NumHealth)
{
    return ASC.MakeEffectSpecWithParam(UGE_HealBy::StaticClass(), GameplayTag::GE_Param_Heal, NumHealth);
}

class UGE_BuyStrength : UScriptGameplayEffect
{
  default DurationPolicy = EGameplayEffectDurationType::Instant;

  default AddCallerValueToAttribute(UAttributeSet_Strength::StaticClass(), n"Strength", GameplayTag::GE_Param_Amount);
  default AddCallerValueToAttribute(UAttributeSet_LevelProgression::StaticClass(), n"Skillpoints", GameplayTag::GE_Param_Skillpoints);
}

mixin FGameplayEffectSpecHandle GE_BuyStrength(UAbilitySystemComponent ASC, float NumPoints)
{
    auto Handle = ASC.MakeOutgoingSpec(UGE_BuyStrength::StaticClass(), 0.0f, ASC.MakeEffectContext());

    Handle.Spec.SetByCallerMagnitude(GameplayTag::GE_Param_Amount, NumPoints);
    Handle.Spec.SetByCallerMagnitude(GameplayTag::GE_Param_Skillpoints, -NumPoints);

    return Handle;
}

class UGE_BuyDexterity : UScriptGameplayEffect
{
  default DurationPolicy = EGameplayEffectDurationType::Instant;

  default AddCallerValueToAttribute(UAttributeSet_Dexterity::StaticClass(), n"Dexterity", GameplayTag::GE_Param_Amount);
  default AddCallerValueToAttribute(UAttributeSet_LevelProgression::StaticClass(), n"Skillpoints", GameplayTag::GE_Param_Skillpoints);
}

mixin FGameplayEffectSpecHandle GE_BuyDexterity(UAbilitySystemComponent ASC, float NumPoints)
{
    auto Handle = ASC.MakeOutgoingSpec(UGE_BuyDexterity::StaticClass(), 0.0f, ASC.MakeEffectContext());

    Handle.Spec.SetByCallerMagnitude(GameplayTag::GE_Param_Amount, NumPoints);
    Handle.Spec.SetByCallerMagnitude(GameplayTag::GE_Param_Skillpoints, -NumPoints);

    return Handle;
}

class UGE_BuyMaxMana : UScriptGameplayEffect
{
  default DurationPolicy = EGameplayEffectDurationType::Instant;

  default AddCallerValueToAttribute(UAttributeSet_Mana::StaticClass(), n"MaxMana", GameplayTag::GE_Param_Amount);
  default AddCallerValueToAttribute(UAttributeSet_LevelProgression::StaticClass(), n"Skillpoints", GameplayTag::GE_Param_Skillpoints);
}

mixin FGameplayEffectSpecHandle GE_BuyMaxMana(UAbilitySystemComponent ASC, float NumPoints)
{
    auto Handle = ASC.MakeOutgoingSpec(UGE_BuyMaxMana::StaticClass(), 0.0f, ASC.MakeEffectContext());

    Handle.Spec.SetByCallerMagnitude(GameplayTag::GE_Param_Amount, NumPoints);
    Handle.Spec.SetByCallerMagnitude(GameplayTag::GE_Param_Skillpoints, -NumPoints);

    return Handle;
}


class UGE_IncreaseStrength : UScriptGameplayEffect
{
  default DurationPolicy = EGameplayEffectDurationType::Instant;

  default AddCallerValueToAttribute(UAttributeSet_Strength::StaticClass(), n"Strength", GameplayTag::GE_Param_Amount);
}

mixin FGameplayEffectSpecHandle GE_IncreaseStrength(UAbilitySystemComponent ASC, float NumPoints)
{
    auto Handle = ASC.MakeOutgoingSpec(UGE_IncreaseStrength::StaticClass(), 0.0f, ASC.MakeEffectContext());

    Handle.Spec.SetByCallerMagnitude(GameplayTag::GE_Param_Amount, NumPoints);

    return Handle;
}

class UGE_IncreaseDexterity : UScriptGameplayEffect
{
  default DurationPolicy = EGameplayEffectDurationType::Instant;

  default AddCallerValueToAttribute(UAttributeSet_Dexterity::StaticClass(), n"Dexterity", GameplayTag::GE_Param_Amount);
}

mixin FGameplayEffectSpecHandle GE_IncreaseDexterity(UAbilitySystemComponent ASC, float NumPoints)
{
    auto Handle = ASC.MakeOutgoingSpec(UGE_IncreaseDexterity::StaticClass(), 0.0f, ASC.MakeEffectContext());

    Handle.Spec.SetByCallerMagnitude(GameplayTag::GE_Param_Amount, NumPoints);

    return Handle;
}

class UGE_IncreaseMaxMana : UScriptGameplayEffect
{
  default DurationPolicy = EGameplayEffectDurationType::Instant;

  default AddCallerValueToAttribute(UAttributeSet_Mana::StaticClass(), n"MaxMana", GameplayTag::GE_Param_Amount);
}

mixin FGameplayEffectSpecHandle GE_IncreaseMaxMana(UAbilitySystemComponent ASC, float NumPoints)
{
    auto Handle = ASC.MakeOutgoingSpec(UGE_BuyMaxMana::StaticClass(), 0.0f, ASC.MakeEffectContext());

    Handle.Spec.SetByCallerMagnitude(GameplayTag::GE_Param_Amount, NumPoints);

    return Handle;
}