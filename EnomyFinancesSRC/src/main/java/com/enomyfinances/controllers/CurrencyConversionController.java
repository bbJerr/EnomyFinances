package com.enomyfinances.controllers;

import java.text.DecimalFormat;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CurrencyConversionController {	 	
	 	
 	@GetMapping("/currency")
	public String viewCurrencyPage() {
		return "currency";
	}	 		 		 	

 	@PostMapping("/converter")
    public String convertCurrency(@RequestParam("amount") double amount,
                                  @RequestParam("fromCurrency") String fromCurrency,
                                  @RequestParam("toCurrency") String toCurrency,
                                  Model model, HttpServletRequest request) {
        
 		
 		// Check if the amount is within the transaction range
 	    if (amount < 300 || amount > 5000) {
 	        model.addAttribute("conversionError", "Initial currency amount must be between 300 and 5000.");
 	        return "currency";
 	    }
 		
 		// Perform currency conversion logic here
        double convertedAmount = performConversion(amount, fromCurrency, toCurrency);
        double serviceCharges = calculateServiceCharges(amount);

        double finalAmount = performFinalAmount(convertedAmount, serviceCharges);
        
        DecimalFormat decimalFormat = new DecimalFormat("#.##");
        String formattedConvertedAmount = decimalFormat.format(convertedAmount);
        String formattedFinalAmount = decimalFormat.format(finalAmount);
        
        model.addAttribute("amount", amount);
        model.addAttribute("fromCurrency", fromCurrency);
        model.addAttribute("toCurrency", toCurrency);
        model.addAttribute("convertedAmount", formattedConvertedAmount);
        model.addAttribute("serviceCharges", serviceCharges);
        model.addAttribute("finalAmount", formattedFinalAmount);
        request.setAttribute("conversionSuccess", true);

        System.out.println("Currency Conversion performed successfully.");

        return "currency";
    }
 	

    private double performFinalAmount(double convertedAmount, double serviceCharges) {
        return convertedAmount - serviceCharges;
    }

    private double calculateServiceCharges(double amount) {
        double serviceCharges = 0.0;

        if (amount > 0 && amount <= 500) {
            serviceCharges += amount * 0.35;
        } else if (amount > 500 && amount <= 1500) {
            serviceCharges += amount * 0.27;
        } else if (amount > 1500 && amount <= 2500) {
            serviceCharges += amount * 0.20;
        } else {
            serviceCharges += amount * 1.50;
        }

        return serviceCharges;
    }
 	
 	private double performConversion(double amount, String fromCurrency, String toCurrency) {
 	    double convertedAmount;

 	    // Feb 15 Conversion rates
 	    double usdToEurRate = 0.93;
 	    double eurToUsdRate = 1.08;
 	    double gbpToUsdRate = 1.37; 
 	    double brlToUsdRate = 0.19; 
 	    double jpyToUsdRate = 0.0091; 
 	    double tryToUsdRate = 0.12; 

 	    if (("USD".equals(fromCurrency)) && ("EUR".equals(toCurrency))) {
 	        convertedAmount = amount * usdToEurRate;
 	    } else if (("USD".equals(fromCurrency)) && ("GBP".equals(toCurrency))) {
 	        convertedAmount = amount * gbpToUsdRate;
 	    } else if (("USD".equals(fromCurrency)) && ("BRL".equals(toCurrency))) {
 	        convertedAmount = amount * brlToUsdRate;
 	    } else if (("USD".equals(fromCurrency)) && ("JPY".equals(toCurrency))) {
 	        convertedAmount = amount * jpyToUsdRate;
 	    } else if (("USD".equals(fromCurrency)) && ("TRY".equals(toCurrency))) {
 	        convertedAmount = amount * tryToUsdRate;
 	    } else if (("EUR".equals(fromCurrency)) && ("USD".equals(toCurrency))) {
 	        convertedAmount = amount * eurToUsdRate;
 	    } else if (("EUR".equals(fromCurrency)) && ("GBP".equals(toCurrency))) {
 	        convertedAmount = amount * (eurToUsdRate / gbpToUsdRate);
 	    } else if (("EUR".equals(fromCurrency)) && ("BRL".equals(toCurrency))) {
 	        convertedAmount = amount * (eurToUsdRate / brlToUsdRate);
 	    } else if (("EUR".equals(fromCurrency)) && ("JPY".equals(toCurrency))) {
 	        convertedAmount = amount * (eurToUsdRate / jpyToUsdRate);
 	    } else if (("EUR".equals(fromCurrency)) && ("TRY".equals(toCurrency))) {
 	        convertedAmount = amount * (eurToUsdRate / tryToUsdRate);
 	    } else if (("GBP".equals(fromCurrency)) && ("USD".equals(toCurrency))) {
 	        convertedAmount = amount * (1 / gbpToUsdRate);
 	    } else if (("GBP".equals(fromCurrency)) && ("EUR".equals(toCurrency))) {
 	        convertedAmount = amount * (gbpToUsdRate / eurToUsdRate);
 	    } else if (("GBP".equals(fromCurrency)) && ("BRL".equals(toCurrency))) {
 	        convertedAmount = amount * (gbpToUsdRate / brlToUsdRate);
 	    } else if (("GBP".equals(fromCurrency)) && ("JPY".equals(toCurrency))) {
 	        convertedAmount = amount * (gbpToUsdRate / jpyToUsdRate);
 	    } else if (("GBP".equals(fromCurrency)) && ("TRY".equals(toCurrency))) {
 	        convertedAmount = amount * (gbpToUsdRate / tryToUsdRate);
 	    } else if (("BRL".equals(fromCurrency)) && ("USD".equals(toCurrency))) {
 	        convertedAmount = amount * (1 / brlToUsdRate);
 	    } else if (("BRL".equals(fromCurrency)) && ("GBP".equals(toCurrency))) {
 	        convertedAmount = amount * (brlToUsdRate / gbpToUsdRate);
 	    } else if (("BRL".equals(fromCurrency)) && ("EUR".equals(toCurrency))) {
 	        convertedAmount = amount * (brlToUsdRate / eurToUsdRate);
 	    } else if (("BRL".equals(fromCurrency)) && ("JPY".equals(toCurrency))) {
 	        convertedAmount = amount * (brlToUsdRate / jpyToUsdRate);
 	    } else if (("BRL".equals(fromCurrency)) && ("TRY".equals(toCurrency))) {
 	        convertedAmount = amount * (brlToUsdRate / tryToUsdRate);
 	    } else if (("JPY".equals(fromCurrency)) && ("USD".equals(toCurrency))) {
 	        convertedAmount = amount * (1 / jpyToUsdRate);
 	    } else if (("JPY".equals(fromCurrency)) && ("GBP".equals(toCurrency))) {
 	        convertedAmount = amount * (jpyToUsdRate / gbpToUsdRate);
 	    } else if (("JPY".equals(fromCurrency)) && ("EUR".equals(toCurrency))) {
 	        convertedAmount = amount * (jpyToUsdRate / eurToUsdRate);
 	    } else if (("JPY".equals(fromCurrency)) && ("BRL".equals(toCurrency))) {
 	        convertedAmount = amount * (jpyToUsdRate / brlToUsdRate);
 	    } else if (("JPY".equals(fromCurrency)) && ("TRY".equals(toCurrency))) {
 	        convertedAmount = amount * (jpyToUsdRate / tryToUsdRate);
 	    } else if (("TRY".equals(fromCurrency)) && ("USD".equals(toCurrency))) {
 	        convertedAmount = amount * (1 / tryToUsdRate);
 	    } else if (("TRY".equals(fromCurrency)) && ("GBP".equals(toCurrency))) {
 	        convertedAmount = amount * (tryToUsdRate / gbpToUsdRate);
 	    } else if (("TRY".equals(fromCurrency)) && ("EUR".equals(toCurrency))) {
 	        convertedAmount = amount * (tryToUsdRate / eurToUsdRate);
 	    } else if (("TRY".equals(fromCurrency)) && ("BRL".equals(toCurrency))) {
 	        convertedAmount = amount * (tryToUsdRate / brlToUsdRate);
 	    } else if (("TRY".equals(fromCurrency)) && ("JPY".equals(toCurrency))) {
 	        convertedAmount = amount * (tryToUsdRate / jpyToUsdRate);
 	    } else {
 	        convertedAmount = -1; // Invalid currency pair
 	    }

 	    return convertedAmount;
    }
	 	
}