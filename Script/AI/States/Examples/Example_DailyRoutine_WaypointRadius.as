/**
 * You can specify the radius around the schedule entries waypoints in which the actions should take place.
 * If the Character is outside of this Radius, they will go towards a random location within the the specified waypoints radius.
 */
UCLASS()
class UDailyRoutine_Example_WaypointRadius : UAIState_DailyRoutine_Human
{
    default Schedule(8, 0, UAIState_SitAround(), n"INSIDE_HUT", WaypointRadius = 1000.0f);
    default Schedule(18, 0, UAIState_SitAround(), n"OUTSIDE_HUT", WaypointRadius = 5000.0f);
    default Schedule(23, 0, UAIState_Sleep(), n"MARKETPLACE", WaypointRadius = 500.0f);
}