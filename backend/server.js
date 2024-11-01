const express = require('express');
const bodyParser = require('body-parser');
const app = express();
const port = 3000;

app.use(bodyParser.json());

// Datos de ejemplo de productos
const productos = [
  {
    name: "ALIMENTO PARA PERRO DOG SHOW CACHORROS MINIS Y PEQUEÑOS BULTO(22.7 KG)",
    buyPrice: 183520.78,
    detail: null,
    erp: null,
    price: 210957.14,
    priceRecomended: 266190.17,
    priceType: "APP",
    bannerResponse: null,
    clasificacion: ["Perros", "Dogourmet"],
    favoritos: true,
    estado: "Activo"
  },
];

// Endpoint POST para filtrar productos
app.post('/api/productos', (req, res) => {
  const { favoritos, clasificaciones, estado } = req.body;

  // Filtrar productos según los criterios de entrada
  const productosFiltrados = productos.filter(producto => {
    const clasificacionCoincide = clasificaciones.some(clas => producto.clasificacion.includes(clas));
    return (
      producto.favoritos === favoritos &&
      clasificacionCoincide &&
      producto.estado === estado
    );
  });

  res.json(productosFiltrados);
});

app.listen(port, () => {
  console.log(`Servidor corriendo en http://localhost:${port}`);
});
