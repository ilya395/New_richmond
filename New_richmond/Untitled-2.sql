-- SELECT 
-- dj_flats.number,
-- dj_flats.floor_id,
-- dj_floors.number,
-- dj_floors.id
-- FROM dj_flats 
-- JOIN dj_floors ON dj_floors.id = dj_flats.floor_id
-- WHERE dj_flats.project_id = 44;

SELECT 
-- id кв в системе
dj_flats.id AS "ID",
--
'simple' AS "Тип",
--
dj_flats.number AS "Артикул",
-- номер кв
CONCAT('Квартира №', dj_flats.number, ', БС', dj_sections.number, ', этаж', dj_floors.number, ', планировка ', dj_plans.name) AS "Имя",
-- цена кв
dj_flats.price AS "Базовая цена",
-- номер этажа
'floor' AS "Имя атрибута 3",
-- dj_floors.number AS "Значение(-я) аттрибута(-ов) 3",
CASE WHEN dj_floors.number = 1 THEN '1 Этаж'
	 WHEN dj_floors.number = 2 THEN '2 Этаж'
	 WHEN dj_floors.number = 3 THEN '3 Этаж'
	 WHEN dj_floors.number = 4 THEN '4 Этаж'
	 WHEN dj_floors.number = 5 THEN '5 Этаж'
	 WHEN dj_floors.number = 6 THEN '6 Этаж'
	 ELSE '7 Этаж'
END AS "Значение(-я) аттрибута(-ов) 3",
'1' AS "Видимость атрибута 3",
'1' AS "Глобальный атрибут 3",
--
'1' AS "Опубликован",
--
'0' AS "рекомендуемый?",
--
'visible' AS "Видимость в каталоге",
--
'' AS "Короткое описание",
--
'<p>[vc_row full_width="stretch_row" equal_height="yes" content_placement="middle" css_animation="none"][vc_column width="1/2" css=".vc_custom_1563289034260{background-position: center !important;background-repeat: no-repeat !important;background-size: cover !important;}" el_class=".render-4-1"][vc_empty_space height="43vw"][/vc_column][vc_column css_animation="none" width="1/2" css=".vc_custom_1540581553477{background-color: #f8f6f2 !important;}"][vc_row_inner][vc_column_inner width="1/6"][/vc_column_inner][vc_column_inner width="2/3"][vc_column_text css=".vc_custom_1540578265442{padding-top: 40px !important;padding-right: 30px !important;padding-left: 30px !important;}"]</p>
<h4 style="color: #d7c8af;">Design</h4>
<h2>Streamlined, on-ear wearing style</h2>
<p><span style="color: #000000;">A contemporary, streamlined design with smooth ergonomics. The perfect match of style and function, H8i are one of the lightest in their class giving you optimal comfort. You simply won’t want to take them off.</span>[/vc_column_text][/vc_column_inner][vc_column_inner width="1/6"][/vc_column_inner][/vc_row_inner][vc_row_inner][vc_column_inner offset="vc_hidden-sm vc_hidden-xs"][vc_empty_space height="40px"][/vc_column_inner][/vc_row_inner][vc_row_inner][vc_column_inner offset="vc_hidden-lg vc_hidden-md vc_hidden-sm"][vc_separator color="custom" el_width="90" accent_color="rgba(215,200,175,0.8)" css=".vc_custom_1540583028468{padding-top: 20px !important;}"][/vc_column_inner][/vc_row_inner][/vc_column][/vc_row][vc_row full_width="stretch_row" equal_height="yes" content_placement="middle" css_animation="none"][vc_column css_animation="none" width="1/2" css=".vc_custom_1540581559692{background-color: #f8f6f2 !important;background-position: center !important;background-repeat: no-repeat !important;background-size: cover !important;}"][vc_row_inner][vc_column_inner offset="vc_hidden-sm vc_hidden-xs"][vc_empty_space height="40px"][/vc_column_inner][/vc_row_inner][vc_row_inner][vc_column_inner width="1/6"][/vc_column_inner][vc_column_inner width="2/3"][vc_column_text css=".vc_custom_1540578270627{padding-right: 30px !important;padding-bottom: 40px !important;padding-left: 30px !important;}"]</p>
<h4 style="color: #d7c8af;">Materials</h4>
<h2>Authentic and Natural</h2>
<p><span style="color: #000000;">Exclusive, carefully selected and authentic materials such as anodized aluminium and natural leather ensure total comfort and let you travel in style. And because the leather patinates over time, Beoplay H8i age beautifully.</span>[/vc_column_text][/vc_column_inner][vc_column_inner width="1/6"][/vc_column_inner][/vc_row_inner][/vc_column][vc_column width="1/2" css=".vc_custom_1563289056637{background-color: #f6f6f6 !important;background-position: center !important;background-repeat: no-repeat !important;background-size: cover !important;}" el_class=".render-4-2"][vc_empty_space height="43vw"][/vc_column][/vc_row]</p>' AS "Описание",
-- 
'taxable' AS "Статус налога",
--
'1' AS "В наличии?",
--
'0' AS "Задержанный заказ возможен?",
--
'1' AS "Продано индивидуально?",
--
'0' AS "Разрешить отзывы от клиентов?",
--
CASE WHEN dj_plans.rooms_count = 1 THEN 'Однокомнатные'
	 WHEN dj_plans.rooms_count = 2 THEN 'Двухкомнатные'
	 WHEN dj_plans.rooms_count = 3 THEN 'Трёхкомнатные'
	 ELSE 'Четырёхкомнатные'
END AS "Категории",
-- количество комнат
dj_plans.rooms_count,
-- площадь
'area' AS "Имя атрибута 7",
dj_plans.area AS "Значение(-я) аттрибута(-ов) 7",
'1' AS "Видимость атрибута 7",
'1' AS "Глобальный атрибут 7",
-- балконы
'balkon' AS "Имя атрибута 5",
SUBSTRING(CAST(dj_plans.balcons AS text), 2, LENGTH(CAST(dj_plans.balcons AS text)) - 2) AS "Значение(-я) аттрибута(-ов) 5",
'1' AS "Видимость атрибута 5",
'1' AS "Глобальный атрибут 5",
-- жилая площадь
'jil_area' AS "Имя атрибута 6",
dj_plans.jil_area AS "Значение(-я) аттрибута(-ов) 6",
'1' AS "Видимость атрибута 6",
'1' AS "Глобальный атрибут 6",
-- название планировки
'planirovka' AS "Имя атрибута 4",
dj_plans.name AS "Значение(-я) аттрибута(-ов) 4",
'1' AS "Видимость атрибута 4",
'1' AS "Глобальный атрибут 4",
-- -- террасы
-- dj_plans.terraces,
-- номер подъезда
'bs' AS "Имя атрибута 2",
dj_sections.number AS "Значение(-я) аттрибута(-ов) 2",
'1' AS "Видимость атрибута 2",
'1' AS "Глобальный атрибут 2",
-- номер дома
'dom' AS "Имя атрибута 1",
dj_buildings.number AS "Значение(-я) аттрибута(-ов) 1",
'1' AS "Видимость атрибута 1",
'1' AS "Глобальный атрибут 1",
-- -- планировка этажа
-- dj_flats.floor_img,
-- --
-- dj_flats.balcony,
-- dj_flats.bathroom,
--
'style_2' AS "Мета: tdl_prod_layout",
'field_prod_layout' AS "Мета: _tdl_prod_layout",
'field_product_video' AS "Мета: _tdl_video_review",
'background--light' AS "Мета: tdl_qickview_color",
'field_qickview_color' AS "Мета: _tdl_qickview_color",
'0' AS "Мета: tdl_new_label",
'field_new_label' AS "Мета: _tdl_new_label",
'false' AS "Мета: _wpb_vc_js_status",
'inherit' AS "Мета: tdl_product_header_transparent",
'field_product_header_transparent' AS "Мета: _tdl_product_header_transparent",
'0' AS "Мета: tdl_full_description",
'field_full_description' AS "Мета: _tdl_full_description",
'default' AS "Мета: slide_template"
--
FROM dj_flats 
JOIN dj_floors ON dj_floors.id = dj_flats.floor_id 
JOIN dj_plans ON dj_plans.id = dj_flats.plan_id
JOIN dj_sections ON dj_sections.id = dj_flats.section_id
JOIN dj_buildings ON dj_buildings.id = dj_flats.building_id
WHERE dj_flats.project_id = 44;