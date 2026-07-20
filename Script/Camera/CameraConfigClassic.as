/*
* List of cam behaviours:
* Menu, Idle, Running, Sprinting, Crouch, Aim, AimCrouch, AimSpell, AimCrouchSpell, 
* AimRanged, AimCrouchRanged, Swim,Dive, Combat, CombatOneTwo, CombatThreePlus, CombatFly, 
* Spell, WallClimbing
*/

UCLASS()
class UClassicCamera : UDefaultCamera

{
    default m_FileName = "CameraConfigClassic.as";
    default m_ArmLength = 300.0f;
    default m_Fov = 75.0f;
    default m_SocketOffset = FVector(0.0f, 5.0f, 20.0f);
    default m_LagSpeed = 50.0f;
    default m_RotationLagSpeed = 100.0f;
    default m_RotationLagSpeedPitch = 30.0f;
    default m_LagMaxDistance = 50.0f;
    default m_EaseNavigationUp = Ease(3.0f, EEasingFunc::EaseOut);
    default m_EaseNavigationDown = Ease(1.5f, EEasingFunc::EaseOut);
    default m_EaseSpeedMenu = Ease(0.75f, EEasingFunc::EaseOut);
    default m_EaseSpeedNormal = Ease(1.0f, EEasingFunc::EaseOut);
    default m_EaseSpeedFast = Ease(0.5f, EEasingFunc::EaseOut);
    default m_EaseSpeedMedium = Ease(1.0f, EEasingFunc::EaseOut);
    default m_EaseSpeedSlow = Ease(1.5f, EEasingFunc::EaseOut);
    default m_EaseChangeTime = Ease(2.0f, EEasingFunc::EaseOut);
    default m_TargetViewPitchMin = -30.0f;
    default m_TargetViewPitchMax = 30.0f;
    default m_CameraFadeDist = 50.0f;
    default m_WaterTransitionPitch = -25.0f;
    default m_AimPitchLimit = 25.0f;

   //FCameraBehaviour Menu;
   //default Menu.m_SocketOffset = FVector(0.0f, -30.0f, 0.0f);
   //default m_CamBehaviours.Add(ECamConditions::Menu, Menu);

   FCameraBehaviour IdleClassic;
   default m_CamBehaviours.Add(ECamConditions::Idle, Idle);

   FCameraBehaviour RunninClassic;
   default Running.m_ArmLength = 300.0f;
   default Running.m_Fov = 75.0f;
   default Running.m_SocketOffset = FVector(0.0f, 0.0f, 0.0f);
   default m_CamBehaviours.Add(ECamConditions::Running, Running);

   FCameraBehaviour SprintingClassic;
   default Sprinting.m_ArmLength = 400.0f;
   default Sprinting.m_Fov = 75.0f;
   default Sprinting.m_SocketOffset = FVector(0.0f, 0.0f, 30.0f);
   default Sprinting.m_LagSpeed = 25.0f;
   default m_CamBehaviours.Add(ECamConditions::Sprinting, Sprinting);

   FCameraBehaviour CrouchCamClassic;
   default CrouchCam.m_ArmLength = 200.0f;
   default CrouchCam.m_Fov = 75.0f;
   default CrouchCam.m_SocketOffset = FVector(0.0f, 0.0f, -0.0f);
   default CrouchCam.m_LagSpeed = 100.0f;
   default m_CamBehaviours.Add(ECamConditions::Crouch, CrouchCam);

   FCameraBehaviour RangedWeaponCrouchClassic;
   default CrouchCam.m_ArmLength = 200.0f;
   default CrouchCam.m_Fov = 75.0f;
   default CrouchCam.m_SocketOffset = FVector(0.0f, 0.0f, 0.0f);
   default CrouchCam.m_LagSpeed = 100.0f;
   default m_CamBehaviours.Add(ECamConditions::RangedWeaponCrouch, RangedWeaponCrouch);

   //FCameraBehaviour CrouchAimCam;
   //default CrouchAimCam.m_ArmLength = 100.0f;
   //default CrouchAimCam.m_Fov = 70.0f;
   //default CrouchAimCam.m_LagSpeed = 100.0f;
   //default CrouchAimCam.m_SocketOffset = FVector(0.0f, 40.0f, -35.0f);
   //default m_CamBehaviours.Add(ECamConditions::AimCrouch, CrouchAimCam);

   //FCameraBehaviour AimCam;
   //default AimCam.m_Fov = 70.0f;
   //default AimCam.m_LagSpeed = 100.0f;
   //default AimCam.m_ArmLength = 120.0f;
   //default AimCam.m_SocketOffset = FVector(0.0f, 50.0f, 10.0f);
   //default m_CamBehaviours.Add(ECamConditions::Aim, AimCam);

   //FCameraBehaviour RangedWeapon;
   //default RangedWeapon.m_LagSpeed = 100.0f;
   //default m_CamBehaviours.Add(ECamConditions::RangedWeapon, RangedWeapon);
   
   //FCameraBehaviour FrontAreaWeapon;
   //default FrontAreaWeapon.m_LagSpeed = 50.0f;
   //default FrontAreaWeapon.m_RotationLagSpeed = 10.0f;
   //default FrontAreaWeapon.m_RotationLagSpeedPitch = 10.0f;
   //default m_CamBehaviours.Add(ECamConditions::FrontArea, FrontAreaWeapon);

   //FCameraBehaviour AimCamRanged;
   //default AimCamRanged.m_Fov = 70.0f;
   //default AimCamRanged.m_LagSpeed = 100.0f;
   //default AimCamRanged.m_ArmLength = 125.0f;
   //default AimCamRanged.m_SocketOffset = FVector(0.0f, 60.0f, 5.0f);
   //default m_CamBehaviours.Add(ECamConditions::AimRanged, AimCamRanged);

   //FCameraBehaviour AimSpellRanged;
   //default AimSpellRanged.m_Fov = 65.0f;
   //default AimSpellRanged.m_LagSpeed = 100.0f;
   //default AimSpellRanged.m_ArmLength = 175.0f;
   //default AimSpellRanged.m_SocketOffset = FVector(0.0f, 90.0f, 10.0f);
   //default m_CamBehaviours.Add(ECamConditions::AimSpell, AimSpellRanged);

   //FCameraBehaviour AimCrouchRanged;
   //default AimCrouchRanged.m_Fov = 70.0f;
   //default AimCrouchRanged.m_SocketOffset = FVector(0.0f, 60.0f, -17.0f);
   //default AimCrouchRanged.m_LagSpeed = 100.0f;
   //default AimCrouchRanged.m_ArmLength = 125.0f;
   //default m_CamBehaviours.Add(ECamConditions::AimCrouchRanged, AimCrouchRanged);

   //FCameraBehaviour AimCrouchSpell;
   //default AimCrouchSpell.m_Fov = 65.0f;
   //default AimCrouchSpell.m_SocketOffset = FVector(0.0f, 90.0f, 30.0f);
   //default AimCrouchSpell.m_LagSpeed = 100.0f;
   //default AimCrouchSpell.m_ArmLength = 175.0f;
   //default m_CamBehaviours.Add(ECamConditions::AimCrouchSpell, AimCrouchSpell);

   FCameraBehaviour CombatCamOneTwoClassic;
   default CombatCamOneTwo.m_SocketOffset = FVector(-100.0f, 0.0f, 45.0f);
   default m_CamBehaviours.Add(ECamConditions::CombatOneTwo, CombatCamOneTwo);

   FCameraBehaviour CombatBigClassic;
   default CombatBig.m_SocketOffset = FVector(-100.0f, 0.0f, 45.0f);
   default AimCrouchSpell.m_Fov = 80.0f;
    default AimCrouchSpell.m_LagSpeed = 210.0f;
   default m_CamBehaviours.Add(ECamConditions::CombatBig, CombatBig);

   FCameraBehaviour CombatFlyClassic;
    default CombatFlyClassic.m_SocketOffset = FVector(-100.0f, 0.0f, 45.0f);
   default m_CamBehaviours.Add(ECamConditions::CombatFly, CombatFly);

   
   //FCameraBehaviour WallClimbing;
   //default WallClimbing.m_SocketOffset = FVector(0.0f, 0.0f, 0.0f);
   //default WallClimbing.m_ArmLength = 450.0f;
   //default m_CamBehaviours.Add(ECamConditions::WallClimbing, WallClimbing);

   //FCameraBehaviour Swim;
   //default Swim.m_PitchLimit = 60.0f;
   //default m_CamBehaviours.Add(ECamConditions::Swim, Swim);

   //FCameraBehaviour SpellCombatTargeting;
   //default SpellCombatTargeting.m_SpellPitchLimit = 90.0f;
   //default m_CamBehaviours.Add(ECamConditions::SpellCombatTargeting, SpellCombatTargeting);
}
