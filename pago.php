<?php
  require 'config/config.php';
  require 'config/database.php';
  require 'vendor/autoload.php';

  MercadoPago\SDK::setAccessToken(TOKEN_MP);

  $preference = new MercadoPago\Preference();
  $productos_mp = array();

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
  }else {
    header("location: index.php");
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

      <script src="https://www.paypal.com/sdk/js?client-id=<?php echo CLIENT_ID; ?>&currency=<?php echo CURRENCY; ?>"></script>

    <script src="https://sdk.mercadopago.com/js/v2"></script>
  </head>
  <body>

    <header>

      <div class="navbar navbar-expand-lg navbarshop">
        <div class="container">
          <a href="index.php" class="navbar-brand">
            <strong>Online shop </strong>
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
    <div class="row">
      <div class="col-6">
        <h4>Detalles de pago</h4>
        <div class="row">
          <div class="col-12">
              <div id="paypal-button-container"></div>
          </div>
        </div>


      </div>
      <div class="col-6">



        <div class="table-responsive">
          <table class="table">
            <thead>
              <tr>
                <th>Producto</th>
                <th>Subtotal</th>
                <th></th>
              </tr>
            </thead>
            <tbody>
              <?php if ($lista_carrito == null) {
                echo '<tr><td colpspan="5" class="text-center"><b>Lista vacia</b></td></tr>';
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

                  $item = new MercadoPago\Item();
                  $item->id = $_id;
                  $item->title = $nombre;
                  $item->quantity = $cantidad;
                  $item->unit_price = $precio_desc;
                  $item->currency_id = "ARS";

                  array_push($productos_mp, $item);
                  unset($item);


              ?>
              <tr>
                <td><?php echo $nombre; ?></td>
                <td>
                  <div id="subtotal_<?php echo $_id; ?>" name="subtotal[]">
                    <?php echo MONEDA .   number_format( $subtotal, 2, '.', ','); ?>
                  </div>
                </td>
              </tr>
              <?php } ?>
            </tbody>
        <?php  }  ?>
        <tr>

          <td colspan="2">
            <p class="h3 text-end" id="total">total: <?php echo MONEDA . number_format($total, 2, '.', ','); ?></p>
          </td>
        </tr>
          </table>
        </div>

      </div>
    </div>
  </div>
</div>

    </main>
    <?php
    $preference->items = $productos_mp;
    $preference->back_urls = array(
    "success" => "http://localhost/tienda_online/captura.php",
    "failure" => "http://localhost/tienda_online/fallo.php"
    );
    $preference->auto_return = "approved";
    $preference->binary_mode = true;

    $preference->save();

    ?>



  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>



  <script>
    paypal.Buttons({
      style:{
        color: 'blue',
        shape: 'pill',
        label: 'pay'
      },

      // Sets up the transaction when a payment button is clicked
      createOrder: function(data, actions) {
        return actions.order.create({
          purchase_units: [{
            amount: {
              value: <?php echo $total; ?> // Can also reference a variable or function
            }
          }]
        });
      },
      // Finalize the transaction after payer approval
      onApprove: function(data, actions) {
        actions.order.capture().then(function(detalles) {

          console.log(detalles)

          let url = 'clases/captura.php'

          return fetch(url, {
            method: 'post',

            headers: {
              'content-type': 'application/json'
            },
            body: JSON.stringify({
              detalles: detalles

            })
          }).then(function(responsive){
            window.location.href = "completado.php?key="+ detalles['id'];
          })
        });

      },
      onCancel: function(data){
        alert("Pago cancelado");
        console.log(data);
      }


    }).render('#paypal-button-container');
  
  </script>
  </body>
</html>
