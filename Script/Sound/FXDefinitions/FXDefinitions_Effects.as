/*Debuff.Alcohol.Drunk
Debuff.Alcohol.Intoxicated
Debuff.Alcohol.Tipsy
Debuff.Area.Electrified.Damage.Infinite.Period
Debuff.Burn
Debuff.Charm
Debuff.Drugs.High
Debuff.Drugs.Low
Debuff.Drugs.Mid
Debuff.Electrified
Debuff.Electrified.Impact
Debuff.Energy
Debuff.Fear
Debuff.Pyrokinesis
Debuff.Shrink
Debuff.Sleep
Debuff.Sleeper.Xardas.MinionStunned
Debuff.Slowdown
Debuff.Swampweed.Doped
Debuff.Swampweed.High
Debuff.Swampweed.Tripping
Debuff.Unconscious
Debuff.UrizielWaveOfDeath
Debuff.Wind*/



class UGothicFXDefinition_DebuffFreeze : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Debuff_Freeze;
    
    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Debuff;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::VeryLoud;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Instant;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Magic/TargetEffects/SFX_Magic_TargetEffect_Frozen_Loop_01.SFX_Magic_TargetEffect_Frozen_Loop_01'";
    default bIsInstantEffect = false;
}

class UGothicFXDefinition_DebuffBurn : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Debuff_Burn;
    
    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Debuff;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::VeryLoud;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Instant;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Magic/TargetEffects/SFX_Magic_TargetEffect_Burning_Loop_01.SFX_Magic_TargetEffect_Burning_Loop_01'";
    default bIsInstantEffect = false;
}

class UGothicFXDefinition_DebuffCharm : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Debuff_Charm;
    
    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Debuff;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::VeryLoud;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Duration;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Magic/Spells/Charm/SFX_Magic_Charm_Target_01.SFX_Magic_Charm_Target_01'";
    default bIsInstantEffect = true;
}

class UGothicFXDefinition_DebuffElectrified : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Debuff_Electrified;
    
    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Debuff;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::VeryLoud;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Instant;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Magic/TargetEffects/SFX_Magic_TargetEffect_Electrified_Loop_01.SFX_Magic_TargetEffect_Electrified_Loop_01'";
    default bIsInstantEffect = false;
}

class UGothicFXDefinition_DebuffSleep : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Debuff_Sleep;
    
    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::Sound_Debuff;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::VeryLoud;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Instant;

    default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Magic/Spells/Sleep/SFX_Magic_Sleep_Drop_01.SFX_Magic_Sleep_Drop_01'";
}