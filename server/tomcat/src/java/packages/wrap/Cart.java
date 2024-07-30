package packages.wrap;

import java.util.ArrayList;
import java.util.HashMap;
import database.Database;
import packages.*;

public class Cart {
    public String userID;
    public double total;
    public ArrayList<Product> products = new ArrayList<Product>();
    public ArrayList<ProductCount> quantities = new ArrayList<ProductCount>();
    public boolean buyable = true;

    public Cart(Cart cart) {
        this.userID = cart.userID;
        this.total = cart.total;
        this.products = new ArrayList<Product>(cart.products);
        this.quantities = new ArrayList<ProductCount>(cart.quantities);
        this.total = cart.total;
    }

    public String getValidate() {
        return Validation.validate(this);
    }

    public void updateTotal() {
        total = 0;
        for (ProductCount productCount : quantities) {
            total += productCount.pricePer * productCount.count;
        }
    }

    public void updateQuantity() {
        buyable = true;

        HashMap<Integer, ProductCount> productCountMap = new HashMap<>();
        for (Product product : products) {
            ProductCount productCount = productCountMap.get(product.id);
            if (productCount == null) {
                productCount = new ProductCount(product.id, 0, product.name, product.sellingPrice);
                productCountMap.put(product.id, productCount);
            }
            productCount.count += 1;

            if (!productCount.error.equals("")) {
                buyable = false;
            }
        }
        quantities.clear();
        quantities.addAll(productCountMap.values());
        updateTotal();
        updateCart();
    }

    public void updateQuantityTemp() {
        buyable = true;

        HashMap<Integer, ProductCount> productCountMap = new HashMap<>();
        for (Product product : products) {
            ProductCount productCount = productCountMap.get(product.id);
            if (productCount == null) {
                productCount = new ProductCount(product.id, 0, product.name, product.sellingPrice);
                productCountMap.put(product.id, productCount);
            }
            productCount.count += 1;

            if (!productCount.error.equals("")) {
                buyable = false;
            }
        }

        total = 0;
        for (ProductCount productCount : productCountMap.values()) {
            total += productCount.pricePer * productCount.count;
        }
        quantities.clear();
        quantities.addAll(productCountMap.values());
    }

    public void clearCart() {
        products.clear();
        quantities.clear();
        total = 0;
        updateCart();
    }

    public boolean buyable() {
        for (ProductCount productCount : quantities) {
            productCount.check();
            if (!productCount.error.equals("")) {
                return false;
            }
        }
        return true;
    }

    public void updateCart() {
        Database.updateCart(Integer.parseInt(userID), products);
    }

    public void remove(int id, boolean removeOne) {
        for (int i = 0; i < products.size(); i++) {
            if (products.get(i).id == id) {
                products.remove(i);
                i--;
                if (removeOne) {
                    break;
                }
            }
        }
        updateQuantity();
    }

    public void placeOrder() {
        Database.placeOrder(Integer.parseInt(userID));
        clearCart();
    }

    public void addOne(int id) {
        for (Product product : products) {
            if (product.id == id) {
                products.add(product);
                break;
            }
        }
        updateQuantity();
    }

    public Cart(String userID) {
        this.userID = userID;
        products = Database.getCart(Integer.parseInt(userID));
        updateQuantity();
    }

    public void addProduct(String type, int id) {
        Product newProduct = null;

        switch (type) {
            case "cpu":
                newProduct = new CPU(id);
                break;
            case "gpu":
                newProduct = new GPU(id);
                break;
            case "ram":
                newProduct = new RAM(id);
                break;
            case "psu":
                newProduct = new PSU(id);
                break;
            case "ssd":
                newProduct = new SSD(id);
                break;
            case "motherboard":
                newProduct = new Motherboard(id);
                break;
            case "case":
                newProduct = new Case(id);
                break;
        }
        products.add(newProduct);
        updateQuantity();
    }

    @Override
    public String toString() {
        int maxId = quantities.stream().mapToInt(pc -> pc.id).max().orElse(0);
        boolean[] printed = new boolean[maxId + 1];
        StringBuilder sb = new StringBuilder();

        for (ProductCount productCount : quantities) {
            if (!printed[productCount.id]) {
                printed[productCount.id] = true;
                for (Product product : products) {
                    if (product.id == productCount.id) {
                        sb.append(productCount.count).append(" x ").append(product.name).append("<br>");
                        break;
                    }
                }
            }
        }

        return sb.toString();
    }
}