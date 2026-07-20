class UGothicFXDefinition_Impact_Small : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Attack_Hit_Impact_Small;
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

}

class UGothicFXDefinition_Impact_Medium_ScaledDown : UGothicFXDefinition_Impact_Small
{
    default EffectTag = GameplayTag::FX_Attack_Hit_Impact_Medium;
    default RequiredTags.AddTag(GameplayTag::State_ScaledDown);
    default PreferenceLayer = 1;
}

class UGothicFXDefinition_Impact_Medium_Shrinked : UGothicFXDefinition_Impact_Small
{
    default EffectTag = GameplayTag::FX_Attack_Hit_Impact_Medium;
    default RequiredTags.AddTag(GameplayTag::Debuff_Visual_Shrink);
    default PreferenceLayer = 1;
}

class UGothicFXDefinition_Impact_Medium : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Attack_Hit_Impact_Medium;
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
}

class UGothicFXDefinition_Impact_Big_Shrinked : UGothicFXDefinition_Impact_Medium
{
    default EffectTag = GameplayTag::FX_Attack_Hit_Impact_Big;
    default RequiredTags.AddTag(GameplayTag::Debuff_Visual_Shrink);
    default PreferenceLayer = 1;
}

class UGothicFXDefinition_Impact_Big_ScaledDown : UGothicFXDefinition_Impact_Medium
{
    default EffectTag = GameplayTag::FX_Attack_Hit_Impact_Big;
    default RequiredTags.AddTag(GameplayTag::State_ScaledDown);
    default PreferenceLayer = 1;
}

class UGothicFXDefinition_Impact_Big : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Attack_Hit_Impact_Big;
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
}

class UGothicFXDefinition_Impact_Small_Loop : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Attack_Loop_Small;
    default ParticleSystem.bIsLooping = true;
    default bIsInstantEffect = false;

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Default) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Small_Default.P_GenericImpact_Loop_Small_Default'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Leather) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Small_Default.P_GenericImpact_Loop_Small_Default'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Soil) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Small_Default.P_GenericImpact_Loop_Small_Default'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Corpse) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Small_Default.P_GenericImpact_Loop_Small_Default'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Metal) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Small_Default.P_GenericImpact_Loop_Small_Default'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::RockInterior) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Small_Default.P_GenericImpact_Loop_Small_Default'";
    
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Stone) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Small_Rock.P_GenericImpact_Loop_Small_Rock'";

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Mud) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Small_Mud.P_GenericImpact_Loop_Small_Mud'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Puddle) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Small_Mud.P_GenericImpact_Loop_Small_Mud'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Swamp) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Small_Mud.P_GenericImpact_Loop_Small_Mud'";

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::WoodBridge) = nullptr;
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::WoodFloor) = nullptr;

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Ice) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Small_Ice.P_GenericImpact_Loop_Small_Ice'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Sand) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Small_Sand.P_GenericImpact_Loop_Small_Sand'";

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Grass) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Small_Grass.P_GenericImpact_Loop_Small_Grass'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Foliage) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Small_Grass.P_GenericImpact_Loop_Small_Grass'";

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Water) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Small_Water.P_GenericImpact_Loop_Small_Water'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Blood) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Small_Blood.P_GenericImpact_Loop_Small_Blood'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Snow) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Small_Snow.P_GenericImpact_Loop_Small_Snow'";

}

class UGothicFXDefinition_Impact_Medium_Loop_ScaledDown : UGothicFXDefinition_Impact_Small_Loop
{
    default EffectTag = GameplayTag::FX_Attack_Loop_Medium;
    default RequiredTags.AddTag(GameplayTag::State_ScaledDown);
    default PreferenceLayer = 1;
}

class UGothicFXDefinition_Impact_Medium_Loop_Shrinked : UGothicFXDefinition_Impact_Small_Loop
{
    default EffectTag = GameplayTag::FX_Attack_Loop_Medium;
    default RequiredTags.AddTag(GameplayTag::Debuff_Visual_Shrink);
    default PreferenceLayer = 1;
}

class UGothicFXDefinition_Impact_Medium_Loop : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Attack_Loop_Medium;
    default ParticleSystem.bIsLooping = true;
    default bIsInstantEffect = false;

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Default) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Mid_Default.P_GenericImpact_Loop_Mid_Default'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Leather) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Mid_Default.P_GenericImpact_Loop_Mid_Default'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Soil) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Mid_Default.P_GenericImpact_Loop_Mid_Default'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Corpse) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Mid_Default.P_GenericImpact_Loop_Mid_Default'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Metal) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Mid_Default.P_GenericImpact_Loop_Mid_Default'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::RockInterior) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Mid_Default.P_GenericImpact_Loop_Mid_Default'";
    
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Stone) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Mid_Rock.P_GenericImpact_Loop_Mid_Rock'";

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Mud) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Mid_Mud.P_GenericImpact_Loop_Mid_Mud'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Puddle) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Mid_Mud.P_GenericImpact_Loop_Mid_Mud'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Swamp) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Mid_Mud.P_GenericImpact_Loop_Mid_Mud'";

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::WoodBridge) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Mid_Wood.P_GenericImpact_Loop_Mid_Wood'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::WoodFloor) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Mid_Wood.P_GenericImpact_Loop_Mid_Wood'";

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Ice) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Mid_Ice.P_GenericImpact_Loop_Mid_Ice'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Sand) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Mid_Sand.P_GenericImpact_Loop_Mid_Sand'";

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Grass) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Mid_Grass.P_GenericImpact_Loop_Mid_Grass'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Foliage) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Mid_Grass.P_GenericImpact_Loop_Mid_Grass'";

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Water) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Mid_Water.P_GenericImpact_Loop_Mid_Water'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Blood) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Mid_Blood.P_GenericImpact_Loop_Mid_Blood'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Snow) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Mid_Snow.P_GenericImpact_Loop_Mid_Snow'";
}

class UGothicFXDefinition_Impact_Big_Loop_ScaledDown : UGothicFXDefinition_Impact_Medium_Loop
{
    default EffectTag = GameplayTag::FX_Attack_Loop_Big;
    default RequiredTags.AddTag(GameplayTag::State_ScaledDown);
    default PreferenceLayer = 1;
}

class UGothicFXDefinition_Impact_Big_Loop_Shrinked : UGothicFXDefinition_Impact_Medium_Loop
{
    default EffectTag = GameplayTag::FX_Attack_Loop_Big;
    default RequiredTags.AddTag(GameplayTag::Debuff_Visual_Shrink);
    default PreferenceLayer = 1;
}

class UGothicFXDefinition_Impact_Big_Loop : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Attack_Loop_Big;
    default ParticleSystem.bIsLooping = true;
    default bIsInstantEffect = false;

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Default) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Big_Default.P_GenericImpact_Loop_Big_Default'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Leather) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Big_Default.P_GenericImpact_Loop_Big_Default'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Soil) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Big_Default.P_GenericImpact_Loop_Big_Default'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Corpse) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Big_Default.P_GenericImpact_Loop_Big_Default'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Metal) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Big_Default.P_GenericImpact_Loop_Big_Default'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::RockInterior) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Big_Default.P_GenericImpact_Loop_Big_Default'";
    
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Stone) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Big_Rock.P_GenericImpact_Loop_Big_Rock'";

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Mud) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Big_Mud.P_GenericImpact_Loop_Big_Mud'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Puddle) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Big_Mud.P_GenericImpact_Loop_Big_Mud'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Swamp) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Big_Mud.P_GenericImpact_Loop_Big_Mud'";

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::WoodBridge) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Big_Wood.P_GenericImpact_Loop_Big_Wood'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::WoodFloor) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Big_Wood.P_GenericImpact_Loop_Big_Wood'";

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Ice) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Big_Ice.P_GenericImpact_Loop_Big_Ice'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Sand) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Big_Sand.P_GenericImpact_Loop_Big_Sand'";

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Grass) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Big_Grass.P_GenericImpact_Loop_Big_Grass'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Foliage) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Big_Grass.P_GenericImpact_Loop_Big_Grass'";

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Water) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Big_Water.P_GenericImpact_Loop_Big_Water'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Blood) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Big_Blood.P_GenericImpact_Loop_Big_Blood'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Snow) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Big_Snow.P_GenericImpact_Loop_Big_Snow'";
}

class UGothicFXDefinition_Impact_Fall_Small : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Impact_Fall_Small;
    
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
}

class UGothicFXDefinition_Impact_Fall_Medium_ScaledDown : UGothicFXDefinition_Impact_Fall_Small
{
    default EffectTag = GameplayTag::FX_Impact_Fall_Medium;
    default RequiredTags.AddTag(GameplayTag::State_ScaledDown);
    default PreferenceLayer = 1;
}

class UGothicFXDefinition_Impact_Fall_Medium_Shrinked : UGothicFXDefinition_Impact_Fall_Small
{
    default EffectTag = GameplayTag::FX_Impact_Fall_Medium;
    default RequiredTags.AddTag(GameplayTag::Debuff_Visual_Shrink);
    default PreferenceLayer = 1;
}

class UGothicFXDefinition_Impact_Fall_Medium : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Impact_Fall_Medium;
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
}

class UGothicFXDefinition_Impact_Fall_Big_ScaledDown : UGothicFXDefinition_Impact_Fall_Medium
{
    default EffectTag = GameplayTag::FX_Impact_Fall_Big;
    default RequiredTags.AddTag(GameplayTag::State_ScaledDown);
    default PreferenceLayer = 1;
}

class UGothicFXDefinition_Impact_Fall_Big_Shrinked : UGothicFXDefinition_Impact_Fall_Medium
{
    default EffectTag = GameplayTag::FX_Impact_Fall_Big;
    default RequiredTags.AddTag(GameplayTag::Debuff_Visual_Shrink);
    default PreferenceLayer = 1;
}


class UGothicFXDefinition_Impact_Fall_Big : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Impact_Fall_Big;
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
}

class UGothicFXDefinition_Impact_Fall_Small_Loop : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Impact_Fall_Small_Loop;
    default ParticleSystem.bIsLooping = true;
    default bIsInstantEffect = false;

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Default) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Small_Default.P_GenericImpact_Loop_Small_Default'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Leather) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Small_Default.P_GenericImpact_Loop_Small_Default'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Soil) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Small_Default.P_GenericImpact_Loop_Small_Default'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Corpse) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Small_Default.P_GenericImpact_Loop_Small_Default'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Metal) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Small_Default.P_GenericImpact_Loop_Small_Default'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::RockInterior) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Small_Default.P_GenericImpact_Loop_Small_Default'";
    
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Stone) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Small_Rock.P_GenericImpact_Loop_Small_Rock'";

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Mud) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Small_Mud.P_GenericImpact_Loop_Small_Mud'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Puddle) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Small_Mud.P_GenericImpact_Loop_Small_Mud'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Swamp) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Small_Mud.P_GenericImpact_Loop_Small_Mud'";

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::WoodBridge) = nullptr;
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::WoodFloor) = nullptr;

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Ice) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Small_Ice.P_GenericImpact_Loop_Small_Ice'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Sand) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Small_Sand.P_GenericImpact_Loop_Small_Sand'";

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Grass) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Small_Grass.P_GenericImpact_Loop_Small_Grass'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Foliage) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Small_Grass.P_GenericImpact_Loop_Small_Grass'";

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Water) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Small_Water.P_GenericImpact_Loop_Small_Water'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Blood) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Small_Blood.P_GenericImpact_Loop_Small_Blood'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Snow) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Small_Snow.P_GenericImpact_Loop_Small_Snow'";

}

class UGothicFXDefinition_Impact_Fall_Medium_Loop_ScaledDown : UGothicFXDefinition_Impact_Fall_Small_Loop
{
    default EffectTag = GameplayTag::FX_Impact_Fall_Medium_Loop;
    default RequiredTags.AddTag(GameplayTag::State_ScaledDown);
    default PreferenceLayer = 1;
}

class UGothicFXDefinition_Impact_Fall_Medium_Loop_Shrinked : UGothicFXDefinition_Impact_Fall_Small_Loop
{
    default EffectTag = GameplayTag::FX_Impact_Fall_Medium_Loop;
    default RequiredTags.AddTag(GameplayTag::Debuff_Visual_Shrink);
    default PreferenceLayer = 1;
}

class UGothicFXDefinition_Impact_Fall_Medium_Loop : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Impact_Fall_Medium_Loop;
    default ParticleSystem.bIsLooping = true;
    default bIsInstantEffect = false;

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Default) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Mid_Default.P_GenericImpact_Loop_Mid_Default'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Leather) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Mid_Default.P_GenericImpact_Loop_Mid_Default'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Soil) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Mid_Default.P_GenericImpact_Loop_Mid_Default'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Corpse) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Mid_Default.P_GenericImpact_Loop_Mid_Default'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Metal) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Mid_Default.P_GenericImpact_Loop_Mid_Default'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::RockInterior) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Mid_Default.P_GenericImpact_Loop_Mid_Default'";
    
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Stone) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Mid_Rock.P_GenericImpact_Loop_Mid_Rock'";

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Mud) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Mid_Mud.P_GenericImpact_Loop_Mid_Mud'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Puddle) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Mid_Mud.P_GenericImpact_Loop_Mid_Mud'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Swamp) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Mid_Mud.P_GenericImpact_Loop_Mid_Mud'";

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::WoodBridge) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Mid_Wood.P_GenericImpact_Loop_Mid_Wood'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::WoodFloor) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Mid_Wood.P_GenericImpact_Loop_Mid_Wood'";

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Ice) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Mid_Ice.P_GenericImpact_Loop_Mid_Ice'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Sand) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Mid_Sand.P_GenericImpact_Loop_Mid_Sand'";

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Grass) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Mid_Grass.P_GenericImpact_Loop_Mid_Grass'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Foliage) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Mid_Grass.P_GenericImpact_Loop_Mid_Grass'";

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Water) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Mid_Water.P_GenericImpact_Loop_Mid_Water'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Blood) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Mid_Blood.P_GenericImpact_Loop_Mid_Blood'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Snow) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Mid_Snow.P_GenericImpact_Loop_Mid_Snow'";
}

class UGothicFXDefinition_Impact_Fall_Big_Loop_ScaledDown : UGothicFXDefinition_Impact_Fall_Medium_Loop
{
    default EffectTag = GameplayTag::FX_Impact_Fall_Big_Loop;
    default RequiredTags.AddTag(GameplayTag::State_ScaledDown);
    default PreferenceLayer = 1;
}

class UGothicFXDefinition_Impact_Fall_Big_Loop_Shrinked : UGothicFXDefinition_Impact_Fall_Medium_Loop
{
    default EffectTag = GameplayTag::FX_Impact_Fall_Big_Loop;
    default RequiredTags.AddTag(GameplayTag::Debuff_Visual_Shrink);
    default PreferenceLayer = 1;
}

class UGothicFXDefinition_Impact_Fall_Big_Loop : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Impact_Fall_Big_Loop;
    default ParticleSystem.bIsLooping = true;
    default bIsInstantEffect = false;

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Default) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Big_Default.P_GenericImpact_Loop_Big_Default'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Leather) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Big_Default.P_GenericImpact_Loop_Big_Default'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Soil) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Big_Default.P_GenericImpact_Loop_Big_Default'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Corpse) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Big_Default.P_GenericImpact_Loop_Big_Default'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Metal) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Big_Default.P_GenericImpact_Loop_Big_Default'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::RockInterior) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Big_Default.P_GenericImpact_Loop_Big_Default'";
    
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Stone) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Big_Rock.P_GenericImpact_Loop_Big_Rock'";

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Mud) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Big_Mud.P_GenericImpact_Loop_Big_Mud'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Puddle) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Big_Mud.P_GenericImpact_Loop_Big_Mud'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Swamp) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Big_Mud.P_GenericImpact_Loop_Big_Mud'";

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::WoodBridge) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Big_Wood.P_GenericImpact_Loop_Big_Wood'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::WoodFloor) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Big_Wood.P_GenericImpact_Loop_Big_Wood'";

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Ice) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Big_Ice.P_GenericImpact_Loop_Big_Ice'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Sand) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Big_Sand.P_GenericImpact_Loop_Big_Sand'";

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Grass) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Big_Grass.P_GenericImpact_Loop_Big_Grass'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Foliage) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Big_Grass.P_GenericImpact_Loop_Big_Grass'";

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Water) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Big_Water.P_GenericImpact_Loop_Big_Water'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Blood) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Big_Blood.P_GenericImpact_Loop_Big_Blood'";
    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Snow) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Creatures_montages/00_Generic/MaterialVFX/P_GenericImpact_Loop_Big_Snow.P_GenericImpact_Loop_Big_Snow'";
}

class UGothicFXDefinition_Impact_Fall_Item : UGothicFXDefinition_Impact_Fall_Small
{
    default EffectTag = GameplayTag::FX_Impact_Item;
    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Physics/Impacts/Melee/SFX_PHYSICS_Impacts_Melee.SFX_PHYSICS_Impacts_Melee'";
    default CooldownTime = 0.2f;

    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::VeryLoud;
    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Item_Impact;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Continuous;

    UFUNCTION(BlueprintOverride)
    void PrepareFX(AActor Instigator, FHitResult HitResult)
    {
        const auto TargetMaterial = HitResult.GetPhysMaterial();
            
        FModEvent.EventParameters.Add(n"IMP_sourceWeapon", 2);
        if(TargetMaterial != nullptr)
        {
            FModEvent.EventParameters.Add(n"IMP_targetMaterial", int(TargetMaterial.SurfaceType));
        }
        else
        {
            FModEvent.EventParameters.Add(n"IMP_targetMaterial", 1);
        }
    }
}

class UGothicFXDefinition_Impact_Fall_Torch : UGothicFXDefinition_Impact_Fall_Small
{
    default EffectTag = GameplayTag::FX_Impact_Item_Torch;
    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Combat/DrawWeapon/SFX_COMBAT_Melee_Torch_Drop_Impact.SFX_COMBAT_Melee_Torch_Drop_Impact'";
    default CooldownTime = 0.2f;

    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::Moderate;
    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Item_Impact;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Continuous;
}