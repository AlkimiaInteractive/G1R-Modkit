class UPouchCollisionFX : UGothicFXDefinition
{
    default EffectTag = GameplayTag::FX_Collision_Pouch_HitGround;
    default CooldownTime = 3.0f;

    // TODO: #jfm: use proper "pouch hit ground" FMOD event.
    // default FModEvent.FMODEventPath = n"/Script/FMODStudio.FMODEvent'/Game/FMOD/Events/SFX/Physics/Impacts/SFX_PHYSICS_Impacts_CreatureBite_Flesh.SFX_PHYSICS_Impacts_CreatureBite_Flesh'";

    default PerceptionSoundArea.PerceptionSoundTag = GameplayTag::FX_Collision_Pouch_HitGround;
    default PerceptionSoundArea.PerceptionLoudness = EPerceptionNoiseLoudness::VeryLoud;
    default PerceptionSoundArea.PerceptionSoundLength = EPerceptionSoundLengthType::Instant;
}