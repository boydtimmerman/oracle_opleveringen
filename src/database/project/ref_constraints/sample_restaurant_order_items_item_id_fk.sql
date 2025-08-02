alter table sample_restaurant_order_items
    add constraint sample_restaurant_order_items_item_id_fk
        foreign key ( item_id )
            references sample_restaurant_items ( id )
        enable;


-- sqlcl_snapshot {"hash":"9b5449af11a9a2286f02ad21cd723b02e9effb99","type":"REF_CONSTRAINT","name":"SAMPLE_RESTAURANT_ORDER_ITEMS_ITEM_ID_FK","schemaName":"PROJECT","sxml":""}