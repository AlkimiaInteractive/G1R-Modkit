class UItemCollisionFX : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Test_Item_Collision_Apple;
    default CooldownTime = 3.0f;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Physics/Impacts/SFX_PHYSICS_Impacts_CreatureBite_Flesh.SFX_PHYSICS_Impacts_CreatureBite_Flesh'";

    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::FX_Test_Item_Collision_Apple;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::Moderate;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Instant;

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Default) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/P_Routine_Footstep_mid.P_Routine_Footstep_mid'";
    default Decal.DecalSize = FVector(100.0f, 10.0f, 10.0f);
}

class UJump_Human : UFootsteps_Run_Human
{
    default EffectTag = GameplayTag::FX_Jump;
    default RequiredTags.AddTag(GameplayTag::Species_Human);
    
    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Movement/Footsteps/Human/SFX_MOVE_Footsteps_Human_MASTER.SFX_MOVE_Footsteps_Human_MASTER'";
    default FModEvent.EventParameters.Add(n"MovementSpeed", 4.0f);

    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::Quiet;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Instant;
    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Jump;

    default bUseVolcityThreshold = false;
    default PreferenceLayer = 2;

}
class USwim_Human : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Swim;
    default RequiredTags.AddTag(GameplayTag::Species_Human);

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
class UDive_Human : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Dive;
    default RequiredTags.AddTag(GameplayTag::Species_Human);
    default RequiredTags.AddTag(GameplayTag::State_Movement_Diving);

    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::Moderate;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Continuous;
    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Noise;
    

    //default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Default) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/WaterInteraction/P_Water_Bubbles_Socket.P_Water_Bubbles_Socket'";
}

class UFallInWater_Impact_Human: UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Impact_Water;

    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::Moderate;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Instant;
    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Noise;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Movement/Landing/Human/SFX_MOVE_Land_Human_Water.SFX_MOVE_Land_Human_Water'";
    default FModEvent.EventParameters.Add(n"MovementSpeed", 5.0f);

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Default) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/WaterInteraction/P_Water_Splash_Walking_V3_BOMB.P_Water_Splash_Walking_V3_BOMB'";
    default ParticleSystem.bUnderWaterEffect = true;

    UFUNCTION(BlueprintOverride)
    void PrepareFX(AActor Instigator, FHitResult HitResult)
    {
        AGothicCharacter InstigatorCharacter = Cast<AGothicCharacter>(Instigator);

        ParticleSystem.FloatParameters.Add(n"VelocityZ", float32(InstigatorCharacter.GetVelocity().Z));
        ParticleSystem.FloatParameters.Add(n"DistanceGround", HitResult.Distance);
    }
}

class ULand_Human : UFootsteps_Run_Human
{
    default EffectTag = GameplayTag::FX_Land;
    default RequiredTags.AddTag(GameplayTag::Species_Human);
    
    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Movement/Footsteps/Human/SFX_MOVE_Footsteps_Human_MASTER.SFX_MOVE_Footsteps_Human_MASTER'";
    default FModEvent.EventParameters.Add(n"MovementSpeed", 5.0f);

    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::Moderate;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Instant;
    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Land;

    default bUseVolcityThreshold = false;
    default PreferenceLayer = 2;
}

class UDodge_Human : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Dodge;
    default RequiredTags.AddTag(GameplayTag::Species_Human);
    
    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Combat/Vocals/SFX_COMBAT_Vocals_Human_Dodge_NPC.SFX_COMBAT_Vocals_Human_Dodge_NPC'";

    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Dodge;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Instant;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::Moderate;

}

class UDrawWeapon_Human : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Draw_Weapon;

    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Weapon_Draw;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Instant;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::Quiet;

    TMap<FGameplayTag, FName> FMODEventsByWeaponType;

    default FMODEventsByWeaponType.Add(GameplayTag::Item_Weapon_Sword_OneHand, n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Combat/DrawWeapon/SFX_COMBAT_Melee_Draw_1HBlade.SFX_COMBAT_Melee_Draw_1HBlade'");
    default FMODEventsByWeaponType.Add(GameplayTag::Item_Weapon_Sword_TwoHand, n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Combat/DrawWeapon/SFX_COMBAT_Melee_Draw_2HBlade.SFX_COMBAT_Melee_Draw_2HBlade'");
    default FMODEventsByWeaponType.Add(GameplayTag::Item_Weapon_Mace_OneHand, n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Combat/DrawWeapon/SFX_COMBAT_Melee_Draw_1HMace.SFX_COMBAT_Melee_Draw_1HMace'");
    default FMODEventsByWeaponType.Add(GameplayTag::Item_Weapon_Mace_TwoHand, n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Combat/DrawWeapon/SFX_COMBAT_Melee_Draw_2HMace.SFX_COMBAT_Melee_Draw_2HMace'");
    default FMODEventsByWeaponType.Add(GameplayTag::Item_Weapon_Axe_OneHand, n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Combat/DrawWeapon/SFX_COMBAT_Melee_Draw_1HAxe.SFX_COMBAT_Melee_Draw_1HAxe'");
    default FMODEventsByWeaponType.Add(GameplayTag::Item_Weapon_Axe_TwoHand, n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Combat/DrawWeapon/SFX_COMBAT_Melee_Draw_2HAxe_FromBack.SFX_COMBAT_Melee_Draw_2HAxe_FromBack'");
    default FMODEventsByWeaponType.Add(GameplayTag::Item_Weapon_Staff, n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Combat/DrawWeapon/SFX_COMBAT_Melee_Draw_1HWood.SFX_COMBAT_Melee_Draw_1HWood'");
    default FMODEventsByWeaponType.Add(GameplayTag::Item_Weapon_Staff_TwoHand, n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Combat/DrawWeapon/SFX_COMBAT_Melee_Draw_2HWood.SFX_COMBAT_Melee_Draw_2HWood'");
    default FMODEventsByWeaponType.Add(GameplayTag::Item_Weapon_Orc_TwoHand, n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Combat/DrawWeapon/SFX_COMBAT_Melee_Draw_2HAxe_FromBack.SFX_COMBAT_Melee_Draw_2HAxe_FromBack'");

    UFUNCTION(BlueprintOverride)
    void PrepareFX(AActor Instigator, FHitResult HitResult)
    {
        AGothicCharacter InstigatorCharacter = Cast<AGothicCharacter>(Instigator);

        if (!IsValid(InstigatorCharacter))
            return;

        auto MeeleWeapon = InstigatorCharacter.CarryComponent.GetEquippedItemDefinition();
        
        if(FMODEventsByWeaponType.Contains(MeeleWeapon.ItemType))
        {
            FModEvent.FMODEventPath = FMODEventsByWeaponType[MeeleWeapon.ItemType];
        }
    }
}

class UUndrawWeapon_Human : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Undraw_Weapon;
    default RequiredTags.AddTag(GameplayTag::Species_Human);

    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Weapon_Draw;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Instant;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::Quiet;

    TMap<FGameplayTag, FName> FMODEventsByWeaponType;

    default FMODEventsByWeaponType.Add(GameplayTag::Item_Weapon_Sword_OneHand, n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Combat/DrawWeapon/SFX_COMBAT_Melee_Undraw_1HBlade.SFX_COMBAT_Melee_Undraw_1HBlade'");
    default FMODEventsByWeaponType.Add(GameplayTag::Item_Weapon_Sword_TwoHand, n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Combat/DrawWeapon/SFX_COMBAT_Melee_Undraw_2HBlade.SFX_COMBAT_Melee_Undraw_2HBlade'");
    default FMODEventsByWeaponType.Add(GameplayTag::Item_Weapon_Mace_OneHand, n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Combat/DrawWeapon/SFX_COMBAT_Melee_Undraw_1HMace.SFX_COMBAT_Melee_Undraw_1HMace'");
    default FMODEventsByWeaponType.Add(GameplayTag::Item_Weapon_Mace_TwoHand, n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Combat/DrawWeapon/SFX_COMBAT_Melee_Undraw_2HMace.SFX_COMBAT_Melee_Draw_2HMace'");
    default FMODEventsByWeaponType.Add(GameplayTag::Item_Weapon_Axe_OneHand, n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Combat/DrawWeapon/SFX_COMBAT_Melee_Undraw_1HAxe.SFX_COMBAT_Melee_Undraw_1HAxe'");
    default FMODEventsByWeaponType.Add(GameplayTag::Item_Weapon_Axe_TwoHand, n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Combat/DrawWeapon/SFX_COMBAT_Melee_Undraw_2HAxe.SFX_COMBAT_Melee_Undraw_2HAxe'");
    default FMODEventsByWeaponType.Add(GameplayTag::Item_Weapon_Staff, n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Combat/DrawWeapon/SFX_COMBAT_Melee_Undraw_1HWood.SFX_COMBAT_Melee_Undraw_1HWood'");
    default FMODEventsByWeaponType.Add(GameplayTag::Item_Weapon_Staff_TwoHand, n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Combat/DrawWeapon/SFX_COMBAT_Melee_Undraw_2HWood.SFX_COMBAT_Melee_Undraw_2HWood'");
    default FMODEventsByWeaponType.Add(GameplayTag::Item_Weapon_Orc_TwoHand, n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Combat/DrawWeapon/SFX_COMBAT_Melee_Undraw_2HAxe.SFX_COMBAT_Melee_Undraw_2HAxe'");

    UFUNCTION(BlueprintOverride)
    void PrepareFX(AActor Instigator, FHitResult HitResult)
    {
        AGothicCharacter InstigatorCharacter = Cast<AGothicCharacter>(Instigator);

        if (!IsValid(InstigatorCharacter))
            return;

        auto MeeleWeapon = InstigatorCharacter.CarryComponent.GetEquippedItemDefinition();
        
        if(MeeleWeapon == nullptr)
            return;

        if(FMODEventsByWeaponType.Contains(MeeleWeapon.ItemType))
        {
            FModEvent.FMODEventPath = FMODEventsByWeaponType[MeeleWeapon.ItemType];
        }
    }
}


class UTest_Human : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Test;
    default RequiredTags.AddTag(GameplayTag::Species_Human);
    
    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Noise;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Duration;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::Moderate;
}


class UGothicFXDefinition_Human_CastMagic : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Magic;
    default RequiredTags.AddTag(GameplayTag::Species_Human);

    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Magic;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::VeryLoud;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Duration;
}

class UTaunt_Spit_Human : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Taunt_Spit;
    default RequiredTags.AddTag(GameplayTag::Species_Human);

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Default) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/CharacterFX/PS_Spit_01.PS_Spit_01'";
    default ParticleSystem.RotationOffset = FRotator(45.0f, 0.0f, 0.0f);
    default TargetSockets.FindOrAdd(n"face_C_lipUpper");

    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Perception_Sound_Taunt;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::Moderate;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Instant;
}
class UTaunt_Snot_Human : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Taunt_Snot;
    default RequiredTags.AddTag(GameplayTag::Species_Human);

    default ParticleSystem.NiagaraSystemPathBySurfaceType.FindOrAdd(EPhysicalSurface::Default) = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/CharacterFX/PS_Spit_01.PS_Spit_01'";
    default ParticleSystem.RotationOffset = FRotator(45.0f, 45.0f, 0.0f);
    default TargetSockets.FindOrAdd(n"face_C_nose");

    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Perception_Sound_Taunt;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::Moderate;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Instant;

}
class UMountWhistleFX : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Test_Item_Collision_Apple;
    default CooldownTime = 3.0f;
    
    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Creatures/Scavenger/SFX_CREA_Scavenger_Idle_Shriek.SFX_CREA_Scavenger_Idle_Shriek'";

    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_SVM_Hey;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::VeryLoud;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Instant;
}

UCLASS(Abstract)
class UGothicFXDefinition_Human_Lockpicking_Continuous : UGothicFXDefinition
{
    /** Repeated sound of remaining in the lockpicking interaction */
    default EffectTag = GameplayTag::FX_Lockpicking_Continuous;
    default RequiredTags.AddTag(GameplayTag::Species_Human);

    default bIsInstantEffect = false;

    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Lockpicking_Continuous;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Duration;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::Silent;
}


// class UGothicFXDefinition_Human_Lockpicking_Continuous_Untrained : UGothicFXDefinition_Human_Lockpicking_Continuous
// {
//     default RequiredTags.AddTag(GameplayTag::Skill_Lockpicking_Untrained);
//     default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::Moderate;
// }

// class UGothicFXDefinition_Human_Lockpicking_Continuous_Trained : UGothicFXDefinition_Human_Lockpicking_Continuous
// {
//     default RequiredTags.AddTag(GameplayTag::Skill_Lockpicking_Trained);
//     default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::Quiet;
// }

// class UGothicFXDefinition_Human_Lockpicking_Continuous_Master : UGothicFXDefinition_Human_Lockpicking_Continuous
// {
//     default RequiredTags.AddTag(GameplayTag::Skill_Lockpicking_Master);
//     default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::Whisper;
// }

UCLASS()
class UGothicFXDefinition_Human_Lockpicking_Ambient : UGothicFXDefinition
{
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::Silent;
}

class UGothicFXDefinition_Human_Lockpicking_Insert : UGothicFXDefinition_Human_Lockpicking_Ambient
{
    default EffectTag = GameplayTag::FX_Lockpick_Insert;
    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Objects/Lockpicking/SFX_OBJ_Lockpicking_Insert.SFX_OBJ_Lockpicking_Insert'";
}

class UGothicFXDefinition_Human_Lockpicking_Remove : UGothicFXDefinition_Human_Lockpicking_Ambient
{
    default EffectTag = GameplayTag::FX_Lockpick_Remove;
    default FModEvent.FMODEventPath = "/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Objects/Lockpicking/SFX_OBJ_Lockpicking_Remove.SFX_OBJ_Lockpicking_Remove'";
}

class UGothicFXDefinition_Human_Lockpicking_Move_Success : UGothicFXDefinition_Human_Lockpicking_Ambient
{
    default EffectTag = GameplayTag::FX_Lockpick_Move_Success;
    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Objects/Lockpicking/SFX_OBJ_Lockpicking_MoveSuccess.SFX_OBJ_Lockpicking_MoveSuccess'";
}

class UGothicFXDefinition_Human_Lockpicking_Open : UGothicFXDefinition_Human_Lockpicking_Ambient
{
    default EffectTag = GameplayTag::FX_Lockpick_Open;
    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Objects/Lockpicking/SFX_OBJ_Lockpicking_MoveSuccess.SFX_OBJ_Lockpicking_MoveSuccess'";
}

class UGothicFXDefinition_Human_Lockpicking_Move_Block : UGothicFXDefinition_Human_Lockpicking_Ambient
{
    default EffectTag = GameplayTag::FX_Lockpick_Move_Blocked;
    default FModEvent.FMODEventPath =  n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Objects/Lockpicking/SFX_OBJ_Lockpicking_MoveBlocked.SFX_OBJ_Lockpicking_MoveBlocked'";
}

UCLASS(Abstract)
class UGothicFXDefinition_Human_Lockpicking_Break : UGothicFXDefinition_Human_Lockpicking_Ambient
{
    default EffectTag = GameplayTag::FX_Lockpick_Break;
    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Objects/Lockpicking/SFX_OBJ_Lockpicking_Break.SFX_OBJ_Lockpicking_Break'";

    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Lockpicking_Fail;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Instant;
}

class UGothicFXDefinition_Human_Lockpicking_Break_Untrained : UGothicFXDefinition_Human_Lockpicking_Break
{
    default RequiredTags.AddTag(GameplayTag::Skill_Lockpicking_Untrained);
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::Loud;
}
class UGothicFXDefinition_Human_Lockpicking_Break_Trained : UGothicFXDefinition_Human_Lockpicking_Break
{
    default RequiredTags.AddTag(GameplayTag::Skill_Lockpicking_Trained);
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::Moderate;
}
class UGothicFXDefinition_Human_Lockpicking_Break_Master : UGothicFXDefinition_Human_Lockpicking_Break
{
    default RequiredTags.AddTag(GameplayTag::Skill_Lockpicking_Master);
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::Quiet;
}

UCLASS(Abstract)
class UGothicFXDefinition_Human_Lockpicking_Move_Horizontal : UGothicFXDefinition_Human_Lockpicking_Ambient
{
    default EffectTag = GameplayTag::FX_Lockpick_Move_Horizontal;
    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Objects/Lockpicking/SFX_OBJ_Lockpicking_MoveHorizontal.SFX_OBJ_Lockpicking_MoveHorizontal'";
}

class UGothicFXDefinition_Human_Lockpicking_Move_Horizontal_Untrained : UGothicFXDefinition_Human_Lockpicking_Move_Horizontal
{
    default RequiredTags.AddTag(GameplayTag::Skill_Lockpicking_Untrained);
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::Quiet;
}
class UGothicFXDefinition_Human_Lockpicking_Move_Horizontal_Trained : UGothicFXDefinition_Human_Lockpicking_Move_Horizontal
{
    default RequiredTags.AddTag(GameplayTag::Skill_Lockpicking_Trained);
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::Whisper;
}
class UGothicFXDefinition_Human_Lockpicking_Move_Horizontal_Master : UGothicFXDefinition_Human_Lockpicking_Move_Horizontal
{
    default RequiredTags.AddTag(GameplayTag::Skill_Lockpicking_Master);
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::Silent;
}

UCLASS(Abstract)
class UGothicFXDefinition_Human_Lockpicking_Move_Vertical : UGothicFXDefinition_Human_Lockpicking_Ambient
{
    default EffectTag = GameplayTag::FX_Lockpick_Move_Vertical;
    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Objects/Lockpicking/SFX_OBJ_Lockpicking_MoveVertical.SFX_OBJ_Lockpicking_MoveVertical'";
}

class UGothicFXDefinition_Human_Lockpicking_Move_Vertical_Untrained : UGothicFXDefinition_Human_Lockpicking_Move_Vertical
{
    default RequiredTags.AddTag(GameplayTag::Skill_Lockpicking_Untrained);
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::Quiet;
}
class UGothicFXDefinition_Human_Lockpicking_Move_Vertical_Trained : UGothicFXDefinition_Human_Lockpicking_Move_Vertical
{
    default RequiredTags.AddTag(GameplayTag::Skill_Lockpicking_Trained);
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::Whisper;
}
class UGothicFXDefinition_Human_Lockpicking_Move_Vertical_Mrained : UGothicFXDefinition_Human_Lockpicking_Move_Vertical
{
    default RequiredTags.AddTag(GameplayTag::Skill_Lockpicking_Master);
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::Silent;
}

class UGothicFXDefinition_Human_SwapPreset : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_SwapPreset;
    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Actions/SFX_ACTIONS_SwapPreset.SFX_ACTIONS_SwapPreset'";
}

class UGothicFXDefinition_Human_SnoreIn : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Snore_In;
    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Actions/Snore/SFX_ACTIONS_Snore_In.SFX_ACTIONS_Snore_In'";

    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Noise;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::Moderate;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Instant;
}


class UGothicFXDefinition_Human_SnoreOut : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Snore_Out;
    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Actions/Snore/SFX_ACTIONS_Snore_Out.SFX_ACTIONS_Snore_Out'";

    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Noise;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::Moderate;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Instant;
}

class UGothicFXDefinition_Human_SnoreIn_Female : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Snore_In;
    default RequiredTags.AddTag(GameplayTag::Visuals_Humans_Female);
    default PreferenceLayer = 2;

    default FModEvent.FMODEventPath = "/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Actions/Snore/SFX_ACTIONS_SnoreFemale_In.SFX_ACTIONS_SnoreFemale_In'";

    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Noise;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::Moderate;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Instant;
}

class UGothicFXDefinition_Human_SnoreOut_Female : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Snore_Out;
    default RequiredTags.AddTag(GameplayTag::Visuals_Humans_Female);
    default PreferenceLayer = 2;

    default FModEvent.FMODEventPath = "/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Actions/Snore/SFX_ACTIONS_SnoreFemale_Out.SFX_ACTIONS_SnoreFemale_Out'";

    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Noise;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::Moderate;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Instant;
}