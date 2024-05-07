package com.enomyfinances.controllers;

import java.text.DecimalFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.enomyfinances.models.User;
import com.enomyfinances.models.Investment;
import com.enomyfinances.repositories.InvestmentRepository;
import com.enomyfinances.repositories.UserRepository;

@Controller
public class InvestmentController {

    @Autowired
    private InvestmentRepository investmentRepository;
   
    @Autowired
    private UserRepository userRepository;
            
    @GetMapping("/investment")
    public String viewInvestmentPage(Model model) {
        model.addAttribute("investment", new Investment());
        return "investment";
    }
    
    @PostMapping("/calculateInvestment")
    public String investmentResults(@ModelAttribute("investment") Investment userInvestment, Model model, HttpServletRequest request, HttpServletResponse response) {
        
    	chooseInvestmentDetails(userInvestment);
        
        String userEmail = getLoggedInUserEmail(request);
        System.out.println("User Email is: " + userEmail);
        User user = userRepository.findByEmail(userEmail);
        
        userInvestment.setUser(user);
        userInvestment.setUserId(user.getUserId()); // Set the userId
        
        DecimalFormat decimalFormat = new DecimalFormat("#.##");
        String formattedOneYearReturn = decimalFormat.format(userInvestment.getOneYearReturn());
        String formattedFiveYearReturn = decimalFormat.format(userInvestment.getFiveYearReturn());
        String formattedTenYearReturn = decimalFormat.format(userInvestment.getTenYearReturn());
        
        String formattedOneYearProfit = decimalFormat.format(userInvestment.getOneYearTotalProfit());
        String formattedFiveYearProfit = decimalFormat.format(userInvestment.getFiveYearTotalProfit());
        String formattedTenYearProfit = decimalFormat.format(userInvestment.getTenYearTotalProfit());

        String formattedOneYearFees = decimalFormat.format(userInvestment.getOneYearTotalFees());
        String formattedFiveYearFees = decimalFormat.format(userInvestment.getFiveYearTotalFees());
        String formattedTenYearFees = decimalFormat.format(userInvestment.getTenYearTotalFees());
        
        String formattedOneYearTaxes = decimalFormat.format(userInvestment.getOneYearTotalTaxes());
        String formattedFiveYearTaxes = decimalFormat.format(userInvestment.getFiveYearTotalTaxes());
        String formattedTenYearTaxes = decimalFormat.format(userInvestment.getTenYearTotalTaxes());
        
        // Set attributes for displaying in JSP
        model.addAttribute("investmentType", userInvestment.getInvestmentType());
        model.addAttribute("initialLumpSum", userInvestment.getInitialLumpSum());
        model.addAttribute("monthlyInvestment", userInvestment.getMonthlyInvestment());       
        
        model.addAttribute("oneYearReturn", formattedOneYearReturn);
        model.addAttribute("fiveYearReturn", formattedFiveYearReturn);
        model.addAttribute("tenYearReturn", formattedTenYearReturn);

        model.addAttribute("oneYearProfit", formattedOneYearProfit);
        model.addAttribute("fiveYearProfit", formattedFiveYearProfit);
        model.addAttribute("tenYearProfit", formattedTenYearProfit);
        
        model.addAttribute("oneYearFees", formattedOneYearFees);
        model.addAttribute("fiveYearFees", formattedFiveYearFees);
        model.addAttribute("tenYearFees", formattedTenYearFees);
        
        model.addAttribute("oneYearTaxes", formattedOneYearTaxes);
        model.addAttribute("fiveYearTaxes", formattedFiveYearTaxes);
        model.addAttribute("tenYearTaxes", formattedTenYearTaxes);
        
        // Validate minimum monthly investment and initial lump sum
        if (!isValidInvestment(userInvestment)) {            
            model.addAttribute("investmentType", userInvestment.getInvestmentType());
            model.addAttribute("investmentError", "Invalid investment. Please check minimum requirements.");
            return "investment";
        }
        
        investmentRepository.save(userInvestment);
        request.setAttribute("investmentSuccess", true);
        
        System.out.println("Investment performed successfully.");

        return "investment";
    }
    
    private boolean isValidInvestment(Investment userInvestment) {
        switch (userInvestment.getInvestmentType()) {
            case "Basic Savings Plan":
                return userInvestment.getMonthlyInvestment() >= 50;
            case "Savings Plan Plus":
                return userInvestment.getMonthlyInvestment() >= 50 && userInvestment.getInitialLumpSum() >= 300;
            case "Managed Stock Investments":
                return userInvestment.getMonthlyInvestment() >= 150 && userInvestment.getInitialLumpSum() >= 1000;
            default:
                return false;
        }
    }

    private String getLoggedInUserEmail(HttpServletRequest request) {
        // Retrieve user details from the security context
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        if (authentication != null && authentication.isAuthenticated() && authentication.getPrincipal() instanceof UserDetails) {
            // Get the email from UserDetails
            return ((UserDetails) authentication.getPrincipal()).getUsername();
        }

        // Return null if user details are not available
        return null;
    }

    private void chooseInvestmentDetails(Investment userInvestment) {
        switch (userInvestment.getInvestmentType()) {
            case "Basic Savings Plan": 
                userInvestment.setInvestmentType("Basic Savings Plan");
                calculateBasicSavingsPlan(userInvestment);
                break;
            case "Savings Plan Plus":
                userInvestment.setInvestmentType("Savings Plan Plus");
                calculateSavingsPlanPlus(userInvestment);
                break;
            case "Managed Stock Investments": 
                userInvestment.setInvestmentType("Managed Stock Investments");
                calculateManagedStockInvestments(userInvestment);
                break;
        }
    }

    private void calculateBasicSavingsPlan(Investment userInvestment) {
        
        userInvestment.setOneYearReturn(calculateReturn(userInvestment.getInitialLumpSum(), 0.012, userInvestment.getMonthlyInvestment(), 12));
        userInvestment.setFiveYearReturn(calculateReturn(userInvestment.getInitialLumpSum(), 0.024, userInvestment.getMonthlyInvestment(), 12 * 5));
        userInvestment.setTenYearReturn(calculateReturn(userInvestment.getInitialLumpSum(), 0.024, userInvestment.getMonthlyInvestment(), 12 * 10));
        
        userInvestment.setOneYearTotalProfit(userInvestment.getOneYearReturn());
        userInvestment.setFiveYearTotalProfit(userInvestment.getFiveYearReturn());
        userInvestment.setTenYearTotalProfit(userInvestment.getTenYearReturn());

        userInvestment.setOneYearTotalFees(calculateFee(userInvestment.getOneYearReturn(), 0.0025));
        userInvestment.setFiveYearTotalFees(calculateFee(userInvestment.getFiveYearReturn(), 0.0025));
        userInvestment.setTenYearTotalFees(calculateFee(userInvestment.getTenYearReturn(), 0.0025));

        userInvestment.setOneYearTotalTaxes(0);
        userInvestment.setFiveYearTotalTaxes(0);
        userInvestment.setTenYearTotalTaxes(0);
    }

    private void calculateSavingsPlanPlus(Investment userInvestment) {
        
        userInvestment.setOneYearReturn(calculateReturn(userInvestment.getInitialLumpSum(), 0.03, userInvestment.getMonthlyInvestment(), 12));
        userInvestment.setFiveYearReturn(calculateReturn(userInvestment.getInitialLumpSum(), 0.055, userInvestment.getMonthlyInvestment(), 12 * 5));
        userInvestment.setTenYearReturn(calculateReturn(userInvestment.getInitialLumpSum(), 0.055, userInvestment.getMonthlyInvestment(), 12 * 10));

        // assuming 10% tax on profits above £12,000
        userInvestment.setOneYearTotalProfit(userInvestment.getOneYearReturn());
        userInvestment.setFiveYearTotalProfit(userInvestment.getFiveYearReturn());
        userInvestment.setTenYearTotalProfit(userInvestment.getTenYearReturn());

        userInvestment.setOneYearTotalFees(calculateFee(userInvestment.getOneYearReturn(), 0.003));
        userInvestment.setFiveYearTotalFees(calculateFee(userInvestment.getFiveYearReturn(), 0.003));
        userInvestment.setTenYearTotalFees(calculateFee(userInvestment.getTenYearReturn(), 0.003));

        userInvestment.setOneYearTotalTaxes(calculateTax(userInvestment.getOneYearReturn(), 0.1, 12000));
        userInvestment.setFiveYearTotalTaxes(calculateTax(userInvestment.getFiveYearReturn(), 0.1, 12000));
        userInvestment.setTenYearTotalTaxes(calculateTax(userInvestment.getTenYearReturn(), 0.1, 12000));
    }

    private void calculateManagedStockInvestments(Investment userInvestment) {
        
        userInvestment.setOneYearReturn(calculateReturn(userInvestment.getInitialLumpSum(), 0.04, userInvestment.getMonthlyInvestment(), 12));
        userInvestment.setFiveYearReturn(calculateReturn(userInvestment.getInitialLumpSum(), 0.23, userInvestment.getMonthlyInvestment(), 12 * 5));
        userInvestment.setTenYearReturn(calculateReturn(userInvestment.getInitialLumpSum(), 0.23, userInvestment.getMonthlyInvestment(), 12 * 10));

        // assuming 10% tax on profits above £12,000 and 20% tax on profits above £40,000
        userInvestment.setOneYearTotalProfit(userInvestment.getOneYearReturn());
        userInvestment.setFiveYearTotalProfit(userInvestment.getFiveYearReturn());
        userInvestment.setTenYearTotalProfit(userInvestment.getTenYearReturn());

        userInvestment.setOneYearTotalFees(calculateFee(userInvestment.getOneYearReturn(), 0.013));
        userInvestment.setFiveYearTotalFees(calculateFee(userInvestment.getFiveYearReturn(), 0.013));
        userInvestment.setTenYearTotalFees(calculateFee(userInvestment.getTenYearReturn(), 0.013));

        userInvestment.setOneYearTotalTaxes(calculateTax(userInvestment.getOneYearReturn(), 0.1, 12000));
        userInvestment.setFiveYearTotalTaxes(calculateTax(userInvestment.getFiveYearReturn(), 0.1, 12000));
        userInvestment.setTenYearTotalTaxes(calculateTax(userInvestment.getTenYearReturn(), 0.2, 40000));
    }

    private double calculateReturn(double initialLumpSum, double annualRate, double monthlyInvestment, int months) {
        double totalInvestment = initialLumpSum + (monthlyInvestment * months);
        return totalInvestment * Math.pow(1 + annualRate / 12, months / 12.0) - totalInvestment;
    }

    private double calculateFee(double totalReturn, double feeRate) {
        return totalReturn * feeRate;
    }

    private double calculateTax(double totalProfit, double taxRate, double taxableThreshold) {
        double taxableProfit = Math.max(0, totalProfit - taxableThreshold);
        return taxableProfit * taxRate;
    }
    
}