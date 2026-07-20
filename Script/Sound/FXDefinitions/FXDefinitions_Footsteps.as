UCLASS(Abstract)
class UFootStepFXDefinition : UGothicFXDefinition
{
    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Movement/Footsteps/Human/SFX_MOVE_Footsteps_Human_MASTER.SFX_MOVE_Footsteps_Human_MASTER'";
    
    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_FootStep;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Continuous;

    default Decal.Lifespan = 40.0f;
    default CooldownTime = 0.2f;
    
    float VelocityThreshold = 15.0f;
    bool bUseVolcityThreshold = true;
    
    UFUNCTION(BlueprintOverride)
    void PrepareFX(AActor Instigator, FHitResult HitResult)
    {
         const auto FloorMaterial = HitResult.GetPhysMaterial();
        
        if(FloorMaterial != nullptr)
        {
            FModEvent.EventParameters.Add(n"GroundMaterial", int(FloorMaterial.SurfaceType));
        }

        AGothicCharacter InstigatorCharacter = Cast<AGothicCharacter>(Instigator);

        if(InstigatorCharacter == nullptr)
            return;
        
        if(InstigatorCharacter.IsInRain())
        {
            UWeatherSubsystem Weather = UWeatherSubsystem::Get();
            if (Weather != nullptr)
            {
                float32 RainIntensity = Weather.GetRainIntensity();
                FModEvent.EventParameters.Add(n"MudLevel", Math::Min(RainIntensity / 10.0f, 1.0f));
            }
        }

        UGothicMovementComponent Movement = InstigatorCharacter.GetGothicMovementComponent();

        if(Movement != nullptr)
        {
            float32 WaterDepth = Movement.GetWaterDepth();
            float32 WalkToSwimHeight = Movement.GetWalkToSwimHeight();
            FModEvent.EventParameters.Add(n"WaterLevel", Math::Min(WaterDepth / WalkToSwimHeight, 1.0f));
        }

        UInventoryComponent Inventory = InstigatorCharacter.GetInventory();
        if(Inventory != nullptr)
        {
            auto ArmorType = Inventory.EquippedArmor;

            if (IsValid(ArmorType))
            {
                //Add different values for different types of Armor when added
                FModEvent.EventParameters.Add(n"Footwear", 1.0f);
            }
        }
 
        UGothicAnimInstance AnimInstance = Cast<UGothicAnimInstance>(InstigatorCharacter.Mesh.AnimInstance);
        if(IsValid(AnimInstance))
        {
            auto FootStepData = InstigatorCharacter.m_FootstepsDataComponent;
            FootStepData.NotifyStepOnMaterial(HitResult.PhysMaterial);
            Decal.DecalMaterial = FootStepData.CreateDynamicFootstepMaterialInstance(HitResult.GetPhysMaterial(), AnimInstance.GetFeetSocket());

            if(Decal.DecalMaterial != nullptr)
            {
                auto FootStepSize = FootStepData.GetFootStepTextureSize(AnimInstance.GetFeetSocket());

                if(FootStepSize == FVector(0.0f, 0.0f, 0.0f))
                    return;
                
                Decal.DecalSize = FVector(20.0f, FootStepSize.X, FootStepSize.Y);
            }

        }

        if (IsValid(InstigatorCharacter.AbilitySystemComponent))
        {
            if(InstigatorCharacter.HasGameplayTag(GameplayTag::State_Movement_Crouching))
            {
                PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::Whisper;
                FModEvent.EventParameters.FindOrAdd(n"MovementSpeed", 0.0f);
            }
            else if(InstigatorCharacter.HasGameplayTag(GameplayTag::State_Movement_Walking))
            {
                PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::Quiet;
                FModEvent.EventParameters.FindOrAdd(n"MovementSpeed", 1.0f);
            }
            else if(InstigatorCharacter.HasGameplayTag(GameplayTag::State_Movement_Running))
            {
                PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::Loud;
                FModEvent.EventParameters.FindOrAdd(n"MovementSpeed", 2.0f);
            }
            else if(InstigatorCharacter.HasGameplayTag(GameplayTag::State_Movement_Sprinting))
            {
                PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::VeryLoud;
                FModEvent.EventParameters.FindOrAdd(n"MovementSpeed", 3.0f);
            }
        }

        if (bUseVolcityThreshold && InstigatorCharacter.Velocity.Equals(FVector::ZeroVector, VelocityThreshold))
        {
            PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::Silent;
        }

    }
}

class UFootsteps_Crouch_Human : UFootStepFXDefinition
{
    default EffectTag = GameplayTag::FX_Impact_Footstep_Crouch;

    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_FootStep;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Continuous;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::Quiet;
}

class UFootsteps_Walk_Human : UFootStepFXDefinition
{
    default EffectTag = GameplayTag::FX_Impact_Footstep_Small;
    default RequiredTags.AddTag(GameplayTag::Species_Human);

    //default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::Quiet;
    //default FModEvent.EventParameters.Add(n"MovementSpeed", 1.0f);
    default PreferenceLayer = 1;

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Default) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/P_Routine_Footstep_slow.P_Routine_Footstep_slow'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::WoodFloor) = nullptr;
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::WoodBridge) = nullptr;
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Water) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/WaterInteraction/P_Water_Splash_Walking_V3_slow.P_Water_Splash_Walking_V3_slow'";

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Snow) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/Footstep/Snow/P_Walking_Snow_Slow.P_Walking_Snow_Slow'";

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Sand) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/Footstep/Sand/P_Walking_Sand_Slow.P_Walking_Sand_Slow'";

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Mud) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/Footstep/Soil/P_Walking_Soil_Slow.P_Walking_Soil_Slow'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Puddle) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/Footstep/Soil/P_Walking_Soil_Slow.P_Walking_Soil_Slow'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Swamp) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/Footstep/Soil/P_Walking_Soil_Slow.P_Walking_Soil_Slow'";

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Stone) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/Footstep/Rock/P_Walking_Rock_Slow.P_Walking_Rock_Slow'";

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Foliage) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/Footstep/Foliage/P_Walking_Foliage_Slow.P_Walking_Foliage_Slow'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Grass) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/Footstep/Foliage/P_Walking_Foliage_Slow.P_Walking_Foliage_Slow'";

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Blood) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/Footstep/Blood/P_Walking_Blood_Slow.P_Walking_Blood_Slow'";

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Corpse) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/Footstep/Corpse/P_Walking_Corpse_Slow.P_Walking_Corpse_Slow'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Metal) = nullptr;
}

class UFootsteps_Run_Human : UFootStepFXDefinition
{
    default EffectTag = GameplayTag::FX_Impact_Footstep_Medium;
    default RequiredTags.AddTag(GameplayTag::Species_Human);

    //default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::Moderate;
    //default FModEvent.EventParameters.Add(n"MovementSpeed", 2.0f);
    default PreferenceLayer = 1;

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Default) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/P_Routine_Footstep_mid.P_Routine_Footstep_mid'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::WoodFloor) = nullptr;
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::WoodBridge) = nullptr;
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Water) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/WaterInteraction/P_Water_Splash_Walking_V3_mid.P_Water_Splash_Walking_V3_mid'";

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Snow) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/Footstep/Snow/P_Walking_Snow_Mid.P_Walking_Snow_Mid'";
    
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Sand) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/Footstep/Sand/P_Walking_Sand_Mid.P_Walking_Sand_Mid'";

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Mud) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/Footstep/Soil/P_Walking_Soil_Mid.P_Walking_Soil_Mid'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Puddle) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/Footstep/Soil/P_Walking_Soil_Mid.P_Walking_Soil_Mid'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Swamp) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/Footstep/Soil/P_Walking_Soil_Mid.P_Walking_Soil_Mid'";

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Stone) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/Footstep/Rock/P_Walking_Rock_Mid.P_Walking_Rock_Mid'";

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Foliage) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/Footstep/Foliage/P_Walking_Foliage_Mid.P_Walking_Foliage_Mid'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Grass) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/Footstep/Foliage/P_Walking_Foliage_Mid.P_Walking_Foliage_Mid'";

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Blood) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/Footstep/Blood/P_Walking_Blood_Mid.P_Walking_Blood_Mid'";

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Corpse) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/Footstep/Corpse/P_Walking_Corpse_Mid.P_Walking_Corpse_Mid'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Metal) = nullptr;
}

class UFootsteps_Sprint_Human : UFootStepFXDefinition
{
    default EffectTag = GameplayTag::FX_Impact_Footstep_Big;
    default RequiredTags.AddTag(GameplayTag::Species_Human);

    //default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::Loud;
    //default FModEvent.EventParameters.Add(n"MovementSpeed", 3.0f);
    default PreferenceLayer = 1;

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Default) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/P_Routine_Footstep_fast.P_Routine_Footstep_fast'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::WoodFloor) = nullptr;
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::WoodBridge) = nullptr;
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Water) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/WaterInteraction/P_Water_Splash_Walking_V3_fast.P_Water_Splash_Walking_V3_fast'";

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Snow) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/Footstep/Snow/P_Walking_Snow_Fast.P_Walking_Snow_Fast'";

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Sand) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/Footstep/Sand/P_Walking_Sand_Fast.P_Walking_Sand_Fast'";

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Mud) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/Footstep/Soil/P_Walking_Soil_Fast.P_Walking_Soil_Fast'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Puddle) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/Footstep/Soil/P_Walking_Soil_Fast.P_Walking_Soil_Fast'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Swamp) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/Footstep/Soil/P_Walking_Soil_Fast.P_Walking_Soil_Fast'";

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Stone) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/Footstep/Rock/P_Walking_Rock_Fast.P_Walking_Rock_Fast'";

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Foliage) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/Footstep/Foliage/P_Walking_Foliage_Fast.P_Walking_Foliage_Fast'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Grass) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/Footstep/Foliage/P_Walking_Foliage_Fast.P_Walking_Foliage_Fast'";

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Blood) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/Footstep/Blood/P_Walking_Blood_Fast.P_Walking_Blood_Fast'";

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Corpse) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/Footstep/Corpse/P_Walking_Corpse_Fast.P_Walking_Corpse_Fast'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Metal) = nullptr;
}

class UFootsteps_Walk_Orc : UFootStepFXDefinition
{
    default EffectTag = GameplayTag::FX_Impact_Footstep_Small;
    default RequiredTags.AddTag(GameplayTag::Species_Orc);
    default PreferenceLayer = 1;

    //default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::Quiet;
    //default FModEvent.EventParameters.Add(n"MovementSpeed", 1.0f);

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Default) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/P_Routine_Footstep_slow.P_Routine_Footstep_slow'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::WoodFloor) = nullptr;
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::WoodBridge) = nullptr;
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Water) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/WaterInteraction/P_Water_Splash_Walking_V3_slow.P_Water_Splash_Walking_V3_slow'";

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Snow) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/Footstep/Snow/P_Walking_Snow_Slow.P_Walking_Snow_Slow'";

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Sand) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/Footstep/Sand/P_Walking_Sand_Slow.P_Walking_Sand_Slow'";

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Mud) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/Footstep/Soil/P_Walking_Soil_Slow.P_Walking_Soil_Slow'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Puddle) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/Footstep/Soil/P_Walking_Soil_Slow.P_Walking_Soil_Slow'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Swamp) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/Footstep/Soil/P_Walking_Soil_Slow.P_Walking_Soil_Slow'";

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Stone) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/Footstep/Rock/P_Walking_Rock_Slow.P_Walking_Rock_Slow'";

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Foliage) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/Footstep/Foliage/P_Walking_Foliage_Slow.P_Walking_Foliage_Slow'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Grass) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/Footstep/Foliage/P_Walking_Foliage_Slow.P_Walking_Foliage_Slow'";

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Blood) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/Footstep/Blood/P_Walking_Blood_Slow.P_Walking_Blood_Slow'";

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Corpse) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/Footstep/Corpse/P_Walking_Corpse_Slow.P_Walking_Corpse_Slow'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Metal) = nullptr;
}

class UFootsteps_Run_Orc : UFootStepFXDefinition
{
    default EffectTag = GameplayTag::FX_Impact_Footstep_Medium;
    default RequiredTags.AddTag(GameplayTag::Species_Orc);
    default PreferenceLayer = 1;

    //default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::Moderate;
    //default FModEvent.EventParameters.Add(n"MovementSpeed", 2.0f);

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Default) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/P_Routine_Footstep_mid.P_Routine_Footstep_mid'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::WoodFloor) = nullptr;
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::WoodBridge) = nullptr;
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Water) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/WaterInteraction/P_Water_Splash_Walking_V3_mid.P_Water_Splash_Walking_V3_mid'";

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Snow) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/Footstep/Snow/P_Walking_Snow_Mid.P_Walking_Snow_Mid'";
    
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Sand) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/Footstep/Sand/P_Walking_Sand_Mid.P_Walking_Sand_Mid'";

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Mud) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/Footstep/Soil/P_Walking_Soil_Mid.P_Walking_Soil_Mid'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Puddle) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/Footstep/Soil/P_Walking_Soil_Mid.P_Walking_Soil_Mid'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Swamp) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/Footstep/Soil/P_Walking_Soil_Mid.P_Walking_Soil_Mid'";

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Stone) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/Footstep/Rock/P_Walking_Rock_Mid.P_Walking_Rock_Mid'";

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Foliage) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/Footstep/Foliage/P_Walking_Foliage_Mid.P_Walking_Foliage_Mid'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Grass) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/Footstep/Foliage/P_Walking_Foliage_Mid.P_Walking_Foliage_Mid'";

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Blood) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/Footstep/Blood/P_Walking_Blood_Mid.P_Walking_Blood_Mid'";

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Corpse) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/Footstep/Corpse/P_Walking_Corpse_Mid.P_Walking_Corpse_Mid'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Metal) = nullptr;
}

class UFootsteps_Sprint_Orc : UFootStepFXDefinition
{
    default EffectTag = GameplayTag::FX_Impact_Footstep_Big;
    default RequiredTags.AddTag(GameplayTag::Species_Orc);
    default PreferenceLayer = 1;

    //default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::Loud;
    //default FModEvent.EventParameters.Add(n"MovementSpeed", 3.0f);

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Default) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/P_Routine_Footstep_fast.P_Routine_Footstep_fast'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::WoodFloor) = nullptr;
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::WoodBridge) = nullptr;
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Water) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/WaterInteraction/P_Water_Splash_Walking_V3_fast.P_Water_Splash_Walking_V3_fast'";

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Snow) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/Footstep/Snow/P_Walking_Snow_Fast.P_Walking_Snow_Fast'";

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Sand) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/Footstep/Sand/P_Walking_Sand_Fast.P_Walking_Sand_Fast'";

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Mud) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/Footstep/Soil/P_Walking_Soil_Fast.P_Walking_Soil_Fast'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Puddle) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/Footstep/Soil/P_Walking_Soil_Fast.P_Walking_Soil_Fast'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Swamp) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/Footstep/Soil/P_Walking_Soil_Fast.P_Walking_Soil_Fast'";

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Stone) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/Footstep/Rock/P_Walking_Rock_Fast.P_Walking_Rock_Fast'";

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Foliage) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/Footstep/Foliage/P_Walking_Foliage_Fast.P_Walking_Foliage_Fast'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Grass) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/Footstep/Foliage/P_Walking_Foliage_Fast.P_Walking_Foliage_Fast'";

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Blood) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/Footstep/Blood/P_Walking_Blood_Fast.P_Walking_Blood_Fast'";

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Corpse) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/Footstep/Corpse/P_Walking_Corpse_Fast.P_Walking_Corpse_Fast'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Metal) = nullptr;
}


class UFootsteps_Creature_Small : UFootStepFXDefinition
{
    default EffectTag = GameplayTag::FX_Impact_Footstep_Small;
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Default) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Burst_Small_Default.P_GenericImpact_Burst_Small_Default'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Leather) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Burst_Small_Default.P_GenericImpact_Burst_Small_Default'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Soil) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Burst_Small_Default.P_GenericImpact_Burst_Small_Default'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Corpse) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Burst_Small_Default.P_GenericImpact_Burst_Small_Default'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Metal) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Burst_Small_Default.P_GenericImpact_Burst_Small_Default'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::RockInterior) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Burst_Small_Default.P_GenericImpact_Burst_Small_Default'";
    
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Stone) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Burst_Small_Rock.P_GenericImpact_Burst_Small_Rock'";

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Mud) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Burst_Small_Mud.P_GenericImpact_Burst_Small_Mud'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Puddle) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Burst_Small_Mud.P_GenericImpact_Burst_Small_Mud'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Swamp) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Burst_Small_Mud.P_GenericImpact_Burst_Small_Mud'";

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::WoodBridge) = nullptr;
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::WoodFloor) = nullptr;

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Ice) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Burst_Small_Ice.P_GenericImpact_Burst_Small_Ice'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Sand) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Burst_Small_Sand.P_GenericImpact_Burst_Small_Sand'";

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Grass) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Burst_Small_Grass.P_GenericImpact_Burst_Small_Grass'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Foliage) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Burst_Small_Grass.P_GenericImpact_Burst_Small_Grass'";

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Water) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Burst_Small_Water.P_GenericImpact_Burst_Small_Water'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Blood) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Burst_Small_Blood.P_GenericImpact_Burst_Small_Blood'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Snow) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Burst_Small_Snow.P_GenericImpact_Burst_Small_Snow'";

    UFUNCTION(BlueprintOverride)
    void PrepareFX(AActor Instigator, FHitResult HitResult)
    {
        Super::PrepareFX(Instigator, HitResult);

        AGothicCharacter InstigatorCharacter = Cast<AGothicCharacter>(Instigator);

        if(InstigatorCharacter == nullptr)
            return;

        if (IsValid(InstigatorCharacter.AbilitySystemComponent))
        {
            if(InstigatorCharacter.HasGameplayTag(GameplayTag::State_Swimming))
            {
                FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Movement/Water/Creature/SFX_MOVE_Water_CreatureS_Swim.SFX_MOVE_Water_CreatureS_Swim'";
            }
        }
    }
}

class UFootsteps_Creature_Medium_ScaledDown : UFootsteps_Creature_Small
{
    default EffectTag = GameplayTag::FX_Impact_Footstep_Medium;
    default RequiredTags.AddTag(GameplayTag::State_ScaledDown);
    default PreferenceLayer = 1;
}

class UFootsteps_Creature_Medium_Shrinked : UFootsteps_Creature_Small
{
    default EffectTag = GameplayTag::FX_Impact_Footstep_Medium;
    default RequiredTags.AddTag(GameplayTag::Debuff_Visual_Shrink);
    default PreferenceLayer = 1;
}

class UFootsteps_Creature_Medium : UFootStepFXDefinition
{
    default EffectTag = GameplayTag::FX_Impact_Footstep_Medium;
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Default) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Burst_Mid_Default.P_GenericImpact_Burst_Mid_Default'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Leather) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Burst_Mid_Default.P_GenericImpact_Burst_Mid_Default'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Soil) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Burst_Mid_Default.P_GenericImpact_Burst_Mid_Default'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Corpse) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Burst_Mid_Default.P_GenericImpact_Burst_Mid_Default'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Metal) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Burst_Mid_Default.P_GenericImpact_Burst_Mid_Default'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::RockInterior) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Burst_Mid_Default.P_GenericImpact_Burst_Mid_Default'";
    
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Stone) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Burst_Mid_Rock.P_GenericImpact_Burst_Mid_Rock'";

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Mud) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Burst_Mid_Mud.P_GenericImpact_Burst_Mid_Mud'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Puddle) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Burst_Mid_Mud.P_GenericImpact_Burst_Mid_Mud'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Swamp) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Burst_Mid_Mud.P_GenericImpact_Burst_Mid_Mud'";

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::WoodBridge) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Burst_Mid_Wood.P_GenericImpact_Burst_Mid_Wood'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::WoodFloor) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Burst_Mid_Wood.P_GenericImpact_Burst_Mid_Wood'";

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Ice) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Burst_Mid_Ice.P_GenericImpact_Burst_Mid_Ice'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Sand) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Burst_Mid_Sand.P_GenericImpact_Burst_Mid_Sand'";

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Grass) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Burst_Mid_Grass.P_GenericImpact_Burst_Mid_Grass'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Foliage) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Burst_Mid_Grass.P_GenericImpact_Burst_Mid_Grass'";

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Water) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Burst_Mid_Water.P_GenericImpact_Burst_Mid_Water'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Blood) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Burst_Mid_Blood.P_GenericImpact_Burst_Mid_Blood'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Snow) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Burst_Mid_Snow.P_GenericImpact_Burst_Mid_Snow'";

    UFUNCTION(BlueprintOverride)
    void PrepareFX(AActor Instigator, FHitResult HitResult)
    {
        Super::PrepareFX(Instigator, HitResult);

        AGothicCharacter InstigatorCharacter = Cast<AGothicCharacter>(Instigator);

        if(InstigatorCharacter == nullptr)
            return;

        if (IsValid(InstigatorCharacter.AbilitySystemComponent))
        {
            if(InstigatorCharacter.HasGameplayTag(GameplayTag::State_Swimming))
            {
                FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Movement/Water/Creature/SFX_MOVE_Water_CreatureM_Swim.SFX_MOVE_Water_CreatureM_Swim'";
            }
        }
    }
}

class UFootsteps_Creature_Large_ScaledDown : UFootsteps_Creature_Medium
{
    default EffectTag = GameplayTag::FX_Impact_Footstep_Big;
    default RequiredTags.AddTag(GameplayTag::State_ScaledDown);
    default PreferenceLayer = 1;
}

class UFootsteps_Creature_Large_Shrinked : UFootsteps_Creature_Medium
{
    default EffectTag = GameplayTag::FX_Impact_Footstep_Big;
    default RequiredTags.AddTag(GameplayTag::Debuff_Visual_Shrink);
    default PreferenceLayer = 1;
}

class UFootsteps_Creature_Large : UFootStepFXDefinition
{
    default EffectTag = GameplayTag::FX_Impact_Footstep_Big;
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Default) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Burst_Big_Default.P_GenericImpact_Burst_Big_Default'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Leather) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Burst_Big_Default.P_GenericImpact_Burst_Big_Default'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Soil) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Burst_Big_Default.P_GenericImpact_Burst_Big_Default'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Corpse) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Burst_Big_Default.P_GenericImpact_Burst_Big_Default'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Metal) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Burst_Big_Default.P_GenericImpact_Burst_Big_Default'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::RockInterior) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Burst_Big_Default.P_GenericImpact_Burst_Big_Default'";
    
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Stone) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Burst_Big_Rock.P_GenericImpact_Burst_Big_Rock'";

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Mud) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Burst_Big_Mud.P_GenericImpact_Burst_Big_Mud'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Puddle) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Burst_Big_Mud.P_GenericImpact_Burst_Big_Mud'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Swamp) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Burst_Big_Mud.P_GenericImpact_Burst_Big_Mud'";

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::WoodBridge) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Burst_Big_Wood.P_GenericImpact_Burst_Big_Wood'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::WoodFloor) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Burst_Big_Wood.P_GenericImpact_Burst_Big_Wood'";

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Ice) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Burst_Big_Ice.P_GenericImpact_Burst_Big_Ice'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Sand) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Burst_Big_Sand.P_GenericImpact_Burst_Big_Sand'";

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Grass) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Burst_Big_Grass.P_GenericImpact_Burst_Big_Grass'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Foliage) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Burst_Big_Grass.P_GenericImpact_Burst_Big_Grass'";

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Water) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Burst_Big_Water.P_GenericImpact_Burst_Big_Water'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Blood) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Burst_Big_Blood.P_GenericImpact_Burst_Big_Blood'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Snow) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Burst_Big_Snow.P_GenericImpact_Burst_Big_Snow'";

    UFUNCTION(BlueprintOverride)
    void PrepareFX(AActor Instigator, FHitResult HitResult)
    {
        Super::PrepareFX(Instigator, HitResult);

        AGothicCharacter InstigatorCharacter = Cast<AGothicCharacter>(Instigator);

        if(InstigatorCharacter == nullptr)
            return;

        if (IsValid(InstigatorCharacter.AbilitySystemComponent))
        {
            if(InstigatorCharacter.HasGameplayTag(GameplayTag::State_Swimming))
            {
                FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Movement/Water/Creature/SFX_MOVE_Water_CreatureL_Swim.SFX_MOVE_Water_CreatureL_Swim'";
            }
        }
    }
}

