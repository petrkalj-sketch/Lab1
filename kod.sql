DROP TABLE IF EXISTS Characters CASCADE;
DROP TABLE IF EXISTS Users CASCADE;-- Создание главной таблицы "Пользователи"
CREATE TABLE Users (
    user_id SERIAL PRIMARY KEY,          -- Первичный ключ с автоинкрементом
    email VARCHAR(255) NOT NULL UNIQUE,  -- Электронная почта, не может быть пустой
    login VARCHAR(50) NOT NULL UNIQUE,   -- Логин, уникальный
    password VARCHAR(255) NOT NULL,      -- Пароль
    nickname VARCHAR(50) NOT NULL,       -- Никнейм
    user_level INT NOT NULL DEFAULT 1    -- Уровень пользователя
);

-- Создание зависимой таблицы "Персонажи"
CREATE TABLE Characters (
    character_id SERIAL PRIMARY KEY,         -- Первичный ключ
    user_id INT NOT NULL,                    -- Внешний ключ (ссылка на пользователя)
    character_name VARCHAR(100) NOT NULL,    -- Имя персонажа
    character_history TEXT,                  -- История персонажа
    character_level INT NOT NULL DEFAULT 1,  -- Уровень персонажа
    special_skills TEXT,                     -- Особые умения
    -- Обеспечение ссылочной целостности с каскадным обновлением и удалением
    FOREIGN KEY (user_id) REFERENCES Users(user_id) 
        ON DELETE CASCADE 
        ON UPDATE CASCADE
);

INSERT INTO Users (email, login, password, nickname, user_level) VALUES
('user1@mail.ru', 'player1', 'pass123', 'DragonSlayer', 5),
('user2@mail.ru', 'player2', 'pass456', 'Shadow', 10),
('user3@mail.ru', 'player3', 'pass789', 'Mage', 3),
('user4@mail.ru', 'player4', 'qwerty', 'Warrior', 7),
('user5@mail.ru', 'player5', 'asdfgh', 'Archer', 2),
('user6@mail.ru', 'player6', 'zxcvbn', 'Healer', 8),
('user7@mail.ru', 'player7', '123456', 'Rogue', 4),
('user8@mail.ru', 'player8', '654321', 'Paladin', 12),
('user9@mail.ru', 'player9', 'admin', 'Admin', 20),
('user10@mail.ru', 'player10', 'root', 'Root', 1);

INSERT INTO Characters (user_id, character_name, character_history, character_level, special_skills) VALUES
(1, 'Aragorn', 'Наследник древнего рода', 15, 'Меч и лечение'),
(1, 'Legolas', 'Эльф-лучник', 12, 'Точная стрельба'),
(2, 'Gandalf', 'Мудрый маг', 20, 'Огненные шары'),
(3, 'Frodo', 'Хранитель кольца', 5, 'Скрытность'),
(4, 'Gimli', 'Гном-воин', 10, 'Топор и стойкость'),
(5, 'Boromir', 'Сын наместника', 8, 'Защита'),
(6, 'Sam', 'Верный садовник', 7, 'Выносливость'),
(7, 'Merry', 'Хоббит-храбрец', 4, 'Ловкость'),
(8, 'Pippin', 'Веселый хоббит', 3, 'Удача'),
(9, 'Sauron', 'Темный властелин', 100, 'Темная магия');