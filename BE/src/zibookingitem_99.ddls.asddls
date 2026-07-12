@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Item Interface'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZIBOOKINGITEM_99
  as select from ztbookingitem_99
  association to parent zibooking_99 as _bookingHeader on $projection.BookingId = _bookingHeader.BookingId
{
  key ztbookingitem_99.booking_id            as BookingId,
  key ztbookingitem_99.item_id               as ItemId,
      ztbookingitem_99.product_id            as ProductId,
      @Semantics.quantity.unitOfMeasure: 'QuantityUnit'
      ztbookingitem_99.quantity              as Quantity,
      ztbookingitem_99.quantity_unit         as QuantityUnit,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      ztbookingitem_99.item_price            as ItemPrice,
      ztbookingitem_99.currency_code         as CurrencyCode,
      ztbookingitem_99.last_changed_at       as LastChangedAt,
      ztbookingitem_99.local_last_changed_at as LocalLastChangedAt,
      _bookingHeader
}
