<?php
  use PHPMailer\PHPMailer\PHPMailer;
  use PHPMailer\PHPMailer\SMTP;
  use PHPMailer\PHPMailer\Exception;

  require 'vendor/autoload.php';

  $factura = '<a href="http://localhost/tienda_online/completado.php?key='.$id_transaccion.'">Factura</a>';

  $mail = new PHPMailer(true);

  try {
    //$mail->SMTPDebug = SMTP::DEBUG_SERVER;
    $mail->isSMTP();
    $mail->Host = 'smtp.gmail.com';
    $mail->SMTPAuth = true;
    $mail->Username = 'negavalos99@gmail.com';
    $mail->Password = '';
    $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
    $mail->Port = 587;

    $mail->setFrom('negavalos99@gmail.com', 'Online Shop');
    $mail->addAddress('negamanga99@gmail.com', 'Compra Online Shop');
    $mail->addCC('negmanga@gmail.com');




    $mail->isHTML(true);
    $mail->Subject = 'prueba de venta';
    $mail->Body = '<div align="center"  >
      <div style="width: 80%; height: 100%; border: 2px solid black; background:black;">
        <div style="width: 80%; height: 50px; border: 2px solid black; background: green;"><h3>Tienda Factura</h3></div>
        <div style="color:white;">
          <p style="color:white;">Muchas gracias por su compra, este es el link de su '.$factura.'</p><br><br><br>
          ID de su compra: '.$id_transaccion.'<br>
          Total pagado: $'.$total.'<br>

        </div>

      </div>

    </div>';
    $mail->send();

    echo 'Correo enviado';
  }catch(Exception $e){
    echo 'mensaje'. $mail->ErrorInfo;
  }

?>
