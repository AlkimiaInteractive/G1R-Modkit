/** Actor that debug draws the attack range of a given AttackConfigClass */
class ARangeTestingActor : ANote
{
    UPROPERTY(EditAnywhere)
    TSubclassOf<UAttackMeleeConfig> AttackConfigClass;

    UFUNCTION(BlueprintOverride)
    void Tick(float DeltaSeconds)
    {
        if (AttackConfigClass == nullptr)
            return;

        UAttackMeleeConfig AttackMeleeConfig = Cast<UAttackMeleeConfig>(AttackConfigClass.Get().GetDefaultObject());
        float AttackRange = AttackMeleeConfig.GetAttackDistanceFromMontage();
        DebugScript::DrawLine(ActorLocation, ActorLocation + ActorForwardVector * AttackRange, FColor::Cyan, 5.0f, 0.0f);
    }
}