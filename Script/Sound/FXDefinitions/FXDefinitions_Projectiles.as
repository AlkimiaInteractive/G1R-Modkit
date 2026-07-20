class UGothicFXDefinition_Arrow_Impact : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Arrow_Impact;

    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Arrow_Impact;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::VeryLoud;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Instant;
    
    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Physics/Impacts/SFX_PHYSICS_Impacts_Arrow.SFX_PHYSICS_Impacts_Arrow'";

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Default) = nullptr;
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Water) = "/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/WaterInteractions/Particles/P_WaterInteraction_ArrowAndBolt.P_WaterInteraction_ArrowAndBolt'";

    default FModEvent.bAttachToInstigator = false;

    UFUNCTION(BlueprintOverride)
    void PrepareFX(AActor Instigator, FHitResult HitResult)
    {
        if (HitResult.Actor.IsA(AGothicCharacter))
        {
            FModEvent.EventParameters.Add(n"GroundMaterial", int(EPhysicalSurface::Blood));
        }
        else
        {
            const auto HitMaterial = HitResult.GetPhysMaterial();
            if(HitMaterial != nullptr)
            {
                FModEvent.EventParameters.Add(n"GroundMaterial", int(HitMaterial.SurfaceType));
            }

        }

    }
}

//Not used. Maybe we can add one when overlapping an npc
class UGothicFXDefinition_MagicProjectile_StormOfFire_Impact : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Magic_Projectile_StormOfFire_Impact;
    
    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Magic_Impact;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::VeryLoud;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Instant;

    //default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Magic/Spells/FireRain/SFX_Magic_FireRain_Rain_01.SFX_Magic_FireRain_Rain_01'";
}

class UGothicFXDefinition_MagicProjectile_IceBolt_Impact : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Magic_Projectile_IceBolt_Impact;
    
    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Magic_Impact;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::VeryLoud;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Instant;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Magic/Spells/IceBolt/SFX_Magic_IceBolt_Impact_01.SFX_Magic_IceBolt_Impact_01'";
}

class UGothicFXDefinition_MagicProjectile_IceBolt_Moving : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Magic_Projectile_IceBolt_Moving;
    
    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Magic_Impact;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::VeryLoud;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Instant;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Magic/Spells/IceBolt/SFX_Magic_IceBolt_Projectile_Loop_01.SFX_Magic_IceBolt_Projectile_Loop_01'";
    default bIsInstantEffect = false;
}

class UGothicFXDefinition_MagicProjectile_Fireball_1_Impact : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Magic_Projectile_FireBall_Level1_Impact;
    
    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Magic_Impact;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::VeryLoud;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Instant;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Magic/Spells/FireBall/SFX_Magic_FireBall_ImpactS_01.SFX_Magic_FireBall_ImpactS_01'";
}

class UGothicFXDefinition_MagicProjectile_Fireball_1_Moving : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Magic_Projectile_FireBall_Level1_Moving;
    
    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Magic_Impact;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::VeryLoud;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Instant;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Magic/Spells/FireBall/SFX_Magic_FireBall_ProjectileS_01.SFX_Magic_FireBall_ProjectileS_01'";
    default bIsInstantEffect = false;
}

class UGothicFXDefinition_MagicProjectile_Fireball_2_Impact : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Magic_Projectile_FireBall_Level2_Impact;
    
    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Magic_Impact;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::VeryLoud;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Instant;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Magic/Spells/FireBall/SFX_Magic_FireBall_ImpactM_01.SFX_Magic_FireBall_ImpactM_01'";
}

class UGothicFXDefinition_MagicProjectile_Fireball_2_Moving : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Magic_Projectile_FireBall_Level2_Moving;
    
    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Magic_Impact;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::VeryLoud;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Instant;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Magic/Spells/FireBall/SFX_Magic_FireBall_ProjectileM_01.SFX_Magic_FireBall_ProjectileM_01'";
    default bIsInstantEffect = false;
}

class UGothicFXDefinition_MagicProjectile_Fireball_3_Impact : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Magic_Projectile_FireBall_Level3_Impact;
    
    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Magic_Impact;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::VeryLoud;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Instant;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Magic/Spells/FireBall/SFX_Magic_FireBall_ImpactL_01.SFX_Magic_FireBall_ImpactL_01'";
}

class UGothicFXDefinition_MagicProjectile_Fireball_3_Moving : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Magic_Projectile_FireBall_Level3_Moving;
    
    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Magic_Impact;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::VeryLoud;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Instant;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Magic/Spells/FireBall/SFX_Magic_FireBall_ProjectileL_01.SFX_Magic_FireBall_ProjectileL_01'";
    default bIsInstantEffect = false;
}

class UGothicFXDefinition_MagicProjectile_IceBlock_Block : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Magic_Projectile_IceBlock_Block;
    
    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Magic_Impact;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::VeryLoud;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Instant;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Magic/Spells/IceBlock/SFX_Magic_IceBlock_Block_01.SFX_Magic_IceBlock_Block_01'";
}

class UGothicFXDefinition_MagicProjectile_IceWave_Wave : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Magic_Projectile_IceWave_Wave;
    
    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Magic_Impact;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::VeryLoud;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Instant;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Magic/Spells/IceWave/SFX_Magic_IceWave_Wave_01.SFX_Magic_IceWave_Wave_01'";
}

class UGothicFXDefinition_MagicProjectile_StormOfFire_Storm_Start : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Magic_Projectile_StormOfFire_Storm_Start;
    
    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Magic_Impact;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::VeryLoud;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Instant;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Magic/Spells/FireStorm/SFX_Magic_FireStorm_Storm_01.SFX_Magic_FireStorm_Storm_01'";
    default bIsInstantEffect = false;
}

class UGothicFXDefinition_MagicProjectile_StormOfFire_Storm_End : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Magic_Projectile_StormOfFire_Storm_End;
    
    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Magic_Impact;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::VeryLoud;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Instant;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Magic/Spells/FireStorm/SFX_Magic_FireStorm_StormEnd_01.SFX_Magic_FireStorm_StormEnd_01'";
}

class UGothicFXDefinition_MagicProjectile_LighningBall_Impact : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Magic_Projectile_LightningBall_Impact;
    default FXSpecs.AddTag(GameplayTag::FX_Spec_Persistent_Sound);
    
    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Magic_Impact;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::VeryLoud;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Instant;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Magic/Spells/Lightning/SFX_Magic_Lightning_ImpactS_01.SFX_Magic_Lightning_ImpactS_01'";
    default FModEvent.bAttachToInstigator = false;

    UFUNCTION(BlueprintOverride)
    void PrepareFX(AActor Instigator, FHitResult HitResult)
    {
        ASpellBallVisual_AS Projectile = Cast<ASpellBallVisual_AS>(Instigator);
        
        if(!IsValid(Projectile))
        return;

        int SpellLevel = Projectile.GetSpellLevel();
        
        if(SpellLevel == 1)
        {
            FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Magic/Spells/Lightning/SFX_Magic_Lightning_ImpactS_01.SFX_Magic_Lightning_ImpactS_01'";
        }
        else if (SpellLevel == 2 || SpellLevel == 3)
        {
            FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Magic/Spells/Lightning/SFX_Magic_Lightning_ImpactM_01.SFX_Magic_Lightning_ImpactM_01'";
        }
        else if (SpellLevel == 4)
        {
            FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Magic/Spells/Lightning/SFX_Magic_Lightning_ImpactL_01.SFX_Magic_Lightning_ImpactL_01'";
        }
    }
}

class UGothicFXDefinition_MagicProjectile_LighningBall_Loop : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Magic_Projectile_LightningBall_Moving;
    
    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Magic_Impact;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::VeryLoud;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Instant;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Magic/Spells/Lightning/SFX_Magic_Lightning_Projectile_01.SFX_Magic_Lightning_Projectile_01'";
}