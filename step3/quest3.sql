/*本日の番組表を表示するために、本日、どのチャンネルの、何時から、何の番組が放送されるのかを知りたいです。
本日放送される全ての番組に対して、チャンネル名、放送開始時刻(日付+時間)、放送終了時刻、シーズン数、エピソード数、エピソードタイトル、エピソード詳細を取得してください。
なお、番組の開始時刻が本日のものを本日方法される番組とみなすものとします*/

SELECT ch.channel_name,ss.start_time,ss.end_time,se.season_number,ep.episode_number,ep.episode_title,ep.episode_detail
FROM       show_schedules AS ss
INNER JOIN channel AS ch ON ch.channel_id = ss.channel_id
INNER JOIN episode AS ep ON ep.episode_id = ss.episode_id
INNER JOIN season  AS se ON se.season_id  = ep.season_id
WHERE      DATE(ss.start_time) = CURDATE();