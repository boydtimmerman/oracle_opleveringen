alter table sample_restaurant_order_items
    add constraint sample_restaurant_order_items_order_id_fk
        foreign key ( order_id )
            references sample_restaurant_orders ( order_id )
        enable;


-- sqlcl_snapshot {"hash":"9d89c9c3f7f1bede16bcc792d55449a4e84b195e","type":"REF_CONSTRAINT","name":"SAMPLE_RESTAURANT_ORDER_ITEMS_ORDER_ID_FK","schemaName":"PROJECT","sxml":""}