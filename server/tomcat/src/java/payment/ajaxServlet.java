package payment;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import database.Database;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import main.Email;
import main.User;
import packages.wrap.Cart;
import packages.wrap.Order;
import packages.wrap.OrderInfo;
import packages.wrap.Product;
import packages.wrap.ProductCount;

public class ajaxServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // check if discountedCart is null
        Cart cart = (Cart) request.getSession().getAttribute("tempCart");
        if (request.getSession().getAttribute("DiscountedCart") != null) {
            cart = (Cart) request.getSession().getAttribute("DiscountedCart");
            for (Product product : cart.products) {
                for (ProductCount productCount : cart.quantities) {
                    if (product.id == productCount.id) {
                        product.sellingPrice = productCount.pricePer;
                    }
                }
            }

        }

        request.getSession().setAttribute("cartObject", cart);

        String fullName = request.getParameter("fullName");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");

        OrderInfo orderInfo = new OrderInfo(fullName, phone, address);

        request.getSession().setAttribute("orderInfo", orderInfo);

        String paymentMethod = request.getParameter("paymentMethod");

        if (paymentMethod.equals("Cash")) {
            User currentUser = (User) request.getSession().getAttribute("userObject");
            currentUser.cart = (Cart) request.getSession().getAttribute("cartObject");
            currentUser.cart.updateQuantity();

            for (ProductCount product : currentUser.cart.quantities) {
                Database.productAdjust(product.id, -product.count);
            }

            currentUser.cart.placeOrder();
            currentUser.addOrderInformation((OrderInfo) request.getSession().getAttribute("orderInfo"));

            currentUser.getOrders();
            Order currentOrder = currentUser.orders.get(0);
            currentOrder.updateQuantity();

            Email email = new Email();
            email.sendOrderConfirmation(
                    currentUser.email,
                    currentOrder);

            // Send JSON response for redirection
            JsonObject job = new JsonObject();
            job.addProperty("code", "00");
            job.addProperty("message", "success");
            job.addProperty("redirectUrl", "/order");
            Gson gson = new Gson();
            response.getWriter().write(gson.toJson(job));
        } else {
            makePayment(request, response, (long) cart.total, fullName);
        }
    }

    @SuppressWarnings({ "unchecked", "rawtypes" })
    protected void makePayment(HttpServletRequest request, HttpServletResponse response, long amount,
            String CustomerName)
            throws ServletException, IOException {
        String vnp_Version = "2.1.0";
        String vnp_Command = "pay";
        String orderType = "other";
        amount *= 100;
        String bankCode = request.getParameter("bankCode");

        String vnp_TxnRef = Config.getRandomNumber(8);
        String vnp_IpAddr = Config.getIpAddress(request);

        String vnp_TmnCode = Config.vnp_TmnCode;

        Map<String, String> vnp_Params = new HashMap<>();
        vnp_Params.put("vnp_Version", vnp_Version);
        vnp_Params.put("vnp_Command", vnp_Command);
        vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
        vnp_Params.put("vnp_Amount", String.valueOf(amount));
        vnp_Params.put("vnp_CurrCode", "VND");

        if (bankCode != null && !bankCode.isEmpty()) {
            vnp_Params.put("vnp_BankCode", bankCode);
        }
        vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
        vnp_Params.put("vnp_OrderInfo", CustomerName);
        vnp_Params.put("vnp_OrderType", orderType);

        String locate = request.getParameter("language");
        if (locate != null && !locate.isEmpty()) {
            vnp_Params.put("vnp_Locale", locate);
        } else {
            vnp_Params.put("vnp_Locale", "vn");
        }
        vnp_Params.put("vnp_ReturnUrl", Config.vnp_ReturnUrl);
        vnp_Params.put("vnp_IpAddr", vnp_IpAddr);

        Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
        String vnp_CreateDate = formatter.format(cld.getTime());
        vnp_Params.put("vnp_CreateDate", vnp_CreateDate);

        cld.add(Calendar.MINUTE, 15000);
        String vnp_ExpireDate = formatter.format(cld.getTime());
        vnp_Params.put("vnp_ExpireDate", vnp_ExpireDate);

        List fieldNames = new ArrayList(vnp_Params.keySet());
        Collections.sort(fieldNames);
        StringBuilder hashData = new StringBuilder();
        StringBuilder query = new StringBuilder();
        Iterator itr = fieldNames.iterator();
        while (itr.hasNext()) {
            String fieldName = (String) itr.next();
            String fieldValue = (String) vnp_Params.get(fieldName);
            if ((fieldValue != null) && (fieldValue.length() > 0)) {
                // Build hash data
                hashData.append(fieldName);
                hashData.append('=');
                hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                // Build query
                query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
                query.append('=');
                query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                if (itr.hasNext()) {
                    query.append('&');
                    hashData.append('&');
                }
            }
        }
        String queryUrl = query.toString();
        String vnp_SecureHash = Config.hmacSHA512(Config.secretKey, hashData.toString());
        queryUrl += "&vnp_SecureHash=" + vnp_SecureHash;
        String paymentUrl = Config.vnp_PayUrl + "?" + queryUrl;
        com.google.gson.JsonObject job = new JsonObject();
        job.addProperty("code", "00");
        job.addProperty("message", "success");
        job.addProperty("data", paymentUrl);
        Gson gson = new Gson();
        response.getWriter().write(gson.toJson(job));
    }
}