//dependencias de servidor
const path = require('node:path');
const express = require('express');
const app = express();

//Middleware

const morgan = require('morgan');
app.use(morgan('dev'));

process.loadEnvFile()
const PORT = process.env.PORT || 4000;

// Indicar la ruta de los ficheros estáticos 

app.use(express.static(path.join(__dirname, 'public')));

app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'public', 'index.html'));
});

// Indicar el puerto de escucha 

app.listen(PORT, () => {
    console.log(`Servidor escuchando en el puerto http://localhost:${PORT}`);
}
);
