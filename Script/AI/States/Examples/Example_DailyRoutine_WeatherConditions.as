/**
 * Daily routine that shows how to configure different behavior depending on weather conditions.
 */
UCLASS()
class UDailyRoutine_Example_Weather : UAIState_DailyRoutine_Human
{
    // If multiple schedule entries have the same time, the system will pick the one
    // with a fulfilled condition. The last applicable task has the highest priority.
    default Schedule         (12, 0, UAIState_SitAround(), n"MARKETPLACE");
    default ScheduleIfRaining(12, 0, UAIState_SitAround(), n"INSIDE_HUT");
    default ScheduleIfCloudy (12, 0, UAIState_SitAround(), n"OUTSIDE_HUT");
    
    default Schedule         (18, 0, UAIState_SitAround(), n"INSIDE_HUT");

    // You can also put conditional schedule entries inbetween other entries. In this case, the NPC will go to bed early
    // if it's raining. Otherwise, it will go to bed later.
    default ScheduleIfRaining(20, 0, UAIState_Sleep(), n"INSIDE_HUT");
    default Schedule(23, 0, UAIState_Sleep(), n"INSIDE_HUT");
}