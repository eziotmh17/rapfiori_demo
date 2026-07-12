@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Item Projection'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZCBOOKINGITEM_99
  as projection on ZIBOOKINGITEM_99
{
  key BookingId,
  key ItemId,
      ProductId,
      @Semantics.quantity.unitOfMeasure: 'QuantityUnit'
      Quantity,
      QuantityUnit,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      ItemPrice,
      CurrencyCode,
      LastChangedAt,
      LocalLastChangedAt,
      /* Associations */
      _bookingHeader : redirected to parent ZCBOOKING_99
}
