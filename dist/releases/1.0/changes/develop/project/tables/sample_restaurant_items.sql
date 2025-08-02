-- liquibase formatted sql
-- changeset PROJECT:1754135331828 stripComments:false  logicalFilePath:develop\project\tables\sample_restaurant_items.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/project/tables/sample_restaurant_items.sql:null:3d149c95ee4462a7d838ed3d0e4f6979918d19af:create

create table sample_restaurant_items (
    id            number,
    restaurant_id number,
    name          varchar2(255 char),
    description   varchar2(4000 char),
    rating        varchar2(12 byte),
    price         number,
    image_url     varchar2(255 char),
    created       date,
    created_by    varchar2(255 char),
    updated       date,
    updated_by    varchar2(255 char)
);

alter table sample_restaurant_items
    add constraint sample_restaurant_items_pk primary key ( id )
        using index enable;

