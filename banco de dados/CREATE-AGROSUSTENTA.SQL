-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema agrosustenta
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema agrosustenta
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `agrosustenta` DEFAULT CHARACTER SET utf8 ;
USE `agrosustenta` ;

-- -----------------------------------------------------
-- Table `agrosustenta`.`Cooperativa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `agrosustenta`.`Cooperativa` (
  `CNPJ` VARCHAR(18) NOT NULL,
  `nome` VARCHAR(60) NOT NULL,
  `email` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`CNPJ`),
  UNIQUE INDEX `CPF_UNIQUE` (`CNPJ` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `agrosustenta`.`Armazem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `agrosustenta`.`Armazem` (
  `idArmazem` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`idArmazem`),
  UNIQUE INDEX `idArmazem_UNIQUE` (`idArmazem` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `agrosustenta`.`Estoque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `agrosustenta`.`Estoque` (
  `idEstoque` INT NOT NULL AUTO_INCREMENT,
  `entradaLotes` DATETIME NOT NULL,
  `saidaLotes` DATETIME NOT NULL,
  `Armazem_idArmazem` INT NOT NULL,
  PRIMARY KEY (`idEstoque`),
  UNIQUE INDEX `idEstoque_UNIQUE` (`idEstoque` ASC) VISIBLE,
  INDEX `fk_Estoque_Armazem1_idx` (`Armazem_idArmazem` ASC) VISIBLE,
  CONSTRAINT `fk_Estoque_Armazem1`
    FOREIGN KEY (`Armazem_idArmazem`)
    REFERENCES `agrosustenta`.`Armazem` (`idArmazem`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `agrosustenta`.`Distribuicao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `agrosustenta`.`Distribuicao` (
  `idDistribuicao` INT NOT NULL AUTO_INCREMENT,
  `cooperadora` DATETIME NOT NULL,
  `Produtor` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`idDistribuicao`),
  UNIQUE INDEX `idDistribuicao_UNIQUE` (`idDistribuicao` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `agrosustenta`.`cadastroDeLote`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `agrosustenta`.`cadastroDeLote` (
  `idLote` INT NOT NULL AUTO_INCREMENT,
  `especie` VARCHAR(60) NOT NULL,
  `quantidade` INT NOT NULL,
  `validade` DATE NOT NULL,
  `descricao` VARCHAR(250) NOT NULL,
  `Armazem_idArmazem` INT NOT NULL,
  PRIMARY KEY (`idLote`),
  UNIQUE INDEX `idLote_UNIQUE` (`idLote` ASC) VISIBLE,
  INDEX `fk_Lote_Armazem1_idx` (`Armazem_idArmazem` ASC) VISIBLE,
  CONSTRAINT `fk_Lote_Armazem1`
    FOREIGN KEY (`Armazem_idArmazem`)
    REFERENCES `agrosustenta`.`Armazem` (`idArmazem`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `agrosustenta`.`Sementes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `agrosustenta`.`Sementes` (
  `idSementes` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(60) NOT NULL,
  `especie` VARCHAR(60) NOT NULL,
  `quantidade` INT NOT NULL,
  `Lote_idLote` INT NOT NULL,
  PRIMARY KEY (`idSementes`, `Lote_idLote`),
  UNIQUE INDEX `idSementes_UNIQUE` (`idSementes` ASC) VISIBLE,
  INDEX `fk_Sementes_Lote1_idx` (`Lote_idLote` ASC) VISIBLE,
  CONSTRAINT `fk_Sementes_Lote1`
    FOREIGN KEY (`Lote_idLote`)
    REFERENCES `agrosustenta`.`cadastroDeLote` (`idLote`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `agrosustenta`.`Rastreio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `agrosustenta`.`Rastreio` (
  `idRastreio` INT NOT NULL AUTO_INCREMENT,
  `destinatario` VARCHAR(60) NOT NULL,
  `Usuario_CPF` VARCHAR(14) NOT NULL,
  PRIMARY KEY (`idRastreio`),
  UNIQUE INDEX `idRastreio_UNIQUE` (`idRastreio` ASC) VISIBLE,
  INDEX `fk_Rastreio_Usuario1_idx` (`Usuario_CPF` ASC) VISIBLE,
  CONSTRAINT `fk_Rastreio_Usuario1`
    FOREIGN KEY (`Usuario_CPF`)
    REFERENCES `agrosustenta`.`Cooperativa` (`CNPJ`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `agrosustenta`.`Distribuicao_Armazem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `agrosustenta`.`Distribuicao_Armazem` (
  `Distribuicao_idDistribuicao` INT NOT NULL,
  `Armazem_idArmazem` INT NOT NULL,
  PRIMARY KEY (`Distribuicao_idDistribuicao`, `Armazem_idArmazem`),
  INDEX `fk_Distribuicao_has_Armazem_Armazem1_idx` (`Armazem_idArmazem` ASC) VISIBLE,
  INDEX `fk_Distribuicao_has_Armazem_Distribuicao1_idx` (`Distribuicao_idDistribuicao` ASC) VISIBLE,
  CONSTRAINT `fk_Distribuicao_has_Armazem_Distribuicao1`
    FOREIGN KEY (`Distribuicao_idDistribuicao`)
    REFERENCES `agrosustenta`.`Distribuicao` (`idDistribuicao`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Distribuicao_has_Armazem_Armazem1`
    FOREIGN KEY (`Armazem_idArmazem`)
    REFERENCES `agrosustenta`.`Armazem` (`idArmazem`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;