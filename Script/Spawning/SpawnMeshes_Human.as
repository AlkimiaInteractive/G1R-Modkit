
UCLASS()
class USpawnMeshes_AIAgent_Default : USpawnMeshes_AIAgent
{
	default m_AgentType = GameplayTag::AIAgent_Human;

	default m_meshes.Add(TSoftObjectPtr<USkeletalMesh>(n"SkeletalMesh'/Game/Assets/Characters/Humans/Prebaked/CS_Judge/SK_CS_Judge.SK_CS_Judge'"));
}


UCLASS()
class USpawnMeshes_AIAgent_Digger : USpawnMeshes_AIAgent
{
	default m_AgentType = GameplayTag::AIAgent_Human_Digger;

	default m_meshes.Add(TSoftObjectPtr<USkeletalMesh>(n"SkeletalMesh'/Game/Assets/Characters/Humans/Prebaked/FM_VLK_Digger01_5001/SK_FM_VLK_Digger01_5001.SK_FM_VLK_Digger01_5001'"));
 	default m_meshes.Add(TSoftObjectPtr<USkeletalMesh>(n"SkeletalMesh'/Game/Assets/Characters/Humans/Prebaked/FM_VLK_Digger02_5002/SK_FM_VLK_Digger02_5002.SK_FM_VLK_Digger02_5002'"));
	default m_meshes.Add(TSoftObjectPtr<USkeletalMesh>(n"SkeletalMesh'/Game/Assets/Characters/Humans/Prebaked/FM_VLK_Digger03_5003/SK_FM_VLK_Digger03_5003.SK_FM_VLK_Digger03_5003'"));
	default m_meshes.Add(TSoftObjectPtr<USkeletalMesh>(n"SkeletalMesh'/Game/Assets/Characters/Humans/Prebaked/FM_VLK_Digger04_5004/SK_FM_VLK_Digger04_5004.SK_FM_VLK_Digger04_5004'"));
	default m_meshes.Add(TSoftObjectPtr<USkeletalMesh>(n"SkeletalMesh'/Game/Assets/Characters/Humans/Prebaked/FM_VLK_Digger05_5005/SK_FM_VLK_Digger05_5005.SK_FM_VLK_Digger05_5005'"));
	default m_meshes.Add(TSoftObjectPtr<USkeletalMesh>(n"SkeletalMesh'/Game/Assets/Characters/Humans/Prebaked/FM_VLK_Digger06_5006/SK_FM_VLK_Digger06_5006.SK_FM_VLK_Digger06_5006'"));
	default m_meshes.Add(TSoftObjectPtr<USkeletalMesh>(n"SkeletalMesh'/Game/Assets/Characters/Humans/Prebaked/FM_VLK_Digger07_5007/SK_FM_VLK_Digger07_5007.SK_FM_VLK_Digger07_5007'"));
	default m_meshes.Add(TSoftObjectPtr<USkeletalMesh>(n"SkeletalMesh'/Game/Assets/Characters/Humans/Prebaked/OC_VLK_Digger01_501/SK_OC_VLK_Digger01_501.SK_OC_VLK_Digger01_501'"));
	default m_meshes.Add(TSoftObjectPtr<USkeletalMesh>(n"SkeletalMesh'/Game/Assets/Characters/Humans/Prebaked/OC_VLK_Digger02_502/SK_OC_VLK_Digger02_502.SK_OC_VLK_Digger02_502'"));
}

UCLASS()
class USpawnMeshes_AIAgent_Blacksmith : USpawnMeshes_AIAgent
{
	default m_AgentType = GameplayTag::AIAgent_Human_Digger_Blacksmith;

	default m_meshes.Add(TSoftObjectPtr<USkeletalMesh>(n"SkeletalMesh'/Game/Assets/Characters/Humans/Prebaked/OCR_GRD_Stone_219/SK_OCR_GRD_Stone_219.SK_OCR_GRD_Stone_219'"));
}

UCLASS()
class USpawnMeshes_AIAgent_Cook : USpawnMeshes_AIAgent
{
	default m_AgentType = GameplayTag::AIAgent_Human_Digger_Cook;

	default m_meshes.Add(TSoftObjectPtr<USkeletalMesh>(n"SkeletalMesh'/Game/Assets/Characters/Humans/Prebaked/OC_VLK_Snaf_581/SK_OC_VLK_Snaf_581.SK_OC_VLK_Snaf_581'"));
}

UCLASS()
class USpawnMeshes_AIAgent_Guard : USpawnMeshes_AIAgent
{
	default m_AgentType = GameplayTag::AIAgent_Human_Guard;

	default m_meshes.Add(TSoftObjectPtr<USkeletalMesh>(n"SkeletalMesh'/Game/Assets/Characters/Humans/Prebaked/OM_GRD_Ulbert_271/SK_OM_GRD_Ulbert_271.SK_OM_GRD_Ulbert_271'"));
	default m_meshes.Add(TSoftObjectPtr<USkeletalMesh>(n"SkeletalMesh'/Game/Assets/Characters/Humans/Prebaked/FM_GRD_Guard02_284/SK_FM_GRD_Guard02_284.SK_FM_GRD_Guard02_284'"));
	default m_meshes.Add(TSoftObjectPtr<USkeletalMesh>(n"SkeletalMesh'/Game/Assets/Characters/Humans/Prebaked/FM_GRD_Guard03_285/SK_FM_GRD_Guard03_285.SK_FM_GRD_Guard03_285'"));
	default m_meshes.Add(TSoftObjectPtr<USkeletalMesh>(n"SkeletalMesh'/Game/Assets/Characters/Humans/Prebaked/FM_GRD_Guard04_286/SK_FM_GRD_Guard04_286.SK_FM_GRD_Guard04_286'"));
	default m_meshes.Add(TSoftObjectPtr<USkeletalMesh>(n"SkeletalMesh'/Game/Assets/Characters/Humans/Prebaked/FM_GRD_Guard10_292/SK_FM_GRD_Guard10_292.SK_FM_GRD_Guard10_292'"));
	default m_meshes.Add(TSoftObjectPtr<USkeletalMesh>(n"SkeletalMesh'/Game/Assets/Characters/Humans/Prebaked/OC_GRD_Guard04_218/SK_OC_GRD_Guard04_218.SK_OC_GRD_Guard04_218'"));
}

UCLASS()
class USpawnMeshes_AIAgent_LightGuard : USpawnMeshes_AIAgent
{
	default m_AgentType = GameplayTag::AIAgent_Human_Guard_LightGuard;

	default m_meshes.Add(TSoftObjectPtr<USkeletalMesh>(n"SkeletalMesh'/Game/Assets/Characters/Humans/Prebaked/OM_GRD_Ulbert_271/SK_OM_GRD_Ulbert_271.SK_OM_GRD_Ulbert_271'"));
	default m_meshes.Add(TSoftObjectPtr<USkeletalMesh>(n"SkeletalMesh'/Game/Assets/Characters/Humans/Prebaked/FM_GRD_Guard02_284/SK_FM_GRD_Guard02_284.SK_FM_GRD_Guard02_284'"));
}

UCLASS()
class USpawnMeshes_AIAgent_MediumGuard : USpawnMeshes_AIAgent
{
	default m_AgentType = GameplayTag::AIAgent_Human_Guard_MediumGuard;

	default m_meshes.Add(TSoftObjectPtr<USkeletalMesh>(n"SkeletalMesh'/Game/Assets/Characters/Humans/Prebaked/FM_GRD_Guard03_285/SK_FM_GRD_Guard03_285.SK_FM_GRD_Guard03_285'"));
	default m_meshes.Add(TSoftObjectPtr<USkeletalMesh>(n"SkeletalMesh'/Game/Assets/Characters/Humans/Prebaked/FM_GRD_Guard04_286/SK_FM_GRD_Guard04_286.SK_FM_GRD_Guard04_286'"));
}

UCLASS()
class USpawnMeshes_AIAgent_HeavyGuard : USpawnMeshes_AIAgent
{
	default m_AgentType = GameplayTag::AIAgent_Human_Guard_HeavyGuard;

	default m_meshes.Add(TSoftObjectPtr<USkeletalMesh>(n"SkeletalMesh'/Game/Assets/Characters/Humans/Prebaked/FM_GRD_Guard10_292/SK_FM_GRD_Guard10_292.SK_FM_GRD_Guard10_292'"));
	default m_meshes.Add(TSoftObjectPtr<USkeletalMesh>(n"SkeletalMesh'/Game/Assets/Characters/Humans/Prebaked/OC_GRD_Guard04_218/SK_OC_GRD_Guard04_218.SK_OC_GRD_Guard04_218'"));
}

UCLASS()
class USpawnMeshes_AIAgent_Shadow : USpawnMeshes_AIAgent
{
	default m_AgentType = GameplayTag::AIAgent_Human_Shadow;

	default m_meshes.Add(TSoftObjectPtr<USkeletalMesh>(n"SkeletalMesh'/Game/Assets/Characters/Humans/Prebaked/OC_STT_Balam_324/SK_OC_STT_Balam_324.SK_OC_STT_Balam_324'"));
	default m_meshes.Add(TSoftObjectPtr<USkeletalMesh>(n"SkeletalMesh'/Game/Assets/Characters/Humans/Prebaked/OC_STT_Omid_325/SK_OC_STT_Omid_325.SK_OC_STT_Omid_325'"));
	default m_meshes.Add(TSoftObjectPtr<USkeletalMesh>(n"SkeletalMesh'/Game/Assets/Characters/Humans/Prebaked/OC_STT_Shadow01_304/SK_OC_STT_Shadow01_304.SK_OC_STT_Shadow01_304'"));
	default m_meshes.Add(TSoftObjectPtr<USkeletalMesh>(n"SkeletalMesh'/Game/Assets/Characters/Humans/Prebaked/OC_STT_Shadow02_306/SK_OC_STT_Shadow02_306.SK_OC_STT_Shadow02_306'"));

}

UCLASS()
class USpawnMeshes_AIAgent_Baron : USpawnMeshes_AIAgent
{
	default m_AgentType = GameplayTag::AIAgent_Human_Baron;

	default m_meshes.Add(TSoftObjectPtr<USkeletalMesh>(n"SkeletalMesh'/Game/Assets/Characters/Humans/Prebaked/OC_EBR_Scar_101/SK_OC_EBR_Scar_101.SK_OC_EBR_Scar_101'"));
}

UCLASS()
class USpawnMeshes_AIAgent_Guru : USpawnMeshes_AIAgent
{
	default m_AgentType = GameplayTag::AIAgent_Human_Guru;

	default m_meshes.Add(TSoftObjectPtr<USkeletalMesh>(n"SkeletalMesh'/Game/Assets/Characters/Humans/Prebaked/SC_GUR_BaalNamib_1204/SK_SC_GUR_BaalNamib_1204.SK_SC_GUR_BaalNamib_1204'"));
	default m_meshes.Add(TSoftObjectPtr<USkeletalMesh>(n"SkeletalMesh'/Game/Assets/Characters/Humans/Prebaked/SC_GUR_BaalOrun_1209/SK_SC_GUR_BaalOrun_1209.SK_SC_GUR_BaalOrun_1209'"));

}

UCLASS()
class USpawnMeshes_AIAgent_Novice_basic : USpawnMeshes_AIAgent
{
	default m_AgentType = GameplayTag::AIAgent_Human_Novice;

	default m_meshes.Add(TSoftObjectPtr<USkeletalMesh>(n"SkeletalMesh'/Game/Assets/Characters/Humans/Prebaked/SC_NOV_Balor_1304/SK_SC_NOV_Balor_1304.SK_SC_NOV_Balor_1304'"));	
	default m_meshes.Add(TSoftObjectPtr<USkeletalMesh>(n"SkeletalMesh'/Game/Assets/Characters/Humans/Prebaked/ST_NOV_Novice11_1369/SK_ST_NOV_Novice11_1369.SK_ST_NOV_Novice11_1369'"));
}


UCLASS()
class USpawnMeshes_AIAgent_LightNovice : USpawnMeshes_AIAgent
{
	default m_AgentType = GameplayTag::AIAgent_Human_Novice_LightNovice;

	default m_meshes.Add(TSoftObjectPtr<USkeletalMesh>(n"SkeletalMesh'/Game/Assets/Characters/Humans/Prebaked/ST_NOV_Novice10_1368/SK_ST_NOV_Novice10_1368.SK_ST_NOV_Novice10_1368'"));	
	default m_meshes.Add(TSoftObjectPtr<USkeletalMesh>(n"SkeletalMesh'/Game/Assets/Characters/Humans/Prebaked/ST_NOV_Novice09_1367/SK_ST_NOV_Novice09_1367.SK_ST_NOV_Novice09_1367'"));
}

UCLASS()
class USpawnMeshes_AIAgent_Novice : USpawnMeshes_AIAgent
{
	default m_AgentType = GameplayTag::AIAgent_Human_Novice_Novice;

	default m_meshes.Add(TSoftObjectPtr<USkeletalMesh>(n"SkeletalMesh'/Game/Assets/Characters/Humans/Prebaked/NC_NOV_BaalIsidro_1333/SK_NC_NOV_BaalIsidro_1333.SK_NC_NOV_BaalIsidro_1333'"));	
	default m_meshes.Add(TSoftObjectPtr<USkeletalMesh>(n"SkeletalMesh'/Game/Assets/Characters/Humans/Prebaked/SC_NOV_Nyras_1303/SK_SC_NOV_Nyras_1303.SK_SC_NOV_Nyras_1303'"));
}

UCLASS()
class USpawnMeshes_AIAgent_NoviceArmored : USpawnMeshes_AIAgent
{
	default m_AgentType = GameplayTag::AIAgent_Human_Novice_NoviceArmored;

	default m_meshes.Add(TSoftObjectPtr<USkeletalMesh>(n"SkeletalMesh'/Game/Assets/Characters/Humans/Prebaked/SC_NOV_Fortuno_1357/SK_SC_NOV_Fortuno_1357.SK_SC_NOV_Fortuno_1357'"));
	default m_meshes.Add(TSoftObjectPtr<USkeletalMesh>(n"SkeletalMesh'/Game/Assets/Characters/Humans/Prebaked/SC_NOV_Novice30_1341/SK_SC_NOV_Novice30_1341.SK_SC_NOV_Novice30_1341'"));
}


UCLASS()
class USpawnMeshes_AIAgent_LightTemplar : USpawnMeshes_AIAgent
{
	default m_AgentType = GameplayTag::AIAgent_Human_Templar_LightTemplar;

	default m_meshes.Add(TSoftObjectPtr<USkeletalMesh>(n"SkeletalMesh'/Game/Assets/Characters/Humans/Prebaked/SC_TPL_GorHanis_1422/SK_SC_TPL_GorHanis_1422.SK_SC_TPL_GorHanis_1422'"));
 	default m_meshes.Add(TSoftObjectPtr<USkeletalMesh>(n"SkeletalMesh'/Game/Assets/Characters/Humans/Prebaked/OG_TPL_Templar05_1463/SK_OG_TPL_Templar05_1463.SK_OG_TPL_Templar05_1463'"));
}

UCLASS()
class USpawnMeshes_AIAgent_Templar_Basic : USpawnMeshes_AIAgent
{
	default m_AgentType = GameplayTag::AIAgent_Human_Templar;

	default m_meshes.Add(TSoftObjectPtr<USkeletalMesh>(n"SkeletalMesh'/Game/Assets/Characters/Humans/Prebaked/OG_TPL_GorNaZar_1446/SK_OG_TPL_GorNaZar_1446.SK_OG_TPL_GorNaZar_1446'"));
 	default m_meshes.Add(TSoftObjectPtr<USkeletalMesh>(n"SkeletalMesh'/Game/Assets/Characters/Humans/Prebaked/OG_TPL_Templar03_1445/SK_OG_TPL_Templar03_1445.SK_OG_TPL_Templar03_1445'"));
}

UCLASS()
class USpawnMeshes_AIAgent_Templar : USpawnMeshes_AIAgent
{
	default m_AgentType = GameplayTag::AIAgent_Human_Templar_Templar;

	default m_meshes.Add(TSoftObjectPtr<USkeletalMesh>(n"SkeletalMesh'/Game/Assets/Characters/Humans/Prebaked/SC_TPL_Templar03_1436/SK_SC_TPL_Templar03_1436.SK_SC_TPL_Templar03_1436'"));
 	default m_meshes.Add(TSoftObjectPtr<USkeletalMesh>(n"SkeletalMesh'/Game/Assets/Characters/Humans/Prebaked/ST_TPL_Templar13_1460/SK_ST_TPL_Templar13_1460.SK_ST_TPL_Templar13_1460'"));
}

UCLASS()
class USpawnMeshes_AIAgent_HeavyTemplar : USpawnMeshes_AIAgent
{
	default m_AgentType = GameplayTag::AIAgent_Human_Templar_HeavyTemplar;

	default m_meshes.Add(TSoftObjectPtr<USkeletalMesh>(n"SkeletalMesh'/Game/Assets/Characters/Humans/Prebaked/SC_GUR_CorAngar_1202/SK_SC_GUR_CorAngar_1202.SK_SC_GUR_CorAngar_1202'"));
 	default m_meshes.Add(TSoftObjectPtr<USkeletalMesh>(n"SkeletalMesh'/Game/Assets/Characters/Humans/Prebaked/SC_TPL_Templar21_1431/SK_SC_TPL_Templar21_1431.SK_SC_TPL_Templar21_1431'"));
}

UCLASS()
class USpawnMeshes_AIAgent_Rogue : USpawnMeshes_AIAgent
{
	default m_AgentType = GameplayTag::AIAgent_Human_Rogue;

	default m_meshes.Add(TSoftObjectPtr<USkeletalMesh>(n"SkeletalMesh'/Game/Assets/Characters/Humans/Prebaked/UL_ORG_Aidan_859/SK_UL_ORG_Aidan_859.SK_UL_ORG_Aidan_859'"));
 	default m_meshes.Add(TSoftObjectPtr<USkeletalMesh>(n"SkeletalMesh'/Game/Assets/Characters/Humans/Prebaked/NC_ORG_Wedge_850/SK_NC_ORG_Wedge_850.SK_NC_ORG_Wedge_850'"));
 	default m_meshes.Add(TSoftObjectPtr<USkeletalMesh>(n"SkeletalMesh'/Game/Assets/Characters/Humans/Prebaked/UL_ORG_Jacko_862/SK_UL_ORG_Jacko_862.SK_UL_ORG_Jacko_862'"));
 	default m_meshes.Add(TSoftObjectPtr<USkeletalMesh>(n"SkeletalMesh'/Game/Assets/Characters/Humans/Prebaked/NC_ORG_Shrike_842/SK_NC_ORG_Shrike_842.SK_NC_ORG_Shrike_842'"));
 	default m_meshes.Add(TSoftObjectPtr<USkeletalMesh>(n"SkeletalMesh'/Game/Assets/Characters/Humans/Prebaked/NC_ORG_Silas_841/SK_NC_ORG_Silas_841.SK_NC_ORG_Silas_841'"));
 	default m_meshes.Add(TSoftObjectPtr<USkeletalMesh>(n"SkeletalMesh'/Game/Assets/Characters/Humans/Prebaked/NC_ORG_Rogue02_804/SK_NC_ORG_Rogue02_804.SK_NC_ORG_Rogue02_804'"));
}

UCLASS()
class USpawnMeshes_AIAgent_Mercenary : USpawnMeshes_AIAgent
{
	default m_AgentType = GameplayTag::AIAgent_Human_Mercenary;

	default m_meshes.Add(TSoftObjectPtr<USkeletalMesh>(n"SkeletalMesh'/Game/Assets/Characters/Humans/Prebaked/NC_SLD_Mercenary03_705/SK_NC_SLD_Mercenary03_705.SK_NC_SLD_Mercenary03_705'"));
 	default m_meshes.Add(TSoftObjectPtr<USkeletalMesh>(n"SkeletalMesh'/Game/Assets/Characters/Humans/Prebaked/NC_SLD_Mercenary04_706/SK_NC_SLD_Mercenary04_706.SK_NC_SLD_Mercenary04_706'"));
 	default m_meshes.Add(TSoftObjectPtr<USkeletalMesh>(n"SkeletalMesh'/Game/Assets/Characters/Humans/Prebaked/NC_SLD_Mercenary02_703/SK_NC_SLD_Mercenary02_703.SK_NC_SLD_Mercenary02_703'"));
}

UCLASS()
class USpawnMeshes_AIAgent_MageWater : USpawnMeshes_AIAgent
{
	default m_AgentType = GameplayTag::AIAgent_Human_Mage_Water;

	default m_meshes.Add(TSoftObjectPtr<USkeletalMesh>(n"SkeletalMesh'/Game/Assets/Characters/Humans/Prebaked/NC_KDW_Cronos_604/SK_NC_KDW_Cronos_604.SK_NC_KDW_Cronos_604'"));
	default m_meshes.Add(TSoftObjectPtr<USkeletalMesh>(n"SkeletalMesh'/Game/Assets/Characters/Humans/Prebaked/NC_KDW_Merdarion_602/SK_NC_KDW_Merdarion_602.SK_NC_KDW_Merdarion_602'"));
}

UCLASS()
class USpawnMeshes_AIAgent_MageFire : USpawnMeshes_AIAgent
{
	default m_AgentType = GameplayTag::AIAgent_Human_Mage_Fire;

	default m_meshes.Add(TSoftObjectPtr<USkeletalMesh>(n"SkeletalMesh'/Game/Assets/Characters/Humans/Prebaked/OC_KDF_Corristo_402/SK_OC_KDF_Corristo_402.SK_OC_KDF_Corristo_402'"));
	default m_meshes.Add(TSoftObjectPtr<USkeletalMesh>(n"SkeletalMesh'/Game/Assets/Characters/Humans/Prebaked/OC_KDF_Milten/SK_OC_KDF_Milten.SK_OC_KDF_Milten'"));

}

UCLASS()
class USpawnMeshes_AIAgent_Peasant : USpawnMeshes_AIAgent
{
	default m_AgentType = GameplayTag::AIAgent_Human_Peasant;

	default m_meshes.Add(TSoftObjectPtr<USkeletalMesh>(n"SkeletalMesh'/Game/Assets/Characters/Humans/Prebaked/FM_VLK_Digger01_5001/SK_FM_VLK_Digger01_5001.SK_FM_VLK_Digger01_5001'"));
 	default m_meshes.Add(TSoftObjectPtr<USkeletalMesh>(n"SkeletalMesh'/Game/Assets/Characters/Humans/Prebaked/FM_VLK_Digger02_5002/SK_FM_VLK_Digger02_5002.SK_FM_VLK_Digger02_5002'"));
	default m_meshes.Add(TSoftObjectPtr<USkeletalMesh>(n"SkeletalMesh'/Game/Assets/Characters/Humans/Prebaked/FM_VLK_Digger03_5003/SK_FM_VLK_Digger03_5003.SK_FM_VLK_Digger03_5003'"));
	default m_meshes.Add(TSoftObjectPtr<USkeletalMesh>(n"SkeletalMesh'/Game/Assets/Characters/Humans/Prebaked/FM_VLK_Digger04_5004/SK_FM_VLK_Digger04_5004.SK_FM_VLK_Digger04_5004'"));
	default m_meshes.Add(TSoftObjectPtr<USkeletalMesh>(n"SkeletalMesh'/Game/Assets/Characters/Humans/Prebaked/FM_VLK_Digger05_5005/SK_FM_VLK_Digger05_5005.SK_FM_VLK_Digger05_5005'"));
	default m_meshes.Add(TSoftObjectPtr<USkeletalMesh>(n"SkeletalMesh'/Game/Assets/Characters/Humans/Prebaked/FM_VLK_Digger06_5006/SK_FM_VLK_Digger06_5006.SK_FM_VLK_Digger06_5006'"));
	default m_meshes.Add(TSoftObjectPtr<USkeletalMesh>(n"SkeletalMesh'/Game/Assets/Characters/Humans/Prebaked/FM_VLK_Digger07_5007/SK_FM_VLK_Digger07_5007.SK_FM_VLK_Digger07_5007'"));
	default m_meshes.Add(TSoftObjectPtr<USkeletalMesh>(n"SkeletalMesh'/Game/Assets/Characters/Humans/Prebaked/OC_VLK_Digger01_501/SK_OC_VLK_Digger01_501.SK_OC_VLK_Digger01_501'"));
	default m_meshes.Add(TSoftObjectPtr<USkeletalMesh>(n"SkeletalMesh'/Game/Assets/Characters/Humans/Prebaked/OC_VLK_Digger02_502/SK_OC_VLK_Digger02_502.SK_OC_VLK_Digger02_502'"));
}

UCLASS()
class USpawnMeshes_AIAgent_Bandit : USpawnMeshes_AIAgent
{
	default m_AgentType = GameplayTag::AIAgent_Human_Bandit;

	default m_meshes.Add(TSoftObjectPtr<USkeletalMesh>(n"SkeletalMesh'/Game/Assets/Characters/Humans/Prebaked/UL_ORG_Aidan_859/SK_UL_ORG_Aidan_859.SK_UL_ORG_Aidan_859'"));
	default m_meshes.Add(TSoftObjectPtr<USkeletalMesh>(n"SkeletalMesh'/Game/Assets/Characters/Humans/Prebaked/NC_ORG_Wedge_850/SK_NC_ORG_Wedge_850.SK_NC_ORG_Wedge_850'"));
}