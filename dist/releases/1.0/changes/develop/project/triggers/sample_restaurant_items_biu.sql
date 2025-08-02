-- liquibase formatted sql
-- changeset PROJECT:1754135331945 stripComments:false  logicalFilePath:develop\project\triggers\sample_restaurant_items_biu.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/project/triggers/sample_restaurant_items_biu.sql:null:5d501fc823c86f6cef7fe165abb2d32ae555787e:create

create or replace editionable trigger sample_restaurant_items_biu before
    insert or update on sample_restaurant_items
    for each row
begin
    if inserting then
        :new.created := sysdate;
        :new.created_by := coalesce(
            sys_context('APEX$SESSION', 'APP_USER'),
            user
        );
    end if;

    :new.updated := sysdate;
    :new.updated_by := coalesce(
        sys_context('APEX$SESSION', 'APP_USER'),
        user
    );
end sample_restaurant_items_biu;
/

alter trigger sample_restaurant_items_biu enable;

