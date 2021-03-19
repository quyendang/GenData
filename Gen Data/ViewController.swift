//
//  ViewController.swift
//  Gen Data
//
//  Created by QuyenDang on 12/03/2021.
//

import Cocoa
import Alamofire
import SystemConfiguration
import AVFoundation
import PromiseKit
class ViewController: NSViewController {

    @IBOutlet weak var name: NSTextField!
    @IBOutlet weak var add1: NSTextField!
    @IBOutlet weak var add2: NSTextField!
    @IBOutlet weak var city: NSTextField!
    @IBOutlet weak var tinh: NSTextField!
    @IBOutlet weak var zip: NSTextField!
    @IBOutlet weak var app1: NSTextField!
    @IBOutlet weak var app2: NSTextField!
    @IBOutlet weak var current: NSTextField!
    @IBOutlet weak var changeip: NSButton!
    @IBOutlet weak var countdown: NSTextField!
    @IBOutlet weak var api: NSTextField!
    var nm1 = ["Ân","Úc","Uất","Đàm","Đào","Đinh","Đoàn","An","Bành","Bạch","Cao","Châu","Chử","Chu","Chung","Dữu","Diệp","Doãn","Giang","Hà","Hàn","Kiều","Kim","Lâm","Lương","Lưu","Lạc","Lục","La","Liễu","Mã","Mạc","Mạch","Mai","Ngư","Nghiêm","Phí","Phó","Phùng","Quách","Quang","Quyền","Tô","Tôn","Tạ","Tống","Thái","Sái","Thân","Thạch","Thảo","Thủy","Thi","Tiêu","Trương","Trầm","Trịnh","Trang","Triệu","Văn","Vĩnh","Vương","Vưu","Nguyễn","Trần","Lê","Phạm","Huỳnh","Hoàng","Phan","Vũ","Võ","Đặng","Bùi","Đỗ","Hồ","Ngô","Dương","Lý","Nguyễn","Trần","Lê","Phạm","Huỳnh","Hoàng","Phan","Vũ","Võ","Đặng","Bùi","Đỗ","Hồ","Ngô","Dương","Lý","Nguyễn","Nguyễn","Nguyễn","Nguyễn","Nguyễn","Nguyễn","Nguyễn","Nguyễn","Nguyễn","Nguyễn","Nguyễn","Nguyễn","Nguyễn","Nguyễn","Nguyễn","Nguyễn","Nguyễn","Trần","Lê","Phạm","Huỳnh","Hoàng","Phan","Vũ","Võ","Đặng","Bùi","Đỗ","Hồ","Ngô","Dương","Lý","Nguyễn","Trần","Lê","Phạm","Huỳnh","Hoàng","Phan","Vũ","Võ","Đặng","Bùi","Đỗ","Hồ","Ngô","Dương","Lý"];
    var nm2 = ["Bảo An","Bình An","Ðăng An","Duy An","Khánh An","Nam An","Phước An","Thành An","Thế An","Thiên An","Trường An","Việt An","Xuân An","Công Ân","Ðức Ân","Gia Ân","Hoàng Ân","Minh Ân","Phú Ân","Thành Ân","Thiên Ân","Thiện Ân","Vĩnh Ân","Ngọc Ẩn","Chí Anh","Ðức Anh","Dương Anh","Gia Anh","Hùng Anh","Huy Anh","Minh Anh","Quang Anh","Quốc Anh","Thế Anh","Thiếu Anh","Thuận Anh","Trung Anh","Tuấn Anh","Tùng Anh","Tường Anh","Việt Anh","Vũ Anh","Hồ Bắc","Hoài Bắc","Gia Bạch","Công Bằng","Ðức Bằng","Hải Bằng","Yên Bằng","Chí Bảo","Ðức Bảo","Duy Bảo","Gia Bảo","Hữu Bảo","Nguyên Bảo","Quốc Bảo","Thiệu Bảo","Tiểu Bảo","Ðức Bình","Gia Bình","Hải Bình","Hòa Bình","Hữu Bình","Khánh Bình","Kiên Bình","Kiến Bình","Phú Bình","Quốc Bình","Tân Bình","Tất Bình","Thái Bình","Thế Bình","Xuân Bình","Yên Bình","Quang Bửu","Thiên Bửu","Khải Ca","Gia Cần","Duy Cẩn","Gia Cẩn","Hữu Canh","Gia Cảnh","Hữu Cảnh","Minh Cảnh","Ngọc Cảnh","Đức Cao","Xuân Cao","Bảo Chấn","Bảo Châu","Hữu Châu","Phong Châu","Thành Châu","Tuấn Châu","Tùng Châu","Đình Chiến","Mạnh Chiến","Minh Chiến","Hữu Chiến","Huy Chiểu","Trường Chinh","Ðức Chính","Trọng Chính","Trung Chính","Việt Chính","Ðình Chương","Tuấn Chương","Minh Chuyên","An Cơ","Chí Công","Thành Công","Xuân Cung","Hữu Cương","Mạnh Cương","Duy Cương","Việt Cương","Bá Cường","Ðức Cường","Ðình Cường","Duy Cường","Hùng Cường","Hữu Cường","Kiên Cường","Mạnh Cường","Ngọc Cường","Phi Cường","Phúc Cường","Thịnh Cường","Việt Cường","Ngọc Đại","Quốc Ðại","Minh Dân","Thế Dân","Minh Ðan","Nguyên Ðan","Sỹ Ðan","Hải Ðăng","Hồng Ðăng","Minh Danh","Ngọc Danh","Quang Danh","Thành Danh","Hưng Ðạo","Thanh Ðạo","Bình Ðạt","Ðăng Ðạt","Hữu Ðạt","Minh Ðạt","Quang Ðạt","Quảng Ðạt","Thành Ðạt","Ðắc Di","Phúc Ðiền","Quốc Ðiền","Phi Ðiệp","Ðình Diệu","Vinh Diệu","Mạnh Ðình","Bảo Ðịnh","Hữu Ðịnh","Ngọc Ðoàn","Thanh Ðoàn","Thành Doanh","Thế Doanh","Ðình Ðôn","Quang Đông","Từ Ðông","Viễn Ðông","Lâm Ðông","Bách Du","Thụy Du","Hồng Đức","Anh Ðức","Gia Ðức","Kiến Ðức","Minh Ðức","Quang Ðức","Tài Ðức","Thái Ðức","Thiên Ðức","Thiện Ðức","Tiến Ðức","Trung Ðức","Tuấn Ðức","Hoàng Duệ","Anh Dũng","Chí Dũng","Hoàng Dũng","Hùng Dũng","Lâm Dũng","Mạnh Dũng","Minh Dũng","Nghĩa Dũng","Ngọc Dũng","Nhật Dũng","Quang Dũng","Tấn Dũng","Thế Dũng","Thiện Dũng","Tiến Dũng","Trí Dũng","Trọng Dũng","Trung Dũng","Tuấn Dũng","Việt Dũng","Hiếu Dụng","Ðại Dương","Ðình Dương","Ðông Dương","Hải Dương","Nam Dương","Quang Dương","Thái Dương","Việt Dương","Anh Duy","Bảo Duy","Ðức Duy","Khắc Duy","Khánh Duy","Nhật Duy","Phúc Duy","Thái Duy","Trọng Duy","Việt Duy","Thế Duyệt","Vương Gia","Bảo Giang","Chí Giang","Công Giang","Ðức Giang","Hải Giang","Hòa Giang","Hoàng Giang","Hồng Giang","Khánh Giang","Long Giang","Minh Giang","Thiện Giang","Trường Giang","Nguyên Giáp","Huy Kha","Anh Khải","Ðức Khải","Hoàng Khải","Quang Khải","Tuấn Khải","Việt Khải","An Khang","Chí Khang","Ðức Khang","Duy Khang","Hoàng Khang","Hữu Khang","Minh Khang","Ngọc Khang","Nguyên Khang","Như Khang","Phúc Khang","Tấn Khang","Việt Khang","Hữu Khanh","Tuấn Khanh","Bảo Khánh","Ðăng Khánh","Duy Khánh","Gia Khánh","Huy Khánh","Minh Khánh","Quốc Khánh","Trọng Khánh","Chí Khiêm","Ðức Khiêm","Duy Khiêm","Gia Khiêm","Huy Khiêm","Thành Khiêm","Thiện Khiêm","Anh Khoa","Ðăng Khoa","Việt Khoa","Xuân Khoa","Anh Khôi","Hoàng Khôi","Hữu Khôi","Minh Khôi","Ngọc Khôi","Nguyên Khôi","Việt Khôi","Đăng Khương","Ngọc Khương","Nhật Khương","Chí Kiên","Ðức Kiên","Gia Kiên","Trọng Kiên","Trung Kiên","Xuân Kiên","Gia Kiệt","Liên Kiệt","Minh Kiệt","Thường Kiệt","Tuấn Kiệt","Trọng Kim","Bá Kỳ","Cao Kỳ","Minh Kỳ","Trường Kỳ","Hiệp Hà","Huy Hà","Mạnh Hà","Quang Hà","Sơn Hà","Trọng Hà","Công Hải","Ðông Hải","Ðức Hải","Duy Hải","Hoàng Hải","Khánh Hải","Minh Hải","Nam Hải","Ngọc Hải","Phi Hải","Phú Hải","Quang Hải","Quốc Hải","Sơn Hải","Thanh Hải","Trung Hải","Tuấn Hải","Việt Hải","Vĩnh Hải","Xuân Hãn","Ðại Hành","Hữu Hạnh","Nguyên Hạnh","Quốc Hạnh","Công Hào","Hiệp Hào","Minh Hào","Thanh Hào","Trí Hào","Ðình Hảo","Công Hậu","Thanh Hậu","Duy Hiền","Quốc Hiền","Tạ Hiền","Bảo Hiển","Ngọc Hiển","Quốc Hiển","Gia Hiệp","Hòa Hiệp","Hoàng Hiệp","Hữu Hiệp","Phú Hiệp","Tiến Hiệp","Quốc Hiệp","Chí Hiếu","Công Hiếu","Duy Hiếu","Minh Hiếu","Tất Hiếu","Trọng Hiếu","Trung Hiếu","Xuân Hiếu","Bảo Hòa","Ðạt Hòa","Ðức Hòa","Gia Hòa","Hiệp Hòa","Khải Hòa","Minh Hòa","Nghĩa Hòa","Nhật Hòa","Phúc Hòa","Quang Hòa","Quốc Hòa","Tất Hòa","Thái Hòa","Xuân Hòa","Quốc Hoài","Công Hoán","Quốc Hoàn","Khánh Hoàn","Anh Hoàng","Bảo Hoàng","Duy Hoàng","Gia Hoàng","Hữu Hoàng","Huy Hoàng","Khánh Hoàng","Minh Hoàng","Phi Hoàng","Quốc Hoàng","Sỹ Hoàng","Tuấn Hoàng","Việt Hoàng","Tiến Hoạt","Khánh Hội","Nhật Hồng","Việt Hồng","Ðình Hợp","Hòa Hợp","Gia Huấn","Minh Huấn","Chấn Hùng","Duy Hùng","Gia Hùng","Hữu Hùng","Mạnh Hùng","Minh Hùng","Nhật Hùng","Phi Hùng","Phú Hùng","Quang Hùng","Quốc Hùng","Thế Hùng","Trí Hùng","Trọng Hùng","Tuấn Hùng","Việt Hùng","Chấn Hưng","Gia Hưng","Minh Hưng","Nam Hưng","Phú Hưng","Phúc Hưng","Quang Hưng","Quốc Hưng","Thiên Hưng","Vĩnh Hưng","Chính Hữu","Quang Hữu","Trí Hữu","Bảo Huy","Ðức Huy","Gia Huy","Khánh Huy","Minh Huy","Ngọc Huy","Nhật Huy","Quang Huy","Quốc Huy","Thanh Huy","Việt Huy","Xuân Huy","Bảo Huỳnh","Ân Lai","Bảo Lâm","Huy Lâm","Hoàng Lâm","Phúc Lâm","Quang Lâm","Sơn Lâm","Thế Lâm","Tùng Lâm","Tường Lâm","Hoàng Lân","Ngọc Lân","Quang Lân","Tường Lân","Công Lập","Gia Lập","Hữu Lễ","Tôn Lễ","Hiếu Liêm","Thanh Liêm","Hoàng Linh","Quang Linh","Tuấn Linh","Tùng Linh","Hồng Lĩnh","Huy Lĩnh","Tường Lĩnh","Bá Lộc","Công Lộc","Ðinh Lộc","Ðình Lộc","Nam Lộc","Nguyên Lộc","Phước Lộc","Quang Lộc","Xuân Lộc","Tấn Lợi","Thắng Lợi","Thành Lợi","Bá Long","Bảo Long","Ðức Long","Hải Long","Hoàng Long","Hữu Long","Kim Long","Phi Long","Tân Long","Thăng Long","Thanh Long","Thành Long","Thụy Long","Trường Long","Tuấn Long","Việt Long","Thiện Luân","Vĩnh Luân","Công Luận","Ðình Luận","Duy Luận","Công Luật","Hữu Lương","Thiên Lương","Công Lý","Minh Lý","Ðức Mạnh","Duy Mạnh","Quốc Mạnh","Thiên Mạnh","Thụy Miên","Anh Minh","Bình Minh","Cao Minh","Chiêu Minh","Ðăng Minh","Ðức Minh","Duy Minh","Gia Minh","Hoàng Minh","Hồng Minh","Hiểu Minh","Hữu Minh","Khắc Minh","Khánh Minh","Ngọc Minh","Nhật Minh","Quang Minh","Quốc Minh","Thái Minh","Thanh Minh","Thế Minh","Thiện Minh","Trí Minh","Tuấn Minh","Tùng Minh","Tường Minh","Văn Minh","Vũ Minh","Xuân Minh","Hoàng Mỹ","Quốc Mỹ","An Nam","Chí Nam","Ðình Nam","Giang Nam","Hải Nam","Hồ Nam","Hoài Nam","Hoàng Nam","Hữu Nam","Khánh Nam","Nhật Nam","Phương Nam","Tấn Nam","Trường Nam","Xuân Nam","Ngọc Ngạn","Gia Nghị","Hiếu Nghĩa","Hữu Nghĩa","Minh Nghĩa","Trọng Nghĩa","Trung Nghĩa","Mạnh Nghiêm","Cao Nghiệp","Hào Nghiệp","Ðại Ngọc","Hùng Ngọc","Tuấn Ngọc","Việt Ngọc","Duy Ngôn","Hoàng Ngôn","Thiện Ngôn","An Nguyên","Bình Nguyên","Ðình Nguyên","Ðông Nguyên","Hải Nguyên","Khôi Nguyên","Nhân Nguyên","Phúc Nguyên","Phước Nguyên","Thành Nguyên","Trung Nguyên","Tường Nguyên","Ðình Nhân","Ðức Nhân","Minh Nhân","Thiện Nhân","Phước Nhân","Quang Nhân","Thành Nhân","Thụ Nhân","Trọng Nhân","Trung Nhân","Trường Nhân","Việt Nhân","Thống Nhất","Hồng Nhật","Minh Nhật","Nam Nhật","Quang Nhật","Hạo Nhiên","An Ninh","Khắc Ninh","Quang Ninh","Xuân Ninh","Hoàng Phát","Hồng Phát","Tấn Phát","Trường Phát","Tường Phát","Ðức Phi","Khánh Phi","Nam Phi","Thanh Phi","Cao Phong","Chấn Phong","Chiêu Phong","Ðông Phong","Ðức Phong","Gia Phong","Hải Phong","Hiếu Phong","Hoài Phong","Hùng Phong","Huy Phong","Khởi Phong","Nguyên Phong","Quốc Phong","Thanh Phong","Thuận Phong","Uy Phong","Việt Phong","Ðình Phú","Ðức Phú","Kim Phú","Sỹ Phú","Thiên Phú","Ðình Phúc","Gia Phúc","Lạc Phúc","Thế Phúc","Trường Phúc","Xuân Phúc","Công Phụng","Bá Phước","Gia Phước","Hữu Phước","Tân Phước","Thiện Phước","Chế Phương","Ðông Phương","Lam Phương","Nam Phương","Quốc Phương","Thành Phương","Thế Phương","Thuận Phương","Viễn Phương","Việt Phương","Anh Quân","Bình Quân","Chiêu Quân","Ðông Quân","Hải Quân","Hoàng Quân","Long Quân","Minh Quân","Nhật Quân","Quốc Quân","Sơn Quân","Đăng Quang","Ðức Quang","Duy Quang","Hồng Quang","Huy Quang","Minh Quang","Ngọc Quang","Nhật Quang","Thanh Quang","Tùng Quang","Ðình Quảng","Ðức Quảng","Anh Quốc","Bảo Quốc","Minh Quốc","Nhật Quốc","Việt Quốc","Vinh Quốc","Hồng Quý","Minh Quý","Xuân Quý","Ðức Quyền","Lương Quyền","Sơn Quyền","Thế Quyền","Ngọc Quyết","Việt Quyết","Mạnh Quỳnh","Thái San","Ðình Sang","Thái Sang","Thành Sang","Quang Sáng","Ðức Siêu","Công Sinh","Ðức Sinh","Phúc Sinh","Tấn Sinh","Thiện Sinh","Anh Sơn","Bảo Sơn","Cao Sơn","Chí Sơn","Công Sơn","Danh Sơn","Ðông Sơn","Giang Sơn","Hải Sơn","Hồng Sơn","Hùng Sơn","Kim Sơn","Minh Sơn","Nam Sơn","Ngọc Sơn","Phước Sơn","Thái Sơn","Thanh Sơn","Thế Sơn","Trường Sơn","Vân Sơn","Viết Sơn","Việt Sơn","Xuân Sơn","Cao Sỹ","Tuấn Sỹ","Anh Tài","Ðức Tài","Hữu Tài","Lương Tài","Quang Tài","Tấn Tài","Tuấn Tài","Ðức Tâm","Duy Tâm","Hữu Tâm","Khải Tâm","Phúc Tâm","Thiện Tâm","Duy Tân","Hữu Tân","Minh Tân","Thái Tân","Mạnh Tấn","Nhật Tấn","Trọng Tấn","Cao Tiến","Minh Tiến","Nhật Tiến","Nhất Tiến","Quốc Tiến","Việt Tiến","Bảo Tín","Hoài Tín","Thành Tín","Bảo Toàn","Ðình Toàn","Ðức Toàn","Hữu Toàn","Kim Toàn","Minh Toàn","Thanh Toàn","Thuận Toàn","Vĩnh Toàn","Ðức Toản","Quốc Toản","Thanh Toản","Hữu Trác","Công Tráng","Ðức Trí","Dũng Trí","Hữu Trí","Minh Trí","Thiên Trí","Trọng Trí","Minh Triết","Phương Triều","Quang Triều","Vương Triều","Khắc Triệu","Minh Triệu","Quang Triệu","Vương Triệu","Tấn Trình","Ðắc Trọng","Khắc Trọng","Quang Trọng","Ngọc Trụ","Quốc Trụ","Ðình Trung","Ðức Trung","Hoài Trung","Hữu Trung","Kiên Trung","Minh Trung","Quang Trung","Quốc Trung","Thành Trung","Thanh Trung","Thế Trung","Tuấn Trung","Xuân Trung","Tấn Trương","Lâm Trường","Mạnh Trường","Quang Trường","Quốc Trường","Xuân Trường","Anh Tú","Minh Tú","Nam Tú","Quang Tú","Thanh Tú","Tuấn Tú","Hữu Từ","Anh Tuấn","Cảnh Tuấn","Công Tuấn","Ðình Tuấn","Ðức Tuấn","Huy Tuấn","Khắc Tuấn","Khải Tuấn","Mạnh Tuấn","Minh Tuấn","Ngọc Tuấn","Quang Tuấn","Quốc Tuấn","Thanh Tuấn","Ðức Tuệ","Anh Tùng","Bá Tùng","Sơn Tùng","Thạch Tùng","Thanh Tùng","An Tường","Ðức Tường","Hữu Tường","Huy Tường","Mạnh Tường","Thế Tường","Minh Thạc","Bảo Thạch","Duy Thạch","Ngọc Thạch","Quang Thạch","Anh Thái","Bảo Thái","Hòa Thái","Hoàng Thái","Minh Thái","Quang Thái","Triệu Thái","Việt Thái","Xuân Thái","Chiến Thắng","Ðình Thắng","Ðức Thắng","Duy Thắng","Hữu Thắng","Mạnh Thắng","Minh Thắng","Quang Thắng","Quốc Thắng","Quyết Thắng","Toàn Thắng","Trí Thắng","Vạn Thắng","Việt Thắng","Chí Thanh","Duy Thanh","Hoài Thanh","Nam Thanh","Thiện Thanh","Việt Thanh","Bá Thành","Chí Thành","Công Thành","Ðắc Thành","Danh Thành","Ðức Thành","Duy Thành","Huy Thành","Khắc Thành","Lập Thành","Quốc Thành","Tân Thành","Tấn Thành","Thuận Thành","Triều Thành","Trung Thành","Trường Thành","Tuấn Thành","Thanh Thế","Giang Thiên","Quang Thiên","Thanh Thiên","Ân Thiện","Bá Thiện","Ðình Thiện","Gia Thiện","Hữu Thiện","Mạnh Thiện","Minh Thiện","Ngọc Thiện","Phước Thiện","Quốc Thiện","Tâm Thiện","Thành Thiện","Xuân Thiện","Bá Thịnh","Cường Thịnh","Gia Thịnh","Hồng Thịnh","Hùng Thịnh","Kim Thịnh","Nhật Thịnh","Phú Thịnh","Phúc Thịnh","Quang Thịnh","Quốc Thịnh","Cao Thọ","Ðức Thọ","Hữu Thọ","Ngọc Thọ","Vĩnh Thọ","Duy Thông","Hiếu Thông","Huy Thông","Kim Thông","Minh Thông","Nam Thông","Quảng Thông","Quốc Thông","Vạn Thông","Việt Thông","Ðại Thống","Hữu Thống","Chính Thuận","Minh Thuận","Ngọc Thuận","Quang Thuận","Thanh Thuận","Hải Thụy","Hồng Thụy","Vĩnh Thụy","Xuân Thuyết","Cát Uy","Gia Uy","Vũ Uy","Danh Văn","Khánh Văn","Kiến Văn","Quốc Văn","Khôi Vĩ","Triều Vĩ","Lâm Viên","Anh Việt","Dũng Việt","Hoài Việt","Hoàng Việt","Hồng Việt","Huy Việt","Khắc Việt","Nam Việt","Phụng Việt","Quốc Việt","Trọng Việt","Trung Việt","Tuấn Việt","Vương Việt","Công Vinh","Gia Vinh","Hồng Vinh","Quang Vinh","Quốc Vinh","Thanh Vinh","Thành Vinh","Thế Vinh","Trọng Vinh","Trường Vinh","Tường Vinh","Hữu Vĩnh","Quý Vĩnh","Chí Vịnh","Long Vịnh","Tiến Võ","Anh Vũ","Hiệp Vũ","Huy Vũ","Khắc Vũ","Lâm Vũ","Minh Vũ","Quang Vũ","Quốc Vũ","Thanh Vũ","Trường Vũ","Uy Vũ","Xuân Vũ","Hoàng Vương","Minh Vương","Hữu Vượng"];
    var nm3 = ["Active", "Adaptable", "Adventurous", "Agreeable", "Alert", "Ambitious", "Anticipative", "Appreciative", "Articulate", "Athletic", "Attentive", "Balanced", "Benevolent", "Brave", "Calm", "Capable", "Careful", "Caring", "Charismatic", "Charitable", "Charming", "Cheerful", "Clean", "Clear-Headed", "Clever", "Compassionate", "Confident", "Contemplative", "Cooperative", "Courageous", "Courteous", "Creative", "Critical Thinker", "Cultured", "Curious", "Daring", "Decent", "Decisive", "Dedicated", "Dependable", "Dignified", "Directed", "Disciplined", "Discreet", "Driven", "Dutiful", "Dynamic", "Earnest", "Educated", "Efficient", "Elegant", "Eloquent", "Empathetic", "Energetic", "Enthusiastic", "Fair", "Faithful", "Flexible", "Focused", "Forgiving", "Forthright", "Friendly", "Gallant", "Generous", "Gentle", "Genuine", "Good Judge of Character", "Good Listener", "Good-Natured", "Gracious", "Hardworking", "Helpful", "Heroic", "Honest", "Honorable", "Humble", "Humorous", "Imaginative", "Incorruptible", "Independent", "Innovative", "Inoffensive", "Insightful", "Intelligent", "Interesting", "Intuitive", "Kind", "Leaderly", "Level-Headed", "Logical", "Lovable", "Loyal", "Mature", "Modest", "Moral", "Neat", "Observant", "Open-Minded", "Orderly", "Organized", "Passionate", "Patient", "Peaceful", "Perceptive", "Playful", "Practical", "Principled", "Protective", "Punctual", "Rational", "Realistic", "Reflective", "Relaxed", "Reliable", "Reliant", "Resourceful", "Respectful", "Responsible", "Responsive", "Self-Critical", "Self-Reliant", "Self-Sufficient", "Selfless", "Sensitive", "Skillful", "Smart", "Sober", "Sociable", "Social", "Stable", "Strong", "Sweet", "Sympathetic", "Tidy", "Tolerant", "Trustworthy", "Understanding", "Upright", "Warm", "Warm-Hearted", "Wise", "Witty", "Worldly"];
    var nm4 = ["Photo", "Music", "Musi", "Editor", "Game", "Edu", "Tech", "Pro", "2021", "Hot", "News", "App", "Entertiment", "Vip", "Shop", "Hero", "Games", "Apps", "2022", "Chat", "Connect", "Free", "VPN", "Zone", "Core", "IO", "Tec", "Mobile", "Hack", "Trick", "Hyper", "Active", "Truth", "fiber", "Command", "Path", "Action", "Reboot", "Task", "About", "Apex", "Browser", "Box", "2023"]
    var  addresss: [String] = []
    var authRef: AuthorizationRef?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let error = AuthorizationCreate(nil, nil, [], &authRef)
        assert(error == errAuthorizationSuccess)
        let path = Bundle.main.path(forResource: "add", ofType: "txt") // file path for file "data.txt"
        let string = try! String(contentsOfFile: path!, encoding: String.Encoding.utf8)
        let strings = string.components(separatedBy: .newlines)
        addresss = strings
        if let apiKey = UserDefaults.standard.string(forKey: "api"){
            api.stringValue = apiKey
        } else{
            UserDefaults.standard.setValue(api.stringValue, forKey: "api")
            UserDefaults.standard.synchronize()
        }
    }

    var player: AVAudioPlayer?
    func playSound(file:String, ext:String) -> Void {
        let url = Bundle.main.url(forResource: file, withExtension: ext)!
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player!.prepareToPlay()
            player!.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func gen(_ sender: NSButton) {
        name.stringValue = randomName()
        let address = addresss.randomElement()!
        var arrAdd = address.components(separatedBy: ", ")
        let street = arrAdd.first
        let cty = arrAdd.last
        arrAdd.removeLast()
        arrAdd.removeFirst()
        let street2 = arrAdd.joined(separator: ", ")
        let strNums = [Int.random(in: 100..<300), Int.random(in: 20..<50), Int.random(in: 1..<10)]
        let strNumstrings = strNums.map { (el) -> String in
           return "\(el)"
        }
        let numStr = strNumstrings.joined(separator: "/")
        add1.stringValue = "\(numStr) \(street!)"
        add2.stringValue = street2
        city.stringValue = cty!
        zip.stringValue = "700000"
        tinh.stringValue = "Ho Chi Minh City"
        app1.stringValue = randomApp()
        app2.stringValue = randomApp()
    }
    
    @IBAction func copy(_ sender: NSButton) {
        switch sender.tag {
        case 0:
            copyString(string: name.stringValue)
        case 1:
            copyString(string: add1.stringValue)
        case 2:
            copyString(string: add2.stringValue)
        case 3:
            copyString(string: city.stringValue)
        case 4:
            copyString(string: "700000")
        case 5:
            copyString(string: app1.stringValue)
        case 6:
            copyString(string: app2.stringValue)
        default:
            copyString(string: "Make more money")
        }
    }
    
    @IBAction func pinGen(_ sender: Any) {
        let c = ["A", "B", "C", "E", "F", "G"]
        let strNums = [Int.random(in: 100..<400), Int.random(in: 20..<50), Int.random(in: 1..<20), Int.random(in: 1..<10)]
        var strNumstrings = strNums.map { (el) -> String in
           return "\(el)"
        }
        strNumstrings[1] = "\(strNumstrings[1])\(c.randomElement()!)"
        let numStr = strNumstrings.joined(separator: "/")
        name.stringValue = ""
        app1.stringValue = ""
        app2.stringValue = ""
        add1.stringValue = "\(numStr) đường số \(Int.random(in: 1..<12))"
        add2.stringValue = "phường 5, quận Gò Vấp"
        city.stringValue = "TPHCM"
        zip.stringValue = "700000"
        tinh.stringValue = "Ho Chi Minh City"
    }
    
    @IBAction func changeIp(_ sender: Any) {
        let selected: Switch = .off
        let stopCmd: String = [
            #"networksetup -setsecurewebproxystate "Wi-fi" \#(selected)"#,
                    #"networksetup -getsecurewebproxy "Wi-fi""#
                    ].joined(separator: " && ")
        try! launch(cmd: stopCmd, completionHandler: { [self] (status, outputData) in
            let output = String(data: outputData, encoding: .utf8) ?? ""
            print(output)
            let parameters: [String: Any] = ["api_key" : api.stringValue, "id_location" : 1]
            AF.request("https://tmproxy.com/api/proxy/get-new-proxy", method: .post, parameters: parameters,encoding: JSONEncoding.default).responseJSON { [self] (response) in
                if let error = response.error {
                    current.stringValue = error.localizedDescription
                } else{
                    switch response.result {
                    case .success(let value):
                        if let rp = value as? [String: Any] {
                            if let mess = rp["message"] as? String{
                                if mess.contains("retry") {
                                    let timeStr = mess.components(separatedBy: " ")[2]
                                    let time = Int(timeStr) ?? 0
                                    if time > 0 {
                                        changeip.isEnabled = false
                                        startOtpTimer(time: time)
                                    } else{
                                        changeip.isEnabled = true
                                    }
                                    firstly {
                                        getCurrentIp()
                                    }.done { ip in
                                            DispatchQueue.main.async {
                                                current.textColor = .red
                                                playSound(file: "doi", ext: "mp3")
                                                current.stringValue = ip
                                            }
                                        }.catch { _ in
                                            print("Error!")
                                    }
                                }
                                if mess.contains("API") {
                                    current.stringValue = mess
                                    current.textColor = .red
                                }
                                
                                if mess == "" {
                                    if let data = rp["data"] as? [String: Any] {
                                        if let https = data["https"] as? String {
                                            current.textColor = .green
                                            changeip.isEnabled = false
                                            let proxy = https.components(separatedBy: ":")
                                            let listOfNetworkCommands: String = [
                                                #"networksetup -setsecurewebproxy "Wi-fi" \#(proxy.first!) \#(proxy.last!)"#,
                                                        #"networksetup -getsecurewebproxy "Wi-fi""#
                                                        ].joined(separator: " && ")
                                            firstly {
                                                run(listOfNetworkCommands)
                                            }.then { [self] enable in
                                                    getCurrentIp()
                                                }.done { ip in
                                                    DispatchQueue.main.async {
                                                        playSound(file: "ok", ext: "mp3")
                                                        let time = data["next_request"] as! Int
                                                        startOtpTimer(time: time)
                                                        current.stringValue = ip
                                                    }
                                                }.catch { _ in
                                                    print("Error!")
                                            }
                                            
                                        }
                                    }
                                }
                                
                                if mess.contains("Gói Hết hạn") {
                                    DispatchQueue.main.async {
                                        current.stringValue = mess
                                        current.textColor = .yellow
                                    }
                                }
                            }else{
                                if let data = rp["data"] as? [String: Any] {
                                    if let https = data["https"] as? String {
                                        current.textColor = .green
                                        changeip.isEnabled = false
                                        let proxy = https.components(separatedBy: ":")
                                        let listOfNetworkCommands: String = [
                                            #"networksetup -setsecurewebproxy "Wi-fi" \#(proxy.first!) \#(proxy.last!)"#,
                                                    #"networksetup -getsecurewebproxy "Wi-fi""#
                                                    ].joined(separator: " && ")
                                        firstly {
                                            run(listOfNetworkCommands)
                                        }.then { [self] enable in
                                                getCurrentIp()
                                            }.done { ip in
                                                DispatchQueue.main.async {
                                                    playSound(file: "ok", ext: "mp3")
                                                    let time = data["next_request"] as! Int
                                                    startOtpTimer(time: time)
                                                    current.stringValue = ip
                                                }
                                            }.catch { _ in
                                                print("Error!")
                                        }
                                        
                                    }
                                }
                            }
                            
                        }
                    default:
                        print("Error")
                    }
                }
                
            }
        })
        
        //runTask(#"networksetup -setsecurewebproxy "Wi-fi" 127.0.0.1 1080"#)
    }
    var timer: Timer?
    var totalTime = 0
    
    private func startOtpTimer(time: Int) {
        self.totalTime = time
        self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    func getCurrentIp() -> Promise<String> {
        return Promise { seal in
            AF.request("https://ipinfo.io/json").responseJSON { (response) in
                if let error = response.error {
                    seal.fulfill(error.localizedDescription)
                } else{
                    switch response.result {
                    case .success(let value):
                        if let rp = value as? [String: Any] {
                            guard let ip = rp["ip"] as? String, let city = rp["city"] as? String else {
                                return
                            }
                            seal.fulfill("\(ip) ( \(city))")
                        }
                    default:
                        seal.fulfill("error.localizedDescription")
                    }
                }
            }
        }
    }
    @objc func updateCounter() {
        print(self.totalTime)
        countdown.stringValue = "\(self.totalTime) s"
        if totalTime != 0 {
            totalTime -= 1  // decrease counter timer
        } else {
            if let timer = self.timer {
                timer.invalidate()
                self.timer = nil
                changeip.isEnabled = true
                self.playSound(file: "dem", ext: "mp3")
            }
        }
    }
    
    @IBAction func stopChangeIp(_ sender: Any) {
        let selected: Switch = .off
        let listOfNetworkCommands: String = [
            #"networksetup -setsecurewebproxystate "Wi-fi" \#(selected)"#,
                    #"networksetup -getsecurewebproxy "Wi-fi""#
                    ].joined(separator: " && ")
        firstly {
            run(listOfNetworkCommands)
        }.then { [self] enable in
                getCurrentIp()
            }.done { ip in
                print(ip)
            }.catch { _ in
                print("Error!")
        }
    }
    
    @IBAction func save(_ sender: Any) {
        UserDefaults.standard.setValue(api.stringValue, forKey: "api")
        UserDefaults.standard.synchronize()
    }
    func copyString(string: String) {
        let pasteboard = NSPasteboard.general
        pasteboard.clearContents()
        pasteboard.setString(string, forType: .string)
    }
    
    func randomName() -> String {
        let name = "\(nm1.randomElement()!) \(nm2.randomElement()!)"
        return name
    }
    
    func randomApp() -> String {
        let name  = "\(nm3.randomElement()!) \(nm4.randomElement()!)"
        return name
    }
    enum Switch: String {
        case on, off
    }
    func run(_ cmd: String) -> Promise<Bool>  {
        return Promise { seal in
            try! launch(cmd: cmd, completionHandler: { (status, outputData) in
                let output = String(data: outputData, encoding: .utf8) ?? ""
                let strings = output.components(separatedBy: .newlines)
                let enables = strings.filter { (str) -> Bool in
                    str.contains("Enabled")
                }
                if enables.count > 0 {
                    guard let ena = enables.first?.components(separatedBy: ": ").last else {
                        return
                    }
                    seal.fulfill(ena.contains("Yes"))
                } else{
                    seal.fulfill(false)
                }
            })
        }
    }
    func launch(cmd: String, completionHandler: @escaping (Int32, Data) -> Void) throws {
        let group = DispatchGroup()
        let pipe = Pipe()
        var standardOutData = Data()

        group.enter()
        let proc = Process()
        proc.launchPath = "/bin/sh"
        proc.arguments = ["-c", String(format:"%@", cmd)]
        proc.standardOutput = pipe.fileHandleForWriting
        proc.terminationHandler = { _ in
            proc.terminationHandler = nil
            group.leave()
        }

        group.enter()
        DispatchQueue.global().async {
            // Doing long-running synchronous I/O on a global concurrent queue block
            // is less than ideal, but I’ve convinced myself that it’s acceptable
            // given the target ‘market’ for this code.

            let data = pipe.fileHandleForReading.readDataToEndOfFile()
            pipe.fileHandleForReading.closeFile()
            DispatchQueue.main.async {
                standardOutData = data
                group.leave()
            }
        }

        group.notify(queue: .main) {
            completionHandler(proc.terminationStatus, standardOutData)
        }

        try proc.run()

        // We have to close our reference to the write side of the pipe so that the
        // termination of the child process triggers EOF on the read side.

        pipe.fileHandleForWriting.closeFile()
    }
}

