alter table sample_restaurant_items
    add constraint sample_restaurant_items_fr
        foreign key ( restaurant_id )
            references sample_restaurant ( id )
        enable;


-- sqlcl_snapshot {"hash":"619f811391dada4f57918b5c4dfea5408c8b56e1","type":"REF_CONSTRAINT","name":"SAMPLE_RESTAURANT_ITEMS_FR","schemaName":"PROJECT","sxml":""}