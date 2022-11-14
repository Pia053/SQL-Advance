	Create database QL_NhaTro
	go

	use QL_NhaTro
	go


-- tao bang loai nha 
	create table LoaiNha(
		MaLoaiNha nvarchar(15) not null constraint PK_LoaiNha primary key(MaLoaiNha),
		TenLoaiNha nvarchar(50) not null
	)

-- tao bang quan

	create table Quan(
		MaQuan nvarchar(15) not null constraint PK_Quan primary key(MaQuan),
		TenQuan nvarchar(20) not null,
	)

-- tao bang nguoi dung( co the la chu tro )

	create table NguoiDung(
		MaNguoiDung nvarchar(15) not null constraint PK_NguoiDung primary key(MaNguoiDung),
		TenNguoiDung nvarchar(50) not null,
		GioiTinh nvarchar(10) not null,
		DienThoai nvarchar(13) not null,
		DiaChi nvarchar(max) not null,
		Email	nvarchar(50) not null,
		MaQuan nvarchar(15) not null constraint FK_Quan_NguoiDung foreign key(MaQuan) references Quan,
	)

-- tao bang nha tro con  
-- thuoc tinh quan la chua co trong bang

	create table NhaTro(
		MaNhaTro nvarchar(15) not null constraint PK_NhaTro1 primary key(MaNhaTro),
		DienTich float not null,
		GiaPhong float not null,
		DiaChi nvarchar(max) not null,
		MoTa nvarchar(50) not null,
		NgayDangTin datetime not null,
		NguoiLienHe nvarchar(50) not null, --Là thành viên của Website được lưu trong bảng 
		MaLoaiNha nvarchar(15) not null constraint FK_LoaiNha_NhaTro1 foreign key(MaLoaiNha) references LoaiNha,
		MaQuan	nvarchar(15) not null constraint FK_Quan_NhaTro1 foreign key(MaQuan) references Quan,
		MaNguoiDung nvarchar(15) not null constraint FK_NguoiDung_NhaTro1 foreign key(MaNguoiDung) references NguoiDung
	)

-- tao bang nguoi dung nha tro (theo nguoi thue tro)

	create table NguoiDung_NhaTro(
		MaNhaTro nvarchar(15) not null constraint PK_NguoiDung_NhaTro foreign key(MaNhaTro) references NhaTro ,
		MaNguoiDung nvarchar(15) not null constraint PK_NhaTro_NguoiDung  foreign key(MaNguoiDung) references NguoiDung,
		NgayDen datetime not null,
		NgayDi datetime not null
		primary key(MaNhaTro, MaNguoiDung),
	)

-- tao bang danh gia 

	create table DanhGia(
		MaDanhGia nvarchar(15) not null constraint PK_DanhGia primary key(MaDanhGia),
		Like_DisLike bit not null,
		NoiDung text not null,
		MaNhaTro nvarchar(15) not null,
		MaNguoiDung nvarchar(15) not null ,
		foreign key(MaNhaTro,MaNguoiDung)  references NguoiDung_NhaTro(MaNhaTro,MaNguoiDung)  
	)

	select * from LoaiNha
-- nhập liệu cho bảng loại nhà
	insert into LoaiNha
	values	('LN01',N'Căn hộ'),
			('LN02',N'Nhà ở'),
			('LN03',N'Mặt bằng kinh doanh'),
			('LN04',N'Phòng trọ'),
			('LN05',N'Phòng trọ vip')
-- nhập liệu quận
	select * from Quan
	insert into Quan
	values	('Q01',N'Quận Ba Đình'),
			('Q02',N'Quận Hoàn Kiếm'),
			('Q03',N'Quận Hai Bà Trưng'),
			('Q04',N'Quận Đống Đa'),
			('Q05',N'Quận Tây Hồ'),
			('Q06',N'Quận Cầu Giấy'),
			('Q07',N'Quận Thanh Xuân')
-- nhập liệu Người dùng chủ trọ

	select * from NguoiDung
	insert into NguoiDung
	values	('ND0151',N'Nguyễn Thanh Lâm',N'Nữ','0915289995',N'Số 17, Nguyễn Văn Linh,Phúc Đồng','thanhlam051@gmail.com','Q06'),
			('ND0152',N'Nguyễn Thị Liên',N'Nữ','0825889995',N'Số 12, Lê Đức Thọ, Nam Từ Liêm','thilien052@gmail.com','Q01'),
			('ND0153',N'Dương Thế Phi',N'Nam','0915289999',N'Số 07, Nguyễn Duy Thì, Dương Nội','thephi053@gmail.com','Q04'),
			('ND0154',N'Hà Đình Bách',N'Nam','0928669995',N'Số 4, Văn Cao, Dịch Vọng Hậu','dinhbach054@gmail.com','Q06'),
			('ND0155',N'Vũ Vân Anh',N'Nữ','091528891',N'Số 14 , Đặng Thai Mai, Quảng An','vananh055@gmail.com','Q05'),
			('ND0156',N'Lê Minh Hiếu',N'Nam','0951221198',N'Số 28A , Hoàng Sâm, Phú Thượng','minhhieu056@gmail.com','Q05'),
			('ND0157',N'Nguyễn Tiến Đạt',N'Nam','0366784986',N'Số 17 , Hồ Nghĩa Đô ,Ngọc Khánh','tiendat057@gmail.com','Q01'),
			('ND0158',N'Hà Văn Tính',N'Nữ','0862034846',N'Số 31, Nguyễn Văn Hiền, Phú La','vantinh058@gmail.com','Q07'),
			('ND0159',N'Nguyễn Thị Quyên',N'Nữ','0355978321',N'Số 38, Võ Văn Kiệt, Yên Hoài','thiquyen059@gmail.com','Q02'),
			('ND0160',N'Ngô Sỹ Liên',N'Nữ','0325678989',N'Số 34 , Tô Hiệu, Lý Thái Tổ','sylien060@gmail.com','Q07'),
			('ND0161',N'Phan Công Anh',N'Nam','0819299399',N'Số 12, Phú Viên, Vạn Phúc','conganh061@gmail.com','Q02'),
			('ND0162',N'Nguyễn Hoài Nam',N'Nam','0988889968',N'Khu 8 Trại Cụ, Lý Thường Kiệt, Đồng Mai','hoainam062@gmail.com','Q02')

-- nhập dữ liệu nhà trọ 01.
	select * from NguoiDung
	select * from NhaTro
	select * from LoaiNha

-- xóa người liên hệ
	alter table NhaTro
	drop column NguoiLienHe
	select * from Quan
	insert into NhaTro
	values	('CH01','980','12000000',N'Số 21 , Tôn Đức Thắng, Văn Miếu',N'View Đẹp, Rộng','12-29-2020','LN01','Q01','ND0151'),
			('NO02','560','9000000',N'Số 6, Hàng Đào, Gia Ngư ',N'Thoáng mát, Gần kCN','12-12-2021','LN02','Q07','ND0152'),
			('VP03','200','3000000',N'Số 01, Nguyễn Khái, Minh Khai',N'Phòng 2 Người','01-01-2021','LN03','Q03','ND0156'),
			('PT04','150','2000000',N'Số 11, Tràng Thi, Lý Lam Đế',N'Phòng 2 Người','05-01-2021','LN04','Q02','ND0154'),
			('PTV05','300','3500000',N'Số 21, Ngõ Quỳnh, Thanh Nhàn',N'Phòng 2 Người','10-03-2021','LN05','Q03','ND0153'),
			('PTV06','350','4000000',N'Số 09, Lạc Long Quân, Thụy Khuê',N'Phòng 2 Người','12-05-2020','LN05','Q05','ND0157'),
			('PT07','190','1500000',N'Số 36, Đặng Thai Mai, Quảng An ',N'Phòng 1 Người','06-30-2020','LN04','Q05','ND0155'),
			('PT08','200','2000000',N'Số 24, Lạc Long Quân',N'Phòng 1 Người','04-30-2021','LN04','Q02','ND0156'),
			('CH09','680','1000000',N'Số 05, Trương Định, Đại La ',N'Phòng Gia Đìnhi','07-20-2020','LN01','Q03','ND0160'),
			('NO10','12000','20000000',N'Số 03, Lê Trọng Tấn',N'2 Mặt Tiền, Rộng','08-22-2020','LN02','Q06','ND0155'),
			('PT11','210','2100000',N'Số 21, Đê La Thành, Xã Đàn',N'Phòng Trọ SV','09-01-2021','LN04','Q04','ND0157'),
			('VP12','190','1600000',N'Số 63, Âu Cơ ',N'Phòng Trọ SV','07-28-2021','LN03','Q05','ND0162')
--nhập liệu cho Người dùng Nhà trọ.
	select * from NguoiDung_NhaTro
	select * from NhaTro
	insert into NguoiDung_NhaTro
	values ('CH01','ND0151','12-30-2020','12-30-2021'),
		('CH09','ND0160','07-31-2020','12-20-2020'),
		('NO02','ND0152','12-13-2021','01-12-2022'),
		('NO10','ND0155','08-30-2020','01-12-2022'),
		('PT04','ND0154','06-30-2021','12-12-2022'),
		('PT07','ND0155','07-30-2020','09-29-2021'),
		('PT08','ND0156','05-30-2021','12-30-2021'),
		('PTV06','ND0157','12-06-2020','12-30-2022'),
		('PTV05','ND0153','10-10-2021','12-12-2021'),
		('VP03','ND0156','01-02-2021','02-12-2022')
--nhập liệu cho đánh giá.
	select * from DanhGia
	select * from NguoiDung_NhaTro
	insert into DanhGia
	values	('DG001','1',N'Sạch, Đẹp, Rộng','CH01','ND0151'),
			('DG002','0',N'Phòng Tạm ổn','CH09','ND0160'),
			('DG003','1',N'Sạch, Đẹp, Rộng','NO02','ND0152'),
			('DG004','1',N'Sạch, Đẹp, Rộng','NO10','ND0155'),
			('DG005','0',N'Phòng Tạm ổn','PT04','ND0154'),
			('DG006','0',N'Giá cả không phù hợp','PT07','ND0155'),
			('DG007','1',N'Sạch, Đẹp, Rộng','PT08','ND0156'),
			('DG008','1',N'Sạch, Đẹp, Rộng','PTV05','ND0153'),
			('DG009','1',N'Sạch, Đẹp, Rộng','VP03','ND0156'),
			('DG010','1',N'Sạch, Đẹp, Rộng','PTV06','ND0157')
	------------------------------------------------------------------------------
--- Tạo ba Stored Procedure (SP) với các tham số đầu vào phù hợp.
--o SP thứ nhất thực hiện chèn dữ liệu vào bảng NGUOIDUNG
	if OBJECT_ID('Insert_NguoiDung') is not null
	drop proc Insert_NguoiDung
	go
	create proc Insert_NguoiDung 
		@MaNguoiDung nvarchar(15) = NULL,
		@TenNguoiDung nvarchar(50) = NULL,
		@GioiTinh nvarchar(10) = NULL,
		@DienThoai nvarchar(13) = NULL,
		@DiaChi nvarchar(max) = NULL,
		@Email nvarchar(50)= NULL,
		@MaQuan nvarchar(15) = NULL
	as
		begin
			begin try
				if(@MaNguoiDung is null or @TenNguoiDung is null or @GioiTinh is null or @DienThoai is null or @DiaChi is null or @Email is null or @MaQuan is null)
					begin 
						print N'Vui lòng không được để trống'
					end
				else 
					begin
						insert into NguoiDung
						values(@MaNguoiDung ,@TenNguoiDung,@GioiTinh ,@DienThoai ,@DiaChi ,@Email ,@MaQuan)
						print N'Thêm thành công'
					end
			end try
			begin catch
				print 'Lỗi ' + Error_Message()
			end catch
		end
	exec Insert_NguoiDung  'ND0165', N'Nguyễn Hoài Anh' , N'Nữ' , '0366784986', N'Hà Nội', 'minhhieu056@gmail.com', N'Q05'
	exec Insert_NguoiDung

--o SP thứ hai thực hiện chèn dữ liệu vào bảng NHATRO
	If OBJECT_ID('Insert_NhaTro') is not null
	drop proc Insert_NhaTro
	go
	create proc Insert_NhaTro 
		@MaNhaTro nvarchar(15) = null ,
		@DienTich float = null ,
		@GiaPhong float = null,
		@DiaChi nvarchar(max)= null,
		@MoTa nvarchar(50) = null,
		@NgayDangTin datetime = null,
		@MaLoaiNha nvarchar(15)= null,
		@MaQuan nvarchar(15) = null,
		@MaNguoiDung nvarchar(15) = null
	as 
		begin
			if(@MaNhaTro is null or @DienTich is null or @GiaPhong is null or @DiaChi is null or @MoTa is null or @NgayDangTin is null or 
			@MaLoaiNha is null or @MaQuan is null or  @MaNguoiDung is null)
				begin
					print N'Không được để trống các trường '
				end
			else 
				begin
					insert into NhaTro
					values(@MaNhaTro, @DienTich, @GiaPhong, @DiaChi, @MoTa, @NgayDangTin, @MaLoaiNha, @MaQuan, @MaNguoiDung)
					print N'Thêm dữ liệu thành công'
				end
		end
	exec Insert_NhaTro N'VP13', '200','1000000' ,'Số 2, Hoàng Quốc Việt', N'View đẹp', '12-01-2019','LN04','Q01', 'ND0157'
	exec Insert_NhaTro 
	select * from NhaTro
	select * from LoaiNha
	select * from quan
	select * from NguoiDung
--o SP thứ ba thực hiện chèn dữ liệu vào bảng DANHGIA
	select * from DanhGia

	if Object_Id('Insert_DanhGia') is not null
	drop proc Insert_DanhGia
	go
	create proc Insert_DanhGia 
		@MaDanhGia nvarchar(15) = NULL,
		@Like_DisLike bit = NULL,
		@NoiDung text = NULL,
		@MaNhaTro nvarchar(15) = NULL,
		@MaNguoiDung nvarchar(15) = NULL
	as 
		begin
			if(@MaDanhGia is null or @Like_DisLike is null or @NoiDung is null or @MaNhaTro is null or @MaNguoiDung is null)
				begin
					print N'Không được để trống các trường dữ liệu'
				end
			else
				begin
					insert into DanhGia
					values (@MaDanhGia, @Like_DisLike, @NoiDung, @MaNhaTro ,@MaNguoiDung )
					print N'Them du lieu thanh cong'
				end
		end
	exec Insert_DanhGia 
	exec Insert_DanhGia 'DG011','0',N'Giá không phù hợp','VP03','ND0156'
	select * from NguoiDung_NhaTro

--Yêu cầu đối với các SP: Trong mỗi SP phải kiểm tra giá trị các tham số đầu vào. Với 
--các cột không chấp nhận thuộc tính NULL, nếu các tham số đầu vào tương ứng với 
--chúng không được truyền giá trị, thì không thực hiện câu lệnh chèn mà in một thông báo
--yêu cầu người dùng nhập liệu đầy đủ.
--- Với mỗi SP, viết hai lời gọi. Trong đó, một lời gọi thực hiện chèn thành công dữ liệu,
--và một lời gọi trả về thông báo lỗi cho người dùng

	----------------------------------------------Test---------------------------------------------
	select * from NguoiDung
	select * from Quan

	if OBJECT_ID('Insert_NguoiDung_C2') is not null
	drop proc Insert_NguoiDung_C2
	go
	create proc Insert_NguoiDung_C2
		@MaNguoiDung nvarchar(15) = NULL,
		@TenNguoiDung nvarchar(50) = NULL,
		@GioiTinh nvarchar(10) = NULL,
		@DienThoai nvarchar(13) = NULL,
		@DiaChi nvarchar(max) = NULL,
		@Email nvarchar(50)= NULL,
		@MaQuan nvarchar(15) = NULL
	as
		begin
			begin try
				if(@MaNguoiDung is null or @TenNguoiDung is null or @GioiTinh is null or @DienThoai is null or @DiaChi is null or @Email is null or @MaQuan is null)
					begin 
						print N'Vui lòng không được để trống'
					end
				else if exists (select * from NguoiDung where MaNguoiDung like @MaNguoiDung) -- kiểm tra sự tồn tại khóa chính
					begin 
						print N'trùng khóa chính'
					end
				else if not exists (select * from Quan where MaQuan like @MaQuan)		--- kiểm tra sự tồn tại của khóa ngoại
					begin
						print N'Lỗi Khóa ngoại không thêm đc'
					end
				else 
					begin
						insert into NguoiDung
						values(@MaNguoiDung ,@TenNguoiDung,@GioiTinh ,@DienThoai ,@DiaChi ,@Email ,@MaQuan)
						print N'Thêm thành công'
					end
			end try
			begin catch
				print 'Lỗi ' + Error_Message()
			end catch
		end
	exec Insert_NguoiDung_C2  'ND0165', N'Nguyễn Hoài Anh' , N'Nữ' , '0366784986', N'Hà Nội', 'minhhieu056@gmail.com', N'Q05'

--a. Viết một SP với các tham số đầu vào phù hợp. SP thực hiện tìm kiếm thông tin các 
--phòng trọ thỏa mãn điều kiện tìm kiếm theo: Quận, phạm vi diện tích, phạm vi ngày đăng
--tin, khoảng giá tiền, loại hình nhà trọ.
--SP này trả về thông tin các phòng trọ, gồm các cột có định dạng sau:
--o Cột thứ nhất: có định dạng ‘Cho thuê phòng trọ tại’ + <Địa chỉ phòng trọ>
--+ <Tên quận/Huyện>
--o Cột thứ hai: Hiển thị diện tích phòng trọ dưới định dạng số theo chuẩn Việt Nam + 
--m2. Ví dụ 30,5 m2
--o Cột thứ ba: Hiển thị thông tin giá phòng dưới định dạng số theo định dạng chuẩn 
--Việt Nam. Ví dụ 1.700.000
--o Cột thứ tư: Hiển thị thông tin mô tả của phòng trọ
--o Cột thứ năm: Hiển thị ngày đăng tin dưới định dạng chuẩn Việt Nam.
--Ví dụ: 27-02-2012
--o Cột thứ sáu: Hiển thị thông tin người liên hệ dưới định dạng sau:
--▪ Nếu giới tính là Nam. Hiển thị: A. + tên người liên hệ. Ví dụ A. Thắng
--▪ Nếu giới tính là Nữ. Hiển thị: C. + tên người liên hệ. Ví dụ C. Lan
--o Cột thứ bảy: Số điện thoại liên hệ
--o Cột thứ tám: Địa chỉ người liên hệ
--- Viết hai lời gọi cho SP này
--convert(nvarchar,convert(money, GiaPhong),1) --- 12,000,000.00
--27-02-2012
	select	NhaTro.DiaChi + ', ' + TenQuan as N'Cho thuê trọ tại' , 
			convert(nvarchar(10),DienTich) + ' m2' as N'Diện tích', 
			convert(nvarchar,convert(money, GiaPhong),1),
			REPLACE(left( convert(nvarchar,convert(money, GiaPhong),1), len(convert(nvarchar,convert(money, GiaPhong),1)) -3),',','.') as N'Giá phòng',
			MoTa as N'Moo tả', convert(nvarchar, NgayDangTin, 105) as N'Ngày đăng tin', GioiTinh,
			N'Thông tin' = case 
				when GioiTinh like N'Nữ' then 'C.'+ TenNguoiDung
				else
					'A.' + TenNguoiDung
				end ,
			DienThoai as N'Điện thoại người liên hệ',
			NguoiDung.DiaChi as N'Địa chỉ người liên hệ'
	from Quan join NhaTro on Quan.MaQuan = NhaTro.MaQuan  
			join NguoiDung_NhaTro on NhaTro.MaNhaTro = NguoiDung_NhaTro.MaNhaTro
			join NguoiDung on NguoiDung_NhaTro.MaNguoiDung = NguoiDung.MaNguoiDung
-------------------------------------------------------------------------------------------
	if OBJECT_ID('TruyVan_A') is not null
	drop proc TruyVan_A
	go
	create proc TruyVan_A 
				@Quan nvarchar(15) = '%',
				@DienTichMax float = null,
				@DienTichMin float = null,
				@GiaPhongMax money = null,
				@GiaPhongMin money = null,
				@NgayDangMax date = null,
				@NgayDangMin date = null,
				@LoaiNha nvarchar(15) = '%'
	as 
		begin
			if(@DienTichMax is null) select @DienTichMax = max(DienTich) from NhaTro
			if(@DienTichMin is null) select @DienTichMin = min(DienTich) from NhaTro
			if(@GiaPhongMax is null) select @GiaPhongMax = max(GiaPhong) from NhaTro
			if(@GiaPhongMin is null) select @GiaPhongMin = min(GiaPhong) from NhaTro
			if(@NgayDangMax is null) select @NgayDangMax = max(NgayDangTin) from NhaTro
			if(@NgayDangMin is null) select @NgayDangMin = min(NgayDangTin) from NhaTro

			select	NhaTro.DiaChi + ', ' + TenQuan as N'Cho thuê trọ tại' , 
					convert(nvarchar(10),DienTich) + ' m2' as N'Diện tích', 
					REPLACE(left( convert(nvarchar,convert(money, GiaPhong),1), len(convert(nvarchar,convert(money, GiaPhong),1)) -3),',','.') as N'Giá phòng',
					MoTa as N'Mô tả', convert(nvarchar, NgayDangTin, 105) as N'Ngày đăng tin', GioiTinh,
					N'Thông tin' = case 
									when GioiTinh like N'Nữ' then 'C.'+ TenNguoiDung
									else
									'A.' + TenNguoiDung
									end ,
					DienThoai as N'Điện thoại người liên hệ',
					NguoiDung.DiaChi as N'Địa chỉ người liên hệ'
			from	Quan join NhaTro on Quan.MaQuan = NhaTro.MaQuan  
					join NguoiDung_NhaTro on NhaTro.MaNhaTro = NguoiDung_NhaTro.MaNhaTro
					join NguoiDung on NguoiDung_NhaTro.MaNguoiDung = NguoiDung.MaNguoiDung
			where	NhaTro.MaQuan like @Quan
					and DienTich > @DienTichMin and DienTich < @DienTichMax
					and GiaPhong > @GiaPhongMin and GiaPhong < @GiaPhongMax
					and MaLoaiNha like @LoaiNha
		end

	exec TruyVan_A 
	exec TruyVan_A '%', 500, 200, 4000000,null, null, null, '%'

	select * from NhaTro
	select * from NguoiDung_NhaTro
	select * from NguoiDung
--b. Viết một hàm có các tham số đầu vào tương ứng với tất cả các cột của bảng 
--NGUOIDUNG. Hàm này trả về mã người dùng (giá trị của cột khóa chính của bảng NGUOIDUNG)
--thỏa mãn các giá trị được truyền vào tham số.
	if OBJECT_ID('fn_timMa') is not null
	drop function fn_timMa
	go
	create function fn_timMa (
		@TenNguoiDung nvarchar(50) ,
		@GioiTinh nvarchar(10) ,
		@DienThoai nvarchar(13) ,
		@DiaChi nvarchar(max) ,
		@Email nvarchar(50) ,
		@MaQuan nvarchar(15)
		)
	returns table -- table khônng có  begin-end
	as
		return(select MaNguoiDung
				from NguoiDung
				where	[TenNguoiDung] like @TenNguoiDung  
						 and
						[GioiTinh] like  @GioiTinh
						 and
						[DienThoai] like @DienThoai
						 and 
						[DiaChi] like @DiaChi
						 and
						[Email] like @Email
						 and 
						[MaQuan] like @MaQuan)
	
	select * from dbo.fn_timMa(N'Nguyễn Thanh Lâm', N'Nữ', N'0915289995',N'Số 17, Nguyễn Văn Linh,Phúc Đồng',N'thanhlam051@gmail.com',N'Q06')
--c. Viết một hàm có tham số đầu vào là mã nhà trọ (cột khóa chính của bảng 
--NHATRO). Hàm này trả về tổng số LIKE và DISLIKE của nhà trọ này.
if OBJECT_ID('fn_2c') is not null
	drop function fn_2c
go

create function fn_2c (@manhatro1 nvarchar(15))
returns @bang table(
					tonglike int,
					tongdis int
					)
as
	begin
	declare @tonglike int , @tongdislike int
		-- nháp lấy tổng like nhà trọ 01
		select @tonglike = count(Like_DisLike)
		from DanhGia
		where Like_DisLike = 1  and MaNhaTro like @manhatro1
		-- tổng disLike
		select @tongdislike = count(Like_DisLike)
		from DanhGia
		where Like_DisLike = 0  and MaNhaTro like @manhatro1
		insert into @bang values(@tonglike, @tongdislike)
		return
	end

select * from dbo.fn_2c(N'CH01')

select * from DanhGia


-----------------------------
if OBJECT_ID('thongkelike_dislike') is not null
drop function thongkelike_dislike
go
create function thongkelike_dislike 
		(@mant nvarchar(15)) 
		returns @thongke table (LikeSum int , Dislike int )
as 
	begin
		insert into @thongke
		select	sum(iif(Like_DisLike =1 , 1, 0)) as 'Like',
				 sum(iif(Like_DisLike =0 , 1, 0)) as 'DisLike'
		from DanhGia 
		where MaNhaTro like @mant
		return 
	end 
select * from [dbo].[thongkelike_dislike] (N'DG002')

select * from DanhGia
--d. Tạo một View lưu thông tin của TOP 10 nhà trọ có số người dùng LIKE nhiều nhất gồm 
--các thông tin sau:
--- Diện tích
--- Giá
--- Mô tả
--- Ngày đăng tin
--- Tên người liên hệ
--- Địa chỉ
--- Điện thoại
--- Email
if OBJECT_ID('top10nhatro') is not null
drop view top10nhatro
go
create view top10nhatro
as
	select a.LikeSum , DienTich, GiaPhong, b.DiaChi, MoTa, NgayDangTin, TenNguoiDung, DienThoai, Email
	from(
			select top 10 MaNhaTro,sum(iif(Like_DisLike = 1, 1,0)) as LikeSum
			from DanhGia 
			group by MaNhaTro
			order by LikeSum desc -- giảm dần
		) a join NhaTro b on a.MaNhaTro = b.MaNhaTro
		join NguoiDung c on b.MaNguoiDung = c.MaNguoiDung

SELECT * FROM [QL_NhaTro].[dbo].[top10nhatro]
--e. Viết một Stored Procedure nhận tham số đầu vào là mã nhà trọ (cột khóa chính của
--bảng NHATRO). SP này trả về tập kết quả gồm các thông tin sau:
--- Mã nhà trọ
--- Tên người đánh giá
--- Trạng thái LIKE hay DISLIKE
--- Nội dung đánh giá
	if OBJECT_ID('proc_nhatro')is not null
	drop proc proc_nhatro
	go

	create proc proc_nhatro @manhatro nvarchar(15) = '%'  -- lấy hết thông tin nhà trọ
	as
		begin
			select Danhgia.MaNhaTro, TenNguoiDung, Like_DisLike, NoiDung
			from NguoiDung join NguoiDung_NhaTro on NguoiDung.MaNguoiDung = NguoiDung_NhaTro.MaNguoiDung
					join DanhGia on NguoiDung_NhaTro.MaNguoiDung = DanhGia.MaNguoiDung and NguoiDung_NhaTro.MaNhaTro = DanhGia.MaNhaTro
			where Danhgia.MaNhaTro like @manhatro
		end

	exec proc_nhatro 'CH09'

	select * from DanhGia


--1. Viết một SP nhận một tham số đầu vào kiểu int là số lượng DISLIKE. SP này thực hiện
--thao tác xóa thông tin của các nhà trọ và thông tin đánh giá của chúng, nếu tổng số lượng
--DISLIKE tương ứng với nhà trọ này lớn hơn giá trị tham số được truyền vào.
--Yêu cầu: Sử dụng giao dịch trong thân SP, để đảm bảo tính toàn vẹn dữ liệu khi một thao tác 
--xóa thực hiện không thành công.
if OBJECT_ID('Sp_NhaTro') is not null
drop proc Sp_NhaTro
create proc Sp_NhaTro @tongdislike int
as
	begi
		begin try
			begin tran -- bắt đầu giao dịch
				-- tạo bảng để chứ tất cả các mã
				declare @bang table( manhatro nvarchar(15))
				insert into @bang
				select MaNhaTro
				from DanhGia
				where Like_DisLike = 0
				group by MaNhaTro
				 having count(Like_DisLike ) > @tongDislike
				 -- xóa các bảng liên quan
				 delete from DanhGia
				 where MaNhaTro in (select manhatro 
									from @bang)
				-- xóa thành công
				print N'Xóa thành công'
			commit tran -- hoàn tất giao dịch
		end try
		begin catch
			print N'Lỗi : ' + Error_Message()
			rollback tran -- hoàn tác 
		end catch
	end
exec Sp_NhaTro 2

select * from DanhGia
--2. Viết một SP nhận hai tham số đầu vào là khoảng thời gian đăng tin. SP này thực hiện
--thao tác xóa thông tin những nhà trọ được đăng trong khoảng thời gian được truyền vào 
--qua các tham số.
--Lưu ý: SP cũng phải thực hiện xóa thông tin đánh giá của các nhà trọ này.
--Yêu cầu: Sử dụng giao dịch trong thân SP, để đảm bảo tính toàn vẹn dữ liệu khi một thao tác 
--xóa thực hiện không thành công.
-- xóa câu 2
	if OBJECT_ID('xoa_nhatro') is not null
		drop proc xoa_nhatro
	go

	create proc xoa_nhatro
				@minngaydang date,
				@maxngaydang date
	as
		begin
				begin try
					begin tran
						-- xóa các mã theo yêu cầu các mã nhà trọ thỏa mãn yêu cầu
						delete from DanhGia
						where MaNhaTro in(select MaNhaTro
									from NhaTro
									where NgayDangTin between @minngaydang and @maxngaydang)
				
					-- các lệnh công việc
					-- xóa các đánhh giá mã nhà trọ thỏa mãn yêu cầu
						delete from DanhGia
						where MaNhaTro in (select MaNhaTro
										from NhaTro
										where NgayDangTin between @minngaydang and @maxngaydang)
					-- xóa các hợp đồng của mã nhà trọ thỏa mãn yêu cầu
						delete from NguoiDung_NhaTro
						where MaNhaTro in (select MaNhaTro
										from NhaTro
										where NgayDangTin between @minngaydang and @maxngaydang)
					-- xóa các nà atroj của mã nhà trọ yêu cầu thỏa mãn
						delete from NhaTro
						where MaNhaTro in (select MaNhaTro
											from NhaTro
											where NgayDangTin between @minngaydang and @maxngaydang)
					commit tran-- hoàn tất giao dịch
					print 'Xóa thành công'
				end try
				begin catch
					print 'lỗi : ' + Error_Message()
					rollback tran;
				end catch
		end

		exec xoa_nhatro '2021-12-12','2021-12-15'

		select * from DanhGia
		select * from NguoiDung_NhaTro

--2021-12-13 00:00:00.000 NO02 ND0152






