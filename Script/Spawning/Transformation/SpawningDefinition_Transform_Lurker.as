
UCLASS()
class USpawnCharacterCanTransformIntoDefinition_Lurker: USpawnCharacterCanTransformIntoDefinition
{
	default m_Config = UCharacterCanTransformIntoConfig_Lurker::StaticClass();
	default m_Character = n"Blueprint'/Game/AI/AIAgent/Creature/Lurker/CharacterCanTransformInto_Lurker.CharacterCanTransformInto_Lurker_C'";
	default m_UnTransformMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Transform/A_Lurker_UnTransformed_Montage.A_Lurker_UnTransformed_Montage'";
	
	default m_WaitingTimeCrouchUntilTransform = .01f;
	default m_WaitingTimeCrouchUntilUnTransform = 2.0f;
    default m_CameraTravellingInitialDelay = 5.5f;
    default m_CameraTravellingDuration = 1.5f;
	default m_CanSwim = true;
}

UCLASS()
class UCharacterCanTransformIntoConfig_Lurker : UCharacterConfig
{
	default m_LocomotionConfig = ULocomotionConfig_Lurker_Player::StaticClass();
	default m_AnimConfig = UAnimConfig_Lurker::StaticClass();
	default m_CharacterDefinition = UCharacterDefinition_Creature_Lurker::StaticClass();
	default m_NavigationConfig = UAIAgentConfig_Navigation_Lurker::StaticClass();
}