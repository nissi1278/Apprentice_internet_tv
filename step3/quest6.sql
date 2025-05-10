/*(advanced) ジャンルごとの番組の視聴数ランキングを知りたいです。番組の視聴数ランキングはエピソードの平均視聴数ランキングとします。
ジャンルごとに視聴数トップの番組に対して、ジャンル名、番組タイトル、エピソード平均視聴数を取得してください。*/

SELECT ge.genre_name,sh.show_title,AVG(ss.viewer_count) AS avg_viewer_count
FROM       genre          AS ge
INNER JOIN show_genre     AS sg ON sg.genre_id    = ge.genre_id
INNER JOIN shows          AS sh ON sh.show_id     = sg.show_id
INNER JOIN season         AS se ON se.show_id     = sh.show_id
INNER JOIN episode        AS ep ON ep.season_id   = se.season_id
INNER JOIN show_schedules AS ss ON ss.episode_id  = ep.episode_id
WHERE      sg.show_id = (SELECT sh2.show_id
                         FROM show_schedules AS ss2
                         INNER JOIN episode    AS ep2 ON ep2.episode_id = ss2.episode_id
                         INNER JOIN season     AS se2 ON se2.season_id  = ep2.season_id
                         INNER JOIN shows      AS sh2 ON sh2.show_id    = se2.show_id
                         INNER JOIN show_genre AS sg2 ON sg2.show_id    = sh2.show_id
                         WHERE sg2.genre_id = ge.genre_id
                         GROUP BY sh2.show_id
                         ORDER BY AVG(viewer_count) DESC
                         LIMIT 1)
GROUP BY ge.genre_name,sh.show_title;