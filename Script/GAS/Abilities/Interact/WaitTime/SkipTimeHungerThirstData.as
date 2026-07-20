USTRUCT()
struct FSkipTimeData
{
	UPROPERTY()
	UAbilitySystemComponent m_AbComp;

	UPROPERTY()
	bool m_Enabled = false;

	FSkipTimeData(UAbilitySystemComponent AbComp)
	{
		m_AbComp = AbComp;
		m_Enabled = true;
	}

	bool CanSkipTime(ESkipTimeEndReason &OutReason) const
	{
		OutReason = ESkipTimeEndReason::None;
		if(!m_Enabled)
			return true;
		if(m_AbComp == nullptr)
			return false;
		return true;
	}

	void OnSkipTime(float hoursToSkip)
	{
		if(!m_Enabled)
			return;
	}

	void OnHourSkipped()
	{
		if(!m_Enabled)
			return;
	}

    float CalcHoursUntil(float PointsRemaining, float FillRatio, float FillRatioPeriod) const
    {
        if (PointsRemaining <= 0)
            return 0.0f;

        if (FillRatio <= 0.0f || FillRatioPeriod <= 0.0f)
            return -1.0f;

        return (PointsRemaining * FillRatioPeriod) / FillRatio;
    }
}