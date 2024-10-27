// package nhomj.example.hairsalon.controller.user;
//
// import org.springframework.stereotype.Controller;
// import org.springframework.web.bind.annotation.GetMapping;
//
// @Controller
// public class CustomerController {
//
//     @GetMapping("/home")
//     public String home() {
//         return "user/home"; // Trả về tên file JSP (home.jsp)
//     }
//     // Hiển thị trang hồ sơ khách hàng
//     @GetMapping("/profile")
//     public String viewProfile(@RequestParam("id") Long customerId, Model model) {
//         Customer customer = customerRepository.findById(customerId).orElse(null);
//         if (customer != null) {
//             model.addAttribute("customer", customer);
//             return "user/profile";  // Đường dẫn đến file JSP
//         } else {
//             return "redirect:/";  // Điều hướng nếu không tìm thấy khách hàng
//         }
// }
// }
//
//
//
//
