
<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
  </head>
  <body>
    <!-- Replace "test" with your own sandbox Business account app client ID -->
    <script src="https://www.paypal.com/sdk/js?client-id=AapqZmCUe428rBcSBjbYmlYDtSD0kj6_an-WYLgCRvQDheRBL0jwG9rdUqk-hhR44_0tE-ZnNdz8MZaW&currency=USD"></script>
    <!-- Set up a container element for the button -->
    <div id="paypal-button-container"></div>
    <script>
      paypal.Buttons({
        style:{
          color: 'blue',
          shape: 'pill',
          label: 'pay'
        },

        // Sets up the transaction when a payment button is clicked
        createOrder: (data, actions) => {
          return actions.order.create({
            purchase_units: [{
              amount: {
                value: 100 // Can also reference a variable or function
              }
            }]
          });
        },onCancel: function(data){
          alert("Pago cancelado");
          console.log(data);
        },
        // Finalize the transaction after payer approval
        onApprove: (data, actions) => {
          return actions.order.capture().then(function(detalles) {
            window.location.href="completado.php"

          });

        }

      }).render('#paypal-button-container');
    </script>
  </body>
</html>
