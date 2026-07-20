
UCLASS()
class UWeaponMeleeItemAnimConfig_Orc_Combat_Melee_Axe : UWeaponMeleeItemAnimConfig_Orc_Combat_Melee
{
    // COMBOS
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Bottom) =   UAttack_Orc_A1H_B01::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Left) =     UAttack_Orc_A1H_L01::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Right) =    UAttack_Orc_A1H_R01::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Top) =      UAttack_Orc_A1H_T01::StaticClass();

    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Extra06) = UComboAttackConfig_Orc_ThrowStone_Melee;
    //
}

UCLASS()
class UWeaponMeleeItemAnimConfig_UndeadOrc_Combat_Melee_Axe : UWeaponMeleeItemAnimConfig_Orc_Combat_Melee_Axe
{
    // TAUNTS
    default m_TauntData = UTauntData_UndeadOrc_S1H::StaticClass();
}