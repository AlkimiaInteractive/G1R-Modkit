
UCLASS()
class USpawnCharacterCanTransformIntoDefinition_Snapper: USpawnCharacterCanTransformIntoDefinition
{
	default m_Config = UCharacterCanTransformIntoConfig_Snapper::StaticClass();
	default m_Character = n"Blueprint'/Game/AI/AIAgent/Creature/Snapper/CharacterCanTransformInto_Snapper.CharacterCanTransformInto_Snapper_C'";
	default m_UnTransformMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Transform/A_Snapper_UnTransformed_Montage.A_Snapper_UnTransformed_Montage'";
	
	default m_WaitingTimeCrouchUntilTransform = .01f;
	default m_WaitingTimeCrouchUntilUnTransform = 2.0f;
    default m_CameraTravellingInitialDelay = 5.5f;
    default m_CameraTravellingDuration = 1.5f;
	default m_CanSwim = true;
}

UCLASS()
class UCharacterCanTransformIntoConfig_Snapper : UCharacterConfig
{
	default m_LocomotionConfig = ULocomotionConfig_Snapper_Player::StaticClass();
	//default m_SoundConfig = USoundConfig_Snapper::StaticClass();
	default m_AnimConfig = UAnimConfig_Snapper::StaticClass();
	default m_CharacterDefinition = UCharacterDefinition_Creature_Snapper::StaticClass();
	default m_NavigationConfig = UAIAgentConfig_Navigation_Snapper::StaticClass();
}