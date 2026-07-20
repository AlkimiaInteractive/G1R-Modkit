class UOutdoorSnapshotConfig : UAudioSnapshotSettings
{
	default SnapshotTag = GameplayTag::FMOD_Snapshot_OutDoor;
	default FMODEventPath = n"/Script/FMODStudio.FMODSnapshotReverb'/Game/FMOD/Reverbs/STATE_Outdoor.STATE_Outdoor'";
}

class UIndoorSnapshotConfig : UAudioSnapshotSettings
{
	default SnapshotTag = GameplayTag::FMOD_Snapshot_InDoor;
	default FMODEventPath = n"/Script/FMODStudio.FMODSnapshotReverb'/Game/FMOD/Reverbs/STATE_Indoor.STATE_Indoor'";
}

class UCutsceneSnapshotConfig : UAudioSnapshotSettings
{
	default SnapshotTag = GameplayTag::FMOD_Snapshot_Cutscene;
	default FMODEventPath = n"/Script/FMODStudio.FMODSnapshotReverb'/Game/FMOD/Reverbs/STATE_Cutscene.STATE_Cutscene'";
}

class UCutsceneVoiceOverSnapshotConfig : UAudioSnapshotSettings
{
	default SnapshotTag = GameplayTag::FMOD_Snapshot_Cutscene_VoiceOver;
	default FMODEventPath = n"/Script/FMODStudio.FMODSnapshotReverb'/Game/FMOD/Reverbs/STATE_Cutscene_VO.STATE_Cutscene_VO'";
}

class UConversationSnapshotConfig : UAudioSnapshotSettings
{
	default SnapshotTag = GameplayTag::FMOD_Snapshot_Conversation;
	default FMODEventPath = n"/Script/FMODStudio.FMODSnapshotReverb'/Game/FMOD/Reverbs/STATE_Conversation.STATE_Conversation'";
}

class UNarrationSnapshotConfig : UAudioSnapshotSettings
{
	default SnapshotTag = GameplayTag::FMOD_Snapshot_Narration;
	default FMODEventPath = n"/Script/FMODStudio.FMODSnapshotReverb'/Game/FMOD/Reverbs/STATE_Narration.STATE_Narration'";
}