-- Tạo cơ sở dữ liệu
CREATE DATABASE cineman;
USE cineman;

-- Bảng Rapphim090
CREATE TABLE tblRapphim090 (
    id INT PRIMARY KEY,
    ten VARCHAR(255) NOT NULL,
    diachi VARCHAR(255) NOT NULL,
    mota TEXT
);

-- Bảng Phong090, với khóa ngoại tham chiếu đến Rapphim090
CREATE TABLE tblPhong090 (
    id INT PRIMARY KEY,
    ten VARCHAR(255) NOT NULL,
    succhua INT NOT NULL,
    mota TEXT,
    tblRapphim090id INT,
    FOREIGN KEY (tblRapphim090id) REFERENCES tblRapphim090(id) ON DELETE CASCADE
);

-- Bảng Phim090
CREATE TABLE tblPhim090 (
    id INT PRIMARY KEY,
    ten VARCHAR(255) NOT NULL,
    daodien VARCHAR(255),
    thoiLuong INT,
    mota TEXT,
    dangchieu BOOLEAN DEFAULT TRUE
);

-- Bảng Lichchieu090, với các khóa ngoại tham chiếu đến Phong090 và Phim090
CREATE TABLE tblLichchieu090 (
    id INT PRIMARY KEY AUTO_INCREMENT,
    giobatdau DATETIME NOT NULL,
    gioketthuc DATETIME NOT NULL,
    tblPhim090id INT,
    tblPhong090id INT,
    FOREIGN KEY (tblPhim090id) REFERENCES tblPhim090(id) ON DELETE CASCADE,
    FOREIGN KEY (tblPhong090id) REFERENCES tblPhong090(id) ON DELETE CASCADE
);


-- Thêm một rạp phim
INSERT INTO tblRapphim090 (id, ten, diachi, mota)
VALUES (1, 'Rạp Phim Galaxy', '123 Đường ABC, Quận 1, TP.HCM', 'Rạp phim chất lượng cao với hệ thống âm thanh và màn hình hiện đại.');

-- Thêm 5 phim
INSERT INTO tblPhim090 (id, ten, daodien, thoiLuong, mota, dangchieu)
VALUES
(1, 'Phim A', 'Đạo diễn 1', 120, 'Một bộ phim hấp dẫn.', TRUE),
(2, 'Phim B', 'Đạo diễn 2', 95, 'Một bộ phim kinh dị.', TRUE),
(3, 'Phim C', 'Đạo diễn 3', 110, 'Phim hành động gay cấn.', TRUE),
(4, 'Phim D', 'Đạo diễn 4', 105, 'Phim hài lãng mạn.', TRUE),
(5, 'Phim E', 'Đạo diễn 5', 130, 'Phim tâm lý gia đình.', FALSE);

-- Thêm 5 phòng chiếu
INSERT INTO tblPhong090 (id, ten, succhua, mota, tblRapphim090id)
VALUES
(1, 'Phòng 1', 100, 'Phòng chiếu lớn.', 1),
(2, 'Phòng 2', 80, 'Phòng chiếu chuẩn 4D.', 1),
(3, 'Phòng 3', 120, 'Phòng chiếu VIP.', 1),
(4, 'Phòng 4', 60, 'Phòng chiếu nhỏ.', 1),
(5, 'Phòng 5', 90, 'Phòng chiếu tiêu chuẩn.', 1);

-- Thêm 8 lịch chiếu
INSERT INTO tblLichchieu090 (giobatdau, gioketthuc, tblPhim090id, tblPhong090id)
VALUES
('2024-11-01 09:00:00', '2024-11-01 11:00:00', 1, 1),
('2024-11-01 13:00:00', '2024-11-01 15:00:00', 2, 2),
('2024-11-01 16:00:00', '2024-11-01 18:00:00', 3, 3),
('2024-11-01 18:30:00', '2024-11-01 20:30:00', 4, 4),
('2024-11-02 10:00:00', '2024-11-02 12:00:00', 5, 5),
('2024-11-02 14:00:00', '2024-11-02 16:00:00', 1, 2),
('2024-11-02 17:00:00', '2024-11-02 19:00:00', 3, 1),
('2024-11-02 20:00:00', '2024-11-02 22:00:00', 2, 3);





-- Stored Procedure: Phimtheotukhoa
DELIMITER //
CREATE PROCEDURE Phimtheotukhoa(IN tukhoa VARCHAR(255))
BEGIN
    SELECT id, ten, daodien, thoiluong, mota
    FROM tblPhim090
    WHERE ten LIKE CONCAT('%', tukhoa, '%')
       OR mota LIKE CONCAT('%', tukhoa, '%');
END //
DELIMITER ;

-- Stored Procedure: Phimdangchieu
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `Phimdangchieu`()
BEGIN
    SELECT id, ten, daodien, thoiluong, mota
    FROM tblPhim090
    WHERE dangchieu = TRUE;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE Phongtrong(IN giobatdau DATETIME, IN gioketthuc DATETIME)
BEGIN
    SELECT p.id, p.ten, p.succhua, p.mota
    FROM tblPhong090 p
    WHERE p.id NOT IN (
        SELECT l.tblPhong090id
        FROM tblLichchieu090 l
        WHERE (l.giobatdau < gioketthuc) AND (l.gioketthuc > giobatdau)
    );
END //
DELIMITER ;


-- CALL Phimtheotukhoa('phim');
-- CALL Phimdangchieu();
-- CALL Phongtrong('2024-11-02 15:00:00', '2024-11-02 17:00:00');

INSERT INTO tblLichchieu090 (giobatdau, gioketthuc, tblPhim090id, tblPhong090id)
VALUES
('2024-11-01 09:00:00', '2024-11-01 11:00:00', 1, 2);
