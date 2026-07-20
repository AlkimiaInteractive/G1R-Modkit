
UCLASS()
class UTelekinesisSpellConfig : USpellTraceConfigBase
{
    //Custom Target detection allow to manage the type of the target in the cast phase.
    default m_SpellTargetType = ESpellTargetType::Focused; 
    default m_SpellManaUsage = ESpellManaUsage::NormalContinuous;
    default AddSpellLevel(3.f, 1.0f, 1.0f, UGA_Spell_Telekinesis::StaticClass());
    default AddSpellLevel(3.f, 1.0f, 1.0f, UGA_Spell_Telekinesis_FocusStoneBridge::StaticClass());

    //@DE - For UI and the rest of the player, this spell only has one level. The second one is hidden.
    UFUNCTION(BlueprintOverride)
    int GetSpellLevels_Scriptable() const
    {
        return 1;
    }

    //Distance to trace the target
    default m_AreaRange = 1500.f;
    //Radius of the detection cylinder 
    default m_TraceRadius = 10.f;

    
    default m_CameraBehaviour = GetCameraBehaviourSpellCloseTarget();


    UPROPERTY()
    float m_ItemOscillationFrecuency = 5.f;
    UPROPERTY()
    float m_ItemOscillationAmplitude = 25.f;
    UPROPERTY()
    FVector m_FallVelocity = FVector::ZeroVector; //FVector(0.f, 0.f, -500.f);

    UPROPERTY()
    float m_MovingSpeed = 300.f;

    UPROPERTY()
    float m_MinDistanceToInteractItem = 20.f;

    UPROPERTY()
    float m_MinOffsetToValidItemTarget = 100.f;

    UPROPERTY()
    float m_DropRotation = -20.f;

    UPROPERTY()
    bool m_IsUsingImpulseOnDrop = false;

    UPROPERTY()
    FVector m_DropImpulse = FVector::ZeroVector;

    default m_SpellCategoryTag = GameplayTag::Event_Spell_Mind;

UFUNCTION(BlueprintOverride)
    void ChangeCameraBehaviour_Scriptable(bool moving) 
    {
        m_CameraBehaviour = GetCameraBehaviourSpellCloseTarget();
    }

}


UCLASS()
class UTelekinesisFocusStoneBridgeSpellConfig : UTelekinesisSpellConfig
{

    default m_FallVelocity = FVector::ZeroVector; //FVector(0.f, 0.f, -500.f);

    default m_MovingSpeed = 300.f;

    default m_MinDistanceToInteractItem = 20.f;

    default m_MinOffsetToValidItemTarget = 100.f;

    default m_DropRotation = -20.f;

    default m_IsUsingImpulseOnDrop = false;

    default m_DropImpulse = FVector::ZeroVector;
}