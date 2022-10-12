<?php
  require 'config/config.php';
  require 'config/database.php';
  $db = new Database();
  $con= $db->conectar();

  $productos = isset($_SESSION['carrito']['productos']) ? $_SESSION['carrito']['productos'] : null;


  $lista_carrito = array();
  if ($productos != null) {
    foreach ($productos as $clave => $cantidad) {
      $sql = $con->prepare("SELECT id, nombre, precio, descuento, $cantidad as cantidad FROM productos WHERE id=? AND activo=1");
      $sql->execute([$clave]);
      $lista_carrito[] = $sql->fetch(PDO::FETCH_ASSOC);
    }
  }




?>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tienda Online</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="css/estilos.css">
  </head>
  <body>

    <header>

      <div class="navbar navbar-expand-lg navbarshop">
        <div class="container">
          <a href="index.php" class="navbar-brand">
            <strong>Online shop</strong>
          </a>
          <button class="navbar-toggler navbar-dark bg-dark" type="button" data-bs-toggle="collapse" data-bs-target="#navbarHeader" aria-controls="navbarHeader" aria-expanded="false" aria-label="Toggle navigation">
            <span class="  navbar-toggler-icon"></span>
          </button>

          <div class="collapse navbar-collapse " id="navbarHeader">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
              <li class="nav-item">
                <a href="#" class="nav-link active">catalogo</a>
              </li>
              <li class="nav-item">
                <a href="#" class="nav-link">contacto</a>
              </li>
            </ul>
            <a href="checkout.php" class="btn btn-negashop">

              <img class="carrito" src="img-logic/carrito.png" alt=""> <span id="num_cart" class="badge bg-secondary"><?php echo $num_cart; ?></span>

            </a>
          </div>
        </div>
      </div>
    </header>
    <main>
      <div class="container">
        <div class="table-responsive">
          <table class="table">
            <thead>
              <tr>
                <th>Producto</th>
                <th>Precio</th>
                <th>Cantidad</th>
                <th>Subtotal</th>
                <th></th>
              </tr>
            </thead>
            <tbody>
              <?php if ($lista_carrito == null) {
                echo '<tr><td colspan="6" class="text-center" align="center"><b> Lista vacia</b></td></tr>';
              } else {
                $total = 0;
                foreach ($lista_carrito as $producto) {
                  $_id = $producto['id'];
                  $nombre = $producto['nombre'];
                  $precio = $producto['precio'];
                  $descuento = $producto['descuento'];
                  $cantidad = $producto['cantidad'];
                  $precio_desc = $precio - (($precio * $descuento) / 100);
                  $subtotal = $cantidad * $precio_desc;

                  $total += $subtotal;


              ?>
              <tr>
                <td><?php echo $nombre; ?></td>
                <td><?php echo MONEDA .   number_format( $precio_desc, 2, '.', ','); ?></td>
                <td>
                  <input type="number" name="" min="1" max="10" step="1" value="<?php echo $cantidad; ?>" size="5" id="cantidad_<?php echo $_id; ?>" onchange="ActualizarCantidad(this.value, <?php echo $_id; ?>)">
                </td>
                <td>
                  <div id="subtotal_<?php echo $_id; ?>" name="subtotal[]">
                    <?php echo MONEDA .   number_format( $subtotal, 2, '.', ','); ?>
                  </div>
                  <td> <a href="#" id="eliminar" class="btn btn-warning btn-sm" data-bs-id="<?php echo $_id; ?>" data-bs-toggle="modal" data-bs-target="#eliminaModal"><img class="eliminar" src="img-logic/eliminar.png" alt="">Eliminar</a> </td>
                </td>
              </tr>
              <?php } ?>
            </tbody>

        <tr>
          <td colspan="3"></td>
          <td colspan="2">
          <p class="h3" id="total">Total:  <?php echo MONEDA . number_format($total, 2, '.', ','); ?></p>
          </td>
        </tr>

          </table>
        </div>
        <div class="row">
          <div class="col-md-5 offset-md-7 d-grid gap-2">
            <a href="pago.php" class="btn btn-outline-negashop btn-lg">Realizar pago</a>
          </div>
        </div>
      </div>
      <?php  }  ?>
    </main>
    <!-- Modal -->
    <div class="modal fade" id="eliminaModal" tabindex="-1" aria-labelledby="eliminaModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-sm">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="eliminaModalLabel">Alerta</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            ¿Desea eliminar el producto del carrito?
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
            <button id="btn-elimina" type="button" class="btn btn-danger" onclick="eliminar()">Eliminar</button>
          </div>
        </div>
      </div>
    </div>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script type="text/javascript">
    let eliminaModal = document.getElementById('eliminaModal')
    eliminaModal.addEventListener('show.bs.modal', function(event){
      let button = event.relatedTarget
      let id = button.getAttribute('data-bs-id')
      let buttonElimina = eliminaModal.querySelector('.modal-footer #btn-elimina')
      buttonElimina.value = id

    })

      function ActualizarCantidad(cantidad, id) {
        let url = 'clases/actualizar_carrito.php'
        let formData = new FormData()
        formData.append('action', 'agregar')
        formData.append('id', id)
        formData.append('cantidad', cantidad)

        fetch(url, {
          method: 'POST',
          body: formData,
          mode: 'cors'
        }).then(response => response.json())
        .then(data =>{
          if (data.ok) {

            let divsubtotal = document.getElementById('subtotal_' + id)
            divsubtotal.innerHTML = data.sub

            let total = 0.00
            let list = document.getElementsByName('subtotal[]')

            for(let i = 0; i < list.length; i++){
              total += parseFloat(list[i].innerHTML.replace(/[$,]/g, ''))
            }

            total = new Intl.NumberFormat('en-US', {
              minimuFractionDigits: 2
            }).format(total)
            document.getElementById('total').innerHTML = 'Total:  <?php echo MONEDA; ?>' + total
          }
        })
      }
      function eliminar() {
        let botonElimina = document.getElementById('btn-elimina')
        let id = botonElimina.value

        let url = 'clases/actualizar_carrito.php'
        let formData = new FormData()
        formData.append('action', 'eliminar')
        formData.append('id', id)

        fetch(url, {
          method: 'POST',
          body: formData,
          mode: 'cors'
        }).then(response => response.json())
        .then(data =>{
          if (data.ok) {
            location.reload()
          }
        })
      }
    </script>
  </body>
</html>
