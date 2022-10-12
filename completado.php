<?php
  require 'config/config.php';
  require 'config/database.php';
  $db = new Database();
  $con= $db->conectar();
  $id_transaccion = isset($_GET['key']) ? $_GET['key'] : '0';

  $error = '';

  if ($id_transaccion == '0') {
    $error= 'Error al procesar la peticion';
  }else {
    $sql = $con->prepare("SELECT count(id) FROM compra WHERE id_transaccion=? AND estado=?");
    $sql->execute([$id_transaccion, 'COMPLETED']);
    if ($sql->fetchColumn() > 0) {
      $sql = $con->prepare("SELECT id, fecha, email, total FROM compra WHERE id_transaccion=? AND estado=? LIMIT 1");
      $sql->execute([$id_transaccion, 'COMPLETED']);
      $row = $sql->fetch(PDO::FETCH_ASSOC);

      $id_Compra = $row['id'];
      $total = $row['total'];
      $fecha = $row['fecha'];

      $sql_det = $con->prepare("SELECT nombre, precio, cantidad FROM detalles_compra WHERE id_compra = ?");
      $sql_det->execute([$id_Compra]);
    }else {
      $error = 'Error al comprobar la compra';
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
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  </head>
  <body>

    <header>

      <div class="navbar navbar-expand-lg navbarshop">
        <div class="container">
          <a href="index.php" class="navbar-brand">
            <strong>Online Shop</strong>
          </a>
          <button class="navbar-toggler navbar-dark bg-dark" type="button" data-bs-toggle="collapse" data-bs-target="#navbarHeader" aria-controls="navbarHeader" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
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
    <!-- contenido -->
    <main>
      <div class="container">

        <?php if (strlen($error) > 0) { ?>
          <div class="row">
            <div class="col">
              <h3><?php echo $error; ?></h3>
            </div>
          </div>
      <?php  }else{ ?>
        <div class="row">
          <div class="col">
            <b>Folio de la compra: </b><?php echo $id_transaccion; ?><br>
            <b>fecha de la compra: </b><?php echo $fecha; ?><br>
            <b>total: </b><?php echo MONEDA. number_format($total, 2, '.', ','); ?><br>
          </div>
        </div>

        <div class="row">
          <div class="col">
            <table class="table">
              <thead>
                <tr>
                  <th>cantidad</th>
                  <th>producto</th>
                  <th>importe</th>
                </tr>
              </thead>
              <tbody>
                <?php while ($row_det = $sql_det->fetch(PDO::FETCH_ASSOC)) {
                  $importe = $row_det['precio'] * $row_det['cantidad'];
                  ?>
                  <tr>
                    <td><?php echo $row_det['cantidad']; ?></td>
                    <td><?php echo $row_det['nombre']; ?></td>
                    <td><?php echo $importe; ?></td>
                  </tr>
                <?php } ?>
              </tbody>
            </table>
          </div>
        </div>
      <?php } ?>
      </div>
      </main>
  </body>
</html>
