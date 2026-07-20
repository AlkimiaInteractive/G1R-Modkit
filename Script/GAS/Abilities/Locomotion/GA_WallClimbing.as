class UGA_WallClimbing : UGameplayAbilityWallClimbing
{

    default CooldownGameplayEffectClass = UGE_WallClimbing_Cooldown;

    default m_StatesMontages.FindOrAdd( n"EnterFromBelow") = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Traversal/WallClimbing/Transitions/A_Man_Climb_EnterUp_Montage.A_Man_Climb_EnterUp_Montage'";
    default m_StatesMontages.FindOrAdd( n"EnterFromJump") = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Traversal/WallClimbing/Transitions/A_Man_Climb_EnterJump_Montage.A_Man_Climb_EnterJump_Montage'";
    default m_StatesMontages.FindOrAdd( n"EnterFromFall") = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Traversal/WallClimbing/Transitions/A_Man_Climb_EnterAir_Montage.A_Man_Climb_EnterAir_Montage'";
    default m_StatesMontages.FindOrAdd( n"ExitBelow") = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Traversal/WallClimbing/Transitions/A_Man_Climb_ExitDown_Montage.A_Man_Climb_ExitDown_Montage'";
    default m_StatesMontages.FindOrAdd( n"ExitFall") = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Traversal/WallClimbing/Transitions/A_Man_Climb_ExitAir_Montage.A_Man_Climb_ExitAir_Montage'";
    default m_StatesMontages.FindOrAdd( n"EnterFromTop") = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Traversal/WallClimbing/Tests/ClimbingAnimationSet/RootMotion/Climbing_GrabWall_FromTop_RM_Montage.Climbing_GrabWall_FromTop_RM_Montage'";
    default m_StatesMontages.FindOrAdd( n"ExitTop") = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Traversal/WallClimbing/Tests/ClimbingAnimationSet/RootMotion/Climbing_ClimbUpAtTop_RM_Montage.Climbing_ClimbUpAtTop_RM_Montage'";

    default m_JumpsMontages.FindOrAdd( n"JumpDown") = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Traversal/WallClimbing/StepedClimbing/A_Man_Climb_Down_S_01_Montage.A_Man_Climb_Down_S_01_Montage'";
    default m_JumpsMontages.FindOrAdd( n"JumpLeft") = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Traversal/WallClimbing/StepedClimbing/A_Man_Climb_Left_S_01_Montage.A_Man_Climb_Left_S_01_Montage'";
    default m_JumpsMontages.FindOrAdd( n"JumpDownLeft") = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Traversal/WallClimbing/StepedClimbing/A_Man_Climb_LeftDown_S_01_Montage.A_Man_Climb_LeftDown_S_01_Montage'";
    default m_JumpsMontages.FindOrAdd( n"JumpUpLeft") = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Traversal/WallClimbing/StepedClimbing/A_Man_Climb_LeftUp_S_01_Montage.A_Man_Climb_LeftUp_S_01_Montage'";
    default m_JumpsMontages.FindOrAdd( n"JumpRight") = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Traversal/WallClimbing/StepedClimbing/A_Man_Climb_Right_S_01_Montage.A_Man_Climb_Right_S_01_Montage'";
    default m_JumpsMontages.FindOrAdd( n"JumpDownRight") = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Traversal/WallClimbing/StepedClimbing/A_Man_Climb_RightDown_S_01_Montage.A_Man_Climb_RightDown_S_01_Montage'";
    default m_JumpsMontages.FindOrAdd( n"JumpUpRight") = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Traversal/WallClimbing/StepedClimbing/A_Man_Climb_RightUp_S_01_Montage.A_Man_Climb_RightUp_S_01_Montage'";
    default m_JumpsMontages.FindOrAdd( n"JumpUp") = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Traversal/WallClimbing/StepedClimbing/A_Man_Climb_Up_S_01_Montage.A_Man_Climb_Up_S_01_Montage'";

    default m_StartOffset = FVector(0,0,0);

    default m_ClimbingAnimBP  = n"AnimBlueprint'/Game/AnimLibrary/Humanoid/Man/Traversal/WallClimbing/NH_WallClimbing_AnimBP.NH_WallClimbing_AnimBP_C'";

}

class UGE_WallClimbing_Cooldown : UGameplayEffectBase
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Action_WallClimbing);

    default DurationPolicy = EGameplayEffectDurationType::HasDuration;
    default DurationMagnitude.ScalableFloatMagnitude.Value = 0.5f;
}