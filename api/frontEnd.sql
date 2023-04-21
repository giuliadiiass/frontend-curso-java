-- ---------------------------------
-- Frontend - Banco de dados
-- By Giulia Dias
-- MIT License
-- 
-- Modela o banco de dados da API do aplicativo.
-- ---------------------------------

-- Apaga o banco de dados caso ele exista.
-- IMPORTANTE! Só faça isso em momento de desenvolvimento.
-- Nunca use este código em produção.
DROP DATABASE IF EXISTS frontendeiros;

-- Cria o banco de dados com caracteres utf8 e buscas case-insensitive.
CREATE DATABASE frontend CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

-- Seleciona o banco de dados para as próximas interações.
USE frontend;

-- Cria tabela dos contatos → contacts.
CREATE TABLE contacts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    subject VARCHAR(255) NOT NULL,
    message TEXT NOT NULL,
    status ENUM ('received', 'readed', 'responded', 'deleted') DEFAULT 'received'
);

-- Cria a tabela de usuários → users.
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    user_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    user_name VARCHAR(255) NOT NULL,
    user_email VARCHAR(255) NOT NULL,
    user_photo VARCHAR(255) COMMENT 'URL da imagem.',
    user_bio VARCHAR(255),
    user_birth DATE,
    user_type ENUM('user', 'moderator', 'author', 'admin') DEFAULT 'user',
    user_status ENUM('on', 'off', 'ban', 'del') DEFAULT 'on'
);

-- Cria a tabela de artigos → articles.
CREATE TABLE articles (
    art_id INT PRIMARY KEY AUTO_INCREMENT,
    art_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    art_author INT NOT NULL,
    art_title VARCHAR(127) NOT NULL,
    art_thumbnail VARCHAR(255) COMMENT 'URL da imagem.',
    art_resume VARCHAR(127) NOT NULL,
    art_content TEXT NOT NULL,
    art_views INT DEFAULT 0,
    art_status ENUM('on', 'off', 'del') DEFAULT 'on',
    FOREIGN KEY (art_author) REFERENCES users (user_id)
);

-- Cria a tabela de comentários → comments.
CREATE TABLE comments (
    cmt_id INT PRIMARY KEY AUTO_INCREMENT,
    cmt_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    cmt_author INT NOT NULL,
    cmt_article INT NOT NULL,
    cmt_comment TEXT NOT NULL,
    cmt_status ENUM('on', 'off', 'del') DEFAULT 'on',
    FOREIGN KEY (cmt_author) REFERENCES users (user_id),
    FOREIGN KEY (cmt_article) REFERENCES articles (art_id)
);

-- Lista de redes sociais dos usuários → social.
CREATE TABLE social (
    scl_id INT PRIMARY KEY AUTO_INCREMENT,
    scl_user INT NOT NULL,
    scl_name VARCHAR(127) NOT NULL,
    scl_link VARCHAR(255) NOT NULL,
    scl_status ENUM('on', 'off', 'del') DEFAULT 'on',
    FOREIGN KEY (scl_user) REFERENCES users (user_id) 
);

-- ---- --
-- CRUD --
-- ---- --

-- Insere vários registros na tabela 'contacts'.
INSERT INTO contacts 
    ( name, email, subject, message )
VALUES 
    ('Giulia Dias', 'giulia@dias.com', 'Erro', 'Não consigo me cadastrar.'),
    ('Setembrino', 'set@brino.com.br', 'biscoito', 'Biscoito não é bolacha.'),
    ('Maricleuza', 'mari@cleuza.net', 'bolacha', 'Bolacha é biscoito são a mesma coisa.');

-- Insere dados na tabela 'users'.
INSERT INTO users (
    user_name,
    user_email,
    user_photo,
    user_bio,
    user_birth
) VALUES(
    'Giulia Dias',
    'giulia@dias.com',
    'https://randomuser.me/api/portraits/men/33.jpg',
    'programadora e enroladora',
    '2004-08-27'
);

-- Insere dados na tabela 'users'.
-- Somente campos "not null".
INSERT INTO users (
    user_name,
    user_email
) VALUES (
    'Setembrino',
    'set@brino.com.br'
);

-- Insere dados na tabela 'users'.
-- Somente o 'name'.
INSERT INTO users (
    user_name
) VALUES (
    'Hermenilda'
);

--- Insere artigos na tabela 'articles'.
INSERT INTO articles (
    art_author,
    art_title,
    art_thumbnail,
    art_resume,
    art_content
) VALUES (
    '1',
    'Primeiro artigo da parada',
    'https://picsum.photos/200',
    'Este é o primeiro artigo do nosso blog.',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas a ultrices leo. Vivamus in suscipit quam. Sed posuere erat non massa vehicula laoreet.'
);

--- Insere artigos na tabela 'articles'.
INSERT INTO articles (
    art_author,
    art_title,
    art_thumbnail,
    art_resume,
    art_content
) VALUES (
    '1',
    'Primeiro artigo da parada',
    'https://picsum.photos/200',
    'Este é o primeiro artigo do nosso blog.',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas a ultrices leo. Vivamus in suscipit quam. Sed posuere erat non massa vehicula laoreet.'
);

-- Insere artigos na tabela 'articles'.
INSERT INTO articles (
    art_author,
    art_title,
    art_thumbnail,
    art_resume,
    art_content
) VALUES (
    '1',
    'Segundo artigo da parada',
    'https://picsum.photos/201',
    'Este é o segundo artigo do nosso blog.',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas a ultrices leo. Vivamus in suscipit quam. Sed posuere erat non massa vehicula laoreet.'
);

-- Atividade
-- 1) Insira pelo menos mais 2 artigos.
-- 2) Insira pelo menos 2 comentários de usuários diferentes para um mesmo artigo.

-- atividade.

INSERT INTO articles (
    art_author,
    art_title,
    art_thumbnail,
    art_resume,
    art_content
) VALUES (
    '1',
    'terceiro artigo',
    'https://picsum.photos/207',
    'Este é o terceiro artigo do nosso blog.',
    'In porta, lacus id consectetur interdum, ipsum nisi maximus tellus, nec tristique lorem libero quis felis. Duis tempus, ligula a venenatis lobortis, enim nibh ultrices enim, ut suscipit enim nulla sed metus. Mauris volutpat euismod neque, et efficitur purus dignissim non. Proin commodo tincidunt dolor sed cursus. Aliquam et eros non dolor viverra pretium. Maecenas id orci ligula. Suspendisse sodales cursus metus, eu hendrerit sapien lobortis a. Pellentesque accumsan ac risus non commodo. Nunc non est gravida, faucibus neque quis, volutpat felis. Cras accumsan dolor eget ex ultricies, pretium tincidunt massa auctor.'
); 

INSERT INTO articles (
    art_author,
    art_title,
    art_thumbnail,
    art_resume,
    art_content
) VALUES (
    '1',
    'quarto artigo',
    'https://picsum.photos/208',
    'Este é o terceiro artigo do nosso blog.',
    'Cras nec ipsum quam. Suspendisse accumsan nunc nec mi porta, quis faucibus arcu sodales. Sed vehicula nisl malesuada lacus pellentesque faucibus. Etiam pretium tempor eros, sit amet ultrices velit porta id. Maecenas vitae neque eget elit fermentum iaculis. Sed at nibh purus. Vestibulum eget malesuada dui.'
);
-- Cria a tabela de comentários → comments.
CREATE TABLE comments (
    cmt_id INT PRIMARY KEY AUTO_INCREMENT,
    cmt_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    cmt_author INT NOT NULL,
    cmt_article INT NOT NULL,
    cmt_comment TEXT NOT NULL,
    cmt_status ENUM('on', 'off', 'del') DEFAULT 'on',
    FOREIGN KEY (cmt_author) REFERENCES users (user_id),
    FOREIGN KEY (cmt_article) REFERENCES articles (art_id)
);