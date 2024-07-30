package packages.wrap;

public class Coupon {
    public double discount;
    public double minPurchase;
    public double maxDiscount;
    public String code;

    public Coupon(double minPurchase, double maxDiscount, double discount, String code) {
        this.discount = discount / 100;
        this.minPurchase = minPurchase;
        this.maxDiscount = maxDiscount;
        this.code = code;
    }
}