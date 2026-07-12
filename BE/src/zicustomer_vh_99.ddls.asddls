@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Customer View Help'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZICUSTOMER_VH_99
  as select from ztcustomer_99
{
  key customer_id   as CustomerId,
      @Semantics.name.fullName: true
      customer_name as CustomerName,
      @Semantics.eMail.address: true
      @Semantics.eMail.type: [ #WORK ]
      email         as Email,
      @Semantics.address.city: true
      city          as City,
      @Semantics.telephone.type: [ #WORK ]
      phone         as Phone
}
