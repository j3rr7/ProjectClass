Customer
-cust_id
-no_telp
-nama_cust
-member_id

Booking
-booking_id
-tgl_checkout
-tgl_checkin
-cust_id
-jum_kamar
-jum_malam

Kamar
-harga
-kamar_id
-tipe
-max_orang

Event
-event_id
-start_date
-end_date
-keterangan
-kamar_id
-harga

Bookings
-book_id
-tgl_booking
-cust_id
-kamar_id
-tgl_checkin
-jum_malam
-harga
-status_pembayaran
-jum_kamar
-max_orang

Transaction
-checkin_id
-checkin_date
-checkout_date
-book_id
-total

Transaction detail
-checkin_id
-room_number

Transaction subdetail
-checkin_id
-room_number
-service_id
-counter
-harga

Membership
-member_id
-nama
-id














