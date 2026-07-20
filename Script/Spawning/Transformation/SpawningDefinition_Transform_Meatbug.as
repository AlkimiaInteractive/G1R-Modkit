
UCLASS()
class USpawnCharacterCanTransformIntoDefinition_Meatbug: USpawnCharacterCanTransformIntoDefinition
{
	default m_Config = UCharacterCanTransformIntoConfig_Meatbug::StaticClass();
	default m_Character = n"Blueprint'/Game/AI/AIAgent/Creature/Meatbug/CharacterCanTransformInto_Meatbug.CharacterCanTransformInto_Meatbug_C'";
	default m_UnTransformMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Transform/A_Meatbug_UnTransformed_Montage.A_Meatbug_UnTransformed_Montage'";
    default m_WaitingTimeCrouchUntilTransform = .01f;
	default m_WaitingTimeCrouchUntilUnTransform = 2.0f;
    default m_CameraTravellingInitialDelay = 5.5f;
    default m_CameraTravellingDuration = 1.5f;
}

UCLASS()
class UCharacterCanTransformIntoConfig_Meatbug : UCharacterConfig
{
	default m_LocomotionConfig = ULocomotionConfig_Meatbug::StaticClass();
	default m_AnimConfig = UAnimConfig_Meatbug::StaticClass();
	default m_CharacterDefinition = UCharacterDefinition_Creature_Meatbug::StaticClass();
	default m_NavigationConfig = UAIAgentConfig_Navigation_Meatbug::StaticClass();
	default m_CharacterDefaultInteraction = USmashMeatBugCharacterInteraction::StaticClass();
}