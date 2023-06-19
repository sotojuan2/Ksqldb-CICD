PAUSE CSAS_USER_PAGEVIEWS_113;

CREATE OR REPLACE STREAM pageviews_region_like_89
WITH (KAFKA_TOPIC='pageviews_filtered_r8_r9', VALUE_FORMAT='AVRO')
AS SELECT  userid, pageid, regionid, gender FROM user_pageviews
WHERE regionid LIKE '%_8' OR regionid LIKE '%_9'
EMIT CHANGES;

RESUME CSAS_USER_PAGEVIEWS_113;
