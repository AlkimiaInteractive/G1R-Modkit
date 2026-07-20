/** Character warns other characters that they should put their weapons away. */
UCLASS(Abstract)
class UAIState_WarnAggressor : UGothicCharacterAIState
{
    /** How often we should warn the other character before we start a fight. */
    UPROPERTY()
    int NumWarningsBeforeAttack = 3;

    // FIXME: Add a way to go straight to attack-state from here
    /** Read from outside. Set to true to signal that this character had enough of the aggression and should attack now! */
    UPROPERTY()
    bool bShouldAttackNow = false;

    /** Override to specify the very first action to do to warn the other (e.g. drawing our own weapon) */
    void BeginWarning()
    {
    }

    /** Override to make this character warn the other */
    void WarnOther()
    {
    }

    bool IsOtherStillAggressive() const
    {
        return Other.HasDrawnWeapon();
    }

    /** Override to specify what happens when the other stopped the aggressive action */
    void LetOtherGo()
    {
    }

    UFUNCTION(BlueprintOverride)
    void DoTask() final
    {
        AI.SetTargetEnemy(Other, EGothicFocusPriority::Warning, this);

        BeginWarning();

        int NumWarnings = 0;
        while(!bShouldExitState)
        {
            if (NumWarnings < NumWarningsBeforeAttack)
            {
                WarnOther();
            }
            else
            {
                bShouldAttackNow = true;
            }

            NumWarnings += 1;

            if (!IsOtherStillAggressive())
                break;

            WaitOneTick();
        }

        LetOtherGo();
    }

}

UCLASS()
class UAIState_Human_WarnAggressor : UAIState_WarnAggressor
{
    void BeginWarning() override
    {
        AI.DrawMeleeWeapon();
    }

    void WarnOther() override
    {
        WaitSeconds(Math::RandRange(2.0f, 4.0f));
    }

    void LetOtherGo() override
    {
        AI.UndrawWeapon();
    }
}

UCLASS()
class UAIState_Creature_WarnAggressor : UAIState_WarnAggressor
{
    void BeginWarning() override
    {
        AI.DrawMeleeWeapon();
    }

    void WarnOther() override
    {
        // FIXME: Find out what kind of taunts this thing can actually do I guess
        switch (Math::Rand() % 3)
        {
        case 0:
            AI.Taunt(GameplayTag::Combat_Taunt_Bark);
            break;
        case 1:
            AI.Taunt(GameplayTag::Combat_Taunt_Howl);
            break;
        case 2:
            AI.Taunt(GameplayTag::Combat_Taunt_Scream);
            break;
        }
        
        WaitSeconds(Math::RandRange(1.0f, 3.0f));
    }

    void LetOtherGo() override
    {
        AI.UndrawWeapon();
    }
}