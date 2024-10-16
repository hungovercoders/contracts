-- Data Contract: worms
-- SQL Dialect: databricks
CREATE OR REPLACE TABLE main.worms.worm_team (
  team_name STRING not null primary key COMMENT "Name of the worms team",
  team_members ARRAY
) COMMENT "Worm teams and their members";
