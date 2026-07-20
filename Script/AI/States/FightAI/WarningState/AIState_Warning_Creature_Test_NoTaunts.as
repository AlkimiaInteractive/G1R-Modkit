/** State in which we are aware of an enemy's presence but have not decided to enter combat yet */
/** For creatures */
/** We will taunt once and then move towards the enemy at walking speed, switching to running speed whenever the enemy is not facing us. 
We stop following if we get too far from alert start location */

UCLASS()
class UAIState_Warning_Creature_Test_NoTaunts : UAIState_Warning_Creature
{
    default NumWarningsBeforeCombat = 0;

    FString GetDisplayName() const override
    {
        return "No Taunts - Creature Warning";
    }
}