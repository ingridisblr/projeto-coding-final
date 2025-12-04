

const express = require('express');
const pool = require('./db'); 
const app = express();
const PORT = 3000;
const armazemRoutes = require('./routes/armazemRoutes'); 
const loteRoutes = require('./routes/loteRoutes');
const sementesRoutes = require('./routes/sementesRoutes');
const estoqueRoutes = require('./routes/estoqueRoutes')
const cooperativaRoutes = require('./routes/cooperativaRoutes');
const distribuicaoRoutes = require('./routes/distribuicaoRoutes');
const rastreioRoutes = require('./routes/rastreioRoutes');
const distribuicaoArmazemRoutes = require('./routes/distribuicaoArmazemRoutes');


app.use(express.json()); 


app.get('/', (req, res) => {
    res.send('Servidor Node.js para Gestão de Sementes está rodando!');
});


app.use('/api/armazens', armazemRoutes); 
app.use('/api/lotes', loteRoutes);
app.use('/api/sementes', sementesRoutes);
app.use('/api/estoque', estoqueRoutes);
app.use('/api/cooperativas', cooperativaRoutes);
app.use('/api/distribuicao', distribuicaoRoutes);
app.use('/api/rastreio', rastreioRoutes);
app.use('/api/distribuicao-armazem', distribuicaoArmazemRoutes);

app.listen(PORT, () => {
    console.log(`Servidor rodando em http://localhost:3000`);
    console.log(`Teste a conexão com http://localhost:3000/testar-conexao`);
});