-- liquibase formatted sql
-- changeset PROJECT:1754135331728 stripComments:false  logicalFilePath:develop\project\ref_constraints\sample_restaurant_order_items_order_id_fk.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/project/ref_constraints/sample_restaurant_order_items_order_id_fk.sql:null:9d89c9c3f7f1bede16bcc792d55449a4e84b195e:create

alter table sample_restaurant_order_items
    add constraint sample_restaurant_order_items_order_id_fk
        foreign key ( order_id )
            references sample_restaurant_orders ( order_id )
        enable;

