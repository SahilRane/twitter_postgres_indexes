CREATE INDEX ON tweets_jsonb USING gin (COALESCE(((data->'entities')->'hashtags'), '[]'));
CREATE INDEX ON tweets_jsonb USING gin (COALESCE((((data->'extended_tweet')->'entities')->'hashtags'), '[]'))
CREATE INDEX tweets_jsonb_expr_idx ON tweets_jsonb USING btree (((data->>'lang')));
CREATE INDEX ON tweets_jsonb USING gin (to_tsvector('english', COALESCE(((data->'extended_tweet')->>'full_text'), (data->>'text'))));

