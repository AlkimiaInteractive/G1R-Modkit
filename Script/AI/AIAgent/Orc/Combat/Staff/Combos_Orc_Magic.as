
// // ATTACK ANIMATIONS DATA //
// class UConfig_Orc_Magic : UAttackMeleeConfig
// {
//     default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Magic/BallLightning/A_OrcM_BallLightning_Montage.A_OrcM_BallLightning_Montage'";
// }

// // class UConfig_Orc_Magic_BallLightning : UAttackThrowConfig
// // {
// //     default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Magic/BallLightning/A_OrcM_BallLightning_Montage.A_OrcM_BallLightning_Montage'";
    
// //     default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
// // 	default m_SuperArmorDamageMultiplier = 1.0f;

// //     default m_ProjectileClass = UOrcBallLightningProjectileDefinition::StaticClass();
// //     default m_ArrowGravityModifier = 0;
// // 	default m_ProjectileSpeedMin = 1.0;
// // 	default m_ProjectileSpeedMax = 300.0;
// // }

// // class UConfig_Orc_Magic_BreathOfDeath : UConfig_Orc_Magic
// // {
// //     // default m_AttackMontage = n"";
    
// //     default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
// // 	default m_SuperArmorDamageMultiplier = 1.0f;

// // }

// class UConfig_Orc_Magic_ChainLighting : UConfig_Orc_Magic
// {
//     default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Magic/ChainLighting/A_OrcM_ChainLighting_Montage.A_OrcM_ChainLighting_Montage'";
    
//     default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
// 	default m_SuperArmorDamageMultiplier = 1.0f;
// }

// class UConfig_Orc_Magic_Pyrokinesis : UConfig_Orc_Magic
// {
//     default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Magic/ChainLighting/A_OrcM_ChainLighting_Montage.A_OrcM_ChainLighting_Montage'";
    
//     default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
// 	default m_SuperArmorDamageMultiplier = 1.0f;
// }

// // class UConfig_Orc_Magic_StormOfFire : UConfig_Orc_Magic
// // {
// //     // default m_AttackMontage = n"";
    
// //     default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
// // 	default m_SuperArmorDamageMultiplier = 1.0f;
// // }

// // ******************************************** //





// COMBOS //

class UAttack_Orc_Magic : UComboAttackConfigScript
{
    default m_GA_Attack = UGameplayAbilityAttackMelee::StaticClass();
}

class UAttack_Orc_Magic_FireBall : UAttack_Orc_Magic
{
    //default m_MetaData = UConfig_Orc_Magic_BallLightning::StaticClass();
    default m_GA_Attack = UGA_CastSpell_FireBall_Orc::StaticClass();
}

class UAttack_Orc_Magic_BallLightning : UAttack_Orc_Magic
{
    //default m_MetaData = UConfig_Orc_Magic_BallLightning::StaticClass();
    default m_GA_Attack = UGA_CastSpell_BallLightning_Orc::StaticClass();
}

class UAttack_Orc_Magic_BreathOfDeath : UAttack_Orc_Magic
{
    //default m_MetaData = UConfig_Orc_Magic_BreathOfDeath::StaticClass();
    default m_GA_Attack = UGA_CastSpell_BreathOfDeath_Orc::StaticClass();
}

class UAttack_Orc_Magic_ChainLighting : UAttack_Orc_Magic
{
    // default m_MetaData = UConfig_Orc_Magic_ChainLighting::StaticClass();
    default m_GA_Attack = UGA_CastSpell_ChainLightning_Orc::StaticClass();
}

class UAttack_Orc_Magic_Pyrokinesis : UAttack_Orc_Magic
{
    // default m_MetaData = UConfig_Orc_Magic_Pyrokinesis::StaticClass();
    default m_GA_Attack = UGA_CastSpell_Pyrokinesis_Orc::StaticClass();
}

class UAttack_Orc_Magic_StormOfFire : UAttack_Orc_Magic
{
    //default m_MetaData = UConfig_Orc_Magic_StormOfFire::StaticClass();
    default m_GA_Attack = UGA_CastSpell_StormOfFire_Orc::StaticClass();

}



// ******************************************** //

class UConfig_Orc_Sff1H_Top : UAttackMeleeConfig
{
    // default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Hits/Parried/A_OrcM_Sff1H_RH_HitParried_Montage.A_OrcM_Sff1H_RH_HitParried_Montage'"; 
    // default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Hits/Deflected/A_OrcM_Sff1H_HitDeflected_B_Montage.A_OrcM_Sff1H_HitDeflected_B_Montage'";

    default m_AttackHandle = EAttackHandle::RightHand;
    default m_AttackDirection = GameplayTag::Combat_Attack_Top;
}

class UConfig_Orc_Sff1H_Fake_Pyrokinesis : UConfig_Orc_Sff1H_Top
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Attacks/Spells/StormOfFire_Temporal/A_OrcM_Sff1H_A_Spc_Pyrokinesis_Montage_TEMP.A_OrcM_Sff1H_A_Spc_Pyrokinesis_Montage_TEMP'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}
class UAttack_Orc_Sff1H_Fake_Pyrokinesis : UAttack_Orc_Sff1H
{
    default m_GA_Attack = UGameplayAbilityAttackMelee::StaticClass();
    default m_MetaData = UConfig_Orc_Sff1H_Fake_Pyrokinesis::StaticClass();
}

class UConfig_Orc_Sff1H_Fake_BallLighting : UConfig_Orc_Sff1H_Top
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Attacks/Spells/StormOfFire_Temporal/A_OrcM_Sff1H_A_Spc_BallLightning_Montage_TEMP.A_OrcM_Sff1H_A_Spc_BallLightning_Montage_TEMP'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}
class UAttack_Orc_Sff1H_Fake_BallLighting : UAttack_Orc_Sff1H
{
    default m_GA_Attack = UGameplayAbilityAttackMelee::StaticClass();
    default m_MetaData = UConfig_Orc_Sff1H_Fake_BallLighting::StaticClass();
}

class UConfig_Orc_Sff1H_Fake_ChainLighting : UConfig_Orc_Sff1H_Top
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Attacks/Spells/StormOfFire_Temporal/A_OrcM_Sff1H_A_Spc_ChainLighting_Montage_TEMP.A_OrcM_Sff1H_A_Spc_ChainLighting_Montage_TEMP'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}
class UAttack_Orc_Sff1H_Fake_ChainLighting : UAttack_Orc_Sff1H
{
    default m_GA_Attack = UGameplayAbilityAttackMelee::StaticClass();
    default m_MetaData = UConfig_Orc_Sff1H_Fake_ChainLighting::StaticClass();
}
class UConfig_Orc_Sff1H_Fake_StormOfFire : UConfig_Orc_Sff1H_Top
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Attacks/Spells/StormOfFire_Temporal/A_OrcM_Sff1H_A_Spc_StormOfFire_Montage_TEMP.A_OrcM_Sff1H_A_Spc_StormOfFire_Montage_TEMP'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}
class UAttack_Orc_Sff1H_Fake_StormOfFire : UAttack_Orc_Sff1H
{
    default m_GA_Attack = UGameplayAbilityAttackMelee::StaticClass();
    default m_MetaData = UConfig_Orc_Sff1H_Fake_StormOfFire::StaticClass();
}
class UConfig_Orc_Sff1H_Fake_BreathOfDeath : UConfig_Orc_Sff1H_Top
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Attacks/Spells/StormOfFire_Temporal/A_OrcM_Sff1H_A_Spc_BreathOfDeath_Montage_TEMP.A_OrcM_Sff1H_A_Spc_BreathOfDeath_Montage_TEMP'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}
class UAttack_Orc_Sff1H_Fake_BreathOfDeath : UAttack_Orc_Sff1H
{
    default m_GA_Attack = UGameplayAbilityAttackMelee::StaticClass();
    default m_MetaData = UConfig_Orc_Sff1H_Fake_BreathOfDeath::StaticClass();
}

class UConfig_Orc_Sff1H_Fake_Fireball : UConfig_Orc_Sff1H_Top
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Attacks/Spells/StormOfFire_Temporal/A_OrcM_Sff1H_A_Spc_Fireball_Montage_TEMP.A_OrcM_Sff1H_A_Spc_Fireball_Montage_TEMP'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}
class UAttack_Orc_Sff1H_Fake_Fireball : UAttack_Orc_Sff1H
{
    default m_GA_Attack = UGameplayAbilityAttackMelee::StaticClass();
    default m_MetaData = UConfig_Orc_Sff1H_Fake_Fireball::StaticClass();
}