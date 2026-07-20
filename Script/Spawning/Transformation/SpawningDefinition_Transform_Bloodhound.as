
UCLASS()
class USpawnCharacterCanTransformIntoDefinition_Bloodhound: USpawnCharacterCanTransformIntoDefinition
{
	default m_Config = UCharacterCanTransformIntoConfig_Bloodhound::StaticClass();
	default m_Character = n"Blueprint'/Game/AI/AIAgent/Creature/Bloodhound/CharacterCanTransformInto_Bloodhound.CharacterCanTransformInto_Bloodhound_C'";
	default m_UnTransformMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Transform/A_Bloodhound_UnTransformed_Montage.A_Bloodhound_UnTransformed_Montage'";
		
	default m_WaitingTimeCrouchUntilTransform = .01f;
	default m_WaitingTimeCrouchUntilUnTransform = 2.0f;
    default m_CameraTravellingInitialDelay = 5.5f;
    default m_CameraTravellingDuration = 1.5f;
	default m_CanSwim = true;
}

UCLASS()
class UCharacterCanTransformIntoConfig_Bloodhound : UCharacterConfig
{
	default m_LocomotionConfig = ULocomotionConfig_Bloodhound_Player::StaticClass();
	default m_AnimConfig = UAnimConfig_Bloodhound::StaticClass();
	default m_CharacterDefinition = UCharacterDefinition_Creature_Bloodhound::StaticClass();
	default m_NavigationConfig = UAIAgentConfig_Navigation_Bloodhound::StaticClass();
	}