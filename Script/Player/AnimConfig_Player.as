
UCLASS()
class UAnimConfig_Player : UAnimConfig_Human
{
	// HERE ONLY ANIMS THAT ONLY THE PLAYERS CAN DO
	// FOR GENERIC ANIMS USE THE ANIM CONFIG HUMAN	

	default SetDefaultMovementAnimData(UDefault_Player::StaticClass());

	default AddAnimForAction(GameplayTag::Action_Bed, UInteractAnimConfig_Human_Sleep::StaticClass());
	default AddAnimForAction(GameplayTag::Action_Mining, UInteractAnimConfig_Player_Mining::StaticClass());
	default AddAnimForAction(GameplayTag::Action_Mining_OnWall, UInteractAnimConfig_Player_MiningOnWall::StaticClass());
	default AddAnimForAction(GameplayTag::Action_Crafting_Cook_Cauldron, UInteractAnimConfig_Player_Cauldron::StaticClass());
	default AddAnimForAction(GameplayTag::Action_Crafting_Cook_Pan, UInteractAnimConfig_Player_Pan::StaticClass());
  	default AddAnimForAction(GameplayTag::Action_Crafting_Forge, UInteractAnimConfig_Human_Forge::StaticClass());
	default AddAnimForAction(GameplayTag::Action_Crafting_OrcForge, UInteractAnimConfig_Human_OrcForge::StaticClass());
	default AddAnimForAction(GameplayTag::Action_Crafting_Anvil, UInteractAnimConfig_Human_Anvil::StaticClass());
	default AddAnimForAction(GameplayTag::Action_Crafting_Barrel, UInteractAnimConfig_Human_Barrel::StaticClass());
	default AddAnimForAction(GameplayTag::Action_Crafting_Workbench, UInteractAnimConfig_Human_Workbench::StaticClass());
	default AddAnimForAction(GameplayTag::Action_Crafting_WhetStone, UInteractAnimConfig_Human_WhetStone::StaticClass());
	default AddAnimForAction(GameplayTag::Action_Crafting_OrcWhetstone, UInteractAnimConfig_Human_WhetStone::StaticClass());
	default AddAnimForAction(GameplayTag::Action_Crafting_Alchemy, UInteractAnimConfig_Human_Alchemy::StaticClass());
	default AddAnimForAction(GameplayTag::Action_Crafting_Inscription, UInteractAnimConfig_Human_Inscription::StaticClass());
	default AddAnimForAction(GameplayTag::Action_EffectStation_Rostisserie, UInteractAnimConfig_Player_Rostisserie::StaticClass());
	default AddAnimForAction(GameplayTag::Action_Loot, UInteractAnimConfig_Player_Loot::StaticClass());
	default AddAnimForAction(GameplayTag::Action_Trigger_Winch, UInteractAnimConfig_Player_Trigger_Winch::StaticClass());
	default AddAnimForAction(GameplayTag::Action_Activate_MachineOrc, UInteractAnimConfig_Player_Activate_MachineOrc::StaticClass());
	default AddAnimForAction(GameplayTag::Action_Activate_OrcLever, UInteractAnimConfig_Player_Activate_OrcLever::StaticClass());
	default AddAnimForAction(GameplayTag::Action_Door, UInteractAnimConfig_Player_Door::StaticClass());
	default AddAnimForAction(GameplayTag::Action_Teleport, UInteractAnimConfig_Teleport::StaticClass());
	default AddAnimForAction(GameplayTag::Action_Teleport_Hearth, UInteractAnimConfig_Teleport_Hearth::StaticClass());
	default AddAnimForAction(GameplayTag::Action_Statue, UInteractAnimConfig_Statue::StaticClass());
	default AddAnimForAction(GameplayTag::Action_BloodPuzzleSwitch, UInteractAnimConfig_PuzzleBloodSwitch::StaticClass());
	default AddAnimForAction(GameplayTag::Action_LavaExtractor, UInteractAnimConfig_LavaExtractor::StaticClass());
	default AddAnimForAction(GameplayTag::Action_CallInteractFunction_YberionAshes, UInteractAnimConfig_YberionAshes::StaticClass());
	default AddAnimForAction(GameplayTag::Action_CallInteractFunction_OrcSpores, UInteractAnimConfig_OrcSpores::StaticClass());
	default AddAnimForAction(GameplayTag::Action_CallInteractFunction_AKalomDeath, UInteractAnimConfig_AKalomDeath::StaticClass());
}

UCLASS()
class UInteractAnimConfig_AKalomDeath : UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Interactable/SleeperAltar/Man_SleeperAltar_DeathCorKalom_Montage.Man_SleeperAltar_DeathCorKalom_Montage'";
	default m_MontagesMap.FindOrAdd(n"Magic") = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Interactable/SleeperAltar/Man_SleeperAltar_DeathCorKalom_Magic_Montage.Man_SleeperAltar_DeathCorKalom_Magic_Montage'";
}

UCLASS()
class UInteractAnimConfig_YberionAshes : UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/AshThrowing/Man_Ash_Throwing_Montage.Man_Ash_Throwing_Montage'";	
}

UCLASS()
class UInteractAnimConfig_OrcSpores : UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Plants_OrcSpore/A_Man_Plants_OrcSpore_Montage.A_Man_Plants_OrcSpore_Montage'";	
}

UCLASS()
class UInteractAnimConfig_LavaExtractor : UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Door/Lava_Extractor/Man_ST_LavaExtractor_Montage.Man_ST_LavaExtractor_Montage'";	
}

UCLASS()
class UInteractAnimConfig_PuzzleBloodSwitch : UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Levers/BloodPuzzlePoolSwitch/Man_BloodPuzzle_Pool_Switch_Montage.Man_BloodPuzzle_Pool_Switch_Montage'";	
}

UCLASS()
class UInteractAnimConfig_Statue : UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Levers/StatuePuzzle/A_Man_Statue_Puzzle_Montage.A_Man_Statue_Puzzle_Montage'";	
}

UCLASS()
class UInteractAnimConfig_Teleport_Hearth : UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/InteractiveObjects/Teleport/TeleportForced_Montage.TeleportForced_Montage'";
	default m_MontagesMap.FindOrAdd(n"Hearth1") = n"AnimMontage'/Game/InteractiveObjects/Teleport/Teleport_StabHearth01_Montage.Teleport_StabHearth01_Montage'";
	default m_MontagesMap.FindOrAdd(n"Hearth2") = n"AnimMontage'/Game/InteractiveObjects/Teleport/Teleport_StabHearth02_Montage.Teleport_StabHearth02_Montage'";
	default m_MontagesMap.FindOrAdd(n"Hearth3") = n"AnimMontage'/Game/InteractiveObjects/Teleport/Teleport_StabHearth03_Montage.Teleport_StabHearth03_Montage'";
	default m_MontagesMap.FindOrAdd(n"Hearth4") = n"AnimMontage'/Game/InteractiveObjects/Teleport/Teleport_StabHearth04_Montage.Teleport_StabHearth04_Montage'";
	default m_MontagesMap.FindOrAdd(n"Hearth5") = n"AnimMontage'/Game/InteractiveObjects/Teleport/TeleportForced_Montage.TeleportForced_Montage'";
	default m_MontagesMap.FindOrAdd(n"Hearth1_magic") = n"AnimMontage'/Game/InteractiveObjects/Teleport/Teleport_StabHearth01_Magic.Teleport_StabHearth01_Magic'";
	default m_MontagesMap.FindOrAdd(n"Hearth2_magic") = n"AnimMontage'/Game/InteractiveObjects/Teleport/Teleport_StabHearth02_Magic.Teleport_StabHearth02_Magic'";
	default m_MontagesMap.FindOrAdd(n"Hearth3_magic") = n"AnimMontage'/Game/InteractiveObjects/Teleport/Teleport_StabHearth03_Magic.Teleport_StabHearth03_Magic'";
	default m_MontagesMap.FindOrAdd(n"Hearth4_magic") = n"AnimMontage'/Game/InteractiveObjects/Teleport/Teleport_StabHearth04_Magic.Teleport_StabHearth04_Magic'";
	
}

UCLASS()
class UInteractAnimConfig_Teleport : UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/InteractiveObjects/Teleport/TeleportForced_Montage.TeleportForced_Montage'";
	default m_MontagesMap.FindOrAdd(n"FirstDreamComplete") = n"AnimMontage'/Game/InteractiveObjects/Teleport/TeleportFirstDreamDone_Montage.TeleportFirstDreamDone_Montage'";
	default m_MontagesMap.FindOrAdd(n"SecondDreamComplete") = n"AnimMontage'/Game/InteractiveObjects/Teleport/TeleportSecondDreamDone_Montage.TeleportSecondDreamDone_Montage'";
	default m_MontagesMap.FindOrAdd(n"ThirdDreamComplete") = n"AnimMontage'/Game/InteractiveObjects/Teleport/TeleportThirdDreamDone_Montage.TeleportThirdDreamDone_Montage'";
	default m_MontagesMap.FindOrAdd(n"FourthDreamComplete") = n"AnimMontage'/Game/InteractiveObjects/Teleport/TeleportFourthDreamDone_Montage.TeleportFourthDreamDone_Montage'";
}

UCLASS()
class UInteractAnimConfig_Player_Lever_Mantain : UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Levers/OrcLever/Man_OrcLever_Press_Montage.Man_OrcLever_Press_Montage'";
	default m_ObjectMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Levers/OrcLever/OrcLever_Press_Montage.OrcLever_Press_Montage'";
}

UCLASS()
class UInteractAnimConfig_Player_Lever_BookShelf : UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Door/MountainFortressSecretDoor_Secret_Door/Man_Secret_Door_Book_Montage.Man_Secret_Door_Book_Montage'";
	default m_ObjectMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Door/MountainFortressSecretDoor_Secret_Door/Secret_Door_Book_Montage.Secret_Door_Book_Montage'";
}

UCLASS()
class UInteractAnimConfig_Door_GoblinCave : UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Door/Door_Goblin_Cave/Man_Door_Goblin_Cave_Open_Montage.Man_Door_Goblin_Cave_Open_Montage'";
}

UCLASS()
class UInteractAnimConfig_Door_Bell : UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/PushBell/A_Man_PushBell_Montage.A_Man_PushBell_Montage'";
}

UCLASS()
class UInteractAnimConfig_Door_AbandonedMineDoor : UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Door/Abandoned_Mine/Man_Orc_Focus_Stone_Door_Montage.Man_Orc_Focus_Stone_Door_Montage'";
}

UCLASS()
class UInteractAnimConfig_Door_SunkenTower_Altar : UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Door/Sunken_Tower_Puzzle_Door02/A_Man_Sunken_Tower_Puzzle_Door_02_Altar_Activate_Montage.A_Man_Sunken_Tower_Puzzle_Door_02_Altar_Activate_Montage'";
}

UCLASS()
class UInteractAnimConfig_Door_AbandonedFence : UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Door/Abandoned_Mine_Fence/Man_Abandoned_Mine_Fence_Door_Open_Montage.Man_Abandoned_Mine_Fence_Door_Open_Montage'";
}

UCLASS()
class UInteractAnimConfig_Player_Door_Focus : UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Door/Focus_StoneDoor/Man_Orc_Focus_Stone_Door_Montage.Man_Orc_Focus_Stone_Door_Montage'";
}

UCLASS()
class UInteractAnimConfig_Player_Door_Orc : UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Door/Man_OpenDoor_Orc_Montage.Man_OpenDoor_Orc_Montage'";
	//default m_ObjectMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Levers/WallTorchSecretDoor/WallTorchSecretDoor_Montage.WallTorchSecretDoor_Montage'";
}

UCLASS()
class UInteractAnimConfig_Player_Door : UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Door/Man_OpenDoor_Montage.Man_OpenDoor_Montage'";
	//default m_ObjectMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Levers/WallTorchSecretDoor/WallTorchSecretDoor_Montage.WallTorchSecretDoor_Montage'";
}

UCLASS()
class UInteractAnimConfig_Player_Lever : UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Levers/WallTorchSecretDoor/NH_Lever_WallTorch_SecretDoor_Right.NH_Lever_WallTorch_SecretDoor_Right'";
	default m_ObjectMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Levers/WallTorchSecretDoor/WallTorchSecretDoor_Montage.WallTorchSecretDoor_Montage'";
}

UCLASS()
class UInteractAnimConfig_Player_Lever_DestroyFinalBarrier : UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Deactivate_Barrier/Man_DeactivateTempleBarrier_Montage.Man_DeactivateTempleBarrier_Montage'";
	default m_MontagesMap.FindOrAdd(n"Magic") = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Deactivate_Barrier/Man_DeactivateTempleBarrier_Magic_Montage.Man_DeactivateTempleBarrier_Magic_Montage'";
}

UCLASS()
class UInteractAnimConfig_Player_Lever_OrcLever : UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Levers/OrcLever/NH_Lever_OrcLever_Light.NH_Lever_OrcLever_Light'";
	default m_ObjectMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Levers/OrcLever/OrcLever_Montage.OrcLever_Montage'";
}

UCLASS()
class UInteractAnimConfig_Player_Lever_Wall : UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Levers/LeverWall/NH_LeverWall_Right.NH_LeverWall_Right'";
	default m_ObjectMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Levers/LeverWall/LeverWall_Montage.LeverWall_Montage'";
}

UCLASS()
class UInteractAnimConfig_Player_Activate_MachineOrc : UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Levers/MainDoorMachine/A_Man_MainDoorMachine2Orc_Embed_Montage.A_Man_MainDoorMachine2Orc_Embed_Montage'";
	default m_ObjectMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Levers/MainDoorMachine/A_Winch_MainDoorMachine2Orc_Embed_Montage.A_Winch_MainDoorMachine2Orc_Embed_Montage'";
}

UCLASS()
class UInteractAnimConfig_Player_Activate_OrcLever : UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Levers/OrcLever/A_Man_PutOrcLever_Embed_Montage.A_Man_PutOrcLever_Embed_Montage'";
	default m_ObjectMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Levers/OrcLever/A_OrcLever_PutOrcLever_Montage.A_OrcLever_PutOrcLever_Montage'";
}

UCLASS()
class UInteractAnimConfig_Player_Trigger_Winch : UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Triggers/NH_Trigger_Winch_Montage.NH_Trigger_Winch_Montage'";
	default m_ObjectMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Levers/MainDoorMachine/MainDoorMachine_Montage_next.MainDoorMachine_Montage_next'";
}

UCLASS()
class UInteractAnimConfig_Player_Loot : UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Loot/A_Man_Loot_Montage.A_Man_Loot_Montage'";

	// Configuration of PickUp HeightsLoot
	default m_ExtraData.Add(n"LootDown", 50.0f);
	default m_ExtraData.Add(n"LootFront", 150.0f);

	default m_ExtraData.Add(n"LootDown_Swimming", 50.0f);
	default m_ExtraData.Add(n"LootFront_Swimming", 150.0f);
}

UCLASS()
class UInteractAnimConfig_Human_Sleep : UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Sleep/Human_Sleep_Montage.Human_Sleep_Montage'";
}

UCLASS()
class UInteractAnimConfig_Player_Mining : UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Mining/Human_Pickaxe_Ground_Montage.Human_Pickaxe_Ground_Montage'";
}

UCLASS()
class UInteractAnimConfig_Player_MiningOnWall : UInteractAnimConfig
{
    default m_Montage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Mining/Human_Pickaxe_Montage.Human_Pickaxe_Montage'";
}

UCLASS()
class UInteractAnimConfig_Human_OrcForge : UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Crafting/NH_Interact_ST_Forge_Montage.NH_Interact_ST_Forge_Montage'";
	default m_ObjectMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Male/Crafting/Forge/Forge/SleeperTemple/ST_OrcForge_Montage.ST_OrcForge_Montage'";
	default m_IdleBreakers.Add(n"Breaker_02", 8.0f);
	default m_IdleBreakers.Add(n"Breaker_03", 2.0f);
	default m_IdleBreakers.Add(n"Breaker_05", 2.0f);
	default m_IdleBreakers.Add(n"Breaker_06", 0.4f);
	default m_IdleBreakers.Add(n"Breaker_07", 0.25f);
	default m_IdleBreakers.Add(n"Breaker_08", 0.25f);
	default m_IdleBreakers.Add(n"Breaker_09", 4.0f);
}

UCLASS()
class UInteractAnimConfig_Human_Forge : UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Crafting/NH_Interact_Forge_Montage.NH_Interact_Forge_Montage'";
	default m_ObjectMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Crafting/Object_Interact_Forge_Montage.Object_Interact_Forge_Montage'";
	default m_IdleBreakers.Add(n"Breaker_01", 10.0f);
	default m_IdleBreakers.Add(n"Breaker_02", 8.0f);
	default m_IdleBreakers.Add(n"Breaker_03", 2.0f);
	default m_IdleBreakers.Add(n"Breaker_05", 2.0f);
	default m_IdleBreakers.Add(n"Breaker_06", 0.4f);
	default m_IdleBreakers.Add(n"Breaker_07", 0.25f);
	default m_IdleBreakers.Add(n"Breaker_08", 0.25f);
	default m_IdleBreakers.Add(n"Breaker_09", 4.0f);
}

UCLASS()
class UInteractAnimConfig_Human_Anvil : UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Crafting/NH_Interact_Anvil_Montage.NH_Interact_Anvil_Montage'";
}

UCLASS()
class UInteractAnimConfig_Human_Barrel : UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Crafting/NH_Interact_Barrel_Montage.NH_Interact_Barrel_Montage'";
}

UCLASS()
class UInteractAnimConfig_Human_Workbench : UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Crafting/NH_Interact_Workbench_Montage.NH_Interact_Workbench_Montage'";
	default m_IdleBreakers.Add(n"Loop", 10.0f);
	default m_IdleBreakers.Add(n"Loop03", 5.0f);
	default m_IdleBreakers.Add(n"Breaker_01", 1.75f);
	default m_IdleBreakers.Add(n"Breaker_02", 1.50f);
	default m_IdleBreakers.Add(n"Breaker_03", 0.5f);
	default m_IdleBreakers.Add(n"Breaker_04", 0.15f);
	default m_IdleBreakers.Add(n"Breaker_05", 2.60f);
	default m_IdleBreakers.Add(n"Breaker_06", 2.60f);
	default m_IdleBreakers.Add(n"Breaker_07", 0.35f);
	default m_IdleBreakers.Add(n"Breaker_11", 0.5f);
}

UCLASS()
class UInteractAnimConfig_Human_WhetStone : UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Crafting/NH_Interact_Whetstone_Montage.NH_Interact_Whetstone_Montage'";
	default m_ObjectMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Crafting/Object_Interact_Whetstone_Montage.Object_Interact_Whetstone_Montage'";
	default m_IdleBreakers.Add(n"Breaker_01", 2.0f);
	default m_IdleBreakers.Add(n"Breaker_02", 2.0f);
	default m_IdleBreakers.Add(n"Breaker_03", 2.0f);
	default m_IdleBreakers.Add(n"Breaker_04", 2.0f);
	default m_IdleBreakers.Add(n"Breaker_05", 2.0f);
	default m_IdleBreakers.Add(n"Breaker_06", 2.0f);
	default m_IdleBreakers.Add(n"Breaker_07", 2.0f);
}

UCLASS()
class UInteractAnimConfig_Human_Alchemy : UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Crafting/NH_Interact_AlchemyLab_Montage.NH_Interact_AlchemyLab_Montage'";
	default m_ObjectMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Crafting/Object_Interact_AlchemyLab_Montage.Object_Interact_AlchemyLab_Montage'";
	default m_IdleBreakers.Add(n"Breaker_01", 1.0f);
	default m_IdleBreakers.Add(n"Breaker_02", 1.0f);
	default m_IdleBreakers.Add(n"Breaker_03", 1.0f);
	default m_IdleBreakers.Add(n"Breaker_05", 1.0f);
	default m_IdleBreakers.Add(n"Breaker_06", 1.0f);
	default m_IdleBreakers.Add(n"Breaker_07", 1.0f);
	default m_IdleBreakers.Add(n"Breaker_08", 1.0f);
	default m_IdleBreakers.Add(n"Breaker_09", 1.0f);
}

UCLASS()
class UInteractAnimConfig_Human_Inscription : UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Crafting/NH_Interact_Lactern_Montage.NH_Interact_Lactern_Montage'";
	default m_ObjectMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Crafting/Object_Interact_Inscription_Montage.Object_Interact_Inscription_Montage'";
	default m_IdleBreakers.Add(n"Breaker_01", 12.0f);
	default m_IdleBreakers.Add(n"Breaker_01b", 12.0f);
	default m_IdleBreakers.Add(n"Breaker_02", 0.5f);
	default m_IdleBreakers.Add(n"Breaker_03", 0.5f);
	default m_IdleBreakers.Add(n"Breaker_07", 4.0f);
	default m_IdleBreakers.Add(n"Breaker_08", 2.0f);
	default m_IdleBreakers.Add(n"Breaker_12", 0.5f);
}

UCLASS()
class UInteractAnimConfig_Player_Cauldron : UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Crafting/NH_Interact_Cauldron_Montage.NH_Interact_Cauldron_Montage'";
	default m_IdleBreakers.Add(n"Breaker_01", 80.0f);
	default m_IdleBreakers.Add(n"Breaker_02", 80.0f);
	default m_IdleBreakers.Add(n"Breaker_03", 30.0f);
	default m_IdleBreakers.Add(n"Breaker_04", 40.0f);
	default m_IdleBreakers.Add(n"Breaker_05", 30.0f);
	default m_IdleBreakers.Add(n"Breaker_06", 50.0f);
	default m_IdleBreakers.Add(n"Breaker_07", 60.0f);
	default m_IdleBreakers.Add(n"Breaker_08", 30.0f);
	default m_IdleBreakers.Add(n"Breaker_09", 25.0f);
	default m_IdleBreakers.Add(n"Breaker_10", 40.0f);
}

UCLASS()
class UInteractAnimConfig_Player_Pan : UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Crafting/NH_Interact_Campfire_Montage.NH_Interact_Campfire_Montage'";
	default m_ObjectMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Crafting/Object_Interact_Pan_Montage.Object_Interact_Pan_Montage'";
	default m_IdleBreakers.Add(n"Breaker_02", 1.0f);
	default m_IdleBreakers.Add(n"Breaker_03", 1.0f);
	default m_IdleBreakers.Add(n"Breaker_04", 1.0f);
	default m_IdleBreakers.Add(n"Breaker_06", 1.0f);
	default m_IdleBreakers.Add(n"Breaker_07", 1.0f);
	default m_IdleBreakers.Add(n"Breaker_08", 1.0f);
}	

UCLASS()
class UInteractAnimConfig_Player_Rostisserie : UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Crafting/NH_Interact_Rostisserie.NH_Interact_Rostisserie'";
}