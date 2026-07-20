UCLASS()
class UAIAgentConfig_Human_NC_ORG_Rogue33_882N : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_ORG_Rogue33_882N::StaticClass();

}

UCLASS()
class UDailyRoutine_NC_ORG_Rogue33_882N_Start : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Lurk(), n"FP_OW_CONVOY_13");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_NC_ORG_Rogue33_882N_AfterConvoy : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_StandAround(), n"FP_OW_CONVOY_21");
}

UCLASS()
class UDailyRoutine_NC_ORG_Rogue33_882N_Shipment : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_StandAround(), n"EZ_BANDIT_ATTACK4");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
    default RelationshipModifiersToApply.Add(URelationshipModifier_NC_Convoy_TowardsOldCamp);
    default RelationshipModifiersToApply.Add(URelationshipModifier_NC_Convoy_TowardsHero);
}