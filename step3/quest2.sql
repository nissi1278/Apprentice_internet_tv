--よく見られているエピソードの番組情報やシーズン情報も合わせて知りたいです。エピソード視聴数トップ3の番組タイトル、シーズン数、エピソード数、エピソードタイトル、視聴数を取得してください

SELECT sh.show_title,se.season_number,ep.episode_number,ep.episode_title,SUM(ss.viewer_count) AS total_viewer_count
FROM       show_schedules as ss
INNER JOIN episode AS ep ON ep.episode_id = ss.episode_id
INNER JOIN season  AS se ON se.season_id  = ep.season_id
INNER JOIN shows   AS sh ON sh.show_id    = se.show_id
GROUP BY   ss.episode_id
ORDER BY   total_viewer_count DESC
LIMIT 3;