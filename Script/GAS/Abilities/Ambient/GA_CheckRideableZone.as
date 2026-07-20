UCLASS()
class UGA_CheckRideableZone : UGameplayAbility_MountCheckUnrideableZone
{
    default m_ExitZoneRoutine = UDailyRoutine_Scavenger_Rideable_ExitUnrideableZone::StaticClass(); 
}