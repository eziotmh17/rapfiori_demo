CLASS lhc_BookingHeader DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

*    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
*      IMPORTING keys REQUEST requested_authorizations FOR BookingHeader RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR BookingHeader RESULT result.

    METHODS earlynumbering_create FOR NUMBERING
      IMPORTING entities FOR CREATE BookingHeader.

ENDCLASS.

CLASS lhc_BookingHeader IMPLEMENTATION.

*  METHOD get_instance_authorizations.
*    READ ENTITIES OF zibooking_99 IN LOCAL MODE
*    ENTITY BookingHeader FIELDS ( OverallStatus )
*    WITH CORRESPONDING #( keys ) RESULT DATA(lt_status) FAILED failed.
*
*    result = VALUE #(
*      FOR ls_key IN lt_status (
*          %tky = ls_key-%tky
*          %update = COND #( WHEN ls_key-OverallStatus = 'X' THEN if_abap_behv=>auth-unauthorized
*                            ELSE if_abap_behv=>auth-allowed
*                          )
*          %delete = COND #( WHEN ls_key-OverallStatus = 'X' THEN if_abap_behv=>auth-unauthorized
*                            ELSE if_abap_behv=>auth-allowed
*                          )
*      )
*     ).
*  ENDMETHOD.

  METHOD get_global_authorizations.
    result-%create = if_abap_behv=>auth-allowed.
    result-%update = if_abap_behv=>auth-allowed.
    result-%delete = if_abap_behv=>auth-allowed.
  ENDMETHOD.

  METHOD earlynumbering_create.

    SELECT SINGLE FROM ztbooking_99 FIELDS MAX( booking_id ) INTO @DATA(lv_max_id).
    SELECT SINGLE FROM ztbooking__d_99 FIELDS MAX( bookingid ) INTO @DATA(lv_max_id_draf).
    IF lv_max_id <= lv_max_id_draf.
      lv_max_id = lv_max_id_draf.
    ENDIF.
    DATA(lv_num) = COND i( WHEN lv_max_id IS INITIAL THEN 0 ELSE CONV i( lv_max_id+2 ) ).


    LOOP AT entities INTO DATA(entity).
      DATA(lv_id) = entity-BookingId.
      IF lv_id IS INITIAL.
        lv_num += 1.
        lv_id = |BK{ lv_num ALIGN = RIGHT PAD = '0' WIDTH = 4 }|.
      ENDIF.
      APPEND VALUE #( %cid           = entity-%cid
                      %is_draft      = entity-%is_draft
                      %key-BookingId = lv_id ) TO mapped-bookingheader.
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
