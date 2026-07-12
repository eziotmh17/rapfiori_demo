@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Customer Interface'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZICUSTTOMER_99
  as select from ztcustomer_99
{
  key customer_id   as CustomerId,
      customer_name as CustomerName,
      email         as Email,
      city          as City,
      phone         as Phone
}
