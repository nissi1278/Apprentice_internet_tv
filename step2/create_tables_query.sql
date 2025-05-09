USE internet_tv
CREATE TABLE shows( show_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                    show_title VARCHAR(200) NOT NULL,
                    show_detail TEXT,
                    PRIMARY KEY(show_id));
CREATE TABLE genre( genre_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
                    genre_name VARCHAR(100) NOT NULL,
                    PRIMARY KEY(genre_id),
                    UNIQUE(genre_name));
CREATE TABLE channel( channel_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
                      channel_name VARCHAR(100) NOT NULL,
                      PRIMARY KEY(channel_id),
                      UNIQUE(channel_name));
CREATE TABLE season( season_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                     show_id INT UNSIGNED NOT NULL,
                     season_number SMALLINT UNSIGNED NOT NULL,
                     season_title VARCHAR(100),
                     PRIMARY KEY(season_id),
                     FOREIGN KEY(show_id)
                        REFERENCES shows(show_id)
                        ON DELETE CASCADE
                        ON UPDATE CASCADE,
                     UNIQUE(show_id,season_number),
                     INDEX(show_id));
CREATE TABLE episode( episode_id  INT UNSIGNED NOT NULL AUTO_INCREMENT,
                      season_id INT UNSIGNED NOT NULL,
                      episode_number SMALLINT UNSIGNED,
                      episode_title VARCHAR(100),
                      episode_detail TEXT,
                      release_date DATE NOT NULL,
                      video_time_seconds INT UNSIGNED NOT NULL DEFAULT 0,
                      PRIMARY KEY(episode_id),
                      FOREIGN KEY(season_id)
                        REFERENCES season(season_id)
                        ON DELETE CASCADE
                        ON UPDATE CASCADE,
                      UNIQUE(season_id,episode_number),
                      INDEX(season_id));
CREATE TABLE show_schedules( channel_id SMALLINT UNSIGNED NOT NULL,
                              start_time DATETIME NOT NULL,
                              end_time DATETIME NOT NULL,
                              episode_id INT UNSIGNED NOT NULL,
                              viewer_count INT UNSIGNED NOT NULL DEFAULT 0,
                              PRIMARY KEY(channel_id, start_time),
                              FOREIGN KEY(channel_id)
                                REFERENCES channel(channel_id)
                                ON DELETE CASCADE
                                ON UPDATE CASCADE,
                              FOREIGN KEY(episode_id)
                                REFERENCES episode(episode_id)
                                ON DELETE CASCADE
                                ON UPDATE CASCADE
                              );
CREATE TABLE show_genre( show_id INT UNSIGNED NOT NULL,
                         genre_id SMALLINT UNSIGNED NOT NULL,
                         genre_order TINYINT UNSIGNED NOT NULL DEFAULT 0,
                         PRIMARY KEY(show_id,genre_id),
                         FOREIGN KEY(show_id)
                            REFERENCES shows(show_id)
                            ON DELETE CASCADE
                            ON UPDATE CASCADE,
                         FOREIGN KEY(genre_id)
                            REFERENCES genre(genre_id)
                            ON DELETE CASCADE
                            ON UPDATE CASCADE);
