CREATE TABLE content (
    id INT PRIMARY KEY,
    create_date DATETIME,
    creater_name VARCHAR(255),
    deleter_name VARCHAR(255),
    depth INT,
    family INT,
    delete_flag VARCHAR(10),
    hit INT,
    indent INT,
    last_update_date DATETIME,
    notice_flag VARCHAR(10),
    parent INT,
    password VARCHAR(255),
    sub_title TEXT,
    tag TEXT,
    title TEXT,
    contents LONGTEXT,
    likes INT,
    category_id INT,
    secret_flag VARCHAR(10),
    file_size_rep_img BIGINT,
    origin_rep_img VARCHAR(500),
    rep_img VARCHAR(500),
    user_id INT
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE blog_category (
    id INT PRIMARY KEY,
    category_desktop_yn VARCHAR(10),
    category_img_link VARCHAR(500),
    category_level INT,
    category_link VARCHAR(500),
    category_mobile_yn VARCHAR(10),
    category_name VARCHAR(255),
    category_order INT,
    category_parent INT,
    category_target_yn VARCHAR(10),
    delete_flag VARCHAR(10)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE reply (
    id INT PRIMARY KEY,
    contents TEXT,
    create_date DATETIME,
    creater_name VARCHAR(255),
    delete_flag VARCHAR(10),
    parent_id INT,
    password VARCHAR(255),
    creater_email VARCHAR(255)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
