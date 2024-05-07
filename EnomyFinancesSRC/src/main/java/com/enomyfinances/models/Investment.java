package com.enomyfinances.models;
import javax.persistence.*;

;

@Entity
@Table (name="investment")
public class Investment {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "investment_id")
    private Long investmentId;
    
    @Column(name = "user_id")
    private Long userId;

    @Column(name = "investment_type", nullable = false)
    private String investmentType;

    @Column(name = "initial_lump_sum", nullable = false)
    private int initialLumpSum;

    @Column(name = "monthly_investment", nullable = false)
    private int monthlyInvestment;

    @Column(name = "one_year_return")
    private double oneYearReturn;
    
    @Column(name = "five_year_return")
    private double fiveYearReturn;
    
    @Column(name = "ten_year_return")
    private double tenYearReturn;
           
    @Column(name = "one_year_profit")
    private double oneYearTotalProfit;
    
    @Column(name = "five_year_profit")
    private double fiveYearTotalProfit;
    
    @Column(name = "ten_year_profit")
    private double tenYearTotalProfit;
    
    @Column(name = "one_year_fees")
    private double oneYearTotalFees;
    
    @Column(name = "five_year_fees")
    private double fiveYearTotalFees;
    
    @Column(name = "ten_year_fees")
    private double tenYearTotalFees;
    
    @Column(name = "one_year_taxes")
    private double oneYearTotalTaxes;
    
    @Column(name = "five_year_taxes")
    private double fiveYearTotalTaxes;
    
    @Column(name = "ten_year_taxes")
    private double tenYearTotalTaxes;
    
   
    public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public Long getInvestmentId() {
        return investmentId;
    }

    public void setInvestmentId(Long investmentId) {
        this.investmentId = investmentId;
    }

    public String getInvestmentType() {
        return investmentType;
    }

    public void setInvestmentType(String investmentType) {
        this.investmentType = investmentType;
    }

    public int getInitialLumpSum() {
        return initialLumpSum;
    }

    public void setInitialLumpSum(int initialLumpSum) {
        this.initialLumpSum = initialLumpSum;
    }

    public int getMonthlyInvestment() {
        return monthlyInvestment;
    }

    public void setMonthlyInvestment(int monthlyInvestment) {
        this.monthlyInvestment = monthlyInvestment;
    }

	public double getOneYearReturn() {
	    return oneYearReturn;
	}

    public void setOneYearReturn(double oneYearReturn) {
        this.oneYearReturn = oneYearReturn;
    }

	public double getFiveYearReturn() {
		return fiveYearReturn;
	}

	public void setFiveYearReturn(double fiveYearReturn) {
		this.fiveYearReturn = fiveYearReturn;
	}

	public double getTenYearReturn() {
		return tenYearReturn;
	}

	public void setTenYearReturn(double tenYearReturn) {
		this.tenYearReturn = tenYearReturn;
	}

	public double getOneYearTotalProfit() {
		return oneYearTotalProfit;
	}

	public void setOneYearTotalProfit(double oneYearTotalProfit) {
		this.oneYearTotalProfit = oneYearTotalProfit;
	}

	public double getFiveYearTotalProfit() {
		return fiveYearTotalProfit;
	}

	public void setFiveYearTotalProfit(double fiveYearTotalProfit) {
		this.fiveYearTotalProfit = fiveYearTotalProfit;
	}

	public double getTenYearTotalProfit() {
		return tenYearTotalProfit;
	}

	public void setTenYearTotalProfit(double tenYearTotalProfit) {
		this.tenYearTotalProfit = tenYearTotalProfit;
	}

	public double getOneYearTotalFees() {
		return oneYearTotalFees;
	}

	public void setOneYearTotalFees(double oneYearTotalFees) {
		this.oneYearTotalFees = oneYearTotalFees;
	}

	public double getFiveYearTotalFees() {
		return fiveYearTotalFees;
	}

	public void setFiveYearTotalFees(double fiveYearTotalFees) {
		this.fiveYearTotalFees = fiveYearTotalFees;
	}

	public double getTenYearTotalFees() {
		return tenYearTotalFees;
	}

	public void setTenYearTotalFees(double tenYearTotalFees) {
		this.tenYearTotalFees = tenYearTotalFees;
	}

	public double getOneYearTotalTaxes() {
		return oneYearTotalTaxes;
	}

	public void setOneYearTotalTaxes(double oneYearTotalTaxes) {
		this.oneYearTotalTaxes = oneYearTotalTaxes;
	}

	public double getFiveYearTotalTaxes() {
		return fiveYearTotalTaxes;
	}

	public void setFiveYearTotalTaxes(double fiveYearTotalTaxes) {
		this.fiveYearTotalTaxes = fiveYearTotalTaxes;
	}

	public double getTenYearTotalTaxes() {
		return tenYearTotalTaxes;
	}

	public void setTenYearTotalTaxes(double tenYearTotalTaxes) {
		this.tenYearTotalTaxes = tenYearTotalTaxes;
	}
	
	public void setUser(User user) {
		// TODO Auto-generated method stub
		
	}
}