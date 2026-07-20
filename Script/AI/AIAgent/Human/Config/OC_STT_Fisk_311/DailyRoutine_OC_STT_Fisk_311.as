UCLASS()
class UAIAgentConfig_Human_OC_STT_Fisk_311 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_STT_Fisk_311::StaticClass();

}



UCLASS()
class UDailyRoutine_OC_STT_Fisk_311_Start : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_72);
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_73);
    default Schedule(5, 0, UAIState_CheckGoods_TakeNotes(), n"FP_OC_FISKGOODS_02",1000);
    default Schedule(6, 30, UAIState_FiskSitAround(), n"IO_OC_CHAIR_BENCH_19_FISK",100); 
    default Schedule(16, 0, UAIState_Eat(), n"IO_OC_CHAIR_BENCH_19_FISK",100);
    default Schedule(17, 30, UAIState_FiskSitAround(), n"IO_OC_CHAIR_BENCH_19_FISK",100);
    default Schedule(23, 45, UAIState_Sleep(), n"IO_OC_BED_FISK", WaypointRadius = 500); 

    default ScheduleDuringEvent(UAIWorldEvent_Explicit_Digger19PlayLute::StaticClass(), 0, 0, UAIState_WE_LuteEvent(), n"FP_OC_STANDAROUND_49");
}

UCLASS()
class UDailyRoutine_OC_STT_Fisk_311_CountOre : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_72);
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_73);

    default AutoSwitchAfterTime = FInGameTime::FromHours(1);
    default AutoSwitchToRoutine = UDailyRoutine_OC_STT_Fisk_311_Start;

    default Schedule(7, 30, UAIState_CountOre_Seated(), n"IO_OC_CHAIR_BENCH_19_FISK",1000);

}

class UAIState_FiskSitAround : UAIState_SitAround
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Drink_Seated, 0.25f, 15.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_SmokeWeed_Seated, 0.25f, 15.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_CarveWood, 0.15f, 15.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_SharpWeapon, 0.1f, 15.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Interact_Sit_Ground, 0.25f, 15.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Pee, 0.1f, 15.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_CountOreSeated, 0.25f, 15.0f));

}