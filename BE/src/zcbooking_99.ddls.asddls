@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Header Projection'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@Search.searchable: true
define root view entity ZCBOOKING_99
  provider contract transactional_query
  as projection on ZIBOOKING_99
{
  key BookingId,
      CustomerId,
      BookingDate,
      Description,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,
      CurrencyCode,
      @ObjectModel.text.element: ['StatusText']
      OverallStatus,
      ConfirmFlag,
      Priority,
      CustomerRating,
      CompletionPct,
      StatusCriticality,
      PriorityCriticality,

      _customer.CustomerName,
      _status.StatusText,
      _customer.Email as CustomerEmail,
      _customer.City  as CustomerCity,
      /* Associations */
      _bookingItem : redirected to composition child ZCBOOKINGITEM_99,
      _customer,
      _status
}
