drop TABLE if exists csv_task;
CREATE TABLE if not exists csv_task (
    handle text,
    title varchar(255),
    body text,
    vendor varchar(255) ,
    type varchar(255) ,
    tags varchar(255) ,
    published varchar(255) ,
    option1_name varchar(255) ,
    option1_value varchar(255) ,
    option2_name varchar(255) ,
    option2_value varchar(255) ,
    option3_name varchar(255) ,
    option3_value varchar(255) ,
    variant_sku varchar(255) ,
    variant_grams varchar(255),
    variant_inventory_tracker varchar(255) ,
    variant_inventory_qty varchar(255) ,
    variant_inventory_policy varchar(255) ,
    variant_fulfillment_service varchar(255) ,
    variant_price varchar(255) ,
    variant_compare_at_price varchar(255) ,
    variant_requiress_shipping varchar(255) ,
    variant_taxable varchar(255) ,
    variant_barcode varchar(255) ,
    image_src varchar(255) ,
    image_alt_text varchar(255) ,
    gift_card varchar(255) ,
    SEO_title varchar(255) ,
    SEO_description varchar(255) ,
    google_shopping_product varchar(255) ,
    google_shopping_gender varchar(255) ,
    google_shopping_age varchar(255) ,
    google_shopping_MPN varchar(255) ,
    google_shopping_AdWords_grouping varchar(255) ,
    google_shopping_AdWords_labels varchar(255) ,
    google_shopping_condition varchar(255) ,
    google_shopping_custom_product varchar(255) ,
    google_shopping_custom_label_0 varchar(255) ,
    google_shopping_custom_label_1 varchar(255) ,
    google_shopping_custom_label_2 varchar(255) ,
    google_shopping_custom_label_3 varchar(255) ,
    google_shopping_custom_label_4 varchar(255) ,
    variant_image varchar(255) ,
    variant_weight_unit varchar(255)
);

LOAD DATA INFILE '/var/lib/mysql-files/jewelry.csv'
	 INTO TABLE csv_task
 	 fields terminated BY ','
    OPTIONALLY ENCLOSED BY '"'
    lines terminated BY '\n'
    IGNORE 1 ROWS
 (handle,title,body, vendor, type, tags, published, option1_name, option1_value, option2_name, option2_value, option3_name, option3_value, variant_sku,variant_grams,
   variant_inventory_tracker, variant_inventory_qty, variant_inventory_policy, variant_fulfillment_service, variant_price,
   variant_compare_at_price, variant_requiress_shipping, variant_taxable,variant_barcode, image_src, image_alt_text, gift_card,
    SEO_title, SEO_description, google_shopping_product, google_shopping_gender, google_shopping_age, google_shopping_MPN,
    google_shopping_AdWords_grouping, google_shopping_AdWords_labels, google_shopping_condition, google_shopping_custom_product,
    google_shopping_custom_label_0, google_shopping_custom_label_1, google_shopping_custom_label_2, google_shopping_custom_label_3,
    google_shopping_custom_label_4, variant_image, variant_weight_unit);

