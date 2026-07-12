CLASS zcl_booking_init_99 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_booking_init_99 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DELETE FROM ztstatus_99.
    DELETE FROM ztcustomer_99.
    DELETE FROM ztbooking_99.
    DELETE FROM ztbookingitem_99.



    "============================================================
    " 1) STATUS TEXTS - source table for the value-help dropdown
    "    (case T10.2 - VH view with sizeCategory #XS)
    "============================================================
    MODIFY ztstatus_99 FROM TABLE @( VALUE #(
      ( status = 'N' status_text = 'New' )
      ( status = 'A' status_text = 'Accepted' )
      ( status = 'X' status_text = 'Cancelled' ) ) ).
    out->write( |Status texts modified: { sy-dbcnt } rows| ).

    "============================================================
    " 2) CUSTOMERS - phone added for the Contact Quick View (T14)
    "============================================================
    MODIFY ztcustomer_99 FROM TABLE @( VALUE #(
      ( customer_id = 'C001' customer_name = 'Acme Corp'
        email = 'sales@acme.example'   city = 'Hanoi'
        phone = '+84 24 1234 5678' )
      ( customer_id = 'C002' customer_name = 'Globex Ltd'
        email = 'info@globex.example'  city = 'Da Nang'
        phone = '+84 236 222 3333' )
      ( customer_id = 'C003' customer_name = 'Initech JSC'
        email = 'hello@initech.example' city = 'HCMC'
        phone = '+84 28 9999 8888' ) ) ).
    out->write( |Customers modified: { sy-dbcnt } rows| ).

    "============================================================
    " 3) BOOKINGS - new fields filled so every annotation case
    "    has meaningful demo data:
    "    confirm_flag    -> dropdown Yes/No        (T10.1)
    "    priority        -> dropdown Low/Med/High  (T10.1)
    "    customer_rating -> rating stars 0..5      (T12)
    "    completion_pct  -> progress bar 0..100    (T12)
    "============================================================
    MODIFY ztbooking_99 FROM TABLE @( VALUE #(
      ( booking_id = 'BK0001' customer_id = 'C001' booking_date = '20260601'
        description = 'Hardware order'    total_price = '1500.00' currency_code = 'USD'
        overall_status = 'N' confirm_flag = 'N' priority = '2'
        customer_rating = '3.5' completion_pct = 20 )
      ( booking_id = 'BK0002' customer_id = 'C002' booking_date = '20260605'
        description = 'Software licenses' total_price = '8200.00' currency_code = 'USD'
        overall_status = 'A' confirm_flag = 'X' priority = '3'
        customer_rating = '4.5' completion_pct = 80 )
      ( booking_id = 'BK0003' customer_id = 'C001' booking_date = '20260610'
        description = 'Consulting'        total_price = '4300.00' currency_code = 'EUR'
        overall_status = 'N' confirm_flag = 'N' priority = '1'
        customer_rating = '2.0' completion_pct = 45 )
      ( booking_id = 'BK0004' customer_id = 'C003' booking_date = '20260615'
        description = 'Cancelled order'   total_price = '900.00'  currency_code = 'USD'
        overall_status = 'X' confirm_flag = 'N' priority = '1'
        customer_rating = '1.0' completion_pct = 0 )
    ) ).
    out->write( |Bookings modified: { sy-dbcnt } rows| ).

    "============================================================
    " 4) ITEMS - unchanged structure, one extra row for BK0004
    "============================================================
    MODIFY ztbookingitem_99 FROM TABLE @( VALUE #(
      quantity_unit = 'EA'
      ( booking_id = 'BK0001' item_id = '0010' product_id = 'LAPTOP-14'   quantity = '5'  item_price = '200.00' currency_code = 'USD' )
      ( booking_id = 'BK0001' item_id = '0020' product_id = 'MOUSE'       quantity = '5'  item_price = '100.00' currency_code = 'USD' )
      ( booking_id = 'BK0002' item_id = '0010' product_id = 'OFFICE-LIC'  quantity = '40' item_price = '180.00' currency_code = 'USD' )
      ( booking_id = 'BK0003' item_id = '0010' product_id = 'CONSULT-DAY' quantity = '10' item_price = '430.00' currency_code = 'EUR' )
      ( booking_id = 'BK0004' item_id = '0010' product_id = 'CABLE-KIT'   quantity = '30' item_price = '30.00'  currency_code = 'USD' )
    ) ).
    out->write( |Items modified: { sy-dbcnt } rows| ).

    out->write( 'Demo data ready.' ).
  ENDMETHOD.
ENDCLASS.
