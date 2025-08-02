-- liquibase formatted sql
-- changeset PROJECT:1754135331696 stripComments:false  logicalFilePath:develop\project\ref_constraints\sample_restaurant_items_fr.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/project/ref_constraints/sample_restaurant_items_fr.sql:null:619f811391dada4f57918b5c4dfea5408c8b56e1:create

alter table sample_restaurant_items
    add constraint sample_restaurant_items_fr
        foreign key ( restaurant_id )
            references sample_restaurant ( id )
        enable;

