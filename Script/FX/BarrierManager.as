UCLASS()
class ABarrierManagerAS : ABarrierManager
{
    default m_SafeZoneDistance = 2350.f; //Distance to barrier green zone (safe)
    default m_WarningZoneDistance = 350.f; //Distance to warning zone (noise)
    default m_RedZoneDistance = 200.f; //Distance to barrier red zone
    default m_BarrierRayRandomFactor = 20.f; //Barrier rays random dispersion
    default m_GroundRayRandomFactor = 40.f; //Ground rays random dispersion
    default m_MaxHeight = 1400.f; //Max height to launch a ray from the ground
    default m_GroundRaysAmount = 2.f;
    default m_BarrierRaysAmount = 3.f;
    default m_NewRayBarrierDist = 1000.f;  // Max distance of the barrier rays
    default m_NewRayGroundDist = 500.f; // Max distance of the ground rays
    default m_MinBarrierRayDistance = 750.f; // Minimum distance of the barrier rays between each other
    default m_OrangeZoneEffect = UGE_WeakDamageBarrier_ByMaxHealthPercentage::StaticClass();
    default m_RedZoneEffect = UGE_StrongDamageBarrier_ByMaxHealthPercentage::StaticClass();
    default m_LightColor = FLinearColor(0.1, 0.3, 0.5);
    default m_LightIntensity = 45.0f;   
    default m_LightVolumetricScattering = 0.2f;
    //Bipeds
    default m_GroundRaysSourceBones.Add("calf_l");
    default m_GroundRaysSourceBones.Add("calf_r");
    //Arachnyds
    default m_GroundRaysSourceBones.Add("frontleg_04_r");
    default m_GroundRaysSourceBones.Add("frontleg_04_l");
    default m_GroundRaysSourceBones.Add("backleg_04_l");
    default m_GroundRaysSourceBones.Add("backleg_04_r");
    default m_GroundRaysSourceBones.Add("middleleg_05_l");
    default m_GroundRaysSourceBones.Add("middleleg_05_r");
    //Quadrupeds
    default m_GroundRaysSourceBones.Add("f_ankle_l");
    default m_GroundRaysSourceBones.Add("f_ankle_r");
    default m_GroundRaysSourceBones.Add("b_ankle_l");
    default m_GroundRaysSourceBones.Add("b_ankle_r");

    default m_RedRaysSourceBones.Add("pelvis");

    //FXTags
    default m_FX_BarrierWarning = GameplayTag::FX_Magic_Barrier_Proximity;
    default m_FX_BarrierOrange = GameplayTag::FX_Magic_Barrier_Warning;
    default m_FX_BarrierOrange_NPC = GameplayTag::FX_Magic_Barrier_Warning_NPC;
    default m_FX_BarrierRed = GameplayTag::FX_Magic_Barrier_Zap;
    default m_FX_BarrierRed_NPC = GameplayTag::FX_Magic_Barrier_Zap_NPC;
}

