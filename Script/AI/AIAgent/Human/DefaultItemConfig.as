
UCLASS()
class UDefault_Human : UItemAnimConfig
{
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Humanoid/Man/NH_AnimBP.NH_AnimBP_C'";

    // Consume
    default m_ConsumablesData = UConsumablesData_Human::StaticClass();


    //LOOTS
    default m_LootsData = ULootsData_Human::StaticClass();

    //PICKUPS
    default m_PicksData = UPicksData_Human::StaticClass();

    //STARTFIRE
    default m_StartFireData = UStartFireData_Human::StaticClass();

    //ENDFIRE
    default m_EndFireData = UEndFireData_Human::StaticClass();

    // Throw
    default m_ThrowItem = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/NoWeapon/Throw/A_Man_N_Throw_Montage.A_Man_N_Throw_Montage'";
    default m_ThrowItem_Crouch = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/NoWeapon/Throw/A_Man_STL_Throw_Montage.A_Man_STL_Throw_Montage'";

    // HITS
    default m_HitsData = UHitData_Default_Human::StaticClass();
    //

	// DODGE
    default m_DodgesData = UDodgesData_Default_Human::StaticClass();
    //

	// TURNS
	default m_TurnsData = UTurnsData_Default_Human::StaticClass();
	//

    // LOCOMOTION ANIM SETS
    default m_LocomotionSequencesData = ULocomotionSequencesData_Default_Human::StaticClass();
    //

    // IDLE BREAKERS
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Movement_NPC/Idle/Breaker/A_Man_NPC_IdleBreaker_01.A_Man_NPC_IdleBreaker_01'", 0.4f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Movement_NPC/Idle/Breaker/A_Man_NPC_IdleBreaker_02.A_Man_NPC_IdleBreaker_02'", 1.0f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Movement_NPC/Idle/Breaker/A_Man_NPC_IdleBreaker_03.A_Man_NPC_IdleBreaker_03'", 0.6f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Movement_NPC/Idle/Breaker/A_Man_NPC_IdleBreaker_04.A_Man_NPC_IdleBreaker_04'", 1.0f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Movement_NPC/Idle/Breaker/A_Man_NPC_IdleBreaker_05.A_Man_NPC_IdleBreaker_05'", 0.8f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Movement_NPC/Idle/Breaker/A_Man_NPC_IdleBreaker_06.A_Man_NPC_IdleBreaker_06'", 1.0f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Movement_NPC/Idle/Breaker/A_Man_NPC_IdleBreaker_07.A_Man_NPC_IdleBreaker_07'", 1.0f, 1);

    // WALK BREAKERS
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Movement_NPC/Grounded/N/Breaker/A_Man_NPC_WalkBreaker_01.A_Man_NPC_WalkBreaker_01'", 0.7f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Movement_NPC/Grounded/N/Breaker/A_Man_NPC_WalkBreaker_02.A_Man_NPC_WalkBreaker_02'", 0.8f, 1);
    //default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Movement_NPC/Grounded/N/Breaker/A_Man_NPC_WalkBreaker_03.A_Man_NPC_WalkBreaker_03'", 0.6f, 1);
    //default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Movement_NPC/Grounded/N/Breaker/A_Man_NPC_WalkBreaker_04.A_Man_NPC_WalkBreaker_04'", 1.0f, 1);
    //default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Movement_NPC/Grounded/N/Breaker/A_Man_NPC_WalkBreaker_05.A_Man_NPC_WalkBreaker_05'", 0.8f, 1);
    //default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Movement_NPC/Grounded/N/Breaker/A_Man_NPC_WalkBreaker_06.A_Man_NPC_WalkBreaker_06'", 1.0f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Movement_NPC/Grounded/N/Breaker/A_Man_NPC_WalkBreaker_07.A_Man_NPC_WalkBreaker_07'", 0.4f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Movement_NPC/Grounded/N/Breaker/A_Man_NPC_WalkBreaker_08.A_Man_NPC_WalkBreaker_08'", 1.0f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Movement_NPC/Grounded/N/Breaker/A_Man_NPC_WalkBreaker_09.A_Man_NPC_WalkBreaker_09'", 0.6f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Movement_NPC/Grounded/N/Breaker/A_Man_NPC_WalkBreaker_10.A_Man_NPC_WalkBreaker_10'", 0.5f, 1);

    // DEATH ANIMS
    TSoftObjectPtr<UAnimMontage> S1H_Hit_01 = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Defeated_Death/A_Man_S1H_Hit_Defeated_01_Death_Montage.A_Man_S1H_Hit_Defeated_01_Death_Montage'";

	default AddDeathAnimForItem(GameplayTag::Item_Weapon_Sword_OneHand, EWeaponSkill::Untrained, S1H_Hit_01);
    default AddDeathAnimForItem(GameplayTag::Item_Weapon_Sword_OneHand, EWeaponSkill::Trained, S1H_Hit_01);
    default AddDeathAnimForItem(GameplayTag::Item_Weapon_Sword_OneHand, EWeaponSkill::Master, S1H_Hit_01);
    default AddDeathAnimForItem(GameplayTag::Item_Weapon_Mace_OneHand, EWeaponSkill::Untrained, S1H_Hit_01);
	default AddDeathAnimForItem(GameplayTag::Item_Weapon_Orc_TwoHand, EWeaponSkill::Untrained, S1H_Hit_01);
	default AddDeathAnimForItem(GameplayTag::Item_Weapon_Axe_TwoHand, EWeaponSkill::Untrained, S1H_Hit_01);
	default AddDeathAnimForItem(GameplayTag::Item_Weapon_Axe_TwoHand, EWeaponSkill::Trained, S1H_Hit_01);
	default AddDeathAnimForItem(GameplayTag::Item_Weapon_Axe_TwoHand, EWeaponSkill::Master, S1H_Hit_01);
    default AddDeathAnimForItem(GameplayTag::Item_Weapon_Mace_OneHand, EWeaponSkill::Trained, S1H_Hit_01);
	default AddDeathAnimForItem(GameplayTag::Item_Weapon_Orc_TwoHand, EWeaponSkill::Trained, S1H_Hit_01);
    default AddDeathAnimForItem(GameplayTag::Item_Weapon_Mace_OneHand, EWeaponSkill::Master, S1H_Hit_01);
	default AddDeathAnimForItem(GameplayTag::Item_Weapon_Orc_TwoHand, EWeaponSkill::Master, S1H_Hit_01);
}


UCLASS()
class UDefault_Player : UDefault_Human
{
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Humanoid/Man/NH_MM_AnimBP.NH_MM_AnimBP_C'";

    // TURNS
	default m_TurnsData = UTurnsData_Default_Player::StaticClass();
	//
    
    // IDLE BREAKERS
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Movement_NPC/Idle/Breaker/A_Man_NPC_IdleBreaker_01.A_Man_NPC_IdleBreaker_01'", 0.4f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Movement_NPC/Idle/Breaker/A_Man_NPC_IdleBreaker_02.A_Man_NPC_IdleBreaker_02'", 1.0f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Movement_NPC/Idle/Breaker/A_Man_NPC_IdleBreaker_03.A_Man_NPC_IdleBreaker_03'", 0.6f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Movement_NPC/Idle/Breaker/A_Man_NPC_IdleBreaker_04.A_Man_NPC_IdleBreaker_04'", 1.0f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Movement_NPC/Idle/Breaker/A_Man_NPC_IdleBreaker_05.A_Man_NPC_IdleBreaker_05'", 0.8f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Movement_NPC/Idle/Breaker/A_Man_NPC_IdleBreaker_06.A_Man_NPC_IdleBreaker_06'", 1.0f, 1);
    //default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Movement_NPC/Idle/Breaker/A_Man_NPC_IdleBreaker_07.A_Man_NPC_IdleBreaker_07'", 1.0f, 1);

    // WALK BREAKERS
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Movement_NPC/Grounded/N/Breaker/A_Man_NPC_WalkBreaker_01.A_Man_NPC_WalkBreaker_01'", 0.7f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Movement_NPC/Grounded/N/Breaker/A_Man_NPC_WalkBreaker_02.A_Man_NPC_WalkBreaker_02'", 0.8f, 1);
    //default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Movement_NPC/Grounded/N/Breaker/A_Man_NPC_WalkBreaker_03.A_Man_NPC_WalkBreaker_03'", 0.6f, 1);
    //default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Movement_NPC/Grounded/N/Breaker/A_Man_NPC_WalkBreaker_04.A_Man_NPC_WalkBreaker_04'", 1.0f, 1);
    //default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Movement_NPC/Grounded/N/Breaker/A_Man_NPC_WalkBreaker_05.A_Man_NPC_WalkBreaker_05'", 0.8f, 1);
    //default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Movement_NPC/Grounded/N/Breaker/A_Man_NPC_WalkBreaker_06.A_Man_NPC_WalkBreaker_06'", 1.0f, 1);
    //default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Movement_NPC/Grounded/N/Breaker/A_Man_NPC_WalkBreaker_07.A_Man_NPC_WalkBreaker_07'", 0.4f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Movement_NPC/Grounded/N/Breaker/A_Man_NPC_WalkBreaker_08.A_Man_NPC_WalkBreaker_08'", 1.0f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Movement_NPC/Grounded/N/Breaker/A_Man_NPC_WalkBreaker_09.A_Man_NPC_WalkBreaker_09'", 0.6f, 1);
    //default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Movement_NPC/Grounded/N/Breaker/A_Man_NPC_WalkBreaker_10.A_Man_NPC_WalkBreaker_10'", 0.5f, 1);

}


UCLASS()
class UDefault_XardasSleeper : UDefault_Human
{
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Humanoid/Man/Magic/XardasSleeper_AnimBP.XardasSleeper_AnimBP_C'";

        // HITS
    default m_HitsData = UHitData_XardasSleeper::StaticClass();
}

UCLASS()
class UDefault_Human_Woman : UDefault_Human
{
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Humanoid/Women/Women_AnimBP.Women_AnimBP'";

    // TURNS
	default m_TurnsData = UTurnsData_Default_Human_Woman::StaticClass();
	//
}