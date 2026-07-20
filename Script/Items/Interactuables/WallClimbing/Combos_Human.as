
// ATTACK ANIMATIONS DATA //

class UConfig_Human_Climbing : UAttackMeleeConfig
{
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

class UConfig_Human_Climbing_Up : UConfig_Human_Climbing
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Traversal/WallClimbing/Transitions/A_Man_Climb_AttackUp_L_Montage.A_Man_Climb_AttackUp_L_Montage'";
}

class UConfig_Human_Climbing_Down : UConfig_Human_Climbing
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Traversal/WallClimbing/Transitions/A_Man_Climb_AttackDown_L_Montage.A_Man_Climb_AttackDown_L_Montage'";
}

class UConfig_Human_Climbing_UpRight : UConfig_Human_Climbing
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Traversal/WallClimbing/Transitions/A_Man_Climb_AttackUp_R_Montage.A_Man_Climb_AttackUp_R_Montage'";
}

class UConfig_Human_Climbing_UpLeft : UConfig_Human_Climbing
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Traversal/WallClimbing/Transitions/A_Man_Climb_AttackUp_L_Montage.A_Man_Climb_AttackUp_L_Montage'";
}

class UConfig_Human_Climbing_DownRight : UConfig_Human_Climbing
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Traversal/WallClimbing/Transitions/A_Man_Climb_AttackDown_R_Montage.A_Man_Climb_AttackDown_R_Montage'";
}

class UConfig_Human_Climbing_DownLeft : UConfig_Human_Climbing
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Traversal/WallClimbing/Transitions/A_Man_Climb_AttackDown_L_Montage.A_Man_Climb_AttackDown_L_Montage'";
}

// ******************************************** //

// COMBOS //

class UAttack_Human_Climbing : UComboAttackConfigScript
{
    default m_GA_Attack = UGameplayAbilityAttackMelee::StaticClass();
}

class UAttack_Human_Climbing_Up : UAttack_Human_Climbing
{
    default m_MetaData = UConfig_Human_Climbing_Up::StaticClass();
}

class UAttack_Human_Climbing_Down : UAttack_Human_Climbing
{
    default m_MetaData = UConfig_Human_Climbing_Down::StaticClass();
}

class UAttack_Human_Climbing_UpRight : UAttack_Human_Climbing
{
    default m_MetaData = UConfig_Human_Climbing_UpRight::StaticClass();
}

class UAttack_Human_Climbing_UpLeft : UAttack_Human_Climbing
{
    default m_MetaData = UConfig_Human_Climbing_UpLeft::StaticClass();
}

class UAttack_Human_Climbing_DownRight : UAttack_Human_Climbing
{
    default m_MetaData = UConfig_Human_Climbing_DownRight::StaticClass();
}

class UAttack_Human_Climbing_DownLeft : UAttack_Human_Climbing
{
    default m_MetaData = UConfig_Human_Climbing_DownLeft::StaticClass();
}
