
UCLASS()
class USpawnCharacterCanTransformIntoDefinition_Bloodfly: USpawnCharacterCanTransformIntoDefinition
{
	default m_Config = UCharacterCanTransformIntoConfig_Bloodfly::StaticClass();
	default m_Character = n"Blueprint'/Game/AI/AIAgent/Creature/Bloodfly/CharacterCanTransformInto_Bloodfly.CharacterCanTransformInto_Bloodfly_C'";
	default m_UnTransformMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Transform/A_Bloodfly_UnTransformed_Montage.A_Bloodfly_UnTransformed_Montage'";
	default m_ShouldStartFlying = true;
	
	default m_WaitingTimeCrouchUntilTransform = .01f;
	default m_WaitingTimeCrouchUntilUnTransform = 2.0f;
    default m_CameraTravellingInitialDelay = 5.5f;
    default m_CameraTravellingDuration = 1.5f;
}

UCLASS()
class UCharacterCanTransformIntoConfig_Bloodfly : UCharacterConfig
{
	default m_LocomotionConfig = ULocomotionConfig_Bloodfly_Player::StaticClass();
	default m_AnimConfig = UAnimConfig_Bloodfly::StaticClass();
	default m_CharacterDefinition = UCharacterDefinition_Creature_Bloodfly::StaticClass();
	default m_NavigationConfig = UAIAgentConfig_Navigation_Bloodfly::StaticClass();
}