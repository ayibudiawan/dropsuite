SELECT
  UNNEST(ARRAY ['A', 'B', 'C', 'A+B', 'A+C', 'B+C', 'A+B+C']) AS Mark,
  UNNEST(ARRAY [A, B, C, AB, AC, BC, ABC]) AS Count
FROM (
  SELECT
    count(1) filter (where mark = 'A') as A,
    count(1) filter (where mark = 'B') as B,
    count(1) filter (where mark = 'C') as C,
    count(1) filter (where mark = 'A' OR mark = 'B') as AB,
    count(1) filter (where mark = 'A' OR mark = 'C') as AC,
    count(1) filter (where mark = 'B' OR mark = 'C') as BC,
    count(1) filter (where mark = 'A' OR mark = 'B' OR mark = 'C') as ABC
  FROM users
) marks