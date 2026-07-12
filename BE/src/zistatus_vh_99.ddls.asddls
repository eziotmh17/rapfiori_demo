@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Status View Help'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.resultSet.sizeCategory: #XS
define view entity ZISTATUS_VH_99
  as select from ztstatus_99
{
  key status      as Status,
      @Semantics.text: true
      status_text as StatusText
}
