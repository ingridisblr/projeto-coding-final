USE `agrosustenta` ;

-- Tabelas Pai: Armazem
INSERT INTO agrosustenta.Armazem (idArmazem, nome) VALUES
(1, 'Central de Armazenamento Norte'),
(2, 'Depósito Sementes Especiais'),
(3, 'Centro Logístico Leste'),
(4, 'Armazém de Grãos Sul'),
(5, 'Silo Principal Oeste');


-- Tabelas Pai: Cooperativa
INSERT INTO agrosustenta.Cooperativa (CNPJ, nome, email) VALUES
('11.111.111/0001-11', 'Coop AgroFuturo', 'contato@agrofuturo.com.br'),
('22.222.222/0001-22', 'União Verde Agrícola', 'uniao@verde.com.br'),
('33.333.333/0001-33', 'Sustenta Cultivo Ltda', 'sac@sustentacultivo.com'),
('44.444.444/0001-44', 'Produtores Associados Sul', 'pa.sul@coop.com'),
('55.555.555/0001-55', 'Sementes Premium Brasil', 'premium@seeds.com.br');


-- Tabelas Pai: Distribuicao
INSERT INTO agrosustenta.Distribuicao (idDistribuicao, cooperadora, Produtor) VALUES
(301, '2025-11-01 08:00:00', 'Produtor A'),
(302, '2025-10-20 14:00:00', 'Produtor B'),
(303, '2025-12-05 09:30:00', 'Produtor C'),
(304, '2025-11-25 13:00:00', 'Produtor D'),
(305, '2025-12-10 11:00:00', 'Produtor E');


-- Tabelas Filhas (1º Nível): cadastroDeLote (Depende de Armazem)
INSERT INTO agrosustenta.cadastroDeLote (idLote, especie, quantidade, validade, descricao, Armazem_idArmazem) VALUES
(101, 'Soja BRS 500', 1000, '2026-06-30', 'Lote de sementes convencional', 1),
(102, 'Milho Híbrido XL', 500, '2025-12-15', 'Alta produtividade, resistente', 2),
(103, 'Trigo Nacional', 2500, '2026-03-01', 'Cultivar de inverno', 1),
(104, 'Feijão Carioca', 800, '2025-11-20', 'Colheita nova, padrão A', 3),
(105, 'Arroz IRGA', 1200, '2026-01-10', 'Lote irrigado, excelente qualidade', 2);


-- Tabelas Filhas (1º Nível): Estoque (Depende de Armazem)
INSERT INTO agrosustenta.Estoque (idEstoque, entradaLotes, saidaLotes, Armazem_idArmazem) VALUES
(1, '2025-10-01 10:00:00', '2025-11-01 15:30:00', 1),
(2, '2025-10-05 08:30:00', '2025-10-20 11:00:00', 2),
(3, '2025-10-10 14:45:00', '2025-12-05 17:00:00', 1),
(4, '2025-11-15 09:00:00', '2025-11-25 10:45:00', 3),
(5, '2025-11-28 16:00:00', '2025-12-10 12:00:00', 2);


-- Tabelas Filhas (1º Nível): Distribuicao_Armazem (Depende de Distribuicao e Armazem)
INSERT INTO agrosustenta.Distribuicao_Armazem (Distribuicao_idDistribuicao, Armazem_idArmazem) VALUES
(301, 1),
(302, 2),
(303, 1),
(304, 3),
(305, 2);


-- Tabelas Filhas (1º Nível): Rastreio (Depende de Cooperativa)
INSERT INTO agrosustenta.Rastreio (idRastreio, destinatario, Usuario_CPF) VALUES
(401, 'Fazenda Sol Nascente', '11.111.111/0001-11'),
(402, 'Sítio Primavera', '22.222.222/0001-22'),
(403, 'Grande Produtor do Oeste', '11.111.111/0001-11'),
(404, 'Cooperado João Silva', '33.333.333/0001-33'),
(405, 'Nova Fronteira Agronegócios', '55.555.555/0001-55');


-- Tabelas Filhas (2º Nível): Sementes (Depende de cadastroDeLote)
INSERT INTO agrosustenta.Sementes (idSementes, nome, especie, quantidade, Lote_idLote) VALUES
(201, 'Semente Soja I', 'Soja BRS 500', 500, 101),
(202, 'Semente Soja II', 'Soja BRS 500', 500, 101),
(203, 'Semente Milho Ouro', 'Milho Híbrido XL', 300, 102),
(204, 'Semente Milho Prata', 'Milho Híbrido XL', 200, 102),
(205, 'Semente Feijão', 'Feijão Carioca', 800, 104);