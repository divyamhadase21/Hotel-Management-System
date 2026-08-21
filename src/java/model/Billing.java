package model;

public class Billing {
    private int billId;
    private String guestName;
    private String roomNumber;
    private String checkinDate;
    private String checkoutDate;
    private int numDays;
    private double roomCharge;
    private double foodCharge;
    private double banquetCharge;
    private double subtotal;
    private double gstPercent;
    private double gstAmount;
    private double totalAmount;
    private String paymentStatus;

    // Getters and Setters
    public int getBillId() { return billId; }
    public void setBillId(int billId) { this.billId = billId; }

    public String getGuestName() { return guestName; }
    public void setGuestName(String guestName) { this.guestName = guestName; }

    public String getRoomNumber() { return roomNumber; }
    public void setRoomNumber(String roomNumber) { this.roomNumber = roomNumber; }

    public String getCheckinDate() { return checkinDate; }
    public void setCheckinDate(String checkinDate) { this.checkinDate = checkinDate; }

    public String getCheckoutDate() { return checkoutDate; }
    public void setCheckoutDate(String checkoutDate) { this.checkoutDate = checkoutDate; }

    public int getNumDays() { return numDays; }
    public void setNumDays(int numDays) { this.numDays = numDays; }

    public double getRoomCharge() { return roomCharge; }
    public void setRoomCharge(double roomCharge) { this.roomCharge = roomCharge; }

    public double getFoodCharge() { return foodCharge; }
    public void setFoodCharge(double foodCharge) { this.foodCharge = foodCharge; }

    public double getBanquetCharge() { return banquetCharge; }
    public void setBanquetCharge(double banquetCharge) { this.banquetCharge = banquetCharge; }

    public double getSubtotal() { return subtotal; }
    public void setSubtotal(double subtotal) { this.subtotal = subtotal; }

    public double getGstPercent() { return gstPercent; }
    public void setGstPercent(double gstPercent) { this.gstPercent = gstPercent; }

    public double getGstAmount() { return gstAmount; }
    public void setGstAmount(double gstAmount) { this.gstAmount = gstAmount; }

    public double getTotalAmount() { return totalAmount; }
    public void setTotalAmount(double totalAmount) { this.totalAmount = totalAmount; }

    public String getPaymentStatus() { return paymentStatus; }
    public void setPaymentStatus(String paymentStatus) { this.paymentStatus = paymentStatus; }
}