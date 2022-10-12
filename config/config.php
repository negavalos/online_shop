<?php
  define("CLIENT_ID", "AapqZmCUe428rBcSBjbYmlYDtSD0kj6_an-WYLgCRvQDheRBL0jwG9rdUqk-hhR44_0tE-ZnNdz8MZaW");
  define("TOKEN_MP", "TEST-8906908828296231-100718-003df6644813a38129b8d0af53a064e6-289400099");
  define("CURRENCY", "USD");
  define("KEY_TOKEN", "APR.wqc-354*");
  define("MONEDA", "$");

  session_start();

  $num_cart = 0;

  if (isset($_SESSION['carrito']['productos'])) {
    $num_cart = count($_SESSION['carrito']['productos']);
  }


?>
