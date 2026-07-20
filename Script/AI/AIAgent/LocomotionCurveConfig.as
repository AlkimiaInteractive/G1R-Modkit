class ULocomotionCurveConfig_General : ULocomotionCurveConfig
{   
    default m_GroundFrictionCurveStanding = n"CurveFloat'/Game/AnimLibrary/Data/Curves/CharacterMovementCurves/Curve_GroundFriction_Standing_AI.Curve_GroundFriction_Standing_AI'";
    default m_AccelerationCurveStanding = n"CurveFloat'/Game/AnimLibrary/Data/Curves/CharacterMovementCurves/Curve_Acceleration_Standing.Curve_Acceleration_Standing'";
    default m_DecelerationCurveStanding = n"CurveFloat'/Game/AnimLibrary/Data/Curves/CharacterMovementCurves/Curve_BrakingDeceleration_Standing.Curve_BrakingDeceleration_Standing'";
    default m_RotationRateCurveStandingVelocityDirection = n"CurveFloat'/Game/AnimLibrary/Data/Curves/CharacterMovementCurves/Curve_ResponsiveRotation.Curve_ResponsiveRotation'";
    default m_RotationRateCurveStandingLookingDirection = n"CurveFloat'/Game/AnimLibrary/Data/Curves/CharacterMovementCurves/Curve_RotationRate.Curve_RotationRate'";
    
    default m_GroundFrictionCurveCrouching = n"CurveFloat'/Game/AnimLibrary/Data/Curves/CharacterMovementCurves/Curve_GroundFriction_Crouching.Curve_GroundFriction_Crouching'";
    default m_DecelerationCurveCrouching = n"CurveFloat'/Game/AnimLibrary/Data/Curves/CharacterMovementCurves/Curve_BrakingDeceleration_Crouching.Curve_BrakingDeceleration_Crouching'";
    default m_AccelerationCurveCrouching = n"CurveFloat'/Game/AnimLibrary/Data/Curves/CharacterMovementCurves/Curve_Acceleration_Crouching.Curve_Acceleration_Crouching'";
    default m_RotationRateCurveCrouching = n"CurveFloat'/Game/AnimLibrary/Data/Curves/CharacterMovementCurves/Curve_RotationRate.Curve_RotationRate'";

    default m_BuoyancyCurve = n"CurveFloat'/Game/AnimLibrary/Data/Curves/CharacterMovementCurves/Curve_Buoyancy.Curve_Buoyancy'";
    default m_AccelerationCurveSwimming = n"CurveFloat'/Game/AnimLibrary/Data/Curves/CharacterMovementCurves/Curve_Acceleration_Standing.Curve_Acceleration_Standing'";
    default m_DecelerationCurveSwimming = n"CurveFloat'/Game/AnimLibrary/Data/Curves/CharacterMovementCurves/Curve_BrakingDeceleration_Swim.Curve_BrakingDeceleration_Swim'";
    default m_RotationRateCurveSwimming = n"CurveFloat'/Game/AnimLibrary/Data/Curves/CharacterMovementCurves/Curve_RotationRate_Swimming.Curve_RotationRate_Swimming'";
    
    default m_AirFrictionCurve = n"CurveFloat'/Game/AnimLibrary/Data/Curves/CharacterMovementCurves/Curve_AirFriction.Curve_AirFriction'";
    default m_AccelerationCurveFlying = n"CurveFloat'/Game/AnimLibrary/Data/Curves/CharacterMovementCurves/Curve_Acceleration_Flying.Curve_Acceleration_Flying'";
    default m_DecelerationCurveFlying = n"CurveFloat'/Game/AnimLibrary/Data/Curves/CharacterMovementCurves/Curve_BrakingDeceleration_Flying.Curve_BrakingDeceleration_Flying'";
    default m_RotationRateCurveFlying = n"CurveFloat'/Game/AnimLibrary/Data/Curves/CharacterMovementCurves/Curve_ResponsiveRotation.Curve_ResponsiveRotation'";
}

class ULocomotionCurveConfig_Biped : ULocomotionCurveConfig_General
{
    default m_DecelerationCurveStanding = n"CurveFloat'/Game/AnimLibrary/Data/Curves/CharacterMovementCurves/Curve_BrakingDeceleration_Standing_Bipeds.Curve_BrakingDeceleration_Standing_Bipeds'";
    default m_AccelerationCurveStanding = n"CurveFloat'/Game/AnimLibrary/Data/Curves/CharacterMovementCurves/Curve_Acceleration_Standing.Curve_Acceleration_Standing'";
}

class ULocomotionCurveConfig_Biped_Creatures : ULocomotionCurveConfig_Biped
{
    default m_RotationRateCurveStandingVelocityDirection = n"CurveFloat'/Game/AnimLibrary/Data/Curves/CharacterMovementCurves/Curve_ResponsiveRotation_Bipeds_Creatures.Curve_ResponsiveRotation_Bipeds_Creatures'";
}

class ULocomotionCurveConfig_Biped_Player : ULocomotionCurveConfig_Biped
{
    default m_GroundFrictionCurveStanding = n"CurveFloat'/Game/AnimLibrary/Data/Curves/CharacterMovementCurves/Curve_GroundFriction_Standing.Curve_GroundFriction_Standing'";
}

class ULocomotionCurveConfig_Golems : ULocomotionCurveConfig_Biped
{
    default m_DecelerationCurveStanding = n"CurveFloat'/Game/AnimLibrary/Data/Curves/CharacterMovementCurves/Curve_BrakingDeceleration_Standing_Golems.Curve_BrakingDeceleration_Standing_Golems'";
    default m_RotationRateCurveStandingVelocityDirection = n"CurveFloat'/Game/AnimLibrary/Data/Curves/CharacterMovementCurves/Curve_ResponsiveRotation_Golems.Curve_ResponsiveRotation_Golems'";
}

class ULocomotionCurveConfig_Dinosaurs : ULocomotionCurveConfig_Biped
{
    default m_AccelerationCurveStanding = n"CurveFloat'/Game/AnimLibrary/Data/Curves/CharacterMovementCurves/Curve_Acceleration_Standing_Dinosaurs.Curve_Acceleration_Standing_Dinosaurs'";
    default m_DecelerationCurveStanding = n"CurveFloat'/Game/AnimLibrary/Data/Curves/CharacterMovementCurves/Curve_BrakingDeceleration_Standing_Dinosaurs.Curve_BrakingDeceleration_Standing_Dinosaurs'";
    default m_RotationRateCurveStandingVelocityDirection = n"CurveFloat'/Game/AnimLibrary/Data/Curves/CharacterMovementCurves/Curve_ResponsiveRotation_Dinosaurs.Curve_ResponsiveRotation_Dinosaurs'";
}

class ULocomotionCurveConfig_Dinosaurs_Player : ULocomotionCurveConfig_Dinosaurs
{
    default m_RotationRateCurveStandingVelocityDirection = n"CurveFloat'/Game/AnimLibrary/Data/Curves/CharacterMovementCurves/Curve_ResponsiveRotation_Dinosaurs.Curve_ResponsiveRotation_Dinosaurs'";
    default m_GroundFrictionCurveStanding = n"CurveFloat'/Game/AnimLibrary/Data/Curves/CharacterMovementCurves/Curve_GroundFriction_Standing.Curve_GroundFriction_Standing'";
}

class ULocomotionCurveConfig_Harpy : ULocomotionCurveConfig_Biped
{
    default m_AccelerationCurveStanding = n"CurveFloat'/Game/AnimLibrary/Data/Curves/CharacterMovementCurves/Curve_Acceleration_Standing_Harpy.Curve_Acceleration_Standing_Harpy'";
    
    default m_RotationRateCurveFlying = n"CurveFloat'/Game/AnimLibrary/Data/Curves/CharacterMovementCurves/Curve_ResponsiveRotation.Curve_ResponsiveRotation'";
    default m_AirFrictionCurve = n"CurveFloat'/Game/AnimLibrary/Data/Curves/CharacterMovementCurves/Curve_AirFriction.Curve_AirFriction'";
    default m_AccelerationCurveFlying = n"CurveFloat'/Game/AnimLibrary/Data/Curves/CharacterMovementCurves/Curve_Acceleration_Flying.Curve_Acceleration_Flying'";
    default m_DecelerationCurveFlying = n"CurveFloat'/Game/AnimLibrary/Data/Curves/CharacterMovementCurves/Curve_BrakingDeceleration_Flying.Curve_BrakingDeceleration_Flying'";
}

class ULocomotionCurveConfig_Harpy_Player : ULocomotionCurveConfig_Biped_Player
{
    default m_AccelerationCurveStanding = n"CurveFloat'/Game/AnimLibrary/Data/Curves/CharacterMovementCurves/Curve_Acceleration_Standing_Harpy.Curve_Acceleration_Standing_Harpy'";
    
    default m_RotationRateCurveFlying = n"CurveFloat'/Game/AnimLibrary/Data/Curves/CharacterMovementCurves/Curve_ResponsiveRotation.Curve_ResponsiveRotation'";
    default m_AirFrictionCurve = n"CurveFloat'/Game/AnimLibrary/Data/Curves/CharacterMovementCurves/Curve_AirFriction_Player.Curve_AirFriction_Player'";
    default m_AccelerationCurveFlying = n"CurveFloat'/Game/AnimLibrary/Data/Curves/CharacterMovementCurves/Curve_Acceleration_Flying_Player.Curve_Acceleration_Flying_Player'";
    default m_DecelerationCurveFlying = n"CurveFloat'/Game/AnimLibrary/Data/Curves/CharacterMovementCurves/Curve_BrakingDeceleration_Flying_Player.Curve_BrakingDeceleration_Flying_Player'";
}

class ULocomotionCurveConfig_Player_MM : ULocomotionCurveConfig_Biped_Player
{
    default m_GroundFrictionCurveStanding = n"CurveFloat'/Game/AnimLibrary/Data/Curves/CharacterMovementCurves/NewMM/N/Curve_GroundFriction_Standing_MM.Curve_GroundFriction_Standing_MM'";
    default m_AccelerationCurveStanding = n"CurveFloat'/Game/AnimLibrary/Data/Curves/CharacterMovementCurves/NewMM/N/Curve_Acceleration_Standing_Player_MM.Curve_Acceleration_Standing_Player_MM'";
    default m_DecelerationCurveStanding = n"CurveFloat'/Game/AnimLibrary/Data/Curves/CharacterMovementCurves/NewMM/N/Curve_BrakingDeceleration_Standing_Player_MM.Curve_BrakingDeceleration_Standing_Player_MM'";
    default m_RotationRateCurveStandingVelocityDirection = n"CurveFloat'/Game/AnimLibrary/Data/Curves/CharacterMovementCurves/NewMM/N/Curve_RotationRate_MM.Curve_RotationRate_MM'";
    
    default m_GroundFrictionCurveStandingStrafe = n"CurveFloat'/Game/AnimLibrary/Data/Curves/CharacterMovementCurves/NewMM/STR/Curve_GroundFriction_Standing_MM_Strafe.Curve_GroundFriction_Standing_MM_Strafe'";
    default m_AccelerationCurveStandingStrafe = n"CurveFloat'/Game/AnimLibrary/Data/Curves/CharacterMovementCurves/NewMM/STR/Curve_Acceleration_Standing_Player_MM_Strafe.Curve_Acceleration_Standing_Player_MM_Strafe'";
    default m_DecelerationCurveStandingStrafe = n"CurveFloat'/Game/AnimLibrary/Data/Curves/CharacterMovementCurves/NewMM/STR/Curve_BrakingDeceleration_Standing_Player_MM_Strafe.Curve_BrakingDeceleration_Standing_Player_MM_Strafe'";
    default m_RotationRateCurveStandingLookingDirection = n"CurveFloat'/Game/AnimLibrary/Data/Curves/CharacterMovementCurves/NewMM/STR/Curve_RotationRate_MM_Strafe.Curve_RotationRate_MM_Strafe'";
    
    default m_GroundFrictionCurveCrouching = n"CurveFloat'/Game/AnimLibrary/Data/Curves/CharacterMovementCurves/NewMM/STL/Curve_GroundFriction_Crouching_MM.Curve_GroundFriction_Crouching_MM'";
    default m_AccelerationCurveCrouching = n"CurveFloat'/Game/AnimLibrary/Data/Curves/CharacterMovementCurves/NewMM/STL/Curve_Acceleration_Crouching_MM.Curve_Acceleration_Crouching_MM'";
    default m_DecelerationCurveCrouching = n"CurveFloat'/Game/AnimLibrary/Data/Curves/CharacterMovementCurves/NewMM/STL/Curve_BrakingDeceleration_Crouching_MM.Curve_BrakingDeceleration_Crouching_MM'";
    default m_RotationRateCurveCrouching = n"CurveFloat'/Game/AnimLibrary/Data/Curves/CharacterMovementCurves/NewMM/STL/Curve_RotationRate_Crouching_MM.Curve_RotationRate_Crouching_MM'";
}

class ULocomotionCurveConfig_Quadruped : ULocomotionCurveConfig_General
{
    default m_AccelerationCurveStanding = n"CurveFloat'/Game/AnimLibrary/Data/Curves/CharacterMovementCurves/Curve_Acceleration_Standing_Quadruped.Curve_Acceleration_Standing_Quadruped'";
    default m_DecelerationCurveStanding = n"CurveFloat'/Game/AnimLibrary/Data/Curves/CharacterMovementCurves/Curve_BrakingDeceleration_Standing_Quadrupeds.Curve_BrakingDeceleration_Standing_Quadrupeds'";
    default m_RotationRateCurveStandingVelocityDirection = n"CurveFloat'/Game/AnimLibrary/Data/Curves/CharacterMovementCurves/Curve_ResponsiveRotation_Quadrupeds.Curve_ResponsiveRotation_Quadrupeds'";
}

class ULocomotionCurveConfig_Quadruped_Player : ULocomotionCurveConfig_Quadruped
{
    default m_GroundFrictionCurveStanding = n"CurveFloat'/Game/AnimLibrary/Data/Curves/CharacterMovementCurves/Curve_GroundFriction_Standing_Quadruped.Curve_GroundFriction_Standing_Quadruped'";
}

class ULocomotionCurveConfig_Wolf : ULocomotionCurveConfig_Quadruped
{
    default m_AccelerationCurveStanding = n"CurveFloat'/Game/AnimLibrary/Data/Curves/CharacterMovementCurves/Curve_Acceleration_Standing_Wolf.Curve_Acceleration_Standing_Wolf'";
}
class ULocomotionCurveConfig_Wolf_Player : ULocomotionCurveConfig_Wolf
{
    default m_GroundFrictionCurveStanding = n"CurveFloat'/Game/AnimLibrary/Data/Curves/CharacterMovementCurves/Curve_GroundFriction_Standing_Quadruped.Curve_GroundFriction_Standing_Quadruped'";
}

class ULocomotionCurveConfig_Swampshark : ULocomotionCurveConfig_General
{
    default m_AccelerationCurveStanding = n"CurveFloat'/Game/AnimLibrary/Data/Curves/CharacterMovementCurves/Curve_Acceleration_Swampshark.Curve_Acceleration_Swampshark'";
    default m_DecelerationCurveStanding = n"CurveFloat'/Game/AnimLibrary/Data/Curves/CharacterMovementCurves/Curve_BrakingDeceleration_Swampshark.Curve_BrakingDeceleration_Swampshark'";
}

class ULocomotionCurveConfig_Swampshark_Player : ULocomotionCurveConfig_Swampshark
{
    default m_GroundFrictionCurveStanding = n"CurveFloat'/Game/AnimLibrary/Data/Curves/CharacterMovementCurves/Curve_GroundFriction_Swampshark.Curve_GroundFriction_Swampshark'";
    default m_RotationRateCurveStandingVelocityDirection = n"CurveFloat'/Game/AnimLibrary/Data/Curves/CharacterMovementCurves/Curve_ResponsiveRotation_Swampshark.Curve_ResponsiveRotation_Swampshark'";
}

class ULocomotionCurveConfig_Orc : ULocomotionCurveConfig_Biped
{
    default m_AccelerationCurveStanding = n"CurveFloat'/Game/AnimLibrary/Data/Curves/CharacterMovementCurves/Curve_Acceleration_Standing_Orc.Curve_Acceleration_Standing_Orc'";
    default m_DecelerationCurveStanding = n"CurveFloat'/Game/AnimLibrary/Data/Curves/CharacterMovementCurves/Curve_BrakingDeceleration_Standing_Orc.Curve_BrakingDeceleration_Standing_Orc'";
}