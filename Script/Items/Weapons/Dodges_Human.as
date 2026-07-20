UCLASS()
class URollConfig_Human : URollConfig
{
	default m_MaxFallingRollHeight = 400;
	default m_MaxFallingFallHeight = 1100;
	default m_RollPlayRate = 1;
	default m_BreakFallPlayRate = 1.35;
};

UCLASS()
class UDodgesData_Human_Base : UDodgesData
{
    FName Dodge_RH_F = n"";
    FName Dodge_RH_B = n"";
    FName Dodge_RH_L = n"";
    FName Dodge_RH_R = n"";

    FName Dodge_LH_F = n"";
    FName Dodge_LH_B = n"";
    FName Dodge_LH_L = n"";
    FName Dodge_LH_R = n"";

    default m_RollConfig = URollConfig_Human;

    UFUNCTION()
    void AddDodge(FGameplayTag Direction, FGameplayTag Pose, FName Montage, float SuperArmorResistanceMultiplier = 0.4f)
    {
        FDodgeData DodgeData;
        DodgeData.Direction = Direction;
        DodgeData.Pose = Pose;
        DodgeData.Montage = Montage;
        DodgeData.m_SuperArmorResistanceMultiplier = SuperArmorResistanceMultiplier;
        m_Dodges.Add(DodgeData);
    }
};