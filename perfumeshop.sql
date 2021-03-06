USE [perfumeshop]
GO
/****** Object:  Table [dbo].[about]    Script Date: 1/14/2021 11:42:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[about](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[description] [nvarchar](4000) NOT NULL,
	[img] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_about] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[bill_detail]    Script Date: 1/14/2021 11:42:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bill_detail](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[id_bill] [bigint] NOT NULL,
	[quantity] [int] NOT NULL,
	[id_product] [int] NOT NULL,
 CONSTRAINT [PK_bill_detail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[bill_status]    Script Date: 1/14/2021 11:42:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bill_status](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_bill_status] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[bills]    Script Date: 1/14/2021 11:42:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bills](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[id_user] [bigint] NOT NULL,
	[id_status] [int] NOT NULL,
	[total] [float] NOT NULL,
	[checkout_day] [datetime] NULL,
	[checkin_day] [datetime] NOT NULL,
	[notes] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_bills] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[brands]    Script Date: 1/14/2021 11:42:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[brands](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_brands] UNIQUE CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[contact]    Script Date: 1/14/2021 11:42:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contact](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[email] [nvarchar](255) NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[content] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_contact] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[products]    Script Date: 1/14/2021 11:42:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[price] [float] NOT NULL,
	[quantity] [int] NOT NULL,
	[year] [int] NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[madein] [nvarchar](255) NOT NULL,
	[update_at] [datetime] NOT NULL,
	[id_supplier] [int] NOT NULL,
	[id_brand] [int] NOT NULL,
	[id_status] [int] NOT NULL,
	[id_sex] [int] NOT NULL,
	[url_img] [varchar](255) NOT NULL,
 CONSTRAINT [PK_products] UNIQUE CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[roles]    Script Date: 1/14/2021 11:42:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[id] [int] NOT NULL,
	[roleName] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_roles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sex]    Script Date: 1/14/2021 11:42:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sex](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_sex] UNIQUE CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[status_product]    Script Date: 1/14/2021 11:42:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[status_product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_status_product] UNIQUE CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[supplier]    Script Date: 1/14/2021 11:42:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[supplier](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[address] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_supplier] UNIQUE CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[user_role]    Script Date: 1/14/2021 11:42:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_role](
	[id_user] [bigint] NOT NULL,
	[id_role] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[users]    Script Date: 1/14/2021 11:42:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[users](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[displayName] [nvarchar](255) NOT NULL,
	[username] [varchar](255) NOT NULL,
	[email] [varchar](500) NOT NULL,
	[phone] [varchar](50) NOT NULL,
	[password] [varchar](100) NOT NULL,
	[active] [bit] NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[about] ON 

INSERT [dbo].[about] ([id], [description], [img]) VALUES (1, N'Nước hoa chính hãng là những chai nước hoa Auth nhập khẩu từ các thương hiệu dầu thơm nổi tiếng trên thế giới. Nước hoa không chỉ là mùi hương mà còn thể hiện phong cách cá tính của người dùng nó, đặc biệt hơn Nước hoa còn giúp bạn gây ấn tượng, thiện cảm với những người xunh quanh.

Sự tinh tế của mùi hương và ý tưởng hình thành của nhà sản xuất, Nước hoa nhập khẩu trên sàn thương mại KingperfumeShop hiện nay có 300+ chai nước hoa nữ, 150+ chai nước hoa nam và 43 chai nước hoa Unisex cho cả nam và nữ với da dạng phong cách và hương thơm.', N'https://rubeedecor.com/public/upload/images/news/noi-that-cua-hang-nuoc-hoa-3.jpg')
SET IDENTITY_INSERT [dbo].[about] OFF
SET IDENTITY_INSERT [dbo].[bill_detail] ON 

INSERT [dbo].[bill_detail] ([id], [id_bill], [quantity], [id_product]) VALUES (1, 4, 1, 5)
INSERT [dbo].[bill_detail] ([id], [id_bill], [quantity], [id_product]) VALUES (2, 5, 1, 7)
INSERT [dbo].[bill_detail] ([id], [id_bill], [quantity], [id_product]) VALUES (3, 6, 1, 3)
INSERT [dbo].[bill_detail] ([id], [id_bill], [quantity], [id_product]) VALUES (4, 7, 1, 1)
INSERT [dbo].[bill_detail] ([id], [id_bill], [quantity], [id_product]) VALUES (5, 8, 1, 3)
INSERT [dbo].[bill_detail] ([id], [id_bill], [quantity], [id_product]) VALUES (6, 8, 1, 11)
INSERT [dbo].[bill_detail] ([id], [id_bill], [quantity], [id_product]) VALUES (7, 10, 1, 13)
INSERT [dbo].[bill_detail] ([id], [id_bill], [quantity], [id_product]) VALUES (8, 11, 2, 16)
INSERT [dbo].[bill_detail] ([id], [id_bill], [quantity], [id_product]) VALUES (9, 11, 1, 14)
SET IDENTITY_INSERT [dbo].[bill_detail] OFF
SET IDENTITY_INSERT [dbo].[bill_status] ON 

INSERT [dbo].[bill_status] ([id], [name]) VALUES (1, N'Đã thanh toán')
INSERT [dbo].[bill_status] ([id], [name]) VALUES (2, N'Chờ thanh toán')
INSERT [dbo].[bill_status] ([id], [name]) VALUES (3, N'Hủy đơn hàng')
SET IDENTITY_INSERT [dbo].[bill_status] OFF
SET IDENTITY_INSERT [dbo].[bills] ON 

INSERT [dbo].[bills] ([id], [id_user], [id_status], [total], [checkout_day], [checkin_day], [notes]) VALUES (4, 1, 1, 1500000, CAST(N'2021-01-08 00:00:00.000' AS DateTime), CAST(N'2021-01-08 00:00:00.000' AS DateTime), N'Hihi')
INSERT [dbo].[bills] ([id], [id_user], [id_status], [total], [checkout_day], [checkin_day], [notes]) VALUES (5, 1, 2, 2200000, NULL, CAST(N'2021-01-09 00:00:00.000' AS DateTime), N'Hihi')
INSERT [dbo].[bills] ([id], [id_user], [id_status], [total], [checkout_day], [checkin_day], [notes]) VALUES (6, 3, 1, 3000000, CAST(N'2021-01-09 00:00:00.000' AS DateTime), CAST(N'2021-01-09 00:00:00.000' AS DateTime), N'Hihi')
INSERT [dbo].[bills] ([id], [id_user], [id_status], [total], [checkout_day], [checkin_day], [notes]) VALUES (7, 1, 1, 2500000, CAST(N'2021-01-11 00:00:00.000' AS DateTime), CAST(N'2021-01-10 00:00:00.000' AS DateTime), N'Hihi')
INSERT [dbo].[bills] ([id], [id_user], [id_status], [total], [checkout_day], [checkin_day], [notes]) VALUES (8, 1, 2, 6250000, NULL, CAST(N'2021-01-10 00:00:00.000' AS DateTime), N'Hihi')
INSERT [dbo].[bills] ([id], [id_user], [id_status], [total], [checkout_day], [checkin_day], [notes]) VALUES (9, 1, 2, 0, NULL, CAST(N'2021-01-13 00:00:00.000' AS DateTime), N'Hihi')
INSERT [dbo].[bills] ([id], [id_user], [id_status], [total], [checkout_day], [checkin_day], [notes]) VALUES (10, 1, 2, 1600000, NULL, CAST(N'2021-01-13 00:00:00.000' AS DateTime), N'Hihi')
INSERT [dbo].[bills] ([id], [id_user], [id_status], [total], [checkout_day], [checkin_day], [notes]) VALUES (11, 1, 2, 11480000, NULL, CAST(N'2021-01-13 00:00:00.000' AS DateTime), N'Hihi')
SET IDENTITY_INSERT [dbo].[bills] OFF
SET IDENTITY_INSERT [dbo].[brands] ON 

INSERT [dbo].[brands] ([id], [name]) VALUES (1, N'Christian Dior')
INSERT [dbo].[brands] ([id], [name]) VALUES (3, N'Chanel')
INSERT [dbo].[brands] ([id], [name]) VALUES (4, N'VERSACE')
INSERT [dbo].[brands] ([id], [name]) VALUES (5, N'Tom Ford')
INSERT [dbo].[brands] ([id], [name]) VALUES (6, N'Yves Saint Laurent')
INSERT [dbo].[brands] ([id], [name]) VALUES (7, N'HERMES')
INSERT [dbo].[brands] ([id], [name]) VALUES (8, N'Giorgio Armani')
INSERT [dbo].[brands] ([id], [name]) VALUES (9, N'Gucci')
INSERT [dbo].[brands] ([id], [name]) VALUES (17, N'Aventus')
SET IDENTITY_INSERT [dbo].[brands] OFF
SET IDENTITY_INSERT [dbo].[contact] ON 

INSERT [dbo].[contact] ([id], [name], [email], [title], [content]) VALUES (2, N'Lê Ngọc', N'ngochuy199x@gmail.com', N'ok', N'các mặt hàng rất tốt')
SET IDENTITY_INSERT [dbo].[contact] OFF
SET IDENTITY_INSERT [dbo].[products] ON 

INSERT [dbo].[products] ([id], [name], [price], [quantity], [year], [description], [madein], [update_at], [id_supplier], [id_brand], [id_status], [id_sex], [url_img]) VALUES (1, N'Dior Sauvage Eau de Toilette', 2500000, 200, 2015, N'Yêu hay ghét, thì với rất nhiều người, Dior Sauvage vẫn luôn được công nhận là một chai nước hoa kinh điển của thế kỷ 21. Nếu bạn so sánh về mức độ phủ sóng của Sauvage và nhìn về năm phát hành của nó, cuối "năm 2015" thì bạn chắc chắn sẽ rất ngạc nhiên về sự nổi tiếng nhanh đến đáng sợ của gã đàn ông lắm tài nhiều tật này. Mọi người hay so sánh sự nổi tiếng giữa Sauvage của nhà Dior và Bleu de Chanel của nhà Chanel, xem thử ai là kẻ mạnh hơn, nhưng chung quy lại thì là kẻ 8 lạng người hơn nửa cân. Được đánh giá là đậm chất đàn ông,  Dior Sauvage mang trong mình mùi hương của sự phong lưu, mạnh mẽ và sát gái. Như chính người đại diện cho chai nước hoa này vậy, Johnny Depp, kẻ cướp biển được yêu quý nhất mọi thời đại. Vốn dĩ  Dior Sauvage là vậy, có tật, Bad boy nhưng ai cũng yêu quý và phục tùng. Francois Demachy, người sáng tạo ra  Dior Sauvage đã khéo léo pha trộn giữa Cam Bergamot và hương Ambroxan, tạo nên một khoảng màu xanh tươi mát của bầu trời, cùng sự mạnh mẽ và ấm nồng của tiêu đen và Gỗ tuyết tùng,  Dior Sauvage trở nên lôi cuốn không có điểm dừng. Kết thúc một buổi gặp gỡ với những câu chuyện cười thông minh hòa lẫn không khí sang trọng, lãng mạn của hoa Lavender, mọi ánh mắt sẽ chỉ hướng về gã  Dior Sauvage này mà thôi. ', N'Pháp', CAST(N'2021-01-08 00:00:00.000' AS DateTime), 1, 1, 1, 1, N'https://kinperfume.com/wp-content/uploads/2017/05/p033087203528-item-4308xf3x1400x1400-m.jpg')
INSERT [dbo].[products] ([id], [name], [price], [quantity], [year], [description], [madein], [update_at], [id_supplier], [id_brand], [id_status], [id_sex], [url_img]) VALUES (3, N'Bleu De Chanel Eau De Parfum', 3000000, 200, 2010, N'Xuất hiện với cường độ cao nhất của nước hoa BLEU DE CHANEL, mạnh mẽ và tinh tế, BLEU DE CHANEL Parfum cho nam giới bộc lộ bản chất quyết tâm và nam tính mạnh mẽ. BLEU DE CHANEL Parfum đại diện cho màu sắc của tự do. BLEU DE CHANEL một hương thơm tiết lộ khí chất trong các nồng độ: Eau de toilette từ năm 2010, Eau de parfum từ năm 2014, Parfum năm 2018.

Một sự tươi trẻ thơm mát mở ra, kéo dài trên sự ấm áp, đong đầy cảm giác nghiện của gỗ tuyết tùng và gỗ đàn hương từ New Caledonia quét qua hương thơm mãnh liệt từ gỗ. BLEU DE CHANEL Parfum phá vỡ mọi qui ước, mọi khuôn khổ mang đến hương thơm gợi cảm, lịch lãm và đầy bản lĩnh của phái mạnh.

Với thiết kế chai màu đen sang trọng và huyền bí, BLEU DE CHANEL Parfum vẫn với mẫu chai mạnh mẽ thu hút ánh nhìn của đối phương điểm xuyết tên dòng nước hoa và thương hiệu với mạ vàng nổi bật.', N'Pháp', CAST(N'2021-01-09 00:00:00.000' AS DateTime), 5, 3, 1, 1, N'https://kinperfume.com/wp-content/uploads/2017/05/3chanel_1-600x600.jpg')
INSERT [dbo].[products] ([id], [name], [price], [quantity], [year], [description], [madein], [update_at], [id_supplier], [id_brand], [id_status], [id_sex], [url_img]) VALUES (5, N'Versace Eros', 1500000, 100, 2010, N'Xuất hiện hùng vĩ như một vị thần Hy Lạp, Versace Eros với vẻ đẹp cổ kính như một bức tường thành, mát mẻ với màu xanh ngọc bích, mang trong mình hương thơm của Táo Xanh và Bạc hà, thanh mát mà toả hương cả một vùng trời. Quyền lực, kiêu hãnh và đầy định kiến, hấp dẫn các quý cô với sự ngọt ngào của Đậu Tonka và hoa Phong Lữ, một cảm giác kì lạ chưa từng có. Với phong thái của một ông chủ nhưng vẫn ấm áp và ngọt ngào , thoang thoảng mùi cỏ hương bài và vani. Sẵn sàng đấu tranh cho những điều mà anh ấy tin tưởng.', N'Ý', CAST(N'2021-01-13 00:00:00.000' AS DateTime), 1, 4, 1, 1, N'https://kinperfume.com/wp-content/uploads/2017/05/vereros100.jpg')
INSERT [dbo].[products] ([id], [name], [price], [quantity], [year], [description], [madein], [update_at], [id_supplier], [id_brand], [id_status], [id_sex], [url_img]) VALUES (6, N'Dior Joy', 2400000, 100, 2010, N'Nước hoa nữ Joy by Dior phù hợp với người trên 25 tuổi.Đây là dòng nước hoa Christian Dior này có độ lưu hương tạm ổn – 3 giờ đến 6 giờ. và độ tỏa hương thuộc dạng rất gần – thoang thoảng trên làn da.  Joy by Dior phù hợp để sử dụng trong cả ngày lẫn đêm vào mùa xuân.

Đây là dòng nước hoa Christian Dior thuộc nhóm Floral Woody Musk (Hương hoa cỏ Gỗ-Xạ hương). Bên cạnh đó, Hoa nhài và Xạ hương trắng là hai hương bạn có thể dễ dàng cảm nhận được nhất khi sử dụng nước hoa này.', N'Pháp', CAST(N'2021-01-13 00:00:00.000' AS DateTime), 6, 1, 1, 2, N'https://kinperfume.com/wp-content/uploads/2019/04/Dior-Joy-edp-90ml-600x600.jpg')
INSERT [dbo].[products] ([id], [name], [price], [quantity], [year], [description], [madein], [update_at], [id_supplier], [id_brand], [id_status], [id_sex], [url_img]) VALUES (7, N'Dior Homme Intense', 2450000, 100, 2013, N'Thương hiệu Christian Dior đã cho ra mắt mùi hương mới dành riêng cho phái mạnh với tên gọi Dior Homme Intense vào năm 2011. Được tạo ra bởi nhà điều chế danh tiếng Francois Demachy, Dior Homme Intense thuộc nhóm hương gỗ – hoa cỏ xạ hương. Lớp hương gỗ ấm áp làm nền móng và dần nâng đỡ hỗn hợp đầy ngọt ngào của vani và hổ phách mang đến một phiên bản Dior Homme Intense rất hài hòa, tuyệt vời và quyến rũ.', N'Pháp', CAST(N'2021-01-09 00:00:00.000' AS DateTime), 1, 1, 1, 1, N'https://kinperfume.com/wp-content/uploads/2017/06/D%C4%B0OR-HOMME-INTENSE-edp-100ml-2.png')
INSERT [dbo].[products] ([id], [name], [price], [quantity], [year], [description], [madein], [update_at], [id_supplier], [id_brand], [id_status], [id_sex], [url_img]) VALUES (11, N'Chanel Allure Homme Sport Extreme', 3250000, 100, 2010, N'Lấy cảm hứng từ những kỳ tích thể thao, người phá chế nước hoa của Chanel, Jacques Polge đã cho ra đời chai nước hoa Allure Homme Sport Eau Extreme,một phiên bản mới của Allure Homme Sport. Mẫu nước hoa nay được ra mắt vào năm 2012.Tổ hợp nước hoa này là sự hòa quyện tuyệt vời của quýt và đậu tonka, tạo nên một mùi hương lâu dài và làm hài lòng bất cứ ai sử dụng. Nước hoa tỏa hương đủ mạnh vào mùa đông, nhưng vẫn nhẹ nhàng vào những mùa xuân/hè.', N'Pháp', CAST(N'2021-01-10 00:00:00.000' AS DateTime), 1, 3, 1, 1, N'https://kinperfume.com/wp-content/uploads/2017/05/chanel-allure-homme-sport-eau-extreme-1-600x600.jpg')
INSERT [dbo].[products] ([id], [name], [price], [quantity], [year], [description], [madein], [update_at], [id_supplier], [id_brand], [id_status], [id_sex], [url_img]) VALUES (12, N'Acqua di giò Profumo', 2100000, 200, 2015, N'Nước hoa nam Acqua di Gio Profumo được cho ra mắt vào năm 2015. Đây là dòng nước hoa Giorgio Armani thuộc nhóm Aromatic Aquatic (Hương thơm biển) hướng đến độ tuổi trên 25 tuổi. Alberto Morillas chính là nhà pha chế ra loại nước hoa này.

Acqua di Gio Profumo có độ lưu hương lâu – 6 giờ đến 12 giờ và độ tỏa hương thuộc dạng gần – toả hương trong vòng một cánh tay.  Acqua di Gio Profumo phù hợp để sử dụng trong cả ngày lẫn đêm vào mùa xuân, hạ. Bên cạnh đó, Hương nước biển và Nhang (Hương) là hai hương bạn có thể dễ dàng cảm nhận được nhất khi sử dụng nước hoa này.', N'Pháp', CAST(N'2021-01-10 00:00:00.000' AS DateTime), 1, 8, 1, 1, N'https://kinperfume.com/wp-content/uploads/2017/05/513579-600x600.jpg')
INSERT [dbo].[products] ([id], [name], [price], [quantity], [year], [description], [madein], [update_at], [id_supplier], [id_brand], [id_status], [id_sex], [url_img]) VALUES (13, N'Gucci Flora', 1600000, 100, 2013, N'Hãng thời trang, nước hoa danh tiếng Gucci đã cho ra mắt phiên bản giới hạn hàng năm của dòng hương Gucci Flora với tên gọi Gorgeous Gardenia với màu tím lavender vào năm 2020.

Nước hoa Gucci Flora Gorgeous Gardenia Limited Edition phiên bản giới hạn năm 2020 có các thành phần hương trái cây và hoa trắng mang đến sự thanh lịch, tinh tế và vô cùng nữ tính như quả lê, quả mọng đỏ, hoa sứ trắng, chi dành dành. Nốt hương cuối có đường nấu, hoắc hương ấm áp giúp cho tổng thể mùi hương của Gorgeous Gardenia dai dẳng, bền mùi hơn.

Nước hoa Gucci Flora Gorgeous Gardenia phiên bản giới hạn 2020 được xem là mùi hương yêu, mang đến nguồn năng lượng tích cực, tươi tắn cho người dùng. Ngoài ra, những thành phần hoa trái của chai nước hoa này cũng mang hơi thở của mùa xuân, khắc họa vẻ đẹp của thiên nhiên khiến cho các nàng thêm sảng khoái khi “khoác” lớp hương này lên người.

Vẫn giữ nguyên thiết kế như dòng Gucci Flora, nước hoa Gucci Flora Gorgeous Gardenia phiên bản giới hạn 2020 có màu tím lavender khá đặc biệt, đầy khiêu khích cho những ai vô tình chạm mắt.', N'Pháp', CAST(N'2021-01-10 00:00:00.000' AS DateTime), 1, 9, 1, 2, N'https://kinperfume.com/wp-content/uploads/2020/11/Gucci-Flora-Gorgeous-Gardenia-Limited-Edition-EDT-50ml-n%E1%BB%AF.jpg')
INSERT [dbo].[products] ([id], [name], [price], [quantity], [year], [description], [madein], [update_at], [id_supplier], [id_brand], [id_status], [id_sex], [url_img]) VALUES (14, N'Tom Ford Soleil Blanc', 4500000, 200, 2016, N'Được ví như một tia sáng phản chiếu những tinh thể từ Mặt Trời xuống mặt nước, Tom Ford Soleil Blanc mang vẻ đẹp tươi sáng, lấp lánh. Hương thơm của Cam quýt lăn tăn cuộn mình trên mặt nước, cảm giác tươi mát và thanh khiết từ hỗn hợp Cam đắng, Cam Bergamot, Tinh dầu lá Chanh Hồng tiêu, Hoa Neroli và hoa Thanh yên. Thỉnh thoảng, bạn cũng có thể cảm nhận Tom Ford Soleil Blanc như một ly cocktail được pha chế cho những ngày hè nhiệt đới và được trang trí bởi những đoá hoa tuyệt đẹp. Hương Cam Quýt được trộn lẫn cùng vị Dừa, thêm một ít Vanilla thơm ngọt và trong lúc thưởng thức ly cocktail mát lạnh này, bạn lại nghe thoang thoảng mùi hương của Hoa nhài, Hoa huệ, Hoa cam cùng những đoá Ylang-Ylang. Tất cả hương vị được tái hiện trong Tom Ford Soleil Blanc hệt như bạn vừa đặt chân đến một bãi biển yên bình, nước lóng lánh cùng mặt trời và các giác quan được “phục vụ" bởi những thức quà từ thiên nhiên.', N'Pháp', CAST(N'2021-01-10 00:00:00.000' AS DateTime), 1, 5, 1, 3, N'https://kinperfume.com/wp-content/uploads/2021/01/Tom-Ford-Soleil-Blanc-50ml-unisex-600x600.jpg')
INSERT [dbo].[products] ([id], [name], [price], [quantity], [year], [description], [madein], [update_at], [id_supplier], [id_brand], [id_status], [id_sex], [url_img]) VALUES (15, N'Tom Ford Cafe Rose', 4600000, 0, 2009, N'Thương hiệu Tom Ford đã cho ra mắt một mùi hương hoa cỏ dòng đảo Síp mới dành cho cả phái nam và nữ với tên gọi Cafe Rose vào năm 2012. Được sáng tạo bởi chuyên gia Antoine Liu, Cafe Rose sẽ đưa bạn chạm đến đỉnh điểm của mọi cung bậc cảm xúc,

Hương cà phê trong Café Rose được sự dụng một cách khéo léo và tinh tế, gợi lên sự sâu lắng và ấm áp cho mùi hương hoa hồng mang đến sự tương phàn đầy thú vị. Giống như chú quỷ nhỏ đang ở trên vai của thiên thần, hương cà phê khi kết hợp với hoắc hương và các loại gỗ khác tạo nên bóng đen bao trùm, khôi dậy sự bí ẩn và nguy hiểm gận kề, trong khi đó, hương nghệ tây nhẹ nhàng và cổ điển, kết hợp với hương hoa hồng đầy ngọt ngào mang đến một cảm nhận rất mềm mại và không kém phần sang trọng. Mặc dù khi dần khô, mùi hương hoa hồng vẫn còn vương vấn, dường như muốn xuất hiện theo cách đầy lém lỉnh để vui chơi đùa giỡn, bạn sẽ luôn nhận ra nó một cách chính xác nhưng vẫn luôn ấn tượng và đắm chìm trong Café Noir.', N'Pháp', CAST(N'2021-01-12 00:00:00.000' AS DateTime), 1, 5, 2, 1, N'https://kinperfume.com/wp-content/uploads/2020/07/Tom-Ford-Cafe-Rose-100ml-600x600.jpg')
INSERT [dbo].[products] ([id], [name], [price], [quantity], [year], [description], [madein], [update_at], [id_supplier], [id_brand], [id_status], [id_sex], [url_img]) VALUES (16, N'Chanel Coco Mademoiselle', 3490000, 200, 2020, N'Vẫn là cô, vẫn là vẻ đẹp quyến luyến tuyệt phần nay càng thêm quyến rũ khi trút bỏ tấm vải lụa trên người đi. Giờ đây với vẻ trần trụi và bộc bạch, không giấu giếm, Coco Mademoiselle L’Eau Privee Chanel như mảnh nam châm ẩn mình dưới những cánh hoa hồng, ngát hương và cực kỳ thu hút.

Khẽ khàng chuyển động, bước đi của cô bồng bềnh dưới sự nâng đỡ của hương Quýt nhẹ tênh, trong trẻo. Thoát mình khỏi những chuẩn mực vẻ đẹp thông thường, Coco Mademoiselle L’Eau Privee khoan khoái hát lên những giai thoại tuy bình dị nhưng đầy duy mỹ với hoa hồng. Người ta hay so sánh hoa hồng với mỹ nhân, và quả thật đó chưa bao giờ là một phép so sánh sai lầm khi đến với Coco Mademoiselle L’Eau Privee.

Bóc tách từng cánh hoa, ta như gỡ bỏ lớp vải che lấy thân hình kiều diễm kia. Và trong những phút giây chững lại trong đời, ta cho phép bản thân mình chìm đắm trong tông vị ngọt ngào mà nồng nàn, quấn quýt lấy khứu giác, lấy làn da ta mãi không rời.', N'Pháp', CAST(N'2021-01-10 00:00:00.000' AS DateTime), 1, 3, 1, 2, N'https://kinperfume.com/wp-content/uploads/2020/11/Chanel-Coco-Mademoiselle-Leau-Privee-Eau-Pour-La-Nuit-100ml-n%E1%BB%AF.jpg')
INSERT [dbo].[products] ([id], [name], [price], [quantity], [year], [description], [madein], [update_at], [id_supplier], [id_brand], [id_status], [id_sex], [url_img]) VALUES (17, N'Versace pour homme', 1200000, 200, 2008, N'Versace Pour Homme của nhãn hiệu Versace là chai nước hoa mới thuộc dòng hương thơm Fougere dành cho nam giới. Được giới thiệu vào năm 2008 với người sáng tạo ra dòng nước hoa này là Alberto Morllas. Thông qua hương thơm đầy nam tính , dứt khoát, Versace Pour Homme liên kết sức mạnh và sự say mê để tạo nên một người đàn ông năng động và thành đạt.', N'Ý', CAST(N'2021-01-10 00:00:00.000' AS DateTime), 1, 4, 3, 1, N'https://kinperfume.com/wp-content/uploads/2017/05/verph100.jpg')
INSERT [dbo].[products] ([id], [name], [price], [quantity], [year], [description], [madein], [update_at], [id_supplier], [id_brand], [id_status], [id_sex], [url_img]) VALUES (18, N'Versace Dylan Blue', 1490000, 200, 2016, N'Nước hoa nam Versace Pour Homme Dylan Blue phù hợp với người trên 25 tuổi.Đây là dòng nước hoa Versace này có độ lưu hương lâu – 7 giờ đến 12 giờ. và độ tỏa hương thuộc dạng gần – toả hương trong vòng một cánh tay. Versace Pour Homme Dylan Blue phù hợp để sử dụng trong cả ngày lẫn đêm vào mùa xuân, hạ, thu.

Đây là dòng nước hoa Versace thuộc nhóm Aromatic Fougere (Hương thơm dương xỉ). Versace Pour Homme Dylan Blue được cho ra mắt vào năm 2016. Bên cạnh đó, Hương Ambroxan và Cam Bergamot Calabria là hai hương bạn có thể dễ dàng cảm nhận được nhất khi sử dụng nước hoa này.', N'Ý', CAST(N'2021-01-10 00:00:00.000' AS DateTime), 1, 4, 2, 1, N'https://kinperfume.com/wp-content/uploads/2017/05/verbuedylan3-600x600.jpg')
SET IDENTITY_INSERT [dbo].[products] OFF
INSERT [dbo].[roles] ([id], [roleName]) VALUES (1, N'USER')
INSERT [dbo].[roles] ([id], [roleName]) VALUES (2, N'ADMIN')
INSERT [dbo].[roles] ([id], [roleName]) VALUES (3, N'SYSTEM')
SET IDENTITY_INSERT [dbo].[sex] ON 

INSERT [dbo].[sex] ([id], [name]) VALUES (1, N'Nam')
INSERT [dbo].[sex] ([id], [name]) VALUES (2, N'Nữ')
INSERT [dbo].[sex] ([id], [name]) VALUES (3, N'Unisex')
SET IDENTITY_INSERT [dbo].[sex] OFF
SET IDENTITY_INSERT [dbo].[status_product] ON 

INSERT [dbo].[status_product] ([id], [name]) VALUES (1, N'Còn hàng')
INSERT [dbo].[status_product] ([id], [name]) VALUES (2, N'Hết hàng')
INSERT [dbo].[status_product] ([id], [name]) VALUES (3, N'Ngưng sản xuất')
SET IDENTITY_INSERT [dbo].[status_product] OFF
SET IDENTITY_INSERT [dbo].[supplier] ON 

INSERT [dbo].[supplier] ([id], [name], [address]) VALUES (1, N'Showroom1', N'B2-08A KĐT Vinhomes Gardenia, Đường Hàm Nghi, P. Cầu Diễn, Nam Từ Liêm, Hà Nội')
INSERT [dbo].[supplier] ([id], [name], [address]) VALUES (5, N'Showroom2', N'183 Trung Kính, Yên Hòa, Cầu Giấy, Hà Nội')
INSERT [dbo].[supplier] ([id], [name], [address]) VALUES (6, N'Showroom3', N'97, Man Thiện, Hiệp Phú, Quận 9, Thành phố Hồ Chí Minh')
SET IDENTITY_INSERT [dbo].[supplier] OFF
INSERT [dbo].[user_role] ([id_user], [id_role]) VALUES (1, 1)
INSERT [dbo].[user_role] ([id_user], [id_role]) VALUES (2, 2)
INSERT [dbo].[user_role] ([id_user], [id_role]) VALUES (3, 1)
INSERT [dbo].[user_role] ([id_user], [id_role]) VALUES (9, 1)
INSERT [dbo].[user_role] ([id_user], [id_role]) VALUES (8, 2)
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [displayName], [username], [email], [phone], [password], [active]) VALUES (1, N'Lê Ngọc Huy', N'ngochuy', N'ngochuy199x@gmail.com', N'0966885346', N'123', 1)
INSERT [dbo].[users] ([id], [displayName], [username], [email], [phone], [password], [active]) VALUES (2, N'Admin', N'admin', N'admin@gmail.com', N'0999999999', N'123', 1)
INSERT [dbo].[users] ([id], [displayName], [username], [email], [phone], [password], [active]) VALUES (3, N'Lê Hùng', N'hung', N'hung@gmail.com', N'0865623964', N'1234', 0)
INSERT [dbo].[users] ([id], [displayName], [username], [email], [phone], [password], [active]) VALUES (8, N'Lê Hoàng', N'hoang', N'hoang@gmail.com', N'0977765555', N'123', 0)
INSERT [dbo].[users] ([id], [displayName], [username], [email], [phone], [password], [active]) VALUES (9, N'My Han', N'han', N'myhan2309@gmail.com', N'0865623964', N'123', 0)
SET IDENTITY_INSERT [dbo].[users] OFF
/****** Object:  Index [PK_brands_1]    Script Date: 1/14/2021 11:42:57 AM ******/
ALTER TABLE [dbo].[brands] ADD  CONSTRAINT [PK_brands_1] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_products_1]    Script Date: 1/14/2021 11:42:57 AM ******/
ALTER TABLE [dbo].[products] ADD  CONSTRAINT [PK_products_1] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_sex_1]    Script Date: 1/14/2021 11:42:57 AM ******/
ALTER TABLE [dbo].[sex] ADD  CONSTRAINT [PK_sex_1] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_status_product_1]    Script Date: 1/14/2021 11:42:57 AM ******/
ALTER TABLE [dbo].[status_product] ADD  CONSTRAINT [PK_status_product_1] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_supplier_1]    Script Date: 1/14/2021 11:42:57 AM ******/
ALTER TABLE [dbo].[supplier] ADD  CONSTRAINT [PK_supplier_1] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[bill_detail]  WITH CHECK ADD  CONSTRAINT [FK_bill_detail_bills] FOREIGN KEY([id_bill])
REFERENCES [dbo].[bills] ([id])
GO
ALTER TABLE [dbo].[bill_detail] CHECK CONSTRAINT [FK_bill_detail_bills]
GO
ALTER TABLE [dbo].[bill_detail]  WITH CHECK ADD  CONSTRAINT [FK_bill_detail_products] FOREIGN KEY([id_product])
REFERENCES [dbo].[products] ([id])
GO
ALTER TABLE [dbo].[bill_detail] CHECK CONSTRAINT [FK_bill_detail_products]
GO
ALTER TABLE [dbo].[bills]  WITH CHECK ADD  CONSTRAINT [FK_bills_bill_status] FOREIGN KEY([id_status])
REFERENCES [dbo].[bill_status] ([id])
GO
ALTER TABLE [dbo].[bills] CHECK CONSTRAINT [FK_bills_bill_status]
GO
ALTER TABLE [dbo].[bills]  WITH CHECK ADD  CONSTRAINT [FK_bills_users] FOREIGN KEY([id_user])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[bills] CHECK CONSTRAINT [FK_bills_users]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [FK_products_brands] FOREIGN KEY([id_brand])
REFERENCES [dbo].[brands] ([id])
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [FK_products_brands]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [FK_products_sex] FOREIGN KEY([id_sex])
REFERENCES [dbo].[sex] ([id])
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [FK_products_sex]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [FK_products_status_product] FOREIGN KEY([id_status])
REFERENCES [dbo].[status_product] ([id])
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [FK_products_status_product]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [FK_products_supplier] FOREIGN KEY([id_supplier])
REFERENCES [dbo].[supplier] ([id])
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [FK_products_supplier]
GO
ALTER TABLE [dbo].[user_role]  WITH CHECK ADD  CONSTRAINT [FK_user_role_roles] FOREIGN KEY([id_role])
REFERENCES [dbo].[roles] ([id])
GO
ALTER TABLE [dbo].[user_role] CHECK CONSTRAINT [FK_user_role_roles]
GO
ALTER TABLE [dbo].[user_role]  WITH CHECK ADD  CONSTRAINT [FK_user_role_users] FOREIGN KEY([id_user])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[user_role] CHECK CONSTRAINT [FK_user_role_users]
GO
