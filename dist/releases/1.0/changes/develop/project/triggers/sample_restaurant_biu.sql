-- liquibase formatted sql
-- changeset PROJECT:1754135331922 stripComments:false  logicalFilePath:develop\project\triggers\sample_restaurant_biu.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/project/triggers/sample_restaurant_biu.sql:null:40abb18994753417901c15f8eb4640a3bc0ed71d:create

create or replace editionable trigger sample_restaurant_biu before
    insert or update on sample_restaurant
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
end sample_restaurant_biu;
/

alter trigger sample_restaurant_biu enable;

