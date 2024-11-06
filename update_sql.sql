-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th10 06, 2024 lúc 10:28 AM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `shop_db`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admins`
--

CREATE TABLE `admins` (
  `id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `admins`
--

INSERT INTO `admins` (`id`, `name`, `password`) VALUES
(1, 'admin', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `pid` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(10) NOT NULL,
  `quantity` int(10) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `pid`, `name`, `price`, `quantity`, `image`) VALUES
(4, 1, 3, 'Ducati 1100 Sport Pro', 500000000, 1, '1100sport_pro_anh1.png'),
(5, 1, 4, 'Honda Air Blade 160i', 45000000, 1, 'airblade160_anh1.png'),
(6, 1, 5, 'Honda CB 500 Hornet', 185000000, 1, 'cb500hornet_anh1.png');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `messages`
--

CREATE TABLE `messages` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `number` varchar(12) NOT NULL,
  `message` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `messages`
--

INSERT INTO `messages` (`id`, `user_id`, `name`, `email`, `number`, `message`) VALUES
(1, 1, 'Trần Hoàng Phúc', 'test@gmail.com', '123456789', 'test');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `number` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `method` varchar(50) NOT NULL,
  `address` varchar(500) NOT NULL,
  `total_products` varchar(1000) NOT NULL,
  `total_price` int(100) NOT NULL,
  `placed_on` date NOT NULL DEFAULT current_timestamp(),
  `payment_status` varchar(20) NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `name`, `number`, `email`, `method`, `address`, `total_products`, `total_price`, `placed_on`, `payment_status`) VALUES
(1, 1, 'Trần Hoàng Phúc', '0123456789', 'test1@gmail.com', 'Thanh toán khi nhận hàng', 'số nhà 14, Hai Bà Trưng, Hà Nội, giảm giá 100% nhé', 'Ducati 1100 Sport Pro (500000000 x 1)', 500000000, '2024-11-06', 'completed'),
(2, 1, 'test2', '123456789', 'congtaonamlun@gmail.com', 'Thanh toán khi nhận hàng', '14, Thanh Trì, Hà Nộih, ', 'Honda Air Blade 160i (45000000 x 1)', 45000000, '2024-11-06', 'pending'),
(3, 1, 'Trần Hoàng Phúc', '1234565678', 'congtaonamlun@gmail.com', 'Thanh toán khi nhận hàng', '14, Minh khai, Hoàng Mai, Hà Nội, ', 'Honda Air Blade 160i (45000000 x 1)', 45000000, '2024-11-06', 'pending');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `details` varchar(500) NOT NULL,
  `price` int(10) NOT NULL,
  `image_01` varchar(100) NOT NULL,
  `image_02` varchar(100) NOT NULL,
  `image_03` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `details`, `price`, `image_01`, `image_02`, `image_03`) VALUES
(3, 'Ducati 1100 Sport Pro', 'Scrambler Ducati 1100 Sport PRO mang hết tất cả những đặc trưng từ bản PRO, thêm các lựa chọn cao cấp hơn như hệ thống giảm xóc Öhlins, tay lái thấp hơn và cặp gương chiếu hậu Café Racer, giúp cho Sport PRO là phiên bản cao cấp nhất đại gia đình Scrambler. 1100 Sport PRO mang bộ áo phong cách màu đen nhám, cùng 2 ốp bình xăng có hình “1100” rất phong cách.', 500000000, '1100sport_pro_anh1.png', '1100sport_pro_anh2.png', '1100sport_pro_anh3.png'),
(4, 'Honda Air Blade 160i', 'Air Blade sở hữu vẻ ngoài ấn tượng lấy cảm hứng từ &#34;tia sét&#34;, thiết kế tổng thể phản chiếu sự cứng cáp trong bề mặt hiện đại xen lẫn những đường nét gọn gàng, sắc nét.\r\nAir Blade được trang bị hệ thống động cơ eSP+ 4 van, giúp tăng công suất, vận hành êm ái, tiết kiệm nhiên liệu và thân thiện môi trường.', 45000000, 'airblade160_anh1.png', 'airblade160_anh2.png', 'airblade160_anh3.png'),
(5, 'Honda CB 500 Hornet', 'Hệ thống HSTC quản lý độ bám đường của bánh sau trong mọi điều kiện, đặc biệt là khi đi trên đường trơn trượt. Hệ thống có thể được tắt hoàn toàn khi đi trên đường đất hoặc sỏi để đảm bảo khả năng truyền lực tối đa.', 185000000, 'cb500hornet_anh1.png', 'cb500hornet_anh2.png', 'cupc125_anh3.png'),
(6, 'Honda Super Cup125i', 'Động cơ dung tích 125cc, SOHC, trang bị PGM-FI, đạt công suất tối đa 6,87kW và mô men xoắn cực đại 10,15Nm mang lại khả năng vận hành mạnh mẽ và tiết kiệm nhiên liệu tối ưu', 88000000, 'cupc125_anh1.png', 'cupc125_anh2.png', 'cupc125_anh3.png'),
(7, 'Ducati Diavel V4', 'Cỗ máy V4 của chiếc xe là phiên bản Granturismo được Ducati ra mắt với Multistrada V4. Tuy nhiên Ducati đã điều chỉnh lại một chút với Diavel V4, khiến động cơ dung tích xy lanh 1.158cc cho 168 mã lực tại 10.750 vòng/phút và mô-men xoắn 128 Nm tại 7.750 vòng/phút. Để nhấn mạnh về 4 xi-lanh, Ducati đã thiết kế cho chiếc xe hệ thống xả với pô 4 nòng khá độc đáo.', 1000000000, 'diavel_v4_anh1.png', 'exciter_anh2.png', 'diavel_v4_anh3.png'),
(8, 'SYM Elite 50cc', 'Xe ga 50cc Elite SYM là dòng xe phân khối nhỏ. Thiết kế kiểu dáng hoài cổ, độc đáo, đậm chất nữ tính. Với Elite SYM bạn đã có thêm sự lựa chọn mới cho mình.\r\n\r\nXe SYM Elite có thiết kế thanh lịch, gọn gàng. Xe phù hợp với học sinh, sinh viên, đặc biệt là phái yếu. Thân xe nhỏ gọn với ngoại hình là sự kết hợp giữa những khối hình tròn với đường cong mềm mại. Vì vậy, Elite SYM có kiểu dáng rất…con gái!', 25000000, 'elite50_anh1.jpg', 'elite50_anh2.jpg', 'elite50_anh3.jpg'),
(9, 'Yamaha Exciter', 'Yamaha Exciter mới được thiết kế theo xu hướng những mẫu xe phân khối lớn Sport Bike.\r\nYamaha Exciter 150 mới có thiết kế tổng thể có các kích thước dài x rộng x cao là 1.985 x 670 x 1.100 mm (dài hơn phiên bản cũ 15 mm và cao hơn 20 mm).\r\nNgoài ra, khoảng sáng gầm cũng được thêm vào 20 mm lên thành 155 mm, chiều cao yên cũng được tăng lên thành 795 mm (tăng 15 mm), trọng lượng của Exciter tăng thêm 2 kg so với thế hệ trước là 117 kg.', 50000000, 'exciter_anh1.png', 'icone_anh2.png', 'exciter_anh3.png'),
(10, 'Honda Icon E', 'Hệ thống điện chất lượng cao\r\nICON e: sử dụng động cơ điện tích hợp trong bánh xe phía sau với công suất khoảng 1,5 kW, giúp mang lại kích thước thon gọn. Pin xe được đặt dưới sàn để chân và một bộ', 24000000, 'icone_anh1.png', 'icone_anh2.png', 'icone_anh3.png'),
(11, 'Yamaha Janus 2024', 'Xe máy Janus Yamaha có thiết kế trẻ trung cùng khả năng vận hành mượt mà với mức giá rất phải chăng. Sở hữu động cơ Blue Core, hệ thống Stop & Start và chức năng One push start, xe Janus có khả năng tiết kiệm nhiên liệu với mức tiêu thụ chỉ 1,87 lít/100km - nằm trong Top đầu xe tay ga tiết kiệm xăng nhất Việt Nam. Giá xe Janus 2024 với mức giá rất hấp dẫn chỉ từ 28.571.000 đồng.', 28571000, 'janus_anh1.png', 'janus_anh2.png', 'janus_anh3.png'),
(13, 'Kawasaki Versys 650', 'Versys 650 Mới được tạo ra để vượt qua từng ngõ ngách trong thành phố hoặc đi đến những vùng đất mới. Mẫu xe được thiết kế cùng bạn chinh phục vạm dặm, tiềm năng của một mẫu xe touring trên Versys 650 là vô hạn, đưa người lái, bạn đồng hành và cả hành lý của các bạn đến một chuyến phiêu lưu tuyệt vời.', 251000000, 'kawasaki_versys650_anh1.png', 'kawasaki_versys650_anh2.png', 'kawasaki_versys650_anh3.png'),
(14, 'KAWASAKI Z500', 'Z500 - người kế nhiệm của dòng xe Z400 là mẫu xe naked mới nhất được Kawasaki Motors Vietnam giới thiệu vào tháng 8 năm 2024. Với động cơ được tăng cường hiệu suất, trang bị thêm công nghệ và trọng lượng nhẹ, Z500 là một cỗ máy hoàn hảo làm phương tiện di chuyển hàng ngày', 170600000, 'kawasakiz500_anh1.png', 'kawasakiz500_anh2.png', 'kawasakiz500_anh3.png'),
(15, 'Lead 2024', 'Sở hữu động cơ eSP+ 4 van đã được áp dụng lần lượt trên các mẫu xe tay ga cao cấp của Honda Việt Nam. Đây là bước đột phá trong công nghệ động cơ của Honda, giúp tăng hiệu suất hoạt động, khả năng vận hành mạnh mẽ vượt trội, tiết kiệm nhiên liệu và thân thiện môi trường.', 40000000, 'lead2024_anh1.png', 'lead2024_anh2.png', 'lead2024_anh3.png'),
(16, 'Yamaha NEO&#39;S', 'Yamaha NEO’s là dòng xe điện đang được xuất khẩu và bán ở thị trường Châu Âu, nay đã chính thức có mặt tại Việt Nam. Những tính năng và công nghệ của NEO&#39;s giúp mẫu xe này trở thành phương tiện di chuyển xanh và thân thiện với môi trường. Yamaha NEO&#39;s hứa hẹn sẽ là chiếc xe thông minh dành cho các bạn trẻ năng động, thời thượng, hiện đại và hướng tới tương lai.', 49091000, 'neo&#39;s_anh1.png', 'neo&#39;s_anh2.png', 'neo&#39;s_anh3.png'),
(17, 'SYM Passing 50', 'Động cơ 50 phân khối cải tiến mới, máy mạnh, nổ êm, tiết kiệm xăng, mức tiêu thụ xăng trong tầm 2.03L/100km, giúp tiết kiệm chi phí.\r\nHộc hành lý lớn hơn, dung tích đến 7L so với xe cùng loại chỉ 5L. Rất tiện dụng khi cất nón bảo hiểm và tư trang mang theo.\r\nHộc hành lý lớn hơn, dung tích đến 7L so với xe cùng loại chỉ 5L. Rất tiện dụng khi cất nón bảo hiểm và tư trang mang theo.\r\nVành hợp kim đúc cực bền cùng với lốp 14 inch phù hợp với mọi điều kiện đường sá Việt Nam.\r\n', 24700000, 'passing50_anh1.png', 'passing50_anh2.png', 'passing50_anh3.png'),
(18, 'Yamaha PG-1', 'Yamaha PG-1 là sự kết hợp từ sự vận hành dễ dàng của một chiếc xe đô thị cùng khả năng off-road của một mẫu xe việt dã. Chiếc xe này vừa mang lại sự tiện lợi khi di chuyển trong nội đô, vừa có hiệu suất đủ tốt để đáp ứng những hành trình xa, mang lại cảm hứng lái xe khác biệt.', 30437000, 'pg-1_anh1.png', 'pg-1_anh2.png', 'pg-1_anh3.png'),
(19, 'Honda Rebel 1100', 'Rebel 1100 có phiên bản trang bị hộp số tự động ly hợp kép sáu cấp DCT, trong đó người lái có thể tự lựa chọn cấp số phù hợp (thông qua nút bấm bên tay trái) hoặc để xe tự hoạt động với tính năng tự lựa chọn cấp số theo từng lựa chọn chế độ lái.', 449000000, 'rebel1100_anh1.png', 'rebel1100_anh2.png', 'rebel1100_anh3.png'),
(20, 'Honda NX500', 'Hệ thống HSTC quản lý độ bám đường của bánh sau trong mọi điều kiện, đặc biệt là khi đi trên đường trơn trượt. Hệ thống có thể được tắt hoàn toàn khi đi trên đường đất hoặc sỏi để đảm bảo khả năng truyền lực tối đa.', 194290000, 'rx500_anh1.png', 'rx500_anh2.png', 'rx500_anh3.png'),
(21, 'Honda SH 160i', 'SH160i mới còn trang bị tính năng OTA update (một phương thức truyền tải dữ liệu) cho phép khách hàng chủ động cập nhật phần mềm cho thiết bị Bluetooth của xe thông qua ứng dụng My Honda+ nhằm đảm bảo kết nối bluetooth ổn định.\r\n\r\n(*) Chức năng được trang bị trên phiên bản SH160i.\r\nVui lòng đọc kỹ sách hướng dẫn sử dụng xe để đảm bảo an toàn.&#34;', 73921091, 'sh160i_anh1.jpg', 'sh160i_anh2.jpg', 'sh160i_anh3.jpg'),
(22, 'Honda SH 350i', 'SH350i là mẫu xe gây ấn tượng với dáng vẻ &#34;bề thế&#34; và hiện đại. Logo SH được mạ crôm tối màu tạo điểm nhấn sang trọng.\r\n\r\nMặt nạ phía trước được thiết kế mới mang dấu ấn của mẫu xe phân khối lớn và được tô điểm với họa tiết chấm tròn tạo điểm nhấn thể thao của chiếc xe. Công nghệ LED hiện đại được áp dụng cho toàn bộ hệ thống đèn mang lại hình ảnh cao cấp.\r\n', 152690000, 'sh350i_anh1.png', 'sh350i_anh2.png', 'sh350i_anh3.png'),
(23, 'SYM Shark 50', 'Bánh xe lớn Bánh xe 14 Inches giúp ổn định cho người lái và xử lý tình huống tốt hơn.\r\nSàn để chân rộng rãi, thoái mái hơn cho người lái xe.\r\nChứa được hai mũ bảo hiểm nửa đầu và các vật dụng cá nhân khác\r\n\r\n', 24500000, 'shark50_anh1.png', 'shark50_anh2.png', 'shark50_anh3.png'),
(24, 'Yamaha Sirius', 'Yamaha Sirius là mẫu xe số bền bỉ đã có mặt tại thị trường Việt Nam từ hơn 20 năm trước. Cho đến nay, dòng xe này đã được cải tiến đáng kể về thiết kế và động cơ. Giá xe Sirius năm 2024 chỉ từ 18,9 triệu VNĐ cho các phiên bản phanh cơ, phanh đĩa và vành đúc.\r\n', 21895000, 'sirius_anh1.png', 'sirius_anh2.png', 'sirius_anh3.png'),
(25, 'Honda Transalp', 'Một trong những điểm đáng chú ý nhất về Transalp chính là động cơ. Công suất tối đa 67,5kW, mô-men xoắn cực đại 75Nm - đều là những con số cực kỳ ấn tượng cho cỗ máy dung tích 755cc. Nhưng không dừng lại ở đó, khối động cơ xi-lanh đôi song song 8 van này sở hữu công nghệ nạp khí xoáy (Air Vortex) giúp xe phản ứng mượt mà ở vòng tua thấp và trung bình, và ở vòng tua máy cao, lớp mạ Ni-SiC chuyên dụng trên xy lanh hỗ trợ giảm ma sát hiệu quả và tăng cường sức mạnh động cơ. Nhờ đó, Transalp trở thà', 309000000, 'transalp_anh1.png', 'transalp_anh2.png', 'transalp_anh3.png'),
(26, 'Vespa GTV Sei Giorni 300Hpe', 'Vespa GTV Sei Giorni 300 là một phiên bản độc đáo và đẳng cấp của dòng xe Vespa.  Được đặt tên theo sự kiện lịch sử nổi tiếng &#34;Sei Giorni Internazionale di Varese&#34; năm 1951, nơi Vespa đã giành chiến thắng 6 ngày liên tiếp trong cuộc đua kinh điển. Không chỉ là biểu tượng của phong cách Ý mà còn là một tác phẩm nghệ thuật di động.', 159800000, 'vespa_gtv_seigiorni300hpe_anh1.png', 'vespa_gtv_seigiorni300hpe_anh2.png', 'vespa_gtv_seigiorni300hpe_anh3.png'),
(27, 'Vespa Sprint 125', 'Kế thừa thế hệ mang tính biểu tượng của những chiếc Vespa phong cách thể thao, linh hoạt đã tràn ngập các thị trấn và thành phố ở Châu Âu trong những năm 60, Vespa Sprint 125cc ngày nay đem đến một tinh thần tươi mới, tự do vốn có của những chiếc xe tay ga và những tay đua ngày ấy, cùng đó chào đón công nghệ tiên tiến nhất của thế kỷ XXI.', 81000000, 'vespa_sprint125_anh1.png', 'vespa_sprint125_anh2.png', 'vespa_sprint125_anh3.png'),
(28, 'Honda Vison Sport', 'Thân xe nhỏ gọn kế thừa nét thiết kế của dòng xe SH, với những đường nét rõ ràng, liền mạch kết hợp hài hòa với phong cách trẻ trung, thời trang, nay nổi bật và cuốn hút hơn với màu mới lạ trên phiên bản đặc biệt.\r\nNgoài ra, các họa tiết tinh tế được thể hiện trên nhiều chi tiết thiết kế giúp đem lại hình ảnh thời trang cho mẫu xe mới.', 31113818, 'visonsport_anh1.png', 'visonsport_anh2.png', 'visonsport_anh3.png'),
(29, 'Honda Wave Alpha 110', 'Wave Alpha được trang bị động cơ 110cc bền bỉ, hiệu suất vượt trội mà vẫn đảm bảo khả năng tiết kiệm nhiên liệu một cách tối ưu, từ đó đem lại cảm giác lái thú vị và tiết kiệm chi phí vận hành.', 18000000, 'wave110_anh1.png', 'wave110_anh2.png', 'wave110_anh3.png'),
(30, 'Honda WinnerX 2024', 'Với trọng lượng mâm trước nhẹ hơn 282 gam, và mâm sau nhẹ hơn 170 gam, WINNER X 2024 mang lại cảm giác lái nhẹ & linh hoạt hơn, dễ dàng trong điều khiển & chuyển hướng lái. Bên cạnh đó mâm xe thiết kế mới tạo nét thể thao & năng động hơn, hướng tới hình ảnh đậm chất thể thao.', 50560000, 'winnerx2024_anh1.png', 'winnerx2024_anh2.png', 'winnerx2024_anh3.png'),
(31, 'Ducati XDiavel S', 'Ducati bước vào thế giới Cruiser bike bằng một cách rất riêng, kết hợp những ưu điểm tuyệt vời nhất của cả hai thế giới. Thế giới Ducati: hiệu suất mạnh mẽ, phong cách thể thao, trang bị điện tử tiên tiến.\r\n\r\nThế giới cruiser: phần gác chân dài, thấp, đặt lên phía trước, mô-men xoắn mạnh mẽ ngay cả ở vận tốc nhỏ, sự hài hòa ở cả chất liệu và chi tiết.', 350000000, 'XDiavelS_anh1.png', 'XDiavelS_anh2.png', 'XDiavelS_anh3.png'),
(32, 'Yamaha XS 155R', 'Yamaha XS155R được Yamaha Motor Việt Nam phân phối chính hãng từ đầu năm 2023. Đây là dòng xe rất đáng được mong chờ nhờ thiết kế cổ điển đẹp mắt nhưng vẫn sở hữu khối động cơ mạnh mẽ. Với thông điệp “Feel your ride: Lái cảm xúc, Chất đam mê”, XS155R được kỳ vọng mang đến những trải nghiệm lái phấn khích và thú vị cho khách hàng.', 77000000, 'xs155r_anh1.png', 'xs155r_anh2.png', 'xs155r_anh3.png'),
(33, 'Kawasaki Z900RS', 'Kawasaki Z900 lần đầu được ra mắt vào năm 2017 đã lập tức gây tiếng vang trong giới biker - một chiếc xe naked bike phân khúc 900cc, 4 máy với mức giá rất hấp dẫn. So với bản người tiền nhiệm là Z800, Z900 được đánh giá là chạy &#34;vui&#34; hơn, mượt mà hơn. Những đường nét thiết kế vẫn mang nét đặc trưng Sugomi của những mẫu xe Naked nhà Kawasaki. Về tổng thể, thiết kế của Z900 khá hài hòa và &#34;chiến&#34;.', 320900000, 'z9000rs_anh1.png', 'z900rs_anh2.png', 'z9000rs_anh3.png');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`) VALUES
(1, 'test', 'test1@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `pid` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(100) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `wishlist`
--

INSERT INTO `wishlist` (`id`, `user_id`, `pid`, `name`, `price`, `image`) VALUES
(2, 1, 6, 'Honda Super Cup125i', 88000000, 'cupc125_anh1.png'),
(3, 1, 7, 'Ducati Diavel V4', 1000000000, 'diavel_v4_anh1.png');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
