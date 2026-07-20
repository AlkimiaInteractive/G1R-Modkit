UCLASS()
class UProjectileSpellConfig_SoulHarvest_SkeletonMage : USpellProjectileConfig
{
    default m_SpellLevels.Empty();
    default AddSpellLevel(-1.0f, 0.01f, -1.0f, UGA_Spell_SoulHarvest_SkeletonMage::StaticClass());
    default m_TimePercentageFromWhichCantCancelSpell = 0.1f;

    UPROPERTY(EditAnywhere, BlueprintReadWrite)
	float m_MinSummonDistance = 250.0f;

	UPROPERTY(EditAnywhere, BlueprintReadWrite)
	float m_MaxSummonDistance = 500.0f;

	UPROPERTY(EditAnywhere, BlueprintReadWrite)
	float m_AngleInterval = 60.0f;

	UPROPERTY(EditAnywhere, BlueprintReadWrite)
	float m_DistanceInterval = 100.0f;

	UPROPERTY(EditAnywhere, BlueprintReadWrite)
	float m_SpawnAttemptRadius = 50.0f;

	UPROPERTY(EditAnywhere, BlueprintReadWrite)
	int m_CreatureSpawnAttempts = 10;

    UPROPERTY(EditAnywhere, BlueprintReadWrite)
	int m_ProjectileGroundOffset = 50;


    UFUNCTION(BlueprintOverride, meta=(NoSuperCall))     
    void ChangeCameraBehaviour_Scriptable(bool moving)
    {         
        m_CameraBehaviour = GetCameraBehaviourSpellFrontProjectile_IceGolem();
    }


    UFUNCTION()
    FCameraBehaviour GetCameraBehaviourSpellFrontProjectile_IceGolem()
    {
        FCameraBehaviour Camera;
        Camera.m_ArmLength = 250.0f;
        return Camera;
    }

}

