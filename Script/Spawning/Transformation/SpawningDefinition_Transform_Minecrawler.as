
UCLASS()
class USpawnCharacterCanTransformIntoDefinition_Minecrawler: USpawnCharacterCanTransformIntoDefinition
{
	default m_Config = UCharacterCanTransformIntoConfig_Minecrawler::StaticClass();
	default m_Character = n"Blueprint'/Game/AI/AIAgent/Creature/Minecrawler/CharacterCanTransformInto_Minecrawler.CharacterCanTransformInto_Minecrawler_C'";
	default m_UnTransformMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Transform/A_Minecrawler_UnTransformed_Montage.A_Minecrawler_UnTransformed_Montage'";
	default m_WaitingTimeCrouchUntilTransform = .01f;
	default m_WaitingTimeCrouchUntilUnTransform = 2.0f;
    default m_CameraTravellingInitialDelay = 5.5f;
    default m_CameraTravellingDuration = 1.5f;
}

UCLASS()
class UCharacterCanTransformIntoConfig_Minecrawler : UCharacterConfig
{
	default m_LocomotionConfig = ULocomotionConfig_Minecrawler_Player::StaticClass();
	//default m_SoundConfig = USoundConfig_Minecrawler::StaticClass();
	default m_AnimConfig = UAnimConfig_Minecrawler::StaticClass();
	default m_CharacterDefinition = UCharacterDefinition_Creature_Minecrawler::StaticClass();
	default m_NavigationConfig = UAIAgentConfig_Navigation_Minecrawler_Large::StaticClass();
}