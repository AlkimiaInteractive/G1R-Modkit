
UCLASS()
class USpawnCharacterCanTransformIntoDefinition_Swampshark: USpawnCharacterCanTransformIntoDefinition
{
	default m_Config = UCharacterCanTransformIntoConfig_Swampshark::StaticClass();
	default m_Character = n"Blueprint'/Game/AI/AIAgent/Creature/Swampshark/CharacterCanTransformInto_Swampshark.CharacterCanTransformInto_Swampshark_C'";
	default m_UnTransformMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Transform/A_Swampshark_UnTransformed_Montage.A_Swampshark_UnTransformed_Montage'";
	
	default m_WaitingTimeCrouchUntilTransform = .01f;
    default m_WaitingTimeCrouchUntilUnTransform = 2.0f;
    default m_CameraTravellingInitialDelay = 0.0f;
    default m_CameraTravellingDuration = 0.5f;
	default m_CanSwim = true;
}

UCLASS()
class UCharacterCanTransformIntoConfig_Swampshark : UCharacterConfig
{
	default m_LocomotionConfig = ULocomotionConfig_Swampshark_Player::StaticClass();
	default m_AnimConfig = UAnimConfig_Swampshark::StaticClass();
	default m_CharacterDefinition = UCharacterDefinition_Creature_Swampshark::StaticClass();
	default m_NavigationConfig = UAIAgentConfig_Navigation_Swampshark_Sleeper::StaticClass();
}