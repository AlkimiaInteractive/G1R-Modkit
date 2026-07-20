UCLASS()
class AHeatedSpecialStateVisual : ASphereCollisionShapeVisual
{
    UPROPERTY()
    UHeatedState_FireGolem m_def;

    default m_CollisionComp.m_WeaponData = UHeatedState_FireGolem::StaticClass();

    UPROPERTY()
    UDelegateHandleContainer m_OnDieMeBeforeHandle;

    UFUNCTION()
    void ResetEffect()
    {
        Initialize();
    }

    bool SetUpCollisionShape() override
    {
        m_def = Cast<UHeatedState_FireGolem>(GetWeaponDefinition());
        if(m_def != nullptr)
        {
            m_CollisionComp.SetSphereRadius(m_def.m_SphereRadius);
            SetColliderState(EHitColliderState::Damage);
            return true;
        }
        return false;
    }

    UFUNCTION(BlueprintEvent)
    void DoDestroy()
    {
        
    }

    FGameplayTag GetAttackType() override
    {
        return GameplayTag::Combat_HitType_Dot;
    }

    UFUNCTION(BlueprintOverride)
    void Initialize()
    {
        Super::Initialize();
        auto gothicChar = Cast<AGothicCharacter>(GetOwner());
        auto gothicAbComp = Cast<UGothicAbilitySystemComponent>(gothicChar);
        if(gothicChar.IsDead())
            DoDestroy();
        else

        m_OnDieMeBeforeHandle = MagicScript::AttachToEventTag(GetOwner(), GameplayTag::Event_Die_Me_Before, this, n"OnDieMeBefore");
    }

    UFUNCTION()
    void OnDieMeBefore(FGameplayEventData GameplayEventData)
    {
        auto abComp = Cast<UGothicAbilitySystemComponent>(Cast<AGothicCharacter>(GetOwner()));
        MagicScript::DetachFromEvent(GetOwner(), m_OnDieMeBeforeHandle);
        DoDestroy();
    }
}
