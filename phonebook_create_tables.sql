-- --------------------------------------------------------
--
-- Banco de dados: `phonebook`
--
-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_groups`
--
CREATE TABLE `tb_groups` (
  `tb_groups-id` int(11) NOT NULL AUTO_INCREMENT,
  `tb_groups-name` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`tb_groups-id`),
  UNIQUE KEY `tb_groups-name` (`tb_groups-name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
-- Inserção dos dados iniciais
INSERT INTO `tb_groups` (`tb_groups-id`, `tb_groups-name`, `created`, `modified`) VALUES (NULL, 'superuser', '2022-08-30 00:00:00', current_timestamp());
INSERT INTO `tb_groups` (`tb_groups-id`, `tb_groups-name`, `created`, `modified`) VALUES (NULL, 'user', '2022-08-30 00:00:00', current_timestamp());

--
-- Estrutura para tabela `tb_users`
--
CREATE TABLE `tb_users` (
  `tb_users-id` int(11) NOT NULL AUTO_INCREMENT,
  `tb_users-name` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `tb_users-phone` varchar(15) COLLATE utf8_swedish_ci NOT NULL,
  `tb_users-email` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `tb_users-pwd` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `group_id` int(11) NOT NULL DEFAULT 2,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL DEFAULT current_timestamp(),
	PRIMARY KEY (`tb_users-id`),
	UNIQUE KEY `tb_users-email` (`tb_users-email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
-- Inserção dos dados iniciais
INSERT INTO `tb_users` (`tb_users-id`, `tb_users-name`, `tb_users-phone`, `tb_users-email`, `tb_users-pwd`, `group_id`, `created`, `modified`) VALUES (NULL, 'Administrador do sistema', '(85) 98899-8844', 'calbertofilho@gmail.com', SHA2('21251120', 256), '1', '2022-08-30 00:00:00', current_timestamp());

--
-- Índices de tabela `tb_users`
--
ALTER TABLE `tb_users`
  ADD CONSTRAINT `fk_groups`
  FOREIGN KEY (`group_id`)
  REFERENCES `tb_groups` (`tb_groups-id`)
	ON DELETE SET NULL
	ON UPDATE CASCADE;
