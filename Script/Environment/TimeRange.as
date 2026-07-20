
UCLASS()
class UTimeRange_Night: UTimeRange
{
	default HourStart = 19;
	default MinuteStart = 0;
	default HourEnd = 6;
	default MinuteEnd = 0;
};

UCLASS()
class UTimeRange_Noon: UTimeRange
{
	default HourStart = 11;
	default MinuteStart = 0;
	default HourEnd = 13;
	default MinuteEnd = 0;
};

UCLASS()
class UTimeRange_Morning: UTimeRange
{
	default HourStart = 6;
	default MinuteStart = 0;
	default HourEnd = 11;
	default MinuteEnd = 0;
};

UCLASS()
class UTimeRange_Afternoon: UTimeRange
{
	default HourStart = 13;
	default MinuteStart = 0;
	default HourEnd = 19;
	default MinuteEnd = 0;
};

UCLASS()
class UTimeRange_All: UTimeRange
{
	default bAllTime = true;
};