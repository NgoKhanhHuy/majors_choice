package packages.wrap;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Locale;
import database.Database;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import main.User;

public class CartServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String action = request.getParameter("action");
        User currentUser = (User) request.getSession().getAttribute("userObject");

        if (((String) request.getSession().getAttribute("table")) == null) {
            response.sendRedirect("/auth/login.jsp");
            return;
        }

        if (((String) request.getSession().getAttribute("table")).equals("staff")) {
            response.sendRedirect("/");
            return;
        }

        if (currentUser == null) {
            response.sendRedirect("/auth/login.jsp");
            return;
        } else
            currentUser.retrieveData("user");

        if (action == null) {
            action = "viewCart";
        }

        switch (action) {
            case "viewCart":
                currentUser.retrieveData("user");
                if (currentUser.cart.products.size() == 0) {
                    request.setAttribute("buyable", false);
                } else
                    request.setAttribute("buyable", currentUser.cart.buyable());
                request.setAttribute("user", currentUser.fullName);
                request.setAttribute("cartPriceDouble", new DecimalFormat("#").format(currentUser.cart.total));
                request.setAttribute("ProductCount", (ArrayList<ProductCount>) currentUser.cart.quantities);
                request.setAttribute("cartPrice", String.format(Locale.US, "%,.2f", currentUser.cart.total));
                request.getRequestDispatcher("/cart/cart.jsp").forward(request, response);
                break;
            case "addItem":
                currentUser.cart.addProduct(request.getParameter("type"),
                        Integer.parseInt(request.getParameter("productID")));
                response.sendRedirect("/Cart");
                break;
            case "removeOne":
            case "removeAll":
                currentUser.cart.remove(Integer.parseInt(request.getParameter("productID")),
                        ((String) request.getParameter("action")).equals("removeOne"));
                response.sendRedirect("/Cart");
                break;
            case "addOne":
                currentUser.cart.addOne(Integer.parseInt(request.getParameter("productID")));
                response.sendRedirect("/Cart");
                break;
            case "placeOrder":
                currentUser.cart.placeOrder();
                request.setAttribute("cartPrice", 0);
                request.setAttribute("user", currentUser.fullName);
                request.getRequestDispatcher("/cart/cart.jsp").forward(request, response);
                break;
            case "clear":
                currentUser.cart.clearCart();
                response.sendRedirect("/Cart");
                break;
            case "checkout":
                request.getSession().removeAttribute("DiscountedCart");
                checkout(request, response, currentUser, true);
                break;
            case "restore":
                Cart restoreCart = (Cart) request.getSession().getAttribute("tempCart");
                currentUser.cart = new Cart(restoreCart);
                currentUser.cart.updateCart();
                response.sendRedirect("/Cart");
                break;
            case "applyCoupon":
                applyCoupon(request, response, currentUser);
                checkout(request, response, currentUser, false);
                break;
        }

        request.getSession().setAttribute("userObject", currentUser);
    }

    protected void applyCoupon(HttpServletRequest request, HttpServletResponse response, User currentUser)
            throws ServletException, IOException {

        int status = Database.reserveCoupon(request.getParameter("couponCode"));
        String error = "";

        switch (status) {
            case -1:
                error = "Coupon not found";
                break;
            case -2:
                error = "Coupon expired";
                break;
            case -3:
                error = "Coupon out of uses";
                break;
        }

        if (!error.equals("")) {
            request.setAttribute("couponStatus", error);
            request.getSession().setAttribute("DiscountedCart", request.getSession().getAttribute("tempCart"));
            request.getSession().removeAttribute("DiscountedCart");
            return;
        } else {
            Coupon coupon = Database.getCouponNumbers(request.getParameter("couponCode"));
            Cart tempCart = new Cart((Cart) request.getSession().getAttribute("tempCart"));
            tempCart.updateQuantityTemp();
            if (tempCart.total * coupon.discount > coupon.maxDiscount) {
                coupon.discount = coupon.maxDiscount / tempCart.total;
            }

            if (tempCart.total < coupon.minPurchase) {
                request.setAttribute("couponStatus", "Minimum purchase (" + coupon.minPurchase + "VNĐ) not met");
            } else {
                adjustPrice(tempCart, coupon.discount);
            }

            request.getSession().setAttribute("DiscountedCart", tempCart);
            request.setAttribute("couponStatus",
                    "Coupon applied: " + String.format("%.2f", coupon.discount * 100) + "% discount");
            request.setAttribute("appliedCoupon", coupon.code);
        }
    }

    protected void adjustPrice(Cart tempCart, double discountPercentage) {
        for (ProductCount product : tempCart.quantities) {
            product.pricePer *= 1 - discountPercentage;
        }
        tempCart.updateTotal();
    }

    protected void checkout(HttpServletRequest request, HttpServletResponse response, User currentUser,
            Boolean hideCart)
            throws ServletException, IOException {
        Cart tempCart = null;

        if (hideCart) {
            tempCart = new Cart(currentUser.cart);
            request.getSession().setAttribute("tempCart", tempCart);
            currentUser.cart.getValidate();
            currentUser.cart.clearCart();
        } else {
            tempCart = (Cart) request.getSession().getAttribute("DiscountedCart");
        }

        request.setAttribute("cartPriceDouble", new DecimalFormat("#").format(tempCart.total));
        request.setAttribute("cartPrice", String.format(Locale.US, "%,.2f", tempCart.total));
        request.setAttribute("ProductCount", (ArrayList<ProductCount>) tempCart.quantities);
        request.setAttribute("validation", tempCart.getValidate());
        request.setAttribute("user", currentUser);

        request.setAttribute("socketMatch", Validation.socketMatch());
        request.setAttribute("graphicsOutput", Validation.graphicsOutput());
        request.setAttribute("ramType", Validation.ramType());
        request.setAttribute("ramMatching", Validation.ramMatching());
        request.setAttribute("ramSpeed", Validation.ramSpeed());
        request.setAttribute("ramCapacity", Validation.ramCapacity());
        request.setAttribute("powerBudget", Validation.powerBudget());

        request.getRequestDispatcher("/cart/checkout.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}