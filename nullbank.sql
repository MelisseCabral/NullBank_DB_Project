-- MySQL Script generated by MySQL Workbench
-- Mon Dec  4 22:46:07 2017
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema NullBank
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `NullBank` ;

-- -----------------------------------------------------
-- Schema NullBank
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `NullBank` DEFAULT CHARACTER SET utf8 ;
SHOW WARNINGS;
USE `NullBank` ;

-- -----------------------------------------------------
-- Table `Endereco`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Endereco` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Endereco` (
  `idEndereco` INT NOT NULL AUTO_INCREMENT,
  `CEP` VARCHAR(45) NULL,
  `Endereco` VARCHAR(45) NULL,
  `Complemento` VARCHAR(45) NULL,
  `Numero` VARCHAR(45) NULL,
  `Cidade` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEndereco`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Agencia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Agencia` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Agencia` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Nome_agencia` VARCHAR(45) NOT NULL,
  `Salario_Montante_Total` FLOAT NOT NULL,
  `idEndereco` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Funcionario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Funcionario` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Funcionario` (
  `matricula` INT NOT NULL AUTO_INCREMENT,
  `nome_func` VARCHAR(45) NOT NULL,
  `Senha` VARCHAR(45) NOT NULL,
  `Sexo` VARCHAR(45) NOT NULL,
  `Data_nasc` DATE NOT NULL,
  `Salario` VARCHAR(45) NOT NULL DEFAULT ' >= 1500',
  `idEndereco` INT NOT NULL,
  `idAgencia` INT NOT NULL,
  PRIMARY KEY (`matricula`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Dependente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Dependente` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Dependente` (
  `Nome_dependente` VARCHAR(45) NOT NULL,
  `Data_nasc` DATE NOT NULL,
  `Idade` INT NOT NULL,
  `func_matricula` INT NOT NULL,
  `parentesco` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Nome_dependente`, `func_matricula`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Cliente` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Cliente` (
  `CPF` VARCHAR(13) NOT NULL,
  `Nome_cliente` VARCHAR(45) NOT NULL,
  `RG` VARCHAR(45) NOT NULL,
  `Data_nasc` DATE NOT NULL,
  `idEndereco` INT NOT NULL,
  PRIMARY KEY (`CPF`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Cargo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Cargo` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Cargo` (
  `nome_cargo` VARCHAR(45) NOT NULL,
  `Funcionario_matricula` INT NOT NULL,
  PRIMARY KEY (`nome_cargo`, `Funcionario_matricula`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Gerente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Gerente` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Gerente` (
  `nome_cargo` VARCHAR(45) NOT NULL,
  `gerente_matricula` INT NOT NULL,
  PRIMARY KEY (`nome_cargo`, `gerente_matricula`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `ClienteAgencia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ClienteAgencia` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `ClienteAgencia` (
  `IdAgencia` INT NOT NULL,
  `CPF_Cliente` VARCHAR(13) NOT NULL,
  `idCliente_Agencia` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCliente_Agencia`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Conta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Conta` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Conta` (
  `num_conta` INT NOT NULL AUTO_INCREMENT,
  `saldo` FLOAT NOT NULL,
  `senha` VARCHAR(8) NOT NULL,
  `gerente_matricula` INT NOT NULL,
  `idAgenciaCliente` VARCHAR(45) NOT NULL,
  `conjunta` VARCHAR(10) NULL,
  `TipoConta_cliente` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`num_conta`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Transacao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Transacao` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Transacao` (
  `num_transacao` INT NOT NULL AUTO_INCREMENT,
  `data_hora` DATE NOT NULL,
  `valor` FLOAT NOT NULL,
  `tipo_transacao` VARCHAR(45) NOT NULL,
  `conta_num_conta_efeito` INT NOT NULL,
  `Conta_num_conta_efetuante` INT NOT NULL,
  PRIMARY KEY (`num_transacao`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `TipoConta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `TipoConta` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `TipoConta` (
  `nomeTipo` VARCHAR(45) NOT NULL,
  `num_conta` INT NOT NULL,
  PRIMARY KEY (`nomeTipo`, `num_conta`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `ContaPoupança`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ContaPoupança` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `ContaPoupança` (
  `nomeTipo` VARCHAR(45) NOT NULL,
  `num_conta` INT NOT NULL,
  `taxa_de_juros` FLOAT NOT NULL,
  PRIMARY KEY (`nomeTipo`, `num_conta`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `ContaEspecial`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ContaEspecial` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `ContaEspecial` (
  `nomeTipo` VARCHAR(45) NOT NULL,
  `num_conta` INT NOT NULL,
  `credito` FLOAT NOT NULL,
  PRIMARY KEY (`nomeTipo`, `num_conta`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Atendente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Atendente` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Atendente` (
  `nome_cargo` VARCHAR(45) NOT NULL,
  `func_matricula` INT NOT NULL,
  PRIMARY KEY (`nome_cargo`, `func_matricula`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Caixa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Caixa` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Caixa` (
  `nome_cargo` VARCHAR(45) NOT NULL,
  `func_matricula` INT NOT NULL,
  PRIMARY KEY (`nome_cargo`, `func_matricula`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `ContaCorrente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ContaCorrente` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `ContaCorrente` (
  `nomeTipo` VARCHAR(45) NOT NULL,
  `num_conta` INT NOT NULL,
  PRIMARY KEY (`nomeTipo`, `num_conta`))
ENGINE = InnoDB;

SHOW WARNINGS;
USE `NullBank` ;

-- -----------------------------------------------------
-- View `vw_funcionario_agencia`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `vw_funcionario_agencia` ;
SHOW WARNINGS;
USE `NullBank`;
CREATE 
     OR REPLACE ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
    
VIEW `vw_funcionario_agencia` AS
    SELECT
        `Funcionario`.`nome_func` AS `nome_func`,
        `Funcionario`.`Salario` AS `Salario`,
        `Funcionario`.`Sexo` AS `sexo`,
        `Funcionario`.`matricula` AS `matricula`,
        `Endereco`.`Cidade` AS `cidade`,
        `Endereco`.`Numero` AS `numero`,
        `Endereco`.`CEP` AS `cep`,
        `Cargo`.`nome_cargo` AS `nome_cargo`,
        `Agencia`.`id` AS `idAgencia`,
        `Agencia`.`Nome_agencia` AS `nome_agencia`
    FROM
        (`Funcionario` INNER JOIN `Endereco` ON (`Funcionario`.`idEndereco` = `Endereco`.`idEndereco`)
         INNER JOIN `Cargo` ON (`Funcionario`.`matricula` = `Cargo`.`Funcionario_matricula`) INNER JOIN `Agencia` ON (`Agencia`.`id` = `Funcionario`.`idAgencia`));
SHOW WARNINGS;

-- -----------------------------------------------------
-- View `vw_contas_especiais`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `vw_contas_especiais` ;
SHOW WARNINGS;
USE `NullBank`;
CREATE 
     OR REPLACE ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `vw_contas_especiais` AS
    SELECT 
        `Conta`.`num_conta` AS `num_conta`,
        `Conta`.`saldo` AS `saldo`,
        `TipoConta`.`nomeTipo` AS `tipoconta`
    FROM
        `Conta` INNER JOIN `TipoConta` ON (`TipoConta`.`num_conta` = `Conta`.`num_conta`)
    WHERE
        (`TipoConta`.`nomeTipo` = 'Conta Especial')
    ORDER BY `Conta`.`saldo`;
SHOW WARNINGS;

-- -----------------------------------------------------
-- View `vw_poupanca`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `vw_poupanca` ;
SHOW WARNINGS;
USE `NullBank`;
CREATE 
     OR REPLACE ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `vw_poupanca` AS
    SELECT 
        `Conta`.`num_conta` AS `num_conta`,
        `Conta`.`saldo` AS `saldo`,
        `TipoConta`.`nomeTipo` AS `tipoconta`
    FROM
        `Conta` INNER JOIN `TipoConta` ON (`TipoConta`.`num_conta` = `Conta`.`num_conta`)
    WHERE
        (`TipoConta`.`nomeTipo` = 'Conta Poupança')
    ORDER BY `Conta`.`saldo` DESC;
SHOW WARNINGS;

-- -----------------------------------------------------
-- View `vw_cliente_agencia`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `vw_cliente_agencia` ;
SHOW WARNINGS;
USE `NullBank`;
CREATE 
     OR REPLACE ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `vw_cliente_agencia` AS
    SELECT 
        `Cliente`.`Nome_cliente` AS `nome_cliente`,
        `Agencia`.`Nome_agencia` AS `Nome_agencia`,
        `Conta`.`num_conta` AS `Numero de conta`,
        `TipoConta`.`nomeTipo` AS `tipoconta`
    FROM
        `ClienteAgencia`
        JOIN `Cliente` ON (`ClienteAgencia`.`CPF_Cliente` = `Cliente`.`CPF`)
        JOIN `Agencia` ON (`ClienteAgencia`.`IdAgencia` = `Agencia`.`id`)
        JOIN `Conta` ON (`ClienteAgencia`.`idCliente_Agencia` = `Conta`.`idAgenciaCliente`)
        INNER JOIN `TipoConta` ON (`TipoConta`.`num_conta` = `Conta`.`num_conta`);
SHOW WARNINGS;

-- -----------------------------------------------------
-- View `vw_agencia_gerente`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `vw_agencia_gerente` ;
SHOW WARNINGS;
USE `NullBank`;
CREATE 
     OR REPLACE ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `vw_agencia_gerente` AS
    SELECT 
        `agencia`.`Nome_agencia` AS `Nome_agencia`,
        `funcionario`.`nome_func` AS `gerente`
    FROM
        ((`funcionario`
        JOIN `agencia` ON ((`funcionario`.`idAgencia` = `agencia`.`id`)))
        JOIN `cargo` ON ((`funcionario`.`matricula` = `cargo`.`Funcionario_matricula`)))
    ORDER BY `funcionario`.`nome_func`;
SHOW WARNINGS;

-- -----------------------------------------------------
-- View `vw_cliente_cidade`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `vw_cliente_cidade` ;
SHOW WARNINGS;
USE `NullBank`;
CREATE 
     OR REPLACE ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `vw_cliente_cidade` AS
    SELECT 
        `cliente`.`Nome_cliente` AS `Nome`,
        `endereco`.`Endereco` AS `Endereço`,
        `endereco`.`Numero` AS `Numero`,
        `endereco`.`Cidade` AS `Cidade`
    FROM
        (`cliente`
        JOIN `endereco` ON ((`cliente`.`idEndereco` = `endereco`.`idEndereco`)));
SHOW WARNINGS;

-- -----------------------------------------------------
-- View `vw_cliente_conta_conjunta`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `vw_cliente_conta_conjunta` ;
SHOW WARNINGS;
USE `NullBank`;
CREATE 
     OR REPLACE ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `vw_cliente_conta_conjunta` AS
    SELECT 
        `cliente`.`Nome_cliente` AS `Nome_cliente`,
        `cliente`.`CPF` AS `CPF`,
        `conta`.`conjunta` AS `conjunta`
    FROM
        ((`clienteagencia`
        JOIN `cliente` ON ((`clienteagencia`.`CPF_Cliente` = `cliente`.`CPF`)))
        JOIN `conta` ON ((`clienteagencia`.`idCliente_Agencia` = `conta`.`idAgenciaCliente`)))
    ORDER BY `conta`.`conjunta`;
SHOW WARNINGS;

-- -----------------------------------------------------
-- View `vw_cliente_saldo`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `vw_cliente_saldo` ;
SHOW WARNINGS;
USE `NullBank`;
CREATE 
     OR REPLACE ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `vw_cliente_saldo` AS
    SELECT 
        `tipoconta`.`nomeTipo` AS `Conta`,
        `conta`.`saldo` AS `saldo`
    FROM
        (`conta`
        JOIN `tipoconta` ON ((`conta`.`num_conta` = `tipoconta`.`num_conta`)));
SHOW WARNINGS;

-- -----------------------------------------------------
-- View `vw_dados_funcionarios`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `vw_dados_funcionarios` ;
SHOW WARNINGS;
USE `NullBank`;
create  OR REPLACE view vw_dados_funcionarios
as select nome_func as Nome_funcionario, salario , Cidade,Endereco, numero,cep,  Nome_agencia as Agencia, nome_cargo, Funcionario_matricula
from funcionario 
inner join Endereco 
on funcionario.idEndereco = Endereco.idEndereco 
inner join Agencia 
on funcionario.idAgencia = Agencia.id
inner join cargo 
on funcionario.matricula = cargo.funcionario_matricula
order by Nome_cargo;
SHOW WARNINGS;

-- -----------------------------------------------------
-- View `vw_Agencia_Funcionario`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `vw_Agencia_Funcionario` ;
SHOW WARNINGS;
USE `NullBank`;
create  OR REPLACE view vw_Agencia_Funcionario
as select Nome_agencia, Salario_Montante_Total 
from Agencia 
order by Salario_Montante_total asc;
SHOW WARNINGS;

-- -----------------------------------------------------
-- View `vw_funcionario_dependente`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `vw_funcionario_dependente` ;
SHOW WARNINGS;
USE `NullBank`;
create  OR REPLACE view vw_funcionario_dependente 
as select nome_func As funcionario, Salario, nome_cargo, cidade, cep, endereco, numero, Nome_dependente as Dependente
from funcionario 
inner join  cargo 
on  funcionario.matricula= cargo.Funcionario_matricula
inner  join Dependente
on funcionario.matricula = Dependente.func_matricula
inner join Endereco
on Funcionario.idEndereco = Endereco.idEndereco
Order by Nome_dependente asc;
SHOW WARNINGS;

-- -----------------------------------------------------
-- View `vw_contas_agencia`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `vw_contas_agencia` ;
SHOW WARNINGS;
USE `NullBank`;
CREATE 
     OR REPLACE ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `vw_contas_agencia` AS
    SELECT 
        `conta`.`num_conta` AS `num_conta`,
        `conta`.`saldo` AS `saldo`,
        `tipoconta`.`nomeTipo` AS `tipoconta`,
        `funcionario`.`matricula` AS `Matricula Gerente`,
        `funcionario`.`nome_func` AS `Nome Gerente`,
        `cliente`.`Nome_cliente` AS `Nome_cliente`,
        `cliente`.`CPF` AS `CPF`,
        `agencia`.`id` AS `idAgencia`,
        `agencia`.`Nome_agencia` AS `nome_agencia`
    FROM
        (((((`conta`
        JOIN `clienteagencia` ON ((`clienteagencia`.`idCliente_Agencia` = `conta`.`idAgenciaCliente`)))
        JOIN `funcionario` ON ((`funcionario`.`matricula` = `conta`.`gerente_matricula`)))
        JOIN `agencia` ON ((`agencia`.`id` = `clienteagencia`.`IdAgencia`)))
        JOIN `cliente` ON ((`cliente`.`CPF` = `clienteagencia`.`CPF_Cliente`)))
        JOIN `tipoconta` ON ((`tipoconta`.`num_conta` = `conta`.`num_conta`)))
    ORDER BY `conta`.`saldo` DESC;
SHOW WARNINGS;
USE `NullBank`;

DELIMITER $$

USE `NullBank`$$
DROP TRIGGER IF EXISTS `sal_minimo` $$
SHOW WARNINGS$$
USE `NullBank`$$
create trigger sal_minimo 
Before insert 
on funcionario
for each row
 begin
   if New.Salario is not null and New.Salario < 1500 then 
   set New.Salario=1500;
   END IF;
end;$$

SHOW WARNINGS$$

USE `NullBank`$$
DROP TRIGGER IF EXISTS `tg_montante_ag` $$
SHOW WARNINGS$$
USE `NullBank`$$
create trigger tg_montante_ag 
  after insert on funcionario 
   for each row 
  update Agencia 
  set Salario_Montante_Total = Salario_Montante_Total + New.Salario
  where id=new.idAgencia;$$

SHOW WARNINGS$$

USE `NullBank`$$
DROP TRIGGER IF EXISTS `tg_decremetar_montante_ag_` $$
SHOW WARNINGS$$
USE `NullBank`$$
create trigger tg_decremetar_montante_ag_
  after delete on funcionario 
   for each row 
  update Agencia 
  set Salario_Montante_Total = Salario_Montante_Total - old.Salario
  where id= old.idAgencia;$$

SHOW WARNINGS$$

USE `NullBank`$$
DROP TRIGGER IF EXISTS `Transacao_BEFORE_INSERT` $$
SHOW WARNINGS$$
USE `NullBank`$$
CREATE DEFINER = CURRENT_USER TRIGGER `NullBank`.`Transacao_BEFORE_INSERT` BEFORE INSERT ON `Transacao` FOR EACH ROW
BEGIN
END$$

SHOW WARNINGS$$

DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `Endereco`
-- -----------------------------------------------------
START TRANSACTION;
USE `NullBank`;
INSERT INTO `Endereco` (`idEndereco`, `CEP`, `Endereco`, `Complemento`, `Numero`, `Cidade`) VALUES (, '62010010', 'Rua Liberato Barroso', 'Ed.Luzia', '291', 'São Paulo');
INSERT INTO `Endereco` (`idEndereco`, `CEP`, `Endereco`, `Complemento`, `Numero`, `Cidade`) VALUES (, '99445235', 'Rua Benedito Alves', 'cond.Santa Isabel', '305', 'Fortaleza');
INSERT INTO `Endereco` (`idEndereco`, `CEP`, `Endereco`, `Complemento`, `Numero`, `Cidade`) VALUES (, '10245785', 'Rua General Sampaio', 'centro ', '201', 'Sobral');
INSERT INTO `Endereco` (`idEndereco`, `CEP`, `Endereco`, `Complemento`, `Numero`, `Cidade`) VALUES (, '60410001', 'Avenida Professor Gomes De Matos', 'centro', '1501', 'Cabedal');
INSERT INTO `Endereco` (`idEndereco`, `CEP`, `Endereco`, `Complemento`, `Numero`, `Cidade`) VALUES (, '60351000', 'Abrahão Otoch e Cia', 'centro', '1524', 'Campina Grande');
INSERT INTO `Endereco` (`idEndereco`, `CEP`, `Endereco`, `Complemento`, `Numero`, `Cidade`) VALUES (, '60874170', 'Rua São Leopoldo', 'centro', '1285', 'Irecê');
INSERT INTO `Endereco` (`idEndereco`, `CEP`, `Endereco`, `Complemento`, `Numero`, `Cidade`) VALUES (, '60440820', 'Rua General João Couto', 'centro', '550', 'Salvador');
INSERT INTO `Endereco` (`idEndereco`, `CEP`, `Endereco`, `Complemento`, `Numero`, `Cidade`) VALUES (, '60420720', 'Rua Romeu Martins', 'centro', '85', 'João Pessoa');
INSERT INTO `Endereco` (`idEndereco`, `CEP`, `Endereco`, `Complemento`, `Numero`, `Cidade`) VALUES (, '50021456', 'Rua Floriano Peixoto', 'São Luiz', '312', 'Fortaleza');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Agencia`
-- -----------------------------------------------------
START TRANSACTION;
USE `NullBank`;
INSERT INTO `Agencia` (`id`, `Nome_agencia`, `Salario_Montante_Total`, `idEndereco`) VALUES (, 'NullBank Cabedelo', 5000, 0001);
INSERT INTO `Agencia` (`id`, `Nome_agencia`, `Salario_Montante_Total`, `idEndereco`) VALUES (, 'NullBank Sobral', 11500, 0002);
INSERT INTO `Agencia` (`id`, `Nome_agencia`, `Salario_Montante_Total`, `idEndereco`) VALUES (, 'NullBank Fortaleza', 12314, 0003);
INSERT INTO `Agencia` (`id`, `Nome_agencia`, `Salario_Montante_Total`, `idEndereco`) VALUES (, 'NullBank', 23124, 0004);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Funcionario`
-- -----------------------------------------------------
START TRANSACTION;
USE `NullBank`;
INSERT INTO `Funcionario` (`matricula`, `nome_func`, `Senha`, `Sexo`, `Data_nasc`, `Salario`, `idEndereco`, `idAgencia`) VALUES (DEFAULT, 'João das Neves', '12345', 'Masculino', '1970/08/16', '1500', 0001, 0);
INSERT INTO `Funcionario` (`matricula`, `nome_func`, `Senha`, `Sexo`, `Data_nasc`, `Salario`, `idEndereco`, `idAgencia`) VALUES (DEFAULT, 'Michele Pequena', '21546', 'Feminino', '1990/11/01', '2000', 0002, 1);
INSERT INTO `Funcionario` (`matricula`, `nome_func`, `Senha`, `Sexo`, `Data_nasc`, `Salario`, `idEndereco`, `idAgencia`) VALUES (DEFAULT, 'Pedro Chaves', '89562', 'Masculino', '1980/10/02', '1750', 0003, 2);
INSERT INTO `Funcionario` (`matricula`, `nome_func`, `Senha`, `Sexo`, `Data_nasc`, `Salario`, `idEndereco`, `idAgencia`) VALUES (DEFAULT, 'João Antonio', '78451', 'Masculino', '1985/07/12', '1900', 0004, 0);
INSERT INTO `Funcionario` (`matricula`, `nome_func`, `Senha`, `Sexo`, `Data_nasc`, `Salario`, `idEndereco`, `idAgencia`) VALUES (DEFAULT, 'Heitor Freitas', '25896', 'Masculino', '1996/01/01', '5000', 0005, 1);
INSERT INTO `Funcionario` (`matricula`, `nome_func`, `Senha`, `Sexo`, `Data_nasc`, `Salario`, `idEndereco`, `idAgencia`) VALUES (DEFAULT, 'Artur José', '74589', 'Masculino', '1993/07/07', '10000', 0006, 3);
INSERT INTO `Funcionario` (`matricula`, `nome_func`, `Senha`, `Sexo`, `Data_nasc`, `Salario`, `idEndereco`, `idAgencia`) VALUES (DEFAULT, 'Diego Rafael', '12469', 'Maculino', '1994/08/20', '8000', 0007, 1);
INSERT INTO `Funcionario` (`matricula`, `nome_func`, `Senha`, `Sexo`, `Data_nasc`, `Salario`, `idEndereco`, `idAgencia`) VALUES (DEFAULT, 'Bartolomeu Dias', '12458', 'Masculino', '1984/01/02', '1500', 0008, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Dependente`
-- -----------------------------------------------------
START TRANSACTION;
USE `NullBank`;
INSERT INTO `Dependente` (`Nome_dependente`, `Data_nasc`, `Idade`, `func_matricula`, `parentesco`) VALUES ('Daniel de Albuquerque Adrada', '1989/12/01', 28, 1234, '0');
INSERT INTO `Dependente` (`Nome_dependente`, `Data_nasc`, `Idade`, `func_matricula`, `parentesco`) VALUES ('Diogo Pereira ', '1989/01/12', 28, 4567, '1');
INSERT INTO `Dependente` (`Nome_dependente`, `Data_nasc`, `Idade`, `func_matricula`, `parentesco`) VALUES ('Pedro Ferreira', '2001/02/25', 16, 8910, '0');
INSERT INTO `Dependente` (`Nome_dependente`, `Data_nasc`, `Idade`, `func_matricula`, `parentesco`) VALUES ('Rafael feitosa', '2000/03/20', 17, 1112, '0');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Cliente`
-- -----------------------------------------------------
START TRANSACTION;
USE `NullBank`;
INSERT INTO `Cliente` (`CPF`, `Nome_cliente`, `RG`, `Data_nasc`, `idEndereco`) VALUES ('24312343223', 'Maria Luiza', '2345324', '2000/07/11', 0001);
INSERT INTO `Cliente` (`CPF`, `Nome_cliente`, `RG`, `Data_nasc`, `idEndereco`) VALUES ('43212365412', 'Adriele Soares', '6789900', '1995/10/10', 0002);
INSERT INTO `Cliente` (`CPF`, `Nome_cliente`, `RG`, `Data_nasc`, `idEndereco`) VALUES ('33322211114', 'ANA PAULA CARNEIRO CARVALHO', '2015487', '1989/05/03', 0003);
INSERT INTO `Cliente` (`CPF`, `Nome_cliente`, `RG`, `Data_nasc`, `idEndereco`) VALUES ('65479898785', 'PERILLO JOSÉ SABINO NUNES', '1326544', '2000/03/01', 0004);
INSERT INTO `Cliente` (`CPF`, `Nome_cliente`, `RG`, `Data_nasc`, `idEndereco`) VALUES ('11254889562', 'ZENARA CAMPOS DOS SANTOS ', '9895562', '1985/11/28', 0005);
INSERT INTO `Cliente` (`CPF`, `Nome_cliente`, `RG`, `Data_nasc`, `idEndereco`) VALUES ('45485956652', 'SUZIMEIRI BRIGATTI ALAVARSE CARON', '1236545', '2001/02/27', 0006);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Cargo`
-- -----------------------------------------------------
START TRANSACTION;
USE `NullBank`;
INSERT INTO `Cargo` (`nome_cargo`, `Funcionario_matricula`) VALUES ('caixa', 1718);
INSERT INTO `Cargo` (`nome_cargo`, `Funcionario_matricula`) VALUES ('Atendente', 1112);
INSERT INTO `Cargo` (`nome_cargo`, `Funcionario_matricula`) VALUES ('gerente', 8910);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Gerente`
-- -----------------------------------------------------
START TRANSACTION;
USE `NullBank`;
INSERT INTO `Gerente` (`nome_cargo`, `gerente_matricula`) VALUES ('Gerente ', 1234);
INSERT INTO `Gerente` (`nome_cargo`, `gerente_matricula`) VALUES ('Gerente', 4567);
INSERT INTO `Gerente` (`nome_cargo`, `gerente_matricula`) VALUES ('Gerente', 8910);

COMMIT;


-- -----------------------------------------------------
-- Data for table `ClienteAgencia`
-- -----------------------------------------------------
START TRANSACTION;
USE `NullBank`;
INSERT INTO `ClienteAgencia` (`IdAgencia`, `CPF_Cliente`, `idCliente_Agencia`) VALUES (0, '24312343223', '0');
INSERT INTO `ClienteAgencia` (`IdAgencia`, `CPF_Cliente`, `idCliente_Agencia`) VALUES (1, '43212365412', '1');
INSERT INTO `ClienteAgencia` (`IdAgencia`, `CPF_Cliente`, `idCliente_Agencia`) VALUES (2, '33322211114', '2');
INSERT INTO `ClienteAgencia` (`IdAgencia`, `CPF_Cliente`, `idCliente_Agencia`) VALUES (3, '65479898785', '3');
INSERT INTO `ClienteAgencia` (`IdAgencia`, `CPF_Cliente`, `idCliente_Agencia`) VALUES (1, '11254889562', '4');
INSERT INTO `ClienteAgencia` (`IdAgencia`, `CPF_Cliente`, `idCliente_Agencia`) VALUES (2, '45485956652', '5');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Conta`
-- -----------------------------------------------------
START TRANSACTION;
USE `NullBank`;
INSERT INTO `Conta` (`num_conta`, `saldo`, `senha`, `gerente_matricula`, `idAgenciaCliente`, `conjunta`, `TipoConta_cliente`) VALUES (DEFAULT, 543.5, '9780', 1234, '0', 'Sim', 'Conta Corrente');
INSERT INTO `Conta` (`num_conta`, `saldo`, `senha`, `gerente_matricula`, `idAgenciaCliente`, `conjunta`, `TipoConta_cliente`) VALUES (DEFAULT, 2921.62, '1569', 4567, '1', 'Não', 'Conta Corrente');
INSERT INTO `Conta` (`num_conta`, `saldo`, `senha`, `gerente_matricula`, `idAgenciaCliente`, `conjunta`, `TipoConta_cliente`) VALUES (DEFAULT, -124.00, '5432', 8910, '2', 'Sim', 'Conta Especial');
INSERT INTO `Conta` (`num_conta`, `saldo`, `senha`, `gerente_matricula`, `idAgenciaCliente`, `conjunta`, `TipoConta_cliente`) VALUES (DEFAULT, 1313.1, '2611', 1234, '3', 'Não', 'Conta Especial');
INSERT INTO `Conta` (`num_conta`, `saldo`, `senha`, `gerente_matricula`, `idAgenciaCliente`, `conjunta`, `TipoConta_cliente`) VALUES (DEFAULT, 643.89, '3240', 4567, '4', 'Sim', 'Conta Poupança');
INSERT INTO `Conta` (`num_conta`, `saldo`, `senha`, `gerente_matricula`, `idAgenciaCliente`, `conjunta`, `TipoConta_cliente`) VALUES (DEFAULT, 10054.3, '2786', 8910, '5', 'Não', 'Conta Poupança');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Transacao`
-- -----------------------------------------------------
START TRANSACTION;
USE `NullBank`;
INSERT INTO `Transacao` (`num_transacao`, `data_hora`, `valor`, `tipo_transacao`, `conta_num_conta_efeito`, `Conta_num_conta_efetuante`) VALUES (, '2017-02-10 ', 53.90, 'Estorno', 907654, DEFAULT);
INSERT INTO `Transacao` (`num_transacao`, `data_hora`, `valor`, `tipo_transacao`, `conta_num_conta_efeito`, `Conta_num_conta_efetuante`) VALUES (, '2017-07-07 ', 42.5, 'Estorno', 654643, DEFAULT);
INSERT INTO `Transacao` (`num_transacao`, `data_hora`, `valor`, `tipo_transacao`, `conta_num_conta_efeito`, `Conta_num_conta_efetuante`) VALUES (, '2017-11-20 ', 150, 'Estorno', 678902, DEFAULT);
INSERT INTO `Transacao` (`num_transacao`, `data_hora`, `valor`, `tipo_transacao`, `conta_num_conta_efeito`, `Conta_num_conta_efetuante`) VALUES (, '2017-07-07 ', 549.80, 'Transferencia', 678902, DEFAULT);
INSERT INTO `Transacao` (`num_transacao`, `data_hora`, `valor`, `tipo_transacao`, `conta_num_conta_efeito`, `Conta_num_conta_efetuante`) VALUES (, '2016-01-01', 3000, 'Transferencia', 856756, DEFAULT);
INSERT INTO `Transacao` (`num_transacao`, `data_hora`, `valor`, `tipo_transacao`, `conta_num_conta_efeito`, `Conta_num_conta_efetuante`) VALUES (, '2017-09-02 ', 420.60, 'Transferencia', 124123, DEFAULT);
INSERT INTO `Transacao` (`num_transacao`, `data_hora`, `valor`, `tipo_transacao`, `conta_num_conta_efeito`, `Conta_num_conta_efetuante`) VALUES (, '2017-07-07 ', 1500.00, 'Deposito', 678902, DEFAULT);
INSERT INTO `Transacao` (`num_transacao`, `data_hora`, `valor`, `tipo_transacao`, `conta_num_conta_efeito`, `Conta_num_conta_efetuante`) VALUES (, '2017-06-19 ', 5400.00, 'Deposito', 856756, DEFAULT);
INSERT INTO `Transacao` (`num_transacao`, `data_hora`, `valor`, `tipo_transacao`, `conta_num_conta_efeito`, `Conta_num_conta_efetuante`) VALUES (, '2017-03-14 ', 1244.00, 'Deposito', 654643, DEFAULT);
INSERT INTO `Transacao` (`num_transacao`, `data_hora`, `valor`, `tipo_transacao`, `conta_num_conta_efeito`, `Conta_num_conta_efetuante`) VALUES (, '2016-08-16 ', 328.00, 'Saque', 856756, DEFAULT);
INSERT INTO `Transacao` (`num_transacao`, `data_hora`, `valor`, `tipo_transacao`, `conta_num_conta_efeito`, `Conta_num_conta_efetuante`) VALUES (, '2017-12-25 ', 432.30, 'Saque', 678902, DEFAULT);
INSERT INTO `Transacao` (`num_transacao`, `data_hora`, `valor`, `tipo_transacao`, `conta_num_conta_efeito`, `Conta_num_conta_efetuante`) VALUES (, '2017-02-27 ', 2341.00, 'Saque', 654643, DEFAULT);

COMMIT;


-- -----------------------------------------------------
-- Data for table `TipoConta`
-- -----------------------------------------------------
START TRANSACTION;
USE `NullBank`;
INSERT INTO `TipoConta` (`nomeTipo`, `num_conta`) VALUES ('Conta Corrente', 907654);
INSERT INTO `TipoConta` (`nomeTipo`, `num_conta`) VALUES ('Conta Corrente', 678902);
INSERT INTO `TipoConta` (`nomeTipo`, `num_conta`) VALUES ('Conta Especial', 212321);
INSERT INTO `TipoConta` (`nomeTipo`, `num_conta`) VALUES ('Conta Especial', 654643);
INSERT INTO `TipoConta` (`nomeTipo`, `num_conta`) VALUES ('Conta Poupança', 124123);
INSERT INTO `TipoConta` (`nomeTipo`, `num_conta`) VALUES ('Conta Poupança', 856756);

COMMIT;


-- -----------------------------------------------------
-- Data for table `ContaPoupança`
-- -----------------------------------------------------
START TRANSACTION;
USE `NullBank`;
INSERT INTO `ContaPoupança` (`nomeTipo`, `num_conta`, `taxa_de_juros`) VALUES ('Conta Poupança', 124123, 0.5);
INSERT INTO `ContaPoupança` (`nomeTipo`, `num_conta`, `taxa_de_juros`) VALUES ('Conta Poupança', 856756, 0.3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `ContaEspecial`
-- -----------------------------------------------------
START TRANSACTION;
USE `NullBank`;
INSERT INTO `ContaEspecial` (`nomeTipo`, `num_conta`, `credito`) VALUES ('Conta Especial', 212321, 5000);
INSERT INTO `ContaEspecial` (`nomeTipo`, `num_conta`, `credito`) VALUES ('Conta Especial', 654643, 10000);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Atendente`
-- -----------------------------------------------------
START TRANSACTION;
USE `NullBank`;
INSERT INTO `Atendente` (`nome_cargo`, `func_matricula`) VALUES ('Atendente', 1112);
INSERT INTO `Atendente` (`nome_cargo`, `func_matricula`) VALUES ('Atendente', 1314);
INSERT INTO `Atendente` (`nome_cargo`, `func_matricula`) VALUES ('Atendente', 1516);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Caixa`
-- -----------------------------------------------------
START TRANSACTION;
USE `NullBank`;
INSERT INTO `Caixa` (`nome_cargo`, `func_matricula`) VALUES ('Caixa', 1718);
INSERT INTO `Caixa` (`nome_cargo`, `func_matricula`) VALUES ('Caixa', 1920);
INSERT INTO `Caixa` (`nome_cargo`, `func_matricula`) VALUES ('Caixa', 2122);

COMMIT;


-- -----------------------------------------------------
-- Data for table `ContaCorrente`
-- -----------------------------------------------------
START TRANSACTION;
USE `NullBank`;
INSERT INTO `ContaCorrente` (`nomeTipo`, `num_conta`) VALUES ('Conta Corrente', 907654);
INSERT INTO `ContaCorrente` (`nomeTipo`, `num_conta`) VALUES ('Conta Corrente', 678902);

COMMIT;

