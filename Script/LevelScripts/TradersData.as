
UCLASS()
class UQuestDealerTraderConfig: UTraderConfigBase
{
    default m_UniqueName = n"Demo_None_Hunter_2202";
    default m_Region = n"Wilderness";
    default m_Type = n"General";
    default AddTraderItemAllDifficulties(UItMi_Orenugget::StaticClass(), 50, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItFo_Cheese::StaticClass(), 1, "OnWorldStart");
	default AddTraderItemAllDifficulties(UItFo_Loaf::StaticClass(), 1, "OnWorldStart");
    default AddTraderItemAllDifficulties(UItAm_Arrow::StaticClass(), 25, "OnWorldStart");
}
