package packages;

public class Coupon {

    private int id;
    private String description;
    private double discount;
    private String code;
    private String expiry;
    private double minPurchase;
    private double maxDiscount;
    private int uses;

    public Coupon(int id, String description, double discount, String code, String expiry, double minPurchase, double maxDiscount, int uses) {
        this.id = id;
        this.description = description;
        this.discount = discount;
        this.code = code;
        this.expiry = expiry;
        this.minPurchase = minPurchase;
        this.maxDiscount = maxDiscount;
        this.uses = uses;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getExpiry() {
        return expiry;
    }

    public void setExpiry(String expiry) {
        this.expiry = expiry;
    }

    public double getMinPurchase() {
        return minPurchase;
    }

    public void setMinPurchase(double minPurchase) {
        this.minPurchase = minPurchase;
    }

    public double getMaxDiscount() {
        return maxDiscount;
    }

    public void setMaxDiscount(double maxDiscount) {
        this.maxDiscount = maxDiscount;
    }

    public int getUses() {
        return uses;
    }

    public void setUses(int uses) {
        this.uses = uses;
    }

    @Override
    public String toString() {
        return "Coupon{" + "id=" + id + ", description=" + description + ", discount=" + discount + ", code=" + code + ", expiry=" + expiry + ", minPurchase=" + minPurchase + ", maxDiscount=" + maxDiscount + ", uses=" + uses + '}';
    }

}
