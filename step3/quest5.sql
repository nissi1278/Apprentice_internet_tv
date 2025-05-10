/*(advanced) 直近一週間で最も見られた番組が知りたいです。直近一週間に放送された番組の中で、エピソード視聴数合計トップ2の番組に対して、番組タイトル、視聴数を取得してください*/

--start_dateが7日前の00:00:00〜当日の23:59:59以内のカラムを対象とする。
SELECT sh.show_title,sum(viewer_count) AS total_show_viewer_count
FROM       show_schedules AS ss
INNER JOIN episode AS ep ON ep.episode_id = ss.episode_id
INNER JOIN season  AS se ON se.season_id  = ep.season_id
INNER JOIN shows   AS sh ON sh.show_id    = se.show_id
WHERE      ss.start_time <  CURDATE() + INTERVAL 1 DAY
AND        ss.start_time >= CURDATE() - INTERVAL 7 DAY
GROUP BY   sh.show_id
ORDER BY   total_show_viewer_count DESC
LIMIT 2;