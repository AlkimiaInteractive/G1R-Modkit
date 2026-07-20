
UCLASS()
class USwimConfig_Creature: USwimConfig
{
	default m_SwimToDiveHeight = 200;
	default m_DiveToSwimHeight = 180;
	default m_WalkToSwimHeight = 140;
	default m_SwimToWalkHeight = 100;

	default m_SwimmingEffect 		= UGE_Swimming::StaticClass();
	default m_DivingEffect 			= UGE_Diving::StaticClass();
};


