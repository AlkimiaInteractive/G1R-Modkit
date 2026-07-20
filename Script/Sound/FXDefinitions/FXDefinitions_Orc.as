class UJump_Orc : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Jump;
    default RequiredTags.AddTag(GameplayTag::Species_Orc);
    
    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Movement/Footsteps/Human/SFX_MOVE_Footsteps_Human_MASTER.SFX_MOVE_Footsteps_Human_MASTER'";
    default FModEvent.EventParameters.Add(n"MovementSpeed", 4.0f);

    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::Quiet;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Instant;
    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Jump;

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Default) = nullptr;
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Water) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/WaterInteraction/P_Water_Splash_Walking_V3_fast.P_Water_Splash_Walking_V3_fast'";
    UFUNCTION(BlueprintOverride)
    void PrepareFX(AActor Instigator, FHitResult HitResult)
    {
        const auto FloorMaterial = HitResult.GetPhysMaterial();
        
        if(FloorMaterial != nullptr)
        {
            FModEvent.EventParameters.Add(n"GroundMaterial", int(FloorMaterial.SurfaceType));
        }

        AGothicCharacter InstigatorCharacter = Cast<AGothicCharacter>(Instigator);

        if(InstigatorCharacter != nullptr && InstigatorCharacter.IsInRain())
        {
            FModEvent.EventParameters.Add(n"MudLevel", 1.0f);
        }

        UGothicAnimInstance AnimInstance = Cast<UGothicAnimInstance>(InstigatorCharacter.Mesh.AnimInstance);
        for (FName Socket : AnimInstance.GetFootStepSocketNames())
        {
            FVector Offset;
            Offset.Z = HitResult.ImpactPoint.Z - InstigatorCharacter.Mesh.GetSocketTransform(Socket).Location.Z;
            TargetSockets.FindOrAdd(Socket) = Offset;
        }
    }

}
class USwim_Orc : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Swim;
    default RequiredTags.AddTag(GameplayTag::Species_Orc);

    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::Moderate;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Continuous;
    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Noise;
    
    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Movement/Water/Human/SFX_MOVE_Water_Human_Crawl.SFX_MOVE_Water_Human_Crawl'";
    //default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Default) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/WaterInteraction/P_Water_Splash_Swimming_V1.P_Water_Splash_Swimming_V1'";
    
    UFUNCTION(BlueprintOverride)
    void PrepareFX(AActor Instigator, FHitResult HitResult)
    {
        TargetSockets.FindOrAdd(HitResult.BoneName);
    }
}
class UDive_Orc : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Dive;
    default RequiredTags.AddTag(GameplayTag::Species_Orc);
    default RequiredTags.AddTag(GameplayTag::State_Movement_Diving);

    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::Moderate;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Continuous;
    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Noise;
}

class ULandInWater_Orc: UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_LandInWater;

    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::Moderate;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Instant;
    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Noise;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Movement/Landing/Human/SFX_MOVE_Land_Human_Water.SFX_MOVE_Land_Human_Water'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Default) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/WaterInteraction/P_Water_Splash_Walking_V3_BOMB.P_Water_Splash_Walking_V3_BOMB'";
}

class ULand_Orc : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Land;
    default RequiredTags.AddTag(GameplayTag::Species_Orc);
    
    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Movement/Footsteps/Human/SFX_MOVE_Footsteps_Human_MASTER.SFX_MOVE_Footsteps_Human_MASTER'";
    default FModEvent.EventParameters.Add(n"MovementSpeed", 5.0f);

    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::Moderate;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Instant;
    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Land;

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Default) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/P_Routine_Footstep_mid.P_Routine_Footstep_mid'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Water) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/WaterInteraction/P_Water_Splash_Walking_V3_fast.P_Water_Splash_Walking_V3_fast'";

    UFUNCTION(BlueprintOverride)
    void PrepareFX(AActor Instigator, FHitResult HitResult)
    {
        const auto FloorMaterial = HitResult.GetPhysMaterial();
        
        if(FloorMaterial != nullptr)
        {
            FModEvent.EventParameters.Add(n"GroundMaterial", int(FloorMaterial.SurfaceType));
        }

        AGothicCharacter InstigatorCharacter = Cast<AGothicCharacter>(Instigator);

        if(InstigatorCharacter != nullptr && InstigatorCharacter.IsInRain())
        {
            FModEvent.EventParameters.Add(n"MudLevel", 1.0f);
        }

        UGothicAnimInstance AnimInstance = Cast<UGothicAnimInstance>(InstigatorCharacter.Mesh.AnimInstance);
        for (FName Socket : AnimInstance.GetFootStepSocketNames())
        {
            FVector Offset;
            Offset.Z = HitResult.ImpactPoint.Z - InstigatorCharacter.Mesh.GetSocketTransform(Socket).Location.Z;
            TargetSockets.FindOrAdd(Socket) = Offset;
        }
    }
}

class UDeath_Orc : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Death;
    default RequiredTags.AddTag(GameplayTag::Species_Orc);
    
    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Actions/SFX_ACTIONS_Death_NPC.SFX_ACTIONS_Death_NPC'";

    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Bark_Death;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Instant;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::Moderate;

}
class UDodge_Orc : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Dodge;
    default RequiredTags.AddTag(GameplayTag::Species_Orc);
    
    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Combat/Vocals/SFX_COMBAT_Vocals_Human_Dodge_NPC.SFX_COMBAT_Vocals_Human_Dodge_NPC'";

    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Dodge;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Instant;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::Moderate;

}