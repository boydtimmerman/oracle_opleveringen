-- liquibase formatted sql
-- changeset PROJECT:1754135331711 stripComments:false  logicalFilePath:develop\project\ref_constraints\sample_restaurant_order_items_item_id_fk.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/project/ref_constraints/sample_restaurant_order_items_item_id_fk.sql:null:9b5449af11a9a2286f02ad21cd723b02e9effb99:create

alter table sample_restaurant_order_items
    add constraint sample_restaurant_order_items_item_id_fk
        foreign key ( item_id )
            references sample_restaurant_items ( id )
        enable;

