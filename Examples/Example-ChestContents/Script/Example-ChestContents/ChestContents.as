
/** Adds 99 Apples to the chest next to the Meatbugs in the ExchangeZone */
UCLASS(meta = (ReplaceParentClass))
class UIO_EZ_CHEST_02_ExampleApples : UIO_EZ_CHEST_02
{
	default AddToInventory(UItFo_Apple, 99);
}
