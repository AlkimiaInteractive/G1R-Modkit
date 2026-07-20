//-------- VERSION 2 --------

class UConfig_Human_S1H_Un_R01_v2 : UConfig_Human_S1H_Right
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Attacks/Untrained2/A_Man_S1H_Un_A_R01_Montage.A_Man_S1H_Un_A_R01_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;

    default m_AttackHandle = EAttackHandle::BothHands;
}

class UConfig_Human_S1H_Un_L01_v2 : UConfig_Human_S1H_Left
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Attacks/Untrained2/A_Man_S1H_Un_A_L01_Montage.A_Man_S1H_Un_A_L01_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;

    default m_AttackHandle = EAttackHandle::BothHands;
}

class UConfig_Human_S1H_Un_B01_v2 : UConfig_Human_S1H_Bottom
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Attacks/Untrained2/A_Man_S1H_Un_A_B01_Montage.A_Man_S1H_Un_A_B01_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.25f);
	default m_SuperArmorDamageMultiplier = 2.0f;

    default m_AttackHandle = EAttackHandle::BothHands;
}

class UConfig_Human_S1H_Un_T01_v2 : UConfig_Human_S1H_Top
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Attacks/Untrained2/A_Man_S1H_Un_A_T01_Montage.A_Man_S1H_Un_A_T01_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;

    default m_AttackHandle = EAttackHandle::BothHands;
}

// COMBOS //

class UAttack_Human_S1H_Un_R01_v2 : UAttack_Human_S1H_Un
{
    default m_MetaData = UConfig_Human_S1H_Un_R01_v2::StaticClass();
}

class UAttack_Human_S1H_Un_L01_v2 : UAttack_Human_S1H_Un
{
    default m_MetaData = UConfig_Human_S1H_Un_L01_v2::StaticClass();
}

class UAttack_Human_S1H_Un_B01_v2 : UAttack_Human_S1H_Un
{
    default m_MetaData = UConfig_Human_S1H_Un_B01_v2::StaticClass();
}

class UAttack_Human_S1H_Un_T01_v2 : UAttack_Human_S1H_Un
{
    default m_MetaData = UConfig_Human_S1H_Un_T01_v2::StaticClass();
}

//-------- VERSION 3 --------

class UConfig_Human_S1H_Un_R01_v3 : UConfig_Human_S1H_Right
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Attacks/Untrained2/A_Man_S1H_Un_A_R02_Montage.A_Man_S1H_Un_A_R02_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;

    default m_AttackHandle = EAttackHandle::BothHands;
}

class UConfig_Human_S1H_Un_L01_v3 : UConfig_Human_S1H_Left
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Attacks/Untrained2/A_Man_S1H_Un_A_L02_Montage.A_Man_S1H_Un_A_L02_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;

    default m_AttackHandle = EAttackHandle::BothHands;
}

class UConfig_Human_S1H_Un_B01_v3 : UConfig_Human_S1H_Bottom
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Attacks/Untrained2/A_Man_S1H_Un_A_B01_v2_Montage.A_Man_S1H_Un_A_B01_v2_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.25f);
	default m_SuperArmorDamageMultiplier = 2.0f;

    default m_AttackHandle = EAttackHandle::BothHands;
}

class UConfig_Human_S1H_Un_T01_v3 : UConfig_Human_S1H_Top
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Attacks/Untrained2/A_Man_S1H_Un_A_T02_Montage.A_Man_S1H_Un_A_T02_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;

    default m_AttackHandle = EAttackHandle::BothHands;
}

// COMBOS //

class UAttack_Human_S1H_Un_R01_v3 : UAttack_Human_S1H_Un
{
    default m_MetaData = UConfig_Human_S1H_Un_R01_v3::StaticClass();
}

class UAttack_Human_S1H_Un_L01_v3 : UAttack_Human_S1H_Un
{
    default m_MetaData = UConfig_Human_S1H_Un_L01_v3::StaticClass();
}

class UAttack_Human_S1H_Un_B01_v3 : UAttack_Human_S1H_Un
{
    default m_MetaData = UConfig_Human_S1H_Un_B01_v3::StaticClass();
}

class UAttack_Human_S1H_Un_T01_v3 : UAttack_Human_S1H_Un
{
    default m_MetaData = UConfig_Human_S1H_Un_T01_v3::StaticClass();
}

//-------- VERSION 3 --------

class UConfig_Human_S1H_Un_R01_v4 : UConfig_Human_S1H_Right
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Attacks/Untrained3/A_Man_S1H_Un_A_R01_Montage.A_Man_S1H_Un_A_R01_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;

    default m_AttackHandle = EAttackHandle::BothHands;
}

class UConfig_Human_S1H_Un_L01_v4 : UConfig_Human_S1H_Left
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Attacks/Untrained3/A_Man_S1H_Un_A_L01_Montage.A_Man_S1H_Un_A_L01_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;

    default m_AttackHandle = EAttackHandle::BothHands;
}

class UConfig_Human_S1H_Un_B01_v4 : UConfig_Human_S1H_Bottom
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Attacks/Untrained3/A_Man_S1H_Un_A_B01_Montage.A_Man_S1H_Un_A_B01_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.25f);
	default m_SuperArmorDamageMultiplier = 2.0f;

    default m_AttackHandle = EAttackHandle::BothHands;
}

class UConfig_Human_S1H_Un_T01_v4 : UConfig_Human_S1H_Top
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Attacks/Untrained3/A_Man_S1H_Un_A_T01_Montage.A_Man_S1H_Un_A_T01_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;

    default m_AttackHandle = EAttackHandle::BothHands;
}

// COMBOS //

class UAttack_Human_S1H_Un_R01_v4 : UAttack_Human_S1H_Un
{
    default m_MetaData = UConfig_Human_S1H_Un_R01_v4::StaticClass();
}

class UAttack_Human_S1H_Un_L01_v4 : UAttack_Human_S1H_Un
{
    default m_MetaData = UConfig_Human_S1H_Un_L01_v4::StaticClass();
}

class UAttack_Human_S1H_Un_B01_v4 : UAttack_Human_S1H_Un
{
    default m_MetaData = UConfig_Human_S1H_Un_B01_v4::StaticClass();
}

class UAttack_Human_S1H_Un_T01_v4 : UAttack_Human_S1H_Un
{
    default m_MetaData = UConfig_Human_S1H_Un_T01_v4::StaticClass();
}