-- 対象データベースを選択
USE internet_tv;


-- ジャンルテーブル (genre)
INSERT INTO genre (genre_name) VALUES
('アクション'),
('ファンタジー'),
('コメディ'),
('少年漫画'),
('ドラマ');
('アニメ');

-- チャンネルテーブル (channel) 
INSERT INTO channel (channel_name) VALUES
('アニメプレミア'),
('ドラマプレミア');

-- 番組テーブル (shows) 
INSERT INTO shows (show_title) VALUES
('進撃の巨人'), -- show_id 1 (想定)
('SPY×FAMILY'), -- show_id 2 (想定)

-- 進撃の巨人 (show_id 1)
INSERT INTO season (show_id, season_number, season_name, release_date) VALUES
(1, 1, 'Season 1', '2013-04-07'),
(1, 2, 'Season 2', '2017-04-01'),
(1, 3, 'Season 3 Part 1', '2018-07-23'),
(1, 4, 'Season 3 Part 2', '2019-04-29'),
(1, 5, 'The Final Season Part 1', '2020-12-07'),
(1, 6, 'The Final Season Part 2', '2022-01-10'),
(1, 7, 'The Final Season 完結編 (前編)', '2023-03-04'),
(1, 8, 'The Final Season 完結編 (後編)', '2023-11-05');

-- SPY×FAMILY (show_id 2)
INSERT INTO season (show_id, season_number, season_name, release_date) VALUES
(2, 1, 'Season 1 第1クール', '2022-04-09'),
(2, 2, 'Season 1 第2クール', '2022-10-01'),
(2, 3, 'Season 2', '2023-10-07');

-- エピソードテーブル (episode) 
-- 進撃の巨人 (show_id 1)
INSERT INTO episode (show_id, season_number, episode_number, episode_title, episode_info, video_time_seconds) VALUES
(1, 1, 1, 1440),
(1, 1, 2, 1440),
(1, 1, 3, 1440),
(1, 2, 1, 1440),
(1, 3, 1, 1440),
(1, 4, 1, 1440),
(1, 5, 1, 1440),
(1, 6, 1, 1440),
(1, 7, 1, 3660),
(1, 8, 1, 3660);

-- SPY×FAMILY (show_id 2)11~
INSERT INTO episode (show_id, season_number, episode_number, video_time_seconds) VALUES
(2, 1, 1, 1440),
(2, 2, 1, 1440),
(2, 3, 1, 1440);

-- 番組ジャンルテーブル (show_genre)
-- genre_id: 1:アクション 2:ファンタジー 3:コメディ 4:少年漫画 5:ドラマ 6:アニメ 
-- 進撃の巨人 (show_id 1)
INSERT INTO show_genre (show_id, genre_id, genre_order) VALUES
(1, 1, 1), (1, 4, 2), (1, 6, 3);

-- SPY×FAMILY (show_id 2)
INSERT INTO show_genre (show_id, genre_id, genre_order) VALUES
(2, 3, 1), (2, 4, 2), (2, 6, 3);

-- 番組スケジュールテーブル (show_schedules)
-- episode_id はエピソードテーブル挿入時に自動採番された実際のIDを使用する必要があります。
INSERT INTO show_schedules (channel_id, start_time, end_time, episode_id) VALUES
(1, '2025-05-18 21:00:00', '2025-05-18 21:30:00', 1),
(1, '2025-05-18 21:30:00', '2025-05-18 22:00:00', 2),
(1, '2025-05-18 22:00:00', '2025-05-18 22:30:00', 3),
(1, '2025-05-18 22:30:00', '2025-05-18 23:00:00', 4),
(1, '2025-05-18 23:00:00', '2025-05-18 23:30:00', 5),
(1, '2025-05-18 23:30:00', '2025-05-18 24:00:00', 6),
(1, '2025-05-19 08:00:00', '2025-05-19 08:30:00', 11),
(1, '2025-05-19 08:30:00', '2025-05-19 09:00:00', 12),
(1, '2025-05-19 09:00:00', '2025-05-19 09:30:00', 13),

-- 視聴者数テーブル (episode_viewers)
-- channel_id, episode_id, start_time は show_schedules の情報と一致させる
INSERT INTO episode_viewers (channel_id, episode_id, start_time, viewer_count) VALUES
(1, 1 , '2025-05-18 21:00:00', 10000),
(1, 2 , '2025-05-18 21:30:00', 20000),
(1, 3 , '2025-05-18 22:00:00', 15000),
(1, 4 , '2025-05-18 22:30:00', 12500),
(1, 5 , '2025-05-18 23:00:00', 15500),
(1, 6 , '2025-05-18 23:30:00', 16000),
(1, 11, '2025-05-19 08:00:00', 21000),
(1, 12, '2025-05-19 08:30:00', 15000),
(1, 13, '2025-05-19 09:00:00', 21500),