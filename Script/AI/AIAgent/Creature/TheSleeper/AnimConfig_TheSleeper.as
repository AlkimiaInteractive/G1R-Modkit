UCLASS()
class UWeaponMeleeItemAnimConfig_TheSleeper : UItemAnimConfig
{
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/TheSleeper/Sleeper_AnimBP.Sleeper_AnimBP_C'";

    //IDLE BREAKERS
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/TheSleeper/Movement/Idles/Breaker/A_Sleeper_IdleBreaker_01.A_Sleeper_IdleBreaker_01'", 0.3f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/TheSleeper/Movement/Idles/Breaker/A_Sleeper_IdleBreaker_02.A_Sleeper_IdleBreaker_02'", 0.5f, 2);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/TheSleeper/Movement/Idles/Breaker/A_Sleeper_IdleBreaker_03.A_Sleeper_IdleBreaker_03'", 1.0f, 2);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/TheSleeper/Movement/Idles/Breaker/A_Sleeper_IdleBreaker_04.A_Sleeper_IdleBreaker_04'", 0.4f, 2);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/TheSleeper/Movement/Idles/Breaker/A_Sleeper_IdleBreaker_05.A_Sleeper_IdleBreaker_05'", 0.6f, 1);
}

UCLASS()
class UAnimConfig_TheSleeper : UAnimConfig
{
	default m_LocoBlendCurvesConfig = ULocoBlendCurvesConfig_Creature::StaticClass();
	default m_IKConfig = UIKConfig_Minecrawler_Generic::StaticClass();

    default SetDefaultMovementAnimData(UWeaponMeleeItemAnimConfig_TheSleeper::StaticClass());
}


