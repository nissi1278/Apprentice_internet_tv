USE internet_tv;

--
-- テーブル `genre` のデータ
--

INSERT INTO genre (genre_name) VALUES
('アニメ'),
('ドラマ'),
('映画');

--
-- テーブル `channel` のデータ
--

INSERT INTO channel (channel_name) VALUES
('人気アニメ'),
('人気ドラマ'),
('洋画'),
('日本映画');

--
-- テーブル `shows` のデータ
--

-- アニメ
INSERT INTO shows (show_id, show_title, show_detail) VALUES
(1, '鬼滅の刃', '人間を食らう鬼と、鬼を滅ぼす鬼殺隊との戦いを描く和風ダークファンタジーアニメ。'),
(2, 'SPY×FAMILY', '世界平和のため、極秘任務を負った凄腕スパイが仮初めの家族を作るコメディ。'),
(3, '進撃の巨人', '巨大な壁に囲まれた世界で、壁外の巨人と戦う人類の物語。');

-- ドラマ
INSERT INTO shows (show_id, show_title, show_detail) VALUES
(4, 'VIVANT', '謎の組織「VIVANT」を追う果てなき冒険と友情、そして謎が解き明かされていく物語。'),
(5, 'アンナチュラル', '「不自然な死」の死因究明専門のスペシャリストが集まるUDIラボの活躍を描く。'),
(6, '逃げるは恥だが役に立つ', '「就職としての結婚」をテーマに、契約結婚した男女のその後の関係を描くラブコメディ。');

-- 映画（洋画）
INSERT INTO shows (show_id, show_title, show_detail) VALUES
(7, 'ショーシャンクの空に', '無実の罪で投獄された銀行家が、刑務所内で希望を捨てずに生き抜くヒューマンドラマ。'),
(8, 'タイタニック', '豪華客船タイタニック号を舞台にした、身分違いの男女の悲恋を描く。'),
(9, 'ハリー・ポッターと賢者の石', '額の傷を持つ孤児の少年が、自分が魔法使いだと知りホグワーツ魔法魔術学校に入学する物語。');

-- 映画（日本映画）
INSERT INTO shows (show_id, show_title, show_detail) VALUES
(10, '千と千尋の神隠し', '神々の世界に迷い込んだ10歳の少女千尋が、元の世界に戻るために奮闘するファンタジー。'),
(11, '君の名は。', '山深い田舎町に暮らす女子高校生と、東京に暮らす男子高校生の体が入れ替わるSFファンタジー。'),
(12, 'シン・ゴジラ', '現代の日本に突如現れた巨大生物ゴジラと、それに対抗する人々の姿を描く。');


--
-- テーブル `season` のデータ
--
-- 注意: 映画については、エピソードを保持するために通常シーズンを1つ（season_number 1）作成します。

-- アニメ シーズン
INSERT INTO season (season_id, show_id, season_number, season_title) VALUES
(1, 1, 1, '竈門炭治郎 立志編'),
(2, 1, 2, '遊郭編'),
(3, 1, 3, '刀鍛冶の里編'),
(4, 2, 1, 'Season 1'), -- SPY×FAMILYは公式でSeason表記のためそのまま
(5, 2, 2, 'Season 2'), -- SPY×FAMILYは公式でSeason表記のためそのまま
(6, 3, 1, 'Season 1'), -- 進撃の巨人も公式でSeason表記があるためそのまま
(7, 3, 2, 'Season 2'),
(8, 3, 3, 'Season 3'),
(9, 3, 4, 'The Final Season');

-- ドラマ シーズン
INSERT INTO season (season_id, show_id, season_number, season_title) VALUES
(10, 4, 1, 'シリーズ1'), -- VIVANTはシリーズ表記
(11, 5, 1, 'シリーズ1'), -- アンナチュラルは連続ドラマとしてシリーズ表記
(12, 6, 1, '連続ドラマ'), -- 逃げ恥 連続ドラマ部分
(13, 6, 2, 'ガンバレ人類！新春スペシャル！！'); -- 逃げ恥 スペシャルドラマ

-- 映画 シーズン (映画ごとに1つのシーズン)
INSERT INTO season (season_id, show_id, season_number, season_title) VALUES
(14, 7, 1, 'ショーシャンクの空に'),
(15, 8, 1, 'タイタニック'),
(16, 9, 1, 'ハリー・ポッターと賢者の石'),
(17, 10, 1, '千と千尋の神隠し'),
(18, 11, 1, '君の名は。'),
(19, 12, 1, 'シン・ゴジラ');

--
-- テーブル `episode` のデータ
--

-- アニメ エピソード (いくつかサンプル)
INSERT INTO episode (episode_id, season_id, episode_number, episode_title, release_date, video_time_seconds) VALUES
(1, 1, 1, '残酷', '2019-04-06', 1440), -- 24分
(2, 1, 2, '育手・鱗滝左近次', '2019-04-13', 1440),
(3, 2, 10, '上弦の陸・妓夫太郎', '2021-12-05', 1440),
(4, 3, 1, '誰かの夢', '2023-04-09', 1440),
(5, 4, 1, 'MISSION 1', '2022-04-09', 1440),
(6, 4, 2, 'MISSION 2', '2022-04-16', 1440),
(7, 6, 1, '二千年後の君へ', '2013-04-07', 1440),
(8, 9, 76, '轟', '2022-01-09', 1440);

-- ドラマ エピソード (いくつかサンプル)
INSERT INTO episode (episode_id, season_id, episode_number, episode_title, release_date, video_time_seconds) VALUES
(9, 10, 1, '第1話', '2023-07-16', 3300), -- 約55分
(10, 10, 2, '第2話', '2023-07-23', 3300),
(11, 11, 1, '第1話 名前のない毒', '2018-01-12', 3300),
(12, 11, 2, '第2話 死にたがりの手紙', '2018-01-19', 3300),
(13, 12, 1, 'プロの独身男が選んだ道', '2016-10-11', 3300),
(14, 12, 2, '今夜はジューシー', '2016-10-18', 3300),
(15, 13, 1, NULL, '2021-01-02', 6900); -- スペシャルドラマ 約115分

-- 映画 エピソード (映画シーズンごとに1つのエピソード)
INSERT INTO episode (episode_id, season_id, episode_number, episode_title, release_date, video_time_seconds) VALUES
(16, 14, 1, 'ショーシャンクの空に', '1994-09-23', 8520), -- 約142分
(17, 15, 1, 'タイタニック', '1997-12-19', 11580), -- 約193分
(18, 16, 1, 'ハリー・ポッターと賢者の石', '2001-11-16', 9120), -- 約152分
(19, 17, 1, '千と千尋の神隠し', '2001-07-20', 7500), -- 約125分
(20, 18, 1, '君の名は。', '2016-08-26', 6360), -- 約106分
(21, 19, 1, 'シン・ゴジラ', '2016-07-29', 7200); -- 約120分

--
-- テーブル `show_genre` のデータ
--
-- ジャンルID: 1=アニメ, 2=ドラマ, 3=映画
-- ショーID: 1-3 アニメ, 4-6 ドラマ, 7-9 洋画, 10-12 日本映画

INSERT INTO show_genre (show_id, genre_id, genre_order) VALUES
(1, 1, 0), -- 鬼滅の刃: アニメ
(2, 1, 0), -- SPY×FAMILY: アニメ
(3, 1, 0), -- 進撃の巨人: アニメ
(4, 2, 0), -- VIVANT: ドラマ
(5, 2, 0), -- アンナチュラル: ドラマ
(6, 2, 0), -- 逃げるは恥だが役に立つ: ドラマ
(7, 3, 0), -- ショーシャンクの空に: 映画
(8, 3, 0), -- タイタニック: 映画
(9, 3, 0), -- ハリー・ポッターと賢者の石: 映画
(10, 3, 0), -- 千と千尋の神隠し: 映画
(11, 3, 0), -- 君の名は。: 映画
(12, 3, 0); -- シン・ゴジラ: 映画


--
-- テーブル `show_schedules` のデータ
--
-- チャンネルID: 1=人気アニメ, 2=人気ドラマ, 3=洋画, 4=日本映画
-- エピソードID: 1-8 アニメ, 9-15 ドラマ, 16-18 洋画, 19-21 日本映画

-- スケジュールデータをたくさん生成します
-- 数日分のスケジュールを生成します

DELIMITER $$

-- スケジュール生成プロシージャ
-- startDate: データ生成を開始する日付
-- numDays: データを生成する日数
CREATE PROCEDURE GenerateSchedules(startDate DATE, numDays INT)
BEGIN
    DECLARE currentDate DATE;
    DECLARE currentHour INT;
    DECLARE currentMinute INT;
    DECLARE channelId SMALLINT UNSIGNED;
    DECLARE episodeId INT UNSIGNED;
    DECLARE startTime DATETIME;
    DECLARE endTime DATETIME;
    DECLARE duration INT;
    DECLARE viewerCount INT;
    DECLARE counter INT DEFAULT 0; -- 日数カウンター

    SET currentDate = startDate;

    -- 指定された日数分ループ
    WHILE counter < numDays DO
        SET currentHour = 0;
        -- 1日の時間 (0時から23時) 分ループ
        WHILE currentHour < 24 DO
            SET currentMinute = 0;
            -- 1時間の分 (0分から59分) 分ループ
            WHILE currentMinute < 60 DO

                -- チャンネルをランダムに選択 (ジャンルに合わせて偏りを持たせるが、多少混ざることも許容)
                SET channelId = FLOOR(1 + RAND() * 4); -- 1から4をランダムに選択

                -- チャンネルに基づいてエピソードを選択 (ジャンルを合わせるように試みる)
                CASE channelId
                    WHEN 1 THEN -- 人気アニメ
                        SET episodeId = FLOOR(1 + RAND() * 8); -- アニメのエピソード 1-8
                    WHEN 2 THEN -- 人気ドラマ
                        SET episodeId = FLOOR(9 + RAND() * (15 - 9 + 1)); -- ドラマのエピソード 9-15
                    WHEN 3 THEN -- 洋画
                         -- 洋画 (16-18)、時々日本映画 (19-21) や長いドラマスペシャル (15)
                        SET episodeId = CASE
                            WHEN RAND() < 0.8 THEN FLOOR(16 + RAND() * (18 - 16 + 1)) -- 80% 洋画
                            WHEN RAND() < 0.9 THEN FLOOR(19 + RAND() * (21 - 19 + 1)) -- 10% 日本映画
                            ELSE 15 -- 10% ドラマスペシャル (時間帯が合えば)
                        END;
                         -- 映画/スペシャルの再生時間を調整
                        SELECT video_time_seconds INTO duration FROM episode WHERE episode_id = episodeId;
                         IF duration < 1800 THEN SET duration = 5400; END IF; -- エピソードデータが短い場合、映画は最低1.5時間とする
                    WHEN 4 THEN -- 日本映画
                         -- 日本映画 (19-21)、時々洋画 (16-18) や長いドラマスペシャル (15)
                        SET episodeId = CASE
                            WHEN RAND() < 0.8 THEN FLOOR(19 + RAND() * (21 - 19 + 1)) -- 80% 日本映画
                            WHEN RAND() < 0.9 THEN FLOOR(16 + RAND() * (18 - 16 + 1)) -- 10% 洋画
                            ELSE 15 -- 10% ドラマスペシャル
                        END;
                         -- 映画/スペシャルの再生時間を調整
                        SELECT video_time_seconds INTO duration FROM episode WHERE episode_id = episodeId;
                         IF duration < 1800 THEN SET duration = 5400; END IF; -- エピソードデータが短い場合、映画は最低1.5時間とする
                    ELSE
                         -- デフォルトまたはフォールバック (必要に応じてジャンルを混ぜることも可能)
                         SET episodeId = FLOOR(1 + RAND() * 21); -- 全てのエピソードから選択
                END CASE;

                 -- 再生時間が設定されていない場合、または1分未満の場合は取得
                 IF duration IS NULL OR duration < 60 THEN -- 最低1分
                    SELECT video_time_seconds INTO duration FROM episode WHERE episode_id = episodeId;
                    IF duration < 600 THEN SET duration = 1800; END IF; -- 短すぎる場合は最低10分、デフォルトは30分
                 END IF;

                -- 開始時間と終了時間を設定
                SET startTime = STR_TO_DATE(CONCAT(currentDate, ' ', currentHour, ':', currentMinute, ':00'), '%Y-%m-%d %H:%i:%s');
                SET endTime = DATE_ADD(startTime, INTERVAL duration SECOND);

                -- ランダムな視聴者数を生成 (簡単な範囲)
                SET viewerCount = FLOOR(RAND() * 100000); -- 最大10万人の視聴者

                -- `show_schedules` テーブルに挿入
                INSERT INTO show_schedules (channel_id, start_time, end_time, episode_id, viewer_count) VALUES
                (channelId, startTime, endTime, episodeId, viewerCount);

                -- 次の開始時間に移動 (再生時間 + 少しのバッファを追加)
                SET currentMinute = currentMinute + FLOOR(duration / 60) + FLOOR(RAND() * 5) + 1; -- 再生時間(分) + 1～5分のバッファを追加

                -- 分が60を超えたら時間を繰り上げ
                IF currentMinute >= 60 THEN
                    SET currentHour = currentHour + FLOOR(currentMinute / 60);
                    SET currentMinute = currentMinute MOD 60;
                END IF;

            END WHILE; -- 分ループ終了
            SET currentHour = currentHour + 1; -- ループが終了するように時間を進める
        END WHILE; -- 時間ループ終了
        SET currentDate = DATE_ADD(currentDate, INTERVAL 1 DAY); -- 次の日に進める
        SET counter = counter + 1;
    END WHILE; -- 日ループ終了
END$$

DELIMITER ;

-- プロシージャを呼び出してデータを生成 (例: '2024-01-01' から30日間)
CALL GenerateSchedules('2025-05-01', 30);
