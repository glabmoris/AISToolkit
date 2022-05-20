CREATE OR REPLACE VIEW clean_data
AS
    SELECT 
		`raw_data`.`mmsi` AS `mmsi`,
        `raw_data`.`ship_status` AS `ship_status`,
        `raw_data`.`speed` AS `speed`,
        `raw_data`.`course` AS `course`,
        `raw_data`.`latitude` AS `latitude`,
        `raw_data`.`longitude` AS `longitude`,
        `raw_data`.`heading` AS `heading`
    FROM
        `raw_data`
    WHERE
        `raw_data`.`ship_status` = 'UnderWayUsingEngine'
            AND `raw_data`.`course` IS NOT NULL
            AND `raw_data`.`speed` IS NOT NULL
            AND `raw_data`.`latitude` IS NOT NULL
            AND `raw_data`.`longitude` IS NOT NULL
            AND `raw_data`.`heading` IS NOT NULL
            AND `raw_data`.`heading` <> 511

