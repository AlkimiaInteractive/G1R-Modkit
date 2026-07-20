// Copyright by THQ Nordic & Alkimia Interactive

// A timer that is shown in public demos to limit play time.
UCLASS()
class UDemoTimerWidget : UDemoTimerWidgetBase
{
    // Remaining times at which the widget will flash.
    default m_SpecialRemainingTimes.Add(10);
    default m_SpecialRemainingTimes.Add(5);
    default m_SpecialRemainingTimes.Add(3);
    default m_SpecialRemainingTimes.Add(2);
    default m_SpecialRemainingTimes.Add(1);
}
