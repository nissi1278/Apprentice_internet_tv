--よく見られているエピソードを知りたいです。エピソード視聴数トップ3のエピソードタイトルと視聴数を取得してください。

SELECT ss.episode_id,ep.episode_title,SUM(ss.viewer_count) AS total_viewer_count
FROM       show_schedules as ss
INNER JOIN episode AS ep ON ep.episode_id = ss.episode_id
GROUP BY   ss.episode_id
ORDER BY   total_viewer_count DESC
LIMIT 3;