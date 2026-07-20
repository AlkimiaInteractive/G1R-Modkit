// COMBO SHARED //

enum ESkillTier
{
    Untrained,
    Trained,
    Master
}

enum EComboDirection
{
    None,
    Top,
    Bottom,
    Left,
    Right,
}

// ******************************************** //

namespace AttackCombo
{
    namespace DirectionTag
    {
        const FGameplayTag Top    = GameplayTag::Combat_Attack_Top;
        const FGameplayTag Bottom = GameplayTag::Combat_Attack_Bottom;
        const FGameplayTag Left   = GameplayTag::Combat_Attack_Left;
        const FGameplayTag Right  = GameplayTag::Combat_Attack_Right;
    }

    FGameplayTag DirectionTag(EComboDirection Direction)
    {
        switch (Direction)
        {
            case EComboDirection::Top:    return DirectionTag::Top;
            case EComboDirection::Bottom: return DirectionTag::Bottom;
            case EComboDirection::Left:   return DirectionTag::Left;
            case EComboDirection::Right:  return DirectionTag::Right;
            case EComboDirection::None:   return FGameplayTag();
        }
    }

    // Classes of deleted or renamed script files stay loaded (hidden, with their last defaults) until the editor
    // restarts, and UClass::GetAllSubclassesOf still returns them. They lose their source file, but so do new classes
    // while a script reload builds their defaults, so this is only reliable outside a reload (e.g. in the combo tool).
    bool IsRemovedScriptClass(UClass Class)
    {
#if EDITOR
        auto ScriptClass = Cast<UASClass>(Class);
        return ScriptClass != nullptr && ScriptClass.GetSourceFilePath().IsEmpty();
#else
        return false;
#endif
    }
}

// ******************************************** //

// One chain option: the input direction, the timing window, and the attack it leads to.
struct FComboAttackOption
{
    FGameplayTag Direction;
    EComboTiming Timing = EComboTiming::ComboWindow;
    TSubclassOf<UComboAttackConfig> Combo;
}

// Empty config class that a UComboAttackConfigScript fills through CreateMetadata. C++ reads m_MetaData as a class
// and uses its default object, so every attack still needs its own (empty) subclass of this.
UCLASS(Abstract)
class UComboAttackMetaData : UAttackMeleeConfig
{
    // The attack that last filled this config; two attacks sharing one config overwrite each other.
    TSubclassOf<UComboAttackConfig> FilledBy;

    void CopyFrom(const UComboAttackConfigScript Attack)
    {
        // A hot reload replaces the attack class and renames the old one ..._REPLACED_n: not a second attack.
        if (IsValid(FilledBy.Get()) && FilledBy.Get() != Attack.Class && !FilledBy.Get().GetName().ToString().Contains("_REPLACED_"))
            Warning(f"Combo metadata: {Class.GetName()} is filled by both {FilledBy.Get().GetName()} and {Attack.Class.GetName()}; the last one wins");
        FilledBy = Attack.Class;

        m_AttackDirection = Attack.Direction;
        m_AttackHandle = Attack.AttackHand;
        m_AttackMontage = Attack.AttackMontage;
        m_ParriedMontage = Attack.ParriedMontage;
        m_DeflectedMontage = Attack.DeflectedMontage;
        m_DamageMultipliers = Attack.DamageMultipliers;
        m_SuperArmorDamageMultiplier = Attack.SuperArmorDamageMultiplier;
        m_SuperArmorResistanceMultiplier = Attack.SuperArmorResistanceMultiplier;
        m_CanKnockback = Attack.bCanKnockback;
    }
}

// Base for script combo attacks. AddOption / AddOptionByTiming forward to C++ and keep a script-readable copy of
// every option in Options, since the C++ m_Options is not exposed to script.
//
// The attack's config values are set here too; the attack ends with
//     default m_MetaData = CreateMetadata(UConfig_...);
// (UComboAttackConfig is a Const class, so m_MetaData can only be assigned in a default statement.)
UCLASS(Abstract)
class UComboAttackConfigScript : UComboAttackConfig
{
    default m_GA_Attack = UGameplayAbilityAttackMelee::StaticClass();

    UPROPERTY(EditDefaultsOnly, Category = "Attack Config")
    FGameplayTag Direction;

    UPROPERTY(EditDefaultsOnly, Category = "Attack Config")
    EAttackHandle AttackHand = EAttackHandle::RightHand;

    UPROPERTY(EditDefaultsOnly, Category = "Attack Config")
    TSoftObjectPtr<UAnimMontage> AttackMontage;

    UPROPERTY(EditDefaultsOnly, Category = "Attack Config")
    TSoftObjectPtr<UAnimMontage> ParriedMontage;

    UPROPERTY(EditDefaultsOnly, Category = "Attack Config")
    TSoftObjectPtr<UAnimMontage> DeflectedMontage;

    UPROPERTY(EditDefaultsOnly, Category = "Attack Config")
    TMap<FGameplayTag, float32> DamageMultipliers;

    UPROPERTY(EditDefaultsOnly, Category = "Attack Config")
    float SuperArmorDamageMultiplier = 1.0f;

    UPROPERTY(EditDefaultsOnly, Category = "Attack Config")
    float SuperArmorResistanceMultiplier = 1.0f;

    UPROPERTY(EditDefaultsOnly, Category = "Attack Config")
    bool bCanKnockback = false;    

    // Writes this attack's config values into the default object of MetaDataClass and returns the class,
    // for `default m_MetaData = CreateMetadata(UConfig_...);`.
    TSubclassOf<UObject> CreateMetadata(TSubclassOf<UComboAttackMetaData> MetaDataClass)
    {
        PushMetadata(MetaDataClass);
        return MetaDataClass;
    }

    // Writes the config values into m_MetaData's default object again, e.g. after a hot reload rebuilt only the
    // config class. The combo tool calls this on Refresh.
    void PushMetadata(TSubclassOf<UObject> MetaDataClass) const
    {
        if (!IsValid(MetaDataClass.Get()))
        {
            Warning(f"Combo metadata: {Class.GetName()} has no config class");
            return;
        }
        
        auto MetaData = Cast<UComboAttackMetaData>(MetaDataClass.Get().GetDefaultObject());
        if (MetaData == nullptr)
        {
            Warning(f"Combo metadata: {Class.GetName()}: {MetaDataClass.Get().GetName()} is not a UComboAttackMetaData");
            return;
        }
        MetaData.CopyFrom(this);
    }

    TArray<FComboAttackOption> GetOptions()
    {
        TArray<FComboAttackOption> Options;
        
        TMap<EComboTiming, TSubclassOf<UComboAttackConfig>> OptionsForDirection_Right;
        GetOptionsForDirection(OptionsForDirection_Right, AttackCombo::DirectionTag::Right);

        for (auto Option : OptionsForDirection_Right)
        {
            FComboAttackOption OptionData;
            OptionData.Direction = AttackCombo::DirectionTag::Right;
            OptionData.Timing = Option.Key;
            OptionData.Combo = Option.Value;
            Options.Add(OptionData);
        }

        TMap<EComboTiming, TSubclassOf<UComboAttackConfig>> OptionsForDirection_Left;
        GetOptionsForDirection(OptionsForDirection_Left, AttackCombo::DirectionTag::Left);

        for (auto Option : OptionsForDirection_Left)
        {
            FComboAttackOption OptionData;
            OptionData.Direction = AttackCombo::DirectionTag::Left;
            OptionData.Timing = Option.Key;
            OptionData.Combo = Option.Value;
            Options.Add(OptionData);
        }

        TMap<EComboTiming, TSubclassOf<UComboAttackConfig>> OptionsForDirection_Bottom;
        GetOptionsForDirection(OptionsForDirection_Bottom, AttackCombo::DirectionTag::Bottom);

        for (auto Option : OptionsForDirection_Bottom)
        {
            FComboAttackOption OptionData;
            OptionData.Direction = AttackCombo::DirectionTag::Bottom;
            OptionData.Timing = Option.Key;
            OptionData.Combo = Option.Value;
            Options.Add(OptionData);
        }

        TMap<EComboTiming, TSubclassOf<UComboAttackConfig>> OptionsForDirection_Top;
        GetOptionsForDirection(OptionsForDirection_Top, AttackCombo::DirectionTag::Top);

        for (auto Option : OptionsForDirection_Top)
        {
            FComboAttackOption OptionData;
            OptionData.Direction = AttackCombo::DirectionTag::Top;
            OptionData.Timing = Option.Key;
            OptionData.Combo = Option.Value;
            Options.Add(OptionData);
        }

        return Options;
    }
}