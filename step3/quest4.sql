/*ドラマというチャンネルがあったとして、ドラマのチャンネルの番組表を表示するために、本日から一週間分、何日の何時から何の番組が放送されるのかを知りたいです。
ドラマのチャンネルに対して、放送開始時刻、放送終了時刻、シーズン数、エピソード数、エピソードタイトル、エピソード詳細を本日から一週間分取得してください*/

--ドラマチャンネルはchannel_idを1とする。
SELECT ss.start_time,ss.end_time,se.season_number,ep.episode_number,ep.episode_title,ep.episode_detail
FROM       show_schedules AS ss
INNER JOIN episode AS ep ON ep.episode_id = ss.episode_id
INNER JOIN season  AS se ON se.season_id  = ep.season_id
WHERE      ss.channel_id = 1
AND        DATE(ss.start_time) BETWEEN CURDATE() AND DATE_ADD(CURDATE(),INTERVAL 7 DAY )
ORDER BY ss.start_time;