@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Header Interface'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZIBOOKING_99
  as select from ztbooking_99
  composition [0..*] of ZIBOOKINGITEM_99 as _bookingItem
  association [0..1] to ZICUSTTOMER_99   as _customer on $projection.CustomerId = _customer.CustomerId
  association [0..1] to ZISTATUS_99      as _status   on $projection.OverallStatus = _status.Status
{
  key ztbooking_99.booking_id            as BookingId,
      ztbooking_99.customer_id           as CustomerId,
      ztbooking_99.booking_date          as BookingDate,
      ztbooking_99.description           as Description,
      @Semantics.amount.currencyCode : 'CurrencyCode'
      ztbooking_99.total_price           as TotalPrice,
      ztbooking_99.currency_code         as CurrencyCode,
      ztbooking_99.overall_status        as OverallStatus,
      ztbooking_99.confirm_flag          as ConfirmFlag,
      ztbooking_99.priority              as Priority,
      ztbooking_99.customer_rating       as CustomerRating,
      ztbooking_99.completion_pct        as CompletionPct,
      case overall_status
        when 'N' then 2        -- New       -> yellow (needs attention)
        when 'A' then 3        -- Accepted  -> green
        when 'X' then 1        -- Cancelled -> red
        else 0
      end                                as StatusCriticality,
      case priority
        when '3' then 1        -- High   -> red
        when '2' then 2        -- Medium -> yellow
        when '1' then 3        -- Low    -> green
        else 0
      end                                as PriorityCriticality,
      ztbooking_99.created_by            as CreatedBy,
      ztbooking_99.created_at            as CreatedAt,
      ztbooking_99.last_changed_by       as LastChangedBy,
      ztbooking_99.last_changed_at       as LastChangedAt,
      ztbooking_99.local_last_changed_at as LocalLastChangedAt,
      _bookingItem,
      _customer,
      _status
}
