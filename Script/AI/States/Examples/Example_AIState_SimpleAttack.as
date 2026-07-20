/**
 * This state lets the NPC draw their melee weapon and starts following the
 * character that should be attacked.
 * 
 * While following, the NPC will attack the other character if it's close enough.
 * Once the other character dies, the state ends.
 */
UCLASS()
class UAIState_SimpleAttack : UGothicCharacterAIState
{
    UAIState_SimpleAttack(AGothicCharacter InAttackCharacter)
    {
        AttackCharacter = InAttackCharacter;
    }

    UPROPERTY()
    AGothicCharacter AttackCharacter;

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {   
        WaitSeconds(1);

        AI.DrawMeleeWeapon();

        AI.StartFollowingActor(AttackCharacter);
        {
            while(!AttackCharacter.IsDead() && !AttackCharacter.IsDefeated())
            {
                if (AttackCharacter.GetDistanceTo(Self) < 500.0f)
                {
                    AI.AttackLeft();
                    AI.AttackRight();
                }

                WaitOneTick();
            }
        }
        AI.StopFollowingActor(AttackCharacter);

        AI.UndrawWeapon();
    }
}