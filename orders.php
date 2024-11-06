<?php

include 'components/connect.php';

session_start();

if(isset($_SESSION['user_id'])){
   $user_id = $_SESSION['user_id'];
}else{
   $user_id = '';
};

?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>orders</title>
   
   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

   <!-- custom css file link  -->
   <link rel="stylesheet" href="css/style.css">

</head>
<body>
   
<?php include 'components/user_header.php'; ?>

<section class="orders">

   <h1 class="heading">Lịch sử đặt hàng</h1>

   <div class="box-container">

   <?php
      if($user_id == ''){
         echo '<center><p class="empty">Vui lòng đăng nhập để sử dụng tính năng !</p></center>';
      }else{
         $select_orders = $conn->prepare("SELECT * FROM `orders` WHERE user_id = ?");
         $select_orders->execute([$user_id]);
         if($select_orders->rowCount() > 0){
            while($fetch_orders = $select_orders->fetch(PDO::FETCH_ASSOC)){
   ?>
   <div class="box">
      <p>Ngày đặt : <span><?= $fetch_orders['placed_on']; ?></span></p>
      <p>Tên khách hàng : <span><?= $fetch_orders['name']; ?></span></p>
      <p>Email : <span><?= $fetch_orders['email']; ?></span></p>
      <p>Số điện thoại : <span><?= $fetch_orders['number']; ?></span></p>
      <p>Địa chỉ : <span><?= $fetch_orders['address']; ?></span></p>
      <p>Phương thức thanh toán : <span><?= $fetch_orders['method']; ?></span></p>
      <p>Đơn hàng của bạn : <span><?= $fetch_orders['total_products']; ?></span></p>
      <p>Tổng thành tiền : <span><?= number_format($fetch_orders['total_price'], 0, ',', '.'); ?> VNĐ</span></p>
      <p>Trạng thái đơn hàng : <span style="color:<?php if($fetch_orders['payment_status'] == 'pending'){ echo 'red'; }else{ echo 'green'; }; ?>"><?= $fetch_orders['payment_status']; ?></span> </p>
   </div>
   <?php
      }
      }else{
         echo '<p class="empty">Bạn chưa có đơn hàng nào !</p>';
      }
      }
   ?>

   </div>

</section>













<?php include 'components/footer.php'; ?>

<script src="js/script.js"></script>

</body>
</html>