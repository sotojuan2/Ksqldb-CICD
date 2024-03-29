CREATE STREAM PAGEVIEWS_STREAM (VIEWTIME BIGINT, USERID STRING, PAGEID STRING) 
WITH (KAFKA_TOPIC='test_topic', KEY_FORMAT='KAFKA', VALUE_FORMAT='AVRO');
CREATE STREAM S1 AS SELECT VIEWTIME, USERID, PAGEID FROM PAGEVIEWS_STREAM EMIT CHANGES;