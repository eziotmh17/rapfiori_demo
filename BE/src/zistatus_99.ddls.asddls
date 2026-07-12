@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Status Interface'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZISTATUS_99
  as select from ztstatus_99
{
  key status      as Status,
      status_text as StatusText
}
