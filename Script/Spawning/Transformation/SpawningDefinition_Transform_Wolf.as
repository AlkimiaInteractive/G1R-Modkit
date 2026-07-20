
UCLASS()
class USpawnCharacterCanTransformIntoDefinition_Wolf: USpawnCharacterCanTransformIntoDefinition
{
	default m_Config = UCharacterCanTransformIntoConfig_Wolf::StaticClass();
	default m_Character = n"Blueprint'/Game/AI/AIAgent/Creature/Wolf/CharacterCanTransformInto_Wolf.CharacterCanTransformInto_Wolf_C'";
	default m_UnTransformMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Transform/A_Wolf_UnTransformed_Montage.A_Wolf_UnTransformed_Montage'";
    
	default m_WaitingTimeCrouchUntilTransform = 0.01f;
	default m_WaitingTimeCrouchUntilUnTransform = 2.0f;
    default m_CameraTravellingInitialDelay = 5.5f;
    default m_CameraTravellingDuration = 1.5f;
	default m_CanSwim = true;
}

UCLASS()
class UCharacterCanTransformIntoConfig_Wolf : UCharacterConfig
{
	default m_LocomotionConfig = ULocomotionConfig_Wolf_Player::StaticClass();
	default m_AnimConfig = UAnimConfig_Wolf::StaticClass();
	default m_CharacterDefinition = UCharacterDefinition_Creature_Wolf::StaticClass();
	default m_NavigationConfig = UAIAgentConfig_Navigation_Wolf::StaticClass();
}